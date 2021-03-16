<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $fieldsOptions
 * @var $items
 * @var $userGlobalPermissions
 */

$this->assign('title', __('Contents'));
?>
<div class="articles-list-page contents-page">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Contents') ?></h1>
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
            echo $this->Form->input('type', $options);
            echo $this->Form->input('q', [
                'label' => false,
                'placeholder' => __('Search for content'),
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
                $classAsc = $classDesc = $classDescVote = '';
                if (isset($queryParams['direction']) && $queryParams['direction'] == 'asc') {
                    $classAsc = 'active';
                } elseif (isset($queryParams['sort']) && $queryParams['sort'] == 'counter_up_vote') {
                    $classDescVote = 'active';
                } else {
                    $classDesc = 'active';
                }
                $urlDescVote = array_merge(
                    ['sort' => 'counter_up_vote', 'direction' => 'desc'],
                    [],
                    ['order' => null]
                );
                $urlDescVote = $this->Paginator->generateUrl($urlDescVote, $this->Paginator->defaultModel());
                echo $this->Html->link(__('Most popular'), $urlDescVote, ['class' => 'desc-vote ' . $classDescVote]);
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
            <div class="news-list">
                <?php
                foreach ($items as $item) {
                    $itemPhoto = UserComponent::IMAGE_BLANK_CONTENT;
                    $questionClass = '';
                    if (!empty($item->photo)) {
                        $itemPhoto = $item->photo;
                    }
                    if ((int)$item->type_id === ArticlesController::TYPE_ARTICLE) {
                        $badge = '<span class="badge badge-article">' . __('News') . '</span>';
                        $questionClass = '';
                    } else {
                        $badge = '<span class="badge">' . __('Question') . '</span>';
                        $questionClass = 'questionClass';
                    }
                    ?>
                    <div class="news-list-item">
                        <span class="article-dataTime"><?= $item->created ?></span>
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
                        <div class="item-title <?php echo $questionClass; ?>">
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
                            <?= $this->Html->link(
                                '<h4>' . $item->title . '<span class="count-comments">' . (int)$item->counter_comments .  ' <span class="vote">' . (int)$item->counter_up_vote . '</span></span></h4>'
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
                ?>
            </div>
        </div>
        <?php
        echo $this->element('CryptoTheme.paginator');
        ?>
    </div>
</div>
