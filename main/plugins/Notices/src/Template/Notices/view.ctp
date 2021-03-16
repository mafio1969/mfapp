<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Notices\Event\NoticesManager;

/**
 * @var $notice
 * @var $isDeleted
 */

?>
<div class="articles-list-page">
    <div class="inbox-page">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="inbox-all">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Notice') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="page-inner-content users-list">
                        <div class="news-list">
                            <?php
                            $noticeData = json_decode($notice->content_message, true);
                            $noticeCreatorPhoto = UserComponent::IMAGE_BLANK_USER;
                            if (!empty($notice->creator->image)) {
                                $noticeCreatorPhoto = $notice->creator->image;
                            }
                            $userName = isset($notice->creator->name) ? $notice->creator->name : __('Deleted user');
                            $noticeCreator = $this->Html->link('<span class="user-img" style="background: url('
                                . DS . UserComponent::IMAGE_PREFIX . DS . $noticeCreatorPhoto .
                                ') no-repeat center; background-size: cover;"></span>
                                <span class="user-name">' . $userName . '</span>',
                                [
                                    'plugin' => 'Croogo/Users',
                                    'controller' => 'Users',
                                    'action' => 'view',
                                    $notice->creator->id
                                ],
                                [
                                    'class' => 'item-user'
                                ]
                            );
                            $noticeInput = $this->Html->link('<span data-toggle="tooltip"
                                data-placement="top"
                                data-original-title="' . __('Delete') . '"
                                class="glyphicon glyphicon-trash"></span>',
                                [
                                    'plugin' => 'Notices',
                                    'controller' => 'Notices',
                                    'action' => 'remove',
                                    $notice->id
                                ],
                                [
                                    'class' => 'btn-outline'
                                ]
                            );
                            if ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_ACCEPT) {
                                ?>
                                <div class="news-list-item accept-content">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('accepted') ?></span>
                                        <?= $this->Html->link($noticeData['title'] . ' <span class="text-content">'
                                            . $noticeData['message'] . '</span>', [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $notice->content_id
                                        ]);
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT) {
                                ?>
                                <div class="news-list-item decline-content">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('rejected') ?></span>
                                        <?= $this->Html->link($noticeData['title'] . ' : <span class="text-content">"'
                                            . $noticeData['message'] . '"</span>', [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $notice->content_id
                                        ]);
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW) {

                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT) {
                                ?>
                                <div class="news-list-item accept-content">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('resolve as accepted Your') ?></span>
                                        <?= $this->Html->link(__('Content'), [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $notice->content_id
                                        ], [
                                            'class' => 'content-title'
                                        ])
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_REJECT) {
                                ?>
                                <div class="news-list-item accept-content">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('resolve as rejected Your') ?></span>
                                        <?= $this->Html->link(__('Content'), [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $notice->content_id
                                        ], [
                                            'class' => 'content-title'
                                        ])
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_CONTENT) {
                                ?>
                                <div class="news-list-item new-content">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <?php
                                        if (isset($noticeData['message']['reason']) && (int)$noticeData['message']['reason'] === 2) {
                                            echo '<span>' . __('updated content') . ': ' . '</span>';
                                        } else {
                                            echo '<span>' . __('added new content') . ': ' . '</span>';
                                        }
                                        ?>
                                        <?= $this->Html->link($noticeData['message']['title'], [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $notice->content_id
                                        ]);
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW_REPLY) {

                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT_REPLY) {
                                ?>
                                <div class="news-list-item new-comment">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('added comment to Your reject') . ': ' ?></span>
                                        <?= $this->Html->link('<span class="text-content">
                                                    "' . $noticeData['message']['reason'] . '"</span>', [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $noticeData['message']['content_id']
                                        ], [
                                            'class' => 'content-title'
                                        ]); ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_ACCEPT) {
                                ?>
                                <div class="news-list-item report-decline">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('reported') ?></span>
                                        <?= $this->Html->link('<span class="text-content">"'
                                            . $noticeData['message']['content'] . '":
                                            "' . $noticeData['message']['reason'] . '"</span>', [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $noticeData['message']['content_id']
                                        ], [
                                            'class' => 'content-title'
                                        ]); ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_REJECT) {

                                if ($isDeleted) {
                                    $commentAction = '<span class="removeInfo">' . __('Reject removed') . '</span>';
                                } else {
                                    $commentAction = $this->Html->link('<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="' . __('Remove reject') . '"></span>', [
                                        'plugin' => 'Notes',
                                        'controller' => 'Rejects',
                                        'action' => 'remove',
                                        $notice->content_id,
                                        '_ext' => 'json'
                                    ], [
                                        'class' => 'reject-remove link-remove'
                                    ]);
                                }

                                ?>
                                <div class="news-list-item report-decline">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('reported') ?></span>
                                        <?= $this->Html->link('<span class="text-content">"'
                                            . $noticeData['message']['content'] . '":
                                            "' . $noticeData['message']['reason'] . '"</span>', [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $noticeData['message']['content_id']
                                        ], [
                                            'class' => 'content-title'
                                        ]); ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $commentAction ?>
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_USER) {
                                $noticeReportedPhoto = UserComponent::IMAGE_BLANK_USER;
                                if (!empty($notice->reported->image)) {
                                    $noticeReportedPhoto = $notice->reported->image;
                                }
                                $noticeData = json_decode($notice->content_message, true);
                                ?>
                                <div class="news-list-item report-user-message">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('reported') ?></span>
                                        <?= $this->Html->link('<span class="user-img" style="background: url('
                                            . DS . UserComponent::IMAGE_PREFIX . DS . $noticeReportedPhoto .
                                            ') no-repeat center; background-size: cover;"></span>
                                                <span class="user-name">' . $notice->reported->name . '</span>',
                                            [
                                                'plugin' => 'Croogo/Users',
                                                'controller' => 'Users',
                                                'action' => 'view',
                                                $notice->reported->id
                                            ],
                                            [
                                                'class' => 'item-user'
                                            ]
                                        );
                                        ?>:
                                        <?php
                                        $reportOptions = UsersController::getReportOptions();
                                        if ((int)$noticeData['message']['content'] !== 3) {
                                            $message = $reportOptions[$noticeData['message']['content']];
                                        } else {
                                            $message = $noticeData['message']['reason'];
                                        }
                                        ?>
                                        <?= $this->Html->link('<span class="text-content">"' . $message . '"</span>',
                                            [
                                                'plugin' => 'Croogo/Users',
                                                'controller' => 'Users',
                                                'action' => 'view',
                                                $notice->reported->id
                                            ],
                                            [
                                                'class' => 'item-user'
                                            ]
                                        );
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_COMMENT) {
                                ?>
                                <div class="news-list-item report-comment">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('reported') ?></span>
                                        <?= $this->Html->link($noticeData['message']['content']
                                            . ': ' . '<span class="text-content">"'
                                            . $noticeData['message']['reason'] . '"</span>',
                                            [
                                                'plugin' => 'Articles',
                                                'controller' => 'Articles',
                                                'action' => 'view',
                                                $noticeData['message']['content_id']
                                            ], [
                                                'class' => 'content-title'
                                            ])
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <?php
                                    $commentAction = '';
                                    if ($isDeleted) {
                                        $commentAction = '<span class="removeInfo">' . __('Comment removed') . '</span>';
                                    } else {
                                        if ($notice->content_type_id === NoticesManager::TYPE_COMMENT) {
                                            $commentAction = $this->Html->link('<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="' . __('Remove comment') . '"></span>', [
                                                'plugin' => 'Notes',
                                                'controller' => 'Notes',
                                                'action' => 'remove',
                                                $notice->content_id,
                                                '_ext' => 'json'
                                            ], [
                                                'class' => 'comment-remove link-remove'
                                            ]);
                                        } elseif ($notice->content_type_id === NoticesManager::TYPE_SUB_COMMENT) {
                                            $commentAction = $this->Html->link('<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="' . __('Remove comment') . '"></span>', [
                                                'plugin' => 'Notes',
                                                'controller' => 'Notes',
                                                'action' => 'removeComment',
                                                $notice->content_id,
                                                '_ext' => 'json'
                                            ], [
                                                'class' => 'comment-remove link-remove'
                                            ]);
                                        } elseif ($notice->content_type_id === NoticesManager::TYPE_REJECT_COMMENT) {
                                            $commentAction = $this->Html->link('<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="' . __('Remove comment') . '"></span>', [
                                                'plugin' => 'Notes',
                                                'controller' => 'Rejects',
                                                'action' => 'removeComment',
                                                $notice->content_id,
                                                '_ext' => 'json'
                                            ], [
                                                'class' => 'comment-remove link-remove'
                                            ]);
                                        }
                                    }
                                    ?>
                                    <div class="actions">
                                        <?= $commentAction ?>
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESOLVE_I) {
                                ?>
                                <div class="news-list-item report-comment">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('send to resolve') ?></span>
                                        <?= $this->Html->link(__('Content'), [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $notice->content_id
                                        ], ['class' => 'content-title'])
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESOLVE_IV) {
                                ?>
                                <div class="news-list-item report-comment">
                                    <p>
                                        <?= $noticeCreator ?>
                                        <span><?= __('send to resolve') ?></span>
                                        <?= $this->Html->link(__('Content'), [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $notice->content_id
                                        ], ['class' => 'content-title'])
                                        ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS) {
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
                                <div class="news-list-item user-block">
                                    <p><?= $message ?></p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <div class="actions">
                                        <?= $noticeInput ?>
                                    </div>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_COMMENT) {

                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        contentView.linkRemove();
    });
</script>
