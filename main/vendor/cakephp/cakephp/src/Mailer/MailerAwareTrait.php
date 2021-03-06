<?php
/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @since         3.1.0
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */
namespace Cake\Mailer;

use Cake\Core\App;
use Cake\Mailer\Exception\MissingMailerException;

/**
 * Provides functionality for loading mailer classes
 * onto properties of the host object.
 *
 * Example users of this trait are Cake\Controller\Controller and
 * Cake\Console\Shell.
 */
trait MailerAwareTrait
{

    /**
     * Returns a mailer instance.
     *
     * @param string $name Mailer's name.
     * @param \Cake\Mailer\Email|null $email Email instance.
     * @return \Cake\Mailer\Mailer
     * @throws \Cake\Mailer\Exception\MissingMailerException if undefined mailer class.
     */
    protected function getMailer($name, Email $email = null)
    {
        if ($email === null) {
            $email = new Email();
            $email->setTransport('smtp');
        }

        $className = App::className($name, 'Mailer', 'Mailer');

        if (empty($className)) {
            throw new MissingMailerException(compact('name'));
        }

        return new $className($email);
    }
}
