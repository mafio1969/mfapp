<?php

namespace Notes\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class ReviewsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->hasMany('ReviewsComments', [
            'className' => 'Notes.ReviewsComments',
            'conditions' => [
                'parent_id IS' => null
            ]
        ]);
        $this->addBehavior('CounterCache', [
            'Articles' => [
                'counter_reviews'
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
}
