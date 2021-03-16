<?php

namespace Notes\Controller;

use Articles\Model\Table\ArticlesTable;
use Cake\Event\Event;
use Notices\Event\NoticesManager;
use Articles\Controller\ArticlesController;
use Croogo\Users\Controller\UsersController;
use Notes\Model\Table\NotesCommentsTable;
use Notes\Model\Table\NotesTable;
use Subscriptions\Model\Table\ArticlesSubscriptionsTable;
use Subscriptions\Model\Table\NotesSubscriptionsTable;

/**
 * Class NotesController
 *
 * @package Notes\Controller
 * @property NotesTable Notes
 * @property ArticlesTable Articles
 * @property ArticlesSubscriptionsTable ArticlesSubscriptions
 * @property NotesSubscriptionsTable NotesSubscriptions
 */
class NotesController extends AppController
{
    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Articles.Articles');
        $this->loadModel('Subscriptions.ArticlesSubscriptions');
        $this->loadModel('Subscriptions.NotesSubscriptions');
        $this->loadComponent('RequestHandler');
    }

    private static $disableActions = [
        'comment',
        'comments',
        'editNote',
        'remove',
        'removeComment',
        'removeComments'
    ];

    public function beforeFilter(Event $event)
    {
        parent::beforeFilter($event);
        $this->Security->config('unlockedActions', static::$disableActions);
        if (in_array($this->request->action, static::$disableActions)) {
            $this->getEventManager()->off($this->Csrf);
        }
    }

    public function add($articleId)
    {
        if ($this->request->is('ajax')) {
            $article = $this->Articles->find()
                ->select(['id', 'type_id', 'user_id', 'title'])
                ->where(['id' => $articleId])
                ->first();
            if (!isset($article->id) || empty($article->id)) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid element.')
                ];
            } elseif (empty($this->request->getData('description'))) {
                $response = [
                    'success' => 0,
                    'message' => __('Comment cannot be empty.')
                ];
            } else {
                $messages = [
                    'success' => __('Comment has been saved.'),
                    'failure' => __('Unable to add comment.')
                ];
                if ($article->type_id === ArticlesController::TYPE_QUESTION) {
                    $messages = [
                        'success' => __('Answer has been saved.'),
                        'failure' => __('Unable to add answer.')
                    ];
                }
                $userId = $this->request->getSession()->read('Auth.User.id');
                $note = $this->Notes->newEntity();
                $note->set([
                    'parent_id' => null,
                    'user_id' => $userId,
                    'article_id' => $articleId
                ]);
                $note = $this->Notes->patchEntity($note, $this->request->getData());
                if (empty($this->request->getData('description'))) {
                    $response = [
                        'success' => 0,
                        'message' => $messages['failure']
                    ];
                } elseif ($result = $this->Notes->save($note)) {
                    $subscription = $this->ArticlesSubscriptions->checkIfExists($userId, $articleId);
                    if (!isset($subscription['created'])) {
                        $newSubscription = $this->ArticlesSubscriptions->newEntity(
                            [
                                'user_id' => $userId,
                                'article_id' => $articleId,
                            ]
                        );
                        $this->ArticlesSubscriptions->save($newSubscription);
                    }
                    $commentsCount = $this->Articles->getArticleCommentsCount($articleId);
                    $resultComment = $this->Notes->find()
                        ->where(['Notes.id' => $result->id])
                        ->contain(['Users'])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => $messages['success'],
                        'item' => $resultComment,
                        'comments' => $commentsCount->comments
                    ];

                    $noticeType = ($article->user_id != $userId) ? 'Notice.type.self' : 'Notice.type.subscription';

                    $event = new Event($noticeType, $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_REPLY,
                        'notice_type_subscription_id' => NoticesManager::TYPE_SUBSCRIPTION_NEW_REPLY,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $article->id,
                                'type_id' => $article->type_id,
                                'title' => $article->title,
                                'reason' => 1,
                                'comment_id' => $result->id,
                                'description' => $result->description
                            ]
                        ]),
                        'content_id' => $result->id,
                        'content_parent_id' => $article->id,
                        'user_id' => $article->user_id,
                        'content_type_id' => NoticesManager::TYPE_COMMENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
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

    public function comment($parentNoteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $parentNote = $this->Notes->getParentForComment($parentNoteId);
            $response = [
                'success' => 0,
                'message' => __('Unable to add comment.')
            ];
            if (!isset($parentNote['id']) || empty($parentNote['id'])) {
                $response['message'] = __('Invalid comment.');
            } elseif (empty($this->request->getData('description'))) {
                $response['message'] = __('Comment cannot be empty.');
            } else {
                $noteComment = $this->Notes->newEntity([
                    'user_id' => $userId,
                    'article_id' => $parentNote['article_id'],
                    'parent_id' => $parentNoteId
                ]);
                $noteComment = $this->Notes->patchEntity($noteComment, $this->request->getData());
                if ($result = $this->Notes->save($noteComment)) {
                    $subscription = $this->NotesSubscriptions->checkIfExists($userId, $parentNoteId);
                    if (!isset($subscription['created'])) {
                        $newSubscription = $this->NotesSubscriptions->newEntity(
                            [
                                'user_id' => $userId,
                                'note_id' => $parentNoteId,
                            ]
                        );
                        $this->NotesSubscriptions->save($newSubscription);
                    }

                    $commentsCount = $this->Articles->getArticleCommentsCount($parentNote['article_id']);
                    $resultItem = $this->Notes->find()
                        ->where([
                            'Notes.id' => $result->id,
                            'parent_id' => $parentNoteId
                        ])
                        ->contain(['Users'])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been saved.'),
                        'item' => $resultItem,
                        'comments' => $commentsCount['comments'],
                        'type_id' => $parentNote->article->type_id
                    ];
                    $noticeType = ($parentNote->user_id != $userId) ? 'Notice.type.self' : 'Notice.type.subscription';

                    $event = new Event($noticeType, $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_COMMENT,
                        'notice_type_subscription_id' => NoticesManager::TYPE_SUBSCRIPTION_NEW_COMMENT,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $parentNote->article->id,
                                'content_parent_id' => $parentNoteId,
                                'type_id' => $parentNote->article->type_id,
                                'articleTitle' => $parentNote->article->title,
                                'parentText' => $parentNote->description,
                                'reason' => 1,
                                'comment_id' => $result->id,
                                'description' => $result->description
                            ]
                        ]),
                        'content_id' => $result->id,
                        'content_parent_id' => $parentNoteId,
                        'user_id' => $parentNote->user_id,
                        'content_type_id' => NoticesManager::TYPE_COMMENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
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

    public function comments($parentNoteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $parentNote = $this->Notes->getChildForComment($parentNoteId);
            $response = [
                'success' => 0,
                'message' => __('Unable to add comment.')
            ];
            if (!isset($parentNote['id']) || empty($parentNote['id'])) {
                $response['message'] = __('Invalid comment.');
            } elseif (empty($this->request->getData('description'))) {
                $response['message'] = __('Comment cannot be empty.');
            } else {
                $noteComment = $this->Notes->newEntity([
                    'user_id' => $userId,
                    'article_id' => $parentNote['article_id'],
                    'parent_id' => $parentNoteId
                ]);
                $noteComment = $this->Notes->patchEntity($noteComment, $this->request->getData());
                if ($result = $this->Notes->save($noteComment)) {
                    $commentsCount = $this->Articles->getArticleCommentsCount($parentNote['article_id']);
                    $resultItem = $this->Notes->find()
                        ->where([
                            'Notes.id' => $result->id,
                            'parent_id' => $parentNoteId
                        ])
                        ->contain(['Users'])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been saved.'),
                        'item' => $resultItem,
                        'comments' => $commentsCount['comments'],
                        'type_id' => $parentNote->article->type_id
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

    public function editContent($noteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $note = $this->Notes->getNoteCommentForEdit($noteId);
            if ((empty($this->userGlobalPermissions) || !isset($this->userGlobalPermissions[UsersController::ROLE_EDITOR])
                    || $this->userGlobalPermissions[UsersController::ROLE_EDITOR] === false)
                && (int)$note->user_id !== (int)$userId) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
                $this->Flash->error($response['message']);
            } else {
                $response = [
                    'success' => 1,
                    'content' => $note->description
                ];
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function editNote($noteId)
    {
        if ($this->request->is('ajax')) {
            $this->request->getSession()->delete('Flash');
            $userId = $this->request->getSession()->read('Auth.User.id');
            $note = $this->Notes->getNoteCommentForEdit($noteId);
            if ((empty($this->userGlobalPermissions) || !isset($this->userGlobalPermissions[UsersController::ROLE_EDITOR])
                    || $this->userGlobalPermissions[UsersController::ROLE_EDITOR] === false)
                && (int)$note->user_id !== (int)$userId) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
                $this->Flash->error($response['message']);
            } else {
                $note = $this->Notes->patchEntity($note, [
                    'description' => $this->request->getData('description'),
                    'is_edited' => 1,
                    'is_edited_by' => $userId
                ]);
                $response = [
                    'success' => 0,
                    'message' => __('Unable to save comment.')
                ];
                if ($result = $this->Notes->save($note)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been edited.')
                    ];
                    $this->Flash->success($response['message']);
                } else {
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

    public function remove($noteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $reasonDescription = $this->request->getData('content');
            $note = $this->Notes->getParentForRemove($noteId);
            if ($this->Notes->save($this->Notes->patchEntity($note, [
                'is_deleted' => 1,
                'is_deleted_by' => $userId
            ]))) {
                $event = new Event('Notice.type.self', $this, [
                    'notice_type_id' => NoticesManager::NOTICE_TYPE_REMOVE_NOTE,
                    'created_by' => $userId,
                    'content_message' => json_encode([
                        'message' => [
                            'content' => $note->article->id,
                            'type_id' => $note->article->type_id,
                            'title' => $note->article->title,
                            'reason' => 1,
                            'comment_id' => $note->id,
                            'description' => $note->description,
                            'reason_description' => $reasonDescription
                        ]
                    ]),
                    'content_id' => $note->id,
                    'content_parent_id' => $note->article_id,
                    'user_id' => $note->user_id,
                    'content_type_id' => NoticesManager::TYPE_COMMENT
                ]);
                $this->getEventManager()->on(new NoticesManager());
                $this->getEventManager()->dispatch($event);
                $response = [
                    'success' => 1,
                    'message' => __('Comment has been removed.')
                ];
                $this->Flash->success($response['message']);
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('Error while removing content.')
                ];
                $this->Flash->error($response['message']);
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        }
    }

    public function removeComment($noteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $reasonDescription = $this->request->getData('content');
            $note = $this->Notes->getChildForRemove($noteId);
            if ((int)mb_strlen(trim(preg_replace('/\s+/', '', $reasonDescription))) < 1) {
                $response = [
                    'success' => 0,
                    'message' => __('Field cannot be empty.')
                ];
            } elseif ($this->Notes->save($this->Notes->patchEntity($note, [
                'is_deleted' => 1,
                'is_deleted_by' => $userId
            ]))) {
                $event = new Event('Notice.type.self', $this, [
                    'notice_type_id' => NoticesManager::NOTICE_TYPE_REMOVE_NOTE,
                    'created_by' => $userId,
                    'content_message' => json_encode([
                        'message' => [
                            'content' => $note->article->id,
                            'type_id' => $note->article->type_id,
                            'title' => $note->article->title,
                            'reason' => 2,
                            'comment_id' => $note->id,
                            'description' => $note->description,
                            'reason_description' => $reasonDescription
                        ]
                    ]),
                    'content_id' => $note->id,
                    'content_parent_id' => $note->article_id,
                    'user_id' => $note->user_id,
                    'content_type_id' => NoticesManager::TYPE_COMMENT
                ]);
                $this->getEventManager()->on(new NoticesManager());
                $this->getEventManager()->dispatch($event);
                $response = [
                    'success' => 1,
                    'message' => __('Comment has been removed.')
                ];
                $this->Flash->success($response['message']);
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('Error while removing content.')
                ];
                $this->Flash->error($response['message']);
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        }
    }

    public function removeComments($noteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $note = $this->Notes->getChildForRemove($noteId);
            if ($this->Notes->save($this->Notes->patchEntity($note, [
                'is_deleted' => 1,
                'is_deleted_by' => $userId
            ]))) {
                $response = [
                    'success' => 1,
                    'message' => __('Comment has been removed.')
                ];
                $this->Flash->success($response['message']);
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('Error while removing content.')
                ];
                $this->Flash->error($response['message']);
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        }
    }
}
