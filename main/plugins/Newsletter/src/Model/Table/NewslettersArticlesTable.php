<?php


namespace Newsletter\Model\Table;


use Croogo\Core\Model\Table\CroogoTable;

class NewslettersArticlesTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Articles', [
            'className' => 'Articles.Articles',
        ]);
        $this->belongsTo('Newsletters', [
            'className' => 'Newsletter.Newsletters',
        ]);
    }
}
