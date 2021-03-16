<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Notices\Event\NoticesManager;

$pageTitle = __('Content verified');
?>
<div class="articles-list-page">
    <div class="user-page inbox-page content-verified">
        <?php
        echo $this->element('Notices.new_content_navigation');
        ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="inbox-all">
                <div class="page-title">
                    <div class="container">
                        <h1><?= $pageTitle ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="page-inner-content users-list">
                        <div class="news-list">
                            <?php
                            foreach ($notices as $notice) {
                                $noticeData = json_decode($notice->content_message, true);
                                $noticeCreatorPhoto = UserComponent::IMAGE_BLANK_USER;
                                if (!empty($notice->creator->image)) {
                                    $noticeCreatorPhoto = $notice->creator->image;
                                }
                                $cropNoticeCreatorPhoto = $this->Image2->source(DS . UserComponent::IMAGE_PREFIX . DS . $noticeCreatorPhoto)
                                    ->crop(30, 30)
                                    ->imagePath();
                                $userName = isset($notice->creator->name) ? $notice->creator->name : __('Deleted user');
                                $noticeCreator = '<span class="user-img" style="background: url('
                                    . $cropNoticeCreatorPhoto .
                                    ') no-repeat center; background-size: cover;"></span>
                                                <b>' . $userName . '</b>';
                                $noticeViewLink = $this->Html->link(__('View'),
                                    [
                                        'plugin' => 'Notices',
                                        'controller' => 'Notices',
                                        'action' => 'check',
                                        $notice->id
                                    ],
                                    [
                                        'class' => 'viewItem'
                                    ]
                                );
                                $noticeButton = '<div class="actions">' . $noticeViewLink . '</div>';
                                $noticeInput = $this->Form->input('actives._ids[]', [
                                    'type' => 'checkbox',
                                    'value' => $notice->id,
                                    'class' => 'check-item',
                                    'label' => false,
                                    'id' => 'actives-ids-' . $notice->id,
                                    'templates' => ['checkboxContainer' => '{{content}}']
                                ]);
                                $displayStatus = '';
                                if (isset($notice->articles_new_content->id) && !empty($notice->articles_new_content->id)) {
                                    $displayStatus = $this->Articles->articleStatus(
                                        $notice->articles_new_content->is_visible,
                                        $this->Articles->voteTime($notice->articles_new_content->published),
                                        (bool)$notice->articles_new_content->is_visible_by_role
                                    );
                                }
                                if ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_CONTENT) {
                                    ?>
                                    <div class="news-list-item new-content">
                                        <p>
                                            <?= $noticeCreator ?>
                                            <?php
                                            $contentType = __('news');
                                            if (isset($notice->articles_new_content) && (int)$notice->articles_new_content->type_id === ArticlesController::TYPE_QUESTION) {
                                                $contentType = __('question');
                                            }
                                            if (isset($noticeData['message']['reason']) && (int)$noticeData['message']['reason'] === 2) {
                                                echo __('updated') . ' ' . $contentType . ': ';
                                            } else {
                                                echo __('added') . ' ' . $contentType . ': ';
                                            }
                                            ?>
                                            <?= '"' . $noticeData['message']['title'] . '"' ?>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $displayStatus ?>
                                    </div>
                                    <?php
                                }
                            }
                            ?>
                        </div>
                        <?php
                        echo $this->element('CryptoTheme.paginator');
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
