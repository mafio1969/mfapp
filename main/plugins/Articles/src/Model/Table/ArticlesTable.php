<?php

namespace Articles\Model\Table;

use ArrayObject;
use Articles\Controller\ArticlesController;
use Cake\Datasource\EntityInterface;
use Cake\Event\Event;
use Cake\I18n\I18n;
use Cake\ORM\TableRegistry;
use Cake\Validation\Validator;
use Croogo\Core\Model\Table\CroogoTable;
use Notices\Event\NoticesManager;

class ArticlesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                    'updated' => 'always',
                ]
            ]
        ]);
        $this->belongsTo('Croogo/Users.Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('Types', [
            'className' => 'Articles.TypesArticles',
        ]);
        $this->belongsToMany('Categories.Categories', [
            'through' => 'Articles.CategoriesArticles',
            'strategy' => 'subquery',
        ]);
        $this->belongsToMany('Newsletter.Newsletters', [
            'through' => 'Newsletter.NewslettersArticles',
            'strategy' => 'subquery',
        ]);
        $this->hasMany('Notes', [
            'className' => 'Notes.Notes',
            'conditions' => [
                'Notes.parent_id IS NULL'
            ]
        ]);
        $this->hasMany('Accepts', [
            'className' => 'Notes.Accepts',
        ]);
        $this->hasMany('Rejects', [
            'className' => 'Notes.Rejects',
        ]);
        $this->hasMany('Reviews', [
            'className' => 'Notes.Reviews',
        ]);
        $this->hasMany('Votes', [
            'className' => 'Votes.Votes',
        ]);
        $this->hasMany('Reports', [
            'className' => 'Reports.Reports',
            'foreignKey' => 'content_id',
        ]);
        $this->hasMany('NoticesNewContents', [
            'className' => 'Notices.Notices',
            'foreignKey' => 'content_id',
            'conditions' => [
                'NoticesNewContents.is_deleted' => 0,
                'NoticesNewContents.content_type_id' => NoticesManager::TYPE_CONTENT,
                'NoticesNewContents.notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_CONTENT
            ]
        ]);
        $this->hasOne('Resolves', [
            'className' => 'Articles.ArticlesResolves',
        ]);
    }

    public function afterSave(Event $event, EntityInterface $entity, ArrayObject $options)
    {
        if (isset($entity->categories) && !empty($entity->categories)) {
            $categories = TableRegistry::get('Categories.Categories');
            $categoriesArticles = TableRegistry::get('Articles.CategoriesArticles');
            foreach ($entity->categories as $category) {
                $counter = $categoriesArticles->find()
                    ->where([
                        'CategoriesArticles.category_id' => $category->id,
                        'Articles.is_visible' => ArticlesController::IS_VISIBLE_ACCEPT
                    ])
                    ->innerJoinWith('Articles')
                    ->count();
                $category->set('counter_pop', $counter);
                $categories->save($category);
            }
        }
    }

    public function validationDefault(Validator $validator)
    {
        return $validator
            ->add('title', [
                'notBlank' => [
                    'rule' => 'notBlank',
                    'message' => 'Title cannot be empty.',
                    'last' => true
                ]
            ])->add('categories', 'minItems', [
                'rule' => function ($value) {
                    return (is_array($value['_ids']) && count($value['_ids']) > 0);
                },
                'message' => 'You have to choose at least 1 category.'
            ])->add('categories', 'maxItems', [
                'rule' => function ($value) {
                    return (is_array($value['_ids']) && count($value['_ids']) < 4);
                },
                'message' => 'You have to choose maximum 3 categories.'
            ]);
    }

    public function getArticleForIndex($conditions)
    {
        return $this->find()
            ->where(
                array_merge(
                    $conditions,
                    [
                        'Articles.is_deleted' => 0,
                        'Articles.lang' => I18n::getLocale(),
                    ]
                )
            )
            ->contain([
                'Users' => [
                    'fields' => [
                        'id',
                        'name'
                    ]
                ],
                'Categories'
            ]);
    }

    public function getArticleForSubscriptions($articleId)
    {
        return $this->find()
            ->where([
                'Articles.id' => $articleId,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Users',
                'Categories'
            ])->first();
    }

    public function getArticleForResolve($articleId, $userId)
    {
        return $this->find()
            ->select(['id', 'resolve_status', 'resolve_send'])
            ->where([
                'Articles.id' => $articleId,
                'Articles.user_id' => $userId,
                'Articles.is_visible' => ArticlesController::IS_VISIBLE_REJECT,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getArticleForAccept($articleId)
    {
        return $this->find()
            ->select(['id', 'user_id', 'resolve_status', 'resolve_send', 'counter_accepts', 'title'])
            ->where([
                'Articles.id' => $articleId,
                'Articles.is_visible' => ArticlesController::IS_VISIBLE_REJECT,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getArticleForReject($articleId)
    {
        return $this->find()
            ->select(['id', 'user_id', 'resolve_status', 'resolve_send'])
            ->where([
                'Articles.id' => $articleId,
                'Articles.is_visible' => ArticlesController::IS_VISIBLE_REJECT,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getMainArticles($type, $conditions, $limit)
    {
        return $this->find()
            ->contain([
                'Users' => [
                    'fields' => ['id', 'name']
                ]
            ])
            ->where([
                'type_id' => $type,
                'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
                $conditions
            ])
            ->orderDesc('Articles.updated')
            ->limit($limit);
    }

    public function getArticleForView($articleId, $userId)
    {
        return $this->find()
            ->where([
                'Articles.id' => $articleId,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(
                [
                    'Categories',
                    'Accepts' => [
                        'conditions' => [
                            'Accepts.archived' => 0
                        ],
                        'AcceptsComments' => [
                            'Users' => [
                                'fields' => [
                                    'id',
                                    'name',
                                    'image'
                                ]
                            ],
                            'SubAcceptsComments' => [
                                'Users' => [
                                    'fields' => [
                                        'image',
                                        'name'
                                    ]
                                ]
                            ]
                        ],
                        'Users' => [
                            'fields' => [
                                'id',
                                'name',
                                'image'
                            ]
                        ]
                    ],
                    'Rejects' => [
                        'conditions' => [
                            'Rejects.archived' => 0
                        ],
                        'RejectsComments' => [
                            'Users' => [
                                'fields' => [
                                    'id',
                                    'name',
                                    'image'
                                ]
                            ],
                            'SubRejectsComments' => [
                                'Users' => [
                                    'fields' => [
                                        'image',
                                        'name'
                                    ]
                                ]
                            ]
                        ],
                        'Users' => [
                            'fields' => [
                                'id',
                                'name',
                                'image'
                            ]
                        ]
                    ],
                    'Reviews' => [
                        'ReviewsComments' => [
                            'Users' => [
                                'fields' => [
                                    'id',
                                    'name',
                                    'image'
                                ]
                            ],
                            'SubReviewsComments' => [
                                'Users' => [
                                    'fields' => [
                                        'image',
                                        'name'
                                    ]
                                ]
                            ]
                        ],
                        'Users' => [
                            'fields' => [
                                'id',
                                'name',
                                'image'
                            ]
                        ]
                    ],
                    'Votes' => [
                        'conditions' => [
                            'Votes.user_id' => $userId,
                            'Votes.status' => 1
                        ],
                    ],
                    'Users',
                    'Reports' => [
                        'fields' => [
                            'Reports.user_id',
                            'Reports.id',
                            'Reports.content_id'
                        ],
                        'conditions' => [
                            'Reports.content_id' => $articleId,
                            'Reports.report_type_id' => 2,
                            'Reports.status' => 0,
                            'Reports.user_id' => $userId,
                            'OR' => [
                                ['Reports.report_content_type_id' => 1],
                                ['Reports.report_content_type_id' => 2]
                            ]
                        ]
                    ]
                ]
            )
            ->first();
    }

    public function getPrevArticleForView($articleId, $type)
    {
        return $this->find()
            ->select(['id', 'title'])
            ->where([
                'id < ' => $articleId,
                'type_id' => $type,
                'is_visible' => 1,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->orderDesc('id')
            ->first();
    }

    public function getNextArticleForView($articleId, $type)
    {
        return $this->find()
            ->select(['id', 'title'])
            ->where([
                'id > ' => $articleId,
                'type_id' => $type,
                'is_visible' => 1,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->orderAsc('id')
            ->first();
    }

    public function getMainQuestions($type, $conditions, $limit)
    {
        return $this->find('all')
            ->where([
                'type_id' => $type,
                'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
                $conditions
            ])
            ->orderDesc('counter_vote_result')
            ->limit($limit);
    }

    public function getMainNewestQuestions($type, $conditions, $limit)
    {
        return $this->find('all')
            ->contain([
                'Users' => [
                    'fields' => ['id', 'name']
                ]
            ])
            ->where([
                'type_id' => $type,
                'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
                $conditions
            ])
            ->orderDesc('Articles.updated')
            ->limit($limit);
    }

    public function getArticleVotes($articleId)
    {
        return $this->find()
            ->select(['agree' => 'counter_up_vote', 'disagree' => 'counter_down_vote'])
            ->where([
                'id' => $articleId,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getArticleCommentsCount($articleId)
    {
        $query = $this->find();
        return $query->select([
            'comments' => $query->func()->sum(
                'counter_comments + counter_sub_comments'
            )
        ])->where([
            'id' => $articleId,
            'is_deleted' => 0,
            'lang' => I18n::getLocale(),
        ])->first();
    }

    public function getItemsForSearch($conditions)
    {
        return $this->find()->where([
            'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT,
            'is_deleted' => 0,
            'lang' => I18n::getLocale(),
            $conditions
        ])->select([
            'id',
            'user_id',
            'title',
            'updated',
            'is_newsletter',
            'type_id',
            'photo',
            'counter_vote_result',
            'counter_comments',
            'counter_accepts',
            'counter_rejects',
            'is_visible',
            'counter_up_vote',
            'created'
        ])->contain([
            'Users' => [
                'fields' => [
                    'id',
                    'name'
                ]
            ],
            'Categories'
        ]);
    }

    public function getCurrentNewsletterItems()
    {
        return $this->find()
            ->where([
                'is_visible' => 1,
                'is_newsletter' => 1,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->contain([
                'Users' => [
                    'fields' => [
                        'id',
                        'name',
                        'image'
                    ]
                ],
                'Categories'
            ]);
    }

    public function getCurrentNewsletterItemsIds()
    {
        return $this->find('list',
            [
                'keyField' => 'id',
                'valueField' => 'id'
            ])
            ->select(['Articles.id'])
            ->where([
                'is_visible' => 1,
                'is_newsletter' => 1,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->toList();
    }

    public function getArticleCounter($articleId, $counter)
    {
        return $this->find()
            ->select(['id', $counter])
            ->where([
                'id' => $articleId,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getArticleForNoteAdd($articleId)
    {
        return $this->find()
            ->select([
                'id',
                'title',
                'user_id',
                'published'
            ])
            ->where([
                'id' => $articleId,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getArticlesForCategoryView($categoryId, $conditions)
    {
        return $this->find()
            ->where([
                'Articles.is_visible' => ArticlesController::IS_VISIBLE_ACCEPT,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
                'Categories.id' => $categoryId,
                $conditions
            ])
            ->contain([
                'Categories',
                'Users' => [
                    'fields' => [
                        'id',
                        'name',
                        'image'
                    ]
                ]
            ])
            ->innerJoinWith('Categories');
    }

    public function getForReportContent($articleId)
    {
        return $this->find()
            ->select([
                'id',
                'type_id',
                'user_id',
                'title'
            ])
            ->where([
                'Articles.id' => $articleId,
                'Articles.is_deleted' => 0,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getArticleForRemove($articleId)
    {
        return $this->find()
            ->select(['id', 'is_deleted'])
            ->where([
                'id' => $articleId,
                'lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getArticlesForAccepts($userId, $created)
    {
        return $this->find()
            ->where([
                'user_id' => $userId,
                'created > ' => $created,
                'is_deleted' => 0,
                'lang' => I18n::getLocale(),
            ]);
    }
}
