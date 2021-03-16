<?php


namespace Croogo\Users\Model\Table;


use Croogo\Core\Model\Table\CroogoTable;

class RolesBlocksTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
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
