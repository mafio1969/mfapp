<?php


namespace App\Shell;

use Articles\Model\Table\ArticlesTable;
use Cake\Console\Shell;
use Cake\I18n\I18n;
use Cake\Log\Log;
use Categories\Model\Table\CategoriesTable;
use Croogo\Users\Model\Table\CronTabTable;
use Croogo\Users\Model\Table\UsersTable;
use Newsletter\Model\Table\NewslettersArticlesTable;
use Newsletter\Model\Table\NewslettersMessagesTable;
use Newsletter\Model\Table\NewslettersTable;

/**
 * Class NewsletterShell
 * @package App\Shell
 * @property NewslettersTable Newsletters
 * @property NewslettersArticlesTable NewslettersArticles
 * @property NewslettersMessagesTable NewslettersMessages
 * @property UsersTable Users
 * @property ArticlesTable Articles
 * @property CategoriesTable Categories
 * @property CronTabTable CronTab
 */
class NewsletterShell extends Shell
{
    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Newsletter.Newsletters');
        $this->loadModel('Newsletter.NewslettersArticles');
        $this->loadModel('Newsletter.NewslettersMessages');
        $this->loadModel('Croogo/Users.Users');
        $this->loadModel('Croogo/Users.CronTab');
        $this->loadModel('Articles.Articles');
        $this->loadModel('Categories.Categories');
    }

    public function main()
    {
        $this->out('NewsletterShell');
    }

    public function collect()
    {
        I18n::setLocale('pl_PL');
        Log::info(__CLASS__ . ' - ' . __FUNCTION__ . ': run at ' . date('Y-m-d H:i:s'), 'cron_log');
        //run at Saturday 10.00 am to collect content
        $items = $this->Categories->getCategoriesForCollect();
        $ids = [];
        foreach ($items as $item) {
            foreach ($item->articles as $article) {
                $ids[] = $article->id;
            }
        }
        if (empty($ids)) {
            return;
        }
        $newsletter = $this->Newsletters->newEntity([
            'status' => 1,
            'articles' => ['_ids' => $ids],
            'date_from' => strtotime("last Saturday"),
            'date_to' => strtotime("today")
        ]);
        if ($this->Newsletters->save($newsletter, ['associated' => true])) {
            $this->Articles->updateAll(['is_newsletter' => 1], ['id IN' => $ids]);
        }
    }

    public function activate()
    {
        Log::info(__CLASS__ . ' - ' . __FUNCTION__ . ': run at ' . date('Y-m-d H:i:s'), 'cron_log');
        //run at Saturday 18.00 pm to activate sending
        $this->CronTab->updateAll(['active' => 1], ['alias' => CronTabTable::CRON_ALIAS_NEWSLETTER]);
    }

    public function send()
    {
        I18n::setLocale('pl_PL');
        Log::info(__CLASS__ . ' - ' . __FUNCTION__ . ' - '.I18n::getLocale().': run at ' . date('Y-m-d H:i:s'), 'cron_log');
        $cronTab = $this->CronTab->find()
            ->where([
                'active' => 1,
                'alias' => CronTabTable::CRON_ALIAS_NEWSLETTER
            ])
            ->first();
        if (!isset($cronTab->id) || empty($cronTab->id)) {
            Log::info('empty cronTab', 'cron_log');
            return;
        }
        $newsletter = $this->Newsletters->getCurrentNewsletterWithArticles();
        if (!isset($newsletter->id) || empty($newsletter->id)) {
            Log::info('empty newsletter'.var_dump($newsletter), 'cron_log');
            return;
        }
        $conditions = ['role_id !=' => 1];
        if ((int)$cronTab->last_id > 0) {
            $conditions['id > '] = $cronTab->last_id;
        }
        $users = $this->Users->getUsersForNewsletter($conditions, 50);
        $lastId = null;
        Log::info('run newsletter', 'cron_log');
        foreach ($users as $user) {

            $lastId = $user->id;
            $settings = json_decode($user->attributes, true);
            if ((boolean)$settings['newsletter']['mail']) {
                $email = $this->Users->sendNewsletterEmail($user, $newsletter);
                $newsletterMessage = $this->NewslettersMessages->newEntity([
                    'newsletter_id' => $newsletter->id,
                    'user_id' => $user->id,
                    'status' => (int)$email
                ]);
                $this->NewslettersMessages->save($newsletterMessage);
                Log::info('send to '.$user->email.' - status: '.(int)$email, 'cron_log');
            }
        }
        if ($lastId) {
            $checkUsers = $this->Users->checkUsersForNewsletter($lastId);
            if ((int)$checkUsers->count() > 0) {
                $this->CronTab->updateAll(['last_id' => $lastId], ['alias' => CronTabTable::CRON_ALIAS_NEWSLETTER]);
            } else {
                $this->CronTab->updateAll(['last_id' => 0, 'active' => 0],
                    ['alias' => CronTabTable::CRON_ALIAS_NEWSLETTER]);
                $this->Articles->updateAll(['is_newsletter' => 0], []);
                $this->Newsletters->save($this->Newsletters->patchEntity($newsletter, ['status' => 0]));
            }
        } else {
            $this->CronTab->updateAll(['last_id' => 0, 'active' => 0],
                ['alias' => CronTabTable::CRON_ALIAS_NEWSLETTER]);
            $this->Articles->updateAll(['is_newsletter' => 0], []);
            $this->Newsletters->save($this->Newsletters->patchEntity($newsletter, ['status' => 0]));
        }
        Log::info('end send newsletter', 'cron_log');
        Log::info('-----------------------', 'cron_log');
    }
}
