<?php

use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $banners
 */

?>
<div class="articles-list-page banners">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Banners'); ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="filters">
            <?php
            echo $this->Form->create(null, [
                'type' => 'GET',
                'novalidate' => true,
                'url' => [
                    'plugin' => 'Banners',
                    'controller' => 'Banners',
                    'action' => 'index'
                ],
                'class' => 'search-top'
            ]);
            echo $this->Form->input('active', [
                'label' => false,
                'type' => 'select',
                'empty' => __('All'),
                'options' => [
                    'active' => __('Active'),
                    'inactive' => __('Inactive')
                ],
                'value' => $this->request->getQuery('active')
            ]);
            echo $this->Form->input('name', [
                'label' => false,
                'placeholder' => __('Search for banner'),
                'value' => $this->request->getQuery('name')
            ]);
            echo $this->Form->submit(__('Filter'), ['type' => 'submit', 'class' => 'btn']);
            echo $this->Html->link('Reset', [
                'action' => 'search',
            ], [
                'class' => 'btn reset',
            ]);
            echo $this->Form->end();
            ?>
            <div class="top-actions">
                <?= $this->Html->link('<span class="glyphicon glyphicon-plus"></span> ' . __('Add banner'),
                    [
                        'plugin' => 'Banners',
                        'controller' => 'Banners',
                        'action' => 'add'
                    ], [
                        'class' => 'btn'
                    ]
                );
                ?>
            </div>
            <div class="sort">
                <?php
                $queryParams = $this->request->getQueryParams();
                $classAsc = $classDesc = '';
                if (isset($queryParams['direction']) && $queryParams['direction'] == 'asc') {
                    $classAsc = 'active';
                } elseif (!isset($queryParams['direction'])
                    || (isset($queryParams['direction']) && $queryParams['direction'] == 'desc')) {
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
        <div class="list-inner-content banners-list">
            <?php
            echo $this->Form->create(null, [
                'novalidate' => true,
                'url' => [
                    'plugin' => 'Banners',
                    'controller' => 'Banners',
                    'action' => 'remove'
                ],
            ]);
            ?>
            <div class="select-action">
                <?= $this->Form->input('select-all', [
                    'type' => 'checkbox',
                    'class' => 'select-all',
                    'label' => ['text' => __('Select all')],
                    'templates' => ['checkboxContainer' => '<div class="form-group {{type}}{{required}}">{{content}}</div>']
                ]);
                ?>
                <?= $this->Form->button('<span class="glyphicon glyphicon-trash"></span>', [
                    'name' => 'button',
                    'value' => 'remove',
                    'data-original-title' => __('Delete')
                ]) ?>
            </div>
            <div id="bannersList" class="news-list">
                <?php
                foreach ($banners as $banner) {
                    $active = '';
                    if ($banner->status) {
                        $active = 'banner-active';
                    }
                    $bannerPhoto = UserComponent::IMAGE_BLANK_BANNER;
                    if (!empty($banner->photo)) {
                        $bannerPhoto = $banner->photo;
                    }
                    ?>
                    <div id="items-<?= $banner->id ?>" class="news-list-item <?= $active ?>">
                        <?= $this->Form->input('actives._ids[]', [
                            'type' => 'checkbox',
                            'value' => $banner->id,
                            'class' => 'check-item',
                            'label' => false,
                            'id' => 'actives-ids-' . $banner->id,
                            'templates' => ['checkboxContainer' => '{{content}}']
                        ]);
                        ?>
                        <div class="item-img"
                             style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $bannerPhoto ?>) no-repeat center; background-size: cover;"></div>
                        <div class="item-title">
                            <h4><?= $banner->title ?></h4>
                            <p><?= __('Created by').' '.$banner->user->name ?></p>
                            <p><?= isset($banner->users_updated) ? __('Updated by').' '.$banner->users_updated->name : '' ?></p>
                        </div>
                        <div class="actions">
                            <button class="btn-outline dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span
                                    class="glyphicon glyphicon-option-horizontal"></span></button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li>
                                    <?= $this->Html->link(__('Edit'), [
                                        'plugin' => 'Banners',
                                        'controller' => 'Banners',
                                        'action' => 'edit',
                                        $banner->id
                                    ]) ?>
                                </li>
                                <li>
                                    <?= $this->Html->link(__('Delete'), [
                                        'plugin' => 'Banners',
                                        'controller' => 'Banners',
                                        'action' => 'delete',
                                        $banner->id
                                    ]) ?>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <?php
                }
                ?>
            </div>
            <?php
            echo $this->Form->end();
            ?>
        </div>
        <?php
        echo $this->element('CryptoTheme.paginator');
        ?>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#select-all').on("click", function () {
            if ($(this).prop("checked") == true) {
                $('.check-item').prop('checked', true).addClass('checked');
            } else {
                $('.check-item').prop('checked', false).removeClass('checked');
            }
        })
        $("#bannersList").sortable({
            update: function (event, ui) {
                $.ajax({
                    data: $(this).sortable('serialize'),
                    type: 'POST',
                    url: '<?=  $this->Url->build([
                        'plugin' => 'Banners',
                        'controller' => 'Banners',
                        'action' => 'sort',
                        '_ext' => 'json'
                    ]); ?>'
                });
            }
        });
    });
</script>
