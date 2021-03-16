<?php

use Croogo\Users\Controller\Component\UserComponent;
use Notices\Event\NoticesManager;
use Croogo\Users\Controller\UsersController;
use Cake\Routing\Router;

/**
 * @var $notices
 */

?>
<style>
    .btn {
        background-color: #0973ba;
    }
    .btn:hover {
        background-color: #1e417c;
    }
    .link {
        color: #000;
    }
    .blue-link {
        color: #0973ba;
    }
    .blue-link:hover,
    .link:hover {
        color: #1e417c;
    }
</style>

<div style="background-color: #f6f8f1; background-image: url('https://ccfound.com/img/slider-bg.jpg'); margin: 0 auto; padding: 40px 0 40px 0; width:100%; height:100%">
    <table border="0" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td>
                <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-radius: 40px; background-color: #fff; max-width: 700px">
                    <tr>
                        <td align="center" style="padding: 25px 0 25px 0; background-color: #ebebeb; border-top-left-radius: 40px; border-top-right-radius: 40px;">
                            <img src="https://ccfound.com/img/logo.png" title="Logo" alt="CCFOUND Logo" style="max-width: 200px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 40px 30px 10px 30px; font-family: 'Quicksand', Arial, sans-serif; ">
                            <table border="0" cellpadding="0" cellspacing="0" style="max-width: 100%">
                                <tr>
                                    <td align="center" style="font-family: 'Montserrat', Arial, sans-serif; font-size: 30px;">
                                        <?= __('Inbox') ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="padding: 10px 0 10px 0; font-size: 12px;">
<?php
foreach ($notices as $notice) {
    $noticeData = json_decode($notice->content_message, true);
    $noticeCreator = isset($notice->creator->name) ? $notice->creator->name : __('Deleted user');
    if ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_ACCEPT) {
        ?>
        <?= $noticeCreator . ' ' . __('accepted') ?> <a href="<?= Router::url(
            [
                '_ssl' => true,
                '_host' => 'ccfound.com',
                'prefix' => false,
                'plugin' => 'Articles',
                'controller' => 'Articles',
                'action' => 'view',
                $notice->content_id
            ], true); ?>"><?= $noticeData['title']; ?></a>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT) {
        ?>
        <?= $noticeCreator . ' ' . __('rejected'); ?> <a href="<?= Router::url(
            [
                '_ssl' => true,
                '_host' => 'ccfound.com',
                'prefix' => false,
                'plugin' => 'Articles',
                'controller' => 'Articles',
                'action' => 'view',
                $notice->content_id
            ], true); ?>"><?= $noticeData['title']; ?> : "<?= $noticeData['message']; ?>"</a>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW) {
        ?>
        <?= $noticeCreator . ' ' . __('added review'); ?> <a href="<?= Router::url(
            [
                '_ssl' => true,
                '_host' => 'ccfound.com',
                'prefix' => false,
                'plugin' => 'Articles',
                'controller' => 'Articles',
                'action' => 'view',
                $notice->content_id
            ], true); ?>"><?= $noticeData['title']; ?> : "<?= $noticeData['message']; ?>"</a>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
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
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_REPLY) {
        ?>
        <?= $noticeCreator . ' ' . __('has replied to'); ?> <a href="<?= Router::url(
            [
                '_ssl' => true,
                '_host' => 'ccfound.com',
                'prefix' => false,
                'plugin' => 'Articles',
                'controller' => 'Articles',
                'action' => 'view',
                $notice->content_id
            ], true); ?>"><?= $noticeData['title']; ?> : "<?= $noticeData['message']; ?>"</a>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_CONTENT) {
        ?>
        <?= $noticeCreator . ' ' . __('added new content') ?> : <?= $noticeData['message']['title'] ?>
        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW_REPLY) {
        ?>
        <?= $noticeCreator ?> <?= __('added comment to Your review'); ?>: <a href="<?= Router::url(
            [
                '_ssl' => true,
                '_host' => 'ccfound.com',
                'prefix' => false,
                'plugin' => 'Articles',
                'controller' => 'Articles',
                'action' => 'view',
                $noticeData['message']['content_id'],
            ], true); ?>"><?= $noticeData['message']['reason'] ?></a>
        <?= $notice->created->format('d.m.Y, H:i') . "\n"; ?>
        <?php
    } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT_REPLY) {
        ?>
        <?= $noticeCreator ?> <?= __('added comment to Your reject'); ?>: <a href="<?= Router::url(
            [
                '_ssl' => true,
                '_host' => 'ccfound.com',
                'prefix' => false,
                'plugin' => 'Articles',
                'controller' => 'Articles',
                'action' => 'view',
                $noticeData['message']['content_id'],
            ], true); ?>"><?= $noticeData['message']['reason'] ?></a>
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
    } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_COMMENT) {

    }
    echo "\n";
}
?>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="padding: 5px 0 5px 0; background-color: #ebebeb; border-bottom-left-radius: 40px; border-bottom-right-radius: 40px; font-family: 'Quicksand', Arial, sans-serif; font-size: 12px">
                            <p style="margin-bottom: 4px">CCFOUND sp. z o.o. sp.k. ul. Dmowskiego 3/9, 50-203 Wrocław</p>
                            <p style="margin-top: 0">KRS 0000841288 NIP 8982257666 REGON 386055341</p>
                            <p>
                                <a href="https://ccfound.com/terms" class="link" style="text-decoration: none; color: #000;"><?= __('Terms and privacy policy') ?></a>
                            </p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
