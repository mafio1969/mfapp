<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Subscriptions',
    ['path' => '/'],
    function (RouteBuilder $route) {
        $route->setExtensions(['json', 'xml']);
        Router::build($route, '/subscriptions/:action/*', ['controller' => 'Subscriptions']);
       // Router::build($route, '/subscribe', ['controller' => 'Subscriptions', 'action' => 'add']);
    }
);
