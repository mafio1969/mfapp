<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $mailing
 */

?>
<div class="articles-list-page newsletter-page">
    <div class="user-page">
        <div class="container">
            <ul class="nav nav-tabs art-tabs" role="tablist">
                <li role="presentation">
                    <?= $this->Html->link(__('New newsletter'),
                        [
                            'plugin' => 'Newsletter',
                            'controller' => 'Newsletter',
                            'action' => 'index'
                        ], [
                            'class' => 'history-tab'
                        ]
                    );
                    ?>
                </li>
                <li role="presentation">
                    <?= $this->Html->link(__('History'),
                        [
                            'plugin' => 'Newsletter',
                            'controller' => 'Newsletter',
                            'action' => 'history'
                        ], [
                            'class' => 'history-tab'
                        ]
                    );
                    ?>
                </li>
                <li role="presentation" class="active">
                    <?= $this->Html->link(__('Mailing'),
                        [
                            'plugin' => 'Newsletter',
                            'controller' => 'Newsletter',
                            'action' => 'mailingToUsersGroup'
                        ], [
                            'class' => 'current-tab'
                        ]
                    );
                    ?>
                </li>
            </ul>
        </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="current">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Mailing to users group'); ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="filters">
                        <?php
                            echo $this->Form->create($mailing, [
                                'url' => [
                                    'plugin' => 'Newsletter',
                                    'controller' => 'Newsletter',
                                    'action' => 'saveMailing',
                                    '_ext' => 'json'
                                ],
                                'id' => 'mailing-form'
                            ]);
                            echo $this->Form->input('send_to_subscribed', [
                                'type' => 'checkbox',
                                'label' => [
                                    'text' => __('Send to subscribed')
                                ]
                            ]);
                        ?>
                        <br />
                        <?php
                            echo $this->Form->input('send_to_registered', [
                                'type' => 'checkbox',
                                'label' => [
                                    'text' => __('Send to registered')
                                ]
                            ]);
                        ?>
                        <br />
                        <?php
                            echo $this->Form->input('title', [
                                'type' => 'text',
                                'label' => [
                                    'text' => __('Title')
                                ],
                            ]);
                        ?>
                    </div>

                    <div class="whiteBg">
                        <?php
                            echo $this->Form->input('description', [
                                'label' => [
                                    'text' => __('Email beginning')
                                ],
                                'type' => 'textarea'
                            ]);
                            echo '<br />';
                            echo $this->Form->button('<span class=""></span>' . __('Add'), [
                                'type' => 'submit',
                                'id' => 'mailing-button',
                                'class' => 'submit-form'
                            ]);
                            echo $this->Form->end();
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        CKEDITOR.replace('description', {
            language: 'pl',
            filebrowserUploadUrl: '/fileHandler/upload'
        });
        $('#mailing-form').on("submit", function (e) {
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
            e.preventDefault();
            var button = $('#mailing-button');
            button.attr("disabled", true).find('span').addClass('loading');
            var form = $(this);
            $.ajax({
                url: form.attr("action"),
                type: "POST",
                data: form.serialize(),
                success: function (result) {
                    alert(result.message);
                    if (result.success) {
                        window.location.reload();
                    } else {
                        button.attr("disabled", false).find('span').removeClass('loading');
                    }
                }
            });
        });
    });
</script>
