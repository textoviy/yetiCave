-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 10 2018 г., 17:20
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `new_database`
--
CREATE DATABASE IF NOT EXISTS `new_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `new_database`;

-- --------------------------------------------------------

--
-- Структура таблицы `citys`
--

CREATE TABLE `citys` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `citys`
--

INSERT INTO `citys` (`id`, `city_name`) VALUES
(1, 'Perm'),
(1, 'Perm'),
(2, 'Xlep'),
(3, 'Cerot'),
(4, 'Jose'),
(5, 'York');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `user_email` varchar(128) DEFAULT NULL,
  `user_password` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`category_id`, `user_email`, `user_password`) VALUES
(1, 'jasonstealer@ya.ru', 'secret');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- База данных: `yeti_cave`
--
CREATE DATABASE IF NOT EXISTS `yeti_cave` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yeti_cave`;

-- --------------------------------------------------------

--
-- Структура таблицы `bids`
--

CREATE TABLE `bids` (
  `bid_id` bigint(20) UNSIGNED NOT NULL,
  `bid_date` datetime NOT NULL,
  `bid_amount` int(10) UNSIGNED NOT NULL,
  `bid_user` int(10) UNSIGNED NOT NULL,
  `bid_lot` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bids`
--

INSERT INTO `bids` (`bid_id`, `bid_date`, `bid_amount`, `bid_user`, `bid_lot`) VALUES
(2, '2001-05-23 15:53:05', 1, 1, 7),
(3, '2001-05-23 15:54:05', 1200, 1, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `category_value` varchar(128) DEFAULT NULL,
  `category_name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`category_id`, `category_value`, `category_name`) VALUES
(1, 'boards_skis', 'Доски и лыжи'),
(2, 'mountings', 'Крепления'),
(3, 'boots', 'Ботинки'),
(4, 'clothes', 'Одежда'),
(5, 'instruments', 'Инструменты'),
(6, 'other', 'Разное');

-- --------------------------------------------------------

--
-- Структура таблицы `lots`
--

CREATE TABLE `lots` (
  `lot_id` bigint(20) UNSIGNED NOT NULL,
  `lot_name` varchar(512) NOT NULL,
  `lot_description` text,
  `lot_picture` varchar(512) DEFAULT NULL,
  `lot_creation_date` datetime NOT NULL,
  `lot_end_date` datetime NOT NULL,
  `lot_start_price` int(10) UNSIGNED NOT NULL,
  `lot_bet_step` mediumint(8) UNSIGNED NOT NULL,
  `lot_author` int(10) UNSIGNED NOT NULL,
  `lot_winner` int(10) UNSIGNED DEFAULT NULL,
  `lot_category` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`lot_id`, `lot_name`, `lot_description`, `lot_picture`, `lot_creation_date`, `lot_end_date`, `lot_start_price`, `lot_bet_step`, `lot_author`, `lot_winner`, `lot_category`) VALUES
(6, 'Лыжи детские', 'DESCRIPTION', 'img/baby_ski_modre5435.jpeg', '2018-05-21 13:54:05', '2001-05-23 13:54:05', 2490, 1000, 1, NULL, 1),
(7, '2014 Rossignol District Snowboard', 'DESCRIPTION', 'img/lot-1.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 10999, 1000, 1, NULL, 1),
(8, 'DC Ply Mens 2016/2017 Snowboard', 'DESCRIPTION', 'img/lot-2.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 159999, 1000, 1, NULL, 1),
(9, 'Крепления Union Contact Pro 2015 года размер L/XL', 'DESCRIPTION', 'img/lot-3.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 8000, 1000, 1, NULL, 2),
(10, 'Ботинки для сноуборда DC Mutiny Charocal', 'DESCRIPTION', 'img/lot-4.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 10999, 1000, 1, NULL, 3),
(11, 'Куртка для сноуборда DC Mutiny Charocal', 'DESCRIPTION', 'img/lot-5.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 7500, 1000, 1, NULL, 4),
(12, 'Маска Oakley Canopy', 'DESCRIPTION', 'img/lot-6.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 5400, 1000, 1, NULL, 6),
(16, 'Геббельс, Йозеф', 'Пропагандист третьего рейха почти задаром!', '\\uploads\\img\\Bundesarchiv_Bild_183-1989-0821-502,_Joseph_Goebbels.jpg', '2018-07-10 14:26:16', '2018-07-31 00:00:00', 100500, 500, 16, NULL, 6),
(21, 'Куртка зимняя', 'Теплая, до -50', '\\uploads\\img\\Куртка зимняя .jpg', '2018-07-10 16:23:33', '2018-07-12 00:00:00', 6700, 500, 33, NULL, 4),
(22, 'ЦДШЕОЗ98ЯЫП', 'ВАПЫВААП', '\\uploads\\img\\46-is0mE-Y4.jpg', '2018-07-10 16:29:32', '2018-07-31 00:00:00', 1111, 1111, 33, NULL, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_registration_date` datetime NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_avatar` varchar(512) DEFAULT NULL,
  `user_contacts` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_registration_date`, `user_email`, `user_name`, `user_password`, `user_avatar`, `user_contacts`) VALUES
(1, '2001-05-21 13:54:05', 'ignat.v@gmail.com', 'Игнат', '$2y$10$OqvsKHQwr0Wk6FMZDoHo1uHoXd4UdxJG/5UDtUiie00XaxMHrW8ka', NULL, NULL),
(10, '2001-05-21 13:54:05', 'ignat.v@gmail.com', 'Игнат', '$2y$10$OqvsKHQwr0Wk6FMZDoHo1uHoXd4UdxJG/5UDtUiie00XaxMHrW8ka', NULL, NULL),
(12, '2018-07-06 17:08:58', 'fff@yy.rr', 'sss', 'ug0GdVMi', NULL, NULL),
(13, '2018-07-06 17:09:50', 'fff@yy.rr', 'sss', 'sadasdasdasd', NULL, NULL),
(14, '2018-07-06 17:10:27', 'drgdrgdg@dfoikgiod.tu', 'sss', '', NULL, NULL),
(15, '2018-07-06 17:10:31', 'drgdrgdg@dfoikgiod.tu', 'sss', 'ug0GdVMi', NULL, NULL),
(16, '2018-07-06 17:12:31', 'jasonstealer@ya.ru', 'jason', 'qwqwqw', NULL, NULL),
(17, '2018-07-06 17:53:45', 'eblan@ya.ru', 'eblan', '123456', NULL, NULL),
(18, '2018-07-06 18:03:31', 'trash@ya.ru', 'trash', '123456', NULL, NULL),
(19, '2018-07-09 10:32:46', 'ffcf@yy.rr', 'sss', '123456', NULL, NULL),
(20, '2018-07-09 10:33:20', 'ffff@yy.rr', 'sssv', '123456', NULL, NULL),
(21, '2018-07-09 12:07:25', 'email@email.email', 'email', '123456', NULL, NULL),
(22, '2018-07-09 12:11:04', 'fff@yy.rrq', 'sgdgdg', '123456', NULL, NULL),
(23, '2018-07-09 12:22:04', 'yag@yas.ry', 'yag', '123456', NULL, NULL),
(24, '2018-07-09 12:22:32', 'mood@ya.ru', 'mood', '123456', NULL, NULL),
(25, '2018-07-09 12:38:24', 'new_email@ya.ru', 'new_email', '123456', NULL, NULL),
(26, '2018-07-09 14:53:15', 'new@new.new', 'new', '123456', NULL, NULL),
(27, '2018-07-09 14:55:12', 'eee@eee.eee', 'eee', '123456', 'C:\\Users\\ip-4\\Downloads\\OpenServerPanel\\OSPanel\\domains\\yetiCave\\uploads\\img\\Bundesarchiv_Bild_183-1989-0821-502,_Joseph_Goebbels.jpg', NULL),
(28, '2018-07-09 14:56:10', 'fsdfs@dsf.rr', 'sss', '123456', 'C:\\Users\\ip-4\\Downloads\\OpenServerPanel\\OSPanel\\domains\\yetiCave\\uploads\\img\\Bundesarchiv_Bild_183-1989-0821-502,_Joseph_Goebbels.jpg', NULL),
(29, '2018-07-09 17:26:50', 'ewrwer@dsgr.rt', 'jason', '123456', NULL, NULL),
(30, '2018-07-09 17:27:36', 'hfh@dfgd.rt', 'jason', '123456', NULL, NULL),
(31, '2018-07-09 17:29:00', 'ertea@srgd.ty', 'y11', 'ug0GdVMi', NULL, NULL),
(32, '2018-07-09 17:30:51', 'ghj@rt.tt', 'ssssss', 'ug0GdVMi', '\\uploads\\img\\logofdf.jpg', NULL),
(33, '2018-07-10 16:18:55', 'futarik3@ya.ru', 'futarik', '123456', '\\uploads\\img\\logofdf.jpg', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `bid_user` (`bid_user`),
  ADD KEY `bid_lot` (`bid_lot`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`lot_id`),
  ADD KEY `lot_author` (`lot_author`),
  ADD KEY `lot_winner` (`lot_winner`),
  ADD KEY `lot_category` (`lot_category`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `lot_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`bid_user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`bid_lot`) REFERENCES `lots` (`lot_id`);

--
-- Ограничения внешнего ключа таблицы `lots`
--
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_ibfk_1` FOREIGN KEY (`lot_author`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `lots_ibfk_2` FOREIGN KEY (`lot_winner`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `lots_ibfk_3` FOREIGN KEY (`lot_category`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
