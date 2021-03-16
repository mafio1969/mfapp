<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Categories',
    ['path' => '/'],
    function (RouteBuilder $route) {
        Router::build($route, '/categories/:action/*', ['controller' => 'Categories']);
        Router::build($route, '/categories', ['controller' => 'Categories', 'action' => 'index']);
    }
);
