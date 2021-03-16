<?php

use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Reports\Controller\ReportsController;

/**
 * @var $item
 * @var $rolesPermissions
 */

?>
<div class="articles-list-page reports-view">
    <div class="inbox-page raport-user-view">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="inbox-all">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Report view') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="page-inner-content users-list">
                        <div class="news-list">
                            <?php
                            $itemData = json_decode($item->message, true);
                            $itemCreatorPhoto = UserComponent::IMAGE_BLANK_USER;
                            if (!empty($item->creator->image)) {
                                $itemCreatorPhoto = $item->creator->image;
                            }
                            $cropItemCreatorPhoto = $this->Image2->source(DS . UserComponent::IMAGE_PREFIX . DS . $itemCreatorPhoto)
                                ->crop(30, 30)
                                ->imagePath();
                            $userName = isset($item->creator->name) ? $item->creator->name : __('Deleted user');
                            $itemCreator = '<span class="user-img" style="background: url('
                                . $cropItemCreatorPhoto .
                                ') no-repeat center; background-size: cover;"></span>
                                <b>' . $userName . '</b>';
                            ?>

                            <?php
                            $actionReject = '<button type="button" class="btn btn-report-action" data-toggle="modal" data-target="#reasonReject">'
                                . '<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="'
                                . __('Reject report') . '">' . __('Reject') . '</span>'
                                . '</button>';
                            $actionContact = '<button type="button" class="btn btn-report-action" id="buttonReportContact" data-toggle="modal" data-target="#reasonContact">'
                                . '<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="'
                                . __('Contact user') . '">' . __('Contact') . '</span>'
                                . '</button>';
                            $actionsElement = '<div class="actions">' . $actionReject . $actionContact . '</div>';
                            ?>
                            <div class="news-list-item new-content">
                                <p class="report-user-info">
                                    <?= $itemCreator ?>
                                    <?php
                                    if (isset($itemData[ReportsController::REPORT_LEVEL_II])) {
                                        ?><span><?= __('again reported') ?> </span><?php
                                    } else {
                                        ?><span><?= __('reported') ?> </span><?php
                                    }
                                    echo $this->Reports->getReportHistoryDescription($item,
                                        json_decode($item->message));
                                    ?>
                                </p>
                                <?php
                                    $contentDescription = '';
                                    $itemData = json_decode($item->message);
                                    if ((int)$item->report_type_id === ReportsController::REPORT_TYPE_USER) {
                                        
                                        if ((int)$itemData->reason_type === ReportsController::REPORT_USER_REASON_OTHER) {
                                            $contentDescription .= ': "' . $itemData->reason_content . '"';
                                        } else {
                                            $contentDescription .= ': "' . ReportsController::getReportsTypesTranslations()[$itemData->reason_type] . '"';
                                        }
                                    }
                                ?>
                                <p><?=__('Reason for the report') . $contentDescription ?></p>
                                <p class="inbox-message-date"><?= $item->created->format('d.m.Y, H:i') ?></p>
                                <?php
                                    $showActionButtons = true;
                                    if((int)$item->report_status != ReportsController::REPORT_STATUS_WAITING) {
                                        $showActionButtons = false;
                                    }

                                ?>
                                <?= $showActionButtons ? $actionsElement : '' ?>
                                <?php
                                        if($showActionButtons) {
                                    ?>
                                <div class="row action-btn"> 
                                    <a id="blockUserBtn" role="button"
                                        class="btn-secondary block-user-icon"><?= __('Block user') ?>
                                    </a>
                                    <a id="permissionOffBtn" role="button"
                                        class="btn-secondary permission-off-icon"><?= __('Take permissions off') ?>
                                    </a>
                                </div>
                                <?php
                                        }
                                    ?>
                                <div class="row">
                                    <div class="block-user block-permission">
                                        
                                        <div class="collapse" id="collapseBlockUser">
                                            <?php

                                            echo $this->Form->create(null, [
                                                'id' => 'user-block-form',
                                                'url' => [
                                                    'plugin' => 'Reports',
                                                    'controller' => 'Reports',
                                                    'action' => 'userBlock',
                                                    '_ext' => 'json'
                                                ],
                                            ]);
                                            echo $this->Form->input('report_id', [
                                                'type' => 'hidden',
                                                'value' => $item->id
                                            ]);
                                            echo $this->Form->input('user_id', [
                                                'type' => 'hidden',
                                                'value' => $item->content_id
                                            ]);
                                            echo $this->Form->input('period', [
                                                'label' => [
                                                    'text' => __('Block user for:')
                                                ],
                                                'type' => 'select',
                                                'options' => UsersController::getBlockedPeriods()
                                            ]);
                                            echo $this->Form->input('reason', [
                                                'label' => [
                                                    'text' => __('Block reason')
                                                ],
                                                'type' => 'textarea'
                                            ]);
                                            echo $this->Form->submit(__('Block'), ['class' => 'btn-secondary']);
                                            echo $this->Form->end();
                                            ?>
                                        </div>
                                    </div>
                                    <div class="block-user take-permission">
                                        
                                        <div class="collapse" id="collapseTakePermissions">
                                            <div class="user-roles">
                                                <?php
                                                $userRoleIds = [];
                                                foreach ($item->reported_user->roles as $role) {
                                                    $userRoleIds[] = $role->id;
                                                }
                                                $rolesDescriptions = Croogo\Users\Controller\UsersController::getRolesDescriptions();
                                                $disabled = true;
                                                echo $this->Form->create(null, [
                                                    'id' => 'user-take-form',
                                                    'url' => [
                                                        'plugin' => 'Reports',
                                                        'controller' => 'Reports',
                                                        'action' => 'userTake',
                                                        '_ext' => 'json'
                                                    ]
                                                ]);
                                                echo $this->Form->input('report_id', [
                                                    'type' => 'hidden',
                                                    'value' => $item->id,
                                                    'id' => 'roles_report_id'
                                                ]);
                                                echo $this->Form->input('user_id', [
                                                    'type' => 'hidden',
                                                    'value' => $item->content_id,
                                                    'id' => 'roles_user_id'
                                                ]);
                                                echo $this->Form->input('period', [
                                                    'label' => [
                                                        'text' => __('Block permissions for:')
                                                    ],
                                                    'type' => 'select',
                                                    'id' => 'roles_period',
                                                    'options' => UsersController::getBlockedPeriods()
                                                ]);
                                                echo $this->Form->input('actives._ids[]', [
                                                    'type' => 'hidden'
                                                ]);
                                                $disabled = false;
                                                foreach ($rolesPermissions as $roleData) {
                                                    $activeClass = '';
                                                    $checked = false;
                                                    if (in_array($roleData->id, $userRoleIds)) {
                                                        $activeClass = 'active-role';
                                                        $checked = 'checked';
                                                    }
                                                    ?>
                                                    <div class="user-role">
                                                        <div class="role-inner <?= $activeClass ?>">
                                                            <?php
                                                            if ($checked) {
                                                                $inputOptions = [
                                                                    'type' => 'checkbox',
                                                                    'value' => $roleData->id,
                                                                    'hiddenField' => false,
                                                                    'checked' => $checked, 
                                                                    'class' => 'check-item' . ' ' . $checked,
                                                                    'id' => 'actives-ids-' . $roleData->id,
                                                                    'label' => false,
                                                                    'templates' => [
                                                                        'checkboxContainer' => '{{content}}'
                                                                    ]
                                                                ];
                                                                if ($disabled) {
                                                                    $inputOptions['disabled'] = true;
                                                                }
                                                                echo $this->Form->input('actives._ids[]', $inputOptions);
                                                            }
                                                            ?>
                                                            <label class="role-label"
                                                                for="<?= 'actives-ids-' . $roleData->id ?>"><?= $roleData->title ?></label>
                                                            <span><?= $rolesDescriptions[$roleData->alias]['description']; ?></span>
                                                        </div>
                                                    </div>
                                                    <?php
                                                }
                                                echo $this->Form->input('description', [
                                                    'label' => [
                                                        'text' => __('Take off reason')
                                                    ],
                                                    'type' => 'textarea'
                                                ]);
                                                echo $this->Form->submit(__('Take permissions off'),
                                                    ['class' => 'btn-secondary']);
                                                echo $this->Form->end();
                                                ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->element('modal_report_reject'); ?>
<?= $this->element('modal_report_contact'); ?>
<script>
    $(function () {
        var counterBlockUser = false;
        var counterPermissionOff = false;
        var blockUserBtnStyle = false;
        var permissionOffBtnStyle = false;

        $('#blockUserBtn').on('click', function () {
            counterBlockUser = !counterBlockUser;
            if(counterBlockUser) {
               $('#collapseBlockUser').show();
               $('#collapseTakePermissions').hide();
               counterPermissionOff = false;
            } else {
               $('#collapseBlockUser').hide();
               $('#collapseTakePermissions').hide();
               counterPermissionOff = false;
               counterBlockUser = false;
            }          
        });
        $('#permissionOffBtn').on('click', function () {
            counterPermissionOff = !counterPermissionOff;
            if(counterPermissionOff) {
               $('#collapseTakePermissions').show();
                $('#collapseBlockUser').hide();
                counterBlockUser = false;
            } else {
               $('#collapseBlockUser').hide();
               $('#collapseTakePermissions').hide();
               counterPermissionOff = false;
               counterBlockUser = false;
            }          
        });

        $('.raport-user-view .users-list .news-list .news-list-item #blockUserBtn').on('click', function () {
            blockUserBtnStyle = !blockUserBtnStyle;
            if(permissionOffBtnStyle && blockUserBtnStyle) {
                permissionOffBtnStyle = false;
                $(this).css('border', '2px solid #0072bc');
                $('.raport-user-view .users-list .news-list .news-list-item #permissionOffBtn').css('border', '2px solid  #fff');
            } else if(!permissionOffBtnStyle && blockUserBtnStyle) {
                $(this).css('border', '2px solid #0072bc');
                $('.raport-user-view .users-list .news-list .news-list-item #permissionOffBtn').css('border', '2px solid  #fff');
            } else if(!blockUserBtnStyle) {
                $(this).css('border', '2px solid #fff');
            }
        });
        
        $('.raport-user-view .users-list .news-list .news-list-item #permissionOffBtn').on('click', function () {
            permissionOffBtnStyle = !permissionOffBtnStyle;
            if(permissionOffBtnStyle && blockUserBtnStyle) {
                $('.raport-user-view .users-list .news-list .news-list-item #blockUserBtn').css('border', '2px solid #fff');
                $(this).css('border', '2px solid #0072bc');
                blockUserBtnStyle = false;
            } else if(permissionOffBtnStyle && !blockUserBtnStyle) {
                $(this).css('border', '2px solid #0072bc');
                $('.raport-user-view .users-list .news-list .news-list-item #blockUserBtn').css('border', '2px solid #fff');
            } else if (!permissionOffBtnStyle){
                $(this).css('border', '2px solid #fff');
            }
        });

        $('#user-block-form').validate({
            rules: {
                reason: "required"
            },
            messages: {
                reason: "<?= __('Reason cannot be empty.') ?>",
            }
        });
        $('#user-block-form').on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            if (form.valid()) {
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        toastr.info(result.message);
                        setTimeout(function(){
                            window.location.href = '/reports/waiting';
                        }, 1000);
                        //console.log(result);
                    }
                });
            }
        });
        $('#user-take-form').validate({
            rules: {
                description: "required"
            },
            messages: {
                description: "<?= __('Reason cannot be empty.') ?>",
            }
        });
        $('#user-take-form').on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            if (form.valid()) {
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        toastr.info(result.message);
                        setTimeout(function(){
                            window.location.href = '/reports/waiting';
                        }, 1000);
                        // /console.log(result);
                    }
                });
            }
        });
        contentView.bindReportReject("<?= __('Reason cannot be empty.') ?>");
        contentView.bindReportContact("<?= __('Message cannot be empty.') ?>");
    });
</script>
