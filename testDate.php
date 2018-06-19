<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <?php
date_default_timezone_set("Europe/Moscow");

// Покажем текущую дату
$curdate = date('d.m.Y');
print("Текущая дата: $curdate<br>");

// Покажем текущее время
$curtime = date('H:i:s');
print("Текущее время: $curtime<br>");

// Сколько времени сейчас в NY
date_default_timezone_set("America/New_York");
$nytime = $curtime = date('H:i:s');
print("Время в Нью-Йорке: $nytime<br>");

setlocale(LC_ALL, 'ru_RU');
// Какой сейчас день недели
$dow = strftime("%A");
print("День недели: $dow<br>");

// Сколько осталось дней до нового года
$curday = date('z');
$ydc = date('L') ? 366 : 365;
$days_remaining = $ydc - $curday;

print("До нового года осталось дней: $days_remaining");



$arr_top = [
        "root" => "root",
        "trash" => "trash",
        "sex" => "sex"
];
print(extract($arr_top));
print($arr_top);
?>
</body>
</html>