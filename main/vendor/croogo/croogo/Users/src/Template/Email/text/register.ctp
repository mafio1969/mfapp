<?php

use Cake\Routing\Router;

/**
 * @var $user
 */

echo __('Hello') . ' ' . $user->name; ?>,

<?php
echo __('Please visit this link to activate your account:')
    . ' ' . Router::url([
        'prefix' => false,
        'plugin' => 'Croogo/Users',
        'controller' => 'Users',
        'action' => 'activate',
        $user->activation_key
    ], true);
echo __('If link is not clickable, copy and paste it into the address bar.');
