<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;

/**
 * @var $article
 * @var $adminEdit
 * @var $prevArticle
 * @var $nextArticle
 * @var $userGlobalPermissions
 * @var $noteEntity
 * @var $acceptEntity
 * @var $rejectEntity
 * @var $subscribed
 */

$this->assign(
    'title',
    $this->Text->truncate(
        $article->title,
        48,
        [
            'ellipsis' => ' ...',
            'exact' => false
        ]
    )
);
?>
<div class="article-page question-page question-view">
    <div class="article-title">
        <div class="container">
            <h1 class="translate"><?= $article->title; ?></h1>
            <?php
            if ($this->request->getSession()->check('Auth.User.id') && ($userGlobalPermissions[UsersController::ROLE_SETTLE_I] || $userGlobalPermissions[UsersController::ROLE_SETTLE_IV])
                && (int)$article->resolve_send === 1 && (int)$article->is_visible === ArticlesController::IS_VISIBLE_REJECT) {
                echo '<div class="resolve-form">';
                echo $this->Form->create(null, [
                    'url' => [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'accept'
                    ]
                ]);
                echo $this->Form->input('item', ['type' => 'hidden', 'value' => $article->id]);
                echo $this->Form->input('accept', [
                    'type' => 'textarea',
                    'required' => true,
                    'label' => [
                        'text' => __('Accept reason')
                    ]
                ]);
                echo $this->Form->input(__('Resolve as accepted'), [
                    'type' => 'submit',
                    'id' => 'resolve-as-accepted'
                ]);
                echo $this->Form->end();
                echo '</div>';
                echo '<div class="resolve-form">';
                echo $this->Form->create(null, [
                    'url' => [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'reject'
                    ]
                ]);
                echo $this->Form->input('item', ['type' => 'hidden', 'value' => $article->id]);
                echo $this->Form->input('reject', [
                    'type' => 'textarea',
                    'required' => true,
                    'label' => [
                        'text' => __('Reject reason')
                    ]
                ]);
                echo $this->Form->input(__('Resolve as rejected'), [
                    'type' => 'submit',
                    'id' => 'resolve-as-rejected'
                ]);
                echo $this->Form->end();
                echo '</div>';
            }
            ?>
        </div>
    </div>
    <div class="container">
        <div class="article-content">
            <?php
            $userPhoto = UserComponent::IMAGE_BLANK_USER;
            if (!empty($article->user->image)) {
                $userPhoto = $article->user->image;
            }
            ?>
            <!-- <div class="art-img" style="background: url(img/news4.jpg) no-repeat center; background-size: cover;"></div> -->
            <div class="art-content-inner">
                <div class="art-details">
                    <div class="art-author">
                        <a href="<?= $this->Url->build([
                            'plugin' => 'Croogo/Users',
                            'controller' => 'Users',
                            'action' => 'view',
                            $article->user_id
                        ]); ?>">
                            <div class="author-img"
                                 style="background: url(<?= DS . UserComponent::IMAGE_PREFIX . DS . $userPhoto ?>) no-repeat center; background-size: cover;"></div>
                            <p class="author-name"><?= $article->user->name ?></p>
                        </a>
                    </div>
                    <div class="art-date">
                        <p><?= $article->updated->format('d.m.Y') ?></p>
                    </div>
                    <div class="article-categories">
                        <?php
                        foreach ($article->categories as $articleCategory) {
                            echo $this->Html->link($articleCategory->name, [
                                'plugin' => 'Articles',
                                'controller' => 'Articles',
                                'action' => 'contents',
                                $articleCategory->id
                            ]);
                        }
                        ?>
                    </div>
                    <div class="art-likes">
                        <p id="vd-agree" class="vote-up"><?= $article->counter_up_vote ?></p>
                        <?php
                        if (ArticlesController::DISABLE_DOWN_VOTES) {
                            ?>
                            <p id="vd-disagree" class="vote-down"><?= $article->counter_down_vote ?></p>
                            <?php
                        }
                        ?>
                    </div>
                </div>
                <?php
                if (isset($adminEdit['user'])) {
                    ?>
                    <div class="admin-edit-element">
                        <p><?= __('Content corrected by an authorized editor') . ' ' . $adminEdit['user']->name . ' - ' . $adminEdit['time'] ?></p>
                    </div>
                    <?php
                }
                ?>
                <div class="translate-element">
                    <div id="google_translate_element">
                        <div class="skiptranslate goog-te-gadget" dir="ltr" style="">
                            <span style="white-space:nowrap">
                                    <a class="goog-logo-link" href="https://translate.google.com" target="_blank"><img
                                                src="https://www.gstatic.com/images/branding/googlelogo/1x/googlelogo_color_42x16dp.png"
                                                width="37px" height="14px" style="padding-right: 3px"
                                                alt="Google Tłumacz">Tłumacz</a>
                                </span>
                        </div>
                    </div>
                </div>
                <div class="art-excerpt translate">
                    <?php
                    echo $article->preview;
                    if (!empty($article->description)) {
                        if ($this->request->getSession()->read('Auth.User.id')) {
                            echo $article->description;
                        } else {
                            echo $this->Html->link(
                                __('Login to see more content'),
                                ['plugin' => 'Croogo/Users', 'controller' => 'Users', 'action' => 'login'],
                                [
                                    'class' => 'btn btn-default',
                                    'title' => __('Login to see more content')
                                ]
                            );
                        }
                    }
                    ?>
                </div>
                <div class="likes-buttons">
                    <div class="art-likes-button">
                        <p class="vote-up-button">
                            <?php
                            $voted = '';
                            if (isset($article->votes[0])) {
                                $voted = 'voted';
                            }
                            if ($this->request->getSession()->read('Auth.User.id')) {
                                ?>
                                <?= $this->Html->link('',
                                    [
                                        'plugin' => 'Votes',
                                        'controller' => 'Votes',
                                        'action' => 'agree',
                                        $article->id,
                                        '_ext' => 'json'
                                    ], [
                                        'class' => 'vote ' . $voted,
                                        'title' => 'vote up'
                                    ]
                                ); ?>
                                <?php
                            } else {
                                ?>
                                <a disabled="disabled" title="<?= __('Only for registered users') ?>"
                                   class="vote"></a>
                                <?php
                            }
                            ?>
                            <span id="v-agree"><?= $article->counter_up_vote ?></span>
                        </p>
                        <?php
                        $userId = $this->request->getSession()->read('Auth.User.id');
                        if ($userId && $userId !== $article->user_id) {
                            ?>
                            <?= $this->Html->link(__('Unsubscribe'),
                                [
                                    'plugin' => 'Subscriptions',
                                    'controller' => 'Subscriptions',
                                    'action' => 'deleteArticleSubscription',
                                    $article->id,
                                    '_ext' => 'json'
                                ], [
                                    'class' => 'subscription sub ' . ($subscribed ? '' : 'subInActiveButton'),
                                    'title' => 'delete subscription'
                                ]
                            ); ?>
                            <?= $this->Html->link(__('Subscribe'),
                                [
                                    'plugin' => 'Subscriptions',
                                    'controller' => 'Subscriptions',
                                    'action' => 'addArticleSubscription',
                                    $article->id,
                                    '_ext' => 'json'
                                ], [
                                    'class' => 'subscription ' . ($subscribed ? 'subInActiveButton' : ''),
                                    'title' => 'add subscription'
                                ]
                            ); ?>
                            <?php
                            if ((!isset($article->reports) || count($article->reports) == 0) && ($article->user_id != $userId)) {
                                ?>
                                <a href="<?= $this->Url->build([
                                    'plugin' => 'Reports',
                                    'controller' => 'Reports',
                                    'action' => 'content',
                                    $article->id,
                                    '_ext' => 'json'
                                ]); ?>" class="reply link-report-content"><?= __('Report'); ?></a>
                                <?php
                            }
                        }
                        ?>
                    </div>
                    <div class="accept-buttons">
                        <?php
                        if ($this->request->getSession()->check('Auth.User.id')
                            && (int)$article->is_visible_by_role === ArticlesController::IS_VISIBLE_BY_ROLE_NEGATIVE
                            && (int)$this->request->getSession()->read('Auth.User.id') !== (int)$article->user_id
                            && $userGlobalPermissions[UsersController::ROLE_ACCEPT]) {
                            if (isset($checkIfAlreadyAddedAccept) && $checkIfAlreadyAddedAccept) {
                            } elseif ($this->Articles->voteTime($article->published)) {
                                ?>
                                <a data-toggle="modal" data-target="#acceptModal" data-placement="top"
                                   title="<?= __('Accept question') ?>" href="#"
                                   class="btn-accept"><?= __('Accept') ?></a>
                                <?php
                            }
                            if (isset($checkIfAlreadyAddedReject) && $checkIfAlreadyAddedReject) {
                            } elseif ($this->Articles->voteTime($article->published)) {
                                ?>
                                <a data-toggle="modal" data-target="#rejectModal" data-placement="top"
                                   title="<?= __('Reject question') ?>" href="#"
                                   class="btn-decline"><?= __('Reject') ?></a>
                                <?php
                            }
                            if (ArticlesController::DISABLE_REVIEWS) {
                                ?>
                                <a data-toggle="tooltip" data-placement="top" title="<?= __('Review article') ?>"
                                   href="#link-content-reviews"
                                   class="btn-review link-content-tab"><?= __('Review') ?></a>
                                <?php
                            }
                        }
                        if (isset($userGlobalPermissions[UsersController::ROLE_EDITOR]) && $userGlobalPermissions[UsersController::ROLE_EDITOR]) {
                            ?>
                            <?= $this->Html->link(
                                '<p class="comment-edit">' . __('Edit') . '</p>',
                                [
                                    'plugin' => 'Articles',
                                    'controller' => 'Articles',
                                    'action' => 'edit',
                                    $article->id,
                                    $userGlobalPermissions[UsersController::ROLE_EDITOR]
                                ]
                            ); ?>
                            <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="article-comments">
            <ul class="nav nav-tabs art-tabs" role="tablist">
                <li role="presentation" class="<?= isset($_GET["reject"]) ? '' : 'active'  ?>">
                    <a href="#comments" class="edit-container" aria-controls="comments" role="tab"
                       data-toggle="tab"><?= __('Answers') ?>
                        <span>(<?= $article->counter_comments; ?>)</span>
                    </a>
                </li>
                <?php
                if ((int)$article->is_visible_by_role === ArticlesController::IS_VISIBLE_BY_ROLE_NEGATIVE) {
                    ?>
                    <li role="presentation">
                        <a id="link-content-accepts" href="#accepts" aria-controls="accepts" role="tab"
                           data-toggle="tab"><?= __('Accepts') ?>
                            <span>(<?= $article->counter_accepts ?>)</span>
                        </a>
                    </li>
                    <li role="presentation" class="<?= isset($_GET["reject"]) ? 'active' : ''  ?>">
                        <a id="link-content-rejects" href="#decline" aria-controls="decline" role="tab"
                           data-toggle="tab"><?= __('Rejects') ?>
                            <span>(<?= $article->counter_rejects ?>)</span>
                        </a>
                    </li>
                    <?php
                }
                ?>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane <?= isset($_GET["reject"]) ? '' : 'active'  ?>" id="comments">
                    <?= $this->element('Articles.comments_question'); ?>
                </div>
                <div role="tabpanel" class="tab-pane" id="accepts">
                    <?= $this->element('Articles.accepts'); ?>
                </div>
                <div role="tabpanel" class="tab-pane <?= isset($_GET["reject"]) ? 'active' : ''  ?>" id="decline">
                    <?= $this->element('Articles.rejects'); ?>
                </div>
            </div>
        </div>
        <div class="other-articles">
            <div class="prev-art">
                <?php
                if ($article->is_visible === ArticlesController::IS_VISIBLE_ACCEPT && isset($prevArticle->id)) {
                    if ($prevArticle->counter_vote_result == 0) {
                        $prevArticleVote = 0;
                    } elseif ($prevArticle->counter_vote_result > 0) {
                        $prevArticleVote = '+' . $prevArticle->counter_vote_result;
                    } else {
                        $prevArticleVote = $prevArticle->counter_vote_result;
                    }
                    echo $this->Html->link($prevArticle->title . ' <span class="vote">' . $prevArticleVote . '</span>',
                        [
                            'plugin' => 'Articles',
                            'controller' => 'Articles',
                            'action' => 'view',
                            $prevArticle->id
                        ]
                    );
                }
                ?>
            </div>
            <div class="more-art">
                <?php
                echo $this->Html->link(__('Other questions') . '<span class="see-arrow"></span>',
                    [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'search',
                        '?' => ['type' => 'questions']
                    ],
                    ['class' => 'more']
                );
                ?>
            </div>
            <div class="next-art">
                <?php
                $t = $nextArticle;
                if ((int)$article->is_visible === ArticlesController::IS_VISIBLE_ACCEPT && isset($nextArticle->id)) {
                    if ($nextArticle->counter_vote_result == 0) {
                        $nextArticleVote = 0;
                    } elseif ($nextArticle->counter_vote_result > 0) {
                        $nextArticleVote = '+' . $nextArticle->counter_vote_result;
                    } else {
                        $nextArticleVote = $nextArticle->counter_vote_result;
                    }
                    echo $this->Html->link($nextArticle->title . ' <span class="vote">' . $nextArticleVote . '</span>',
                        [
                            'plugin' => 'Articles',
                            'controller' => 'Articles',
                            'action' => 'view',
                            $nextArticle->id
                        ]
                    );
                }
                ?>
            </div>
        </div>
    </div>
</div>
<?php
if ($this->request->getSession()->check('Auth.User.id')) {
    ?>
    <div class="modal fade questionModal" id="answerModal" role="dialog"
         aria-labelledby="commentModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4><?= __('Add question answer') ?></h4>
                </div>
                <div class="modal-body">
                    <h5><?= $article->title; ?></h5>
                    <div class="add-comment">
                        <?php
                        echo $this->Form->create($noteEntity, [
                            'url' => [
                                'plugin' => 'Notes',
                                'controller' => 'Notes',
                                'action' => 'add',
                                $article->id
                            ],
                            'id' => 'form-comment'
                        ]);
                        echo $this->Form->input('description',
                            [
                                'required' => false,
                                'type' => 'textarea',
                                'label' => [
                                    'text' => __('Add answer')
                                ],
                                'id' => 'description'
                            ]
                        );
                        echo $this->Form->button('<span class=""></span>' . __('Add'), [
                            'type' => 'submit',
                            'class' => 'btn',
                            'id' => 'form-comment-submit'
                        ]);
                        echo $this->Form->end();
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade questionModal" id="commentModal" role="dialog"
         aria-labelledby="commentModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4><?= __('Add comment to answer') ?></h4>
                </div>
                <div class="modal-body">
                    <p id="modal-content-comment"></p>
                    <div class="add-comment">
                        <form id="form-sub-comment">
                            <label for="addComment"><?= __('Add comment') ?></label>
                            <textarea class="form-control" name="comment" id="addComment"></textarea>
                            <button class="btn" id="comment-link" href="#">
                                <span class=""></span><?= __('Add'); ?>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade questionModal" id="editModalAnswer" role="dialog"
         aria-labelledby="commentModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4><?= __('Edit answer') ?></h4>
                </div>
                <div class="modal-body">
                    <p id="modal-content-comment"></p>
                    <div class="add-comment">
                        <form id="form-edit-answer" method="post" accept-charset="utf-8" role="form"
                              novalidate="novalidate">
                            <div class="form-group textarea">
                                <label for="editCommentAnswer"><?= __('Edit answer') ?></label>
                                <textarea class="form-control" name="description" id="editCommentAnswer"></textarea>
                            </div>
                            <button class="btn" id="answer-edit-link" href="#">
                                <span class=""></span><?= __('Save'); ?>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade questionModal" id="editModalComment" role="dialog"
         aria-labelledby="commentModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4><?= __('Edit comment') ?></h4>
                </div>
                <div class="modal-body">
                    <p id="modal-content-comment"></p>
                    <div class="add-comment">
                        <form id="form-edit-comment" method="post" accept-charset="utf-8" role="form"
                              novalidate="novalidate">
                            <div class="form-group textarea">
                                <label for="editCommentAnswer"><?= __('Edit comment') ?></label>
                                <textarea class="form-control" name="description" id="editComment"></textarea>
                            </div>
                            <button class="btn" id="comment-edit-link" href="#">
                                <span class=""></span><?= __('Save'); ?>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade questionModal" id="acceptModal" role="dialog"
         aria-labelledby="commentModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4><?= __('Add accept') ?></h4>
                </div>
                <div class="modal-body">
                    <h5><?= $article->title; ?></h5>
                    <div class="add-comment">
                        <?php
                        if ($userGlobalPermissions[UsersController::ROLE_ACCEPT]
                            && (int)$this->request->getSession()->read('Auth.User.id') !== (int)$article->user_id
                            && ($this->Articles->voteTime($article->published))) {
                            echo $this->Form->create($acceptEntity, [
                                'url' => [
                                    'plugin' => 'Notes',
                                    'controller' => 'Accepts',
                                    'action' => 'add',
                                    $article->id
                                ],
                                'id' => 'form-accept'
                            ]);
                            if (false) {
                                echo $this->Form->input('description',
                                    [
                                        'type' => 'textarea',
                                        'label' => [
                                            'text' => __('Add accept')
                                        ],
                                        'id' => 'accept-description'
                                    ]
                                );
                            }
                            echo $this->Form->button('<span class=""></span>' . __('Add'), [
                                'type' => 'submit',
                                'class' => 'submit-form',
                                'id' => 'form-accept-submit'
                            ]);
                            echo $this->Form->end();
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade questionModal" id="rejectModal" role="dialog"
         aria-labelledby="commentModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                    </button>
                    <h4><?= __('Add reject') ?></h4>
                </div>
                <div class="modal-body">
                    <h5><?= $article->title; ?></h5>
                    <div class="add-comment">
                        <?php
                        if ($userGlobalPermissions[UsersController::ROLE_ACCEPT]
                            && (int)$this->request->getSession()->read('Auth.User.id') !== (int)$article->user_id
                            && ($this->Articles->voteTime($article->published))) {
                            echo $this->Form->create($rejectEntity, [
                                'url' => [
                                    'plugin' => 'Notes',
                                    'controller' => 'Rejects',
                                    'action' => 'add',
                                    $article->id
                                ],
                                'id' => 'form-reject'
                            ]);
                            echo $this->Form->input('description',
                                [
                                    'required' => false,
                                    'type' => 'textarea',
                                    'label' => [
                                        'text' => __('Add reject')
                                    ],
                                    'id' => 'reject-description'
                                ]
                            );
                            echo $this->Form->button('<span class=""></span>' . __('Add'), [
                                'type' => 'submit',
                                'class' => 'submit-form',
                                'id' => 'form-reject-submit'
                            ]);
                            echo $this->Form->end();
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#form-reject").validate({
                rules: {
                    description: "required"
                },
                messages: {
                    description: "<?= __('Reject cannot be empty.') ?>",
                }
            });
            contentView.bindModalForm("#form-reject", "#form-reject-submit");
        });
    </script>
    <?php
    echo $this->element('Articles.modal_report');
    echo $this->element('Articles.modal_remove');
}
?>
<script>
    <?php
    if ($this->request->getSession()->check('Auth.User.id')) {
    ?>
    $(document).ready(function () {
        $("#form-sub-comment").validate({
            rules: {
                comment: {
                    required: true
                }
            },
            messages: {
                comment: "<?= __('Comment cannot be empty.') ?>",
            }
        });
        contentView.bindVote();
        contentView.bindSubscription();
        contentView.bindLinkCommentQuestion();
        contentView.bindCommentLink();
        contentView.reportModal();
        contentView.removeModal("<?= __('Reason cannot be empty.') ?>");
        contentView.linkRemove();
        contentView.bindModalFormCK("#form-comment", "#form-comment-submit");
        contentView.bindReportModal();
        contentView.linkReportContent();
        $('.link-content-tab').on("click", function (e) {
            $($(this).attr("href")).trigger("click");
        });
        CKEDITOR.replace('description', {
            language: 'pl',
            filebrowserUploadUrl: '/fileHandler/upload.json',
            imageUploadUrl: '/fileHandler/upload.json',
            uploadUrl: '/fileHandler/upload.json',
            disableNativeSpellChecker: false
        });
        CKEDITOR.replace('editCommentAnswer', {
            language: 'pl',
            filebrowserUploadUrl: '/fileHandler/upload.json',
            imageUploadUrl: '/fileHandler/upload.json',
            uploadUrl: '/fileHandler/upload.json',
            disableNativeSpellChecker: false
        });
        $("#form-edit-answer").validate({
            ignore: [],
            debug: false,
            errorPlacement: function (error, element) {
                if (element[0].name == 'description') {
                    error.appendTo(element.parent());
                } else {
                    error.insertAfter(element);
                }
            },
            rules: {
                description: {
                    required: function () {
                        CKEDITOR.instances.editCommentAnswer.updateElement();
                        if (CKEDITOR.instances.editCommentAnswer.document.getBody().getChild(0).getText()) {
                            return true;
                        }
                    }
                }
            },
            messages: {
                description: {
                    required: "<?= __('Answer cannot be empty.') ?>"
                }
            }
        });
        $("#form-comment").validate({
            ignore: [],
            debug: false,
            errorPlacement: function (error, element) {
                if (element[0].name == 'description') {
                    error.appendTo(element.parent());
                } else {
                    error.insertAfter(element);
                }
            },
            rules: {
                description: {
                    required: function () {
                        CKEDITOR.instances.description.updateElement();
                        if (CKEDITOR.instances.description.document.getBody().getChild(0).getText()) {
                            return true;
                        }
                    }
                }
            },
            messages: {
                description: {
                    required: "<?= __('Answer cannot be empty.') ?>"
                }
            }
        });
        let searchParams = new URLSearchParams(window.location.search)
        let scrollElement = searchParams.get('comment');
        let scrollModal = searchParams.get('open');
        const handleScrollComment = $("#comment" + scrollElement);
        if (searchParams.has('open') || searchParams.has('comment')) {
            setTimeout(function () {
                $("#noteModal" + scrollModal).animate({
                    scrollTop: handleScrollComment.position().top - 120
                }, 2000);
            }, 1000);

            if(handleScrollComment.hasClass("questionComment")){
                if(handleScrollComment.find(".comment-reply").length > 0) {
                   if(handleScrollComment.is(".questionComment:first-child")) {
                        handleScrollComment.parent().prev().addClass("highlightCommentQuestion");
                        handleScrollComment.find(".comment-reply").addClass("highlightCommentQuestionHasChild");
                    } else {
                        handleScrollComment.prev().addClass("highlightCommentQuestion");
                        handleScrollComment.find(".comment-reply").addClass("highlightCommentQuestionHasChild");
                    }
                } else {
                    if(handleScrollComment.is(".questionComment:first-child")) {
                        handleScrollComment.parent().prev().addClass("highlightCommentQuestion");
                        handleScrollComment.find('.questionComment-inner').addClass("highlightCommentQuestion");
                    } else {
                        handleScrollComment.prev().addClass("highlightCommentQuestion");
                        handleScrollComment.addClass("highlightCommentQuestion");
                    }
                }
            }

            if(handleScrollComment.hasClass("comment-reply")){
               handleScrollComment.addClass("highlightCommentQuestionChild");
               handleScrollComment.parent().addClass("highlightCommentQuestionChildParent");
            }

           setTimeout(function () {
                handleScrollComment.parent().prev().removeClass("highlightCommentQuestion");
                handleScrollComment.find(".comment-reply").removeClass("highlightCommentQuestionHasChild");
                handleScrollComment.find('.questionComment-inner').removeClass("highlightCommentQuestion");
                handleScrollComment.prev().removeClass("highlightCommentQuestion");
                handleScrollComment.removeClass("highlightCommentQuestion");
                handleScrollComment.removeClass("highlightCommentQuestionChild");
                handleScrollComment.parent().removeClass("highlightCommentQuestionChildParent");
            }, 5000);
        }
        if(searchParams.has('reject')) {
            setTimeout(function () {
                $("html, body").animate({
                    scrollTop: $("#decline").offset().top-150
                }, 1000);

            }, 500);
        }
    });
    <?php
    } else {
    ?>
    $(document).ready(function () {
        $('.link-content-tab').on("click", function (e) {
            $($(this).attr("href")).trigger("click");
        });
    });
    <?php
    }
    ?>
    function googleTranslateElementInit() {
        new google.translate.TranslateElement({
            pageLanguage: 'pl',
            includedLanguages: "en,pl,de,it,fr"
        }, 'google_translate_element');
    }
</script>
