<?php

use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $reviewEntity
 * @var $article
 */

?>
<div class="add-comment">
    <?php
    echo $this->Form->create($reviewEntity, [
        'url' => [
            'plugin' => 'Notes',
            'controller' => 'Reviews',
            'action' => 'add',
            $article->id
        ],
        'id' => 'form-review'
    ]);
    echo $this->Form->input('description',
        [
            'required' => true,
            'type' => 'textarea',
            'label' => [
                'text' => __('Add review')
            ],
            'id' => 'review-description'
        ]
    );
    echo $this->Form->button(__('Add'), [
        'type' => 'submit',
        'class' => 'submit-form',
        'id' => 'form-review-submit'
    ]);
    echo $this->Form->end();
    ?>
</div>
<div id="reviews-comments" class="comments">
    <?php
    foreach ($article->reviews as $review) {
        $reviewUserPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($review->user->image)) {
            $reviewUserPhoto = $review->user->image;
        }
        ?>
        <div class="comment">
            <div class="user-img"
                 style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $reviewUserPhoto ?>) no-repeat center; background-size: cover;"></div>
            <div class="comment-inner">
                <div class="comment-inner-top">
                    <p class="user-name"><?= $review->user->name ?></p>
                    <p class="comment-date"><?= $review->created->format('d.m.Y H:i') ?></p>
                </div>
                <p class="user-comment"><?= $review->description; ?></p>
                <a href="<?= $this->Url->build([
                    'plugin' => 'Notes',
                    'controller' => 'Reviews',
                    'action' => 'comment',
                    $review->id
                ]); ?>" class="reply link-comment"><?= __('Reply'); ?></a>
            </div>
            <?php
            foreach ($review->reviews_comments as $reviewComment) {
                $reviewCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                if (!empty($reviewComment->user->image)) {
                    $reviewCommentUserPhoto = $reviewComment->user->image;
                }
                ?>
                <div class="comment-reply">
                    <div class="user-img"
                         style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $reviewCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                    <div class="comment-inner">
                        <div class="comment-inner-top">
                            <p class="user-name"><?= $reviewComment->user->name ?></p>
                            <p class="comment-date"><?= $reviewComment->created->format('d.m.Y H:i') ?></p>
                        </div>
                        <p class="user-comment"><?= $reviewComment->description; ?></p>
                        <a href="<?= $this->Url->build([
                            'plugin' => 'Notes',
                            'controller' => 'Reviews',
                            'action' => 'comments',
                            $reviewComment->id
                        ]); ?>" class="reply link-comment"><?= __('Reply'); ?></a>
                        <a href="<?= $this->Url->build([
                            'plugin' => 'Reports',
                            'controller' => 'Reports',
                            'action' => 'reviewComment',
                            $reviewComment->id,
                            '_ext' => 'json'
                        ]); ?>" class="reply link-report"><?= __('Report'); ?></a>
                    </div>
                    <?php
                    foreach ($reviewComment->sub_reviews_comments as $reviewSubComment) {
                        $reviewSubCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                        if (!empty($reviewSubComment->user->image)) {
                            $reviewSubCommentUserPhoto = $reviewSubComment->user->image;
                        }
                        ?>
                        <div class="comment-reply">
                            <div class="user-img"
                                 style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $reviewSubCommentUserPhoto ?>) no-repeat center; background-size: cover;"></div>
                            <div class="comment-inner">
                                <div class="comment-inner-top">
                                    <p class="user-name"><?= $reviewSubComment->user->name ?></p>
                                    <p class="comment-date">
                                        <?= $reviewSubComment->created->format('d.m.Y H:i') ?>
                                    </p>
                                </div>
                                <p class="user-comment"><?= $reviewSubComment->description; ?></p>
                                <a href="<?= $this->Url->build([
                                    'plugin' => 'Reports',
                                    'controller' => 'Reports',
                                    'action' => 'reviewComment',
                                    $reviewComment->id,
                                    '_ext' => 'json'
                                ]); ?>" class="reply link-report"><?= __('Report'); ?></a>
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
