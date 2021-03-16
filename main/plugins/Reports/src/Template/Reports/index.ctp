<?php

use Reports\Controller\ReportsController;

/**
 * @var $items
 * @var $fieldsOptions
 * @var $socialProfileExists
 * @var $counterReportsUser
 */

?>
<div class="articles-list-page">
    <div class="user-page inbox-page index-reports">
        <?= $this->element('Croogo/Users.setting_navigation') ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="inbox">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Your reports') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="filters">
                        <?php
                        echo $this->Form->create(null, [
                            'type' => 'GET',
                            'novalidate' => true,
                            'class' => 'search-top',
                            'url' => [
                                'plugin' => 'Reports',
                                'controller' => 'Reports',
                                'action' => 'index'
                            ],
                        ]);
                        $options = [
                            'empty' => true,
                            'required' => false,
                            'type' => 'select',
                            'label' => false,
                            'options' => $fieldsOptions['status']
                        ];
                        $options['default'] = $this->request->query('status');
                        $this->Form->unlockField('status');
                        echo $this->Form->input('status', $options);
                        echo $this->Form->submit(__('Filter'), ['type' => 'submit', 'class' => 'btn']);
                        echo $this->Html->link('Reset', [
                            'action' => 'index',
                        ], [
                            'class' => 'btn reset',
                        ]);
                        echo $this->Form->end();
                        ?>
                        <div class="sort">
                            <?php
                            $queryParams = $this->request->getQueryParams();
                            $classAsc = $classDesc = '';
                            if (isset($queryParams['direction']) && $queryParams['direction'] == 'asc') {
                                $classAsc = 'active';
                            } else {
                                $classDesc = 'active';
                            }
                            $urlDesc = array_merge(
                                ['sort' => 'created', 'direction' => 'desc'],
                                [],
                                ['order' => null]
                            );
                            $urlDesc = $this->Paginator->generateUrl($urlDesc, $this->Paginator->defaultModel());
                            echo $this->Html->link(__('Newest'), $urlDesc, ['class' => 'desc ' . $classDesc]);
                            $urlAsc = array_merge(
                                ['sort' => 'created', 'direction' => 'asc'],
                                [],
                                ['order' => null]
                            );
                            $urlAsc = $this->Paginator->generateUrl($urlAsc, $this->Paginator->defaultModel());
                            echo $this->Html->link(__('Oldest'), $urlAsc, ['class' => 'asc ' . $classAsc]);
                            ?>
                        </div>
                    </div>
                    <div class="page-inner-content users-list">
                        <div class="news-list">
                            <?php
                            foreach ($items as $item) {
                                $itemData = json_decode($item->message);
                                $newMessage = (int)$item->status === 1 ? 'new-message' : '';
                                $contentDescription = __('Reported') . ' ';
                                if ((int)$item->report_type_id === ReportsController::REPORT_TYPE_USER) {
                                    $contentDescription .= __('profile') . ' "' . $item->reported_user->name . '"';
                                    if ((int)$itemData->reason_type === ReportsController::REPORT_USER_REASON_OTHER) {
                                        $contentDescription .= ': "' . $itemData->reason_content . '"';
                                    } else {
                                        $contentDescription .= ': "' . ReportsController::getReportsTypesTranslations()[$itemData->reason_type] . '"';
                                    }
                                } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_CONTENT) {
                                    $contentDescription .= __('content') . ' ';
                                    if ((int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_NEWS
                                        || (int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_QUESTION) {
                                        $contentDescription .= '"' . $this->Text->truncate($item->reported_content->title,
                                                30) . '"';
                                    } else {
                                        $contentDescription .= '"' . $this->Text->truncate(strip_tags($item->reported_comment->description),
                                                30) . '"'
                                            . ' '
                                            . __('to')
                                            . ' "'
                                            . $this->Text->truncate($item->reported_comment->article->title, 30) . '"';
                                    }
                                    $contentDescription .= ' ' . __('due to') . ' ';
                                    if ((int)$itemData->reason_type === ReportsController::REPORT_CONTENT_REASON_OTHER) {
                                        $contentDescription .= ' "' . $itemData->reason_content . '"';
                                    } else {
                                        $contentDescription .= ' "' . ReportsController::getReportsTypesTranslations()[$itemData->reason_type] . '"';
                                    }
                                } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_RESOLVE) {
                                    $contentDescription = '"' . $item->reported_resolve->title . '": "' . $itemData->reason_content . '"';
                                }
                                $viewLink = '<button type="button" class="btn btn-view-report" data-toggle="modal" data-item="'
                                    . $item->id . '" data-target="#reportModal'
                                    . $item->id . '">'
                                    . __('View')
                                    . '</button>';
                                $actionsElement = ' <div class="actions"> ' . $viewLink . '</div> ';
                                ?>
                                <div class="news-list-item new-content <?= $newMessage ?>">
                                    <p><?= $contentDescription ?></p>
                                    <p class="inbox-message-date"><?= $item->created->format('d.m.Y, H:i') ?></p>
                                    <?php
                                    $status = $this->Reports->getReportStatus($item->report_status);
                                    ?>
                                    <div class="item-title">
                                        <?= $status; ?>
                                    </div>
                                    <?= $actionsElement ?>
                                </div>
                                <?= $this->element('modal_report_history', ['item' => $item]); ?>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->element('modal_raise_objection'); ?>
<script>
    $(function () {
        $("#form-objection").validate({
            rules: {
                description: {
                    required: true,
                    minlength: 3
                }
            },
            messages: {
                description: {
                    required: "<?= __('Reason cannot be empty.') ?>",
                    minlength: "<?= __('Reason must have min. 3 characters.') ?>"
                }
            }
        });
        $('#raiseObjectionModal').on('shown.bs.modal', function (e) {
            $('#submit-objection').attr("data-href", $(e.relatedTarget).data('objection'));
        });
        $('#form-objection').on('submit', function (e) {
            e.preventDefault();
            var form = $(this);
            var button = $('#submit-objection');
            if (form.valid()) {
                button.attr("disabled", true);
                button.find('span').addClass('loading');
                $.ajax({
                    url: button.attr("data-href"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        if (result.success) {
                            window.location.href = window.location;
                        } else {
                            button.find('span').removeClass('loading');
                            button.attr("disabled", false);
                        }
                    }
                });
            }
        });
        $('.btn-view-report').off().on("click", function () {
            let element = $(this);
            if (element.parent().parent().hasClass('new-message')) {
                $.ajax({
                    url: "<?= $this->Url->build([
                        'plugin' => 'Reports',
                        'controller' => 'Reports',
                        'action' => 'mark'
                    ]); ?>" + '/' + element.attr('data-item') + '.json',
                    type: "GET",
                    success: function (result) {
                        if (result.success) {
                            element.parent().parent().removeClass('new-message');
                            $('#counter-reports-header').empty().text(result.counter);
                            $('#counter-reports-profile').empty().text(result.counter);
                        }
                    }
                });
            }
        })
    });
</script>
