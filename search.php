<?php
require_once 'templates/functions.php';
//require 'templates/lots_list.php';
require_once 'config/db.php';
session_start();

$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);


$user_search_query = trim($_GET["search"]);
$sql = "SELECT lot_id, lot_name, lot_picture, lot_description, lot_start_price, category_name FROM `lots` INNER JOIN categories ON lot_category = category_id WHERE lot_name LIKE '%$user_search_query%'";
$result = mysqli_prepare($db, $sql);
$stmt = db_get_prepare_stmt($db, $sql, []);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$lots_list = mysqli_fetch_all($result, MYSQLI_ASSOC);


$content = renderTemplate('templates/search.php', [
    'lots_list' => $lots_list,
    'categories' => $categories,
    'lots_list' => $lots_list,
    'timer' => $timer,
]);

$layout = renderTemplate('templates/layout.php', [
    'content' => $content,

]);

print($layout);

//lot_description LIKE '%$user_search_query%'






