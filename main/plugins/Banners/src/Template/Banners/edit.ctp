<?php

use Croogo\Users\Controller\Component\UserComponent;
use Banners\Controller\BannersController;

/**
 * @var $banner
 */

?>
<div class="articles-list-page banner-edit">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Edit banner'); ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="page-inner-content add-content">
            <?php
            echo $this->Form->create($banner, ['type' => 'file']);
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
                        'photo',
                        [
                            'type' => 'file',
                            'class' => 'inputfile',
                            'label' => [
                                'text' => __('Photo'),
                                'class' => 'control-label photo-label btn-secondary'
                            ],
                            'templates' => [
                                'file' => '<input type="file" name="{{name}}"{{attrs}}><span id="file-name"></span>'
                            ]
                        ]
                    );
                    ?>
                    <div class="image-content">
                        <?php
                        $imgSrc = '/img/default-img.jpg';
                        if (isset($banner->photo) && !empty($banner->photo)) {
                            $imgSrc = DS . UserComponent::IMAGE_PREFIX . DS . $banner->photo;
                        }
                        ?>
                        <img id="previewImage" alt="<?= __('Banner image') ?>"
                             class="" src="<?= $imgSrc ?>"/>
                    </div>
                    <?php
                    echo $this->Form->input(
                        'link_url',
                        [
                            'label' => [
                                'text' => __('Link')
                            ]
                        ]
                    );
                    ?>
                </div>
                <div class="add-content-side">
                    <?php
                    echo $this->Form->input(
                        'status',
                        [
                            'type' => 'select',
                            'options' => [
                                BannersController::STATUS_INACTIVE => __('Inactive'),
                                BannersController::STATUS_ACTIVE => __('Active')
                            ],
                            'label' => [
                                'text' => __('Status')
                            ]
                        ]
                    );
                    echo $this->Form->submit(__('Save banner'), ['class' => 'btn']);
                    ?>
                </div>
            </div>
            <?php
            echo $this->Form->end();
            ?>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function ($) {
        var p = $("#previewImage");
        $("body").on("change", "#photo", function () {
            var imageReader = new FileReader();
            imageReader.readAsDataURL(document.getElementById("photo").files[0]);
            imageReader.onload = function (oFREvent) {
                p.attr('src', oFREvent.target.result).fadeIn();
            };
        });

        $('#previewImage').imgAreaSelect({
            onSelectEnd: function (img, selection) {
                $('input[name="x1"]').val(selection.x1);
                $('input[name="y1"]').val(selection.y1);
                $('input[name="w"]').val(selection.width);
                $('input[name="h"]').val(selection.height);
            }
        });
    });
</script>

