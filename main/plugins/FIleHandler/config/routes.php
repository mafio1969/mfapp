<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'FIleHandler',
    ['path' => '/'],
    function (RouteBuilder $route) {
        $route->setExtensions(['json', 'xml']);
        Router::build($route, '/fileHandler/:action/*', ['controller' => 'FileHandler']);
    }
);
