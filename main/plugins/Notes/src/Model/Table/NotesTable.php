<?php

namespace Notes\Model\Table;

use Cake\I18n\I18n;
use Cake\Validation\Validator;
use Croogo\Core\Model\Table\CroogoTable;

class NotesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->hasMany('FirstNotes', [
            'className' => 'Notes.Notes',
            'foreignKey' => 'parent_id'
        ]);
        $this->hasMany('SecondNotes', [
            'className' => 'Notes.Notes',
            'foreignKey' => 'parent_id'
        ]);
        $this->hasMany('VotesNotes', [
            'className' => 'Votes.VotesNotes'
        ]);
        $this->hasMany('NotesSubscriptions', [
            'className' => 'Subscriptions.NotesSubscriptions'
        ]);
        $this->hasMany('CommentsSubscriptions', [
            'className' => 'Subscriptions.CommentsSubscriptions',
            'foreignKey' => 'comment_id'
        ]);
        $this->hasMany('Reports', [
            'className' => 'Reports.Reports',
            'foreignKey' => 'content_id',
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
                'counter_comments' => [
                    'conditions' => ['Notes.parent_id IS NULL']
                ],
                'counter_sub_comments' => [
                    'conditions' => ['Notes.parent_id IS NOT NULL']
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

    public function getNotesForArticleView($articleId, $userId, $order)
    {
        return $this->find()
            ->where([
                'Notes.parent_id IS NULL',
                'Notes.article_id' => $articleId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(
                [
                    'Articles',
                    'Users' => [
                        'fields' => [
                            'image',
                            'name'
                        ]
                    ],
                    'VotesNotes' => [
                        'conditions' => [
                            'VotesNotes.user_id' => $userId,
                            'VotesNotes.status' => 1
                        ],
                    ],
                    'FirstNotes' => [
                        'VotesNotes' => [
                            'conditions' => [
                                'VotesNotes.user_id' => $userId,
                                'VotesNotes.status' => 1
                            ],
                        ],
                        'Reports' => [
                            'fields' => [
                                'Reports.user_id',
                                'Reports.id',
                                'Reports.content_id'
                            ],
                            'conditions' => [
                                'Reports.report_type_id' => 2,
                                'Reports.status' => 0,
                                'Reports.user_id' => $userId,
                                'OR' => [
                                    ['Reports.report_content_type_id' => 3],
                                    ['Reports.report_content_type_id' => 4],
                                    ['Reports.report_content_type_id' => 5],
                                    ['Reports.report_content_type_id' => 6]
                                ]
                            ]
                        ],
                        'Users' => [
                            'fields' => [
                                'image',
                                'name'
                            ]
                        ],
                        'SecondNotes' => [
                            'VotesNotes' => [
                                'conditions' => [
                                    'VotesNotes.user_id' => $userId,
                                    'VotesNotes.status' => 1
                                ],
                            ],
                            'Users' => [
                                'fields' => [
                                    'image',
                                    'name'
                                ]
                            ],
                            'Reports' => [
                                'fields' => [
                                    'Reports.user_id',
                                    'Reports.id',
                                    'Reports.content_id'
                                ],
                                'conditions' => [
                                    'Reports.report_type_id' => 2,
                                    'Reports.status' => 0,
                                    'Reports.user_id' => $userId,
                                    'OR' => [
                                        ['Reports.report_content_type_id' => 3],
                                        ['Reports.report_content_type_id' => 4],
                                        ['Reports.report_content_type_id' => 5],
                                        ['Reports.report_content_type_id' => 6]
                                    ]
                                ]
                            ]
                        ],
                        'CommentsSubscriptions' => [
                            'conditions' => [
                                'CommentsSubscriptions.user_id' => $userId,
                            ]
                        ]
                    ],
                    'NotesSubscriptions' => [
                        'conditions' => [
                            'NotesSubscriptions.user_id' => $userId
                        ],
                    ],
                    'Reports' => [
                        'fields' => [
                            'Reports.user_id',
                            'Reports.id',
                            'Reports.content_id'
                        ],
                        'conditions' => [
                            'Reports.report_type_id' => 2,
                            'Reports.status' => 0,
                            'Reports.user_id' => $userId,
                            'OR' => [
                                ['Reports.report_content_type_id' => 3],
                                ['Reports.report_content_type_id' => 4],
                                ['Reports.report_content_type_id' => 5],
                                ['Reports.report_content_type_id' => 6]
                            ]
                        ]
                    ]
                ]
            )
            ->orderDesc($order);
    }

    public function getParentForComment($parentNoteId)
    {
        return $this->find()
            ->select([
                'Notes.id',
                'Notes.article_id',
                'Notes.user_id',
                'Notes.description',
            ])
            ->where([
                'Notes.id' => $parentNoteId,
                'Notes.parent_id IS' => null,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles' => [
                    'fields' => [
                        'Articles.id',
                        'Articles.type_id',
                        'Articles.title'
                    ]
                ]
            ])
            ->first();
    }

    public function getChildForComment($parentNoteId)
    {
        return $this->find()
            ->select([
                'Notes.id',
                'Notes.article_id'
            ])
            ->where([
                'Notes.id' => $parentNoteId,
                'Notes.parent_id IS NOT' => null,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles' => [
                    'fields' => [
                        'Articles.id',
                        'Articles.type_id'
                    ]
                ]
            ])
            ->first();
    }

    public function getParentForRemove($noteId)
    {
        return $this->find()
            ->select([
                'Notes.id',
                'Notes.user_id',
                'Notes.article_id',
                'Notes.is_deleted',
                'Notes.description',
            ])
            ->where([
                'Notes.id' => $noteId,
                'Notes.parent_id IS NULL',
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles' => [
                    'fields' => [
                        'Articles.id',
                        'Articles.type_id',
                        'Articles.title'
                    ]
                ]
            ])
            ->first();
    }

    public function getChildForRemove($noteId)
    {
        return $this->find()
            ->select([
                'Notes.id',
                'Notes.user_id',
                'Notes.article_id',
                'Notes.is_deleted',
                'Notes.description',
            ])
            ->where([
                'Notes.id' => $noteId,
                'Notes.parent_id IS NOT NULL',
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles' => [
                    'fields' => [
                        'Articles.id',
                        'Articles.type_id',
                        'Articles.title'
                    ]
                ]
            ])
            ->first();
    }

    public function getNoteCommentForEdit($noteId)
    {
        return $this->find()
            ->select(['id', 'user_id', 'description'])
            ->where([
                'Notes.id' => $noteId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles'])
            ->first();
    }

    public function getNotesForSubscriptions($noteId)
    {
        return $this->find()
            ->select([
                'Notes.id',
                'Notes.parent_id',
                'Notes.article_id',
                'Notes.description'
            ])
            ->where([
                'Notes.id' => $noteId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles',
                'Users' => [
                    'fields' => [
                        'Users.id',
                        'Users.name',
                        'Users.image'
                    ]
                ]
            ])
            ->first();
    }

    public function getNoteForVote($noteId)
    {
        return $this->find()
            ->select([
                'id',
                'parent_id'
            ])
            ->where([
                'Notes.id' => $noteId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles'])
            ->first();
    }

    public function getParentForSubscription($noteId)
    {
        return $this->find()
            ->select([
                'id',
                'parent_id'
            ])
            ->where([
                'Notes.id' => $noteId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles'])
            ->first();
    }

    public function getForReportRemove($noteId)
    {
        return $this->find()
            ->select([
                'id',
                'is_deleted',
                'is_deleted_by'
            ])
            ->where([
                'Notes.id' => $noteId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles'])
            ->first();
    }

    public function getForReportComment($commentId)
    {
        return $this->find()
            ->select([
                'Notes.id',
                'Notes.user_id',
                'Notes.article_id',
                'Notes.parent_id',
                'Notes.is_deleted',
                'Notes.is_deleted_by',
                'Notes.description',
            ])
            ->where([
                'Notes.id' => $commentId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles' => [
                    'fields' => [
                        'Articles.id',
                        'Articles.type_id',
                        'Articles.title'
                    ]
                ]
            ])
            ->first();
    }
}
