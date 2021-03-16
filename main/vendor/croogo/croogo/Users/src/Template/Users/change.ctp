<?php

/**
 * @var $user
 */

?>
<div class="articles-list-page">
    <div class="user-page settings-page">
        <?= $this->element('Croogo/Users.setting_navigation') ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="change-password">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Change password') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="change-password">
                            <?php
                            echo $this->Form->create($user);
                            echo $this->Form->input('old_password', [
                                'placeholder' => __('Current password'),
                                'label' => false,
                                'type' => 'password',
                                'value' => '',
                                'required' => true
                            ]);
                            echo $this->Form->input('password', [
                                'placeholder' => __('New password'),
                                'label' => false,
                                'value' => ''
                            ]);
                            echo $this->Form->input('verify_password', [
                                'placeholder' => __('Repeat new password'),
                                'label' => false,
                                'type' => 'password',
                                'required' => true
                            ]);
                            echo $this->Form->submit(__('Save'), [
                                'class' => 'btn'
                            ]);
                            echo $this->Form->end();
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
