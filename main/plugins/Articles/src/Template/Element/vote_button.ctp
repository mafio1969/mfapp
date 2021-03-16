<?php

/**
 * @var $voteComment
 */

?>
    <p class="vote-up-button">
        <?php
        $voteClass = '';
        if (isset($voteComment->votes_notes[0])) {
            $voteClass = 'voted';
        }
        if ($this->request->getSession()->read('Auth.User.id')) {
            ?>
            <?= $this->Html->link('',
                [
                    'plugin' => 'Votes',
                    'controller' => 'Votes',
                    'action' => 'vote',
                    $voteComment->id,
                    '_ext' => 'json'
                ], [
                    'id' => $voteComment->id . '-vote',
                    'class' => 'vote-up-comment ' . $voteClass,
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
        <span id="<?= $voteComment->id . '-vote-comment' ?>"><?= $voteComment->counter_up_vote ?></span>
    </p>
