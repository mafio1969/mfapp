<?php

namespace Categories\Model\Table;

use Cake\I18n\I18n;
use Cake\Validation\Validator;
use Croogo\Core\Model\Table\CroogoTable;

class CategoriesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsToMany('Articles.Articles', [
            'through' => 'Articles.CategoriesArticles',
            'strategy' => 'subquery',
        ]);
        $this->hasMany('CategoriesSubscriptions', [
            'className' => 'Subscriptions.CategoriesSubscriptions'
        ]);
    }

    public function validationDefault(Validator $validator)
    {
        return $validator
            ->add('name', [
                    'notBlank' => [
                        'rule' => 'notBlank',
                        'message' => 'The name cannot be empty.',
                        'last' => true
                    ],
                    'validateUnique' => [
                        'rule' => 'validateUnique',
                        'provider' => 'table',
                        'message' => 'The category already exists.',
                        'last' => true
                    ],
                ]
            );
    }

    public function getCategoriesList()
    {
        return $this->find('list')
            ->where([
                'lang' => I18n::getLocale(),
            ]);
    }

    public function getCategoriesForMain($limit)
    {
        return $this->find('all')
            ->where([
                'lang' => I18n::getLocale(),
            ])
            ->orderDesc('counter_pop')
            ->limit($limit);
    }

    public function getCategoriesForCollect()
    {
        return $this->find()
            ->contain([
                'Articles' => [
                    'queryBuilder' => function ($q) {
                        return $q->limit(2);
                    },
                    'conditions' => [
                        'Articles.is_visible' => 1
                    ]
                ]
            ])
            ->where([
                'Categories.lang' => I18n::getLocale(),
            ])
            ->orderDesc('counter_pop')
            ->limit(1);
    }

    public function checkCategory($categoryId)
    {
        $category = $this->find()
            ->select(['id'])
            ->where([
                'id' => $categoryId,
                'lang' => I18n::getLocale(),
            ])
            ->first();
        if (isset($category->id) && !empty($category->id)) {
            return true;
        }
        return false;
    }

    public function getCategoryName($categoryId)
    {
        $category = $this->find()
            ->select(['id', 'name'])
            ->where([
                'id' => $categoryId,
                'lang' => I18n::getLocale(),
            ])
            ->first();
        if (isset($category->name) && !empty($category->name)) {
            return $category->name;
        }
        return __('Category');
    }
}
