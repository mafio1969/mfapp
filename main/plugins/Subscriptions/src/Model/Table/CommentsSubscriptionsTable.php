<?php

namespace Subscriptions\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class CommentsSubscriptionsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Croogo/Users.Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('SubNotes', [
            'className' => 'Notes.NotesComments',
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new'
                ]
            ]
        ]);
    }

    public function checkIfExists($userId, $commentId)
    {
        return $this->find()
            ->where([
                'user_id' => $userId,
                'comment_id' => $commentId
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
}
