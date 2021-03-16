<?php

namespace Notes\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class ReviewsCommentsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Reviews', [
            'className' => 'Notes.Reviews'
        ]);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->hasMany('SubReviewsComments', [
            'className' => 'Notes.ReviewsComments',
            'foreignKey' => 'parent_id'
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

    public function getParent($parentId)
    {
        return $this->find()
            ->where(
                [
                    'id' => $parentId,
                    'parent_id IS' => null
                ]
            )
            ->first();
    }
}
