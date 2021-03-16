<h2>Settings</h2>
<ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#general">General</a></li>
    <li><a data-toggle="pill" href="#inbox">Inbox</a></li>
</ul>
<div class="tab-content">
    <div id="general" class="tab-pane fade in active">
        <div class="tab-content">
            <h2>General</h2>
            <?php
            echo $this->Form->create($user, ['type' => 'file']);
            echo $this->Form->input('name');
            echo $this->Form->input('photo', ['type' => 'file']);
            echo $this->Form->input('bio');
            ?>
        </div>
    </div>
    <div id="inbox" class="tab-pane fade">
        <h2>Inbox</h2>
        <div class="tab-content">
            <?php
            foreach ($attributes as $attribute) {
                ?>
                <span><?= __($attribute['label']); ?></span>
                <?php
                echo $this->Form->input('settings.' . $attribute['name'] . '.inbox', [
                    'type' => 'checkbox',
                    'label' => ['text' => 'Inbox']
                ]);
                echo $this->Form->input('settings.' . $attribute['name'] . '.mail', [
                    'type' => 'checkbox',
                    'label' => ['text' => 'Email']
                ]);
                echo $this->Form->input('settings.' . $attribute['name'] . '.frequency', [
                    'type' => 'select',
                    'options' => [
                        0 => 'Every day',
                        1 => 'Every week'
                    ],
                    'label' => false
                ]);
            }
            ?>
        </div>
    </div>
</div>
<?php
echo $this->Form->submit(__('Save'), ['class' => 'btn btn-warning']);
echo $this->Form->end();
