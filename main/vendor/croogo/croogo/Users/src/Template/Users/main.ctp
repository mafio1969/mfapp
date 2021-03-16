<?php

use Croogo\Core\Router;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $banners
 * @var $categories
 * @var $questions
 * @var $newestQuestions
 * @var $articles
 * @var $userGlobalPermissions
 */

$this->assign('title', __('Cryptocurrencies, virtual currency - knowledge base for the investor'));

if ($banners->count() > 0) {
    ?>
    <div id="top-slider">
        <?php
        foreach ($banners as $banner) {
            $bannerPhoto = UserComponent::IMAGE_BLANK_BANNER;
            if (!empty($banner->photo)) {
                $bannerPhoto = $banner->photo;
            }
            ?>
            <div class="slide">
                <a href="<?= $banner->link_url ?>">
                    <div class="slide-inner"
                         style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $bannerPhoto ?>) no-repeat center; background-size: cover;">
                        <div class="overlay-bg"></div>
                        <div class="caption">
                            <h4><?= $banner->title ?></h4>
                            <p><?= $banner->user->name ?></p>
                        </div>
                    </div>
                </a>
            </div>
            <?php
        }
        ?>
    </div>
    <?php
}
?>
<div class="home-content">
    <div class="row homeRow">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 articles homeCol">
            <h5><?= __('News'); ?></h5>
            <?php
            if(isset($userGlobalPermissions[UsersController::ROLE_PUBLISHER_I]) || isset($userGlobalPermissions[UsersController::ROLE_PUBLISHER_II])) {

            if ($userGlobalPermissions[UsersController::ROLE_PUBLISHER_I]
                || $userGlobalPermissions[UsersController::ROLE_PUBLISHER_II]) {
            ?>
            <div class="homeAdd">
                <?php
                echo $this->Html->link(
                    '<span class="glyphicon glyphicon-plus"></span> ' . __('Add news'),
                    [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'add',
                        '?' => ['type' => 'article']
                    ],
                    [
                        'class' => 'btn-secondary'
                    ]
                );
                ?>
            </div>
            <?php
                }
            }
            ?>
            <div class="news-list">
                <?php
                foreach ($articles as $keyArticle => $article) {
                    $articleImage = isset($article->photo) && !empty($article->photo) ? DS . UserComponent::IMAGE_PREFIX . DS . $article->photo : '/img/news4.jpg';
                    $articleVote = $this->Articles->renderVotes($article->counter_vote_result);
                    $articleCommentsCounter = (int)$article->counter_comments + (int)$article->counter_sub_comments;
                    ?>
                    <div class="news-list-item">
                        <?= $this->Html->link('',
                            [
                                'plugin' => 'Articles',
                                'controller' => 'Articles',
                                'action' => 'view',
                                $article->id
                            ],
                            [
                                'class' => 'item-img',
                                'style' => 'background: url(' . $articleImage . ') no-repeat center; background-size: cover;'
                            ]
                        ); ?>
                        <div class="item-title">
                            <?= $this->Html->link('<h4>'
                                . $article->title . '<span class="count-comments">' . (int)$article->counter_comments .  ' <span class="vote">' . (int)$article->counter_up_vote . '</span></span></h4>
                                    <p>' . $article->user->name . '</p>', [
                                'plugin' => 'Articles',
                                'controller' => 'Articles',
                                'action' => 'view',
                                $article->id
                            ]); ?>
                        </div>
                    </div>
                    <?php
                }
                ?>
            </div>
            <div class="seeMore">
                <?= $this->Html->link(__('See more') . '<span class="see-arrow"></span>',
                    [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'search',
                        '?' => ['type' => 'articles']
                    ],
                    [
                        'class' => 'more'
                    ]
                ); ?>
            </div>
        </div>

        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 questions homeCol">
            <h5><?= __('Popular questions'); ?></h5>
            <?php
            if(isset($userGlobalPermissions[UsersController::ROLE_PUBLISHER_I]) || isset($userGlobalPermissions[UsersController::ROLE_PUBLISHER_II])) {
                if ($userGlobalPermissions[UsersController::ROLE_PUBLISHER_I]
                || $userGlobalPermissions[UsersController::ROLE_PUBLISHER_II]) {
            ?>
            <div class="homeAdd">
                <?php
                echo $this->Html->link(
                    '<span class="glyphicon glyphicon-plus"></span> ' . __('Add question'),
                    [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'add',
                        '?' => ['type' => 'question']
                    ],
                    [
                        'class' => 'btn-secondary'
                    ]
                );
                ?>
            </div>
            <?php
                }
            }
            ?>
            <div class="questCol">
                <ul>
                    <?php
                    foreach ($questions as $question) {
                        ?>
                        <li>
                            <?php
                            $questionVote = $this->Articles->renderVotes($question->counter_vote_result);
                            echo $this->Html->link($question->title .
                            '<span class="count-comments">' . (int)$question->counter_comments .  ' <span class="vote">' . (int)$question->counter_up_vote . '</span></span>',
                                [
                                    'plugin' => 'Articles',
                                    'controller' => 'Articles',
                                    'action' => 'view',
                                    $question->id
                                ]);
                            ?>
                        </li>
                        <?php
                    }
                    ?>
                </ul>
            </div>
            <div class="seeMore">
                <?= $this->Html->link(__('See more') . '<span class="see-arrow"></span>',
                    [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'search',
                        '?' => ['type' => 'questions', 'sort' => 'counter_up_vote', 'direction' => 'desc']
                    ],
                    [
                        'class' => 'more'
                    ]
                ); ?>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 news homeCol">
            <h5><?= __('Newest questions'); ?></h5>
            <div class="questCol">
                <ul>
                    <?php
                    foreach ($newestQuestions as $newQuestion) {
                        ?>
                        <li>
                            <?php
                            $newQuestionVote = $this->Articles->renderVotes($newQuestion->counter_vote_result);
                            echo $this->Html->link($newQuestion->title .
                            '<span class="count-comments">' . (int)$newQuestion->counter_comments .  ' <span class="vote">' . (int)$newQuestion->counter_up_vote . '</span></span>',
                                [
                                    'plugin' => 'Articles',
                                    'controller' => 'Articles',
                                    'action' => 'view',
                                    $newQuestion->id
                                ]);
                            ?>
                        </li>
                        <?php
                    }
                    ?>
                </ul>
            </div>
            <div class="seeMore">
                <?= $this->Html->link(__('See more') . '<span class="see-arrow"></span>',
                    [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'search',
                        '?' => ['type' => 'questions']
                    ],
                    [
                        'class' => 'more'
                    ]
                ); ?>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 categories homeCol">
            <h5><?= __('Categories'); ?></h5>
            <div class="catCol">
                <ul>
                    <?php
                    foreach ($categories as $category) {
                        ?>
                        <li><?= $this->Html->link($category->name . '<span class="nb">' . $category->counter_pop . '</span>',
                                [
                                    'plugin' => 'Articles',
                                    'controller' => 'Articles',
                                    'action' => 'contents',
                                    $category->id
                                ]); ?>
                        </li>
                        <?php
                    }
                    ?>
                </ul>
            </div>
            <div class="seeMore">
                <?= $this->Html->link(__('See more') . '<span class="see-arrow"></span>',
                    [
                        'plugin' => 'Categories',
                        'controller' => 'Categories',
                        'action' => 'index'
                    ],
                    [
                        'class' => 'more'
                    ]
                ); ?>
            </div>
        </div>
    </div>
</div>
