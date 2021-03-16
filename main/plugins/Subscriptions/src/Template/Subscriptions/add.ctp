<?php

/**
 * @var $subscription
 */

$this->assign('title', __('Registration'));
?>
<div class="login-bg">
    <div class="overlay-bg"></div>
    <div class="container">
        <div class="login-page subscription-page">
            <h1><?= __('Register'); ?></h1>
            <p><?= __('ccfound is currently in a closed beta. Registration is open for people with invitation only. To receive an invitation, contact people you know that have access to ccfound. You may also join us by subscribing to the early bird list and be one of the first people to receive a notification when ccfound is open to the public!'); ?></p>
            <div class="login-page-form">
                <?php
                echo $this->Form->create($subscription, [
                    'class' => 'login-form',
                    'id' => 'subscription-form',
                    'novalidate'
                ]);
                echo $this->Form->input('language', [
                    'type' => 'hidden',
                    'value' => $this->request->getParam('lang')
                ]);
                echo $this->Form->input('email', [
                    'type' => 'email',
                    'label' => false,
                    'templates' => [
                        'inputContainer' => '{{content}}'
                    ],
                    'placeholder' => __('E-mail'),
                    'data-error' => __('Please enter a valid email.'),
                    'required'
                ]);

                echo '<label class="checkbox-label">';
                    echo $this->Form->checkbox('rodo', [
                        'type' => 'checkbox',
                        'label' => true,
                        'data-error' => __('You must select agreement.'),
                        'required'
                    ]);
                    echo '<p>'.__('I want to join the community and will receive ccfound newsletter. I accept');
                    echo ' '.$this->Html->link(__('privacy policy'), [
                                'plugin' => 'Croogo/Users',
                                'controller' => 'Users',
                                'action' => 'policy',
                            ]).'.</p>';
                echo '</label>';
                echo '<div class="rodo-error text-danger"></div>';
                echo $this->Form->button(__('Register'), [
                    'type' => 'submit',
                    'class' => 'btn'
                ]);
                echo $this->Form->end();
                ?>
            </div>
        </div>
    </div>
</div>
