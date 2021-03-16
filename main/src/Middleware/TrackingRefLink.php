<?php


namespace App\Middleware;


use Cake\Datasource\ModelAwareTrait;
use Cake\ORM\TableRegistry;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Model\Table\UsersTable;

/**
 * Class TrackingRefLink
 * @package App\Middleware
 * @property UsersTable Users
 */
class TrackingRefLink
{
    private $controllerName;

    public function __invoke($request, $response, $next)
    {
        $this->controllerName = $request->getParam('controller');
        $check = strpos($this->controllerName, UsersController::REF_LINK);
        if ($check !== false) {
            $refLink = str_replace(UsersController::REF_LINK, '', $this->controllerName);
            $this->Users = TableRegistry::get('Croogo/Users.Users');
            $user = $this->Users->getUserByRefLink($refLink);
            if (isset($user->id) && !empty($user)) {
                $session = $request->getSession();
                $session->write('ref_link', $user->id);
                $request->param('plugin', 'Croogo/Users');
                $request->param('controller', 'Users');
                $request->param('action', 'add');
                $request->param('pass', ['is_ref_link_valid' => true]);
            }
        }
        $response = $next($request, $response);
        return $response;
    }
}
