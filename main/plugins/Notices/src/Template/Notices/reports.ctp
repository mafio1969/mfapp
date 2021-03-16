<?php

use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Notices\Event\NoticesManager;

?>
<div class="articles-list-page">
    <div class="user-page inbox-page">
        <?php
        echo $this->element('Notices.navigation');
        ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="inbox-all">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Reports') ?></h1>
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
                                <?= $this->Form->button('<span class="glyphicon glyphicon-eye-open"></span>', [
                                    'name' => 'button',
                                    'value' => 'read',
                                    'data-original-title' => __('Mark as read')
                                ]) ?>
                                <?= $this->Form->button('<span class="glyphicon glyphicon-trash"></span>', [
                                    'name' => 'button',
                                    'value' => 'remove',
                                    'data-original-title' => __('Delete')
                                ]) ?>
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
                                if (!empty($newMessage)) {
                                    $noticeButton = '<div class="actions">' .
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
                                    $noticeButton = '<div class="actions">' .
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
                                if ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_ACCEPT) {
                                    ?>
                                    <div class="news-list-item report-decline <?= $newMessage ?>">
                                        <p>
                                            <?= $noticeCreator ?>
                                            <span><?= __('reported') ?></span>
                                            <a class="content-title" href="#">
                                                <span class="text-content">"<?= $noticeData['message']['content'] ?>":
                                                    "<?= $noticeData['message']['reason'] ?>"</span>
                                            </a>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_REJECT) {
                                    ?>
                                    <div class="news-list-item report-decline <?= $newMessage ?>">
                                        <p>
                                            <?= $noticeCreator ?>
                                            <span><?= __('reported') ?></span>
                                            <a class="content-title" href="#">
                                                <span class="text-content">"<?= $noticeData['message']['content'] ?>":
                                                    "<?= $noticeData['message']['reason'] ?>"</span>
                                            </a>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_USER) {
                                    $noticeReportedPhoto = UserComponent::IMAGE_BLANK_USER;
                                    if (!empty($notice->reported->image)) {
                                        $noticeReportedPhoto = $notice->reported->image;
                                    }
                                    $noticeData = json_decode($notice->content_message, true);
                                    ?>
                                    <div class="news-list-item report-user-message <?= $newMessage ?>">
                                        <p>
                                            <?php
                                                $noticeReported = isset($notice->reported->name) ? $notice->reported->name : __('Deleted user');
                                                if(isset($noticeData['message']['user_id']))
                                                {
                                                    if($userId == (int)$noticeData['message']['user_id']) {
                                            ?>
                                                    <?= __('Your profile') ?>
                                            <?php
                                                    } else {
                                                        ?>
                                                            <?= __('Profile') ?>
                                                        <?php
                                                    }
                                                } else {
                                            ?>
                                                    <?= __('Profile') ?>
                                            <?php
                                                }
                                            ?>

                                            <?= '<span class="user-img" style="background: url('
                                            . DS . UserComponent::IMAGE_PREFIX . DS . $noticeReportedPhoto .
                                            ') no-repeat center; background-size: cover;"></span>
                                                <b>' . $noticeReported . '</b>' ?>:
                                            <?= __('has been reported.') ?>
                                            <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>">
                                                <?= __('Show justification') ?>
                                            </a>
                                        </p>
                                        <div class="modal fade questionModal" id="noticeModal<?= $notice->id ?>" role="dialog" aria-label="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4><?= __('Reason') ?></h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p><?= $noticeData['message']['reason'] ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_COMMENT) {
                                    ?>
                                    <div class="news-list-item report-comment <?= $newMessage ?>">
                                        <p>
                                            <?= $noticeCreator ?>
                                            <span><?= __('reported') ?></span>
                                            <a class="content-title" href="#"><?= $noticeData['message']['content'] ?>:
                                                <span
                                                    class="text-content">"<?= $noticeData['message']['reason'] ?>"</span>
                                            </a>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESOLVE_I) {
                                    ?>
                                    <div class="news-list-item report-comment <?= $newMessage ?>">
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
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESOLVE_IV) {
                                    ?>
                                    <div class="news-list-item report-comment <?= $newMessage ?>">
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
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
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
