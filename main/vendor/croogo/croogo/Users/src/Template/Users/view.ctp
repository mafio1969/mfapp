<?php

use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $user
 * @var $userNews
 * @var $userArticles
 * @var $userQuestions
 * @var $userAnswers
 * @var $userComments
 * @var $report
 * @var $rolesPermissions
 * @var $contentId
 * @var $userId
 * @var $userViewId
 * @var $userGlobalPermissions
 * @var $subscribed
 * @var $fallowers
 */

?>
<div class="articles-list-page">
    <div class="user-page">
        <div class="container">
            <ul class="nav nav-tabs art-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#user-profile" class="user-profil-tab" aria-controls="user-profile" role="tab"
                       data-toggle="tab"><?= __('Profile') ?></a>
                </li>
                <li role="presentation">
                    <a href="#user-news" class="user-news-tab" aria-controls="user-news" role="tab"
                       data-toggle="tab"><?= __('News') ?></a>
                </li>
                <li role="presentation">
                    <a href="#user-questions" class="user-questions-tab"
                       aria-controls="user-questions" role="tab" data-toggle="tab"><?= __('Questions') ?></a>
                </li>
                <li role="presentation">
                    <a href="#user-responses" class="user-responses-tab"
                       aria-controls="user-responses" role="tab" data-toggle="tab"><?= __('Answers') ?></a>
                </li>
                <li role="presentation">
                    <a href="#user-comments" class="user-responses-tab"
                       aria-controls="user-comments" role="tab" data-toggle="tab"><?= __('Comments') ?></a>
                </li>
                <li role="presentation">
                    <a href="#user-accepts" class="user-accepts-tab" aria-controls="user-accepts"
                       role="tab" data-toggle="tab"><?= __('Accepts') ?></a>
                </li>
                <li role="presentation">
                    <a href="#user-decline" class="user-decline-tab" aria-controls="user-decline"
                       role="tab" data-toggle="tab"><?= __('Rejects') ?></a>
                </li>
                <li role="presentation">
                    <a href="#user-permissions" class="user-permissions-tab"
                       aria-controls="user-permissions" role="tab" data-toggle="tab"><?= __('Permissions') ?></a>
                </li>
            </ul>
        </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="user-profile">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User profile') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="user-bio">
                            <?php

                            $userPhoto = UserComponent::IMAGE_BLANK_USER;
                            if (!empty($user->image)) {
                                $userPhoto = $user->image;
                            }

                            ?>
                            <div class="user-img"
                                 style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $userPhoto ?>) no-repeat center; background-size: cover;"></div>
                            <div class="user-description">
                                <h4 class="user-name"><?= $user->name ?></h4>
                                <div class="user-fallowers"><p><?= __('Fallowers') ?>: <span
                                                class="count"><?= $fallowers ?></span></p></div>
                                <p><?= $user->bio ?></p>
                                <div class="subscription-user">
                                    <?php
                                    $userID = $this->request->getSession()->read('Auth.User.id');
                                    if ($userID && ($userID != $user->id)) {
                                        ?>
                                        <?= $this->Html->link(__('Subscribed user'),
                                            [
                                                'plugin' => 'Subscriptions',
                                                'controller' => 'Subscriptions',
                                                'action' => 'deleteUserSubscription',
                                                $user->id,
                                                '_ext' => 'json'
                                            ], [
                                                'class' => 'subscription btn-secondary sub ' . ($subscribed ? '' : 'subInActiveButton'),
                                                'title' => 'delete subscription'
                                            ]
                                        ); ?>
                                        <?= $this->Html->link(__('Subscribe user'),
                                            [
                                                'plugin' => 'Subscriptions',
                                                'controller' => 'Subscriptions',
                                                'action' => 'addUserSubscription',
                                                $user->id,
                                                '_ext' => 'json'
                                            ], [
                                                'class' => 'subscription btn-secondary ' . ($subscribed ? 'subInActiveButton' : ''),
                                                'title' => 'add subscription'
                                            ]
                                        ); ?>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <?php
                                if ((int)$contentId !== (int)$userId) {
                                    if ($userGlobalPermissions[UsersController::ROLE_BLOCKED_II]) {
                                        if ($user->is_blocked_time + $user->is_blocked_period > time()) {
                                            ?>
                                            <div class="report-user">
                                                <p><?= __('This user is blocked until ')
                                                    . date("d.m.Y H:s",
                                                        $user->is_blocked_time + $user->is_blocked_period)
                                                    . __(' due to ') . $user->is_blocked_reason . '.' ?></p>
                                                <?php
                                                echo $this->Form->create($user, [
                                                    'url' => [
                                                        'plugin' => 'Croogo/Users',
                                                        'controller' => 'Users',
                                                        'action' => 'unblock',
                                                        '_ext' => 'json'
                                                    ],
                                                    'id' => 'user-unblock-form'
                                                ]);
                                                echo $this->Form->input('user_id', [
                                                    'type' => 'hidden',
                                                    'value' => $user->id
                                                ]);
                                                echo $this->Form->submit(__('Unblock User'),
                                                    ['class' => 'btn-secondary']);
                                                echo $this->Form->end();
                                                ?>
                                            </div>
                                            <?php
                                        }
                                        ?>
                                        <div class="block-user">
                                            <a role="button" data-toggle="collapse" href="#collapseBlock"
                                               class="btn-secondary"><span
                                                        class="glyphicon glyphicon-ban-circle"></span> <?= __('Block user') ?>
                                            </a>
                                            <div class="collapse" id="collapseBlock">
                                                <?php

                                                echo $this->Form->create($user, [
                                                    'id' => 'user-block-form',
                                                    'url' => [
                                                        'plugin' => 'Croogo/Users',
                                                        'controller' => 'Users',
                                                        'action' => 'block',
                                                        '_ext' => 'json'
                                                    ]
                                                ]);
                                                echo $this->Form->input('user_id', [
                                                    'type' => 'hidden',
                                                    'value' => $user->id
                                                ]);
                                                echo $this->Form->input('period', [
                                                    'label' => [
                                                        'text' => __('Block user for:')
                                                    ],
                                                    'type' => 'select',
                                                    'options' => UsersController::getBlockedPeriods()
                                                ]);
                                                echo $this->Form->input('reason', [
                                                    'label' => [
                                                        'text' => __('Block reason')
                                                    ],
                                                    'type' => 'textarea'
                                                ]);
                                                echo $this->Form->submit(__('Block'), ['class' => 'btn-secondary']);
                                                echo $this->Form->end();
                                                ?>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                    ?>
                                    <div class="block-user">
                                        <?php
                                        if (!isset($user->reports) || count($user->reports) == 0) {
                                            ?>
                                            <a role="button" data-toggle="collapse" href="#collapseReport"
                                               class="btn-secondary report-btn"><?= __('Report user') ?></a>
                                            <?php
                                        }
                                        ?>
                                        <div class="collapse" id="collapseReport">
                                            <?php
                                            echo $this->Form->create(null, [
                                                'id' => 'report-form',
                                                'url' => [
                                                    'plugin' => 'Reports',
                                                    'controller' => 'Reports',
                                                    'action' => 'user',
                                                    '_ext' => 'json'
                                                ]
                                            ]);
                                            echo $this->Form->input('user_id', [
                                                'type' => 'hidden',
                                                'value' => $userViewId
                                            ]);
                                            echo $this->Form->input('reason', [
                                                'type' => 'select',
                                                'id' => 'report-options',
                                                'label' => [
                                                    'text' => __('Choose reason')
                                                ],
                                                'options' => $this->Reports->getReportUserTypes()
                                            ]);
                                            echo $this->Form->input('description', [
                                                'type' => 'textarea',
                                                'id' => 'report-description',
                                                'templates' => [
                                                    'inputContainer' => '<div class="form-group {{type}}" style="display: none">{{content}}{{help}}</div>'
                                                ]
                                            ]);
                                            echo $this->Form->submit(__('Report'), ['class' => 'btn-secondary']);
                                            echo $this->Form->end();
                                            ?>
                                        </div>
                                    </div>
                                    <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="user-news">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User news') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="news-list">
                            <?php
                            foreach ($userNews as $news) {
                                ?>
                                <div class="news-list-item">
                                    <?php
                                    $newsVote = $this->Articles->renderVotes($news->counter_vote_result);
                                    echo $this->Html->link(
                                        '<h4>' . $news->title . ' <span class="vote">' . $newsVote . '</span></h4>',
                                        [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $news->id
                                        ]
                                    );
                                    if (false) {
                                        ?><a href="#" class="btn-edit">Edytuj</a><?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="user-questions">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User questions') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="news-list">
                            <?php
                            foreach ($userQuestions as $question) {
                                ?>
                                <div class="news-list-item">
                                    <?php
                                    $questionVote = $this->Articles->renderVotes($question->counter_vote_result);
                                    echo $this->Html->link(
                                        '<h4>' . $question->title . ' <span class="vote">' . $questionVote . '</span></h4>',
                                        [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $question->id
                                        ]
                                    );
                                    if (false) {
                                        ?><a href="#" class="btn-edit">Edytuj</a><?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="user-responses">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User answers') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="news-list">
                            <?php
                            foreach ($userAnswers as $answer) {
                                ?>
                                <div class="news-list-item">
                                    <?php
                                    $answerVote = $this->Articles->renderVotes($answer->article->counter_vote_result);
                                    echo $this->Html->link(
                                        '<h4>' . $answer->article->title . ' <span class="vote">' . $answerVote . '</span></h4>
                                        <p>' . $this->Text->truncate(strip_tags($answer->description),
                                            60) . '</p>',
                                        [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $answer->article->id,
                                            'open' => $answer->id
                                        ]
                                    );
                                    if (false) {
                                        ?><a href="#" class="btn-edit">Edytuj</a><?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="user-comments">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User comments') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="news-list">
                            <?php
                            foreach ($userComments as $comment) {
                                ?>
                                <div class="news-list-item">
                                    <?php
                                    $commentVote = $this->Articles->renderVotes($comment->article->counter_vote_result);
                                    echo $this->Html->link(
                                        '<h4>' . $comment->article->title . ' <span class="vote">' . $commentVote . '</span></h4>
                                        <p>' . $comment->description . '</p>',
                                        [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $comment->article->id
                                        ]
                                    );
                                    if (false) {
                                        ?><a href="#" class="btn-edit">Edytuj</a><?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="user-accepts">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User accepts') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="news-list">
                            <?php
                            foreach ($user->accepts as $accept) {
                                ?>
                                <div class="news-list-item">
                                    <?php
                                    $acceptVote = $this->Articles->renderVotes($accept->article->counter_vote_result);
                                    echo $this->Html->link(
                                        '<h4>' . $accept->article->title . ' <span class="vote">' . $acceptVote . '</span></h4>
                                        <p>' . $accept->description . '</p>',
                                        [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $accept->id
                                        ]
                                    );
                                    if (false) {
                                        ?><a href="#" class="btn-edit">Edytuj</a><?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="user-decline">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User rejects') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="news-list">
                            <?php
                            foreach ($user->rejects as $reject) {
                                ?>
                                <div class="news-list-item">
                                    <?php
                                    $rejectVote = $this->Articles->renderVotes($reject->article->counter_vote_result);
                                    echo $this->Html->link(
                                        '<h4>' . $reject->article->title . ' <span class="vote">' . $rejectVote . '</span></h4>
                                        <p>' . $reject->description . '</p>',
                                        [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'view',
                                            $reject->id
                                        ]
                                    );
                                    if (false) {
                                        ?><a href="#" class="btn-edit">Edytuj</a><?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="user-permissions">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('User permissions') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="edit-user-role">
                            <p class="legend">
                                <img src="/img/star.png" title="star" alt="User permission star"><span><?= __('User have permission') ?></span>
                            </p>
                        </div>
                        <div class="user-roles">
                            <?php
                            $userRoleIds = $userRoleBockedIds = $userRoleBockedTimes = [];

                            foreach ($user->roles as $role) {
                                $userRoleIds[] = $role->id;
                            }
                            foreach ($user->roles_blocks as $roleBlock) {
                                $blockedRoles = json_decode($roleBlock['roles'], true);
                                foreach ($blockedRoles as $blockedRole) {
                                    $userRoleBockedIds[] = $blockedRole;
                                    $userRoleBockedTimes[$blockedRole] = date('Y-m-d H:i', $roleBlock['blocked_time']);
                                }
                            }
                            $rolesDescriptions = Croogo\Users\Controller\UsersController::getRolesDescriptions();
                            $disabled = true;
                            if ((int)$contentId !== (int)$userId && $userGlobalPermissions[UsersController::ROLE_GIVE_PERMISSION_II]) {
                                echo $this->Form->create($user, [
                                    'url' => [
                                        'plugin' => 'Croogo/Users',
                                        'controller' => 'Users',
                                        'action' => 'roles',
                                        '_ext' => 'json'
                                    ],
                                    'id' => 'user-permissions-form'
                                ]);
                                echo $this->Form->input('permissions', [
                                    'type' => 'hidden',
                                    'value' => $user->id
                                ]);
                                $disabled = false;
                            }
                            foreach ($rolesPermissions as $roleData) {
                                $activeClass = $blockedClass = '';
                                $checked = false;
                                $disabledInput = false;
                                if (in_array($roleData->id, $userRoleIds)) {
                                    $activeClass = 'active-role';
                                    $checked = 'checked';
                                }
                                if (in_array($roleData->id, $userRoleBockedIds)) {
                                    $activeClass = 'disabled-role';
                                    $disabledInput = true;
                                    $checked = '';
                                }
                                ?>
                                <div class="user-role">
                                    <div class="role-inner <?= $activeClass ?> <?= $blockedClass ?>">
                                        <?php
                                        $inputOptions = [
                                            'type' => 'checkbox',
                                            'value' => $roleData->id,
                                            'hiddenField' => false,
                                            'checked' => $checked,
                                            'class' => 'check-item ' . $checked,
                                            'id' => 'actives-ids-' . $roleData->id,
                                            'label' => false,
                                            'templates' => [
                                                'checkboxContainer' => '{{content}}'
                                            ]
                                        ];
                                        if ($disabled || $disabledInput) {
                                            $inputOptions['disabled'] = true;
                                        }
                                        echo $this->Form->input('actives._ids[]', $inputOptions);

                                        if ($disabledInput) {
                                            $inputOptions['disabled'] = false;
                                            $inputOptions['hidden'] = true;
                                            echo $this->Form->input('actives._ids[]', $inputOptions);
                                        }
                                        ?>
                                        <label class="role-label"
                                               for="<?= 'actives-ids-' . $roleData->id ?>"><?= $roleData->title ?></label>
                                        <span><?= $rolesDescriptions[$roleData->alias]['description']; ?></span>
                                        <?php
                                        if ($disabledInput) {
                                            if (strtotime($userRoleBockedTimes[$roleData->id]) > strtotime('30 days')) {
                                                echo '<span class="blocked-time">' . __('Blocked forever') . '</span>';
                                            } else {
                                                echo '<span class="blocked-time">' . __('Blocked to') . ' ' . $userRoleBockedTimes[$roleData->id] . '</span>';
                                            }
                                        }
                                        ?>
                                    </div>
                                </div>
                                <?php
                            }
                            if ((int)$contentId !== (int)$userId && $userGlobalPermissions[UsersController::ROLE_GIVE_PERMISSION_II]) {
                                echo $this->Form->input('substantiation', [
                                    'label' => [
                                        'text' => __('Take off reason')
                                    ],
                                    'type' => 'textarea'
                                ]);
                                echo $this->Form->input('period', [
                                    'label' => [
                                        'text' => __('Time to block:')
                                    ],
                                    'type' => 'select',
                                    'options' => UsersController::getPeriodsForPermission()
                                ]);
                                echo $this->Form->submit(__('Save permissions'), ['class' => 'btn-secondary']);
                                echo $this->Form->end();
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    $(document).ready(function () {
        $('#report-options').on("change", function () {
            if (parseInt($(this).val()) === 16) {
                $('#report-description').parent().css("display", "block");
            } else {
                $('#report-description').parent().css("display", "none");
            }
        });
        contentView.bindSubscription();
        contentView.bindViewReportForm('#report-form');
        contentView.bindViewFormPermission();
        contentView.bindViewForm('#user-block-form');
        contentView.bindViewForm('#user-unblock-form');
    });
</script>
