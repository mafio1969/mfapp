<?php

namespace Banners\Model\Table;

use Banners\Controller\BannersController;
use Cake\I18n\I18n;
use Croogo\Core\Model\Table\CroogoTable;

class BannersTable extends CroogoTable
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
            'foreignKey' => 'created_by'
        ]);
        $this->belongsTo('UsersUpdated', [
            'className' => 'Croogo/Users.Users',
            'foreignKey' => 'updated_by'
        ]);
    }

    public function getBannersForMain()
    {
        return $this->find()
            ->where([
                'Banners.status' => BannersController::STATUS_ACTIVE,
                'Banners.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Users' => [
                    'fields' => [
                        'id',
                        'name'
                    ]
                ],
                'UsersUpdated' => [
                    'fields' => [
                        'id',
                        'name'
                    ]
                ]
            ])
            ->orderAsc('position');
    }

    public function getBannersMultiSelect($ids)
    {
        return $this->find()
            ->where([
                'Banners.id IN' => $ids,
                'Banners.lang' => I18n::getLocale(),
            ])
            ->all();
    }
}
