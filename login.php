<?php
require 'templates/functions.php';
require 'templates/lots_list.php';
require 'templates/categories.php';
require 'config/db.php';

session_start();




if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $form = $_POST;

    $user = searchUserByEmail($_POST['email'], $users);


    $required = [
        'email',
        'password'
    ];
    $dict = [
        'email' => 'Вам стоит ввести e-mail',
        'password' => 'Вам стоит ввести пароль'
    ];

    $errors = [];

    foreach ($required as $field) {

        if (empty($form[$field])) {
            $errors[$field] = $dict[$field];
        }
    }




    if (!count($errors) && $user) {

        if ($form['password'] == $user['user_password']) {
            $_SESSION['user'] = $user;
        } else {
            $errors['password'] = 'Неверный пароль';
        }
    } else {

        if ($_POST['email'] == $user['user_email'] && !empty($_POST['email'])) {
            unset($errors['email']);
        } else {
            $errors['email'] = empty($_POST['email']) ? 'Вам стоит ввести e-mail' : 'Такой пользователь не найден';
            $errors['password'] = 'Разберитесь с email, а потом уже пароль';
        }
        if (filter_var($form['email'], FILTER_VALIDATE_EMAIL) == false && !empty($form['email'])) {
            $errors['email'] = 'Неправильный формат email';
            $errors['password'] = 'Разберитесь с email, а потом уже пароль';
        }

    }

    if (count($errors)) {
        $content = renderTemplate('templates/login-index.php', [
            'categories' => $categories,
            'dict' => $dict,
            'errors' => $errors

        ]);
    } else {

        $_SESSION['user']['name'] = $user['user_name'];
        header('Location: /index.php');
        exit();
    }
}

print($layout_content);

$categories = [
    "Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"
];

$content = renderTemplate('templates/login-index.php', [
    'categories' => $categories,
    'dict' => $dict,
    'errors' => $errors

]);

$nav = renderTemplate('templates/nav.php', [
    'categories' => $categories
]);

$layout_content = renderTemplate('templates/layout.php', [
    'nav' => $nav,
    'main_title' => 'Вход',
    'categories' => $categories,
    'content' => $content,
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'user_avatar' => $user_avatar,
]);

print($layout_content);