<?php

namespace Croogo\Users\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class RolesTable extends CroogoTable
{

    const ROLE_REGISTERED = 2;

    /**
     * Display fields for this model
     *
     * @var array
     */
    protected $_displayFields = [
        'title',
        'alias',
    ];

    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->addBehavior('Acl.Acl', [
            'className' => 'Croogo/Core.CroogoAcl',
            'type' => 'requester'
        ]);
        $this->addBehavior('Search.Search');
    }

    public function getRolesForChange()
    {
        return $this->find('list')
            ->where([
                'alias NOT IN' => [
                    'public',
                    'registered',
                    'admin',
                    'superadmin'
                ]
            ]);
    }

    public function getRolesForView()
    {
        return $this->find()
            ->select([
                'id',
                'title',
                'alias'
            ])
            ->where([
                'alias NOT IN' => [
                    'public',
                    'registered',
                    'admin',
                    'superadmin'
                ]
            ]);
    }

    public function getAddedRemovedRoles($user, $data)
    {
        $userCurrentRoles = [];
        foreach ($user->roles as $role) {
            $userCurrentRoles[] = (int)$role->id;
        }
        $addedString = $removedString = '';
        $addedRoles = $removedRoles = [];
        foreach ($data['roles']['_ids'] as $newRole) {
            if (!in_array($newRole, $userCurrentRoles)) {
                $addedRoles[] = (int)$newRole;
            }
        }
        if (!empty($addedRoles)) {
            $addedString = $this->getRoleNames($addedRoles);
        }
        foreach ($userCurrentRoles as $currentRole) {
            if (!in_array($currentRole, $data['roles']['_ids'])) {
                $removedRoles[] = (int)$currentRole;
            }
        }
        if (!empty($removedRoles)) {
            $removedString = $this->getRoleNames($removedRoles);
        }
        return ['added' => $addedString, 'removed' => $removedString, 'removedIds' => $removedRoles];
    }

    public function getRolesRemovedIds($user, $data)
    {
        $userCurrentRoles = [];
        foreach ($user->roles as $role) {
            $userCurrentRoles[] = (int)$role->id;
        }
        $removedRoles = [];
        foreach ($userCurrentRoles as $currentRole) {
            if (!in_array($currentRole, $data['roles']['_ids'])) {
                $removedRoles[] = (int)$currentRole;
            }
        }
        return $removedRoles;
    }

    /**
     * Returns role metadata array for given ids array.
     *
     * @param int[] $roles
     *
     * @return array
     */
    public function getRolesMetadata(array $roles): array
    {
        return $this->find()
            ->select([
                'id',
                'title',
                'alias'
            ])
            ->where(['id IN' => $roles])
            ->toArray();
    }

    private function getRoleNames($roles)
    {
        $names = '';
        $items = $this->find('list')
            ->select(['title'])
            ->where(['id IN' => $roles])
            ->toArray();
        end($items);
        $lastItems = key($items);
        foreach ($items as $i => $item) {
            if ($lastItems == $i) {
                $names .= ' ' . __($item);
            } else {
                $names .= ' ' . __($item) . ',';
            }
        }
        return $names;
    }
}
