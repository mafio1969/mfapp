<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;

Router::plugin(
    'Notices',
    ['path' => '/'],
    function (RouteBuilder $route) {
        Router::build($route, '/notices/:action/*', ['controller' => 'Notices']);
        Router::build($route, '/inbox', ['controller' => 'Notices', 'action' => 'index']);
        Router::build($route, '/inbox-my-content', ['controller' => 'Notices', 'action' => 'content']);
        Router::build($route, '/inbox-new-content', ['controller' => 'Notices', 'action' => 'news']);
        Router::build($route, '/inbox-reports', ['controller' => 'Notices', 'action' => 'reports']);
        Router::build($route, '/inbox-others', ['controller' => 'Notices', 'action' => 'others']);
        Router::build($route, '/inbox-item/*', ['controller' => 'Notices', 'action' => 'view']);
        Router::build($route, '/inbox-subscriptions', ['controller' => 'Notices', 'action' => 'subscriptions']);
    }
);
