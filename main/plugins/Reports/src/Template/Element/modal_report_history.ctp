<?php
/**
 * @var $item
 */

$itemData = json_decode($item->message);

?>
<div class="modal fade questionModal reportModal takenModal modal-report-history" id="reportModal<?= $item->id ?>"
     role="dialog"
     aria-labelledby="commentModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                </button>
                <h4><?= __('Objection to the') ?></h4>
                <h5><?= $this->Reports->getReportHistoryDescription($item, $itemData); ?></h5>
            </div>
            <div class="modal-body">
                <div class="add-comment">
                    <div class="report-history-item">
                        <?= __('Reason') ?> <?= $this->Reports->getReportReasonType($itemData); ?>
                        <span><?= $item->created->format('d.m.Y H:s'); ?></span>
                        <?php
                        $reasonDescription = $this->Reports->getReportReason($itemData);
                        if ($reasonDescription) {
                            ?><p><span class="action-taken"><?= __('Justifications') ?></span> <?= $reasonDescription ?></p><?php
                        }
                        ?>
                    </div>
                    <?php

                    foreach ($item->reports_history as $itemHistory) {
                        $itemHistoryData = json_decode($itemHistory->message);
                        $actionTaken = $this->Reports->getReportsActionsTranslations();
                        ?>
                        <div class="one-history-action">
                            <p><span class="action-taken"><?= __('Action date') ?></span> <?= $itemHistory->created->format('d.m.Y H:s'); ?></p>

                            <p><span class="action-taken"><?= __('Action taken by') ?></span> <?= $itemHistory->moderator->name; ?></p>
                            <p>
                                <span class="actions-report"><?= __('Actions') ?></span>
                                <?= __($actionTaken[$itemHistoryData->reason_type]); ?>
                            </p>
                            <?php
                                if (isset($itemHistoryData->reason_metadata)) {
                                    if (isset($itemHistoryData->reason_metadata->roles)) {
                                        echo '<p><span class="actions-report">' . __('Blocked permissions') . '</span> ';

                                        $divider = '';
                                        if($itemHistoryData->reason_metadata->roles) {
                                            $rolesDescriptions = Croogo\Users\Controller\UsersController::getRolesDescriptions();
                                            foreach ($itemHistoryData->reason_metadata->roles as $blockedRole) {
                                                echo $divider . $rolesDescriptions[$blockedRole->alias]['name'];

                                                $divider = ', ';
                                            }
                                        }
                                        echo '</p>';
                                    }

                                    if (isset($itemHistoryData->reason_metadata->period)) {
                                        $blockedPeriods = Croogo\Users\Controller\UsersController::getBlockedPeriods();
                                        echo '<p><span class="actions-report">' . __('Block period') . '</span> ';
                                        echo $blockedPeriods[$itemHistoryData->reason_metadata->period];
                                        echo '</p>';
                                    }
                                }
                            ?>
                            <p><span class="action-taken"><?= __('Justifications') ?></span> <?= $itemHistoryData->reason_description; ?></p>
                        </div>
                        <?php
                    }
                    if ((int)$item->user_id === (int)$this->request->getSession()->read('Auth.User.id')
                        && $this->Reports->isRaiseObjection($item->report_level, $item->report_status)) {
                        $objectionUrl = $this->Url->build([
                            'plugin' => 'Reports',
                            'controller' => 'Reports',
                            'action' => 'objection',
                            $item->id,
                            '_ext' => 'json'
                        ]);
                        ?>
                        <button type="button" id="raiseObjectionButton" class="btn raise-objection" data-toggle="modal"
                                data-objection="<?= $objectionUrl; ?>"
                                data-target="#raiseObjectionModal"><?= __('Raise an objection'); ?></button>
                        <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
