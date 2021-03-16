<?php


namespace Notices\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class NoticesStatusesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Notices', [
            'className' => 'Notices.Notices',
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
