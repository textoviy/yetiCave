<?php
require 'templates/functions.php';
require 'templates/lots_list.php';


if ($_GET['lot_id'] > count($lots_list)) {
    http_response_code(404);

    $content = renderTemplate('templates/404.php', []);
    print($content);
    exit(100);
};

$categories = [
    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
];

$lot = null;

if (isset($_GET['lot_id'])) {
    $lot_id = $_GET['lot_id'];

    foreach ($lots_list as $key => $value) {
        if ($key == $lot_id) {
            $lot = $value;
            break;
        }
    }
}

//if (!isset($_COOKIE['viewed_lots'])) {
//    setcookie('viewed_lots', , time() + 100500, '/');
//} else {
//    if (array_search($lot_id, (array)$_COOKIE['viewed_lots']) == false) {
//        $cookie = (array)$_COOKIE['viewed_lots'];
//        $cookie[] = $lot_id;
//        $_COOKIE['viewed_lots'] = $cookie;
//    }
//}



$data = json_decode($_COOKIE['viewed_lots'], true);
$data[$lot_id] = $lot_id;
$encoded_data = json_encode($data);
setcookie('viewed_lots', $encoded_data, time() + 100500, '/');



//if (!isset($_COOKIE['viewed_lots'])) {
//    setcookie('viewed_lots', json_encode([]), time() + 100500, '/');
//} else {
//    if (array_search($lot_id, (array)$_COOKIE['viewed_lots']) == false) {
//        $cookie = (array)$_COOKIE['viewed_lots'];
//        $cookie[] = $lot_id;
//        $_COOKIE['viewed_lots'] = $cookie;
//    }
//}






$content = renderTemplate('templates/lot_index.php', [
    'lot' => $lot,
    'title' => $lot['title'],
    'category_name' => $lot['category_name'],
    'price' => $lot['price'],
    'url' => $lot['url']
]);

$layout_content = renderTemplate('templates/layout.php', [
    'main_title' => $lot['title'],
    'category_name' => $lot['category_name'],
    'content' => $content,
    'categories' => $categories
]);

print($layout_content);
?>



