<?php

namespace Croogo\Users\Controller;

use ADmad\SocialAuth\Model\Table\SocialProfilesTable;
use Articles\Controller\ArticlesController;
use Articles\Model\Table\ArticlesTable;
use Banners\Model\Table\BannersTable;
use Cake\Cache\Cache;
use Cake\Event\Event;
use Categories\Model\Table\CategoriesTable;
use Croogo\Core\Croogo;
use Croogo\Users\Controller\Component\UserComponent;
use Croogo\Users\Model\Table\RolesTable;
use Croogo\Users\Model\Table\RolesUsersTable;
use Croogo\Users\Model\Table\RolesBlocksTable;
use Croogo\Users\Model\Table\UsersTable;
use Croogo\Core\Router;
use Cake\Auth\DefaultPasswordHasher;
use Notes\Model\Table\NotesTable;
use Notices\Event\NoticesManager;
use Notices\Model\NoticesTable;
use Reports\Controller\ReportsController;
use Reports\Model\Table\ReportsTable;
use Subscriptions\Model\Table\ArticlesSubscriptionsTable;
use Subscriptions\Model\Table\UsersSubscriptionsTable;
use Subscriptions\Model\Table\NotesSubscriptionsTable;
use Subscriptions\Model\Table\CommentsSubscriptionsTable;
use Subscriptions\Model\Table\CategoriesSubscriptionsTable;
use Croogo\Users\Mailer\UserMailer;

/**
 * Users Controller
 *
 * @property UsersTable Users
 * @property RolesTable Roles
 * @property RolesUsersTable RolesUsers
 * @property RolesUsersTable RolesBlocks
 * @property ArticlesTable Articles
 * @property CategoriesTable Categories
 * @property BannersTable Banners
 * @property ReportsTable Reports
 * @property NotesTable Notes
 * @property SocialProfilesTable SocialProfiles
 * @property UserComponent User
 * @property ArticlesSubscriptionsTable ArticlesSubscriptions
 * @property UsersSubscriptionsTable UsersSubscriptions
 * @property NotesSubscriptionsTable NotesSubscriptions
 * @property CommentsSubscriptionsTable CommentsSubscriptions
 * @property CategoriesSubscriptionsTable CategoriesSubscriptions
 * @property UserMailer Mailer
 * @category Controller
 * @package  Croogo.Users.Controller
 * @version  1.0
 * @author   Fahad Ibnay Heylaal <contact@fahad19.com>
 * @license  http://www.opensource.org/licenses/mit-license.php The MIT License
 * @link     http://www.croogo.org
 */
class UsersController extends AppController
{
    const DISABLE_REGISTER = false;

    const REGISTER_REF_LINK = 'cc-found';

    const REF_LINK = '_cc_found';

    const SOCIAL_ACTION = 'socialAction';

    const SOCIAL_ACTION_LOGIN = 'login';

    /**
     * Users permissions/roles
     */
    const ROLE_PUBLISHER_I = 'publisher-i';
    const ROLE_PUBLISHER_II = 'publisher-ii';
    const ROLE_ACCEPT = 'accept';
    const ROLE_EDITOR = 'editor';
    const ROLE_SETTLE_I = 'settle-i';
    const ROLE_SETTLE_IV = 'settle-iv';
    const ROLE_BLOCKED_II = 'give-permission-ii';
    const ROLE_GIVE_PERMISSION_II = 'give-permission-ii';
    const ROLE_SET_BANNER = 'set-banner';
    const ROLE_NEWSLETTER_ACCEPT = 'newsletter-accept';

    public $components = ['User'];

    public $helpers = [
        'Articles.Articles',
        'Reports.Reports'
    ];

    /**
     * {inheritdoc}
     */
    public function initialize()
    {
        parent::initialize();
        $this->Auth->allow(['logout', 'terms', 'aml']);
        $this->loadModel('Croogo/Users.Roles');
        $this->loadModel('Croogo/Users.RolesUsers');
        $this->loadModel('Croogo/Users.RolesBlocks');
        $this->loadModel('Articles.Articles');
        $this->loadModel('Categories.Categories');
        $this->loadModel('Banners.Banners');
        $this->loadModel('Reports.Reports');
        $this->loadModel('Newsletter.Newsletters');
        $this->loadModel('Newsletter.Mailings');
        $this->loadModel('Notes.Notes');
        $this->loadModel('Notices.Notices');
        $this->loadModel('Subscriptions.ArticlesSubscriptions');
        $this->loadModel('Subscriptions.UsersSubscriptions');
        $this->loadModel('Subscriptions.NotesSubscriptions');
        $this->loadModel('Subscriptions.CommentsSubscriptions');
        $this->loadModel('Subscriptions.CategoriesSubscriptions');
        $this->loadModel('ADmad/SocialAuth.SocialProfiles');
        $this->loadComponent('Paginator');
        $this->loadComponent('Users.User');
    }

    public function index()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $queryParams = $this->request->getQueryParams();
        $conditions = [
            'Users.id !=' => $userId
        ];
        if (isset($queryParams['name'])) {
            $conditions['name LIKE'] = '%' . $queryParams['name'] . '%';
        }
        if (isset($queryParams['roles']) && !empty($queryParams['roles'])) {
            $conditions['Roles.id IN'] = $queryParams['roles'];
            $query = $this->Users->find()
                ->where($conditions)
                ->distinct(['Users.id'])
                ->innerJoinWith('Roles');
        } else {
            $conditions['role_id IN'][] = 2;
            $query = $this->Users->find()
                ->where($conditions);
        }
        $users = $this->Paginator->paginate(
            $query,
            ['limit' => 15]
        );
        $this->set([
            'users' => $users,
            'roles' => $this->Roles->getRolesForChange()
        ]);
    }

    public function add()
    {
        $session = $this->request->getSession();
        $session->delete(UsersController::SOCIAL_ACTION);
        $pass = $this->request->getParam('pass');
        if (!isset($pass['is_ref_link_valid']) || !$pass['is_ref_link_valid']) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
        $refLinkUser = $this->Users->getUserForRefLink($session->read('ref_link'));
        if (!isset($refLinkUser->id) || empty($refLinkUser->id)) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect('/');
        }
        $user = $this->Users->newEntity();
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            $data['is_first_login'] = 1;
            $data['ref_link'] = hash('md5', $data['username']);
            if (isset($refLinkUser->id) && !empty($refLinkUser->id)) {
                $data['ref_link_user_id'] = $refLinkUser->id;
            }
            $user = $this->Users->register($user, $data);
            if (isset($user->id) && !empty($user->id)) {
                $session->delete('ref_link');
                $this->Flash->success(__('You have successfully registered an account. An email has been sent with further instructions.'));
                return $this->redirect(['action' => 'login']);
            }
            $this->Flash->error(__('The User could not be saved. Please, try again.'));
        }
        $this->set(['user' => $user]);
    }

    public function activate($activationKey)
    {
        $user = $this->Users->getUserForActivate($activationKey);
        if (!$user) {
            $this->Flash->error(__('Could not activate your account.'));
            return $this->redirect(['action' => 'login']);
        }

        $user = $this->Users->activate($user);
        if (!$user) {
            $this->Flash->error(__('Could not activate your account'));
            return $this->redirect(['action' => 'login']);
        }

        $this->Flash->success(__('Account activated successfully.'));
        return $this->redirect(['action' => 'login']);
    }

    public function edit()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $user = $this->Users->getUserData($userId);
        if ($this->request->is(['post', 'put'])) {
            $data['attributes'] = json_encode($this->request->getData('settings'));
            $user = $this->Users->patchEntity($user, $data);
            if ($this->Users->save($user)) {
                $this->Flash->success(__('Settings has been saved.'));
            } else {
                $this->Flash->error(__('Settings could not be saved. Please, try again.'));
            }
        }
        $user->settings = json_decode($user->attributes, true);
        $this->set([
            'user' => $user
        ]);
    }

    public function general()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $user = $this->Users->getUserData($userId);
        if ($this->request->is(['post', 'put'])) {
            $data = $this->request->getData();
            if ($uploadedImage = $this->User->upload($this->request->getData('photo'))) {
                $data['image'] = $uploadedImage;
            } else {
                $uploadedImage = $this->request->getSession()->read('Auth.User.image');
                unset($data['image']);
            }
            $user = $this->Users->patchEntity($user, $data);
            if ($this->Users->save($user)) {
                $this->request->getSession()->write([
                    'Auth.User.name' => $user['name'],
                    'Auth.User.bio' => $user['bio'],
                    'Auth.User.image' => $uploadedImage
                ]);
                $this->Flash->success(__('Settings has been saved.'));
            } else {
                $this->Flash->error(__('Settings could not be saved. Please, try again.'));
            }
        }
        $user->settings = json_decode($user->attributes, true);
        $this->set([
            'user' => $user,
            'socialProfileExists' => $this->SocialProfiles->exists([
                'email' => $this->request->getSession()->read('Auth.User.username')
            ])
        ]);
    }

    public function inbox()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $user = $this->Users->getUserData($userId);
        if ($this->request->is(['post', 'put'])) {
            $data['attributes'] = json_encode($this->request->getData('settings'));
            $user = $this->Users->patchEntity($user, $data);
            if ($this->Users->save($user)) {
                $this->Flash->success(__('Settings has been saved.'));
            } else {
                $this->Flash->error(__('Settings could not be saved. Please, try again.'));
            }
        }
        $user->settings = json_decode($user->attributes, true);
        $this->set([
            'user' => $user,
            'attributes' => static::getAttributes(),
            'socialProfileExists' => $this->SocialProfiles->exists([
                'email' => $this->request->getSession()->read('Auth.User.username')
            ])
        ]);
    }

    public function forgot()
    {
        if (!$this->request->is('post')) {
            return;
        }

        $socialProfileExists = $this->SocialProfiles->exists(['email' => $this->request->getData('username')]);
        if (!empty($this->request->getData('username')) && $socialProfileExists) {
            $this->Flash->error(__('This email already exists in social accounts.'));
            return $this->redirect(['login']);
        }

        $user = $this->Users->findByUsername($this->request->getData('username'))->first();
        if (!$user) {
            $this->Flash->error(__('Invalid username.'));
            return $this->redirect(['action' => 'forgot']);
        }

        if (empty($user->email)) {
            $this->Flash->error(__('Invalid email.'));
            return;
        }

        $options = [
            'prefix' => $this->request->param('prefix'),
        ];
        $success = $this->Users->resetPassword($user, $options);
        if (!$success) {
            $this->Flash->error(__('An error occurred. Please try again.'));
            return;
        }

        $this->Flash->success(__('An email has been sent with instructions for resetting your password.'));

        return $this->redirect(['action' => 'login']);
    }

    public function reset($username, $activationKey)
    {
        $socialProfileExists = $this->SocialProfiles->exists(['email' => $username]);
        if (!empty($username) && $socialProfileExists) {
            $this->Flash->error(__('This email already exists in social accounts.'));
            return $this->redirect(['login']);
        }

        $user = $this->Users->getUserForReset($username, $activationKey);
        if (!$user) {
            $this->Flash->error(__('An error occurred.'));
            return $this->redirect(['action' => 'login']);
        }

        $this->set('user', $user);
        if (!$this->request->is('put')) {
            return;
        }

        $user = $this->Users->changePasswordFromReset($user, $this->request->data());

        $user = $this->Users->save($user);
        if (!$user) {
            $this->Flash->error(__('An error occurred. Please try again.'));
            return;
        }

        $this->Flash->success(__('Your password has been reset successfully.'));
        return $this->redirect(['action' => 'login']);
    }

    public function change()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');

        $socialProfileExists = $this->SocialProfiles->exists([
            'email' => $this->request->getSession()->read('Auth.User.username')
        ]);
        if ($socialProfileExists) {
            $this->Flash->error(__('Invalid action.'));
            return $this->redirect(['action' => 'main']);
        }

        $user = $this->Users->getUserData($userId);
        if (!$user) {
            $this->Flash->error(__('An error occurred.'));
            return $this->redirect(['action' => 'main']);
        }

        $this->set([
            'user' => $user,
            'socialProfileExists' => $this->SocialProfiles->exists([
                'email' => $this->request->getSession()->read('Auth.User.username')
            ])
        ]);

        if (!$this->request->is('put')) {
            return;
        }

        $this->Users->getValidator()
            ->add('old_password', 'custom', [
                'rule' => function ($value, $context) {
                    $user = $this->Users->get($context['data']['id']);
                    if ($user) {
                        if ((new DefaultPasswordHasher)->check($value, $user->password)) {
                            return true;
                        }
                    }
                    return false;
                },
                'message' => __('The old password does not match the current password!')
            ]);

        $user = $this->Users->changePasswordFromReset($user, $this->request->getData());

        $user = $this->Users->save($user);
        if (!$user) {
            $this->Flash->error(__('An error occurred. Please try again.'));
            return;
        }

        $this->Flash->success(__('Your password has been reset successfully.'));
        $this->redirect(['action' => 'change']);
    }

    public function login()
    {
        $session = $this->request->getSession();
        if (!$this->request->is('post')) {
            $this->request->getSession()->write(self::SOCIAL_ACTION, self::SOCIAL_ACTION_LOGIN);
            $redirectUrl = $this->Auth->redirectUrl();
            if ($redirectUrl != '/' && !$session->check('Croogo.redirect')) {
                $session->write('Croogo.redirect', $redirectUrl);
            }
            return;
        }

        $socialProfileExists = $this->SocialProfiles->exists(['email' => $this->request->getData('username')]);
        if (!empty($this->request->getData('username')) && $socialProfileExists) {
            $this->Flash->error(__('This email already exists in social accounts.'));
            return $this->redirect(['login']);
        }

        Croogo::dispatchEvent('Controller.Users.beforeLogin', $this);

        $user = $this->Auth->identify();
        if (!$user) {
            Croogo::dispatchEvent('Controller.Users.loginFailure', $this);
            $this->Flash->error(__('Incorrect username or password'));
            return $this->redirect($this->Auth->getConfig('loginAction'));
        }

        if ($user['is_blocked'] && ($user['is_blocked_time'] + $user['is_blocked_period'] > time())) {
            Croogo::dispatchEvent('Controller.Users.beforeLogout', $this);
            $this->request->getSession()->delete('Croogo.redirect');
            $periods = self::getBlockedPeriods();
            if ((int)$user['is_blocked_period'] === 0) {
                $periodMsg = $periods[$user['is_blocked_period']];
            } else {
                $periodMsg = 'for ' . $periods[$user['is_blocked_period']];
            }
            $this->Flash->success(__('Your account was blocked ') .
                $periodMsg.' ' . __('due to') .' '.
                $user['is_blocked_reason'] . '.');
            Croogo::dispatchEvent('Controller.Users.afterLogout', $this);
            return $this->redirect(['login']);
        }

        $articles = $this->Articles->getArticlesForAccepts($user['id'], date('Y-m-d', strtotime('today - 30 days')));
        foreach($articles as $article) {
            $exist = $this->Notices->getNoticeByArticleId($article->id);
            $voteTime = true;
            $verificationTime = (time() - $article->published) < ArticlesController::MAX_VERIFICATION_TIME ? true : false;
            if (is_null($article->published) || $verificationTime) {
                $voteTime = true;
            } else {
                $voteTime = false;
            }
            if(($exist == null) && !$voteTime) {
                if((int)$article->counter_accepts > (int)$article->counter_rejects) {
                    $event = new Event('Notice.type.self', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT,
                        'user_id' => $user['id'],
                        'created_by' => $user['id'],
                        'content_message' => json_encode([
                            'message' => 'Your content was resolve as accepted.',
                            'title' => $article->title,
                            'counter_accepts' => $article->counter_accepts
                        ]),
                        'content_id' => $article->id,
                        'content_type_id' => NoticesManager::TYPE_CONTENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                }else {
                    $event = new Event('Notice.type.self', $this, [
                        'notice_type_id' => NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_REJECT,
                        'user_id' => $user['id'],
                        'created_by' => $user['id'],
                        'content_message' => json_encode([
                            'message' => 'Your content was resolve as accepted.',
                            'title' => $article->title,
                            'counter_rejects' => $article->counter_rejects
                        ]),
                        'content_id' => $article->id,
                        'content_type_id' => NoticesManager::TYPE_CONTENT
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                }
            }
        }

        if ($session->check('Croogo.redirect')) {
            $redirectUrl = $session->read('Croogo.redirect');
            $session->delete('Croogo.redirect');
        } else {
            $redirectUrl = Router::url(['action' => 'main']);
        }

        if (!$this->Access->isUrlAuthorized($user, $redirectUrl)) {
            Croogo::dispatchEvent('Controller.Users.loginFailure', $this);
            $this->Auth->setConfig('authError', __('Authorization error'));
            $this->Flash->error($this->Auth->getConfig('authError'));
            return $this->redirect($this->Auth->getConfig('loginRedirect'));
        }

        if ((int)$user['is_first_login'] === 1) {
            $this->Users->updateAll(['is_first_login' => 0], ['id' => $user['id']]);
            $redirectUrl = Router::url(['action' => 'inbox']);
        }

        $rolesUsers = $this->loadModel('Croogo/Users.RolesUsers');
        $user['roles'] = $rolesUsers->getUsersRoles($user['id']);
        $this->Auth->setUser($user);
        Croogo::dispatchEvent('Controller.Users.loginSuccessful', $this);
        return $this->redirect($redirectUrl);
    }

    public function logout()
    {
        Croogo::dispatchEvent('Controller.Users.beforeLogout', $this);
        $this->request->getSession()->delete('Croogo.redirect');
        $this->Flash->success(__('Log out successful.'), 'auth');
        $logoutUrl = $this->Auth->logout();
        Croogo::dispatchEvent('Controller.Users.afterLogout', $this);
        return $this->redirect($logoutUrl);
    }

    public function blocked()
    {
        Croogo::dispatchEvent('Controller.Users.beforeLogout', $this);
        $this->request->getSession()->delete('Croogo.redirect');
        $periods = self::getBlockedPeriods();
        if ((int)$this->request->getSession()->read('Auth.User.is_blocked_period') === 0) {
            $periodMsg = $periods[$this->request->getSession()->read('Auth.User.is_blocked_period')];
        } else {
            $periodMsg = 'for ' . $periods[$this->request->getSession()->read('Auth.User.is_blocked_period')];
        }
        $this->Flash->success(__('Your account was blocked ' .
            $periodMsg . ' due to ' .
            $this->request->getSession()->read('Auth.User.is_blocked_reason') . '.'));
        $logoutUrl = $this->Auth->logout();
        Croogo::dispatchEvent('Controller.Users.afterLogout', $this);
        return $this->redirect($logoutUrl);
    }

    public function subscriptions()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $sortUsers = isset($this->request->query['sort_users']) ? $this->request->query['sort_users'] : 'asc';
        $usersSubscriptions = $this->UsersSubscriptions->getAllWithUserId(
            $userId,
            $sortUsers
        );
        $users = [];
        foreach ($usersSubscriptions as $user) {
            $result = $this->Users->getUserForView($user->sub_user_id, $userId);
            if (isset($result->id)) {
                $result['userCreatedSubscribe'] = $user->created;
                array_push($users, $result);
            }
        }
        $sortArticles = isset($this->request->query['sort_articles']) ? $this->request->query['sort_articles'] : 'asc';
        $articlesSubscriptions = $this->ArticlesSubscriptions->getAllWithUserId(
            $userId,
            $sortArticles
        );
        $articles = [];
        foreach ($articlesSubscriptions as $article) {
            $result = $this->Articles->getArticleForSubscriptions((int)$article->article_id);
            if (isset($result->id)) {
                $result['articleCreatedSubscribe'] = $article->created;
                $articles = array_merge($articles, Array($result));
            }
        }
        $sortNotes = isset($this->request->query['sort_notes']) ? $this->request->query['sort_notes'] : 'asc';
        $notesSubscriptions = $this->NotesSubscriptions->getAllWithUserId(
            $userId,
            $sortNotes
        );
        $notes = [];
        $notesArticles = [];
        foreach ($notesSubscriptions as $note) {
            $result = $this->Notes->getNotesForSubscriptions($note->note_id);
            $oldTable = [];
            if (isset($result->id)) {
                $notesArticles[$result['article_id']]['article'] = $this->Articles->getArticleForSubscriptions((int)$result['article_id']);
                $result['noteCreatedSubscribe'] = $note->created;
                $oldTable = isset($notesArticles[$result['article_id']]['notes']) ? $notesArticles[$result['article_id']]['notes'] : [];
                if (is_null($oldTable)) {
                    $notesArticles[$result['article_id']]['notes'] = array($result);
                } else {
                    $notesArticles[$result['article_id']]['notes'] = array_merge(array($result), $oldTable);
                }
            }
        }
        $sortComments = isset($this->request->query['sort_comments']) ? $this->request->query['sort_comments'] : 'asc';
        $commentsSubscriptions = $this->CommentsSubscriptions->getAllWithUserId(
            $userId,
            $sortComments
        );
        $comments = [];
        $oldTable = [];
        foreach ($commentsSubscriptions as $comment) {
            $result = $this->Notes->getNotesForSubscriptions((int)$comment->comment_id);
            $oldTable = [];
            if (isset($result->id)) {
                $comments[$result['parent_id']]['note'] = $this->Notes->getNotesForSubscriptions((int)$result['parent_id']);
                $result['commentCreatedSubscribe'] = $comment->created;
                $oldTable = isset($comments[$result['parent_id']]['comments']) ? $comments[$result['parent_id']]['comments'] : [];
                if (is_null($oldTable)) {
                    $comments[$result['parent_id']]['comments'] = array($result);
                } else {
                    $comments[$result['parent_id']]['comments'] = array_merge(array($result), $oldTable);
                }
            }
        }
        $sortCategories = isset($this->request->query['sort_categories']) ? $this->request->query['sort_categories'] : 'asc';
        $categoriesSubscriptions = $this->CategoriesSubscriptions->getAllWithUserId(
            $userId,
            $sortCategories
        );

        $this->set([
            'users' => $users,
            'articles' => $articles,
            'notesArticles' => $notesArticles,
            'comments' => $comments,
            'categories' => $categoriesSubscriptions,
            'socialProfileExists' => $this->SocialProfiles->exists([
                'email' => $this->request->getSession()->read('Auth.User.username')
            ])
        ]);
    }

    public function view($userViewId = null)
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $subscribed = false;
        $fallowers = 0;
        if (!$userViewId) {
            $userViewId = $userId;
        }
        $user = $this->Users->getUserForView($userViewId, $userId);
        if (!isset($user->id)) {
            $this->Flash->error(__('Invalid User.'));
            return $this->redirect('/');
        }
        if ($this->UsersSubscriptions->checkIfExists($userId, $userViewId) !== null) {
            $subscribed = true;
        }
        $allFallowers = $this->UsersSubscriptions->getAllSubscriptionsUser($userViewId);
        if ($allFallowers !== null) {
            $fallowers = count($allFallowers->toArray());
        }

        $userNews = $this->Articles->find()
            ->where([
                'user_id' => $userViewId,
                'type_id' => ArticlesController::TYPE_ARTICLE,
                'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT
            ])
            ->select([
                'id',
                'title',
                'counter_vote_result'
            ])
            ->orderDesc('updated');
        $userQuestions = $this->Articles->find()
            ->where([
                'user_id' => $userViewId,
                'type_id' => ArticlesController::TYPE_QUESTION,
                'is_visible' => ArticlesController::IS_VISIBLE_ACCEPT
            ])
            ->select([
                'id',
                'title',
                'counter_vote_result'
            ]);
        $userAnswers = $this->Notes->find()
            ->where([
                'Notes.user_id' => $userViewId,
                'Articles.type_id' => ArticlesController::TYPE_QUESTION,
                'Articles.is_visible' => ArticlesController::IS_VISIBLE_ACCEPT
            ])->contain([
                'Articles' => [
                    'fields' => [
                        'id',
                        'title',
                        'counter_vote_result'
                    ]
                ]
            ]);
        $userComments = $this->Notes->find()
            ->where([
                'Notes.user_id' => $userViewId,
                'Articles.type_id' => ArticlesController::TYPE_ARTICLE,
                'Articles.is_visible' => ArticlesController::IS_VISIBLE_ACCEPT
            ])->contain([
                'Articles' => [
                    'fields' => [
                        'id',
                        'title',
                        'counter_vote_result'
                    ]
                ]
            ]);
        $this->set([
            'user' => $user,
            'userNews' => $userNews,
            'userQuestions' => $userQuestions,
            'userAnswers' => $userAnswers,
            'userComments' => $userComments,
            'rolesPermissions' => $this->Roles->getRolesForView(),
            'userId' => $userId,
            'userViewId' => $userViewId,
            'subscribed' => $subscribed,
            'contentId' => $userViewId,
            'fallowers' => $fallowers
        ]);
    }

    public function roles()
    {
        if ($this->request->is(['ajax'])) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $data = $this->request->getData();
            $user = $this->Users->getUserForChangeRoles($data['permissions']);
            if (!$user) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
            }
            $data['roles'] = $data['actives'];
            $editedRoles = $this->Roles->getAddedRemovedRoles($user, $data);
            if (empty($editedRoles['added']) && empty($editedRoles['removed'])) {
                $response = [
                    'success' => 0,
                    'message' => __('No permissions where changed.')
                ];
            } else {
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
                                'substantiation' => $data['substantiation'],
                                'blocked_to' => ((int)$data['period'] < 1) ? (int)$data['period'] : date("Y-m-d",
                                    time() + (int)$data['period'])
                            ]
                        ]),
                        'content_id' => 0,
                        'content_type_id' => 0
                    ]);
                    $this->getEventManager()->on(new NoticesManager());
                    $this->getEventManager()->dispatch($event);
                    if ((int)$data['period'] > -1 && !empty($editedRoles['removed'])) {
                        $rolesBlocks = $this->RolesBlocks->newEntity([
                            'user_id' => $user->id,
                            'report_id' => '0',
                            'roles' => json_encode($editedRoles['removedIds']),
                            'blocked_time' => ((int)$data['period'] == 0) ? time() + (10 * 365 * 24 * 60 * 60) : time() + $data['period']
                        ]);
                        $this->RolesBlocks->save($rolesBlocks);
                        Cache::clear(false, 'users_login');
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
        }
    }

    protected function _getSenderEmail()
    {
        return 'croogo@' . preg_replace('#^www\.#', '', strtolower($_SERVER['SERVER_NAME']));
    }

    public function main()
    {
        $maxlifetime = 180; // last request was more than 3 minutes ago
        if ((isset($_SESSION['LAST_ACTIVITY_HOMEPAGE']) && (time() - $_SESSION['LAST_ACTIVITY_HOMEPAGE'] < $maxlifetime)) || (isset($_GET['lp']))) {
            $_SESSION['LAST_ACTIVITY_HOMEPAGE'] = time();
        } else {
            $_SESSION['LAST_ACTIVITY_HOMEPAGE'] = time(); // update last activity time stamp
            $this->redirect('https://lp.ccfound.com/webinar-zapisy/');
        }

        $conditions = [];
        $banners = $this->Banners->getBannersForMain();
        $categories = $this->Categories->getCategoriesForMain(36);
        $articles = $this->Articles->getMainArticles(ArticlesController::TYPE_ARTICLE, $conditions, 15);
        $questions = $this->Articles->getMainQuestions(ArticlesController::TYPE_QUESTION, $conditions, 35);
        $newestQuestions = $this->Articles->getMainNewestQuestions(ArticlesController::TYPE_QUESTION, $conditions, 36);
        $this->set([
            'banners' => $banners,
            'categories' => $categories,
            'articles' => $articles,
            'questions' => $questions,
            'newestQuestions' => $newestQuestions
        ]);
    }

    public function block()
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getData('user_id');
            $user = $this->Users->find()->where(['id' => $userId])->first();
            $reason = trim(htmlspecialchars($this->request->getData('reason')));
            if (!isset($user->id) || empty($user->id)) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
            } elseif (empty($reason)) {
                $response = [
                    'success' => 0,
                    'message' => __('You must fill reason of block.')
                ];
            } else {
                $user = $this->Users->patchEntity($user, [
                    'is_blocked' => 1,
                    'is_blocked_time' => time(),
                    'is_blocked_period' => $this->request->getData('period'),
                    'is_blocked_reason' => $reason,
                    'is_blocked_by' => $this->request->getSession()->read('Auth.User.id')
                ]);
                $event = new Event('Notice.type.self', $this, [
                    'notice_type_id' => NoticesManager::NOTICE_TYPE_BLOCKED_USER,
                    'user_id' => $userId,
                    'created_by' => $this->request->getSession()->read('Auth.User.id'),
                    'content_message' => json_encode([
                        'message' => $reason,
                        'time' => $this->request->getData('period')
                    ]),
                    'content_id' => $userId,
                    'content_type_id' => NoticesManager::TYPE_USER
                ]);
                $this->getEventManager()->on(new NoticesManager());
                $this->getEventManager()->dispatch($event);
                if ($this->Users->save($user)) {
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
            $this->redirect('/');
        }
    }

    public function unblock()
    {
        if ($this->request->is('ajax')) {
            $userId = $this->request->getData('user_id');
            $user = $this->Users->find()->where(['id' => $userId])->first();
            if (!isset($user->id) || empty($user->id)) {
                $response = [
                    'success' => 0,
                    'message' => __('Invalid content.')
                ];
            } else {
                $user = $this->Users->patchEntity($user, [
                    'is_blocked' => 0,
                    'is_blocked_time' => 0,
                    'is_blocked_period' => 0,
                    'is_blocked_reason' => '',
                    'is_blocked_by' => 0
                ]);
                if ($this->Users->save($user)) {
                    $response = [
                        'success' => 1,
                        'message' => __('User was unblocked successfully')
                    ];
                } else {
                    $response = [
                        'success' => 0,
                        'message' => __('Unable to unblock user.')
                    ];
                }
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public static function getReportOptions()
    {
        return [
            0 => __('Improper user name'),
            1 => __('Improper user avatar'),
            2 => __('Improper user bio'),
            3 => __('Other')
        ];
    }

    public static function getBlockedPeriods()
    {
        return [
            86400 => __('1 day'),
            604800 => __('7 days'),
            1209600 => __('14 days'),
            2592000 => __('30 days'),
            0 => __('forever')
        ];
    }

    public static function getPeriodsForPermission()
    {
        return [
            -1 => __('No block time'),
            86400 => __('1 day'),
            604800 => __('7 days'),
            1209600 => __('14 days'),
            2592000 => __('30 days'),
            0 => __('forever')
        ];
    }

    public static function getAttributes()
    {
        return [
//            [
//                'label' => __('Followers content'),
//                'name' => 'followers_content'
//            ],
//            [
//                'label' => __('Followers comments'),
//                'name' => 'followers_comments'
//            ],
            [
                'label' => __('Accepts'),
                'name' => 'accepts'
            ],
            [
                'label' => __('Rejects'),
                'name' => 'rejects'
            ],
            [
                'label' => __('Rejects Comments'),
                'name' => 'rejects_comments'
            ],
//            [
//                'label' => __('Content comments'),
//                'name' => 'content_comments'
//            ],
            [
                'label' => __('Newsletter'),
                'name' => 'newsletter'
            ]
        ];
    }

    public static function getDefinedRoles()
    {
        return [
            self::ROLE_PUBLISHER_I,
            self::ROLE_PUBLISHER_II,
            self::ROLE_ACCEPT,
            self::ROLE_EDITOR,
            self::ROLE_SETTLE_I,
            self::ROLE_SETTLE_IV,
            self::ROLE_BLOCKED_II,
            self::ROLE_GIVE_PERMISSION_II,
            self::ROLE_SET_BANNER,
            self::ROLE_NEWSLETTER_ACCEPT
        ];
    }

    public static function getRolesDescriptions()
    {
        return [
            'publisher-i' => [
                'name' => __('Publisher I'),
                'description' => __('User may publish Content: News. questions have to be Accepted and Comments do not.'),
                'alias' => 'publisher-i'
            ],
            'publisher-ii' => [
                'name' => __('Publisher II'),
                'description' => __('User may publish Content without it being Accepted.'),
                'alias' => 'publisher-ii'
            ],
            'accept' => [
                'name' => 'Accept',
                'description' => __('User sees not accepted Content and may Accept it or Reject with a justification.'),
                'alias' => 'accept'
            ],
            'editor' => [
                'name' => __('Editor'),
                'description' => __('User may add or remove categories.'),
                'alias' => 'editor'
            ],
            'settle-i' => [
                'name' => __('Settle I'),
                'description' => __('User is notified when Rejections are questioned by another user. These Rejections may be cancelled or kept in power. User may take away or temporarily block Permissions for other reported users. User is notified about reported Comments and may delete them.'),
                'alias' => 'settle-i'
            ],
            'settle-iv' => [
                'name' => __('Settle IV'),
                'description' => __('User is notified when Content that was Rejected and went through Settle I procedures (with Rejection being upheld again) is questioned by another User again.'),
                'alias' => 'settle-iv'
            ],
            'blocked-ii' => [
                'name' => __('Blocking II'),
                'description' => __('User may block other users temporarily for 1, 7, 14 or 30 days, or permanently. Blocking an user means turning off his all or chosen Permissions.'),
                'alias' => 'blocked-ii'
            ],
            'give-permission-ii' => [
                'name' => __('Give Permission II'),
                'description' => __('User may give permissions to other users in the form of a predefined role or individual permissions.'),
                'alias' => 'give-permission-ii'
            ],
            'set-banner' => [
                'name' => __('Set Banner'),
                'description' => __('User may add banners for the main page.'),
                'alias' => 'set-banner'
            ],
            'newsletter-accept' => [
                'name' => __('Newsletter Accept'),
                'description' => __('User receives a procedurally generated newsletter every Saturday at 10 am. User may accept or modify the newsletter for distribution until 6 pm the following day.'),
                'alias' => 'newsletter-accept'
            ]
        ];
    }

    public function terms()
    {
        $this->request->allowMethod(['get']);
        $lang = $this->request->getParam('lang');
        if ($lang == 'pl') {
            $this->render('terms_pl');
        } else {
            $this->render('terms_en');
        }
    }

    public function aml()
    {
        $this->request->allowMethod(['get']);
        $lang = $this->request->getParam('lang');
        if ($lang == 'pl') {
            $this->render('aml_pl');
        } else {
            $this->render('aml_en');
        }
    }

    public function policy()
    {
        $this->request->allowMethod(['get']);
        $lang = $this->request->getParam('lang');
        if ($lang == 'pl') {
            $this->render('policy_pl');
        } else {
            $this->render('policy_en');
        }
    }

    public function mails()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $user = $this->Users->getUserData($userId);
        $newsletter = $this->Newsletters->getCurrentNewsletterWithArticles();
        $mailing = $this->Mailings->newEntity();
        $notices = $this->Notices->find()
            ->where([
                'Notices.notice_type_id IN' => [
                    NoticesManager::NOTICE_TYPE_ACCEPT,
                    NoticesManager::NOTICE_TYPE_REJECT,
                    NoticesManager::NOTICE_TYPE_REVIEW,
                    NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_ACCEPT,
                    NoticesManager::NOTICE_TYPE_RESULT_RESOLVE_REJECT,
                    NoticesManager::NOTICE_TYPE_NEW_REPLY,
                    NoticesManager::NOTICE_TYPE_NEW_CONTENT,
                    NoticesManager::NOTICE_TYPE_REVIEW_REPLY,
                    NoticesManager::NOTICE_TYPE_REJECT_REPLY,
                    NoticesManager::NOTICE_TYPE_REPORT_ACCEPT,
                    NoticesManager::NOTICE_TYPE_REPORT_REJECT,
                    NoticesManager::NOTICE_TYPE_REPORT_USER,
                    NoticesManager::NOTICE_TYPE_REPORT_COMMENT,
                    NoticesManager::NOTICE_TYPE_RESOLVE_I,
                    NoticesManager::NOTICE_TYPE_RESOLVE_IV,
                    NoticesManager::NOTICE_TYPE_OTHER_PERMISSIONS,
                ]
            ])
            ->order(['Notices.created' => 'DESC'])
            ->limit(10);

        $notice = $notices->first();

        $this->set([
            'user' => $user,
            'newsletter' => $newsletter,
            'notices' => $notices,
            'notice' => $notice,
        ]);
    }
}
