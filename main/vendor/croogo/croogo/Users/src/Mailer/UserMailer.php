<?php

namespace Croogo\Users\Mailer;

use Cake\Core\Configure;
use Cake\Event\Event;
use Cake\Mailer\Mailer;
use Croogo\Users\Model\Entity\User;
use Newsletter\Model\Entity\Mailing;
use Newsletter\Model\Entity\Newsletter;
use Notices\Model\Table\NoticesEmailsTable;

class UserMailer extends Mailer
{

    public $layout = 'default';

    public function implementedEvents()
    {
        return [
            'Users.registered' => 'onRegistration'
        ];
    }

    public function resetPassword(User $user)
    {
        return $this
            ->profile('smtp')
            ->setTo($user->email)
            ->setSubject(__d('croogo', '[%s] Reset Password', Configure::read('Site.title')))
            ->setTemplate('Croogo/Users.forgot_password')
            ->setEmailFormat('both')
            ->set([
                'user' => $user
            ]);
    }

    public function registrationActivation(User $user)
    {
        return $this
            ->profile('smtp')
            ->setTo($user->email)
            ->setSubject(__d('croogo', '[%s] Please activate your account', Configure::read('Site.title')))
            ->setTemplate('Croogo/Users.register')
            ->setEmailFormat('both')
            ->set([
                'user' => $user
            ]);
    }

    public function userNewsletter(User $user, Newsletter $newsletter)
    {
        return $this
            ->profile('smtp')
            ->setTo($user->email)
            ->setSubject(Configure::read('Site.title') . ' ' . __('Newsletter'))
            ->setTemplate('Croogo/Users.newsletter')
            ->setEmailFormat('both')
            ->set([
                'user' => $user,
                'newsletter' => $newsletter
            ]);
    }

    public function userNoticeSingle(User $user, $notice)
    {
        return $this
            ->profile('smtp')
            ->setTo($user->email)
            ->setSubject(Configure::read('Site.title') . ' ' . __('Inbox'))
            ->setTemplate('Croogo/Users.notice_single')
            ->setEmailFormat('both')
            ->set([
                'user' => $user,
                'notice' => $notice
            ]);
    }

    public function userNoticeMulti(User $user, $notices)
    {
        return $this
            ->profile('smtp')
            ->setTo($user->email)
            ->setSubject(Configure::read('Site.title') . ' ' . __('Inbox'))
            ->setTemplate('Croogo/Users.notice_multi')
            ->setEmailFormat('both')
            ->set([
                'user' => $user,
                'notices' => $notices
            ]);
    }

    public function userMailing(string $email, Mailing $mailing)
    {
        return $this
            ->profile('smtp')
            ->setTo($email)
            ->setSubject(Configure::read('Site.title') . ' ' . $mailing->title)
            ->setTemplate('Croogo/Users.mailing')
            ->setEmailFormat('html')
            ->set([
                'mailing' => $mailing
            ]);
    }

    public function userNoticeOpenPortal(User $user)
    {
        return $this
            ->profile('smtp')
            ->setTo('office@adddesign.org')
            ->setSubject(Configure::read('Site.title') . ' ' . __('Open for new users'))
            ->setTemplate('Croogo/Users.open_portal')
            ->setEmailFormat('html')
            ->set([
                'user' => $user,
            ]);
    }

    public function onRegistration(Event $event, User $user)
    {
        $this->send('registrationActivation', [$user]);
    }
}
