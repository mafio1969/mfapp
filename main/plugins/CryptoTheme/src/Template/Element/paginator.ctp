<nav class="nav-pagination">
    <?php
    if ((int)$this->Paginator->total() > 1) {
        ?>
        <ul class="pagination">
            <?php
            echo $this->Paginator->prev('');
                   echo $this->Paginator->first('');
                   echo $this->Paginator->numbers();
                   echo $this->Paginator->last('');
            echo $this->Paginator->next('');
            ?>
        </ul>
        <?php
    }
    ?>
</nav>

