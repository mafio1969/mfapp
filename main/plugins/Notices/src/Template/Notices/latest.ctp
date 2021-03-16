<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Notices\Event\NoticesManager;

$pageTitle = __('Content requiring accept');
?>
<div class="articles-list-page">
    <div class="user-page inbox-page notices-latest">
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
                        <?php
                        echo $this->Form->create(null, [
                            'novalidate' => true,
                            'url' => [
                                'plugin' => 'Notices',
                                'controller' => 'Notices',
                                'action' => 'selected'
                            ],
                        ]);
                        ?>
                        <div class="select-action">
                            <div class="submit">
                                <?= $this->Form->button('<span data-toggle="tooltip" data-placement="top" data-original-title=' . __('Mark as read') . ' class="glyphicon glyphicon-eye-open"></span>',
                                    [
                                        'name' => 'button',
                                        'value' => 'read'
                                    ])
                                ?>
                            </div>
                            <?= $this->Form->input('select-all', [
                                'type' => 'checkbox',
                                'class' => 'select-all',
                                'label' => ['text' => __('Select all')],
                                'templates' => ['checkboxContainer' => '<div class="form-group {{type}}{{required}}">{{content}}</div>']
                            ]);
                            ?>
                        </div>
                        <div class="news-list">
                            <?php
                            foreach ($notices as $notice) {
                                $newMessage = '';
                                if (((int)$notice->user_id !== 0 && (int)$notice->status === 1)
                                    || ((int)$notice->user_id === 0 && !isset($notice->notices_status->status))
                                    || ((int)$notice->user_id === 0 && isset($notice->notices_status->status)
                                        && (int)$notice->notices_status->status === 1)) {
                                    $newMessage = 'new-message';
                                }
                                $noticeData = json_decode($notice->content_message, true);
                                $noticeCreatorPhoto = UserComponent::IMAGE_BLANK_USER;
                                if (!empty($notice->creator->image)) {
                                    $noticeCreatorPhoto = $notice->creator->image;
                                }
                                $cropNoticeCreatorPhoto = $this->Image2->source(DS . UserComponent::IMAGE_PREFIX . DS . $noticeCreatorPhoto)
                                    ->crop(30, 30)
                                    ->imagePath();
                                $userName = isset($notice->creator->name) ? $notice->creator->name : __('Deleted user');
                                $noticeCreator = '<span class="user-img" style="background: url(/uploads/'
                                    . $noticeCreatorPhoto .
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
                                if (!empty($newMessage)) {
                                    $noticeButton = '<div class="actions">' . $noticeViewLink .
                                        $this->Html->link('<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="' . __('Mark as read') . '"
                                            class="glyphicon glyphicon-eye-close"></span>',
                                            [
                                                'plugin' => 'Notices',
                                                'controller' => 'Notices',
                                                'action' => 'mark',
                                                $notice->id
                                            ],
                                            [
                                                'class' => 'btn-outline'
                                            ]
                                        ) . '</div>';
                                } else {
                                    $noticeButton = '<div class="actions">' . $noticeViewLink .
                                        $this->Html->link('<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="' . __('Mark as unread') . '"
                                            class="glyphicon glyphicon-eye-open"></span>',
                                            [
                                                'plugin' => 'Notices',
                                                'controller' => 'Notices',
                                                'action' => 'unmark',
                                                $notice->id
                                            ],
                                            [
                                                'class' => 'btn-outline'
                                            ]
                                        ) . '</div>';
                                }
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
                                    <div class="news-list-item new-content <?= $newMessage ?>">
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
                                        <?= $noticeInput ?>
                                        <?= $displayStatus ?>
                                    </div>
                                    <?php

                                }
                            }
                            ?>
                        </div>
                        <?php
                        echo $this->Form->end();
                        echo $this->element('CryptoTheme.paginator');
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#select-all').on("click", function () {
            if ($(this).prop("checked") == true) {
                $('.check-item').prop('checked', true).addClass('checked');
            } else {
                $('.check-item').prop('checked', false).removeClass('checked');
            }
        })
    });
</script>
