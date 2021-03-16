<?php
/**
 * @var $item
 */
?>
<div class="modal fade questionModal" id="resolveReasonModal"
     role="dialog"
     aria-labelledby="commentModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                </button>
                <h4><?= __('Resolve reason') ?></h4>
            </div>
            <div class="modal-body">
                <div class="add-comment">
                    <?php
                    echo $this->Form->create(null, [
                        'id' => 'form-resolve'
                    ]);
                    echo $this->Form->input('content',
                        [
                            'required' => false,
                            'type' => 'textarea',
                            'label' => false,
                            'id' => 'resolve-reason-content'
                        ]
                    );
                    echo $this->Form->button('<span class=""></span>' . __('Report'), [
                        'id' => 'submit-resolve'
                    ]);
                    echo $this->Form->end();
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
