<div class="modal fade questionModal" id="removeModal" role="dialog"
     aria-labelledby="commentModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                </button>
                <h4><?= __('Remove content'); ?></h4>
            </div>
            <div class="modal-body modal-report">
                <p id="modal-content"></p>
                <div class="add-comment">
                    <form id="form-remove">
                        <label for="content"><?= __('Add reason') ?></label>
                        <textarea class="form-control" name="content" id="removeReason"></textarea>
                        <button class="btn" id="remove-link" href="#">
                            <span class=""></span><?= __('Remove'); ?>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
