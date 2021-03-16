<?php

use Croogo\Users\Controller\Component\UserComponent;
use Articles\Controller\ArticlesController;

/**
 * @var $users
 * @var $articles
 * @var $notesArticles
 * @var $comments
 * @var $categories
 */

?>
<div class="articles-list-page settings-subscription">
    <div class="user-page settings-page">
        <?= $this->element('Croogo/Users.setting_navigation') ?>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="subscriptions">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Subscriptions') ?></h1>
                    </div>
                </div>
                <div class="container">
                    <div class="user-inner-page">
                        <ul class="nav nav-tabs art-tabs" role="tablist">
                            <li role="presentation">
                                <a href="#notes" onclick="updateTabInUrlAddress('notes');" class="notes-tab" aria-controls="notes" role="tab"
                                   data-toggle="tab"><?= __('Replays and News Comments') ?></a>
                            </li>
                            <li role="presentation">
                                <a href="#articles" onclick="updateTabInUrlAddress('articles');" class="articles-tab" aria-controls="articles" role="tab"
                                   data-toggle="tab"><?= __('Contents') ?></a>
                            </li>
                            <li role="presentation">
                                <a href="#comments" onclick="updateTabInUrlAddress('comments');" class="comments-tab" aria-controls="comments" role="tab"
                                   data-toggle="tab"><?= __('Comments') ?></a>
                            </li>
                            <li role="presentation">
                                <a href="#users" onclick="updateTabInUrlAddress('users');" class="users-tab" aria-controls="users" role="tab"
                                   data-toggle="tab"><?= __('Users') ?></a>
                            </li>
                            <li role="presentation">
                                <a href="#categories" onclick="updateTabInUrlAddress('categories');" class="categories-tab" aria-controls="categories" role="tab"
                                   data-toggle="tab"><?= __('Categories') ?></a>
                            </li>
                        </ul>
                        <?php
                            $params = $this->request->getQueryParams();
                        ?>
                        <div class="tab-content news-list">
                            <div role="tabpanel" class="tab-pane" id="notes">
                                <div class="sort notes-sort">
                                    <a href="javascript:void(0);"
                                       onclick="updateSortOrderInUrlAddress('notes', 'desc');"
                                       class="desc <?= (isset($params['sort_notes']) && $params['sort_notes'] === 'asc') ? '' : 'active' ?>"
                                    >
                                        <?= __('Newest') ?>
                                    </a>
                                    <a href="javascript:void(0);"
                                       onclick="updateSortOrderInUrlAddress('notes', 'asc');"
                                       class="asc <?= (isset($params['sort_notes']) && $params['sort_notes'] === 'asc') ? 'active' : '' ?>"
                                    >
                                        <?= __('Oldest') ?>
                                    </a>
                                </div>
                                <?php
                                foreach ($notesArticles as $item) {
                                $itemPhoto = UserComponent::IMAGE_BLANK_CONTENT;
                                $questionClass = '';
                                if (!empty($item['article']->photo)) {
                                    $itemPhoto = $item['article']->photo;
                                }
                                if ((int)$item['article']->type_id === ArticlesController::TYPE_ARTICLE) {
                                    $badge = '<span class="badge badge-article">' . __('News') . '</span>';
                                    $questionClass = 'newsClass';
                                } else {
                                    $badge = '<span class="badge">' . __('Question') . '</span>';
                                    $questionClass = 'questionClass';
                                }
                                ?>
                                <div class="news-list-item">

                                    <div class="item-title <?php echo $questionClass; ?>">
                                        <?php

                                        if ((int)$item['article']->type_id === ArticlesController::TYPE_ARTICLE) {
                                            echo $this->Html->link('',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $item['article']->id
                                                ],
                                                [
                                                    'class' => 'item-img',
                                                    'style' => 'background: url(' . DS . UserComponent::IMAGE_PREFIX . DS . $itemPhoto . ') no-repeat center; background-size: cover; width: 60px; float:left;'
                                                ]
                                            );
                                        }
                                        ?>
                                        <div class="article-categories">
                                            <?= $badge ?>
                                            <?php
                                            foreach ($item['article']->categories as $category) {
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
                                        $itemVoteAccepts = $this->Articles->renderVotes($item['article']->counter_accepts);
                                        $itemVoteRejects = $this->Articles->renderVotes($item['article']->counter_rejects);
                                        ?>
                                        <?= $this->Html->link(
                                            '<h4>' . $item['article']->title . '<span class="count-comments">' . (int)$item['article']->counter_comments . ' <span class="vote">' . (int)$item['article']->counter_up_vote . '</span></span></h4>'
                                            . '<p>' . $item['article']->user->name . '</p>',
                                            [
                                                'plugin' => 'Articles',
                                                'controller' => 'Articles',
                                                'action' => 'view',
                                                $item['article']->id,
                                            ],
                                            [
                                                'class' => 'is-content',
                                                'style' => 'width:auto;'
                                            ]
                                        ); ?>
                                    </div>


                                    <?php
                                    foreach ($item['notes'] as $note) {
                                        ?>
                                        <div class="news-list-item report-comment ">
                                            <p class="user-information">

                                                <?php
                                                $userImage = (isset($note->user->image) && strlen($note->user->image) != 0) ? $note->user->image : 'profile.png';
                                                ?>
                                                <span class="user-img"
                                                      style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $userImage ?>) no-repeat center; background-size: cover;"></span>

                                            </p>
                                            <?php
                                            $userName = isset($note->user->name) ? $note->user->name : __('Deleted user');
                                            $description = $this->Text->truncate(strip_tags($note->description), 150);
                                            ?>
                                            <?= $this->Html->link('
                                    <div class="note-content">
                                        <h4 class="description">' . $description . '</h4>
                                        <span class="user-name">' . $userName . '</span>
                                    </div>',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'view',
                                                    $item['article']->id,
                                                    'open' => $note->id
                                                ],
                                                [
                                                    'class' => 'is-content',
                                                    'style' => 'width:auto;'
                                                ]
                                            ); ?>
                                            <p class="inbox-message-date"><?= __('Subscription date') ?></br><?= $note->noteCreatedSubscribe ?></p>
                                            <div class="actions">
                                                <?= $this->Html->link('<span
                                                    class="glyphicon glyphicon-trash"></span>',
                                                    [
                                                        'plugin' => 'Subscriptions',
                                                        'controller' => 'Subscriptions',
                                                        'action' => 'deleteNoteSubscription',
                                                        $note->id,
                                                        '_ext' => 'json'
                                                    ], [
                                                        'class' => 'subscription ',
                                                        'title' => 'delete subscription'
                                                    ]
                                                ); ?>
                                            </div>
                                        </div>

                                        <?php
                                    }
                                    echo '</div>';
                                    }
                                    ?>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="articles">
                                    <div class="sort articles-sort">
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('articles', 'desc');"
                                           class="desc <?= (isset($params['sort_articles']) && $params['sort_articles'] === 'asc') ? '' : 'active' ?>"
                                        >
                                            <?= __('Newest') ?>
                                        </a>
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('articles', 'asc');"
                                           class="asc <?= (isset($params['sort_articles']) && $params['sort_articles'] === 'asc') ? 'active' : '' ?>"
                                        >
                                            <?= __('Oldest') ?>
                                        </a>
                                    </div>
                                    <?php
                                    foreach ($articles as $item) {
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
                                                <?php
                                                $itemVoteAccepts = $this->Articles->renderVotes($item->counter_accepts);
                                                $itemVoteRejects = $this->Articles->renderVotes($item->counter_rejects);
                                                ?>
                                                <p class="inbox-message-date"><?= __('Subscription date') ?></br><?= $item->articleCreatedSubscribe ?></p>
                                                <?= $this->Html->link(
                                                    '<h4>' . $item->title . '<span class="count-comments">' . (int)$item->counter_comments . ' <span class="vote">' . (int)$item->counter_up_vote . '</span></span></h4>'
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
                                                <?= $this->Html->link('<span
                                                    class="glyphicon glyphicon-trash"></span>',
                                                    [
                                                        'plugin' => 'Subscriptions',
                                                        'controller' => 'Subscriptions',
                                                        'action' => 'deleteArticleSubscription',
                                                        $item->id,
                                                        '_ext' => 'json'
                                                    ], [
                                                        'class' => 'subscription ',
                                                        'title' => 'delete subscription'
                                                    ]
                                                ); ?>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="users">
                                    <div class="sort users-sort">
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('users', 'desc');"
                                           class="desc <?= (isset($params['sort_users']) && $params['sort_users'] === 'asc') ? '' : 'active' ?>"
                                        >
                                            <?= __('Newest') ?>
                                        </a>
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('users', 'asc');"
                                           class="asc <?= (isset($params['sort_users']) && $params['sort_users'] === 'asc') ? 'active' : '' ?>"
                                        >
                                            <?= __('Oldest') ?>
                                        </a>
                                    </div>
                                    <?php
                                    foreach ($users as $user) {
                                        ?>
                                        <div class="news-list-item report-comment ">
                                            <a href="<?= $this->Url->build([
                                                'plugin' => 'Croogo/Users',
                                                'controller' => 'Users',
                                                'action' => 'view',
                                                $user->id
                                            ]); ?>">
                                                <p>
                                                    <?php
                                                    $userImage = (isset($user->image) && strlen($user->image) != 0) ? $user->image : 'profile.png';
                                                    ?>
                                                    <span class="user-img"
                                                          style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $userImage ?>) no-repeat center; background-size: cover;"></span>
                                                    <span class="user-name"><?= $user->name ?></span>
                                                </p>
                                            </a>
                                            <p class="inbox-message-date"><?= __('Subscription date') ?></br><?= $user->userCreatedSubscribe ?></p>
                                            <div class="actions">
                                                <?= $this->Html->link('<span
                                                    class="glyphicon glyphicon-trash"></span>',
                                                    [
                                                        'plugin' => 'Subscriptions',
                                                        'controller' => 'Subscriptions',
                                                        'action' => 'deleteUserSubscription',
                                                        $user->id,
                                                        '_ext' => 'json'
                                                    ], [
                                                        'class' => 'subscription ',
                                                        'title' => 'delete subscription'
                                                    ]
                                                ); ?>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="comments">
                                    <div class="sort comments-sort">
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('comments', 'desc');"
                                           class="desc <?= (isset($params['sort_comments']) && $params['sort_comments'] === 'asc') ? '' : 'active' ?>"
                                        >
                                            <?= __('Newest') ?>
                                        </a>
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('comments', 'asc');"
                                           class="asc <?= (isset($params['sort_comments']) && $params['sort_comments'] === 'asc') ? 'active' : '' ?>"
                                        >
                                            <?= __('Oldest') ?>
                                        </a>
                                    </div>
                                    <?php
                                    foreach ($comments as $item) {
                                        ?>
                                        <div class="news-list-item">
                                            <div class="news-list-item report-comment parent">
                                                <p class="user-information">
                                                    <?php
                                                    $userImage = (isset($item['note']->user->image) && strlen($item['note']->user->image) != 0) ? $item['note']->user->image : 'profile.png';
                                                    ?>
                                                    <span class="user-img"
                                                          style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $userImage ?>) no-repeat center; background-size: cover;"></span>

                                                </p>
                                                <div class="note-content">
                                                    <?php
                                                    $description = $this->Text->truncate(strip_tags($item['note']->description),
                                                        150);
                                                    ?>
                                                    <a href="<?= $this->Url->build([
                                                        'plugin' => 'Articles',
                                                        'controller' => 'Articles',
                                                        'action' => 'view',
                                                        $item['note']->article_id,
                                                        'open' => $item['note']->id
                                                    ]); ?>">
                                                        <h4 class="description"><?= $description ?></h4>
                                                    </a>
                                                    <?php
                                                    $userName = isset($item['note']->user->name) ? $item['note']->user->name : __('Deleted user');
                                                    ?>
                                                    <span class="user-name"><?= $userName ?></span>
                                                </div>
                                            </div>
                                            <?php
                                            foreach ($item['comments'] as $note) {
                                                ?>
                                                <div class="news-list-item report-comment ">
                                                    <p class="user-information">
                                                        <?php
                                                        $userImage = (isset($note->user->image) && strlen($note->user->image) != 0) ? $note->user->image : 'profile.png';
                                                        ?>
                                                        <span class="user-img"
                                                              style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $userImage ?>) no-repeat center; background-size: cover;"></span>

                                                    </p>
                                                    <div class="note-content">
                                                        <?php
                                                        $description = $this->Text->truncate(strip_tags($note->description),
                                                            150);
                                                        ?>
                                                        <a href="<?= $this->Url->build([
                                                            'plugin' => 'Articles',
                                                            'controller' => 'Articles',
                                                            'action' => 'view',
                                                            $item['note']->article_id,
                                                            'open' => $item['note']->id,
                                                            'comment' => $note->id
                                                        ]); ?>">
                                                            <h4 class="description"><?= $description ?></h4>
                                                        </a>
                                                        <?php
                                                        $userName = isset($note->user->name) ? $note->user->name : __('Deleted user');
                                                        ?>
                                                        <span class="user-name"><?= $userName ?></span>
                                                    </div>
                                                    <p class="inbox-message-date"><?= __('Subscription date') ?></br><?= $note->commentCreatedSubscribe ?></p>
                                                    <div class="actions">
                                                        <?= $this->Html->link('<span
                                                                    class="glyphicon glyphicon-trash"></span>',
                                                            [
                                                                'plugin' => 'Subscriptions',
                                                                'controller' => 'Subscriptions',
                                                                'action' => 'deleteCommentSubscription',
                                                                $note->id,
                                                                '_ext' => 'json'
                                                            ], [
                                                                'class' => 'subscription ',
                                                                'title' => 'delete subscription'
                                                            ]
                                                        ); ?>
                                                    </div>
                                                </div>
                                                <?php
                                            }
                                            ?>
                                        </div>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="categories">
                                    <div class="sort categories-sort">
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('categories', 'desc');"
                                           class="desc <?= (isset($params['sort_categories']) && $params['sort_categories'] === 'asc') ? '' : 'active' ?>"
                                        >
                                            <?= __('Newest') ?>
                                        </a>
                                        <a href="javascript:void(0);"
                                           onclick="updateSortOrderInUrlAddress('categories', 'asc');"
                                           class="asc <?= (isset($params['sort_categories']) && $params['sort_categories'] === 'asc') ? 'active' : '' ?>"
                                        >
                                            <?= __('Oldest') ?>
                                        </a>
                                    </div>
                                    <?php
                                    foreach ($categories as $category) {
                                        ?>
                                        <div class="news-list-item report-comment ">
                                            <?= $this->Html->link('<h4>' . $category->category->name . '</h4>',
                                                [
                                                    'plugin' => 'Articles',
                                                    'controller' => 'Articles',
                                                    'action' => 'contents',
                                                    $category->category_id
                                                ]
                                            ); ?>
                                            <p class="inbox-message-date"><?= __('Subscription date') ?></br><?= $category->created ?></p>
                                            <div class="actions">
                                                <?= $this->Html->link('<span
                                                    class="glyphicon glyphicon-trash"></span>',
                                                    [
                                                        'plugin' => 'Subscriptions',
                                                        'controller' => 'Subscriptions',
                                                        'action' => 'deleteCategorySubscription',
                                                        $category->category_id,
                                                        '_ext' => 'json'
                                                    ], [
                                                        'class' => 'subscription ',
                                                        'title' => 'delete subscription'
                                                    ]
                                                ); ?>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            contentView.bindSubscriptionAndDeleteParent();

            let uri = window.location.href;
            let activeTabName = uri.substring(uri.indexOf("#")+1);

            switch (activeTabName) {
                case 'categories':
                    $("a.categories-tab").click();
                    break;
                case 'users':
                    $("a.users-tab").click();
                    break;
                case 'comments':
                    $("a.comments-tab").click();
                    break;
                case 'articles':
                    $("a.articles-tab").click();
                    break;
                default:
                    $("a.notes-tab").click();
                    break;
            }
        });

        function updateTabInUrlAddress(tabName) {
            window.history.pushState("", "", updateAnchor(window.location.href, tabName));
        }

        function updateSortOrderInUrlAddress(tabName, sortOrder) {
            let uri = window.location.href;
            uri = updateAnchor(uri, "");
            uri = updateQueryStringParameter(uri, 'sort_' + tabName, sortOrder);
            uri = updateAnchor(uri, tabName);

            window.history.pushState("", "", uri);
            window.location.reload();
        }

        function updateAnchor(uri, value) {
            let re = new RegExp("#.*", "i");

            if (value.length === 0) {
                return uri.replace(re, "");
            } else if (uri.match(re)) {
                return uri.replace(re, "#" + value);
            } else {
                return uri + "#" + value;
            }
        }

        function updateQueryStringParameter(uri, key, value) {
            let re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
            let separator = uri.indexOf('?') !== -1 ? "&" : "?";

            if (uri.match(re)) {
                return uri.replace(re, '$1' + key + "=" + value + '$2');
            }  else {
                return uri + separator + key + "=" + value;
            }
        }
    </script>
