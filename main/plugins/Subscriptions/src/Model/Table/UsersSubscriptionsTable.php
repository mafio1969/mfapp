<?php

namespace Subscriptions\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class UsersSubscriptionsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Croogo/Users.Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new'
                ]
            ]
        ]);
    }

    public function checkIfExists($userId, $sub_userId)
    {
        return $this->find()
            ->where([
                'user_id' => $userId,
                'sub_user_id' => $sub_userId
            ])
            ->first();
    }

    public function getAllWithUserId($userId, $sortOrder)
    {
        return $this->find()
            ->where([
                'user_id' => $userId
            ])
            ->order([
                'created' => strtoupper($sortOrder) === 'ASC' ? 'ASC' : 'DESC',
            ]);
    }

    public function getAllSubscriptionsUser($userId)
    {
        return $this->find()
            ->where([
                'sub_user_id' => $userId
            ]);
    }
}
