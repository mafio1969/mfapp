<?php

namespace Categories\Controller;

use Cake\I18n\I18n;
use Categories\Model\Table\CategoriesTable;
use Categories\Controller\AppController;

/**
 * Class CategoriesController
 *
 * @package CategoriesController
 * @property CategoriesTable Categories
 */
class CategoriesController extends AppController
{
    public function initialize()
    {
        parent::initialize();
        $this->loadComponent('Paginator');
    }

    public function index()
    {
        $userId = $this->request->getSession()->read('Auth.User.id');
        $categories = $this->Categories->find('all')
            ->where([
                'lang' => I18n::getLocale(),
            ])
            ->orderDesc('counter_pop')
            ->contain([
                'CategoriesSubscriptions' => [
                    'conditions' => [
                        'CategoriesSubscriptions.user_id' => $userId
                    ]
                ]
            ]);
        $this->set([
            'categories' => $categories
        ]);
    }

    public function add()
    {
        $category = $this->Categories->newEntity();
        $category->set([
            'lang' => I18n::getLocale(),
        ]);

        if ($this->request->is('post')) {
            $category = $this->Categories->patchEntity($category, $this->request->getData());
            if ($this->Categories->save($category)) {
                $this->Flash->success(__('The category has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('Category name already exists.'));
        }
        $this->set(compact('category'));
    }

    public function edit($categoryId)
    {
        $category = $this->Categories->get($categoryId);
        if ($this->request->is('post')) {
            $category = $this->Categories->patchEntity($category, $this->request->getData());
            if ($this->Categories->save($category)) {
                $this->Flash->success(__('The category has been saved.'));
                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The category could not be saved. Please, try again.'));
        }
        $this->set(compact('category'));
    }

    public function delete($id)
    {
        $this->request->allowMethod(['get', 'delete']);
        $category = $this->Categories->get($id);
        if ($this->Categories->delete($category)) {
            $this->Flash->success(__('The category has been deleted.'));
        } else {
            $this->Flash->error(__('The category could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }
}
