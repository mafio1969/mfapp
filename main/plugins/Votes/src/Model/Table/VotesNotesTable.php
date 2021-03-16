<?php

namespace Votes\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class VotesNotesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->addBehavior('CounterCache', [
            'Notes' => [
                'counter_up_vote' => [
                    'conditions' => ['VotesNotes.status' => 1]
                ]
            ]
        ]);
        $this->belongsTo('Notes', [
            'className' => 'Notes.Notes',
        ]);
    }

    public function checkIfExists($userId, $noteId)
    {
        return $this->find()
            ->where([
                'VotesNotes.user_id' => $userId,
                'VotesNotes.note_id' => $noteId
            ])
            ->contain([
                'Notes' => [
                    'fields' => [
                        'id',
                        'article_id',
                        'parent_id'
                    ],
                    'Articles' => [
                        'fields' => [
                            'id',
                            'type_id'
                        ]
                    ]
                ]
            ])
            ->first();
    }
}
