<?php


namespace Subscriptions\Model\Table;


use Cake\Validation\Validator;
use Croogo\Core\Model\Table\CroogoTable;

class SubscriptionsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->addBehavior('Timestamp', [
            'events' => [
                'Model.beforeSave' => [
                    'created' => 'new'
                ]
            ]
        ]);
    }

    public function validationDefault(Validator $validator)
    {
        return $validator
            ->add('email', [
                'notEmpty' => [
                    'rule' => 'notBlank',
                    'message' => 'Email cannot be empty.',
                    'last' => true
                ],
                'email' => [
                    'rule' => 'email',
                    'message' => 'Please provide a valid email address.',
                    'last' => true
                ],
                'validateUnique' => [
                    'rule' => 'validateUnique',
                    'provider' => 'table',
                    'message' => 'Email address already in subscription.',
                    'last' => true
                ]
            ]);
    }

    public function getSubscriptionsForMailing($conditions, $limit)
    {
        return $this->find()
            ->select([
                'id',
                'email',
            ])
            ->where($conditions)
            ->orderAsc('id')
            ->limit($limit);
    }

    public function checkSubscriptionsForMailing($lastId)
    {
        return $this->find()
            ->select(['id'])
            ->where(['id > ' => $lastId])
            ->orderAsc('id')
            ->limit(1);
    }
}
