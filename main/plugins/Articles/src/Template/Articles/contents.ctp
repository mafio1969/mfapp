<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $categoryId
 * @var $categoryName
 * @var $subscribedCategory
 * @var $fieldsOptions
 * @var $items
 * @var $userGlobalPermissions
 */

if (strlen($categoryName) > 25) {
    $this->assign('title', $categoryName);
} else {
    $this->assign(
        'title',
        sprintf(
            '%s - %s',
            $categoryName,
            __('questions from category')
        )
    );
}

?>
<div class="articles-list-page">
    <div class="page-title">
        <div class="container">
            <h1><?= $categoryName ?></h1>
            <?php
            $userId = $this->request->getSession()->read('Auth.User.id');
            if ($userId) {
                ?>
                <div class="subscriptions-container">
                <?= $this->Html->link(__('Unsubscribe'),
                    [
                        'plugin' => 'Subscriptions',
                        'controller' => 'Subscriptions',
                        'action' => 'deleteCategorySubscription',
                        $categoryId,
                        '_ext' => 'json'
                    ], [
                        'class' => 'subscription sub '.($subscribedCategory ? '' : 'subInActiveButton'),
                        'title' => 'delete subscription'
                    ]
                ); ?>
                <?= $this->Html->link(__('Subscribe'),
                    [
                        'plugin' => 'Subscriptions',
                        'controller' => 'Subscriptions',
                        'action' => 'addCategorySubscription',
                        $categoryId,
                        '_ext' => 'json'
                    ], [
                        'class' => 'subscription '.($subscribedCategory ? 'subInActiveButton' : ''),
                        'title' => 'add subscription'
                    ]
                ); ?>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
    <div class="container">
        <div class="filters">
            <?php
            echo $this->Form->create(null, [
                'type' => 'GET',
                'novalidate' => true,
                'class' => 'search-top',
                'url' => [
                    'plugin' => 'Articles',
                    'controller' => 'Articles',
                    'action' => 'contents',
                    $categoryId
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
            echo $this->Form->input('type', $options);
            echo $this->Form->input('q', [
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
            <div class="top-actions">
            </div>
            <div class="sort">
                <?php
                $queryParams = $this->request->getQueryParams();
                $classAsc = $classDesc = '';
                if (isset($queryParams['direction']) && $queryParams['direction'] == 'asc') {
                    $classAsc = 'active';
                } else {
                    $classDesc = 'active';
                }

                $urlDesc = array_merge(
                    ['sort' => 'created', 'direction' => 'desc'],
                    [],
                    ['order' => null]
                );
                $urlDesc = $this->Paginator->generateUrl($urlDesc, $this->Paginator->defaultModel());
                echo $this->Html->link(__('Newest'), $urlDesc, ['class' => 'desc ' . $classDesc]);
                $urlAsc = array_merge(
                    ['sort' => 'created', 'direction' => 'asc'],
                    [],
                    ['order' => null]
                );
                $urlAsc = $this->Paginator->generateUrl($urlAsc, $this->Paginator->defaultModel());
                echo $this->Html->link(__('Oldest'), $urlAsc, ['class' => 'asc ' . $classAsc]);
                ?>
            </div>
        </div>
        <div class="list-inner-content">
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
                        if ((int)$item->type_id === ArticlesController::TYPE_ARTICLE) {
                            echo $this->Html->link('',
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
                            );
                        }
                        ?>
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
                                . '<p>' . __('by') . ' ' . $item->user->name . '</p>',
                                [
                                    'plugin' => 'Articles',
                                    'controller' => 'Articles',
                                    'action' => 'view',
                                    $item->id
                                ]
                            ); ?>
                        </div>
                    </div>
                    <?php
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
    contentView.bindSubscription();
});
</script>
