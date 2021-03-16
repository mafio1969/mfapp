<?php

namespace Croogo\Users\Model\Table;

use Cake\Auth\DefaultPasswordHasher;
use Cake\Cache\Cache;
use Cake\Core\Configure;
use Cake\Core\Exception\Exception;
use Cake\Mailer\MailerAwareTrait;
use Cake\ORM\Query;
use Cake\ORM\TableRegistry;
use Cake\Utility\Security;
use Cake\Utility\Text;
use Cake\Validation\Validator;
use Croogo\Core\Croogo;
use Croogo\Core\Model\Table\CroogoTable;
use Croogo\Core\Router;
use Croogo\Users\Controller\UsersController;
use Croogo\Users\Model\Entity\User;

class UsersTable extends CroogoTable
{

    use MailerAwareTrait;

    protected $_displayFields = [
        'username',
        'name',
        'role.title' => 'Role',
        'email',
        'status' => ['type' => 'boolean'],
    ];

    protected $_editFields = [
        'role_id',
        'username',
        'name',
        'email',
        'website',
        'status',
    ];

    public $filterArgs = [
        'name' => ['type' => 'like', 'field' => ['Users.name', 'Users.username']],
        'role_id' => ['type' => 'value'],
    ];

    public function initialize(array $config)
    {
        parent::initialize($config);

        $multiRole = Configure::read('Access Control.multiRole');

        if ($multiRole) {
            $this->belongsToMany('Croogo/Users.Roles', [
                'through' => 'Croogo/Users.RolesUsers',
                'strategy' => 'subquery',
            ]);
            unset($this->_displayFields['role.title']);
        } else {
            $this->belongsTo('Croogo/Users.Roles');
        }
        //$this->belongsToMany('Croogo/Users.RolesBlocks');
        $this->hasMany('RolesBlocks', [
            'className' => 'Croogo/Users.RolesBlocks',
        ]);
        $this->addBehavior('Acl.Acl', [
            'className' => 'Croogo/Core.CroogoAcl',
            'type' => 'requester'
        ]);
        $this->addBehavior('Search.Search');
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                    'updated' => 'always'
                ]
            ]
        ]);
        $this->addBehavior('Croogo/Core.Cached', [
            'groups' => ['users']
        ]);

        $this->eventManager()->on($this->getMailer('Croogo/Users.User'));

        $this->searchManager()
            ->add('name', 'Search.Like', [
                'field' => ['Users.name', 'Users.username', 'Users.email'],
                'before' => true,
                'after' => true,
            ]);

        if ($multiRole) {
            $this->searchManager()
                ->add('role_id', 'Search.Finder', [
                    'finder' => 'filterMultiRoles',
                ]);
        } else {
            $this->searchManager()
                ->value('role_id');
        }
        $this->hasMany('Articles', [
            'className' => 'Articles.Articles',
        ]);
        $this->hasMany('Accepts', [
            'className' => 'Notes.Accepts',
        ]);
        $this->hasMany('Rejects', [
            'className' => 'Notes.Rejects',
        ]);
        $this->hasMany('Reviews', [
            'className' => 'Notes.Reviews',
        ]);
        $this->hasMany('Notices', [
            'className' => 'Notices.Notices',
        ]);
        $this->hasMany('Reports', [
            'className' => 'Reports.Reports',
            'foreignKey' => 'content_id',
        ]);
        $this->hasMany('NewslettersMessages', [
            'className' => 'Newsletter.NewslettersMessages',
        ]);
    }

    /**
     * Used to register a new user
     *
     * @param User $user
     * @param array $data
     * @return bool|User
     */
    public function register(User $user, array $data)
    {
        $data['email'] = $data['username'];
        $user = $this->patchEntity($user, $data, [
            'fieldList' => [
                'name',
                'username',
                'password',
                'email',
                'is_first_login',
                'ref_link',
                'ref_link_user_id'
            ]
        ]);

        $roles = $this->Roles->find()
            ->where([
                'alias IN' => [
                    UsersController::ROLE_PUBLISHER_I,
                    UsersController::ROLE_ACCEPT
                ]
            ])
            ->all()
            ->toArray();

        $user->set([
            'role_id' => RolesTable::ROLE_REGISTERED,
            'activation_key' => $this->generateActivationKey(),
            'roles' => $roles
        ]);

        if (!$this->save($user)) {
            return $user;
        }

        $this->dispatchEvent('Users.registered', [
            'user' => $user
        ]);

        return $user;
    }

    /**
     * Activate the user
     *
     * @param User $user
     * @return bool|User
     */
    public function activate(User $user)
    {
        $user->status = 1;

        if (!$this->save($user)) {
            return false;
        }

        $this->dispatchEvent('Users.activated', [
            'user' => $user
        ]);

        return $user;
    }

    /**
     * Starts an password reset procedure and sets out an email to the user
     *
     * @param User $user User to run the procedure for
     * @return bool Returns true when successful, false if not
     */
    public function resetPassword(User $user, array $options = [])
    {
        // Generate a unique activation key
        $user->activation_key = $this->generateActivationKey();

        Croogo::dispatchEvent('Model.Users.beforeResetPassword', $this,
            compact('user')
        );
        $user = $this->save($user);
        if (!$user) {
            return false;
        }

        // Send out an password reset email
        $email = $this
            ->getMailer('Croogo/Users.User')
            ->viewVars(compact('options'))
            ->send('resetPassword', [$user]);
        if (!$email) {
            return false;
        }

        Croogo::dispatchEvent('Model.Users.afterResetPassword', $this,
            compact('email', 'user')
        );
        return true;
    }

    public function sendActivationEmail($user)
    {
        $email = $this->getMailer('Croogo/Users.User')
            ->viewVars(compact('user'))
            ->send('registrationActivation', [$user]);

        Croogo::dispatchEvent('Model.Users.afterActivationEmail', $this,
            compact('email', 'user')
        );
    }

    public function changePasswordFromReset(User $user, array $data)
    {
        $user = $this->patchEntity($user, $data, [
            'fieldList' => [
                'password',
                'verify_password',
            ]
        ]);
        if ($user->errors()) {
            return $user;
        }

        $user->activation_key = null;

        return $user;
    }

    public function validationDefault(Validator $validator)
    {
        return $validator
            ->add('username', [
                'notBlank' => [
                    'rule' => 'notBlank',
                    'message' => 'Email cannot be empty.',
                    'last' => true
                ],
                'validateUnique' => [
                    'rule' => 'validateUnique',
                    'provider' => 'table',
                    'message' => 'Email has already been taken.',
                    'last' => true
                ],
                'email' => [
                    'rule' => 'email',
                    'message' => 'Please provide a valid email address.',
                    'last' => true
                ],
            ])
            ->add('email', [
                'notEmpty' => [
                    'rule' => 'notBlank',
                    'message' => 'The username has already been taken.',
                    'last' => true
                ],
//                'email' => [
//                    'rule' => 'email',
//                    'message' => 'Please provide a valid email address.',
//                    'last' => true
//                ],
//                'validateUnique' => [
//                    'rule' => 'validateUnique',
//                    'provider' => 'table',
//                    'message' => 'Email address already in use.',
//                    'last' => true
//                ]
            ])
            ->add('password', [
                'minLength' => [
                    'rule' => ['minLength', 6],
                    'message' => 'Passwords must be at least 6 characters long.',
                    'last' => true
                ],
                'compareWith' => [
                    'rule' => ['compareWith', 'verify_password'],
                    'message' => 'Passwords do not match. Please, try again',
                    'last' => true
                ]
            ])
            ->add('name', [
                'notBlank' => [
                    'rule' => 'notBlank',
                    'message' => 'This field cannot be left blank.',
                    'last' => true
                ],
                'name' => [
                    'rule' => ['custom', '/^[\p{Ll}\p{Lm}\p{Lo}\p{Lt}\p{Lu}\p{Nd}-_\[\]\(\) ]+$/mu'],
                    'message' => 'This field must be alphanumeric',
                    'last' => true
                ]
            ])
            ->allowEmpty('website')
            ->add('website', [
                'url' => [
                    'rule' => 'url',
                    'message' => 'This field must be a valid URL',
                    'last' => true
                ]
            ]);
    }

    public function findFilterMultiRoles(Query $query, array $options)
    {
        $roleId = isset($options['role_id']) ? $options['role_id'] : false;
        $query
            ->where([
                $this->aliasField('role_id') => $roleId,
            ])
            ->orWhere([
                $this->Roles->aliasField('id') => $roleId,
            ]);
        return $query;
    }

    public function getUserForActivate($activationKey)
    {
        return $this->find()
            ->where([
                'activation_key' => $activationKey
            ])
            ->first();
    }

    public function getUserForReset($username, $activationKey)
    {
        return $this->find()
            ->where([
                'username' => $username,
                'activation_key' => $activationKey
            ])
            ->first();
    }

    public function getUserForView($userId, $loggedUserId)
    {
        return $this->find()
            ->contain([
                'Accepts' => [
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title',
                            'counter_vote_result'
                        ]
                    ]
                ],
                'Rejects' => [
                    'Articles' => [
                        'fields' => [
                            'id',
                            'title',
                            'counter_vote_result'
                        ]
                    ]
                ],
                'Roles',
                'RolesBlocks' => [
                    'fields' => [
                        'RolesBlocks.user_id',
                        'RolesBlocks.roles',
                        'RolesBlocks.blocked_time'
                    ],
                    'conditions' => [
                        'RolesBlocks.is_unblocked' => 0,
                    ],
                ],
                'Reports' => [
                    'fields' => [
                        'Reports.user_id',
                        'Reports.id',
                        'Reports.content_id'
                    ],
                    'conditions' => [
                        'Reports.content_id' => $userId,
                        'Reports.report_type_id' => 1,
                        'Reports.status' => 0,
                        'Reports.user_id' => $loggedUserId
                    ]
                ]
            ])
            ->where(['id' => $userId])
            ->first();
    }

    public function getUserData($userId)
    {
        return $this->find()
            ->where(['id' => $userId])
            ->first();
    }

    public function getUserForChangeRoles($userId)
    {
        return $this->find()
            ->where(['id' => $userId])
            ->contain(['Roles'])
            ->first();
    }

    public function generateActivationKey($length = null)
    {
        if (!$length) {
            $length = Configure::read('Croogo.activationKeyLength', 20);
        }
        return bin2hex(Security::randomBytes($length));
    }

    public function getUser(
        \Cake\Datasource\EntityInterface $profile,
        \Cake\Network\Session $session
    ) {
        // Make sure here that all the required fields are actually present
        if (empty($profile->email)) {
            throw new \RuntimeException('Could not find email in social profile.');
        }

        // If you want to associate the social entity with currently logged in user
        // use the $session argument to get user id and find matching user entity.
        $userId = $session->read('Auth.User.id');
        if ($userId) {
            return $this->get($userId);
        }

        // Check if user with same email exists. This avoids creating multiple
        // user accounts for different social identities of same user. You should
        // probably skip this check if your system doesn't enforce unique email
        // per user.
        $user = $this->find()
            ->where(['username' => $profile->email])
            ->first();

        if ($user) {
            return $user;
        }

        $rolesTable = TableRegistry::get('Roles');

        $standardRoles = $rolesTable->find('list')
            ->select(['id'])
            ->where([
                'OR' => [
                    ['alias' => UsersController::ROLE_PUBLISHER_I],
                    ['alias' => UsersController::ROLE_ACCEPT]
                ]
            ])->toArray();
        $roles = [];
        foreach ($standardRoles as $roleId => $roleName) {
            $roles[] = ['id' => $roleId];
        }

        // Create new user account
        $refLinkUserId = null;
        if ($session->check('ref_link')) {
            $refLinkUser = $this->getUserForRefLink($session->read('ref_link'));
            if (isset($refLinkUser->id) && !empty($refLinkUser->id)) {
                $refLinkUserId = $refLinkUser->id;
            }
        }
        if (!isset($profile->first_name) || empty($profile->first_name)) {
            $profileName = $variable = substr($profile->email, 0, strpos($profile->email, "@"));
        } else {
            $profileName = $profile->first_name;
        }
        $user = $this->newEntity([
            'image' => '',
            'bio' => '',
            'role_id' => 2,
            'username' => $profile->email,
            'email' => $profile->email,
            'name' => $profileName,
            'status' => 1,
            'roles' => $roles,
            'ref_link' => hash('md5', $profile->email),
            'ref_link_user_id' => $refLinkUserId
        ]);
        $user = $this->save($user, ['associated' => true]);

        if (!$user) {
            throw new \RuntimeException('Unable to save new user');
        }
        $session->delete('ref_link');
        $messages[] = [
            'message' => __('You have successfully created account with social login.'),
            'key' => 'success',
            'element' => 'Flash/success',
            'params' => []
        ];
        $session->write('Flash.success', $messages);
        $session->write('SocialAuth.redirectUrl', Router::url([
            'plugin' => 'Croogo/Users',
            'controller' => 'Users',
            'action' => 'inbox'
        ]));

        return $user;
    }

    public function getUserRoles($userId)
    {
        $user = $this->find()
            ->select(['Users.id'])
            ->where([
                'Users.id' => $userId
            ])
            ->contain([
                'Roles',
                'RolesBlocks' => [
                    'fields' => [
                        'user_id',
                        'roles',
                        'blocked_time'
                    ],
                    'conditions' => [
                        'RolesBlocks.user_id' => $userId,
                        'RolesBlocks.is_unblocked' => 0
                    ],
                ]
            ])
            ->first();

        return $this->getUserRolesWithoutBlocked($user);
    }

    public function getUserRolesWithData($userId)
    {
        $user = $this->find()
            ->select([
                'Users.id',
                'Users.is_blocked',
                'Users.is_blocked_time',
                'Users.is_blocked_period',
                'Users.is_blocked_reason'
            ])
            ->where([
                'Users.id' => $userId
            ])
            ->contain([
                'Roles',
                'RolesBlocks' => [
                    'fields' => [
                        'user_id',
                        'roles',
                        'blocked_time'
                    ],
                    'conditions' => [
                        'RolesBlocks.user_id' => $userId,
                        'RolesBlocks.is_unblocked' => 0
                    ],
                ]
            ])
            ->first();

        return [
            'user' => $user,
            'userRoles' => $this->getUserRolesWithoutBlocked($user)
        ];
    }

    public function getUserAttributes($userId)
    {
        return $this->find()
            ->where(['id' => $userId])
            ->select(['id', 'attributes'])
            ->first();
    }

    public function getUsersForNewsletter($conditions, $limit)
    {
        return $this->find()
            ->select([
                'id',
                'attributes',
                'email',
                'name'
            ])
            ->where($conditions)
            ->orderAsc('id')
            ->limit($limit);
    }

    public function checkUsersForNewsletter($lastId)
    {
        return $this->find()
            ->select(['id'])
            ->where(['id > ' => $lastId])
            ->orderAsc('id')
            ->limit(1);
    }

    public function getUsersForMailing($conditions, $limit)
    {
        return $this->find()
            ->select([
                'id',
                'email',
            ])
            ->where($conditions)
            ->orderAsc('id')
            ->limit($limit);
    }

    public function checkUsersForMailing($lastId)
    {
        return $this->find()
            ->select(['id'])
            ->where(['id > ' => $lastId])
            ->orderAsc('id')
            ->limit(1);
    }
    
    public function sendNewsletterEmail($user, $newsletter)
    {
        $email = $this->getMailer('Croogo/Users.User')
            ->viewVars(compact(['user', 'newsletter']))
            ->send('userNewsletter', [$user, $newsletter]);
        if ($email) {
            return true;
        }
        return false;
    }

    public function sendMailingEmail($email, $mailing)
    {
        $email = $this->getMailer('Croogo/Users.User')
            ->viewVars(compact(['email', 'mailing']))
            ->send('userMailing', [$email, $mailing]);
        if ($email) {
            return true;
        }
        return false;
    }

    public function sendNoticeSingleEmail($user, $notice)
    {
        $email = $this->getMailer('Croogo/Users.User')
            ->viewVars(compact(['user', 'notice']))
            ->send('userNoticeSingle', [$user, $notice]);
        if ($email) {
            return true;
        }
        return false;
    }

    public function sendNoticeMultiEmail($user, $notices)
    {
        $email = $this->getMailer('Croogo/Users.User')
            ->viewVars(compact(['user', 'notices']))
            ->send('userNoticeMulti', [$user, $notices]);
        if ($email) {
            return true;
        }
        return false;
    }

    public function sendNoticeOpenPortal($user)
    {
        $email = $this->getMailer('Croogo/Users.User')
            ->send('userNoticeOpenPortal', [$user]);
        if ($email) {
            return true;
        }
        return false;
    }

    public function getUserByRefLink($refLink)
    {
        return $this->find()
            ->select(['id'])
            ->where(['ref_link' => $refLink])
            ->first();
    }

    public function getUserForRefLink($refLinkUserId)
    {
        return $this->find()
            ->select(['id'])
            ->where(['id' => $refLinkUserId])
            ->first();
    }

    public function getUserNameById($id)
    {
        return $this->find()
            ->select(['name'])
            ->where(['id' => $id])
            ->first();
    }

    public function getUserByEmail($email)
    {
        return $this->find()
            ->where(['email' => $email])
            ->first();
    }

    public function getUserForReport($id)
    {
        return $this->find()
            ->select(['id'])
            ->where(['id' => $id])
            ->first();
    }

    public function getUserForBlock($id)
    {
        return $this->find()
            ->select(['id'])
            ->where(['id' => $id])
            ->first();
    }

    private function getUserRolesWithoutBlocked($user)
    {
        $blockedRoles = [];
        foreach ($user->roles_blocks as $rolesBlocks) {
            if ($rolesBlocks->blocked_time < time()) {
                continue;
            }

            $rolesBlocksRoles = json_decode($rolesBlocks->roles, true);

            if (!is_array($rolesBlocksRoles)) {
                continue;
            }

            foreach ($rolesBlocksRoles as $blockedRoleId) {
                $blockedRoles[] = $blockedRoleId;
            }
        }

        $userRoles = [];
        foreach ($user->roles as $userRole) {
            if (in_array($userRole->id, $blockedRoles)) {
                continue;
            }

            $userRoles[] = $userRole->alias;
        }

        return $userRoles;
    }
}
