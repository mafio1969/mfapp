<?php

use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $users
 */

?>
<div class="articles-list-page user-page">
    <div class="page-title">
        <div class="container">
            <h1><?= __('System e-mail templates view'); ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="page-inner-content users-list">
            <div class="news-list">
                <div class="news-list-item">
                    <p class="user-name" onclick="$('#registerTemplate').toggle();"><?= __('Activate your account') ?></p>
                    <div id="registerTemplate" style="display:block; width: 100%; height: auto; background-color: #fff!important;">
                        <?php
                        include(ROOT . '/vendor/croogo/croogo/Users/src/Template/Email/html/register.ctp');
                        ?>
                    </div>
                </div>
                <div class="news-list-item">
                    <p class="user-name" onclick="$('#resetPasswordTemplate').toggle();"><?= __('Reset your password') ?></p>
                    <div id="resetPasswordTemplate" style="display:block; width: 100%; height: auto; background-color: #fff!important;">
                        <?php
                            include(ROOT . '/vendor/croogo/croogo/Users/src/Template/Email/html/forgot_password.ctp');
                        ?>
                    </div>
                </div>
                <div class="news-list-item">
                    <p class="user-name" onclick="$('#noticeSingleTemplate').toggle();"><?= __('Inbox') ?> - single</p>
                    <div id="noticeSingleTemplate" style="display:block; width: 100%; height: auto; background-color: #fff!important;">
                        <?php
                        include(ROOT . '/vendor/croogo/croogo/Users/src/Template/Email/html/notice_single.ctp');
                        ?>
                    </div>
                </div>
                <div class="news-list-item">
                    <p class="user-name" onclick="$('#noticeMultiTemplate').toggle();"><?= __('Inbox') ?> - multi</p>
                    <div id="noticeMultiTemplate" style="display:block; width: 100%; height: auto; background-color: #fff!important;">
                        <?php
                            include(ROOT . '/vendor/croogo/croogo/Users/src/Template/Email/html/notice_multi.ctp');
                        ?>
                    </div>
                </div>
                <div class="news-list-item">
                    <a class="user-name" onclick="$('#newsletterTemplate').toggle();"><?= __('Newsletter') ?></a>
                    <div id="newsletterTemplate" style="display:block; width: 100%; height: auto; background-color: #fff!important;">
                        <?php
                        include(ROOT . '/vendor/croogo/croogo/Users/src/Template/Email/html/newsletter.ctp');
                        ?>
                    </div>
                </div>
                <div class="news-list-item">
                    <a class="user-name" onclick="$('#mailingTemplate').toggle();"><?= __('Mailing to users group') ?></a>
                    <div id="newsletterTemplate" style="display:block; width: 100%; height: auto; background-color: #fff!important;">
                        <?php
                        include(ROOT . '/vendor/croogo/croogo/Users/src/Template/Email/html/mailing.ctp');
                        ?>
                    </div>
                </div>
                <div class="news-list-item">
                    <a class="user-name" onclick="$('#openPortalTemplate').toggle();"><?= __('Open the website') ?></a>
                    <div id="openPortalTemplate" style="display:block; width: 100%; height: auto; background-color: #fff!important;">
                        <?php
                        include(ROOT . '/vendor/croogo/croogo/Users/src/Template/Email/html/open_portal.ctp');
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
