<?php

use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $counterReportsUser
 */

?>
<header class="navbar-wrapper navbar navbar-static-top bs-docs-nav">
    <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <?= $this->Html->link(
            '<img src="/img/logo.png" title="Logo" alt="CCFOUND Logo"/>',
            ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'main'],
            ['class' => 'navbar-brand']
        ); ?>
        <!--[if lt IE 9]>
        <?= $this->Html->link(
        '<img src="/img/logo.png" title="Logo" alt="CCFOUND Logo"/>',
        ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'main'],
        ['class' => 'navbar-brand2']
        ); ?>
        <![endif]-->
    </div>
    <div class="navbar-collapse bs-navbar-collapse collapse" role="navigation" style="height: auto;">
        <div id="menu">
            <ul>
                <?php if ($this->request->getSession()->read('Auth.User.id')) { ?>
                    <?= $this->element('user_header') ?>
                <?php } ?>
                <?php if ($this->request->getSession()->read('Auth.User.id')) { ?>
                <?php } else { ?>
                    <li>
                        <?= $this->Html->link(
                            __('Login'),
                            ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'login']
                        ); ?>
                    </li>
                    <li>
                        <?= $this->Html->link(
                            __('Register'),
                            ['plugin' => 'Subscriptions', 'controller' => 'Subscriptions', 'action' => 'add']
                        ); ?>
                    </li>
                    <?php
                    if (UsersController::DISABLE_REGISTER) {
                        ?>
                        <li>
                            <?= $this->Html->link(
                                __('Register'),
                                ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'add']
                            ); ?>
                        </li>
                        <?php
                    }
                } ?>
            </ul>
        </div>
        <div class="topRight">
            <div class="search">
                <?php
                echo $this->Form->create(null, [
                    'type' => 'GET',
                    'novalidate' => true,
                    'url' => [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'search',
                    ],
                ]);
                echo $this->Form->input('', [
                    'required' => 'required',
                    'type' => 'text',
                    'name' => 'q',
                    'class' => 'form-control',
                    'label' => false,
                    'placeholder' => __('Search'),
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ]
                ]);
                echo $this->Form->submit('', [
                    'class' => 'searchBtn'
                ]);
                echo $this->Form->end();
                ?>
            </div>
            <?php if ($this->request->getSession()->read('Auth.User.id')) { ?>
                <?php
                $counterReports = (int)$counterReportsUser['user'] > 0 ? $counterReportsUser['user'] : '';
                $userPhoto = UserComponent::IMAGE_BLANK_USER;
                $counterReportsShow = (int)$counterReportsUser['user'] > 0 ? '<span id="counter-reports-header" class="counter-reports">' . $counterReports . '</span>' : '';
                if (!empty($this->request->getSession()->read('Auth.User.image'))) {
                    $userPhoto = $this->request->getSession()->read('Auth.User.image');
                }
                echo $this->Html->link('<span class="menu-profile-img"
                          style="background: url(' . DS . UserComponent::IMAGE_PREFIX . DS . $userPhoto . ') no-repeat center; background-size: cover;">
                    </span>' . $this->request->getSession()->read('Auth.User.name') . $counterReportsShow,
                    ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'general'],
                    ['class' => 'menu-profile notranslate']);
                ?>
                <?= $this->Html->link(
                    __('Logout'),
                    ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'logout']
                ); ?>


            <?php } ?>
        </div>
        <?= $this->element('language_switcher') ?>
    </div>
</header>
<script>
    $(function () {
        $('.lg-sw').on('click', function (e) {
            e.preventDefault();
            document.cookie = "dataLg=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            document.cookie = "dataLg=" + $(this).data('lg') + "; path=/";
            document.location = $(this).attr("href");
        })
    });
</script>
