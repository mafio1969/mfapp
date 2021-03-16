<div class="darkView login-bg">
    <div class="overlay-bg"></div>
    <div class="container">
        <div class="login-page forgot-password">
            <h1><?= __('Forgot Password') ?></h1>
            <div class="login-page-form">
                <?= $this->Form->create('User', [
                    'url' => [
                        'controller' => 'users',
                        'action' => 'forgot'
                    ],
                    'class' => 'login-form'
                ]); ?>
                <?= $this->Form->input('username', [
                    'label' => false,
                    'placeholder' => __('Email'),
                    'required' => true,
                ]) ?>
                <?= $this->Form->submit(__('Submit'), ['class' => 'btn']) ?>
                <?= $this->Form->end() ?>
            </div>
        </div>
    </div>
</div>
