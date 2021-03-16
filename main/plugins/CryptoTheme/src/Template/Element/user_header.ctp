<?php

/**
 * @var $allCommentsCounters
 * @var $newContentCommentsCounters
 * @var $userGlobalPermissions
 * @var $counterReportsUser
 */

use Croogo\Users\Controller\UsersController;

?>
    <li>
        <?= $this->Html->link(
            __('My content'),
            ['plugin' => 'Articles', 'controller' => 'Articles', 'action' => 'index'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <li>
        <?= $this->Html->link(
            __('Inbox') . '
<span>' . $allCommentsCounters . '</span>',
            ['plugin' => 'Notices', 'controller' => 'Notices', 'action' => 'index'],
            ['class' => 'nav-link']
        ); ?>
    </li>
<?php
if ($userGlobalPermissions[UsersController::ROLE_ACCEPT]) {
    ?>
    <li>
        <?= $this->Html->link(
            __('New contents') . '
<span>' . $newContentCommentsCounters . '</span>',
            ['plugin' => 'Notices', 'controller' => 'Notices', 'action' => 'latest'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <?php
}
?>
<?php
if ($userGlobalPermissions[UsersController::ROLE_EDITOR]) {
    ?>
    <li>
        <?= $this->Html->link(
            __('Categories'),
            ['plugin' => 'Categories', 'controller' => 'Categories', 'action' => 'index'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <?php
}
if ($userGlobalPermissions[UsersController::ROLE_BLOCKED_II] || $userGlobalPermissions[UsersController::ROLE_GIVE_PERMISSION_II]) {
    ?>
    <li>
        <?= $this->Html->link(
            __('Users'),
            ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'index'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <li>
        <?= $this->Html->link(
            __('Emails'),
            ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'mails'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <?php
}
if ($userGlobalPermissions[UsersController::ROLE_SET_BANNER]) {
    ?>
    <li>
        <?= $this->Html->link(
            __('Banners'),
            ['plugin' => 'Banners', 'controller' => 'Banners', 'action' => 'index'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <?php
}

if ($userGlobalPermissions[UsersController::ROLE_NEWSLETTER_ACCEPT]) {
    ?>
    <li>
        <?= $this->Html->link(
            __('Newsletter'),
            ['plugin' => 'Newsletter', 'controller' => 'Newsletter', 'action' => 'index'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <?php
}

if ($userGlobalPermissions[UsersController::ROLE_SETTLE_I] || $userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
    ?>
    <li>
        <?= $this->Html->link(
            __('Reports') . '<span>' . $counterReportsUser['moderator'] . '</span>',
            ['plugin' => 'Reports', 'controller' => 'Reports', 'action' => 'waiting'],
            ['class' => 'nav-link']
        ); ?>
    </li>
    <?php
}
