<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $fieldsOptions
 * @var $items
 * @var $userGlobalPermissions
 */

?>
<div class="articles-list-page">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Add / Remove items') ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="filters">
            <?php
            echo $this->Form->create(null, [
                'type' => 'GET',
                'novalidate' => true,
                'url' => [
                    'plugin' => 'Articles',
                    'controller' => 'Articles',
                    'action' => 'search'
                ],
            ]);
            $options = [
                'empty' => false,
                'required' => false,
                'type' => 'select',
                'label' => false,
                'options' => $fieldsOptions['type']
            ];
            $options['default'] = $this->request->query('type');
            $this->Form->unlockField('type');
            echo $this->Form->input(__('type'), $options);
            echo $this->Form->input(__('q'), [
                'label' => false,
                'value' => $this->request->getQuery('q')
            ]);
            echo $this->Form->submit(__('Filter'), ['type' => 'submit', 'class' => 'btn']);
            echo $this->Html->link('Reset', [
                'action' => 'search',
            ], [
                'class' => 'btn reset',
            ]);
            echo $this->Form->end();
            ?>
            <div class="sort">
                <?php
                $queryParams = $this->request->getQueryParams();
                $classAsc = $classDesc = '';
                if (isset($queryParams['direction']) && $queryParams['direction'] == 'asc') {
                    $classAsc = 'active';
                } elseif (isset($queryParams['direction']) && $queryParams['direction'] == 'desc') {
                    $classDesc = 'active';
                }
                $urlDesc = array_merge(
                    ['sort' => 'updated', 'direction' => 'desc'],
                    [],
                    ['order' => null]
                );
                $urlDesc = $this->Paginator->generateUrl($urlDesc, $this->Paginator->defaultModel());
                echo $this->Html->link(__('Newest'), $urlDesc, ['class' => 'desc ' . $classDesc]);
                $urlAsc = array_merge(
                    ['sort' => 'updated', 'direction' => 'asc'],
                    [],
                    ['order' => null]
                );
                $urlAsc = $this->Paginator->generateUrl($urlAsc, $this->Paginator->defaultModel());
                echo $this->Html->link(__('Oldest'), $urlAsc, ['class' => 'asc ' . $classAsc]);
                ?>
            </div>
        </div>
        <div class="list-inner-content">
            <?php if ($userGlobalPermissions[UsersController::ROLE_NEWSLETTER_ACCEPT]) {
                ?>
                <div class="update-newsletter">
                    <?php
                    echo $this->Form->create('Newsletter', [
                        'id' => 'form-newsletter',
                        'url' => [
                            'plugin' => 'Newsletter',
                            'controller' => 'Newsletter',
                            'action' => 'add',
                            '_ext' => 'json'
                        ]
                    ]);
                    echo $this->Form->input('select-all', [
                        'type' => 'checkbox',
                        'templates' => [
                            'checkboxContainer' => '<div class="form-group {{type}}{{required}}">{{content}}</div>'
                        ],
                        'label' => [
                            'text' => __('Select all')
                        ]
                    ]);
                    echo $this->Form->submit(__('Update newsletter'), ['class' => 'btn-newsletter']);
                    ?>
                </div>
            <?php } ?>
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
                        <?php
                        if ($userGlobalPermissions[UsersController::ROLE_NEWSLETTER_ACCEPT]) {
                            $checked = 0;
                            $checkedClass = '';
                            if ($item->is_newsletter) {
                                $checked = 1;
                                $checkedClass = 'checked';
                            }
                            echo $this->Form->checkbox('newsletter[' . $item->id . '][element]', [
                                'checked' => $checked,
                                'class' => 'check-item ' . $checkedClass,
                                'label' => ['text' => 'Newsletter']
                            ]);
                        }
                        ?>
                        <?= $this->Html->link('',
                            [
                                'plugin' => 'Articles',
                                'controller' => 'Articles',
                                'action' => 'view',
                                $item->id
                            ],
                            [
                                'class' => 'item-img',
                                'style' => 'background: url(' . DS . UserComponent::IMAGE_PREFIX . DS . $itemPhoto . ') no-repeat center; background-size: cover;'
                            ]
                        ); ?>
                        <div class="item-title">
                            <div class="article-categories">
                                <?= $badge ?>
                                <?php
                                foreach ($item->categories as $category) {
                                    echo $this->Html->link($category->name,
                                        [
                                            'plugin' => 'Articles',
                                            'controller' => 'Articles',
                                            'action' => 'contents',
                                            $category->id
                                        ]);
                                }
                                ?>
                            </div>
                            <?php
                            $itemVote = $this->Articles->renderVotes($item->counter_vote_result);
                            ?>
                            <?= $this->Html->link(
                                '<h4>' . $item->title . ' <span class="vote">' . $itemVote . '</span></h4>'
                                . '<p>' . $item->user->name . '</p>',
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
                            if (false) {
                                ?>
                                <button class="btn-outline dropdown-toggle" type="button" id="dropdownMenu1"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span
                                        class="glyphicon glyphicon-option-horizontal"></span></button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li>
                                        <?= $this->Html->link(
                                            __('Edit'),
                                            [
                                                'plugin' => 'Articles',
                                                'controller' => 'Articles',
                                                'action' => 'edit',
                                                $item->id
                                            ]
                                        ); ?>
                                    </li>
                                </ul>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                    <?php
                }
                if ($userGlobalPermissions[UsersController::ROLE_NEWSLETTER_ACCEPT]) {
                    echo $this->Form->end();
                }
                ?>
            </div>
        </div>
        <?php
        echo $this->element('CryptoTheme.paginator');
        ?>
    </div>
</div>
<script>
    $(document).ready(function () {
        <?php
        if ($userGlobalPermissions[UsersController::ROLE_NEWSLETTER_ACCEPT]) {
        ?>
        $("#form-newsletter").on("submit", function (e) {
            e.preventDefault();
            var form = $(this);
            if (form.validate()) {
                $.ajax({
                    url: form.attr("action"),
                    type: "POST",
                    data: form.serialize(),
                    success: function (result) {
                        alert(result.message);
                    }
                });
            }
        });
        $('#select-all').on("click", function () {
            if ($(this).prop("checked") == true) {
                $('.check-item').prop('checked', true).addClass('checked');
            } else {
                $('.check-item').prop('checked', false).removeClass('checked');
            }
        })
        <?php
        }
        ?>
    });
</script>
