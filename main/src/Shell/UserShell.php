<?php


namespace App\Shell;


use Cake\Auth\DefaultPasswordHasher;
use Cake\Console\Shell;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Model\Table\RolesBlocksTable;
use Croogo\Users\Model\Table\RolesTable;
use Croogo\Users\Model\Table\UsersTable;

/**
 * Class UserShell
 * @package App\Shell
 * @property UsersTable Users
 * @property RolesTable Roles
 * @property RolesBlocksTable RolesBlocks
 */
class UserShell extends Shell
{
    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Croogo/Users.Users');
        $this->loadModel('Croogo/Users.Roles');
        $this->loadModel('Croogo/Users.RolesBlocks');
    }

    public function getOptionParser()
    {
        $parser = parent::getOptionParser();
        $parser->addOption('username', ['help' => 'Username']);
        $parser->addOption('password', ['help' => 'Password']);
        return $parser;
    }

    public function create()
    {
        if (!isset($this->params['username']) || empty($this->params['username'])
            || !isset($this->params['password']) || empty($this->params['password'])) {
            return $this->out('Username and password required');
        }
        $username = $this->params['username'];
        $password = $this->params['password'];
        $roles = $this->Roles->find()
            ->where([
                'alias IN' => [
                    UsersController::ROLE_PUBLISHER_I,
                    UsersController::ROLE_PUBLISHER_II,
                    UsersController::ROLE_ACCEPT,
                    UsersController::ROLE_EDITOR,
                    UsersController::ROLE_SETTLE_I,
                    UsersController::ROLE_SETTLE_IV,
                    UsersController::ROLE_BLOCKED_II,
                    UsersController::ROLE_GIVE_PERMISSION_II,
                    UsersController::ROLE_SET_BANNER,
                    UsersController::ROLE_NEWSLETTER_ACCEPT
                ]
            ])
            ->all()
            ->toArray();
        $data = [
            'status' => 1,
            'username' => $username,
            'email' => $username,
            'name' => 'admin',
            'password' => $password,
            'verify_password' => $password,
            'is_first_login' => 1,
            'ref_link' => hash('md5', $username),
            'role_id' => RolesTable::ROLE_REGISTERED,
            'roles' => $roles
        ];
        $user = $this->Users->newEntity();
        $user = $this->Users->patchEntity($user, $data, [
            'fieldList' => [
                'status',
                'name',
                'username',
                'password',
                'email',
                'is_first_login',
                'ref_link',
                'ref_link_user_id'
            ]
        ]);
        $user->set([
            'role_id' => RolesTable::ROLE_REGISTERED,
            'roles' => $roles
        ]);
        if ($this->Users->save($user)) {
            return $this->out('User saved successfully');
        } else {
            return $this->out('Error occurred while saving user');
        }
    }

    public function unblock()
    {
        $begin = strtotime("today");
        $items = $this->RolesBlocks->find()
            ->where([
                'is_unblocked' => 0,
                'blocked_time < ' => $begin,
            ])
            ->limit(20);
        foreach ($items as $item) {
            $user = $this->Users->getUserForChangeRoles($item->user_id);
            if (!isset($user->id) || empty($user->id)) {
                continue;
            }
            $roles = [];
            foreach ($user->roles as $role) {
                $roles[] = $role->id;
            }
            $data['roles']['_ids'] = array_merge($roles, json_decode($item->roles, true));
            if ($this->Users->save($this->Users->patchEntity($user, $data))) {
                $this->RolesBlocks->updateAll(['is_unblocked' => 1], ['id' => $item->id]);
            }
        }
    }
}
