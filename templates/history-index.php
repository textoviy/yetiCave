<?php $i = 0;
        $lot_ids = array_keys($viewed_lots);
        var_dump($viewed_lots);
?>
   <section class="lots">
    <div class="lots__header">
        <h2><?= $lots_title;?></h2>
    </div>
    <ul class="lots__list">

        <!--  -->
        <?php foreach (array_values($viewed_lots) as $key => $val): ?>
           
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?=$val[0]['lot_picture']; ?>" width="350" height="260" alt="Сноуборд">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?=$val[0]['category_name']; ?></span>
                    <h3 class="lot__title">
                        <a class="text-link" href="lot.php?lot_id=<?=$lot_ids[$i]; ?>"><?=htmlspecialchars(($val[0]['lot_name'])) ?></a>
                    </h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая цена</span>
                            <span class="lot__cost"><?=format_text($val[0]['lot_start_price']); ?></span>
                        </div>
                        <div class="lot__timer timer">
                            <?= $timer;?>
                        </div>
                    </div>
                </div>
            </li>
            <?php $i++?>
        <?php endforeach; ?>

    </ul>
</section>