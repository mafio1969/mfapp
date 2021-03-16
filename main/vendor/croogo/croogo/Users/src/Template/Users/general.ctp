<?php

use Croogo\Core\Router;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $user
 * @var $socialProfileExists
 */

?>
<div class="articles-list-page">
    <div class="user-page settings-page">
        <?= $this->element('Croogo/Users.setting_navigation') ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="general-settings">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Personal settings'); ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <div class="view-profile">
                            <?= $this->Html->link(
                                __('Show profile'),
                                ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'view'],
                                ['class' => 'btn-secondary']
                            ); ?>
                        </div>
                        <?php
                        echo $this->Form->create($user, ['type' => 'file']);
                        ?>
                        <div class="personal-settings">
                            <div class="add-photo">
                                <?php

                                $userPhoto = UserComponent::IMAGE_BLANK_USER;
                                if (!empty($user->image)) {
                                    $userPhoto = $user->image;
                                }

                                ?>
                                <div id="image-content" class="user-photo"
                                     style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $userPhoto ?>) no-repeat center; background-size: cover;"></div>
                                <?php
                                echo $this->Form->input(
                                    'photo',
                                    [
                                        'type' => 'file',
                                        'label' => [
                                            'text' => __('Choose photo'),
                                            'class' => 'control-label photo-label btn-secondary'
                                        ],
                                        'templates' => [
                                            'file' => '<input type="file" name="{{name}}"{{attrs}}><span id="file-name"></span>'
                                        ]
                                    ]
                                ); ?>
                            </div>
                            <div class="personal-data">
                                <?php
                                echo $this->Form->input(
                                    'name',
                                    [
                                        'label' => [
                                            'text' => __('Name')
                                        ]
                                    ]
                                );

                                echo $this->Form->input(
                                    'bio',
                                    [
                                        'label' => [
                                            'text' => __('Description')
                                        ]
                                    ]
                                );
                                if (!empty($user->ref_link)) {
                                    ?>
                                    <div class="ref_link">
                                        <label class="control-label"><?= __('Referral link'); ?></label>
                                        <p><?= __('This is Your referral link'); ?></p>
                                        <div class="refLink">
                                            <?= Router::url('/', true) . $user->ref_link . UsersController::REF_LINK ?>
                                        </div>
                                    </div>
                                    <?php
                                }
                                echo $this->Form->submit(__('Save'), ['class' => 'btn']);
                                ?>
                            </div>
                        </div>
                        <?php
                        echo $this->Form->end();
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        contentView.bindImagePreview();
    });
</script>
