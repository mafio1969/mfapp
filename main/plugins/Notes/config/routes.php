<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Notes',
    ['path' => '/'],
    function (RouteBuilder $route) {
        $route->setExtensions(['json', 'xml']);
        Router::build($route, '/notes/:action/*', ['controller' => 'Notes']);
        Router::build($route, '/accepts/:action/*', ['controller' => 'Accepts']);
        Router::build($route, '/rejects/:action/*', ['controller' => 'Rejects']);
        Router::build($route, '/reviews/:action/*', ['controller' => 'Reviews']);
    }
);
