<?php

/**
 * @var $user
 */

$this->assign('title', __('Registration'));
?>
<div class="login-bg">
    <div class="overlay-bg"></div>
    <div class="container">
        <div class="login-page">
            <h1><?= __('Register'); ?></h1>
            <div id="closePortal" class="message error hidden" onclick="this.classList.add('hidden');" >
                <?= __('ccfound is currently in a closed beta. Registration is open for people with invitation only. To receive an invitation, contact people you know that have access to ccfound. You may also join us by subscribing to the early bird list and be one of the first people to receive a notification when ccfound is open to the public!'); ?>
            </div>
                <div class="login-page-form">

                <?php
                echo $this->Form->create($user, ['class' => 'login-form']);
                echo $this->Form->input('username', [
                    'type' => 'email',
                    'label' => false,
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ],
                    'placeholder' => __('Email')
                ]);
                echo $this->Form->input('name', [
                    'label' => false,
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ],
                    'placeholder' => __('Username')
                ]);
                echo $this->Form->input('password', [
                    'value' => '',
                    'label' => false,
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ],
                    'placeholder' => __('Password')
                ]);
                echo $this->Form->input('verify_password', [
                    'type' => 'password',
                    'value' => '',
                    'label' => false,
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ],
                    'placeholder' => __('Verify password')
                ]);
                echo $this->Form->button(__('Register'), [
                    'type' => 'submit',
                    'class' => 'btn'
                ]);
                echo $this->Form->end();
                ?>
            </div>
            <div class="login-social">
                <?= $this->Form->postLink(
                    'Register with Facebook',
                    [
                        'prefix' => false,
                        'plugin' => 'ADmad/SocialAuth',
                        'controller' => 'Auth',
                        'action' => 'login',
                        'provider' => 'facebook',
                        '?' => ['redirect' => $this->request->getQuery('redirect')]
                    ], ['class' => 'btn btn-facebook btn-social']
                ); ?>
                <?= $this->Form->postLink(
                    'Register with Google',
                    [
                        'prefix' => false,
                        'plugin' => 'ADmad/SocialAuth',
                        'controller' => 'Auth',
                        'action' => 'login',
                        'provider' => 'google',
                        '?' => ['redirect' => $this->request->getQuery('redirect')]
                    ], ['class' => 'btn btn-google btn-social']
                ); ?>
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">
    $('.btn-social').on("click", function (e) {
        e.preventDefault();
        $('#closePortal').removeClass('hidden');
    });
</script>
