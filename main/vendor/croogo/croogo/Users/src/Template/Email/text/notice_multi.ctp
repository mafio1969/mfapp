<?php

use Croogo\Users\Controller\Component\UserComponent;
use Notices\Event\NoticesManager;
use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\UsersController;

/**
 * @var $notices
 */

foreach ($notices as $notice) {
    $noticeData = json_decode($notice->content_message, true);
    $noticeCreator = isset($notice->creator->name) ? $notice->creator->name : __('Deleted user');
    if ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_ACCEPT) {
        ?>
        <?= $noticeCreator . ' ' . __('accepted') . ' ' . $noticeData['title'] . "\n"; ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT) {
        ?>
        <?= $noticeCreator . ' ' . __('rejected') . ' ' . $noticeData['title']
        . ' : "' . $noticeData['message'] . '"'; ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW) {

    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT) {
        ?>
        <?= $noticeCreator . ' ' . __('resolve as accepted Your') . ' ' . __('Content'); ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_REJECT) {
        ?>
        <?= $noticeCreator . ' ' . __('resolve as rejected Your') . ' ' . __('Content'); ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_CONTENT) {
        ?>
        <?= $noticeCreator . ' ' . __('added new content') ?> : <?= $noticeData['message']['title'] ?>
        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW_REPLY) {

    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT_REPLY) {
        ?>
        <?= $noticeCreator ?> <?= __('added comment to Your reject'); ?>: <?= $noticeData['message']['reason']; ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_ACCEPT) {
        ?>
        <?= $noticeCreator ?> <?= __('reported') ?> <?= $noticeData['message']['content'] ?>: "<?= $noticeData['message']['reason']; ?>"
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_REJECT) {
        ?>
        <?= $noticeCreator ?> <?= __('reported') ?> <?= $noticeData['message']['content']; ?>: "<?= $noticeData['message']['reason']; ?>"
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_USER) {
        $noticeReportedPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($notice->reported->image)) {
            $noticeReportedPhoto = $notice->reported->image;
        }
        $noticeData = json_decode($notice->content_message, true);
        ?>
        <?= $noticeCreator ?> <?= __('reported') ?> <?= $notice->reported->name ?>:
        <?php
        $reportOptions = UsersController::getReportOptions();
        if ((int)$noticeData['message']['content'] !== 3) {
            $message = $reportOptions[$noticeData['message']['content']];
        } else {
            $message = $this->Text->truncate($noticeData['message']['reason'], 30);
        }
        ?>
        "<?= $message ?>"
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_COMMENT) {
        ?>
        <?= $noticeCreator ?> <?= __('reported') ?> <?= $noticeData['message']['content']; ?>: "<?= $noticeData['message']['reason']; ?>"
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESOLVE_I) {
        ?>
        <?= $noticeCreator ?> <?= __('send to resolve') ?> <?= __('Content'); ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESOLVE_IV) {
        ?>
        <?= $noticeCreator ?> <?= __('send to resolve') ?> <?= __('Content'); ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS) {
        $noticeData = json_decode($notice->content_message, true);
        $message = '';
        if (isset($noticeData['message']['added']) && !empty($noticeData['message']['added'])) {
            $message .= __('User has added You permissions') . ' : '
                . '<b>' . $noticeData['message']['added'] . '</b> ';
        }
        if (isset($noticeData['message']['removed']) && !empty($noticeData['message']['removed'])) {
            $message .= __('User has removed Your permissions') . ' : '
                . '<b>' . $noticeData['message']['removed'] . '</b> ';
        }
        ?>
        <?= $message . "\n"; ?>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_COMMENT) {

    }
    echo "\n";
}
