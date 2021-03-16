<?php


namespace Notices\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class NoticesSubscriptionsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->belongsTo('Notices', [
            'className' => 'Notices.Notices',
        ]);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new',
                ]
            ]
        ]);
    }

    public function checkIfExists($userId, $noticeId)
    {
        return $this->find()
            ->where([
                'user_id' => $userId,
                'notice_id' => $noticeId
            ])
            ->first();
    }
}
