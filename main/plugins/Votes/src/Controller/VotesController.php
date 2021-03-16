<?php

namespace Votes\Controller;

use Articles\Model\Table\ArticlesTable;
use Notes\Model\Table\NotesTable;
use Notes\Model\Table\RejectsTable;
use Subscriptions\Controller\SubscriptionsController;
use Subscriptions\Model\Table\CommentsSubscriptionsTable;
use Votes\Model\Table\VotesNotesTable;
use Votes\Model\Table\VotesTable;
use Subscriptions\Model\Table\ArticlesSubscriptionsTable;
use Subscriptions\Model\Table\NotesSubscriptionsTable;

/**
 * Class VotesController
 *
 * @package Votes\Controller
 * @property VotesTable Votes
 * @property VotesNotesTable VotesNotes
 * @property NotesTable Notes
 * @property RejectsTable Rejects
 * @property ArticlesTable Articles
 * @property ArticlesSubscriptionsTable ArticlesSubscriptions
 * @property NotesSubscriptionsTable NotesSubscriptions
 * @property CommentsSubscriptionsTable CommentsSubscriptions
 */
class VotesController extends AppController
{
    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Votes.VotesNotes');
        $this->loadModel('Notes.Notes');
        $this->loadModel('Notes.Rejects');
        $this->loadModel('Articles.Articles');
        $this->loadModel('Subscriptions.ArticlesSubscriptions');
        $this->loadModel('Subscriptions.NotesSubscriptions');
        $this->loadModel('Subscriptions.CommentsSubscriptions');
        $this->loadComponent('RequestHandler');
    }

    public function agree($articleId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to add vote.')
            ];
            $exists = $this->Votes->checkIfExists($userId, $articleId);
            if (isset($exists['status'])) {
                if ((int)$exists['status'] === 1) {
                    $this->Votes->delete($exists);
                    $item = $this->Articles->getArticleVotes($articleId);
                    $response = [
                        'success' => 1,
                        'message' => __('Vote has been added.'),
                        'agree' => $item->agree,
                        'disagree' => $item->disagree
                    ];
                } elseif ((int)$exists['status'] === 0) {
                    $response = [
                        'success' => 0,
                        'message' => __('Vote has been already add.')
                    ];
                }
            } else {
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
                $vote = $this->Votes->newEntity(
                    [
                        'user_id' => $userId,
                        'article_id' => $articleId,
                        'status' => 1
                    ]
                );
                if ($this->Votes->save($vote)) {
                    $item = $this->Articles->getArticleVotes($articleId);
                    $response = [
                        'success' => 1,
                        'message' => __('Vote has been added.'),
                        'agree' => $item->agree,
                        'disagree' => $item->disagree
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function disagree($articleId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $response = [
                'success' => 0,
                'message' => __('Unable to add vote.')
            ];
            $exists = $this->Votes->checkIfExists($userId, $articleId);
            if (isset($exists['status'])) {
                if ((int)$exists['status'] === 0) {
                    $this->Votes->delete($exists);
                    $item = $this->Articles->getArticleVotes($articleId);
                    $response = [
                        'success' => 1,
                        'message' => __('Vote has been added.'),
                        'agree' => $item->agree,
                        'disagree' => $item->disagree
                    ];
                } elseif ((int)$exists['status'] === 1) {
                    $response = [
                        'success' => 0,
                        'message' => __('Vote has been already add.')
                    ];
                }
            } else {
                $vote = $this->Votes->newEntity(
                    [
                        'user_id' => $userId,
                        'article_id' => $articleId,
                        'status' => 0
                    ]
                );
                if ($this->Votes->save($vote)) {
                    $item = $this->Articles->getArticleVotes($articleId);
                    $response = [
                        'success' => 1,
                        'message' => __('Vote has been added.'),
                        'agree' => $item->agree,
                        'disagree' => $item->disagree
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function vote($noteId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $note = $this->Notes->getNoteForVote($noteId);
            $exists = $this->VotesNotes->checkIfExists($userId, $noteId);
            $addSubscription = $subscriptionType = false;
            if (is_null($exists)) {
                $addSubscription = true;
            }
            if (isset($note->id) && is_null($note->parent_id)) {
                $addSubscription = true;
                $subscriptionType = SubscriptionsController::SUBSCRIPTION_TYPE_NOTE;
            } elseif (isset($note->id) && $note->parent_id !== null) {
                $parent = $this->Notes->getParentForSubscription($note->parent_id);
                if (isset($parent->id) && is_null($parent->parent_id)) {
                    $addSubscription = true;
                    $subscriptionType = SubscriptionsController::SUBSCRIPTION_TYPE_COMMENT;
                }
            }
            if ($exists) {
                $item = $this->VotesNotes->patchEntity($exists, [
                    'status' => (int)$exists->status === 0 ? 1 : 0
                ]);
            } else {
                $item = $this->VotesNotes->newEntity([
                    'user_id' => $userId,
                    'note_id' => $noteId,
                    'status' => 1
                ]);
            }
            if ($addSubscription && (int)$subscriptionType === SubscriptionsController::SUBSCRIPTION_TYPE_NOTE) {
                $subscription = $this->NotesSubscriptions->checkIfExists($userId, $noteId);
                if (!isset($subscription['created'])) {
                    $newSubscription = $this->NotesSubscriptions->newEntity(
                        [
                            'user_id' => $userId,
                            'note_id' => $noteId,
                        ]
                    );
                    $this->NotesSubscriptions->save($newSubscription);
                }
            } elseif ($addSubscription && (int)$subscriptionType === SubscriptionsController::SUBSCRIPTION_TYPE_COMMENT) {
                $subscription = $this->CommentsSubscriptions->checkIfExists($userId, $noteId);
                if (!isset($subscription['created'])) {
                    $newSubscription = $this->CommentsSubscriptions->newEntity(
                        [
                            'user_id' => $userId,
                            'comment_id' => $noteId,
                        ]
                    );
                    $this->CommentsSubscriptions->save($newSubscription);
                }
            }
            if ($this->VotesNotes->save($item)) {
                $note = $this->Notes->find()
                    ->select(['counter_up_vote'])
                    ->where(['id' => $noteId])
                    ->first();
                $response = [
                    'success' => 1,
                    'message' => __('Vote has been added.'),
                    'votes' => $note->counter_up_vote
                ];
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('Error while adding vote.')
                ];
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }
}
