<?php

use Banners\Controller\BannersController;

/**
 * @var $category
 */

?>
<div class="articles-list-page category-edit">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Edit category'); ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="page-inner-content add-content">
            <?php
            echo $this->Form->create($category, ['type' => 'POST']);
            ?>
            <div class="add-content-inner">
                <div class="add-content-main">
                    <?php
                    echo $this->Form->input('name',
                        [
                            'label' => [
                                'text' => __('Name')
                            ]
                        ]
                    );
                    ?>
                </div>
                <div class="add-content-side">
                    <?php
                    echo $this->Form->submit(__('Save category'), ['class' => 'btn']);
                    ?>
                </div>
            </div>
            <?php
            echo $this->Form->end();
            ?>
        </div>
    </div>
</div>
