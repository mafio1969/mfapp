<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $response
 * @var $userGlobalPermissions
 */

if ($response['success']) {
    if ((int)$response['type_id'] === ArticlesController::TYPE_ARTICLE) {
        $commentUserPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($response['item']->user->image)) {
            $commentUserPhoto = $response['item']->user->image;
        }
        $output = '<div class="comment-reply"><a href="' . $this->Url->build([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'view',
                $response['item']->user->id
            ]) . '" class="user-info-inner"><div class="user-img" style="background: url('
            . DS . UserComponent::IMAGE_PREFIX . DS . $commentUserPhoto . ') no-repeat center; background-size: cover;"></div></a>
            <div class="comment-inner"><div class="comment-inner-top"><p class="user-name">'
            . $response['item']->user->name . '</p><p class="comment-date">'
            . $response['item']->created->format('d.m.Y H:i') . '</p></div><p class="user-comment">'
            . $response['item']->description . '</p>
            <a href="' . $this->Url->build([
                'plugin' => 'Notes',
                'controller' => 'Notes',
                'action' => 'comments',
                $response['item']->id
            ]) . '" class="reply link-comment">' . __('Reply') . '</a>';
        if ((int)$this->request->getSession()->read('Auth.User.id') === (int)$response['item']->user_id) {
            $output .= '<a data-item="' . $this->Url->build([
                    'plugin' => 'Notes',
                    'controller' => 'Notes',
                    'action' => 'editContent',
                    $response['item']->id,
                    '_ext' => 'json'
                ]) . '" href="' . $this->Url->build([
                    'plugin' => 'Notes',
                    'controller' => 'Notes',
                    'action' => 'editNote',
                    $response['item']->id,
                    '_ext' => 'json'
                ]) . '" class="reply link-edit">' . __('Edit') . '</a>';
        }
        $output .= '<a href="' . $this->Url->build([
                'plugin' => 'Reports',
                'controller' => 'Reports',
                'action' => 'commentComment',
                $response['item']->id,
                '_ext' => 'json'
            ]) . '" class="reply link-report" > ' . __('Report') . ' </a >
    </div >
    </div > ';
        echo json_encode([
            'output' => $output,
            'success' => $response['success'],
            'comments' => $response['comments'],
            'message' => $response['message']
        ]);
    } else {
        echo json_encode([
            'success' => $response['success'],
            'message' => $response['message']
        ]);
    }
} else {
    echo json_encode([
        'success' => $response['success'],
        'message' => $response['message']
    ]);
}

