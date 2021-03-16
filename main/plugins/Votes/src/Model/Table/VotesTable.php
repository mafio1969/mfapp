<?php

namespace Votes\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;
use Cake\ORM\TableRegistry;

class VotesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->addBehavior('CounterCache', [
            'Articles' => [
                'counter_up_vote' => [
                    'conditions' => ['Votes.status' => 1]
                ],
                'counter_down_vote' => [
                    'conditions' => ['Votes.status' => 0]
                ],
                'counter_vote_result' => function ($event, $entity, $table, $original) {
                    $query = TableRegistry::get("Articles.Articles")->query();
                    $result = $query->select([
                        'diff' => $query->newExpr('Articles.counter_up_vote - Articles.counter_down_vote')
                    ])->where(['id' => $entity->article_id])->first();
                    return $result->diff;
                }
            ]
        ]);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
    }

    public function checkIfExists($userId, $articleId)
    {
        return $this->find()
            ->where([
                'user_id' => $userId,
                'article_id' => $articleId
            ])
            ->first();
    }
}
