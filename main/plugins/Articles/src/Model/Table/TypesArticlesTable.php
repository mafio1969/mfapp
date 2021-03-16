<?php

namespace Articles\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class TypesArticlesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->hasMany('Articles', [
            'className' => 'Articles.Articles',
        ]);
    }
}
