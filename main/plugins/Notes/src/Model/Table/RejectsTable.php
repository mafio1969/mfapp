<?php

namespace Notes\Model\Table;

use ArrayObject;
use Articles\Controller\ArticlesController;
use Cake\Datasource\EntityInterface;
use Cake\Event\Event;
use Cake\I18n\I18n;
use Cake\ORM\TableRegistry;
use Croogo\Core\Model\Table\CroogoTable;

class RejectsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->addBehavior('CounterCache', [
            'Articles' => [
                'counter_rejects' => [
                    'conditions' => [
                        'Rejects.archived' => 0,
                        'Rejects.is_deleted' => 0
                    ]
                ],
                'is_visible' => function ($event, $entity, $table, $original) {
                    $query = TableRegistry::get("Articles.Articles")->query();
                    $result = $query->select(['id', 'is_visible', 'published', 'counter_accepts', 'counter_rejects'])
                        ->where(['id' => $entity->article_id])
                        ->first();
                    if (is_null($result['published'])
                        || (!is_null($result['published']) && time() - $result['published'] < ArticlesController::MAX_VERIFICATION_TIME)) {
                        if ((int)$result['counter_accepts'] >= (int)$result['counter_rejects']) {
                            return ArticlesController::IS_VISIBLE_ACCEPT;
                        } else {
                            return ArticlesController::IS_VISIBLE_REJECT;
                        }
                    } else {
                        return $result['is_visible'];
                    }
                }
            ]
        ]);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->hasMany('RejectsComments', [
            'className' => 'Notes.RejectsComments',
            'conditions' => [
                'parent_id IS' => null
            ]
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                    'updated' => 'always'
                ]
            ]
        ]);
    }

    public function afterSave(Event $event, EntityInterface $entity, ArrayObject $options)
    {
        $articlesTable = TableRegistry::get("Articles.Articles")->query();
        $categoriesTable = TableRegistry::get('Categories.Categories');
        $categoriesArticlesTable = TableRegistry::get('Articles.CategoriesArticles');
        $article = $articlesTable->select(['id'])
            ->contain(['Categories'])
            ->where(['id' => $entity->article_id])
            ->first();
        if (!$article) {
            return;
        }
        foreach ($article->categories as $category) {
            $counter = $categoriesArticlesTable->find()
                ->where([
                    'CategoriesArticles.category_id' => $category->id,
                    'Articles.is_visible' => ArticlesController::IS_VISIBLE_ACCEPT
                ])
                ->innerJoinWith('Articles')
                ->count();
            $category->set('counter_pop', $counter);
            $categoriesTable->save($category);
        }
    }

    public function getRejectItem($rejectId)
    {
        return $this->find()
            ->where([
                'Rejects.id' => $rejectId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles', 'Users'])
            ->first();
    }

    public function checkIfAlreadyAdded($userId, $articleId)
    {
        $item = $this->find()
            ->where([
                'Rejects.user_id' => $userId,
                'Rejects.article_id' => $articleId,
                'Rejects.archived' => 0,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles'])
            ->first();
        if (isset($item->id) && !empty($item->id)) {
            return true;
        }
        return false;
    }

    public function getRejectForComment($rejectId)
    {
        return $this->find()
            ->select([
                'Rejects.id',
                'Rejects.article_id',
                'Rejects.user_id',
            ])
            ->where([
                'Rejects.id' => $rejectId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles'])
            ->first();
    }

    public function getRejectForRemove($rejectId)
    {
        return $this->find()
            ->select([
                'Rejects.id',
                'Rejects.article_id',
                'Rejects.is_deleted',
            ])
            ->where([
                'Rejects.id' => $rejectId,
                'Articles.lang' => I18n::getLocale(),
            ])
            ->contain(['Articles'])
            ->first();
    }
}
