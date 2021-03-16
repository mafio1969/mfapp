<?php

use Croogo\Users\Controller\Component\UserComponent;

/**
 * @var $users
 */

?>
<div class="articles-list-page user-page">
    <div class="page-title">
        <div class="container">
            <h1><?= __('Users'); ?></h1>
        </div>
    </div>
    <div class="container">
        <div class="filters">
            <?php
            echo $this->Form->create(null, [
                'type' => 'GET',
                'novalidate' => true,
                'url' => [
                    'plugin' => 'Croogo/Users',
                    'controller' => 'Users',
                    'action' => 'index'
                ],
            ]);
            echo $this->Form->input('name', [
                'label' => false,
                'placeholder' => __('Search for user'),
                'value' => $this->request->getQuery('name')
            ]);
            echo $this->Form->input('roles',
                [
                    'class' => 'js-example-basic-single',
                    'type' => 'select',
                    'multiple' => true,
                    'label' => false,
                    'value' => $this->request->getQuery('roles'),
                    'style' => 'width:100%'
                ]);
            echo $this->Form->submit(__('Filter'), [
                'type' => 'submit',
                'class' => 'btn'
            ]);
            echo $this->Html->link('Reset',
                [
                    'action' => 'index',
                ],
                [
                    'class' => 'btn reset',
                ]
            );
            echo $this->Form->end();
            ?>
        </div>
        <div class="page-inner-content users-list">
            <div class="news-list">
                <?php
                foreach ($users as $user) {
                    $userPhoto = UserComponent::IMAGE_BLANK_USER;
                    if (!empty($user->image)) {
                        $userPhoto = $user->image;
                    }
                    ?>
                    <div class="news-list-item">
                        <?= $this->Html->link(
                            '<div class="user-img"
                                 style="background: url('
                            . DS . UserComponent::IMAGE_PREFIX . DS . $userPhoto . ') no-repeat center; background-size: cover;"></div>
                                <p class="user-name">' . $user->name . '</p>',
                            [
                                'plugin' => 'Croogo/Users',
                                'controller' => 'Users',
                                'action' => 'view',
                                $user->id
                            ]
                        ); ?>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
    </div>
</div>
<?php

echo $this->element('CryptoTheme.paginator');

?>
<script>
    $(document).ready(function () {
        $('.js-example-basic-single').select2({
            tags: true,
            placeholder: "<?= __('Search role'); ?>"
            // maximumSelectionLength: 3
        });
    });
</script>
