<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $rejectEntity
 * @var $article
 * @var $userGlobalPermissions
 */

?>
<?php
if ($this->request->getSession()->check('Auth.User.id')
    && (int)$this->request->getSession()->read('Auth.User.id') !== (int)$article->user_id
    && $userGlobalPermissions[UsersController::ROLE_ACCEPT]) {
    if (isset($checkIfAlreadyAddedReject) && $checkIfAlreadyAddedReject) {
        ?>
        <div class="add-comment">
            <div class="add-comment">
                <?= __('Reject already added.'); ?>
            </div>
        </div>
        <?php
    } elseif($this->Articles->voteTime($article->published)) {
        ?>
        <div class="add-comment">
            <div class="add-comment">
                <button type="button" class="btn" data-toggle="modal" data-target="#rejectModal"><?= __('Add reject') ?>
                </button>
            </div>
        </div>
        <?php
    }
}
?>
<div id="rejects-comments" class="comments">
    <?php
    foreach ($article->rejects as $reject) {
        $rejectUserPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($reject->user->image)) {
            $rejectUserPhoto = $reject->user->image;
        }
        $t = 0;
        ?>
        <div class="comment">
            <a href="<?= $this->Url->build([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'view',
                $reject->user_id
            ]); ?>" class="user-info-inner">
                <div class="user-img"
                     style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $rejectUserPhoto ?>) no-repeat center; background-size: cover;"></div>
            </a>
            <div class="comment-inner">
                <div class="comment-inner-top">
                    <a href="<?= $this->Url->build([
                        'plugin' => 'Croogo/Users',
                        'controller' => 'Users',
                        'action' => 'view',
                        $reject->user_id
                    ]); ?>">
                        <p class="user-name"><?= $reject->user->name ?></p>
                    </a>
                    <p class="comment-date"><?= $reject->created->format('d.m.Y H:i') ?></p>
                </div>
                <?php
                if ($reject->is_deleted) {
                    ?>
                    <div class="user-comment"><?= __('Reject was deleted.'); ?></div>
                    <?php
                } else {
                    ?>
                    <div class="user-comment"><?= $reject->description; ?></div>
                    <?php
                    if ($this->request->getSession()->check('Auth.User.id')
                        && $userGlobalPermissions[UsersController::ROLE_EDITOR]) {
                        ?>
                        <a href="<?= $this->Url->build([
                            'plugin' => 'Notes',
                            'controller' => 'Rejects',
                            'action' => 'remove',
                            $reject->id,
                            '_ext' => 'json'
                        ]); ?>" class="reply link-remove"><?= __('Remove'); ?></a>
                        <?php
                    }
                }
                ?>
            </div>
            <?php
            foreach ($reject->rejects_comments as $rejectComment) {
                $rejectCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                if (!empty($rejectComment->user->image)) {
                    $rejectCommentUserPhoto = $rejectComment->user->image;
                }
                ?>
                <div class="comment-reply">
                    <a href="<?= $this->Url->build([
                        'plugin' => 'Croogo/Users',
                        'controller' => 'Users',
                        'action' => 'view',
                        $rejectComment->user_id
                    ]); ?>" class="user-info-inner">
                        <div class="user-img"
                             style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $rejectCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                    </a>
                    <div class="comment-inner">
                        <div class="comment-inner-top">
                            <a href="<?= $this->Url->build([
                                'plugin' => 'Croogo/Users',
                                'controller' => 'Users',
                                'action' => 'view',
                                $rejectComment->user_id
                            ]); ?>">
                                <p class="user-name"><?= $rejectComment->user->name ?></p>
                            </a>
                            <p class="comment-date"><?= $rejectComment->created->format('d.m.Y H:i') ?></p>
                            <?php
                            if ($rejectComment->is_edited) {
                                ?>
                                <p class="comment-edit"><?= __('Edited') ?></p>
                                <?php
                            }
                            ?>
                        </div>
                        <?php
                        if ($rejectComment->is_deleted) {
                            if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$rejectComment->is_deleted_by) {
                                ?>
                                <div class="user-comment"><?= __('Comment was deleted.'); ?></div>
                                <?php
                            } else {
                                ?>
                                <div
                                        class="user-comment"><?= __('Comment was deleted due to inappropriate content.'); ?></div>
                                <?php
                            }
                        } else {
                            ?>
                            <div class="user-comment"><?= $rejectComment->description; ?></div>
                            <?php
                            if ($this->request->getSession()->check('Auth.User.id')) {
                                if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$rejectComment->user_id) {
                                    ?>
                                    <a data-item="<?= $this->Url->build([
                                        'plugin' => 'Notes',
                                        'controller' => 'Rejects',
                                        'action' => 'editContent',
                                        $rejectComment->id,
                                        '_ext' => 'json'
                                    ]); ?>" href="<?= $this->Url->build([
                                        'plugin' => 'Notes',
                                        'controller' => 'Rejects',
                                        'action' => 'editComment',
                                        $rejectComment->id,
                                        '_ext' => 'json'
                                    ]); ?>" class="reply link-edit"><?= __('Edit'); ?></a>
                                    <?php
                                }
                            }
                            if ($this->request->getSession()->check('Auth.User.id')
                                && $userGlobalPermissions[UsersController::ROLE_EDITOR]) {
                                ?>
                                <a href="<?= $this->Url->build([
                                    'plugin' => 'Notes',
                                    'controller' => 'Rejects',
                                    'action' => 'removeComment',
                                    $rejectComment->id,
                                    '_ext' => 'json'
                                ]); ?>" class="reply link-remove"><?= __('Remove'); ?></a>
                                <?php
                            }
                        }
                        ?>
                    </div>
                    <?php
                    foreach ($rejectComment->sub_rejects_comments as $rejectSubComment) {
                        $rejectSubCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                        if (!empty($rejectSubComment->user->image)) {
                            $rejectSubCommentUserPhoto = $rejectSubComment->user->image;
                        }
                        ?>
                        <div class="comment-reply">
                            <a href="<?= $this->Url->build([
                                'plugin' => 'Croogo/Users',
                                'controller' => 'Users',
                                'action' => 'view',
                                $rejectSubComment->user_id
                            ]); ?>" class="user-info-inner">
                                <div class="user-img"
                                     style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $rejectSubCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                            </a>
                            <div class="comment-inner">
                                <div class="comment-inner-top">
                                    <a href="<?= $this->Url->build([
                                        'plugin' => 'Croogo/Users',
                                        'controller' => 'Users',
                                        'action' => 'view',
                                        $rejectSubComment->user_id
                                    ]); ?>">
                                        <p class="user-name"><?= $rejectSubComment->user->name ?></p>
                                    </a>
                                    <p class="comment-date">
                                        <?= $rejectSubComment->created->format('d.m.Y H:s') ?>
                                    </p>
                                    <?php
                                    if ($rejectSubComment->is_edited) {
                                        ?>
                                        <p class="comment-edit"><?= __('Edited') ?></p>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <?php
                                if ($rejectSubComment->is_deleted) {
                                    if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$rejectSubComment->is_deleted_by) {
                                        ?>
                                        <div class="user-comment"><?= __('Comment was deleted.'); ?></div>
                                        <?php
                                    } else {
                                        ?>
                                        <div
                                                class="user-comment"><?= __('Comment was deleted due to inappropriate content.'); ?></div>
                                        <?php
                                    }
                                } else {
                                    ?>
                                    <div class="user-comment"><?= $rejectSubComment->description; ?></div>
                                    <?php
                                    if ($this->request->getSession()->check('Auth.User.id')) {
                                        if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$rejectSubComment->user_id) {
                                            ?>
                                            <a data-item="<?= $this->Url->build([
                                                'plugin' => 'Notes',
                                                'controller' => 'Rejects',
                                                'action' => 'editContent',
                                                $rejectSubComment->id,
                                                '_ext' => 'json'
                                            ]); ?>" href="<?= $this->Url->build([
                                                'plugin' => 'Notes',
                                                'controller' => 'Rejects',
                                                'action' => 'editComment',
                                                $rejectSubComment->id,
                                                '_ext' => 'json'
                                            ]); ?>" class="reply link-edit"><?= __('Edit'); ?></a>
                                            <?php
                                        }
                                        ?>

                                    }
                                    if ($this->request->getSession()->check('Auth.User.id')
                                        && $userGlobalPermissions[UsersController::ROLE_EDITOR]) {
                                        ?>
                                        <a href="<?= $this->Url->build([
                                            'plugin' => 'Notes',
                                            'controller' => 'Rejects',
                                            'action' => 'removeComments',
                                            $rejectSubComment->id,
                                            '_ext' => 'json'
                                        ]); ?>" class="reply link-remove"><?= __('Remove'); ?></a>
                                        <?php
                                    }
                                }
                                ?>
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
        <?php
    }
    ?>
</div>
