<?php

use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Reports\Controller\ReportsController;

/**
 * @var $success
 * @var $notes
 * @var $userGlobalPermissions
 */

if ($success) {
    $output = '';
    foreach ($notes as $note) {
        $noteUserPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($note->user->image)) {
            $noteUserPhoto = $note->user->image;
        }
        $output .= '<div class="comment"><div class="user-img" style="background: url('
            . DS . UserComponent::IMAGE_PREFIX . DS . $noteUserPhoto . ') no-repeat center; background-size: cover;"></div><div class="comment-inner"><div class="comment-inner-top"><p class="user-name">'
            . $note->user->name . '</p><p class="comment-date">'
            . $note->created->format('d.m.Y H:s') . '</p></div>';
        if ($note->is_deleted) {
            $output .= '<div class="user-comment">' . __('Comment was deleted.') . '</div>';
        } else {
            $output .= '<div class="user-comment">'
                . $note->description . '</div>';
            if ($this->request->getSession()->check('Auth.User.id')) {
                $output .= $this->element('vote_button', [
                    'voteComment' => $note
                ]);
                $output .= '<a href="' . $this->Url->build([
                        'plugin' => 'Notes',
                        'controller' => 'Notes',
                        'action' => 'comment',
                        $note->id,
                        '_ext' => 'json'
                    ]) . '" class="reply link-comment">' . __('Reply') . '</a><a href="' . $this->Url->build([
                        'plugin' => 'Reports',
                        'controller' => 'Reports',
                        'action' => 'comment',
                        $note->id,
                        ReportsController::REPORT_CONTENT_TYPE_COMMENT_NEWS,
                        '_ext' => 'json'
                    ]) . '" class="reply link-report">' . __('Report') . '</a>';
            } else {
                $output .= '<a disabled="disabled" class="reply" title="'
                    . __('Only for registered users') . '">' . __('Reply') . '</a>';
            }
            if (($this->request->getSession()->check('Auth.User.id')
                    && $userGlobalPermissions[UsersController::ROLE_EDITOR])
                || ((int)$this->request->getSession()->read('Auth.User.id') === (int)$note->user_id
                    && time() - strtotime($note->created) < DAY)) {
                $output .= '<a href="' . $this->Url->build([
                        'plugin' => 'Notes',
                        'controller' => 'Notes',
                        'action' => 'remove',
                        $note->id,
                        '_ext' => 'json'
                    ]) . '" class="reply link-remove">' . __('Remove') . '</a>';
            }
        }
        $output .= '</div>';

        foreach ($note->first_notes as $noteComment) {
            $noteCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
            if (!empty($noteComment->user->image)) {
                $noteCommentUserPhoto = $noteComment->user->image;
            }
            $output .= '<div class="comment-reply"><div class="user-img" style="background: url('
                . DS . UserComponent::IMAGE_PREFIX . DS . $noteCommentUserPhoto . ') no-repeat center; background-size: cover;"></div><div class="comment-inner"><div class="comment-inner-top"><p class="user-name">'
                . $noteComment->user->name . '</p><p class="comment-date">'
                . $noteComment->created->format('d.m.Y H:s') . '</p></div>';
            if ($noteComment->is_deleted) {
                $output .= '<div class="user-comment">' . __('Comment was deleted.') . '</div>';
            } else {
                $output .= '<div class="user-comment">'
                    . $noteComment->description . '</div>';
                if ($this->request->getSession()->check('Auth.User.id')) {
                    $output .= $this->element('vote_button', [
                        'voteComment' => $noteComment
                    ]);
                    $output .= '<a href="'
                        . $this->Url->build([
                            'plugin' => 'Notes',
                            'controller' => 'Notes',
                            'action' => 'comments',
                            $noteComment->id,
                            '_ext' => 'json'
                        ]) . '" class="reply link-comment">'
                        . __('Reply') . '</a><a href="' . $this->Url->build([
                            'plugin' => 'Reports',
                            'controller' => 'Reports',
                            'action' => 'comment',
                            $noteComment->id,
                            ReportsController::REPORT_CONTENT_TYPE_COMMENT_COMMENT,
                            '_ext' => 'json'
                        ]) . '" class="reply link-report">' . __('Report') . '</a>';
                } else {
                    $output .= '<a disabled="disabled" class="reply" title="'
                        . __('Only for registered users') . '">' . __('Reply') . '</a>';
                }
                if (($this->request->getSession()->check('Auth.User.id')
                        && $userGlobalPermissions[UsersController::ROLE_EDITOR])
                    || ((int)$this->request->getSession()->read('Auth.User.id') === (int)$noteComment->user_id
                        && time() - strtotime($noteComment->created) < DAY)) {
                    $output .= '<a href="' . $this->Url->build([
                            'plugin' => 'Notes',
                            'controller' => 'Notes',
                            'action' => 'removeComment',
                            $noteComment->id,
                            '_ext' => 'json'
                        ]) . '" class="reply link-remove">' . __('Remove') . '</a>';
                }
                if ($this->request->getSession()->read('Auth.User.id')) {
                    ?>
                    <?= $this->Html->link(__('Subscribe'),
                        [
                            'plugin' => 'Subscriptions',
                            'controller' => 'Subscriptions',
                            'action' => 'addCommentSubscription',
                            $noteComment->id,
                            '_ext' => 'json'
                        ], [
                            'class' => 'reply subscription-comment',
                            'title' => 'add subscription'
                        ]
                    ); ?>
                    <?php
                }
            }
            $output .= '</div>';
            foreach ($noteComment->second_notes as $noteSubComment) {
                $noteSubCommentUserPhoto = UserComponent::IMAGE_BLANK_USER;
                if (!empty($noteSubComment->user->image)) {
                    $noteSubCommentUserPhoto = $noteSubComment->user->image;
                }
                $output .= '<div class="comment-reply"><div class="user-img" style="background: url('
                    . DS . UserComponent::IMAGE_PREFIX . DS . $noteSubCommentUserPhoto .
                    ') no-repeat center; background-size: cover;"></div><div class="comment-inner"><div class="comment-inner-top"><p class="user-name">'
                    . $noteSubComment->user->name . '</p><p class="comment-date">'
                    . $noteSubComment->created->format('d.m.Y H:s') . '</p></div>';
                if ($noteSubComment->is_deleted) {
                    $output .= '<div class="user-comment">' . __('Comment was deleted.') . '</div>';
                } else {
                    if ($this->request->getSession()->check('Auth.User.id')) {
                        $output .= '<div class="user-comment">'
                            . $noteSubComment->description . '</div>';
                        $output .= $this->element('vote_button', [
                            'voteComment' => $noteSubComment
                        ]);
                        $output .= '<a href="' . $this->Url->build([
                                'plugin' => 'Reports',
                                'controller' => 'Reports',
                                'action' => 'comment',
                                $noteSubComment->id,
                                ReportsController::REPORT_CONTENT_TYPE_COMMENT_COMMENT,
                                '_ext' => 'json'
                            ]) . '" class="reply link-report">' . __('Report') . '</a>';
                    }
                    if (($this->request->getSession()->check('Auth.User.id')
                            && $userGlobalPermissions[UsersController::ROLE_EDITOR])
                        || ((int)$this->request->getSession()->read('Auth.User.id') === (int)$noteSubComment->user_id
                            && time() - strtotime($noteSubComment->created) < DAY)) {
                        $output .= '<a href="' . $this->Url->build([
                                'plugin' => 'Notes',
                                'controller' => 'Notes',
                                'action' => 'removeComments',
                                $noteSubComment->id,
                                '_ext' => 'json'
                            ]) . '" class="reply link-remove">' . __('Remove') . '</a>';
                    }
                }
                $output .= '</div></div>';
            }
            $output .= '</div>';
        }
        $output .= '</div>';
    }
    $pageUrl = '';
    if ($this->Paginator->hasNext()) {
        $pageUrl = $this->Paginator->generateUrl(['page' => (int)$this->Paginator->current() + 1]);
    }
    echo json_encode(compact(['success', 'output', 'pageUrl']));
} else {
    echo json_encode(compact(['success', 'message']));
}
