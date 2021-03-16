<?php

namespace Notes\Model\Table;

use Cake\I18n\I18n;
use Cake\Validation\Validator;
use Croogo\Core\Model\Table\CroogoTable;

class NotesCommentsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Notes', [
            'className' => 'Notes.Notes'
        ]);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles'
        ]);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->hasMany('SubNotes', [
            'className' => 'Notes.NotesComments',
            'foreignKey' => 'parent_id'
        ]);
        $this->hasMany('CommentsSubscriptions', [
            'className' => 'Subscriptions.CommentsSubscriptions',
            'foreignKey' => 'comment_id'
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                    'updated' => 'always'
                ]
            ]
        ]);
        $this->addBehavior('CounterCache', [
            'Articles' => [
                'counter_sub_comments' => [
                    'finder' => 'articleByType'
                ]
            ]
        ]);
    }

    public function validationDefault(Validator $validator)
    {
        return $validator
            ->add('description', [
                'notBlank' => [
                    'rule' => 'notBlank',
                    'message' => 'The description cannot be empty.',
                    'last' => true
                ]
            ]);
    }

    public function getParent($parentId)
    {
        return $this->find('all')
            ->where(
                [
                    'NotesComments.id' => $parentId,
                    'NotesComments.parent_id IS' => null,
                    'Articles.lang' => I18n::getLocale(),
                ]
            )
            ->contain([
                'Notes',
                'Articles' => [
                    'fields' => [
                        'Articles.id',
                        'Articles.type_id'
                    ]
                ]
            ])
            ->first();
    }
}
