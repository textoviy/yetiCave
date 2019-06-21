<?php


class Winners
{



    public static function get($db) {

            $sql = "SELECT lot_id
                FROM `lots`
                WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
                GROUP BY lot_id";
            $result = mysqli_prepare($db, $sql);
            $stmt = db_get_prepare_stmt($db, $sql, []);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            $winnersId = mysqli_fetch_all($result, MYSQLI_ASSOC);


       if (count(array_values($winnersId)) > 1) {
           foreach (array_values($winnersId) as $winner) {
//               echo '<pre>';
//                var_dump($winner['lot_id']);
//               echo '</pre>';
               $winnerLotId = $winner['lot_id'];
               $sql = "SELECT bid_lot,bid_date, bid_amount, user_email, bid_date, lot_name, bid_user, lot_id
                        FROM `bids`
                        INNER JOIN `lots`
                        ON bid_lot = lot_id
                         INNER JOIN `users`
                         ON bid_user = user_id
                        WHERE bid_lot ='$winnerLotId'
                        ORDER BY bid_amount DESC LIMIT 1";
               $result = mysqli_prepare($db, $sql);
               $stmt = db_get_prepare_stmt($db, $sql, []);
               mysqli_stmt_execute($stmt);
               $result = mysqli_stmt_get_result($stmt);
               $winner = mysqli_fetch_all($result, MYSQLI_ASSOC);

//               echo '<pre>';
//                var_dump($winner);
//               echo '</pre>';


               $winners[] = $winner[0];
           }
       }

//        echo '<pre>';
//        var_dump($winners);
//        echo '</pre>';

        return $winners;


       }


}