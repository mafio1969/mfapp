<?php


namespace Notices\Model\Table;


use Croogo\Core\Model\Table\CroogoTable;

class NoticesEmailsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                    'updated' => 'always'
                ]
            ]
        ]);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('Creators', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'created_by'
        ]);
        $this->belongsTo('Reported', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'content_id'
        ]);
    }
}
