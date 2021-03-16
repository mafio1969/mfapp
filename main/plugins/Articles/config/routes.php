<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Articles',
    ['path' => '/'],
    function (RouteBuilder $route) {
        Router::build($route, '/articles/:action/*', ['controller' => 'Articles']);
        Router::build($route, '/articles', ['controller' => 'Articles', 'action' => 'search']);
        Router::build($route, '/article/*', ['controller' => 'Articles', 'action' => 'view']);
        Router::build($route, '/my-articles', ['controller' => 'Articles', 'action' => 'index']);
        Router::build($route, '/content-add', ['controller' => 'Articles', 'action' => 'add']);
        Router::build($route, '/content-edit/*', ['controller' => 'Articles', 'action' => 'edit']);
        Router::build($route, '/content-delete/*', ['controller' => 'Articles', 'action' => 'delete']);
        Router::build($route, '/category-content/*', ['controller' => 'Articles', 'action' => 'contents']);
        Router::build($route, '/newsletter-articles/*', ['controller' => 'Articles', 'action' => 'newsletter']);
    }
);
