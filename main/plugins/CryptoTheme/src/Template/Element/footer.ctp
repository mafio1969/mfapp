<footer>
    <div class="container">
        <div class="row homeRow">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 homeCol fBorder">
                <div class="logo-footer">
                    <a href="#"><img src="/img/logo.png" title="Logo" alt="CCFOUND Logo"/></a>
                </div>
                <div class="menu-footer">
                    <ul>
                        <li><?= $this->Html->link(__('Terms and privacy policy'), [
                                'plugin' => 'Croogo/Users',
                                'controller' => 'Users',
                                'action' => 'terms',
                            ]); ?></li>
                        <li><?= $this->Html->link(__('AML Policy'), [
                                'plugin' => 'Croogo/Users',
                                'controller' => 'Users',
                                'action' => 'aml',
                            ]); ?></li>
                    </ul>
                </div>
                <p>(c) CCFOUND sp. z o.o. sp.k.</p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 homeCol fBorder">
                <div class="social">
                    <?php
                    if ($this->request->getParam('lang') === 'pl') {
                        ?>
                        <a href="https://www.facebook.com/groups/1894133730632907/" target="_blank">
                            <img src="/img/facebook.png" title="Facebook" alt="Instytut Kryptografii, Klub Tradera Radosław Rygielski - grupa na Facebooku"/>
                        </a>
                        <a href="https://www.facebook.com/groups/1938913913050105/" target="_blank">
                            <img src="/img/facebook.png" title="Facebook" alt="Instytut Kryptografii, Kryptowaluty, Bitcoin - grupa na Facebooku"/>
                        </a>
                        <a href="https://www.youtube.com/channel/UCUn8HNJJ4rMGKeQG11cowCg" target="_blank">
                            <img src="/img/youtube.png" title="YouTube" alt="Instytut Kryptografii - profil na YouTube"/>
                        </a>
                        <?php
                    } else {
                        ?>
                        <a href="https://www.facebook.com/Cryptography-Institute-326262424562282" target="_blank">
                            <img src="/img/facebook.png" alt="Facebook" alt="Cryptography Institute - Facebook profile"/>
                        </a>
                        <?php
                    }
                    ?>

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 homeCol contactCol">
                <div class="contact-footer">
                    <h6><?= __('Contact'); ?></h6>
                    <?php
                    if ($this->request->getParam('lang') === 'pl') {
                        ?>
                        <p>CCFOUND sp. z o.o. sp.k.</p>
                        <p>Ul. Dmowskiego 3/9, 50-203 Wrocław</p>
                        <p>KRS 0000841288</p>
                        <p>NIP 8982257666</p>
                        <p>REGON 386055341</p>
                        <p><a href="mailto:support@ccfound.com">support@ccfound.com</a></p>
                        <?php
                    } else {
                        ?>
                        <p>CCFOUND sp. z o.o. sp.k.</p>
                        <p>ul. Dmowskiego 3/9, 50-203 Wrocław</p>
                        <p>KRS 0000841288</p>
                        <p>NIP 8982257666</p>
                        <p>REGON 386055341</p>
                        <p><a href="mailto:support@ccfound.com">support@ccfound.com</a></p>
                        <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</footer>
