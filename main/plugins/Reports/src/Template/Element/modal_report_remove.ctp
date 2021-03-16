<?php

/**
 * @var $item
 */

?>
<div class="modal fade questionModal" id="reasonDelete"
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
                            'action' => 'removeContent',
                            $item->id,
                            '_ext' => 'json'
                        ],
                        'class' => 'form-comment',
                        'id' => 'form-report-delete'
                    ]);
                    echo $this->Form->input('description',
                        [
                            'required' => false,
                            'type' => 'textarea',
                            'label' => false,
                            'id' => 'reason-delete-content'
                        ]
                    );
                    echo $this->Form->button('<span class=""></span>' . __('Remove content'), [
                        'id' => 'submit-delete'
                    ]);
                    echo $this->Form->end();
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
