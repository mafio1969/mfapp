<?php


namespace Notices\Event;

use Articles\Model\Table\ArticlesTable;
use Cake\Event\Event;
use Cake\Event\EventListenerInterface;
use Cake\Log\Log;
use Cake\ORM\TableRegistry;
use Croogo\Users\Model\Table\RolesTable;
use Notes\Model\Table\RejectsTable;
use Notes\Model\Table\ReviewsTable;
use Notices\Model\Table\NoticesTable;
use Notices\Model\Table\NoticesEmailsTable;
use Subscriptions\Model\Table\ArticlesSubscriptionsTable;
use Subscriptions\Model\Table\UsersSubscriptionsTable;
use Subscriptions\Model\Table\NotesSubscriptionsTable;
use Subscriptions\Model\Table\CommentsSubscriptionsTable;
use Subscriptions\Model\Table\CategoriesSubscriptionsTable;
use Articles\Model\Table\CategoriesArticlesTable;

/**
 * Class NoticesManager
 *
 * @package Notices\Event
 * @property NoticesTable Notices
 * @property NoticesEmailsTable NoticesEmails
 * @property ArticlesTable Articles
 * @property CategoriesArticlesTable CategoriesArticles
 * @property RejectsTable Rejects
 * @property ReviewsTable Reviews
 * @property RolesTable Users
 * @property ArticlesSubscriptionsTable ArticlesSubscriptions
 * @property UsersSubscriptionsTable UsersSubscriptions
 * @property NotesSubscriptionsTable NotesSubscriptions
 * @property CommentsSubscriptionsTable CommentsSubscriptions
 * @property CategoriesSubscriptionsTable CategoriesSubscriptions
 */
class NoticesManager implements EventListenerInterface
{
    /**
     * Notice's types ids for my content
     */
    const NOTICE_TYPE_ACCEPT = 1;
    const NOTICE_TYPE_REJECT = 2;
    const NOTICE_TYPE_REVIEW = 3;
    const NOTICE_TYPE_RESULT_RESOLVE_ACCEPT = 4;
    const NOTICE_TYPE_RESULT_RESOLVE_REJECT = 5;
    const NOTICE_TYPE_NEW_REPLY = 6;
    const NOTICE_TYPE_REMOVE_NOTE = 7;

    /**
     * Notice's types ids for new content
     */
    const NOTICE_TYPE_NEW_CONTENT = 11;
    const NOTICE_TYPE_REVIEW_REPLY = 12;
    const NOTICE_TYPE_REJECT_REPLY = 13;
    const NOTICE_TYPE_NEW_COMMENT = 14;


    /**
     * Notice's types ids for reports
     */
    const NOTICE_TYPE_REPORT_ACCEPT = 20;
    const NOTICE_TYPE_REPORT_REJECT = 21;
    const NOTICE_TYPE_REPORT_USER = 22;
    const NOTICE_TYPE_REPORT_COMMENT = 23;
    const NOTICE_TYPE_RESOLVE_I = 24;
    const NOTICE_TYPE_RESOLVE_IV = 25;
    const NOTICE_TYPE_REPORT_CONTENT = 26;
    const NOTICE_TYPE_REPORT_REPLY = 27;
    const NOTICE_TYPE_REPORT_DECISION = 28;

    /**
     * Notice's types ids for others
     */
    const NOTICE_TYPE_OTHER_PERMISSIONS = 30;
    const NOTICE_TYPE_OTHER_COMMENT = 31;

    /**
     * Notice's  types ids subscriptions
     */
    const NOTICE_TYPE_EDIT_CONTENT = 40;

    /**
     * Notice's  types ids users
     */
    const NOTICE_TYPE_BLOCKED_USER = 50;

    /**
     * Notice's  types ids admin contacts
     */
    const NOTICE_TYPE_ADMIN_CONTACT = 60;

    /**
     * Notice's content types
     */
    const TYPE_CONTENT = 1;
    const TYPE_REVIEW = 2;
    const TYPE_REJECT = 3;
    const TYPE_REPORT = 4;
    const TYPE_COMMENT = 5;
    const TYPE_SUB_COMMENT = 6;
    const TYPE_REJECT_COMMENT = 7;
    const TYPE_REPLY = 8;
    const TYPE_USER = 9;

    /**
     * Subscription's content types
     */
    const TYPE_SUBSCRIPTION_NEW_ARTICLE = 1;
    const TYPE_SUBSCRIPTION_EDIT_ARTICLE = 2;
    const TYPE_SUBSCRIPTION_NEW_REPLY = 3;
    const TYPE_SUBSCRIPTION_NEW_COMMENT = 4;


    public static function getMessage($key)
    {
        return self::messages()[$key];
    }

    private static function messages()
    {
        return [
            self::NOTICE_TYPE_ACCEPT => __('accepted'),
            self::NOTICE_TYPE_REJECT => __('rejected'),
            self::NOTICE_TYPE_REVIEW => __('added review'),
            self::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT => __('resolve as accepted'),
            self::NOTICE_TYPE_RESULT_RESOLVE_REJECT => __('resolve as rejected'),
            self::NOTICE_TYPE_NEW_CONTENT => __('added'),
            self::NOTICE_TYPE_REVIEW_REPLY => __('added comment to Your review'),
            self::NOTICE_TYPE_REJECT_REPLY => __('added comment to Your reject'),
            self::NOTICE_TYPE_REPORT_ACCEPT => __('reported'),
            self::NOTICE_TYPE_REPORT_REJECT => __('reported'),
            self::NOTICE_TYPE_REPORT_USER => __('reported'),
            self::NOTICE_TYPE_REPORT_COMMENT => __('reported'),
            self::NOTICE_TYPE_RESOLVE_I => __('reported to resolve'),
            self::NOTICE_TYPE_RESOLVE_IV => __('reported to resolve'),
            self::NOTICE_TYPE_OTHER_PERMISSIONS => __('Your account were banned for %s by take away %s for time %s'),
            self::NOTICE_TYPE_OTHER_COMMENT => __('Your comment was removed due to:'),
        ];
    }

    public function implementedEvents()
    {
        return [
            'Notice.type.self' => 'addSelf',
            'Notice.type.mass' => 'addMass',
            'Notice.type.new' => 'addNew',
            'Notice.type.email' => 'addEmail',
            'Notice.type.subscription' => 'addSubscription',
        ];
    }

    /**
     * @param $event Event
     */
    public function addSelf($event)
    {
        $data = $event->getData();
        $this->Articles = TableRegistry::get('Articles.Articles');
        switch ($data['notice_type_id']) {
            case self::NOTICE_TYPE_REVIEW:
            case self::NOTICE_TYPE_REJECT:
            case self::NOTICE_TYPE_ACCEPT;
                $content = $this->Articles->find()
                    ->where(['id' => $data['content_id']])
                    ->select(['id', 'user_id'])
                    ->first();
                $data['user_id'] = $content['user_id'];
                break;
            case self::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT:
            case self::NOTICE_TYPE_RESULT_RESOLVE_REJECT;
            case self::NOTICE_TYPE_NEW_REPLY;
            case self::NOTICE_TYPE_NEW_COMMENT;
            case self::NOTICE_TYPE_BLOCKED_USER;
            case self::NOTICE_TYPE_REMOVE_NOTE;
            case self::NOTICE_TYPE_ADMIN_CONTACT;
            case self::NOTICE_TYPE_REPORT_ACCEPT;
            case self::NOTICE_TYPE_REPORT_REJECT;
            case self::NOTICE_TYPE_REPORT_USER;
            case self::NOTICE_TYPE_REPORT_COMMENT;
            case self::NOTICE_TYPE_RESOLVE_I;
            case self::NOTICE_TYPE_RESOLVE_IV;
            case self::NOTICE_TYPE_REPORT_CONTENT;
            case self::NOTICE_TYPE_REPORT_REPLY;
            case self::NOTICE_TYPE_REPORT_DECISION;
                break;
            default:
                Log::error('Wrong notice_type_id', 'notices_log');
                return;
        }
        $data['status'] = 1;
        $this->Notices = TableRegistry::get('Notices.Notices');
        $notice = $this->Notices->newEntity($data);
        $result = $this->Notices->save($notice);
        self::subscriptionNotices($data, $result);
    }

    public function addMass($event)
    {
        $data = $event->getData();
        $data['user_id'] = 0;
        $data['status'] = 1;
        $this->Notices = TableRegistry::get('Notices.Notices');
        $notice = $this->Notices->newEntity($data);
        $result = $this->Notices->save($notice);
        self::subscriptionNotices($data, $result);
    }

    public function addSubscription($event)
    {
        $data = $event->getData();
        $data['user_id'] = -1;
        $data['status'] = 1;
        $this->Notices = TableRegistry::get('Notices.Notices');
        $notice = $this->Notices->newEntity($data);
        $result = $this->Notices->save($notice);
        self::subscriptionNotices($data, $result);
    }

    public function addNew($event)
    {
        $data = $event->getData();
        $data['status'] = 1;
        $this->Notices = TableRegistry::get('Notices.Notices');
        $notice = $this->Notices->newEntity($data);
        $this->Notices->save($notice);
    }

    public function addEmail($event)
    {
        $data = $event->getData();
        $data['status'] = 0;
        $this->NoticesEmails = TableRegistry::get('Notices.NoticesEmails');
        $notice = $this->NoticesEmails->newEntity($data);
        $this->NoticesEmails->save($notice);
    }

    private static function subscriptionNotices($data, $result) {
        $articlesSubscriptions = TableRegistry::get('Subscriptions.ArticlesSubscriptions');
        $notesSubscriptions = TableRegistry::get('Subscriptions.NotesSubscriptions');
        $commentsSubscriptions = TableRegistry::get('Subscriptions.CommentsSubscriptions');
        $usersSubscriptions = TableRegistry::get('Subscriptions.UsersSubscriptions');
        $categoriesSubscriptions = TableRegistry::get('Subscriptions.CategoriesSubscriptions');
        $noticesSubscriptions = TableRegistry::get('Notices.NoticesSubscriptions');
        $categoriesArticles = TableRegistry::get('Articles.CategoriesArticles');

        if(isset($data['notice_type_subscription_id'])) {
            switch ($data['notice_type_subscription_id']) {
                case self::TYPE_SUBSCRIPTION_NEW_ARTICLE: {
                    $users = $usersSubscriptions->getAllSubscriptionsUser($data['created_by']);
                    $categories = $categoriesArticles->getAllWithArticleId($data['content_id']);
                    foreach($users as $user) {
                        $newUserNotification = [
                            'user_id' => $user->user_id,
                            'notice_id' => $result->id
                        ];
                        $notice = $noticesSubscriptions->newEntity();
                        $noticesSubscriptions->patchEntity($notice, $newUserNotification);
                        $noticesSubscriptions->save($notice);
                    }
                    foreach($categories as $category) {
                        $usersSubscibedSubscription = $categoriesSubscriptions->getAllWithCategoryId($category->category_id);
                        foreach($usersSubscibedSubscription as $user) {
                            $exist= $noticesSubscriptions->checkIfExists($user->user_id, $result->id);
                            if(!isset($exist->id) && ($user->user_id != $result->created_by)) {
                                $newUserNotification = [
                                    'user_id' => $user->user_id,
                                    'notice_id' => $result->id
                                ];
                                $notice = $noticesSubscriptions->newEntity();
                                $noticesSubscriptions->patchEntity($notice, $newUserNotification);
                                $noticesSubscriptions->save($notice);
                            }
                        }
                    }
                    break;
                }
                case self::TYPE_SUBSCRIPTION_EDIT_ARTICLE: {
                    $articles = $articlesSubscriptions->getAllWithArticleId($data['content_id']);
                    foreach($articles as $article) {
                        if ($article->user_id != $result->created_by) {
                            $newUserNotification = [
                                'user_id' => $article->user_id,
                                'notice_id' => $result->id
                            ];
                            $notice = $noticesSubscriptions->newEntity();
                            $noticesSubscriptions->patchEntity($notice, $newUserNotification);
                            $noticesSubscriptions->save($notice);
                        }
                    }

                    break;
                }
                case self::TYPE_SUBSCRIPTION_NEW_REPLY: {
                    $articles = $articlesSubscriptions->getAllWithArticleId($data['content_parent_id']);
                    $users = $usersSubscriptions->getAllSubscriptionsUser($data['created_by']);
                    foreach($articles as $article) {
                        if ($article->user_id != $result->created_by) {
                            $newUserNotification = [
                                'user_id' => $article->user_id,
                                'notice_id' => $result->id
                            ];
                            $notice = $noticesSubscriptions->newEntity();
                            $noticesSubscriptions->patchEntity($notice, $newUserNotification);
                            $noticesSubscriptions->save($notice);
                        }
                    }
                    foreach($users as $user) {
                        $exist= $noticesSubscriptions->checkIfExists($user->user_id, $result->id);
                        if(!isset($exist->id) && ($user->user_id != $result->created_by)) {
                            $newUserNotification = [
                                'user_id' => $user->user_id,
                                'notice_id' => $result->id
                            ];
                            $notice = $noticesSubscriptions->newEntity();
                            $noticesSubscriptions->patchEntity($notice, $newUserNotification);
                            $noticesSubscriptions->save($notice);
                        }
                    }
                    break;
                }
                case self::TYPE_SUBSCRIPTION_NEW_COMMENT: {
                    $notes = $notesSubscriptions->getAllWithNoteId($data['content_parent_id']);
                    $users = $usersSubscriptions->getAllSubscriptionsUser($data['created_by']);
                    foreach($notes as $note) {
                        if($note->user_id != $result->created_by) {
                            $newUserNotification = [
                                'user_id' => $note->user_id,
                                'notice_id' => $result->id
                            ];
                            $notice = $noticesSubscriptions->newEntity();
                            $noticesSubscriptions->patchEntity($notice, $newUserNotification);
                            $noticesSubscriptions->save($notice);
                        }
                    }
                    foreach($users as $user) {
                        $exist= $noticesSubscriptions->checkIfExists($user->user_id, $result->id);
                        if(!isset($exist->id) && ($user->user_id != $result->created_by)) {
                            $newUserNotification = [
                                'user_id' => $user->user_id,
                                'notice_id' => $result->id
                            ];
                            $notice = $noticesSubscriptions->newEntity();
                            $noticesSubscriptions->patchEntity($notice, $newUserNotification);
                            $noticesSubscriptions->save($notice);
                        }
                    }
                    break;
                }
                default:
                    Log::error('Wrong notice_type_subscription_id', 'notices_log');
                    return;
            }
        }
    }

}
