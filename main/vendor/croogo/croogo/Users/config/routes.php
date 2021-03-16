<?php

use Cake\Routing\RouteBuilder;
use Croogo\Core\Router;
use Croogo\Users\Controller\UsersController;

Router::plugin('Croogo/Users', ['path' => '/'], function (RouteBuilder $route) {
    $route->prefix('admin', function (RouteBuilder $route) {
        $route->extensions(['json']);

        $route->scope('/users', [], function (RouteBuilder $route) {
            $route->fallbacks();
        });
    });
    $route->setExtensions(['json', 'xml']);
    Router::build($route, '/', ['controller' => 'Users', 'action' => 'main']);

    //Router::build($route, '/' . UsersController::REGISTER_REF_LINK, ['controller' => 'Users', 'action' => 'add']);
    Router::build($route, '/user/:username', ['controller' => 'Users', 'action' => 'view'], ['pass' => ['username']]);

    Router::build($route, '/users', ['controller' => 'Users', 'action' => 'index']);
    Router::build($route, '/users/:action/*', ['controller' => 'Users']);
    Router::build($route, '/settings-general', ['controller' => 'Users', 'action' => 'general']);
    Router::build($route, '/settings-inbox', ['controller' => 'Users', 'action' => 'inbox']);
    Router::build($route, '/settings-password', ['controller' => 'Users', 'action' => 'change']);
    Router::build($route, '/subscriptions', ['controller' => 'Users', 'action' => 'subscriptions']);
    Router::build($route, '/login', ['controller' => 'Users', 'action' => 'login']);
    Router::build($route, '/logout', ['controller' => 'Users', 'action' => 'logout']);
    Router::build($route, '/terms', ['controller' => 'Users', 'action' => 'terms']);
    Router::build($route, '/aml-policy', ['controller' => 'Users', 'action' => 'aml']);
    Router::build($route, '/privacy-policy', ['controller' => 'Users', 'action' => 'policy']);
    Router::build($route, '/mails', ['controller' => 'Users', 'action' => 'mails']);
});

Router::plugin('Croogo/Users', ['path' => '/'], function (RouteBuilder $route) {
    $route->prefix('api', function (RouteBuilder $route) {
        $route->prefix('v10', ['path' => '/v1.0'], function (RouteBuilder $route) {
            $route->extensions(['json']);

            $route->scope('/users', [], function (RouteBuilder $route) {
                $route->fallbacks();
            });
        });
    });
});
