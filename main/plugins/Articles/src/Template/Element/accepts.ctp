<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $acceptEntity
 * @var $article
 * @var $userGlobalPermissions
 * @var $checkIfAlreadyAddedAccept
 */
?>
<?php
if ($this->request->getSession()->check('Auth.User.id')
    && (int)$this->request->getSession()->read('Auth.User.id') !== (int)$article->user_id
    && $userGlobalPermissions[UsersController::ROLE_ACCEPT]) {
    if (isset($checkIfAlreadyAddedAccept) && $checkIfAlreadyAddedAccept) {
        ?>
        <div class="add-comment">
            <div class="add-comment">
                <?= __('Accept already added.'); ?>
            </div>
        </div>
        <?php
    } elseif($this->Articles->voteTime($article->published)) {

        ?>
        <div class="add-comment">
            <div class="add-comment">
                <button type="button" class="btn" data-toggle="modal" data-target="#acceptModal"><?= __('Add accept') ?>
                </button>
            </div>
        </div>
        <?php
    }
}
?>
<div id="accepts-comments" class="comments">
    <?php
    foreach ($article->accepts as $accept) {
        $acceptUserPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($accept->user->image)) {
            $acceptUserPhoto = $accept->user->image;
        }
        ?>
        <div class="comment">
            <a href="<?= $this->Url->build([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'view',
                $accept->user_id
            ]); ?>" class="user-info-inner">
                <div class="user-img"
                     style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $acceptUserPhoto ?>) no-repeat center; background-size: cover;"></div>
            </a>
            <div class="comment-inner">
                <div class="comment-inner-top">
                    <a href="<?= $this->Url->build([
                        'plugin' => 'Croogo/Users',
                        'controller' => 'Users',
                        'action' => 'view',
                        $accept->user_id
                    ]); ?>">
                        <p class="user-name"><?= isset($accept->user->name) ? $accept->user->name : __('Deleted user') ?></p>
                    </a>
                    <p class="comment-date"><?= $accept->created->format('d.m.Y H:s') ?></p>
                    <div class="user-comment"><?= __('Accepted.') ?></div>
                </div>
                <?php
                if (false) {
                    ?>
                    <div class="user-comment"><?= $accept->description; ?></div>
                    <a href="<?= $this->Url->build([
                        'plugin' => 'Notes',
                        'controller' => 'Accepts',
                        'action' => 'comment',
                        $accept->id
                    ]); ?>" class="reply link-comment"><?= __('Reply'); ?></a>
                    <a href="<?= $this->Url->build([
                        'plugin' => 'Reports',
                        'controller' => 'Reports',
                        'action' => 'accept',
                        $accept->id,
                        '_ext' => 'json'
                    ]); ?>" class="reply link-report"><?= __('Report'); ?></a>
                    <?php
                }
                ?>
            </div>
            <?php
            if (false) {
                foreach ($accept->accepts_comments as $acceptComment) {
                    $acceptCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                    if (!empty($acceptComment->user->image)) {
                        $acceptCommentUserPhoto = $acceptComment->user->image;
                    }
                    ?>
                    <div class="comment-reply">
                        <a href="<?= $this->Url->build([
                            'plugin' => 'Croogo/Users',
                            'controller' => 'Users',
                            'action' => 'view',
                            $acceptComment->user_id
                        ]); ?>" class="user-info-inner">
                            <div class="user-img"
                                 style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $acceptCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                        </a>
                        <div class="comment-inner">
                            <div class="comment-inner-top">
                                <p class="user-name"><?= isset($acceptComment->user->name) ? $acceptComment->user->name : __('Deleted user') ?></p>
                                <p class="comment-date"><?= $acceptComment->created->format('d.m.Y H:s') ?></p>
                            </div>
                            <?php
                            if (false) {
                                ?>
                                <div class="user-comment"><?= $acceptComment->description; ?></div>
                                <a href="<?= $this->Url->build([
                                    'plugin' => 'Notes',
                                    'controller' => 'Accepts',
                                    'action' => 'comments',
                                    $acceptComment->id
                                ]); ?>" class="reply link-comment"><?= __('Reply'); ?></a>
                                <a href="<?= $this->Url->build([
                                    'plugin' => 'Reports',
                                    'controller' => 'Reports',
                                    'action' => 'acceptComment',
                                    $acceptComment->id,
                                    '_ext' => 'json'
                                ]); ?>" class="reply link-report"><?= __('Report'); ?></a>
                                <?php
                            }
                            ?>
                        </div>
                        <?php
                        foreach ($acceptComment->sub_accepts_comments as $acceptSubComment) {
                            $acceptSubCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                            if (!empty($acceptSubComment->user->image)) {
                                $acceptSubCommentUserPhoto = $acceptSubComment->user->image;
                            }
                            ?>
                            <div class="comment-reply">
                                <a href="<?= $this->Url->build([
                                    'plugin' => 'Croogo/Users',
                                    'controller' => 'Users',
                                    'action' => 'view',
                                    $acceptSubComment->user_id
                                ]); ?>" class="user-info-inner">
                                    <div class="user-img"
                                         style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $acceptSubCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                                </a>
                                <div class="comment-inner">
                                    <div class="comment-inner-top">
                                        <p class="user-name"><?= $acceptSubComment->user->name ?></p>
                                        <p class="comment-date">
                                            <?= $acceptSubComment->created->format('d.m.Y H:s') ?>
                                        </p>
                                    </div>
                                    <?php
                                    if (false) {
                                        ?>
                                        <div class="user-comment"><?= $acceptSubComment->description; ?></div>
                                        <a href="<?= $this->Url->build([
                                            'plugin' => 'Reports',
                                            'controller' => 'Reports',
                                            'action' => 'acceptComment',
                                            $acceptSubComment->id,
                                            '_ext' => 'json'
                                        ]); ?>" class="reply link-report"><?= __('Report'); ?></a>
                                        <?php
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
            }
            ?>
        </div>
        <?php
    }
    ?>
</div>
<script>
    $(document).ready(function () {
        contentView.bindModalForm("#form-accept", "#form-accept-submit");
    });
</script>
