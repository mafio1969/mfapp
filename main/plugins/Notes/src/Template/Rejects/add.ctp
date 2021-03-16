<?php

use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $response
 */

if ($response['success']) {
    $commentUserPhoto = UserComponent::IMAGE_BLANK_USER;
    if (!empty($response['item']->user->image)) {
        $commentUserPhoto = $response['item']->user->image;
    }
    $output = '<div class="comment"><div class="user-img" style="background: url('
        . DS . UserComponent::IMAGE_PREFIX . DS . $commentUserPhoto . ') no-repeat center; background-size: cover;"></div>
            <div class="comment-inner"><div class="comment-inner-top"><p class="user-name">'
        . $response['item']->user->name . '</p><p class="comment-date">'
        . $response['item']->created->format('d.m.Y H:i') . '</p></div><p class="user-comment">'
        . $response['item']->description . '</p>
            <a href="' . $this->Url->build([
            'plugin' => 'Notes',
            'controller' => 'Rejects',
            'action' => 'comment',
            $response['item']->id
        ]) . '" class="reply link-comment">' . __('Reply') . '</a>
    </div>
    </div>';
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
