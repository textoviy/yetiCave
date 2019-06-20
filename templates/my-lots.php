<?php
//echo '<pre>';
//var_dump($lots_list);
//echo '<pre>';

?>

<section class="rates container">
    <h2>Мои ставки</h2>
    <table class="rates__list">
     <?php use Carbon\Carbon;
     use Jenssegers\Date\Date;

     if (count(array_values($lots_list))): ?>
     <?php foreach (array_values($lots_list) as $key => $val): ?>
      <tr class="rates__item">
        <td class="rates__info">
          <div class="rates__img">
            <img src="<?=$lots_list[$key]['lot_picture']; ?>" width="54" height="40" alt="Сноуборд">
          </div>

          <h3 class="rates__title"><a href="lot.php?lot_id=<?= $lots_list[$key]['lot_id']; ?>"><?=htmlspecialchars(($lots_list[$key]['lot_name'])) ?></a></h3>
            <br>
            <p><?= '' . $lots_list[$key]['user_contacts']; ?></p>

        </td>
        <td class="rates__category">
            <?=$lots_list[$key]['category_name']; ?>
        </td>
        <td class="rates__timer">
          <div class="timer">
              <?php

              $now = new DateTime();
              $date = DateTime::createFromFormat("Y-m-d H:i:s", $lots_list[$key]['lot_end_date']);
              $interval = $now->diff($date);
              echo $interval->d . ':' . $interval->h . ':' . $interval->i;

              ?></div>
        </td>
        <td class="rates__price">
            <?=format_text($lots_list[$key]['bid_amount']); ?>
        </td>
        <td class="rates__time">

            <?php
                Date::setLocale('ru');
//                echo $lot_end_date = Date::parse($lots_list[$key]['lot_end_date']);
//                $now_date = Date::now()->getTimestamp();
//                $date = $lot_end_date - $now_date;
//                var_dump(Date::parse($date)->toArray());
                 echo Date::parse($lots_list[$key]['lot_end_date'])->diffForHumans(['options' => Carbon::JUST_NOW | Carbon::ONE_DAY_WORDS | Carbon::TWO_DAY_WORDS]);
//            echo $interval->y, "\n"; // кол-во лет
//            echo $interval->d, "\n"; // кол-во дней
//            echo $interval->h, "\n"; // кол-во часов
//            echo $interval->i, "\n"; // кол-во минут

//            $now = new DateTime(); // текущее время на сервере
//            $date = DateTime::createFromFormat("Y-m-d H:i:s", '2014-09-12 23:59:45'); // задаем дату в любом формате
//            $interval = $now->diff($date); // получаем разницу в виде объекта DateInterval
//            echo $interval->y, "\n"; // кол-во лет
//            echo $interval->d, "\n"; // кол-во дней
//            echo $interval->h, "\n"; // кол-во часов
//            echo $interval->i, "\n"; // кол-во минут

//                echo $date = Date::parse($date);

//            echo $date->diffInSeconds();                       // 3665
//            echo $date->diffInMinutes();                       // 61
//            echo $date->diffInHours();                         // 1
//            echo $date->diffInDays();

            ?>
        </td>
      </tr>
     <?php endforeach; ?>
     <?php else: ?>
        <p>У вас еще нет ставок. <br>
        <a href="/">Найти лоты</a></p>
     <?php endif; ?>
    </table>
  </section>

