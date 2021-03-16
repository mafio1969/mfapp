<?php
$this->assign('title', __('Login'));
?>
<div id="closePortal" class="message error hidden" onclick="this.classList.add('hidden');" >
    <?= __('ccfound is currently in a closed beta. Registration is open for people with invitation only. To receive an invitation, contact people you know that have access to ccfound. You may also join us by subscribing to the early bird list and be one of the first people to receive a notification when ccfound is open to the public!'); ?>
</div>
<div class="login-bg">
    <div class="overlay-bg"></div>
    <div class="container">
        <div class="login-page">
            <h1><?= __('Login'); ?></h1>
            <div class="login-page-form">
                <?php
                echo $this->Form->create(false, [
                    'url' => ['action' => 'login'],
                    'class' => 'login-form'
                ]);
                echo $this->Form->input('username', [
                    'type' => 'email',
                    'label' => false,
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ],
                    'placeholder' => __('E-mail'),
                    'required'
                ]);
                echo $this->Form->input('password', [
                    'label' => false,
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ],
                    'placeholder' => __('Password'),
                    'required'
                ]);
                echo $this->Form->button(__('Login'), [
                    'type' => 'submit',
                    'class' => 'btn'
                ]);
                echo $this->Form->end();
                ?>
                <div class="forgot-password-content">
                    <?= $this->Html->link(
                        __('Forgot password?'),
                        ['controller' => 'Users', 'action' => 'forgot'],
                        ['class' => 'forgot-password']
                    ) ?>
                </div>
            </div>
            <div class="login-social">
<!--<?//= $this->Form->postLink(
//                    __('Login with Facebook'),
//                    [
//                        'prefix' => false,
//                        'plugin' => 'ADmad/SocialAuth',
//                        'controller' => 'Auth',
//                        'action' => 'login',
//                        'provider' => 'facebook',
//                        '?' => ['redirect' => $this->request->getQuery('redirect')]
//                    ], ['class' => 'btn btn-facebook btn-social']
//                ); ?>-->
                <a href="#" class="btn btn-facebook btn-social"><?= __('Login with Facebook') ?></a>
                <a href="#" class="btn btn-google btn-social"><?= __('Login with Google') ?></a>

                <!--<?//= $this->Form->postLink(
                //                    __('Login with Google'),
                //                    [
                //                        'prefix' => false,
                //                        'plugin' => 'ADmad/SocialAuth',
                //                        'controller' => 'Auth',
                //                        'action' => 'login',
                //                        'provider' => 'google',
                //                        '?' => ['redirect' => $this->request->getQuery('redirect')]
                //                    ], ['class' => 'btn btn-google btn-social']
                //                ); ?>-->
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">
    $('.btn-social').on("click", function (e) {
        $('#closePortal').removeClass('hidden');
    });
</script>
