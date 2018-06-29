<?php
require_once 'templates/functions.php';
require_once  'templates/lots_list.php';

$categories = [
    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
];

$viewed_lots_id = json_decode($_COOKIE['viewed_lots'], true);



$content = renderTemplate('templates/history-index.php', [
    'viewed_lots_id' => $viewed_lots_id,
    'id' => $id,
    'lots_title' => 'Просмотренные лоты',
    'categories' => $categories,
    'lots_list' => $lots_list,
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