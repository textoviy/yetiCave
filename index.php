<?php
require 'vendor/autoload.php';
require 'classes/Mail.php';
require 'classes/Winners.php';

use Jenssegers\Date\Date;
//echo '<pre>';
//var_dump();
//echo '</pre>';
require 'templates/functions.php';
// require 'templates/lots_list.php';
require 'config/db.php';

$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);

session_start();

//$sql = "SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, max(bid_amount), bid_user, user_email
//  FROM `lots`
//  INNER JOIN `categories`
//          ON lot_category = category_id
//  INNER JOIN `users`
//          ON lot_author = user_id
//  INNER JOIN `bids`
//          ON lot_id = bid_lot
//          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
//          GROUP BY lot_id
//          ORDER BY bid_amount DESC";
//$result = mysqli_prepare($db, $sql);
//$stmt = db_get_prepare_stmt($db, $sql, []);
//mysqli_stmt_execute($stmt);
//$result = mysqli_stmt_get_result($stmt);
//$winners = mysqli_fetch_all($result, MYSQLI_ASSOC);

$winners = Winners::get($db);
if($winners) {
    foreach(array_values($winners) as $key => $val) {
        var_dump($winners[$key]['user_email']);
        Mail::sendMailForWinner(
            $winners[$key]['user_email'],
            $db,
            $winners[$key]['lot_id'],
            $winners[$key]['bid_user'],
            $winners[$key]['lot_name']
        );
    }
}

//echo Date::now();


//Mail::sendMailForWinner('sender505@mail.ru');

if (isset($_SESSION['user'])) {
    $is_auth = true;
    $user_name = $_SESSION['user']['user_name'];
    $user_avatar = $_SESSION['user']['user_avatar'];
//    var_dump($_SESSION['user']['user_avatar']);
}

$sql = "SELECT lot_id, lot_picture, category_name, lot_name, lot_start_price, lot_winner  FROM lots INNER JOIN categories ON lot_category = category_id WHERE lot_winner IS NULL";
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




