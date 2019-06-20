    <pre>
        
    </pre>
    <section class="lots">
      <h2>Результаты поиска по запросу «<span><?=$_GET["search"]?></span>»</h2>
      <ul class="lots__list">
        
        <!--  -->


        <?php foreach (array_values($lots_list) as $key => $val): ?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?=$lots_list[$key]['lot_picture']; ?>" width="350" height="260" alt="Сноуборд">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?=$lots_list[$key]['category_name']; ?></span>
                    <h3 class="lot__title">
                      <?//= $lots_list[$key]['lot_id']; ?>
                        <a class="text-link" href="lot.php?lot_id=<?= $lots_list[$key]['lot_id']; ?>"><?=htmlspecialchars(($lots_list[$key]['lot_name'])) ?></a>
                    </h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая цена</span>
                            <span class="lot__cost"><?=format_text($lots_list[$key]['lot_start_price']); ?></span>
                        </div>
                        <div class="lot__timer timer">
                            <?= $timer;?>
                        </div>
                    </div>
                </div>
            </li>
        <?php endforeach; ?>
        <!--  -->
      </ul>
    </section>
    <ul class="pagination-list">
      <li class="pagination-item pagination-item-prev"><a>Назад</a></li>
      <li class="pagination-item pagination-item-active"><a>1</a></li>
      <li class="pagination-item"><a href="#">2</a></li>
      <li class="pagination-item"><a href="#">3</a></li>
      <li class="pagination-item"><a href="#">4</a></li>
      <li class="pagination-item pagination-item-next"><a href="#">Вперед</a></li>
    </ul>