<?php


namespace Reports\Controller;

use ADmad\SocialAuth\Model\Table\SocialProfilesTable;
use Articles\Controller\ArticlesController;
use Articles\Model\Table\ArticlesTable;
use Cake\Event\Event;
use Croogo\Users\Model\Table\RolesBlocksTable;
use Croogo\Users\Model\Table\RolesTable;
use Croogo\Users\Model\Table\UsersTable;
use Notes\Model\Table\AcceptsCommentsTable;
use Notes\Model\Table\AcceptsTable;
use Notes\Model\Table\NotesTable;
use Notes\Model\Table\RejectsCommentsTable;
use Notes\Model\Table\RejectsTable;
use Notes\Model\Table\ReviewsCommentsTable;
use Notices\Event\NoticesManager;
use Reports\Model\Table\ReportsHistoryTable;
use Reports\Model\Table\ReportsTable;

/**
 * Class ReportsController
 *
 * @package Reports\Controller\
 * @property ArticlesTable Articles
 * @property ReportsTable Reports
 * @property ReportsHistoryTable ReportsHistory
 * @property AcceptsTable Accepts
 * @property RejectsTable Rejects
 * @property NotesTable Notes
 * @property UsersTable Users
 * @property RolesTable Roles
 * @property RolesBlocksTable RolesBlocks
 * @property AcceptsCommentsTable AcceptsComments
 * @property RejectsCommentsTable RejectsComments
 * @property ReviewsCommentsTable ReviewsComments
 * @property SocialProfilesTable SocialProfiles
 */
class ReportsController extends AppController
{
    public $helpers = ['Reports.Reports'];

    /**
     * Report's read/unread statuses
     */
    const REPORT_READ = 0;
    const REPORT_UNREAD = 1;

    /**
     * Report levels
     */
    const REPORT_LEVEL_I = 1;
    const REPORT_LEVEL_II = 2;

    /**
     * Report's statuses
     */
    const REPORT_STATUS_WAITING = 0;
    const REPORT_STATUS_ACCEPTED = 2;
    const REPORT_STATUS_REJECTED = 3;
    const REPORT_STATUS_CONTACT = 4;
    const REPORT_STATUS_OBJECTION = 5;
    const REPORT_STATUS_USER_BLOCK = 6;
    const REPORT_STATUS_USER_PERMISSIONS_BLOCK = 7;
    const REPORT_STATUS_CONTENT_REMOVE = 8;
    const REPORT_STATUS_COMMENT_REMOVE = 9;
    const REPORT_STATUS_REJECT_REMOVE = 10;

    static $typesMap = [
        'waiting' => self::REPORT_STATUS_WAITING,
        'accepted' => self::REPORT_STATUS_ACCEPTED,
        'rejected' => self::REPORT_STATUS_REJECTED
    ];

    /**
     * Report's types
     */
    const REPORT_TYPE_USER = 1;
    const REPORT_TYPE_CONTENT = 2;
    const REPORT_TYPE_RESOLVE = 3;

    /**
     * Report's content types for "report_content_type_id" field
     */
    const REPORT_CONTENT_TYPE_NEWS = 1;
    const REPORT_CONTENT_TYPE_QUESTION = 2;
    const REPORT_CONTENT_TYPE_ANSWER_QUESTION = 3;
    const REPORT_CONTENT_TYPE_ANSWER_COMMENT_QUESTION = 4;
    const REPORT_CONTENT_TYPE_COMMENT_NEWS = 5;
    const REPORT_CONTENT_TYPE_COMMENT_COMMENT = 6;
    const REPORT_CONTENT_TYPE_REJECT = 7;
    const REPORT_CONTENT_TYPE_REJECT_COMMENT = 8;

    /**
     * Report content reasons
     */
    const REPORT_CONTENT_REASON_MISSPELL = 1;
    const REPORT_CONTENT_REASON_PLAGIARISM = 2;
    const REPORT_CONTENT_REASON_OTHER = 3;
    const REPORT_USER_REASON_INAPPROPRIATE_NAME = 11;
    const REPORT_USER_REASON_INAPPROPRIATE_PHOTO = 12;
    const REPORT_USER_REASON_INAPPROPRIATE_DESCRIPTION = 13;
    const REPORT_USER_REASON_INAPPROPRIATE_CONTENT = 14;
    const REPORT_USER_REASON_FAKE_ACCOUNT = 15;
    const REPORT_USER_REASON_OTHER = 16;
    const REPORT_RESOLVE_REASON_OTHER = 21;

    const REPORT_TIME_TO_CONTACT = 86400;

    /**
     * @var array
     */
    private static $disableActions = [
        'content',
        'accept',
        'reject',
        'comment',
        'commentComment',
        'acceptComment',
        'rejectComment',
        'objection',
        'resolve'
    ];

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
        $this->loadModel('Reports.Reports');
        $this->loadModel('Reports.ReportsHistory');
        $this->loadModel('Notes.Accepts');
        $this->loadModel('Notes.Rejects');
        $this->loadModel('Notes.Notes');
        $this->loadModel('Croogo/Users.Users');
        $this->loadModel('Croogo/Users.Roles');
        $this->loadModel('Croogo/Users.RolesBlocks');
        $this->loadModel('Notes.AcceptsComments');
        $this->loadModel('Notes.RejectsComments');
        $this->loadModel('Notes.ReviewsComments');
        $this->loadModel('ADmad/SocialAuth.SocialProfiles');
        $this->loadComponent('Paginator');
    }

    private function getSearchFieldOptions()
    {
        return [
            'status' => [
                'waiting' => __('Waiting'),
                'accepted' => __('Accepted'),
                'rejected' => __('Rejected'),
                'verification' => __('Waiting for verification'),
            ]
        ];
    }

    public function index()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $queryParams = $this->request->getQueryParams();
        $conditions = ['Reports.user_id' => $userId];
        if (isset($queryParams['status']) && isset(self::$typesMap[$queryParams['status']])) {
            $conditions['report_status'] = self::$typesMap[$queryParams['status']];
        }
        $items = $this->Paginator->paginate(
            $this->Reports->getReportsForIndex($conditions),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'items' => $items,
            'fieldsOptions' => $this->getSearchFieldOptions(),
            'socialProfileExists' => $this->SocialProfiles->exists([
                'email' => $this->request->getSession()->read('Auth.User.username')
            ])
        ]);
    }

    public function waiting()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $created = $this->request->getSession()->read('Auth.User.created');
        $items = $this->Paginator->paginate(
            $this->Reports->getReportsForWaiting($userId, $this->userGlobalPermissions, $created),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'items' => $items
        ]);
    }

    public function taken()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $created = $this->request->getSession()->read('Auth.User.created');
        $items = $this->Paginator->paginate(
            $this->Reports->getReportsForTaken($userId, $this->userGlobalPermissions, $created),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'items' => $items
        ]);
    }

    public function cases()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $items = $this->Paginator->paginate(
            $this->Reports->getReportsForCases($userId, $this->userGlobalPermissions),
            [
                'order' => ['created' => 'desc'],
                'limit' => 15
            ]
        );
        $this->set([
            'items' => $items
        ]);
    }

    public function view($reportId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $item = $this->Reports->getReportForView($userId, $reportId);
        if (!isset($item->id) || empty($item->id)) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
        if ((int)$item->report_status === self::REPORT_STATUS_ACCEPTED
            || (int)$item->report_status === self::REPORT_STATUS_REJECTED) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
        $this->set([
            'item' => $item
        ]);
        if ((int)$item->report_type_id === ReportsController::REPORT_TYPE_USER) {
            $this->set([
                'rolesPermissions' => $this->Roles->getRolesForView()
            ]);
            $this->render('Reports/view_report_type_user');
        } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_CONTENT) {
            $this->render('Reports/view_report_type_content');
        } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_RESOLVE) {
            $this->render('Reports/view_report_type_resolve');
        }
    }

    public function content($contentId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        if ($this->request->is('ajax')) {

            $content = $this->Articles->getForReportContent($contentId);
            $reportType = $this->request->getData('type');
            $reportContent = $this->request->getData('content_input');
            if ((int)$reportType === self::REPORT_CONTENT_REASON_OTHER) {
                $reportContent = $this->request->getData('content_text');
            } elseif ($reportContent === '') {
                $reportContent = __('Misspellings and errors (Editing and proofreading need)');
            }

            if ((bool)$result = $this->validateItem($content)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportType($reportType)) {
                $response = $result;
            } elseif ((int)$reportType === self::REPORT_CONTENT_REASON_PLAGIARISM
                && (bool)$result = $this->validateReportInput($reportContent)) {
                $response = $result;
            } elseif ((int)$reportType === self::REPORT_CONTENT_REASON_OTHER
                && (bool)$result = $this->validateReportContent($reportContent)) {
                $response = $result;
            } else {
                $contentTypeId = self::REPORT_CONTENT_TYPE_NEWS;
                if ((int)$content->type_id === ArticlesController::TYPE_QUESTION) {
                    $contentTypeId = self::REPORT_CONTENT_TYPE_QUESTION;
                }
                $report = $this->Reports->newEntity([
                    'user_id' => $userId,
                    'report_type_id' => self::REPORT_TYPE_CONTENT,
                    'report_content_type_id' => $contentTypeId,
                    'content_id' => $contentId,
                    'message' => json_encode([
                        'reason_type' => $reportType,
                        'reason_content' => $reportContent,
                        'description' => $content->title
                    ]),
                    'status' => self::REPORT_READ
                ]);
                if ($this->Reports->save($report)) {
                    $this->getEventManager()->on(new NoticesManager());

                    $event = new Event('Notice.type.mass', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_CONTENT,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $content->title,
                                'reason' => $reportContent,
                                'content_id' => $contentId,
                                'type_id' => $content->type_id,
                                'user_id' => $content->user_id
                            ]
                        ]),
                        'content_id' => $contentId,
                        'content_type_id' => NoticesManager::TYPE_REPORT
                    ]);
                    $this->getEventManager()->dispatch($event);
                    $event_self = new Event('Notice.type.self', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_CONTENT,
                        'created_by' => $userId,
                        'user_id' => $content->user_id,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $content->title,
                                'reason' => $reportContent,
                                'content_id' => $contentId,
                                'type_id' => $content->type_id,
                                'user_id' => $content->user_id
                            ]
                        ]),
                        'content_id' => $contentId,
                        'content_type_id' => NoticesManager::TYPE_REPORT
                    ]);
                    $this->getEventManager()->dispatch($event_self);
                    $response = [
                        'success' => 1,
                        'message' => __('Report has been saved.')
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add report.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function comment($commentId, $reportContentTypeId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');

            $comment = $this->Notes->getForReportComment($commentId);
            $reportType = $this->request->getData('type');
            $reportContent = $this->request->getData('content_input');
            if ((int)$reportType === self::REPORT_CONTENT_REASON_OTHER) {
                $reportContent = $this->request->getData('content_text');
            } elseif ($reportContent === '') {
                $reportContent = __('Misspellings and errors (Editing and proofreading need)');
            }
            if ((bool)$result = $this->validateItem($comment)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportType($reportType)) {
                $response = $result;
            } elseif ((int)$reportType === self::REPORT_CONTENT_REASON_PLAGIARISM
                && (bool)$result = $this->validateReportInput($reportContent)) {
                $response = $result;
            } elseif ((int)$reportType === self::REPORT_CONTENT_REASON_OTHER
                && (bool)$result = $this->validateReportContent($reportContent)) {
                $response = $result;
            } elseif (!in_array((int)$reportContentTypeId, [
                self::REPORT_CONTENT_TYPE_ANSWER_QUESTION,
                self::REPORT_CONTENT_TYPE_ANSWER_COMMENT_QUESTION,
                self::REPORT_CONTENT_TYPE_COMMENT_NEWS,
                self::REPORT_CONTENT_TYPE_COMMENT_COMMENT
            ])) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid type.')
                ];
            } else {
                $reportContent = $this->request->getData('content_input');
                if ((int)$reportType === self::REPORT_CONTENT_REASON_OTHER) {
                    $reportContent = $this->request->getData('content_text');
                } elseif ($reportContent === '') {
                    $reportContent = __('Misspellings and errors (Editing and proofreading need)');
                }
                $report = $this->Reports->newEntity([
                    'user_id' => $userId,
                    'report_type_id' => self::REPORT_TYPE_CONTENT,
                    'report_content_type_id' => $reportContentTypeId,
                    'content_id' => $commentId,
                    'message' => json_encode([
                        'reason_type' => (int)$reportType,
                        'reason_content' => $reportContent,
                        'description' => $comment->description
                    ]),
                    'status' => self::REPORT_READ
                ]);
                if ($this->Reports->save($report)) {
                    $this->getEventManager()->on(new NoticesManager());
                    if ($comment->parent_id) {
                        $event = new Event('Notice.type.mass', $this, [
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'content' => $comment->description,
                                    'reason' => $reportContent,
                                    'content_id' => $comment->article_id
                                ]
                            ]),
                            'content_id' => $commentId,
                            'content_type_id' => NoticesManager::TYPE_COMMENT
                        ]);
                        $this->getEventManager()->dispatch($event);
                        $event_self = new Event('Notice.type.self', $this, [
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                            'user_id' => $comment->user_id,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'user_id' => $comment->user_id,
                                    'content' => $comment->description,
                                    'reason' => $reportContent,
                                    'content_id' => $comment->article_id,
                                    'parent_id' => $comment->parent_id,
                                    'comment_id' => $commentId,
                                ]
                            ]),
                            'content_id' => $commentId,
                            'content_type_id' => NoticesManager::TYPE_COMMENT
                        ]);
                        $this->getEventManager()->dispatch($event_self);
                    } else {
                        $event = new Event('Notice.type.mass', $this, [
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_REPLY,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'content' => $comment->description,
                                    'reason' => $reportContent,
                                    'content_id' => $comment->article_id
                                ]
                            ]),
                            'content_id' => $commentId,
                            'content_type_id' => NoticesManager::TYPE_COMMENT
                        ]);
                        $this->getEventManager()->dispatch($event);
                        $event_self = new Event('Notice.type.self', $this, [
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_REPLY,
                            'user_id' => $comment->user_id,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'user_id' => $comment->user_id,
                                    'content' => $comment->description,
                                    'reason' => $reportContent,
                                    'content_id' => $comment->article_id,
                                    'note_id' => $commentId,
                                    'type_id' => $comment->article['type_id']
                                ]
                            ]),
                            'content_id' => $commentId,
                            'content_type_id' => NoticesManager::TYPE_COMMENT
                        ]);
                        $this->getEventManager()->dispatch($event_self);
                    }
                    $response = [
                        'success' => 1,
                        'message' => __('Report has been saved.')
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add report.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function reject($rejectId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        if ($this->request->is('ajax')) {

            $reportType = $this->request->getData('type');
            $reportContent = $this->request->getData('content');
            $reject = $this->Rejects->find()
                ->select(['id', 'article_id', 'description'])
                ->where(['id' => $rejectId])
                ->first();

            if ((bool)$result = $this->validateItem($reject)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportType($reportType)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportContent($reportContent)) {
                $response = $result;
            } else {
                $report = $this->Reports->newEntity([
                    'user_id' => $userId,
                    'report_type_id' => self::REPORT_TYPE_CONTENT,
                    'report_content_type_id' => self::REPORT_CONTENT_TYPE_REJECT,
                    'content_id' => $rejectId,
                    'message' => json_encode([
                        'reason_type' => $reportType,
                        'reason_content' => $reportContent,
                        'description' => $reject->description
                    ]),
                    'status' => self::REPORT_READ
                ]);
                if ($this->Reports->save($report)) {
                    $event = new Event('Notice.type.mass', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_REJECT,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $reject->description,
                                'reason' => $reportContent,
                                'content_id' => $reject->article_id
                            ]
                        ]),
                        'content_id' => $rejectId,
                        'content_type_id' => NoticesManager::TYPE_REPORT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                    $response = [
                        'success' => 1,
                        'message' => __('Report has been saved.')
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add report.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function rejectComment($commentId)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        if ($this->request->is('ajax')) {
            $reportType = $this->request->getData('type');
            $reportContent = $this->request->getData('content');

            $comment = $this->RejectsComments->find()
                ->select(['id', 'article_id', 'description', 'user_id'])
                ->where(['id' => $commentId])
                ->first();

            if ((bool)$result = $this->validateItem($comment)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportType($reportType)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportContent($reportContent)) {
                $response = $result;
            } else {
                $report = $this->Reports->newEntity([
                    'user_id' => $userId,
                    'report_type_id' => self::REPORT_TYPE_CONTENT,
                    'report_content_type_id' => self::REPORT_CONTENT_TYPE_REJECT_COMMENT,
                    'content_id' => $commentId,
                    'message' => json_encode([
                        'reason_type' => $reportType,
                        'reason_content' => $reportContent,
                        'description' => $comment->description
                    ]),
                    'status' => self::REPORT_READ
                ]);
                if ($this->Reports->save($report)) {
                    $event = new Event('Notice.type.mass', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $comment->description,
                                'reason' => $reportContent,
                                'content_id' => $comment->article_id,
                            ]
                        ]),
                        'content_id' => $commentId,
                        'content_type_id' => NoticesManager::TYPE_REJECT_COMMENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                    $event = new Event('Notice.type.self', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                        'created_by' => $userId,
                        'user_id' => $comment->user_id,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $comment->description,
                                'reason' => $reportContent,
                                'content_id' => $comment->article_id,
                            ]
                        ]),
                        'content_id' => $commentId,
                        'content_type_id' => NoticesManager::TYPE_REJECT_COMMENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                    $response = [
                        'success' => 1,
                        'message' => __('Report has been saved.')
                    ];
                    $this->Flash->success($response['message']);
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add report.')
                    ];
                    $this->Flash->error($response['message']);
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function objection($reportId)
    {
        if (!$this->request->is('ajax')) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }

        $userId = $this->request->getSession()->read('Auth.User.id');
        $report = $this->Reports->getReportForObjection($userId, $reportId);
        $data = $this->request->getData();

        if ((bool)$result = $this->validateItem($report)) {
            $response = $result;
        } elseif ((bool)$result = $this->validateReportContent($data['description'])) {
            $response = $result;
        } else {
            $reportMessage = json_decode($report->message, true);
            $reportMessage[ReportsController::REPORT_LEVEL_II] = [
                'report_content' => $data['description']
            ];
            if ($this->Reports->save($this->Reports->patchEntity($report, [
                'report_level' => self::REPORT_LEVEL_II,
                'status' => self::REPORT_READ,
                'report_status' => self::REPORT_STATUS_WAITING,
                'moderated_by' => 0,
                'message' => json_encode($reportMessage)
            ]))) {
                $this->saveReportHistory(
                    $reportId,
                    $userId,
                    $data['description'],
                    self::REPORT_STATUS_OBJECTION
                );
                $response = [
                    'success' => 1,
                    'message' => __('Objection has been added.')
                ];
                $this->Flash->success($response['message']);
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('Error while adding objection.')
                ];
                $this->Flash->error($response['message']);
            }
        }
        $this->set('response', $response);
        $this->set('_serialize', 'response');
    }

    public function cancel($reportId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $data = $this->request->getData();
            $report = $this->Reports->getReportForContact($reportId);

            if ((bool)$result = $this->validateItem($report)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportContent($data['description'])) {
                $response = $result;
            } else {
                $report = $this->Reports->patchEntity($report, [
                    'status' => self::REPORT_UNREAD,
                    'report_status' => self::REPORT_STATUS_REJECTED,
                    'moderated_by' => $userId
                ]);
                if ($this->Reports->save($report)) {
                    $this->saveReportHistory(
                        $reportId,
                        $userId,
                        $data['description'],
                        self::REPORT_STATUS_REJECTED
                    );
                    $response = [
                        'success' => 1,
                        'message' => __('Report has been rejected.')
                    ];

                    $noticeUserId = false;
                    $typeContent = $contentText ='';
                    if ((int)$report->report_type_id === self::REPORT_TYPE_USER) {
                        $noticeUserId = $report->reported_user->id;
                        $typeContent = 'USER';
                    } elseif ((int)$report->report_type_id === self::REPORT_TYPE_CONTENT) {
                        if (in_array((int)$report->report_content_type_id, [
                            self::REPORT_CONTENT_TYPE_NEWS,
                            self::REPORT_CONTENT_TYPE_QUESTION
                        ])) {
                            $noticeUserId = $report->reported_content->user_id;
                            $typeContent = 'ARTICLE';
                            $contentText = $report->reported_content->title;
                        } else {
                            $noticeUserId = $report->reported_comment->user_id;
                            $contentText = $report->reported_comment->description;
                            $typeContent = 'COMMENT';
                        }
                    } elseif ((int)$report->report_type_id === self::REPORT_TYPE_RESOLVE) {
                        $noticeUserId = $report->reported_resolve->user_id;
                        $typeContent = 'RESOLVE';
                    }
                    if ($noticeUserId) {
                        $event = new Event('Notice.type.self', $this, [
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_DECISION,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'content' => $data['description'],
                                    'type_decision' => 'REJECT',
                                    'type_content' => $typeContent,
                                    'content_reject_id' => (int)$report->content_id,
                                    'content_text' => $contentText
                                ]
                            ]),
                            'content_id' => $reportId,
                            'user_id' => $noticeUserId,
                            'content_type_id' => NoticesManager::TYPE_REPORT
                        ]);
                        $this->getEventManager()->on(new NoticesManager());
                        $this->getEventManager()->dispatch($event);
                    }
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Error while rejecting report.')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function contact($reportId)
    {
        if ($this->request->is('ajax')) {

            $userId = $this->request->getSession()->read('Auth.User.id');
            $data = $this->request->getData();
            $report = $this->Reports->getReportForContact($reportId);

            if ((bool)$result = $this->validateItem($report)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportContent($data['description'])) {
                $response = $result;
            } else {
                $report = $this->Reports->patchEntity($report, [
                    'status' => self::REPORT_UNREAD,
                    'report_contact_time' => time()
                ]);
                if ($this->Reports->save($report)) {
                    $this->saveReportHistory(
                        $reportId,
                        $userId,
                        $data['description'],
                        self::REPORT_STATUS_CONTACT
                    );
                    $noticeUserId = false;
                    if ((int)$report->report_type_id === self::REPORT_TYPE_USER) {
                        $noticeUserId = $report->reported_user->id;
                    } elseif ((int)$report->report_type_id === self::REPORT_TYPE_CONTENT) {
                        if (in_array((int)$report->report_content_type_id, [
                            self::REPORT_CONTENT_TYPE_NEWS,
                            self::REPORT_CONTENT_TYPE_QUESTION
                        ])) {
                            $noticeUserId = $report->reported_content->user_id;
                        } else {
                            $noticeUserId = $report->reported_comment->user_id;
                        }
                    } elseif ((int)$report->report_type_id === self::REPORT_TYPE_RESOLVE) {
                        $noticeUserId = $report->reported_resolve->user_id;
                    }
                    if ($noticeUserId) {
                        $event = new Event('Notice.type.self', $this, [
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_ADMIN_CONTACT,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'content' => $data['description']
                                ]
                            ]),
                            'content_id' => $report->id,
                            'user_id' => $noticeUserId,
                            'content_type_id' => NoticesManager::TYPE_REPORT
                        ]);
                        $this->getEventManager()->on(new NoticesManager());
                        $this->getEventManager()->dispatch($event);
                    }
                    $response = [
                        'success' => 1,
                        'message' => __('Message has been send.')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Error while sending message.')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function acceptContent($reportId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $report = $this->Reports->getReportForAcceptContent($reportId);

            if ((bool)$result = $this->validateItem($report)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateItem($report->reported_resolve)) {
                $response = $result;
            } else {
                $article = $report->reported_resolve;
                $data = [
                    'is_visible' => 0,
                    'counter_accepts' => 0,
                    'counter_rejects' => 0,
                    'published' => null
                ];
                $article = $this->Articles->patchEntity($article, $data);
                if ($result = $this->Articles->save($article, ['associated' => true])) {
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
                    $this->saveReportHistory(
                        $reportId,
                        $userId,
                        '',
                        self::REPORT_STATUS_ACCEPTED
                    );
                    $response = [
                        'success' => 1,
                        'message' => __('Report has been accepted.')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Error while accepting report.')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function removeContent($reportId)
    {
        if ($this->request->is('ajax')) {

            $userId = $this->request->getSession()->read('Auth.User.id');
            $data = $this->request->getData();
            $report = $this->Reports->getReportForContact($reportId);

            if ((bool)$result = $this->validateItem($report)) {
                $response = $result;
            } elseif ((int)$report->report_type_id !== self::REPORT_TYPE_CONTENT) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
            } elseif ((bool)$result = $this->validateReportContent($data['description'])) {
                $response = $result;
            } else {
                $report = $this->Reports->patchEntity($report, [
                    'status' => self::REPORT_UNREAD,
                    'report_status' => self::REPORT_STATUS_CONTENT_REMOVE,
                    'moderated_by' => $userId
                ]);
                if ($this->Reports->save($report)) {
                    if ((int)$report->report_content_type_id === self::REPORT_CONTENT_TYPE_NEWS
                        || (int)$report->report_content_type_id === self::REPORT_CONTENT_TYPE_QUESTION) {
                        $article = $this->Articles->getArticleForRemove($report->content_id);
                        if ($this->Articles->save($this->Articles->patchEntity($article, [
                            'is_deleted' => 1
                        ]))) {
                            $this->saveReportHistory(
                                $reportId,
                                $userId,
                                $data['description'],
                                self::REPORT_STATUS_CONTENT_REMOVE
                            );
                            $response = [
                                'success' => 1,
                                'message' => __('Content has been removed.')
                            ];
                            $noticeUserId = false;
                            $contentText = '';
                            if ((int)$report->report_type_id === self::REPORT_TYPE_USER) {
                                $noticeUserId = $report->reported_user->id;
                            } elseif ((int)$report->report_type_id === self::REPORT_TYPE_CONTENT) {
                                if (in_array((int)$report->report_content_type_id, [
                                    self::REPORT_CONTENT_TYPE_NEWS,
                                    self::REPORT_CONTENT_TYPE_QUESTION
                                ])) {
                                    $noticeUserId = $report->reported_content->user_id;
                                    $contentText = $report->reported_content->title;
                                } else {
                                    $noticeUserId = $report->reported_comment->user_id;
                                    $contentText = $report->reported_comment->description;
                                }
                            } elseif ((int)$report->report_type_id === self::REPORT_TYPE_RESOLVE) {
                                $noticeUserId = $report->reported_resolve->user_id;
                            }
                            if ($noticeUserId) {
                                $event = new Event('Notice.type.self', $this, [
                                    'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_DECISION,
                                    'created_by' => $userId,
                                    'content_message' => json_encode([
                                        'message' => [
                                            'content' => $data['description'],
                                            'type_decision' => 'DELETE',
                                            'type_content' => 'ARTICLE',
                                            'content_deleted_id' => (int)$report->content_id,
                                            'content_text' => $contentText
                                        ]
                                    ]),
                                    'content_id' => $reportId,
                                    'user_id' => $noticeUserId,
                                    'content_type_id' => NoticesManager::TYPE_REPORT
                                ]);
                                $this->getEventManager()->on(new NoticesManager());
                                $this->getEventManager()->dispatch($event);
                            }


                        } else {
                            $response = [
                                'success' => 0,
                                'message' => __('Error while removing content.')
                            ];
                        }
                    } elseif ((int)$report->report_content_type_id === self::REPORT_CONTENT_TYPE_REJECT) {
                        $reject = $this->Rejects->getRejectForRemove($report->content_id);
                        if ($this->Rejects->save($this->Rejects->patchEntity($reject, [
                            'is_deleted' => 1
                        ]))) {
                            $this->saveReportHistory(
                                $reportId,
                                $userId,
                                $data['description'],
                                self::REPORT_STATUS_REJECT_REMOVE);
                            $response = [
                                'success' => 1,
                                'message' => __('Reject has been removed.')
                            ];
                        } else {
                            $response = [
                                'success' => 0,
                                'message' => __('Error while removing reject.')
                            ];
                        }
                    } elseif ((int)$report->report_content_type_id === self::REPORT_CONTENT_TYPE_REJECT_COMMENT) {
                        $comment = $this->RejectsComments->getForReportRemove($report->content_id);
                        if ($this->RejectsComments->save($this->RejectsComments->patchEntity($comment, [
                            'is_deleted' => 1,
                            'is_deleted_by' => $userId
                        ]))) {
                            $this->saveReportHistory(
                                $reportId,
                                $userId,
                                $data['description'],
                                self::REPORT_STATUS_COMMENT_REMOVE
                            );
                            $response = [
                                'success' => 1,
                                'message' => __('Comment has been removed.')
                            ];
                            $noticeUserId = false;
                            $contentText = '';
                            if ((int)$report->report_type_id === self::REPORT_TYPE_USER) {
                                $noticeUserId = $report->reported_user->id;
                            } elseif ((int)$report->report_type_id === self::REPORT_TYPE_CONTENT) {
                                if (in_array((int)$report->report_content_type_id, [
                                    self::REPORT_CONTENT_TYPE_NEWS,
                                    self::REPORT_CONTENT_TYPE_QUESTION
                                ])) {
                                    $noticeUserId = $report->reported_content->user_id;
                                    $contentText = $report->reported_content->title;
                                } else {
                                    $noticeUserId = $report->reported_comment->user_id;
                                    $contentText = $report->reported_comment->description;
                                }
                            } elseif ((int)$report->report_type_id === self::REPORT_TYPE_RESOLVE) {
                                $noticeUserId = $report->reported_resolve->user_id;
                            }
                            if ($noticeUserId) {
                                $event = new Event('Notice.type.self', $this, [
                                    'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_DECISION,
                                    'created_by' => $userId,
                                    'content_message' => json_encode([
                                        'message' => [
                                            'content' => $data['description'],
                                            'type_decision' => 'DELETE',
                                            'type_content' => 'COMMENT',
                                            'content_deleted_id' => (int)$report->content_id,
                                            'content_text' => $contentText
                                        ]
                                    ]),
                                    'content_id' => $reportId,
                                    'user_id' => $noticeUserId,
                                    'content_type_id' => NoticesManager::TYPE_REPORT
                                ]);
                                $this->getEventManager()->on(new NoticesManager());
                                $this->getEventManager()->dispatch($event);
                            }
                        } else {
                            $response = [
                                'success' => 0,
                                'message' => __('Error while removing comment.')
                            ];
                        }
                    } else {
                        $note = $this->Notes->getForReportRemove($report->content_id);
                        if ($this->Notes->save($this->Notes->patchEntity($note, [
                            'is_deleted' => 1,
                            'is_deleted_by' => $userId
                        ]))) {
                            $this->saveReportHistory(
                                $reportId,
                                $userId,
                                $data['description'],
                                self::REPORT_STATUS_COMMENT_REMOVE
                            );
                            $response = [
                                'success' => 1,
                                'message' => __('Comment has been removed.')
                            ];
                            $noticeUserId = false;
                            $contentText = '';
                            if ((int)$report->report_type_id === self::REPORT_TYPE_USER) {
                                $noticeUserId = $report->reported_user->id;
                            } elseif ((int)$report->report_type_id === self::REPORT_TYPE_CONTENT) {
                                if (in_array((int)$report->report_content_type_id, [
                                    self::REPORT_CONTENT_TYPE_NEWS,
                                    self::REPORT_CONTENT_TYPE_QUESTION
                                ])) {
                                    $noticeUserId = $report->reported_content->user_id;
                                    $contentText = $report->reported_content->title;
                                } else {
                                    $noticeUserId = $report->reported_comment->user_id;
                                    $contentText = $report->reported_comment->description;
                                }
                            } elseif ((int)$report->report_type_id === self::REPORT_TYPE_RESOLVE) {
                                $noticeUserId = $report->reported_resolve->user_id;
                            }
                            if ($noticeUserId) {
                                $event = new Event('Notice.type.self', $this, [
                                    'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_DECISION,
                                    'created_by' => $userId,
                                    'content_message' => json_encode([
                                        'message' => [
                                            'content' => $data['description'],
                                            'type_decision' => 'DELETE',
                                            'type_content' => 'COMMENT',
                                            'content_deleted_id' => (int)$report->content_id,
                                            'content_text' => $contentText
                                        ]
                                    ]),
                                    'content_id' => $reportId,
                                    'user_id' => $noticeUserId,
                                    'content_type_id' => NoticesManager::TYPE_REPORT
                                ]);
                                $this->getEventManager()->on(new NoticesManager());
                                $this->getEventManager()->dispatch($event);
                            }
                        } else {
                            $response = [
                                'success' => 0,
                                'message' => __('Error while removing comment.')
                            ];
                        }
                    }
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Error while removing content.')
                    ];
                }
            }
            $this->Flash->success($response['message']);
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function user()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        if ($this->request->is('ajax')) {

            $data = $this->request->getData();
            $user = $this->Users->getUserForReport($data['user_id']);

            if ((bool)$result = $this->validateItem($user)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateReportUserType($data['reason'])) {
                $response = $result;
            } elseif ((int)$data['reason'] === self::REPORT_USER_REASON_OTHER
                && (bool)$result = $this->validateReportContent($data['description'])) {
                $response = $result;
            } else {
                if ((int)$data['reason'] !== self::REPORT_USER_REASON_OTHER) {
                    $message = self::getReportsTypesTranslations()[$data['reason']];
                } else {
                    $message = $data['description'];
                }
                $report = $this->Reports->newEntity([
                    'user_id' => $userId,
                    'report_type_id' => self::REPORT_TYPE_USER,
                    'report_content_type_id' => 0,
                    'content_id' => $user->id,
                    'message' => json_encode([
                        'reason_type' => $data['reason'],
                        'reason_content' => $data['description'],
                        'description' => ''
                    ]),
                    'status' => self::REPORT_READ
                ]);
                if ($this->Reports->save($report)) {
                    $this->getEventManager()->on(new NoticesManager());

                    $event = new Event('Notice.type.mass', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_USER,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $data['reason'],
                                'reason' => $message,
                                'user_id' => $data['user_id']
                            ]
                        ]),
                        'content_id' => $user->id,
                        'content_type_id' => NoticesManager::TYPE_REPORT
                    ]);
                    $this->getEventManager()->dispatch($event);
                    $event = new Event('Notice.type.self', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_USER,
                        'created_by' => $userId,
                        'user_id' => $user->id,
                        'content_message' => json_encode([
                            'message' => [
                                'content' => $data['reason'],
                                'reason' => $message,
                                'user_id' => $data['user_id']
                            ]
                        ]),
                        'content_id' => $user->id,
                        'content_type_id' => NoticesManager::TYPE_REPORT
                    ]);
                    $this->getEventManager()->dispatch($event);
                    $response = [
                        'success' => 1,
                        'message' => __('Report has been saved.')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to add report.')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function userBlock()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        if ($this->request->is('ajax')) {

            $requestData = $this->request->getData();
            $reason = trim(htmlspecialchars($requestData['reason']));
            $report = $this->Reports->getReportByIdTypeUser($requestData['report_id']);
            $user = $this->Users->getUserForBlock($requestData['user_id']);

            if ((bool)$result = $this->validateItem($user)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateItem($report)) {
                $response = $result;
            } elseif (empty($reason)) {
                $response = [
                    'success' => 0,
                    'message' => __('You must fill reason of block.')
                ];
            } else {
                $user = $this->Users->patchEntity($user, [
                    'is_blocked' => 1,
                    'is_blocked_time' => time(),
                    'is_blocked_period' => $requestData['period'],
                    'is_blocked_reason' => $reason,
                    'is_blocked_by' => $userId
                ]);
                if ($this->Users->save($user)) {
                    $report = $this->Reports->patchEntity($report, [
                        'status' => self::REPORT_UNREAD,
                        'report_status' => self::REPORT_STATUS_USER_BLOCK,
                        'moderated_by' => $userId
                    ]);
                    if ($this->Reports->save($report)) {
                        $this->ReportsHistory->save($this->ReportsHistory->newEntity([
                            'report_id' => $report->id,
                            'moderated_by' => $userId,
                            'message' => json_encode([
                                'reason_type' => self::REPORT_STATUS_USER_BLOCK,
                                'reason_description' => $reason,
                                'reason_metadata' => [
                                    'period' => (int)$requestData['period']
                                ],
                            ])
                        ]));
                    }
                    $response = [
                        'success' => 1,
                        'message' => __('User was blocked successfully.')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to block user.')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function userTake()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');

        if ($this->request->is('ajax')) {
            $requestData = $this->request->getData();
            $reason = trim(htmlspecialchars($requestData['description']));
            $report = $this->Reports->getReportByIdTypeUser($requestData['report_id']);

            $user = $this->Users->getUserForChangeRoles($requestData['user_id']);
            $data['roles'] = $requestData['actives'];
            $editedRoles = $this->Roles->getAddedRemovedRoles($user, $data);

            if ((bool)$result = $this->validateItem($user)) {
                $response = $result;
            } elseif ((bool)$result = $this->validateItem($report)) {
                $response = $result;
            } elseif (empty($editedRoles['removed'])) {
                $response = [
                    'success' => 0,
                    'message' => __('No permissions where changed.')
                ];
            } else {
                $removedRolesIds = $this->Roles->getRolesRemovedIds($user, $data);
                $user = $this->Users->patchEntity($user, $data);
                if ($this->Users->save($user)) {
                    $event = new Event('Notice.type.new', $this, [
                        'user_id' => $user->id,
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS,
                        'created_by' => $userId,
                        'content_message' => json_encode([
                            'message' => [
                                'added' => $editedRoles['added'],
                                'removed' => $editedRoles['removed'],
                                'substantiation' => $reason,
                                'blocked_to' => ((int)$requestData['period'] < 1) ? (int)$requestData['period'] : date("Y-m-d",
                                    time() + (int)$requestData['period'])
                            ]
                        ]),
                        'content_id' => 0,
                        'content_type_id' => 0
                    ]);
                    $noticeUserId = false;
                    $typeContent = $contentText ='';
                    if ((int)$report->report_type_id === self::REPORT_TYPE_USER) {
                        $noticeUserId = $report->reported_user->id;
                        $typeContent = 'USER';
                    }
                    if ($noticeUserId) {
                        $event = new Event('Notice.type.self', $this, [
                            'notice_type_id' => NoticesManager::NOTICE_TYPE_REPORT_DECISION,
                            'created_by' => $userId,
                            'content_message' => json_encode([
                                'message' => [
                                    'content' => $reason,
                                    'type_decision' => 'USER_PERMISSION',
                                    'added' => $editedRoles['added'],
                                    'removed' => $editedRoles['removed'],
                                    'type_content' => $typeContent,
                                    'blocked_to' => ((int)$requestData['period'] < 1) ? (int)$requestData['period'] : date("Y-m-d",
                                    time() + (int)$requestData['period'])
                                ]
                            ]),
                            'content_id' => (int)$report->id,
                            'user_id' => $noticeUserId,
                            'content_type_id' => NoticesManager::TYPE_REPORT
                        ]);
                    }
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                    $report = $this->Reports->patchEntity($report, [
                        'status' => self::REPORT_UNREAD,
                        'report_status' => self::REPORT_STATUS_USER_PERMISSIONS_BLOCK,
                        'moderated_by' => $userId
                    ]);
                    if ($this->Reports->save($report)) {
                        $this->ReportsHistory->save($this->ReportsHistory->newEntity([
                            'report_id' => $report->id,
                            'moderated_by' => $userId,
                            'message' => json_encode([
                                'reason_type' => self::REPORT_STATUS_USER_PERMISSIONS_BLOCK,
                                'reason_description' => $reason,
                                'reason_metadata' => [
                                    'roles' => $this->Roles->getRolesMetadata($removedRolesIds),
                                    'period' => (int)$requestData['period']
                                ],
                            ])
                        ]));
                        $rolesBlocks = $this->RolesBlocks->newEntity([
                            'user_id' => $user->id,
                            'report_id' => $report->id,
                            'roles' => json_encode($removedRolesIds),
                            'blocked_time' => ((int)$requestData['period'] == 0) ? time() + (10 * 365 * 24 * 60 * 60) : time() + $requestData['period']
                        ]);
                        $this->RolesBlocks->save($rolesBlocks);
                    }
                    $response = [
                        'success' => 1,
                        'message' => __('Permission were added successfully')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Error while adding permissions')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function resolve($articleId)
    {
        if ($this->request->is('ajax')) {

            $userId = $this->request->getSession()->read('Auth.User.id');
            $article = $this->Articles->getArticleForResolve($articleId, $userId);
            $requestData = $this->request->getData();

            if ((bool)$result = $this->validateItem($article)) {
                $response = $result;
            } elseif ((int)$article->resolve_send !== 0) {
                $response = [
                    'success' => 0,
                    'message' => __('Content is already send to resolve.')
                ];
            } else {
                $data['resolve_send'] = 1;
                if ($this->Articles->save($this->Articles->patchEntity($article, $data))) {
                    $contentTypeId = self::REPORT_CONTENT_TYPE_NEWS;
                    if ((int)$article->type_id === ArticlesController::TYPE_QUESTION) {
                        $contentTypeId = self::REPORT_CONTENT_TYPE_QUESTION;
                    }
                    $report = $this->Reports->newEntity([
                        'user_id' => $userId,
                        'report_type_id' => self::REPORT_TYPE_RESOLVE,
                        'report_content_type_id' => $contentTypeId,
                        'content_id' => $article->id,
                        'message' => json_encode([
                            'reason_type' => self::REPORT_RESOLVE_REASON_OTHER,
                            'reason_content' => $requestData['content'],
                            'description' => ''
                        ]),
                        'status' => self::REPORT_READ
                    ]);
                    if ($this->Reports->save($report)) {
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
                        $response = [
                            'success' => 1,
                            'message' => __('Permission were added successfully')
                        ];
                    } else {
                        $response = [
                            'success' => 0,
                            'message' => __('Error while adding permissions')
                        ];
                    }
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Error while adding permissions')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
    }

    public function mark($reportId)
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $this->Reports->updateAll(['status' => 0], ['id' => $reportId]);
            $counter = $this->Reports->find()
                ->where([
                    'user_id' => $userId,
                    'status' => ReportsController::REPORT_UNREAD
                ])
                ->count();
            $response = [
                'success' => 1,
                'counter' => $counter
            ];
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }


    private function validateItem($item)
    {
        if (!isset($item->id) || empty($item->id)) {
            return [
                'success' => 0,
                'message' => __('Invalid content.')
            ];
        }
        return false;
    }

    private function validateReportType($reportType)
    {
        if (!in_array((int)$reportType, [
            self::REPORT_CONTENT_REASON_MISSPELL,
            self::REPORT_CONTENT_REASON_PLAGIARISM,
            self::REPORT_CONTENT_REASON_OTHER,
        ])) {
            return [
                'success' => 0,
                'message' => __('Invalid reason type.')
            ];
        }
        return false;
    }

    private function validateReportUserType($reportType)
    {
        if (!in_array((int)$reportType, [
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_NAME,
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_PHOTO,
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_DESCRIPTION,
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_CONTENT,
            ReportsController::REPORT_USER_REASON_FAKE_ACCOUNT,
            ReportsController::REPORT_USER_REASON_OTHER
        ])) {
            return [
                'success' => 0,
                'message' => __('Invalid reason type.')
            ];
        }
        return false;
    }

    private function validateReportInput($reportInput)
    {
        if ((int)mb_strlen(trim(preg_replace('/\s+/', '', $reportInput))) < 1) {
            return [
                'success' => 0,
                'message' => __('Field cannot be empty.')
            ];
        }
        return false;
    }

    private function validateReportContent($reportContent)
    {
        if ((int)mb_strlen(trim(preg_replace('/\s+/', '', $reportContent))) < 1) {
            return [
                'success' => 0,
                'message' => __('Reason cannot be empty.')
            ];
        }
        return false;
    }

    public static function getReportsTypesTranslations()
    {
        return [
            ReportsController::REPORT_CONTENT_REASON_MISSPELL => __('Misspellings and errors (Editing and proofreading need)'),
            ReportsController::REPORT_CONTENT_REASON_PLAGIARISM => __('Plagiarism and deception (Article link need)'),
            ReportsController::REPORT_CONTENT_REASON_OTHER => __('Other'),
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_NAME => __('Inappropriate username'),
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_PHOTO => __('Inappropriate user photo'),
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_DESCRIPTION => __('Inappropriate user description'),
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_CONTENT => __('User publishes inappropriate content'),
            ReportsController::REPORT_USER_REASON_FAKE_ACCOUNT => __('A fake account or user is impersonating'),
            ReportsController::REPORT_USER_REASON_OTHER => __('Other'),
            ReportsController::REPORT_RESOLVE_REASON_OTHER => __('Other')
        ];
    }

    private function saveReportHistory($reportId, $userId, $description, $type = self::REPORT_STATUS_ACCEPTED)
    {
        $this->ReportsHistory->save($this->ReportsHistory->newEntity([
            'report_id' => $reportId,
            'moderated_by' => $userId,
            'message' => json_encode([
                'reason_type' => $type,
                'reason_description' => $description
            ])
        ]));
    }
}
