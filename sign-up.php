<?php
require 'templates/functions.php';
require 'config/db.php';

$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);

session_start();

//$sql = "INSERT INTO  users
//SET  user_registration_date = NOW(),  user_email = 'jasonstealer@ya.ru', user_name = 'secret', user_password = 'secret'";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $form = $_POST;

    $required = [
        'email',
        'password',
        'name',
        'message'
    ];

    $dict = [
        'email' => 'Вам стоит ввести e-mail',
        'password' => 'Вам стоит ввести пароль',
        'name' => 'Вам стоит ввести имя',
        'message' => 'Вам стоит ввести контактные данные.',
        'avatar' => 'Вам стоит добавить аватар'
    ];

    $errors = [];

    $user = searchUserByEmail($_POST['email'], $users);
    if ($user['user_email'] == $form['email']) {
        $errors['email'] = 'Такой email уже занят';
    } elseif (filter_var($form['email'], FILTER_VALIDATE_EMAIL) == false) {
        $errors['email'] = 'Неправильный формат email';
    }

    foreach ($required as $field) {

        if (empty($form[$field])) {

            $errors[$field] = $dict[$field];
        }
        if (strlen($form['password']) < 6) {
            $errors['password'] = "В пароле должно быть не меньше 6 символов";
        }

        if (strlen($form['name']) < 3) {
            $errors['name'] = "В имени должно быть не меньше 3 символов";
        }

    }

    if (isset($_FILES['avatar'])) {
        $tmp_name = $_FILES['avatar']['tmp_name'];
        $file_relative_path = '\uploads\\img\\';
        $file_path = __DIR__ . $file_relative_path;
        $file_name = $_FILES['avatar']['name'];
        $file_url = $file_path . $file_name;

        if (!empty($tmp_name)) {
            $file_info = finfo_open(FILEINFO_MIME_TYPE);
            $file_type = finfo_file($file_info, $tmp_name);
        }

        if (!($file_type === "image/gif" || $file_type === "image/png" || $file_type === "image/jpeg" || $file_type === "image/jpg")) {
            $errors['avatar'] = 'Загрузите картинку в формате на выбор: 	png, jpg, gif';

        } else {
            move_uploaded_file($tmp_name, $file_url);
            $lot['path'] = $file_relative_path . $file_name;

        }
    } else {
        $errors['avatar'] = $dict['avatar'];

    }

        if (count($errors)) {
            $content = renderTemplate('templates/sign-up_index.php', [
                'categories' => $categories,
                'dict' => $dict,
                'errors' => $errors
            ]);
        } else {


            $sql = "INSERT INTO users (user_registration_date, user_email, user_name, user_password, user_avatar,user_contacts ) " . " VALUES (NOW(), ?, ?, ?, ?, ?); ";
            $stmt = mysqli_prepare($db, $sql);
            mysqli_stmt_bind_param($stmt, 'sssss', $form['email'], $form['name'], $form['password'], $lot['path'], $form['contacts']);
            mysqli_stmt_execute($stmt);
            mysqli_insert_id($db);



            $_SESSION['user']['user_id'] = mysqli_insert_id($db);
            $_SESSION['user']['user_name'] = $form['name'];
            $_SESSION['user']['user_email'] = $form['email'];
            $_SESSION['user']['user_password'] = $form['password'];
            $_SESSION['user']['user_avatar'] = $lot['path'];
            $_SESSION['user']['user_contacts'] = $form['contacts'];



            header('Location: /index.php');
            exit();

        }
}


print($layout_content);

$categories = [
    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
];


$nav = renderTemplate('templates/nav.php', [
    'categories' => $categories
]);

$content = renderTemplate('templates/sign-up_index.php', [
    'categories' => $categories,
    'dict' => $dict,
    'errors' => $errors

]);

$layout_content = renderTemplate('templates/layout.php', [
    'nav' => $nav,
    'main_title' => 'Вход',
    'categories' => $categories,
    'content' => $content,
    'is_auth' => $is_auth,
    'user_name' => $_SESSION['user']['name'],
    'user_avatar' => $user_avatar,
]);

print($layout_content);

