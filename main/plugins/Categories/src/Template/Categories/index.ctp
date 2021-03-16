<?php

use Croogo\Users\Controller\UsersController;

/**
 * @var $categories
 * @var $userGlobalPermissions
 */

$this->assign('title', __('Categories'));
?>
<div class="articles-list-page category-index">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Categories'); ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="filters">
            <?php
            if ($this->request->getSession()->read('Auth.User.id')
                && $userGlobalPermissions[UsersController::ROLE_EDITOR]) {
                echo $this->Html->link('<span class="glyphicon glyphicon-plus"></span> ' . __('Add category'),
                    [
                        'plugin' => 'Categories',
                        'controller' => 'Categories',
                        'action' => 'add'
                    ], [
                        'class' => 'btn'
                    ]
                );
            }
            ?>
        </div>
        <div class="list-inner-content categories-list">
            <div class="news-list">
                <?php
                foreach ($categories as $category) {
                    ?>
                    <div class="news-list-item">
                        <div class="item-title">
                            <?= $this->Html->link('<h4>' . $category->name . '</h4>',
                                [
                                    'plugin' => 'Articles',
                                    'controller' => 'Articles',
                                    'action' => 'contents',
                                    $category->id
                                ]
                            ); ?>
                        </div>
                        <?php
                        if ($this->request->getSession()->read('Auth.User.id')
                            && $userGlobalPermissions[UsersController::ROLE_EDITOR]) {
                            ?>
                            <div class="actions">
                                <button class="btn-outline dropdown-toggle" type="button" id="dropdownMenu1"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span
                                        class="glyphicon glyphicon-option-vertical"></span></button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li>
                                        <?= $this->Html->link(__('Edit'), [
                                            'plugin' => 'Categories',
                                            'controller' => 'Categories',
                                            'action' => 'edit',
                                            $category->id
                                        ]) ?>
                                    </li>
                                    <li>
                                        <?= $this->Html->link(__('Delete'), [
                                            'plugin' => 'Categories',
                                            'controller' => 'Categories',
                                            'action' => 'delete',
                                            $category->id
                                        ]) ?>
                                    </li>
                                </ul>
                            </div>
                            <?php
                        }
                        $userId = $this->request->getSession()->read('Auth.User.id');
                        $subscribed = isset($category->categories_subscriptions[0]->created);
                        if ($userId) {
                            ?>
                            <div class="subscriptions-container">
                            <?= $this->Html->link(__('Unsubscribe'),
                                [
                                    'plugin' => 'Subscriptions',
                                    'controller' => 'Subscriptions',
                                    'action' => 'deleteCategorySubscription',
                                    $category->id,
                                    '_ext' => 'json'
                                ], [
                                    'class' => 'subscription sub '.($subscribed ? '' : 'subInActiveButton'),
                                    'title' => 'delete subscription'
                                ]
                            ); ?>
                            <?= $this->Html->link(__('Subscribe'),
                                [
                                    'plugin' => 'Subscriptions',
                                    'controller' => 'Subscriptions',
                                    'action' => 'addCategorySubscription',
                                    $category->id,
                                    '_ext' => 'json'
                                ], [
                                    'class' => 'subscription '.($subscribed ? 'subInActiveButton' : ''),
                                    'title' => 'add subscription'
                                ]
                            ); ?>
                            </div>
                            <?php
                        }
                        ?>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function () {
    contentView.bindSubscription();
});
</script>
