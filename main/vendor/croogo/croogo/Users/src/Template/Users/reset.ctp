<?php

/**
 * @var $user
 */

?>
<div class="login-bg">
    <div class="overlay-bg"></div>
    <div class="container">
        <div class="login-page">
            <h1><?= __('Reset password'); ?></h1>

            <div class="login-page-form">
                <?= $this->Form->create($user, ['class' => 'login-form']); ?>
                <?= $this->Form->input('password', [
                    'label' => false,
                    'value' => '',
                    'placeholder' => __('New password')
                ]); ?>
                <?= $this->Form->input('verify_password', [
                    'type' => 'password',
                    'label' => false,
                    'placeholder' => __('Verify Password')
                ]); ?>
                <?= $this->Form->button(__('Reset'), [
                    'type' => 'submit',
                    'class' => 'btn'
                ]); ?>
                <?= $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>

