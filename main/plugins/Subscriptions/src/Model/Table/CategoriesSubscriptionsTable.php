<?php

namespace Subscriptions\Model\Table;

use Cake\I18n\I18n;
use Croogo\Core\Model\Table\CroogoTable;

class CategoriesSubscriptionsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Croogo/Users.Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('Categories', [
            'className' => 'Categories.Categories',
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new'
                ]
            ]
        ]);
    }

    public function checkIfExists($userId, $categoryId)
    {
        return $this->find()
            ->where([
                'CategoriesSubscriptions.user_id' => $userId,
                'CategoriesSubscriptions.category_id' => $categoryId,
                'Categories.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Categories'
            ])
            ->first();
    }

    public function getAllWithUserId($userId, $sortOrder)
    {
        return $this->find()
            ->where([
                'CategoriesSubscriptions.user_id' => $userId,
                'Categories.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Categories'
            ])
            ->order([
                'CategoriesSubscriptions.created' => strtoupper($sortOrder) === 'ASC' ? 'ASC' : 'DESC',
            ]);
    }

    public function getAllWithCategoryId($categoryId)
    {
        return $this->find()
            ->where([
                'CategoriesSubscriptions.category_id' => $categoryId,
                'Categories.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Categories'
            ]);
    }
}
