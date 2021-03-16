<?php

namespace Newsletter\Model\Table;

use Cake\I18n\I18n;
use Croogo\Core\Model\Table\CroogoTable;

class NewslettersTable extends CroogoTable
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
        $this->belongsToMany('Articles.Articles', [
            'through' => 'Newsletter.NewslettersArticles',
            'strategy' => 'subquery',
        ]);
    }

    public function getCurrentNewsletter()
    {
        return $this->find()
            ->where([
                'status' => 1,
                'is_accepted' => 1,
                'lang' => I18n::getLocale(),
            ])
            ->orderDesc('created')
            ->first();
    }

    public function getCurrentNotAcceptedNewsletter()
    {
        return $this->find()
            ->where([
                'status' => 1,
                'is_accepted' => 0,
                'lang' => I18n::getLocale(),
            ])
            ->orderDesc('created')
            ->first();
    }

    public function getCurrentNewsletterWithArticles()
    {
        return $this->find()
            ->where([
                'Newsletters.status' => 1,
                'Newsletters.is_accepted' => 1
            ])
            ->contain([
                'Articles' => [
                    'Categories',
                    'Users' => [
                        'fields' => [
                            'id',
                            'name'
                        ]
                    ]
                ]
            ])
            ->orderDesc('created')
            ->first();
    }

    public function getNewslettersForHistory()
    {
        return $this->find()
            ->where([
                'Newsletters.status' => 0,
                'Newsletters.lang' => I18n::getLocale(),
            ])
            ->contain([
                'Articles' => [
                    'Categories',
                    'Users' => [
                        'fields' => [
                            'id',
                            'name'
                        ]
                    ]
                ]
            ])
            ->orderDesc('created');
    }

    public function getNewsletterForIndex()
    {
        return $this->find()
            ->where([
                'status' => 1,
                'lang' => I18n::getLocale(),
            ])
            ->orderDesc('created')
            ->first();
    }

    public function getNewsletterForDescription($newsletterId)
    {
        return $this->find()
            ->where([
                'id' => $newsletterId,
                'lang' => I18n::getLocale(),
            ])
            ->first();
    }

    public function getNewsletterForAccept($newsletterId)
    {
        return $this->find()
            ->where([
                'id' => $newsletterId,
                'status' => 1,
                'lang' => I18n::getLocale(),
            ])->first();
    }
}
