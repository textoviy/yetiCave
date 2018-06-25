<?php
require_once 'templates/functions.php';



$categories = [
    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
];

$content = renderTemplate('templates/add-index.php', []);

$layout = renderTemplate('templates/layout.php', [
    'main_title' => 'Добавление лота - добавь, продай, радуйся',
    'content' => $content,
    'categories' => $categories

]);

echo $_POST['lot_name'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $lot = $_POST;

    $required = [
        'lot_name',
        'lot_file',
        'lot_rate',
        'lot_step',
        'lot_date',
        'category',
        'message'
    ];
    $dict = [
        'lot_name' => 'Название лота',
        'lot_file' => 'Лот',
        'lot_rate' => 'Начальная цена',
        'lot_step' => 'Шаг ставки',
        'lot_date' => 'Дата окончания торгов',
        'category' => 'Категория',
        'message' => 'Описание лота'
    ];

    $errors = [];
    foreach ($required as $key) {

        if (empty($_POST[$key])) {
            $errors[$key] = 'Заполните это поле:';
        }
    }

    if (isset($_FILES['lot_img']['lot_name'])) {
        $tmp_name = $_FILES['lot_img']['tmp_name'];
        $path = $_FILES['lot_img']['lot_name'];

        $file_info = finfo_open(FILEINFO_MIME_TYPE);
        $file_type = finfo_file($file_info, $tmp_name);
        if ($file_type !== 'image/gif' || $file_type !== 'image/png' || $file_type !== 'image/jpeg') {
            $errors['file'] = 'Загрузитке картинку в формате на выбор: 	png, jpg, gif';
        } else {
            move_uploaded_file($tmp_name, 'uploads/' . $path);
        }

    } else {
        $errors['file'] = "Вы не загрузили файл";
    }

    if (count($errors)) {
        $content = renderTemplate('templates/add-index.php', [
            'errors' => $errors,
            'dict' => $dict
        ]);
    } else {
        $content = renderTemplate('templates/layout.php', [


        ]);
    }


} else {
    $content = renderTemplate('templates/add-index.php', []);
}

$layout = renderTemplate('templates/layout.php', [
    'content' => $content,
    'categories' => [],
    'title' => 'yetiCave - добавить новый лот'
]);


print($layout);

?>