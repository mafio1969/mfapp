<?php
$version = 1;
$versionMain = 1;
if (!$this->request->is('ajax')):
    echo $this->Layout->js();
    echo $this->Html->script([
        'jquery-3.2.1.min.js',
        'jquery-ui.min.js',
        'modernizr.js?v='.$version,
        'jquery.validate.min',
        'respond.js?v='.$version,
        'bootstrap.min.js?v='.$version,
        'slick.js?v='.$version,
        'Croogo/Core.core/select2.full.min.js?v='.$version,
        'ckeditor/ckeditor.js?v='.$version,
        'jquery.imgareaselect.pack.js?v='.$version,
        'toastr.min.js?v='.$version,
        'bootbox.min.js?v='.$version,
        'script.min.js?v='.$version,
        'main.min.js?v='.$versionMain
    ]);
    echo $this->Html->script([
        'validation.js?v='.$version
    ], ['type' => 'module']);
endif;
