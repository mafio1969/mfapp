<?php
/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link      https://cakephp.org CakePHP(tm) Project
 * @since     0.2.9
 * @license   https://opensource.org/licenses/mit-license.php MIT License
 */

namespace App\Controller;

use Cake\Controller\Controller;
use Cake\Core\Configure;
use Cake\Event\Event;
use Cake\I18n\I18n;
use Cake\Routing\Router;
use Cake\Utility\Hash;
use Croogo\Core\Croogo;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Model\Table\UsersTable;
use Notices\Model\Table\NoticesTable;
use Reports\Model\Table\ReportsTable;

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @link https://book.cakephp.org/3.0/en/controllers.html#the-app-controller
 * @property UsersTable Users
 * @property NoticesTable Notices
 * @property ReportsTable Reports
 * @property UserComponent User
 */
class AppController extends Controller
{
    public $components = ['User'];

    static $languageMapper = [
        'pl' => 'pl_PL',
        'en' => 'en_US',
    ];

    public $userGlobalPermissions = [];

    /**
     * Initialization hook method.
     *
     * Use this method to add common initialization code like loading components.
     *
     * e.g. `$this->loadComponent('Security');`
     *
     * @return void
     */
    public function initialize()
    {
        parent::initialize();

        $this->loadComponent('RequestHandler');
        $this->loadComponent('Flash');
        $this->loadComponent('Croogo/Users.User');
        $this->loadModel('Notices.Notices');
        $this->loadModel('Reports.Reports');
        $this->loadModel('Croogo/Users.Users');

        if ($this->request->getParam('prefix') !== 'admin') {
            if (!$this->request->getParam('lang')) {
                if(isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
                    $browserLang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
                } else {
                    $browserLang = 'pl';
                }
                $acceptLang = ['pl', 'en'];
                if (in_array($browserLang, $acceptLang)) {
                    $this->request->addParams(['lang' => $browserLang]);
                }

                $lang = $this->request->getCookie('dataLg');
                if (isset(self::$languageMapper[$lang])) {
                    $this->request->addParams(['lang' => $lang]);
                }
            }
            if ($this->request->getParam('lang')) {
                $language = $this->request->getParam('lang');
                I18n::setLocale(self::$languageMapper[$language]);
            }
        }

        if ($this->request->getSession()->check('Auth.User.id')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $created = $this->request->getSession()->read('Auth.User.created');
            $userData = $this->User->getUserGlobalPermissionsWithData($userId, $this->Users);
            $user = $userData['user'];
            if ($this->request->getParam('plugin') !== 'Croogo/Users'
                && $this->request->getParam('controller') !== 'Users'
                && $this->request->getParam('action') !== 'blocked'
                && $user->is_blocked
                && ($user->is_blocked_time + $user->is_blocked_period > time())) {
                $this->request->getSession()->write('Auth.User.is_blocked_period', $user->is_blocked_period);
                $this->request->getSession()->write('Auth.User.is_blocked_reason', $user->is_blocked_reason);
                return $this->redirect([
                    'plugin' => 'Croogo/Users',
                    'controller' => 'Users',
                    'action' => 'blocked'
                ]);
            } else {
                $this->userGlobalPermissions = $userData['userGlobalPermissions'];
                $roleId = $this->request->getSession()->read('Auth.User.role_id');
                $this->set([
                    'userGlobalPermissions' => $this->userGlobalPermissions,
                    'allCommentsCounters' => $this->Notices->getUserNoticesCounter(
                        $userId,
                        $this->userGlobalPermissions,
                        $created,
                        $roleId
                    )['all'],
                    'newContentCommentsCounters' => $this->Notices->getUserNoticesCounterNewContent(
                        $userId,
                        $this->userGlobalPermissions,
                        $created
                    ),
                    'counterReportsUser' => $this->Reports->getUserReportsCounter(
                        $userId,
                        $this->userGlobalPermissions,
                        $created
                    )
                ]);
            }
        }

        /*
         * Enable the following components for recommended CakePHP security settings.
         * see https://book.cakephp.org/3.0/en/controllers/components/security.html
         */
        //$this->loadComponent('Security');
        //$this->loadComponent('Csrf');
    }

    /**
     * Checks user global permissions.
     *
     * @param string $role
     *
     * @return bool
     */
    public function checkPermission($role)
    {
        if (!isset($this->userGlobalPermissions[$role])) {
            return false;
        }

        return (bool)$this->userGlobalPermissions[$role] === true;
    }
}
