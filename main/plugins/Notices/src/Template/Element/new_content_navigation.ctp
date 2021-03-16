<?php


/**
 * @var $commentsCounters
 * @var $userGlobalPermissions
 * @var $newContentCommentsCounters
 */

$action = $this->request->getParam('action');
?>
<div class="container">
    <ul class="nav nav-tabs art-tabs" role="tablist">
        <li role="presentation" class="<?= $action == 'latest' ? 'active' : '' ?>">
            <?php
            echo $this->Html->link(__('Content requiring accept') . ' <span>' . $newContentCommentsCounters . '</span>',
                [
                    'plugin' => 'Notices',
                    'controller' => 'Notices',
                    'action' => 'latest'
                ],
                ['class' => 'inbox-all-tab']
            );
            ?>
        </li>
        <li role="presentation" class="<?= $action == 'verified' ? 'active' : '' ?>">
            <?php
            echo $this->Html->link(__('Content verified'),
                [
                    'plugin' => 'Notices',
                    'controller' => 'Notices',
                    'action' => 'verified'
                ],
                ['class' => 'inbox-all-tab']
            );
            ?>
        </li>
    </ul>
</div>
