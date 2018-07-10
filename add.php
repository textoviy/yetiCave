<?php
require_once 'templates/functions.php';
//require 'templates/lots_list.php';
require_once 'config/db.php';
session_start();

$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);

$sql = "SELECT category_id, category_name FROM categories";
$result = mysqli_prepare($db, $sql);
$stmt = db_get_prepare_stmt($db, $sql, []);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$categories = mysqli_fetch_all($result, MYSQLI_ASSOC);

$dict = [
    'lot_name' => 'Название лота',
    'lot_rate' => 'Начальная цена',
    'lot_step' => 'Шаг ставки',
    'lot_date' => 'Дата окончания торгов',
    'category_name' => 'Категория',
    'message' => 'Описание лота'
];


//$categories = [
//    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
//];

if (isset($_SESSION['user'])) {
    $is_auth = true;
    $user_name = $_SESSION['user']['user_name'];
    $user_avatar = $_SESSION['user']['avatar'] ? 'img/uploads/users/' . $_SESSION['user']['avatar']: 'img/user.jpg';
} else {
    http_response_code(403);

    $page_content = renderTemplate('templates/add_403.php', []);

    $layout_content = renderTemplate('templates/layout.php', [
        'main_title' => $page_title,
        'categories' => $categories,
        'content' => $page_content
    ]);

    print($layout_content);
    exit(0);
}

//$categories = [
//    'boards_skis' => 'Доски и лыжи',
//    'mountings' => 'Крепления',
//    'boots' => 'Ботинки',
//    'clothes' => 'Одежда',
//    'instruments' => 'Инструменты',
//    'other' => 'Разное'
//];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $lot = $_POST;
    $required = [
        'lot_name',
        'lot_rate',
        'lot_step',
        'lot_date',
        'category_name',
        'message'
    ];
    $dict = [
        'lot_name' => 'Название лота',
        'lot_rate' => 'Начальная цена',
        'lot_step' => 'Шаг ставки',
        'lot_date' => 'Дата окончания торгов',
        'category_name' => 'Категория',
        'message' => 'Описание лота'
    ];

    $errors = [];
    foreach ($required as $field) {
        if ($_POST['category_name'] == 'standard_category') {
            $errors['category_name'] = 'Заполните это поле:';

        }
        if (empty($_POST[$field])) {
            $errors[$field] = 'Заполните это поле:';

        }

    }
    if (isset($_FILES['lot_file'])) {
        $tmp_name = $_FILES['lot_file']['tmp_name'];
        $file_relative_path = '\uploads\\img\\';
        $file_path = __DIR__ . '\uploads\\img\\';
        $file_name = $_FILES['lot_file']['name'];
        $file_url = $file_path . $file_name;




        if (!empty($tmp_name)) {
            $file_info = finfo_open(FILEINFO_MIME_TYPE);
            $file_type = finfo_file($file_info, $tmp_name);
        }

        if (!($file_type === "image/gif" || $file_type === "image/png" || $file_type === "image/jpeg" || $file_type === "image/jpg")) {
            $errors['lot_file'] = 'Загрузите картинку в формате на выбор: 	png, jpg, gif';

        } else {
            move_uploaded_file($tmp_name, $file_url);
            $lot['path'] = $file_relative_path . $file_name;

        }
    }
    else {
        $errors['lot_file'] = "Вы не загрузили файл";

    }

    if (!is_numeric($_POST['lot_rate'])) {
        $errors['lot_rate'] = "Введите начальную цену";
    }
    if (!is_numeric($_POST['lot_step'])) {
        $errors['lot_step'] = "Введите шаг ставки";
    }

    if (count($errors)) {
        $content = renderTemplate('templates/add-index.php', [
            'categories' => $categories,
            'errors' => $errors,
            'dict' => $dict
        ]);
    }
    else {

//        $sql = "INSERT INTO lots (lot_name, lot_description, lot_picture, lot_category, lot_start_price, lot_bet_step, lot_end_date ) " . " VALUES (?, ?, ?, ?, ?, ?, ?)";
//        $stmt = mysqli_prepare($db, $sql);
//        $stmt = db_get_prepare_stmt($db, $sql, $data = [
//            $lot['lot_name'],
//            $lot['message'],
//            $lot['lot_file'],
//            $lot['category_name'],
//            $lot['lot_rate'],
//            $lot['lot_step'],
//            $lot['lot_date']
//        ]);
        $author_id = $_SESSION['user']['user_id'];

//        $sql = "INSERT INTO `lots` (`name`, `description`, `picture`, `creation_date`, `end_date`, `start_price`, `bet_step`, `author`, `category`) "
//            . "VALUES (?, ?, ?, NOW(), ?, ?, ?, '$author_id', ?);";


        $sql = "INSERT INTO lots (lot_name, lot_description, lot_picture, lot_creation_date, lot_end_date, lot_start_price, lot_bet_step, lot_author, lot_category ) "
            . " VALUES (?, ?, ?, NOW(), ?, ?, ?, '$author_id', ?);";
        $stmt = mysqli_prepare($db, $sql);
        mysqli_stmt_bind_param($stmt,
            'ssssiii',
            htmlspecialchars($lot['lot_name']),
            htmlspecialchars($lot['message']),
            $lot['path'],
            htmlspecialchars($lot['lot_date']),
            htmlspecialchars($lot['lot_rate']),
            htmlspecialchars($lot['lot_step']),
            htmlspecialchars($lot['category_name'])
        );
        mysqli_stmt_execute($stmt);

        foreach ($categories as $key) {
            if ($key['category_id'] == intval($lot['category_name'])) {
                $lot['category_name'] = $key['category_name'];
                break;
            }
        }


//        $stmt = mysqli_prepare($db, $sql);
//        mysqli_stmt_bind_param($stmt, 'ssssiii', htmlspecialchars($lot['lot_name']), htmlspecialchars($lot['message']), $lot['lot_file'], htmlspecialchars($lot['lot_date']), htmlspecialchars($lot['lot_rate']), htmlspecialchars($lot['lot_step']), htmlspecialchars($lot['category_name']));
//        $result = mysqli_stmt_execute($stmt);




        $content = renderTemplate('templates/lot_index.php', [
            'is_auth' => $is_auth,
            'lot' => $lot,
            'categories' => $categories,
            'title' => $lot['lot_name'],
            'category_name' => $lot['category_name'],
            'price' => $lot['lot_rate'],
            'lot_description' => $lot['message'],
            'url' => '\uploads\\img\\' . $file_name
        ]);
    }
}
else {
    $content = renderTemplate('templates/add-index.php', [
        'dict' => $dict,
        'categories' => $categories
    ]);
}

$layout = renderTemplate('templates/layout.php', [
    'content' => $content,
    'categories' => $categories,
    'main_title' => 'yetiCave - добавить новый лот',
    'is_auth' => $is_auth,
    'user_name' => $_SESSION['user']['user_name'],
    'user_avatar' => $user_avatar,
]);


print($layout);

?>