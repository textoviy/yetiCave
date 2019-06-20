USE yeti_cave;


INSERT INTO categories (category_value, category_name)
VALUES ('boards_skis', 'Доски и лыжи');

INSERT INTO categories (category_value, category_name)
VALUES ('mountings', 'Крепления');

INSERT INTO categories (category_value, category_name)
VALUES ('boots', 'Ботинки');

INSERT INTO categories (category_value, category_name)
VALUES ('clothes', 'Одежда');

INSERT INTO categories (category_value, category_name)
VALUES ('instruments', 'Инструменты');

INSERT INTO categories (category_value, category_name)
VALUES ('other', 'Разное');

INSERT INTO `users` (`user_registration_date`, `user_email`, `user_name`, `user_password`)
VALUES ('2001-05-21 13:54:05', 'ignat.v@gmail.com', 'Игнат', '$2y$10$OqvsKHQwr0Wk6FMZDoHo1uHoXd4UdxJG/5UDtUiie00XaxMHrW8ka');


-- 2014 Rossignol District Snowboard', 'DESCRIPTION

INSERT INTO lots (lot_author, lot_category, lot_name, lot_description, lot_picture,
                  lot_creation_date, lot_end_date, lot_start_price,
                  lot_bet_step)
VALUES (1, 1, '2014 Rossignol District Snowboard', 'DESCRIPTION','img/lot-1.jpg',
        '2001-05-21 13:54:05', '2001-05-23 13:54:05', 10999,
        1000);

-- DC Ply Mens 2016/2017 Snowboard

INSERT INTO lots (lot_author, lot_category, lot_name, lot_description, lot_picture,
                  lot_creation_date, lot_end_date, lot_start_price,
                  lot_bet_step)
VALUES (1, 1, 'DC Ply Mens 2016/2017 Snowboard', 'DESCRIPTION','img/lot-2.jpg',
        '2001-05-21 13:54:05', '2001-05-23 13:54:05', 159999,
        1000);

-- Крепления Union Contact Pro 2015 года размер L/XL

INSERT INTO lots (lot_author, lot_category, lot_name, lot_description, lot_picture,
                  lot_creation_date, lot_end_date, lot_start_price,
                  lot_bet_step)
VALUES (1, 2, 'Крепления Union Contact Pro 2015 года размер L/XL', 'DESCRIPTION','img/lot-3.jpg',
        '2001-05-21 13:54:05', '2001-05-23 13:54:05', 8000,
        1000);

-- Ботинки для сноуборда DC Mutiny Charocal

INSERT INTO lots (lot_author, lot_category, lot_name, lot_description, lot_picture,
                  lot_creation_date, lot_end_date, lot_start_price,
                  lot_bet_step)
VALUES (1, 3, 'Ботинки для сноуборда DC Mutiny Charocal', 'DESCRIPTION','img/lot-4.jpg',
        '2001-05-21 13:54:05', '2001-05-23 13:54:05', 10999,
        1000);

-- Куртка для сноуборда DC Mutiny Charocal

INSERT INTO lots (lot_author, lot_category, lot_name, lot_description, lot_picture,
                  lot_creation_date, lot_end_date, lot_start_price,
                  lot_bet_step)
VALUES (1, 4, 'Куртка для сноуборда DC Mutiny Charocal', 'DESCRIPTION','img/lot-5.jpg',
        '2001-05-21 13:54:05', '2001-05-23 13:54:05', 7500,
        1000);

-- Маска Oakley Canopy

INSERT INTO lots (lot_author, lot_category, lot_name, lot_description, lot_picture,
                  lot_creation_date, lot_end_date, lot_start_price,
                  lot_bet_step)
VALUES (1, 6, 'Маска Oakley Canopy', 'DESCRIPTION','img/lot-6.jpg',
        '2001-05-21 13:54:05', '2001-05-23 13:54:05', 5400,
        1000);

-- Ставки

INSERT INTO bids (bid_date, bid_amount, bid_user, bid_lot)
VALUES ('2001-05-23 15:54:05', 1, 1, 7);

INSERT INTO bids (bid_date, bid_amount, bid_user, bid_lot)
VALUES ('2001-05-23 15:54:05', 1200, 1, 11);


select category_name from categories;

SELECT lot_name, lot_start_price, lot_picture,
  COUNT(bid_lot) AS bids_number, category_name, lot_creation_date
FROM lots
  LEFT JOIN bids ON lots.lot_id = bids.bid_lot
  INNER JOIN categories ON lots.lot_category = categories.category_id
WHERE lot_creation_date < lot_end_date
GROUP BY lots.lot_name, lot_start_price, lot_picture, lot_creation_date, lot_category
ORDER BY lot_creation_date DESC;





-- Лоты без победителя

SELECT lot_id, lot_picture, category_name, lot_name, lot_start_price, lot_winner FROM `lots` 
    INNER JOIN `categories`
          ON lot_category = category_id WHERE lot_winner IS NULL


-- Лоты, у которых еще не прошло время

SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date FROM `lots` WHERE NOW() BETWEEN `lot_creation_date` AND `lot_end_date`






-- Не рабочине

SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, bid_amount FROM `lots`
        INNER JOIN `categories`
          ON lot_category = category_id
         INNER JOIN `bids`
          ON lot_id = bid_lot AND
          AND bid_amount = (SELECT MAX(bid_amount) FROM `bids`)
        WHERE lot_winner IS NULL AND NOW() BETWEEN `lot_creation_date` AND `lot_end_date`



SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, bid_amount, lot_author
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `bids`
          ON lot_id = bid_lot
    WHERE 
        (SELECT MAX(bid_amount ) FROM bids WHERE bid_user = lot_author)



SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, lot_author, bid_amount
  FROM `lots`
  LEFT OUTER JOIN `categories`
          ON lot_category = category_id
  LEFT OUTER JOIN `bids`
          ON lot_id = bid_lot
    WHERE bid_amount IN 
        (SELECT MAX(bid_amount) FROM bids WHERE bid_user = lot_author)

        
SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, lot_author, bid_amount
  FROM `lots`
  LEFT OUTER JOIN `categories`
          ON lot_category = category_id
  LEFT OUTER JOIN `bids`
          ON lot_id = bid_lot
    WHERE bid_amount IN 
        (SELECT MAX(bid_amount) FROM bids WHERE lot_author = bid_user)

















SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, lot_author, bid_amount
  FROM `lots`
  LEFT OUTER JOIN `categories`
          ON lot_category = category_id
  LEFT OUTER JOIN `bids`
          ON lot_id = bid_lot
GROUP BY lot_name
ORDER BY lot_name


SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, lot_author, bid_amount, bid_user
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `bids`
          ON lot_id = bid_lot
GROUP BY lot_id
ORDER BY lot_id




SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, lot_author, max(bid_amount), bid_user
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `bids`
          ON lot_id = bid_lot
          GROUP BY lot_id
          ORDER BY lot_id ASC












SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, lot_author, max(bid_amount), bid_user
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `bids`
          ON lot_id = bid_lot
          WHERE lot_winner IS NULL AND NOW() BETWEEN `lot_creation_date` AND `lot_end_date`
          GROUP BY lot_id
          ORDER BY lot_id ASC







SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, lot_author, max(bid_amount), bid_user, user_email
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `users`
          ON lot_author = user_id
  INNER JOIN `bids`
          ON lot_id = bid_lot
          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
          GROUP BY lot_id
          ORDER BY lot_id ASC
  



SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, max(bid_amount), bid_user, user_email
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `users`
          ON (SELECT bid_user
           FROM `bids`
               INNER JOIN `users`
           WHERE bid_user = `users`.user_id
           ORDER BY bid_id DESC
           LIMIT 1) = user_id
  INNER JOIN `bids`
          ON lot_id = bid_lot
          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
          GROUP BY lot_id
          ORDER BY bid_amount ASC
          






SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, max(bid_amount), bid_user, user_email
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `users`
          ON (SELECT bid_user
           FROM `bids`
               INNER JOIN `users`
           WHERE bid_user = `users`.user_id
           ORDER BY bid_id DESC
           LIMIT 1) = user_id
  INNER JOIN `bids`
          ON (SELECT bid_amount
           FROM `bids`
               INNER JOIN `users`
           WHERE bid_user = user_id
           ORDER BY bid_id DESC
           LIMIT 1) = bid_amount
          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
          GROUP BY lot_id
          ORDER BY bid_amount ASC
          





SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, max(bid_amount), bid_user, user_email
  FROM `lots`
  INNER JOIN `categories`
          ON lot_category = category_id
  INNER JOIN `users`
          ON lot_author = user_id
  INNER JOIN `bids`
          ON lot_id = bid_lot
          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
          GROUP BY lot_id
          ORDER BY bid_amount DESC







          
          
          
          
SELECT   lot_name, lot_winner, lot_end_date, lot_creation_date, MAX(bid_amount), bid_user, user_email, lot_author
  FROM `bids`
 CROSS JOIN `users`
          ON bid_user = user_id
  CROSS JOIN `lots`
          ON bid_lot = lot_id
          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
          GROUP BY lot_name
          ORDER BY bid_amount ASC




SELECT lot_id, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, max(bid_amount), bid_user, user_email
  FROM `bids`
  JOIN (SELECT bid_id, max(bid_amount) FROM `bids` 
        GROUP BY bid_id) AS max_bid_amounts
   JOIN (SELECT user_id, user_email FROM `users` 
        GROUP BY user_id) AS users
   JOIN (SELECT lot_winner, lot_name, lot_start_price, lot_end_date, lot_creation_date, lot_id  FROM `lots`) AS lots_winners
          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date`
          GROUP BY lot_id
          ORDER BY bid_amount DESC
          
          
          
SELECT lot_id, lot_picture, lot_name, lot_start_price, lot_winner, lot_end_date, lot_creation_date, max(bid_amount), bid_user, user_email, lot_author
  FROM `bids`
  INNER JOIN `users`
          ON bid_user = user_id
  INNER JOIN `lots`
          ON  bid_lot = lot_id AND lot_author <> bid_user AND bid_user
          WHERE lot_winner IS NULL AND NOW() NOT BETWEEN `lot_creation_date` AND `lot_end_date` AND bid_user <> lot_author
          GROUP BY lot_id
          ORDER BY bid_amount DESC
          
        

        
        



