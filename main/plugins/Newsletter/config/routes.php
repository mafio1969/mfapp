<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Newsletter',
    ['path' => '/'],
    function (RouteBuilder $route) {
        $route->setExtensions(['json', 'xml']);
        Router::build($route, '/newsletter/:action/*', ['controller' => 'Newsletter']);
        Router::build($route, '/newsletter', ['controller' => 'Newsletter', 'action' => 'index']);
        Router::build($route, '/newsletter-history', ['controller' => 'Newsletter', 'action' => 'history']);
        Router::build($route, '/mailing-to-user-group', ['controller' => 'Newsletter', 'action' => 'mailingToUsersGroup']);
    }
);
