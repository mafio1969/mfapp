<?php


namespace Subscriptions\Controller;

use Subscriptions\Model\Table\SubscriptionsTable;
use Subscriptions\Model\Table\ArticlesSubscriptionsTable;
use Subscriptions\Model\Table\UsersSubscriptionsTable;
use Subscriptions\Model\Table\NotesSubscriptionsTable;
use Subscriptions\Model\Table\CommentsSubscriptionsTable;
use Subscriptions\Model\Table\CategoriesSubscriptionsTable;


/**
 * Class SubscriptionsController
 * @package Subscriptions\Controller
 * @property SubscriptionsTable Subscriptions
 * @property ArticlesSubscriptionsTable ArticlesSubscriptions
 * @property UsersSubscriptionsTable UsersSubscriptions
 * @property NotesSubscriptionsTable NotesSubscriptions
 * @property CommentsSubscriptionsTable CommentsSubscriptions
 * @property CategoriesSubscriptionsTable CategoriesSubscriptions
 */
class SubscriptionsController extends AppController
{
    const SUBSCRIPTION_TYPE_NOTE = 1;
    const SUBSCRIPTION_TYPE_COMMENT = 2;

    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Subscriptions.Subscriptions');
        $this->loadModel('Subscriptions.ArticlesSubscriptions');
        $this->loadModel('Subscriptions.UsersSubscriptions');
        $this->loadModel('Subscriptions.NotesSubscriptions');
        $this->loadModel('Subscriptions.CommentsSubscriptions');
        $this->loadModel('Subscriptions.CategoriesSubscriptions');
        $this->loadComponent('Paginator');
    }

    public function add()
    {
        $subscription = $this->Subscriptions->newEntity();
        if ($this->request->is('post')) {
            $subscription = $this->Subscriptions->patchEntity($subscription, $this->request->getData());
            if ($this->Subscriptions->save($subscription)) {
                //$this->Flash->success(__('Subscription was added successfully.'));
                $this->Flash->success(__('Success! We will stay in touch. You will receive a notification when ccfound officially opens! Stay tuned! '));
                return $this->redirect([
                    'plugin' => 'Croogo/Users',
                    'controller' => 'Users',
                    'action' => 'main'
                ]);
            }
            //$this->Flash->error(__('Error while adding subscription.'));
            $this->Flash->error(__('Error registration.'));
        }
        $this->set([
            'subscription' => $subscription
        ]);
    }

    public function addArticleSubscription($articleId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to add subscription.')
            ];
            $exists = $this->ArticlesSubscriptions->checkIfExists($userId, $articleId);
            if (isset($exists['created'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Subscription has been already add.')
                ];
            } else {
                $subscription = $this->ArticlesSubscriptions->newEntity(
                    [
                        'user_id' => $userId,
                        'article_id' => $articleId,
                    ]
                );
                if ($this->ArticlesSubscriptions->save($subscription)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been added.'),
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function deleteArticleSubscription($articleId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to delete subscription.')
            ];
            $exists = $this->ArticlesSubscriptions->checkIfExists($userId, $articleId);
            if (isset($exists['created'])) {
                if ($this->ArticlesSubscriptions->delete($exists)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been deleted.'),

                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to delete subscription.')
                    ];
                }
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('This subscription doesn\'t exist.'),
                ];
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function addUserSubscription($sub_userId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to add subscription.')
            ];
            $exists = $this->UsersSubscriptions->checkIfExists($userId, $sub_userId);
            if (isset($exists['created'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Subscription has been already add.')
                ];
            } else {
                $subscription = $this->UsersSubscriptions->newEntity(
                    [
                        'user_id' => $userId,
                        'sub_user_id' => $sub_userId,
                    ]
                );
                if ($this->UsersSubscriptions->save($subscription)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been added.'),
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function deleteUserSubscription($sub_userId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to delete subscription.')
            ];
            $exists = $this->UsersSubscriptions->checkIfExists($userId, $sub_userId);
            if (isset($exists['created'])) {
                if ($this->UsersSubscriptions->delete($exists)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been deleted.'),

                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to delete subscription.')
                    ];
                }
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('This subscription doesn\'t exist.'),
                ];
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function addNoteSubscription($noteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to add subscription.')
            ];
            $exists = $this->NotesSubscriptions->checkIfExists($userId, $noteId);
            if (isset($exists['created'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Subscription has been already add.')
                ];
            } else {
                $subscription = $this->NotesSubscriptions->newEntity(
                    [
                        'user_id' => $userId,
                        'note_id' => $noteId,
                    ]
                );
                if ($this->NotesSubscriptions->save($subscription)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been added.'),
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function deleteNoteSubscription($noteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to delete subscription.')
            ];
            $exists = $this->NotesSubscriptions->checkIfExists($userId, $noteId);
            if (isset($exists['created'])) {
                if ($this->NotesSubscriptions->delete($exists)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been deleted.'),

                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to delete subscription.')
                    ];
                }
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('This subscription doesn\'t exist.'),
                ];
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function addCommentSubscription($commentId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to add subscription.')
            ];
            $exists = $this->CommentsSubscriptions->checkIfExists($userId, $commentId);
            if (isset($exists['created'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Subscription has been already add.')
                ];
            } else {
                $subscription = $this->CommentsSubscriptions->newEntity(
                    [
                        'user_id' => $userId,
                        'comment_id' => $commentId,
                    ]
                );
                if ($this->CommentsSubscriptions->save($subscription)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been added.'),
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function deleteCommentSubscription($commentId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to delete subscription.')
            ];
            $exists = $this->CommentsSubscriptions->checkIfExists($userId, $commentId);
            if (isset($exists['created'])) {
                if ($this->CommentsSubscriptions->delete($exists)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been deleted.'),

                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to delete subscription.')
                    ];
                }
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('This subscription doesn\'t exist.'),
                ];
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function addCategorySubscription($categoryId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to add subscription.')
            ];
            $exists = $this->CategoriesSubscriptions->checkIfExists($userId, $categoryId);
            if (isset($exists['created'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Subscription has been already add.')
                ];
            } else {
                $subscription = $this->CategoriesSubscriptions->newEntity(
                    [
                        'user_id' => $userId,
                        'category_id' => $categoryId,
                    ]
                );
                if ($this->CategoriesSubscriptions->save($subscription)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been added.'),
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function deleteCategorySubscription($categoryId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to delete subscription.')
            ];
            $exists = $this->CategoriesSubscriptions->checkIfExists($userId, $categoryId);
            if (isset($exists['created'])) {
                if ($this->CategoriesSubscriptions->delete($exists)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Subscription has been deleted.'),

                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to delete subscription.')
                    ];
                }
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('This subscription doesn\'t exist.'),
                ];
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }
}
