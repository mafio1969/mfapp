<?php
/**
 * @var $user
 * @var $roles
 */

echo $this->Form->create($user);
echo $this->Form->input('permissions', [
    'type' => 'hidden',
    'value' => $user->id
]);
echo $this->Form->input('roles._ids', [
    'type' => 'select',
    'multiple' => 'checkbox',
    'options' => $roles,
    'label' => [
        'text' => __('User Permissions')
    ]
]);
echo $this->Form->submit(__('Save'));
echo $this->Form->end();
