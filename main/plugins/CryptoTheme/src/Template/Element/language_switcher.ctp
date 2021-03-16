<?php

$activeClassEN = $activeClassPL = '';
$language = $this->request->getParam('lang');

if ($language == 'en') {
    $activeClassEN = 'active';
}
if ($language == 'pl') {
    $activeClassPL = 'active';
}

?>
<div class="skiptranslate language">
    <?= $this->Html->link(
        __('PL'),
        $this->LanguageSwitcher->getUrl('pl'),
        [
            'class' => 'lg-sw ' . $activeClassPL,
            'data-lg' => 'pl'
        ]
    ); ?>
    <?= $this->Html->link(
        __('EN'),
        $this->LanguageSwitcher->getUrl('en'),
        [
            'class' => 'lg-sw ' . $activeClassEN,
            'data-lg' => 'en'
        ]
    ); ?>
</div>
