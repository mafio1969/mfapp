<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Notices\Event\NoticesManager;

$action = $this->request->getParam('action');

$pageTitle = __('All notices');
if ($action == 'content') {
    $pageTitle = __('My content');
} elseif ($action == 'news') {
    $pageTitle = __('New content');
} elseif ($action == 'reports') {
    $pageTitle = __('Reports');
} elseif ($action == 'subscriptions') {
    $pageTitle = __('Subscriptions');
} elseif ($action == 'others') {
    $pageTitle = __('Others');
}
?>
<div class="articles-list-page">
    <div class="user-page inbox-page inbox-notifications">
        <?php
        echo $this->element('Notices.navigation');
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
                            $userId = $this->request->getSession()->read('Auth.User.id');
                            foreach ($notices as $notice) {
                                $newMessage = '';
                                if(
                                    ((int)$notice->status === 1 && (int)$notice->user_id !== 0 && (int)$notice->user_id !== -1 && (int)$notice->user_id === (int)$userId)
                                    || (((int)$notice->user_id === 0 || (int)$notice->user_id === -1) && !isset($notice->notices_status->status))
                                    || (((int)$notice->user_id === 0 || (int)$notice->user_id === -1) && isset($notice->notices_status->status) && (int)$notice->notices_status->status === 1)
                                    || (isset($notice->notices_subscription->id) && (!isset($notice->notices_status->status) || (int)$notice->notices_status->status === 1))
                                ) {
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
                                $noticeCreator = '<span class="user-img" style="background: url('
                                    . $cropNoticeCreatorPhoto .
                                    ') no-repeat center; background-size: cover;"></span>
                                                <b>' . $userName . '</b>';
                                $noticeViewLink = $this->Html->link('View',
                                    [
                                        'plugin' => 'Notices',
                                        'controller' => 'Notices',
                                        'action' => 'view',
                                        $notice->id
                                    ],
                                    [
                                        'class' => 'viewItem'
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
                                                'class' => 'btn-outline mark-button'
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
                                if ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_ACCEPT) {
                                    ?>
                                    <div class="news-list-item accept-content <?= $newMessage ?>">
                                        <p>
                                            <?= __('Your content').' "' ?>
                                            <?= $this->Html->link(
                                            $this->Text->truncate($noticeData['title'], 30),
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $notice->content_id
                                                ]
                                            ); ?>
                                            <?= '" '.__('has been accepted by').' '.$noticeData['counter_accepts']; ?>
                                            <?php
                                                if((int)$noticeData['counter_accepts'] == 1) {
                                                    echo ' '.__('user');
                                                }elseif((int)$noticeData['counter_accepts'] > 1) {
                                                    echo '+ '.__('users');
                                                }
                                            ?>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT) {
                                    ?>
                                    <div class="news-list-item decline-content <?= $newMessage ?>">
                                        <p>
                                            <?= __('Your content').' "' ?>
                                            <?= $this->Html->link(
                                            $this->Text->truncate($noticeData['title'], 30),
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $notice->content_id
                                                ]
                                            ); ?>
                                            <?= '" '.__('has been rejected by').' '.$noticeData['counter_rejects']; ?>
                                            <?php
                                                if((int)$noticeData['counter_rejects'] == 1) {
                                                    echo ' '.__('user');
                                                }elseif((int)$noticeData['counter_rejects'] > 1) {
                                                    echo '+ '.__('users');
                                                }
                                            ?>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW) {

                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT) {
                                    ?>
                                    <div class="news-list-item accept-content <?= $newMessage ?>">
                                        <p>
                                        <?= __('Your content') ?>
                                            <?= $this->Html->link(
                                            '"'.$this->Text->truncate(strip_tags($noticeData['title']), 30).'"',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $notice->content_id
                                                ]
                                            ); ?>
                                            <?= __('has been accepted by').' '.$noticeData['counter_accepts']; ?>
                                            <?php
                                                if((int)$noticeData['counter_accepts'] == 1) {
                                                    echo ' '.__('user') == 'user' ? 'user' : 'użytkownika';
                                                }elseif((int)$noticeData['counter_accepts'] > 1) {
                                                    echo ' '.(__('users') == 'users' ? 'users' : 'użytkowników');
                                                }
                                            ?>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_REJECT) {
                                    ?>
                                    <div class="news-list-item decline-content <?= $newMessage ?>">
                                        <p>
                                            <?= __('Your content') ?>
                                            <?= $this->Html->link(
                                            '"'.$this->Text->truncate(strip_tags($noticeData['title']), 30).'"',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $notice->content_id
                                                ]
                                            ); ?>
                                            <?= __('has been rejected by').' '.$noticeData['counter_rejects']; ?>
                                            <?php
                                                $justificationText = '';
                                                if ((int)$noticeData['counter_rejects'] == 1) {
                                                    echo ' '.__('user') == 'user' ? 'user' : 'użytkownika';
                                                    $justificationText = __('Show justification');
                                                }elseif((int)$noticeData['counter_rejects'] > 1) {
                                                    echo ' '.(__('users') == 'users' ? 'users' : 'użytkowników');
                                                    $justificationText = __('Show justifications');
                                                }
                                            ?>

                                            <?= $this->Html->link($justificationText,
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $notice->content_id,
                                                    'reject' => 'true'
                                                ]
                                            ); ?>
                                            <a href="#"><?= __('Raise an objection') == 'Raise an objection' ? 'Raise an objection' : 'Zgłoś zastrzeżenie.' ?></a>
                                        </p>



                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_CONTENT) {
                                    ?>
                                    <div class="news-list-item new-content <?= $newMessage ?>">
                                        <p>
                                            <?= $noticeCreator ?>
                                            <?php
                                            $categories = '';
                                            if(isset($noticeData['message']['categories'])) {
                                                $arrayCategories = json_decode($noticeData['message']['categories']);
                                                if (sizeof((array)$arrayCategories) == 1) {
                                                    $categories .= __('in category') . ' ';
                                                } elseif (sizeof((array)$arrayCategories) > 1) {
                                                    $categories .= __('in categories') . ' ';
                                                }

                                                foreach ($arrayCategories as $category) {
                                                    $categories .= $category;
                                                    if (end($arrayCategories) != $category) {
                                                        $categories .= ', ';
                                                    }
                                                }
                                            }
                                            if (isset($noticeData['message']['reason']) && (int)$noticeData['message']['reason'] === 2) {
                                                if ((int)$noticeData['message']['type_id'] == 2) {
                                                    echo __('has updated question') . ' ';
                                                }elseif((int)$noticeData['message']['type_id'] == 1) {
                                                    echo __('has updated news') . ' ';
                                                }
                                            } else {
                                                if ((int)$noticeData['message']['type_id'] == 2) {
                                                    echo __('has added new question') . ' ';
                                                }elseif((int)$noticeData['message']['type_id'] == 1) {
                                                    echo __('has added news') . ' ';
                                                }
                                            }
                                            ?>
                                            <?= $this->Html->link('"' . $noticeData['message']['title'] . '" ',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $noticeData['message']['content'],
                                                ],
                                                [
                                                    'class' => 'goToLink',
                                                    'data-mark-id' => $notice->id
                                                ]
                                            ); ?>

                                            <?= $categories ?>

                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REVIEW_REPLY) {

                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REJECT_REPLY) {
                                    ?>
                                    <div class="news-list-item new-comment <?= $newMessage ?>">
                                        <p>
                                            <?= $noticeCreator ?>
                                            <?= __('added comment to Your reject') . ': ' ?>
                                            <?= $this->Text->truncate($noticeData['message']['reason'],
                                                30) ?>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_ACCEPT) {
                                    ?>
                                    <div class="news-list-item report-decline <?= $newMessage ?>">
                                        <p>
                                            <?= $noticeCreator ?>
                                            <?= __('reported') ?>
                                            <?= $this->Text->truncate(trim(preg_replace('/\s\s+/',
                                                ' ', strip_tags($noticeData['message']['content']))),
                                                30) . ' : '
                                                . $this->Text->truncate($noticeData['message']['reason'],
                                                30) ?>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ((int)$notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_CONTENT) {

                                    if(isset($noticeData['message']['reason'])) {
                                        $reason = isset($noticeData['message']['reason']) ? $noticeData['message']['reason'] : __('no justification');
                                        ?>
                                        <div class="modal fade questionModal" id="noticeModal<?= $notice->id ?>" role="dialog" aria-label="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4><?= __('Reason') ?></h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p><?= $reason ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <?php
                                    }
                                    ?>
                                    <div class="news-list-item report-decline <?= $newMessage ?>">


                                        <p>
                                            <?php
                                            if ((int)$noticeData['message']['user_id'] === $userId) {
                                                echo ' '.__('Your content').' ';
                                            } else {
                                                echo ' '.__('Content').' ';
                                            }
                                            ?>



                                            <?= $this->Html->link(' "'.$this->Text->truncate($noticeData['message']['content'],
                                                30) . '"',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $noticeData['message']['content_id'],
                                                ],
                                                [
                                                    'class' => 'goToLink',
                                                    'data-mark-id' => $notice->id
                                                ]
                                                ); ?>

                                            <?= __('has been reported.') ?>
                                            <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>"><?= __('Show justification') ?></a>
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
                                            <?= __('reported') ?><?= $this->Text->truncate($noticeData['message']['content'],
                                                30) . '" : "' . $this->Text->truncate($noticeData['message']['reason'],
                                                30) ?>
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
                                            ') no-repeat center; background-size: cover;"></span><b>' . $noticeReported . '</b>' ?>
                                            <?= (__('has been reported.') == 'has been reported.') ? 'has been reported.' : 'został zgłoszony'  ?>
                                            <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>"><?= __('Show justification') ?></a>
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

                                      if(isset($noticeData['message']['reason'])) {
                                        $reason = isset($noticeData['message']['reason']) ? $noticeData['message']['reason'] : __('no justification');
                                        ?>
                                        <div class="modal fade questionModal" id="noticeModal<?= $notice->id ?>" role="dialog" aria-label="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4><?= __('Reason') ?></h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p><?= $reason ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <?php
                                    }
                                    ?>
                                    <div class="news-list-item report-decline <?= $newMessage ?>">


                                        <p>
                                            <?php
                                            if ((int)$noticeData['message']['user_id'] === $userId) {
                                                echo ' '.__('Your comment').' ';
                                            } else {
                                                echo ' '.__('Content').' ';
                                            }
                                            ?>
                                            <?= $this->Html->link(' "'.$this->Text->truncate(strip_tags($noticeData['message']['content']),
                                                30) . '"',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $noticeData['message']['content_id'],
                                                    'open' => $noticeData['message']['parent_id'],
                                                    'comment' => $noticeData['message']['comment_id']
                                                ],
                                                [
                                                    'class' => 'goToLink',
                                                    'data-mark-id' => $notice->id
                                                ]
                                                ); ?>

                                            <?= __('has been reported.') ?>
                                            <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>">
                                                <?= __('Show justification') ?>
                                            </a>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_REPLY) {

                                    if(isset($noticeData['message']['reason'])) {
                                      $reason = isset($noticeData['message']['reason']) ? $noticeData['message']['reason'] : __('no justification');
                                      ?>
                                      <div class="modal fade questionModal" id="noticeModal<?= $notice->id ?>" role="dialog" aria-label="myModalLabel">
                                          <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                  <div class="modal-header">
                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                      </button>
                                                      <h4><?= __('Reason') ?></h4>
                                                  </div>
                                                  <div class="modal-body">
                                                      <p><?= $reason ?></p>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>

                                      <?php
                                  }
                                  ?>
                                  <div class="news-list-item report-decline <?= $newMessage ?>">
                                      <p>
                                          <?php
                                          if ((int)$noticeData['message']['user_id'] === $userId) {
                                                echo ' '.__('Your content').' ';
                                          } else {
                                              echo ' '.__('Content').' ';
                                          }
                                          ?>
                                          <?= $this->Html->link(' "'.$this->Text->truncate(strip_tags($noticeData['message']['content']),
                                              30) . '"',
                                              [
                                                  'plugin' => 'Articles',
                                                  'controller' => 'Articles',
                                                  'action' => 'view',
                                                  $noticeData['message']['content_id'],
                                                  'open' => $noticeData['message']['note_id'],
                                              ],
                                              [
                                                  'class' => 'goToLink',
                                                  'data-mark-id' => $notice->id
                                              ]
                                              ); ?>

                                          <?= __('has been reported.') ?>
                                          <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>">
                                              <?= __('Show justification') ?>
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
                                            <?= __('send to resolve') ?>
                                            <?= __('Content') ?>
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
                                            <?= __('send to resolve') ?>
                                            <?= __('Content') ?>
                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS) {
                                    $noticeData = json_decode($notice->content_message, true);
                                    $message = $substantiation = $dateTo = '';
                                    if(isset($noticeData['message']['blocked_to'])) {
                                        $dateTo = ($noticeData['message']['blocked_to'] > 0) ? $noticeData['message']['blocked_to'] : __('forever');
                                        if($noticeData['message']['blocked_to'] == -1) {
                                            $dateTo = '';
                                        }
                                    }
                                    if(isset($noticeData['message']['substantiation'])) {
                                        $substantiation = isset($noticeData['message']['substantiation']) ? $noticeData['message']['substantiation'] : __('no justification');
                                        ?>
                                        <div class="modal fade questionModal" id="noticeModal<?= $notice->id ?>" role="dialog" aria-label="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4><?= __('Reason') ?></h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p><?= $substantiation ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <?php
                                    }
                                    if (isset($noticeData['message']['added']) && !empty($noticeData['message']['added'])) {
                                        $message .= __('Moderator').' '.$noticeCreator.' ';
                                        $added = str_replace('Zaakceptuj', 'Accept', $noticeData['message']['added']);
                                        $message .= __('added you permissions') . ' : '
                                            . '<b>' . $added . '</b> ';
                                        ?>
                                        <div class="news-list-item user-block <?= $newMessage ?>">
                                            <p ><?= $message ?></p>
                                            <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                            <?= $noticeButton ?>
                                            <?= $noticeInput ?>
                                        </div>
                                        <?php
                                    }
                                    if (isset($noticeData['message']['removed']) && !empty($noticeData['message']['removed'])) {
                                        $message = '';
                                        $removed = str_replace('Zaakceptuj', 'Accept', $noticeData['message']['removed']);
                                        $message .= __('Your account has been punished by deleting') . ' '
                                            . '<b>' . $removed . '</b> ';
                                        ?>
                                        <div class="news-list-item user-block <?= $newMessage ?>">
                                            <?php
                                                $forTranslate = (__('for') == 'z') ? 'z powodu' : 'for';
                                                echo '<p>'.$message;
                                                if ($dateTo != '') {
                                                    echo ' '.__('for the duration of ').' '.$dateTo.' ';
                                                }
                                                if ($substantiation != '') {
                                                    echo $forTranslate.' "'.$this->Text->truncate($substantiation,30).'" '; ?><a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>"><?= __('Show full justifications') ?></a><?php
                                                }
                                                echo '</p>'
                                            ?>
                                            <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                            <?= $noticeButton ?>
                                            <?= $noticeInput ?>
                                        </div>
                                        <?php
                                    }
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_OTHER_COMMENT) {

                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_REPLY) {

                                    ?>
                                    <div class="news-list-item new-comment <?= $newMessage ?>">
                                        <p>
                                            <?= $noticeCreator.' ' ?>
                                            <?php
                                                if($notice->user_id == $this->request->getSession()->read('Auth.User.id') && (int)$noticeData['message']['type_id'] == 2) {
                                            ?>
                                            <?= __('has answered your question') . ' ' ?>
                                            <?php
                                                } elseif ((int)$noticeData['message']['type_id'] == 2) {
                                            ?>
                                            <?= __('has answered the question') . ' ' ?>
                                            <?php
                                                } elseif ($notice->user_id == $this->request->getSession()->read('Auth.User.id') && (int)$noticeData['message']['type_id'] == 1) {
                                            ?>
                                            <?= __('has commented your news') . ' ' ?>
                                            <?php
                                                } elseif ((int)$noticeData['message']['type_id'] == 1) {
                                            ?>
                                            <?= __('has commented news') . ' ' ?>
                                            <?php
                                                }
                                            ?>
                                            <?= $this->Text->truncate($noticeData['message']['title'],
                                                30) ?>
                                            <?php
                                            if ((int)$noticeData['message']['type_id'] == 2) {
                                                echo $this->Html->link(__('Go to the answer.'),
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $noticeData['message']['content'],
                                                    'open' => $noticeData['message']['comment_id']
                                                ],
                                                [
                                                    'class' => 'goToLink',
                                                    'data-mark-id' => $notice->id
                                                ]
                                                );
                                            } else {
                                                echo $this->Html->link(__('Go to the comment.'),
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $noticeData['message']['content'],
                                                    'open' => $noticeData['message']['comment_id']
                                                ],
                                                [
                                                    'class' => 'goToLink',
                                                    'data-mark-id' => $notice->id
                                                ]
                                                );

                                            }
                                            ?>

                                        </p>
                                        <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                        <?= $noticeButton ?>
                                        <?= $noticeInput ?>
                                    </div>
                                    <?php

                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_NEW_COMMENT) {

                                ?>
                                <div class="news-list-item new-comment <?= $newMessage ?>">
                                    <p>
                                        <?php $artileType = (int)$noticeData['message']['type_id'] == 1 ? __('comment to news') : __('reply to question'); ?>
                                        <?= $noticeCreator ?>
                                        <?php
                                            if($noticeData['message']['content'] == $this->request->getSession()->read('Auth.User.id')) {

                                        ?>
                                        <?= __('has commented your').' '.$artileType.' ' ?>
                                        <?php
                                            } else {
                                        ?>
                                        <?= __('has commented').' '.$artileType.' ' ?>
                                        <?php
                                            }
                                        ?>
                                        <?= '"'.$this->Text->truncate($noticeData['message']['articleTitle'],
                                            30).'"' ?>
                                        <?= $this->Html->link(__('Go to the comment.'),
                                            [
                                                'plugin' => 'Articles',
                                                'controller' => 'Articles',
                                                'action' => 'view',
                                                $noticeData['message']['content'],
                                                'open' => $noticeData['message']['content_parent_id'],
                                                'comment' => $noticeData['message']['comment_id']
                                            ],
                                            [
                                                'class' => 'goToLink',
                                                'data-mark-id' => $notice->id
                                            ]
                                            ); ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <?= $noticeButton ?>
                                    <?= $noticeInput ?>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_BLOCKED_USER) {
                                    $blockedTime = "";
                                    if((int)$noticeData['time'] == 86400) {
                                        $blockedTime = __('1 day');
                                    } elseif((int)$noticeData['time'] == 604800) {
                                        $blockedTime = __('7 days');
                                    } elseif((int)$noticeData['time'] == 1209600) {
                                        $blockedTime = __('14 days');
                                    } elseif((int)$noticeData['time'] == 2592000) {
                                        $blockedTime = __('30 days');
                                    } else {
                                        $blockedTime = __('forever');
                                    }
                                ?>
                                <div class="news-list-item new-comment <?= $newMessage ?>">
                                    <p>

                                        <?= __('Your account has been banned for ').' '.$blockedTime.' '.__('due to').' "'.strip_tags($noticeData['message']).'"' ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                    <?= $noticeButton ?>
                                    <?= $noticeInput ?>
                                </div>
                                <?php
                            } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REMOVE_NOTE) {

                            ?>
                            <div class="news-list-item new-comment <?= $newMessage ?>">
                                <p>
                                    <?= __('Your content') ?>
                                    <?= ' "'.strip_tags($noticeData['message']['description']).'"'?>
                                    <?=' '.__('to the').' ' ?>
                                    <?= ' "'.$this->Html->link(strip_tags($noticeData['message']['title']), [
                                        'plugin' => 'Articles',
                                        'controller' => 'Articles',
                                        'action' => 'view',
                                        $noticeData['message']['content']
                                    ]).'"' ?>
                                    <?= ' '.__('has been removed.').' ' ?>
                                    <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>" >
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
                                                <p><?= $noticeData['message']['reason_description'] ?></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                <?= $noticeButton ?>
                                <?= $noticeInput ?>
                            </div>
                            <?php
                        } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_ADMIN_CONTACT) {

                            ?>
                            <div class="news-list-item new-comment <?= $newMessage ?>">
                                <p>
                                    <?= __('Admin sended you message.').' '?>

                                    <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>">
                                        <?= __('Show admin message') ?>
                                    </a>

                                    <div class="modal fade questionModal" id="noticeModal<?= $notice->id ?>" role="dialog" aria-label="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4><?= __('Admin message') ?></h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p><?= $noticeData['message']['content'] ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </p>
                                <p class="inbox-message-date"><?= $notice->created->format('d.m.Y, H:i') ?></p>
                                <?= $noticeButton ?>
                                <?= $noticeInput ?>
                            </div>
                            <?php
                                } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_DECISION) {

                            ?>
                                <div class="news-list-item new-comment <?= $newMessage ?>">
                                    <p>
                                        <?= __('Objection concerning').' '?>
                                        <?php  if($noticeData['message']['type_content'] != 'USER') { ?>
                                        <?= ' "'.strip_tags($noticeData['message']['content_text']).'" ' ?>
                                        <?php
                                            } else {
                                                echo __('your profile').' ';
                                            }
                                        ?>
                                        <?= __('has been resolved by').' ' ?>
                                        <?=  $noticeCreator.'. ' ?>
                                        <a href="#" data-toggle="modal" class="modal-justification" data-target="#noticeModal<?= $notice->id ?>">
                                            <?= __('Show justification') ?>
                                        </a>
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
<div class="modal fade questionModal" id="reportModal" role="dialog" aria-labelledby="commentModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                </button>
                <h4><?= __('Report content'); ?></h4>
            </div>
            <div class="modal-body modal-report">
                <p id="modal-content"></p>
                <div class="add-comment">
                    <form id="form-report">
                        <?php
                        echo $this->Form->select('type',
                            $this->Reports->getReportContentTypes(),
                            [
                                'id' => 'addReportType'
                            ]);
                        ?>
                        <div id="reportInputContainer">
                            <input class="form-control" name="content_input" id="addReportInput">
                        </div>
                        <div id="reportTextContainer">
                            <label for="addComment"><?= __('Add reason') ?>
                            </label>
                            <textarea class="form-control" name="content" id="addReportText"></textarea>
                        </div>
                        <button class="btn" id="report-link" href="#">
                            <span class=""></span><?= __('Report'); ?>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
    foreach ($notices as $notice) {
        $noticeData = json_decode($notice->content_message, true);
?>
        <div class="modal fade questionModal" id="noticeModal<?= $notice->id ?>" role="dialog" aria-label="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                        </button>
                        <h4><?= __('Admin decision') ?></h4>
                    </div>
                    <div class="modal-body">
                        <?php
                            $decision = $objectionUrl = '';
                            $showObjectionButton = false;

                            if ($noticeData['message']['type_decision'] == 'DELETE') {
                                $decision = __('Deleted content');
                                $showObjectionButton = true;
                                $objectionUrl = $this->Url->build([
                                    'plugin' => 'Reports',
                                    'controller' => 'Reports',
                                    'action' => 'objection',
                                    $notice->content_id,
                                    '_ext' => 'json'
                                ]);
                            } elseif($noticeData['message']['type_decision'] == 'REJECT') {
                                $decision = __('Reject report');
                            } elseif($noticeData['message']['type_decision'] == 'USER_PERMISSION') {
                                $removed = str_replace('Zaakceptuj', 'Accept', $noticeData['message']['removed']);
                                $decision = __('Punished by deleting permission').': '.$removed;
                            }
                        ?>
                        <p><span class="action-taken"><?= __('Decision').':' ?></span> <?= $decision ?></p>
                        <?php
                            if (isset($noticeData['message']['blocked_to'])) {
                                echo '<p><span class="action-taken">'.__('Blocked time').': '.'</span> '.$noticeData['message']['blocked_to'].'</p>';
                            }
                        ?>
                        <p><span class="action-taken"><?= __('Justification').':' ?></span> <?= $noticeData['message']['content'] ?></p>
                        <?= $showObjectionButton ? '<button type="button" id="raiseObjectionButton" class="btn raise-objection"  data-toggle="collapse" href="#objection'.$notice->content_id.'"  aria-expanded="false" aria-controls="collapse'.$notice->content_id.'">Objection</button>' : '' ?>
                        <div id="objection<?= $notice->content_id ?>" class="add-comment collapse">
                            <?php
                                echo $this->Form->create(null, [
                                    'class' => 'form-objection'
                                ]);
                                echo $this->Form->input('description',
                                    [
                                        'required' => false,
                                        'type' => 'textarea',
                                        'label' => false,
                                        'class' => 'raise-objection-content'
                                    ]
                                );
                            ?>
                            <label class="objection-error error" style="display:none;"></label>
                            <button class="submit-objection btn" data-href="<?= $objectionUrl ?>"> <?= __('Report') ?></button>
                            <?php
                                echo $this->Form->end();
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<?php
    }
?>
<script>
    $(document).ready(function () {
        $(".form-objection").validate({
            rules: {
                description: {
                    required: true,
                    minlength: 3
                }
            },
            messages: {
                description: {
                    required: "<?= __('Reason cannot be empty.') ?>",
                    minlength: "<?= __('Reason must have min. 3 characters.') ?>"
                }
            }
        });
        $('.submit-objection').on('click', function (e) {
            var button = $(this);
            var form = $(this).parent();
            if (form.valid()) {
                button.attr("disabled", true);
                button.find('span').addClass('loading');
                $.ajax({
                    url: button.attr("data-href"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        if (result.success) {
                            window.location.href = window.location;
                        } else {
                            button.find('span').removeClass('loading');
                            button.attr("disabled", false);
                        }
                    },
                    error: function (result) {
                        form.find("label.objection-error").show();
                        form.find("label.objection-error").html(result.responseJSON.message);
                        button.find('span').removeClass('loading');
                        button.attr("disabled", false);
                    }
                });
            }
        });
        contentView.bindMarkNotification();
        contentView.bindMarkModalNotification();
        $('#select-all').on("click", function () {
            if ($(this).prop("checked") == true) {
                $('.check-item').prop('checked', true).addClass('checked');
            } else {
                $('.check-item').prop('checked', false).removeClass('checked');
            }
        });
    });
</script>
