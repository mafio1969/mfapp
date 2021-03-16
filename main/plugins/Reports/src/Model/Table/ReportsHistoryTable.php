<?php


namespace Reports\Model\Table;


use Croogo\Core\Model\Table\CroogoTable;

class ReportsHistoryTable extends CroogoTable
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
        $this->belongsTo('Reports', [
            'className' => 'Reports.Reports',
        ]);
        $this->belongsTo('Moderators', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'moderated_by'
        ]);
    }
}
