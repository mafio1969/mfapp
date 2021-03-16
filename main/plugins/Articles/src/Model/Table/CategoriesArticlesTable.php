<?php

namespace Articles\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class CategoriesArticlesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
        $this->belongsTo('Categories', [
            'className' => 'Categories.Categories',
        ]);
    }

    public function getAllWithArticleId($articleId)
    {
        return $this->find()
            ->where([
                'article_id' => $articleId
            ]);
    }
}
