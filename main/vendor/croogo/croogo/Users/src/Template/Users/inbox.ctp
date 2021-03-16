<?php

use Croogo\Users\Controller\Component\UserComponent;
use Notices\Controller\NoticesController;

/**
 * @var $user
 * @var $socialProfileExists
 */

?>
<div class="articles-list-page">
    <div class="user-page settings-page">
        <?= $this->element('Croogo/Users.setting_navigation') ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="inbox">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Inbox settings') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <?php
                        echo $this->Form->create($user);
                        foreach ($attributes as $attribute) {
                            $inboxChecked = $mailChecked = false;
                            if ((string)$attribute['name'] !== 'newsletter'
                                && $user->settings[$attribute['name']]['inbox']) {
                                $inboxChecked = 'checked';
                            }
                            if ($user->settings[$attribute['name']]['mail']) {
                                $mailChecked = 'checked';
                            }
                            ?>
                            <div class="form-item">
                                <h4><?= __($attribute['label']); ?></h4>
                                <div class="form-group checkbox">
                                    <?php
                                    if ((string)$attribute['name'] !== 'newsletter') {
                                        ?>
                                        <label for="<?= 'settings-' . $attribute['name'] . '-inbox' ?>">
                                            <?php
                                            echo $this->Form->input('settings.' . $attribute['name'] . '.inbox', [
                                                'label' => false,
                                                'id' => 'settings-' . $attribute['name'] . '-inbox',
                                                'type' => 'checkbox',
                                                'class' => $inboxChecked,
                                                'templates' => [
                                                    'checkboxContainer' => '{{content}}'
                                                ]
                                            ]);
                                            ?>
                                            <?= __('Inbox') ?></label>
                                        <?php
                                    }
                                    ?>
                                    <label for="<?= 'settings-' . $attribute['name'] . '-mail' ?>">
                                        <?php
                                        echo $this->Form->input('settings.' . $attribute['name'] . '.mail', [
                                            'label' => false,
                                            'id' => 'settings-' . $attribute['name'] . '-mail',
                                            'type' => 'checkbox',
                                            'class' => 'settings-email ' . $mailChecked,
                                            'templates' => [
                                                'checkboxContainer' => '{{content}}'
                                            ]
                                        ]);
                                        ?>
                                        <?= __('Email') ?></label>
                                </div>
                                <div class="form-group select emailSelect">
                                    <?php
                                    echo $this->Form->input('settings.' . $attribute['name'] . '.frequency', [
                                        'type' => 'select',
                                        'options' => [
                                            NoticesController::INBOX_EMAIL_FREQUENCY_DAY => __('Every day'),
                                            NoticesController::INBOX_EMAIL_FREQUENCY_WEEK => __('Every week')
                                        ],
                                        'label' => false
                                    ]);
                                    ?>
                                </div>
                            </div>
                            <?php
                        }
                        echo $this->Form->submit(__('Save'), ['class' => 'btn']);
                        echo $this->Form->end();
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
