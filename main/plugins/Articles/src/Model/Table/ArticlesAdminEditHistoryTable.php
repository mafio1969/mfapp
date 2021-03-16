<?php

namespace Articles\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class ArticlesAdminEditHistoryTable extends CroogoTable
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

    public function getArticlesAdminEditHistoryForArticleIndex($articleId)
    {
        return $this->find()
            ->where([
                'article_id' => $articleId
            ])
            ->orderDesc('created')
            ->first();
    }
}
