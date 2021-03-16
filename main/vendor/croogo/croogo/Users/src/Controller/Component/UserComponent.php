<?php

namespace Croogo\Users\Controller\Component;

use Cake\Controller\Component;
use Cake\ORM\TableRegistry;
use Cake\Utility\Text;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Model\Table\UsersTable;

/**
 * Class UserComponent
 * @package Croogo\Users\Controller\Component
 * @property UsersTable Users
 */
class UserComponent extends Component
{
    const IMAGE_PREFIX = 'uploads';
    const IMAGE_BLANK_USER = 'profile.png';
    const IMAGE_BLANK_CONTENT = 'news4.jpg';
    const IMAGE_BLANK_BANNER = 'default-img.jpg';

    public function upload($file)
    {
        if (isset($file['tmp_name'])
            && !empty($file['tmp_name'])
            && is_uploaded_file($file['tmp_name'])
        ) {
            $file['name'] = Text::slug($file['name'], [
                'replacement' => '_',
                'preserve' => '.'
            ]);

            $filename = $file['name'];
            $destination = WWW_ROOT . UserComponent::IMAGE_PREFIX . DS . $file['name'];

            if (file_exists($destination)) {
                $filename = Text::uuid() . '-' . $file['name'];
                $destination = WWW_ROOT . UserComponent::IMAGE_PREFIX . DS . $filename;
            }

            move_uploaded_file($file['tmp_name'], $destination);
            return $filename;
        }
        return false;
    }

    public function getUserGlobalPermissions($userId, $userModel)
    {
        $userRoles = $userModel->getUserRoles($userId);
        $roles = UsersController::getDefinedRoles();
        $userGlobalPermissions = [];
        foreach ($roles as $role) {
            $userGlobalPermissions[$role] = false;
            if (in_array($role, $userRoles)) {
                $userGlobalPermissions[$role] = true;
            }
        }
        return $userGlobalPermissions;
    }

    public function getUserGlobalPermissionsWithData($userId, $userModel)
    {
        $userData = $userModel->getUserRolesWithData($userId);
        $roles = UsersController::getDefinedRoles();
        $userGlobalPermissions = [];
        foreach ($roles as $role) {
            $userGlobalPermissions[$role] = false;
            if (in_array($role, $userData['userRoles'])) {
                $userGlobalPermissions[$role] = true;
            }
        }
        return [
            'user' => $userData['user'],
            'userGlobalPermissions' => $userGlobalPermissions
        ];
    }
}
