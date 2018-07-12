<?php
//
//echo '<pre>';
//var_dump();
//echo '</pre>';
require 'templates/functions.php';
// require 'templates/lots_list.php';
require 'config/db.php';

$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);

$sql = "SELECT lot_id, lot_picture, category_name, lot_name, lot_start_price  FROM lots INNER JOIN categories ON lot_category = category_id";
$result = mysqli_prepare($db, $sql);
$stmt = db_get_prepare_stmt($db, $sql, []);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$lots_list = mysqli_fetch_all($result, MYSQLI_ASSOC);

$sql = "SELECT bid_date, bid_amount, bid_user, bid_lot, user_name 
    FROM bids INNER JOIN users ON bid_user = user_id WHERE bid_lot = '$lot_id' ORDER BY bid_amount DESC";
$result = mysqli_prepare($db, $sql);
$stmt = db_get_prepare_stmt($db, $sql, []);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$lot_bets_information = mysqli_fetch_all($result, MYSQLI_ASSOC);


session_start();

if (isset($_SESSION['user'])) {
    var_dump($_SESSION);
    $is_auth = true;
    $user_name = $_SESSION['user']['user_name'];
    $user_avatar = isset($_SESSION['user']['user_avatar']) ? $_SESSION['user']['user_avatar']  : 'img/user.jpg';
}

date_default_timezone_set("Europe/Moscow");
$ts = time();
$secsInDay = 86400;
$tsMidnight = strtotime('tomorrow');
$secsToMidnight = $tsMidnight - $ts;

$hours = floor($secsToMidnight / 3600);
$minutes = floor(($secsToMidnight % 3600) / 60);


$timer = $hours . " : " . $minutes;

if ($minutes < 10) {
    $minutes = 0 . $minutes ;
};

if ($hours < 10) {
    $hours = 0 . $hours ;
};


$user_avatar = 'img/user.jpg';




$content = renderTemplate('templates/index.php', [
    'id' => $id,
    'categories' => $categories,
    'lots_list' => $lots_list,
    'timer' => $timer,

]);


$layout_content = renderTemplate('templates/layout.php', [
    'nav' => $nav,
    'main_title' => 'yetiCave - аукцион',
    'categories' => $categories,
    'content' => $content,
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'user_avatar' => $user_avatar,
]);

print($layout_content);

?>




