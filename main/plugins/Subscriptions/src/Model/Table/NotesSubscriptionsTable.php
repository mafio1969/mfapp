<?php

namespace Subscriptions\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class NotesSubscriptionsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Croogo/Users.Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('Notes', [
            'className' => 'Notes.Notes',
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new'
                ]
            ]
        ]);
    }

    public function checkIfExists($userId, $noteId)
    {
        return $this->find()
            ->where([
                'user_id' => $userId,
                'note_id' => $noteId
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

    public function getAllWithNoteId($noteId)
    {
        return $this->find()
            ->where([
                'note_id' => $noteId
            ]);
    }
}
