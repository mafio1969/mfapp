<?php

use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $article
 */

?>
<div class="articles-list-page">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Edit content'); ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="page-inner-content add-content white-bg">
            <?php
            echo $this->Form->create($article, [
                'type' => 'file',
                'id' => 'form-content'
            ]);
            ?>
            <div class="add-content-inner">
                <div class="add-content-main">
                    <?php
                    echo $this->Form->input(
                        'title',
                        [
                            'label' => [
                                'text' => __('Title')
                            ]
                        ]
                    );
                    echo $this->Form->input(
                        'preview',
                        [
                            'label' => [
                                'text' => __('Visible for all users')
                            ]
                        ]
                    );
                    echo $this->Form->input(
                        'description',
                        [
                            'label' => [
                                'text' => __('Visible only for registered users')
                            ]
                        ]
                    );
                    ?>
                </div>
                <div class="add-content-side">
                    <?php
                    echo $this->Form->input(
                        'type_id',
                        [
                            'label' => [
                                'text' => __('Type')
                            ]
                        ]
                    );
                    echo $this->Form->input('categories._ids',
                        [
                            'class' => 'js-example-basic-single',
                            'type' => 'select',
                            'multiple' => true,
                            'label' => [
                                'text' => __('Categories')
                            ]
                        ]
                    );
                    ?>
                    <div id="img-container">
                        <?php
                        echo $this->Form->input(
                            'photo',
                            [
                                'type' => 'file',
                                'label' => [
                                    'text' => __('Add photo'),
                                    'class' => 'control-label photo-label btn-secondary'
                                ],
                                'class' => 'inputfile',
                                'templates' => [
                                    'file' => '<input type="file" name="{{name}}"{{attrs}}><span id="file-name"></span>'
                                ]
                            ]
                        );
                        ?>
                        <div id="image-content" class="content-image"
                            <?php echo (isset($article->photo) && !empty($article->photo)) ? 'style="background-image: url(\''
                                . DS . UserComponent::IMAGE_PREFIX . DS . $article->photo . '\')"' : ''; ?>></div>

                    </div>
                    <?php
                    echo $this->Form->submit(__('Save content'), ['class' => 'btn']);
                    ?>
                </div>
            </div>
            <?php
            echo $this->Form->end();
            ?>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        CKEDITOR.replace('preview', {
            language: 'pl',
            filebrowserUploadUrl: '/fileHandler/upload.json',
            imageUploadUrl: '/fileHandler/upload.json',
            uploadUrl: '/fileHandler/upload.json',
            disableNativeSpellChecker: false
        });
        CKEDITOR.replace('description', {
            language: 'pl',
            filebrowserUploadUrl: '/fileHandler/upload.json',
            imageUploadUrl: '/fileHandler/upload.json',
            uploadUrl: '/fileHandler/upload.json',
            disableNativeSpellChecker: false
        });
        contentView.bindSelect('<?= __('You can only select 3 items') ?>');
        $("#form-content").validate({
            ignore: [],
            debug: false,
            errorPlacement: function (error, element) {
                if (element[0].name == 'description'
                    || element[0].name == 'preview'
                    || element[0].name == 'categories[_ids][]') {
                    error.appendTo(element.parent());
                } else {
                    error.insertAfter(element);
                }
            },
            rules: {
                title: "required",
                "categories[_ids][]": {
                    required: true,
                    maxlength: 3
                },
            },
            messages: {
                title: {
                    required: "<?= __('Field cannot be empty.') ?>"
                },
                "categories[_ids][]": {
                    required: "<?= __('Field cannot be empty.') ?>",
                    maxlength: "<?= __('Field cannot be empty.') ?>"
                }
            }
        });
        $('#type-id').on('change', function () {
            if (parseInt($(this).val()) === 1) {
                $('#img-container').show();
                $("#preview").rules("add", {
                    required: function () {
                        CKEDITOR.instances.preview.updateElement();
                        if (!CKEDITOR.instances.preview.getData().replace(/<[^>]*>/gi, '').length) {
                            return true;
                        }
                    },
                    messages: {
                        required: "<?= __('Field cannot be empty.') ?>"
                    }
                });
            } else if (parseInt($(this).val()) === 2) {
                $('#img-container').hide();
                $("#preview").rules("remove", "required");
                $("#description").rules("remove", "required");
            }
        }).trigger('change');
        contentView.bindImagePreview();
    });
</script>
