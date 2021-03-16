<?php

use Croogo\Users\Controller\UsersController;

/**
 * @var $commentsCounters
 * @var $userGlobalPermissions
 */

$action = $this->request->getParam('action');
?>
<div class="container">
    <ul class="nav nav-tabs art-tabs" role="tablist">
        <li role="presentation" class="<?= $action == 'index' ? 'active' : '' ?>">
            <?php
            $counterAll = (int)$commentsCounters['all'] > 0 ? $commentsCounters['all'] : '';
            echo $this->Html->link(__('All notices') . ' <span>' . $counterAll . '</span>',
                [
                    'plugin' => 'Notices',
                    'controller' => 'Notices',
                    'action' => 'index'
                ],
                ['class' => 'inbox-all-tab']
            );
            ?>
        </li>
        <li role="presentation" class="<?= $action == 'content' ? 'active' : '' ?>">
            <?php
            $counterContent = (int)$commentsCounters['content'] > 0 ? $commentsCounters['content'] : '';
            echo $this->Html->link(__('My content') . ' <span>' . $counterContent . '</span>',
                [
                    'plugin' => 'Notices',
                    'controller' => 'Notices',
                    'action' => 'content'
                ],
                ['class' => 'inbox-my-content-tab']
            );
            ?>
        </li>
     
        <li role="presentation" class="<?= $action == 'reports' ? 'active' : '' ?>">
            <?php
            $counterReports = (int)$commentsCounters['reports'] > 0 ? $commentsCounters['reports'] : '';
            echo $this->Html->link(__('Reports') . ' <span>' . $counterReports . '</span>',
                [
                    'plugin' => 'Notices',
                    'controller' => 'Notices',
                    'action' => 'reports'
                ],
                ['class' => 'inbox-reports-tab']
            );
            ?>
        </li>
           
        <li role="presentation" class="<?= $action == 'subscriptions' ? 'active' : '' ?>">
            <?php
            $counterSubscriptions = (int)$commentsCounters['subscriptions'] > 0 ? $commentsCounters['subscriptions'] : '';
            echo $this->Html->link(__('Subscriptions') . ' <span>' . $counterSubscriptions . '</span>',
                [
                    'plugin' => 'Notices',
                    'controller' => 'Notices',
                    'action' => 'subscriptions'
                ],
                ['class' => 'inbox-subscriptions-tab']
            );
            ?>
        </li>
        <li role="presentation" class="<?= $action == 'others' ? 'active' : '' ?>">
            <?php
            $counterOthers = (int)$commentsCounters['others'] > 0 ? $commentsCounters['others'] : '';
            echo $this->Html->link(__('Others') . ' <span>' . $counterOthers . '</span>',
                [
                    'plugin' => 'Notices',
                    'controller' => 'Notices',
                    'action' => 'others'
                ],
                ['class' => 'inbox-other-tab']
            );
            ?>
        </li>
    </ul>
</div>
