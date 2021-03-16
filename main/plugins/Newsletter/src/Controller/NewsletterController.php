<?php

namespace Newsletter\Controller;

use Articles\Model\Table\ArticlesTable;
use Aura\Intl\Exception;
use Cake\I18n\I18n;
use Categories\Model\Table\CategoriesTable;
use Croogo\Users\Model\Table\CronTabTable;
use Croogo\Users\Model\Table\UsersTable;
use Newsletter\Model\Table\MailingsTable;
use Newsletter\Model\Table\NewslettersArticlesTable;
use Newsletter\Model\Table\NewslettersMessagesTable;
use Newsletter\Model\Table\NewslettersTable;

/**
 * Class NewsletterController
 * @package Newsletter\Controller
 * @property MailingsTable Mailings
 * @property NewslettersTable Newsletters
 * @property NewslettersArticlesTable NewslettersArticles
 * @property NewslettersMessagesTable NewslettersMessages
 * @property UsersTable Users
 * @property ArticlesTable Articles
 * @property CategoriesTable Categories
 * @property CronTabTable CronTab
 */
class NewsletterController extends AppController
{
    public $helpers = ['Articles.Articles'];

    public function initialize()
    {
        parent::initialize();
        $this->loadModel('Newsletter.Mailings');
        $this->loadModel('Newsletter.Newsletters');
        $this->loadModel('Newsletter.NewslettersArticles');
        $this->loadModel('Newsletter.NewslettersMessages');
        $this->loadModel('Croogo/Users.Users');
        $this->loadModel('Croogo/Users.CronTab');
        $this->loadModel('Articles.Articles');
        $this->loadModel('Categories.Categories');
        $this->loadComponent('Paginator');
    }

    public function index()
    {
        $items = $this->Paginator->paginate(
            $this->Articles->getCurrentNewsletterItems(),
            [
                'limit' => 15
            ]
        );
        $newsletter = $this->Newsletters->getNewsletterForIndex();
        $this->set([
            'items' => $items,
            'newsletter' => $newsletter
        ]);
    }

    public function history()
    {
        $items = $this->Paginator->paginate(
            $this->Newsletters->getNewslettersForHistory(),
            [
                'limit' => 15
            ]
        );
        $this->set([
            'newsletters' => $items
        ]);
    }

    public function mailingToUsersGroup()
    {
        $this->set([
            'mailing' => $this->Mailings->newEntity()
        ]);
    }

    public function saveMailing()
    {
        if ($this->request->is('ajax')) {

            $mailing = $this->Mailings->newEntity([
                'status' => 1
            ]);
            $mailing = $this->Mailings->patchEntity($mailing, $this->request->getData());

            if ($this->Mailings->save($mailing)) {
                if ((int) $mailing->send_to_registered === 1) {
                    $this->CronTab->updateAll(['active' => 1], ['alias' => CronTabTable::CRON_ALIAS_MAILING_USERS]);
                }

                if ((int) $mailing->send_to_subscribed === 1) {
                    $this->CronTab->updateAll(['active' => 1], ['alias' => CronTabTable::CRON_ALIAS_MAILING_SUBSCRIPTIONS]);
                }

                $response = [
                    'success' => 1,
                    'message' => __('Mailing has been send.')
                ];
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('Unable to send mailing.')
                ];
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        }
    }

    public function add()
    {
        if ($this->request->is('ajax')) {
            $newsletter = $this->Newsletters->find()
                ->where([
                    'status' => 1
                ])->first();

            if (!isset($newsletter->id) || empty($newsletter->id)) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid element.')
                ];
            } else {
                $data = $this->request->getData();
                if (isset($data['newsletter'])) {
                    $ids = [];

                    foreach ($data['newsletter'] as $key => $item) {
                        if ((int)$item['element'] === 1) {
                            $ids[] = $key;
                        }
                    }

                    $newsletter = $this->Newsletters->patchEntity($newsletter, ['articles' => ['_ids' => $ids]]);
                    $newsletter->set([
                        'lang' => I18n::getLocale(),
                    ]);

                    if ($this->Newsletters->save($newsletter, ['associated' => true])) {
                        foreach ($data['newsletter'] as $key => $item) {
                            $this->Articles->updateAll(['is_newsletter' => $item['element']], ['id' => $key]);
                        }
                    }

                    $response = [
                        'success' => 1,
                        'message' => __('Newsletter was updated.')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('No items to update.')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }

    public function description()
    {
        if ($this->request->is('ajax')) {
            $newsletter = $this->Newsletters->getNewsletterForDescription($this->request->getData('id'));
            $newsletter = $this->Newsletters->patchEntity($newsletter, $this->request->getData());
            if ($this->Newsletters->save($newsletter)) {
                $response = [
                    'success' => 1,
                    'message' => __('Description was added to newsletter.')
                ];
            } else {
                $response = [
                    'success' => 0,
                    'message' => __('Unable to add description.')
                ];
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        }
    }

    public function remove()
    {
        if ($this->request->is('post')) {
            $articleId = $this->request->getData('item');
            $newsletter = $this->Newsletters->getCurrentNotAcceptedNewsletter();
            if (!isset($newsletter->id) || empty($newsletter->id)) {
                $this->Flash->error(__('Invalid action.'));
                return $this->redirect(['action' => 'index']);
            }
            try {
                $this->NewslettersArticles->deleteAll([
                    'newsletter_id' => $newsletter->id,
                    'article_id' => $articleId
                ]);
                $this->Articles->updateAll(['is_newsletter' => 0], ['id' => $articleId]);
                $this->Flash->success(__('Content was removed from newsletter.'));
            } catch (Exception $e) {
                $this->Flash->error(__('Error while removing content from newsletter.'));
            }
            return $this->redirect(['action' => 'index']);
        }
    }

    public function accept($newsletterId)
    {
        if ($this->request->is('ajax')) {
            $newsletter = $this->Newsletters->getNewsletterForAccept($newsletterId);
            if (!isset($newsletter->id) || empty($newsletter->id)) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid element.')
                ];
            } else {
                $newsletter = $this->Newsletters->patchEntity($newsletter, ['is_accepted' => 1]);
                if ($this->Newsletters->save($newsletter)) {
                    $response = [
                        'success' => 1,
                        'message' => __('Newsletter was accepted.')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to accept newsletter.')
                    ];
                }
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        }
    }

    public function sendNewslleterToEmail()
    {
        $email = $_GET['email'];
        if ($this->request->is('ajax')) {
            $newsletter = $this->Newsletters->getCurrentNewsletterWithArticles();
            if (!isset($newsletter->id) || empty($newsletter->id)) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid newsletter.')
                ];
            } else {
                $user = $this->Users->getUserByEmail($email);
                $email = $this->getMailer('Croogo/Users.User')
                    ->viewVars(compact(['user', 'newsletter']))
                    ->send('userNewsletter', [$user, $newsletter]);
                if ($email) {
                    $response = [
                        'success' => 1,
                        'message' => __('Newsletter was send.')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Wrong mail. Please complete the email existing in our database.')
                    ];
                }
            }
            $this->set(compact('response'));
            $this->set('_serialize', 'response');
        }
    }
}
