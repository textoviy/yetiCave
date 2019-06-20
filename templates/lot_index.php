<section class="lot-item container">
        <h2><?= isset($title) ? $title : ""; ?></h2>
        <div class="lot-item__content">
            <div class="lot-item__left">
                <div class="lot-item__image">
                    <img src="<?= isset($url) ? $url : ""; ?>" width="730" height="548" alt="Сноуборд">
                </div>
                <p class="lot-item__category">Категория: <span><?= isset($category_name) ? $category_name : "";?></span></p>
                <p class="lot-item__description"><?= isset($lot_description) ? $lot_description : ""; ?></p>
            </div>
            <div class="lot-item__right">
                <div class="lot-item__state">
                    <div class="lot-item__timer timer">
                        10:54:12
                    </div>
                    <div class="lot-item__cost-state">
                        <div class="lot-item__rate">
                            <span class="lot-item__amount">Текущая цена</span>
                            <span class="lot-item__cost"><?= isset($price) ? format_text($price) : "";?></span>
                        </div>
                        <div class="lot-item__min-cost <?= isset($error_bet) ? 'lot-item__min-cost--error' : ''; ?>">
                            Мин. ставка <span ><?= $min_bet;?></span>
                        </div>
                    </div>
                    <?php if ($is_auth): ?>
                        <form class="lot-item__form" action="lot.php?lot_id=<?= $_GET['lot_id']?>" method="post" enctype="application/x-www-form-urlencoded">
                            <p class="lot-item__form-item">
                                <label for="cost">Ваша ставка</label>
                                <span class="<?= isset($error_bet) ?  'red-error' : ''; ?>"> <?= $error_bet;?></span>
                                <input class="<?= isset($error_bet) ?  'cost-error' : ''; ?>" id="cost" type="number" name="cost" placeholder="<?= $min_bet;?>">
                            </p>
                            <button type="submit" class="button">Сделать ставку</button>
                        </form>
                    <?php endif; ?>
                </div>
                <div class="history">
                    <h3>История ставок (<span><?= count($lot_bets_information)?></span>)</h3>
                        <?php
                        use Jenssegers\Date\Date;
                        Date::setLocale('ru');
                        date_default_timezone_set('Asia/Yekaterinburg');
                        //Asia/Yekaterinburg

                        for($i = 0; $i < count($lot_bets_information) && $i <= 10; $i++) :?>
                    <table class="history__list">
                        <tr class="history__item">
                            <td class="history__name"><?= $lot_bets_information[$i]['user_name'] ?></td>
                            <td class="history__price"><?= $lot_bets_information[$i]['bid_amount']?></td>
                            <td class="history__time"><?= Date::parse($lot_bets_information[$i]['bid_date'])->diffForHumans()?></td>
                        </tr>
                        <?php endfor; ?>
                    </table>
                </div>
            </div>
        </div>
    </section>
