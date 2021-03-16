<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Votes',
    ['path' => '/'],
    function (RouteBuilder $route) {
        $route->setExtensions(['json', 'xml']);
        Router::build($route, '/votes/:action/*', ['controller' => 'Votes']);
    }
);
