<?php

namespace Articles\Controller;

use Articles\Model\Table\ArticlesResolvesTable;
use Articles\Model\Table\ArticlesTable;
use Articles\Model\Table\ArticlesAdminEditHistoryTable;
use Cake\I18n\I18n;
use Subscriptions\Model\Table\ArticlesSubscriptionsTable;
use Articles\Model\Table\TypesArticlesTable;
use Cake\Event\Event;
use Categories\Model\Table\CategoriesTable;
use Subscriptions\Model\Table\CategoriesSubscriptionsTable;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Model\Table\UsersTable;
use Croogo\Users\Model\Table\RolesUsersTable;
use Notes\Model\Table\AcceptsTable;
use Notes\Model\Table\NotesTable;
use Notes\Model\Table\RejectsTable;
use Notices\Event\NoticesManager;
use Reports\Model\Table\ReportsTable;

/**
 * Class ArticlesController
 *
 * @property UserComponent User
 * @property UsersTable Users
 * @package Articles\Controller
 * @property ArticlesTable Articles
 * @property ArticlesSubscriptionsTable ArticlesSubscriptions
 * @property ArticlesAdminEditHistoryTable ArticlesAdminEditHistory
 * @property ArticlesResolvesTable ArticlesResolves
 * @property TypesArticlesTable TypesArticles
 * @property CategoriesTable Categories
 * @property CategoriesSubscriptionsTable CategoriesSubscriptions
 * @property NotesTable Notes
 * @property AcceptsTable Accepts
 * @property RejectsTable Rejects
 * @property ReportsTable Reports
 * @property RolesUsersTable RolesUsers
 */
class ArticlesController extends AppController
{
    public $helpers = [
        'Articles.Articles',
        'Reports.Reports'
    ];

    const DISABLE_REVIEWS = false;

    const DISABLE_DOWN_VOTES = false;

    const TYPE_ARTICLE = 1;
    const TYPE_QUESTION = 2;
    const TYPE_NEWS = 3;

    /**
     * Maximum time to accept/reject content in minutes
     */
    const MAX_VERIFICATION_TIME = 86400;
//    const MAX_VERIFICATION_TIME = 3600;

    /**
     * Field is_visible statuses
     */
    const IS_VISIBLE_NEUTRAL = 0;
    const IS_VISIBLE_ACCEPT = 1;
    const IS_VISIBLE_REJECT = 2;

    const IS_VISIBLE_BY_ROLE_NEGATIVE = 0;
    const IS_VISIBLE_BY_ROLE_POSITIVE = 1;

    static $typesMap = [
        'articles' => self::TYPE_ARTICLE,
        'questions' => self::TYPE_QUESTION,
        'news' => self::TYPE_NEWS
    ];

    private function getSearchFieldOptions()
    {
        return [
            'type' => [
                'all' => __('All'),
                'articles' => __('News'),
                'questions' => __('Questions')
            ]
        ];
    }

    public $components = ['User'];

    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Articles.TypesArticles');
        $this->loadModel('Articles.ArticlesAdminEditHistory');
        $this->loadModel('Articles.ArticlesResolves');
        $this->loadModel('Categories.Categories');
        $this->loadModel('Notes.Notes');
        $this->loadModel('Notes.Accepts');
        $this->loadModel('Notes.Rejects');
        $this->loadModel('Reports.Reports');
        $this->loadModel('Subscriptions.ArticlesSubscriptions');
        $this->loadModel('Subscriptions.CategoriesSubscriptions');
        $this->loadModel('Croogo/Users.RolesUsers');
        $this->loadComponent('Paginator');
        $this->loadComponent('Users.User');
    }

    public function index()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $queryParams = $this->request->getQueryParams();
        $conditions = ['user_id' => $userId];
        if (isset($queryParams['type']) && isset(self::$typesMap[$queryParams['type']])) {
            $conditions['type_id'] = self::$typesMap[$queryParams['type']];
        }
        if (isset($queryParams['q']) && !empty($queryParams['q'])) {
            $conditions['title LIKE '] = '%' . $queryParams['q'] . '%';
        }
        $items = $this->Paginator->paginate(
            $this->Articles->getArticleForIndex($conditions),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'items' => $items,
            'fieldsOptions' => $this->getSearchFieldOptions()
        ]);
    }

    public function add()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $isPublisher = $this->checkPermission(UsersController::ROLE_PUBLISHER_II);

        if (!$this->checkPermission(UsersController::ROLE_PUBLISHER_I) && !$isPublisher) {
            $this->Flash->error(__('You do not have privileges to add content.'));
            return $this->redirect(['action' => 'index']);
        }

        $article = $this->Articles->newEntity();
        $types = [
            1 => __('News'),
            2 => __('Question')
        ];

        if (!$this->request->is('post')) {
            $this->set([
                'article' => $article,
                'categories' => $this->Categories->getCategoriesList(),
                'types' => $types
            ]);
            return null;
        }

        $this->addCategory();
        $data = $this->request->getData();
        if ((int)$data['type_id'] === self::TYPE_ARTICLE &&
            $uploadedImage = $this->User->upload($this->request->getData('photo'))) {
            $data['photo'] = $uploadedImage;
        }
        if ((int)$data['type_id'] === self::TYPE_ARTICLE) {
            $this->Articles->getValidator()
                ->add('preview', [
                    'notBlank' => [
                        'rule' => 'notBlank',
                        'message' => 'Description cannot be empty.',
                        'last' => true
                    ]
                ]);
        }
        $article->set([
            'user_id' => $userId,
            'lang' => I18n::getLocale(),
            'published' => null,
        ]);

        if ($isPublisher) {
            $article->set([
                'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT,
                'is_visible_by_role' => ArticlesController::IS_VISIBLE_BY_ROLE_POSITIVE
            ]);
        }
        $article = $this->Articles->patchEntity($article, $data);
        $notificationType = (!$isPublisher) ? 'Notice.type.mass' : 'Notice.type.subscription';
        if ($result = $this->Articles->save($article, ['associated' => true])) {
            $categories = array_column($result->categories, 'name', 'id');
            $event = new Event($notificationType, $this, [
                'notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_CONTENT,
                'notice_type_subscription_id' => NoticesManager::TYPE_SUBSCRIPTION_NEW_ARTICLE,
                'created_by' => $userId,
                'content_message' => json_encode([
                    'message' => [
                        'content' => $result->id,
                        'type_id' => $result->type_id,
                        'title' => $result->title,
                        'categories' => json_encode($categories),
                        'reason' => 1
                    ]
                ]),
                'content_id' => $result->id,
                'content_type_id' => NoticesManager::TYPE_CONTENT
            ]);
            $this->getEventManager()->on(new NoticesManager());
            $this->getEventManager()->dispatch($event);

            $this->Flash->success(__('The content has been saved.'));
            return $this->redirect(['action' => 'index']);
        }

        $this->Flash->error(__('Unable to add content.'));
        $this->set([
            'article' => $article,
            'categories' => $this->Categories->getCategoriesList(),
            'types' => $types
        ]);
    }

    public function edit($articleId, $editor = 0)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $article = $this->Articles->get($articleId, [
            'contain' => ['Categories', 'Types']
        ]);
        if (!isset($article->id) || empty($article->id) || $article->is_deleted === 1) {
            $this->Flash->error(__('Invalid content.'));
            return $this->redirect([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'main'
            ]);
        }

        if (((int)$userId !== (int)$article->user_id) && (!$editor)) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect(['action' => 'index']);
        }

        if ($this->request->is(['patch', 'post', 'put'])) {
            $isPublisher = $this->checkPermission(UsersController::ROLE_PUBLISHER_II);
            $this->addCategory();
            $data = $this->request->getData();
            if ((int)$data['type_id'] === self::TYPE_ARTICLE &&
                $uploadedImage = $this->User->upload($this->request->getData('photo'))) {
                $data['photo'] = $uploadedImage;
            } else {
                unset($data['photo']);
            }

            if ((int)$data['type_id'] === self::TYPE_ARTICLE) {
                $this->Articles->getValidator()
                    ->add('preview', [
                        'notBlank' => [
                            'rule' => 'notBlank',
                            'message' => 'Description cannot be empty.',
                            'last' => true
                        ]
                    ]);
            }

            if (!$editor && ((int)$userId === (int)$article->user_id)) {
                $article->set([
                    'counter_accepts' => 0,
                    'counter_rejects' => 0,
                    'published' => null
                ]);

                if ($isPublisher) {
                    $article->set([
                        'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT,
                        'is_visible_by_role' => ArticlesController::IS_VISIBLE_BY_ROLE_POSITIVE,
                    ]);
                } else {
                    $article->set([
                        'is_visible' => ArticlesController::IS_VISIBLE_NEUTRAL,
                        'is_visible_by_role' => ArticlesController::IS_VISIBLE_BY_ROLE_NEGATIVE,
                    ]);
                }
            }

            $article = $this->Articles->patchEntity($article, $data);

            if ($editor) {
                if ($result = $this->Articles->save($article, ['associated' => true])) {
                    $articlesAdminEditHistory = $this->ArticlesAdminEditHistory->newEntity();
                    $articlesAdminEditHistory->set([
                        'user_id' => (int)$userId,
                        'article_id' => $article->id
                    ]);
                    if ($this->ArticlesAdminEditHistory->save($articlesAdminEditHistory, ['associated' => true])) {
                        $this->Flash->success(__('The content has been saved.'));
                        return $this->redirect(['action' => 'index']);
                    }
                }

            } elseif ($result = $this->Articles->save($article, ['associated' => true])) {
                $this->Accepts->updateAll(['archived' => 1], ['article_id' => $result->id]);
                $this->Rejects->updateAll(['archived' => 1], ['article_id' => $result->id]);
                $this->Notices->updateAll(
                    [
                        'is_deleted' => 1
                    ],
                    [
                        'content_id' => $result->id,
                        'content_type_id' => NoticesManager::TYPE_CONTENT,
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_CONTENT
                    ]);
                if ((int)$article->is_visible_by_role === ArticlesController::IS_VISIBLE_BY_ROLE_NEGATIVE) {
                    $event = new Event('Notice.type.mass', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_CONTENT,
                        'notice_type_subscription_id' => NoticesManager::TYPE_SUBSCRIPTION_EDIT_ARTICLE,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $result->id,
                                'type_id' => $result->type_id,
                                'title' => $result->title,
                                'reason' => 2
                            ]
                        ]),
                        'content_id' => $result->id,
                        'content_type_id' => NoticesManager::TYPE_CONTENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                }
                $this->Flash->success(__('The content has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The content could not be saved. Please, try again.'));
        }
        $types = [
            1 => __('News'),
            2 => __('Question')
        ];
        $this->set([
            'article' => $article,
            'categories' => $this->Categories->getCategoriesList(),
            'types' => $types
        ]);
    }

    public function delete($id)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $article = $this->Articles->get($id);

        if (!isset($article->id) || empty($article->id)) {
            $this->Flash->error(__('The content could not be deleted. Please, try again.'));
            return $this->redirect([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'main'
            ]);
        }
        if ((int)$userId !== (int)$article->user_id || $article->is_deleted === 1) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect(['action' => 'index']);
        }

        $article->set([
            'is_deleted' => 1,
        ]);

        if ($this->Articles->save($article)) {
            $this->Flash->success(__('The content has been deleted.'));
        } else {
            $this->Flash->error(__('The content could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }

    private function addCategory()
    {
        $data = $this->request->getData();
        if (is_array($data['categories']['_ids'])) {
            foreach ($data['categories']['_ids'] as $keyCategory => $valueCategory) {
                if (!empty($valueCategory) && !is_numeric($valueCategory)) {
                    $category = $this->Categories->newEntity(['name' => $valueCategory]);
                    if ($result = $this->Categories->save($category)) {
                        $this->request->data['categories']['_ids'][$keyCategory] = $result->id;
                    }
                }
            }
        }
    }

    public function view($articleId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $userRoles = $this->RolesUsers->getUsersRoles($userId);
        $article = $this->Articles->getArticleForView($articleId, $userId);
        $articlesAdminEditHistory = $this->ArticlesAdminEditHistory->getArticlesAdminEditHistoryForArticleIndex($articleId);
        $subscribed = false;
        if (is_null($articlesAdminEditHistory)) {
            $adminEdit = [];
        } else {
            $adminEdit = [
                'user' => $this->Users->getUserNameById($articlesAdminEditHistory->user_id),
                'time' => $articlesAdminEditHistory->created
            ];
        }

        if ($this->ArticlesSubscriptions->checkIfExists($userId, $articleId) !== null) {
            $subscribed = true;
        }

        if (!isset($article->id) || empty($article->id)) {
            return $this->redirect([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'main'
            ]);
        }
        if ($article->is_deleted === 1) {
            $this->Flash->error(__('The content has been deleted by author.'));
            return $this->redirect([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'main'
            ]);
        }
        if ($userId && (int)$article->is_visible === 0 && $userId !== $article->user_id
            && !in_array(UsersController::ROLE_ACCEPT, $userRoles)) {
            $this->Flash->error(__('Invalid content.'));
            return $this->redirect([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'main'
            ]);
        }
        $order = 'Notes.counter_up_vote';
        if ($article->type_id == self::TYPE_ARTICLE) {
            $notes = $this->Paginator->paginate(
                $this->Notes->getNotesForArticleView($articleId, $userId, $order),
                ['limit' => 20]
            );
        } else {
            $notes = $this->Notes->getNotesForArticleView($articleId, $userId, $order);
        }
        $this->set([
            'article' => $article,
            'adminEdit' => $adminEdit,
            'prevArticle' => $this->Articles->getPrevArticleForView($article->id, $article->type_id),
            'nextArticle' => $this->Articles->getNextArticleForView($article->id, $article->type_id),
            'notes' => $notes,
            'noteEntity' => $this->Notes->newEntity(),
            'acceptEntity' => $this->Notes->newEntity(),
            'rejectEntity' => $this->Notes->newEntity(),
            'reviewEntity' => $this->Notes->newEntity(),
            'reportEntity' => $this->Reports->newEntity(),
            'noteCommentEntity' => $this->Notes->newEntity(),
            'checkIfAlreadyAddedAccept' => $this->Accepts->checkIfAlreadyAdded($userId, $articleId),
            'checkIfAlreadyAddedReject' => $this->Rejects->checkIfAlreadyAdded($userId, $articleId),
            'subscribed' => $subscribed
        ]);
        if ($article->type_id == self::TYPE_QUESTION) {
            $this->render('question');
        }
    }

    public function comments($articleId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $exists = $this->Articles->exists(['id' => $articleId]);
        if (!$exists) {
            $this->set([
                'success' => 0,
                'message' => __('Invalid content.')
            ]);
        } elseif ($this->request->is('ajax')) {
            $order = 'Notes.created';
            $notes = $this->Paginator->paginate(
                $this->Notes->getNotesForArticleView($articleId, $userId, $order),
                ['limit' => 5]
            );
            $this->set([
                'success' => 1,
                'notes' => $notes
            ]);
        } else {
            $this->redirect('/');
        }
    }

    public function contents($categoryId)
    {
        if (!$this->Categories->checkCategory($categoryId)) {
            return $this->redirect([
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'main'
            ]);
        }
        $subscribed = false;
        $userId = $this->request->getSession()->read('Auth.User.id');
        $queryParams = $this->request->getQueryParams();
        $conditions = [];
        if (isset($queryParams['type']) && isset(self::$typesMap[$queryParams['type']])) {
            $conditions['Articles.type_id'] = self::$typesMap[$queryParams['type']];
        }
        if (isset($queryParams['q']) && !empty($queryParams['q'])) {
            $conditions['Articles.title LIKE '] = '%' . $queryParams['q'] . '%';
        }
        if($this->CategoriesSubscriptions->checkIfExists($userId, $categoryId) !== null) {
            $subscribed = true;
        }
        $items = $this->Paginator->paginate(
            $this->Articles->getArticlesForCategoryView($categoryId, $conditions)
        );
        $this->set([
            'categoryId' => $categoryId,
            'categoryName' => $this->Categories->getCategoryName($categoryId),
            'subscribedCategory' => $subscribed,
            'items' => $items,
            'fieldsOptions' => $this->getSearchFieldOptions()
        ]);
    }

    public function search()
    {
        $queryParams = $this->request->getQueryParams();
        $conditions = [];
        if (isset($queryParams['type']) && isset(self::$typesMap[$queryParams['type']])) {
            $conditions['type_id'] = self::$typesMap[$queryParams['type']];
        }
        if (isset($queryParams['q']) && !empty($queryParams['q'])) {
            $conditions['title LIKE '] = '%' . $queryParams['q'] . '%';
        }
        $items = $this->Paginator->paginate(
            $this->Articles->getItemsForSearch($conditions),
            [
                'order' => ['updated' => 'desc'],
                'limit' => 10
            ]
        );
        $this->set([
            'items' => $items,
            'fieldsOptions' => $this->getSearchFieldOptions()
        ]);
    }

    public function newsletter()
    {
        $queryParams = $this->request->getQueryParams();
        $conditions = [];
        if (isset($queryParams['type']) && isset(self::$typesMap[$queryParams['type']])) {
            $conditions['type_id'] = self::$typesMap[$queryParams['type']];
        }
        if (isset($queryParams['q']) && !empty($queryParams['q'])) {
            $conditions['title LIKE '] = '%' . $queryParams['q'] . '%';
        }
        $items = $this->Paginator->paginate(
            $this->Articles->getItemsForSearch($conditions),
            [
                'order' => ['updated' => 'desc'],
                'limit' => 10
            ]
        );
        $this->set([
            'items' => $items,
            'fieldsOptions' => $this->getSearchFieldOptions()
        ]);
    }

    public function resolve($articleId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $article = $this->Articles->getArticleForResolve($articleId, $userId);
        if (!isset($article->id) || empty($article->id)) {
            $this->Flash->error(__('Invalid content.'));
        } elseif ((int)$article->resolve_send !== 0) {
            $this->Flash->error(__('Content is already send to resolve.'));
        } else {
            $data['resolve_send'] = 1;
            if ($this->Articles->save($this->Articles->patchEntity($article, $data))) {
                if ((int)$article->resolve_status === 0) {
                    $event = new Event('Notice.type.mass', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_RESOLVE_I,
                        'created_by' => $userId,
                        'content_message' => json_encode(['message' => 'send content to resolve']),
                        'content_id' => $articleId,
                        'content_type_id' => NoticesManager::TYPE_REPORT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                } elseif ((int)$article->resolve_status === 1) {
                    $event = new Event('Notice.type.mass', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_RESOLVE_IV,
                        'created_by' => $userId,
                        'content_message' => json_encode(['message' => 'send content to reconsideration']),
                        'content_id' => $articleId,
                        'content_type_id' => NoticesManager::TYPE_REPORT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                }
                $this->Flash->success(__('Content was send to resolve.'));
                return $this->redirect($this->referer());
            }
        }
        return $this->redirect($this->referer());
    }

    public function accept()
    {
        if ($this->request->is('post')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $articleId = $this->request->getData('item');
            $reason = $this->request->getData('accept');
            $article = $this->Articles->getArticleForAccept($articleId);
            if (!isset($article->id) || empty($article->id)) {
                $this->Flash->error(__('Invalid content.'));
                return $this->redirect($this->referer());
            } else {
                $resolveStatus = ArticlesResolvesTable::resolveLevel($article->resolve_status);
                if (!$resolveStatus) {
                    $this->Flash->error(__('Content cannot be send to resolve anymore.'));
                    return $this->redirect($this->referer());
                }
                $data = [
                    'is_visible' => self::IS_VISIBLE_ACCEPT,
                    'resolve_by' => $userId,
                    'resolve_status' => $resolveStatus,
                    'resolve_time' => time(),
                    'resolve_send' => 0
                ];
                if ($this->Articles->save($this->Articles->patchEntity($article, $data))) {
                    $articleUser = $this->Users->getUserAttributes($article->user_id);
                    $attributes = json_decode($articleUser->attributes, true);

                    $eventData = [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT,
                        'user_id' => $article['user_id'],
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => 'Your content was resolve as accepted.',
                            'title' => $article['title'],
                            'counter_accepts' => $article['counter_accepts'],
                            'reason' => $reason
                        ]),
                        'content_id' => $articleId,
                        'content_type_id' => NoticesManager::TYPE_CONTENT
                    ];

                    $eventManager = $this->getEventManager()->on(new NoticesManager());

                    if (isset($attributes['accepts']['inbox']) && (int)$attributes['accepts']['inbox'] === 1) {
                        $eventManager->dispatch(new Event('Notice.type.self', $this, $eventData));
                    }

                    if (isset($attributes['accepts']['mail']) && (int)$attributes['accepts']['mail'] === 1) {
                        if ((int)$attributes['accepts']['frequency'] === 0) {
                            $eventData['time_to_send'] = 0;
                        } elseif ((int)$attributes['accepts']['frequency'] === 1) {
                            $eventData['time_to_send'] = strtotime('next Sunday');
                        }

                        $eventManager->dispatch(new Event('Notice.type.email', $this, $eventData));
                    }

                    $this->ArticlesResolves->save($this->ArticlesResolves->newEntity([
                        'article_id' => $articleId,
                        'user_id' => $userId,
                        'status' => self::IS_VISIBLE_ACCEPT,
                        'resolve_status' => $resolveStatus
                    ]));
                    $this->Flash->success(__('You resolved content as accepted.'));
                } else {
                    $this->Flash->error(__('Error while resolving content.'));
                }
                return $this->redirect($this->referer());
            }
        }
    }

    public function reject()
    {
        if ($this->request->is('post')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $articleId = $this->request->getData('item');
            $reason = $this->request->getData('reject');
            $article = $this->Articles->getArticleForReject($articleId);
            if (!isset($article->id) || empty($article->id)) {
                $this->Flash->error(__('Invalid content.'));
                return $this->redirect($this->referer());
            } else {
                $resolveStatus = ArticlesResolvesTable::resolveLevel($article->resolve_status);
                if (!$resolveStatus) {
                    $this->Flash->error(__('Content cannot be send to resolve anymore.'));
                    return $this->redirect($this->referer());
                }
                $data = [
                    'is_visible' => self::IS_VISIBLE_REJECT,
                    'resolve_by' => $userId,
                    'resolve_status' => $resolveStatus,
                    'resolve_time' => time(),
                    'resolve_send' => 0
                ];
                if ($this->Articles->save($this->Articles->patchEntity($article, $data))) {
                    $articleUser = $this->Users->getUserAttributes($article->user_id);
                    $attributes = json_decode($articleUser->attributes, true);

                    $eventData = [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_REJECT,
                        'user_id' => $article['user_id'],
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => 'Your content was resolve as rejected.',
                            'title' => $article['title'],
                            'reason' => $reason,
                            'counter_rejects' => $article['counter_rejects']
                        ]),
                        'content_id' => $articleId,
                        'content_type_id' => NoticesManager::TYPE_CONTENT
                    ];

                    $eventManager = $this->getEventManager()->on(new NoticesManager());

                    if (isset($attributes['rejects']['inbox']) && (int)$attributes['rejects']['inbox'] === 1) {
                        $eventManager->dispatch(new Event('Notice.type.self', $this, $eventData));
                    }

                    if (isset($attributes['rejects']['mail']) && (int)$attributes['rejects']['mail'] === 1) {
                        if ((int)$attributes['rejects']['frequency'] === 0) {
                            $eventData['time_to_send'] = 0;
                        } elseif ((int)$attributes['rejects']['frequency'] === 1) {
                            $eventData['time_to_send'] = strtotime('next Sunday');
                        }

                        $eventManager->dispatch(new Event('Notice.type.email', $this, $eventData));
                    }

                    $this->ArticlesResolves->save($this->ArticlesResolves->newEntity([
                        'article_id' => $articleId,
                        'user_id' => $userId,
                        'status' => self::IS_VISIBLE_ACCEPT,
                        'resolve_status' => $resolveStatus
                    ]));
                    $this->Flash->success(__('You resolved content as rejected.'));
                } else {
                    $this->Flash->error(__('Error while resolving content.'));
                }
                return $this->redirect($this->referer());
            }
        }
    }
}
