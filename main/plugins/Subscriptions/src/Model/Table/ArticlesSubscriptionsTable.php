<?php

namespace Subscriptions\Model\Table;

use Cake\I18n\I18n;
use Croogo\Core\Model\Table\CroogoTable;

class ArticlesSubscriptionsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Croogo/Users.Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new'
                ]
            ]
        ]);
    }

    public function checkIfExists($userId, $articleId)
    {
        return $this->find()
            ->where([
                'ArticlesSubscriptions.user_id' => $userId,
                'ArticlesSubscriptions.article_id' => $articleId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles'
            ])
            ->first();
    }

    public function getAllWithUserId($userId, $sortOrder)
    {
        return $this->find()
            ->where([
                'ArticlesSubscriptions.user_id' => $userId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles'
            ])
            ->order([
                'ArticlesSubscriptions.created' => strtoupper($sortOrder) === 'ASC' ? 'ASC' : 'DESC',
            ]);
    }

    public function getAllWithArticleId($articleId)
    {
        return $this->find()
            ->where([
                'ArticlesSubscriptions.article_id' => $articleId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles'
            ]);
    }
}
