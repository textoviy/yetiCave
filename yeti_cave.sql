-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 28 2019 г., 21:55
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yeti_cave`
--


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
(64, '2019-06-17 02:09:58', 3003, 16, 6),
(65, '2019-06-15 19:18:38', 7002, 16, 21),
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
(101, '2018-07-12 19:05:10', 6502, 41, 21),
(102, '2019-06-15 19:14:33', 12000, 18, 7),
(103, '2019-06-28 08:38:59', 2800, 16, 35),
(110, '2019-06-15 21:05:33', 16080, 16, 36),
(111, '2019-06-15 22:58:50', 34320, 44, 36),
(112, '2019-06-15 21:37:18', 11999, 44, 10),
(113, '2019-06-15 22:49:32', 28240, 45, 36),
(114, '2019-06-15 23:14:42', 40400, 28, 36),
(115, '2019-06-16 20:06:10', 52561, 46, 36),
(117, '2019-06-16 20:02:15', 100500, 46, 37),
(118, '2019-06-16 22:41:58', 2299, 46, 35),
(119, '2019-06-28 10:10:39', 6900, 16, 38),
(120, '2019-06-16 22:42:49', 3000, 46, 38),
(121, '2019-06-16 22:46:07', 600, 46, 39),
(122, '2019-06-16 22:48:55', 510, 46, 40),
(123, '2019-06-17 03:14:16', 4300, 47, 38),
(124, '2019-06-16 22:55:49', 800, 47, 40),
(125, '2019-06-17 03:12:31', 100508, 47, 37),
(126, '2019-06-16 23:10:22', 60000, 47, 36),
(127, '2019-06-17 03:58:27', 2400, 16, 41),
(128, '2019-06-17 01:38:47', 2200, 47, 41),
(129, '2019-06-17 01:48:37', 900, 47, 42),
(130, '2019-06-17 04:45:15', 100509, 16, 37),
(131, '2019-06-17 13:36:08', 66080, 35, 36),
(132, '2019-06-17 23:58:36', 900, 16, 43),
(133, '2019-06-18 01:17:16', 2600, 48, 41),
(134, '2019-06-18 01:18:22', 100600, 48, 37),
(135, '2019-06-18 02:12:38', 200, 49, 44),
(136, '2019-06-18 02:12:04', 122, 24, 44),
(137, '2019-06-18 02:40:19', 21000, 50, 45),
(138, '2019-06-18 02:38:35', 6000, 49, 45),
(139, '2019-06-18 02:39:07', 6500, 18, 45),
(140, '2019-06-18 02:39:45', 10000, 24, 45),
(141, '2019-06-17 12:27:38', 72160, 50, 36),
(142, '2019-06-21 21:36:43', 1800, 51, 46),
(143, '2019-06-21 21:37:52', 3100, 49, 46),
(144, '2019-06-28 20:47:47', 9000, 50, 38),
(145, '2019-06-28 07:53:58', 1000, 16, 42),
(147, '2019-06-28 21:04:10', 3400, 50, 46),
(148, '2019-06-28 21:04:33', 500, 50, 44),
(149, '2019-06-28 21:06:32', 7502, 50, 21);

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
  `lot_description` text DEFAULT NULL,
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
(6, 'Лыжи детские', 'DESCRIPTION', 'img/baby_ski_modre5435.jpeg', '2018-05-21 13:54:05', '2001-05-23 13:54:05', 2490, 1000, 1, 45, 1),
(7, '2014 Rossignol District Snowboard', 'DESCRIPTION', 'img/lot-1.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 10999, 1000, 1, 45, 1),
(8, 'DC Ply Mens 2016/2017 Snowboard', 'DESCRIPTION', 'img/lot-2.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 159999, 1000, 1, 45, 1),
(9, 'Крепления Union Contact Pro 2015 года размер L/XL', 'DESCRIPTION', 'img/lot-3.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 8000, 1000, 1, 45, 2),
(10, 'Ботинки для сноуборда DC Mutiny Charocal', 'DESCRIPTION', 'img/lot-4.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 10999, 1000, 1, 45, 3),
(11, 'Куртка для сноуборда DC Mutiny Charocal', 'DESCRIPTION', 'img/lot-5.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 7500, 1000, 1, 45, 4),
(12, 'Маска Oakley Canopy', 'DESCRIPTION', 'img/lot-6.jpg', '2001-05-21 13:54:05', '2001-05-23 13:54:05', 5400, 1000, 1, 45, 6),
(21, 'Куртка зимняя', 'Теплая, до -50', 'uploads\\img\\zimnyaya-rabochaya-kurtka-dimex-697.jpg', '2019-06-10 16:23:33', '2019-07-30 00:00:00', 6700, 500, 33, NULL, 4),
(22, 'ЦДШЕОЗ98ЯЫП', 'ВАПЫВААП', '\\uploads\\img\\46-is0mE-Y4.jpg', '2018-07-10 16:29:32', '2018-07-31 00:00:00', 1111, 1111, 33, 45, 5),
(23, 'Снегоход быстрый', 'Снегохо́д — механическое транспортное средство, предназначенное для движения по снегу.\r\nТермин «снегоход» в русском языке значительно у́же, чем англоязычный термин «snowmobile». Термин «snowmobile» принято использовать для обозначения любого транспортного средства, предназначенного для движения по снегу, включая гусеничные вездеходы, аэросани, вездеходы на пневматиках низкого давления и т. д.\r\nВ русском языке снегоходом принято называть только лыже-гусеничные транспортные средства, относительно небольшого размера, с органами управления по образу мотоциклетных.\r\n\r\n\r\nСнегоход «Буран»\r\nВ Советском Союзе и России долгое время был распространен термин «мотонарты», который и до сих пор часто встречается в различных официальных документах.[1]\r\n\r\nВ 1935 появился снегоход с лыжами, установленными спереди и цепной звездочкой и гусеничной системой сзади. Модифицированную версию использовали на лесозаготовках. В 1950-х появился снегоход с легкими шасси, рассчитанный на одного или двух человек.', '\\uploads\\img\\Снегоход.jpg', '2018-07-11 10:57:44', '2018-07-17 00:00:00', 1000000, 50000, 33, 45, 5),
(27, 'xern', 'sfsdfs', '\\uploads\\img\\logofdf.jpg', '2018-07-11 17:34:37', '2018-07-31 00:00:00', 1111, 1111, 12, 45, 6),
(28, 'Сани ', 'ани были древнейшей повозкой, развившейся из первоначальной волокуши и употреблявшейся не только в странах северных, но и в южных, например, в Египте. Многие народы, знавшие уже колёсную повозку, по обычаю пользовались санями в похоронном обряде (Древний Египет, Древняя Русь и др.).\r\n\r\nВ допетровской Руси вследствие неудовлетворительности дорог и улиц, а также сравнительной дешевизны саней они были наиболее распространёнными даже в летнее время. В болотистых и лесистых местах Архангельской, Вологодской, Олонецкой и Костромской губерний сани употреблялись летом до начала XX века. В Древней Руси езда на санях считалась более почётной, чем на колёсах, отчего сани употреблялись при всех торжественных случаях, особенно высшими духовными лицами, предпочитавшими их и летом до конца XVII века. Старинные сани имели вид лодки с краями, загнутыми спереди и сзади, или длинного ящика, суживающегося спереди, в котором можно было лежать. В них обычно запрягали одну лошадь, верхом на которой сидел кучер. У знатных бояр и особенно у великих князей и царей сани отличались богатым убранством; царские сани могли стоить 200—300 руб. Ездили в них обыкновенно по одному, редко по два человека, но, например, при выездах царя Алексея Михайловича в сани стоя помещалось два боярина на запятках и два стольника у царских ног, на специально сделанных уступах («полках»).', '\\uploads\\img\\Без названия.jpg', '2018-07-12 16:09:07', '2018-07-16 00:00:00', 1700, 50, 35, 45, 1),
(35, 'Snow Cat', 'Стоит и смотрит', '\\uploads\\img\\1558812585181.jpg', '2019-06-15 20:01:04', '2019-06-22 00:00:00', 1000, 400, 16, 45, 6),
(36, 'Александор', 'Много курит, пьет и играет в секнс- видеоигрв', '\\uploads\\img\\P80613-184826.jpg', '2019-06-15 20:11:35', '2019-06-24 00:00:00', 10000, 6080, 16, 50, 5),
(37, 'кит', 'Точнее скат.', '\\uploads\\img\\LpnKOKb0enU.jpg', '2019-06-16 18:59:10', '2019-06-30 00:00:00', 100, 1, 46, NULL, 6),
(38, 'Дмитрий Боборыкин', 'Учитель по 1S.\r\nДелайте ваши стаавки!!', '\\uploads\\img\\a_76e77822.jpg', '2019-06-16 22:22:35', '2019-06-30 00:00:00', 1000, 500, 16, 50, 5),
(39, 'Черепаха', 'Можно воду в нее заливать', '\\uploads\\img\\jDexz-x9HDY.jpg', '2019-06-16 22:45:55', '2019-06-21 00:00:00', 501, 10, 46, NULL, 6),
(40, 'Собака', 'Стаканы заглатывает', '\\uploads\\img\\Ek950oX6GaI.jpg', '2019-06-16 22:48:41', '2019-06-30 00:00:00', 500, 10, 46, NULL, 6),
(41, 'Зимние кеды женские', 'ю', '\\uploads\\img\\kedy_zimnieid-93093771363298.jpg', '2019-06-17 01:19:29', '2019-06-19 00:00:00', 1800, 200, 16, 16, 3),
(42, 'Эликсир ', 'Absolut Vodka', '\\uploads\\img\\AX5-uSrsxLQ.jpg', '2019-06-17 01:48:16', '2019-06-27 00:00:00', 800, 100, 47, 16, 6),
(43, 'sefsef', 'sdfserwerwerw', '\\uploads\\img\\kedy_zimnieid-93093771363298.jpg', '2019-06-17 23:58:27', '2019-06-18 00:00:00', 123, 1, 16, 16, 1),
(44, 'Снег', 'Груда снега, мало ли не хватит другого \"снега\"', '\\uploads\\img\\P90207-225450.jpg', '2019-06-18 02:11:13', '2019-06-30 00:00:00', 120, 1, 49, NULL, 6),
(45, 'Зимняя куртка Zero-o', 'До -40', '\\uploads\\img\\zimnyaya-rabochaya-kurtka-dimex-697.jpg', '2019-06-18 02:37:48', '2019-06-19 00:00:00', 4500, 500, 50, 50, 4),
(46, 'Снежные монстры-помощники', '.', '\\uploads\\img\\LmNRIeHjHmQ.jpg', '2019-06-21 21:34:57', '2019-06-30 00:00:00', 1200, 300, 51, NULL, 6);

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
(1, '2001-05-21 13:54:05', 'ignat.v@gmail.com', 'Игнат', '$2y$10$OqvsKHQwr0Wk6FMZDoHo1uHoXd4UdxJG/5UDtUiie00XaxMHrW8ka', NULL, 'telegram: @idi_v_ptpit'),
(10, '2001-05-21 13:54:05', 'ignat.v@gmail.com', 'Игнат', '$2y$10$OqvsKHQwr0Wk6FMZDoHo1uHoXd4UdxJG/5UDtUiie00XaxMHrW8ka', NULL, 'telegram: @idi_v_ptpit'),
(12, '2018-07-06 17:08:58', 'fff@yy.rr', 'sss', 'ug0GdVMi', NULL, 'telegram: @idi_v_ptpit'),
(13, '2018-07-06 17:09:50', 'fff@yy.rr', 'sss', 'sadasdasdasd', NULL, 'telegram: @idi_v_ptpit'),
(15, '2018-07-06 17:10:31', 'drgdrgdg@dfoikgiod.tu', 'sss', 'ug0GdVMi', NULL, 'telegram: @idi_v_ptpit'),
(16, '2018-07-06 17:12:31', 'jasonstealer@ya.ru', 'jason', 'qwqwqw', NULL, 'telegram: @idi_v_folk'),
(18, '2018-07-06 18:03:31', 'trash@ya.ru', 'trash', '123456', NULL, 'telegram: @idi_v_ptpit'),
(19, '2018-07-09 10:32:46', 'ffcf@yy.rr', 'sss', '123456', NULL, 'telegram: @idi_v_ptpit'),
(20, '2018-07-09 10:33:20', 'ffff@yy.rr', 'sssv', '123456', NULL, 'telegram: @idi_v_ptpit'),
(21, '2018-07-09 12:07:25', 'email@email.email', 'email', '123456', NULL, 'telegram: @idi_v_ptpit'),
(22, '2018-07-09 12:11:04', 'fff@yy.rrq', 'sgdgdg', '123456', NULL, 'telegram: @idi_v_ptpit'),
(23, '2018-07-09 12:22:04', 'yag@yas.ry', 'yag', '123456', NULL, 'telegram: @idi_v_ptpit'),
(24, '2018-07-09 12:22:32', 'mood@ya.ru', 'mood', '123456', NULL, 'telegram: @idi_v_ptpit'),
(25, '2018-07-09 12:38:24', 'new_email@ya.ru', 'new_email', '123456', NULL, 'telegram: @idi_v_ptpit'),
(26, '2018-07-09 14:53:15', 'new@new.new', 'new', '123456', NULL, 'telegram: @idi_v_ptpit'),
(27, '2018-07-09 14:55:12', 'eee@eee.eee', 'eee', '123456', 'C:\\Users\\ip-4\\Downloads\\OpenServerPanel\\OSPanel\\domains\\yetiCave\\uploads\\img\\Bundesarchiv_Bild_183-1989-0821-502,_Joseph_Goebbels.jpg', 'telegram: @idi_v_ptpit'),
(28, '2018-07-09 14:56:10', 'fsdfs@dsf.rr', 'sss', '123456', 'C:\\Users\\ip-4\\Downloads\\OpenServerPanel\\OSPanel\\domains\\yetiCave\\uploads\\img\\Bundesarchiv_Bild_183-1989-0821-502,_Joseph_Goebbels.jpg', 'telegram: @idi_v_ptpit'),
(29, '2018-07-09 17:26:50', 'ewrwer@dsgr.rt', 'jason', '123456', NULL, 'telegram: @idi_v_ptpit'),
(30, '2018-07-09 17:27:36', 'hfh@dfgd.rt', 'jason', '123456', NULL, 'telegram: @idi_v_ptpit'),
(31, '2018-07-09 17:29:00', 'ertea@srgd.ty', 'y11', 'ug0GdVMi', NULL, 'telegram: @idi_v_ptpit'),
(32, '2018-07-09 17:30:51', 'ghj@rt.tt', 'ssssss', 'ug0GdVMi', '\\uploads\\img\\logofdf.jpg', 'telegram: @idi_v_ptpit'),
(33, '2018-07-10 16:18:55', 'futarik3@ya.ru', 'futarik', '123456', '\\uploads\\img\\logofdf.jpg', 'telegram: @xpen'),
(34, '2018-07-12 15:10:41', 'qwerty@ya.ru', 'qwerty', '123456', '\\uploads\\img\\Watermelons1.JPG', 'telegram: @idi_v_ptpit'),
(35, '2018-07-12 15:27:59', 'root@root.root', 'root', '123456', '\\uploads\\img\\46-is0mE-Y4.jpg', 'telegram: @idi_v_ptpit'),
(36, '2018-07-12 18:14:41', 'yoo@yoo.yoo', 'yoo', 'yooyoo', '\\uploads\\img\\Watermelons1.JPG', 'telegram: @idi_v_ptpit'),
(37, '2018-07-12 18:37:54', 'good@good.ru', 'good', 'goodgood', '\\uploads\\img\\Watermelons1.JPG', 'telegram: @idi_v_ptpit'),
(39, '2018-07-12 18:40:50', 'mood@mood.mood', 'mood', 'moodmood', '\\uploads\\img\\46-is0mE-Y4.jpg', 'telegram: @idi_v_ptpit'),
(40, '2018-07-12 18:47:03', 'roi@roi.roi', 'roiroi', 'roiroi', '\\uploads\\img\\Watermelons1.JPG', 'telegram: @idi_v_ptpit'),
(41, '2018-07-12 18:54:21', 'qw@qw.qw', 'qwqw', 'qwqwqw', '\\uploads\\img\\Watermelons1.JPG', 'telegram: @idi_v_ptpit'),
(42, '2019-06-15 20:52:35', 'coll1n5jam@yandex.ru', 'coll1n5jam', 'coll1n5jamcoll1n5jam', '\\uploads\\img\\5d047290ddbb0.png', 'telegram: @idi_v_ptpit'),
(43, '2019-06-15 20:58:29', 'вап', 'вап', 'вап', 'пва', 'telegram: @idi_v_ptpit'),
(44, '2019-06-15 21:06:15', 'vbn@vbn.vbn', 'vbnvbn', 'vbnvbn', '\\uploads\\img\\5d047290ddbb0.png', 'vbnvbnvbn'),
(45, '2019-06-15 22:48:43', 'dj@dj.dj', 'djdj', '123456', '\\uploads\\img\\LmNRIeHjHmQ.jpg', '@portfolio'),
(46, '2019-06-16 19:54:35', 'good@good.good', 'good', 'goodgood', '\\uploads\\img\\X2q8ey-ZQIE.jpg', 'good'),
(47, '2019-06-16 22:53:07', 'chlens@ya.ru', 'Членс', '123456', '\\uploads\\img\\RA67QzD-t_A.jpg', 'chlens@ya.ru'),
(48, '2019-06-18 01:15:52', 'sender505@mail.ru', 'sender', '123456', '\\uploads\\img\\sHuqN3pwRlU.jpg', 'sender'),
(49, '2019-06-18 02:10:00', 'kotletnikov@ya.ru', 'kotletk', '123456', '\\uploads\\img\\S90417-03340319.jpg', 'telesgram: @ponrgub'),
(50, '2019-06-18 02:36:34', 'jonhwu@yandex.ru', 'jonhwu', '123456', '\\uploads\\img\\3905611.jfif', 'jonhwu@yandex.ru'),
(51, '2019-06-21 21:33:37', 'kotletnikov@yandex.ru', 'kotletkov', '123456', '\\uploads\\img\\P90617-175550.jpg', 'test');

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
  MODIFY `bid_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `lot_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
