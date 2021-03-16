<?php

namespace Notes\Controller;

use Articles\Controller\ArticlesController;
use Articles\Model\Table\ArticlesTable;
use Notes\Model\Table\AcceptsCommentsTable;
use Notes\Model\Table\AcceptsTable;
use Cake\Event\Event;
use Notes\Model\Table\RejectsTable;
use Notices\Event\NoticesManager;

/**
 * Class AcceptsController
 *
 * @package Notes\Controller
 * @property AcceptsTable Accepts
 * @property RejectsTable Rejects
 * @property AcceptsCommentsTable AcceptsComments
 * @property ArticlesTable Articles
 */
class AcceptsController extends AppController
{
    private static $disableActions = ['comment', 'comments'];

    public function beforeFilter(Event $event)
    {
        parent::beforeFilter($event);
        $this->Security->config('unlockedActions', static::$disableActions);
        if (in_array($this->request->action, static::$disableActions)) {
            $this->getEventManager()->off($this->Csrf);
        }
    }

    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Articles.Articles');
        $this->loadModel('Notes.Rejects');
        $this->loadModel('Notes.AcceptsComments');
        $this->loadComponent('Paginator');
    }

    public function index($contentId)
    {
        $accepts = $this->Paginator->paginate(
            $this->Accepts->find('all')
                ->where(['article_id' => $contentId])
                ->contain([
                    'Users' => [
                        'fields' => ['id', 'name']
                    ]
                ]),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'accepts' => $accepts
        ]);
    }

    public function add($articleId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $article = $this->Articles->getArticleForNoteAdd($articleId);
            $checkIfAlreadyAdded = $this->Accepts->checkIfAlreadyAdded($userId, $articleId);
            if (!isset($article->id) || empty($article->id)) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid element.')
                ];
            } elseif ((int)$userId === (int)$article->user_id) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid action.')
                ];
            } elseif ($checkIfAlreadyAdded) {
                $response = [
                    'success' => 0,
                    'message' => __('Accept already added.')
                ];
            } elseif (!is_null($article->published)
                && time() - $article->published > ArticlesController::MAX_VERIFICATION_TIME) {
                $response = [
                    'success' => 0,
                    'message' => __('Cannot add accept after verification time.')
                ];
            } else {
                $accept = $this->Accepts->newEntity(['article_id' => $articleId]);
                $accept->set('user_id', $userId);
                $accept = $this->Accepts->patchEntity($accept, $this->request->getData());
                if ($result = $this->Accepts->save($accept)) {
                    $reject = $this->Rejects->find()
                        ->where([
                            'user_id' => $userId,
                            'article_id' => $article->id,
                            'archived' => 0
                        ])
                        ->first();
                    if (isset($reject->id) && !empty($reject->id)) {
                        $this->Rejects->delete($reject);
                    }
                    if (is_null($article->published)) {
                        $this->Articles->save($this->Articles->patchEntity($article, ['published' => time()]));
                    }
                    $user = $this->Users->getUserAttributes($article->user_id);
                    $attributes = json_decode($user->attributes, true);
                    if (!empty($attributes) && is_array($attributes)) {
                        $eventData = [
                            'user_id' => $article->user_id,
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_ACCEPT,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'title' => $article->title,
                                'message' => $accept->description,
                                'counter_accepts' => $article->counter_accepts
                            ]),
                            'content_id' => $accept->article_id,
                            'content_type_id' => NoticesManager::TYPE_CONTENT
                        ];
                        $eventManager = $this->getEventManager()->on(new NoticesManager());
                        if (isset($attributes['accepts']['inbox']) && (int)$attributes['accepts']['inbox'] === 1) {
                            $eventInbox = new Event('Notice.type.self', $this, $eventData);
                            $eventManager->dispatch($eventInbox);
                        }
                        if (isset($attributes['accepts']['mail']) && (int)$attributes['accepts']['mail'] === 1) {
                            if ((int)$attributes['accepts']['frequency'] === 0) {
                                $eventData['time_to_send'] = 0;
                            } elseif ((int)$attributes['accepts']['frequency'] === 1) {
                                $eventData['time_to_send'] = strtotime('next Sunday');
                            }
                            $eventEmail = new Event('Notice.type.email', $this, $eventData);
                            $eventManager->dispatch($eventEmail);
                        }
                    }
                    $resultItem = $this->Accepts->getAcceptItem($result->id);
                    $articleAccepts = $this->Articles->getArticleCounter($articleId, 'counter_accepts');
                    $response = [
                        'success' => 1,
                        'message' => __('Accept has been saved.'),
                        'item' => $resultItem,
                        'comments' => $articleAccepts['counter_accepts']
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add accept.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set(compact('response'));
            $this->viewBuilder()->setLayout(false);
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function comment($acceptId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $accept = $this->Accepts->find()
                ->select(['id', 'article_id'])
                ->where(['id' => $acceptId])
                ->first();
            $response = [
                'success' => 0,
                'message' => __('Unable to add comment.')
            ];
            if (!isset($accept['id']) || empty($accept['id'])) {
                $response['message'] = __('Invalid comment.');
            } elseif (empty($this->request->getData('description'))) {
                $response['message'] = __('Comment cannot be empty.');
            } else {
                $acceptComment = $this->AcceptsComments->newEntity([
                    'user_id' => $userId,
                    'accept_id' => $acceptId
                ]);
                $acceptComment = $this->AcceptsComments->patchEntity($acceptComment, $this->request->getData());
                if ($result = $this->AcceptsComments->save($acceptComment)) {
                    $resultItem = $this->AcceptsComments->find()
                        ->where(['AcceptsComments.id' => $result->id, 'AcceptsComments.parent_id IS' => null])
                        ->contain(['Users'])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been saved.'),
                        'item' => $resultItem,
                        'comments' => 0
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add comment.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set(compact('response'));
            $this->viewBuilder()->setLayout(false);
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function comments($parentId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $parent = $this->AcceptsComments->getParent($parentId);
            if (!$parent || !isset($parent['id'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid element.')
                ];
            } else {
                $acceptComment = $this->AcceptsComments->newEntity([
                    'parent_id' => $parent['id'],
                    'user_id' => $userId,
                    'accept_id' => $parent['accept_id']
                ]);
                $acceptComment = $this->AcceptsComments->patchEntity($acceptComment, $this->request->getData());
                if (empty($this->request->getData('description'))) {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add comment.')
                    ];
                } elseif ($result = $this->AcceptsComments->save($acceptComment)) {
                    $resultItem = $this->AcceptsComments->find()
                        ->where(['AcceptsComments.id' => $result->id])
                        ->contain(['Users'])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been saved.'),
                        'item' => $resultItem,
                        'comments' => 0
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add comment.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set(compact('response'));
            $this->viewBuilder()->setLayout(false);
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }
}
