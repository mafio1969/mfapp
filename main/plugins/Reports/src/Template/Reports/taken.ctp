<?php

use Croogo\Users\Controller\Component\UserComponent;
use Reports\Controller\ReportsController;

/**
 * @var $items
 */

$pageTitle = __('Taken');

?>
<div class="articles-list-page">
    <div class="user-page inbox-page taken-page">
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
                                $itemData = json_decode($item->message);
                                $itemDataArray = json_decode($item->message, true);
                                $itemCreator = $this->Reports->getReportCreator($item);
                                if ((int)$item->report_status != ReportsController::REPORT_STATUS_WAITING) {
                                    $viewLink = '<button type="button" class="btn" data-toggle="modal" data-target="#reportModal'
                                        . $item->id . '">'
                                        . __('View')
                                        . '</button>';
                                } else {
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
                                }
                                $actionsElement = '<div class="actions">' . $viewLink . '</div>';
                                $contentDescription = $this->Reports->getReportDescription($item, $itemData);
                                $newMessage = '';
                                if ((int)$item->report_status === ReportsController::REPORT_STATUS_CONTACT
                                    && time() - (int)$item->report_contact_time > ReportsController::REPORT_TIME_TO_CONTACT) {
                                    $newMessage = 'new-message';
                                }
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
                                if ((int)$item->report_status != ReportsController::REPORT_STATUS_WAITING) {
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
