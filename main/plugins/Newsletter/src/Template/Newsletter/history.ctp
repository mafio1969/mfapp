<?php

use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $newsletters
 * @var $items
 */

?>
<div class="articles-list-page newsletter-page">
    <div class="user-page">
        <div class="container">
            <ul class="nav nav-tabs art-tabs" role="tablist">
                <li role="presentation">
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
                <li role="presentation" class="active">
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
            <div role="tabpanel" class="tab-pane active" id="history">
                <div class="page-title">
                    <div class="container">
                        <h1><?= __('Sending history') ?></h1>
                    </div>
                </div>
                <div id="sendMail" style="display: none;">
                    <p><?= __('Send last newsletter to the email existing in our database.') ?></p>
                    <input type="text" id="emailToSend">
                    <button id="sendNewsletterButton" href="<?= $this->Url->build([
                        'plugin' => 'Newsletter',
                        'controller' => 'Newsletter',
                        'action' => 'sendNewslleterToEmail'
                    ]); ?>" onclick="sendMail()"><?= __('Send to mail') ?></button>
                </div>
                <div class="container">
                    <div class="list-inner-content history-list">
                        <?php
                        foreach ($newsletters as $key => $newsletter) {
                            ?>
                            <a role="button" data-toggle="collapse" href="#collapseItem<?= $key ?>"
                               class="newsletter-item collapsed"><span>Newsletter:</span>
                                <?= date('d.m.Y', $newsletter->date_from) ?> - <?= date('d.m.Y',
                                    $newsletter->date_to) ?></a>
                            <div class="collapse newsletter-collapse" id="collapseItem<?= $key ?>">
                                <div class="newsletter-text"><?= $newsletter->description ?></div>
                                <div class="news-list">
                                    <?php
                                    foreach ($newsletter->articles as $item) {
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
                                                    '<h4>' . $item->title . ' <span class="vote">'
                                                    . $itemVote . '</span></h4><p>'
                                                    . __('by') . ' ' . $item->user->name . '</p>',
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
                        }
                        ?>
                    </div>
                    <?php
                    echo $this->element('CryptoTheme.paginator');
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
     function sendMail() {
         console.log($('#sendNewsletterButton').attr("href"));
            var email = $('#emailToSend').val();
            $.ajax({
                url: $('#sendNewsletterButton').attr("href"),
                type: "GET",
                data: {
                    email: email
                },
                success: function (result) {
                    if (result.success) {
                        toastr.info(result.message);
                    } else {
                        toastr.error(result.message);
                    }
                }
            });
        };
</script>
