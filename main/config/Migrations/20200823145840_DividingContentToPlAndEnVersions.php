<?php
use Migrations\AbstractMigration;

class DividingContentToPlAndEnVersions extends AbstractMigration
{
    /**
     * Change Method.
     *
     * @return void
     */
    public function change(): void
    {
        $this->addLangColumn('articles');
        $this->addLangColumn('banners');
        $this->addLangColumn('categories');
        $this->addLangColumn('newsletters');
    }

    /**
     * Change Method.
     *
     * @param string $tableName
     *
     * @return void
     */
    private function addLangColumn(string $tableName): void
    {
        $table = $this->table($tableName);
        $table->addColumn('lang', 'string', [
            'default' => 'pl_PL',
            'limit' => 20,
            'null' => false,
        ]);
        $table->update();
    }
}
