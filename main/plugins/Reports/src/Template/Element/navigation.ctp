<?php

use Croogo\Users\Controller\UsersController;

/**
 * @var $commentsCounters
 * @var $userGlobalPermissions
 * @var $counterReportsUser
 */

$action = $this->request->getParam('action');
?>
<div class="container reports-waiting">
    <ul class="nav nav-tabs art-tabs" role="tablist">
        <li role="presentation" class="<?= $action == 'waiting' ? 'active' : '' ?>">
            <?php
            echo $this->Html->link(__('To take') . ' <span>' . $counterReportsUser['moderator'] . '</span>',
                [
                    'plugin' => 'Reports',
                    'controller' => 'Reports',
                    'action' => 'waiting'
                ],
                ['class' => 'inbox-all-tab']
            );
            ?>
        </li>
        <li role="presentation" class="<?= $action == 'taken' ? 'active' : '' ?>">
            <?php
            echo $this->Html->link(__('Taken'),
                [
                    'plugin' => 'Reports',
                    'controller' => 'Reports',
                    'action' => 'taken'
                ],
                ['class' => 'inbox-my-content-tab']
            );
            ?>
        </li>
        <li role="presentation" class="<?= $action == 'cases' ? 'active' : '' ?>">
            <?php
            echo $this->Html->link(__('My cases'),
                [
                    'plugin' => 'Reports',
                    'controller' => 'Reports',
                    'action' => 'cases'
                ],
                ['class' => 'inbox-other-tab']
            );
            ?>
        </li>
    </ul>
</div>
