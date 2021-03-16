<?php

namespace Notes\Controller;

use Articles\Model\Table\ArticlesTable;
use Cake\Event\Event;
use Notes\Model\Table\ReviewsCommentsTable;
use Notes\Model\Table\ReviewsTable;
use Notices\Event\NoticesManager;

/**
 * Class ReviewsController
 *
 * @package Notes\Controller
 * @property ReviewsTable Reviews
 * @property ReviewsCommentsTable ReviewsComments
 * @property ArticlesTable Articles
 */
class ReviewsController extends AppController
{
    private static $disableActions = ['comment', 'comments'];

    public function beforeFilter(Event $event)
    {
        $this->Security->config('unlockedActions', static::$disableActions);
        if (in_array($this->request->action, static::$disableActions)) {
            $this->getEventManager()->off($this->Csrf);
        }
    }

    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Articles.Articles');
        $this->loadModel('Notes.ReviewsComments');
    }

    public function add($articleId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $article = $this->Articles->find()
                ->select(['id', 'title', 'user_id'])
                ->where(['id' => $articleId])
                ->first();
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
            } else {
                $userId = $this->request->getSession()->read('Auth.User.id');
                $review = $this->Reviews->newEntity(['article_id' => $articleId]);
                $review->set('user_id', $userId);
                $review = $this->Reviews->patchEntity($review, $this->request->getData());
                if (empty($this->request->getData('description'))) {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add review.')
                    ];
                } elseif ($result = $this->Reviews->save($review)) {
                    $event = new Event('Notice.type.self', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REVIEW,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'title' => $article->title,
                            'message' => $review->description
                        ]),
                        'content_id' => $review->article_id,
                        'content_type_id' => NoticesManager::TYPE_REVIEW
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                    $resultItem = $this->Reviews->find()
                        ->where(['Reviews.id' => $result->id])
                        ->contain(['Users'])
                        ->first();
                    $articleReviews = $this->Articles->find()
                        ->select(['id', 'counter_reviews'])
                        ->where(['id' => $articleId])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => __('Review has been saved.'),
                        'item' => $resultItem,
                        'comments' => $articleReviews['counter_reviews']
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add review.')
                    ];
                }
            }
            $this->set(compact('response'));
            $this->viewBuilder()->setLayout(false);
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function comment($reviewId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $review = $this->Reviews->find()
                ->select(['id', 'article_id', 'user_id'])
                ->where(['id' => $reviewId])
                ->first();
            $response = [
                'success' => 0,
                'message' => __('Unable to add comment.')
            ];
            if (!isset($review['id']) || empty($review['id'])) {
                $response['message'] = __('Invalid comment.');
            } elseif (empty($this->request->getData('description'))) {
                $response['message'] = __('Comment cannot be empty.');
            } else {
                $reviewComment = $this->ReviewsComments->newEntity([
                    'user_id' => $userId,
                    'review_id' => $reviewId
                ]);
                $reviewComment = $this->ReviewsComments->patchEntity($reviewComment, $this->request->getData());
                if ($result = $this->ReviewsComments->save($reviewComment)) {
                    $event = new Event('Notice.type.new', $this, [
                        'user_id' => $review['user_id'],
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REVIEW_REPLY,
                        'created_by' => $userId,
                        'content_message' => $result->description,
                        'content_id' => $result->id,
                        'content_type_id' => NoticesManager::TYPE_COMMENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                    $resultItem = $this->ReviewsComments->find()
                        ->where(['ReviewsComments.id' => $result->id, 'ReviewsComments.parent_id IS' => null])
                        ->contain(['Users'])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been saved.'),
                        'item' => $resultItem,
                        'comments' => 0
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add comment.')
                    ];
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
            $parent = $this->ReviewsComments->getParent($parentId);
            if (!$parent || !isset($parent['id'])) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid element.')
                ];
            } else {
                $reviewComment = $this->ReviewsComments->newEntity([
                    'parent_id' => $parent['id'],
                    'user_id' => $parent['user_id'],
                    'review_id' => $parent['review_id']
                ]);
                $reviewComment = $this->ReviewsComments->patchEntity($reviewComment, $this->request->getData());
                if (empty($this->request->getData('description'))) {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add comment.')
                    ];
                } elseif ($result = $this->ReviewsComments->save($reviewComment)) {
                    $resultItem = $this->ReviewsComments->find()
                        ->where(['ReviewsComments.id' => $result->id])
                        ->contain(['Users'])
                        ->first();
                    $response = [
                        'success' => 1,
                        'message' => __('Comment has been saved.'),
                        'item' => $resultItem,
                        'comments' => 0
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add comment.')
                    ];
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
