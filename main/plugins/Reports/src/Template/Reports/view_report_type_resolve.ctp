<?php

use Croogo\Users\Controller\Component\UserComponent;
use Reports\Controller\ReportsController;
use Articles\Controller\ArticlesController;

/**
 * @var $item
 */

?>
<div class="articles-list-page">
    <div class="inbox-page report-resolve">
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
                            $actionAccept = '<button type="button" class="btn btn-report-action" id="reason-accept" data-href="'
                                . $this->Url->build([
                                    'plugin' => 'Reports',
                                    'controller' => 'Reports',
                                    'action' => 'acceptContent',
                                    $item->id,
                                    '_ext' => 'json'
                                ]) . '">'
                                . '<span data-toggle="tooltip"
                                            data-placement="top"
                                            data-original-title="'
                                . __('Accept report') . '">' . __('Accept') . '</span>'
                                . '</button>';
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
                            $actionsElement = '<div class="actions">' . $actionAccept . $actionReject . $actionContact . '</div>';
                            ?>
                            <div class="news-list-item new-content">
                                <p>
                                    <?= __('User') ?> <?= $itemCreator ?>
                                    <?php
                                    if (isset($itemData[ReportsController::REPORT_LEVEL_II])) {
                                        ?>
                                        <span><?= __('has re-objected to the content rejection') ?> </span><?php
                                    } else {
                                        ?>
                                        <span><?= __('has raised an objection regarding the result of the vote to') ?> </span><?php
                                    }
                                    echo '"' . $item->reported_resolve->title . '"';
                                    ?>
                                </p>
                                <p><?= $itemData['reason_content'] ?></p>
                                <p class="inbox-message-date"><?= $item->created->format('d.m.Y, H:i') ?></p>
                                <?php
                                    $showActionButtons = true;
                                    if((int)$item->report_status != ReportsController::REPORT_STATUS_WAITING) {
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
<?= $this->element('modal_report_reject'); ?>
<?= $this->element('modal_report_contact'); ?>
<script>
    $(function () {
        contentView.bindReportAccept();
        contentView.bindReportReject("<?= __('Reason cannot be empty.') ?>");
        contentView.bindReportContact("<?= __('Message cannot be empty.') ?>");
    });
</script>
