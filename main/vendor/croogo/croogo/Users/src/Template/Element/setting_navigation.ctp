<?php
/**
 * @var $socialProfileExists
 * @var $counterReportsUser
 */

$plugin = $this->request->getParam('plugin');
$controller = $this->request->getParam('controller');
$action = $this->request->getParam('action');

?>
<div class="container">
    <ul class="nav nav-tabs art-tabs" role="tablist">
        <li role="presentation" class="<?=
        (string)$plugin === 'Croogo/Users'
        && (string)$controller === 'Users'
        && (string)$action === 'general' ? 'active' : '' ?>">
            <?= $this->Html->link(__('Settings'),
                [
                    'plugin' => 'Croogo/Users',
                    'controller' => 'Users',
                    'action' => 'general'
                ],
                ['class' => 'general-settings-tab']
            );
            ?>
        </li>
        <li role="presentation" class="<?=
        (string)$plugin === 'Croogo/Users'
        && (string)$controller === 'Users'
        && (string)$action === 'inbox' ? 'active' : '' ?>">
            <?= $this->Html->link(__('Inbox'),
                [
                    'plugin' => 'Croogo/Users',
                    'controller' => 'Users',
                    'action' => 'inbox'
                ],
                ['class' => 'inbox-tab']
            );
            ?>
        </li>
        <?php if (!$socialProfileExists) { ?>
            <li role="presentation" class="<?=
            (string)$plugin === 'Croogo/Users'
            && (string)$controller === 'Users'
            && (string)$action === 'change' ? 'active' : '' ?>">
                <?= $this->Html->link(__('Change password'),
                    [
                        'plugin' => 'Croogo/Users',
                        'controller' => 'Users',
                        'action' => 'change'
                    ],
                    ['class' => 'change-password-tab']
                );
                ?>
            </li>
        <?php } ?>
        <li role="presentation" class="<?=
        (string)$plugin === 'Croogo/Users'
        && (string)$controller === 'Users'
        && (string)$action === 'subscriptions' ? 'active' : '' ?>">
            <?= $this->Html->link(__('Subscriptions'),
                [
                    'plugin' => 'Croogo/Users',
                    'controller' => 'Users',
                    'action' => 'subscriptions'
                ],
                ['class' => 'subscriptions-tab']
            );
            ?>
        </li>
        <?php $counterReports = (int)$counterReportsUser['user'] > 0 ? $counterReportsUser['user'] : ''; ?>
        <li role="presentation" class="<?=
        (string)$plugin === 'Reports'
        && (string)$controller === 'Reports'
        && (string)$action === 'index' ? 'active' : '' ?>">
            <?= $this->Html->link(__('Your reports') . ' <span id="counter-reports-profile" class="counter-reports-right">' . $counterReports . '</span>',
                [
                    'plugin' => 'Reports',
                    'controller' => 'Reports',
                    'action' => 'index'
                ],
                ['class' => 'your-reports-tab']
            );
            ?>
        </li>
    </ul>
</div>
