<?php

namespace Articles\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class ArticlesResolvesTable extends CroogoTable
{
    const RESOLVE_LEVEL_I = 1;
    const RESOLVE_LEVEL_IV = 2;

    public static function resolveLevel($currentLevel)
    {
        ++$currentLevel;
        $levels = [
            self::RESOLVE_LEVEL_I => self::RESOLVE_LEVEL_I,
            self::RESOLVE_LEVEL_IV => self::RESOLVE_LEVEL_IV
        ];
        if (isset($levels[$currentLevel])) {
            return $levels[$currentLevel];
        }
        return false;
    }

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
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
    }
}
