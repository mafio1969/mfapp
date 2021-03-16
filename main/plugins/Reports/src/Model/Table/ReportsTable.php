<?php


namespace Reports\Model\Table;

use Cake\Datasource\EntityInterface;
use Cake\Event\Event;
use Cake\I18n\I18n;
use Croogo\Core\Model\Table\CroogoTable;
use Croogo\Users\Controller\UsersController;
use Notices\Event\NoticesManager;
use Reports\Controller\ReportsController;
use ArrayObject;
use Cake\Event\EventInterface;

class ReportsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                    'updated' => 'always'
                ]
            ]
        ]);
        $this->hasMany('ReportsHistory', [
            'className' => 'Reports.ReportsHistory',
        ]);
        $this->belongsTo('Creators', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'user_id'
        ]);
        $this->belongsTo('ReportedUser', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'content_id',
            'conditions' => [
                'Reports.report_type_id' => ReportsController::REPORT_TYPE_USER
            ]
        ]);
        $this->belongsTo('ReportedContent', [
            'className' => 'Articles.Articles',
            'foreignKey' => 'content_id',
            'conditions' => [
                'Reports.report_type_id' => ReportsController::REPORT_TYPE_CONTENT,
                'Reports.report_content_type_id IN' => [
                    ReportsController::REPORT_CONTENT_TYPE_NEWS,
                    ReportsController::REPORT_CONTENT_TYPE_QUESTION
                ]
            ]
        ]);
        $this->belongsTo('ReportedComment', [
            'className' => 'Notes.Notes',
            'foreignKey' => 'content_id',
            'conditions' => [
                'Reports.report_type_id' => ReportsController::REPORT_TYPE_CONTENT,
                'Reports.report_content_type_id NOT IN' => [
                    ReportsController::REPORT_CONTENT_TYPE_NEWS,
                    ReportsController::REPORT_CONTENT_TYPE_QUESTION
                ]
            ]
        ]);
        $this->belongsTo('ReportedResolve', [
            'className' => 'Articles.Articles',
            'foreignKey' => 'content_id',
            'conditions' => [
                'Reports.report_type_id' => ReportsController::REPORT_TYPE_RESOLVE
            ]
        ]);
    }

    public function beforeFind($event, $query, $options) {
        $query->where(['Reports.lang' => I18n::getLocale()]);
        return $query;
    }

    public function beforeSave(Event $event, EntityInterface $entity, ArrayObject $options)
    {
        if (isset($entity)) {
            $entity->set('lang', I18n::getLocale());
        }
    }

    public function getReportsForIndex($conditions)
    {
        return $this->find()
            ->where($conditions)
            ->contain([
                'ReportedUser' => [
                    'fields' => [
                        'id',
                        'name'
                    ]
                ],
                'ReportedContent' => [
                    'fields' => [
                        'id',
                        'title',
                        'description'
                    ]
                ],
                'ReportedComment' => [
                    'fields' => [
                        'id',
                        'description'
                    ],
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title'
                        ]
                    ]
                ],
                'ReportedResolve' => [
                    'fields' => [
                        'id',
                        'title'
                    ]
                ],
                'ReportsHistory' => [
                    'Moderators' => [
                        'fields' => [
                            'id',
                            'name',
                            'image'
                        ]
                    ]
                ]
            ]);
    }

    public function getReportsForWaiting($userId, $userGlobalPermissions, $created)
    {
        $conditions = [
            'Reports.user_id !=' => $userId,
            'Reports.report_status' => ReportsController::REPORT_STATUS_WAITING,
            'Reports.moderated_by' => 0,
            'Reports.report_contact_time <' => time() - ReportsController::REPORT_TIME_TO_CONTACT,
            'Reports.created > ' => $created,
            'OR' => [
                [
                    'ReportedContent.user_id !=' => $userId,
                ],
                [
                    'ReportedComment.user_id !=' => $userId,
                ],
                [
                    'ReportedUser.id !=' => $userId,
                ],
                [
                    'ReportedResolve.user_id !=' => $userId,
                ]
            ]

        ];
        if (!$userGlobalPermissions[UsersController::ROLE_SETTLE_I] && !$userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
            return $this->find()->where(['id != id']);
        }
        if ($userGlobalPermissions[UsersController::ROLE_SETTLE_I]) {
            $conditions['AND']['OR'][] = [
                'report_level' => ReportsController::REPORT_LEVEL_I
            ];
        }
        if ($userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
            $conditions['AND']['OR'][] = [
                'report_level' => ReportsController::REPORT_LEVEL_II
            ];
        }
        return $this->find()
            ->where($conditions)
            ->contain([
                'ReportedUser' => [
                    'fields' => [
                        'id',
                        'name'
                    ]
                ],
                'ReportedContent' => [
                    'fields' => [
                        'id',
                        'user_id',
                        'title',
                        'description'
                    ]
                ],
                'ReportedComment' => [
                    'fields' => [
                        'id',
                        'user_id',
                        'description'
                    ],
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title',
                            'user_id'
                        ]
                    ]
                ],
                'ReportedResolve' => [
                    'fields' => [
                        'id',
                        'user_id',
                        'title'
                    ]
                ],
                'ReportsHistory' => [
                    'Moderators' => [
                        'fields' => [
                            'id',
                            'name',
                            'image'
                        ]
                    ]
                ],
                'Creators' => [
                    'fields' => [
                        'id',
                        'name',
                        'image'
                    ]
                ]
            ]);
    }

    public function getReportsForTaken($userId, $userGlobalPermissions, $created)
    {
        $conditions = [
            'Reports.user_id !=' => $userId,
            'Reports.created > ' => $created,
            'Reports.report_status IN' => [
                ReportsController::REPORT_STATUS_ACCEPTED,
                ReportsController::REPORT_STATUS_REJECTED,
                ReportsController::REPORT_STATUS_CONTACT,
                ReportsController::REPORT_STATUS_USER_BLOCK,
                ReportsController::REPORT_STATUS_USER_PERMISSIONS_BLOCK,
                ReportsController::REPORT_STATUS_CONTENT_REMOVE,
                ReportsController::REPORT_STATUS_COMMENT_REMOVE,
                ReportsController::REPORT_STATUS_REJECT_REMOVE,
            ],
        ];
        if (!$userGlobalPermissions[UsersController::ROLE_SETTLE_I] || !$userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
            return $this->find()->where(['id != id']);
        }
        if ($userGlobalPermissions[UsersController::ROLE_SETTLE_I]) {
            $conditions['OR'][] = [
                'report_level' => ReportsController::REPORT_LEVEL_I
            ];
        }
        if ($userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
            $conditions['OR'][] = [
                'report_level' => ReportsController::REPORT_LEVEL_II
            ];
        }
        return $this->find()
            ->where($conditions)
            ->contain([
                'ReportedUser' => [
                    'fields' => [
                        'id',
                        'name'
                    ]
                ],
                'ReportedContent' => [
                    'fields' => [
                        'id',
                        'title',
                        'description'
                    ]
                ],
                'ReportedComment' => [
                    'fields' => [
                        'id',
                        'description'
                    ],
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title'
                        ]
                    ]
                ],
                'ReportedResolve' => [
                    'fields' => [
                        'id',
                        'title'
                    ]
                ],
                'ReportsHistory' => [
                    'Moderators' => [
                        'fields' => [
                            'id',
                            'name',
                            'image'
                        ]
                    ]
                ],
                'Creators' => [
                    'fields' => [
                        'id',
                        'name',
                        'image'
                    ]
                ]
            ]);
    }

    public function getReportsForCases($moderatorId, $userGlobalPermissions)
    {
        $conditions = [
            'moderated_by' => $moderatorId
        ];
        if (!$userGlobalPermissions[UsersController::ROLE_SETTLE_I] || !$userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
            return $this->find()->where(['id != id']);
        }
        if ($userGlobalPermissions[UsersController::ROLE_SETTLE_I]) {
            $conditions['OR'][] = [
                'report_level' => ReportsController::REPORT_LEVEL_I
            ];
        }
        if ($userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
            $conditions['OR'][] = [
                'report_level' => ReportsController::REPORT_LEVEL_II
            ];
        }
        return $this->find()
            ->where($conditions)
            ->contain([
                'ReportedUser' => [
                    'fields' => [
                        'id',
                        'name'
                    ]
                ],
                'ReportedContent' => [
                    'fields' => [
                        'id',
                        'title',
                        'description'
                    ]
                ],
                'ReportedComment' => [
                    'fields' => [
                        'id',
                        'description'
                    ],
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title'
                        ],
                    ]
                ],
                'ReportedResolve' => [
                    'fields' => [
                        'id',
                        'title'
                    ]
                ],
                'Creators' => [
                    'fields' => [
                        'id',
                        'name',
                        'image'
                    ]
                ],
                'ReportsHistory' => [
                    'Moderators' => [
                        'fields' => [
                            'id',
                            'name',
                            'image'
                        ]
                    ]
                ]
            ]);
    }

    public function getReportForView($userId, $id)
    {
        return $this->find()
            ->where([
                'Reports.id' => $id,
                'Reports.user_id !=' => $userId
            ])
            ->contain([
                'ReportedUser' => [
                    'fields' => [
                        'id',
                        'name'
                    ],
                    'Roles'
                ],
                'ReportedContent' => [
                    'fields' => [
                        'id',
                        'title',
                        'description'
                    ]
                ],
                'ReportedComment' => [
                    'fields' => [
                        'id',
                        'description'
                    ],
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title'
                        ]
                    ]
                ],
                'ReportedResolve' => [
                    'fields' => [
                        'id',
                        'title'
                    ]
                ],
                'Creators' => [
                    'fields' => [
                        'id',
                        'name',
                        'image'
                    ]
                ]
            ])
            ->first();
    }

    public function getReportForObjection($userId, $reportId)
    {
        return $this->find()
            ->contain([
                'ReportedContent' => [
                    'fields' => [
                        'user_id',
                    ]
                ],
                'ReportedComment' => [
                    'fields' => [
                        'user_id',
                    ],
                ],
                'ReportedResolve' => [
                    'fields' => [
                        'user_id',
                    ]
                ],
            ])
            ->orWhere([
                'Reports.id' => $reportId,
                'ReportedContent.user_id' => $userId
            ])
            ->orWhere([
                'Reports.id' => $reportId,
                'ReportedComment.user_id' => $userId
            ])
            ->orWhere([
                'Reports.id' => $reportId,
                'ReportedResolve.user_id' => $userId
            ])
            ->first();
    }

    public function getReportByIdTypeUser($id)
    {
        return $this->find()
            ->where([
                'id' => $id,
                'report_type_id' => ReportsController::REPORT_TYPE_USER
            ])
            ->first();
    }

    public function getUserReportsCounter($userId, $userGlobalPermissions, $created)
    {
        $result = [
            'user' => 0,
            'moderator' => 0
        ];
        $result['user'] = $this->find()
            ->where([
                'user_id' => $userId,
                'status' => ReportsController::REPORT_UNREAD
            ])
            ->count();
        if ($userGlobalPermissions[UsersController::ROLE_SETTLE_I] || $userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
            if ($userGlobalPermissions[UsersController::ROLE_SETTLE_I]
                && !$userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
                $result['moderator'] = $this->find()
                    ->where([
                        'Reports.user_id !=' => $userId,
                        'Reports.report_level' => ReportsController::REPORT_LEVEL_I,
                        'Reports.report_status' => 0,
                        'Reports.moderated_by' => 0,
                        'Reports.report_contact_time <' => time() - ReportsController::REPORT_TIME_TO_CONTACT,
                        'Reports.created > ' => $created,
                        'OR' => [
                            [
                                'ReportedContent.user_id !=' => $userId,
                            ],
                            [
                                'ReportedComment.user_id !=' => $userId,
                            ],
                            [
                                'ReportedUser.id !=' => $userId,
                            ],
                            [
                                'ReportedResolve.user_id !=' => $userId,
                            ]
                        ]
                    ])
                    ->contain([
                            'ReportedContent' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'title',
                                    'description'
                                ]
                            ],
                            'ReportedComment' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'description'
                                ],
                                'Articles' => [
                                    'fields' => [
                                        'id',
                                        'title',
                                        'user_id'
                                    ],

                                ]
                            ],
                            'ReportedUser' => [
                                'fields' => [
                                    'id',
                                    'name'
                                ]
                            ],
                            'ReportedResolve' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'title'
                                ]
                            ],
                            'Creators' => [
                                'fields' => [
                                    'id',
                                    'name',
                                    'image'
                                ]
                            ]
                        ]
                    )
                    ->count();
            } elseif (!$userGlobalPermissions[UsersController::ROLE_SETTLE_I]
                && $userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
                $result['moderator'] = $this->find()
                    ->where([
                        'Reports.user_id !=' => $userId,
                        'Reports.report_level' => ReportsController::REPORT_LEVEL_II,
                        'Reports.report_status' => 0,
                        'Reports.moderated_by' => 0,
                        'Reports.report_contact_time <' => time() - ReportsController::REPORT_TIME_TO_CONTACT,
                        'Reports.created > ' => $created,
                        'OR' => [
                            [
                                'ReportedContent.user_id !=' => $userId,
                            ],
                            [
                                'ReportedComment.user_id !=' => $userId,
                            ],
                            [
                                'ReportedUser.id !=' => $userId,
                            ],
                            [
                                'ReportedResolve.user_id !=' => $userId,
                            ]
                        ]
                    ])
                    ->contain([
                            'ReportedContent' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'title',
                                    'description'
                                ]
                            ],
                            'ReportedComment' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'description'
                                ],
                                'Articles' => [
                                    'fields' => [
                                        'id',
                                        'title',
                                        'user_id'
                                    ],

                                ]
                            ],
                            'ReportedUser' => [
                                'fields' => [
                                    'id',
                                    'name'
                                ]
                            ],
                            'ReportedResolve' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'title'
                                ]
                            ],
                            'Creators' => [
                                'fields' => [
                                    'id',
                                    'name',
                                    'image'
                                ]
                            ]
                        ]
                    )
                    ->count();
            } elseif ($userGlobalPermissions[UsersController::ROLE_SETTLE_I]
                && $userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) {
                $result['moderator'] = $this->find()
                    ->where([
                        'Reports.user_id !=' => $userId,
                        'Reports.report_level IN' => [
                            ReportsController::REPORT_LEVEL_I,
                            ReportsController::REPORT_LEVEL_II
                        ],
                        'Reports.report_status' => 0,
                        'Reports.moderated_by' => 0,
                        'Reports.report_contact_time <' => time() - ReportsController::REPORT_TIME_TO_CONTACT,
                        'Reports.created > ' => $created,
                        'OR' => [
                            [
                                'ReportedContent.user_id !=' => $userId,
                            ],
                            [
                                'ReportedComment.user_id !=' => $userId,
                            ],
                            [
                                'ReportedUser.id !=' => $userId,
                            ],
                            [
                                'ReportedResolve.user_id !=' => $userId,
                            ]
                        ]
                    ])
                    ->contain([
                            'ReportedContent' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'title',
                                    'description'
                                ]
                            ],
                            'ReportedComment' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'description'
                                ],
                                'Articles' => [
                                    'fields' => [
                                        'id',
                                        'title',
                                        'user_id'
                                    ],

                                ]
                            ],
                            'ReportedUser' => [
                                'fields' => [
                                    'id',
                                    'name'
                                ]
                            ],
                            'ReportedResolve' => [
                                'fields' => [
                                    'id',
                                    'user_id',
                                    'title'
                                ]
                            ],
                            'Creators' => [
                                'fields' => [
                                    'id',
                                    'name',
                                    'image'
                                ]
                            ]
                        ]
                    )
                    ->count();
            }
        }
        return $result;
    }

    public function getReportForRemoveContent($reportId)
    {
        return $this->find()
            ->select([
                'id',
                'report_type_id',
                'report_content_type_id',
                'content_id'
            ])
            ->where([
                'id' => $reportId
            ])
            ->first();
    }

    public function getReportForCancel($reportId)
    {
        return $this->find()
            ->select([
                'id',
                'status',
                'report_status',
                'moderated_by'
            ])
            ->where([
                'id' => $reportId

            ])
            ->first();
    }

    public function getReportForContact($reportId)
    {
        return $this->find()
            ->select([
                'Reports.id',
                'Reports.report_type_id',
                'Reports.status',
                'Reports.report_status',
                'Reports.moderated_by',
                'Reports.report_content_type_id',
                'Reports.content_id'
            ])
            ->where([
                'Reports.id' => $reportId

            ])
            ->contain([
                'ReportedUser' => [
                    'fields' => [
                        'id',
                        'name'
                    ],
                    'Roles'
                ],
                'ReportedContent' => [
                    'fields' => [
                        'id',
                        'user_id',
                        'title',
                        'description'
                    ]
                ],
                'ReportedComment' => [
                    'fields' => [
                        'id',
                        'user_id',
                        'description'
                    ],
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title'
                        ]
                    ]
                ],
                'ReportedResolve' => [
                    'fields' => [
                        'id',
                        'user_id',
                        'title'
                    ]
                ]
            ])
            ->first();
    }

    public function getReportForAcceptContent($reportId)
    {
        return $this->find()
            ->select([
                'id',
                'report_type_id',
                'report_content_type_id',
                'content_id'
            ])
            ->where([
                'Reports.id' => $reportId
            ])
            ->contain([
                'ReportedResolve' => [
                    'fields' => [
                        'id',
                        'is_visible',
                        'counter_accepts',
                        'counter_rejects',
                        'published'
                    ]
                ]
            ])
            ->first();
    }
}
