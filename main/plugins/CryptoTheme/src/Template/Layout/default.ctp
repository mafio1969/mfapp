<!DOCTYPE html>
<html>
<head>
    <title><?= $this->fetch('title') ?> - ccFOUND.com</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/img/favicon.png">
<?php
    if ($this->request->getParam('lang') === 'en') {
?>
    <link rel="alternate" hreflang="en" href="<?php echo $this->request->scheme(); ?>://<?php echo $this->request->host(); ?><?php echo $this->request->here( false ); ?>" />
<?php
    }
?>
    <link
            href="https://fonts.googleapis.com/css?family=Montserrat:700|Quicksand:300,400,500,600,700&display=swap&subset=latin-ext"
            rel="stylesheet">
    <?php //$this->Html->charset()   ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--    <title>-->
    <?php //$this->fetch('title')  ?>
    <!--    </title>-->
    <?php //$this->Html->meta('icon')  ?>
    <?php
    echo $this->element('javascripts');
    echo $this->element('stylesheets');
    ?>
    <?php //$this->fetch('meta')  ?>
    <?php //$this->fetch('css') ?>
    <?php //$this->fetch('script')  ?>
    <script type="text/javascript"
            src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-161195793-1"></script>
</head>
<body class="notranslate">
<?= $this->element('header') ?>
<?= $this->Layout->sessionFlash(); ?>
<div class="darkView">
    <?= $this->fetch('content'); ?>
</div>
<?= $this->element('footer') ?>
<div class="mainLoading" style="display: none;">
    <div class="loading-icon"></div>
</div>
<script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }

    gtag('js', new Date());

    gtag('config', 'UA-161195793-1');
</script>
</body>
</html>
