<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $items
 * @var $newsletter
 */

?>
<div class="articles-list-page newsletter-page">
    <div class="user-page">
        <div class="container">
            <ul class="nav nav-tabs art-tabs" role="tablist">
                <li role="presentation" class="active">
                    <?= $this->Html->link(__('New newsletter'),
                        [
                            'plugin' => 'Newsletter',
                            'controller' => 'Newsletter',
                            'action' => 'index'
                        ], [
                            'class' => 'current-tab'
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
                <li role="presentation">
                    <?= $this->Html->link(__('Mailing'),
                        [
                            'plugin' => 'Newsletter',
                            'controller' => 'Newsletter',
                            'action' => 'mailingToUsersGroup'
                        ], [
                            'class' => 'history-tab'
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
                        <h1><?= __('New newsletter'); ?></h1>
                        <?php
                        if ((int)date('N', time()) === 6 && (int)date('G', time()) < 18) {
                            $date = date('d.m.Y');
                        } else {
                            $date = date('d.m.Y',
                                strtotime('next Saturday', strtotime(date('d.m.Y'))));
                        }
                        ?>
                        <p class="send-time"><span><?= __('Sending') ?>:</span> <?= $date ?></p>
                    </div>
                </div>
                <div class="container">
                    <?php
                    if (isset($newsletter->id) && !empty($newsletter->id)) {
                        ?>
                        <div class="filters">
                            <div class="accept-buttons">
                                <?php
                                if (!$newsletter->is_accepted) {
                                    echo $this->Form->create($newsletter, [
                                        'url' => [
                                            'plugin' => 'Newsletter',
                                            'controller' => 'Newsletter',
                                            'action' => 'accept',
                                            $newsletter->id,
                                            '_ext' => 'json'
                                        ],
                                        'type' => 'GET',
                                        'id' => 'newsletter-accept'
                                    ]);
                                    echo $this->Form->submit(__('Accept newsletter'), [
                                        'id' => 'accept-button',
                                        'class' => 'btn-accept btn-accept-newsletter'
                                    ]);
                                    echo $this->Form->end();
                                } else {
                                    ?>
                                    <input class="btn-accept btn-accept-newsletter"
                                           disabled="disabled"
                                           type="submit" value="<?= __('Newsletter is accepted') ?>">
                                    <?php
                                }
                                ?>
                            </div>
                        </div>
                        <div class="whiteBg">
                            <?php
                            if (!$newsletter->is_accepted) {
                                echo $this->Form->create($newsletter, [
                                    'url' => [
                                        'plugin' => 'Newsletter',
                                        'controller' => 'Newsletter',
                                        'action' => 'description',
                                        '_ext' => 'json'
                                    ],
                                    'id' => 'newsletter-form'
                                ]);
                                echo $this->Form->input('id', [
                                    'type' => 'hidden'
                                ]);
                                echo $this->Form->input('description', [
                                    'label' => [
                                        'text' => __('Email beginning')
                                    ],
                                    'type' => 'textarea'
                                ]);
                                echo $this->Form->button('<span class=""></span>' . __('Add'), [
                                    'type' => 'submit',
                                    'id' => 'newsletter-button',
                                    'class' => 'submit-form'
                                ]);
                                echo $this->Form->end();
                            } else {
                                echo $this->Form->create($newsletter, [
                                    'id' => 'newsletter-form'
                                ]);
                                echo $this->Form->input('description', [
                                    'label' => [
                                        'text' => __('Email beginning')
                                    ],
                                    'type' => 'textarea',
                                    'disabled' => 'disabled'
                                ]);
                                echo $this->Form->end();
                            }
                            ?>
                        </div>
                        <div class="list-inner-content">
                            <div class="filters">
                                <div class="top-actions">
                                    <?php
                                    if (!$newsletter->is_accepted) {
                                        echo $this->Html->link(__('Add / Remove content'),
                                            [
                                                'plugin' => 'Articles',
                                                'controller' => 'Articles',
                                                'action' => 'newsletter'
                                            ], [
                                                'class' => 'btn'
                                            ]
                                        );
                                    }
                                    ?>
                                </div>
                            </div>
                            <label class="control-label"><?= __('List of content to send') ?></label>
                            <div class="news-list">
                                <?php
                                foreach ($items as $item) {
                                    $itemPhoto = UserComponent::IMAGE_BLANK_CONTENT;
                                    if (!empty($item->photo)) {
                                        $itemPhoto = $item->photo;
                                    }
                                    if ((int)$item->type_id === ArticlesController::TYPE_ARTICLE) {
                                        $badge = '<span class="badge badge-article">' . __('News') . '</span>';
                                    } else {
                                        $badge = '<span class="badge">' . __('Question') . '</span>';
                                    }
                                    ?>
                                    <div class="news-list-item">
                                        <a href="#" class="item-img"
                                           style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $itemPhoto ?>) no-repeat center; background-size: cover;"></a>
                                        <div class="item-title">
                                            <div class="article-categories">
                                                <?= $badge ?>
                                                <?php
                                                foreach ($item->categories as $itemCategory) {
                                                    echo $this->Html->link($itemCategory->name, [
                                                        'plugin' => 'Articles',
                                                        'controller' => 'Articles',
                                                        'action' => 'contents',
                                                        $itemCategory->id
                                                    ]);
                                                }
                                                ?>
                                            </div>
                                            <?php
                                            $itemVote = $this->Articles->renderVotes($item->counter_vote_result);
                                            ?>
                                            <?= $this->Html->link(
                                                '<h4>' . $item->title . ' <span class="vote">' . $itemVote . '</span></h4>
                                <p>' . $item->user->name . '</p>',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $item->id
                                                ]
                                            ); ?>
                                        </div>
                                        <div class="actions">
                                            <?php
                                            if (!$newsletter->is_accepted) {
                                                echo $this->Form->create(null, [
                                                    'url' => [
                                                        'plugin' => 'Newsletter',
                                                        'controller' => 'Newsletter',
                                                        'action' => 'remove',
                                                    ]
                                                ]);
                                                echo $this->Form->input('item', [
                                                    'type' => 'hidden',
                                                    'value' => $item->id
                                                ]);
                                                echo $this->Form->button('<span class="glyphicon glyphicon-trash"></span>',
                                                    [
                                                        'type' => 'submit',
                                                        'class' => 'removeItem',
                                                        'data-original-title' => __('Remove from list'),
                                                        'name' => 'button',
                                                        'value' => 'remove'
                                                    ]
                                                );
                                                echo $this->Form->end();
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <?php
                                }
                                ?>
                            </div>
                        </div>
                        <?php
                        echo $this->element('CryptoTheme.paginator');
                    } else {
                        ?>
                        <div class="filters"></div>
                        <div class="list-inner-content">
                            <label class="control-label"><?= __('No active newsletter at the moment.') ?></label>
                        </div>
                        <?php
                    }
                    ?>
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
        $('#newsletter-form').on("submit", function (e) {
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
            e.preventDefault();
            var button = $('#newsletter-button');
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
        $('#newsletter-accept').on("submit", function (e) {
            e.preventDefault();
            var button = $('#accept-button');
            button.attr("disabled", true);
            var form = $(this);
            $.ajax({
                url: form.attr("action"),
                type: "GET",
                data: form.serialize(),
                success: function (result) {
                    alert(result.message);
                    if (result.success) {
                        window.location.reload();
                    } else {
                        button.attr("disabled", false);
                    }
                }
            });
        });
    });
</script>
