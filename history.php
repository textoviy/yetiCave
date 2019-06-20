<?php
require_once 'templates/functions.php';
//require 'templates/lots_list.php';
require_once 'config/db.php';
session_start();

$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);

$viewed_lots = json_decode($_COOKIE['viewed_lots'], true);
//echo "<pre>";
//var_dump($viewed_lots);
//echo "</pre>";



//$sql = "SELECT lot_id, lot_picture, category_name, lot_name, lot_start_price  FROM lots INNER JOIN categories ON lot_category = category_id";
//$result = mysqli_prepare($db, $sql);
//$stmt = db_get_prepare_stmt($db, $sql, []);
//mysqli_stmt_execute($stmt);
//$result = mysqli_stmt_get_result($stmt);
//$lots_list = mysqli_fetch_all($result, MYSQLI_ASSOC);
//if (isset($_SESSION['user'])) {
//    $is_auth = true;
//    $user_name = $_SESSION['user']['user_name'];
//    $user_avatar = $_SESSION['user']['avatar'] ? 'img/uploads/users/' . $_SESSION['user']['avatar']: 'img/user.jpg';
//}
//else {
//    http_response_code(403);
//
//    $page_content = renderTemplate('templates/add_403.php', []);
//
//    $layout_content = renderTemplate('templates/layout.php', [
//        'main_title' => $page_title,
//        'categories' => $categories,
//        'content' => $page_content
//    ]);
//
//    print($layout_content);
//    exit(0);
//}

$categories = [
    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
];




$content = renderTemplate('templates/history-index.php', [
    'viewed_lots' => $viewed_lots,
    'id' => $id,
    'lots_title' => 'Просмотренные лоты',
    'categories' => $categories,
//    'lots_list' => $lots_list,
    'timer' => $timer,

]);

$nav = renderTemplate('templates/nav.php', [
        'categories' => $categories
]);

$layout_content = renderTemplate('templates/layout.php', [
    'nav' => $nav,
    'main_title' => 'История просмотров',
    'categories' => $categories,
    'content' => $content,
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'user_avatar' => $user_avatar,
]);

print($layout_content);

?>