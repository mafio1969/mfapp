<?php


namespace Reports\View\Helper;


use Cake\View\Helper;
use Croogo\Users\Controller\Component\UserComponent;
use Reports\Controller\ReportsController;

class ReportsHelper extends Helper
{

    public $helpers = [
        'Html',
        'Image2Helper.Image2'
    ];

    public function getReportContentTypes()
    {
        return [
            ReportsController::REPORT_CONTENT_REASON_MISSPELL => __('Misspellings and errors (Editing and proofreading need)'),
            ReportsController::REPORT_CONTENT_REASON_PLAGIARISM => __('Plagiarism and deception (Article link need)'),
            ReportsController::REPORT_CONTENT_REASON_OTHER => __('Other')
        ];
    }

    public function getReportUserTypes()
    {
        return [
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_NAME => __('Inappropriate username'),
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_PHOTO => __('Inappropriate user photo'),
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_DESCRIPTION => __('Inappropriate user description'),
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_CONTENT => __('User publishes inappropriate content'),
            ReportsController::REPORT_USER_REASON_FAKE_ACCOUNT => __('A fake account or user is impersonating'),
            ReportsController::REPORT_USER_REASON_OTHER => __('Other'),

        ];
    }

    public function getReportTranslations()
    {
        return ReportsController::getReportsTypesTranslations();
    }

    public function getReportsActionsTranslations()
    {
        return [
            ReportsController::REPORT_STATUS_ACCEPTED => 'Resolve as accepted',
            ReportsController::REPORT_STATUS_REJECTED => 'Resolve as rejected',
            ReportsController::REPORT_STATUS_CONTACT => 'Contact with user',
            ReportsController::REPORT_STATUS_OBJECTION => 'Objection raised',
            ReportsController::REPORT_STATUS_USER_BLOCK => 'User blocked',
            ReportsController::REPORT_STATUS_USER_PERMISSIONS_BLOCK => 'User permissions blocked',
            ReportsController::REPORT_STATUS_CONTENT_REMOVE => 'Content has been removed',
            ReportsController::REPORT_STATUS_COMMENT_REMOVE => 'Comment has been removed',
            ReportsController::REPORT_STATUS_REJECT_REMOVE => 'Reject has been removed',
        ];
    }

    public function getReportReasonType($data)
    {
        $translations = $this->getReportTranslations();
        if (in_array((int)$data->reason_type, [
            ReportsController::REPORT_CONTENT_REASON_MISSPELL,
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_NAME,
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_PHOTO,
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_DESCRIPTION,
            ReportsController::REPORT_USER_REASON_INAPPROPRIATE_CONTENT,
            ReportsController::REPORT_USER_REASON_FAKE_ACCOUNT,
            ReportsController::REPORT_CONTENT_REASON_PLAGIARISM,
            ReportsController::REPORT_CONTENT_REASON_OTHER,
            ReportsController::REPORT_USER_REASON_OTHER,
            ReportsController::REPORT_RESOLVE_REASON_OTHER
        ])) {
            return $translations[$data->reason_type];
        }
        return '';
    }

    public function getReportReason($data)
    {
        if (in_array((int)$data->reason_type, [
            ReportsController::REPORT_CONTENT_REASON_PLAGIARISM,
            ReportsController::REPORT_CONTENT_REASON_OTHER,
            ReportsController::REPORT_USER_REASON_OTHER,
            ReportsController::REPORT_RESOLVE_REASON_OTHER
        ])) {
            return $data->reason_content;
        }
        return '';
    }

    public function getReportStatus($status)
    {
        if (in_array(
            (int)$status,
            [
                (int)ReportsController::REPORT_STATUS_ACCEPTED,
                (int)ReportsController::REPORT_STATUS_USER_BLOCK,
                (int)ReportsController::REPORT_STATUS_USER_PERMISSIONS_BLOCK,
                (int)ReportsController::REPORT_STATUS_CONTENT_REMOVE,
                (int)ReportsController::REPORT_STATUS_COMMENT_REMOVE,
                (int)ReportsController::REPORT_STATUS_REJECT_REMOVE,
            ]
        )) {
            return '<span class="status accepted">' . __('Accepted') . '</span>';
        } elseif ((int)$status === (int)ReportsController::REPORT_STATUS_REJECTED) {
            return '<span class="status rejected">' . __('Rejected') . '</span>';
        } elseif ((int)$status === (int)ReportsController::REPORT_STATUS_CONTACT) {
            return '<span class="status verification">' . __('Waiting for verification') . '</span>';
        } else {
            return '<span class="status waiting">' . __('Waiting') . '</span>';
        }
    }

    public function isRaiseObjection($level, $status)
    {
        if ((int)$level === ReportsController::REPORT_LEVEL_I
            && (int)$status === ReportsController::REPORT_STATUS_REJECTED) {
            return true;
        }
        return false;
    }

    public function getReportHistoryDescription($item, $data)
    {
        if ((int)$item->report_type_id === ReportsController::REPORT_TYPE_USER) {
            return $item->reported_user->name;
        } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_CONTENT) {
            if ((int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_NEWS
                || (int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_QUESTION) {
                return strip_tags($item->reported_content->title);
            } else {
                return strip_tags($item->reported_comment->description);
            }
        } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_RESOLVE) {
            return strip_tags($item->reported_resolve->title);
        } else {
            return strip_tags($data->description);
        }
    }

    public function getReportDescription($item, $data)
    {
        $contentDescription = '';
        if ((int)$item->report_type_id === ReportsController::REPORT_TYPE_USER) {
            $contentDescription = '"' . $this->Html->link($item->reported_user->name, [
                    'plugin' => 'Croogo/Users',
                    'controller' => 'Users',
                    'action' => 'view',
                    $item->reported_user->id
                ]) . '"';
            if ((int)$data->reason_type === ReportsController::REPORT_USER_REASON_OTHER) {
                $contentDescription .= ': "' . $data->reason_content . '"';
            } else {
                $contentDescription .= ': "' . ReportsController::getReportsTypesTranslations()[$data->reason_type] . '"';
            }
        } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_CONTENT) {
            if ((int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_NEWS
                || (int)$item->report_content_type_id === ReportsController::REPORT_CONTENT_TYPE_QUESTION) {
                $contentDescription = '"' . $this->Html->link(substr(strip_tags($item->reported_content->title),0,150), [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'view',
                        $item->reported_content->id
                    ]) . '"';
            } else {
                $contentDescription = '"' . $this->Html->link(substr(strip_tags($item->reported_comment->description),0,150), [
                        'plugin' => 'Articles',
                        'controller' => 'Articles',
                        'action' => 'view',
                        $item->reported_comment->article->id,
                        'open' => $item->reported_comment->id
                    ]) . '"';
            }
        } elseif ((int)$item->report_type_id === ReportsController::REPORT_TYPE_RESOLVE) {
            $contentDescription = '"' . $this->Html->link(substr($item->reported_resolve->title,0, 150), [
                    'plugin' => 'Articles',
                    'controller' => 'Articles',
                    'action' => 'view',
                    $item->reported_resolve->id
                ]) . '"';
        }
        return $contentDescription;
    }

    public function getReportCreator($item)
    {
        $itemCreatorPhoto = UserComponent::IMAGE_BLANK_USER;
        if (!empty($item->creator->image)) {
            $itemCreatorPhoto = $item->creator->image;
        }
        $cropItemCreatorPhoto = $this->Image2->source(DS . UserComponent::IMAGE_PREFIX . DS . $itemCreatorPhoto)
            ->crop(30, 30)
            ->imagePath();
        $userName = isset($item->creator->name) ? $item->creator->name : __('Deleted user');
        $itemCreator = __('User').' <span class="user-img" style="background: url('
        . $cropItemCreatorPhoto .
        ') no-repeat center; background-size: cover;"></span>'. $this->Html->link('<b>' . $userName . '</b>', [
                'plugin' => 'Croogo/Users',
                'controller' => 'Users',
                'action' => 'view',
                $item->creator->id
            ]);
        return $itemCreator;
    }
}
