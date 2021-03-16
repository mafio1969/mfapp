<?php

echo __('Hello %s', $user->name) ?>,


<?php
$url = $this->Url->build([
    'plugin' => 'Croogo/Users',
    'controller' => 'Users',
    'action' => 'reset',
    $user->username,
    $user->activation_key,
], true);
echo __('Please visit this link to reset your password: %s', $url);
?>


<?= __('If you did not request a password reset, then please ignore this email.') ?>
