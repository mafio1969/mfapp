<?php

namespace App\Shell;

use Cake\Console\Shell;
use Cake\I18n\I18n;
use Cake\Log\Log;
use Croogo\Users\Model\Table\CronTabTable;
use Croogo\Users\Model\Table\UsersTable;
use Newsletter\Model\Table\MailingsTable;
use Subscriptions\Model\Table\SubscriptionsTable;

/**
 * Class MailingToUsersGroupShell
 *
 * @package App\Shell
 *
 * @property MailingsTable Mailings
 * @property UsersTable Users
 * @property SubscriptionsTable Subscriptions
 * @property CronTabTable CronTab
 */
class MailingToUsersGroupShell extends Shell
{
    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Newsletter.Mailings');
        $this->loadModel('Croogo/Users.Users');
        $this->loadModel('Subscriptions.Subscriptions');
        $this->loadModel('Croogo/Users.CronTab');
    }

    public function main()
    {
        $this->out('MailingToUsersGroupShell');
    }

    public function send()
    {
        I18n::setLocale('pl_PL');
        Log::info(__CLASS__ . ' - ' . __FUNCTION__ . ' - ' . I18n::getLocale() . ': run at ' . date('Y-m-d H:i:s'), 'cron_log');

        $sendToUsers = false;
        $sendToSubscriptions = false;
        $users = [];
        $subscriptions = [];
        $usersLastId = null;
        $subscriptionsLastId = null;

        $cronTabUsers = $this->CronTab->find()
            ->where([
                'active' => 1,
                'alias' => CronTabTable::CRON_ALIAS_MAILING_USERS
            ])
            ->first();
        if (!isset($cronTabUsers->id) || empty($cronTabUsers->id)) {
            Log::info('empty users cronTab', 'cron_log');
        } else {
            $sendToUsers = true;
        }

        $cronTabSubscriptions = $this->CronTab->find()
            ->where([
                'active' => 1,
                'alias' => CronTabTable::CRON_ALIAS_MAILING_SUBSCRIPTIONS
            ])
            ->first();
        if (!isset($cronTabSubscriptions->id) || empty($cronTabSubscriptions->id)) {
            Log::info('empty subscriptions cronTab', 'cron_log');
        } else {
            $sendToSubscriptions = true;
        }

        $mailing = $this->Mailings->getActiveMailing();
        if (!isset($mailing->id) || empty($mailing->id)) {
            Log::info('empty mailing' . var_dump($mailing), 'cron_log');
            return;
        }

        if ($sendToUsers) {
            $conditions = ['role_id !=' => 1];
            if ((int)$cronTabUsers->last_id > 0) {
                $conditions['id > '] = $cronTabUsers->last_id;
            }
            $users = $this->Users->getUsersForMailing($conditions, 25);
        }

        if ($sendToSubscriptions) {
            $conditions = [];
            if ((int)$cronTabSubscriptions->last_id > 0) {
                $conditions['id > '] = $cronTabSubscriptions->last_id;
            }
            $subscriptions = $this->Subscriptions->getSubscriptionsForMailing($conditions, 25);
        }

        Log::info('run mailing', 'cron_log');

        foreach ($users as $user) {
            $usersLastId = $user->id;
            $email = $this->Users->sendMailingEmail($user->email, $mailing);
            Log::info('send to ' . $user->email . ' - status: ' . (int)$email, 'cron_log');
        }

        foreach ($subscriptions as $subscription) {
            $subscriptionsLastId = $subscription->id;
            $email = $this->Users->sendMailingEmail($subscription->email, $mailing);
            Log::info('send to ' . $subscription->email . ' - status: ' . (int)$email, 'cron_log');
        }

        if ($usersLastId && (int) $this->Users->checkUsersForMailing($usersLastId)->count() > 0) {
            $this->CronTab->updateAll(['last_id' => $usersLastId], ['alias' => CronTabTable::CRON_ALIAS_MAILING_USERS]);
        } else {
            $sendToUsers = false;
            $this->CronTab->updateAll(['last_id' => 0, 'active' => 0], ['alias' => CronTabTable::CRON_ALIAS_MAILING_USERS]);
        }

        if ($subscriptionsLastId && (int) $this->Subscriptions->checkSubscriptionsForMailing($subscriptionsLastId)->count() > 0) {
            $this->CronTab->updateAll(['last_id' => $subscriptionsLastId], ['alias' => CronTabTable::CRON_ALIAS_MAILING_SUBSCRIPTIONS]);
        } else {
            $sendToSubscriptions = false;
            $this->CronTab->updateAll(['last_id' => 0, 'active' => 0], ['alias' => CronTabTable::CRON_ALIAS_MAILING_SUBSCRIPTIONS]);
        }

        if (!$sendToUsers && !$sendToSubscriptions) {
            $this->Mailings->save($this->Mailings->patchEntity($mailing, ['status' => 0]));
        }

        Log::info('end send mailing', 'cron_log');
        Log::info('-----------------------', 'cron_log');
    }
}
