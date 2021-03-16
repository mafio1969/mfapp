<?php

use Cake\Routing\Router;

/**
 * @var $mailing
 */

?>
<style>
    .btn {
        background-color: #0973ba;
    }
    .btn:hover {
        background-color: #1e417c;
    }
    .link {
        color: #000;
    }
    .blue-link {
        color: #0973ba;
    }
    .blue-link:hover,
    .link:hover {
        color: #1e417c;
    }
</style>
<div style="background-color: #f6f8f1; background-image: url('https://ccfound.com/img/slider-bg.jpg'); margin: 0 auto; padding: 40px 0 40px 0;">
    <table border="0" cellpadding="0" cellspacing="0" style="margin: 0 auto;">
        <tr>
            <td>
                <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-radius: 40px; background-color: #fff; max-width: 700px">
                    <tr>
                        <td align="center" style="padding: 25px 0 25px 0; background-color: #ebebeb; border-top-left-radius: 40px; border-top-right-radius: 40px;">
                            <img src="https://ccfound.com/img/logo.png" alt="ccfound Logo" style="max-width: 200px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-family: 'Quicksand', Arial, sans-serif;">
                            <table border="0" cellpadding="0" cellspacing="0" style="max-width: 100%">
                                <tr>
                                    <td align="center" style="padding: 40px 30px 10px 30px;">
                                        <p style="font-size: 14px; margin: 6px 0 30px 0;text-align: center !important;"><?= strip_tags($mailing->description) ?></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="padding: 40px 0 0 0; font-size: 12px;">
                                        <p style="margin-bottom: 10px"><?= __('Automatically generated mail, please do not reply to it.') ?></p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="padding: 5px 0 5px 0; background-color: #ebebeb; border-bottom-left-radius: 40px; border-bottom-right-radius: 40px; font-family: 'Quicksand', Arial, sans-serif; font-size: 12px">
                            <p style="margin-bottom: 4px">CCFOUND sp. z o.o. sp.k. Ul. Dmowskiego 3/9, 50-203 Wrocław</p>
                            <p style="margin-top: 0">KRS 0000841288 NIP 8982257666 REGON 386055341</p>
                            <p>
                                <a href="https://ccfound.com/terms" class="link" style="text-decoration: none; color: #000;"><?= __('Terms and privacy policy') ?></a>
                            </p>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
</div>
