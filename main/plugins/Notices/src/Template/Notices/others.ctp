<?php

use Croogo\Users\Controller\Component\UserComponent;
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
                        <h1><?= __('Others') ?></h1>
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
                                if ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS) {
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
                                    <div class="news-list-item user-block <?= $newMessage ?>">
                                        <p><?= $message ?></p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_COMMENT) {

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
