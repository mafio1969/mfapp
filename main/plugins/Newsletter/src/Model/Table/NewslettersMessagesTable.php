<?php


namespace Newsletter\Model\Table;


use Croogo\Core\Model\Table\CroogoTable;

class NewslettersMessagesTable extends CroogoTable
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
        $this->belongsTo('Croogo/Users.Users', [
            'className' => 'Croogo/Users.Users',
        ]);
    }
}
