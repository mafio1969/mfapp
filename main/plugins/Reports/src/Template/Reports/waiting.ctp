<?php

use Croogo\Users\Controller\Component\UserComponent;
use Reports\Controller\ReportsController;

/**
 * @var $items
 */

$pageTitle = __('To take');
?>
<div class="articles-list-page">
    <div class="user-page inbox-page to-take">
        <?php
        echo $this->element('Reports.navigation');
        ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="inbox-all">
                <div class="page-title">
                    <div class="container">
                        <h1><?= $pageTitle ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="page-inner-content users-list">
                        <div class="news-list">
                            <?php
                            foreach ($items as $item) {
                                $newMessage = '';
                                if (((int)$item->report_status === 0)) {
                                    $newMessage = 'new-message';
                                }
                                $itemData = json_decode($item->message);
                                $itemDataArray = json_decode($item->message, true);
                                $itemCreator = $this->Reports->getReportCreator($item);
                                $viewLink = $this->Html->link(__('View'),
                                    [
                                        'plugin' => 'Reports',
                                        'controller' => 'Reports',
                                        'action' => 'view',
                                        $item->id
                                    ],
                                    [
                                        'class' => 'viewItem'
                                    ]
                                );
                                if (isset($item->reports_history) && (sizeof($item->reports_history) > 0)) {

                                    $viewLink .= '<button type="button" class="btn show-history" data-toggle="modal" data-target="#reportModal'
                                        . $item->id . '">'
                                        . __('Show history')
                                        . '</button>';
                                }
                                $actionsElement = '<div class="actions">' . $viewLink . '</div>';
                                $contentDescription = $this->Reports->getReportDescription($item, $itemData);
                                ?>
                                <div class="news-list-item new-content <?= $newMessage ?>">
                                    <p>
                                        <?= $itemCreator ?>
                                        <?php
                                        if ((int)$item->report_type_id === ReportsController::REPORT_TYPE_RESOLVE) {
                                            if (isset($itemDataArray[ReportsController::REPORT_LEVEL_II])) {
                                                ?>
                                                <?= __('has re-objected to the content rejection') ?><?php
                                            } else {
                                                ?>
                                                <?= __('has raised an objection regarding the result of the vote to') ?><?php
                                            }
                                        } else {
                                            if (isset($itemDataArray[ReportsController::REPORT_LEVEL_II])) {
                                                ?><?= __('again reported') ?><?php
                                            } else {
                                                ?><?= __('reported') ?><?php
                                            }
                                        }
                                        ?>
                                        <?= $contentDescription; ?>
                                    </p>
                                    <p class="inbox-message-date"><?= $item->created->format('d.m.Y, H:i') ?></p>
                                    <?= $actionsElement ?>
                                </div>
                                <?php
                                if (isset($item->reports_history) && (sizeof($item->reports_history) > 0)) {
                                    echo $this->element('modal_report_history', ['item' => $item]);
                                }
                            }
                            ?>
                        </div>
                        <?php
                        echo $this->element('CryptoTheme.paginator');
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
