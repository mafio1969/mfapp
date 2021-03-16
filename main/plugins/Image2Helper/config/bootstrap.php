<?php

use Cake\Core\Configure;
use Croogo\Core\Croogo;

Configure::write('Image2Helper.cacheDir', ['uploads', 'resized']);

Croogo::hookHelper('*', 'Image2Helper.Image2');
