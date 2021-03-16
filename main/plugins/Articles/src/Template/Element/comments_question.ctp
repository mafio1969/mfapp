<?php

use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Reports\Controller\ReportsController;

/**
 * @var $noteEntity
 * @var $article
 * @var $notes
 * @var $noteCommentEntity
 * @var $reportEntity
 * @var $userGlobalPermissions
 */

?>
<?php
if ($this->request->getSession()->check('Auth.User.id')) {
    ?>
    <div class="add-comment">
        <button type="button" class="btn" data-toggle="modal" data-target="#answerModal"><?= __('Add answer') ?>
        </button>
    </div>
    <?php
}
?>
<div class="comments comments-modal">
    <?php
    $userID = $userId = $this->request->getSession()->read('Auth.User.id');
    foreach ($notes as $key => $note) {
        $noteUserPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($note->user->image)) {
            $noteUserPhoto = $note->user->image;
        }
        ?>
        <div class="comment questionReply">
            <div class="questionReply-container">
                <div class="user-info">
                    <a href="<?= $this->Url->build([
                        'plugin' => 'Croogo/Users',
                        'controller' => 'Users',
                        'action' => 'view',
                        $note->user_id
                    ]); ?>" class="user-info-inner">
                        <div class="user-img"
                             style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $noteUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                        <?php
                        $userName = isset($note->user->name) ? $note->user->name : __('Deleted user');
                        ?>
                        <p class="user-name"><?= $userName ?></p>
                    </a>
                    <p class="comment-date"><?= $note->created->format('d.m.Y H:i') ?></p>
                    <?php
                    if ($note->is_edited) {
                        ?>
                        <p class="comment-edit"><?= __('Edited') ?></p>
                        <?php
                    }
                    ?>
                </div>
                <?php
                if ($note->is_deleted) {
                    if ((int)$note->user_id === (int)$note->is_deleted_by) {
                        ?>
                        <a href="#" type="button" class="questionReply-inner" data-toggle="modal"
                           data-target="#noteModal<?= $note->id ?>">
                            <div class="user-comment"><?= __('Comment was deleted.'); ?></div>
                        </a>
                        <div class="replyActions"></div>
                        <?php
                    } else {
                        ?>
                        <a href="#" type="button" class="questionReply-inner" data-toggle="modal"
                           data-target="#noteModal<?= $note->id ?>">
                            <div
                                    class="user-comment"><?= __('Comment removed by moderator'); ?></div>
                        </a>
                        <div class="replyActions"></div>
                        <?php
                    }
                } else {
                    $readMore = '';
                    if (strlen(strip_tags($note->description)) > 150) {
                        $readMore = '<span class="read-more">' . __('Read more') . '</span>';
                    }
                    ?>
                    <a href="#" type="button" class="questionReply-inner" data-toggle="modal"
                       data-target="#noteModal<?= $note->id ?>">
                        <div class="user-comment">
                            <?= $this->Text->truncate(strip_tags($note->description), 150); ?>
                            <?= $readMore; ?>
                        </div>
                    </a>
                    <div class="replyActions">
                        <?php
                        $countComments = '<a href="#" type="button" class="questionCommentCounter" data-toggle="modal"
                       data-target="#noteModal'.$note->id.'"><span class="count-comments">' . count($note->first_notes) . '</span></a>';
                        ?>
                        <p class="vote-up-button">
                            <?php
                            $voted = '';
                            if (isset($note->votes_notes[0])) {
                                $voted = 'voted';
                            }
                            if ($this->request->getSession()->read('Auth.User.id')) {
                                ?>
                                <?= $this->Html->link('',
                                    [
                                        'plugin' => 'Votes',
                                        'controller' => 'Votes',
                                        'action' => 'vote',
                                        $note->id,
                                        '_ext' => 'json'
                                    ], [
                                        'id' => $key . '-vote',
                                        'class' => 'vote-up-comment ' . $voted,
                                        'title' => 'vote up'
                                    ]
                                ); ?>
                                <?php
                            } else {
                                ?>
                                <a disabled="disabled" title="<?= __('Only for registered users') ?>"
                                   class="vote"></a>
                                <?php
                            }
                            ?>
                            <span id="<?= $key . '-vote-comment' ?>"><?= $note->counter_up_vote ?></span>
                        </p>
                        <?php
                        if ($this->request->getSession()->check('Auth.User.id')) {
                            ?>
                            <a href="<?= $this->Url->build([
                                'plugin' => 'Notes',
                                'controller' => 'Notes',
                                'action' => 'comment',
                                $note->id
                            ]); ?>" class="reply link-comment-question"><?= __('Reply'); ?></a>
                            <?php
                            if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$note->user_id) {
                                ?>
                                <a data-item="<?= $this->Url->build([
                                    'plugin' => 'Notes',
                                    'controller' => 'Notes',
                                    'action' => 'editContent',
                                    $note->id,
                                    '_ext' => 'json'
                                ]); ?>" href="<?= $this->Url->build([
                                    'plugin' => 'Notes',
                                    'controller' => 'Notes',
                                    'action' => 'editNote',
                                    $note->id,
                                    '_ext' => 'json'
                                ]); ?>" class="reply link-edit-answer"><?= __('Edit'); ?></a>
                                <?php
                            }
                            ?>
                            <?php
                                if((!isset($note->reports) || count($note->reports) == 0) && ($note->user_id != $this->request->getSession()->read('Auth.User.id'))) {
                            ?>
                            <a href="<?= $this->Url->build([
                                'plugin' => 'Reports',
                                'controller' => 'Reports',
                                'action' => 'comment',
                                $note->id,
                                ReportsController::REPORT_CONTENT_TYPE_ANSWER_QUESTION,
                                '_ext' => 'json'
                            ]); ?>" class="reply link-report-question"><?= __('Report'); ?></a>
                            <?php
                                }
                        } else {
                            ?>
                            <a disabled="disabled" class="reply"
                               title="<?= __('Only for registered users') ?>"><?= __('Reply'); ?></a>
                            <?php
                        }
                        if (count($note->first_notes) > 0) {
                            echo $countComments;
                        }
                        if (($this->request->getSession()->check('Auth.User.id')
                                && $userGlobalPermissions[UsersController::ROLE_EDITOR])
                            || ((int)$this->request->getSession()->read('Auth.User.id') === (int)$note->user_id
                                && time() - strtotime($note->created) < DAY)) {
                            ?>
                            <a href="<?= $this->Url->build([
                                'plugin' => 'Notes',
                                'controller' => 'Notes',
                                'action' => 'remove',
                                $note->id,
                                '_ext' => 'json'
                            ]); ?>" class="reply link-remove"><?= __('Remove'); ?></a>
                            <?php
                        }
                        ?>
                        <?php
                        $userID = $this->request->getSession()->read('Auth.User.id');
                        if ($userID && ($userID != $note->user_id)) {
                            ?>
                            <?= $this->Html->link(__('Subscribed'),
                                [
                                    'plugin' => 'Subscriptions',
                                    'controller' => 'Subscriptions',
                                    'action' => 'deleteNoteSubscription',
                                    $note->id,
                                    '_ext' => 'json'
                                ], [
                                    'class' => 'reply subscription sub ' . (isset($note->notes_subscriptions[0]->created) ? '' : 'subInActiveButton'),
                                    'title' => 'delete subscription'
                                ]
                            ); ?>
                            <?= $this->Html->link(__('Subscribe'),
                                [
                                    'plugin' => 'Subscriptions',
                                    'controller' => 'Subscriptions',
                                    'action' => 'addNoteSubscription',
                                    $note->id,
                                    '_ext' => 'json'
                                ], [
                                    'class' => 'reply subscription ' . (isset($note->notes_subscriptions[0]->created) ? 'subInActiveButton' : ''),
                                    'title' => 'add subscription'
                                ]
                            ); ?>
                            <?php
                        }
                        ?>

                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
        <div class="modal fade questionModal" id="noteModal<?= $note->id ?>" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span>
                        </button>
                        <h4><?= $article->title ?></h4>
                    </div>
                    <div class="modal-body">
                        <div class="questionReply-content">
                            <a href="<?= $this->Url->build([
                                'plugin' => 'Croogo/Users',
                                'controller' => 'Users',
                                'action' => 'view',
                                $article->user_id
                            ]); ?>">
                                <div class="user-img"
                                     style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $noteUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                            </a>
                            <div class="comment-inner">
                                <div class="comment-inner-top">
                                    <a href="<?= $this->Url->build([
                                        'plugin' => 'Croogo/Users',
                                        'controller' => 'Users',
                                        'action' => 'view',
                                        $note->user_id
                                    ]); ?>"><p class="user-name"><?= $note->user->name ?></p></a>
                                    <p class="comment-date"><?= $note->created->format('d.m.Y H:i') ?></p>
                                    <?php
                                    if ($note->is_edited) {
                                        ?>
                                        <p class="comment-edit"><?= __('Edited') ?></p>
                                        <?php
                                    }
                                    ?>
                                </div>
                            </div>
                            <?php
                            if ($note->is_deleted) {
                                ?>
                                <div class="user-comment"><?= __('Comment was deleted.'); ?></div>
                                <?php
                            } else {
                                ?>
                                <div class="user-comment"><?= $note->description; ?></div>
                                <?php
                            }
                            ?>
                        </div>
                        <?php
                        if ($note->is_deleted) {
                            ?>
                            <?php
                        } else {
                            ?>
                            <div class="replyActions">
                                <p class="vote-up-button">
                                    <?php
                                    if ($this->request->getSession()->read('Auth.User.id')) {
                                        ?>
                                        <?= $this->Html->link('',
                                            [
                                                'plugin' => 'Votes',
                                                'controller' => 'Votes',
                                                'action' => 'vote',
                                                $note->id,
                                                '_ext' => 'json'
                                            ], [
                                                'id' => $key . '-vote-m',
                                                'class' => 'vote-up-comment ' . $voted,
                                                'title' => 'vote up'
                                            ]
                                        ); ?>
                                        <?php
                                    } else {
                                        ?>
                                        <a disabled="disabled" title="<?= __('Only for registered users') ?>"
                                           class="vote"></a>
                                        <?php
                                    }
                                    ?>
                                    <span id="<?= $key . '-vote-m-comment' ?>"><?= $note->counter_up_vote ?></span>
                                </p>
                                <?php
                                if ($this->request->getSession()->check('Auth.User.id')) {
                                    ?>
                                    <a href="<?= $this->Url->build([
                                        'plugin' => 'Notes',
                                        'controller' => 'Notes',
                                        'action' => 'comment',
                                        $note->id
                                    ]); ?>" class="reply link-comment-question"><?= __('Reply'); ?></a>
                                    <?php
                                    if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$note->user_id) {
                                        ?>
                                        <a data-item="<?= $this->Url->build([
                                            'plugin' => 'Notes',
                                            'controller' => 'Notes',
                                            'action' => 'editContent',
                                            $note->id,
                                            '_ext' => 'json'
                                        ]); ?>" href="<?= $this->Url->build([
                                            'plugin' => 'Notes',
                                            'controller' => 'Notes',
                                            'action' => 'editNote',
                                            $note->id,
                                            '_ext' => 'json'
                                        ]); ?>" class="reply link-edit-answer"><?= __('Edit'); ?></a>
                                        <?php
                                    }
                                    ?>
                                    <?php
                                    if((!isset($note->reports) || count($note->reports) == 0) && ($note->user_id != $userId)) {
                                    ?>
                                    <a href="<?= $this->Url->build([
                                        'plugin' => 'Reports',
                                        'controller' => 'Reports',
                                        'action' => 'comment',
                                        $note->id,
                                        ReportsController::REPORT_CONTENT_TYPE_ANSWER_QUESTION,
                                        '_ext' => 'json'
                                    ]); ?>" class="reply link-report-question"><?= __('Report'); ?></a>
                                    <?php
                                    }
                                } else {
                                    ?>
                                    <a disabled="disabled" class="reply"
                                       title="<?= __('Only for registered users') ?>"><?= __('Reply'); ?></a>
                                    <?php
                                }
                                if (($this->request->getSession()->check('Auth.User.id')
                                        && $userGlobalPermissions[UsersController::ROLE_EDITOR])
                                    || ((int)$this->request->getSession()->read('Auth.User.id') === (int)$note->user_id
                                        && time() - strtotime($note->created) < DAY)) {
                                    ?>
                                    <a href="<?= $this->Url->build([
                                        'plugin' => 'Notes',
                                        'controller' => 'Notes',
                                        'action' => 'remove',
                                        $note->id,
                                        '_ext' => 'json'
                                    ]); ?>" class="reply link-remove"><?= __('Remove'); ?></a>
                                    <?php
                                }
                                ?>
                                <?php
                                $userID = $this->request->getSession()->read('Auth.User.id');
                                if ($userID && ($userID != $note->user_id)) {
                                    ?>
                                    <?= $this->Html->link(__('Subscribed'),
                                        [
                                            'plugin' => 'Subscriptions',
                                            'controller' => 'Subscriptions',
                                            'action' => 'deleteNoteSubscription',
                                            $note->id,
                                            '_ext' => 'json'
                                        ], [
                                            'class' => 'reply subscription sub ' . (isset($note->notes_subscriptions[0]->created) ? '' : 'subInActiveButton'),
                                            'title' => 'delete subscription'
                                        ]
                                    ); ?>
                                    <?= $this->Html->link(__('Subscribe'),
                                        [
                                            'plugin' => 'Subscriptions',
                                            'controller' => 'Subscriptions',
                                            'action' => 'addNoteSubscription',
                                            $note->id,
                                            '_ext' => 'json'
                                        ], [
                                            'class' => 'reply subscription ' . (isset($note->notes_subscriptions[0]->created) ? 'subInActiveButton' : ''),
                                            'title' => 'add subscription'
                                        ]
                                    ); ?>
                                    <?php
                                }
                                ?>
                            </div>
                            <?php
                        }
                        ?>
                        <div class="questionComments">
                            <?php
                            foreach ($note->first_notes as $noteComment) {
                                $noteCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                                if (!empty($noteComment->user->image)) {
                                    $noteCommentUserPhoto = $noteComment->user->image;
                                }
                                $subscibed = false;
                                if (isset($noteComment->comments_subscriptions[0])) {
                                    $subscibed = true;
                                }
                                ?>
                                <div class="questionComment" id="comment<?= $noteComment->id ?>">
                                    <div class="questionComment-inner">
                                        <a href="<?= $this->Url->build([
                                            'plugin' => 'Croogo/Users',
                                            'controller' => 'Users',
                                            'action' => 'view',
                                            $noteComment->user_id
                                        ]); ?>">
                                            <div class="user-img"
                                                 style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $noteCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                                        </a>
                                        <div class="comment-inner">
                                            <div class="comment-inner-top">
                                                <a href="<?= $this->Url->build([
                                                    'plugin' => 'Croogo/Users',
                                                    'controller' => 'Users',
                                                    'action' => 'view',
                                                    $noteComment->user_id
                                                ]); ?>"><p class="user-name"><?= $noteComment->user->name ?></p>
                                                </a>
                                                <p class="comment-date"><?= $noteComment->created->format('d.m.Y H:i') ?></p>
                                                <?php
                                                if ($noteComment->is_edited) {
                                                    ?>
                                                    <p class="comment-edit"><?= __('Edited') ?></p>
                                                    <?php
                                                }
                                                ?>
                                            </div>
                                            <?php
                                            if ($noteComment->is_deleted) {
                                                if ((int)$noteComment->user_id === (int)$noteComment->is_deleted_by) {
                                                    ?>
                                                    <div class="user-comment"><?= __('Comment was deleted.'); ?></div>
                                                    <?php
                                                } else {
                                                    ?>
                                                    <div
                                                            class="user-comment"><?= __('Comment removed by moderator'); ?></div>
                                                    <?php
                                                }
                                            } else {
                                                ?>
                                                <div class="user-comment"><?= $noteComment->description; ?></div>
                                                <?= $this->element('vote_button', [
                                                    'voteComment' => $noteComment
                                                ]); ?>
                                                <?php
                                                if ($this->request->getSession()->check('Auth.User.id')) {
                                                    ?>
                                                    <a href="<?= $this->Url->build([
                                                        'plugin' => 'Notes',
                                                        'controller' => 'Notes',
                                                        'action' => 'comments',
                                                        $noteComment->id
                                                    ]); ?>" class="reply link-comment"><?= __('Reply'); ?></a>
                                                    <?php
                                                    if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$note->user_id) {
                                                        ?>
                                                        <a data-item="<?= $this->Url->build([
                                                            'plugin' => 'Notes',
                                                            'controller' => 'Notes',
                                                            'action' => 'editContent',
                                                            $noteComment->id,
                                                            '_ext' => 'json'
                                                        ]); ?>" href="<?= $this->Url->build([
                                                            'plugin' => 'Notes',
                                                            'controller' => 'Notes',
                                                            'action' => 'editNote',
                                                            $noteComment->id,
                                                            '_ext' => 'json'
                                                        ]); ?>" class="reply link-edit"><?= __('Edit'); ?></a>
                                                        <?php
                                                    }
                                                    ?>
                                                    <?php
                                                    if((!isset($noteComment->reports) || count($noteComment->reports) == 0) && ($noteComment->user_id != $userId)) {
                                                    ?>
                                                    <a href="<?= $this->Url->build([
                                                        'plugin' => 'Reports',
                                                        'controller' => 'Reports',
                                                        'action' => 'comment',
                                                        $noteComment->id,
                                                        ReportsController::REPORT_CONTENT_TYPE_ANSWER_COMMENT_QUESTION,
                                                        '_ext' => 'json'
                                                    ]); ?>" class="reply link-report"><?= __('Report'); ?></a>
                                                    <?php
                                                    }
                                                } else {
                                                    ?>
                                                    <a disabled="disabled" class="reply"
                                                       title="<?= __('Only for registered users') ?>"><?= __('Reply'); ?></a>
                                                    <?php
                                                }
                                                if (($this->request->getSession()->check('Auth.User.id')
                                                        && $userGlobalPermissions[UsersController::ROLE_EDITOR])
                                                    || ((int)$this->request->getSession()->read('Auth.User.id') === (int)$noteComment->user_id
                                                        && time() - strtotime($noteComment->created) < DAY)) {
                                                    ?>
                                                    <a href="<?= $this->Url->build([
                                                        'plugin' => 'Notes',
                                                        'controller' => 'Notes',
                                                        'action' => 'removeComment',
                                                        $noteComment->id,
                                                        '_ext' => 'json'
                                                    ]); ?>" class="reply link-remove"><?= __('Remove'); ?></a>
                                                    <?php
                                                }

                                                $userId = $this->request->getSession()->read('Auth.User.id');
                                                if ($userId && $userId !== $noteComment->user_id) {
                                                    ?>
                                                    <?= $this->Html->link(__('Subscribed'),
                                                        [
                                                            'plugin' => 'Subscriptions',
                                                            'controller' => 'Subscriptions',
                                                            'action' => 'deleteCommentSubscription',
                                                            $noteComment->id,
                                                            '_ext' => 'json'
                                                        ], [
                                                            'class' => 'reply subscription sub ' . ($subscibed ? '' : 'subInActiveButton'),
                                                            'title' => 'delete subscription'
                                                        ]
                                                    ); ?>
                                                    <?= $this->Html->link(__('Subscribe'),
                                                        [
                                                            'plugin' => 'Subscriptions',
                                                            'controller' => 'Subscriptions',
                                                            'action' => 'addCommentSubscription',
                                                            $noteComment->id,
                                                            '_ext' => 'json'
                                                        ], [
                                                            'class' => 'reply subscription ' . ($subscibed ? 'subInActiveButton' : ''),
                                                            'title' => 'add subscription'
                                                        ]
                                                    ); ?>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <?php
                                    foreach ($noteComment->second_notes as $noteSubComment) {
                                        $noteSubCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                                        if (!empty($noteSubComment->user->image)) {
                                            $noteSubCommentUserPhoto = $noteSubComment->user->image;
                                        }
                                        ?>
                                        <div class="comment-reply" id="comment<?= $noteSubComment->id ?>">
                                            <div class="comment-reply-inner">
                                                <a href="<?= $this->Url->build([
                                                    'plugin' => 'Croogo/Users',
                                                    'controller' => 'Users',
                                                    'action' => 'view',
                                                    $noteSubComment->user_id
                                                ]); ?>">
                                                    <div class="user-img"
                                                         style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $noteSubCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                                                </a>
                                                <div class="comment-inner">
                                                    <div class="comment-inner-top">
                                                        <a href="<?= $this->Url->build([
                                                            'plugin' => 'Croogo/Users',
                                                            'controller' => 'Users',
                                                            'action' => 'view',
                                                            $noteSubComment->user_id
                                                        ]); ?>">
                                                            <p class="user-name"><?= $noteSubComment->user->name ?></p>
                                                        </a>
                                                        <p class="comment-date"><?= $noteSubComment->created->format('d.m.Y H:i') ?></p>
                                                        <?php
                                                        if ($noteSubComment->is_edited) {
                                                            ?>
                                                            <p class="comment-edit"><?= __('Edited') ?></p>
                                                            <?php
                                                        }
                                                        ?>
                                                    </div>
                                                    <?php
                                                    if ($noteSubComment->is_deleted) {
                                                        if ((int)$noteSubComment->user_id === (int)$noteSubComment->is_deleted_by) {
                                                            ?>
                                                            <div
                                                                    class="user-comment"><?= __('Comment was deleted.'); ?></div>
                                                            <?php
                                                        } else {
                                                            ?>
                                                            <div
                                                                    class="user-comment"><?= __('Comment removed by moderator'); ?></div>
                                                            <?php
                                                        }
                                                    } else {
                                                        ?>
                                                        <div
                                                                class="user-comment"><?= $noteSubComment->description; ?></div>
                                                        <?= $this->element('vote_button', [
                                                            'voteComment' => $noteSubComment
                                                        ]); ?>
                                                        <?php
                                                        if ($this->request->getSession()->check('Auth.User.id')) {
                                                            ?>
                                                            <?php
                                                            if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$note->user_id) {
                                                                ?>
                                                                <a data-item="<?= $this->Url->build([
                                                                    'plugin' => 'Notes',
                                                                    'controller' => 'Notes',
                                                                    'action' => 'editContent',
                                                                    $noteSubComment->id,
                                                                    '_ext' => 'json'
                                                                ]); ?>" href="<?= $this->Url->build([
                                                                    'plugin' => 'Notes',
                                                                    'controller' => 'Notes',
                                                                    'action' => 'editNote',
                                                                    $noteSubComment->id,
                                                                    '_ext' => 'json'
                                                                ]); ?>" class="reply link-edit"><?= __('Edit'); ?></a>
                                                                <?php
                                                            }
                                                            ?>
                                                            <?php
                                                            if((!isset($noteSubComment->reports) || count($noteSubComment->reports) == 0) && ($noteSubComment->user_id != $userId)) {
                                                            ?>
                                                            <a href="<?= $this->Url->build([
                                                                'plugin' => 'Reports',
                                                                'controller' => 'Reports',
                                                                'action' => 'comment',
                                                                $noteSubComment->id,
                                                                ReportsController::REPORT_CONTENT_TYPE_COMMENT_COMMENT,
                                                                '_ext' => 'json'
                                                            ]); ?>" class="reply link-report"><?= __('Report'); ?></a>
                                                            <?php
                                                            }
                                                        }
                                                        if (($this->request->getSession()->check('Auth.User.id')
                                                                && $userGlobalPermissions[UsersController::ROLE_EDITOR])
                                                            || ((int)$this->request->getSession()->read('Auth.User.id') === (int)$noteSubComment->user_id
                                                                && time() - strtotime($noteSubComment->created) < DAY)) {
                                                            ?>
                                                            <a href="<?= $this->Url->build([
                                                                'plugin' => 'Notes',
                                                                'controller' => 'Notes',
                                                                'action' => 'removeComments',
                                                                $noteSubComment->id,
                                                                '_ext' => 'json'
                                                            ]); ?>" class="reply link-remove"><?= __('Remove'); ?></a>
                                                            <?php
                                                        }
                                                        $userId = $this->request->getSession()->read('Auth.User.id');
                                                        if ($userId && $userId !== $noteComment->user_id) {
                                                            ?>
                                                            <?= $this->Html->link(__('Subscribed'),
                                                                [
                                                                    'plugin' => 'Subscriptions',
                                                                    'controller' => 'Subscriptions',
                                                                    'action' => 'deleteCommentSubscription',
                                                                    $noteComment->id,
                                                                    '_ext' => 'json'
                                                                ], [
                                                                    'class' => 'reply subscription sub ' . (isset($noteComment->notes_subscriptions[0]->created) ? '' : 'subInActiveButton'),
                                                                    'title' => 'delete subscription'
                                                                ]
                                                            ); ?>
                                                            <?= $this->Html->link(__('Subscribe'),
                                                                [
                                                                    'plugin' => 'Subscriptions',
                                                                    'controller' => 'Subscriptions',
                                                                    'action' => 'addCommentSubscription',
                                                                    $noteComment->id,
                                                                    '_ext' => 'json'
                                                                ], [
                                                                    'class' => 'reply subscription ' . (isset($noteComment->notes_subscriptions[0]->created) ? 'subInActiveButton' : ''),
                                                                    'title' => 'add subscription'
                                                                ]
                                                            ); ?>
                                                            <?php
                                                        }
                                                    }
                                                    ?>
                                                </div>
                                            </div>
                                        </div>
                                        <?php
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
        </div>
        <div class="modal fade questionModal" id="commentModal<?= $key ?>" role="dialog"
             aria-labelledby="commentModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span>
                        </button>
                        <h4><?= __('Add comment to answer') ?></h4>
                    </div>
                    <div class="modal-body">
                        <p><?= $note->description; ?></p>
                        <div class="add-comment">
                            <?php
                            echo $this->Form->create($noteCommentEntity, [
                                'url' => [
                                    'plugin' => 'Notes',
                                    'controller' => 'Notes',
                                    'action' => 'comment',
                                    $note->id
                                ],
                                'class' => 'form-comment'
                            ]);
                            echo $this->Form->input('description',
                                [
                                    'required' => true,
                                    'type' => 'textarea',
                                    'label' => [
                                        'text' => __('Add comment')
                                    ],
                                    'id' => 'description' . $key,
                                    'class' => 'comment-description'
                                ]
                            );
                            echo $this->Form->button(__('Add'), [
                                'type' => 'submit',
                                'class' => 'btn'
                            ]);
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
</div>
<script>
    $(document).ready(function () {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        contentView.setLang('<?= __('Add') ?>', '<?= __('Add comment') ?>');
        contentView.bindClick();
        contentView.linkReport();
        contentView.linkReportQuestion();
        contentView.bindVoteUp();
        contentView.bindSubscriptionNote();
        contentView.bindFormComment();
        contentView.linkEditComment();
        contentView.submitEditComment();
        contentView.linkEditAnswer();
        contentView.submitEditAnswer();

        if (urlParams.get('open')) {
            $('#noteModal' + urlParams.get('open')).modal();
        }
    });
</script>
