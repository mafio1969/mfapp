<div class="modal fade questionModal" id="reportModal" role="dialog"
     aria-labelledby="commentModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                </button>
                <h4><?= __('Report content'); ?></h4>
            </div>
            <div class="modal-body modal-report">
                <p id="modal-content"></p>
                <div class="add-comment">
                    <form id="form-report">
                        <?php
                        echo $this->Form->select('type',
                            $this->Reports->getReportContentTypes(),
                            [
                                'id' => 'addReportType'
                            ]);
                        ?>
                        <div id="reportInputContainer">
                            <input class="form-control" name="content_input" id="addReportInput">
                        </div>
                        <div id="reportTextContainer">
                            <label for="addComment"><?= __('Add reason') ?>
                            </label>
                            <textarea class="form-control" name="content" id="addReportText"></textarea>
                        </div>
                        <button class="btn" id="report-link" href="#">
                            <span class=""></span><?= __('Report'); ?>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
