<?php

/**
 * @var $user
 * @var $newsletter
 */

?>
<?= __('Newsletter') . ' '
. date('d.m.Y', $newsletter->date_from) . ' - '
. date('d.m.Y', $newsletter->date_to); ?>
<?= $newsletter->description; ?>
<?php
foreach ($newsletter->articles as $article) {
    echo $article->title . "\n";
}
