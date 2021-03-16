<?php

namespace Banners\Controller;

use Banners\Model\Table\BannersTable;
use Cake\Event\Event;
use Cake\I18n\I18n;
use Croogo\Users\Controller\Component\UserComponent;

/**
 * Class BannersController
 *
 * @property UserComponent UserComponent
 * @package Banners\Controller
 * @property BannersTable Banners
 * @property UserComponent User
 */
class BannersController extends AppController
{
    const STATUS_INACTIVE = 0;
    const STATUS_ACTIVE = 1;

    static $typesMap = [
        'active' => 1,
        'inactive' => 0
    ];

    public $components = ['User'];

    public function initialize()
    {
        parent::initialize();
        $this->loadComponent('Paginator');
    }

    public function beforeFilter(Event $event)
    {
        parent::beforeFilter($event);
        $this->Security->config('unlockedActions', ['sort']);
        if (in_array($this->request->action, ['sort'])) {
            $this->getEventManager()->off($this->Csrf);
        }
    }

    public function index()
    {
        $queryParams = $this->request->getQueryParams();

        $conditions = [
            'Banners.lang' => I18n::getLocale(),
        ];

        if (isset($queryParams['active']) && isset(self::$typesMap[$queryParams['active']])) {
            $conditions['Banners.status'] = self::$typesMap[$queryParams['active']];
        }
        if (isset($queryParams['name']) && !empty($queryParams['name'])) {
            $conditions['Banners.title LIKE '] = '%' . $queryParams['name'] . '%';
        }
        $banners = $this->Paginator->paginate(
            $this->Banners->find()
                ->where($conditions)
                ->contain([
                    'Users' => [
                        'fields' => [
                            'id',
                            'name'
                        ]
                    ],
                    'UsersUpdated' => [
                        'fields' => [
                            'id',
                            'name'
                        ]
                    ]
                ]),
            [
                'order' => ['position' => 'asc'],
            ]
        );
        $this->set([
            'banners' => $banners
        ]);
    }

    public function view($id = null)
    {
        $banner = $this->Banners->get($id, [
            'contain' => []
        ]);
        $this->set('banner', $banner);
    }

    public function add()
    {
        $banner = $this->Banners->newEntity();
        if ($this->request->is('post')) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $data = $this->request->getData();
            if ($uploadedImage = $this->User->upload($data['photo'])) {
                $data['photo'] = $uploadedImage;
            }
            $data['created_by'] = $userId;
            $data['position'] = 0;
            $data['lang'] = I18n::getLocale();
            $banner = $this->Banners->patchEntity($banner, $data);
            if ($this->Banners->save($banner)) {
                $this->Flash->success(__('The banner has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The banner could not be saved. Please, try again.'));
        }
        $this->set(compact('banner'));
    }

    public function edit($bannerId)
    {
        $banner = $this->Banners->get($bannerId, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $userId = $this->request->getSession()->read('Auth.User.id');
            $data = $this->request->getData();
            if ($uploadedImage = $this->User->upload($data['photo'])) {
                $data['photo'] = $uploadedImage;
            } else {
                unset($data['photo']);
            }
            $data['updated_by'] = $userId;
            $banner = $this->Banners->patchEntity($banner, $data);
            if ($this->Banners->save($banner)) {
                $this->Flash->success(__('The banner has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The banner could not be saved. Please, try again.'));
        }
        $this->set(compact('banner'));
    }

    public function sort()
    {
        if ($this->request->is('ajax')) {
            $data = $this->request->getData();
            $items = [];
            foreach ($data['items'] as $itemKey => $itemValue) {
                $items[] = ['id' => $itemValue, 'position' => $itemKey + 1];
            }
            $entities = $this->Banners->newEntities($items);
            $this->Banners->saveMany($entities);
            $this->set('response', 1);
            $this->set('_serialize', 'response');
        } else {
            $this->Flash->error(__('Invalid action.'));
            $this->redirect('/');
        }
    }

    public function delete($id)
    {
        $this->request->allowMethod(['get']);
        $banner = $this->Banners->get($id);
        if ($this->Banners->delete($banner)) {
            $this->Flash->success(__('The banner has been deleted.'));
        } else {
            $this->Flash->error(__('The banner could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }

    public function remove()
    {
        $this->request->allowMethod(['post']);
        $data = $this->request->getData();
        $Banners = $this->Banners->getBannersMultiSelect($data['actives']['_ids']);
        foreach ($Banners as $banner) {
            $this->Banners->delete($banner);
        }
        $this->Flash->success(__('Banners has been deleted.'));
        return $this->redirect(['action' => 'index']);
    }
}
