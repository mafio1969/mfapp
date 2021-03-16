<?php
/**
 * @var $item
 */
?>
<div class="modal fade questionModal" id="reasonReject"
     role="dialog"
     aria-labelledby="commentModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                </button>
                <h4><?= __('Reason') ?></h4>
            </div>
            <div class="modal-body">
                <div class="add-comment">
                    <?php
                    echo $this->Form->create(null, [
                        'url' => [
                            'plugin' => 'Reports',
                            'controller' => 'Reports',
                            'action' => 'cancel',
                            $item->id,
                            '_ext' => 'json'
                        ],
                        'class' => 'form-comment',
                        'id' => 'form-report-reject'
                    ]);
                    echo $this->Form->input('description',
                        [
                            'required' => false,
                            'type' => 'textarea',
                            'label' => false,
                            'id' => 'reason-reject-content'
                        ]
                    );
                    echo $this->Form->button('<span class=""></span>' . __('Reject'), [
                        'id' => 'submit-reject'
                    ]);
                    echo $this->Form->end();
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
