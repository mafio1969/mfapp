<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $fieldsOptions
 * @var $items
 * @var $userGlobalPermissions
 */

?>
<div class="articles-list-page my-content-page">
    <div class="page-title">
        <div class="container">
            <h1><?= __('My content') ?></h1>
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
                    'action' => 'index'
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
            <div class="top-actions">
                <?php
                if ($userGlobalPermissions[UsersController::ROLE_PUBLISHER_I]
                    || $userGlobalPermissions[UsersController::ROLE_PUBLISHER_II]) {
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
                }
                ?>
            </div>
            <div class="sort">
                <?php
                $queryParams = $this->request->getQueryParams();
                $classAsc = $classDesc = $classIsVisible = '';
                if (isset($queryParams['direction']) && $queryParams['direction'] == 'asc') {
                    $classAsc = 'active';
                } elseif (isset($queryParams['sort']) && $queryParams['sort'] == 'is_visible') {
                    $classIsVisible = 'active';
                } else {
                    $classDesc = 'active';
                }
                $urlIsVisible = array_merge(
                    ['sort' => 'is_visible', 'direction' => 'desc'],
                    [],
                    ['order' => null]
                );
                $urlIsVisible = $this->Paginator->generateUrl($urlIsVisible, $this->Paginator->defaultModel());
                echo $this->Html->link(__('Status'), $urlIsVisible, ['class' => 'desc-isVisible ' . $classIsVisible]);
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
                            $status = $this->Articles->articleStatus(
                                $item->is_visible,
                                $this->Articles->voteTime($item->published),
                                (bool)$item->is_visible_by_role
                            );
                            ?>
                            <?= $status; ?>
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
                        <?php
                            $isArticleEditVisible = $userGlobalPermissions[UsersController::ROLE_PUBLISHER_I];
                            $isReportsButtonVisible = !$this->Articles->voteTime($item->published)
                                && (int)$item->is_visible === ArticlesController::IS_VISIBLE_REJECT
                                && (int)$item->resolve_send === 0;

                            if ($isArticleEditVisible || $isReportsButtonVisible) {
                        ?>
                        <div class="actions">
                            <button class="btn-outline dropdown-toggle" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span
                                        class="glyphicon glyphicon-option-horizontal"></span></button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <?php
                                if ($isArticleEditVisible) { ?>
                                    <li>
                                        <?= $this->Html->link(
                                            __('Edit'),
                                            [
                                                'plugin' => 'Articles',
                                                'controller' => 'Articles',
                                                'action' => 'edit',
                                                $item->id
                                            ],
                                            $userGlobalPermissions[UsersController::ROLE_PUBLISHER_II]
                                                ? []
                                                : ['class' => 'edit-box']
                                        ); ?>
                                    </li>
                                    <li>
                                        <?= $this->Html->link(
                                            __('Delete'),
                                            [
                                                'plugin' => 'Articles',
                                                'controller' => 'Articles',
                                                'action' => 'delete',
                                                $item->id
                                            ]
                                        ); ?>
                                    </li>
                                    <?php
                                }

                                if ($isReportsButtonVisible) {
                                    $linkTitle = __('Send to resolve step I');
                                    if ((int)$item->resolve_status === 1) {
                                        $linkTitle = __('Send to resolve step IV');
                                    }
                                    echo '<li>' . $this->Html->link(
                                            $linkTitle,
                                            [
                                                'plugin' => 'Reports',
                                                'controller' => 'Reports',
                                                'action' => 'resolve',
                                                $item->id,
                                                '_ext' => 'json'
                                            ],
                                            ['class' => 'link-resolve']
                                        ) . '</li>';
                                }
                                ?>
                            </ul>
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
        <?php
        echo $this->element('CryptoTheme.paginator');
        ?>
    </div>
</div>
<?= $this->element('Articles.modal_resolve_reason'); ?>
<script>
    $(function () {
        $('.edit-box').on('click', function (e) {
            let element = $(this);
            e.preventDefault();
            bootbox.confirm({
                message: '<?= __('If you edit this content all “Accept” and “Reject” votes will be reset and your content will have to go through the acceptations process again. Do you want to continue?') ?>',
                callback: function (result) {
                    if (result) {
                        window.location = element.attr('href');
                    }
                }
            });
        });
        $('.link-resolve').off().on("click", function (e) {
            e.preventDefault();
            $('#submit-resolve').attr("data-href", $(this).attr("href"));
            $('#resolveReasonModal').modal("show");
        });
        $("#form-resolve").validate({
            rules: {
                content: {
                    required: true,
                    minlength: 20
                }
            },
            messages: {
                content: {
                    required: "<?= __('Reason cannot be empty.') ?>",
                    minlength: "<?= __('Reason must have min. 20 characters.') ?>"
                }
            }
        });
        $('#submit-resolve').on('click', function () {
            if ($('#form-resolve').valid()) {
                let button = $(this);
                button.attr("disabled", true);
                button.find('span').addClass('loading');
                $.ajax({
                    url: $(this).attr("data-href"),
                    type: "POST",
                    data: {
                        content: $('#resolve-reason-content').val()
                    },
                    success: function (result) {
                        if (result.success) {
                            window.location.href = window.location;
                        } else {
                            button.find('span').removeClass('loading');
                            button.attr("disabled", false);
                        }
                    }
                });
            }
        });
    });
</script>
