<?php


namespace App\Shell;


use Articles\Model\Table\ArticlesTable;
use Cake\Console\Shell;
use Cake\Log\Log;
use Croogo\Users\Model\Table\UsersTable;
use Notices\Event\NoticesManager;
use Notices\Model\Table\NoticesEmailsTable;
use Notices\Model\Table\NoticesTable;

/**
 * Class NoticesShell
 * @package App\Shell
 * @property NoticesTable Notices
 * @property NoticesEmailsTable NoticesEmails
 * @property UsersTable Users
 * @property ArticlesTable Articles
 */
class NoticesShell extends Shell
{
    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Croogo/Users.Users');
        $this->loadModel('Notices.Notices');
        $this->loadModel('Notices.NoticesEmails');
        $this->loadModel('Articles.Articles');
    }

    public function main()
    {
        $this->out('NoticesShell');
    }

    public function single()
    {
        Log::info(__CLASS__ . ' - ' . __FUNCTION__ . ': run at ' . date('Y-m-d H:i:s'), 'cron_log');
        $notices = $this->NoticesEmails->find()
            ->where([
                'NoticesEmails.status' => 0,
                'NoticesEmails.time_to_send' => 0
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image', 'email']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
            ])
            ->limit(100);
        foreach ($notices as $notice) {
            $email = $this->Users->sendNoticeSingleEmail($notice->user, $notice);
            if ($email) {
                $this->NoticesEmails->updateAll(['status' => 1], ['id' => $notice->id]);
            }
        }
    }

    public function multi()
    {
        Log::info(__CLASS__ . ' - ' . __FUNCTION__ . ': run at ' . date('Y-m-d H:i:s'), 'cron_log');
        $notices = $this->NoticesEmails->find()
            ->where([
                'NoticesEmails.status' => 0,
                'NoticesEmails.time_to_send !=' => 0
            ])
            ->contain([
                'Users' => ['fields' => ['id', 'name', 'image', 'email']],
                'Creators' => ['fields' => ['id', 'name', 'image']],
                'Reported' => ['fields' => ['id', 'name', 'image']],
            ])
            ->groupBy('user_id');
        foreach ($notices as $userId => $userNotices) {
            $user = $this->Users->find()
                ->select([
                    'id',
                    'name',
                    'email'
                ])
                ->where(['id' => $userId])
                ->first();
            if (!$user) {
                continue;
            }
            $email = $this->Users->sendNoticeMultiEmail($user, $userNotices);
            if ($email) {
                $noticesIds = [];
                foreach ($userNotices as $notice) {
                    $noticesIds[] = $notice->id;
                }
                $this->NoticesEmails->updateAll(['status' => 1], ['id IN' => $noticesIds]);
            }
        }
    }

    public function remove()
    {
        $notices = $this->Notices->find()
            ->select([
                'id',
                'created'
            ])
            ->where([
                'is_deleted' => 0,
                'notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_CONTENT,
                'content_type_id' => NoticesManager::TYPE_CONTENT,
                'DATEDIFF(\'' . date('Y-m-d H:i:s') . '\', created) > ' => 30
            ])
            ->limit(50)
            ->all();
        foreach ($notices as $notice) {
            if (isset($notice->id)) {
                $this->Notices->updateAll(
                    [
                        'is_deleted' => 1
                    ],
                    [
                        'id' => $notice->id,
                        'content_type_id' => NoticesManager::TYPE_CONTENT,
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_NEW_CONTENT
                    ]
                );
            }
        }
    }
}
