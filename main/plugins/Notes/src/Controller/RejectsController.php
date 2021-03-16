<?php


namespace Notes\Controller;

use Articles\Controller\ArticlesController;
use Articles\Model\Table\ArticlesTable;
use Cake\Event\Event;
use Croogo\Users\Controller\UsersController;
use Notes\Model\Table\AcceptsTable;
use Notes\Model\Table\RejectsCommentsTable;
use Notes\Model\Table\RejectsTable;
use Notices\Event\NoticesManager;
use Notices\Model\Table\NoticesStatusesTable;
use Notices\Model\Table\NoticesTable;

/**
 * Class RejectsController
 *
 * @package Notes\Controller
 * @property AcceptsTable Accepts
 * @property RejectsTable Rejects
 * @property NoticesTable Notices
 * @property NoticesStatusesTable NoticesStatuses
 * @property RejectsCommentsTable RejectsComments
 * @property ArticlesTable Articles
 */
class RejectsController extends AppController
{
    private static $disableActions = ['comment', 'comments', 'editComment'];

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
        $this->loadModel('Notes.Accepts');
        $this->loadModel('Notes.RejectsComments');
        $this->loadModel('Notices.Notices');
        $this->loadModel('Notices.NoticesStatuses');
        $this->loadComponent('Paginator');
    }

    public function index($contentId)
    {
        $rejects = $this->Paginator->paginate(
            $this->Rejects->find('all')
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
            'rejects' => $rejects
        ]);
    }

    public function add($articleId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $article = $this->Articles->getArticleForNoteAdd($articleId);
            $checkIfAlreadyAdded = $this->Rejects->checkIfAlreadyAdded($userId, $articleId);
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
                    'message' => __('Reject already added.')
                ];
            } elseif (!is_null($article->published)
                && time() - $article->published > ArticlesController::MAX_VERIFICATION_TIME) {
                $response = [
                    'success' => 0,
                    'message' => __('Cannot add reject after verification time.')
                ];
            } elseif (empty($this->request->getData('description'))) {
                $response = [
                    'success' => 0,
                    'message' => __('Reject cannot be empty.')
                ];
            } else {
                $reject = $this->Rejects->newEntity(['article_id' => $articleId]);
                $reject->set('user_id', $userId);
                $reject->set('archived', 0);
                $reject = $this->Rejects->patchEntity($reject, $this->request->getData());
                if (empty($this->request->getData('description'))) {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add reject.')
                    ];
                } elseif ($result = $this->Rejects->save($reject)) {
                    $accept = $this->Accepts->find()
                        ->where([
                            'user_id' => $userId,
                            'article_id' => $article->id,
                            'archived' => 0
                        ])
                        ->first();
                    if (isset($accept->id) && !empty($accept->id)) {
                        $this->Accepts->delete($accept);
                    }
                    if (is_null($article->published)) {
                        $this->Articles->save($this->Articles->patchEntity($article, ['published' => time()]));
                    }
                    $user = $this->Users->getUserAttributes($article->user_id);
                    $attributes = json_decode($user->attributes, true);
                    if (!empty($attributes) && is_array($attributes)) {
                        $eventData = [
                            'user_id' => $article->user_id,
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REJECT,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'title' => $article->title,
                                'message' => $reject->description,
                                'counter_rejects' => $article->counter_rejects
                            ]),
                            'content_id' => $reject->article_id,
                            'content_type_id' => NoticesManager::TYPE_REJECT
                        ];
                        $eventManager = $this->getEventManager()->on(new NoticesManager());
                        if (isset($attributes['rejects']['inbox']) && (int)$attributes['rejects']['inbox'] === 1) {
                            $eventInbox = new Event('Notice.type.self', $this, $eventData);
                            $eventManager->dispatch($eventInbox);
                        }
                        if (isset($attributes['rejects']['mail']) && (int)$attributes['rejects']['mail'] === 1) {
                            $eventEmail = new Event('Notice.type.email', $this, $eventData);
                            $eventManager->dispatch($eventEmail);
                        }
                    }
                    $resultItem = $this->Rejects->getRejectItem($result->id);
                    $articleRejects = $this->Articles->getArticleCounter($articleId, 'counter_rejects');
                    $response = [
                        'success' => 1,
                        'message' => __('Reject has been saved.'),
                        'item' => $resultItem,
                        'comments' => $articleRejects['counter_rejects']
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

    public function comment($rejectId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $reject = $this->Rejects->getRejectForComment($rejectId);
            $response = [
                'success' => 0,
                'message' => __('Unable to add comment.')
            ];
            if (!isset($reject['id']) || empty($reject['id'])) {
                $response['message'] = __('Invalid comment.');
            } elseif (empty($this->request->getData('description'))) {
                $response['message'] = __('Comment cannot be empty.');
            } else {
                $rejectComment = $this->RejectsComments->newEntity([
                    'user_id' => $userId,
                    'article_id' => $reject['article_id'],
                    'reject_id' => $rejectId
                ]);
                $rejectComment = $this->RejectsComments->patchEntity($rejectComment, $this->request->getData());
                if ($result = $this->RejectsComments->save($rejectComment)) {
                    $user = $this->Users->getUserAttributes($reject->user_id);
                    $attributes = json_decode($user->attributes, true);
                    if (!empty($attributes) && is_array($attributes)) {
                        $eventData = [
                            'user_id' => $reject['user_id'],
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REJECT_REPLY,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'content' => $result->id,
                                    'reason' => $result->description,
                                    'content_id' => $reject['article_id']
                                ]
                            ]),
                            'content_id' => $result->id,
                            'content_type_id' => NoticesManager::TYPE_COMMENT
                        ];
                        $eventManager = $this->getEventManager()->on(new NoticesManager());
                        if (isset($attributes['rejects_comments']['inbox'])
                            && (int)$attributes['rejects_comments']['inbox'] === 1) {
                            $eventInbox = new Event('Notice.type.new', $this, $eventData);
                            $eventManager->dispatch($eventInbox);
                        }
                        if (isset($attributes['rejects_comments']['mail'])
                            && (int)$attributes['rejects_comments']['mail'] === 1) {
                            $eventEmail = new Event('Notice.type.email', $this, $eventData);
                            $eventManager->dispatch($eventEmail);
                        }
                    }
                    $resultItem = $this->RejectsComments->getParentForComment($result->id);
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
            $parent = $this->RejectsComments->getParent($parentId);
            if (!$parent || !isset($parent['id'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid element.')
                ];
            } else {
                $rejectComment = $this->RejectsComments->newEntity([
                    'parent_id' => $parent['id'],
                    'user_id' => $userId,
                    'reject_id' => $parent['reject_id'],
                    'article_id' => $parent['article_id']
                ]);
                $rejectComment = $this->RejectsComments->patchEntity($rejectComment, $this->request->getData());
                if (empty($this->request->getData('description'))) {
                    $response = [
                        'success' => 0,
                        'message' => __('Comment cannot be empty.')
                    ];
                } elseif ($result = $this->RejectsComments->save($rejectComment)) {
                    $resultItem = $this->RejectsComments->find()
                        ->where(['RejectsComments.id' => $result->id])
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

    public function editContent($commentId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $comment = $this->RejectsComments->getRejectCommentForEdit($commentId);
            if ((empty($this->userGlobalPermissions) || !isset($this->userGlobalPermissions[UsersController::ROLE_EDITOR])
                    || $this->userGlobalPermissions[UsersController::ROLE_EDITOR] === false)
                && (int)$comment->user_id !== (int)$userId) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
                $this->Flash->error($response['message']);
            } else {
                $response = [
                    'success' => 1,
                    'content' => $comment->description
                ];
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function editComment($commentId)
    {
        if ($this->request->is('ajax')) {
            $this->request->getSession()->delete('Flash');
            $userId = $this->request->getSession()->read('Auth.User.id');
            $comment = $this->RejectsComments->getRejectCommentForEdit($commentId);
            if ((empty($this->userGlobalPermissions) || !isset($this->userGlobalPermissions[UsersController::ROLE_EDITOR])
                    || $this->userGlobalPermissions[UsersController::ROLE_EDITOR] === false)
                && (int)$comment->user_id !== (int)$userId) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
                $this->Flash->error($response['message']);
            } else {
                $comment = $this->RejectsComments->patchEntity($comment, [
                    'description' => $this->request->getData('description'),
                    'is_edited' => 1,
                    'is_edited_by' => $userId
                ]);
                if ($result = $this->RejectsComments->save($comment)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been edited.')
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to save comment.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function remove($rejectId)
    {
        if ($this->request->is('ajax')) {
            $reject = $this->Rejects->getRejectForRemove($rejectId);
            $this->Rejects->save($this->Rejects->patchEntity($reject, ['is_deleted' => 1]));
            $response = [
                'success' => 1,
                'message' => __('Reject has been removed.')
            ];
            $this->Flash->success($response['message']);
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function removeComment($commentId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $comment = $this->RejectsComments->getParentForRemove($commentId);
            $this->RejectsComments->save($this->RejectsComments->patchEntity($comment, [
                'is_deleted' => 1,
                'is_deleted_by' => $userId
            ]));
            $response = [
                'success' => 1,
                'message' => __('Comment has been removed.')
            ];
            $this->Flash->success($response['message']);
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function removeComments($commentId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $comment = $this->RejectsComments->getChildForRemove($commentId);
            $this->RejectsComments->save($this->RejectsComments->patchEntity($comment, [
                'is_deleted' => 1,
                'is_deleted_by' => $userId
            ]));
            $response = [
                'success' => 1,
                'message' => __('Comment has been removed.')
            ];
            $this->Flash->success($response['message']);
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }
}
