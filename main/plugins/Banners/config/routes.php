<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Banners',
    ['path' => '/'],
    function (RouteBuilder $route) {
        $route->setExtensions(['json']);
        Router::build($route, '/banners/:action/*', ['controller' => 'Banners']);
        Router::build($route, '/banners', ['controller' => 'Banners', 'action' => 'index']);
        Router::build($route, '/banner-add', ['controller' => 'Banners', 'action' => 'add']);
        Router::build($route, '/banner-edit/*', ['controller' => 'Banners', 'action' => 'edit']);
    }
);
