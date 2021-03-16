<?php

namespace Newsletter\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class MailingsTable extends CroogoTable
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
    }

    public function getActiveMailing()
    {
        return $this->find()
            ->where([
                'Mailings.status' => 1,
            ])
            ->orderDesc('created')
            ->first();
    }
}
