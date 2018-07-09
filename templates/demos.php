<?php
require_once 'init.php';
// Проверка базы
if (!$link) {
    $error = mysqli_connect_error();
    show_error($content, $error);
}
else {
    //Делаем запрос
    $sql = 'SELECT `id`, `name` FROM categories';
    $result = mysqli_query($link, $sql);

    //Получаем результат - данные из базы
    if ($result) {
        $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    else {
        $error = mysqli_error($link);
        show_error($content, $error);
    }


    //Текущая страница
    $cur_page = $_GET['page'] ?? 1;

    //Кол-во страниц
    $page_items = 6;

    // Запрос в базу на количество гифок
    $result = mysqli_query($link, "SELECT COUNT(*) as `count` FROM gifs");

    //Возвращаем ряд результата запроса
    $items_count = mysqli_fetch_assoc($result)['count'];

    //Режем ряд на части
    $pages_count = ceil($items_count / $page_items);

    //Узнаем, насколько смещать ряд
    $offset = ($cur_page - 1) * $page_items;

    //Создаем массив, содержащий диапазон элементов
    $pages = range(1, $pages_count);

    // запрос на показ девяти самых популярных гифок
    $sql = 'SELECT gifs.id, title, path, like_count, users.name FROM gifs '
        . 'JOIN users ON gifs.user_id = users.id '
        . 'ORDER BY show_count DESC LIMIT ' . $page_items . ' OFFSET ' . $offset;

    //Если запрос успешен - генерим страницу
    if ($gifs = mysqli_query($link, $sql)) {
        $tpl_data = [
            'gifs' => $gifs,
            'pages' => $pages,
            'pages_count' => $pages_count,
            'cur_page' => $cur_page
        ];

        $content = include_template('main.php', $tpl_data);
    }
    else {
        show_error($content, mysqli_error($link));
    }
}

print include_template('index.php', ['content' => $content, 'categories' => $categories]);