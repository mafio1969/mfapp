<?php

namespace Notices\Controller;

use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Model\Table\UsersTable;
use Notes\Model\Entity\Note;
use Notes\Model\Table\NotesCommentsTable;
use Notes\Model\Table\NotesTable;
use Notes\Model\Table\RejectsCommentsTable;
use Notes\Model\Table\RejectsTable;
use Reports\Model\Table\ReportsTable;
use Notices\Event\NoticesManager;
use Notices\Model\Table\NoticesEmailsTable;
use Notices\Model\Table\NoticesTable;
use Notices\Model\Table\NoticesStatusesTable;
use Notices\Model\Table\NoticesSubscriptionsTable;

/**
 * Class NoticesController
 *
 * @package Notices\Controller
 * @property NoticesTable Notices
 * @property UsersTable Users
 * @property NotesTable Notes
 * @property RejectsTable Rejects
 * @property ReportsTable Reports
 * @property RejectsCommentsTable RejectsComments
 * @property NoticesStatusesTable NoticesStatuses
 * @property NoticesEmailsTable NoticesEmails
 * @property NoticesSubscriptionsTable NoticesSubscriptions
 * @property UserComponent User
 */
class NoticesController extends AppController
{
    const INBOX_EMAIL_FREQUENCY_DAY = 0;
    const INBOX_EMAIL_FREQUENCY_WEEK = 1;

    public $helpers = [
        'Articles.Articles',
        'Image2Helper.Image2',
        'Reports.Reports'
    ];

    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Croogo/Users.Users');
        $this->loadModel('Notices.NoticesStatuses');
        $this->loadModel('Notices.NoticesEmails');
        $this->loadModel('Notices.NoticesSubscriptions');
        $this->loadModel('Notes.Notes');
        $this->loadModel('Notes.Rejects');
        $this->loadModel('Notes.RejectsComments');
        $this->loadComponent('Paginator');
        $this->loadComponent('Users.User');
    }

    public function index()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $t = $this->request->getSession()->read('Auth.User.created');
        $roleId = $this->request->getSession()->read('Auth.User.role_id');
        $notices = $this->Paginator->paginate(
            $this->Notices->getNoticesForAll($userId, $this->request->getSession()->read('Auth.User.created'), $this->userGlobalPermissions, $roleId),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices,
            'commentsCounters' => $this->Notices->getUserNoticesCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
    }

    public function view($noticeId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $userId = $this->request->getSession()->read('Auth.User.role_id');
        $notice = $this->Notices->getNoticeForView($userId, $noticeId);
        if (!isset($notice->id) || empty($notice->id)) {
            $this->Flash->error(__('Invalid content.'));
            return $this->redirect(['action' => 'index']);
        }
        $field = ['status' => 0];
        if ((int)$notice->user_id === 0) {
            if (isset($notice->notices_status->id) && !empty($notice->notices_status->id)
                && (int)$notice->notices_status->status === 1) {
                $this->NoticesStatuses->save($this->NoticesStatuses->patchEntity($notice->notices_status,
                    $field));
            } elseif (!isset($notice->notices_status->id) || empty($notice->notices_status->id)) {
                $newField = [
                    'notice_id' => $notice->id,
                    'user_id' => $userId,
                    'status' => 0,
                    'is_deleted' => 0
                ];
                $this->NoticesStatuses->save($this->NoticesStatuses->newEntity($newField));
            }
        } elseif ((int)$notice->user_id > 0 && (int)$notice->status === 1) {
            $this->Notices->save($this->Notices->patchEntity($notice, $field));
        }
        $isDeleted = false;
        if ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_REJECT) {
            $isDeleted = $this->Rejects->find()
                ->select(['id'])
                ->where([
                    'id' => $notice->content_id,
                    'is_deleted' => true
                ])
                ->first();
        } elseif ($notice->notice_type_id === NoticesManager::NOTICE_TYPE_REPORT_COMMENT) {
            if ($notice->content_type_id === NoticesManager::TYPE_COMMENT) {
                $isDeleted = $this->Notes->find()
                    ->select(['id'])
                    ->where([
                        'id' => $notice->content_id,
                        'is_deleted' => true
                    ])
                    ->first();
            } elseif ($notice->content_type_id === NoticesManager::TYPE_SUB_COMMENT) {
                $isDeleted = $this->Notes->find()
                    ->select(['id'])
                    ->where([
                        'id' => $notice->content_id,
                        'is_deleted' => true
                    ])
                    ->first();
            } elseif ($notice->content_type_id === NoticesManager::TYPE_REJECT_COMMENT) {
                $isDeleted = $this->RejectsComments->find()
                    ->select(['id'])
                    ->where([
                        'id' => $notice->content_id,
                        'is_deleted' => true
                    ])
                    ->first();
            }
        }
        $this->set([
            'notice' => $notice,
            'isDeleted' => (isset($isDeleted->id) && !empty($isDeleted->id)),
            'allCommentsCounters' => $this->Notices->getAllUserCommentsCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
    }

    public function content()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $roleId = $this->request->getSession()->read('Auth.User.role_id');
        $notices = $this->Paginator->paginate(
            $this->Notices->getNoticesForMyContent($userId, $this->request->getSession()->read('Auth.User.created')),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices,
            'commentsCounters' => $this->Notices->getUserNoticesCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
        $this->render('index');
    }

    public function news()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $roleId = $this->request->getSession()->read('Auth.User.role_id');
        $notices = $this->Paginator->paginate(
            $this->Notices->getNoticesForNewContent($userId, $this->request->getSession()->read('Auth.User.created')),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices,
            'commentsCounters' => $this->Notices->getUserNoticesCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
        $this->render('index');
    }

    public function subscriptions()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $roleId = $this->request->getSession()->read('Auth.User.role_id');
        $tempNotices = $this->Notices->getNoticesForSubscriptions($userId);
        $notices = $this->Paginator->paginate(
            $tempNotices,
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices,
            'commentsCounters' => $this->Notices->getUserNoticesCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
        $this->render('index');
    }

    public function reports()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $roleId = $this->request->getSession()->read('Auth.User.role_id');
        $notices = $this->Paginator->paginate(
            $this->Notices->getNoticesForReports($userId, $this->request->getSession()->read('Auth.User.created')),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices,
            'commentsCounters' => $this->Notices->getUserNoticesCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
        $this->render('index');
    }

    public function others()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $roleId = $this->request->getSession()->read('Auth.User.role_id');
        $notices = $this->Paginator->paginate(
            $this->Notices->getNoticesForOthers($userId, $this->request->getSession()->read('Auth.User.created')),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices,
            'commentsCounters' => $this->Notices->getUserNoticesCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
        $this->render('index');
    }

    public function latest()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $created = $this->request->getSession()->read('Auth.User.created');
        $roleId = $this->request->getSession()->read('Auth.User.role_id');
        $notices = $this->Paginator->paginate(
            $this->Notices->getNoticesForLatestNewContent($userId, $created),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices,
            'commentsCounters' => $this->Notices->getUserNoticesCounter(
                $userId,
                $this->userGlobalPermissions,
                $this->request->getSession()->read('Auth.User.created'),
                $roleId
            )
        ]);
    }

    public function verified()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $created = $this->request->getSession()->read('Auth.User.created');
        $notices = $this->Paginator->paginate(
            $this->Notices->getNoticesForVerifiedNewContent($userId, $created),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'notices' => $notices
        ]);
    }

    public function check($noticeId)
    {
        $this->processSelect($noticeId, 0, 1);
        $notice = $this->Notices->getNoticeForCheck($noticeId);
        if (!isset($notice->id) || empty($notice->id)) {
            $this->Flash->error(__('Invalid content.'));
            return $this->redirect($this->referer());
        }
        return $this->redirect([
            'plugin' => 'Articles',
            'controller' => 'Articles',
            'action' => 'view',
            $notice->content_id
        ]);
    }

    public function selected()
    {
        if (!$this->request->is('post')) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect($this->referer());
        }

        $userId = $this->request->getSession()->read('Auth.User.id');
        $data = $this->request->getData();
        if (!isset($data['button']) || !in_array($data['button'], ['read', 'remove'])) {
            $this->Flash->error(__('Invalid content.'));
            return $this->redirect($this->referer());
        }
        if (!isset($data['actives']['_ids']) || empty($data['actives']['_ids'])) {
            $this->Flash->success(__('No messages selected.'));
            return $this->redirect($this->referer());
        }
        $notices = $this->Notices->getNoticesMultiSelect($data['actives']['_ids'], $userId);
        $field = ['status' => 0];
        $success = __('Messages were mark as read.');
        if ($data['button'] == 'remove') {
            $field = ['is_deleted' => 1];
            $success = __('Messages were deleted.');
        }
        foreach ($notices as $notice) {
            if ((int)$notice->user_id === 0 || (int)$notice->user_id === -1 || isset($notice->notices_subscription->id)) {
                if (isset($notice->notices_status->id) && !empty($notice->notices_status->id)
                    && ((int)$notice->notices_status->status === 1 || $data['button'] == 'remove')) {
                    $this->NoticesStatuses->save($this->NoticesStatuses->patchEntity($notice->notices_status,
                        $field));
                } elseif (!isset($notice->notices_status->id) || empty($notice->notices_status->id)) {
                    $newField = [
                        'notice_id' => $notice->id,
                        'user_id' => $userId,
                        'status' => 0,
                        'is_deleted' => 0
                    ];
                    if ($data['button'] == 'remove') {
                        $newField = [
                            'notice_id' => $notice->id,
                            'user_id' => $userId,
                            'status' => 1,
                            'is_deleted' => 1
                        ];
                    }
                    $this->NoticesStatuses->save($this->NoticesStatuses->newEntity($newField));
                }
            } elseif ((int)$notice->user_id > 0 && ((int)$notice->status === 1 || $data['button'] == 'remove')) {
                $this->Notices->save($this->Notices->patchEntity($notice, $field));
            }
        }
        $this->Flash->success($success);
        return $this->redirect($this->referer());
    }

    public function mark($noticeId)
    {
        $this->processSelect($noticeId, 0, 1);
        $this->Flash->success(__('Message were mark as read.'));
        return $this->redirect($this->referer());
    }

    public function unmark($noticeId)
    {
        $this->processSelect($noticeId, 1, 0);
        $this->Flash->success(__('Message were mark as unread.'));
        return $this->redirect($this->referer());
    }

    public function remove($noticeId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $notice = $this->Notices->getNoticeSingleSelect($noticeId, $userId);
        $field = ['is_deleted' => 1];
        if ((int)$notice->user_id === 0 || (int)$notice->user_id === -1 || isset($notice->notices_subscription->id)) {
            if (isset($notice->notices_status->id) && !empty($notice->notices_status->id)) {
                $this->NoticesStatuses->save($this->NoticesStatuses->patchEntity($notice->notices_status,
                    $field));
            } elseif (!isset($notice->notices_status->id) || empty($notice->notices_status->id)) {
                $newField = [
                    'notice_id' => $notice->id,
                    'user_id' => $userId,
                    'status' => 1,
                    'is_deleted' => 1
                ];
                $this->NoticesStatuses->save($this->NoticesStatuses->newEntity($newField));
            }
        } else {
            $this->Notices->save($this->Notices->patchEntity($notice, $field));
        }
        $this->Flash->success(__('Message was deleted.'));
        return $this->redirect(['action' => 'index']);
    }

    private function processSelect($noticeId, $status, $noticeStatus)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $notice = $this->Notices->getNoticeSingleSelect($noticeId, $userId);
        if (!isset($notice->id)) {
            return;
        }
        $field = ['status' => $status];
        if ((int)$notice->user_id === 0 || (int)$notice->user_id === -1 || (isset($notice->notices_subscription->id) && ((int)$notice->user_id != $userId)) ) {
            if (isset($notice->notices_status->id) && !empty($notice->notices_status->id)
                && ((int)$notice->notices_status->status === $noticeStatus)) {
                $this->NoticesStatuses->save($this->NoticesStatuses->patchEntity($notice->notices_status,
                    $field));
            } elseif (!isset($notice->notices_status->id) || empty($notice->notices_status->id)) {
                $newField = [
                    'notice_id' => $notice->id,
                    'user_id' => $userId,
                    'status' => $status,
                    'is_deleted' => 0
                ];
                $this->NoticesStatuses->save($this->NoticesStatuses->newEntity($newField));
            }
        } elseif ((int)$notice->user_id > 0 && ((int)$notice->status === $noticeStatus)) {
            $this->Notices->save($this->Notices->patchEntity($notice, $field));
        }
    }
}
