<?php

namespace Notes\Model\Table;

use Croogo\Core\Model\Table\CroogoTable;

class RejectsCommentsTable extends CroogoTable
{
    public function initialize(array $config)
    {
        parent::initialize($config);
        $this->belongsTo('Rejects', [
            'className' => 'Notes.Rejects'
        ]);
        $this->belongsTo('Users', [
            'className' => 'Croogo/Users.Users',
        ]);
        $this->hasMany('SubRejectsComments', [
            'className' => 'Notes.RejectsComments',
            'foreignKey' => 'parent_id'
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

    public function getParent($parentId)
    {
        return $this->find()
            ->where(
                [
                    'id' => $parentId,
                    'parent_id IS' => null
                ]
            )
            ->first();
    }

    public function getParentForComment($id)
    {
        return $this->find()
            ->where([
                'RejectsComments.id' => $id,
                'RejectsComments.parent_id IS' => null
            ])
            ->contain(['Users'])
            ->first();
    }

    public function getParentForRemove($commentId)
    {
        return $this->find()
            ->select(['id', 'is_deleted'])
            ->where([
                'id' => $commentId,
                'parent_id IS ' => null
            ])
            ->first();
    }

    public function getChildForRemove($commentId)
    {
        return $this->find()
            ->select(['id', 'is_deleted'])
            ->where([
                'id' => $commentId,
                'parent_id IS NOT' => null
            ])
            ->first();
    }

    public function getRejectCommentForEdit($commentId)
    {
        return $this->find()
            ->select(['id', 'user_id', 'description'])
            ->where(['id' => $commentId])
            ->first();
    }

    public function getForReportRemove($commentId)
    {
        return $this->find()
            ->select([
                'id',
                'is_deleted',
                'is_deleted_by'
            ])
            ->where([
                'id' => $commentId
            ])
            ->first();
    }
}
