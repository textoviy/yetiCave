<?php

require 'config/db.php';

//Функцию-шаблонизатор

function renderTemplate($templatePath, $templateData = []) {
    $content = '';
    extract($templateData);

    if (file_exists($templatePath)) {
        ob_start();
        require($templatePath);
        $content = ob_get_contents();
        ob_end_clean();
    }

    return $content;
};


function format_text($number) {
    if ($number > 1000) $number = ceil($number);

    $min_length_string = 3;
    $num = mb_strlen($number);

    if ($num > $min_length_string) {
        $firstText = mb_substr($number, $num - 3, $min_length_string);
        $secondText = mb_substr($number, 0, $num - $min_length_string);
        $number = $secondText . " " .  $firstText . " ₽";
    };

    return $number;
};



function searchUserByEmail($postEmail, $users) {

    require 'config/db.php';
    $db = mysqli_connect($db_host, $db_user, $db_password, $db_name);
    $sql = "SELECT * FROM users WHERE user_email = ?";
    $result = mysqli_prepare($db, $sql);
    $stmt = db_get_prepare_stmt($db, $sql, [$_POST['email']]);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);


    foreach ($rows as $user) {
        if ($user['user_email'] == $postEmail) {
            return $user;
        }
    }
    if (empty($user)) {
        return false;
    }


}


/**
 *
 * https://gist.github.com/voronkovich/e72cfd6206dec800ca533d9fcd61bfbb
 *
 * Создает подготовленное выражение на основе готового SQL запроса и переданных данных.
 *
 * @param mysqli $link Ресурс соединения
 * @param string $sql  SQL запрос с плейсхолдерами вместо значений
 * @param array  $data Данные для вставки на место плейсхолдеров
 *
 * @throws \UnexpectedValueException Если тип параметра не поддерживается
 *
 * @return mysqli_stmt Подготовленное выражение
 */

function db_get_prepare_stmt($link, $sql, $data = []) {
    $stmt = mysqli_prepare($link, $sql);

    if ($data) {
        $types = '';
        $stmt_data = [];

        foreach ($data as $value) {
            $type = null;

            if (is_int($value)) {
                $type = 'i';
            }
            else if (is_string($value)) {
                $type = 's';
            }
            else if (is_double($value)) {
                $type = 'd';
            }

            if ($type) {
                $types .= $type;
                $stmt_data[] = $value;
            }
        }

        $values = array_merge([$stmt, $types], $stmt_data);

        $func = 'mysqli_stmt_bind_param';
        $func(...$values);
    }

    return $stmt;
}

 ?>