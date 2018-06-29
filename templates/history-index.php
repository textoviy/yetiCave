<section class="lots">
    <div class="lots__header">
        <h2><?= $lots_title;?></h2>
    </div>
    <ul class="lots__list">

        <!--  -->
        <?php foreach (array_values($viewed_lots_id) as $key => $val): ?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?=$lots_list[$val]['url']; ?>" width="350" height="260" alt="Сноуборд">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?=$lots_list[$val]['category_name']; ?></span>
                    <h3 class="lot__title">
                        <a class="text-link" href="lot.php?lot_id=<?= array_search($viewed_lots_id[$key], array_keys($lots_list)); ?>"><?=htmlspecialchars(($lots_list[$val]['title'])) ?></a>
                    </h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая цена</span>
                            <span class="lot__cost"><?=format_text($lots_list[$val]['price']); ?></span>
                        </div>
                        <div class="lot__timer timer">
                            <?= $timer;?>
                        </div>
                    </div>
                </div>
            </li>
        <?php endforeach; ?>

    </ul>
</section>