<?php
$version = 1;
$versionMain = 1;
echo $this->Html->css([
    'Croogo/Core.core/select2.min.css?v='.$version,
    'Croogo/Core.core/select2-bootstrap.min.css?v='.$version,
    'main.css?v='.$versionMain
]);
