<?php
require 'vendor/autoload.php';

use Carbon\Carbon;


//
//echo '<pre>';
//var_dump();
//echo '</pre>';
require 'templates/functions.php';
// require 'templates/lots_list.php';
require 'config/db.php';

$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);

session_start();
//var_dump($lots_list);
if (isset($_SESSION['user'])) {
    $is_auth = true;
    $user_name = $_SESSION['user']['user_name'];
    $user_avatar = $_SESSION['user']['user_avatar'];
    $user_id = $_SESSION['user']['user_id'];
//    var_dump($_SESSION['user']['user_avatar']);
}

$sql = "SELECT bid_id, bid_date, lot_picture, bid_amount, bid_user, lot_author, lot_name, user_contacts, category_name, lot_id, lot_creation_date, lot_end_date FROM `bids`
		INNER JOIN lots 
        	ON bid_lot = lot_id
        INNER JOIN users 
        	ON bid_user = user_id
        INNER JOIN categories 
        	ON lot_category = category_id
        WHERE bid_user = '$user_id'";
$result = mysqli_prepare($db, $sql);
$stmt = db_get_prepare_stmt($db, $sql, []);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$lots_list = mysqli_fetch_all($result, MYSQLI_ASSOC);



$content = renderTemplate('templates/my-lots.php', [
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