<?php
require 'templates/functions.php';
require 'config/db.php';
//require 'templates/lots_list.php';
session_start();
$db = mysqli_connect($db_host, $db_user, $db_password, $db_name);

if (isset($_SESSION['user'])) {
    $is_auth = true;
    $user_name = $_SESSION['user']['name'];
    $user_avatar = $_SESSION['user']['avatar'] ? 'img/uploads/users/' . $_SESSION['user']['avatar']: 'img/user.jpg';
}

$lot = null;

if (isset($_GET['lot_id'])) {

    $lot_id = intval($_GET['lot_id']);
    $sql = "SELECT lot_name, lot_description, lot_picture, lot_creation_date, lot_end_date, lot_start_price, lot_bet_step, lot_author, lot_category, category_name FROM lots INNER JOIN categories ON lot_category = category_id WHERE lot_id = '$lot_id'";
    $result = mysqli_prepare($db, $sql);
    $stmt = db_get_prepare_stmt($db, $sql, []);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $lot = mysqli_fetch_all($result, MYSQLI_ASSOC);

    $sql = "SELECT bid_date, bid_amount, bid_user, bid_lot, user_name 
    FROM bids INNER JOIN users ON bid_user = user_id WHERE bid_lot = '$lot_id'";
    $result = mysqli_prepare($db, $sql);
    $stmt = db_get_prepare_stmt($db, $sql, []);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $lot_bet_information = mysqli_fetch_all($result, MYSQLI_ASSOC);

}


$lot_price = isset($lot_bet_information[0]['bid_amount']) ? $lot_bet_information[0]['bid_amount'] : $lot[0]['lot_start_price'];
$min_bet = $lot_price +  $lot[0]['lot_bet_step'];


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $bet = $_POST['cost'];

    if (intval($bet) < $min_bet) {
        $error_bet = ' ';
    }

    if (!is_numeric($bet)) {
        $error_bet = 'Только цифры писать сюда.';
    }

    if (empty($bet)) {
        $error_bet = 'Вы ничего не ввели!';
    }

    if (!empty($error_bet)) {
        $content = renderTemplate('templates/lot_index.php', [
            'error_bet' => $error_bet,
            'lot' => $lot,
            'is_auth' => $is_auth,
            'title' => $lot[0]['lot_name'],
            'lot_description' => $lot[0]['lot_description'],
            'category_name' => $lot[0]['category_name'],
            'price' => $lot_price,
            'url' => $lot[0]['lot_picture'],
            'min_bet' => $min_bet
        ]);



        $layout_content = renderTemplate('templates/layout.php', [
            'is_auth' => $is_auth,
            'main_title' => $lot[0]['lot_name'],
            'category_name' => $lot['category_name'],
            'content' => $content,
            'user_name' => $user_name,
            'user_avatar' => $user_avatar,
            'categories' => $categories
        ]);

        print($layout_content);
        exit();

    }
       if (!isset($error_bet)) {

        $sql = "call bitsCreateUpdate(?,?,?);";
        $stmt = mysqli_prepare($db, $sql);
        //db_get_prepare_stmt($db, $stmt, [htmlspecialchars(intval($_POST['cost'])), intval($_SESSION['user']['user_id']), intval($_GET['lot_id'])]);
        mysqli_stmt_bind_param($stmt, 'iii', htmlspecialchars(intval($_POST['cost'])), intval($_SESSION['user']['user_id']), intval($_GET['lot_id']));
        mysqli_stmt_execute($stmt);




               //       $sql =  "SELECT COUNT(bid_user) FROM bids WHERE bid_user =`" . intval($_SESSION['user']['user_id']). "` AND bid_lot = `" . intval($_GET['lot_id']). "`;";
////           $stmt = db_get_prepare_stmt($db, $sql);
////       mysqli_stmt_execute($stmt);
////       $result = mysqli_stmt_get_result($stmt);
//           $result = mysqli_query($db, $sql);
//            $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
////       $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
//       var_dump($rows);

//           $sql = "SELECT * FROM users WHERE user_email = ?";
//           $result = mysqli_prepare($db, $sql);
//           $stmt = db_get_prepare_stmt($db, $sql, [$_POST['email']]);
//           mysqli_stmt_execute($stmt);
//           $result = mysqli_stmt_get_result($stmt);
//           $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);
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

//var_dump($lot);

$content = renderTemplate('templates/lot_index.php', [
    'error_bet' => NULL,
    'lot' => $lot,
    'is_auth' => $is_auth,
    'title' => $lot[0]['lot_name'],
    'lot_description' => $lot[0]['lot_description'],
    'category_name' => $lot[0]['category_name'],
    'price' => $lot_price,
    'url' => $lot[0]['lot_picture'],
    'min_bet' => $min_bet
]);

$layout_content = renderTemplate('templates/layout.php', [
    'is_auth' => $is_auth,
    'main_title' => $lot[0]['lot_name'],
    'category_name' => $lot['category_name'],
    'content' => $content,
    'user_name' => $user_name,
    'user_avatar' => $user_avatar,
    'categories' => $categories
]);

print($layout_content);
?>



