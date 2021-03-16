<?php

use Croogo\Users\Controller\Component\UserComponent;
use Reports\Controller\ReportsController;

/**
 * @var $item
 */

?>
<div class="articles-list-page">
    <div class="inbox-page report-content">
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
                            $actionDelete = '<button type="button" class="btn btn-report-action" data-toggle="modal" data-target="#reasonDelete">'
                                . '<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="'
                                . __('Remove content') . '">' . __('Remove content') . '</span>'
                                . '</button>';
                            $actionReject = '<button type="button" class="btn btn-report-action" data-toggle="modal" data-target="#reasonReject">'
                                . '<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="'
                                . __('Reject report') . '">' . __('Reject') . '</span>'
                                . '</button>';
                            if ((int)$item->report_status === ReportsController::REPORT_STATUS_CONTACT) {
                                $actionContact = '<button type="button" class="btn btn-report-action" disabled="disabled">'
                                    . '<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="'
                                    . __('Contact user') . '">' . __('Contact') . '</span>'
                                    . '</button>';
                            } else {
                                $actionContact = '<button type="button" class="btn btn-report-action" id="buttonReportContact" data-toggle="modal" data-target="#reasonContact">'
                                    . '<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="'
                                    . __('Contact user') . '">' . __('Contact') . '</span>'
                                    . '</button>';
                            }
                            $actionsElement = '<div class="actions">' . $actionDelete . $actionReject . $actionContact . '</div>';
                            ?>
                            <div class="news-list-item new-content">
                                <p>
                                    <?= $itemCreator ?>
                                    <?php
                                    if (isset($itemData[ReportsController::REPORT_LEVEL_II])) {
                                        ?><span><?= __('again reported') ?> </span><?php
                                    } else {
                                        ?><span><?= __('reported') ?> </span><?php
                                    }
                                    if ((int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_NEWS
                                        || (int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_QUESTION) {
                                        echo '"' . $item->reported_content->title . '"';
                                    } else {
                                        echo '"' . strip_tags($item->reported_comment->description) . '"';
                                    }
                                    if ((int)$itemData['reason_type'] === ReportsController::REPORT_CONTENT_REASON_OTHER) {
                                        ?>
                                        <snap><?= $itemData['reason_content'] ?></snap>;
                                        <?php
                                    } elseif ((int)$itemData['reason_type'] === ReportsController::REPORT_CONTENT_REASON_PLAGIARISM) {
                                        ?>
                                        <snap><?= ReportsController::getReportsTypesTranslations()[$itemData['reason_type']] ?></snap>
                                        <snap><?= $itemData['reason_content'] ?></snap>
                                        <?php
                                    } else {
                                        ?>
                                        <snap><?= ReportsController::getReportsTypesTranslations()[$itemData['reason_type']] ?></snap>
                                        <?php
                                    }
                                    ?>
                                </p>
                                <p class="inbox-message-date"><?= $item->created->format('d.m.Y, H:i') ?></p>
                                <?php
                                $showActionButtons = true;
                                if ((int)$item->report_status != ReportsController::REPORT_STATUS_WAITING) {
                                    $showActionButtons = false;
                                }

                                ?>
                                <?= $showActionButtons ? $actionsElement : '' ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->element('modal_report_remove'); ?>
<?= $this->element('modal_report_reject'); ?>
<?= $this->element('modal_report_contact'); ?>
<script>
    $(function () {
        contentView.bindReportRemove("<?= __('Reason cannot be empty.') ?>", "<?= $this->Url->build([
            'plugin' => 'Reports',
            'controller' => 'Reports',
            'action' => 'taken'
        ]); ?>");
        contentView.bindReportReject("<?= __('Reason cannot be empty.') ?>");
        contentView.bindReportContact("<?= __('Message cannot be empty.') ?>");
    });
</script>
