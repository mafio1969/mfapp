<?php

namespace Notices\Model\Table;

use Cake\Datasource\EntityInterface;
use Cake\Event\Event;
use Cake\I18n\I18n;
use Croogo\Core\Model\Table\CroogoTable;
use Notices\Event\NoticesManager;
use Croogo\Users\Controller\UsersController;
use ArrayObject;
use Cake\Event\EventInterface;

class NoticesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('Creators', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'created_by'
        ]);
        $this->belongsTo('Reported', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'content_id'
        ]);
        $this->belongsTo('ArticlesNewContents', [
            'className' => 'Articles.Articles',
            'foreignKey' => 'content_id'
        ]);
        $this->hasOne('NoticesStatuses', [
            'className' => 'Notices.NoticesStatuses'
        ]);
        $this->hasOne('NoticesSubscriptions', [
            'className' => 'Notices.NoticesSubscriptions'
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                    'updated' => 'always'
                ]
            ]
        ]);
    }

    public function beforeFind($event, $query, $options) {
        $query->where(['Notices.lang' => I18n::getLocale()]);
        return $query;
    }

    public function beforeSave(Event $event, EntityInterface $entity, ArrayObject $options)
    {
        if (isset($entity)) {
            $entity->set('lang', I18n::getLocale());
        }
    }

    public function getAllUserCommentsCounter($userId, $userGlobalPermissions, $created, $roleId)
    {
        $noticeTypeNotForThisUser = $noticeTypeNotForKindUser = $noticeUserContentType = $noticeTypeUserOther = [];
        $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_NEW_CONTENT;
        if ((!$userGlobalPermissions[UsersController::ROLE_SETTLE_I] && !$userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) || ((int)$roleId == 4)) {
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_ACCEPT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_REJECT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_USER;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_COMMENT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_RESOLVE_I;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_RESOLVE_IV;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_CONTENT;
        }
        $noticeUserContentType[] = NoticesManager::TYPE_CONTENT;
        $noticeUserContentType[] = NoticesManager::TYPE_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_SUB_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_REJECT_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_REPLY;

        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_ADMIN_CONTACT;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_BLOCKED_USER;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_OTHER_COMMENT;


        return $this->find()
        ->where([
            'OR' => [
                [
                    'Notices.user_id' => $userId,
                    'Notices.status' => 1,
                    'Notices.is_deleted' => 0,
                    'Notices.created > ' => $created
                ],
                [
                    'Notices.user_id' => 0,
                    'Notices.is_deleted' => 0,
                    'Notices.created_by !=' => $userId,
                    'Notices.created > ' => $created,
                    'Notices.notice_type_id NOT IN' => $noticeTypeNotForThisUser,
                    'Notices.content_type_id !=' => NoticesManager::TYPE_REPORT,
                    'OR' => [
                        [
                            'NoticesStatuses.id IS NULL'
                        ],
                        [
                            'NoticesStatuses.is_deleted' => 0,
                            'NoticesStatuses.status' => 1,
                        ]
                    ]
                ],
                [
                    'NoticesSubscriptions.user_id' => $userId,
                    'OR' => [
                        [
                            'NoticesStatuses.id IS NULL'
                        ],
                        [
                            'NoticesStatuses.is_deleted' => 0,
                            'NoticesStatuses.status' => 1,
                        ]
                    ]
                ]
            ]
        ])
        ->contain([
            'Users' => [
                'fields' => ['id', 'name', 'image']
            ],
            'Creators' => ['fields' => ['id', 'name', 'image']],
            'Reported' => ['fields' => ['id', 'name', 'image']],
            'NoticesStatuses' => [
                'conditions' => [
                    'NoticesStatuses.user_id' => $userId,
                ]
            ],
            'NoticesSubscriptions' => [
                'conditions' => [
                    'NoticesSubscriptions.user_id' => $userId,
                ]
            ]
        ])
        ->count();
    }

    public function getUserNoticesCounter($userId, $userGlobalPermissions, $created, $roleId)
    {
        $noticeTypeNotForThisUser = $noticeTypeNotForKindUser = $noticeUserContentType = $noticeTypeUserOther = [];
        $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_NEW_CONTENT;
        if ((!$userGlobalPermissions[UsersController::ROLE_SETTLE_I] && !$userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) || ((int)$roleId == 4)) {
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_ACCEPT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_REJECT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_USER;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_COMMENT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_RESOLVE_I;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_RESOLVE_IV;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_CONTENT;
        }
        $noticeUserContentType[] = NoticesManager::TYPE_CONTENT;
        $noticeUserContentType[] = NoticesManager::TYPE_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_SUB_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_REJECT_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_REPLY;

        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_ADMIN_CONTACT;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_BLOCKED_USER;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_OTHER_COMMENT;

        $counters = [];
        $counters['all'] = $this->find()
            ->where([
                'OR' => [
                    [
                        'Notices.user_id' => $userId,
                        'Notices.status' => 1,
                        'Notices.is_deleted' => 0,
                        'Notices.created > ' => $created
                    ],
                    [
                        'Notices.user_id' => 0,
                        'Notices.is_deleted' => 0,
                        'Notices.created_by !=' => $userId,
                        'Notices.created > ' => $created,
                        'Notices.notice_type_id NOT IN' => [
                            NoticesManager::NOTICE_TYPE_REPORT_ACCEPT,
                            NoticesManager::NOTICE_TYPE_REPORT_REJECT,
                            NoticesManager::NOTICE_TYPE_REPORT_USER,
                            NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                            NoticesManager::NOTICE_TYPE_REPORT_CONTENT,
                            NoticesManager::NOTICE_TYPE_RESOLVE_I,
                            NoticesManager::NOTICE_TYPE_RESOLVE_IV,
                            NoticesManager::NOTICE_TYPE_REPORT_REPLY,
                            NoticesManager::NOTICE_TYPE_NEW_CONTENT
                        ],
                        'OR' => [
                            [
                                'NoticesStatuses.id IS NULL'
                            ],
                            [
                                'NoticesStatuses.is_deleted' => 0,
                                'NoticesStatuses.status' => 1,
                            ]
                        ]
                    ],
                    [
                        'NoticesSubscriptions.user_id' => $userId,
                        'OR' => [
                            [
                                'NoticesStatuses.id IS NULL'
                            ],
                            [
                                'NoticesStatuses.is_deleted' => 0,
                                'NoticesStatuses.status' => 1,
                            ]
                        ]
                    ]
                ]
            ])
            ->contain([
                'Users' => [
                    'fields' => ['id', 'name', 'image']
                ],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId,
                    ]
                ],
                'NoticesSubscriptions' => [
                    'conditions' => [
                        'NoticesSubscriptions.user_id' => $userId,
                    ]
                ]
            ])
            ->count();
        $counters['content'] = $this->find()
            ->where([
                'Notices.user_id' => $userId,
                'Notices.status' => 1,
                'Notices.is_deleted' => 0,
                'Notices.created > ' => $created,
                'Notices.content_type_id IN' => $noticeUserContentType
            ])->count();

            $counters['reports'] = $this->find()
                ->where([
                    'Notices.user_id' => $userId,
                    'Notices.created_by !=' => $userId,
                    'Notices.status' => 1,
                    'Notices.created > ' => $created,
                    'Notices.notice_type_id IN' => [
                        NoticesManager::NOTICE_TYPE_REPORT_ACCEPT,
                        NoticesManager::NOTICE_TYPE_REPORT_REJECT,
                        NoticesManager::NOTICE_TYPE_REPORT_USER,
                        NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                        NoticesManager::NOTICE_TYPE_REPORT_CONTENT,
                        NoticesManager::NOTICE_TYPE_RESOLVE_I,
                        NoticesManager::NOTICE_TYPE_RESOLVE_IV,
                        NoticesManager::NOTICE_TYPE_REPORT_REPLY
                    ]
                ])
                ->contain([
                    'NoticesStatuses' => [
                        'conditions' => [
                            'NoticesStatuses.user_id' => $userId,
                        ]
                    ]
                ])
                ->count();

        $counters['others'] = $this->find()
            ->where([
                'Notices.user_id' => $userId,
                'Notices.status' => 1,
                'Notices.is_deleted' => 0,
                'Notices.created > ' => $created,
                'Notices.notice_type_id IN' => $noticeTypeUserOther
            ])->count();
        $counters['subscriptions'] = $this->find()
        ->where([
            'Notices.user_id !=' => $userId,
            'Notices.created_by !=' => $userId,
            'OR' => [
                [
                    'NoticesSubscriptions.user_id' => $userId,
                    'Notices.user_id' => -1,
                    'NoticesStatuses.status' => 1,
                    'NoticesStatuses.is_deleted' => 0
                ],
                [
                    'Notices.user_id' => 0,
                    'NoticesStatuses.status' => 1,
                    'NoticesStatuses.is_deleted' => 0
                ],
                [
                    'NoticesSubscriptions.user_id' => $userId,
                    'NoticesStatuses.id IS NULL'
                ]
            ]
        ])
        ->contain([
            'Users' => ['fields' => ['id', 'name', 'image']],
            'NoticesStatuses' => [
                'conditions' => [
                    'NoticesStatuses.user_id' => $userId,
                ]
            ],
            'NoticesSubscriptions' => [
                'conditions' => [
                    'NoticesSubscriptions.user_id' => $userId,
                ]
            ]
        ])->count();
        return $counters;
    }

    public function getUserNoticesCounterNewContent($userId, $userGlobalPermissions, $created)
    {
        $result = 0;
        if ($userGlobalPermissions[UsersController::ROLE_ACCEPT]) {
            $result = $this->find()
                ->where([
                    [
                        'Notices.user_id' => 0,
                        'Notices.is_deleted' => 0,
                        'Notices.status' => 1,
                        'Notices.created_by !=' => $userId,
                        'Notices.created > ' => $created,
                        'Notices.notice_type_id IN' => [
                            NoticesManager::NOTICE_TYPE_NEW_CONTENT
                        ],
                        'OR' => [
                            [
                                'NoticesStatuses.id IS NULL'
                            ],
                            [
                                'NoticesStatuses.user_id' => $userId,
                                'NoticesStatuses.status' => 1,
                                'NoticesStatuses.is_deleted' => 0
                            ]
                        ],
                        'AND' => [
                            'OR' => [
                                [
                                    'published IS NOT NULL',
                                    time() . ' - published < ' => DAY
                                ],
                                [
                                    'published IS NULL'
                                ]
                            ]
                        ]
                    ]
                ])
                ->contain([
                    'ArticlesNewContents',
                    'NoticesStatuses' => [
                        'conditions' => [
                            'NoticesStatuses.user_id' => $userId,
                        ]
                    ]
                ])
                ->count();
        }
        return $result;
    }

    public function getNoticesForAll($userId, $created, $userGlobalPermissions, $roleId)
    {
        $noticeTypeNotForThisUser = [];
        $noticeTypeNotForKindUser = [];
        $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_NEW_CONTENT;
        if ((!$userGlobalPermissions[UsersController::ROLE_SETTLE_I] && !$userGlobalPermissions[UsersController::ROLE_SETTLE_IV]) || ((int)$roleId == 4)) {
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_ACCEPT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_REJECT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_USER;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_COMMENT;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_RESOLVE_I;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_RESOLVE_IV;
            $noticeTypeNotForThisUser[] = NoticesManager::NOTICE_TYPE_REPORT_CONTENT;
        }

        return $this->find()
            ->where([
                'OR' => [
                    [
                        'Notices.user_id' => $userId,
                        'Notices.is_deleted' => 0,
                        'Notices.created > ' => $created
                    ],
                    [
                        'Notices.user_id' => 0,
                        'Notices.is_deleted' => 0,
                        'Notices.created_by !=' => $userId,
                        'Notices.created > ' => $created,
                        'Notices.notice_type_id NOT IN' => [
                            NoticesManager::NOTICE_TYPE_REPORT_ACCEPT,
                            NoticesManager::NOTICE_TYPE_REPORT_REJECT,
                            NoticesManager::NOTICE_TYPE_REPORT_USER,
                            NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                            NoticesManager::NOTICE_TYPE_REPORT_CONTENT,
                            NoticesManager::NOTICE_TYPE_RESOLVE_I,
                            NoticesManager::NOTICE_TYPE_RESOLVE_IV,
                            NoticesManager::NOTICE_TYPE_REPORT_REPLY,
                            NoticesManager::NOTICE_TYPE_NEW_CONTENT
                        ],
                        'OR' => [
                            [
                                'NoticesStatuses.id IS NULL'
                            ],
                            [
                                'NoticesStatuses.is_deleted' => 0
                            ]
                        ]
                    ],
                    [
                        'NoticesSubscriptions.user_id' => $userId,
                        'OR' => [
                            [
                                'NoticesStatuses.id IS NULL'
                            ],
                            [
                                'NoticesStatuses.is_deleted' => 0
                            ]
                        ]
                    ]
                ]
            ])
            ->contain([
                'Users' => [
                    'fields' => ['id', 'name', 'image']
                ],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId,
                    ]
                ],
                'NoticesSubscriptions' => [
                    'conditions' => [
                        'NoticesSubscriptions.user_id' => $userId,
                    ]
                ]
            ]);
    }

    public function getNoticesForMyContent($userId, $created)
    {
        $noticeUserContentType = [];
        $noticeUserContentType[] = NoticesManager::TYPE_CONTENT;
        $noticeUserContentType[] = NoticesManager::TYPE_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_SUB_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_REJECT_COMMENT;
        $noticeUserContentType[] = NoticesManager::TYPE_REPLY;
        return $this->find()
            ->where([
                'Notices.user_id' => $userId,
                'Notices.is_deleted' => 0,
                'Notices.created > ' => $created,
                'Notices.content_type_id IN' => $noticeUserContentType
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
            ]);
    }

    public function getNoticesForNewContent($userId, $created)
    {
        return $this->find()
            ->where([
                'OR' => [
                    [
                        'Notices.user_id' => $userId,
                        'Notices.is_deleted' => 0,
                        'Notices.created > ' => $created,
                        'Notices.notice_type_id IN' => [
                            NoticesManager::NOTICE_TYPE_REVIEW_REPLY,
                            NoticesManager::NOTICE_TYPE_REJECT_REPLY
                        ]
                    ]
                ]
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId,
                    ]
                ]
            ]);
    }

    public function getNoticesForLatestNewContent($userId, $created)
    {
        return $this->find()
            ->where([
                [
                    'Notices.user_id' => 0,
                    'Notices.is_deleted' => 0,
                    'Notices.created_by !=' => $userId,
                    'Notices.created > ' => $created,
                    'Notices.notice_type_id IN' => [
                        NoticesManager::NOTICE_TYPE_NEW_CONTENT
                    ],
                    'OR' => [
                        [
                            'NoticesStatuses.id IS NULL'
                        ],
                        [
                            'NoticesStatuses.is_deleted' => 0
                        ],

                    ],
                    'AND' => [
                        'OR' => [
                            [
                                'published IS NOT NULL',
                                time() . ' - published < ' => DAY
                            ],
                            [
                                'published IS NULL'
                            ]
                        ]
                    ]
                ]
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'ArticlesNewContents',
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId,
                    ]
                ]
            ]);
    }

    public function getNoticesForVerifiedNewContent($userId, $created)
    {
        return $this->find()
            ->where([
                [
                    'Notices.user_id' => 0,
                    'Notices.is_deleted' => 0,
                    'Notices.created_by !=' => $userId,
                    'Notices.created > ' => $created,
                    'Notices.notice_type_id IN' => [
                        NoticesManager::NOTICE_TYPE_NEW_CONTENT
                    ],
                    'published IS NOT NULL',
                    time() . ' - published > ' => DAY
                ]
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'ArticlesNewContents'
            ]);
    }

    public function getNoticesForReports($userId, $created)
    {
        return $this->find()
            ->where([
                'Notices.user_id' => $userId,
                'Notices.is_deleted' => 0,
                'Notices.created_by !=' => $userId,
                'Notices.created > ' => $created,
                'Notices.notice_type_id IN' => [
                    NoticesManager::NOTICE_TYPE_REPORT_ACCEPT,
                    NoticesManager::NOTICE_TYPE_REPORT_REJECT,
                    NoticesManager::NOTICE_TYPE_REPORT_USER,
                    NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                    NoticesManager::NOTICE_TYPE_REPORT_CONTENT,
                    NoticesManager::NOTICE_TYPE_RESOLVE_I,
                    NoticesManager::NOTICE_TYPE_RESOLVE_IV,
                    NoticesManager::NOTICE_TYPE_REPORT_REPLY
                ],

            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId,
                    ]
                ]
            ]);
    }

    public function getNoticesForOthers($userId, $created)
    {
        $noticeTypeUserOther = [];
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_ADMIN_CONTACT;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_BLOCKED_USER;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS;
        $noticeTypeUserOther[] = NoticesManager::NOTICE_TYPE_OTHER_COMMENT;

        return $this->find()
            ->where([
                'Notices.user_id' => $userId,
                'Notices.is_deleted' => 0,
                'Notices.created > ' => $created,
                'Notices.notice_type_id IN' => $noticeTypeUserOther
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name']],
                'Creators' => ['fields' => ['id', 'name']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
            ]);
    }

    public function getNoticeSingleSelect($noticeId, $userId)
    {
        return $this->find()
            ->where([
                'Notices.id' => $noticeId,
                'OR' => [
                    ['Notices.user_id' => 0],
                    ['Notices.user_id' => -1],
                    ['Notices.user_id' => $userId],
                    ['NoticesSubscriptions.user_id' => $userId]
                ]
            ])
            ->contain([
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId
                    ]
                ],
                'NoticesSubscriptions' => [
                    'conditions' => [
                        'NoticesSubscriptions.user_id' => $userId,
                    ]
                ]
            ])
            ->first();
    }

    public function getNoticesMultiSelect($ids, $userId)
    {
        return $this->find()
            ->where([
                'Notices.id IN' => $ids,
                'OR' => [
                    ['Notices.user_id' => 0],
                    ['Notices.user_id' => -1],
                    ['Notices.user_id' => $userId],
                    ['NoticesSubscriptions.user_id' => $userId]
                ]
            ])
            ->contain([
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId
                    ]
                ],
                'NoticesSubscriptions' => [
                    'conditions' => [
                        'NoticesSubscriptions.user_id' => $userId,
                    ]
                ]
            ])
            ->all();
    }

    public function getNoticeForView($userId, $noticeId)
    {
        return $this->find()
            ->where([
                'OR' => [
                    [
                        'Notices.id' => $noticeId,
                        'Notices.user_id' => $userId,
                        'Notices.is_deleted' => 0
                    ],
                    [
                        'Notices.id' => $noticeId,
                        'Notices.user_id' => 0,
                        'Notices.created_by !=' => $userId
                    ]
                ]
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
                'NoticesStatuses' => [
                    'conditions' => [
                        'OR' => [
                            ['NoticesStatuses.id IS NULL'],
                            [
                                [
                                    'NoticesStatuses.is_deleted' => 0,
                                    'NoticesStatuses.user_id' => $userId
                                ]
                            ]
                        ]
                    ]
                ]
            ])->first();
    }

    public function getNoticeForCheck($noticeId)
    {
        return $this->find()
            ->select([
                'id',
                'content_id'
            ])
            ->where([
                'Notices.id' => $noticeId,
                'Notices.content_type_id' => NoticesManager::TYPE_CONTENT,
                'Notices.user_id' => 0
            ])
            ->first();
    }

    public function getNoticesForSubscriptions($userId)
    {
        return $this->find()
            ->where([
                'Notices.user_id !=' => $userId,
                'Notices.created_by !=' => $userId,
                'OR' => [
                    [
                        'NoticesSubscriptions.user_id' => $userId,
                        'Notices.user_id' => -1,
                        'NoticesStatuses.is_deleted' => 0
                    ],
                    [
                        'Notices.user_id' => 0,
                        'NoticesStatuses.is_deleted' => 0
                    ],
                    [
                        'NoticesSubscriptions.user_id' => $userId,
                        'NoticesStatuses.id IS NULL'
                    ]
                ]
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
                'NoticesStatuses' => [
                    'conditions' => [
                        'NoticesStatuses.user_id' => $userId,
                    ]
                ],
                'NoticesSubscriptions' => [
                    'conditions' => [
                        'NoticesSubscriptions.user_id' => $userId,
                    ]
                ]
            ]);
    }

    public function getNoticeById($noticeId)
    {
        return $this->find()
            ->where([
                'Notices.id' => $noticeId
            ])
            ->first();
    }

    public function getNoticeByArticleId($articleId)
    {
        return $this->find()
            ->where([
                'Notices.content_id' => $articleId,
                'OR' => [
                    ['Notices.notice_type_id' => NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT],
                    ['Notices.notice_type_id' => NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_REJECT],
                ]
            ])
            ->first();
    }
}
