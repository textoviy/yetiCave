-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 12 2018 г., 17:27
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
(61, '2018-07-11 18:04:55', 1200000, 12, 23),
(62, '2018-07-12 11:49:52', 500, 16, 23),
(63, '2018-07-11 18:59:50', 32220, 16, 22),
(64, '2018-07-11 19:29:48', 3, 16, 6),
(65, '2018-07-12 14:42:46', 2002, 16, 21),
(66, '2018-07-12 11:05:14', 102000, 16, 16),
(76, '2018-07-12 15:08:12', 3502, 12, 21),
(77, '2018-07-12 15:08:54', 33331, 33, 22),
(86, '2018-07-12 15:24:40', 37775, 18, 22),
(87, '2018-07-12 15:25:12', 160999, 34, 8),
(88, '2018-07-12 15:25:41', 1003, 34, 6),
(90, '2018-07-12 18:11:32', 39997, 35, 22),
(91, '2018-07-12 16:09:16', 1750, 35, 28),
(97, '2018-07-12 18:52:59', 5002, 40, 21),
(98, '2018-07-12 18:53:33', 42219, 40, 22),
(99, '2018-07-12 18:53:48', 2003, 40, 6),
(100, '2018-07-12 18:54:57', 43330, 41, 22),
(101, '2018-07-12 19:05:10', 6502, 41, 21);

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
(22, 'ЦДШЕОЗ98ЯЫП', 'ВАПЫВААП', '\\uploads\\img\\46-is0mE-Y4.jpg', '2018-07-10 16:29:32', '2018-07-31 00:00:00', 1111, 1111, 33, NULL, 5),
(23, 'Снегоход быстрый', 'Снегохо́д — механическое транспортное средство, предназначенное для движения по снегу.\r\nТермин «снегоход» в русском языке значительно у́же, чем англоязычный термин «snowmobile». Термин «snowmobile» принято использовать для обозначения любого транспортного средства, предназначенного для движения по снегу, включая гусеничные вездеходы, аэросани, вездеходы на пневматиках низкого давления и т. д.\r\nВ русском языке снегоходом принято называть только лыже-гусеничные транспортные средства, относительно небольшого размера, с органами управления по образу мотоциклетных.\r\n\r\n\r\nСнегоход «Буран»\r\nВ Советском Союзе и России долгое время был распространен термин «мотонарты», который и до сих пор часто встречается в различных официальных документах.[1]\r\n\r\nВ 1935 появился снегоход с лыжами, установленными спереди и цепной звездочкой и гусеничной системой сзади. Модифицированную версию использовали на лесозаготовках. В 1950-х появился снегоход с легкими шасси, рассчитанный на одного или двух человек.', '\\uploads\\img\\Снегоход.jpg', '2018-07-11 10:57:44', '2018-07-17 00:00:00', 1000000, 50000, 33, NULL, 5),
(27, 'xern', 'sfsdfs', '\\uploads\\img\\logofdf.jpg', '2018-07-11 17:34:37', '2018-07-31 00:00:00', 1111, 1111, 12, NULL, 6),
(28, 'Сани ', 'ани были древнейшей повозкой, развившейся из первоначальной волокуши и употреблявшейся не только в странах северных, но и в южных, например, в Египте. Многие народы, знавшие уже колёсную повозку, по обычаю пользовались санями в похоронном обряде (Древний Египет, Древняя Русь и др.).\r\n\r\nВ допетровской Руси вследствие неудовлетворительности дорог и улиц, а также сравнительной дешевизны саней они были наиболее распространёнными даже в летнее время. В болотистых и лесистых местах Архангельской, Вологодской, Олонецкой и Костромской губерний сани употреблялись летом до начала XX века. В Древней Руси езда на санях считалась более почётной, чем на колёсах, отчего сани употреблялись при всех торжественных случаях, особенно высшими духовными лицами, предпочитавшими их и летом до конца XVII века. Старинные сани имели вид лодки с краями, загнутыми спереди и сзади, или длинного ящика, суживающегося спереди, в котором можно было лежать. В них обычно запрягали одну лошадь, верхом на которой сидел кучер. У знатных бояр и особенно у великих князей и царей сани отличались богатым убранством; царские сани могли стоить 200—300 руб. Ездили в них обыкновенно по одному, редко по два человека, но, например, при выездах царя Алексея Михайловича в сани стоя помещалось два боярина на запятках и два стольника у царских ног, на специально сделанных уступах («полках»).', '\\uploads\\img\\Без названия.jpg', '2018-07-12 16:09:07', '2018-07-16 00:00:00', 1700, 50, 35, NULL, 1);

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
(15, '2018-07-06 17:10:31', 'drgdrgdg@dfoikgiod.tu', 'sss', 'ug0GdVMi', NULL, NULL),
(16, '2018-07-06 17:12:31', 'jasonstealer@ya.ru', 'jason', 'qwqwqw', NULL, NULL),
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
(33, '2018-07-10 16:18:55', 'futarik3@ya.ru', 'futarik', '123456', '\\uploads\\img\\logofdf.jpg', NULL),
(34, '2018-07-12 15:10:41', 'qwerty@ya.ru', 'qwerty', '123456', '\\uploads\\img\\Watermelons1.JPG', NULL),
(35, '2018-07-12 15:27:59', 'root@root.root', 'root', '123456', '\\uploads\\img\\46-is0mE-Y4.jpg', NULL),
(36, '2018-07-12 18:14:41', 'yoo@yoo.yoo', 'yoo', 'yooyoo', '\\uploads\\img\\Watermelons1.JPG', NULL),
(37, '2018-07-12 18:37:54', 'good@good.ru', 'good', 'goodgood', '\\uploads\\img\\Watermelons1.JPG', NULL),
(39, '2018-07-12 18:40:50', 'mood@mood.mood', 'mood', 'moodmood', '\\uploads\\img\\46-is0mE-Y4.jpg', NULL),
(40, '2018-07-12 18:47:03', 'roi@roi.roi', 'roiroi', 'roiroi', '\\uploads\\img\\Watermelons1.JPG', NULL),
(41, '2018-07-12 18:54:21', 'qw@qw.qw', 'qwqw', 'qwqwqw', '\\uploads\\img\\Watermelons1.JPG', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`),
  ADD UNIQUE KEY `bid_user_lot` (`bid_user`,`bid_lot`),
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
  MODIFY `bid_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `lot_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
