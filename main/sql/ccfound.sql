-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 13 Mar 2021, 10:48
-- Wersja serwera: 8.0.20
-- Wersja PHP: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ccfound`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accepts`
--

CREATE TABLE `accepts` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `archived` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accepts`
--

INSERT INTO `accepts` (`id`, `user_id`, `article_id`, `description`, `created`, `updated`, `archived`) VALUES
(1, 5, 1, 'test accept', '2019-11-02 18:42:06', '2019-11-02 18:42:06', 0),
(3, 5, 1, 'test counter', '2019-11-02 19:13:22', '2019-11-02 19:13:22', 0),
(4, 5, 1, 'test3', '2019-11-03 11:22:59', '2019-11-03 11:22:59', 0),
(5, 5, 1, 'ggg', '2019-11-03 11:49:30', '2019-11-03 11:49:30', 0),
(6, 5, 1, 'test accept', '2019-11-11 09:40:46', '2019-11-11 09:40:46', 0),
(7, 5, 4, 'accept', '2019-12-04 22:19:58', '2019-12-04 22:19:58', 0),
(8, 5, 5, 'accept', '2019-12-04 22:22:19', '2019-12-04 22:22:19', 0),
(9, 5, 2, 'accept', '2019-12-04 22:22:49', '2019-12-04 22:22:49', 0),
(10, 5, 1, 'accept', '2019-12-04 22:24:49', '2019-12-04 22:24:49', 0),
(11, 5, 10, 'accept', '2019-12-04 22:29:54', '2019-12-04 22:29:54', 1),
(12, 5, 2, 'accept', '2019-12-04 22:31:41', '2019-12-04 22:31:41', 0),
(13, 5, 11, 'accept', '2019-12-04 22:34:20', '2019-12-04 22:34:20', 1),
(14, 7, 2, 'dupa dupa', '2019-12-05 21:02:58', '2019-12-05 21:02:58', 0),
(15, 5, 11, 'aaa', '2020-01-04 14:09:48', '2020-01-04 14:09:48', 1),
(16, 7, 14, 'asdfasfsdfds sad asd asd', '2020-01-12 23:32:04', '2020-01-12 23:32:04', 1),
(17, 7, 16, 'asdsa asd as as', '2020-01-14 22:54:53', '2020-01-14 22:54:53', 0),
(18, 7, 18, 'cos tam cos tam ', '2020-01-25 17:46:51', '2020-01-25 17:46:51', 0),
(19, 7, 19, 'sdfsafasdsda', '2020-01-25 17:59:38', '2020-01-25 17:59:38', 0),
(20, 7, 10, 'gg', '2020-02-02 21:00:14', '2020-02-02 21:00:14', 1),
(21, 29, 21, 'sdasda', '2020-02-03 22:42:33', '2020-02-03 22:42:33', 0),
(22, 7, 22, 'asada', '2020-02-03 22:50:12', '2020-02-03 22:50:12', 0),
(23, 36, 18, 'Bardzo przydatny artykuł! :)\r\n', '2020-02-05 18:41:22', '2020-02-05 18:41:22', 0),
(24, 37, 24, 'asdasd asd as as', '2020-02-06 09:55:42', '2020-02-06 09:55:42', 0),
(25, 6, 22, 'siaka laka', '2020-02-11 11:04:10', '2020-02-11 11:04:10', 0),
(26, 7, 11, 'asdfas', '2020-02-11 21:12:12', '2020-02-11 21:12:12', 1),
(27, 45, 28, 'ijhghjgjh', '2020-02-15 11:26:32', '2020-02-15 11:26:32', 1),
(28, 45, 29, 'sdfsd', '2020-02-16 10:05:36', '2020-02-16 10:05:36', 0),
(29, 8, 29, 'jhjj', '2020-02-17 17:37:21', '2020-02-17 17:37:21', 0),
(30, 31, 29, '', '2020-02-18 16:49:54', '2020-02-18 16:49:54', 0),
(31, 31, 30, '', '2020-02-18 18:08:50', '2020-02-18 18:08:50', 0),
(32, 6, 23, '', '2020-02-19 16:05:27', '2020-02-19 16:05:27', 1),
(33, 5, 23, '', '2020-02-20 10:04:34', '2020-02-20 10:04:34', 1),
(34, 5, 22, '', '2020-02-24 20:39:41', '2020-02-24 20:39:41', 0),
(35, 7, 23, '', '2020-02-24 23:23:01', '2020-02-24 23:23:01', 1),
(36, 7, 35, '', '2020-03-03 17:17:15', '2020-03-03 17:17:15', 0),
(37, 5, 21, '', '2020-03-03 22:53:16', '2020-03-03 22:53:16', 0),
(38, 7, 32, '', '2020-03-03 23:01:30', '2020-03-03 23:01:30', 0),
(39, 34, 33, '', '2020-03-07 13:11:56', '2020-03-07 13:11:56', 0),
(40, 7, 41, '', '2020-05-18 06:51:29', '2020-05-18 06:51:29', 0),
(41, 7, 51, '', '2020-06-04 16:21:30', '2020-06-04 16:21:30', 1),
(42, 7, 51, '', '2020-06-04 20:21:39', '2020-06-04 20:21:39', 1),
(43, 52, 44, '', '2020-06-05 10:39:53', '2020-06-05 10:39:53', 1),
(44, 52, 49, '', '2020-06-05 10:45:24', '2020-06-05 10:45:24', 0),
(45, 7, 73, NULL, '2020-07-02 18:26:34', '2020-07-02 18:26:34', 0),
(46, 7, 80, NULL, '2020-07-18 21:23:59', '2020-07-18 21:23:59', 0),
(47, 31, 82, NULL, '2020-07-22 01:35:03', '2020-07-22 01:35:03', 0),
(48, 31, 51, NULL, '2020-07-22 01:50:51', '2020-07-22 01:50:51', 0),
(49, 31, 85, NULL, '2020-07-25 16:00:19', '2020-07-25 16:00:19', 0),
(50, 7, 86, NULL, '2020-07-30 18:40:07', '2020-07-30 18:40:07', 0),
(51, 31, 86, NULL, '2020-07-30 19:12:01', '2020-07-30 19:12:01', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accepts_comments`
--

CREATE TABLE `accepts_comments` (
  `id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `accept_id` bigint NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_deleted` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `accepts_comments`
--

INSERT INTO `accepts_comments` (`id`, `parent_id`, `user_id`, `accept_id`, `description`, `created`, `updated`, `is_deleted`) VALUES
(1, NULL, 7, 17, 'fsdfasdf asdf saf', '2020-01-14 23:04:45', '2020-01-14 23:04:45', 0),
(2, 1, 7, 17, 'asdf asdf a', '2020-01-15 08:04:11', '2020-01-15 08:04:11', 0),
(3, NULL, 7, 18, 'dfsd s sdf', '2020-01-25 17:47:49', '2020-01-25 17:47:49', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `acos`
--

CREATE TABLE `acos` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `acos`
--

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, NULL, NULL, 'controllers', 1, 1022),
(2, 1, NULL, NULL, 'Error', 2, 3),
(3, 1, NULL, NULL, 'Pages', 4, 9),
(4, 3, NULL, NULL, 'display', 5, 6),
(5, 1, NULL, NULL, 'Admin', 10, 11),
(6, 1, NULL, NULL, 'Acl', 12, 13),
(7, 1, NULL, NULL, 'BootstrapUI', 14, 15),
(8, 1, NULL, NULL, 'Croogo\\Acl', 16, 57),
(9, 8, NULL, NULL, 'Admin', 17, 56),
(10, 9, NULL, NULL, 'Permissions', 18, 35),
(11, 10, NULL, NULL, 'index', 19, 20),
(12, 10, NULL, NULL, 'toggle', 21, 22),
(13, 10, NULL, NULL, 'view', 23, 24),
(14, 10, NULL, NULL, 'add', 25, 26),
(15, 10, NULL, NULL, 'edit', 27, 28),
(16, 10, NULL, NULL, 'delete', 29, 30),
(17, 10, NULL, NULL, 'getName', 31, 32),
(18, 9, NULL, NULL, 'Actions', 36, 55),
(19, 18, NULL, NULL, 'index', 37, 38),
(20, 18, NULL, NULL, 'add', 39, 40),
(21, 18, NULL, NULL, 'edit', 41, 42),
(22, 18, NULL, NULL, 'delete', 43, 44),
(23, 18, NULL, NULL, 'move', 45, 46),
(24, 18, NULL, NULL, 'generate', 47, 48),
(25, 18, NULL, NULL, 'view', 49, 50),
(26, 18, NULL, NULL, 'getName', 51, 52),
(27, 1, NULL, NULL, 'Croogo\\Blocks', 58, 97),
(28, 27, NULL, NULL, 'Admin', 59, 96),
(29, 28, NULL, NULL, 'Regions', 60, 75),
(30, 29, NULL, NULL, 'index', 61, 62),
(31, 29, NULL, NULL, 'view', 63, 64),
(32, 29, NULL, NULL, 'add', 65, 66),
(33, 29, NULL, NULL, 'edit', 67, 68),
(34, 29, NULL, NULL, 'delete', 69, 70),
(35, 29, NULL, NULL, 'getName', 71, 72),
(36, 28, NULL, NULL, 'Blocks', 76, 95),
(37, 36, NULL, NULL, 'process', 77, 78),
(38, 36, NULL, NULL, 'toggle', 79, 80),
(39, 36, NULL, NULL, 'index', 81, 82),
(40, 36, NULL, NULL, 'view', 83, 84),
(41, 36, NULL, NULL, 'add', 85, 86),
(42, 36, NULL, NULL, 'edit', 87, 88),
(43, 36, NULL, NULL, 'delete', 89, 90),
(44, 36, NULL, NULL, 'getName', 91, 92),
(45, 1, NULL, NULL, 'Croogo\\Contacts', 98, 141),
(46, 45, NULL, NULL, 'Contacts', 99, 104),
(47, 46, NULL, NULL, 'view', 100, 101),
(48, 45, NULL, NULL, 'Admin', 105, 140),
(49, 48, NULL, NULL, 'Contacts', 106, 121),
(50, 49, NULL, NULL, 'index', 107, 108),
(51, 49, NULL, NULL, 'view', 109, 110),
(52, 49, NULL, NULL, 'add', 111, 112),
(53, 49, NULL, NULL, 'edit', 113, 114),
(54, 49, NULL, NULL, 'delete', 115, 116),
(55, 49, NULL, NULL, 'getName', 117, 118),
(56, 48, NULL, NULL, 'Messages', 122, 139),
(57, 56, NULL, NULL, 'process', 123, 124),
(58, 56, NULL, NULL, 'index', 125, 126),
(59, 56, NULL, NULL, 'view', 127, 128),
(60, 56, NULL, NULL, 'add', 129, 130),
(61, 56, NULL, NULL, 'edit', 131, 132),
(62, 56, NULL, NULL, 'delete', 133, 134),
(63, 56, NULL, NULL, 'getName', 135, 136),
(64, 1, NULL, NULL, 'Croogo\\Core', 142, 165),
(65, 64, NULL, NULL, 'Error', 143, 144),
(66, 64, NULL, NULL, 'Admin', 145, 164),
(67, 66, NULL, NULL, 'LinkChooser', 146, 163),
(68, 67, NULL, NULL, 'linkChooser', 147, 148),
(69, 67, NULL, NULL, 'index', 149, 150),
(70, 67, NULL, NULL, 'view', 151, 152),
(71, 67, NULL, NULL, 'add', 153, 154),
(72, 67, NULL, NULL, 'edit', 155, 156),
(73, 67, NULL, NULL, 'delete', 157, 158),
(74, 67, NULL, NULL, 'getName', 159, 160),
(75, 1, NULL, NULL, 'Croogo\\Dashboards', 166, 195),
(76, 75, NULL, NULL, 'Admin', 167, 194),
(77, 76, NULL, NULL, 'Dashboards', 168, 193),
(78, 77, NULL, NULL, 'index', 169, 170),
(79, 77, NULL, NULL, 'dashboard', 171, 172),
(80, 77, NULL, NULL, 'save', 173, 174),
(81, 77, NULL, NULL, 'delete', 175, 176),
(82, 77, NULL, NULL, 'toggle', 177, 178),
(83, 77, NULL, NULL, 'moveup', 179, 180),
(84, 77, NULL, NULL, 'movedown', 181, 182),
(85, 77, NULL, NULL, 'view', 183, 184),
(86, 77, NULL, NULL, 'add', 185, 186),
(87, 77, NULL, NULL, 'edit', 187, 188),
(88, 77, NULL, NULL, 'getName', 189, 190),
(89, 1, NULL, NULL, 'Croogo\\Extensions', 196, 265),
(90, 89, NULL, NULL, 'Admin', 197, 264),
(91, 90, NULL, NULL, 'Themes', 198, 219),
(92, 91, NULL, NULL, 'index', 199, 200),
(93, 91, NULL, NULL, 'activate', 201, 202),
(94, 91, NULL, NULL, 'add', 203, 204),
(95, 91, NULL, NULL, 'editor', 205, 206),
(96, 91, NULL, NULL, 'save', 207, 208),
(97, 91, NULL, NULL, 'delete', 209, 210),
(98, 91, NULL, NULL, 'view', 211, 212),
(99, 91, NULL, NULL, 'edit', 213, 214),
(100, 91, NULL, NULL, 'getName', 215, 216),
(101, 90, NULL, NULL, 'Plugins', 220, 243),
(102, 101, NULL, NULL, 'index', 221, 222),
(103, 101, NULL, NULL, 'add', 223, 224),
(104, 101, NULL, NULL, 'delete', 225, 226),
(105, 101, NULL, NULL, 'toggle', 227, 228),
(106, 101, NULL, NULL, 'migrate', 229, 230),
(107, 101, NULL, NULL, 'moveup', 231, 232),
(108, 101, NULL, NULL, 'movedown', 233, 234),
(109, 101, NULL, NULL, 'view', 235, 236),
(110, 101, NULL, NULL, 'edit', 237, 238),
(111, 101, NULL, NULL, 'getName', 239, 240),
(112, 90, NULL, NULL, 'Locales', 244, 263),
(113, 112, NULL, NULL, 'index', 245, 246),
(114, 112, NULL, NULL, 'activate', 247, 248),
(115, 112, NULL, NULL, 'deactivate', 249, 250),
(116, 112, NULL, NULL, 'add', 251, 252),
(117, 112, NULL, NULL, 'edit', 253, 254),
(118, 112, NULL, NULL, 'delete', 255, 256),
(119, 112, NULL, NULL, 'view', 257, 258),
(120, 112, NULL, NULL, 'getName', 259, 260),
(121, 1, NULL, NULL, 'Croogo\\FileManager', 266, 323),
(122, 121, NULL, NULL, 'Admin', 267, 322),
(123, 122, NULL, NULL, 'FileManager', 268, 301),
(124, 123, NULL, NULL, 'index', 269, 270),
(125, 123, NULL, NULL, 'browse', 271, 272),
(126, 123, NULL, NULL, 'editFile', 273, 274),
(127, 123, NULL, NULL, 'upload', 275, 276),
(128, 123, NULL, NULL, 'deleteFile', 277, 278),
(129, 123, NULL, NULL, 'deleteDirectory', 279, 280),
(130, 123, NULL, NULL, 'rename', 281, 282),
(131, 123, NULL, NULL, 'createDirectory', 283, 284),
(132, 123, NULL, NULL, 'createFile', 285, 286),
(133, 123, NULL, NULL, 'chmod', 287, 288),
(134, 123, NULL, NULL, 'view', 289, 290),
(135, 123, NULL, NULL, 'add', 291, 292),
(136, 123, NULL, NULL, 'edit', 293, 294),
(137, 123, NULL, NULL, 'delete', 295, 296),
(138, 123, NULL, NULL, 'getName', 297, 298),
(139, 122, NULL, NULL, 'Attachments', 302, 321),
(140, 139, NULL, NULL, 'browse', 303, 304),
(141, 139, NULL, NULL, 'add', 305, 306),
(142, 139, NULL, NULL, 'process', 307, 308),
(143, 139, NULL, NULL, 'index', 309, 310),
(144, 139, NULL, NULL, 'view', 311, 312),
(145, 139, NULL, NULL, 'edit', 313, 314),
(146, 139, NULL, NULL, 'delete', 315, 316),
(147, 139, NULL, NULL, 'getName', 317, 318),
(157, 1, NULL, NULL, 'Croogo\\Menus', 324, 365),
(158, 157, NULL, NULL, 'Admin', 325, 364),
(159, 158, NULL, NULL, 'Menus', 326, 341),
(160, 159, NULL, NULL, 'index', 327, 328),
(161, 159, NULL, NULL, 'view', 329, 330),
(162, 159, NULL, NULL, 'add', 331, 332),
(163, 159, NULL, NULL, 'edit', 333, 334),
(164, 159, NULL, NULL, 'delete', 335, 336),
(165, 159, NULL, NULL, 'getName', 337, 338),
(166, 158, NULL, NULL, 'Links', 342, 363),
(167, 166, NULL, NULL, 'index', 343, 344),
(168, 166, NULL, NULL, 'delete', 345, 346),
(169, 166, NULL, NULL, 'moveup', 347, 348),
(170, 166, NULL, NULL, 'movedown', 349, 350),
(171, 166, NULL, NULL, 'process', 351, 352),
(172, 166, NULL, NULL, 'view', 353, 354),
(173, 166, NULL, NULL, 'add', 355, 356),
(174, 166, NULL, NULL, 'edit', 357, 358),
(175, 166, NULL, NULL, 'getName', 359, 360),
(176, 1, NULL, NULL, 'Croogo\\Meta', 366, 389),
(177, 176, NULL, NULL, 'Admin', 367, 388),
(178, 177, NULL, NULL, 'Meta', 368, 387),
(179, 178, NULL, NULL, 'deleteMeta', 369, 370),
(180, 178, NULL, NULL, 'addMeta', 371, 372),
(181, 178, NULL, NULL, 'index', 373, 374),
(182, 178, NULL, NULL, 'view', 375, 376),
(183, 178, NULL, NULL, 'add', 377, 378),
(184, 178, NULL, NULL, 'edit', 379, 380),
(185, 178, NULL, NULL, 'delete', 381, 382),
(186, 178, NULL, NULL, 'getName', 383, 384),
(187, 1, NULL, NULL, 'Croogo\\Nodes', 390, 445),
(188, 187, NULL, NULL, 'Nodes', 391, 404),
(189, 188, NULL, NULL, 'index', 392, 393),
(190, 188, NULL, NULL, 'term', 394, 395),
(191, 188, NULL, NULL, 'promoted', 396, 397),
(192, 188, NULL, NULL, 'search', 398, 399),
(193, 188, NULL, NULL, 'view', 400, 401),
(194, 187, NULL, NULL, 'Admin', 405, 436),
(195, 194, NULL, NULL, 'Nodes', 406, 435),
(196, 195, NULL, NULL, 'create', 407, 408),
(197, 195, NULL, NULL, 'update_paths', 409, 410),
(198, 195, NULL, NULL, 'delete_meta', 411, 412),
(199, 195, NULL, NULL, 'add_meta', 413, 414),
(200, 195, NULL, NULL, 'process', 415, 416),
(201, 195, NULL, NULL, 'toggle', 417, 418),
(202, 195, NULL, NULL, 'move', 419, 420),
(203, 195, NULL, NULL, 'index', 421, 422),
(204, 195, NULL, NULL, 'view', 423, 424),
(205, 195, NULL, NULL, 'add', 425, 426),
(206, 195, NULL, NULL, 'edit', 427, 428),
(207, 195, NULL, NULL, 'delete', 429, 430),
(208, 195, NULL, NULL, 'getName', 431, 432),
(209, 187, NULL, NULL, 'Api', 437, 444),
(210, 209, NULL, NULL, 'V10', 438, 443),
(211, 210, NULL, NULL, 'Nodes', 439, 442),
(212, 211, NULL, NULL, 'lookup', 440, 441),
(213, 1, NULL, NULL, 'Croogo\\Settings', 446, 507),
(214, 213, NULL, NULL, 'Admin', 447, 506),
(215, 214, NULL, NULL, 'Settings', 448, 469),
(216, 215, NULL, NULL, 'prefix', 449, 450),
(217, 215, NULL, NULL, 'moveup', 451, 452),
(218, 215, NULL, NULL, 'movedown', 453, 454),
(219, 215, NULL, NULL, 'index', 455, 456),
(220, 215, NULL, NULL, 'view', 457, 458),
(221, 215, NULL, NULL, 'add', 459, 460),
(222, 215, NULL, NULL, 'edit', 461, 462),
(223, 215, NULL, NULL, 'delete', 463, 464),
(224, 215, NULL, NULL, 'getName', 465, 466),
(225, 214, NULL, NULL, 'Caches', 470, 487),
(226, 225, NULL, NULL, 'index', 471, 472),
(227, 225, NULL, NULL, 'clear', 473, 474),
(228, 225, NULL, NULL, 'view', 475, 476),
(229, 225, NULL, NULL, 'add', 477, 478),
(230, 225, NULL, NULL, 'edit', 479, 480),
(231, 225, NULL, NULL, 'delete', 481, 482),
(232, 225, NULL, NULL, 'getName', 483, 484),
(233, 214, NULL, NULL, 'Languages', 488, 505),
(234, 233, NULL, NULL, 'select', 489, 490),
(235, 233, NULL, NULL, 'index', 491, 492),
(236, 233, NULL, NULL, 'view', 493, 494),
(237, 233, NULL, NULL, 'add', 495, 496),
(238, 233, NULL, NULL, 'edit', 497, 498),
(239, 233, NULL, NULL, 'delete', 499, 500),
(240, 233, NULL, NULL, 'getName', 501, 502),
(241, 1, NULL, NULL, 'Croogo\\Taxonomy', 508, 563),
(242, 241, NULL, NULL, 'Admin', 509, 562),
(243, 242, NULL, NULL, 'Terms', 510, 529),
(244, 243, NULL, NULL, 'index', 511, 512),
(245, 243, NULL, NULL, 'delete', 513, 514),
(246, 243, NULL, NULL, 'moveup', 515, 516),
(247, 243, NULL, NULL, 'movedown', 517, 518),
(248, 243, NULL, NULL, 'view', 519, 520),
(249, 243, NULL, NULL, 'add', 521, 522),
(250, 243, NULL, NULL, 'edit', 523, 524),
(251, 243, NULL, NULL, 'getName', 525, 526),
(252, 242, NULL, NULL, 'Types', 530, 545),
(253, 252, NULL, NULL, 'index', 531, 532),
(254, 252, NULL, NULL, 'view', 533, 534),
(255, 252, NULL, NULL, 'add', 535, 536),
(256, 252, NULL, NULL, 'edit', 537, 538),
(257, 252, NULL, NULL, 'delete', 539, 540),
(258, 252, NULL, NULL, 'getName', 541, 542),
(259, 242, NULL, NULL, 'Vocabularies', 546, 561),
(260, 259, NULL, NULL, 'index', 547, 548),
(261, 259, NULL, NULL, 'view', 549, 550),
(262, 259, NULL, NULL, 'add', 551, 552),
(263, 259, NULL, NULL, 'edit', 553, 554),
(264, 259, NULL, NULL, 'delete', 555, 556),
(265, 259, NULL, NULL, 'getName', 557, 558),
(266, 1, NULL, NULL, 'Croogo\\Users', 564, 681),
(267, 266, NULL, NULL, 'Users', 565, 624),
(268, 267, NULL, NULL, 'index', 566, 567),
(269, 267, NULL, NULL, 'add', 568, 569),
(270, 267, NULL, NULL, 'activate', 570, 571),
(271, 267, NULL, NULL, 'edit', 572, 573),
(272, 267, NULL, NULL, 'forgot', 574, 575),
(273, 267, NULL, NULL, 'reset', 576, 577),
(274, 267, NULL, NULL, 'login', 578, 579),
(275, 267, NULL, NULL, 'logout', 580, 581),
(276, 267, NULL, NULL, 'view', 582, 583),
(277, 266, NULL, NULL, 'Admin', 625, 670),
(278, 277, NULL, NULL, 'Roles', 626, 641),
(279, 278, NULL, NULL, 'index', 627, 628),
(280, 278, NULL, NULL, 'view', 629, 630),
(281, 278, NULL, NULL, 'add', 631, 632),
(282, 278, NULL, NULL, 'edit', 633, 634),
(283, 278, NULL, NULL, 'delete', 635, 636),
(284, 278, NULL, NULL, 'getName', 637, 638),
(285, 277, NULL, NULL, 'Users', 642, 669),
(286, 285, NULL, NULL, 'resetPassword', 643, 644),
(287, 285, NULL, NULL, 'login', 645, 646),
(288, 285, NULL, NULL, 'logout', 647, 648),
(289, 285, NULL, NULL, 'register', 649, 650),
(290, 285, NULL, NULL, 'forgot', 651, 652),
(291, 285, NULL, NULL, 'reset', 653, 654),
(292, 285, NULL, NULL, 'index', 655, 656),
(293, 285, NULL, NULL, 'view', 657, 658),
(294, 285, NULL, NULL, 'add', 659, 660),
(295, 285, NULL, NULL, 'edit', 661, 662),
(296, 285, NULL, NULL, 'delete', 663, 664),
(297, 285, NULL, NULL, 'getName', 665, 666),
(298, 266, NULL, NULL, 'Api', 671, 680),
(299, 298, NULL, NULL, 'V10', 672, 679),
(300, 299, NULL, NULL, 'Users', 673, 678),
(301, 300, NULL, NULL, 'lookup', 674, 675),
(302, 300, NULL, NULL, 'token', 676, 677),
(303, 1, NULL, NULL, 'Croogo\\Wysiwyg', 682, 683),
(304, 1, NULL, NULL, 'Migrations', 684, 685),
(305, 1, NULL, NULL, 'Search', 686, 687),
(306, 267, NULL, NULL, 'main', 584, 585),
(308, 1, NULL, NULL, 'CryptoTheme', 688, 689),
(324, 1, NULL, NULL, 'Articles', 690, 719),
(325, 324, NULL, NULL, 'Articles', 691, 718),
(327, 325, NULL, NULL, 'add', 692, 693),
(328, 325, NULL, NULL, 'view', 694, 695),
(329, 1, NULL, NULL, 'Categories', 720, 733),
(330, 329, NULL, NULL, 'Categories', 721, 732),
(336, 325, NULL, NULL, 'edit', 696, 697),
(337, 1, NULL, NULL, 'Notes', 734, 799),
(338, 337, NULL, NULL, 'Notes', 735, 754),
(339, 338, NULL, NULL, 'add', 736, 737),
(340, 337, NULL, NULL, 'Reviews', 755, 764),
(341, 340, NULL, NULL, 'add', 756, 757),
(342, 337, NULL, NULL, 'Accepts', 765, 776),
(343, 342, NULL, NULL, 'add', 766, 767),
(344, 337, NULL, NULL, 'Rejects', 777, 798),
(345, 344, NULL, NULL, 'add', 778, 779),
(346, 1, NULL, NULL, 'Votes', 800, 811),
(347, 346, NULL, NULL, 'Votes', 801, 810),
(350, 267, NULL, NULL, 'roles', 586, 587),
(351, 1, NULL, NULL, 'Notices', 812, 845),
(352, 351, NULL, NULL, 'Notices', 813, 844),
(353, 352, NULL, NULL, 'index', 814, 815),
(354, 338, NULL, NULL, 'comment', 738, 739),
(355, 1, NULL, NULL, 'Banners', 846, 865),
(356, 355, NULL, NULL, 'Banners', 847, 864),
(357, 356, NULL, NULL, 'index', 848, 849),
(358, 356, NULL, NULL, 'view', 850, 851),
(359, 356, NULL, NULL, 'add', 852, 853),
(360, 356, NULL, NULL, 'edit', 854, 855),
(361, 356, NULL, NULL, 'delete', 856, 857),
(363, 267, NULL, NULL, 'change', 588, 589),
(364, 338, NULL, NULL, 'comments', 740, 741),
(365, 1, NULL, NULL, 'Croogo\\Translate', 866, 885),
(366, 365, NULL, NULL, 'Admin', 867, 884),
(367, 366, NULL, NULL, 'Translate', 868, 883),
(368, 367, NULL, NULL, 'index', 869, 870),
(369, 367, NULL, NULL, 'edit', 871, 872),
(370, 367, NULL, NULL, 'delete', 873, 874),
(371, 325, NULL, NULL, 'index', 698, 699),
(373, 367, NULL, NULL, 'view', 875, 876),
(374, 367, NULL, NULL, 'add', 877, 878),
(375, 367, NULL, NULL, 'getName', 879, 880),
(376, 267, NULL, NULL, 'general', 590, 591),
(377, 267, NULL, NULL, 'inbox', 592, 593),
(378, 1, NULL, NULL, 'ADmad\\SocialAuth', 886, 887),
(381, 325, NULL, NULL, 'contents', 700, 701),
(382, 325, NULL, NULL, 'search', 702, 703),
(383, 330, NULL, NULL, 'index', 722, 723),
(385, 267, NULL, NULL, 'getAttributes', 594, 595),
(387, 347, NULL, NULL, 'agree', 802, 803),
(388, 347, NULL, NULL, 'disagree', 804, 805),
(389, 356, NULL, NULL, 'sort', 858, 859),
(390, 1, NULL, NULL, 'FIleHandler', 888, 895),
(391, 390, NULL, NULL, 'FileHandler', 889, 894),
(392, 391, NULL, NULL, 'upload', 890, 891),
(393, 342, NULL, NULL, 'index', 768, 769),
(394, 344, NULL, NULL, 'index', 780, 781),
(395, 325, NULL, NULL, 'comments', 704, 705),
(396, 1, NULL, NULL, 'Newsletter', 896, 915),
(397, 396, NULL, NULL, 'Newsletter', 897, 914),
(398, 1, NULL, NULL, 'Reports', 916, 963),
(399, 398, NULL, NULL, 'Reports', 917, 962),
(400, 397, NULL, NULL, 'index', 898, 899),
(401, 397, NULL, NULL, 'add', 900, 901),
(402, 397, NULL, NULL, 'remove', 902, 903),
(403, 340, NULL, NULL, 'comment', 758, 759),
(404, 340, NULL, NULL, 'comments', 760, 761),
(405, 342, NULL, NULL, 'comment', 770, 771),
(406, 342, NULL, NULL, 'comments', 772, 773),
(407, 344, NULL, NULL, 'comment', 782, 783),
(408, 344, NULL, NULL, 'comments', 784, 785),
(409, 352, NULL, NULL, 'content', 816, 817),
(410, 352, NULL, NULL, 'news', 818, 819),
(411, 352, NULL, NULL, 'reports', 820, 821),
(412, 352, NULL, NULL, 'others', 822, 823),
(413, 399, NULL, NULL, 'user', 918, 919),
(414, 399, NULL, NULL, 'reject', 920, 921),
(415, 399, NULL, NULL, 'comment', 922, 923),
(418, 399, NULL, NULL, 'rejectComment', 924, 925),
(421, 267, NULL, NULL, 'getReportOptions', 596, 597),
(422, 267, NULL, NULL, 'getRolesDescriptions', 598, 599),
(426, 267, NULL, NULL, 'block', 600, 601),
(427, 267, NULL, NULL, 'getBlockedPeriods', 602, 603),
(428, 352, NULL, NULL, 'selected', 824, 825),
(431, 267, NULL, NULL, 'unblock', 604, 605),
(432, 267, NULL, NULL, 'getDefinedRoles', 606, 607),
(433, 347, NULL, NULL, 'vote', 806, 807),
(434, 325, NULL, NULL, 'resolve', 706, 707),
(435, 325, NULL, NULL, 'accept', 708, 709),
(436, 325, NULL, NULL, 'reject', 710, 711),
(437, 330, NULL, NULL, 'add', 724, 725),
(438, 330, NULL, NULL, 'edit', 726, 727),
(439, 330, NULL, NULL, 'delete', 728, 729),
(441, 352, NULL, NULL, 'mark', 826, 827),
(442, 352, NULL, NULL, 'unmark', 828, 829),
(443, 397, NULL, NULL, 'history', 904, 905),
(444, 397, NULL, NULL, 'description', 906, 907),
(448, 338, NULL, NULL, 'remove', 742, 743),
(449, 338, NULL, NULL, 'removeComment', 744, 745),
(450, 338, NULL, NULL, 'removeComments', 746, 747),
(451, 344, NULL, NULL, 'remove', 786, 787),
(452, 344, NULL, NULL, 'removeComment', 788, 789),
(453, 344, NULL, NULL, 'removeComments', 790, 791),
(454, 325, NULL, NULL, 'newsletter', 712, 713),
(455, 352, NULL, NULL, 'view', 830, 831),
(456, 352, NULL, NULL, 'remove', 832, 833),
(457, 397, NULL, NULL, 'accept', 908, 909),
(458, 356, NULL, NULL, 'remove', 860, 861),
(460, 1, NULL, NULL, 'Subscriptions', 964, 991),
(461, 460, NULL, NULL, 'Subscriptions', 965, 990),
(462, 461, NULL, NULL, 'add', 966, 967),
(463, 267, NULL, NULL, 'terms', 608, 609),
(464, 267, NULL, NULL, 'policy', 610, 611),
(465, 1, NULL, NULL, 'Image2Helper', 992, 993),
(466, 338, NULL, NULL, 'editContent', 748, 749),
(467, 338, NULL, NULL, 'editNote', 750, 751),
(468, 344, NULL, NULL, 'editContent', 792, 793),
(469, 344, NULL, NULL, 'editComment', 794, 795),
(471, 352, NULL, NULL, 'latest', 834, 835),
(472, 352, NULL, NULL, 'check', 836, 837),
(473, 461, NULL, NULL, 'addArticleSubscription', 968, 969),
(474, 461, NULL, NULL, 'deleteArticleSubscription', 970, 971),
(475, 461, NULL, NULL, 'addUserSubscription', 972, 973),
(476, 461, NULL, NULL, 'deleteUserSubscription', 974, 975),
(477, 461, NULL, NULL, 'addNoteSubscription', 976, 977),
(478, 461, NULL, NULL, 'deleteNoteSubscription', 978, 979),
(479, 461, NULL, NULL, 'addCommentSubscription', 980, 981),
(480, 461, NULL, NULL, 'deleteCommentSubscription', 982, 983),
(481, 267, NULL, NULL, 'subscriptions', 612, 613),
(482, 1, NULL, NULL, 'DebugKit', 994, 1021),
(483, 482, NULL, NULL, 'Composer', 995, 998),
(484, 483, NULL, NULL, 'checkDependencies', 996, 997),
(485, 482, NULL, NULL, 'Toolbar', 999, 1002),
(486, 485, NULL, NULL, 'clearCache', 1000, 1001),
(487, 482, NULL, NULL, 'Requests', 1003, 1006),
(488, 487, NULL, NULL, 'view', 1004, 1005),
(489, 482, NULL, NULL, 'Panels', 1007, 1012),
(490, 489, NULL, NULL, 'index', 1008, 1009),
(491, 489, NULL, NULL, 'view', 1010, 1011),
(492, 482, NULL, NULL, 'MailPreview', 1013, 1020),
(493, 492, NULL, NULL, 'index', 1014, 1015),
(494, 492, NULL, NULL, 'sent', 1016, 1017),
(495, 492, NULL, NULL, 'email', 1018, 1019),
(496, 352, NULL, NULL, 'verified', 838, 839),
(499, 352, NULL, NULL, 'subscriptions', 840, 841),
(500, 461, NULL, NULL, 'addCategorySubscription', 984, 985),
(501, 461, NULL, NULL, 'deleteCategorySubscription', 986, 987),
(502, 399, NULL, NULL, 'index', 926, 927),
(503, 399, NULL, NULL, 'waiting', 928, 929),
(504, 399, NULL, NULL, 'taken', 930, 931),
(505, 399, NULL, NULL, 'cases', 932, 933),
(506, 399, NULL, NULL, 'view', 934, 935),
(507, 399, NULL, NULL, 'content', 936, 937),
(508, 399, NULL, NULL, 'objection', 938, 939),
(509, 399, NULL, NULL, 'cancel', 940, 941),
(510, 399, NULL, NULL, 'acceptContent', 942, 943),
(511, 399, NULL, NULL, 'removeContent', 944, 945),
(512, 399, NULL, NULL, 'userBlock', 946, 947),
(513, 399, NULL, NULL, 'userTake', 948, 949),
(514, 399, NULL, NULL, 'resolve', 950, 951),
(515, 399, NULL, NULL, 'getReportsTypesTranslations', 952, 953),
(516, 267, NULL, NULL, 'blocked', 614, 615),
(517, 267, NULL, NULL, 'getPeriodsForPermission', 616, 617),
(518, 399, NULL, NULL, 'contact', 954, 955),
(519, 399, NULL, NULL, 'saveReportHistory', 956, 957),
(520, 399, NULL, NULL, 'mark', 958, 959),
(521, 3, NULL, NULL, 'checkPermission', 7, 8),
(522, 325, NULL, NULL, 'delete', 714, 715),
(523, 325, NULL, NULL, 'checkPermission', 716, 717),
(524, 356, NULL, NULL, 'checkPermission', 862, 863),
(525, 330, NULL, NULL, 'checkPermission', 730, 731),
(526, 18, NULL, NULL, 'checkPermission', 53, 54),
(527, 10, NULL, NULL, 'checkPermission', 33, 34),
(528, 29, NULL, NULL, 'checkPermission', 73, 74),
(529, 36, NULL, NULL, 'checkPermission', 93, 94),
(530, 46, NULL, NULL, 'checkPermission', 102, 103),
(531, 56, NULL, NULL, 'checkPermission', 137, 138),
(532, 49, NULL, NULL, 'checkPermission', 119, 120),
(533, 67, NULL, NULL, 'checkPermission', 161, 162),
(534, 77, NULL, NULL, 'checkPermission', 191, 192),
(535, 91, NULL, NULL, 'checkPermission', 217, 218),
(536, 101, NULL, NULL, 'checkPermission', 241, 242),
(537, 112, NULL, NULL, 'checkPermission', 261, 262),
(538, 139, NULL, NULL, 'checkPermission', 319, 320),
(539, 123, NULL, NULL, 'checkPermission', 299, 300),
(540, 159, NULL, NULL, 'checkPermission', 339, 340),
(541, 166, NULL, NULL, 'checkPermission', 361, 362),
(542, 178, NULL, NULL, 'checkPermission', 385, 386),
(543, 188, NULL, NULL, 'checkPermission', 402, 403),
(544, 195, NULL, NULL, 'checkPermission', 433, 434),
(545, 225, NULL, NULL, 'checkPermission', 485, 486),
(546, 233, NULL, NULL, 'checkPermission', 503, 504),
(547, 215, NULL, NULL, 'checkPermission', 467, 468),
(548, 243, NULL, NULL, 'checkPermission', 527, 528),
(549, 252, NULL, NULL, 'checkPermission', 543, 544),
(550, 259, NULL, NULL, 'checkPermission', 559, 560),
(551, 367, NULL, NULL, 'checkPermission', 881, 882),
(552, 267, NULL, NULL, 'aml', 618, 619),
(553, 267, NULL, NULL, 'checkPermission', 620, 621),
(554, 278, NULL, NULL, 'checkPermission', 639, 640),
(555, 285, NULL, NULL, 'checkPermission', 667, 668),
(556, 391, NULL, NULL, 'checkPermission', 892, 893),
(557, 397, NULL, NULL, 'sendNewslleterToEmail', 910, 911),
(558, 397, NULL, NULL, 'checkPermission', 912, 913),
(559, 344, NULL, NULL, 'checkPermission', 796, 797),
(560, 338, NULL, NULL, 'checkPermission', 752, 753),
(561, 342, NULL, NULL, 'checkPermission', 774, 775),
(562, 340, NULL, NULL, 'checkPermission', 762, 763),
(563, 352, NULL, NULL, 'checkPermission', 842, 843),
(564, 399, NULL, NULL, 'checkPermission', 960, 961),
(565, 461, NULL, NULL, 'checkPermission', 988, 989),
(566, 347, NULL, NULL, 'checkPermission', 808, 809),
(567, 267, NULL, NULL, 'mails', 622, 623);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `aros`
--

CREATE TABLE `aros` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, 'Roles', 1, 'Role-superadmin', 1, 4),
(2, NULL, 'Roles', 2, 'Role-registered', 5, 82),
(3, NULL, 'Roles', 3, 'Role-public', 83, 84),
(4, 2, 'Roles', 4, 'Role-admin', 6, 7),
(6, 1, 'Users', 1, 'admin', 2, 3),
(10, 2, 'Users', 5, 'jakub@test.com', 8, 9),
(11, 2, 'Roles', 6, 'Role-publisher-i', 10, 11),
(12, 2, 'Roles', 7, 'Role-publisher-ii', 12, 13),
(13, 2, 'Roles', 8, 'Role-accept', 14, 15),
(14, 2, 'Roles', 9, 'Role-editor', 16, 17),
(15, 2, 'Roles', 10, 'Role-settle-i', 18, 19),
(16, 2, 'Roles', 11, 'Role-settle-iv', 20, 21),
(17, 2, 'Roles', 12, 'Role-blocked-ii', 22, 23),
(18, 2, 'Roles', 13, 'Role-give-permission-ii', 24, 25),
(19, 2, 'Roles', 14, 'Role-set-banner', 26, 27),
(21, 2, 'Roles', 16, 'Role-newsletter-accept', 28, 29),
(22, 2, 'Users', 6, 'piotr@cryptoresearch.com', 30, 31),
(23, 2, 'Users', 7, 'lukasz@cryptoresearch.com', 32, 33),
(24, 2, 'Users', 8, 'weronika@cryptoresearch.com', 34, 35),
(25, 2, 'Users', 9, 'tefohal412@hiwave.org', 36, 37),
(45, 2, 'Users', 29, 'nekkefurdi@enayu.com', 38, 39),
(46, 2, 'Users', 30, 'k.ziemecki@hotmail.com', 40, 41),
(47, 2, 'Users', 31, 'kieltyka.karol@gmail.com', 42, 43),
(48, 2, 'Users', 32, 'dark5tone.idle@gmail.com', 44, 45),
(49, 2, 'Users', 33, 'm8@em8.pl', 46, 47),
(50, 2, 'Users', 34, 'vader84@poczta.fm', 48, 49),
(51, 2, 'Users', 35, 'kamildomin@gmail.com', 50, 51),
(52, 2, 'Users', 36, 'poczta@prestigo.net', 52, 53),
(53, 2, 'Users', 37, 'damareon.skyden@oolloo.org', 54, 55),
(54, 2, 'Users', 38, 'martalange84@gmail.com', 56, 57),
(55, 2, 'Users', 39, 'taszaka@tlen.pl', 58, 59),
(56, 2, 'Users', 40, 'cristen.13@xhanimatedm.com', 60, 61),
(57, 2, 'Users', 41, 'zcsewgs5@optimaweb.me', 62, 63),
(58, 2, 'Users', 42, 'pawel.marczak1989@gmail.com', 64, 65),
(59, 2, 'Users', 43, 'oxfav7@optimaweb.me', 66, 67),
(61, 2, 'Users', 45, 'bbsmtmd37k@privacy-mail.top', 80, 81),
(64, 2, 'Users', 48, 'jb.szczubelek@gmail.com', 68, 69),
(65, 2, 'Users', 49, 'tifsxh@userpdf.net', 70, 71),
(66, 2, 'Users', 50, 'jkristkw@sharklasers.com', 72, 73),
(70, 2, 'Users', 55, 'gedikiy803@psk3n.com', 74, 75),
(71, 2, 'Users', 56, 'asda@mailnd7.com', 76, 77),
(72, 2, 'Users', 57, 'asdfasfas@mailnd7.com', 78, 79);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `aros_acos`
--

CREATE TABLE `aros_acos` (
  `id` int NOT NULL,
  `aro_id` int NOT NULL,
  `aco_id` int NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `aros_acos`
--

INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`) VALUES
(1, 3, 47, '1', '1', '1', '1'),
(2, 3, 189, '1', '1', '1', '1'),
(3, 3, 190, '1', '1', '1', '1'),
(4, 3, 191, '1', '1', '1', '1'),
(5, 3, 192, '1', '1', '1', '1'),
(6, 3, 193, '1', '1', '1', '1'),
(7, 2, 268, '1', '1', '1', '1'),
(8, 3, 269, '1', '1', '1', '1'),
(9, 3, 270, '1', '1', '1', '1'),
(10, 2, 271, '1', '1', '1', '1'),
(11, 3, 272, '1', '1', '1', '1'),
(12, 3, 273, '1', '1', '1', '1'),
(13, 3, 274, '1', '1', '1', '1'),
(14, 2, 275, '1', '1', '1', '1'),
(15, 2, 288, '1', '1', '1', '1'),
(16, 2, 276, '1', '1', '1', '1'),
(17, 4, 77, '1', '1', '1', '1'),
(26, 4, 293, '1', '1', '1', '1'),
(27, 4, 306, '1', '1', '1', '1'),
(28, 3, 306, '1', '1', '1', '1'),
(29, 3, 276, '-1', '-1', '-1', '-1'),
(30, 3, 275, '-1', '-1', '-1', '-1'),
(31, 2, 306, '1', '1', '1', '1'),
(37, 2, 327, '1', '1', '1', '1'),
(38, 2, 328, '1', '1', '1', '1'),
(40, 4, 327, '-1', '-1', '-1', '-1'),
(41, 2, 336, '1', '1', '1', '1'),
(42, 2, 339, '1', '1', '1', '1'),
(43, 4, 339, '-1', '-1', '-1', '-1'),
(45, 2, 341, '1', '1', '1', '1'),
(46, 2, 343, '1', '1', '1', '1'),
(47, 2, 345, '1', '1', '1', '1'),
(50, 2, 350, '1', '1', '1', '1'),
(51, 2, 353, '1', '1', '1', '1'),
(52, 2, 354, '1', '1', '1', '1'),
(53, 2, 357, '-1', '-1', '-1', '-1'),
(54, 2, 358, '-1', '-1', '-1', '-1'),
(55, 2, 359, '-1', '-1', '-1', '-1'),
(56, 2, 360, '-1', '-1', '-1', '-1'),
(57, 2, 364, '1', '1', '1', '1'),
(58, 2, 363, '1', '1', '1', '1'),
(59, 2, 376, '1', '1', '1', '1'),
(61, 2, 377, '1', '1', '1', '1'),
(62, 2, 371, '1', '1', '1', '1'),
(64, 2, 387, '1', '1', '1', '1'),
(65, 2, 388, '1', '1', '1', '1'),
(68, 2, 381, '1', '1', '1', '1'),
(69, 2, 382, '1', '1', '1', '1'),
(72, 3, 381, '-1', '-1', '-1', '-1'),
(73, 3, 382, '1', '1', '1', '1'),
(74, 2, 392, '1', '1', '1', '1'),
(75, 2, 389, '-1', '-1', '-1', '-1'),
(76, 2, 395, '1', '1', '1', '1'),
(77, 2, 413, '1', '1', '1', '1'),
(78, 2, 414, '1', '1', '1', '1'),
(79, 2, 415, '1', '1', '1', '1'),
(82, 2, 418, '1', '1', '1', '1'),
(85, 2, 400, '-1', '-1', '-1', '-1'),
(86, 2, 401, '-1', '-1', '-1', '-1'),
(87, 2, 402, '-1', '-1', '-1', '-1'),
(88, 2, 409, '1', '1', '1', '1'),
(89, 2, 410, '1', '1', '1', '1'),
(90, 2, 411, '1', '1', '1', '1'),
(91, 2, 412, '1', '1', '1', '1'),
(92, 2, 426, '1', '1', '1', '1'),
(93, 2, 428, '1', '1', '1', '1'),
(95, 2, 431, '1', '1', '1', '1'),
(96, 2, 433, '1', '1', '1', '1'),
(97, 2, 434, '1', '1', '1', '1'),
(98, 2, 435, '1', '1', '1', '1'),
(99, 2, 436, '1', '1', '1', '1'),
(100, 2, 383, '1', '1', '1', '1'),
(101, 2, 437, '1', '1', '1', '1'),
(102, 2, 438, '1', '1', '1', '1'),
(103, 2, 439, '1', '1', '1', '1'),
(104, 2, 441, '1', '1', '1', '1'),
(105, 2, 442, '1', '1', '1', '1'),
(106, 2, 443, '-1', '-1', '-1', '-1'),
(107, 2, 444, '-1', '-1', '-1', '-1'),
(108, 3, 328, '1', '1', '1', '1'),
(109, 2, 448, '1', '1', '1', '1'),
(110, 2, 449, '1', '1', '1', '1'),
(111, 2, 450, '1', '1', '1', '1'),
(112, 2, 451, '1', '1', '1', '1'),
(113, 2, 452, '1', '1', '1', '1'),
(114, 2, 453, '1', '1', '1', '1'),
(115, 2, 408, '1', '1', '1', '1'),
(116, 2, 407, '1', '1', '1', '1'),
(117, 2, 394, '1', '1', '1', '1'),
(118, 2, 454, '1', '1', '1', '1'),
(119, 3, 395, '1', '1', '1', '1'),
(120, 2, 455, '1', '1', '1', '1'),
(121, 2, 456, '1', '1', '1', '1'),
(125, 2, 457, '-1', '-1', '-1', '-1'),
(126, 2, 361, '-1', '-1', '-1', '-1'),
(127, 2, 458, '-1', '-1', '-1', '-1'),
(128, 19, 357, '1', '1', '1', '1'),
(129, 19, 358, '1', '1', '1', '1'),
(130, 19, 359, '1', '1', '1', '1'),
(131, 19, 360, '1', '1', '1', '1'),
(132, 19, 361, '1', '1', '1', '1'),
(133, 19, 389, '1', '1', '1', '1'),
(134, 19, 458, '1', '1', '1', '1'),
(135, 21, 400, '1', '1', '1', '1'),
(136, 21, 401, '1', '1', '1', '1'),
(137, 21, 402, '1', '1', '1', '1'),
(138, 21, 443, '1', '1', '1', '1'),
(139, 21, 444, '1', '1', '1', '1'),
(140, 21, 457, '1', '1', '1', '1'),
(141, 3, 383, '1', '1', '1', '1'),
(142, 3, 462, '1', '1', '1', '1'),
(143, 2, 463, '1', '1', '1', '1'),
(144, 2, 464, '1', '1', '1', '1'),
(145, 3, 463, '1', '1', '1', '1'),
(146, 3, 464, '1', '1', '1', '1'),
(160, 2, 473, '1', '1', '1', '1'),
(161, 3, 473, '1', '1', '1', '1'),
(162, 4, 473, '1', '1', '1', '1'),
(163, 11, 473, '1', '1', '1', '1'),
(164, 12, 473, '1', '1', '1', '1'),
(165, 2, 474, '1', '1', '1', '1'),
(166, 2, 475, '1', '1', '1', '1'),
(167, 2, 476, '1', '1', '1', '1'),
(168, 2, 477, '1', '1', '1', '1'),
(169, 2, 478, '1', '1', '1', '1'),
(170, 2, 479, '1', '1', '1', '1'),
(171, 2, 480, '1', '1', '1', '1'),
(172, 3, 480, '1', '1', '1', '1'),
(173, 3, 479, '1', '1', '1', '1'),
(174, 3, 478, '1', '1', '1', '1'),
(175, 3, 477, '1', '1', '1', '1'),
(176, 3, 476, '1', '1', '1', '1'),
(177, 3, 475, '1', '1', '1', '1'),
(178, 3, 474, '1', '1', '1', '1'),
(179, 4, 474, '1', '1', '1', '1'),
(180, 4, 475, '1', '1', '1', '1'),
(181, 4, 476, '1', '1', '1', '1'),
(182, 4, 477, '1', '1', '1', '1'),
(183, 4, 478, '1', '1', '1', '1'),
(184, 4, 479, '1', '1', '1', '1'),
(185, 4, 480, '1', '1', '1', '1'),
(186, 11, 480, '1', '1', '1', '1'),
(187, 11, 479, '1', '1', '1', '1'),
(188, 11, 478, '1', '1', '1', '1'),
(189, 11, 477, '1', '1', '1', '1'),
(190, 11, 476, '1', '1', '1', '1'),
(191, 11, 475, '1', '1', '1', '1'),
(192, 11, 474, '1', '1', '1', '1'),
(193, 12, 474, '1', '1', '1', '1'),
(194, 12, 475, '1', '1', '1', '1'),
(195, 12, 476, '1', '1', '1', '1'),
(196, 12, 477, '1', '1', '1', '1'),
(197, 12, 478, '1', '1', '1', '1'),
(198, 12, 479, '1', '1', '1', '1'),
(199, 12, 480, '1', '1', '1', '1'),
(200, 13, 480, '1', '1', '1', '1'),
(201, 13, 479, '1', '1', '1', '1'),
(202, 13, 478, '1', '1', '1', '1'),
(203, 13, 477, '1', '1', '1', '1'),
(204, 13, 476, '1', '1', '1', '1'),
(205, 13, 475, '1', '1', '1', '1'),
(206, 13, 474, '1', '1', '1', '1'),
(207, 13, 473, '1', '1', '1', '1'),
(208, 14, 473, '1', '1', '1', '1'),
(209, 14, 474, '1', '1', '1', '1'),
(210, 14, 475, '1', '1', '1', '1'),
(211, 14, 476, '1', '1', '1', '1'),
(212, 14, 477, '1', '1', '1', '1'),
(213, 14, 478, '1', '1', '1', '1'),
(214, 14, 479, '1', '1', '1', '1'),
(215, 14, 480, '1', '1', '1', '1'),
(216, 15, 480, '1', '1', '1', '1'),
(217, 15, 479, '1', '1', '1', '1'),
(218, 15, 478, '1', '1', '1', '1'),
(219, 15, 477, '1', '1', '1', '1'),
(220, 15, 476, '1', '1', '1', '1'),
(221, 15, 475, '1', '1', '1', '1'),
(222, 15, 474, '1', '1', '1', '1'),
(223, 15, 473, '1', '1', '1', '1'),
(224, 16, 473, '1', '1', '1', '1'),
(225, 16, 474, '1', '1', '1', '1'),
(226, 16, 475, '1', '1', '1', '1'),
(227, 16, 476, '1', '1', '1', '1'),
(228, 16, 477, '1', '1', '1', '1'),
(229, 16, 478, '1', '1', '1', '1'),
(230, 16, 479, '1', '1', '1', '1'),
(231, 16, 480, '1', '1', '1', '1'),
(232, 17, 480, '1', '1', '1', '1'),
(233, 17, 479, '1', '1', '1', '1'),
(234, 17, 478, '1', '1', '1', '1'),
(235, 17, 477, '1', '1', '1', '1'),
(236, 17, 476, '1', '1', '1', '1'),
(237, 17, 475, '1', '1', '1', '1'),
(238, 17, 474, '1', '1', '1', '1'),
(239, 17, 473, '1', '1', '1', '1'),
(240, 18, 473, '1', '1', '1', '1'),
(241, 18, 474, '1', '1', '1', '1'),
(242, 18, 475, '1', '1', '1', '1'),
(243, 18, 476, '1', '1', '1', '1'),
(244, 18, 477, '1', '1', '1', '1'),
(245, 18, 478, '1', '1', '1', '1'),
(246, 18, 479, '1', '1', '1', '1'),
(247, 18, 480, '1', '1', '1', '1'),
(248, 19, 480, '1', '1', '1', '1'),
(249, 19, 479, '1', '1', '1', '1'),
(250, 19, 478, '1', '1', '1', '1'),
(251, 19, 477, '1', '1', '1', '1'),
(252, 19, 476, '1', '1', '1', '1'),
(253, 19, 475, '1', '1', '1', '1'),
(254, 19, 474, '1', '1', '1', '1'),
(255, 19, 473, '1', '1', '1', '1'),
(256, 21, 473, '1', '1', '1', '1'),
(257, 21, 474, '1', '1', '1', '1'),
(258, 21, 475, '1', '1', '1', '1'),
(259, 21, 476, '1', '1', '1', '1'),
(260, 21, 477, '1', '1', '1', '1'),
(261, 21, 478, '1', '1', '1', '1'),
(262, 21, 479, '1', '1', '1', '1'),
(263, 21, 480, '1', '1', '1', '1'),
(264, 2, 481, '1', '1', '1', '1'),
(265, 3, 481, '-1', '-1', '-1', '-1'),
(266, 4, 481, '1', '1', '1', '1'),
(267, 11, 481, '1', '1', '1', '1'),
(268, 12, 481, '1', '1', '1', '1'),
(269, 13, 481, '1', '1', '1', '1'),
(270, 14, 481, '1', '1', '1', '1'),
(271, 15, 481, '1', '1', '1', '1'),
(272, 16, 481, '1', '1', '1', '1'),
(273, 17, 481, '1', '1', '1', '1'),
(274, 18, 481, '1', '1', '1', '1'),
(275, 19, 481, '1', '1', '1', '1'),
(276, 21, 481, '1', '1', '1', '1'),
(279, 2, 499, '1', '1', '1', '1'),
(280, 2, 500, '1', '1', '1', '1'),
(281, 2, 501, '1', '1', '1', '1'),
(282, 3, 500, '1', '1', '1', '1'),
(283, 3, 501, '1', '1', '1', '1'),
(284, 2, 496, '1', '1', '1', '1'),
(285, 2, 472, '1', '1', '1', '1'),
(286, 2, 471, '1', '1', '1', '1'),
(287, 3, 471, '1', '1', '1', '1'),
(288, 3, 472, '1', '1', '1', '1'),
(289, 3, 496, '1', '1', '1', '1'),
(290, 2, 502, '1', '1', '1', '1'),
(291, 2, 503, '1', '1', '1', '1'),
(292, 2, 504, '1', '1', '1', '1'),
(293, 2, 505, '1', '1', '1', '1'),
(294, 2, 506, '1', '1', '1', '1'),
(295, 2, 507, '1', '1', '1', '1'),
(296, 2, 508, '1', '1', '1', '1'),
(297, 2, 509, '1', '1', '1', '1'),
(298, 2, 510, '1', '1', '1', '1'),
(299, 2, 511, '1', '1', '1', '1'),
(300, 2, 512, '1', '1', '1', '1'),
(301, 2, 513, '1', '1', '1', '1'),
(302, 2, 514, '1', '1', '1', '1'),
(303, 2, 515, '1', '1', '1', '1'),
(304, 2, 518, '1', '1', '1', '1'),
(305, 2, 557, '1', '1', '1', '1'),
(306, 2, 567, '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `articles`
--

CREATE TABLE `articles` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `type_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `counter_accepts` bigint NOT NULL DEFAULT '0',
  `counter_rejects` bigint NOT NULL DEFAULT '0',
  `counter_up_vote` bigint NOT NULL DEFAULT '0',
  `counter_down_vote` bigint NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `preview` text NOT NULL,
  `counter_vote_result` bigint NOT NULL DEFAULT '0',
  `counter_comments` bigint NOT NULL DEFAULT '0',
  `counter_sub_comments` bigint NOT NULL DEFAULT '0',
  `is_visible` smallint NOT NULL DEFAULT '0',
  `published` int DEFAULT NULL,
  `is_newsletter` tinyint NOT NULL DEFAULT '0',
  `counter_reviews` bigint NOT NULL DEFAULT '0',
  `resolve_by` int NOT NULL DEFAULT '0',
  `resolve_status` smallint NOT NULL DEFAULT '0',
  `resolve_time` int NOT NULL DEFAULT '0',
  `resolve_send` tinyint NOT NULL DEFAULT '0',
  `is_visible_by_role` smallint NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `lang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pl_PL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `type_id`, `title`, `description`, `counter_accepts`, `counter_rejects`, `counter_up_vote`, `counter_down_vote`, `created`, `updated`, `photo`, `preview`, `counter_vote_result`, `counter_comments`, `counter_sub_comments`, `is_visible`, `published`, `is_newsletter`, `counter_reviews`, `resolve_by`, `resolve_status`, `resolve_time`, `resolve_send`, `is_visible_by_role`, `is_deleted`, `lang`) VALUES
(1, 5, 1, 'test najnowszy news', '', 6, 1, 1, 0, '2019-11-02 18:42:06', '2019-12-04 22:24:29', NULL, '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(2, 5, 1, 'Jeszcze nowszy news !', 'vgrvgrvrfvcfrcrc', 3, 0, 0, 0, '2019-11-02 19:13:22', '2019-12-04 22:30:46', NULL, '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(3, 5, 1, 'test3', 'test', 0, 0, 0, 0, '2019-11-03 11:22:59', '2019-11-03 11:22:59', NULL, '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(4, 5, 1, 'testq', '', 1, 0, 0, 0, '2019-11-03 11:49:30', '2019-11-03 11:49:30', NULL, '', 0, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(5, 5, 1, 'testbanner2', '', 1, 0, 4, 0, '2019-11-03 11:49:30', '2019-11-03 11:49:30', NULL, '', 0, 1, 3, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(6, 5, 1, 'test', '', 0, 0, 0, 0, '2019-11-03 11:49:30', '2019-11-03 11:49:30', NULL, '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(7, 7, 1, 'An Example of a Google Bar Chart', 'asdas asda sd', 0, 0, 3, 0, '2019-12-04 22:28:57', '2019-12-04 22:28:57', NULL, '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(8, 7, 1, 'dsfgsdfgsd', 'sdfgsdfg sdfgsd fg sdfg sd gsd gsdf g', 0, 0, 0, 0, '2019-12-04 22:28:57', '2019-12-04 22:28:57', NULL, '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(9, 6, 2, 'Testowanie mikrofonu?', 'Testowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonuTestowanie mikrofonu', 0, 0, 0, 0, '2019-12-04 22:28:57', '2019-12-04 22:28:57', NULL, '', 0, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(10, 5, 2, 'To BI or not to BITCOIN ?23', '<p>asAS</p>\r\n', 0, 1, 3, 0, '2019-12-04 22:28:57', '2020-08-21 13:49:07', 'c56f2c5b-a001-4021-9b3f-44ba138d1fbf-Q2-Crypto-AML-Report-Summary.jpg', '<p>ZxZx</p>\r\n', 3, 12, 5, 2, 1598017747, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(11, 5, 2, 'Kiedy bitcoin oficjalnym srodkiem platniczym ?232', '<p>test content</p>\r\n', 0, 0, 3, 3, '2019-12-04 22:33:39', '2020-08-06 05:15:33', '79226541-433c-4d3e-bfd5-e6e5e3f087fc-image_02.png', '', 0, 5, 0, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(12, 6, 1, 'Latający placuszek', '<p>Jestem wesoły Bolek, zaż&oacute;łć gęślą jaźń!</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 1, 1, '2019-12-06 11:29:27', '2019-12-06 11:29:27', 'graph (7).png', 'Dzień dobry cześć i czołem. pytacie skąd się wziąłem?', 0, 1, 2, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(13, 8, 1, '3 miesiące', '<p>Testowy&nbsp;</p>\r\n', 0, 0, 0, 0, '2020-01-12 12:54:12', '2020-01-12 12:54:12', 'a1fec795-bf13-4ec2-83a8-073c36fede09-500_F_155566423_nZpnOqHzy9xuy98IVrxh6OyxdFPRPEX2.jpg', '<p>Test</p>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(14, 7, 1, 'dupa dupa', '<p>df gdsf dsf gdsfg dsf df dfg sdgfd</p>\r\n', 0, 0, 1, 0, '2020-01-12 23:30:25', '2020-01-12 23:36:48', '', '<p>dsf sdf gsdf sdf fdsg sdf dsg</p>\r\n', 1, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(15, 5, 1, 'test322', '', 0, 0, 0, 0, '2020-01-14 22:38:37', '2020-01-14 22:38:37', '', '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(16, 7, 1, 'art test da', '<p>Cos ukrytego&nbsp;</p>\r\n', 1, 0, 2, 0, '2020-01-14 22:52:27', '2020-01-14 22:52:27', '', '<p>Cos publicznego</p>\r\n', 2, 0, 0, 1, 1579042347, 1, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(17, 5, 1, 'test888', '<p>registered on edit</p>\r\n', 0, 0, 0, 0, '2020-01-14 23:03:05', '2020-02-27 08:45:26', '24ea25cc-708d-49a7-908a-bbc6556159ce-PP_rofile_copy_copy_.png', '<p>not registered</p>\r\n', 0, 2, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(18, 7, 1, 'Models folder structure in net core API project', '<p>asd as das a asd a</p>\r\n', 2, 1, 1, 0, '2020-01-25 17:46:31', '2020-01-25 17:46:31', '', '<p>dasda asd as as as</p>\r\n', 1, 1, 0, 1, 1579974391, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(19, 7, 1, 'Pierwsy art', '<p><strong>To jest neiwidoczna dla widoczna wszystkich czesć</strong></p>\r\n', 1, 1, 3, 0, '2020-01-25 17:57:59', '2020-01-25 17:58:13', '', '<p>To jest widoczna dla wszystkich <em>czesć</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><em>asdasdasd</em></p>\r\n</blockquote>\r\n', 3, 21, 0, 1, 1579975093, 1, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(20, 7, 1, 'Dual-Y Example', '<p>jhgfdhj fhf hfg</p>\r\n', 0, 0, 0, 0, '2020-02-02 20:58:30', '2020-02-02 20:58:30', '', '<p>ygjfj ff jhgfjhgf&nbsp;</p>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(21, 7, 1, 'kontencik', '<p>dsf gsdf sdf sdfg</p>\r\n', 2, 0, 2, 0, '2020-02-03 21:58:33', '2020-02-03 21:58:33', '', '<p>dsfgsd fgsdfg sfd sd fsd g</p>\r\n', 2, 11, 16, 1, 1580767113, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(22, 29, 2, 'Co było pierwsze jajko czy kura ?', '<p>sadf asd asdf asd asd&nbsp;</p>\r\n', 3, 0, 4, 0, '2020-02-03 22:48:58', '2020-08-24 06:52:53', '', '<blockquote>\r\n<p>dfsadf asdf asdfg hgjghjgz zdvxvcxvcx<br />\r\n<br />\r\nkfkjskldjkl<br />\r\nfmdsnfkmsdk</p>\r\n\r\n<p>Lf;dlsm;lfdkl;s<br />\r\ndfknskdlmf<br />\r\n<br />\r\n&nbsp;</p>\r\n</blockquote>\r\n', 4, 35, 17, 1, 1580770138, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(23, 31, 1, 'jedziem z tematem ', '<p>nie ma pojęcia&nbsp;</p>\r\n\r\n<p>o co kaman</p>\r\n\r\n<p><iframe allow=\";\" allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/0IQTN_GFJ_E\" width=\"640\"></iframe></p>\r\n\r\n<p><img alt=\"\" src=\"https://news.bitcoin.com/wp-content/uploads/2019/11/coinexbchbtc-760x512.jpg\" style=\"height:512px; width:760px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Hyperlink-Wikipedia.svg/1200px-Hyperlink-Wikipedia.svg.png\" style=\"float:left; height:533px; width:1200px\" />0</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 2, 0, '2020-02-05 12:23:44', '2020-06-03 17:13:47', 'c2fd1b21-157d-4ed4-8a2c-96e766290fef-techanalysis_btc5_500x300.jpg', '<p>o co k</p>\r\n\r\n<p><iframe allow=\";\" allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/0IQTN_GFJ_E\" width=\"640\"></iframe></p>\r\n\r\n<p><img alt=\"jest spoczko\" src=\"/uploads/techanalysis_btc5_500x300.jpg\" style=\"height:300px; width:500px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://news.bitcoin.com/wp-content/uploads/2019/11/coinexbchbtc-760x512.jpg\" style=\"height:512px; width:760px\" /></p>\r\n', 2, 4, 3, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(24, 7, 1, 'Jaki był cel stworzenia kryptowalut i bitcoina? ', '<p><strong>Dlaczego powstał Bitcoin?</strong></p>\r\n\r\n<p><br />\r\n<img src=\"https://lh5.googleusercontent.com/W5axug5UlikHALaiI830hgtKfiitQKr4nLNDVYTtarjHoMkBDmwsZNtsl_snSE3nWUpiy_fRFCjoSO0qxCmePdQdr9bFn324lQDdWKeqOFtBl0OADWLoo36qRZknvB13Ga1lu_B-\" style=\"height:299px; width:388px\" /></p>\r\n\r\n<p>Wielu ludzi, kiedy słyszy o Bitcoinie i innych kryptowalutach, zadaje sobie pytanie, po co on w og&oacute;le powstał.&nbsp; Jedni m&oacute;wią, że jako instrument spekulacyjny, inni twierdzą, że jest to cyfrowe złoto, a jeszcze inni, że ma to być nowy środek płatniczy przez internet.&nbsp; Najbliżej faktycznych powod&oacute;w jest ten ostatni - środek płatniczy, ale z kilkoma charakteryzującymi go cechami. Satoshi Nakamoto, bo tak nazywa się tw&oacute;rca Bitcoina sam jest anonimowy. Nikt nie wie kim jest, bądź kim są, ponieważ istnieją spekulacje, że jest to grupa ludzi. Dla niekt&oacute;rych fakt, że Satoshi Nakmoto jest anonimowy włącza czerwoną lampkę. Podczas gdy jego anonimowość przynosi korzyści w postaci wzbudzania dalszych zainteresowań, delegitymizuje technologię w oczach innych.&nbsp;</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Satoshi Nakamoto chciał stworzyć system płatności wykluczając zaufanie oraz pośrednik&oacute;w.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Założenia powstania Bitcoina Satoshi Nakamoto opisał w białej księdze tego projektu, możesz ją pobrać <a href=\"https://bitcoin.org/en/bitcoin-paper\" style=\"text-decoration:none\">TU.</a> Gł&oacute;wne powody, jakie kierowały tw&oacute;rcami przedstawiłem poniżej.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Anonimowość - jeżeli robisz zakupy przez internet i płacisz za pomocą konta bankowego, r&oacute;żnych instytucji finansowych typu PayPal czy też kartą płatniczą, ci pośrednicy wiedzą co kupiłeś, za ile, skąd i do czego ci to będzie służyło. Jest to w czystej postaci inwigilacja społeczeństwa. Płacąc za pomocą Bitcoina żaden pośrednik nie ma wglądu do tych danych.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Płatności międzynarodowe - żeby wysłać 1 Bitcoin (BTC) na drugi koniec świata potrzebujesz jedynie adresu publicznego odbiorcy i w każdej chwili i miejscu możesz dokonać przelewu. Tu nie ma znaczenia, czy będziesz przesyłał z Polski do Polski, czy z Polski do USA - zapłacisz taką samą prowizję a odbiorca otrzyma środki w takim samym czasie.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Opłaty - zauważ ile opłat wiąże się z przesyłaniem pieniędzy między kontami bankowymi: opłata za transakcję, opłata za prowadzenia konta bankowego oraz kartę płatniczą. Kr&oacute;tko m&oacute;wiąc, banki, stowarzyszenia kart (jak Visa) i inni wielcy operatorzy posiadające dzisiejsze systemy płatności elektronicznych nakładają wiele opłat. (Sama wiza wygenerowała ponad 13 mld USD przychod&oacute;w w 2014r.) Omijanie tych graczy było z pewnością czynnikiem motywującym do tworzenia Bitcoin&oacute;w.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Aby zrozumieć cel powstania Bitcoina pozwolę sobie przytoczyć treść postu Satoshi Nakamoto z początku 2009 na forum poświęconym peer-to-peer;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&ldquo;Gł&oacute;wnym problemem związanym z konwencjonalną walutą jest całe zaufanie, kt&oacute;re jest wymagane, aby to działało. Bankowi centralnemu należy ufać, że nie będzie poniżał waluty, ale historia fiducjarnych walut jest pełna naruszeń tego zaufania. Banki muszą mieć zaufanie, aby trzymać nasze pieniądze i przekazywać je drogą elektroniczną, ale pożyczają je w falach baniek kredytowych z zaledwie ułamkiem rezerwy. </em>&rdquo;</p>\r\n\r\n<p><img src=\"https://lh4.googleusercontent.com/D_kWJM7DeEp6lIkuxh7PPHCadI_I7GuUnq0kSPhZ9_8u5QmykcReBNT4C1ohY1NC6X9gWqAuDKVIw0czAvo101EJ3i5ueqJFc8NTAqxI5b0o5ZMlkT1EiUPlndG4AfFcmdjE5Iej\" style=\"height:423px; width:602px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Kolejnym powodem jest właśnie zaufanie. Trzymając nasze pieniądze na koncie bankowym, my ich fizycznie nie mamy, mamy tylko cyfry w sieci. Pamiętam, jak m&oacute;j znajomy miał problem podczas kryzysu w 2008 roku z wypłatą pieniędzy z banku. Powiedziano mu, że nie może wypłacić więcej niż 150 tys. zł bo w banku nie ma tyle pieniędzy, żeby pokryć wszystkie cyfry z kont użytkownik&oacute;w banku. Gdy zostawiamy nasze pieniądze na rachunkach bank&oacute;w (aby mogły one zostać przeniesione w naszym imieniu), te depozyty nie są faktycznie przechowywane dla nas. Zamiast tego banki wykorzystują depozyty do znalezienia możliwości dodatkowego zwrotu finansowego i są prawnie upoważnione do utrzymywania pod ręką określonego odsetka pieniędzy - około 10% dla większych bank&oacute;w. W skr&oacute;cie m&oacute;wiąc, w każdej chwili możemy nie mieć możliwości wypłaty naszych pieniędzy. Często m&oacute;wi się, że gł&oacute;wnym celem powstania Bitcoina było uwolnienie się właśnie od bank&oacute;w, jako pośrednik&oacute;w czyli tzw &ldquo;strony trzeciej&rdquo;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Alternatywne kryptowaluty</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Poza Bitcoinem istnieje ponad 2000 innych kryptowalut i token&oacute;w, jedne są kopią Bitcoina a inne służą całkiem do innych cel&oacute;w, takich jak np utrzymywanie sieci, opłaty za hostowanie aplikacji itp. Pierwsze alternatywne kryptowaluty były tworzone&nbsp; poprzez kopiowanie kodu źr&oacute;dłowego Bitcoina z mniejszymi lub większymi zmianami i gł&oacute;wnie miały one rozwiązać problemy, z jakimi boryka się sam Bitcoin. Pomimo, że faktycznie istnieją już dużo lepsze, szybsze i tańsze kryptowaluty służące do płatności i tak mają duży problem z masową adaptacją.&nbsp;</p>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Przyszłość Bitcoina</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Możesz usłyszeć, jak niekt&oacute;rzy krytycy twierdzą, że nie ma on fundamentalnej wartości, żadnej realnej użyteczności i że jest to tylko schemat Ponziego. To nie jest prawda. Bitcoin ma ogromną użyteczność jako odporny na cenzurę magazyn wartości. Żaden bank, rząd i firma nie mogą kontrolować Twojego majątku i tego, jak dokonywać transakcji. Ludzie nie zdają sobie sprawy, jak ograniczony jest konwencjonalny system finansowy. Jeśli spr&oacute;bujesz zrobić przelew do niekt&oacute;rych kraj&oacute;w, powiedzmy na Madagaskar, jest to praktycznie niemożliwe. Możesz r&oacute;wnież nagle zobaczyć, że masz zamknięte konto bankowe w dowolnym momencie z dowolnego powodu. Banki mają pełne prawo do zamknięcia konta, jeśli uznają to za stosowne. Bitcoiny nie są emitowane przez rządy. Ilość bitcoin&oacute;w w obiegu rośnie i ostatecznie osiągnie pułap około 21 milion&oacute;w BTC. Zmiany w ilości bitcoin&oacute;w w obiegu mogą wynikać jedynie z osiągnięcia większościowego konsensusu wśr&oacute;d użytkownik&oacute;w, a nie z decyzji poszczeg&oacute;lnych rząd&oacute;w. Na dzień dzisiejszy daleko nam do rzeczywistości, gdzie Bitcoin jest powszechnie używany jako środek płatniczy, nie wiadomo czy kiedykolwiek tak będzie. Z powodu coraz większego zainteresowania kryptowalutami i dużą zmiennością ich cen, służą one jako nośnik wartości oraz okazja inwestycyjna.</p>\r\n', 1, 0, 2, 0, '2020-02-06 09:54:46', '2020-02-06 09:54:46', '8e825dfb-4b8a-4729-9197-5bde744b7b16-logo.png', '<p><strong>Dlaczego powstał Bitcoin?</strong></p>\r\n\r\n<p><br />\r\n<img src=\"https://lh5.googleusercontent.com/W5axug5UlikHALaiI830hgtKfiitQKr4nLNDVYTtarjHoMkBDmwsZNtsl_snSE3nWUpiy_fRFCjoSO0qxCmePdQdr9bFn324lQDdWKeqOFtBl0OADWLoo36qRZknvB13Ga1lu_B-\" style=\"height:299px; width:388px\" /></p>\r\n\r\n<p>Wielu ludzi, kiedy słyszy o Bitcoinie i innych kryptowalutach, zadaje sobie pytanie, po co on w og&oacute;le powstał.&nbsp; Jedni m&oacute;wią, że jako instrument spekulacyjny, inni twierdzą, że jest to cyfrowe złoto, a jeszcze inni, że ma to być nowy środek płatniczy przez internet.&nbsp; Najbliżej faktycznych powod&oacute;w jest ten ostatni - środek płatniczy, ale z kilkoma charakteryzującymi go cechami. Satoshi Nakamoto, bo tak nazywa się tw&oacute;rca Bitcoina sam jest anonimowy. Nikt nie wie kim jest, bądź kim są, ponieważ istnieją spekulacje, że jest to grupa ludzi. Dla niekt&oacute;rych fakt, że Satoshi Nakmoto jest anonimowy włącza czerwoną lampkę. Podczas gdy jego anonimowość przynosi korzyści w postaci wzbudzania dalszych zainteresowań, delegitymizuje technologię w oczach innych.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, 7, 1, 1, 1580982886, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(25, 8, 1, 'Artykuł z pytaniem', '<p>Mfnasufis hsduf asdys dsvsdf dgsfusd fufa.</p>\r\n', 0, 0, 1, 0, '2020-02-07 21:05:28', '2020-02-07 21:05:28', 'bitcoin-4235718_1920.jpg', '', 1, 1, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(26, 6, 1, 'ccFound manifesto', '', 0, 0, 0, 0, '2020-02-12 09:20:50', '2020-02-12 09:20:50', 'VX vs VE8.jpg', '<p>Warsaw, 10 January 2020</p>\r\n\r\n<p><img src=\"https://lh5.googleusercontent.com/A80SB8JdKAw77UZh7ymR-t7eKkFTYR8Wr5FoOdGWs7ez4VS70a4TdRGIQUznVhEJnAcFpsivhuIT3mcqNio6UUQDQ50Cv9b-F8cvSoRbaZj6wUQWsKBv7lnAeIiI9lyty8GdOkeX\" style=\"height:100px; width:266px\" /></p>\r\n\r\n<p>Manifesto</p>\r\n\r\n<h1>Between 2019 and 2022 <strong>blockchain, cryptocurrencies </strong>and <strong>tokens </strong><br />\r\nwill obtain<strong> mass market</strong> <strong>adoption </strong><br />\r\nwith users number <strong>growing at least 10x</strong>.&nbsp;</h1>\r\n\r\n<p><strong><img alt=\"File:Technology-Adoption-Lifecycle.png\" src=\"https://lh3.googleusercontent.com/x_KSEw-_CsAXrF9pBqj4DlZ9x1A4F37NPH_wagEGzL2XI5MSSu2xULH4gKpULl2xLeMvNffidjxVAIrg_O3ChgSMzYdJrSVuBf0AhgyKIgX5pDvy_CgyT6p6NheLHU3JRky1wxSb\" style=\"height:240px; width:602px\" /></strong></p>\r\n\r\n<p>Source: <a href=\"https://commons.wikimedia.org/wiki/File:Technology-Adoption-Lifecycle.png\" style=\"text-decoration:none\">Wikimedia Commons&nbsp;</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Blockchain is 10 years old as we write. It is currently in the &ldquo;early adopters&rdquo; phase, just before &ldquo;the chasm&rdquo;. This is proven by the fact that most blockchains and decentralised applications (<a href=\"https://en.wikipedia.org/wiki/Decentralized_application\" style=\"text-decoration:none\">dApps</a>) are just prototypes of things to come. Also a very small portion of population (0.5-2%) holds any cryptoassets.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Jumping the chasm between early adopters and early majority in technology adoption lifecycle will make blockchain not only a widely recognized solution. It will lead to blockchain adoption in various aspects of life. And it will make the number of users grow at least tenfold&nbsp; like in all Bitcoin bubbles we have experienced.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This poses a huge problem. Market will be continuously flooded by newbies. Most of them striving to earn money, exposed to fraud and informational chaos, lacking support in case of difficulties - they have completely no sense of security.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We need to take care of them.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Newbies have a hard time entering the market, as cryptocurrencies, tokens and blockchain assets are technically complicated. Blockchain is fundamentally different from the traditional banking system but it represents a huge income opportunity not only through investment, but also trading, freelancing, teaching and day-to-day jobs.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>However, cryptocurrencies and tokens bring a huge risk of losing money. And it doesn&rsquo;t have to be this way.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Enter ccFound. </strong>A social platform that is NOT another crypto-facebook, youtube or twitter clone for everybody posting about everything.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://lh5.googleusercontent.com/A80SB8JdKAw77UZh7ymR-t7eKkFTYR8Wr5FoOdGWs7ez4VS70a4TdRGIQUznVhEJnAcFpsivhuIT3mcqNio6UUQDQ50Cv9b-F8cvSoRbaZj6wUQWsKBv7lnAeIiI9lyty8GdOkeX\" style=\"height:100px; width:266px\" /></p>\r\n\r\n<h1><strong>ccFound helps people invest consciously</strong> by organising knowledge in the most natural way known to humans:<strong> questions and answers.&nbsp;</strong></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>But unlike quora or stack exchange, questions need to be organised from the most fitted-for-newbies on the front, to the most specialised in the back. All to help new people enter the market and make wise decisions.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Experienced crypto-users will answer questions raised by newbies and gain reputation. New leaders will emerge and monetize their knowledge in several different ways, including publishing their own online courses, investment strategies, fundamental and technical analyses with content paywalls.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>New users are enticed to stay with ccFound for the long term through a growing database of market reports, articles and news. All written by the community - for the community.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>One does not live on cryptocurrencies alone. ccFounds community strives to create the largest knowledge base about investment on the Internet. As such, ccFound is a huge distribution channel on everything connected to investing - but owned by the people.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound gives its income back to the community as users become co-owners of the platform and participate in it actively through DAO and STO mechanisms (which stand for &ldquo;decentralised autonomous organization&rdquo; and &ldquo;<a href=\"https://en.wikipedia.org/wiki/Initial_coin_offering\" style=\"text-decoration:none\">security token offering</a>&rdquo;).&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">&ldquo;A decentralized autonomous organization (DAO), sometimes labeled a decentralized autonomous corporation (DAC) (...) is an organization represented by rules encoded as a computer program that is transparent, controlled by shareholders and not influenced by a central government. A DAO&#39;s financial transaction record and program rules are maintained on a blockchain&rdquo; (source: <a href=\"https://en.wikipedia.org/wiki/Decentralized_autonomous_organization\" style=\"text-decoration:none\">Wikipedia</a>)</li>\r\n</ul>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p>ccFound will issue at least two types of tokens on a public blockchain - one of them representing a stake in ownership of the system with voting and dividend rights, the other one being a stablecoin chained in its value to USD or a basket of currencies.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound not only teaches about investments, not only teaches on financial freedom, but becomes an investment for its users and a way of financially-free life all in itself, allowing to earn money through DAO dividends, publishing and monetising content.</p>\r\n\r\n<h1>Roadmap</h1>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">Q4 2019:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Early vision was developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Cryptography Research LTD was chosen as the project lead.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">$100k of internal funding was taken aside for the project.</li>\r\n		<li style=\"list-style-type:circle\">Technical specification was developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Naming, logo, brandbook were created.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Manifesto was written and corrected.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">A group of advisors / brand ambassadors was formed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">IT team was hired to create a beta version.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Early consultations were done with ambassadors.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Lawyers were hired to create terms &amp; conditions.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q1-Q2 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Terms &amp; conditions will be finished, translated and published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Alpha version will be published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">First groups of users will be invited for a closed alpha.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Content generation will be promoted.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Feedback and changes proposals will be analysed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Security token offering strategy will be developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Token economics will be discussed with the community.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Public funding will be considered with advisors.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q3 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Beta version will be finished and published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Legal changes for STO compliance will be finished.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">STO campaign will be led in the community by the parent company on an internal list of 25k+ crypto investors.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q4 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Official portal opening for wider public.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Ongoing decentralisation towards becoming a Decentralised Autonomous Organisation (DAO).&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Continuous development inspired and led by the community.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Ongoing milestones will be voted upon by the community.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(27, 7, 1, 'fdfsfds', '<p>sdf sdf sdf sdf sdf sd f sdsa fsadf</p>\r\n', 0, 1, 1, 0, '2020-02-12 20:43:25', '2020-02-12 20:43:25', '', '<p>fdsfsdf sd sdsdf sdf</p>\r\n', 1, 1, 9, 2, 1581540205, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(28, 7, 2, 'Giełda kryptowalut – jak wybrać właściwą i jak bezpiecznie z niej korzystać?', '', 0, 0, 0, 0, '2020-02-15 11:25:47', '2020-02-15 11:34:39', 'baner_i_spolka.jpg.png', '<p>Giełda kryptowalut&nbsp;to jedna z integralnych części całego kryptowalutowego ekosystemu. Czym są i czym r&oacute;żną się od innych tego typu platform, na kt&oacute;rych można handlować r&oacute;żnymi aktywami? I przede wszystkim &ndash; jak bezpiecznie z nich korzystać?</p>\r\n', 0, 3, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(29, 7, 1, 'Czy kryptowaluta może zniknąć?', '<p>Na początku w 2009 roku był Bitcoin, tylko jedna kryptowaluta, na dzień dzisiejszy w 2019 roku jest ich ponad 2000 a 1735 powstałych kryptowalut już nie istnieje (wg strony <a href=\"https://deadcoins.com/\" style=\"text-decoration:none\">deadcoins.com</a>). Biorąc pod uwagę fakty, to tak - kryptowaluty mogą zniknąć, ale nie fizycznie, bo przecież one fizycznie nie istnieją. Ich zapis na blockchainie zostaje i będzie widoczny aż do wyłączenia całej sieci, np Bitcoin może umrzeć tylko wtedy, kiedy nikt już nie będzie ich kopał, kupował, sprzedawał, przesyłał ani nie będzie używał sieci. Kryptowaluty nie znikają tylko umierają, bądź zostają zapomniane i stają się one bezwartościowe lub zakazane. Oznacza to, że możesz dalej posiadać martwą kryptowalutę, ale nie możesz jej sprzedać. Dlatego bardzo ważnym jest dokładnie zbadać projekt, w kt&oacute;ry chce się zainwestować swoje pieniądze i co istotne, na bieżąco śledzić postęp tego projektu.<br />\r\n<img src=\"https://lh6.googleusercontent.com/q-7ZsMg3qpNUtLYG2JNIEKf9YWyR6mnHjDV-cnbBDYrzobIczdZsUgjVvHRalMr13gtiCkWfZQcF0_Gzr4wjn702xe2FXY1hODqEJEtq2wDmcAwQHwiF0KQaUe4EPBIPtOQ3FjYw\" style=\"height:200px; width:602px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Martwe kryptowaluty</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Kryptowalutę uważa się za upadłą/martwą wtedy, kiedy nie ma już na nią popytu, lub sprzedaż jest zakazana z jakiś powod&oacute;w. Istnieje kilka przyczyn upadku kryptowalut:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">Upadłość projektu - szacuje się, że prawie 1000 altcoin&oacute;w upadło bądź są bezwartościowe z powodu bankructwa firmy prowadzącej projekt. Największa selekcja zaczęła się na początku 2018 roku, kiedy cena Bitcoina oraz kapitalizacja rynkowa zaczęła gwałtownie spadać, po szczytach w 2017 roku. Inwestorzy zaczęli dosłownie uciekać z rynku ze swoimi pieniędzmi, a to pociągnęło wielkie straty w kapitałach zostawionych na rozw&oacute;j&nbsp; projekt&oacute;w, założyciele nie mieli pieniędzy na dalsze utrzymywanie firm, pracownik&oacute;w, sprzęt&oacute;w itd<br />\r\n	<br />\r\n	Niekt&oacute;re kryptowaluty nigdy tak naprawdę nigdy nie &bdquo;żyły&rdquo; - należały do ​​projekt&oacute;w, kt&oacute;re były kontrolowane przez osoby zbyt niedbałe lub zbyt ignoranckie, aby skutecznie działać nad swoimi projektami. Pieniądze zostały zmarnowane, a projekty tak źle zarządzane, że nic z nich nie wychodziło. To z kolei powoduje, że inwestorzy szybko zaczynają się wycofywać.<br />\r\n	<br />\r\n	&bdquo;<em>Niekt&oacute;re projekty mają zwykle bardzo ambitnych i wizjonerskich członk&oacute;w zespołu, ale w wielu przypadkach niekoniecznie mają doświadczenie i umiejętności wymagane do spełnienia ich obietnic</em>&rdquo; - powiedział Jonha Richman, doradca PR w firmach Blockchain<br />\r\n	<img src=\"https://lh3.googleusercontent.com/Lx6-4YTFSmC8hBuf1_7RTWsThEVFAxRZq73iRj3fV65vOdivG5mRoQv2dNagOy_oH_4U4rkgioXPqzZT492bJwhDfc3TaJSYAIplXHml3imFncAYe1LzND1SPJSRaVarcJ3d53fJ\" style=\"height:287px; width:602px\" /></li>\r\n</ul>\r\n\r\n<p style=\"margin-left:48px\"><br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">Oszustwo - inne Kryptowaluty znikają lub giną z jeszcze bardziej nikczemnych powod&oacute;w. Oszustwa stały się niestety popularnym zjawiskiem w sferze kryptowalut - firm, kt&oacute;re fałszują platformy i kryptowaluty, aby przyciągnąć inwestor&oacute;w, tylko po to, by zamknąć swoje strony internetowe i zniknąć, gdy udało im się zdobyć kilka milion&oacute;w $&nbsp; kapitału.<br />\r\n	<br />\r\n	Biorąc pod uwagę liczbę oszustw w świecie kryptowalut jest to drugi z największych powod&oacute;w upadku projekt&oacute;w - o ile można powiedzieć, że coś upadło zanim w og&oacute;le powstało. Udowodnionych oszustw i wyłudzeń w kryptoświecie jest ponad 600, a ile nie udowodniono, bądź nawet nie pr&oacute;bowano udowodnić jest pewnie drugie tyle.<br />\r\n	<br />\r\n	Ogromna fala tzw scam&oacute;w (z ang. scam = oszustwo) przyszła razem z ICO (Initial Coin Offering - zbieranie kapitału przez startupy za pomocą kryptowalut.). ICO stało się narzędziem do wyłudzenia pieniędzy od wczesnych inwestor&oacute;w, jeszcze przed rozpoczęciemj pracy nad projektem. Wystarczyło dobrze się zamaskować, stworzyć &bdquo;jakiś&rdquo; zesp&oacute;ł, wymyślić &bdquo;jakiś&rdquo; cel, napisać &bdquo;jakiś&rdquo; white paper (z ang biała księga - raport zawierający analizę danego produktu, usługi, technologii lub programu) a naiwni inwestorzy kupowali wymyślone kryptowaluty z nadzieją na ogromne zyski, często nawet nie otrzymując nawet tych kryptowalut. Celowo napisałem &bdquo;jakiś&rdquo; bo często z daleka widać było, że to scam. Powstały nawet firmy, oferujące pisanie białej księgi za niewielką opłatą.<br />\r\n	<br />\r\n	Ponieważ prawo nie nadąża za postępem technologicznym, luki prawne są w tym przypadku nieuniknione. Tak jest w przypadku ICO w większości kraj&oacute;w, z wyjątkiem Chin i Korei Południowej, gdzie są one całkowicie zakazane. Niekt&oacute;re kraje, takie jak USA i Wielka Brytania, zwiększają nadz&oacute;r regulacyjny nad ICO, podobnie jak regulują akcje i obligacje. Z 902 kryptowalut powstałych w 2017 r., 142 nie udało się pozyskać jakichkolwiek funduszy, a 276 upadło zaraz po zebraniu funduszy. Kolejne 113 ICO zalicza się do kategorii &bdquo;częściowo upadły&rdquo;, albo dlatego, że dany startup przestał komunikować się w mediach społecznościowych, albo społeczność skurczyła się do tego stopnia, że ​​praktycznie nie ma szans na sukces.<br />\r\n	<img src=\"https://lh3.googleusercontent.com/ydapN3LEnthPKU2XXLHKb5UdCLT3AnrVs94TnD-u0k66G4sNls5DJvgFKwzVQ0s5HRQeEliMVqnzkDVk7UE5bbZsgOTbvu8U5U30J0ELtlKKNeBWcpFUPcr-RjkzBul6faLqocvQ\" style=\"height:425px; width:602px\" /><br />\r\n	&nbsp;</li>\r\n	<li style=\"list-style-type:disc\">Haki - hakerzy nie śpią, im lepsze zabezpieczenia zrobią programiści, tym lepsi stają się hakerzy. Ataki hakerskie w kryptowalutach to nie nowość, a jest to dosyć poważny problem. Samo zhakowanie w większości przypadk&oacute;w prowadzi do kradzieży znacznej ilości kryptowalut, często wartych bardzo duże pieniądze, ale istnieje r&oacute;wnież taki przypadek, że hakerzy mogą przywłaszczyć sobie sieć.<br />\r\n	<br />\r\n	Najbardziej znanym atakiem jest atak 51% ale może on mieć miejsce gł&oacute;wnie w projektach opartych o konsensus proof-of-work (PoW), kt&oacute;ry polega na kopaniu kryptowalut specjalistycznym sprzętem komputerowym. Atak ten cechuje się tym, że hakerzy przechwytują większość mocy obliczeniowej wszystkich koparek. Posiadając już wystarczająca moc obliczeniową możemy zarządzać siecią według własnego uznania. Jesteśmy w stanie wysłać kryptowaluty na dany adres na gł&oacute;wnym łańcuchu, wysyłając je w międzyczasie r&oacute;wnież na inny adres na zforkowanym blockchainie, kt&oacute;ry kopiemy potajemnie dzięki ogromnej mocy, kt&oacute;ra posiadamy.<br />\r\n	<br />\r\n	Drugim z popularnych hak&oacute;w jest znalezienie przez hakera luki w kodzie źr&oacute;dłowym danego projektu, jeżeli taka luka zostanie znaleziona to można np dodrukować fałszywe tokeny na oryginalnym blockchainie. Jest to swego rodzaju sprawdzian tw&oacute;rc&oacute;w projektu, po zhakowaniu w taki spos&oacute;b jedne kryptowaluty upadają, a inne jak najszybciej reagują na hak modyfikując kod źr&oacute;dłowy i usuwając lukę, przeprowadzają niezbędny token wsap oraz wykluczają fałszywe tokeny z obiegu.<br />\r\n	<img src=\"https://lh4.googleusercontent.com/bQCRaStfH99rzqae-kNjQ46WFe0pVlr6ufWSHXjkl_37nyJzJTEmiy6VXXdtE1S9mXF6EyyMZS1kXyD9ddUMhYbjlXCMIwMu07Nyvh5zBg18XGbfR21474GvByG9TGe_addQbyW4\" style=\"height:401px; width:602px\" /><br />\r\n	&nbsp;</li>\r\n	<li style=\"list-style-type:disc\">Parodie - słyszałeś o takich kryptowalutach jak Jesus Coin, Trump Coin czy Theresa May Coin? Tak! Są takie kryptowaluty i sama nazwa już powinna zapalać czerwoną lampkę. Takich znanych parodio-coin&oacute;w jest prawie 100. Zawsze są one stworzone na platformie typu Etherum czy NEO, nigdy nie będą miały własnej sieci. Za tymi coinami nie kryje się żaden poważny zesp&oacute;ł, cel, misja czy plan. Są one zwykłymi wymysłami nudzących się ludzi przed komputerem - to też pokazuje jak łatwe jest stworzenie własnej kryptowaluty. Należy jednak pamiętać, żeby pod żadnym pozorem nie kupować takich coin&oacute;w.</li>\r\n	<li style=\"list-style-type:disc\">Piramida finansowa&nbsp; - <a href=\"https://pl.wikipedia.org/wiki/Piramida_finansowa\" style=\"text-decoration:none\">Wikipedia</a> tłumaczy piramidę finansową jako struktura finansowa, w kt&oacute;rej zysk konkretnego uczestnika jest bezpośrednio uzależniony od wpłat p&oacute;źniejszych uczestnik&oacute;w, stojących niejako niżej w tej strukturze. Od nazwiska tw&oacute;rcy pierwszej w historii piramidy finansowej Charlesa Ponziego struktura ta zwana jest także &bdquo;schematem Ponziego&rdquo;. Piramidę finansową bardzo ciężko jest wykryć we wczesnej fazie rozwoju projektu, często tw&oacute;rcy zdobywają ogromne zaufanie społeczności obiecując ogromne zyski.<br />\r\n	<br />\r\n	Profesjonalnie przygotowane strony internetowe, dobrze rozwinięty marketing, duży zasięg w mediach społecznościowych oraz obiecane zyski rzędu nawet kilkuset procent kuszą niedoświadczonych inwestor&oacute;w, do wkładania swojego kapitału, a po osiągnięciu swoich cel&oacute;w, jakimi są często miliony dolar&oacute;w tw&oacute;rcy piramidy zwijają interes wraz z pieniędzmi inwestor&oacute;w.</li>\r\n</ul>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Gdzie są moje kryptowaluty?</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Co dzieje się z tymi martwymi kryptowalutami? Te, kt&oacute;re faktycznie istniały w pierwszej kolejności trafiają na cmentarz kryptograficzny - <a href=\"https://deadcoins.com/\" style=\"text-decoration:none\">deadcoins.com</a>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lista upadłych Kryptowalut ma ponad 1700 miejsc i rośnie bezustannie - w miarę ewolucji kryptoświata umiera coraz więcej projekt&oacute;w. Chociaż prawdą jest, że coraz więcej jest r&oacute;wnież tworzonych, zmniejszenie szumu wok&oacute;ł rynk&oacute;w kryptograficznych spowalnia przyrost prawdziwych kryptowalut, demografia rynku kryptograficznego zaczyna przypominać demografię kraju ze starzejącą się populacją.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 3, 1, 2, 0, '2020-02-16 10:05:03', '2020-02-16 10:05:03', 'f7b996a0-3e55-401f-ad2c-92e536ee8a91-baner_i_spolka.jpg.png', '<p>Na początku w 2009 roku był Bitcoin, tylko jedna kryptowaluta, na dzień dzisiejszy w 2019 roku jest ich ponad 2000 a 1735 powstałych kryptowalut już nie istnieje (wg strony <a href=\"https://deadcoins.com/\" style=\"text-decoration:none\">deadcoins.com</a>). Biorąc pod uwagę fakty, to tak - kryptowaluty mogą zniknąć, ale nie fizycznie, bo przecież one fizycznie nie istnieją. Ich zapis na blockchainie zostaje i będzie widoczny aż do wyłączenia całej sieci, np Bitcoin może umrzeć tylko wtedy, kiedy nikt już nie będzie ich kopał, kupował, sprzedawał, przesyłał ani nie będzie używał sieci. Kryptowaluty nie znikają tylko umierają, bądź zostają zapomniane i stają się one bezwartościowe lub zakazane. Oznacza to, że możesz dalej posiadać martwą kryptowalutę, ale nie możesz jej sprzedać. Dlatego bardzo ważnym jest dokładnie zbadać projekt, w kt&oacute;ry chce się zainwestować swoje pieniądze i co istotne, na bieżąco śledzić postęp tego projektu.&nbsp;<br />\r\n&nbsp;</p>\r\n', 2, 5, 10, 1, 1581847503, 1, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(30, 8, 1, ' Powrót do przyszłości', '', 1, 0, 1, 0, '2020-02-17 17:20:10', '2020-02-17 17:20:10', '', '<p>gfg</p>\r\n', 1, 2, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(31, 5, 2, 'czy poprawny inbox?', '<p>nie edycja</p>\r\n', 0, 0, 0, 0, '2020-02-27 08:46:51', '2020-06-03 19:09:13', '', '<p>tak edycja</p>\r\n', 0, 2, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(32, 5, 1, 'nowy artykul for lukasz2', '<p>bbbbbv</p>\r\n', 1, 0, 1, 0, '2020-02-29 20:04:56', '2020-06-11 23:39:24', '', '<p>Warsaw, 10 January 2020</p>\r\n\r\n<p><img src=\"https://lh6.googleusercontent.com/xK6Lk3W0ex_jwkvPYxL7QsUnmc0ta2jgme5qGbgBWRuw1ufgqNGAJufWHO6tm5mQj7IwPmP2ZbZtD4Q7dXUA_4PFWRDAKwN7pkl4jNOKhp6wJ-snyvRb4dzoyT9EboRvB4nwfZx5\" style=\"height:100px; width:266px\" /></p>\r\n\r\n<p>Manifesto</p>\r\n\r\n<h1>Between 2019 and 2022 <strong>blockchain, cryptocurrencies </strong>and <strong>tokens </strong><br />\r\nwill obtain<strong> mass market</strong> <strong>adoption </strong><br />\r\nwith the number of users <strong>growing at by least 10x</strong>.&nbsp;</h1>\r\n\r\n<p><strong><img alt=\"File:Technology-Adoption-Lifecycle.png\" src=\"https://lh5.googleusercontent.com/eO1uJ3UEivGu34I1DxX4hkH68-mPdatewjm8i3qQ5yoBBYKDkwpIeNfwFmIzNpJmqs02Ms7DQwOBC1805BrhNblzuEvycXVLlsVDdcYNxMlei6FExLvwywzdGXgu3OyI3J9Bk7rW\" style=\"height:240px; width:602px\" /></strong></p>\r\n\r\n<p>Source: <a href=\"https://commons.wikimedia.org/wiki/File:Technology-Adoption-Lifecycle.png\" style=\"text-decoration:none\">Wikimedia Commons&nbsp;</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Blockchain is 10 years old as we write. It is currently in the &ldquo;early adopters&rdquo; phase, just before &ldquo;the chasm&rdquo;. This is proven by the fact that most blockchains and decentralised applications (<a href=\"https://en.wikipedia.org/wiki/Decentralized_application\" style=\"text-decoration:none\">dApps</a>) are just prototypes of things to come. Also, a very small portion of the population (0.5-2%) holds any crypto assets.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bridging the chasm between the early adopters and the early majority in the technology adoption lifecycle will make blockchain not only a widely recognised solution, but will lead to increased blockchain adoption across various aspects of everyday life. Furthermore, it will make the number of users grow at least tenfold as we have witnessed in all Bitcoin bubbles thus far.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This poses a huge problem. The market will be continuously flooded by newbies, most of them striving to earn money and find an edge, but all the while being exposed to fraud and informational chaos, lacking support when they face any difficulties; basically operating with no sense of security and with little clear and trustworthy guidance.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We need to take care of them.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Newbies have a hard time entering the market, as cryptocurrencies, tokens and blockchain assets are technically complicated. Blockchain is fundamentally different from traditional banking and logistical systems but it represents a huge income opportunity, not only through short or long-term investment, but also through trading, freelancing, teaching and other day-to-day jobs.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>However, cryptocurrencies and tokens bring, alongside those opportunities, a huge risk of losing money or suffering fraud or theft. And it doesn&rsquo;t have to be this way.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Enter ccFound. </strong>A social platform that is NOT another crypto-facebook, youtube or twitter clone for everybody posting about everything.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://lh6.googleusercontent.com/xK6Lk3W0ex_jwkvPYxL7QsUnmc0ta2jgme5qGbgBWRuw1ufgqNGAJufWHO6tm5mQj7IwPmP2ZbZtD4Q7dXUA_4PFWRDAKwN7pkl4jNOKhp6wJ-snyvRb4dzoyT9EboRvB4nwfZx5\" style=\"height:100px; width:266px\" /></p>\r\n\r\n<h1><strong>ccFound helps people invest knowledgeably</strong> by providing information in the most natural way known to humans:<strong> questions and answers.&nbsp;</strong></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>But unlike Quora or Stack Exchange, questions need to be organised in a way that presents the ones most commonly asked by newbies at the front, with the most specialised or advanced coming last. It is specifically designed to help new people to enter the market and make wise decisions on how to engage with it in a way that suits their goals and requirements.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Experienced crypto users will answer questions raised by newbies and gain &lsquo;reputation&rsquo; by doing so. New leaders will emerge and monetise their knowledge in several different ways, including publishing their own online courses, investment strategies, fundamental and technical analyses with content paywalls, and so forth.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>New users are enticed to stay with ccFound for the long term through a growing database of market reports, articles and news, all written by the community, for the community.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>One does not live on cryptocurrencies alone. A principal rule of investing is to diversify one&rsquo;s assets. The ccFound community&rsquo;s purpose is to create the largest knowledge base about investment &ndash; across all asset classes - on the Internet. As such, ccFound will be a huge information distribution channel on everything connected to investing - but owned by the people.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound will give its income back to the community as users become co-owners of the platform and participate in it actively through DAO and STO mechanisms (which stand for &ldquo;decentralised autonomous organisation&rdquo; and &ldquo;<a href=\"https://en.wikipedia.org/wiki/Initial_coin_offering\" style=\"text-decoration:none\">security token offering</a>&rdquo;).&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">&ldquo;A decentralised autonomous organisation (DAO), sometimes labelled a decentralided autonomous corporation (DAC) (...) is an organisation represented by rules encoded as a computer program that is transparent, controlled by shareholders and not influenced by a central government. A DAO&#39;s financial transaction record and program rules are maintained on a blockchain&rdquo; (source: <a href=\"https://en.wikipedia.org/wiki/Decentralized_autonomous_organization\" style=\"text-decoration:none\">Wikipedia</a>)</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound will issue at least two types of tokens on a public blockchain - one of them representing a stake in ownership of the system with voting and dividend rights, the other one being a stablecoin chained in its value to USD or a basket of currencies.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound not only teaches about investments and how to achieve financial freedom, but becomes in itself an investment for its users and a way of pursuing the financially-free life, allowing users to earn money through DAO dividends, along with publishing and monetising content.</p>\r\n\r\n<h1>Roadmap</h1>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">Q4 2019:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Early vision developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Cryptography Research LTD chosen as the project lead.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">$100k of internal funding set aside for the project.</li>\r\n		<li style=\"list-style-type:circle\">Technical specification developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Naming, logo and branding created.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Manifesto written and corrected.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">A group of advisors / brand ambassadors formed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">IT team hired to create a beta version.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Early consultations with ambassadors.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Lawyers hired to create terms &amp; conditions.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q1-Q2 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Terms &amp; conditions will be finished, translated and published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Alpha version will be published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">First groups of users will be invited for a closed alpha.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Content generation will be promoted.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Feedback and proposals for changes will be analysed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Future DAO mechanisms will be planned out.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">The security token offering strategy will be developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Token economics will be discussed with the community.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Public funding (STO strategy) will be consulted upon with advisors.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q3 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Beta version will be finished and published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Project fully passed on to the community as a decentralised protocol like Bitcoin - payment in 10% of the tokens. Ownership is represented by tokens, STO funding gathered only in crypto by the funding smart contract.</li>\r\n		<li style=\"list-style-type:circle\">Legal changes for STO compliance will be finished.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">STO campaign will be led on a list of 25k+ crypto investors.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q4 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Official portal opening for wider public.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Ongoing decentralisation towards becoming a Decentralised Autonomous Organisation (DAO).&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Continuous development inspired and led by the community.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Ongoing milestones will be voted upon by the community.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 8, 13, 1, 1583272485, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(33, 6, 2, 'Anole VX!', '<p>Tak na marginesie dodam, że mam na to budżet 100 zł.&nbsp;</p>\r\n', 1, 0, 0, 0, '2020-03-03 14:16:56', '2020-03-03 14:16:56', '', '<p>Czy ta słuchawka daje radę? Co polecacie do słuchania disco polo, szczeg&oacute;lnie Zenka?</p>\r\n', 0, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL');
INSERT INTO `articles` (`id`, `user_id`, `type_id`, `title`, `description`, `counter_accepts`, `counter_rejects`, `counter_up_vote`, `counter_down_vote`, `created`, `updated`, `photo`, `preview`, `counter_vote_result`, `counter_comments`, `counter_sub_comments`, `is_visible`, `published`, `is_newsletter`, `counter_reviews`, `resolve_by`, `resolve_status`, `resolve_time`, `resolve_send`, `is_visible_by_role`, `is_deleted`, `lang`) VALUES
(34, 6, 1, 'ccfound manifesto', '', 0, 0, 0, 0, '2020-03-03 16:45:54', '2020-03-03 16:45:54', '', '<p>Warsaw, 10 January 2020</p>\n\n<p><img src=\"https://lh6.googleusercontent.com/xK6Lk3W0ex_jwkvPYxL7QsUnmc0ta2jgme5qGbgBWRuw1ufgqNGAJufWHO6tm5mQj7IwPmP2ZbZtD4Q7dXUA_4PFWRDAKwN7pkl4jNOKhp6wJ-snyvRb4dzoyT9EboRvB4nwfZx5\" style=\"height:100px; width:266px\" /></p>\n\n<p>Manifesto</p>\n\n<h1>Between 2019 and 2022 <strong>blockchain, cryptocurrencies </strong>and <strong>tokens </strong><br />\nwill obtain<strong> mass market</strong> <strong>adoption </strong><br />\nwith the number of users <strong>growing at by least 10x</strong>.&nbsp;</h1>\n\n<p><strong><img alt=\"File:Technology-Adoption-Lifecycle.png\" src=\"https://lh5.googleusercontent.com/eO1uJ3UEivGu34I1DxX4hkH68-mPdatewjm8i3qQ5yoBBYKDkwpIeNfwFmIzNpJmqs02Ms7DQwOBC1805BrhNblzuEvycXVLlsVDdcYNxMlei6FExLvwywzdGXgu3OyI3J9Bk7rW\" style=\"height:240px; width:602px\" /></strong></p>\n\n<p>Source: <a href=\"https://commons.wikimedia.org/wiki/File:Technology-Adoption-Lifecycle.png\" style=\"text-decoration:none\">Wikimedia Commons&nbsp;</a></p>\n\n<p>&nbsp;</p>\n\n<p>Blockchain is 10 years old as we write. It is currently in the &ldquo;early adopters&rdquo; phase, just before &ldquo;the chasm&rdquo;. This is proven by the fact that most blockchains and decentralised applications (<a href=\"https://en.wikipedia.org/wiki/Decentralized_application\" style=\"text-decoration:none\">dApps</a>) are just prototypes of things to come. Also, a very small portion of the population (0.5-2%) holds any crypto assets.</p>\n\n<p>&nbsp;</p>\n\n<p>Bridging the chasm between the early adopters and the early majority in the technology adoption lifecycle will make blockchain not only a widely recognised solution, but will lead to increased blockchain adoption across various aspects of everyday life. Furthermore, it will make the number of users grow at least tenfold as we have witnessed in all Bitcoin bubbles thus far.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>This poses a huge problem. The market will be continuously flooded by newbies, most of them striving to earn money and find an edge, but all the while being exposed to fraud and informational chaos, lacking support when they face any difficulties; basically operating with no sense of security and with little clear and trustworthy guidance.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>We need to take care of them.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Newbies have a hard time entering the market, as cryptocurrencies, tokens and blockchain assets are technically complicated. Blockchain is fundamentally different from traditional banking and logistical systems but it represents a huge income opportunity, not only through short or long-term investment, but also through trading, freelancing, teaching and other day-to-day jobs.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>However, cryptocurrencies and tokens bring, alongside those opportunities, a huge risk of losing money or suffering fraud or theft. And it doesn&rsquo;t have to be this way.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>Enter ccFound. </strong>A social platform that is NOT another crypto-facebook, youtube or twitter clone for everybody posting about everything.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"https://lh6.googleusercontent.com/xK6Lk3W0ex_jwkvPYxL7QsUnmc0ta2jgme5qGbgBWRuw1ufgqNGAJufWHO6tm5mQj7IwPmP2ZbZtD4Q7dXUA_4PFWRDAKwN7pkl4jNOKhp6wJ-snyvRb4dzoyT9EboRvB4nwfZx5\" style=\"height:100px; width:266px\" /></p>\n\n<h1><strong>ccFound helps people invest knowledgeably</strong> by providing information in the most natural way known to humans:<strong> questions and answers.&nbsp;</strong></h1>\n\n<p>&nbsp;</p>\n\n<p>But unlike Quora or Stack Exchange, questions need to be organised in a way that presents the ones most commonly asked by newbies at the front, with the most specialised or advanced coming last. It is specifically designed to help new people to enter the market and make wise decisions on how to engage with it in a way that suits their goals and requirements.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Experienced crypto users will answer questions raised by newbies and gain &lsquo;reputation&rsquo; by doing so. New leaders will emerge and monetise their knowledge in several different ways, including publishing their own online courses, investment strategies, fundamental and technical analyses with content paywalls, and so forth.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>New users are enticed to stay with ccFound for the long term through a growing database of market reports, articles and news, all written by the community, for the community.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>One does not live on cryptocurrencies alone. A principal rule of investing is to diversify one&rsquo;s assets. The ccFound community&rsquo;s purpose is to create the largest knowledge base about investment &ndash; across all asset classes - on the Internet. As such, ccFound will be a huge information distribution channel on everything connected to investing - but owned by the people.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>ccFound will give its income back to the community as users become co-owners of the platform and participate in it actively through DAO and STO mechanisms (which stand for &ldquo;decentralised autonomous organisation&rdquo; and &ldquo;<a href=\"https://en.wikipedia.org/wiki/Initial_coin_offering\" style=\"text-decoration:none\">security token offering</a>&rdquo;).&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<ul>\n	<li style=\"list-style-type:disc\">&ldquo;A decentralised autonomous organisation (DAO), sometimes labelled a decentralided autonomous corporation (DAC) (...) is an organisation represented by rules encoded as a computer program that is transparent, controlled by shareholders and not influenced by a central government. A DAO&#39;s financial transaction record and program rules are maintained on a blockchain&rdquo; (source: <a href=\"https://en.wikipedia.org/wiki/Decentralized_autonomous_organization\" style=\"text-decoration:none\">Wikipedia</a>)</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>ccFound will issue at least two types of tokens on a public blockchain - one of them representing a stake in ownership of the system with voting and dividend rights, the other one being a stablecoin chained in its value to USD or a basket of currencies.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>ccFound not only teaches about investments and how to achieve financial freedom, but becomes in itself an investment for its users and a way of pursuing the financially-free life, allowing users to earn money through DAO dividends, along with publishing and monetising content.</p>\n\n<h1>Roadmap</h1>\n\n<ul>\n	<li style=\"list-style-type:disc\">Q4 2019:&nbsp;\n	<ul>\n		<li style=\"list-style-type:circle\">Early vision developed.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Cryptography Research LTD chosen as the project lead.&nbsp;</li>\n		<li style=\"list-style-type:circle\">$100k of internal funding set aside for the project.</li>\n		<li style=\"list-style-type:circle\">Technical specification developed.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Naming, logo and branding created.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Manifesto written and corrected.&nbsp;</li>\n		<li style=\"list-style-type:circle\">A group of advisors / brand ambassadors formed.&nbsp;</li>\n		<li style=\"list-style-type:circle\">IT team hired to create a beta version.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Early consultations with ambassadors.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Lawyers hired to create terms &amp; conditions.&nbsp;</li>\n	</ul>\n	</li>\n	<li style=\"list-style-type:disc\">Q1-Q2 2020:&nbsp;\n	<ul>\n		<li style=\"list-style-type:circle\">Terms &amp; conditions will be finished, translated and published.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Alpha version will be published.&nbsp;</li>\n		<li style=\"list-style-type:circle\">First groups of users will be invited for a closed alpha.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Content generation will be promoted.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Feedback and proposals for changes will be analysed.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Future DAO mechanisms will be planned out.&nbsp;</li>\n		<li style=\"list-style-type:circle\">The security token offering strategy will be developed.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Token economics will be discussed with the community.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Public funding (STO strategy) will be consulted upon with advisors.&nbsp;</li>\n	</ul>\n	</li>\n	<li style=\"list-style-type:disc\">Q3 2020:&nbsp;\n	<ul>\n		<li style=\"list-style-type:circle\">Beta version will be finished and published.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Project fully passed on to the community as a decentralised protocol like Bitcoin - payment in 10% of the tokens. Ownership is represented by tokens, STO funding gathered only in crypto by the funding smart contract.</li>\n		<li style=\"list-style-type:circle\">Legal changes for STO compliance will be finished.&nbsp;</li>\n		<li style=\"list-style-type:circle\">STO campaign will be led on a list of 25k+ crypto investors.&nbsp;</li>\n	</ul>\n	</li>\n	<li style=\"list-style-type:disc\">Q4 2020:&nbsp;\n	<ul>\n		<li style=\"list-style-type:circle\">Official portal opening for wider public.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Ongoing decentralisation towards becoming a Decentralised Autonomous Organisation (DAO).&nbsp;</li>\n		<li style=\"list-style-type:circle\">Continuous development inspired and led by the community.&nbsp;</li>\n		<li style=\"list-style-type:circle\">Ongoing milestones will be voted upon by the community.&nbsp;</li>\n	</ul>\n	</li>\n</ul>\n\n<p>&nbsp;</p>\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(35, 6, 1, 'ccfound again', '<p>Warsaw, 10 January 2020</p>\r\n\r\n<p><img src=\"https://lh6.googleusercontent.com/xK6Lk3W0ex_jwkvPYxL7QsUnmc0ta2jgme5qGbgBWRuw1ufgqNGAJufWHO6tm5mQj7IwPmP2ZbZtD4Q7dXUA_4PFWRDAKwN7pkl4jNOKhp6wJ-snyvRb4dzoyT9EboRvB4nwfZx5\" style=\"height:100px; width:266px\" /></p>\r\n\r\n<p>Manifesto</p>\r\n\r\n<h1>Between 2019 and 2022 <strong>blockchain, cryptocurrencies </strong>and <strong>tokens </strong><br />\r\nwill obtain<strong> mass market</strong> <strong>adoption </strong><br />\r\nwith the number of users <strong>growing at by least 10x</strong>.&nbsp;</h1>\r\n\r\n<p><strong><img alt=\"File:Technology-Adoption-Lifecycle.png\" src=\"https://lh5.googleusercontent.com/eO1uJ3UEivGu34I1DxX4hkH68-mPdatewjm8i3qQ5yoBBYKDkwpIeNfwFmIzNpJmqs02Ms7DQwOBC1805BrhNblzuEvycXVLlsVDdcYNxMlei6FExLvwywzdGXgu3OyI3J9Bk7rW\" style=\"height:240px; width:602px\" /></strong></p>\r\n\r\n<p>Source: <a href=\"https://commons.wikimedia.org/wiki/File:Technology-Adoption-Lifecycle.png\" style=\"text-decoration:none\">Wikimedia Commons&nbsp;</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Blockchain is 10 years old as we write. It is currently in the &ldquo;early adopters&rdquo; phase, just before &ldquo;the chasm&rdquo;. This is proven by the fact that most blockchains and decentralised applications (<a href=\"https://en.wikipedia.org/wiki/Decentralized_application\" style=\"text-decoration:none\">dApps</a>) are just prototypes of things to come. Also, a very small portion of the population (0.5-2%) holds any crypto assets.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bridging the chasm between the early adopters and the early majority in the technology adoption lifecycle will make blockchain not only a widely recognised solution, but will lead to increased blockchain adoption across various aspects of everyday life. Furthermore, it will make the number of users grow at least tenfold as we have witnessed in all Bitcoin bubbles thus far.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This poses a huge problem. The market will be continuously flooded by newbies, most of them striving to earn money and find an edge, but all the while being exposed to fraud and informational chaos, lacking support when they face any difficulties; basically operating with no sense of security and with little clear and trustworthy guidance.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We need to take care of them.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Newbies have a hard time entering the market, as cryptocurrencies, tokens and blockchain assets are technically complicated. Blockchain is fundamentally different from traditional banking and logistical systems but it represents a huge income opportunity, not only through short or long-term investment, but also through trading, freelancing, teaching and other day-to-day jobs.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>However, cryptocurrencies and tokens bring, alongside those opportunities, a huge risk of losing money or suffering fraud or theft. And it doesn&rsquo;t have to be this way.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Enter ccFound. </strong>A social platform that is NOT another crypto-facebook, youtube or twitter clone for everybody posting about everything.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://lh6.googleusercontent.com/xK6Lk3W0ex_jwkvPYxL7QsUnmc0ta2jgme5qGbgBWRuw1ufgqNGAJufWHO6tm5mQj7IwPmP2ZbZtD4Q7dXUA_4PFWRDAKwN7pkl4jNOKhp6wJ-snyvRb4dzoyT9EboRvB4nwfZx5\" style=\"height:100px; width:266px\" /></p>\r\n\r\n<h1><strong>ccFound helps people invest knowledgeably</strong> by providing information in the most natural way known to humans:<strong> questions and answers.&nbsp;</strong></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>But unlike Quora or Stack Exchange, questions need to be organised in a way that presents the ones most commonly asked by newbies at the front, with the most specialised or advanced coming last. It is specifically designed to help new people to enter the market and make wise decisions on how to engage with it in a way that suits their goals and requirements.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Experienced crypto users will answer questions raised by newbies and gain &lsquo;reputation&rsquo; by doing so. New leaders will emerge and monetise their knowledge in several different ways, including publishing their own online courses, investment strategies, fundamental and technical analyses with content paywalls, and so forth.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>New users are enticed to stay with ccFound for the long term through a growing database of market reports, articles and news, all written by the community, for the community.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>One does not live on cryptocurrencies alone. A principal rule of investing is to diversify one&rsquo;s assets. The ccFound community&rsquo;s purpose is to create the largest knowledge base about investment &ndash; across all asset classes - on the Internet. As such, ccFound will be a huge information distribution channel on everything connected to investing - but owned by the people.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound will give its income back to the community as users become co-owners of the platform and participate in it actively through DAO and STO mechanisms (which stand for &ldquo;decentralised autonomous organisation&rdquo; and &ldquo;<a href=\"https://en.wikipedia.org/wiki/Initial_coin_offering\" style=\"text-decoration:none\">security token offering</a>&rdquo;).&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">&ldquo;A decentralised autonomous organisation (DAO), sometimes labelled a decentralided autonomous corporation (DAC) (...) is an organisation represented by rules encoded as a computer program that is transparent, controlled by shareholders and not influenced by a central government. A DAO&#39;s financial transaction record and program rules are maintained on a blockchain&rdquo; (source: <a href=\"https://en.wikipedia.org/wiki/Decentralized_autonomous_organization\" style=\"text-decoration:none\">Wikipedia</a>)</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound will issue at least two types of tokens on a public blockchain - one of them representing a stake in ownership of the system with voting and dividend rights, the other one being a stablecoin chained in its value to USD or a basket of currencies.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ccFound not only teaches about investments and how to achieve financial freedom, but becomes in itself an investment for its users and a way of pursuing the financially-free life, allowing users to earn money through DAO dividends, along with publishing and monetising content.</p>\r\n\r\n<h1>Roadmap</h1>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:disc\">Q4 2019:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Early vision developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Cryptography Research LTD chosen as the project lead.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">$100k of internal funding set aside for the project.</li>\r\n		<li style=\"list-style-type:circle\">Technical specification developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Naming, logo and branding created.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Manifesto written and corrected.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">A group of advisors / brand ambassadors formed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">IT team hired to create a beta version.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Early consultations with ambassadors.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Lawyers hired to create terms &amp; conditions.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q1-Q2 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Terms &amp; conditions will be finished, translated and published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Alpha version will be published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">First groups of users will be invited for a closed alpha.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Content generation will be promoted.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Feedback and proposals for changes will be analysed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Future DAO mechanisms will be planned out.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">The security token offering strategy will be developed.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Token economics will be discussed with the community.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Public funding (STO strategy) will be consulted upon with advisors.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q3 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Beta version will be finished and published.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Project fully passed on to the community as a decentralised protocol like Bitcoin - payment in 10% of the tokens. Ownership is represented by tokens, STO funding gathered only in crypto by the funding smart contract.</li>\r\n		<li style=\"list-style-type:circle\">Legal changes for STO compliance will be finished.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">STO campaign will be led on a list of 25k+ crypto investors.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li style=\"list-style-type:disc\">Q4 2020:&nbsp;\r\n	<ul>\r\n		<li style=\"list-style-type:circle\">Official portal opening for wider public.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Ongoing decentralisation towards becoming a Decentralised Autonomous Organisation (DAO).&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Continuous development inspired and led by the community.&nbsp;</li>\r\n		<li style=\"list-style-type:circle\">Ongoing milestones will be voted upon by the community.&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 0, 0, 0, '2020-03-03 17:12:38', '2020-03-03 17:12:38', '', '', 0, 0, 0, 1, 1583255558, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(36, 7, 2, 'Models folder structure in net core API project', '', 0, 0, 1, 0, '2020-03-24 18:26:03', '2020-03-24 18:26:03', '', '<p>asdas</p>\r\n', 1, 1, 0, 1, 1585074363, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(37, 7, 2, 'Models folder structure in net core API project', '<p>asda</p>\r\n', 0, 0, 1, 0, '2020-03-24 18:26:04', '2020-06-13 17:00:15', '', '<p>asdasasd</p>\r\n', 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(38, 7, 2, 'sdfsdfsdfsdsdfs', '', 0, 0, 0, 0, '2020-03-24 18:26:36', '2020-06-13 16:59:56', '', '<p>asdad</p>\r\n', 0, 3, 4, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(39, 8, 2, 'Pytanie', '', 0, 0, 0, 0, '2020-03-27 10:18:29', '2020-03-27 10:18:29', '', '<p>dfdf</p>\r\n', 0, 0, 0, 1, 1585304309, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(40, 48, 1, 'artykul do rozstrzygniecia', '', 0, 1, 0, 0, '2020-04-04 17:14:55', '2020-04-04 17:21:29', '', '<p>test</p>\r\n', 0, 0, 0, 2, 1586020495, 0, 0, 0, 0, 0, 1, 0, 0, 'pl_PL'),
(41, 51, 2, 'adjsahkj', '<p>asdasda</p>\r\n', 1, 0, 0, 0, '2020-05-11 04:55:44', '2020-05-18 06:51:29', '', '<p>kasjdlkajsk asdajksh jkshdjkahd</p>\r\n', 0, 0, 0, 1, 1589784689, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(42, 48, 2, 'nowy test roli', '', 0, 0, 0, 0, '2020-05-21 17:48:42', '2020-05-21 17:48:42', '', '', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(43, 48, 2, 'test roli 2', '', 0, 0, 0, 0, '2020-05-21 17:59:10', '2020-05-21 17:59:10', '', '', 0, 1, 1, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(44, 31, 1, 'sdfghjk', '<p>wqeqweq</p>\r\n', 0, 0, 0, 0, '2020-05-28 10:29:15', '2020-06-11 20:28:29', '', '<p>wertyuio;.,mnbvcsertyuiksedsretyu cwqeqwe</p>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(45, 31, 2, 'kolejny test 234', '', 0, 0, 0, 0, '2020-08-06 05:08:00', '2020-08-06 05:08:00', '', '<p>same testy&nbsp;</p>\r\n', 0, 1, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(46, 31, 2, 'teste 2', '', 0, 0, 0, 0, '2020-05-29 10:03:12', '2020-08-06 05:07:27', '', '<p>teste&nbsp;</p>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(47, 7, 2, 'Pytanie o pytanie2', '<p>dasda</p>\r\n', 0, 0, 0, 0, '2020-05-31 17:13:06', '2020-06-11 22:34:40', '', '<p>asdfasdf as ddasdas</p>\r\n', 0, 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(48, 29, 2, 'Co było pierwsze TEŚCIOR', '<p>sadf asd asdf asd asd zcz</p>\r\n', 0, 0, 3, 0, '2020-06-02 22:48:58', '2020-06-11 20:30:35', '', '<p>dfsadf asdf asdf</p>\r\n', 3, 22, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(49, 31, 2, 'oj tam oj tam222', '<p>fdsfsfdsf</p>\r\n', 1, 0, 2, 0, '2020-06-03 17:15:39', '2020-08-06 05:07:07', '', '<p>weferferfe</p>\r\n', 2, 1, 0, 1, 1591353924, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(50, 7, 1, 'test aktualnosci22', '<p>asdfasdasda</p>\r\n', 0, 0, 0, 0, '2020-06-04 07:01:06', '2020-06-11 20:28:54', '', '<p>aaa</p>\r\n', 0, 2, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(51, 45, 1, 'Dual-Y Example', '', 1, 0, 0, 0, '2020-06-04 07:01:35', '2020-07-22 01:50:51', '', '<p>sdfasdfsadfassadfsad&nbsp; df dfgd</p>\r\n', 0, 0, 0, 1, 1595375451, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(52, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:07:41', '2020-08-26 12:25:23', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 'pl_PL'),
(53, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:10:44', '2020-06-13 17:10:44', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(54, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:12:50', '2020-06-13 17:12:50', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(55, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:14:03', '2020-06-13 17:14:03', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(56, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:17:51', '2020-06-13 17:17:51', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(57, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:18:18', '2020-06-13 17:18:18', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(58, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:18:41', '2020-06-13 17:18:41', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(59, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:19:02', '2020-06-13 17:19:02', '', '<p>asdasd</p>\r\n', 0, 1, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(60, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:23:07', '2020-06-13 17:23:07', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(61, 7, 2, 'adsa', '<p>asdasda</p>\r\n', 0, 0, 0, 0, '2020-06-13 17:23:47', '2020-06-13 17:23:47', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(62, 7, 2, 'hhfghfg', '<p>fghgfh</p>\r\n', 0, 0, 0, 0, '2020-06-29 14:14:58', '2020-06-29 14:14:58', '', '<p>gfhfghf</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(63, 7, 2, 'asd3r2rfsdff', '<p>sfdsfdsfsdfs</p>\r\n', 0, 0, 0, 0, '2020-06-29 15:26:19', '2020-06-29 15:26:19', '', '<p>sdfsfs</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(64, 7, 2, 'fasfasf?', '<p>fgdfgdfgdf afadfsdf</p>\r\n', 0, 0, 0, 0, '2020-06-29 20:23:45', '2020-06-29 20:23:45', '', '<p>asdasfafhd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(65, 7, 1, 'asfdzbdfbdsv gsdfsd', '<p>sdgfsdgafg</p>\r\n', 0, 0, 0, 0, '2020-06-29 20:26:14', '2020-06-29 20:26:14', '', '<p>sdfsdfsdfsdfssdf</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(66, 7, 2, 'zczxczxc sdsdf', '<p>asdasdasda</p>\r\n', 0, 0, 0, 0, '2020-06-29 20:37:18', '2020-06-29 20:37:18', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(67, 7, 2, 'zczxczxc sdsdf', '<p>asdasdasda</p>\r\n', 0, 0, 0, 0, '2020-06-29 20:40:41', '2020-06-29 20:40:41', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(68, 7, 2, 'zczxczxc sdsdf', '<p>asdasdasda</p>\r\n', 0, 0, 0, 0, '2020-06-29 20:43:55', '2020-06-29 20:43:55', '', '<p>asdasd</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(69, 7, 1, 'zxczxcz', '<p>zxvzxvzxb fsdfsdfsd</p>\r\n', 0, 0, 0, 0, '2020-06-29 21:08:40', '2020-06-29 21:08:40', '', '<p>zxvzxvzxv</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(70, 7, 2, 'sfafasf', '<p>asdasf sdfsdf</p>\r\n', 0, 0, 0, 0, '2020-06-29 21:44:42', '2020-06-29 21:44:42', '', '<p>asfasfas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(71, 7, 1, '24324325vdfd433', '<p>asdasdasf fa sfasf</p>\r\n', 0, 0, 0, 0, '2020-06-29 21:46:51', '2020-06-29 21:46:51', '', '<p>asdasdfas aff asf</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(72, 6, 1, 'asdasd', '<p>asdasdasda</p>\r\n', 0, 0, 0, 0, '2020-06-30 08:28:24', '2020-06-30 08:28:24', '', '<p>safasfas</p>\r\n', 0, 2, 2, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(73, 51, 2, 'dfgd', '<p>dfgddfg</p>\r\n', 1, 0, 0, 0, '2020-07-02 18:23:24', '2020-07-02 18:26:34', '', '<p>dfgdfgdg</p>\r\n', 0, 0, 0, 1, 1593714394, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(74, 7, 2, 'dsadas', '<p>asfasgsfasas</p>\r\n', 0, 0, 0, 0, '2020-07-02 19:26:57', '2020-07-02 19:26:57', '', '<p>asdasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(75, 7, 1, 'sfsdfasd', '<p>asfasfasf</p>\r\n', 0, 0, 0, 0, '2020-07-05 10:55:04', '2020-07-05 10:55:04', '', '<p>fasfasfasa</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(76, 7, 2, 'asdasda', '<p>asfasfasfasfasf</p>\r\n', 0, 0, 0, 0, '2020-07-18 19:46:37', '2020-07-18 19:46:37', '', '<p>asdasdasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(77, 7, 2, 'SAsASDSA?', '<p>DASDASDA A ASDasdasda&nbsp;</p>\r\n', 0, 0, 0, 0, '2020-07-18 19:55:01', '2020-07-18 19:55:01', '', '<p>SADASDSA&nbsp; ASCASC ASCAS</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(78, 7, 2, 'asdas dsdf', '<p>dasdassc fas casdasad</p>\r\n', 0, 0, 0, 0, '2020-07-18 19:57:42', '2020-07-18 19:57:42', '', '<p>asdasdad adas</p>\r\n', 0, 2, 6, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(79, 7, 2, 'aSAa', '<p>dasdas</p>\r\n', 0, 0, 0, 0, '2020-07-18 20:01:15', '2020-07-18 20:01:15', '', '<p>ASA</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(80, 51, 1, 'AJKSHJA kAJSKLJA nlkjdklaj NKLAJDKLj', '<p>l;kl;skalkdl;ksa;ld</p>\r\n', 1, 0, 0, 0, '2020-07-18 20:26:02', '2020-07-18 21:23:59', '', '<p>sal;dkaslk askd;lkas l;asdml;k</p>\r\n', 0, 0, 0, 1, 1595107439, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(81, 7, 2, 'dsadasd asasdas', '<p>asdasdas asasd</p>\r\n', 0, 0, 0, 0, '2020-07-18 20:35:38', '2020-07-18 20:35:38', '', '<p>asdas asdasda</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(82, 6, 1, 'SDAD', '<p>SAFASSFSDG</p>\r\n', 1, 0, 0, 0, '2020-07-22 01:34:19', '2020-07-22 01:35:03', '', '<p>As</p>\r\n', 0, 1, 0, 1, 1595374503, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(83, 6, 2, 'sdada asda asd asdas da2', '<p>a sdas asd asdasda</p>\r\n', 0, 0, 0, 0, '2020-07-23 18:46:42', '2020-08-06 05:05:55', '', '<p>asdasd asd a</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(84, 29, 2, 'sasdsadas asddsa a', '<p>asd asd as asd asdads</p>\r\n', 0, 0, 0, 0, '2020-07-24 00:53:15', '2020-07-24 00:53:15', '', '<p>asdasd as adsa ddasd ass</p>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(85, 51, 2, 'asdasdd das d', '<p>sad asdasd asdasda sad as</p>\r\n', 1, 0, 0, 0, '2020-07-25 16:00:01', '2020-07-25 16:00:19', '', '<p>sad asdasdas asdas asd das</p>\r\n', 0, 0, 0, 1, 1595692819, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(86, 51, 2, 'aasdsadasd', '<p>as asdas da dasdasdasda asdasda</p>\r\n', 2, 0, 0, 0, '2020-07-30 18:39:35', '2020-07-30 18:40:07', '', '<p>dasdasd sada sdasdas dsdad</p>\r\n', 0, 0, 0, 1, 1593714394, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(87, 51, 1, 'sasdas ddsad as', '<p>ad asd asdasdasdasdasdas</p>\r\n', 0, 1, 0, 0, '2020-07-30 18:47:24', '2020-07-30 18:48:25', '', '<p>&nbsp;asdasd asdasdasd asds</p>\r\n', 0, 0, 0, 2, 1593714394, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(88, 31, 2, 'fess rwr 3r 23 32rfe', '<p>ew fwew fwefw</p>\r\n', 0, 0, 0, 0, '2020-08-06 05:13:25', '2020-08-06 05:13:25', '', '<p>&nbsp;ewfwefwe</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'pl_PL'),
(89, 7, 1, 'Deweloperzy XRP uruchamiają smart kontrakty Ethereum na sieci Flare Network ', '', 0, 1, 0, 0, '2020-08-21 17:15:17', '2020-08-22 10:01:32', '1_28.jpg', '<p>Flare Networks opublikowała pierwszą białą księgę 1.0, w kt&oacute;rej szczeg&oacute;łowo opisano funkcjonowanie całego ekosystemu. Korzystając z Flare Network, inteligentne kontrakty mogą być realizowane bezpośrednio w sieci XRP Ledger. Flare Network już pod koniec 2019 roku nawiązała wsp&oacute;łpracę z działem rozwoju Xpring firmy Ripple, aby wprowadzić inteligentne kontrakty do XRP Ledger. W maju tego roku partner Ripple uruchomił pierwszą sieć testową Coston, aby przetestować wykorzystanie Smart Contracts w XRP Ledger (XRPL). Flare Networks jest pierwszym pełnym protokołem Turing Federated Bizantine Agreement (FBA), a nowy spos&oacute;b użycia XRP to wykonywanie inteligentnych kontrakt&oacute;w na XRPL. Sieć Flare zintegruje maszynę wirtualną Ethereum, umożliwiając sieciom publicznym i prywatnym korzystanie i wykonywanie inteligentnych kontrakt&oacute;w oraz przenoszenie aplikacji i smart kontrakt&oacute;w pomiędzy siecią Ethereum a siecią XRP.</p>\r\n\r\n<p>FXRP to pozbawiona zaufania reprezentacja tokena XRP w sieci Flare Network, kt&oacute;ra umożliwia posiadaczom XRP korzystanie z inteligentnych kontrakt&oacute;w z tokenem XRP. Powstały ekosystem zapewnia zachętę dla agent&oacute;w do udziału poprzez uzyskiwanie opłat, a także zdolność do arbitrażu. W sieci Flare Network Token Spark (FXRP) jest używany do reprezentowania token&oacute;w XRP jako zabezpieczenia w sieci. System FXRP to zestaw mechanizm&oacute;w finansowych zakodowanych w inteligentnych kontraktach, kt&oacute;re umożliwiają posiadaczom XRP tworzenie i odzyskiwanie 1:1 tokena XRP w sieci Flare Network, zwanej FXRP. Aby to osiągnąć, system opiera się na agentach uczestniczących w systemie, stawiając Spark jako zabezpieczenie, kt&oacute;re zarabia na prowizjach w zamian.</p>\r\n\r\n<p>Zapewniając ten interfejs, księga XRP może być używana w dowolnej zdecentralizowanej aplikacji, co znacznie rozszerza zakres aplikacji XRP. Zapewniona jest r&oacute;wnież skalowalność, XRPL oferuje wysoką przepustowość transakcji. Josh Edwards, wiceprezes ds. Inżynierii w Flare Networks, opisuje sw&oacute;j projekt jako transformacje, kt&oacute;ra zrewolucjonizuje całą branżę: <a href=\"https://twitter.com/JoshuaGEdwards/status/1293457195426697216?s=20\" style=\"text-decoration:none\">Tweet </a>&nbsp;Ripple pracuje nad dalszym postępem w adaptacji XRP. Ostatnio Xpring ogłosił wsparcie finansowe dla projekt&oacute;w mających na celu zwiększenie interoperacyjności między XRP Ledger i Ethereum. Korzystając z protokołu Interledger (ILP), zostanie zbudowany most między XRP i ETH, dając Ripple dostęp do szybko rozwijającego się rynku DeFi.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Whitepaper : <a href=\"https://flare.xyz/app/uploads/2020/08/FXRP_Version_1.0.pdf\" style=\"text-decoration:none\">https://flare.xyz/app/uploads/2020/08/FXRP_Version_1.0.pdf</a></p>\r\n\r\n<p>Website: <a href=\"https://flare.ghost.io/theflarenetwork/\" style=\"text-decoration:none\">https://flare.ghost.io/theflarenetwork/</a></p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 0, 0, 2, 1598083292, 0, 0, 0, 0, 0, 0, 0, 0, 'pl_PL'),
(90, 6, 1, 'njsdjncfdn', '<p>dshdhskd</p>\r\n\r\n<p>sdjshd</p>\r\n\r\n<p>sbkdhhsjkdhjs</p>\r\n', 0, 0, 0, 0, '2020-09-04 06:38:22', '2020-09-04 06:38:22', '', '<p>jkdskhs</p>\r\n\r\n<p>sdjhksjhd</p>\r\n\r\n<p>sdhsjd</p>\r\n\r\n<p>sjkdshdj</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(91, 5, 1, 'sjfdsfdl', '<p>ksldjlfkj</p>\r\n\r\n<p>djfhsjkl</p>\r\n\r\n<p>sdfjsjlfj</p>\r\n', 0, 0, 0, 0, '2020-09-04 06:41:08', '2020-09-04 06:41:08', '', '<p>kdfkljslfjlk</p>\r\n\r\n<p>sdjfskldf4sdljlfjksl</p>\r\n\r\n<p>dfjkkdskhf</p>\r\n\r\n<p>sdjkfhs;</p>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'en_US'),
(92, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 06:48:13', '2020-09-04 06:48:13', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(93, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 06:52:31', '2020-09-04 06:52:31', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(94, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 06:54:02', '2020-09-04 06:54:02', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(95, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 06:54:39', '2020-09-04 06:54:39', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(96, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 06:56:52', '2020-09-04 06:56:52', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(97, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 06:57:34', '2020-09-04 06:57:34', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(98, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 06:59:23', '2020-09-04 06:59:23', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(99, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 07:00:01', '2020-09-04 07:00:01', '', '<p>dasdas</p>\r\n', 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(100, 7, 1, 'sdadsaa', '', 0, 0, 0, 0, '2020-09-04 07:00:38', '2020-09-04 07:00:38', '', '<p>dasdas</p>\r\n', 0, 1, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 'en_US'),
(101, 5, 1, 'asdadsadhjab', '<p>asdasdasdasda</p>\r\n', 0, 0, 0, 0, '2020-09-04 07:01:33', '2020-09-04 07:01:33', '', '<p>asdnka</p>\r\n\r\n<p>asjdkhajskd</p>\r\n\r\n<p>ajksdbjkas</p>\r\n\r\n<p>aslkdjklaj</p>\r\n', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'en_US');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `articles_admin_edit_history`
--

CREATE TABLE `articles_admin_edit_history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `article_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `articles_admin_edit_history`
--

INSERT INTO `articles_admin_edit_history` (`id`, `user_id`, `article_id`, `created`) VALUES
(1, 7, 47, '2020-06-11 22:34:40'),
(2, 7, 10, '2020-06-11 22:53:38'),
(3, 7, 10, '2020-06-11 22:54:03'),
(4, 7, 32, '2020-06-11 23:39:24'),
(5, 7, 22, '2020-06-29 14:15:44'),
(6, 7, 22, '2020-06-29 15:58:15'),
(7, 6, 83, '2020-08-06 05:05:55'),
(8, 31, 49, '2020-08-06 05:07:07'),
(9, 6, 22, '2020-08-24 06:52:53');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `articles_resolves`
--

CREATE TABLE `articles_resolves` (
  `id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `status` tinyint NOT NULL,
  `resolve_status` smallint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `articles_subscriptions`
--

CREATE TABLE `articles_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `article_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `articles_subscriptions`
--

INSERT INTO `articles_subscriptions` (`id`, `user_id`, `article_id`, `created`) VALUES
(25, 51, 32, '2020-06-26 12:00:47'),
(28, 7, 32, '2020-06-28 08:04:52'),
(29, 7, 22, '2020-06-29 22:51:03'),
(31, 51, 71, '2020-06-30 07:56:22'),
(33, 51, 22, '2020-07-02 19:22:49'),
(34, 7, 72, '2020-07-05 21:21:10'),
(35, 51, 72, '2020-07-05 21:21:53'),
(36, 51, 78, '2020-07-18 20:39:46'),
(37, 7, 78, '2020-07-18 20:57:18'),
(38, 7, 10, '2020-07-18 21:02:21'),
(39, 51, 10, '2020-07-18 21:05:48'),
(40, 7, 82, '2020-07-30 21:28:22'),
(42, 6, 100, '2020-09-14 06:18:56');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `a_dmad_social_auth_phinxlog`
--

CREATE TABLE `a_dmad_social_auth_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `banners`
--

CREATE TABLE `banners` (
  `id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` smallint NOT NULL,
  `position` int NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `lang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pl_PL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `banners`
--

INSERT INTO `banners` (`id`, `title`, `link_url`, `photo`, `status`, `position`, `created_by`, `updated_by`, `created`, `updated`, `lang`) VALUES
(2, 'testbanner2', 'http://ik.blockx.pl/pl/articles/view/24', 'bitcoin-10000.jpg', 1, 1, 8, NULL, '0000-00-00 00:00:00', '2020-04-02 14:53:14', 'pl_PL'),
(3, 'xaAB', 'https://docs.google.com/document/d/1vZUt_tTnrQu9qRtbRuywbGdn8W-OdcBz9bTOB2tcv3g/edit', 'cryptocurrency_thinkstock_821299476-100749429-large.jpg', 0, 2, 5, NULL, '0000-00-00 00:00:00', '2020-04-02 14:53:26', 'pl_PL'),
(5, 'Models folder structure in net core API project', 'sdfadfasdfasfdas', 'aa98e030-2598-4f0a-99ef-405f281f90d6-Q2-Crypto-AML-Report-Summary.jpg', 1, 3, 8, NULL, '0000-00-00 00:00:00', '2020-04-02 14:53:14', 'pl_PL'),
(6, 'asdasd', '', '9886311a-c930-4aa1-9924-2d0a93cd8315-logo.png', 1, 5, 8, NULL, '0000-00-00 00:00:00', '2020-04-02 14:53:14', 'pl_PL'),
(7, 'Mój baner', '', '41af816f-8f22-4d4b-949c-a0ea0770f03f-bitcoin-4235718_1920.jpg', 0, 1, 8, NULL, '0000-00-00 00:00:00', '2020-04-02 14:53:26', 'pl_PL'),
(8, '', '', 'image.png', 1, 2, 7, NULL, '0000-00-00 00:00:00', '2020-04-02 14:53:14', 'pl_PL'),
(10, 'testdefaultimageupdate', 'test', '', 1, 4, 5, NULL, '0000-00-00 00:00:00', '2020-04-02 14:53:14', 'pl_PL'),
(11, 'Czad22', 'sjankdjasnjkdda', '527886.jpg', 1, 0, 31, 6, '2020-07-30 20:52:36', '2020-07-30 21:00:23', 'pl_PL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blocks`
--

CREATE TABLE `blocks` (
  `id` int NOT NULL,
  `region_id` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `body` text NOT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `class` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `element` varchar(255) DEFAULT NULL,
  `visibility_roles` text,
  `visibility_paths` text,
  `visibility_php` text,
  `params` text,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `blocks`
--

INSERT INTO `blocks` (`id`, `region_id`, `title`, `alias`, `body`, `show_title`, `class`, `status`, `weight`, `element`, `visibility_roles`, `visibility_paths`, `visibility_php`, `params`, `publish_start`, `publish_end`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(3, 4, 'About', 'about', 'This is the content of your block. Can be modified in admin panel.', 1, '', 1, 2, '', '', '', '', '', NULL, NULL, '2009-12-20 03:07:39', NULL, '2009-07-26 17:13:14', NULL),
(5, 4, 'Meta', 'meta', '[menu:meta]', 1, '', 1, 6, '', '', '', '', '', NULL, NULL, '2009-12-22 05:17:39', NULL, '2009-09-12 06:36:22', NULL),
(6, 4, 'Blogroll', 'blogroll', '[menu:blogroll]', 1, '', 1, 4, '', '', '', '', '', NULL, NULL, '2009-12-20 03:07:33', NULL, '2009-09-12 23:33:27', NULL),
(7, 4, 'Categories', 'categories', '[vocabulary:categories type=\"blog\"]', 1, '', 1, 3, '', '', '', '', '', NULL, NULL, '2009-12-20 03:07:36', NULL, '2009-10-03 16:52:50', NULL),
(8, 4, 'Search', 'search', '', 0, '', 1, 1, 'Croogo/Nodes.search', '', '', '', '', NULL, NULL, '2009-12-20 03:07:39', NULL, '2009-12-20 03:07:27', NULL),
(9, 4, 'Recent Posts', 'recent_posts', '[node:recent_posts conditions=\"Nodes.type:blog\" order=\"Nodes.id DESC\" limit=\"5\"]', 1, '', 1, 5, '', '', '', '', '', NULL, NULL, '2010-04-08 21:09:31', NULL, '2009-12-22 05:17:32', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `counter_pop` bigint NOT NULL DEFAULT '0',
  `lang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pl_PL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `name`, `counter_pop`, `lang`) VALUES
(5, 'Kryptowaluty', 0, 'pl_PL'),
(6, 'Nieruchomości', 2, 'pl_PL'),
(9, 'Podstawy', 1, 'pl_PL'),
(10, 'Słuchawki', 0, 'pl_PL'),
(11, 'Analizy', 22, 'pl_PL'),
(12, 'Koparki', 0, 'pl_PL'),
(13, 'Bitcoin', 33, 'pl_PL'),
(14, 'bt', 5, 'pl_PL'),
(15, 'btc', 3, 'pl_PL'),
(16, 'To Test', 0, 'pl_PL'),
(17, 'KAC', 0, 'pl_PL'),
(18, 'by', 5, 'pl_PL'),
(19, 'bh', 1, 'pl_PL'),
(20, 'vhjb', 1, 'pl_PL'),
(21, 'hvhjb', 1, 'pl_PL'),
(22, 'fds', 0, 'pl_PL'),
(23, 'sfd', 0, 'pl_PL'),
(24, 'dsf', 0, 'pl_PL'),
(25, 'as', 1, 'pl_PL'),
(26, 'asd', 0, 'pl_PL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories_articles`
--

CREATE TABLE `categories_articles` (
  `id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `category_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `categories_articles`
--

INSERT INTO `categories_articles` (`id`, `article_id`, `category_id`) VALUES
(36, 27, 5),
(37, 27, 6),
(38, 28, 6),
(40, 30, 5),
(41, 30, 6),
(44, 31, 6),
(45, 32, 6),
(46, 33, 10),
(47, 34, 9),
(48, 35, 11),
(49, 36, 11),
(50, 37, 11),
(51, 38, 9),
(52, 39, 11),
(53, 40, 12),
(54, 41, 9),
(55, 42, 13),
(56, 43, 6),
(57, 44, 14),
(58, 45, 15),
(59, 46, 15),
(60, 47, 11),
(61, 23, 14),
(62, 49, 18),
(63, 50, 11),
(64, 51, 11),
(65, 48, 13),
(66, 10, 11),
(67, 52, 13),
(68, 53, 13),
(69, 54, 13),
(70, 55, 13),
(71, 56, 13),
(72, 57, 13),
(73, 58, 13),
(74, 59, 13),
(75, 60, 13),
(76, 61, 13),
(77, 62, 13),
(78, 22, 18),
(79, 63, 13),
(80, 22, 11),
(81, 64, 11),
(82, 64, 13),
(83, 65, 13),
(84, 65, 18),
(85, 66, 11),
(86, 66, 13),
(87, 67, 11),
(88, 67, 13),
(89, 68, 11),
(90, 68, 13),
(91, 69, 11),
(92, 69, 13),
(93, 70, 13),
(94, 71, 13),
(95, 72, 11),
(96, 72, 13),
(97, 73, 11),
(98, 74, 13),
(99, 75, 13),
(100, 75, 14),
(101, 76, 15),
(102, 76, 18),
(103, 77, 11),
(104, 77, 13),
(105, 77, 15),
(106, 78, 11),
(107, 78, 13),
(108, 78, 15),
(109, 79, 11),
(110, 79, 13),
(111, 79, 18),
(112, 80, 13),
(113, 81, 11),
(114, 81, 13),
(115, 81, 14),
(116, 82, 11),
(117, 82, 13),
(118, 83, 11),
(119, 83, 13),
(120, 83, 14),
(121, 84, 11),
(122, 84, 13),
(123, 84, 15),
(124, 85, 11),
(125, 85, 13),
(126, 85, 14),
(127, 86, 11),
(128, 86, 13),
(129, 86, 14),
(130, 87, 11),
(131, 87, 13),
(132, 88, 11),
(133, 88, 13),
(134, 11, 11),
(135, 11, 13),
(136, 90, 19),
(137, 90, 20),
(138, 90, 21),
(139, 91, 22),
(140, 91, 23),
(141, 91, 24),
(142, 92, 25),
(143, 101, 26);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories_subscriptions`
--

CREATE TABLE `categories_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `categories_subscriptions`
--

INSERT INTO `categories_subscriptions` (`id`, `user_id`, `category_id`, `created`) VALUES
(3, 7, 11, '2020-06-29 10:39:58'),
(5, 7, 17, '2020-06-29 11:46:46'),
(6, 7, 5, '2020-06-29 11:46:49'),
(7, 7, 14, '2020-06-29 11:51:42'),
(10, 7, 10, '2020-06-29 11:51:45'),
(12, 7, 9, '2020-06-29 12:08:02'),
(15, 51, 13, '2020-06-29 21:43:57'),
(16, 7, 18, '2020-07-05 10:54:38'),
(17, 6, 13, '2020-07-29 10:30:37');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `model` varchar(50) NOT NULL DEFAULT 'Node',
  `foreign_key` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `rating` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL,
  `comment_type` varchar(100) NOT NULL DEFAULT 'comment',
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `comments`
--

INSERT INTO `comments` (`id`, `parent_id`, `model`, `foreign_key`, `user_id`, `name`, `email`, `website`, `ip`, `title`, `body`, `rating`, `status`, `notify`, `type`, `comment_type`, `lft`, `rght`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, NULL, 'Croogo/Nodes.Nodes', 1, 0, 'Mr Croogo', 'email@example.com', 'http://www.croogo.org', '127.0.0.1', '', 'Hi, this is the first comment.', NULL, 1, 0, 'blog', 'comment', 1, 2, '2009-12-25 12:00:00', NULL, '2009-12-25 12:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments_subscriptions`
--

CREATE TABLE `comments_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `comments_subscriptions`
--

INSERT INTO `comments_subscriptions` (`id`, `user_id`, `comment_id`, `created`) VALUES
(1, 51, 141, '2020-06-22 11:12:18'),
(2, 51, 142, '2020-06-22 17:59:21'),
(13, 51, 133, '2020-06-26 12:10:16'),
(15, 7, 106, '2020-06-26 16:29:17'),
(16, 7, 107, '2020-06-26 16:29:18'),
(17, 7, 133, '2020-06-27 09:59:32'),
(18, 7, 184, '2020-07-05 21:37:54'),
(19, 51, 173, '2020-07-18 21:14:05'),
(20, 6, 145, '2020-07-23 20:48:15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `body` text,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `address` text,
  `address2` text,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message_status` tinyint(1) NOT NULL DEFAULT '1',
  `message_archive` tinyint(1) NOT NULL DEFAULT '1',
  `message_count` int NOT NULL DEFAULT '0',
  `message_spam_protection` tinyint(1) NOT NULL DEFAULT '0',
  `message_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `message_notify` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `contacts`
--

INSERT INTO `contacts` (`id`, `title`, `alias`, `body`, `name`, `position`, `address`, `address2`, `state`, `country`, `postcode`, `phone`, `fax`, `email`, `message_status`, `message_archive`, `message_count`, `message_spam_protection`, `message_captcha`, `message_notify`, `status`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Contact', 'contact', '', '', '', '', '', '', '', '', '', '', 'you@your-site.com', 1, 0, 0, 0, 0, 1, 1, '2009-10-07 22:07:49', NULL, '2009-09-16 01:45:17', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cron_tab`
--

CREATE TABLE `cron_tab` (
  `id` int NOT NULL,
  `alias` varchar(255) NOT NULL,
  `last_id` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `cron_tab`
--

INSERT INTO `cron_tab` (`id`, `alias`, `last_id`, `created`, `updated`, `active`) VALUES
(2, 'newsletter', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_acl_phinxlog`
--

CREATE TABLE `croogo_acl_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_acl_phinxlog`
--

INSERT INTO `croogo_acl_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807104926, 'AclInitialMigration', '2019-10-26 14:05:39', '2019-10-26 14:05:39', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_blocks_phinxlog`
--

CREATE TABLE `croogo_blocks_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_blocks_phinxlog`
--

INSERT INTO `croogo_blocks_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807104952, 'BlocksInitialMigration', '2019-10-26 14:05:39', '2019-10-26 14:05:39', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_comments_phinxlog`
--

CREATE TABLE `croogo_comments_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_comments_phinxlog`
--

INSERT INTO `croogo_comments_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105013, 'CommentsInitialMigration', '2019-10-26 14:05:40', '2019-10-26 14:05:40', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_contacts_phinxlog`
--

CREATE TABLE `croogo_contacts_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_contacts_phinxlog`
--

INSERT INTO `croogo_contacts_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105032, 'ContactsInitialMigration', '2019-10-26 14:05:40', '2019-10-26 14:05:40', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_dashboards_phinxlog`
--

CREATE TABLE `croogo_dashboards_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_dashboards_phinxlog`
--

INSERT INTO `croogo_dashboards_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105058, 'DashboardsInitialMigration', '2019-10-26 14:05:40', '2019-10-26 14:05:41', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_extensions_phinxlog`
--

CREATE TABLE `croogo_extensions_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_file_manager_phinxlog`
--

CREATE TABLE `croogo_file_manager_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_menus_phinxlog`
--

CREATE TABLE `croogo_menus_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_menus_phinxlog`
--

INSERT INTO `croogo_menus_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105149, 'MenusInitialMigration', '2019-10-26 14:05:40', '2019-10-26 14:05:40', 0),
(20160807131950, 'UpgradeMenus', '2019-10-26 14:05:40', '2019-10-26 14:05:40', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_meta_phinxlog`
--

CREATE TABLE `croogo_meta_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_meta_phinxlog`
--

INSERT INTO `croogo_meta_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105202, 'MetaInitialMigration', '2019-10-26 14:05:40', '2019-10-26 14:05:40', 0),
(20171120095100, 'MoveSiteMeta', '2019-10-26 14:05:40', '2019-10-26 14:05:40', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_nodes_phinxlog`
--

CREATE TABLE `croogo_nodes_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_nodes_phinxlog`
--

INSERT INTO `croogo_nodes_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105214, 'NodesInitialMigration', '2019-10-26 14:05:40', '2019-10-26 14:05:40', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_settings_phinxlog`
--

CREATE TABLE `croogo_settings_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_settings_phinxlog`
--

INSERT INTO `croogo_settings_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105227, 'SettingsInitialMigration', '2019-10-26 14:05:41', '2019-10-26 14:05:41', 0),
(20171206045454, 'EnlargeLanguagesFields', '2019-10-26 14:05:41', '2019-10-26 14:05:41', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_taxonomy_phinxlog`
--

CREATE TABLE `croogo_taxonomy_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_taxonomy_phinxlog`
--

INSERT INTO `croogo_taxonomy_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105245, 'TaxonomyInitialMigration', '2019-10-26 14:05:39', '2019-10-26 14:05:39', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_translate_phinxlog`
--

CREATE TABLE `croogo_translate_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_translate_phinxlog`
--

INSERT INTO `croogo_translate_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160308182244, 'TranslateInitialMigration', '2019-11-12 19:33:51', '2019-11-12 19:33:51', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_users_phinxlog`
--

CREATE TABLE `croogo_users_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `croogo_users_phinxlog`
--

INSERT INTO `croogo_users_phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160807105314, 'UsersInitialMigration', '2019-10-26 14:05:38', '2019-10-26 14:05:38', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `croogo_wysiwyg_phinxlog`
--

CREATE TABLE `croogo_wysiwyg_phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dashboards`
--

CREATE TABLE `dashboards` (
  `id` int NOT NULL,
  `alias` varchar(50) NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `column` int NOT NULL DEFAULT '0',
  `weight` int NOT NULL DEFAULT '0',
  `collapsed` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `holds`
--

CREATE TABLE `holds` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `period` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `created_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `i18n`
--

CREATE TABLE `i18n` (
  `id` int NOT NULL,
  `locale` varchar(5) NOT NULL,
  `model` varchar(200) NOT NULL,
  `foreign_key` int NOT NULL,
  `field` varchar(255) NOT NULL,
  `content` text,
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `native` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `locale` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `languages`
--

INSERT INTO `languages` (`id`, `title`, `native`, `alias`, `locale`, `status`, `weight`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Afrikaans', '', 'af', 'af', 0, 1, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(2, 'Afrikaans (Namibia)', 'Namibië', 'af', 'af_NA', 0, 2, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(3, 'Afrikaans (South Africa)', 'Suid-Afrika', 'af', 'af_ZA', 0, 3, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(4, 'Aghem', '', 'agq', 'agq', 0, 4, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(5, 'Aghem (Cameroon)', 'Kàmàlûŋ', 'agq', 'agq_CM', 0, 5, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(6, 'Akan', '', 'ak', 'ak', 0, 6, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(7, 'Akan (Ghana)', 'Gaana', 'ak', 'ak_GH', 0, 7, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(8, 'Amharic', '', 'am', 'am', 0, 8, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(9, 'Amharic (Ethiopia)', 'ኢትዮጵያ', 'am', 'am_ET', 0, 9, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(10, 'Arabic', '', 'ar', 'ar', 1, 10, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(11, 'Arabic (World)', 'العالم', 'ar', 'ar_001', 0, 11, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(12, 'Arabic (United Arab Emirates)', 'الإمارات العربية المتحدة', 'ar', 'ar_AE', 0, 12, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(13, 'Arabic (Bahrain)', 'البحرين', 'ar', 'ar_BH', 0, 13, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(14, 'Arabic (Djibouti)', 'جيبوتي', 'ar', 'ar_DJ', 0, 14, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(15, 'Arabic (Algeria)', 'الجزائر', 'ar', 'ar_DZ', 0, 15, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(16, 'Arabic (Egypt)', 'مصر', 'ar', 'ar_EG', 0, 16, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(17, 'Arabic (Western Sahara)', 'الصحراء الغربية', 'ar', 'ar_EH', 0, 17, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(18, 'Arabic (Eritrea)', 'إريتريا', 'ar', 'ar_ER', 0, 18, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(19, 'Arabic (Israel)', 'إسرائيل', 'ar', 'ar_IL', 0, 19, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(20, 'Arabic (Iraq)', 'العراق', 'ar', 'ar_IQ', 0, 20, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(21, 'Arabic (Jordan)', 'الأردن', 'ar', 'ar_JO', 0, 21, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(22, 'Arabic (Comoros)', 'جزر القمر', 'ar', 'ar_KM', 0, 22, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(23, 'Arabic (Kuwait)', 'الكويت', 'ar', 'ar_KW', 0, 23, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(24, 'Arabic (Lebanon)', 'لبنان', 'ar', 'ar_LB', 0, 24, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(25, 'Arabic (Libya)', 'ليبيا', 'ar', 'ar_LY', 0, 25, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(26, 'Arabic (Morocco)', 'المغرب', 'ar', 'ar_MA', 0, 26, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(27, 'Arabic (Mauritania)', 'موريتانيا', 'ar', 'ar_MR', 0, 27, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(28, 'Arabic (Oman)', 'عُمان', 'ar', 'ar_OM', 0, 28, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(29, 'Arabic (Palestinian Territories)', 'الأراضي الفلسطينية', 'ar', 'ar_PS', 0, 29, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(30, 'Arabic (Qatar)', 'قطر', 'ar', 'ar_QA', 0, 30, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(31, 'Arabic (Saudi Arabia)', 'المملكة العربية السعودية', 'ar', 'ar_SA', 0, 31, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(32, 'Arabic (Sudan)', 'السودان', 'ar', 'ar_SD', 0, 32, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(33, 'Arabic (Somalia)', 'الصومال', 'ar', 'ar_SO', 0, 33, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(34, 'Arabic (South Sudan)', 'جنوب السودان', 'ar', 'ar_SS', 0, 34, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(35, 'Arabic (Syria)', 'سوريا', 'ar', 'ar_SY', 0, 35, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(36, 'Arabic (Chad)', 'تشاد', 'ar', 'ar_TD', 0, 36, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(37, 'Arabic (Tunisia)', 'تونس', 'ar', 'ar_TN', 0, 37, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(38, 'Arabic (Yemen)', 'اليمن', 'ar', 'ar_YE', 0, 38, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(39, 'Assamese', '', 'as', 'as', 0, 39, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(40, 'Assamese (India)', 'ভাৰত', 'as', 'as_IN', 0, 40, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(41, 'Asu', '', 'asa', 'asa', 0, 41, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(42, 'Asu (Tanzania)', 'Tadhania', 'asa', 'asa_TZ', 0, 42, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(43, 'Asturian', '', 'ast', 'ast', 0, 43, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(44, 'Asturian (Spain)', 'España', 'ast', 'ast_ES', 0, 44, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(45, 'Azerbaijani', '', 'az', 'az', 0, 45, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(46, 'Azerbaijani (Cyrillic)', '', 'az', 'az_Cyrl', 0, 46, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(47, 'Azerbaijani (Cyrillic, Azerbaijan)', 'Азәрбајҹан', 'az', 'az_Cyrl_AZ', 0, 47, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(48, 'Azerbaijani (Latin)', '', 'az', 'az_Latn', 0, 48, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(49, 'Azerbaijani (Latin, Azerbaijan)', 'Azərbaycan', 'az', 'az_Latn_AZ', 0, 49, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(50, 'Basaa', '', 'bas', 'bas', 0, 50, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(51, 'Basaa (Cameroon)', 'Kàmɛ̀rûn', 'bas', 'bas_CM', 0, 51, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(52, 'Belarusian', '', 'be', 'be', 0, 52, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(53, 'Belarusian (Belarus)', 'Беларусь', 'be', 'be_BY', 0, 53, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(54, 'Bemba', '', 'bem', 'bem', 0, 54, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(55, 'Bemba (Zambia)', 'Zambia', 'bem', 'bem_ZM', 0, 55, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(56, 'Bena', '', 'bez', 'bez', 0, 56, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(57, 'Bena (Tanzania)', 'Hutanzania', 'bez', 'bez_TZ', 0, 57, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(58, 'Bulgarian', '', 'bg', 'bg', 1, 58, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(59, 'Bulgarian (Bulgaria)', 'България', 'bg', 'bg_BG', 0, 59, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(60, 'Bambara', '', 'bm', 'bm', 0, 60, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(61, 'Bambara (Mali)', 'Mali', 'bm', 'bm_ML', 0, 61, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(62, 'Bangla', '', 'bn', 'bn', 0, 62, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(63, 'Bangla (Bangladesh)', 'বাংলাদেশ', 'bn', 'bn_BD', 0, 63, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(64, 'Bangla (India)', 'ভারত', 'bn', 'bn_IN', 0, 64, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(65, 'Tibetan', '', 'bo', 'bo', 0, 65, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(66, 'Tibetan (China)', 'རྒྱ་ནག', 'bo', 'bo_CN', 0, 66, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(67, 'Tibetan (India)', 'རྒྱ་གར་', 'bo', 'bo_IN', 0, 67, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(68, 'Breton', '', 'br', 'br', 0, 68, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(69, 'Breton (France)', 'Frañs', 'br', 'br_FR', 0, 69, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(70, 'Bodo', '', 'brx', 'brx', 0, 70, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(71, 'Bodo (India)', 'भारत', 'brx', 'brx_IN', 0, 71, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(72, 'Bosnian', '', 'bs', 'bs', 0, 72, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(73, 'Bosnian (Cyrillic)', '', 'bs', 'bs_Cyrl', 0, 73, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(74, 'Bosnian (Cyrillic, Bosnia & Herzegovina)', 'Босна и Херцеговина', 'bs', 'bs_Cyrl_BA', 0, 74, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(75, 'Bosnian (Latin)', '', 'bs', 'bs_Latn', 0, 75, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(76, 'Bosnian (Latin, Bosnia & Herzegovina)', 'Bosna i Hercegovina', 'bs', 'bs_Latn_BA', 0, 76, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(77, 'Catalan', '', 'ca', 'ca', 0, 77, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(78, 'Catalan (Andorra)', 'Andorra', 'ca', 'ca_AD', 0, 78, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(79, 'Catalan (Spain)', 'Espanya', 'ca', 'ca_ES', 0, 79, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(80, 'Catalan (France)', 'França', 'ca', 'ca_FR', 0, 80, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(81, 'Catalan (Italy)', 'Itàlia', 'ca', 'ca_IT', 0, 81, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(82, 'Chakma', '', 'ccp', 'ccp', 0, 82, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(83, 'Chechen', '', 'ce', 'ce', 0, 85, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(84, 'Chechen (Russia)', 'Росси', 'ce', 'ce_RU', 0, 86, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(85, 'Cebuano', '', 'ceb', 'ceb', 0, 87, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(86, 'Cebuano (Philippines)', 'Pilipinas', 'ceb', 'ceb_PH', 0, 88, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(87, 'Chiga', '', 'cgg', 'cgg', 0, 89, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(88, 'Chiga (Uganda)', 'Uganda', 'cgg', 'cgg_UG', 0, 90, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(89, 'Cherokee', '', 'chr', 'chr', 0, 91, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(90, 'Cherokee (United States)', 'ᏌᏊ ᎢᏳᎾᎵᏍᏔᏅ ᏍᎦᏚᎩ', 'chr', 'chr_US', 0, 92, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(91, 'Central Kurdish', '', 'ckb', 'ckb', 0, 93, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(92, 'Central Kurdish (Iraq)', 'عێراق', 'ckb', 'ckb_IQ', 0, 94, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(93, 'Central Kurdish (Iran)', 'ئێران', 'ckb', 'ckb_IR', 0, 95, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(94, 'Czech', '', 'cs', 'cs', 1, 96, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(95, 'Czech (Czechia)', 'Česko', 'cs', 'cs_CZ', 0, 97, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(96, 'Welsh', '', 'cy', 'cy', 0, 98, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(97, 'Welsh (United Kingdom)', 'Y Deyrnas Unedig', 'cy', 'cy_GB', 0, 99, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(98, 'Danish', '', 'da', 'da', 0, 100, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(99, 'Danish (Denmark)', 'Danmark', 'da', 'da_DK', 0, 101, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(100, 'Danish (Greenland)', 'Grønland', 'da', 'da_GL', 0, 102, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(101, 'Taita', '', 'dav', 'dav', 0, 103, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(102, 'Taita (Kenya)', 'Kenya', 'dav', 'dav_KE', 0, 104, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(103, 'German', '', 'de', 'de', 1, 105, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(104, 'German (Austria)', 'Österreich', 'de', 'de_AT', 0, 106, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(105, 'German (Belgium)', 'Belgien', 'de', 'de_BE', 0, 107, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(106, 'German (Switzerland)', 'Schweiz', 'de', 'de_CH', 0, 108, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(107, 'German (Germany)', 'Deutschland', 'de', 'de_DE', 0, 109, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(108, 'German (Italy)', 'Italien', 'de', 'de_IT', 0, 110, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(109, 'German (Liechtenstein)', 'Liechtenstein', 'de', 'de_LI', 0, 111, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(110, 'German (Luxembourg)', 'Luxemburg', 'de', 'de_LU', 0, 112, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(111, 'Zarma', '', 'dje', 'dje', 0, 113, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(112, 'Zarma (Niger)', 'Nižer', 'dje', 'dje_NE', 0, 114, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(113, 'Lower Sorbian', '', 'dsb', 'dsb', 0, 115, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(114, 'Lower Sorbian (Germany)', 'Nimska', 'dsb', 'dsb_DE', 0, 116, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(115, 'Duala', '', 'dua', 'dua', 0, 117, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(116, 'Duala (Cameroon)', 'Cameroun', 'dua', 'dua_CM', 0, 118, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(117, 'Jola-Fonyi', '', 'dyo', 'dyo', 0, 119, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(118, 'Jola-Fonyi (Senegal)', 'Senegal', 'dyo', 'dyo_SN', 0, 120, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(119, 'Dzongkha', '', 'dz', 'dz', 0, 121, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(120, 'Dzongkha (Bhutan)', 'འབྲུག', 'dz', 'dz_BT', 0, 122, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(121, 'Embu', '', 'ebu', 'ebu', 0, 123, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(122, 'Embu (Kenya)', 'Kenya', 'ebu', 'ebu_KE', 0, 124, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(123, 'Ewe', '', 'ee', 'ee', 0, 125, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(124, 'Ewe (Ghana)', 'Ghana nutome', 'ee', 'ee_GH', 0, 126, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(125, 'Ewe (Togo)', 'Togo nutome', 'ee', 'ee_TG', 0, 127, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(126, 'Greek', '', 'el', 'el', 1, 128, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(127, 'Greek (Cyprus)', 'Κύπρος', 'el', 'el_CY', 0, 129, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(128, 'Greek (Greece)', 'Ελλάδα', 'el', 'el_GR', 0, 130, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(129, 'English', '', 'en', 'en', 1, 131, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(130, 'English (World)', 'World', 'en', 'en_001', 0, 132, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(131, 'English (Europe)', 'Europe', 'en', 'en_150', 0, 133, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(132, 'English (United Arab Emirates)', 'United Arab Emirates', 'en', 'en_AE', 0, 134, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(133, 'English (Antigua & Barbuda)', 'Antigua & Barbuda', 'en', 'en_AG', 0, 135, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(134, 'English (Anguilla)', 'Anguilla', 'en', 'en_AI', 0, 136, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(135, 'English (American Samoa)', 'American Samoa', 'en', 'en_AS', 0, 137, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(136, 'English (Austria)', 'Austria', 'en', 'en_AT', 0, 138, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(137, 'English (Australia)', 'Australia', 'en', 'en_AU', 0, 139, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(138, 'English (Barbados)', 'Barbados', 'en', 'en_BB', 0, 140, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(139, 'English (Belgium)', 'Belgium', 'en', 'en_BE', 0, 141, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(140, 'English (Burundi)', 'Burundi', 'en', 'en_BI', 0, 142, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(141, 'English (Bermuda)', 'Bermuda', 'en', 'en_BM', 0, 143, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(142, 'English (Bahamas)', 'Bahamas', 'en', 'en_BS', 0, 144, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(143, 'English (Botswana)', 'Botswana', 'en', 'en_BW', 0, 145, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(144, 'English (Belize)', 'Belize', 'en', 'en_BZ', 0, 146, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(145, 'English (Canada)', 'Canada', 'en', 'en_CA', 0, 147, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(146, 'English (Cocos [Keeling] Islands)', 'Cocos (Keeling) Islands', 'en', 'en_CC', 0, 148, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(147, 'English (Switzerland)', 'Switzerland', 'en', 'en_CH', 0, 149, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(148, 'English (Cook Islands)', 'Cook Islands', 'en', 'en_CK', 0, 150, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(149, 'English (Cameroon)', 'Cameroon', 'en', 'en_CM', 0, 151, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(150, 'English (Christmas Island)', 'Christmas Island', 'en', 'en_CX', 0, 152, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(151, 'English (Cyprus)', 'Cyprus', 'en', 'en_CY', 0, 153, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(152, 'English (Germany)', 'Germany', 'en', 'en_DE', 0, 154, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(153, 'English (Diego Garcia)', 'Diego Garcia', 'en', 'en_DG', 0, 155, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(154, 'English (Denmark)', 'Denmark', 'en', 'en_DK', 0, 156, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(155, 'English (Dominica)', 'Dominica', 'en', 'en_DM', 0, 157, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(156, 'English (Eritrea)', 'Eritrea', 'en', 'en_ER', 0, 158, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(157, 'English (Finland)', 'Finland', 'en', 'en_FI', 0, 159, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(158, 'English (Fiji)', 'Fiji', 'en', 'en_FJ', 0, 160, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(159, 'English (Falkland Islands)', 'Falkland Islands', 'en', 'en_FK', 0, 161, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(160, 'English (Micronesia)', 'Micronesia', 'en', 'en_FM', 0, 162, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(161, 'English (United Kingdom)', 'United Kingdom', 'en', 'en_GB', 0, 163, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(162, 'English (Grenada)', 'Grenada', 'en', 'en_GD', 0, 164, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(163, 'English (Guernsey)', 'Guernsey', 'en', 'en_GG', 0, 165, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(164, 'English (Ghana)', 'Ghana', 'en', 'en_GH', 0, 166, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(165, 'English (Gibraltar)', 'Gibraltar', 'en', 'en_GI', 0, 167, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(166, 'English (Gambia)', 'Gambia', 'en', 'en_GM', 0, 168, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(167, 'English (Guam)', 'Guam', 'en', 'en_GU', 0, 169, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(168, 'English (Guyana)', 'Guyana', 'en', 'en_GY', 0, 170, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(169, 'English (Hong Kong SAR China)', 'Hong Kong SAR China', 'en', 'en_HK', 0, 171, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(170, 'English (Ireland)', 'Ireland', 'en', 'en_IE', 0, 172, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(171, 'English (Israel)', 'Israel', 'en', 'en_IL', 0, 173, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(172, 'English (Isle of Man)', 'Isle of Man', 'en', 'en_IM', 0, 174, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(173, 'English (India)', 'India', 'en', 'en_IN', 0, 175, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(174, 'English (British Indian Ocean Territory)', 'British Indian Ocean Territory', 'en', 'en_IO', 0, 176, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(175, 'English (Jersey)', 'Jersey', 'en', 'en_JE', 0, 177, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(176, 'English (Jamaica)', 'Jamaica', 'en', 'en_JM', 0, 178, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(177, 'English (Kenya)', 'Kenya', 'en', 'en_KE', 0, 179, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(178, 'English (Kiribati)', 'Kiribati', 'en', 'en_KI', 0, 180, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(179, 'English (St. Kitts & Nevis)', 'St. Kitts & Nevis', 'en', 'en_KN', 0, 181, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(180, 'English (Cayman Islands)', 'Cayman Islands', 'en', 'en_KY', 0, 182, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(181, 'English (St. Lucia)', 'St. Lucia', 'en', 'en_LC', 0, 183, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(182, 'English (Liberia)', 'Liberia', 'en', 'en_LR', 0, 184, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(183, 'English (Lesotho)', 'Lesotho', 'en', 'en_LS', 0, 185, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(184, 'English (Madagascar)', 'Madagascar', 'en', 'en_MG', 0, 186, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(185, 'English (Marshall Islands)', 'Marshall Islands', 'en', 'en_MH', 0, 187, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(186, 'English (Macao SAR China)', 'Macao SAR China', 'en', 'en_MO', 0, 188, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(187, 'English (Northern Mariana Islands)', 'Northern Mariana Islands', 'en', 'en_MP', 0, 189, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(188, 'English (Montserrat)', 'Montserrat', 'en', 'en_MS', 0, 190, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(189, 'English (Malta)', 'Malta', 'en', 'en_MT', 0, 191, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(190, 'English (Mauritius)', 'Mauritius', 'en', 'en_MU', 0, 192, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(191, 'English (Malawi)', 'Malawi', 'en', 'en_MW', 0, 193, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(192, 'English (Malaysia)', 'Malaysia', 'en', 'en_MY', 0, 194, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(193, 'English (Namibia)', 'Namibia', 'en', 'en_NA', 0, 195, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(194, 'English (Norfolk Island)', 'Norfolk Island', 'en', 'en_NF', 0, 196, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(195, 'English (Nigeria)', 'Nigeria', 'en', 'en_NG', 0, 197, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(196, 'English (Netherlands)', 'Netherlands', 'en', 'en_NL', 0, 198, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(197, 'English (Nauru)', 'Nauru', 'en', 'en_NR', 0, 199, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(198, 'English (Niue)', 'Niue', 'en', 'en_NU', 0, 200, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(199, 'English (New Zealand)', 'New Zealand', 'en', 'en_NZ', 0, 201, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(200, 'English (Papua New Guinea)', 'Papua New Guinea', 'en', 'en_PG', 0, 202, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(201, 'English (Philippines)', 'Philippines', 'en', 'en_PH', 0, 203, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(202, 'English (Pakistan)', 'Pakistan', 'en', 'en_PK', 0, 204, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(203, 'English (Pitcairn Islands)', 'Pitcairn Islands', 'en', 'en_PN', 0, 205, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(204, 'English (Puerto Rico)', 'Puerto Rico', 'en', 'en_PR', 0, 206, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(205, 'English (Palau)', 'Palau', 'en', 'en_PW', 0, 207, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(206, 'English (Rwanda)', 'Rwanda', 'en', 'en_RW', 0, 208, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(207, 'English (Solomon Islands)', 'Solomon Islands', 'en', 'en_SB', 0, 209, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(208, 'English (Seychelles)', 'Seychelles', 'en', 'en_SC', 0, 210, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(209, 'English (Sudan)', 'Sudan', 'en', 'en_SD', 0, 211, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(210, 'English (Sweden)', 'Sweden', 'en', 'en_SE', 0, 212, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(211, 'English (Singapore)', 'Singapore', 'en', 'en_SG', 0, 213, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(212, 'English (St. Helena)', 'St. Helena', 'en', 'en_SH', 0, 214, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(213, 'English (Slovenia)', 'Slovenia', 'en', 'en_SI', 0, 215, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(214, 'English (Sierra Leone)', 'Sierra Leone', 'en', 'en_SL', 0, 216, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(215, 'English (South Sudan)', 'South Sudan', 'en', 'en_SS', 0, 217, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(216, 'English (Sint Maarten)', 'Sint Maarten', 'en', 'en_SX', 0, 218, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(217, 'English (Eswatini)', 'Eswatini', 'en', 'en_SZ', 0, 219, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(218, 'English (Turks & Caicos Islands)', 'Turks & Caicos Islands', 'en', 'en_TC', 0, 220, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(219, 'English (Tokelau)', 'Tokelau', 'en', 'en_TK', 0, 221, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(220, 'English (Tonga)', 'Tonga', 'en', 'en_TO', 0, 222, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(221, 'English (Trinidad & Tobago)', 'Trinidad & Tobago', 'en', 'en_TT', 0, 223, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(222, 'English (Tuvalu)', 'Tuvalu', 'en', 'en_TV', 0, 224, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(223, 'English (Tanzania)', 'Tanzania', 'en', 'en_TZ', 0, 225, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(224, 'English (Uganda)', 'Uganda', 'en', 'en_UG', 0, 226, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(225, 'English (U.S. Outlying Islands)', 'U.S. Outlying Islands', 'en', 'en_UM', 0, 227, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(226, 'English (United States)', 'United States', 'en', 'en_US', 0, 228, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(227, 'English (United States, Computer)', 'United States', 'en', 'en_US_POSIX', 0, 229, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(228, 'English (St. Vincent & Grenadines)', 'St. Vincent & Grenadines', 'en', 'en_VC', 0, 230, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(229, 'English (British Virgin Islands)', 'British Virgin Islands', 'en', 'en_VG', 0, 231, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(230, 'English (U.S. Virgin Islands)', 'U.S. Virgin Islands', 'en', 'en_VI', 0, 232, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(231, 'English (Vanuatu)', 'Vanuatu', 'en', 'en_VU', 0, 233, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(232, 'English (Samoa)', 'Samoa', 'en', 'en_WS', 0, 234, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(233, 'English (South Africa)', 'South Africa', 'en', 'en_ZA', 0, 235, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(234, 'English (Zambia)', 'Zambia', 'en', 'en_ZM', 0, 236, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(235, 'English (Zimbabwe)', 'Zimbabwe', 'en', 'en_ZW', 0, 237, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(236, 'Esperanto', '', 'eo', 'eo', 0, 238, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(237, 'Esperanto (World)', 'Mondo', 'eo', 'eo_001', 0, 239, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(238, 'Spanish', '', 'es', 'es', 1, 240, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(239, 'Spanish (Latin America)', 'Latinoamérica', 'es', 'es_419', 0, 241, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(240, 'Spanish (Argentina)', 'Argentina', 'es', 'es_AR', 0, 242, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(241, 'Spanish (Bolivia)', 'Bolivia', 'es', 'es_BO', 0, 243, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(242, 'Spanish (Brazil)', 'Brasil', 'es', 'es_BR', 0, 244, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(243, 'Spanish (Belize)', 'Belice', 'es', 'es_BZ', 0, 245, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(244, 'Spanish (Chile)', 'Chile', 'es', 'es_CL', 0, 246, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(245, 'Spanish (Colombia)', 'Colombia', 'es', 'es_CO', 0, 247, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(246, 'Spanish (Costa Rica)', 'Costa Rica', 'es', 'es_CR', 0, 248, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(247, 'Spanish (Cuba)', 'Cuba', 'es', 'es_CU', 0, 249, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(248, 'Spanish (Dominican Republic)', 'República Dominicana', 'es', 'es_DO', 0, 250, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(249, 'Spanish (Ceuta & Melilla)', 'Ceuta y Melilla', 'es', 'es_EA', 0, 251, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(250, 'Spanish (Ecuador)', 'Ecuador', 'es', 'es_EC', 0, 252, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(251, 'Spanish (Spain)', 'España', 'es', 'es_ES', 0, 253, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(252, 'Spanish (Equatorial Guinea)', 'Guinea Ecuatorial', 'es', 'es_GQ', 0, 254, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(253, 'Spanish (Guatemala)', 'Guatemala', 'es', 'es_GT', 0, 255, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(254, 'Spanish (Honduras)', 'Honduras', 'es', 'es_HN', 0, 256, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(255, 'Spanish (Canary Islands)', 'Canarias', 'es', 'es_IC', 0, 257, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(256, 'Spanish (Mexico)', 'México', 'es', 'es_MX', 0, 258, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(257, 'Spanish (Nicaragua)', 'Nicaragua', 'es', 'es_NI', 0, 259, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(258, 'Spanish (Panama)', 'Panamá', 'es', 'es_PA', 0, 260, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(259, 'Spanish (Peru)', 'Perú', 'es', 'es_PE', 0, 261, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(260, 'Spanish (Philippines)', 'Filipinas', 'es', 'es_PH', 0, 262, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(261, 'Spanish (Puerto Rico)', 'Puerto Rico', 'es', 'es_PR', 0, 263, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(262, 'Spanish (Paraguay)', 'Paraguay', 'es', 'es_PY', 0, 264, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(263, 'Spanish (El Salvador)', 'El Salvador', 'es', 'es_SV', 0, 265, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(264, 'Spanish (United States)', 'Estados Unidos', 'es', 'es_US', 0, 266, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(265, 'Spanish (Uruguay)', 'Uruguay', 'es', 'es_UY', 0, 267, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(266, 'Spanish (Venezuela)', 'Venezuela', 'es', 'es_VE', 0, 268, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(267, 'Estonian', '', 'et', 'et', 0, 269, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(268, 'Estonian (Estonia)', 'Eesti', 'et', 'et_EE', 0, 270, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(269, 'Basque', '', 'eu', 'eu', 0, 271, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(270, 'Basque (Spain)', 'Espainia', 'eu', 'eu_ES', 0, 272, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(271, 'Ewondo', '', 'ewo', 'ewo', 0, 273, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(272, 'Ewondo (Cameroon)', 'Kamərún', 'ewo', 'ewo_CM', 0, 274, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(273, 'Persian', '', 'fa', 'fa', 1, 275, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(274, 'Persian (Afghanistan)', 'افغانستان', 'fa', 'fa_AF', 0, 276, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(275, 'Persian (Iran)', 'ایران', 'fa', 'fa_IR', 0, 277, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(276, 'Fulah', '', 'ff', 'ff', 0, 278, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(277, 'Fulah (Latin)', '', 'ff', 'ff_Latn', 0, 279, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(278, 'Fulah (Latin, Burkina Faso)', 'Burkibaa Faaso', 'ff', 'ff_Latn_BF', 0, 280, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(279, 'Fulah (Latin, Cameroon)', 'Kameruun', 'ff', 'ff_Latn_CM', 0, 281, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(280, 'Fulah (Latin, Ghana)', 'Ganaa', 'ff', 'ff_Latn_GH', 0, 282, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(281, 'Fulah (Latin, Gambia)', 'Gammbi', 'ff', 'ff_Latn_GM', 0, 283, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(282, 'Fulah (Latin, Guinea)', 'Gine', 'ff', 'ff_Latn_GN', 0, 284, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(283, 'Fulah (Latin, Guinea-Bissau)', 'Gine-Bisaawo', 'ff', 'ff_Latn_GW', 0, 285, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(284, 'Fulah (Latin, Liberia)', 'Liberiyaa', 'ff', 'ff_Latn_LR', 0, 286, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(285, 'Fulah (Latin, Mauritania)', 'Muritani', 'ff', 'ff_Latn_MR', 0, 287, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(286, 'Fulah (Latin, Niger)', 'Nijeer', 'ff', 'ff_Latn_NE', 0, 288, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(287, 'Fulah (Latin, Nigeria)', 'Nijeriyaa', 'ff', 'ff_Latn_NG', 0, 289, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(288, 'Fulah (Latin, Sierra Leone)', 'Seraa liyon', 'ff', 'ff_Latn_SL', 0, 290, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(289, 'Fulah (Latin, Senegal)', 'Senegaal', 'ff', 'ff_Latn_SN', 0, 291, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(290, 'Finnish', '', 'fi', 'fi', 0, 292, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(291, 'Finnish (Finland)', 'Suomi', 'fi', 'fi_FI', 0, 293, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(292, 'Filipino', '', 'fil', 'fil', 0, 294, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(293, 'Filipino (Philippines)', 'Pilipinas', 'fil', 'fil_PH', 0, 295, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(294, 'Faroese', '', 'fo', 'fo', 0, 296, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(295, 'Faroese (Denmark)', 'Danmark', 'fo', 'fo_DK', 0, 297, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(296, 'Faroese (Faroe Islands)', 'Føroyar', 'fo', 'fo_FO', 0, 298, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(297, 'French', '', 'fr', 'fr', 1, 299, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(298, 'French (Belgium)', 'Belgique', 'fr', 'fr_BE', 0, 300, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(299, 'French (Burkina Faso)', 'Burkina Faso', 'fr', 'fr_BF', 0, 301, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(300, 'French (Burundi)', 'Burundi', 'fr', 'fr_BI', 0, 302, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(301, 'French (Benin)', 'Bénin', 'fr', 'fr_BJ', 0, 303, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(302, 'French (St. Barthélemy)', 'Saint-Barthélemy', 'fr', 'fr_BL', 0, 304, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(303, 'French (Canada)', 'Canada', 'fr', 'fr_CA', 0, 305, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(304, 'French (Congo - Kinshasa)', 'Congo-Kinshasa', 'fr', 'fr_CD', 0, 306, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(305, 'French (Central African Republic)', 'République centrafricaine', 'fr', 'fr_CF', 0, 307, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(306, 'French (Congo - Brazzaville)', 'Congo-Brazzaville', 'fr', 'fr_CG', 0, 308, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(307, 'French (Switzerland)', 'Suisse', 'fr', 'fr_CH', 0, 309, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(308, 'French (Côte d’Ivoire)', 'Côte d’Ivoire', 'fr', 'fr_CI', 0, 310, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(309, 'French (Cameroon)', 'Cameroun', 'fr', 'fr_CM', 0, 311, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(310, 'French (Djibouti)', 'Djibouti', 'fr', 'fr_DJ', 0, 312, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(311, 'French (Algeria)', 'Algérie', 'fr', 'fr_DZ', 0, 313, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(312, 'French (France)', 'France', 'fr', 'fr_FR', 0, 314, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(313, 'French (Gabon)', 'Gabon', 'fr', 'fr_GA', 0, 315, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(314, 'French (French Guiana)', 'Guyane française', 'fr', 'fr_GF', 0, 316, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(315, 'French (Guinea)', 'Guinée', 'fr', 'fr_GN', 0, 317, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(316, 'French (Guadeloupe)', 'Guadeloupe', 'fr', 'fr_GP', 0, 318, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(317, 'French (Equatorial Guinea)', 'Guinée équatoriale', 'fr', 'fr_GQ', 0, 319, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(318, 'French (Haiti)', 'Haïti', 'fr', 'fr_HT', 0, 320, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(319, 'French (Comoros)', 'Comores', 'fr', 'fr_KM', 0, 321, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(320, 'French (Luxembourg)', 'Luxembourg', 'fr', 'fr_LU', 0, 322, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(321, 'French (Morocco)', 'Maroc', 'fr', 'fr_MA', 0, 323, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(322, 'French (Monaco)', 'Monaco', 'fr', 'fr_MC', 0, 324, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(323, 'French (St. Martin)', 'Saint-Martin', 'fr', 'fr_MF', 0, 325, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(324, 'French (Madagascar)', 'Madagascar', 'fr', 'fr_MG', 0, 326, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(325, 'French (Mali)', 'Mali', 'fr', 'fr_ML', 0, 327, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(326, 'French (Martinique)', 'Martinique', 'fr', 'fr_MQ', 0, 328, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(327, 'French (Mauritania)', 'Mauritanie', 'fr', 'fr_MR', 0, 329, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(328, 'French (Mauritius)', 'Maurice', 'fr', 'fr_MU', 0, 330, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(329, 'French (New Caledonia)', 'Nouvelle-Calédonie', 'fr', 'fr_NC', 0, 331, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(330, 'French (Niger)', 'Niger', 'fr', 'fr_NE', 0, 332, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(331, 'French (French Polynesia)', 'Polynésie française', 'fr', 'fr_PF', 0, 333, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(332, 'French (St. Pierre & Miquelon)', 'Saint-Pierre-et-Miquelon', 'fr', 'fr_PM', 0, 334, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(333, 'French (Réunion)', 'La Réunion', 'fr', 'fr_RE', 0, 335, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(334, 'French (Rwanda)', 'Rwanda', 'fr', 'fr_RW', 0, 336, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(335, 'French (Seychelles)', 'Seychelles', 'fr', 'fr_SC', 0, 337, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(336, 'French (Senegal)', 'Sénégal', 'fr', 'fr_SN', 0, 338, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(337, 'French (Syria)', 'Syrie', 'fr', 'fr_SY', 0, 339, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(338, 'French (Chad)', 'Tchad', 'fr', 'fr_TD', 0, 340, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(339, 'French (Togo)', 'Togo', 'fr', 'fr_TG', 0, 341, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(340, 'French (Tunisia)', 'Tunisie', 'fr', 'fr_TN', 0, 342, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(341, 'French (Vanuatu)', 'Vanuatu', 'fr', 'fr_VU', 0, 343, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(342, 'French (Wallis & Futuna)', 'Wallis-et-Futuna', 'fr', 'fr_WF', 0, 344, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(343, 'French (Mayotte)', 'Mayotte', 'fr', 'fr_YT', 0, 345, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(344, 'Friulian', '', 'fur', 'fur', 0, 346, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(345, 'Friulian (Italy)', 'Italie', 'fur', 'fur_IT', 0, 347, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(346, 'Western Frisian', '', 'fy', 'fy', 0, 348, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(347, 'Western Frisian (Netherlands)', 'Nederlân', 'fy', 'fy_NL', 0, 349, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(348, 'Irish', '', 'ga', 'ga', 0, 350, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(349, 'Irish (Ireland)', 'Éire', 'ga', 'ga_IE', 0, 351, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(350, 'Scottish Gaelic', '', 'gd', 'gd', 0, 352, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(351, 'Scottish Gaelic (United Kingdom)', 'An Rìoghachd Aonaichte', 'gd', 'gd_GB', 0, 353, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(352, 'Galician', '', 'gl', 'gl', 0, 354, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(353, 'Galician (Spain)', 'España', 'gl', 'gl_ES', 0, 355, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(354, 'Swiss German', '', 'gsw', 'gsw', 0, 356, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(355, 'Swiss German (Switzerland)', 'Schwiiz', 'gsw', 'gsw_CH', 0, 357, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(356, 'Swiss German (France)', 'Frankriich', 'gsw', 'gsw_FR', 0, 358, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(357, 'Swiss German (Liechtenstein)', 'Liächteschtäi', 'gsw', 'gsw_LI', 0, 359, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(358, 'Gujarati', '', 'gu', 'gu', 0, 360, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(359, 'Gujarati (India)', 'ભારત', 'gu', 'gu_IN', 0, 361, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(360, 'Gusii', '', 'guz', 'guz', 0, 362, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(361, 'Gusii (Kenya)', 'Kenya', 'guz', 'guz_KE', 0, 363, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(362, 'Manx', '', 'gv', 'gv', 0, 364, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(363, 'Manx (Isle of Man)', 'Ellan Vannin', 'gv', 'gv_IM', 0, 365, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(364, 'Hausa', '', 'ha', 'ha', 0, 366, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(365, 'Hausa (Ghana)', 'Gana', 'ha', 'ha_GH', 0, 367, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(366, 'Hausa (Niger)', 'Nijar', 'ha', 'ha_NE', 0, 368, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(367, 'Hausa (Nigeria)', 'Najeriya', 'ha', 'ha_NG', 0, 369, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(368, 'Hawaiian', '', 'haw', 'haw', 0, 370, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(369, 'Hawaiian (United States)', 'ʻAmelika Hui Pū ʻIa', 'haw', 'haw_US', 0, 371, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(370, 'Hebrew', '', 'he', 'he', 0, 372, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(371, 'Hebrew (Israel)', 'ישראל', 'he', 'he_IL', 0, 373, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(372, 'Hindi', '', 'hi', 'hi', 0, 374, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(373, 'Hindi (India)', 'भारत', 'hi', 'hi_IN', 0, 375, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(374, 'Croatian', '', 'hr', 'hr', 0, 376, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(375, 'Croatian (Bosnia & Herzegovina)', 'Bosna i Hercegovina', 'hr', 'hr_BA', 0, 377, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(376, 'Croatian (Croatia)', 'Hrvatska', 'hr', 'hr_HR', 0, 378, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(377, 'Upper Sorbian', '', 'hsb', 'hsb', 0, 379, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(378, 'Upper Sorbian (Germany)', 'Němska', 'hsb', 'hsb_DE', 0, 380, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(379, 'Hungarian', '', 'hu', 'hu', 1, 381, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(380, 'Hungarian (Hungary)', 'Magyarország', 'hu', 'hu_HU', 0, 382, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(381, 'Armenian', '', 'hy', 'hy', 0, 383, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(382, 'Armenian (Armenia)', 'Հայաստան', 'hy', 'hy_AM', 0, 384, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(383, 'Interlingua', '', 'ia', 'ia', 0, 385, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(384, 'Interlingua (World)', 'Mundo', 'ia', 'ia_001', 0, 386, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(385, 'Indonesian', '', 'id', 'id', 1, 387, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(386, 'Indonesian (Indonesia)', 'Indonesia', 'id', 'id_ID', 0, 388, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(387, 'Igbo', '', 'ig', 'ig', 0, 389, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(388, 'Igbo (Nigeria)', 'Naịjịrịa', 'ig', 'ig_NG', 0, 390, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(389, 'Sichuan Yi', '', 'ii', 'ii', 0, 391, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(390, 'Sichuan Yi (China)', 'ꍏꇩ', 'ii', 'ii_CN', 0, 392, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(391, 'Icelandic', '', 'is', 'is', 0, 393, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(392, 'Icelandic (Iceland)', 'Ísland', 'is', 'is_IS', 0, 394, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(393, 'Italian', '', 'it', 'it', 1, 395, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(394, 'Italian (Switzerland)', 'Svizzera', 'it', 'it_CH', 0, 396, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(395, 'Italian (Italy)', 'Italia', 'it', 'it_IT', 0, 397, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(396, 'Italian (San Marino)', 'San Marino', 'it', 'it_SM', 0, 398, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(397, 'Italian (Vatican City)', 'Città del Vaticano', 'it', 'it_VA', 0, 399, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(398, 'Japanese', '', 'ja', 'ja', 1, 400, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(399, 'Japanese (Japan)', '日本', 'ja', 'ja_JP', 0, 401, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(400, 'Ngomba', '', 'jgo', 'jgo', 0, 402, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(401, 'Ngomba (Cameroon)', 'Kamɛlûn', 'jgo', 'jgo_CM', 0, 403, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(402, 'Machame', '', 'jmc', 'jmc', 0, 404, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(403, 'Machame (Tanzania)', 'Tanzania', 'jmc', 'jmc_TZ', 0, 405, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(404, 'Javanese', '', 'jv', 'jv', 0, 406, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(405, 'Javanese (Indonesia)', 'Indonésia', 'jv', 'jv_ID', 0, 407, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(406, 'Georgian', '', 'ka', 'ka', 0, 408, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(407, 'Georgian (Georgia)', 'საქართველო', 'ka', 'ka_GE', 0, 409, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(408, 'Kabyle', '', 'kab', 'kab', 0, 410, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(409, 'Kabyle (Algeria)', 'Lezzayer', 'kab', 'kab_DZ', 0, 411, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(410, 'Kamba', '', 'kam', 'kam', 0, 412, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(411, 'Kamba (Kenya)', 'Kenya', 'kam', 'kam_KE', 0, 413, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(412, 'Makonde', '', 'kde', 'kde', 0, 414, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(413, 'Makonde (Tanzania)', 'Tanzania', 'kde', 'kde_TZ', 0, 415, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(414, 'Kabuverdianu', '', 'kea', 'kea', 0, 416, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(415, 'Kabuverdianu (Cape Verde)', 'Kabu Verdi', 'kea', 'kea_CV', 0, 417, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(416, 'Koyra Chiini', '', 'khq', 'khq', 0, 418, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(417, 'Koyra Chiini (Mali)', 'Maali', 'khq', 'khq_ML', 0, 419, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(418, 'Kikuyu', '', 'ki', 'ki', 0, 420, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(419, 'Kikuyu (Kenya)', 'Kenya', 'ki', 'ki_KE', 0, 421, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(420, 'Kazakh', '', 'kk', 'kk', 0, 422, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(421, 'Kazakh (Kazakhstan)', 'Қазақстан', 'kk', 'kk_KZ', 0, 423, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(422, 'Kako', '', 'kkj', 'kkj', 0, 424, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(423, 'Kako (Cameroon)', 'Kamɛrun', 'kkj', 'kkj_CM', 0, 425, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(424, 'Kalaallisut', '', 'kl', 'kl', 0, 426, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(425, 'Kalaallisut (Greenland)', 'Kalaallit Nunaat', 'kl', 'kl_GL', 0, 427, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(426, 'Kalenjin', '', 'kln', 'kln', 0, 428, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL);
INSERT INTO `languages` (`id`, `title`, `native`, `alias`, `locale`, `status`, `weight`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(427, 'Kalenjin (Kenya)', 'Emetab Kenya', 'kln', 'kln_KE', 0, 429, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(428, 'Khmer', '', 'km', 'km', 0, 430, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(429, 'Khmer (Cambodia)', 'កម្ពុជា', 'km', 'km_KH', 0, 431, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(430, 'Kannada', '', 'kn', 'kn', 0, 432, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(431, 'Kannada (India)', 'ಭಾರತ', 'kn', 'kn_IN', 0, 433, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(432, 'Korean', '', 'ko', 'ko', 0, 434, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(433, 'Korean (North Korea)', '조선민주주의인민공화국', 'ko', 'ko_KP', 0, 435, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(434, 'Korean (South Korea)', '대한민국', 'ko', 'ko_KR', 0, 436, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(435, 'Konkani', '', 'kok', 'kok', 0, 437, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(436, 'Konkani (India)', 'भारत', 'kok', 'kok_IN', 0, 438, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(437, 'Kashmiri', '', 'ks', 'ks', 0, 439, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(438, 'Kashmiri (India)', 'ہِندوستان', 'ks', 'ks_IN', 0, 440, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(439, 'Shambala', '', 'ksb', 'ksb', 0, 441, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(440, 'Shambala (Tanzania)', 'Tanzania', 'ksb', 'ksb_TZ', 0, 442, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(441, 'Bafia', '', 'ksf', 'ksf', 0, 443, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(442, 'Bafia (Cameroon)', 'kamɛrún', 'ksf', 'ksf_CM', 0, 444, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(443, 'Colognian', '', 'ksh', 'ksh', 0, 445, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(444, 'Colognian (Germany)', 'Doütschland', 'ksh', 'ksh_DE', 0, 446, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(445, 'Kurdish', '', 'ku', 'ku', 0, 447, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(446, 'Kurdish (Turkey)', 'Tirkiye', 'ku', 'ku_TR', 0, 448, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(447, 'Cornish', '', 'kw', 'kw', 0, 449, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(448, 'Cornish (United Kingdom)', 'Rywvaneth Unys', 'kw', 'kw_GB', 0, 450, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(449, 'Kyrgyz', '', 'ky', 'ky', 0, 451, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(450, 'Kyrgyz (Kyrgyzstan)', 'Кыргызстан', 'ky', 'ky_KG', 0, 452, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(451, 'Langi', '', 'lag', 'lag', 0, 453, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(452, 'Langi (Tanzania)', 'Taansanía', 'lag', 'lag_TZ', 0, 454, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(453, 'Luxembourgish', '', 'lb', 'lb', 0, 455, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(454, 'Luxembourgish (Luxembourg)', 'Lëtzebuerg', 'lb', 'lb_LU', 0, 456, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(455, 'Ganda', '', 'lg', 'lg', 0, 457, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(456, 'Ganda (Uganda)', 'Yuganda', 'lg', 'lg_UG', 0, 458, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(457, 'Lakota', '', 'lkt', 'lkt', 0, 459, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(458, 'Lakota (United States)', 'Mílahaŋska Tȟamákȟočhe', 'lkt', 'lkt_US', 0, 460, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(459, 'Lingala', '', 'ln', 'ln', 0, 461, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(460, 'Lingala (Angola)', 'Angóla', 'ln', 'ln_AO', 0, 462, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(461, 'Lingala (Congo - Kinshasa)', 'Republíki ya Kongó Demokratíki', 'ln', 'ln_CD', 0, 463, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(462, 'Lingala (Central African Republic)', 'Repibiki ya Afríka ya Káti', 'ln', 'ln_CF', 0, 464, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(463, 'Lingala (Congo - Brazzaville)', 'Kongo', 'ln', 'ln_CG', 0, 465, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(464, 'Lao', '', 'lo', 'lo', 0, 466, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(465, 'Lao (Laos)', 'ລາວ', 'lo', 'lo_LA', 0, 467, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(466, 'Northern Luri', '', 'lrc', 'lrc', 0, 468, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(467, 'Northern Luri (Iraq)', 'IQ', 'lrc', 'lrc_IQ', 0, 469, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(468, 'Northern Luri (Iran)', 'IR', 'lrc', 'lrc_IR', 0, 470, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(469, 'Lithuanian', '', 'lt', 'lt', 0, 471, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(470, 'Lithuanian (Lithuania)', 'Lietuva', 'lt', 'lt_LT', 0, 472, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(471, 'Luba-Katanga', '', 'lu', 'lu', 0, 473, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(472, 'Luba-Katanga (Congo - Kinshasa)', 'Ditunga wa Kongu', 'lu', 'lu_CD', 0, 474, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(473, 'Luo', '', 'luo', 'luo', 0, 475, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(474, 'Luo (Kenya)', 'Kenya', 'luo', 'luo_KE', 0, 476, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(475, 'Luyia', '', 'luy', 'luy', 0, 477, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(476, 'Luyia (Kenya)', 'Kenya', 'luy', 'luy_KE', 0, 478, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(477, 'Latvian', '', 'lv', 'lv', 0, 479, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(478, 'Latvian (Latvia)', 'Latvija', 'lv', 'lv_LV', 0, 480, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(479, 'Masai', '', 'mas', 'mas', 0, 481, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(480, 'Masai (Kenya)', 'Kenya', 'mas', 'mas_KE', 0, 482, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(481, 'Masai (Tanzania)', 'Tansania', 'mas', 'mas_TZ', 0, 483, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(482, 'Meru', '', 'mer', 'mer', 0, 484, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(483, 'Meru (Kenya)', 'Kenya', 'mer', 'mer_KE', 0, 485, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(484, 'Morisyen', '', 'mfe', 'mfe', 0, 486, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(485, 'Morisyen (Mauritius)', 'Moris', 'mfe', 'mfe_MU', 0, 487, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(486, 'Malagasy', '', 'mg', 'mg', 0, 488, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(487, 'Malagasy (Madagascar)', 'Madagasikara', 'mg', 'mg_MG', 0, 489, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(488, 'Makhuwa-Meetto', '', 'mgh', 'mgh', 0, 490, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(489, 'Makhuwa-Meetto (Mozambique)', 'Umozambiki', 'mgh', 'mgh_MZ', 0, 491, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(490, 'Metaʼ', '', 'mgo', 'mgo', 0, 492, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(491, 'Metaʼ (Cameroon)', 'Kamalun', 'mgo', 'mgo_CM', 0, 493, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(492, 'Maori', '', 'mi', 'mi', 0, 494, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(493, 'Maori (New Zealand)', 'Aotearoa', 'mi', 'mi_NZ', 0, 495, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(494, 'Macedonian', '', 'mk', 'mk', 0, 496, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(495, 'Macedonian (North Macedonia)', 'Северна Македонија', 'mk', 'mk_MK', 0, 497, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(496, 'Malayalam', '', 'ml', 'ml', 0, 498, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(497, 'Malayalam (India)', 'ഇന്ത്യ', 'ml', 'ml_IN', 0, 499, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(498, 'Mongolian', '', 'mn', 'mn', 0, 500, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(499, 'Mongolian (Mongolia)', 'Монгол', 'mn', 'mn_MN', 0, 501, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(500, 'Marathi', '', 'mr', 'mr', 0, 502, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(501, 'Marathi (India)', 'भारत', 'mr', 'mr_IN', 0, 503, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(502, 'Malay', '', 'ms', 'ms', 0, 504, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(503, 'Malay (Brunei)', 'Brunei', 'ms', 'ms_BN', 0, 505, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(504, 'Malay (Malaysia)', 'Malaysia', 'ms', 'ms_MY', 0, 506, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(505, 'Malay (Singapore)', 'Singapura', 'ms', 'ms_SG', 0, 507, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(506, 'Maltese', '', 'mt', 'mt', 0, 508, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(507, 'Maltese (Malta)', 'Malta', 'mt', 'mt_MT', 0, 509, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(508, 'Mundang', '', 'mua', 'mua', 0, 510, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(509, 'Mundang (Cameroon)', 'kameruŋ', 'mua', 'mua_CM', 0, 511, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(510, 'Burmese', '', 'my', 'my', 0, 512, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(511, 'Burmese (Myanmar [Burma])', 'မြန်မာ', 'my', 'my_MM', 0, 513, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(512, 'Mazanderani', '', 'mzn', 'mzn', 0, 514, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(513, 'Mazanderani (Iran)', 'ایران', 'mzn', 'mzn_IR', 0, 515, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(514, 'Nama', '', 'naq', 'naq', 0, 516, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(515, 'Nama (Namibia)', 'Namibiab', 'naq', 'naq_NA', 0, 517, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(516, 'Norwegian Bokmål', '', 'nb', 'nb', 0, 518, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(517, 'Norwegian Bokmål (Norway)', 'Norge', 'nb', 'nb_NO', 0, 519, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(518, 'Norwegian Bokmål (Svalbard & Jan Mayen)', 'Svalbard og Jan Mayen', 'nb', 'nb_SJ', 0, 520, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(519, 'North Ndebele', '', 'nd', 'nd', 0, 521, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(520, 'North Ndebele (Zimbabwe)', 'Zimbabwe', 'nd', 'nd_ZW', 0, 522, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(521, 'Low German', '', 'nds', 'nds', 0, 523, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(522, 'Low German (Germany)', 'DE', 'nds', 'nds_DE', 0, 524, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(523, 'Low German (Netherlands)', 'NL', 'nds', 'nds_NL', 0, 525, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(524, 'Nepali', '', 'ne', 'ne', 0, 526, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(525, 'Nepali (India)', 'भारत', 'ne', 'ne_IN', 0, 527, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(526, 'Nepali (Nepal)', 'नेपाल', 'ne', 'ne_NP', 0, 528, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(527, 'Dutch', '', 'nl', 'nl', 1, 529, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(528, 'Dutch (Aruba)', 'Aruba', 'nl', 'nl_AW', 0, 530, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(529, 'Dutch (Belgium)', 'België', 'nl', 'nl_BE', 0, 531, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(530, 'Dutch (Caribbean Netherlands)', 'Caribisch Nederland', 'nl', 'nl_BQ', 0, 532, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(531, 'Dutch (Curaçao)', 'Curaçao', 'nl', 'nl_CW', 0, 533, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(532, 'Dutch (Netherlands)', 'Nederland', 'nl', 'nl_NL', 0, 534, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(533, 'Dutch (Suriname)', 'Suriname', 'nl', 'nl_SR', 0, 535, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(534, 'Dutch (Sint Maarten)', 'Sint-Maarten', 'nl', 'nl_SX', 0, 536, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(535, 'Kwasio', '', 'nmg', 'nmg', 0, 537, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(536, 'Kwasio (Cameroon)', 'Kamerun', 'nmg', 'nmg_CM', 0, 538, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(537, 'Norwegian Nynorsk', '', 'nn', 'nn', 0, 539, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(538, 'Norwegian Nynorsk (Norway)', 'Noreg', 'nn', 'nn_NO', 0, 540, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(539, 'Ngiemboon', '', 'nnh', 'nnh', 0, 541, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(540, 'Ngiemboon (Cameroon)', 'Kàmalûm', 'nnh', 'nnh_CM', 0, 542, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(541, 'Nuer', '', 'nus', 'nus', 0, 543, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(542, 'Nuer (South Sudan)', 'SS', 'nus', 'nus_SS', 0, 544, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(543, 'Nyankole', '', 'nyn', 'nyn', 0, 545, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(544, 'Nyankole (Uganda)', 'Uganda', 'nyn', 'nyn_UG', 0, 546, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(545, 'Oromo', '', 'om', 'om', 0, 547, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(546, 'Oromo (Ethiopia)', 'Itoophiyaa', 'om', 'om_ET', 0, 548, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(547, 'Oromo (Kenya)', 'Keeniyaa', 'om', 'om_KE', 0, 549, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(548, 'Odia', '', 'or', 'or', 0, 550, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(549, 'Odia (India)', 'ଭାରତ', 'or', 'or_IN', 0, 551, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(550, 'Ossetic', '', 'os', 'os', 0, 552, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(551, 'Ossetic (Georgia)', 'Гуырдзыстон', 'os', 'os_GE', 0, 553, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(552, 'Ossetic (Russia)', 'Уӕрӕсе', 'os', 'os_RU', 0, 554, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(553, 'Punjabi', '', 'pa', 'pa', 0, 555, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(554, 'Punjabi (Arabic)', '', 'pa', 'pa_Arab', 0, 556, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(555, 'Punjabi (Arabic, Pakistan)', 'پاکستان', 'pa', 'pa_Arab_PK', 0, 557, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(556, 'Punjabi (Gurmukhi)', '', 'pa', 'pa_Guru', 0, 558, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(557, 'Punjabi (Gurmukhi, India)', 'ਭਾਰਤ', 'pa', 'pa_Guru_IN', 0, 559, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(558, 'Polish', '', 'pl', 'pl', 1, 560, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(559, 'Polish (Poland)', 'Polska', 'pl', 'pl_PL', 0, 561, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(560, 'Pashto', '', 'ps', 'ps', 0, 562, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(561, 'Pashto (Afghanistan)', 'افغانستان', 'ps', 'ps_AF', 0, 563, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(562, 'Pashto (Pakistan)', 'پاکستان', 'ps', 'ps_PK', 0, 564, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(563, 'Portuguese', '', 'pt', 'pt', 1, 565, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(564, 'Portuguese (Angola)', 'Angola', 'pt', 'pt_AO', 0, 566, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(565, 'Portuguese (Brazil)', 'Brasil', 'pt', 'pt_BR', 0, 567, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(566, 'Portuguese (Switzerland)', 'Suíça', 'pt', 'pt_CH', 0, 568, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(567, 'Portuguese (Cape Verde)', 'Cabo Verde', 'pt', 'pt_CV', 0, 569, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(568, 'Portuguese (Equatorial Guinea)', 'Guiné Equatorial', 'pt', 'pt_GQ', 0, 570, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(569, 'Portuguese (Guinea-Bissau)', 'Guiné-Bissau', 'pt', 'pt_GW', 0, 571, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(570, 'Portuguese (Luxembourg)', 'Luxemburgo', 'pt', 'pt_LU', 0, 572, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(571, 'Portuguese (Macao SAR China)', 'Macau, RAE da China', 'pt', 'pt_MO', 0, 573, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(572, 'Portuguese (Mozambique)', 'Moçambique', 'pt', 'pt_MZ', 0, 574, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(573, 'Portuguese (Portugal)', 'Portugal', 'pt', 'pt_PT', 0, 575, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(574, 'Portuguese (São Tomé & Príncipe)', 'São Tomé e Príncipe', 'pt', 'pt_ST', 0, 576, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(575, 'Portuguese (Timor-Leste)', 'Timor-Leste', 'pt', 'pt_TL', 0, 577, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(576, 'Quechua', '', 'qu', 'qu', 0, 578, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(577, 'Quechua (Bolivia)', 'Bolivia', 'qu', 'qu_BO', 0, 579, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(578, 'Quechua (Ecuador)', 'Ecuador', 'qu', 'qu_EC', 0, 580, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(579, 'Quechua (Peru)', 'Perú', 'qu', 'qu_PE', 0, 581, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(580, 'Romansh', '', 'rm', 'rm', 0, 582, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(581, 'Romansh (Switzerland)', 'Svizra', 'rm', 'rm_CH', 0, 583, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(582, 'Rundi', '', 'rn', 'rn', 0, 584, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(583, 'Rundi (Burundi)', 'Uburundi', 'rn', 'rn_BI', 0, 585, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(584, 'Romanian', '', 'ro', 'ro', 0, 586, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(585, 'Romanian (Moldova)', 'Republica Moldova', 'ro', 'ro_MD', 0, 587, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(586, 'Romanian (Romania)', 'România', 'ro', 'ro_RO', 0, 588, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(587, 'Rombo', '', 'rof', 'rof', 0, 589, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(588, 'Rombo (Tanzania)', 'Tanzania', 'rof', 'rof_TZ', 0, 590, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(589, 'Russian', '', 'ru', 'ru', 1, 591, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(590, 'Russian (Belarus)', 'Беларусь', 'ru', 'ru_BY', 0, 592, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(591, 'Russian (Kyrgyzstan)', 'Киргизия', 'ru', 'ru_KG', 0, 593, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(592, 'Russian (Kazakhstan)', 'Казахстан', 'ru', 'ru_KZ', 0, 594, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(593, 'Russian (Moldova)', 'Молдова', 'ru', 'ru_MD', 0, 595, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(594, 'Russian (Russia)', 'Россия', 'ru', 'ru_RU', 0, 596, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(595, 'Russian (Ukraine)', 'Украина', 'ru', 'ru_UA', 0, 597, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(596, 'Kinyarwanda', '', 'rw', 'rw', 0, 598, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(597, 'Kinyarwanda (Rwanda)', 'U Rwanda', 'rw', 'rw_RW', 0, 599, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(598, 'Rwa', '', 'rwk', 'rwk', 0, 600, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(599, 'Rwa (Tanzania)', 'Tanzania', 'rwk', 'rwk_TZ', 0, 601, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(600, 'Sakha', '', 'sah', 'sah', 0, 602, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(601, 'Sakha (Russia)', 'Арассыыйа', 'sah', 'sah_RU', 0, 603, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(602, 'Samburu', '', 'saq', 'saq', 0, 604, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(603, 'Samburu (Kenya)', 'Kenya', 'saq', 'saq_KE', 0, 605, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(604, 'Sangu', '', 'sbp', 'sbp', 0, 606, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(605, 'Sangu (Tanzania)', 'Tansaniya', 'sbp', 'sbp_TZ', 0, 607, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(606, 'Sindhi', '', 'sd', 'sd', 0, 608, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(607, 'Sindhi (Pakistan)', 'پاڪستان', 'sd', 'sd_PK', 0, 609, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(608, 'Northern Sami', '', 'se', 'se', 0, 610, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(609, 'Northern Sami (Finland)', 'Suopma', 'se', 'se_FI', 0, 611, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(610, 'Northern Sami (Norway)', 'Norga', 'se', 'se_NO', 0, 612, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(611, 'Northern Sami (Sweden)', 'Ruoŧŧa', 'se', 'se_SE', 0, 613, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(612, 'Sena', '', 'seh', 'seh', 0, 614, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(613, 'Sena (Mozambique)', 'Moçambique', 'seh', 'seh_MZ', 0, 615, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(614, 'Koyraboro Senni', '', 'ses', 'ses', 0, 616, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(615, 'Koyraboro Senni (Mali)', 'Maali', 'ses', 'ses_ML', 0, 617, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(616, 'Sango', '', 'sg', 'sg', 0, 618, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(617, 'Sango (Central African Republic)', 'Ködörösêse tî Bêafrîka', 'sg', 'sg_CF', 0, 619, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(618, 'Tachelhit', '', 'shi', 'shi', 0, 620, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(619, 'Tachelhit (Latin)', '', 'shi', 'shi_Latn', 0, 621, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(620, 'Tachelhit (Latin, Morocco)', 'lmɣrib', 'shi', 'shi_Latn_MA', 0, 622, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(621, 'Tachelhit (Tifinagh)', '', 'shi', 'shi_Tfng', 0, 623, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(622, 'Tachelhit (Tifinagh, Morocco)', 'ⵍⵎⵖⵔⵉⴱ', 'shi', 'shi_Tfng_MA', 0, 624, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(623, 'Sinhala', '', 'si', 'si', 0, 625, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(624, 'Sinhala (Sri Lanka)', 'ශ්‍රී ලංකාව', 'si', 'si_LK', 0, 626, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(625, 'Slovak', '', 'sk', 'sk', 1, 627, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(626, 'Slovak (Slovakia)', 'Slovensko', 'sk', 'sk_SK', 0, 628, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(627, 'Slovenian', '', 'sl', 'sl', 0, 629, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(628, 'Slovenian (Slovenia)', 'Slovenija', 'sl', 'sl_SI', 0, 630, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(629, 'Inari Sami', '', 'smn', 'smn', 0, 631, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(630, 'Inari Sami (Finland)', 'Suomâ', 'smn', 'smn_FI', 0, 632, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(631, 'Shona', '', 'sn', 'sn', 0, 633, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(632, 'Shona (Zimbabwe)', 'Zimbabwe', 'sn', 'sn_ZW', 0, 634, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(633, 'Somali', '', 'so', 'so', 0, 635, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(634, 'Somali (Djibouti)', 'Jabuuti', 'so', 'so_DJ', 0, 636, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(635, 'Somali (Ethiopia)', 'Itoobiya', 'so', 'so_ET', 0, 637, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(636, 'Somali (Kenya)', 'Kenya', 'so', 'so_KE', 0, 638, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(637, 'Somali (Somalia)', 'Soomaaliya', 'so', 'so_SO', 0, 639, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(638, 'Albanian', '', 'sq', 'sq', 0, 640, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(639, 'Albanian (Albania)', 'Shqipëri', 'sq', 'sq_AL', 0, 641, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(640, 'Albanian (North Macedonia)', 'Maqedonia e Veriut', 'sq', 'sq_MK', 0, 642, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(641, 'Albanian (Kosovo)', 'Kosovë', 'sq', 'sq_XK', 0, 643, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(642, 'Serbian', '', 'sr', 'sr', 0, 644, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(643, 'Serbian (Cyrillic)', '', 'sr', 'sr_Cyrl', 0, 645, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(644, 'Serbian (Cyrillic, Bosnia & Herzegovina)', 'Босна и Херцеговина', 'sr', 'sr_Cyrl_BA', 0, 646, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(645, 'Serbian (Cyrillic, Montenegro)', 'Црна Гора', 'sr', 'sr_Cyrl_ME', 0, 647, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(646, 'Serbian (Cyrillic, Serbia)', 'Србија', 'sr', 'sr_Cyrl_RS', 0, 648, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(647, 'Serbian (Cyrillic, Kosovo)', 'Косово', 'sr', 'sr_Cyrl_XK', 0, 649, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(648, 'Serbian (Latin)', '', 'sr', 'sr_Latn', 0, 650, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(649, 'Serbian (Latin, Bosnia & Herzegovina)', 'Bosna i Hercegovina', 'sr', 'sr_Latn_BA', 0, 651, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(650, 'Serbian (Latin, Montenegro)', 'Crna Gora', 'sr', 'sr_Latn_ME', 0, 652, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(651, 'Serbian (Latin, Serbia)', 'Srbija', 'sr', 'sr_Latn_RS', 0, 653, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(652, 'Serbian (Latin, Kosovo)', 'Kosovo', 'sr', 'sr_Latn_XK', 0, 654, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(653, 'Swedish', '', 'sv', 'sv', 0, 655, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(654, 'Swedish (Åland Islands)', 'Åland', 'sv', 'sv_AX', 0, 656, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(655, 'Swedish (Finland)', 'Finland', 'sv', 'sv_FI', 0, 657, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(656, 'Swedish (Sweden)', 'Sverige', 'sv', 'sv_SE', 0, 658, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(657, 'Swahili', '', 'sw', 'sw', 0, 659, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(658, 'Swahili (Congo - Kinshasa)', 'Jamhuri ya Kidemokrasia ya Kongo', 'sw', 'sw_CD', 0, 660, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(659, 'Swahili (Kenya)', 'Kenya', 'sw', 'sw_KE', 0, 661, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(660, 'Swahili (Tanzania)', 'Tanzania', 'sw', 'sw_TZ', 0, 662, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(661, 'Swahili (Uganda)', 'Uganda', 'sw', 'sw_UG', 0, 663, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(662, 'Tamil', '', 'ta', 'ta', 0, 664, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(663, 'Tamil (India)', 'இந்தியா', 'ta', 'ta_IN', 0, 665, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(664, 'Tamil (Sri Lanka)', 'இலங்கை', 'ta', 'ta_LK', 0, 666, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(665, 'Tamil (Malaysia)', 'மலேசியா', 'ta', 'ta_MY', 0, 667, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(666, 'Tamil (Singapore)', 'சிங்கப்பூர்', 'ta', 'ta_SG', 0, 668, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(667, 'Telugu', '', 'te', 'te', 0, 669, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(668, 'Telugu (India)', 'భారతదేశం', 'te', 'te_IN', 0, 670, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(669, 'Teso', '', 'teo', 'teo', 0, 671, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(670, 'Teso (Kenya)', 'Kenia', 'teo', 'teo_KE', 0, 672, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(671, 'Teso (Uganda)', 'Uganda', 'teo', 'teo_UG', 0, 673, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(672, 'Tajik', '', 'tg', 'tg', 0, 674, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(673, 'Tajik (Tajikistan)', 'Тоҷикистон', 'tg', 'tg_TJ', 0, 675, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(674, 'Thai', '', 'th', 'th', 0, 676, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(675, 'Thai (Thailand)', 'ไทย', 'th', 'th_TH', 0, 677, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(676, 'Tigrinya', '', 'ti', 'ti', 0, 678, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(677, 'Tigrinya (Eritrea)', 'ኤርትራ', 'ti', 'ti_ER', 0, 679, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(678, 'Tigrinya (Ethiopia)', 'ኢትዮጵያ', 'ti', 'ti_ET', 0, 680, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(679, 'Turkmen', '', 'tk', 'tk', 0, 681, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(680, 'Turkmen (Turkmenistan)', 'Türkmenistan', 'tk', 'tk_TM', 0, 682, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(681, 'Tongan', '', 'to', 'to', 0, 683, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(682, 'Tongan (Tonga)', 'Tonga', 'to', 'to_TO', 0, 684, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(683, 'Turkish', '', 'tr', 'tr', 0, 685, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(684, 'Turkish (Cyprus)', 'Kıbrıs', 'tr', 'tr_CY', 0, 686, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(685, 'Turkish (Turkey)', 'Türkiye', 'tr', 'tr_TR', 0, 687, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(686, 'Tatar', '', 'tt', 'tt', 0, 688, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(687, 'Tatar (Russia)', 'Россия', 'tt', 'tt_RU', 0, 689, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(688, 'Tasawaq', '', 'twq', 'twq', 0, 690, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(689, 'Tasawaq (Niger)', 'Nižer', 'twq', 'twq_NE', 0, 691, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(690, 'Central Atlas Tamazight', '', 'tzm', 'tzm', 0, 692, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(691, 'Central Atlas Tamazight (Morocco)', 'Meṛṛuk', 'tzm', 'tzm_MA', 0, 693, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(692, 'Uyghur', '', 'ug', 'ug', 0, 694, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(693, 'Uyghur (China)', 'جۇڭگو', 'ug', 'ug_CN', 0, 695, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(694, 'Ukrainian', '', 'uk', 'uk', 0, 696, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(695, 'Ukrainian (Ukraine)', 'Україна', 'uk', 'uk_UA', 0, 697, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(696, 'Urdu', '', 'ur', 'ur', 0, 698, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(697, 'Urdu (India)', 'بھارت', 'ur', 'ur_IN', 0, 699, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(698, 'Urdu (Pakistan)', 'پاکستان', 'ur', 'ur_PK', 0, 700, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(699, 'Uzbek', '', 'uz', 'uz', 0, 701, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(700, 'Uzbek (Arabic)', '', 'uz', 'uz_Arab', 0, 702, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(701, 'Uzbek (Arabic, Afghanistan)', 'افغانستان', 'uz', 'uz_Arab_AF', 0, 703, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(702, 'Uzbek (Cyrillic)', '', 'uz', 'uz_Cyrl', 0, 704, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(703, 'Uzbek (Cyrillic, Uzbekistan)', 'Ўзбекистон', 'uz', 'uz_Cyrl_UZ', 0, 705, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(704, 'Uzbek (Latin)', '', 'uz', 'uz_Latn', 0, 706, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(705, 'Uzbek (Latin, Uzbekistan)', 'Oʻzbekiston', 'uz', 'uz_Latn_UZ', 0, 707, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(706, 'Vai', '', 'vai', 'vai', 0, 708, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(707, 'Vai (Latin)', '', 'vai', 'vai_Latn', 0, 709, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(708, 'Vai (Latin, Liberia)', 'Laibhiya', 'vai', 'vai_Latn_LR', 0, 710, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(709, 'Vai (Vai)', '', 'vai', 'vai_Vaii', 0, 711, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(710, 'Vai (Vai, Liberia)', 'ꕞꔤꔫꕩ', 'vai', 'vai_Vaii_LR', 0, 712, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(711, 'Vietnamese', '', 'vi', 'vi', 0, 713, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(712, 'Vietnamese (Vietnam)', 'Việt Nam', 'vi', 'vi_VN', 0, 714, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(713, 'Vunjo', '', 'vun', 'vun', 0, 715, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(714, 'Vunjo (Tanzania)', 'Tanzania', 'vun', 'vun_TZ', 0, 716, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(715, 'Walser', '', 'wae', 'wae', 0, 717, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(716, 'Walser (Switzerland)', 'Schwiz', 'wae', 'wae_CH', 0, 718, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(717, 'Wolof', '', 'wo', 'wo', 0, 719, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(718, 'Wolof (Senegal)', 'Senegaal', 'wo', 'wo_SN', 0, 720, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(719, 'Xhosa', '', 'xh', 'xh', 0, 721, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(720, 'Xhosa (South Africa)', 'eMzantsi Afrika', 'xh', 'xh_ZA', 0, 722, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(721, 'Soga', '', 'xog', 'xog', 0, 723, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(722, 'Soga (Uganda)', 'Yuganda', 'xog', 'xog_UG', 0, 724, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(723, 'Yangben', '', 'yav', 'yav', 0, 725, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(724, 'Yangben (Cameroon)', 'Kemelún', 'yav', 'yav_CM', 0, 726, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(725, 'Yiddish', '', 'yi', 'yi', 0, 727, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(726, 'Yiddish (World)', 'וועלט', 'yi', 'yi_001', 0, 728, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(727, 'Yoruba', '', 'yo', 'yo', 0, 729, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(728, 'Yoruba (Benin)', 'Orílɛ́ède Bɛ̀nɛ̀', 'yo', 'yo_BJ', 0, 730, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(729, 'Yoruba (Nigeria)', 'Orilẹ̀-èdè Nàìjíríà', 'yo', 'yo_NG', 0, 731, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(730, 'Cantonese', '', 'yue', 'yue', 0, 732, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(731, 'Cantonese (Simplified)', '', 'yue', 'yue_Hans', 0, 733, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(732, 'Cantonese (Simplified, China)', '中华人民共和国', 'yue', 'yue_Hans_CN', 0, 734, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(733, 'Cantonese (Traditional)', '', 'yue', 'yue_Hant', 0, 735, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(734, 'Cantonese (Traditional, Hong Kong SAR China)', '中華人民共和國香港特別行政區', 'yue', 'yue_Hant_HK', 0, 736, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(735, 'Standard Moroccan Tamazight', '', 'zgh', 'zgh', 0, 737, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(736, 'Standard Moroccan Tamazight (Morocco)', 'ⵍⵎⵖⵔⵉⴱ', 'zgh', 'zgh_MA', 0, 738, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(737, 'Chinese', '', 'zh', 'zh', 1, 739, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(738, 'Chinese (Simplified)', '', 'zh', 'zh_Hans', 0, 740, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(739, 'Chinese (Simplified, China)', '中国', 'zh', 'zh_Hans_CN', 0, 741, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(740, 'Chinese (Simplified, Hong Kong SAR China)', '中国香港特别行政区', 'zh', 'zh_Hans_HK', 0, 742, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(741, 'Chinese (Simplified, Macao SAR China)', '中国澳门特别行政区', 'zh', 'zh_Hans_MO', 0, 743, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(742, 'Chinese (Simplified, Singapore)', '新加坡', 'zh', 'zh_Hans_SG', 0, 744, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(743, 'Chinese (Traditional)', '', 'zh', 'zh_Hant', 0, 745, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(744, 'Chinese (Traditional, Hong Kong SAR China)', '中國香港特別行政區', 'zh', 'zh_Hant_HK', 0, 746, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(745, 'Chinese (Traditional, Macao SAR China)', '中國澳門特別行政區', 'zh', 'zh_Hant_MO', 0, 747, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(746, 'Chinese (Traditional, Taiwan)', '台灣', 'zh', 'zh_Hant_TW', 0, 748, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(747, 'Zulu', '', 'zu', 'zu', 0, 749, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL),
(748, 'Zulu (South Africa)', 'iNingizimu Afrika', 'zu', 'zu_ZA', 0, 750, '2019-10-26 16:05:41', NULL, '2019-10-26 16:05:41', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `links`
--

CREATE TABLE `links` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `menu_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `description` text,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `rel` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL,
  `visibility_roles` text,
  `params` text,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `links`
--

INSERT INTO `links` (`id`, `parent_id`, `menu_id`, `title`, `class`, `description`, `link`, `target`, `rel`, `status`, `lft`, `rght`, `visibility_roles`, `params`, `publish_start`, `publish_end`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(5, NULL, 4, 'About', 'about', '', 'plugin:Croogo%2fNodes/controller:Nodes/action:view/type:page/slug:about', '', '', 1, 3, 4, '', '', NULL, NULL, '2009-10-06 23:14:21', NULL, '2009-08-19 12:23:33', NULL),
(6, NULL, 4, 'Contact', 'contact', '', 'plugin:Croogo%2fContacts/controller:Contacts/action:view/contact', '', '', 1, 5, 6, '', '', NULL, NULL, '2009-10-06 23:14:45', NULL, '2009-08-19 12:34:56', NULL),
(7, NULL, 3, 'Home', 'home', '', 'plugin:Croogo%2fNodes/controller:Nodes/action:promoted', '', '', 1, 5, 6, '', '', NULL, NULL, '2009-10-06 21:17:06', NULL, '2009-09-06 21:32:54', NULL),
(8, NULL, 3, 'About', 'about', '', 'plugin:Croogo%2fNodes/controller:Nodes/action:view/type:page/slug:about', '', '', 1, 7, 10, '', '', NULL, NULL, '2009-09-12 03:45:53', NULL, '2009-09-06 21:34:57', NULL),
(9, 8, 3, 'Child link', 'child-link', '', '#', '', '', 0, 8, 9, '', '', NULL, NULL, '2009-10-06 23:13:06', NULL, '2009-09-12 03:52:23', NULL),
(10, NULL, 5, 'Site Admin', 'site-admin', '', '/admin', '', '', 1, 1, 2, '', '', NULL, NULL, '2009-09-12 06:34:09', NULL, '2009-09-12 06:34:09', NULL),
(11, NULL, 5, 'Log out', 'log-out', '', '/plugin:Croogo%2fUsers/controller:Users/action:logout', '', '', 1, 7, 8, '[\"1\",\"2\"]', '', NULL, NULL, '2009-09-12 06:35:22', NULL, '2009-09-12 06:34:41', NULL),
(12, NULL, 6, 'Croogo', 'croogo', '', 'http://www.croogo.org', '', '', 1, 3, 4, '', '', NULL, NULL, '2009-09-12 23:31:59', NULL, '2009-09-12 23:31:59', NULL),
(14, NULL, 6, 'CakePHP', 'cakephp', '', 'http://www.cakephp.org', '', '', 1, 1, 2, '', '', NULL, NULL, '2009-10-07 03:25:25', NULL, '2009-09-12 23:38:43', NULL),
(15, NULL, 3, 'Contact', 'contact', '', '/plugin:Croogo%2fContacts/controller:Contacts/action:view/contact', '', '', 1, 11, 12, '', '', NULL, NULL, '2009-09-16 07:54:13', NULL, '2009-09-16 07:53:33', NULL),
(16, NULL, 5, 'Entries (RSS)', 'entries-rss', '', 'plugin:Croogo%2fNodes/controller:Nodes/action:promoted/_ext:rss', '', '', 1, 3, 4, '', '', NULL, NULL, '2009-10-27 17:46:22', NULL, '2009-10-27 17:46:22', NULL),
(17, NULL, 5, 'Comments (RSS)', 'comments-rss', '', 'plugin:Croogo%2fComments/controller:Comments/action:index/_ext:rss', '', '', 0, 5, 6, '', '', NULL, NULL, '2009-10-27 17:46:54', NULL, '2009-10-27 17:46:54', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menus`
--

CREATE TABLE `menus` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `link_count` int NOT NULL DEFAULT '0',
  `params` text,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `menus`
--

INSERT INTO `menus` (`id`, `title`, `alias`, `class`, `description`, `status`, `weight`, `link_count`, `params`, `publish_start`, `publish_end`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(3, 'Main Menu', 'main', '', '', 1, NULL, 4, '', NULL, NULL, '2009-08-19 12:21:06', NULL, '2009-07-22 01:49:53', NULL),
(4, 'Footer', 'footer', '', '', 1, NULL, 2, '', NULL, NULL, '2009-08-19 12:22:42', NULL, '2009-08-19 12:22:42', NULL),
(5, 'Meta', 'meta', '', '', 1, NULL, 4, '', NULL, NULL, '2009-09-12 06:33:29', NULL, '2009-09-12 06:33:29', NULL),
(6, 'Blogroll', 'blogroll', '', '', 1, NULL, 2, '', NULL, NULL, '2009-09-12 23:30:24', NULL, '2009-09-12 23:30:24', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `contact_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `message_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `meta`
--

CREATE TABLE `meta` (
  `id` int NOT NULL,
  `model` varchar(255) NOT NULL DEFAULT 'Node',
  `foreign_key` int DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  `weight` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `meta`
--

INSERT INTO `meta` (`id`, `model`, `foreign_key`, `key`, `value`, `weight`, `created`, `created_by`, `updated`, `updated_by`) VALUES
(1, 'Croogo/Nodes.Nodes', 1, 'meta_keywords', 'key1, key2', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `model_taxonomies`
--

CREATE TABLE `model_taxonomies` (
  `id` int NOT NULL,
  `model` varchar(50) NOT NULL,
  `foreign_key` int NOT NULL,
  `taxonomy_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `model_taxonomies`
--

INSERT INTO `model_taxonomies` (`id`, `model`, `foreign_key`, `taxonomy_id`) VALUES
(1, 'Croogo/Nodes.Nodes', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `time_send` int NOT NULL,
  `description` text,
  `status` smallint NOT NULL,
  `is_accepted` smallint NOT NULL,
  `date_from` int DEFAULT NULL,
  `date_to` int DEFAULT NULL,
  `lang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pl_PL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `newsletters`
--

INSERT INTO `newsletters` (`id`, `created`, `updated`, `time_send`, `description`, `status`, `is_accepted`, `date_from`, `date_to`, `lang`) VALUES
(2, '2020-02-26 10:16:24', '2020-02-29 19:54:22', 0, '<p>test edit contentsadasdas</p>\r\n', 0, 1, NULL, NULL, 'pl_PL'),
(15, '2020-02-26 10:16:24', '2020-02-29 19:54:22', 0, '<p>test edit contentsadasdas</p>\r\n', 0, 1, NULL, NULL, 'pl_PL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `newsletters_articles`
--

CREATE TABLE `newsletters_articles` (
  `id` int NOT NULL,
  `newsletter_id` int NOT NULL,
  `article_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `newsletters_articles`
--

INSERT INTO `newsletters_articles` (`id`, `newsletter_id`, `article_id`) VALUES
(18, 15, 11),
(19, 15, 16),
(21, 15, 19),
(22, 15, 23),
(23, 15, 29),
(24, 2, 29),
(25, 2, 23);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `newsletters_messages`
--

CREATE TABLE `newsletters_messages` (
  `id` int NOT NULL,
  `newsletter_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` smallint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nodes`
--

CREATE TABLE `nodes` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `excerpt` text,
  `status` int DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `comment_status` int NOT NULL DEFAULT '1',
  `comment_count` int DEFAULT '0',
  `promote` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `terms` text,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL,
  `visibility_roles` text,
  `type` varchar(100) NOT NULL DEFAULT 'node',
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `nodes`
--

INSERT INTO `nodes` (`id`, `parent_id`, `user_id`, `title`, `slug`, `body`, `excerpt`, `status`, `mime_type`, `comment_status`, `comment_count`, `promote`, `path`, `terms`, `sticky`, `lft`, `rght`, `visibility_roles`, `type`, `publish_start`, `publish_end`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, NULL, 1, 'Hello World', 'hello-world', '<p>Welcome to Croogo. This is your first post. You can edit or delete it from the admin panel.</p>', '', 1, '', 2, 1, 1, '/blog/hello-world', '{\"1\":\"uncategorized\"}', 0, 1, 2, '', 'blog', NULL, NULL, '2009-12-25 11:00:00', NULL, '2009-12-25 11:00:00', NULL),
(2, NULL, 1, 'About', 'about', '<p>This is an example of a Croogo page, you could edit this to put information about yourself or your site.</p>', '', 1, '', 0, 0, 0, '/about', '', 0, 1, 2, '', 'page', NULL, NULL, '2009-12-25 22:00:00', NULL, '2009-12-25 22:00:00', NULL),
(3, NULL, 0, 'image_01', '69ea6857-6e9c-48a4-b9a9-b11e51d5adf6-image_01.jpeg', '', NULL, NULL, 'image/jpeg', 1, 0, 0, '/uploads/69ea6857-6e9c-48a4-b9a9-b11e51d5adf6-image_01.jpeg', NULL, 0, 1, 2, NULL, 'attachment', NULL, NULL, '2019-11-07 18:26:10', 1, '2019-11-07 18:26:10', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notes`
--

CREATE TABLE `notes` (
  `id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `counter_up_vote` int NOT NULL DEFAULT '0',
  `is_deleted_by` bigint NOT NULL DEFAULT '0',
  `is_edited` tinyint NOT NULL DEFAULT '0',
  `is_edited_by` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `notes`
--

INSERT INTO `notes` (`id`, `parent_id`, `user_id`, `article_id`, `description`, `created`, `updated`, `is_deleted`, `counter_up_vote`, `is_deleted_by`, `is_edited`, `is_edited_by`) VALUES
(1, NULL, 5, 1, 'test comment', '2019-11-02 14:11:47', '2019-11-02 14:11:47', 0, 0, 0, 0, 0),
(2, NULL, 5, 1, 'test second comment', '2019-11-02 14:12:59', '2019-11-02 14:12:59', 0, 0, 0, 0, 0),
(3, NULL, 5, 1, 'eee', '2019-11-03 11:45:38', '2019-11-03 11:45:38', 0, 0, 0, 0, 0),
(4, NULL, 5, 1, 'test', '2019-11-05 19:50:46', '2019-11-05 19:50:46', 0, 0, 0, 0, 0),
(5, NULL, 6, 7, 'Testowanie mikrofonu', '2019-11-22 11:26:54', '2019-11-22 11:26:54', 0, 0, 0, 0, 0),
(6, NULL, 5, 11, 'aaa', '2019-12-11 21:14:10', '2019-12-11 21:14:10', 0, 0, 0, 0, 0),
(7, NULL, 5, 11, 'wwww', '2019-12-11 21:14:54', '2019-12-11 21:14:54', 0, 0, 0, 0, 0),
(8, NULL, 5, 5, 'aaaa', '2019-12-11 21:15:46', '2019-12-11 21:15:46', 0, 0, 0, 0, 0),
(9, NULL, 7, 9, 'sdfadf', '2019-12-26 23:39:42', '2019-12-26 23:39:42', 0, 0, 0, 0, 0),
(10, NULL, 6, 12, 'lipton pipton', '2020-01-11 15:34:40', '2020-01-11 15:34:40', 0, 0, 0, 0, 0),
(11, NULL, 5, 11, 'bbb', '2020-01-11 17:15:46', '2020-02-29 17:08:53', 1, 1, 0, 0, 0),
(12, NULL, 5, 10, 'ddd', '2020-01-11 17:18:16', '2020-01-11 17:18:16', 0, 2, 0, 0, 0),
(13, NULL, 5, 4, 'ddd', '2020-01-11 17:26:23', '2020-01-11 17:26:23', 0, 0, 0, 0, 0),
(14, NULL, 5, 17, 'ddd', '2020-01-15 19:43:55', '2020-01-15 19:43:55', 0, 0, 0, 0, 0),
(15, NULL, 7, 19, 'asdfasdf as fa s', '2020-01-25 18:01:07', '2020-02-20 23:16:26', 1, 0, 0, 0, 0),
(16, NULL, 7, 19, 'asdf asdfasd ', '2020-01-25 18:01:16', '2020-01-25 18:01:16', 0, 0, 0, 0, 0),
(17, NULL, 7, 19, 'sadf asdf asdf asdfas', '2020-01-25 18:01:29', '2020-01-25 18:01:29', 0, 0, 0, 0, 0),
(18, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:43', '2020-01-25 18:01:43', 0, 0, 0, 0, 0),
(19, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:44', '2020-01-25 18:01:44', 0, 0, 0, 0, 0),
(20, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:45', '2020-01-25 18:01:45', 0, 0, 0, 0, 0),
(21, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:46', '2020-01-25 18:01:46', 0, 0, 0, 0, 0),
(22, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:46', '2020-01-25 18:01:46', 0, 0, 0, 0, 0),
(23, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:47', '2020-01-25 18:01:47', 0, 0, 0, 0, 0),
(24, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:47', '2020-01-25 18:01:47', 0, 0, 0, 0, 0),
(25, NULL, 7, 19, 'sadfasdfasasd', '2020-01-25 18:01:48', '2020-01-25 18:01:48', 0, 0, 0, 0, 0),
(26, NULL, 7, 19, 'ssafasfd', '2020-01-26 10:29:14', '2020-01-26 10:29:14', 0, 0, 0, 0, 0),
(27, NULL, 7, 19, 'hgjh', '2020-02-01 18:36:14', '2020-02-01 18:36:14', 0, 0, 0, 0, 0),
(28, NULL, 5, 10, 'test answer', '2020-02-03 21:24:16', '2020-08-08 12:04:19', 1, 1, 6, 0, 0),
(29, NULL, 29, 21, 'safa sdfas ', '2020-02-03 22:42:59', '2020-02-03 22:42:59', 0, 1, 0, 0, 0),
(30, NULL, 7, 22, 'Pierwsze było jajko', '2020-02-03 22:50:36', '2020-02-03 22:50:36', 0, 3, 0, 0, 0),
(31, NULL, 7, 22, 'Pierwsza była kura', '2020-02-03 22:50:48', '2020-07-25 14:36:33', 1, 4, 31, 0, 0),
(32, NULL, 7, 21, 'sawdfasdfsfasd', '2020-02-04 18:26:19', '2020-02-04 18:26:19', 0, 0, 0, 0, 0),
(33, NULL, 7, 21, 'hgfghfhg', '2020-02-04 18:26:49', '2020-02-04 18:26:49', 0, 0, 0, 0, 0),
(34, NULL, 7, 21, 'jhgjhjhgjhg', '2020-02-04 18:30:17', '2020-02-04 18:30:17', 0, 0, 0, 0, 0),
(35, NULL, 7, 21, 'jnn,mnmnm,', '2020-02-04 18:30:28', '2020-02-04 18:30:28', 0, 0, 0, 0, 0),
(36, NULL, 5, 10, 'dfdf', '2020-02-04 21:29:28', '2020-03-03 14:31:22', 1, 1, 0, 0, 0),
(37, NULL, 7, 21, 'cvbxcvbcx', '2020-02-05 11:08:11', '2020-02-05 11:08:11', 0, 0, 0, 0, 0),
(38, NULL, 33, 21, 'test', '2020-02-05 12:40:24', '2020-02-05 12:40:24', 0, 0, 0, 0, 0),
(39, NULL, 33, 21, 'test', '2020-02-05 12:43:26', '2020-02-05 12:43:26', 0, 0, 0, 0, 0),
(40, NULL, 33, 21, 'test2', '2020-02-05 12:44:41', '2020-02-05 12:44:41', 0, 0, 0, 0, 0),
(41, NULL, 33, 21, 'test3', '2020-02-05 12:44:59', '2020-04-06 07:18:50', 1, 0, 0, 0, 0),
(42, NULL, 34, 21, 'Test ', '2020-02-05 14:26:59', '2020-02-05 14:26:59', 0, 0, 0, 0, 0),
(43, NULL, 35, 22, 'oczywiście że kura ;) ', '2020-02-05 14:31:55', '2020-07-05 14:47:57', 1, 0, 7, 0, 0),
(44, NULL, 35, 19, 'raz dwa trzy', '2020-02-05 14:35:37', '2020-02-05 14:35:37', 0, 0, 0, 0, 0),
(45, NULL, 36, 23, 'First comment ', '2020-02-05 18:42:43', '2020-02-05 18:42:43', 0, 0, 0, 0, 0),
(46, NULL, 36, 22, 'jajecznica :)\r\n', '2020-02-05 18:43:38', '2020-02-05 18:43:38', 0, 2, 0, 0, 0),
(47, NULL, 5, 22, 'kura byla jajko', '2020-02-05 20:30:11', '2020-02-05 20:30:11', 0, 0, 0, 0, 0),
(48, NULL, 7, 24, 'sdf sdf sadf as ', '2020-02-06 09:56:42', '2020-02-06 09:56:42', 0, 0, 0, 0, 0),
(49, NULL, 7, 24, 'sdfgsdfgsdfg', '2020-02-06 15:27:17', '2020-02-06 15:27:17', 0, 0, 0, 0, 0),
(50, NULL, 7, 24, 'dsfgsdfgd', '2020-02-06 15:27:28', '2020-02-06 15:27:28', 0, 0, 0, 0, 0),
(51, NULL, 7, 22, 'asfafsd asd sadf as asd asdf das', '2020-02-09 16:09:39', '2020-02-09 16:09:39', 0, 0, 0, 0, 0),
(52, NULL, 43, 22, 'Pierwsze było jajo, gdyż gady (jajorodne) są wcześniej w drabince ewolucyjnej niż ptaki, nawet nieloty :)', '2020-02-10 08:38:27', '2020-02-10 08:38:27', 0, 0, 0, 0, 0),
(53, NULL, 6, 22, 'Uważają filozofowie lat przeszłych, iż problem ten nierozwiązywalny jest. W akcie kreacji swojej Bóg zapewne stworzył kurę jako stworzenie, które następnie jajka począć zaczęło. Gdybyż bowiem jajko wpierw zaistniało, nie miałby kto go wysiedzieć, toteż i ', '2020-02-11 11:06:15', '2020-02-11 11:06:15', 0, 0, 0, 0, 0),
(54, NULL, 5, 11, 'test answer', '2020-02-12 19:47:51', '2020-02-12 19:47:51', 0, 1, 0, 0, 0),
(55, NULL, 44, 11, 'test answer from another account', '2020-02-12 19:50:21', '2020-02-12 19:50:21', 0, 0, 0, 0, 0),
(56, NULL, 7, 24, 'sadfsdf asdf sadf asd', '2020-02-12 20:19:09', '2020-02-12 20:19:09', 0, 0, 0, 0, 0),
(57, NULL, 7, 24, 'sadf sadf asd fasdf asdf asd fas ', '2020-02-12 20:19:21', '2020-02-12 20:19:21', 0, 0, 0, 0, 0),
(58, NULL, 5, 10, 'odpowiedz test', '2020-02-12 20:58:58', '2020-02-12 20:58:58', 0, 0, 0, 0, 0),
(59, NULL, 5, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i', '2020-02-12 20:59:51', '2020-08-08 12:08:23', 1, 0, 6, 0, 0),
(60, NULL, 7, 27, 'asdfasdfa', '2020-02-12 21:17:04', '2020-02-12 21:17:04', 0, 0, 0, 0, 0),
(61, NULL, 8, 22, 'fgdfgdfgdfg', '2020-02-13 18:27:05', '2020-02-13 18:27:05', 0, 1, 0, 0, 0),
(62, NULL, 7, 28, 'hgdhgfhhfg', '2020-02-15 11:27:01', '2020-02-15 11:27:01', 0, 0, 0, 0, 0),
(63, NULL, 7, 24, 'lkjhkjhkjhkjh jh kjhkjh jkh', '2020-02-15 18:59:18', '2020-02-15 18:59:18', 0, 0, 0, 0, 0),
(64, NULL, 7, 24, 'asdfasdf', '2020-02-15 19:00:59', '2020-02-15 19:00:59', 0, 0, 0, 0, 0),
(65, NULL, 7, 29, 'sdfsd sdf sd ds', '2020-02-16 10:06:13', '2020-02-16 10:06:13', 0, 0, 0, 0, 0),
(66, NULL, 8, 29, 'gdgg', '2020-02-17 17:36:43', '2020-02-17 17:36:43', 0, 0, 0, 0, 0),
(67, NULL, 45, 29, 'testo testo', '2020-02-17 20:03:17', '2020-02-17 20:03:17', 0, 0, 0, 0, 0),
(68, NULL, 45, 22, 'sdfas asdasdsas asd', '2020-02-17 20:04:30', '2020-02-17 20:04:30', 0, 0, 0, 0, 0),
(69, NULL, 45, 22, 'sdf  asdfsfafsadfasdfsa sadfsadfas', '2020-02-17 20:04:47', '2020-02-17 20:04:47', 0, 0, 0, 0, 0),
(70, NULL, 45, 22, 'sadfs sdfsadssafa', '2020-02-17 20:05:48', '2020-02-17 20:05:48', 0, 0, 0, 0, 0),
(71, NULL, 45, 22, 'sasdfa asdfsad', '2020-02-17 20:06:33', '2020-02-17 20:06:33', 0, 1, 0, 0, 0),
(72, NULL, 36, 29, 'Dodaję komentarz\r\n', '2020-02-17 20:44:16', '2020-02-17 20:44:16', 0, 0, 0, 0, 0),
(73, NULL, 31, 29, 'Łukaszu jaki cel ma ten odnośnik w prawym górnym rogu \"\"pierwszy art\" tego artykułu? Odsyła mnie do My Content ale chtba do Twojego :P ', '2020-02-18 16:51:41', '2020-02-18 16:51:41', 0, 1, 0, 0, 0),
(74, NULL, 31, 30, 'daj znać czy dostałaś powiadomienie o akceptacji i dodaniu komentu', '2020-02-18 18:09:39', '2020-02-18 18:09:39', 0, 0, 0, 0, 0),
(75, NULL, 31, 30, 'i łapki w górę', '2020-02-18 18:10:14', '2020-02-18 18:10:14', 0, 0, 0, 0, 0),
(76, NULL, 8, 23, 'fdsf', '2020-02-19 17:28:53', '2020-02-19 17:28:53', 0, 0, 0, 0, 0),
(77, NULL, 7, 22, 'asda asd asaaas as asd asd as asd', '2020-02-20 09:06:45', '2020-02-20 09:06:45', 0, 1, 0, 0, 0),
(78, NULL, 5, 22, 'bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz bardzo dluga odpowiedz ', '2020-02-20 10:31:31', '2020-02-20 10:31:31', 0, 0, 0, 0, 0),
(79, NULL, 7, 18, 'fdghdfgh dfgh dgfhh', '2020-02-21 08:28:12', '2020-02-21 08:28:12', 0, 0, 0, 0, 0),
(80, NULL, 7, 22, 'Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , Ja sie nie znam ale sie wypowiem , ', '2020-02-21 08:41:04', '2020-02-21 08:41:04', 0, 0, 0, 0, 0),
(81, NULL, 5, 22, '<p><span class=\"marker\">sdcbgfhvgcf</span></p>\r\n', '2020-02-23 20:43:28', '2020-02-23 20:43:28', 0, 0, 0, 0, 0),
(82, NULL, 7, 22, '<p>sdfsadf&nbsp; asdf asd asd asd asd</p>\r\n', '2020-02-23 22:39:39', '2020-02-23 22:39:39', 0, 0, 0, 0, 0),
(83, NULL, 7, 22, '<p><strong>sadf asd asd&nbsp;</strong></p>\r\n', '2020-02-23 22:41:35', '2020-02-23 22:41:35', 0, 0, 0, 0, 0),
(84, NULL, 7, 23, 'erwertwert', '2020-02-24 23:21:52', '2020-02-24 23:28:06', 1, 0, 0, 0, 0),
(85, NULL, 7, 28, '<p>sfdf gg sd gsd gsdf gdsf gsd gsd ds gsdfg&nbsp;</p>\r\n', '2020-02-24 23:25:26', '2020-02-24 23:25:26', 0, 0, 0, 0, 0),
(86, NULL, 8, 23, 'hhfhfhd', '2020-02-25 18:10:26', '2020-02-25 18:10:26', 0, 0, 0, 0, 0),
(87, NULL, 7, 28, '<p><strong>Bbbbhhhh</strong></p>\r\n', '2020-02-25 18:34:14', '2020-02-25 18:34:14', 0, 1, 0, 0, 0),
(88, NULL, 7, 17, 'Fajna głowa', '2020-02-27 18:38:47', '2020-02-27 18:38:47', 0, 0, 0, 0, 0),
(89, NULL, 7, 32, 'asdasd asd as das', '2020-02-29 20:13:12', '2020-02-29 20:13:12', 0, 0, 0, 0, 0),
(90, NULL, 5, 22, '<p>gggggggg</p>\r\n', '2020-03-01 18:15:05', '2020-03-16 09:39:41', 1, 0, 0, 0, 0),
(91, NULL, 7, 32, 'sdgsdfgsd', '2020-03-01 19:24:35', '2020-03-01 19:24:35', 0, 0, 0, 0, 0),
(92, NULL, 34, 33, '<p>Z tym budżetem znajdzie się ktoś kto Ci takie namaluje :D</p>\r\n', '2020-03-07 13:09:55', '2020-03-07 13:09:55', 0, 0, 0, 0, 0),
(93, NULL, 8, 25, 'Nowy komentarz', '2020-03-08 17:19:58', '2020-03-08 17:21:25', 1, 0, 0, 0, 0),
(94, NULL, 7, 38, '<p><img src=\"/uploads/29adb56c-eeb5-4ad9-b755-c46fae1ad639-image.png\" style=\"height:997px; width:1657px\" /></p>\r\n', '2020-03-24 18:26:52', '2020-03-24 18:26:52', 0, 0, 0, 0, 0),
(95, NULL, 8, 36, '<p><img alt=\"\" src=\"/uploads/HS30_08_Detail.jpg\" /></p>\r\n', '2020-03-24 18:30:12', '2020-03-24 18:30:12', 0, 0, 0, 0, 0),
(96, NULL, 5, 31, '<p>aaa</p>\r\n', '2020-04-10 21:15:40', '2020-04-10 21:15:40', 0, 0, 0, 0, 0),
(97, NULL, 5, 31, '<p>bbb</p>\r\n', '2020-04-10 21:15:57', '2020-04-10 21:15:57', 0, 0, 0, 0, 0),
(98, NULL, 5, 10, '<p>111</p>\r\n', '2020-04-10 21:49:03', '2020-04-10 21:50:30', 1, 0, 0, 0, 0),
(99, 98, 5, 10, '222', '2020-04-10 21:49:13', '2020-04-10 21:50:24', 1, 0, 0, 0, 0),
(100, 99, 5, 10, '333', '2020-04-10 21:49:23', '2020-04-10 21:50:18', 1, 0, 0, 0, 0),
(101, NULL, 5, 32, '111', '2020-04-10 21:51:15', '2020-04-10 21:51:15', 0, 0, 0, 0, 0),
(102, 101, 5, 32, '222', '2020-04-10 21:51:32', '2020-04-10 21:51:32', 0, 0, 0, 0, 0),
(103, 102, 5, 32, '333', '2020-04-10 21:51:38', '2020-04-10 21:51:38', 0, 0, 0, 0, 0),
(104, 94, 7, 38, 'jhgjghjgghg', '2020-05-04 13:18:45', '2020-05-04 13:18:45', 0, 0, 0, 0, 0),
(105, 104, 7, 38, 'kklklklk', '2020-05-04 13:19:02', '2020-05-04 13:19:02', 0, 0, 0, 0, 0),
(106, 59, 51, 10, 'cascsa', '2020-05-05 20:14:24', '2020-05-05 20:14:24', 0, 0, 0, 0, 0),
(107, 59, 51, 10, 'test2', '2020-05-05 20:14:53', '2020-05-05 20:14:53', 0, 0, 0, 0, 0),
(108, NULL, 7, 38, '<p>jhgjh jhg jhg jghjgh jhg&nbsp;</p>\r\n\r\n<p>jh kjh kjhkjh kjh kjhkjh</p>\r\n\r\n<p>jhk hkhkj h</p>\r\n', '2020-05-17 19:56:19', '2020-05-17 19:56:19', 0, 0, 0, 0, 0),
(109, NULL, 7, 38, '<p>Najpierw zrobią wodę z m&oacute;zgu ptakom, a potem przyjdzie czas na ludzi. Niepokojące fotografie gęsi zamieszczają od rana mieszkańcy Sanoka i okolicznych miejscowości. Na zdjęciach widać, że zamiast w kluczu zmanipulowane ptaki lecą w gwieździe Dawida.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><br />\r\nPrzed uruchomieniem stacji bazowej ptactwo zachowywało się normalnie. Bociany budowały gniazda z patyk&oacute;w, śpiew słowik&oacute;w słychać było w całej okolicy. Wszystko zmieniło się kilka dni temu, wraz z włączeniem sygnału 5G.<br />\r\n<br />\r\n- Bociany jako pierwsze wyczuły zbliżające się zagrożenie - przyznaje pani Agata, założycielka facebookowej grupy &quot;Prawda o 5G, szczepionkach, chemtrailsach&quot;. - Już od tygodnia zamiast patyk&oacute;w zaczęły budować gniazda z puszek, by aluminium odbiło szkodliwe promieniowanie.</p>\r\n\r\n<p><br />\r\nNiestety, gęsi najwyraźniej pozostały głuche na prawdę o technologii 5G. Od rana latają po Podkarpaciu w nieznanej ornitologom formacji gwiazdy Dawida. Zdaniem obserwator&oacute;w, niekt&oacute;re z nich pozostawiają na niebie dziwne, białe smugi.<br />\r\n<br />\r\n- Zamiast porannych treli, obudziły mnie wersety z Talmudu - skarży się pan Wojciech, kt&oacute;ry przez uruchomienie masztu 5G musiał pożegnać się z miłym, słowiczym śpiewem.<br />\r\n<br />\r\nPodkarpacie nie jest jedyne. Sygnały o dewastującym wpływie fal 5G na m&oacute;zgi ptak&oacute;w napływają z całego kraju.<br />\r\n<br />\r\nW mediach społecznościowych pojawiły się niepokojące doniesienia o ogłupiałych gołębiach, kt&oacute;re latają w k&oacute;łko nad Warszawą.<br />\r\n<br />\r\n<em>To jest ASZdziennik. Wszystkie cytaty i wydarzenia zostały zmyślone.</em></p>\r\n', '2020-05-17 19:56:48', '2020-05-17 19:56:48', 0, 0, 0, 0, 0),
(110, 12, 7, 10, 'lalalaasda jk kjh', '2020-05-18 07:00:25', '2020-06-02 18:38:02', 0, 0, 0, 1, 7),
(111, NULL, 7, 43, '<p>sdfsfskdjflsaldjksfd</p>\r\n', '2020-05-24 07:54:38', '2020-05-24 07:54:38', 0, 0, 0, 0, 0),
(112, 111, 7, 43, 'sdkjflsajfafs', '2020-05-24 07:54:47', '2020-05-24 07:54:47', 0, 0, 0, 0, 0),
(113, 94, 7, 38, 'asdasdasad', '2020-05-25 21:14:46', '2020-05-25 21:14:46', 0, 0, 0, 0, 0),
(114, NULL, 7, 32, 'asdasdsad', '2020-05-25 21:15:22', '2020-05-25 21:15:22', 0, 0, 0, 0, 0),
(115, 94, 45, 38, 'sdfas fasdf sad das', '2020-05-26 12:26:25', '2020-06-03 20:34:19', 1, 0, 7, 0, 0),
(116, NULL, 5, 32, 'test1', '2020-05-29 15:39:24', '2020-05-29 15:39:24', 0, 0, 0, 0, 0),
(117, NULL, 5, 32, 'test2', '2020-05-29 15:39:36', '2020-05-29 15:39:36', 0, 0, 0, 0, 0),
(118, NULL, 52, 22, '<p>jajko</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2020-05-30 10:14:02', '2020-05-30 10:14:02', 0, 0, 0, 0, 0),
(119, NULL, 52, 22, '<p>kura</p>\r\n', '2020-05-30 10:15:01', '2020-06-27 09:39:43', 1, 1, 7, 0, 0),
(120, NULL, 52, 19, 'kura ', '2020-05-30 10:20:34', '2020-05-30 10:20:34', 0, 0, 0, 0, 0),
(121, NULL, 52, 19, 'jajako', '2020-05-30 10:20:43', '2020-05-30 10:20:43', 0, 0, 0, 0, 0),
(122, NULL, 52, 19, 'rtyhjk', '2020-05-30 10:20:51', '2020-05-30 10:20:51', 0, 0, 0, 0, 0),
(123, NULL, 52, 19, 'wertyuiop[', '2020-05-30 10:20:59', '2020-05-30 10:20:59', 0, 0, 0, 0, 0),
(124, NULL, 52, 19, 'wertyuiop;lkjhgf', '2020-05-30 10:21:07', '2020-05-30 10:21:07', 0, 0, 0, 0, 0),
(125, NULL, 52, 19, 'wertyujkhg', '2020-05-30 10:21:14', '2020-05-30 10:21:14', 0, 0, 0, 0, 0),
(126, NULL, 52, 19, 'wertyuiolgggg', '2020-05-30 10:21:23', '2020-05-30 10:21:23', 0, 0, 0, 0, 0),
(127, NULL, 52, 32, 'Experienced crypto users will answer questions raised by newbies and gain ‘reputation’ by doing so. New leaders will emerge and monetise their knowledge in several different ways, including publishing their own online courses, investment strategies, fundamental and technical analyses with content paywalls, and so forth. \n\n \n\nNew users are enticed to stay with ccFound for the long term through a growing database of market reports, articles and news, all written by the community, for the community. \n\n \n\nOne does not live on cryptocurrencies alone. A principal rule of investing is to diversify one’s assets. The ccFound community’s purpose is to create the largest knowledge base about investment – across all asset classes - on the Internet. As such, ccFound will be a huge information distribution channel on everything connected to investing - but owned by the people. \n\n \n\nccFound will give its income back to the community as users become co-owners of the platform and participate in it actively through DAO and STO mechanisms (which stand for “decentralised autonomous organisation” and “security token offering”). \n\n \n\n“A decentralised autonomous organisation (DAO), sometimes labelled a decentralided autonomous corporation (DAC) (...) is an organisation represented by rules encoded as a computer program that is transparent, controlled by shareholders and not influenced by a central government. A DAO\'s financial transaction record and program rules are maintained on a blockchain” (source: Wikipedia)\n \n\nccFound will issue at least two types of tokens on a public blockchain - one of them representing a stake in ownership of the system with voting and dividend rights, the other one being a stablecoin chained in its value to USD or a basket of currencies. \n\n \n\nccFound not only teaches about investments and how to achieve financial freedom, but becomes in itself an investment for its users and a way of pursuing the financially-free life, allowing users to earn money through DAO dividends, along with publishing and monetising content. EDITED TEST\n', '2020-05-31 18:42:55', '2020-06-02 18:20:10', 0, 0, 0, 1, 5),
(128, NULL, 7, 45, '<p>qwerqwer</p>\r\n', '2020-06-01 15:38:22', '2020-06-01 15:38:50', 1, 0, 0, 0, 0),
(129, 128, 7, 45, 'asdfasdfsa asd', '2020-06-01 15:38:31', '2020-06-01 15:38:38', 1, 0, 0, 0, 0),
(130, NULL, 7, 47, '<p>lkjlkkljlj EDIT COMMENT SAVE</p>\n', '2020-06-01 15:52:12', '2020-06-02 18:18:41', 0, 0, 0, 1, 5),
(131, 130, 7, 47, 'kjhkjhkjhkj', '2020-06-01 15:52:20', '2020-06-01 15:52:20', 0, 0, 0, 0, 0),
(132, 130, 5, 47, 'test replay EDITED', '2020-06-02 18:18:59', '2020-06-02 18:19:26', 0, 0, 0, 1, 5),
(133, 127, 5, 32, 'replay EDIT', '2020-06-02 18:20:47', '2020-06-02 18:20:57', 0, 0, 0, 1, 5),
(134, 133, 5, 32, 'replay test EDITED', '2020-06-02 18:21:24', '2020-06-02 18:21:49', 0, 0, 0, 1, 5),
(135, 132, 5, 47, 'cccEDIT', '2020-06-02 18:24:33', '2020-06-02 18:24:46', 0, 0, 0, 1, 5),
(136, NULL, 45, 50, 'kjhkjhkjh', '2020-06-04 07:06:32', '2020-06-04 07:06:39', 1, 0, 45, 0, 0),
(137, NULL, 45, 50, 'lololol 2', '2020-06-04 07:06:49', '2020-06-04 07:07:01', 0, 0, 0, 1, 45),
(138, NULL, 48, 10, '<p>aaa<strong>BBB</strong></p>\n', '2020-06-04 13:14:31', '2020-08-08 12:35:23', 1, 0, 6, 1, 48),
(139, NULL, 31, 49, '<p>weretydufgkhl.</p>\n', '2020-06-05 10:40:46', '2020-06-05 10:41:04', 1, 0, 31, 1, 31),
(140, NULL, 7, 59, '<p>zczxczxczczx</p>\r\n', '2020-06-20 03:30:52', '2020-06-20 03:30:52', 0, 0, 0, 0, 0),
(141, 118, 7, 22, 'fghfghf', '2020-06-21 11:59:20', '2020-06-21 11:59:20', 0, 0, 0, 0, 0),
(142, 119, 51, 22, 'rrteterte', '2020-06-21 14:39:55', '2020-06-21 14:39:55', 0, 0, 0, 0, 0),
(143, NULL, 51, 22, '<p>jgghhgjhgjgjgh</p>\r\n', '2020-06-21 14:40:17', '2020-07-05 16:06:48', 1, 0, 7, 0, 0),
(144, NULL, 7, 22, '<p>zxczx zdzsdz zzxfz zxfzfx zxfz zfzz zzzzzzzzz</p>\r\n', '2020-06-26 08:10:35', '2020-06-26 08:10:35', 0, 0, 0, 0, 0),
(145, 46, 7, 22, 'zxcc zxczxczx zxczcz zxcz ', '2020-06-26 08:10:54', '2020-06-26 08:10:54', 0, 0, 0, 0, 0),
(146, NULL, 7, 22, '<p>sczxvxzvxz</p>\r\n', '2020-06-26 09:17:43', '2020-06-26 09:17:43', 0, 1, 0, 0, 0),
(147, NULL, 51, 32, 'ajkhsajkjsakldjkasj', '2020-06-26 12:00:47', '2020-06-26 12:00:47', 0, 0, 0, 0, 0),
(148, 145, 51, 22, 'gddrhtrfgfghfhfgh', '2020-06-26 12:12:02', '2020-08-26 12:18:41', 1, 1, 7, 0, 0),
(149, 46, 51, 22, 'fsdfsdfdsfdsfsd', '2020-06-26 12:22:27', '2020-06-26 12:22:27', 0, 0, 0, 0, 0),
(150, 46, 7, 22, 'vxxcvxcvxcvx', '2020-06-26 12:58:33', '2020-06-26 12:58:33', 0, 0, 0, 0, 0),
(151, NULL, 7, 10, '<p><img alt=\"\" src=\"/uploads/81976705_603362693539835_1133001334618849280_n.jpg\" style=\"height:2016px; width:1504px\" /></p>\r\n', '2020-06-26 16:40:50', '2020-06-26 16:40:50', 0, 0, 0, 0, 0),
(152, 133, 7, 32, 'dfgdgfdgfdgdf', '2020-06-27 09:13:05', '2020-06-27 09:13:05', 0, 0, 0, 0, 0),
(153, 127, 7, 32, 'rterterterterter', '2020-06-27 09:13:14', '2020-06-27 09:13:14', 0, 0, 0, 0, 0),
(154, 101, 7, 32, 'zcxzczxczxczxc', '2020-06-27 19:04:58', '2020-06-27 19:04:58', 0, 0, 0, 0, 0),
(155, 101, 7, 32, 'cvxzczxczxcvvvv', '2020-06-27 19:19:22', '2020-06-27 19:19:22', 0, 0, 0, 0, 0),
(156, 101, 7, 32, 'gsdgsdgsc  sdfsdfs', '2020-06-27 19:20:36', '2020-06-27 19:20:36', 0, 0, 0, 0, 0),
(157, 101, 7, 32, 'sdfsdfsdf', '2020-06-27 19:20:41', '2020-06-27 19:20:41', 0, 0, 0, 0, 0),
(158, 102, 7, 32, 'dfsdfsdfsdfsdfs', '2020-06-27 19:20:55', '2020-06-27 19:20:55', 0, 0, 0, 0, 0),
(159, 102, 7, 32, 'hgfhfg fghfghfg fghfgh', '2020-06-27 19:28:11', '2020-06-27 19:28:11', 0, 0, 0, 0, 0),
(160, 101, 7, 32, 'fghfg fghfg fghfghf', '2020-06-27 19:28:21', '2020-06-27 19:28:21', 0, 0, 0, 0, 0),
(161, 149, 7, 22, 'vsdvxvcxvxcv', '2020-06-27 19:31:40', '2020-06-27 19:31:40', 0, 0, 0, 0, 0),
(162, NULL, 7, 22, '<p>ggfgsdgd sdgsdgdsgsdg</p>\r\n', '2020-06-29 22:51:15', '2020-06-29 22:51:15', 0, 0, 0, 0, 0),
(163, NULL, 7, 22, '<p>asdasd asfasfas asfasv safasfsa asdasfasf</p>\r\n', '2020-06-29 22:54:07', '2020-06-29 22:54:07', 0, 0, 0, 0, 0),
(164, NULL, 7, 22, '<p>zczxcz&nbsp; zdvzxx zsvzxczx 44444 5555555555555</p>\r\n', '2020-06-29 22:58:49', '2020-06-29 22:58:49', 0, 0, 0, 0, 0),
(165, NULL, 7, 22, '<p>asdasd asfas sdfsdf</p>\r\n', '2020-06-29 23:00:13', '2020-06-29 23:00:13', 0, 0, 0, 0, 0),
(166, NULL, 7, 22, '<p>zxczxc zcvzxz zq1r3fga43tgrva 4t 4tfwg</p>\r\n', '2020-06-29 23:01:08', '2020-06-29 23:01:08', 0, 0, 0, 0, 0),
(167, NULL, 7, 22, '<p>zxczxc zvzx cxzxvzb zffbzbzvbzv</p>\r\n', '2020-06-29 23:02:54', '2020-06-29 23:02:54', 0, 0, 0, 0, 0),
(168, NULL, 7, 22, '<p>Czxvzx zvzxvzxvzx vzvzxvxz</p>\r\n', '2020-06-29 23:51:08', '2020-06-29 23:51:08', 0, 0, 0, 0, 0),
(169, NULL, 6, 22, '<p>bxbzb gdfg&nbsp; fdgfdg dfgdfg dffsgdgsfdg</p>\r\n', '2020-06-30 07:57:59', '2020-06-30 07:57:59', 0, 0, 0, 0, 0),
(170, 48, 6, 24, 'cvzvxzvzxv', '2020-06-30 07:59:28', '2020-06-30 07:59:28', 0, 0, 0, 0, 0),
(171, NULL, 7, 22, '<p>dgadg ga dsgagsdg&nbsp; asasdf&nbsp; afd</p>\r\n', '2020-06-30 08:00:50', '2020-06-30 08:00:50', 0, 0, 0, 0, 0),
(172, NULL, 7, 10, '<p>CVXcvxc xvxcv xv xcvxvcx</p>\r\n', '2020-06-30 08:25:43', '2020-06-30 08:25:43', 0, 0, 0, 0, 0),
(173, 46, 51, 22, 'Na serio?', '2020-07-02 19:22:16', '2020-07-02 19:22:16', 0, 1, 0, 0, 0),
(174, NULL, 51, 22, '<p>Na serio?</p>\r\n', '2020-07-02 19:22:49', '2020-07-29 12:59:17', 1, 0, 7, 0, 0),
(175, 46, 51, 22, 'Nie wierze', '2020-07-02 19:55:46', '2020-07-02 19:55:46', 0, 0, 0, 0, 0),
(176, 46, 51, 22, 'Chce uwierzyć', '2020-07-02 19:57:16', '2020-07-02 19:57:16', 0, 0, 0, 0, 0),
(177, 46, 51, 22, 'Dawaj ją :)', '2020-07-02 20:11:54', '2020-07-02 20:11:54', 0, 0, 0, 0, 0),
(178, 46, 51, 22, 'sdfsdfsdfsdf', '2020-07-02 20:16:08', '2020-07-02 20:16:08', 0, 0, 0, 0, 0),
(179, 46, 51, 22, 'smacznego', '2020-07-02 20:21:15', '2020-07-02 20:21:15', 0, 0, 0, 0, 0),
(180, 46, 51, 22, 'Kolejna próba :D', '2020-07-02 20:24:28', '2020-07-02 20:24:28', 0, 0, 0, 0, 0),
(181, 71, 7, 22, 'jksdkjas jahsjkasd ajshdjkas jsadbjkas jkabdsjkasjkbdjk', '2020-07-05 11:57:27', '2020-07-05 11:57:27', 0, 0, 0, 0, 0),
(182, NULL, 7, 72, 'dsdasdadas', '2020-07-05 21:21:10', '2020-07-05 21:21:10', 0, 1, 0, 0, 0),
(183, NULL, 7, 72, 'afasfas gdsfdsfs', '2020-07-05 21:22:55', '2020-07-05 21:22:55', 0, 1, 0, 0, 0),
(184, 182, 51, 72, 'Test button', '2020-07-05 21:30:33', '2020-07-05 21:30:33', 0, 1, 0, 0, 0),
(185, 184, 7, 72, 'O tak :D', '2020-07-05 22:01:27', '2020-07-05 22:01:27', 0, 1, 0, 0, 0),
(186, NULL, 51, 78, '<p>Interesujące</p>\r\n', '2020-07-18 20:39:46', '2020-07-18 20:39:46', 0, 0, 0, 0, 0),
(187, 186, 51, 78, 'Lol', '2020-07-18 20:40:03', '2020-07-18 20:40:03', 0, 0, 0, 0, 0),
(188, 186, 51, 78, 'dadsa', '2020-07-18 20:43:29', '2020-07-18 20:43:29', 0, 0, 0, 0, 0),
(189, 186, 51, 78, 'adasdas addasda as', '2020-07-18 20:44:12', '2020-07-18 20:44:12', 0, 0, 0, 0, 0),
(190, 186, 51, 78, 'asdhbj jaskbdjkas klasdkljadsjkl', '2020-07-18 20:47:10', '2020-07-18 20:47:10', 0, 0, 0, 0, 0),
(191, 186, 51, 78, 'Xjnajkd kasndk klasjdkljklsa', '2020-07-18 20:51:34', '2020-07-18 20:51:34', 0, 0, 0, 0, 0),
(192, 186, 51, 78, 'adsdas asda asda asdadas', '2020-07-18 20:56:38', '2020-07-18 20:56:38', 0, 0, 0, 0, 0),
(193, NULL, 7, 78, '<p>asdas adasdsad adsadd</p>\r\n', '2020-07-18 20:57:18', '2020-07-18 20:57:18', 0, 0, 0, 0, 0),
(194, NULL, 7, 10, '<p>asdsda adsa asdada daad asdasdadad</p>\r\n', '2020-07-18 21:02:21', '2020-07-18 21:02:21', 0, 0, 0, 0, 0),
(195, NULL, 7, 10, '<p>asdas ada asd aa adasd ad a</p>\r\n', '2020-07-18 21:05:24', '2020-07-18 21:05:24', 0, 0, 0, 0, 0),
(196, NULL, 7, 10, '<p>asda ada adds adsa</p>\r\n', '2020-07-18 21:06:00', '2020-07-18 21:06:00', 0, 0, 0, 0, 0),
(197, 31, 31, 22, 'Odpowiedź', '2020-07-22 01:07:46', '2020-07-22 01:08:10', 1, 0, 7, 0, 0),
(198, 31, 31, 22, 'nie usuwać :P', '2020-07-22 01:11:49', '2020-07-22 01:12:05', 1, 0, 7, 0, 0),
(199, NULL, 7, 82, 'kjdkfjdsjf dofjidsojfo kdskfjosdijf dskfndsiofn sdfosdifj', '2020-07-30 21:28:22', '2020-07-30 21:29:01', 1, 0, 6, 0, 0),
(200, NULL, 6, 100, 'werwer vewr ew rwe rwe r', '2020-09-14 06:18:56', '2020-09-14 06:18:56', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notes_comments`
--

CREATE TABLE `notes_comments` (
  `id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `note_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `notes_comments`
--

INSERT INTO `notes_comments` (`id`, `parent_id`, `user_id`, `note_id`, `article_id`, `description`, `created`, `updated`, `is_deleted`) VALUES
(1, NULL, 5, 1, 0, 'test note comment', '2019-11-11 09:43:55', '2019-11-11 09:43:55', 0),
(2, NULL, 5, 2, 0, 'first step', '2019-11-11 09:56:40', '2019-11-11 09:56:40', 0),
(4, 1, 5, 0, 0, 'step 2 comment', '2019-11-11 12:07:29', '2019-11-11 12:07:29', 0),
(5, 1, 5, 0, 0, 'step 2 2 comment', '2019-11-11 12:41:15', '2019-11-11 12:41:15', 0),
(6, NULL, 5, 1, 0, '1 step comment', '2019-11-11 12:44:52', '2019-11-11 12:44:52', 0),
(7, NULL, 6, 5, 0, 'Testowanie mikrofonu', '2019-11-22 11:27:05', '2019-11-22 11:27:05', 0),
(8, NULL, 5, 6, 11, 'ccc', '2019-12-11 21:14:23', '2019-12-11 21:14:23', 0),
(9, NULL, 5, 8, 5, 'ccccc', '2019-12-11 21:15:56', '2019-12-11 21:15:56', 0),
(10, NULL, 5, 8, 5, 'mmmm', '2019-12-11 21:16:03', '2019-12-11 21:16:03', 0),
(11, 10, 5, 8, 5, 'mm222', '2019-12-11 21:16:13', '2019-12-11 21:16:13', 0),
(12, NULL, 6, 10, 12, 'na serwer są wgrane nowe widoki, mianowicie widok artykułu, oraz lista artykułów\r\nna widoku artykułów jest mozliwość dodawania komentarzy/akceptacji itp, pojawia się także część wiadomości w inbox związanych z tymi akcjami\r\ndodana jest także mozliwość uzu', '2020-01-11 15:35:12', '2020-01-11 15:35:12', 0),
(13, 12, 6, 10, 12, 'na serwer są wgrane nowe widoki, mianowicie widok artykułu, oraz lista artykułów\r\nna widoku artykułów jest mozliwość dodawania komentarzy/akceptacji itp, pojawia się także część wiadomości w inbox związanych z tymi akcjami\r\ndodana jest także mozliwość uzu', '2020-01-11 15:35:17', '2020-01-11 15:35:17', 0),
(14, 8, 5, 6, 11, 'sadfasdfa', '2020-02-02 21:18:48', '2020-02-02 21:18:48', 0),
(15, 8, 5, 6, 11, 'sadfasdfa', '2020-02-02 21:18:50', '2020-02-02 21:18:50', 0),
(16, 8, 5, 6, 11, 'sadfasdfa', '2020-02-02 21:18:51', '2020-02-02 21:18:51', 0),
(17, 8, 5, 6, 11, 'dfgdsfg', '2020-02-02 21:19:09', '2020-02-02 21:19:09', 0),
(18, NULL, 7, 32, 21, 'kmlmlk,m,m', '2020-02-04 18:38:15', '2020-02-04 18:38:15', 0),
(19, NULL, 5, 36, 10, 'replay', '2020-02-04 21:30:01', '2020-02-04 21:30:01', 0),
(20, 19, 5, 36, 10, 'ghgh', '2020-02-04 21:30:13', '2020-02-04 21:30:13', 0),
(21, NULL, 5, 36, 10, 'qqq', '2020-02-04 21:51:07', '2020-02-04 21:51:07', 0),
(22, 18, 7, 32, 21, 'bcvbxcvbxcbx', '2020-02-05 11:07:46', '2020-02-05 11:07:46', 0),
(23, 18, 7, 32, 21, 'cxvbxcvbxcv', '2020-02-05 11:07:52', '2020-02-05 11:07:52', 0),
(24, 18, 7, 32, 21, 'cxvbxcvbxcv', '2020-02-05 11:07:53', '2020-02-05 11:07:53', 0),
(25, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:01', '2020-02-05 11:08:01', 0),
(26, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:05', '2020-02-05 11:08:05', 0),
(27, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:06', '2020-02-05 11:08:06', 0),
(28, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:06', '2020-02-05 11:08:06', 0),
(29, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:07', '2020-02-05 11:08:07', 0),
(30, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:07', '2020-02-05 11:08:07', 0),
(31, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:07', '2020-02-05 11:08:07', 0),
(32, 18, 7, 32, 21, 'xcvbxcbcxvbxcvbxc  xcvb xc vc', '2020-02-05 11:08:08', '2020-02-05 11:08:08', 0),
(33, NULL, 7, 30, 22, 'gfhfg', '2020-02-05 11:11:03', '2020-02-05 11:11:03', 0),
(34, 33, 7, 30, 22, 'adad', '2020-02-06 17:41:34', '2020-02-06 17:41:34', 0),
(35, NULL, 5, 15, 19, 'hjhj', '2020-02-06 17:44:00', '2020-02-20 23:16:18', 1),
(36, NULL, 5, 16, 19, 'test report', '2020-02-06 17:48:47', '2020-02-06 17:48:47', 0),
(37, 35, 5, 15, 19, 'test report', '2020-02-06 18:46:58', '2020-02-06 18:46:58', 0),
(38, 18, 7, 32, 21, 'sdds', '2020-02-07 20:44:50', '2020-02-07 20:44:50', 0),
(39, NULL, 7, 36, 10, 'ijhkjhkjh', '2020-02-09 16:03:13', '2020-02-09 16:03:13', 0),
(40, NULL, 7, 12, 10, 'sdfasdfas', '2020-02-09 16:14:41', '2020-02-09 16:14:41', 0),
(41, NULL, 7, 28, 10, 'stghfsghdfhgd', '2020-02-09 16:15:26', '2020-02-09 16:15:26', 0),
(42, NULL, 7, 12, 10, 'sadsgdsfgdfgsd', '2020-02-09 16:16:19', '2020-03-03 14:24:46', 1),
(43, NULL, 7, 12, 10, 'dsfgsdfg', '2020-02-09 16:17:02', '2020-02-09 16:17:02', 0),
(44, 33, 7, 30, 22, 'hjgjh', '2020-02-09 16:22:17', '2020-02-09 16:22:17', 0),
(45, 33, 7, 30, 22, 'hjgjh', '2020-02-09 16:22:18', '2020-02-09 16:22:18', 0),
(46, 33, 7, 30, 22, 'kkkk 3x', '2020-02-09 16:22:47', '2020-02-09 16:22:47', 0),
(47, 33, 7, 30, 22, 'kjh', '2020-02-09 16:23:00', '2020-02-09 16:23:00', 0),
(48, NULL, 7, 47, 22, 'kjgjkgjgj', '2020-02-09 16:23:49', '2020-02-09 16:23:49', 0),
(49, NULL, 7, 47, 22, 'kjgjkgjgj', '2020-02-09 16:23:50', '2020-02-09 16:23:50', 0),
(50, NULL, 7, 30, 22, 'sasdfasfda', '2020-02-09 16:24:11', '2020-02-09 16:24:11', 0),
(51, NULL, 7, 30, 22, 'sasdfasfda', '2020-02-09 16:24:12', '2020-02-09 16:24:12', 0),
(52, NULL, 7, 30, 22, 'sasdfasfda', '2020-02-09 16:24:12', '2020-02-09 16:24:12', 0),
(53, NULL, 7, 30, 22, 'sasdfasfda', '2020-02-09 16:24:13', '2020-02-09 16:24:13', 0),
(55, NULL, 7, 50, 24, 'sdfsadf asd f', '2020-02-12 20:20:01', '2020-02-12 20:20:01', 0),
(56, NULL, 7, 50, 24, 'sdfsadf asd f', '2020-02-12 20:20:01', '2020-02-12 20:20:01', 0),
(57, NULL, 7, 50, 24, 'sdfsadf asd f', '2020-02-12 20:20:02', '2020-02-12 20:20:02', 0),
(58, NULL, 7, 50, 24, 'sdfsadf asd f', '2020-02-12 20:20:02', '2020-02-12 20:20:02', 0),
(59, NULL, 7, 50, 24, 'sdfsadf asd f', '2020-02-12 20:20:03', '2020-02-12 20:20:03', 0),
(60, NULL, 7, 50, 24, 'sdfsadf asd f', '2020-02-12 20:20:03', '2020-02-12 20:20:03', 0),
(61, NULL, 7, 50, 24, 'dfsdf', '2020-02-12 20:21:08', '2020-02-12 20:21:08', 0),
(62, NULL, 7, 50, 24, 'redfggsd', '2020-02-12 20:47:39', '2020-02-12 20:47:39', 0),
(63, NULL, 7, 50, 24, 'redfggsd', '2020-02-12 20:47:41', '2020-02-12 20:47:41', 0),
(64, NULL, 7, 50, 24, 'redfggsd', '2020-02-12 20:47:41', '2020-02-12 20:47:41', 0),
(65, NULL, 7, 50, 24, 'redfggsd', '2020-02-12 20:47:42', '2020-02-12 20:47:42', 0),
(66, NULL, 7, 50, 24, 'dsfgsdfgdfgds dsfg s', '2020-02-12 20:48:09', '2020-02-12 20:48:09', 0),
(67, NULL, 7, 50, 24, 'dsfgsdfgdfgds dsfg s', '2020-02-12 20:48:09', '2020-02-12 20:48:09', 0),
(68, NULL, 7, 50, 24, 'dsfgsdfgdfgds dsfg s', '2020-02-12 20:48:10', '2020-02-12 20:48:10', 0),
(69, NULL, 7, 50, 24, 'dsfgsdfgdfgds dsfg s', '2020-02-12 20:48:10', '2020-02-12 20:48:10', 0),
(70, NULL, 7, 50, 24, 'dsfgsdfgdfgds dsfg s', '2020-02-12 20:48:11', '2020-02-12 20:48:11', 0),
(71, NULL, 7, 50, 24, 'dsfgsdfgdfgds dsfg s', '2020-02-12 20:48:11', '2020-02-12 20:48:11', 0),
(72, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:15', '2020-02-12 21:17:15', 0),
(73, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:16', '2020-02-12 21:17:16', 0),
(74, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:17', '2020-02-12 21:17:17', 0),
(75, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:19', '2020-02-12 21:17:19', 0),
(76, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:19', '2020-02-12 21:17:19', 0),
(77, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:20', '2020-02-12 21:17:20', 0),
(78, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:20', '2020-02-12 21:17:20', 0),
(79, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:21', '2020-02-12 21:17:21', 0),
(80, NULL, 7, 60, 27, 'asdfsad fsadf asd', '2020-02-12 21:17:21', '2020-02-12 21:17:21', 0),
(81, NULL, 8, 47, 22, 'dfgdgd', '2020-02-13 18:27:23', '2020-02-13 18:27:23', 0),
(82, NULL, 7, 62, 28, 'kjghihgkjgkj', '2020-02-15 11:27:09', '2020-02-15 11:27:09', 0),
(83, 62, 7, 50, 24, 'To prawda!', '2020-02-16 19:56:28', '2020-02-16 19:56:28', 0),
(84, NULL, 8, 65, 29, 'gfdgf', '2020-02-17 17:36:52', '2020-02-17 17:36:52', 0),
(85, 18, 7, 32, 21, 'odpowiadam\r\n', '2020-02-17 20:47:07', '2020-02-17 20:47:07', 0),
(86, 18, 7, 32, 21, 'okej test', '2020-02-17 21:16:49', '2020-02-17 21:16:49', 0),
(87, 18, 5, 32, 21, 'ddd', '2020-02-17 21:22:39', '2020-02-17 21:22:39', 0),
(88, NULL, 31, 72, 29, 'Fajny ', '2020-02-18 16:53:26', '2020-02-18 16:53:26', 0),
(89, NULL, 7, 73, 29, 'To jest tag \"Pierwszy Art\" , tak ktoś założył :)', '2020-02-18 17:33:20', '2020-02-18 17:33:20', 0),
(90, NULL, 31, 45, 23, 'xd', '2020-02-18 17:36:29', '2020-02-24 23:28:35', 1),
(91, 89, 31, 73, 29, 'spoko :P\r\ndodajcie emotyyyyyyyyy w skrótach klawiaturowych :P :D', '2020-02-18 22:20:36', '2020-02-18 22:20:36', 0),
(92, 89, 31, 73, 29, 'Łukaszu nie dostałem powiadomienia (chyba powinno być w inboxie), że odpowiedziałeś na mój komentarz, dostałem coś takiego testowy20 reported testo testo: \"sadsad fsda asd asd fasd fas\"', '2020-02-18 22:23:37', '2020-02-18 22:23:37', 0),
(93, NULL, 7, 73, 29, 'test replay, Karol zobacz teraz czy sie u Ciebei w inbox pojawia ', '2020-02-20 08:38:59', '2020-02-20 08:38:59', 0),
(94, NULL, 7, 77, 22, 'dasdasd as', '2020-02-20 09:06:58', '2020-02-20 09:06:58', 0),
(95, NULL, 7, 65, 29, 'jhkjkjh', '2020-02-20 09:44:50', '2020-02-20 09:44:50', 0),
(96, NULL, 8, 78, 22, 'W kafelku miał się wyświetlać kawałek treści, a nie cała. Do 3 linijek. A potem kropeczki ...  :)', '2020-02-20 18:39:19', '2020-02-20 18:39:19', 0),
(97, NULL, 8, 74, 30, 'Dostałam powiadomienie o akceptacji, ale nie mam o komentarzu łapce w górę.', '2020-02-20 18:40:16', '2020-02-20 18:40:16', 0),
(98, 90, 7, 45, 23, 'Aas', '2020-02-22 19:00:09', '2020-02-24 23:28:31', 1),
(99, NULL, 7, 76, 23, 'Gggg', '2020-02-25 18:14:32', '2020-02-25 18:14:32', 0),
(100, NULL, 6, 12, 10, 'Zgadzam się', '2020-03-03 14:32:44', '2020-03-03 14:32:44', 0),
(101, NULL, 8, 66, 29, 'm', '2020-03-04 17:21:19', '2020-03-08 17:24:37', 1),
(102, 101, 8, 66, 29, 'n', '2020-03-04 17:21:41', '2020-03-04 17:21:41', 0),
(103, NULL, 8, 93, 25, 'Odpowiedź do komentarza', '2020-03-08 17:20:12', '2020-03-08 17:20:12', 0),
(104, NULL, 8, 66, 29, 'fhgh', '2020-03-08 17:25:30', '2020-03-08 17:25:30', 0),
(105, NULL, 8, 61, 22, 'm', '2020-03-08 17:54:27', '2020-03-08 17:54:27', 0),
(106, NULL, 5, 96, 31, 'ccc', '2020-04-10 21:16:04', '2020-04-10 21:16:04', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notes_subscriptions`
--

CREATE TABLE `notes_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `note_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `notes_subscriptions`
--

INSERT INTO `notes_subscriptions` (`id`, `user_id`, `note_id`, `created`) VALUES
(89, 51, 46, '2020-06-26 12:22:27'),
(91, 7, 61, '2020-06-26 13:07:46'),
(92, 7, 81, '2020-06-26 13:07:50'),
(93, 7, 146, '2020-06-26 13:08:06'),
(94, 51, 127, '2020-06-26 14:53:36'),
(96, 7, 147, '2020-06-26 16:15:44'),
(97, 7, 117, '2020-06-26 16:15:46'),
(98, 7, 116, '2020-06-26 16:15:47'),
(99, 7, 59, '2020-06-26 16:29:20'),
(100, 51, 151, '2020-06-26 16:41:38'),
(101, 7, 127, '2020-06-27 09:59:24'),
(105, 7, 101, '2020-06-27 19:28:21'),
(106, 51, 73, '2020-06-30 00:00:24'),
(107, 6, 48, '2020-06-30 07:59:28'),
(108, 51, 29, '2020-06-30 08:14:40'),
(109, 7, 46, '2020-07-02 19:21:50'),
(110, 51, 71, '2020-07-05 11:56:53'),
(111, 7, 71, '2020-07-05 11:57:27'),
(112, 51, 183, '2020-07-05 21:24:04'),
(113, 51, 31, '2020-07-05 21:26:03'),
(115, 51, 182, '2020-07-05 21:30:15'),
(116, 51, 186, '2020-07-18 20:40:03'),
(117, 31, 31, '2020-07-22 01:07:46'),
(118, 6, 31, '2020-07-23 20:48:08');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notices`
--

CREATE TABLE `notices` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` smallint NOT NULL,
  `content_id` bigint NOT NULL,
  `content_type_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `notice_type_id` bigint NOT NULL,
  `content_message` text NOT NULL,
  `is_subscription` int NOT NULL DEFAULT '0',
  `is_deleted` smallint NOT NULL DEFAULT '0',
  `lang` varchar(20) NOT NULL DEFAULT 'pl_PL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `notices`
--

INSERT INTO `notices` (`id`, `user_id`, `created`, `updated`, `status`, `content_id`, `content_type_id`, `created_by`, `notice_type_id`, `content_message`, `is_subscription`, `is_deleted`, `lang`) VALUES
(65, 0, '2020-02-17 17:20:10', '2020-02-17 17:20:10', 1, 30, 1, 8, 11, '{\"message\":{\"content\":31,\"type_id\":1,\"title\":\" Powrót do przyszłości\",\"reason\":2}}', 0, 0, 'pl_PL'),
(66, 0, '2020-02-17 17:37:02', '2020-02-17 17:37:02', 1, 34, 5, 8, 23, '{\"message\":{\"content\":\"gfdgf\",\"reason\":\"dfgdfgdfg\",\"content_id\":29}}', 0, 0, 'pl_PL'),
(67, 7, '2020-02-17 17:37:21', '2020-07-25 21:52:16', 0, 29, 1, 8, 1, '{\"title\":\"Czy kryptowaluta mo\\u017ce znikn\\u0105\\u0107?\",\"message\":\"jhjj\"}', 0, 1, 'pl_PL'),
(68, 0, '2020-02-17 19:32:33', '2020-02-17 19:32:33', 1, 35, 5, 7, 23, '{\"message\":{\"content\":\"gfdgf\",\"reason\":\"sdfasdsads adsd sad fas\",\"content_id\":29}}', 0, 0, 'pl_PL'),
(69, 7, '2020-02-18 16:49:54', '2020-07-25 21:52:16', 0, 29, 1, 31, 1, '{\"title\":\"Czy kryptowaluta mo\\u017ce znikn\\u0105\\u0107?\",\"message\":null}', 0, 1, 'pl_PL'),
(70, 7, '2020-02-18 16:56:05', '2020-02-23 11:21:38', 0, 29, 3, 31, 2, '{\"title\":\"Czy kryptowaluta mo\\u017ce znikn\\u0105\\u0107?\",\"message\":\"k\\u0142amstwo\"}', 0, 0, 'pl_PL'),
(71, 0, '2020-02-18 17:43:36', '2020-02-18 17:43:36', 1, 23, 1, 31, 11, '{\"message\":{\"content\":23,\"type_id\":1,\"title\":\"jedziem z tematem \",\"reason\":2}}', 0, 0, 'pl_PL'),
(72, 8, '2020-02-18 18:08:50', '2020-05-05 16:10:20', 0, 30, 1, 31, 1, '{\"title\":\" Powr\\u00f3t do przysz\\u0142o\\u015bci\",\"message\":null}', 0, 0, 'pl_PL'),
(73, 0, '2020-02-18 19:17:33', '2020-02-18 19:17:33', 1, 36, 5, 45, 23, '{\"message\":{\"content\":\"testo testo\",\"reason\":\"sadsad fsda asd asd fasd fas\",\"content_id\":29}}', 0, 0, 'pl_PL'),
(74, 0, '2020-02-18 19:18:15', '2020-02-18 19:18:15', 1, 37, 5, 45, 23, '{\"message\":{\"content\":\"Pierwsze by\\u0142o jajko\",\"reason\":\"sadfas s sa fasdf asd sad\",\"content_id\":22}}', 0, 0, 'pl_PL'),
(75, 0, '2020-02-18 22:38:19', '2020-02-18 22:38:19', 1, 23, 1, 31, 11, '{\"message\":{\"content\":23,\"type_id\":1,\"title\":\"jedziem z tematem \",\"reason\":2}}', 0, 0, 'pl_PL'),
(76, 0, '2020-02-18 22:50:09', '2020-02-18 22:50:09', 1, 23, 1, 31, 11, '{\"message\":{\"content\":23,\"type_id\":1,\"title\":\"jedziem z tematem \",\"reason\":2}}', 0, 0, 'pl_PL'),
(77, 31, '2020-02-19 16:05:27', '2020-02-19 16:05:27', 1, 23, 1, 6, 1, '{\"title\":\"jedziem z tematem \",\"message\":null}', 0, 0, 'pl_PL'),
(78, 0, '2020-02-19 17:14:08', '2020-02-19 17:14:08', 1, 23, 1, 31, 11, '{\"message\":{\"content\":23,\"type_id\":1,\"title\":\"jedziem z tematem \",\"reason\":2}}', 0, 0, 'pl_PL'),
(79, 0, '2020-02-19 17:31:34', '2020-02-19 17:31:34', 1, 23, 1, 8, 11, '{\"message\":{\"content\":23,\"type_id\":1,\"title\":\"jedziem z tematem \",\"reason\":2}}', 0, 0, 'pl_PL'),
(80, 0, '2020-02-19 20:40:26', '2020-02-19 20:40:26', 1, 38, 5, 7, 23, '{\"message\":{\"content\":\"xd\",\"reason\":\"uhhk khj kjhkjh jh kjh kjh\",\"content_id\":23}}', 0, 0, 'pl_PL'),
(81, 31, '2020-02-20 10:04:34', '2020-02-20 10:04:34', 1, 23, 1, 5, 1, '{\"title\":\"jedziem z tematem \",\"message\":null}', 0, 0, 'pl_PL'),
(82, 31, '2020-02-20 12:29:35', '2020-02-20 12:29:35', 1, 23, 3, 34, 2, '{\"title\":\"jedziem z tematem \",\"message\":\"Lorem ipsum\"}', 0, 0, 'pl_PL'),
(83, 0, '2020-02-22 19:00:36', '2020-02-22 19:00:36', 1, 39, 5, 7, 23, '{\"message\":{\"content\":\"Aas\",\"reason\":\"Ggghhb hhhhh hhhhhhhhhhhhh\",\"content_id\":23}}', 0, 0, 'pl_PL'),
(84, 0, '2020-02-25 18:14:44', '2020-02-25 18:14:44', 1, 40, 5, 7, 23, '{\"message\":{\"content\":\"Gggg\",\"reason\":\"Bbbbgjn. Hhhhh GG hhvbjg bhgg\",\"content_id\":23}}', 0, 0, 'pl_PL'),
(85, 0, '2020-02-27 08:45:26', '2020-02-27 08:45:26', 1, 17, 1, 5, 11, '{\"message\":{\"content\":17,\"type_id\":1,\"title\":\"test888\",\"reason\":2}}', 0, 0, 'pl_PL'),
(86, 0, '2020-02-27 08:46:51', '2020-02-27 08:46:51', 1, 31, 1, 5, 11, '{\"message\":{\"content\":31,\"type_id\":2,\"title\":\"czy poprawny inbox?\",\"reason\":1}}', 0, 0, 'pl_PL'),
(87, 0, '2020-02-29 20:04:56', '2020-02-29 20:04:56', 1, 32, 1, 5, 11, '{\"message\":{\"content\":32,\"type_id\":1,\"title\":\"nowy artykul for lukasz\",\"reason\":1}}', 0, 0, 'pl_PL'),
(88, 0, '2020-03-03 14:16:56', '2020-03-03 14:16:56', 1, 33, 1, 6, 11, '{\"message\":{\"content\":33,\"type_id\":2,\"title\":\"Anole VX!\",\"reason\":1}}', 0, 0, 'pl_PL'),
(89, 0, '2020-03-03 14:28:09', '2020-03-03 14:28:09', 1, 41, 5, 6, 23, '{\"message\":{\"content\":\"sdfasdfas\",\"reason\":\"bzdury bzdury bzdury bzdury bzdury bzdury bzdury bzdury bzdury bzdury \",\"content_id\":10}}', 0, 0, 'pl_PL'),
(90, 0, '2020-03-03 14:44:46', '2020-03-03 14:44:46', 1, 8, 4, 6, 22, '{\"message\":{\"content\":\"3\",\"reason\":\"Prank\"}}', 0, 0, 'pl_PL'),
(91, 0, '2020-03-03 16:45:54', '2020-03-03 16:45:54', 1, 34, 1, 6, 11, '{\"message\":{\"content\":34,\"type_id\":1,\"title\":\"ccfound manifesto\",\"reason\":1}}', 0, 0, 'pl_PL'),
(92, 0, '2020-03-03 17:12:38', '2020-03-03 17:12:38', 1, 35, 1, 6, 11, '{\"message\":{\"content\":35,\"type_id\":1,\"title\":\"ccfound again\",\"reason\":1}}', 0, 0, 'pl_PL'),
(93, 0, '2020-03-03 21:54:45', '2020-03-03 21:54:45', 1, 32, 1, 5, 11, '{\"message\":{\"content\":32,\"type_id\":1,\"title\":\"nowy artykul for lukasz\",\"reason\":2}}', 0, 0, 'pl_PL'),
(94, 5, '2020-03-03 23:01:30', '2020-04-08 20:07:16', 0, 32, 1, 7, 1, '{\"title\":\"nowy artykul for lukasz\",\"message\":null}', 0, 0, 'pl_PL'),
(95, 0, '2020-03-08 17:21:39', '2020-03-08 17:21:39', 1, 43, 5, 8, 23, '{\"message\":{\"content\":\"Odpowied\\u017a do komentarza\",\"reason\":\"zgfggffdgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfgfdgdfg\",\"content_id\":25}}', 0, 0, 'pl_PL'),
(96, 0, '2020-03-08 17:22:09', '2020-03-08 17:22:09', 1, 44, 5, 8, 23, '{\"message\":{\"content\":\"Odpowied\\u017a do komentarza\",\"reason\":\"nbvnvbncnbncbnvncvnvbnvb\",\"content_id\":25}}', 0, 0, 'pl_PL'),
(97, 0, '2020-03-08 17:26:03', '2020-03-08 17:26:03', 1, 45, 5, 8, 23, '{\"message\":{\"content\":\"n\",\"reason\":\"vcbcvbcvbcvbcvbvcbvcbcvbcvb\",\"content_id\":29}}', 0, 0, 'pl_PL'),
(98, 0, '2020-03-24 18:26:03', '2020-03-24 18:26:03', 1, 36, 1, 7, 11, '{\"message\":{\"content\":36,\"type_id\":2,\"title\":\"Models folder structure in net core API project\",\"reason\":1}}', 0, 0, 'pl_PL'),
(99, 0, '2020-03-24 18:26:04', '2020-03-24 18:26:04', 1, 37, 1, 7, 11, '{\"message\":{\"content\":37,\"type_id\":2,\"title\":\"Models folder structure in net core API project\",\"reason\":1}}', 0, 0, 'pl_PL'),
(100, 0, '2020-03-24 18:26:36', '2020-03-24 18:26:36', 1, 38, 1, 7, 11, '{\"message\":{\"content\":38,\"type_id\":2,\"title\":\"sdfsdfsdfsdsdfs\",\"reason\":1}}', 0, 0, 'pl_PL'),
(101, 0, '2020-03-27 10:18:29', '2020-03-27 10:18:29', 1, 39, 1, 8, 11, '{\"message\":{\"content\":39,\"type_id\":2,\"title\":\"Pytanie\",\"reason\":1}}', 0, 0, 'pl_PL'),
(102, 0, '2020-04-04 17:14:55', '2020-04-04 17:14:55', 1, 40, 1, 48, 11, '{\"message\":{\"content\":40,\"type_id\":1,\"title\":\"artykul do rozstrzygniecia\",\"reason\":1}}', 0, 0, 'pl_PL'),
(103, 0, '2020-04-04 17:21:29', '2020-04-04 17:21:29', 1, 40, 4, 48, 24, '{\"message\":\"send content to resolve\"}', 0, 0, 'pl_PL'),
(104, 0, '2020-05-11 04:55:44', '2020-05-11 04:55:44', 1, 41, 1, 51, 11, '{\"message\":{\"content\":41,\"type_id\":2,\"title\":\"adjsahkj\",\"reason\":1}}', 0, 0, 'pl_PL'),
(105, 0, '2020-05-21 17:48:42', '2020-05-21 17:48:42', 1, 42, 1, 48, 11, '{\"message\":{\"content\":42,\"type_id\":2,\"title\":\"nowy test roli\",\"reason\":1}}', 0, 0, 'pl_PL'),
(106, 48, '2020-05-21 17:58:37', '2020-05-21 17:58:37', 1, 0, 0, 5, 30, '{\"message\":{\"added\":\" Publisher II\",\"removed\":\"\"}}', 0, 0, 'pl_PL'),
(107, 0, '2020-05-21 17:59:10', '2020-05-21 17:59:10', 1, 43, 1, 48, 11, '{\"message\":{\"content\":43,\"type_id\":2,\"title\":\"test roli 2\",\"reason\":1}}', 0, 0, 'pl_PL'),
(108, 0, '2020-05-28 10:29:16', '2020-05-28 10:29:16', 1, 44, 1, 31, 11, '{\"message\":{\"content\":44,\"type_id\":1,\"title\":\"sdfghjk,.\\/\",\"reason\":1}}', 0, 0, 'pl_PL'),
(109, 31, '2020-05-28 10:29:53', '2020-05-28 10:29:53', 1, 0, 0, 52, 30, '{\"message\":{\"added\":\" Publikacja II\",\"removed\":\"\"}}', 0, 0, 'pl_PL'),
(110, 0, '2020-05-29 10:01:51', '2020-05-29 10:01:51', 1, 45, 1, 31, 11, '{\"message\":{\"content\":45,\"type_id\":2,\"title\":\"kolejny test \",\"reason\":1}}', 0, 1, 'pl_PL'),
(111, 31, '2020-05-29 10:02:50', '2020-05-29 10:02:50', 1, 0, 0, 52, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja II\"}}', 0, 0, 'pl_PL'),
(112, 0, '2020-05-29 10:03:12', '2020-05-29 10:03:12', 1, 46, 1, 31, 11, '{\"message\":{\"content\":46,\"type_id\":2,\"title\":\"teste \",\"reason\":1}}', 0, 1, 'pl_PL'),
(113, 0, '2020-05-31 17:13:06', '2020-05-31 17:13:06', 1, 47, 1, 7, 11, '{\"message\":{\"content\":47,\"type_id\":2,\"title\":\"Pytanie o pytanie\",\"reason\":1}}', 0, 0, 'pl_PL'),
(114, 0, '2020-06-03 17:13:47', '2020-06-03 17:13:47', 1, 23, 1, 31, 11, '{\"message\":{\"content\":23,\"type_id\":1,\"title\":\"jedziem z tematem \",\"reason\":2}}', 0, 0, 'pl_PL'),
(115, 0, '2020-06-03 17:15:39', '2020-06-03 17:15:39', 1, 49, 1, 31, 11, '{\"message\":{\"content\":49,\"type_id\":2,\"title\":\"oj tam oj tam\",\"reason\":1}}', 0, 0, 'pl_PL'),
(116, 0, '2020-06-03 19:09:13', '2020-06-03 19:09:13', 1, 31, 1, 5, 11, '{\"message\":{\"content\":31,\"type_id\":2,\"title\":\"czy poprawny inbox?\",\"reason\":2}}', 0, 0, 'pl_PL'),
(117, 0, '2020-06-04 07:01:06', '2020-06-04 07:01:06', 1, 50, 1, 7, 11, '{\"message\":{\"content\":50,\"type_id\":1,\"title\":\"test aktualnosci\",\"reason\":1}}', 0, 0, 'pl_PL'),
(118, 0, '2020-06-04 07:01:35', '2020-06-04 07:01:35', 1, 51, 1, 45, 11, '{\"message\":{\"content\":51,\"type_id\":1,\"title\":\"Dual-Y Example\",\"reason\":1}}', 0, 0, 'pl_PL'),
(119, 0, '2020-06-04 20:20:13', '2020-06-04 20:20:13', 1, 51, 1, 45, 11, '{\"message\":{\"content\":51,\"type_id\":1,\"title\":\"Dual-Y Example\",\"reason\":2}}', 0, 0, 'pl_PL'),
(120, 0, '2020-06-04 20:22:39', '2020-06-04 20:22:39', 1, 51, 1, 45, 11, '{\"message\":{\"content\":51,\"type_id\":1,\"title\":\"Dual-Y Example\",\"reason\":2}}', 0, 0, 'pl_PL'),
(121, 0, '2020-06-05 10:39:24', '2020-06-05 10:39:24', 1, 44, 1, 31, 11, '{\"message\":{\"content\":44,\"type_id\":1,\"title\":\"sdfghjk,.\\/\",\"reason\":2}}', 0, 0, 'pl_PL'),
(122, 0, '2020-06-05 10:44:27', '2020-06-05 10:44:27', 1, 49, 1, 31, 11, '{\"message\":{\"content\":49,\"type_id\":2,\"title\":\"oj tam oj tam\",\"reason\":2}}', 0, 0, 'pl_PL'),
(123, 31, '2020-06-10 12:53:23', '2020-06-10 12:53:23', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Publikacja II, Edytor, Rozstrzyganie I, Rozstrzyganie IV, Blocked II, Give permission II, Zarz\\u0105dzanie banerami, Newsletter accept\",\"removed\":\"\"}}', 0, 0, 'pl_PL'),
(124, 0, '2020-06-13 17:23:47', '2020-06-13 17:23:47', 1, 61, 1, 7, 11, '{\"message\":{\"content\":61,\"type_id\":2,\"title\":\"adsa\",\"reason\":1}}', 0, 0, 'pl_PL'),
(125, -1, '2020-06-29 17:23:47', '2020-06-29 17:23:47', 1, 61, 1, 7, 11, '{\"message\":{\"content\":61,\"type_id\":2,\"title\":\"adsa\",\"reason\":1}}', 0, 0, 'pl_PL'),
(126, -1, '2020-06-29 15:58:15', '2020-06-29 15:58:15', 1, 22, 1, 7, 11, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1}}', 0, 0, 'pl_PL'),
(127, -1, '2020-06-29 20:37:18', '2020-06-29 20:37:18', 1, 66, 1, 7, 11, '{\"message\":{\"content\":66,\"type_id\":2,\"title\":\"zczxczxc sdsdf\",\"reason\":1}}', 0, 0, 'pl_PL'),
(128, -1, '2020-06-29 20:40:41', '2020-06-29 20:40:41', 1, 67, 1, 7, 11, '{\"message\":{\"content\":67,\"type_id\":2,\"title\":\"zczxczxc sdsdf\",\"reason\":1}}', 0, 0, 'pl_PL'),
(129, -1, '2020-06-29 20:43:55', '2020-06-29 20:43:55', 1, 68, 1, 7, 11, '{\"message\":{\"content\":68,\"type_id\":2,\"title\":\"zczxczxc sdsdf\",\"reason\":1}}', 0, 0, 'pl_PL'),
(130, -1, '2020-06-29 21:08:40', '2020-06-29 21:08:40', 1, 69, 1, 7, 11, '{\"message\":{\"content\":69,\"type_id\":1,\"title\":\"zxczxcz\",\"reason\":1}}', 0, 0, 'pl_PL'),
(131, -1, '2020-06-29 21:44:42', '2020-06-29 21:44:42', 1, 70, 1, 7, 11, '{\"message\":{\"content\":70,\"type_id\":2,\"title\":\"sfafasf\",\"reason\":1}}', 0, 0, 'pl_PL'),
(132, -1, '2020-06-29 21:46:51', '2020-06-29 21:46:51', 1, 71, 1, 7, 11, '{\"message\":{\"content\":71,\"type_id\":1,\"title\":\"24324325vdfd433\",\"reason\":1}}', 0, 0, 'pl_PL'),
(133, 7, '2020-06-29 23:01:08', '2020-06-29 23:01:08', 1, 166, 5, 7, 6, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":null,\"reason\":1,\"comment_id\":166,\"description\":\"<p>zxczxc zcvzxz zq1r3fga43tgrva 4t 4tfwg<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(134, 29, '2020-06-29 23:02:54', '2020-06-29 23:02:54', 1, 167, 5, 7, 6, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":null,\"reason\":1,\"comment_id\":167,\"description\":\"<p>zxczxc zvzx cxzxvzb zffbzbzvbzv<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(135, 29, '2020-06-29 23:51:08', '2020-06-29 23:51:08', 1, 168, 5, 7, 6, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1,\"comment_id\":168,\"description\":\"<p>Czxvzx zvzxvzxvzx vzvzxvxz<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(136, 29, '2020-06-30 07:57:59', '2020-06-30 07:57:59', 1, 169, 5, 6, 6, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1,\"comment_id\":169,\"description\":\"<p>bxbzb gdfg&nbsp; fdgfdg dfgdfg dffsgdgsfdg<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(137, 29, '2020-06-30 08:00:50', '2020-06-30 08:00:50', 1, 171, 5, 7, 6, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1,\"comment_id\":171,\"description\":\"<p>dgadg ga dsgagsdg&nbsp; asasdf&nbsp; afd<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(138, 5, '2020-06-30 08:25:43', '2020-06-30 08:25:43', 1, 172, 5, 7, 6, '{\"message\":{\"content\":10,\"type_id\":2,\"title\":\"To BI or not to BITCOIN ?\",\"reason\":1,\"comment_id\":172,\"description\":\"<p>CVXcvxc xvxcv xv xcvxvcx<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(139, -1, '2020-06-30 08:28:24', '2020-06-30 08:28:24', 1, 72, 1, 6, 11, '{\"message\":{\"content\":72,\"type_id\":1,\"title\":\"asdasd\",\"reason\":1}}', 0, 0, 'pl_PL'),
(140, 0, '2020-07-02 18:23:24', '2020-07-02 18:23:24', 1, 73, 1, 51, 11, '{\"message\":{\"content\":73,\"type_id\":2,\"title\":\"dfgd\",\"reason\":1}}', 0, 0, 'pl_PL'),
(141, 29, '2020-07-02 19:22:49', '2020-07-02 19:22:49', 1, 174, 5, 51, 6, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1,\"comment_id\":174,\"description\":\"<p>Na serio?<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(142, -1, '2020-07-02 19:26:57', '2020-07-02 19:26:57', 1, 74, 1, 7, 11, '{\"message\":{\"content\":74,\"type_id\":2,\"title\":\"dsadas\",\"reason\":1}}', 0, 0, 'pl_PL'),
(143, 36, '2020-07-02 20:11:54', '2020-07-02 20:11:54', 1, 177, 5, 51, 14, '{\"message\":{\"content\":22,\"type_id\":2,\"articleTitle\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"parentText\":\"jajecznica :)\\r\\n\",\"reason\":1,\"comment_id\":177,\"description\":\"Dawaj j\\u0105 :)\", \"content_parent_id\":46}}', 0, 0, 'pl_PL'),
(144, 36, '2020-07-02 20:16:08', '2020-07-02 20:16:08', 1, 178, 5, 51, 14, '{\"message\":{\"content\":22,\"type_id\":2,\"articleTitle\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"parentText\":\"jajecznica :)\\r\\n\",\"reason\":1,\"comment_id\":178,\"description\":\"sdfsdfsdfsdf\", \"content_parent_id\":46}}', 0, 0, 'pl_PL'),
(145, 36, '2020-07-02 20:21:15', '2020-07-02 20:21:15', 1, 179, 5, 51, 14, '{\"message\":{\"content\":22,\"type_id\":2,\"articleTitle\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"parentText\":\"jajecznica :)\\r\\n\",\"reason\":1,\"comment_id\":179,\"description\":\"smacznego\", \"content_parent_id\":46}}', 0, 0, 'pl_PL'),
(146, 36, '2020-07-02 20:24:28', '2020-07-02 20:24:28', 1, 180, 5, 51, 14, '{\"message\":{\"content\":22,\"type_id\":2,\"articleTitle\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"parentText\":\"jajecznica :)\\r\\n\",\"reason\":1,\"comment_id\":180,\"description\":\"Kolejna pr\\u00f3ba :D\",\"content_parent_id\":46}}', 0, 0, 'pl_PL'),
(147, -1, '2020-07-05 10:55:04', '2020-07-05 10:55:04', 1, 75, 1, 7, 11, '{\"message\":{\"content\":75,\"type_id\":1,\"title\":\"sfsdfasd\",\"reason\":1}}', 0, 0, 'pl_PL'),
(148, 45, '2020-07-05 11:57:27', '2020-07-05 11:57:27', 1, 181, 5, 7, 14, '{\"message\":{\"content\":22,\"content_parent_id\":\"71\",\"type_id\":2,\"articleTitle\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"parentText\":\"sasdfa asdfsad\",\"reason\":1,\"comment_id\":181,\"description\":\"jksdkjas jahsjkasd ajshdjkas jsadbjkas jkabdsjkasjkbdjk\"}}', 0, 0, 'pl_PL'),
(149, 5, '2020-07-05 15:39:23', '2020-07-05 15:39:23', 1, 5, 9, 7, 50, '{\"message\":\"Brak aktywno\\u015bci\",\"time\":\"86400\"}', 0, 0, 'pl_PL'),
(150, 51, '2020-07-05 16:06:48', '2020-07-05 16:17:55', 0, 143, 5, 7, 7, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1,\"comment_id\":143,\"description\":\"<p>jgghhgjhgjgjgh<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(151, 6, '2020-07-05 21:21:10', '2020-07-25 22:06:46', 1, 182, 5, 7, 6, '{\"message\":{\"content\":72,\"type_id\":1,\"title\":\"asdasd\",\"reason\":1,\"comment_id\":182,\"description\":\"dsdasdadas\"}}', 0, 1, 'pl_PL'),
(152, 6, '2020-07-05 21:22:55', '2020-07-25 22:06:46', 1, 183, 5, 7, 6, '{\"message\":{\"content\":72,\"type_id\":1,\"title\":\"asdasd\",\"reason\":1,\"comment_id\":183,\"description\":\"afasfas gdsfdsfs\"}}', 0, 1, 'pl_PL'),
(153, 7, '2020-07-05 21:30:33', '2020-07-05 21:30:33', 1, 184, 5, 51, 14, '{\"message\":{\"content\":72,\"content_parent_id\":\"182\",\"type_id\":1,\"articleTitle\":\"asdasd\",\"parentText\":\"dsdasdadas\",\"reason\":1,\"comment_id\":184,\"description\":\"Test button\"}}', 0, 0, 'pl_PL'),
(154, 0, '2020-07-13 08:13:55', '2020-07-13 08:13:55', 1, 56, 4, 51, 20, '{\"message\":{\"content\":\"adsa\",\"reason\":\"\",\"content_id\":\"56\"}}', 0, 0, 'pl_PL'),
(155, 0, '2020-07-13 09:08:31', '2020-07-13 09:08:31', 1, 49, 4, 51, 26, '{\"message\":{\"content\":\"oj tam oj tam22\",\"reason\":\"\",\"content_id\":\"49\",\"type_id\":\"2\",\"user_id\":31}}', 0, 0, 'pl_PL'),
(156, 0, '2020-07-13 19:47:53', '2020-07-13 19:47:53', 1, 31, 5, 7, 23, '{\"message\":{\"content\":null,\"reason\":\"aasgasgsaga afsaf asfasfasfasf\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(157, 6, '2020-07-16 17:17:12', '2020-07-25 22:07:07', 1, 0, 0, 5, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja II, Zaakceptuj, Rozstrzyganie IV, Blocked II\"}}', 0, 1, 'pl_PL'),
(158, 6, '2020-07-16 19:37:27', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Newsletter accept\",\"substantiation\":\"asdsadsadasdaasdasdasd asdas asasdasdas\"}}', 0, 1, 'pl_PL'),
(159, 6, '2020-07-16 20:49:53', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Publikacja II, Zaakceptuj, Rozstrzyganie IV, Blocked II, Give permission II, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"jjhhjkhjkhjk\"}}', 0, 1, 'pl_PL'),
(160, 6, '2020-07-16 20:50:43', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja II, Zaakceptuj, Rozstrzyganie IV, Blocked II\",\"substantiation\":\"jjhhjkhjkhjk\"}}', 0, 1, 'pl_PL'),
(161, 6, '2020-07-16 21:03:46', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Give permission II, Newsletter accept\",\"substantiation\":\"cgvghvvjhvjbh\"}}', 0, 1, 'pl_PL'),
(162, 6, '2020-07-16 21:06:05', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Rozstrzyganie IV, Blocked II, Give permission II, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"\"}}', 0, 1, 'pl_PL'),
(163, 6, '2020-07-16 21:06:29', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Newsletter accept\",\"substantiation\":\"nkjnj hjjh jhkjhjhk\"}}', 0, 1, 'pl_PL'),
(164, 6, '2020-07-16 21:07:40', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Blocked II, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"\"}}', 0, 1, 'pl_PL'),
(165, 6, '2020-07-16 21:07:58', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Newsletter accept\",\"substantiation\":\"hbbhj jbjk jkjkhjkhk\"}}', 0, 1, 'pl_PL'),
(166, 6, '2020-07-16 21:08:38', '2020-07-25 22:07:07', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Blocked II, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"\"}}', 0, 1, 'pl_PL'),
(167, 6, '2020-07-16 21:08:56', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Newsletter accept\",\"substantiation\":\"vhvhjvbhj hjhjgj hhjgjghj\"}}', 0, 1, 'pl_PL'),
(168, 6, '2020-07-16 21:10:01', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Blocked II, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"\"}}', 0, 1, 'pl_PL'),
(169, 6, '2020-07-16 21:10:22', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Newsletter accept\",\"substantiation\":\"kjnkjh hjbkjb hhj vfvghdswasddfghvhjb jkhjlkjkljkljmkl\"}}', 0, 1, 'pl_PL'),
(170, 6, '2020-07-16 21:15:02', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Give permission II, Zarz\\u0105dzanie banerami\",\"substantiation\":\"nvjgghj\"}}', 0, 1, 'pl_PL'),
(171, 6, '2020-07-16 21:28:28', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Blocked II, Give permission II, Zarz\\u0105dzanie banerami, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"\"}}', 0, 1, 'pl_PL'),
(172, 6, '2020-07-16 21:28:37', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Newsletter accept\",\"substantiation\":\"xZxZxZ\"}}', 0, 1, 'pl_PL'),
(173, 6, '2020-07-16 21:30:15', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Blocked II, Newsletter accept\",\"removed\":\" Zarz\\u0105dzanie banerami\",\"substantiation\":\"fasdsadas\"}}', 0, 1, 'pl_PL'),
(174, 6, '2020-07-16 21:33:14', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Publikacja II, Zarz\\u0105dzanie banerami\",\"removed\":\" Newsletter accept\",\"substantiation\":\"zxczxczxc asadasda\"}}', 0, 1, 'pl_PL'),
(175, 6, '2020-07-16 21:43:52', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie IV, Blocked II\",\"substantiation\":\"zdd dvsdfsdf\"}}', 0, 1, 'pl_PL'),
(176, 6, '2020-07-16 21:45:42', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Give permission II, Zarz\\u0105dzanie banerami\",\"substantiation\":\"sdaskuhkjasd klasdjkljaskl kljkladsasdklklasd\"}}', 0, 1, 'pl_PL'),
(177, 6, '2020-07-16 21:49:33', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Blocked II, Newsletter accept\",\"removed\":\" Rozstrzyganie I\",\"substantiation\":\"asfdfas asdasd asdasd\"}}', 0, 1, 'pl_PL'),
(178, 6, '2020-07-16 21:53:27', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Newsletter accept\",\"substantiation\":\"dasdsadas\"}}', 0, 1, 'pl_PL'),
(179, 6, '2020-07-16 23:10:08', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Edytor, Rozstrzyganie I, Blocked II, Newsletter accept\",\"substantiation\":\"Xzcdzv dsvsd dsvsdv  dsvsdvsd sdvdsvs \"}}', 0, 1, 'pl_PL'),
(180, 6, '2020-07-16 23:11:19', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Zaakceptuj, Rozstrzyganie IV, Blocked II, Zarz\\u0105dzanie banerami, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"sadasd asdasd asda asdasda\"}}', 0, 1, 'pl_PL'),
(181, 6, '2020-07-16 23:11:55', '2020-07-25 22:07:00', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie IV, Blocked II, Newsletter accept\",\"substantiation\":\"dsdgdsf dfsdf sdfdsfs\"}}', 0, 1, 'pl_PL'),
(182, 6, '2020-07-16 23:12:32', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Rozstrzyganie I\",\"removed\":\" Rozstrzyganie IV, Blocked II, Newsletter accept\",\"substantiation\":\"sdasda asdasd asd\"}}', 0, 1, 'pl_PL'),
(183, 6, '2020-07-16 23:14:24', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie I\",\"substantiation\":\"dasda adasd\"}}', 0, 1, 'pl_PL'),
(184, 6, '2020-07-16 23:17:46', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie I, Zarz\\u0105dzanie banerami\",\"substantiation\":\"asdfsfs sdfsdfssdfs sdfsdfsd\"}}', 0, 1, 'pl_PL'),
(185, 6, '2020-07-16 23:22:16', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Edytor, Rozstrzyganie I, Rozstrzyganie IV, Blocked II, Give permission II, Zarz\\u0105dzanie banerami, Newsletter accept\",\"removed\":\"\",\"substantiation\":\"\"}}', 0, 1, 'pl_PL'),
(186, 6, '2020-07-16 23:22:30', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie IV, Blocked II\",\"substantiation\":\"zxasd asfasfasdfas\"}}', 0, 1, 'pl_PL'),
(187, 6, '2020-07-16 23:26:54', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Newsletter accept\",\"substantiation\":\"ghvv hbjbhb\"}}', 0, 1, 'pl_PL'),
(188, 6, '2020-07-16 23:27:14', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zarz\\u0105dzanie banerami\",\"substantiation\":\"\"}}', 0, 1, 'pl_PL'),
(189, 6, '2020-07-16 23:27:39', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Give permission II\",\"substantiation\":\"czxZXZ dasd aasda s\"}}', 0, 1, 'pl_PL'),
(190, 6, '2020-07-16 23:41:04', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Edytor\",\"substantiation\":\"gvvvgh hbjhh jhbhjb  jjkbbjkbkjbkjb\"}}', 0, 1, 'pl_PL'),
(191, 29, '2020-07-17 00:04:53', '2020-07-17 00:04:53', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj\",\"substantiation\":\"asasdas asdasd asdasda\",\"blocked_to\":\"2020-07-31\"}}', 0, 0, 'pl_PL'),
(192, 5, '2020-07-18 13:03:36', '2020-07-18 13:03:36', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie IV, Newsletter accept\",\"substantiation\":\"sasadas asdad asdasd a\",\"blocked_to\":\"2020-08-01\"}}', 0, 0, 'pl_PL'),
(193, 5, '2020-07-18 13:06:31', '2020-07-18 13:06:31', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Rozstrzyganie IV, Newsletter accept\",\"removed\":\" Blocked II, Give permission II\",\"substantiation\":\"wrerw wwer werwe  ewrewa  werwerwe\",\"blocked_to\":\"2020-08-01\"}}', 0, 0, 'pl_PL'),
(194, 5, '2020-07-18 13:07:02', '2020-07-18 13:07:02', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Blocked II, Give permission II\",\"removed\":\" Rozstrzyganie IV, Newsletter accept\",\"substantiation\":\"sfsdfsdfs dfsdf sdfsd sfsdfs\",\"blocked_to\":\"2020-08-01\"}}', 0, 0, 'pl_PL'),
(195, 5, '2020-07-18 13:07:50', '2020-07-18 13:07:50', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Rozstrzyganie IV, Newsletter accept\",\"removed\":\" Blocked II, Give permission II\",\"substantiation\":\"sdasd sdas adasdadas\",\"blocked_to\":\"2020-07-25\"}}', 0, 0, 'pl_PL'),
(196, 5, '2020-07-18 13:10:07', '2020-07-18 13:10:07', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Blocked II, Give permission II\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(197, 5, '2020-07-18 13:10:57', '2020-07-18 13:10:57', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Edytor\",\"substantiation\":\"sfsdf sdfsdf sdffsdf sdfsdfs f sfddsf sdfsdfs\",\"blocked_to\":\"2020-08-17\"}}', 0, 0, 'pl_PL'),
(198, 5, '2020-07-18 13:11:47', '2020-07-18 13:11:47', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Edytor\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(199, 5, '2020-07-18 13:22:14', '2020-07-18 13:22:14', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie IV, Blocked II\",\"substantiation\":\"asdasda sadasd asddasd sadasd \",\"blocked_to\":\"2020-08-17\"}}', 0, 0, 'pl_PL'),
(200, 5, '2020-07-18 13:22:38', '2020-07-18 13:22:38', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Give permission II\",\"substantiation\":\"dsad sjdhasj jadsjka jkabsdjk jkahdjkha\",\"blocked_to\":0}}', 0, 0, 'pl_PL'),
(201, 5, '2020-07-18 14:14:34', '2020-07-18 14:14:34', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj\",\"substantiation\":\"dfdsfdsf\",\"blocked_to\":\"2020-07-19\"}}', 0, 0, 'pl_PL'),
(202, 5, '2020-07-18 14:16:02', '2020-07-18 14:16:02', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Newsletter accept\",\"substantiation\":\"sad asdasd asdasda\",\"blocked_to\":0}}', 0, 0, 'pl_PL'),
(203, 5, '2020-07-18 14:16:57', '2020-07-18 14:16:57', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zarz\\u0105dzanie banerami\",\"substantiation\":\"efsdfs\",\"blocked_to\":\"2020-07-25\"}}', 0, 0, 'pl_PL'),
(204, 5, '2020-07-18 14:17:43', '2020-07-18 14:17:43', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Newsletter accept\",\"substantiation\":\"dasdsada\",\"blocked_to\":\"2020-07-19\"}}', 0, 0, 'pl_PL'),
(205, 5, '2020-07-18 14:18:45', '2020-07-18 14:18:45', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zarz\\u0105dzanie banerami\",\"substantiation\":\"mjghjh\",\"blocked_to\":\"2020-07-19\"}}', 0, 0, 'pl_PL'),
(206, 5, '2020-07-18 14:21:59', '2020-07-18 14:21:59', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Give permission II\",\"substantiation\":\"jjgj hjg g ghgj\",\"blocked_to\":\"2020-07-19\"}}', 0, 0, 'pl_PL'),
(207, 5, '2020-07-18 14:23:16', '2020-07-18 14:23:16', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj, Rozstrzyganie IV\",\"substantiation\":\"dsadasd asdasd sa asdasdas\",\"blocked_to\":\"2020-07-25\"}}', 0, 0, 'pl_PL'),
(208, 5, '2020-07-18 14:23:40', '2020-07-18 14:23:40', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja II, Rozstrzyganie I\",\"substantiation\":\"sdassdads ad asdsa das dasd as asd adsad as\",\"blocked_to\":\"2020-08-01\"}}', 0, 0, 'pl_PL'),
(209, 6, '2020-07-18 14:55:13', '2020-07-25 22:06:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Zarz\\u0105dzanie banerami\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 1, 'pl_PL'),
(210, 6, '2020-07-18 14:55:27', '2020-07-25 22:06:55', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja I, Publikacja II, Zaakceptuj, Edytor, Blocked II, Give permission II\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 1, 'pl_PL'),
(211, 6, '2020-07-18 14:56:09', '2020-07-25 22:06:55', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Publikacja I, Publikacja II\",\"removed\":\" Zarz\\u0105dzanie banerami, Newsletter accept\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 1, 'pl_PL'),
(212, 5, '2020-07-18 14:57:14', '2020-07-18 14:57:14', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja I, Edytor, Rozstrzyganie I, Rozstrzyganie IV, Blocked II, Give permission II, Zarz\\u0105dzanie banerami, Newsletter accept\",\"substantiation\":\"sdfsdfsdfsfs\",\"blocked_to\":\"2020-07-25\"}}', 0, 0, 'pl_PL'),
(213, 5, '2020-07-18 14:57:40', '2020-07-18 14:57:40', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(214, 5, '2020-07-18 14:57:48', '2020-07-18 14:57:48', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Zaakceptuj\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(215, 5, '2020-07-18 14:58:19', '2020-07-18 14:58:19', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja II\",\"substantiation\":\"ZXZ AZsdad sad aad\",\"blocked_to\":\"2020-07-25\"}}', 0, 0, 'pl_PL'),
(216, 5, '2020-07-18 14:59:42', '2020-07-18 14:59:42', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj\",\"substantiation\":\"sdf  sdffdsdfsdff sdf s  sfsdfdsfsd\",\"blocked_to\":0}}', 0, 0, 'pl_PL'),
(217, 0, '2020-07-18 17:00:51', '2020-07-18 17:00:51', 1, 5, 4, 6, 22, '{\"message\":{\"content\":\"11\",\"reason\":\"Inappropriate username\"}}', 0, 0, 'pl_PL'),
(218, 0, '2020-07-18 17:41:43', '2020-07-18 17:41:43', 1, 22, 4, 6, 20, '{\"message\":{\"content\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":\"dsad   asdsadsa asdsdad  adadadadsad assddsaadd\",\"content_id\":\"22\"}}', 0, 0, 'pl_PL'),
(219, 0, '2020-07-18 17:42:06', '2020-07-18 17:42:06', 1, 71, 4, 6, 20, '{\"message\":{\"content\":\"24324325vdfd433\",\"reason\":\"asdsadas sad dsad adas asdas da\",\"content_id\":\"71\"}}', 0, 0, 'pl_PL'),
(220, 0, '2020-07-18 17:54:43', '2020-07-18 17:54:43', 1, 75, 4, 51, 26, '{\"message\":{\"content\":\"sfsdfasd\",\"reason\":\"asdas sada sdasd asdasd asd asddasda adssada \",\"content_id\":\"75\",\"type_id\":1,\"user_id\":7}}', 0, 0, 'pl_PL'),
(221, -1, '2020-07-18 19:46:37', '2020-07-18 19:46:37', 1, 76, 1, 7, 11, '{\"message\":{\"content\":76,\"type_id\":2,\"title\":\"asdasda\",\"reason\":1}}', 0, 0, 'pl_PL'),
(222, -1, '2020-07-18 19:55:01', '2020-07-18 19:55:01', 1, 77, 1, 7, 11, '{\"message\":{\"content\":77,\"type_id\":2,\"title\":\"SAsASDSA?\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\",\\\"18\\\":\\\"by\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(223, -1, '2020-07-18 19:57:42', '2020-07-18 19:57:42', 1, 78, 1, 7, 11, '{\"message\":{\"content\":78,\"type_id\":2,\"title\":\"asdas dsdf\",\"categories\":\"[\\\"Analizy\\\",\\\"Bitcoin\\\",\\\"btc\\\"]\",\"reason\":1}}', 0, 0, 'pl_PL'),
(224, -1, '2020-07-18 20:01:15', '2020-07-18 20:01:15', 1, 79, 1, 7, 11, '{\"message\":{\"content\":79,\"type_id\":2,\"title\":\"aSAa\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\",\\\"18\\\":\\\"by\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(225, 0, '2020-07-18 20:26:02', '2020-07-18 20:26:02', 1, 80, 1, 51, 11, '{\"message\":{\"content\":80,\"type_id\":1,\"title\":\"AJKSHJA kAJSKLJA nlkjdklaj NKLAJDKLj\",\"categories\":\"{\\\"13\\\":\\\"Bitcoin\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(226, -1, '2020-07-18 20:35:38', '2020-07-18 20:35:38', 1, 81, 1, 7, 11, '{\"message\":{\"content\":81,\"type_id\":2,\"title\":\"dsadasd asasdas\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\",\\\"14\\\":\\\"bt\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(227, 7, '2020-07-18 20:39:46', '2020-07-18 20:39:46', 1, 186, 5, 51, 6, '{\"message\":{\"content\":78,\"type_id\":2,\"title\":\"asdas dsdf\",\"reason\":1,\"comment_id\":186,\"description\":\"<p>Interesuj\\u0105ce<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(228, 51, '2020-07-18 20:40:03', '2020-07-18 20:40:03', 1, 187, 5, 51, 14, '{\"message\":{\"content\":78,\"content_parent_id\":\"186\",\"type_id\":2,\"articleTitle\":\"asdas dsdf\",\"parentText\":\"<p>Interesuj\\u0105ce<\\/p>\\r\\n\",\"reason\":1,\"comment_id\":187,\"description\":\"Lol\"}}', 0, 0, 'pl_PL'),
(229, 51, '2020-07-18 20:43:29', '2020-07-18 20:43:29', 1, 188, 5, 51, 14, '{\"message\":{\"content\":78,\"content_parent_id\":\"186\",\"type_id\":2,\"articleTitle\":\"asdas dsdf\",\"parentText\":\"<p>Interesuj\\u0105ce<\\/p>\\r\\n\",\"reason\":1,\"comment_id\":188,\"description\":\"dadsa\"}}', 0, 0, 'pl_PL'),
(230, 51, '2020-07-18 20:44:12', '2020-07-18 20:44:12', 1, 189, 5, 51, 14, '{\"message\":{\"content\":78,\"content_parent_id\":\"186\",\"type_id\":2,\"articleTitle\":\"asdas dsdf\",\"parentText\":\"<p>Interesuj\\u0105ce<\\/p>\\r\\n\",\"reason\":1,\"comment_id\":189,\"description\":\"adasdas addasda as\"}}', 0, 0, 'pl_PL'),
(231, 51, '2020-07-18 20:47:10', '2020-07-18 20:47:10', 1, 190, 5, 51, 14, '{\"message\":{\"content\":78,\"content_parent_id\":\"186\",\"type_id\":2,\"articleTitle\":\"asdas dsdf\",\"parentText\":\"<p>Interesuj\\u0105ce<\\/p>\\r\\n\",\"reason\":1,\"comment_id\":190,\"description\":\"asdhbj jaskbdjkas klasdkljadsjkl\"}}', 0, 0, 'pl_PL'),
(232, -1, '2020-07-18 20:56:38', '2020-07-18 20:56:38', 1, 192, 5, 51, 14, '{\"message\":{\"content\":78,\"content_parent_id\":\"186\",\"type_id\":2,\"articleTitle\":\"asdas dsdf\",\"parentText\":\"<p>Interesuj\\u0105ce<\\/p>\\r\\n\",\"reason\":1,\"comment_id\":192,\"description\":\"adsdas asda asda asdadas\"}}', 0, 0, 'pl_PL'),
(233, -1, '2020-07-18 20:57:18', '2020-07-18 20:57:18', 1, 193, 5, 7, 6, '{\"message\":{\"content\":78,\"type_id\":2,\"title\":\"asdas dsdf\",\"reason\":1,\"comment_id\":193,\"description\":\"<p>asdas adasdsad adsadd<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(234, 5, '2020-07-18 21:02:22', '2020-07-18 21:02:22', 1, 194, 5, 7, 6, '{\"message\":{\"content\":10,\"type_id\":2,\"title\":\"To BI or not to BITCOIN ?\",\"reason\":1,\"comment_id\":194,\"description\":\"<p>asdsda adsa asdada daad asdasdadad<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(235, 5, '2020-07-18 21:05:24', '2020-07-18 21:05:24', 1, 195, 5, 7, 6, '{\"message\":{\"content\":10,\"type_id\":2,\"title\":\"To BI or not to BITCOIN ?\",\"reason\":1,\"comment_id\":195,\"description\":\"<p>asdas ada asd aa adasd ad a<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(236, 5, '2020-07-18 21:06:00', '2020-07-18 21:06:00', 1, 196, 5, 7, 6, '{\"message\":{\"content\":10,\"type_id\":2,\"title\":\"To BI or not to BITCOIN ?\",\"reason\":1,\"comment_id\":196,\"description\":\"<p>asda ada adds adsa<\\/p>\\r\\n\"}}', 0, 0, 'pl_PL'),
(237, 0, '2020-07-18 21:52:42', '2020-07-18 21:52:42', 1, 51, 4, 1, 22, '{\"message\":{\"content\":\"12\",\"reason\":\"Inappropriate user photo\"}}', 0, 0, 'pl_PL'),
(238, 0, '2020-07-18 21:53:47', '2020-07-18 21:53:47', 1, 51, 4, 6, 22, '{\"message\":{\"content\":\"12\",\"reason\":\"Inappropriate user photo\"}}', 0, 0, 'pl_PL'),
(239, 6, '2020-07-18 22:00:26', '2020-07-25 22:06:55', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Blocked II, Give permission II, Newsletter accept\",\"removed\":\" Publikacja I, Publikacja II, Rozstrzyganie I\",\"substantiation\":\"KLNKLN JKAHISH ADSIODASNKLAD DASKLNDASKL DASKLJADSKLJDS\",\"blocked_to\":\"2020-07-25\"}}', 0, 1, 'pl_PL'),
(240, 6, '2020-07-18 22:26:43', '2020-07-25 22:06:55', 0, 0, 0, 7, 30, '{\"message\":{\"added\":\" Zaakceptuj, Edytor\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 1, 'pl_PL'),
(241, 5, '2020-07-18 23:18:35', '2020-07-18 23:18:35', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja I, Zaakceptuj, Edytor, Rozstrzyganie I, Rozstrzyganie IV, Blocked II, Give permission II, Zarz\\u0105dzanie banerami, Newsletter accept\",\"substantiation\":\"\",\"blocked_to\":\"2020-07-25\"}}', 0, 0, 'pl_PL'),
(242, 5, '2020-07-18 23:26:34', '2020-07-18 23:26:34', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj\",\"substantiation\":\"\",\"blocked_to\":\"2020-07-25\"}}', 0, 0, 'pl_PL'),
(243, 5, '2020-07-18 23:27:41', '2020-07-18 23:27:41', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Give permission II\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(244, 5, '2020-07-18 23:27:53', '2020-07-18 23:27:53', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Blocked II, Give permission II\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(245, 0, '2020-07-19 11:17:05', '2020-07-19 11:17:05', 1, 51, 4, 6, 22, '{\"message\":{\"content\":\"14\",\"reason\":\"User publishes inappropriate content\",\"user_id\":\"51\"}}', 0, 0, 'pl_PL'),
(246, 7, '2020-07-22 01:07:46', '2020-07-25 21:52:16', 1, 197, 5, 31, 14, '{\"message\":{\"content\":22,\"content_parent_id\":\"31\",\"type_id\":2,\"articleTitle\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"parentText\":\"Pierwsza by\\u0142a kura\",\"reason\":1,\"comment_id\":197,\"description\":\"Odpowied\\u017a\"}}', 0, 1, 'pl_PL'),
(247, 7, '2020-07-22 01:11:49', '2020-07-25 21:52:16', 1, 198, 5, 31, 14, '{\"message\":{\"content\":22,\"content_parent_id\":\"31\",\"type_id\":2,\"articleTitle\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"parentText\":\"Pierwsza by\\u0142a kura\",\"reason\":1,\"comment_id\":198,\"description\":\"nie usuwa\\u0107 :P\"}}', 0, 1, 'pl_PL'),
(248, 31, '2020-07-22 01:12:05', '2020-07-22 01:12:05', 1, 198, 5, 7, 7, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":2,\"comment_id\":198,\"description\":\"nie usuwa\\u0107 :P\"}}', 0, 0, 'pl_PL'),
(249, 31, '2020-07-22 01:28:42', '2020-07-22 01:28:42', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publikacja II, Newsletter accept\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(250, 31, '2020-07-22 01:29:47', '2020-07-22 01:29:47', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Publikacja II, Newsletter accept\",\"removed\":\" Zaakceptuj\",\"substantiation\":\"No sory\",\"blocked_to\":\"2020-07-23\"}}', 0, 0, 'pl_PL'),
(251, 0, '2020-07-22 01:34:19', '2020-07-22 01:34:19', 1, 82, 1, 6, 11, '{\"message\":{\"content\":82,\"type_id\":1,\"title\":\"SDAD\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(252, 31, '2020-07-22 01:52:23', '2020-07-22 01:52:23', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Edytor\",\"substantiation\":\"Nie \\u0142adnie\",\"blocked_to\":\"2020-08-05\"}}', 0, 0, 'pl_PL'),
(253, 0, '2020-07-21 23:59:20', '2020-07-21 23:59:20', 1, 51, 4, 6, 26, '{\"message\":{\"content\":\"Dual-Y Example\",\"reason\":\"jsadjsa kldasjldja kljasdkljaskld\",\"content_id\":\"51\",\"type_id\":1,\"user_id\":45}}', 0, 0, 'pl_PL'),
(254, 0, '2020-07-22 00:12:07', '2020-07-22 00:12:07', 1, 82, 4, 7, 26, '{\"message\":{\"content\":\"SDAD\",\"reason\":\"httpkdsndlkjaksdkla\",\"content_id\":\"82\",\"type_id\":1,\"user_id\":6}}', 0, 0, 'pl_PL'),
(255, 0, '2020-07-22 00:23:23', '2020-07-22 00:23:23', 1, 45, 4, 7, 22, '{\"message\":{\"content\":\"14\",\"reason\":\"User publishes inappropriate content\",\"user_id\":\"45\"}}', 0, 0, 'pl_PL'),
(256, 0, '2020-07-22 00:24:56', '2020-07-22 00:24:56', 1, 45, 4, 7, 22, '{\"message\":{\"content\":\"15\",\"reason\":\"A fake account or user is impersonating\",\"user_id\":\"45\"}}', 0, 0, 'pl_PL'),
(257, 0, '2020-07-22 01:22:38', '2020-07-22 01:22:38', 1, 45, 4, 6, 22, '{\"message\":{\"content\":\"12\",\"reason\":\"Inappropriate user photo\",\"user_id\":\"45\"}}', 0, 0, 'pl_PL'),
(258, 0, '2020-07-22 01:31:06', '2020-07-22 01:31:06', 1, 45, 4, 31, 22, '{\"message\":{\"content\":\"15\",\"reason\":\"A fake account or user is impersonating\",\"user_id\":\"45\"}}', 0, 0, 'pl_PL'),
(259, 0, '2020-07-22 01:43:40', '2020-07-22 01:43:40', 1, 22, 4, 31, 26, '{\"message\":{\"content\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":\"dfsdgdsgs dsdsd sddfsdfs\",\"content_id\":\"22\",\"type_id\":2,\"user_id\":29}}', 0, 0, 'pl_PL'),
(260, 0, '2020-07-22 01:45:35', '2020-07-22 01:45:35', 1, 51, 4, 31, 26, '{\"message\":{\"content\":\"Dual-Y Example\",\"reason\":\"asdasd sada sad asda adsd asa\",\"content_id\":\"51\",\"type_id\":1,\"user_id\":45}}', 0, 0, 'pl_PL'),
(261, 0, '2020-07-22 01:59:58', '2020-07-22 01:59:58', 1, 31, 5, 31, 23, '{\"message\":{\"content\":null,\"reason\":\"sadasd asdasd sadas\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(262, 0, '2020-07-22 02:18:18', '2020-07-22 02:18:18', 1, 148, 5, 31, 23, '{\"message\":{\"content\":null,\"reason\":\"CScsd sadsa ad asd asd asd\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(263, 0, '2020-07-22 02:18:38', '2020-07-22 02:18:38', 1, 145, 5, 31, 23, '{\"message\":{\"content\":null,\"reason\":\"mklsaldkas asjndkjasnjkd jasdnjkasnjdkn lknadskjaskjdkljskla\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(264, 45, '2020-07-23 18:44:06', '2020-07-23 18:44:06', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Publikacja II, Edytor, Blocked II, Give permission II\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(265, 45, '2020-07-23 18:44:19', '2020-07-23 18:44:19', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj, Blocked II\",\"substantiation\":\"kjnsjkknkxz kzlcklxz kzcxklz\",\"blocked_to\":\"2020-07-24\"}}', 0, 0, 'pl_PL'),
(266, -1, '2020-07-23 18:46:42', '2020-07-23 18:46:42', 1, 83, 1, 6, 11, '{\"message\":{\"content\":83,\"type_id\":2,\"title\":\"sdada asda asd asdas da\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\",\\\"14\\\":\\\"bt\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(267, 0, '2020-07-23 19:37:36', '2020-07-23 19:37:36', 1, 75, 4, 6, 26, '{\"message\":{\"content\":\"sfsdfasd\",\"reason\":\"hjbawjdhjsak kladsjkldasjkl kladsnkljsa klasdjlkasjlkdsmalk\",\"content_id\":\"75\",\"type_id\":1,\"user_id\":7}}', 0, 0, 'pl_PL'),
(268, 0, '2020-07-23 21:24:10', '2020-07-23 21:24:10', 1, 5, 4, 7, 22, '{\"message\":{\"content\":\"14\",\"reason\":\"User publishes inappropriate content\",\"user_id\":\"5\"}}', 0, 0, 'pl_PL'),
(269, 5, '2020-07-23 21:26:42', '2020-07-23 21:37:37', 1, 37, 4, 6, 60, '{\"message\":{\"content\":\"Ogarnij si\\u0119\"}}', 0, 0, 'pl_PL'),
(270, 6, '2020-07-23 22:29:05', '2020-07-25 22:06:55', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Rozstrzyganie I, Rozstrzyganie IV\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 1, 'pl_PL'),
(271, 0, '2020-07-24 00:53:15', '2020-07-24 00:53:15', 1, 84, 1, 29, 11, '{\"message\":{\"content\":84,\"type_id\":2,\"title\":\"sasdsadas asddsa a\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\",\\\"15\\\":\\\"btc\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(272, 7, '2020-07-25 14:36:33', '2020-07-25 21:52:16', 1, 31, 5, 31, 7, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1,\"comment_id\":31,\"description\":\"Pierwsza by\\u0142a kura\",\"reason_description\":\"G\\u0142upie pytanie\"}}', 0, 1, 'pl_PL'),
(273, 0, '2020-07-25 16:00:01', '2020-07-25 16:00:01', 1, 85, 1, 51, 11, '{\"message\":{\"content\":85,\"type_id\":2,\"title\":\"asdasdd das d\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\",\\\"14\\\":\\\"bt\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(274, 0, '2020-07-25 16:00:45', '2020-07-25 16:00:45', 1, 85, 4, 6, 26, '{\"message\":{\"content\":\"asdasdd das d\",\"reason\":\"sasad saddasdas asdsa\",\"content_id\":\"85\",\"type_id\":2,\"user_id\":51}}', 0, 0, 'pl_PL'),
(275, 0, '2020-07-25 16:09:51', '2020-07-25 16:09:51', 1, 41, 4, 6, 26, '{\"message\":{\"content\":\"adjsahkj\",\"reason\":\"\",\"content_id\":\"41\",\"type_id\":2,\"user_id\":51}}', 0, 0, 'pl_PL'),
(276, 0, '2020-07-25 16:16:25', '2020-07-25 16:16:25', 1, 85, 4, 7, 26, '{\"message\":{\"content\":\"asdasdd das d\",\"reason\":\"\",\"content_id\":\"85\",\"type_id\":2,\"user_id\":51}}', 0, 0, 'pl_PL'),
(277, 51, '2020-07-25 16:25:07', '2020-07-25 16:25:07', 1, 73, 4, 45, 26, '{\"message\":{\"content\":\"dfgd\",\"reason\":\"\",\"content_id\":\"73\",\"type_id\":2,\"user_id\":51}}', 0, 0, 'pl_PL'),
(278, 0, '2020-07-25 16:31:47', '2020-07-25 16:31:47', 1, 68, 4, 51, 26, '{\"message\":{\"content\":\"zczxczxc sdsdf\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"68\",\"type_id\":2,\"user_id\":7}}', 0, 0, 'pl_PL'),
(279, 7, '2020-07-25 16:31:47', '2020-07-25 17:18:34', 0, 68, 4, 51, 26, '{\"message\":{\"content\":\"zczxczxc sdsdf\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"68\",\"type_id\":2,\"user_id\":7}}', 0, 0, 'pl_PL'),
(280, 7, '2020-07-25 16:31:47', '2020-07-25 17:18:30', 0, 68, 4, 51, 26, '{\"message\":{\"content\":\"zczxczxc sdsdf\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"68\",\"type_id\":2,\"user_id\":7}}', 0, 0, 'pl_PL'),
(281, 7, '2020-07-25 21:49:52', '2020-07-25 21:52:10', 0, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Blocked II, Give permission II\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(282, 0, '2020-07-29 10:54:50', '2020-07-29 10:54:50', 1, 6, 4, 7, 22, '{\"message\":{\"content\":\"13\",\"reason\":\"Niew\\u0142a\\u015bciwy opis u\\u017cytkownika\",\"user_id\":\"6\"}}', 0, 0, 'pl_PL'),
(283, 6, '2020-07-29 10:54:50', '2020-08-14 07:23:24', 0, 6, 4, 7, 22, '{\"message\":{\"content\":\"13\",\"reason\":\"Niew\\u0142a\\u015bciwy opis u\\u017cytkownika\",\"user_id\":\"6\"}}', 0, 0, 'pl_PL'),
(284, 6, '2020-07-29 10:54:50', '2020-08-14 07:23:06', 0, 6, 4, 7, 22, '{\"message\":{\"content\":\"13\",\"reason\":\"Niew\\u0142a\\u015bciwy opis u\\u017cytkownika\",\"user_id\":\"6\"}}', 0, 0, 'pl_PL'),
(285, 0, '2020-07-29 10:55:12', '2020-07-29 10:55:12', 1, 82, 4, 7, 26, '{\"message\":{\"content\":\"SDAD\",\"reason\":\"asjkhs jakshdjkhaj jkashdjkb jkadshjhajk\",\"content_id\":\"82\",\"type_id\":1,\"user_id\":6}}', 0, 0, 'pl_PL'),
(286, 6, '2020-07-29 10:55:12', '2020-08-14 07:23:04', 0, 82, 4, 7, 26, '{\"message\":{\"content\":\"SDAD\",\"reason\":\"asjkhs jakshdjkhaj jkashdjkb jkadshjhajk\",\"content_id\":\"82\",\"type_id\":1,\"user_id\":6}}', 0, 0, 'pl_PL'),
(287, 6, '2020-07-29 10:55:12', '2020-08-14 06:56:28', 0, 82, 4, 7, 26, '{\"message\":{\"content\":\"SDAD\",\"reason\":\"asjkhs jakshdjkhaj jkashdjkb jkadshjhajk\",\"content_id\":\"82\",\"type_id\":1,\"user_id\":6}}', 0, 0, 'pl_PL'),
(288, 0, '2020-07-29 10:55:31', '2020-07-29 10:55:31', 1, 83, 4, 7, 26, '{\"message\":{\"content\":\"sdada asda asd asdas da\",\"reason\":\"asdas asdasc asacas dasda sda sdasdas da sdasd \",\"content_id\":\"83\",\"type_id\":2,\"user_id\":6}}', 0, 0, 'pl_PL'),
(289, 6, '2020-07-29 10:55:31', '2020-07-29 11:09:54', 0, 83, 4, 7, 26, '{\"message\":{\"content\":\"sdada asda asd asdas da\",\"reason\":\"asdas asdasc asacas dasda sda sdasdas da sdasd \",\"content_id\":\"83\",\"type_id\":2,\"user_id\":6}}', 0, 0, 'pl_PL'),
(290, 6, '2020-07-29 10:55:31', '2020-08-14 06:56:23', 0, 83, 4, 7, 26, '{\"message\":{\"content\":\"sdada asda asd asdas da\",\"reason\":\"asdas asdasc asacas dasda sda sdasdas da sdasd \",\"content_id\":\"83\",\"type_id\":2,\"user_id\":6}}', 0, 0, 'pl_PL'),
(291, 0, '2020-07-29 10:55:53', '2020-07-29 10:55:53', 1, 53, 5, 7, 23, '{\"message\":{\"content\":null,\"reason\":\"sadasd sdasdas sdasdsdasdasdasda sdas\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(292, 0, '2020-07-29 10:57:00', '2020-07-29 10:57:00', 1, 170, 5, 7, 23, '{\"message\":{\"content\":null,\"reason\":\"\",\"content_id\":null}}', 0, 0, 'pl_PL');
INSERT INTO `notices` (`id`, `user_id`, `created`, `updated`, `status`, `content_id`, `content_type_id`, `created_by`, `notice_type_id`, `content_message`, `is_subscription`, `is_deleted`, `lang`) VALUES
(293, 0, '2020-07-29 11:09:04', '2020-07-29 11:09:04', 1, 72, 4, 7, 26, '{\"message\":{\"content\":\"asdasd\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"72\",\"type_id\":1,\"user_id\":6}}', 0, 0, 'pl_PL'),
(294, 6, '2020-07-29 11:09:04', '2020-07-29 11:09:48', 0, 72, 4, 7, 26, '{\"message\":{\"content\":\"asdasd\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"72\",\"type_id\":1,\"user_id\":6}}', 0, 0, 'pl_PL'),
(295, 0, '2020-07-29 11:10:39', '2020-07-29 11:10:39', 1, 30, 5, 6, 23, '{\"message\":{\"content\":null,\"reason\":\"sadsa acasxs as as\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(296, 0, '2020-07-29 11:11:10', '2020-07-29 11:11:10', 1, 146, 5, 6, 23, '{\"message\":{\"content\":null,\"reason\":\"\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(297, 0, '2020-07-29 11:12:29', '2020-07-29 11:12:29', 1, 77, 5, 6, 23, '{\"message\":{\"content\":null,\"reason\":\"\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(298, 0, '2020-07-29 11:14:34', '2020-07-29 11:14:34', 1, 71, 5, 6, 23, '{\"message\":{\"content\":null,\"reason\":\"\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(299, 45, '2020-07-29 11:14:34', '2020-07-29 11:14:34', 1, 71, 5, 6, 23, '{\"message\":{\"content\":null,\"reason\":\"\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(304, 0, '2020-07-29 11:29:11', '2020-07-29 11:29:11', 1, 172, 5, 6, 23, '{\"message\":{\"content\":\"<p>CVXcvxc xvxcv xv xcvxvcx<\\/p>\\r\\n\",\"reason\":\"hhjjhb jkbjkbk kjnkjjkn kjnjknjk  kjnjk jk jk jknjk njk \",\"content_id\":null}}', 0, 0, 'pl_PL'),
(305, 7, '2020-07-29 11:29:11', '2020-07-29 11:29:11', 1, 172, 5, 6, 23, '{\"message\":{\"user_id\":7,\"content\":\"<p>CVXcvxc xvxcv xv xcvxvcx<\\/p>\\r\\n\",\"reason\":\"hhjjhb jkbjkbk kjnkjjkn kjnjknjk  kjnjk jk jk jknjk njk \",\"content_id\":null,\"parent_id\":null,\"comment_id\":\"172\"}}', 0, 0, 'pl_PL'),
(306, 0, '2020-07-29 11:45:31', '2020-07-29 11:45:31', 1, 180, 5, 7, 23, '{\"message\":{\"content\":\"Kolejna pr\\u00f3ba :D\",\"reason\":\"\",\"content_id\":null}}', 0, 0, 'pl_PL'),
(307, 51, '2020-07-29 11:45:31', '2020-07-29 11:45:51', 0, 180, 5, 7, 23, '{\"message\":{\"user_id\":51,\"content\":\"Kolejna pr\\u00f3ba :D\",\"reason\":\"\",\"content_id\":null,\"parent_id\":46,\"comment_id\":\"180\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(308, 0, '2020-07-29 11:50:25', '2020-07-29 11:50:25', 1, 145, 5, 51, 23, '{\"message\":{\"content\":\"zxcc zxczxczx zxczcz zxcz \",\"reason\":\"dchdjndjk dkjndjknjkd dkldnklnfkd\",\"content_id\":22}}', 0, 0, 'pl_PL'),
(309, 7, '2020-07-29 11:50:25', '2020-07-29 11:50:48', 0, 145, 5, 51, 23, '{\"message\":{\"user_id\":7,\"content\":\"zxcc zxczxczx zxczcz zxcz \",\"reason\":\"dchdjndjk dkjndjknjkd dkldnklnfkd\",\"content_id\":22,\"parent_id\":46,\"comment_id\":\"145\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(310, 0, '2020-07-29 11:52:43', '2020-07-29 11:52:43', 1, 148, 5, 7, 23, '{\"message\":{\"content\":\"gddrhtrfgfghfhfgh\",\"reason\":\"hjbjhb hjbhjbhj hjbhjb bhjbhj hj\",\"content_id\":22}}', 0, 0, 'pl_PL'),
(311, 51, '2020-07-29 11:52:43', '2020-07-29 11:53:00', 0, 148, 5, 7, 23, '{\"message\":{\"user_id\":51,\"content\":\"gddrhtrfgfghfhfgh\",\"reason\":\"hjbjhb hjbhjbhj hjbhjb bhjbhj hj\",\"content_id\":22,\"parent_id\":145,\"comment_id\":\"148\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(312, 0, '2020-07-29 11:55:37', '2020-07-29 11:55:37', 1, 65, 5, 51, 23, '{\"message\":{\"content\":\"sdfsd sdf sd ds\",\"reason\":\"\",\"content_id\":29}}', 0, 0, 'pl_PL'),
(313, 7, '2020-07-29 11:55:37', '2020-07-29 11:55:37', 1, 65, 5, 51, 23, '{\"message\":{\"user_id\":7,\"content\":\"sdfsd sdf sd ds\",\"reason\":\"\",\"content_id\":29,\"note_id\":\"65\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(314, 0, '2020-07-29 12:05:17', '2020-07-29 12:05:17', 1, 30, 5, 51, 27, '{\"message\":{\"content\":\"Pierwsze by\\u0142o jajko\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":22}}', 0, 0, 'pl_PL'),
(315, 7, '2020-07-29 12:05:17', '2020-07-29 12:05:47', 0, 30, 5, 51, 27, '{\"message\":{\"user_id\":7,\"content\":\"Pierwsze by\\u0142o jajko\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":22,\"note_id\":\"30\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(316, 0, '2020-07-29 12:06:35', '2020-07-29 12:06:35', 1, 183, 5, 51, 27, '{\"message\":{\"content\":\"afasfas gdsfdsfs\",\"reason\":\"ewerverbe r ewrw rrfr  rvwerew ervw\",\"content_id\":72}}', 0, 0, 'pl_PL'),
(317, 7, '2020-07-29 12:06:35', '2020-07-29 12:07:28', 0, 183, 5, 51, 27, '{\"message\":{\"user_id\":7,\"content\":\"afasfas gdsfdsfs\",\"reason\":\"ewerverbe r ewrw rrfr  rvwerew ervw\",\"content_id\":72,\"note_id\":\"183\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(318, 0, '2020-07-29 12:08:30', '2020-07-29 12:08:30', 1, 138, 5, 7, 27, '{\"message\":{\"content\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10}}', 0, 0, 'pl_PL'),
(319, 48, '2020-07-29 12:08:30', '2020-07-29 12:08:30', 1, 138, 5, 7, 27, '{\"message\":{\"user_id\":48,\"content\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10,\"note_id\":\"138\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(320, 0, '2020-07-29 12:08:32', '2020-07-29 12:08:32', 1, 138, 5, 7, 27, '{\"message\":{\"content\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10}}', 0, 0, 'pl_PL'),
(321, 48, '2020-07-29 12:08:32', '2020-07-29 12:08:32', 1, 138, 5, 7, 27, '{\"message\":{\"user_id\":48,\"content\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10,\"note_id\":\"138\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(322, 0, '2020-07-29 12:08:33', '2020-07-29 12:08:33', 1, 138, 5, 7, 27, '{\"message\":{\"content\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10}}', 0, 0, 'pl_PL'),
(323, 48, '2020-07-29 12:08:33', '2020-07-29 12:08:33', 1, 138, 5, 7, 27, '{\"message\":{\"user_id\":48,\"content\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10,\"note_id\":\"138\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(324, 0, '2020-07-29 12:09:15', '2020-07-29 12:09:15', 1, 59, 5, 7, 27, '{\"message\":{\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10}}', 0, 0, 'pl_PL'),
(325, 5, '2020-07-29 12:09:15', '2020-07-29 12:09:15', 1, 59, 5, 7, 27, '{\"message\":{\"user_id\":5,\"content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10,\"note_id\":\"59\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(326, 0, '2020-07-29 12:12:10', '2020-07-29 12:12:10', 1, 28, 5, 7, 27, '{\"message\":{\"content\":\"test answer\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10}}', 0, 0, 'pl_PL'),
(327, 5, '2020-07-29 12:12:10', '2020-07-29 12:12:10', 1, 28, 5, 7, 27, '{\"message\":{\"user_id\":5,\"content\":\"test answer\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10,\"note_id\":\"28\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(328, 0, '2020-07-29 12:12:42', '2020-07-29 12:12:42', 1, 12, 5, 7, 27, '{\"message\":{\"content\":\"ddd\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10}}', 0, 0, 'pl_PL'),
(329, 5, '2020-07-29 12:12:42', '2020-07-29 12:12:42', 1, 12, 5, 7, 27, '{\"message\":{\"user_id\":5,\"content\":\"ddd\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10,\"note_id\":\"12\",\"type_id\":null}}', 0, 0, 'pl_PL'),
(330, 0, '2020-07-29 12:13:24', '2020-07-29 12:13:24', 1, 58, 5, 7, 27, '{\"message\":{\"content\":\"odpowiedz test\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10}}', 0, 0, 'pl_PL'),
(331, 5, '2020-07-29 12:13:24', '2020-07-29 12:13:24', 1, 58, 5, 7, 27, '{\"message\":{\"user_id\":5,\"content\":\"odpowiedz test\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":10,\"note_id\":\"58\",\"type_id\":2}}', 0, 0, 'pl_PL'),
(332, 0, '2020-07-29 12:14:13', '2020-07-29 12:14:13', 1, 117, 5, 7, 27, '{\"message\":{\"content\":\"test2\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":32}}', 0, 0, 'pl_PL'),
(333, 5, '2020-07-29 12:14:13', '2020-07-29 12:14:13', 1, 117, 5, 7, 27, '{\"message\":{\"user_id\":5,\"content\":\"test2\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":32,\"note_id\":\"117\",\"type_id\":1}}', 0, 0, 'pl_PL'),
(334, 51, '2020-07-29 12:59:17', '2020-07-29 13:14:14', 0, 174, 5, 7, 7, '{\"message\":{\"content\":22,\"type_id\":2,\"title\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":1,\"comment_id\":174,\"description\":\"<p>Na serio?<\\/p>\\r\\n\",\"reason_description\":\"S\\u0142abo\"}}', 0, 0, 'pl_PL'),
(335, 7, '2020-07-29 13:25:01', '2020-07-29 13:33:11', 0, 0, 0, 6, 30, '{\"message\":{\"added\":\" Blocked II, Give permission II\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(336, 7, '2020-07-29 13:25:31', '2020-07-29 13:26:01', 0, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zarz\\u0105dzanie banerami\",\"substantiation\":\"ewr wer w werwerwe\",\"blocked_to\":\"2020-08-05\"}}', 0, 0, 'pl_PL'),
(337, 0, '2020-07-29 13:44:33', '2020-07-29 13:44:33', 1, 7, 4, 6, 22, '{\"message\":{\"content\":\"11\",\"reason\":\"Inappropriate username\",\"user_id\":\"7\"}}', 0, 0, 'pl_PL'),
(338, 7, '2020-07-29 13:44:33', '2020-07-29 13:48:16', 0, 7, 4, 6, 22, '{\"message\":{\"content\":\"11\",\"reason\":\"Inappropriate username\",\"user_id\":\"7\"}}', 0, 0, 'pl_PL'),
(339, 0, '2020-07-30 12:46:20', '2020-07-30 12:46:20', 1, 167, 5, 6, 27, '{\"message\":{\"content\":\"<p>zxczxc zvzx cxzxvzb zffbzbzvbzv<\\/p>\\r\\n\",\"reason\":\"dasdsc sdvdsv  dsvdsvsdv sddsvsdv sdvsdvsd sdvsdvs\",\"content_id\":22}}', 0, 0, 'pl_PL'),
(340, 7, '2020-07-30 12:46:20', '2020-08-14 07:24:08', 0, 167, 5, 6, 27, '{\"message\":{\"user_id\":7,\"content\":\"<p>zxczxc zvzx cxzxvzb zffbzbzvbzv<\\/p>\\r\\n\",\"reason\":\"dasdsc sdvdsv  dsvdsvsdv sddsvsdv sdvsdvsd sdvsdvs\",\"content_id\":22,\"note_id\":\"167\",\"type_id\":2}}', 0, 0, 'pl_PL'),
(341, 0, '2020-07-30 12:48:14', '2020-07-30 12:48:14', 1, 168, 5, 6, 27, '{\"message\":{\"content\":\"<p>Czxvzx zvzxvzxvzx vzvzxvxz<\\/p>\\r\\n\",\"reason\":\"asdas \",\"content_id\":22}}', 0, 0, 'pl_PL'),
(342, 7, '2020-07-30 12:48:14', '2020-07-30 12:48:14', 1, 168, 5, 6, 27, '{\"message\":{\"user_id\":7,\"content\":\"<p>Czxvzx zvzxvzxvzx vzvzxvxz<\\/p>\\r\\n\",\"reason\":\"asdas \",\"content_id\":22,\"note_id\":\"168\",\"type_id\":2}}', 0, 0, 'pl_PL'),
(343, 6, '2020-07-30 16:51:40', '2020-07-30 17:25:14', 0, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj\",\"substantiation\":\"sadasd dsdas dasda\",\"blocked_to\":\"2020-07-31\"}}', 0, 0, 'pl_PL'),
(344, 6, '2020-07-30 17:03:09', '2020-07-30 17:19:10', 0, 0, 0, 7, 30, '{\"message\":{\"added\":\" Settle I, Settle IV, Set Banner\",\"removed\":\" Newsletter accept\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(345, 0, '2020-07-30 18:39:35', '2020-07-30 18:39:35', 1, 86, 1, 51, 11, '{\"message\":{\"content\":86,\"type_id\":2,\"title\":\"aasdsadasd\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\",\\\"14\\\":\\\"bt\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(346, 51, '2020-07-30 18:42:41', '2020-07-30 18:42:41', 1, 73, 1, 51, 4, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"dfgd\",\"counter_accepts\":1}', 0, 0, 'pl_PL'),
(347, 51, '2020-07-30 18:42:41', '2020-07-30 18:44:37', 0, 80, 1, 51, 4, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"AJKSHJA kAJSKLJA nlkjdklaj NKLAJDKLj\",\"counter_accepts\":1}', 0, 0, 'pl_PL'),
(348, 51, '2020-07-30 18:42:42', '2020-07-30 18:44:42', 0, 80, 1, 51, 4, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"AJKSHJA kAJSKLJA nlkjdklaj NKLAJDKLj\",\"counter_accepts\":1}', 0, 0, 'pl_PL'),
(349, 51, '2020-07-30 18:42:42', '2020-07-30 18:44:46', 0, 85, 1, 51, 4, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdasdd das d\",\"counter_accepts\":1}', 0, 0, 'pl_PL'),
(350, 51, '2020-07-30 18:42:42', '2020-07-30 18:44:49', 0, 85, 1, 51, 4, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdasdd das d\",\"counter_accepts\":1}', 0, 0, 'pl_PL'),
(356, 0, '2020-07-30 18:47:24', '2020-07-30 18:47:24', 1, 87, 1, 51, 11, '{\"message\":{\"content\":87,\"type_id\":1,\"title\":\"sasdas ddsad as\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(357, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 74, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"dsadas\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(358, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 75, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"sfsdfasd\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(359, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 75, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"sfsdfasd\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(360, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 76, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdasda\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(361, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 76, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdasda\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(362, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 76, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdasda\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(363, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 77, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"SAsASDSA?\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(364, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 77, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"SAsASDSA?\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(365, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 77, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"SAsASDSA?\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(366, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 77, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"SAsASDSA?\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(367, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 78, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdas dsdf\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(368, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 78, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdas dsdf\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(369, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 78, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdas dsdf\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(370, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 78, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdas dsdf\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(371, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 78, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"asdas dsdf\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(372, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 79, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"aSAa\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(373, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 79, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"aSAa\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(374, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 79, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"aSAa\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(375, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 79, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"aSAa\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(376, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 79, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"aSAa\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(377, 7, '2020-07-30 18:47:31', '2020-07-30 18:47:31', 1, 79, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"aSAa\",\"counter_accepts\":0}', 0, 0, 'pl_PL'),
(388, 51, '2020-07-30 19:08:35', '2020-07-30 19:50:07', 1, 87, 1, 51, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"sasdas ddsad as\",\"counter_rejects\":1}', 0, 0, 'pl_PL'),
(389, 51, '2020-07-30 19:12:33', '2020-07-30 19:12:33', 1, 86, 1, 51, 4, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"aasdsadasd\",\"counter_accepts\":2}', 0, 0, 'pl_PL'),
(390, 6, '2020-07-30 20:52:03', '2020-08-14 06:56:11', 0, 82, 1, 6, 4, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"SDAD\",\"counter_accepts\":1}', 0, 0, 'pl_PL'),
(391, 6, '2020-07-30 21:28:22', '2020-07-30 21:29:15', 0, 199, 5, 7, 6, '{\"message\":{\"content\":82,\"type_id\":1,\"title\":\"SDAD\",\"reason\":1,\"comment_id\":199,\"description\":\"kjdkfjdsjf dofjidsojfo kdskfjosdijf dskfndsiofn sdfosdifj\"}}', 0, 0, 'pl_PL'),
(392, 7, '2020-07-30 21:29:01', '2020-07-30 21:29:01', 1, 199, 5, 6, 7, '{\"message\":{\"content\":82,\"type_id\":1,\"title\":\"SDAD\",\"reason\":1,\"comment_id\":199,\"description\":\"kjdkfjdsjf dofjidsojfo kdskfjosdijf dskfndsiofn sdfosdifj\",\"reason_description\":\"pomy\\u0142ka\"}}', 0, 0, 'pl_PL'),
(393, 0, '2020-07-30 21:34:26', '2020-07-30 21:34:26', 1, 7, 4, 6, 22, '{\"message\":{\"content\":\"11\",\"reason\":\"Nieprawid\\u0142owa nazwa u\\u017cytkownika.\",\"user_id\":\"7\"}}', 0, 0, 'pl_PL'),
(394, 7, '2020-07-30 21:34:26', '2020-07-30 21:34:57', 0, 7, 4, 6, 22, '{\"message\":{\"content\":\"11\",\"reason\":\"Nieprawid\\u0142owa nazwa u\\u017cytkownika.\",\"user_id\":\"7\"}}', 0, 0, 'pl_PL'),
(395, 6, '2020-08-06 04:45:28', '2020-08-14 06:56:02', 0, 6, 9, 31, 50, '{\"message\":\"S\\u0142abo\",\"time\":\"604800\"}', 0, 0, 'pl_PL'),
(396, 0, '2020-08-06 05:07:27', '2020-08-06 05:07:27', 1, 46, 1, 31, 11, '{\"message\":{\"content\":46,\"type_id\":2,\"title\":\"teste 2\",\"reason\":2}}', 0, 0, 'pl_PL'),
(397, -1, '2020-08-06 05:13:25', '2020-08-06 05:13:25', 1, 88, 1, 31, 11, '{\"message\":{\"content\":88,\"type_id\":2,\"title\":\"fess rwr 3r 23 32rfe\",\"categories\":\"{\\\"11\\\":\\\"Analizy\\\",\\\"13\\\":\\\"Bitcoin\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(398, 5, '2020-08-06 05:14:54', '2020-08-06 05:14:54', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publisher II, Editor, Settle I, Settle IV, Blocked II, Give permission II, Set Banner, Newsletter accept\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(399, 0, '2020-08-06 05:15:33', '2020-08-06 05:15:33', 1, 11, 1, 5, 11, '{\"message\":{\"content\":11,\"type_id\":2,\"title\":\"Kiedy bitcoin oficjalnym srodkiem platniczym ?232\",\"reason\":2}}', 0, 0, 'pl_PL'),
(400, 0, '2020-08-06 05:15:55', '2020-08-06 05:15:55', 1, 10, 1, 5, 11, '{\"message\":{\"content\":10,\"type_id\":2,\"title\":\"To BI or not to BITCOIN ?23\",\"reason\":2}}', 0, 0, 'pl_PL'),
(401, 5, '2020-08-06 05:20:03', '2020-08-06 05:20:03', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publisher I\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(402, 5, '2020-08-08 09:44:15', '2020-08-08 12:11:58', 0, 71, 4, 6, 60, '{\"message\":{\"content\":\"Dawaj go\"}}', 0, 0, 'pl_PL'),
(403, 5, '2020-08-08 09:50:55', '2020-08-08 12:11:55', 0, 70, 4, 6, 60, '{\"message\":{\"content\":\"wesefgsv e esf sfs dfsfs fsdf\"}}', 0, 0, 'pl_PL'),
(404, 5, '2020-08-08 10:09:45', '2020-08-08 12:11:51', 0, 69, 4, 6, 60, '{\"message\":{\"content\":\"kajhjfka askldashdaskjh asdjksandjaskbdnsjkbdjkasdjksnjkas\"}}', 0, 0, 'pl_PL'),
(405, 5, '2020-08-08 12:08:23', '2020-08-09 13:57:29', 0, 68, 4, 6, 28, '{\"message\":{\"content\":\"Nie na temat\",\"type_decision\":\"DELETE\",\"type_content\":\"COMMENT\",\"contet_deleted_id\":59}}', 0, 0, 'pl_PL'),
(406, 48, '2020-08-08 12:28:27', '2020-08-08 12:28:27', 1, 67, 4, 6, 28, '{\"message\":{\"content\":\"Kiepskie zg\\u0142oszenie\",\"type_decision\":\"REJECT\",\"type_content\":\"COMMENT\",\"contet_deleted_id\":138}}', 0, 0, 'pl_PL'),
(407, 48, '2020-08-08 12:35:23', '2020-08-08 12:35:23', 1, 66, 4, 6, 28, '{\"message\":{\"content\":\"jsdjbjdks ajsdjkand sakndjakd\",\"type_decision\":\"DELETE\",\"type_content\":\"COMMENT\",\"contet_deleted_id\":138,\"contet_text\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\"}}', 0, 0, 'pl_PL'),
(408, 48, '2020-08-08 12:37:25', '2020-08-09 11:09:40', 0, 65, 4, 6, 28, '{\"message\":{\"content\":\"scscas ddasdsada dasasdasdasdasda\",\"type_decision\":\"DELETE\",\"type_content\":\"COMMENT\",\"contet_deleted_id\":138,\"content_text\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\"}}', 0, 0, 'pl_PL'),
(409, 51, '2020-08-09 13:10:51', '2020-08-09 13:13:16', 0, 43, 4, 7, 28, '{\"message\":{\"content\":\"Bez powodu\",\"type_decision\":\"REJECT\",\"type_content\":\"ARTICLE\",\"content_reject_id\":80}}', 0, 0, 'pl_PL'),
(410, 51, '2020-08-09 13:13:48', '2020-08-09 13:14:05', 0, 42, 4, 7, 28, '{\"message\":{\"content\":\"rththty 6y  y6t y56y 56y65y \",\"type_decision\":\"REJECT\",\"type_content\":\"ARTICLE\",\"content_reject_id\":41,\"content_text\":\"adjsahkj\"}}', 0, 0, 'pl_PL'),
(411, 0, '2020-08-09 13:54:57', '2020-08-09 13:54:57', 1, 48, 4, 6, 22, '{\"message\":{\"content\":\"14\",\"reason\":\"U\\u017cytkownik publikuje nieodpowiednie tre\\u015bci\",\"user_id\":\"48\"}}', 0, 0, 'pl_PL'),
(412, 48, '2020-08-09 13:54:57', '2020-08-09 13:56:13', 0, 48, 4, 6, 22, '{\"message\":{\"content\":\"14\",\"reason\":\"U\\u017cytkownik publikuje nieodpowiednie tre\\u015bci\",\"user_id\":\"48\"}}', 0, 0, 'pl_PL'),
(413, 48, '2020-08-09 13:55:32', '2020-08-09 13:56:08', 0, 0, 0, 7, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Publisher II, Accept\",\"substantiation\":\"Na 7 dni uwa\\u017caj\",\"blocked_to\":\"2020-08-16\"}}', 0, 0, 'pl_PL'),
(414, 0, '2020-08-21 11:12:05', '2020-08-21 11:12:05', 1, 22, 4, 51, 26, '{\"message\":{\"content\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"22\",\"type_id\":2,\"user_id\":29}}', 0, 0, 'pl_PL'),
(415, 29, '2020-08-21 11:12:05', '2020-08-21 11:12:05', 1, 22, 4, 51, 26, '{\"message\":{\"content\":\"Co by\\u0142o pierwsze jajko czy kura ?\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"22\",\"type_id\":2,\"user_id\":29}}', 0, 0, 'pl_PL'),
(416, 29, '2020-08-21 11:12:26', '2020-08-21 11:12:26', 1, 78, 4, 7, 60, '{\"message\":{\"content\":\"Popraw\"}}', 0, 0, 'pl_PL'),
(417, 7, '2020-08-24 08:24:38', '2020-08-24 08:24:38', 1, 89, 1, 7, 5, '{\"message\":\"Your content was resolve as accepted.\",\"title\":\"Deweloperzy XRP uruchamiaj\\u0105 smart kontrakty Ethereum na sieci Flare Network \",\"counter_rejects\":1}', 0, 0, 'pl_PL'),
(418, 31, '2020-08-26 11:47:04', '2020-08-26 11:47:04', 1, 16, 4, 6, 60, '{\"message\":{\"content\":\"mkfjsdjfn fkdjdsjfklnfdskljflkdsjfkln fksdjfkjsdklfnsd fsdfjsdfjfjksl\"}}', 0, 0, 'pl_PL'),
(419, 29, '2020-08-26 11:56:17', '2020-08-26 11:56:17', 1, 78, 4, 6, 60, '{\"message\":{\"content\":\"dkdklasjd klsadjklsa klasdkla klasdkla klasdmklasn\"}}', 0, 0, 'pl_PL'),
(420, 0, '2020-08-26 12:03:30', '2020-08-26 12:03:30', 1, 52, 4, 6, 26, '{\"message\":{\"content\":\"adsa\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"52\",\"type_id\":2,\"user_id\":7}}', 0, 0, 'pl_PL'),
(421, 7, '2020-08-26 12:03:30', '2020-08-26 12:03:30', 1, 52, 4, 6, 26, '{\"message\":{\"content\":\"adsa\",\"reason\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"content_id\":\"52\",\"type_id\":2,\"user_id\":7}}', 0, 0, 'pl_PL'),
(422, 7, '2020-08-26 12:04:48', '2020-09-14 06:41:44', 0, 64, 4, 6, 28, '{\"message\":{\"content\":\"fdsfdsfsdfds\",\"type_decision\":\"REJECT\",\"type_content\":\"COMMENT\",\"content_reject_id\":183,\"content_text\":null}}', 0, 0, 'pl_PL'),
(423, 7, '2020-08-26 12:07:42', '2020-08-26 12:07:42', 1, 64, 4, 6, 28, '{\"message\":{\"content\":\"fdsfdsfsdfds\",\"type_decision\":\"REJECT\",\"type_content\":\"COMMENT\",\"content_reject_id\":183,\"content_text\":\"afasfas gdsfdsfs\"}}', 0, 0, 'pl_PL'),
(424, 7, '2020-08-26 12:08:06', '2020-08-26 12:08:06', 1, 63, 4, 6, 28, '{\"message\":{\"content\":\"Test b\\u0142\\u0119du\",\"type_decision\":\"REJECT\",\"type_content\":\"COMMENT\",\"content_reject_id\":30,\"content_text\":\"Pierwsze by\\u0142o jajko\"}}', 0, 0, 'pl_PL'),
(425, 5, '2020-08-26 12:17:42', '2020-08-26 12:17:42', 1, 18, 4, 7, 28, '{\"message\":{\"content\":\"dfdssdfsd sdf sdfsd fsdfsdf s\",\"type_decision\":\"REJECT\",\"type_content\":\"USER\",\"content_reject_id\":5,\"content_text\":\"\"}}', 0, 0, 'pl_PL'),
(426, 51, '2020-08-26 12:18:41', '2020-08-26 12:18:41', 1, 34, 4, 7, 28, '{\"message\":{\"content\":\"sasadsad sda sdasdasd a\",\"type_decision\":\"DELETE\",\"type_content\":\"COMMENT\",\"content_deleted_id\":148,\"content_text\":\"gddrhtrfgfghfhfgh\"}}', 0, 0, 'pl_PL'),
(427, 7, '2020-08-26 12:25:23', '2020-08-26 12:25:23', 1, 79, 4, 31, 28, '{\"message\":{\"content\":\"sascsasd sadasd asdas dasd\",\"type_decision\":\"DELETE\",\"type_content\":\"ARTICLE\",\"content_deleted_id\":52,\"content_text\":\"adsa\"}}', 0, 0, 'pl_PL'),
(428, 29, '2020-08-26 12:52:24', '2020-08-26 12:52:24', 1, 29, 9, 7, 50, '{\"message\":\"c xzv xczxc sdf  sd fsdfsdf sd\",\"time\":\"1209600\"}', 0, 0, 'pl_PL'),
(429, 29, '2020-08-26 12:52:56', '2020-08-26 12:52:56', 1, 29, 9, 7, 50, '{\"message\":\"cczvv v fvdfvfdvdf vdfvdf\",\"time\":\"2592000\"}', 0, 0, 'pl_PL'),
(430, -1, '2020-09-04 06:38:22', '2020-09-04 06:38:22', 1, 90, 1, 6, 11, '{\"message\":{\"content\":90,\"type_id\":1,\"title\":\"njsdjncfdn\",\"categories\":\"{\\\"19\\\":\\\"bh\\\",\\\"20\\\":\\\"vhjb\\\",\\\"21\\\":\\\"hvhjb\\\"}\",\"reason\":1}}', 0, 0, 'pl_PL'),
(431, 5, '2020-09-04 06:40:33', '2020-09-04 06:40:33', 1, 0, 0, 7, 30, '{\"message\":{\"added\":\" Publisher I\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(432, 0, '2020-09-04 06:41:08', '2020-09-04 06:41:08', 1, 91, 1, 5, 11, '{\"message\":{\"content\":91,\"type_id\":1,\"title\":\"sjfdsfdl\",\"categories\":\"{\\\"22\\\":\\\"fds\\\",\\\"23\\\":\\\"sfd\\\",\\\"24\\\":\\\"dsf\\\"}\",\"reason\":1}}', 0, 0, 'en_EN'),
(437, -1, '2020-09-04 07:00:38', '2020-09-04 07:00:38', 1, 100, 1, 7, 11, '{\"message\":{\"content\":100,\"type_id\":1,\"title\":\"sdadsaa\",\"categories\":\"[]\",\"reason\":1}}', 0, 0, 'en_US'),
(438, 0, '2020-09-04 07:01:33', '2020-09-04 07:01:33', 1, 101, 1, 5, 11, '{\"message\":{\"content\":101,\"type_id\":1,\"title\":\"asdadsadhjab\",\"categories\":\"{\\\"26\\\":\\\"asd\\\"}\",\"reason\":1}}', 0, 0, 'en_US'),
(439, 0, '2020-09-04 07:06:26', '2020-09-04 07:06:26', 1, 101, 4, 7, 26, '{\"message\":{\"content\":\"asdadsadhjab\",\"reason\":\"sgdfsdfsfs\",\"content_id\":\"101\",\"type_id\":1,\"user_id\":5}}', 0, 0, 'en_US'),
(440, 5, '2020-09-04 07:06:26', '2020-09-04 07:06:26', 1, 101, 4, 7, 26, '{\"message\":{\"content\":\"asdadsadhjab\",\"reason\":\"sgdfsdfsfs\",\"content_id\":\"101\",\"type_id\":1,\"user_id\":5}}', 0, 0, 'en_US'),
(441, 7, '2020-09-14 06:18:56', '2020-09-14 06:18:56', 1, 200, 5, 6, 6, '{\"message\":{\"content\":100,\"type_id\":1,\"title\":\"sdadsaa\",\"reason\":1,\"comment_id\":200,\"description\":\"werwer vewr ew rwe rwe r\"}}', 0, 0, 'en_US'),
(442, 7, '2020-09-14 06:43:12', '2020-09-14 06:43:34', 0, 21, 4, 6, 28, '{\"message\":{\"content\":\"csasdasd dasd as\",\"type_decision\":\"REJECT\",\"type_content\":\"ARTICLE\",\"content_reject_id\":75,\"content_text\":\"sfsdfasd\"}}', 0, 0, 'pl_PL'),
(443, 7, '2020-10-16 06:50:00', '2020-10-16 06:50:00', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\"\",\"removed\":\" Zaakceptuj, Editor\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL'),
(444, 7, '2020-10-16 06:50:08', '2020-10-16 06:50:08', 1, 0, 0, 6, 30, '{\"message\":{\"added\":\" Zaakceptuj, Editor\",\"removed\":\"\",\"substantiation\":\"\",\"blocked_to\":-1}}', 0, 0, 'pl_PL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notices_emails`
--

CREATE TABLE `notices_emails` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `content_message` text NOT NULL,
  `created_by` int NOT NULL,
  `content_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `notice_type_id` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `frequency` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notices_statuses`
--

CREATE TABLE `notices_statuses` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `notice_id` bigint NOT NULL,
  `status` smallint NOT NULL,
  `is_deleted` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `notices_statuses`
--

INSERT INTO `notices_statuses` (`id`, `user_id`, `notice_id`, `status`, `is_deleted`) VALUES
(54, 5, 89, 0, 0),
(55, 5, 90, 0, 0),
(56, 5, 91, 0, 0),
(57, 5, 92, 0, 0),
(58, 5, 100, 0, 0),
(59, 5, 101, 0, 1),
(60, 5, 102, 0, 1),
(61, 5, 103, 0, 1),
(62, 8, 89, 0, 0),
(63, 8, 103, 0, 0),
(64, 8, 102, 0, 0),
(65, 8, 100, 0, 0),
(66, 8, 90, 0, 0),
(67, 8, 84, 0, 0),
(68, 8, 73, 0, 0),
(69, 8, 68, 0, 0),
(70, 7, 103, 0, 0),
(71, 7, 97, 0, 0),
(72, 7, 90, 0, 0),
(73, 7, 66, 0, 0),
(74, 5, 95, 1, 1),
(75, 5, 96, 1, 1),
(76, 5, 97, 1, 1),
(77, 5, 98, 1, 1),
(78, 5, 99, 1, 1),
(79, 8, 78, 0, 0),
(80, 51, 65, 0, 0),
(81, 51, 87, 0, 0),
(82, 51, 102, 0, 0),
(83, 51, 103, 0, 0),
(84, 51, 100, 0, 0),
(85, 7, 104, 0, 0),
(86, 5, 105, 0, 0),
(87, 52, 108, 0, 0),
(88, 52, 112, 0, 0),
(89, 52, 110, 0, 0),
(90, 7, 112, 0, 0),
(91, 7, 110, 0, 0),
(92, 7, 96, 0, 0),
(93, 8, 115, 0, 0),
(94, 48, 116, 0, 0),
(95, 40, 118, 0, 0),
(96, 7, 118, 0, 0),
(97, 7, 119, 0, 0),
(98, 7, 120, 0, 1),
(99, 52, 121, 0, 0),
(100, 52, 122, 0, 0),
(101, 8, 122, 0, 0),
(102, 8, 117, 0, 0),
(103, 7, 105, 0, 0),
(104, 7, 107, 0, 0),
(105, 7, 108, 0, 0),
(106, 7, 114, 0, 0),
(107, 7, 115, 0, 0),
(108, 7, 116, 0, 0),
(109, 7, 121, 0, 1),
(110, 7, 122, 0, 1),
(119, 51, 96, 0, 0),
(120, 51, 97, 0, 0),
(121, 51, 139, 0, 1),
(122, 51, 132, 1, 1),
(123, 51, 125, 0, 0),
(124, 51, 129, 0, 0),
(125, 51, 130, 0, 0),
(126, 51, 131, 0, 1),
(127, 51, 138, 0, 0),
(128, 51, 136, 0, 0),
(129, 51, 135, 1, 1),
(130, 7, 140, 0, 1),
(131, 7, 91, 0, 0),
(132, 51, 142, 0, 0),
(133, 51, 148, 0, 0),
(134, 51, 147, 0, 0),
(135, 51, 151, 0, 0),
(136, 7, 136, 0, 0),
(137, 7, 154, 0, 0),
(138, 7, 153, 0, 1),
(139, 7, 151, 0, 0),
(140, 7, 152, 0, 0),
(141, 51, 152, 0, 0),
(142, 51, 145, 0, 0),
(143, 7, 155, 0, 0),
(144, 51, 228, 0, 0),
(145, 7, 232, 0, 0),
(146, 7, 234, 0, 0),
(147, 7, 225, 0, 0),
(148, 6, 237, 0, 0),
(149, 6, 156, 0, 0),
(150, 6, 154, 0, 0),
(151, 31, 124, 0, 0),
(152, 7, 251, 0, 0),
(153, 31, 251, 0, 0),
(154, 31, 120, 0, 0),
(155, 5, 268, 0, 0),
(156, 6, 259, 0, 0),
(157, 31, 273, 0, 0),
(158, 6, 273, 0, 0),
(159, 7, 275, 0, 1),
(160, 7, 278, 0, 1),
(161, 7, 141, 0, 0),
(162, 7, 145, 0, 0),
(163, 7, 146, 0, 0),
(164, 7, 227, 0, 1),
(165, 7, 228, 0, 0),
(166, 7, 229, 0, 0),
(167, 7, 230, 0, 0),
(168, 7, 231, 0, 0),
(169, 7, 266, 0, 0),
(170, 7, 271, 0, 0),
(171, 7, 273, 0, 0),
(172, 7, 221, 0, 1),
(173, 7, 222, 0, 0),
(174, 7, 223, 0, 0),
(175, 7, 224, 0, 0),
(176, 7, 139, 1, 1),
(177, 7, 147, 1, 1),
(178, 7, 245, 0, 1),
(179, 7, 263, 0, 1),
(180, 7, 133, 0, 1),
(181, 7, 217, 0, 0),
(182, 7, 218, 0, 0),
(183, 7, 219, 0, 0),
(184, 7, 237, 0, 1),
(185, 7, 238, 0, 1),
(186, 7, 257, 0, 1),
(187, 7, 258, 0, 1),
(188, 7, 261, 0, 1),
(189, 7, 262, 0, 1),
(190, 7, 73, 0, 0),
(191, 7, 74, 0, 0),
(192, 7, 89, 0, 0),
(193, 7, 95, 0, 0),
(194, 7, 253, 1, 1),
(195, 7, 259, 1, 1),
(196, 7, 260, 1, 1),
(197, 7, 267, 1, 1),
(198, 7, 274, 1, 1),
(199, 7, 220, 0, 0),
(200, 7, 233, 0, 0),
(201, 7, 134, 0, 0),
(202, 7, 135, 0, 0),
(203, 7, 137, 0, 0),
(204, 7, 138, 0, 0),
(205, 6, 137, 1, 1),
(206, 6, 141, 1, 1),
(207, 6, 136, 1, 1),
(208, 7, 302, 1, 1),
(209, 7, 345, 0, 0),
(210, 7, 356, 0, 0),
(211, 31, 271, 0, 0),
(212, 31, 345, 0, 0),
(213, 6, 400, 0, 0),
(214, 6, 396, 0, 0),
(215, 6, 397, 0, 0),
(216, 6, 399, 0, 0),
(217, 7, 400, 0, 0),
(218, 6, 356, 0, 0),
(219, 6, 345, 0, 0),
(220, 7, 438, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notices_subscriptions`
--

CREATE TABLE `notices_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `notice_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `notices_subscriptions`
--

INSERT INTO `notices_subscriptions` (`id`, `user_id`, `notice_id`, `created`) VALUES
(1, 7, 122, '2020-06-29 13:30:11'),
(2, 7, 121, '2020-06-29 13:45:44'),
(3, 7, 120, '2020-06-29 13:45:56'),
(4, 51, 125, '2020-06-29 15:34:14'),
(5, 51, 129, '2020-06-29 20:43:55'),
(6, 51, 130, '2020-06-29 21:08:40'),
(7, 51, 131, '2020-06-29 21:44:42'),
(8, 51, 132, '2020-06-29 21:46:51'),
(9, 7, 133, '2020-06-29 23:01:08'),
(10, 7, 134, '2020-06-29 23:02:54'),
(11, 7, 135, '2020-06-29 23:51:08'),
(12, 51, 135, '2020-06-29 23:51:08'),
(13, 7, 136, '2020-06-30 07:57:59'),
(14, 51, 136, '2020-06-30 07:57:59'),
(15, 6, 136, '2020-06-30 07:57:59'),
(16, 7, 137, '2020-06-30 08:00:50'),
(17, 6, 137, '2020-06-30 08:00:50'),
(18, 7, 138, '2020-06-30 08:25:43'),
(19, 51, 138, '2020-06-30 08:25:43'),
(20, 7, 139, '2020-06-30 08:28:25'),
(21, 51, 139, '2020-06-30 08:28:25'),
(22, 7, 140, '2020-07-02 18:23:24'),
(23, 7, 141, '2020-07-02 19:22:49'),
(24, 6, 141, '2020-07-02 19:22:49'),
(25, 51, 141, '2020-07-02 19:22:49'),
(26, 51, 142, '2020-07-02 19:26:57'),
(27, 51, 145, '2020-07-02 20:21:15'),
(28, 7, 145, '2020-07-02 20:21:15'),
(29, 7, 146, '2020-07-02 20:24:28'),
(30, 51, 147, '2020-07-05 10:55:04'),
(31, 7, 147, '2020-07-05 10:55:04'),
(32, 51, 148, '2020-07-05 11:57:27'),
(33, 7, 151, '2020-07-05 21:21:10'),
(34, 51, 151, '2020-07-05 21:21:10'),
(35, 7, 152, '2020-07-05 21:22:55'),
(36, 51, 152, '2020-07-05 21:22:55'),
(37, 7, 153, '2020-07-05 21:30:33'),
(38, 7, 221, '2020-07-18 19:46:37'),
(39, 7, 222, '2020-07-18 19:55:01'),
(40, 51, 222, '2020-07-18 19:55:01'),
(41, 7, 223, '2020-07-18 19:57:42'),
(42, 51, 223, '2020-07-18 19:57:42'),
(43, 7, 224, '2020-07-18 20:01:15'),
(44, 51, 224, '2020-07-18 20:01:15'),
(45, 7, 225, '2020-07-18 20:26:02'),
(46, 51, 225, '2020-07-18 20:26:02'),
(47, 51, 226, '2020-07-18 20:35:38'),
(48, 51, 227, '2020-07-18 20:39:46'),
(49, 7, 227, '2020-07-18 20:39:46'),
(50, 51, 228, '2020-07-18 20:40:03'),
(51, 7, 228, '2020-07-18 20:40:03'),
(52, 51, 229, '2020-07-18 20:43:29'),
(53, 7, 229, '2020-07-18 20:43:29'),
(54, 51, 230, '2020-07-18 20:44:12'),
(55, 7, 230, '2020-07-18 20:44:12'),
(56, 7, 231, '2020-07-18 20:47:10'),
(57, 7, 232, '2020-07-18 20:56:38'),
(58, 51, 233, '2020-07-18 20:57:18'),
(59, 7, 233, '2020-07-18 20:57:18'),
(60, 7, 234, '2020-07-18 21:02:22'),
(61, 51, 236, '2020-07-18 21:06:00'),
(62, 51, 246, '2020-07-22 01:07:46'),
(63, 51, 247, '2020-07-22 01:11:49'),
(64, 7, 251, '2020-07-22 01:34:19'),
(65, 51, 251, '2020-07-22 01:34:19'),
(66, 7, 266, '2020-07-23 18:46:42'),
(67, 51, 266, '2020-07-23 18:46:42'),
(68, 7, 271, '2020-07-24 00:53:15'),
(69, 51, 271, '2020-07-24 00:53:15'),
(70, 7, 273, '2020-07-25 16:00:01'),
(71, 7, 345, '2020-07-30 18:39:35'),
(72, 6, 345, '2020-07-30 18:39:35'),
(73, 7, 356, '2020-07-30 18:47:24'),
(74, 6, 356, '2020-07-30 18:47:24'),
(75, 7, 397, '2020-08-06 05:13:25'),
(76, 51, 397, '2020-08-06 05:13:25'),
(77, 6, 397, '2020-08-06 05:13:25'),
(78, 7, 400, '2020-08-06 05:15:55'),
(79, 51, 400, '2020-08-06 05:15:55'),
(80, 51, 432, '2020-09-04 06:41:08'),
(81, 7, 432, '2020-09-04 06:41:08'),
(82, 51, 438, '2020-09-04 07:01:33'),
(83, 7, 438, '2020-09-04 07:01:33');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `regions`
--

CREATE TABLE `regions` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `description` text,
  `block_count` int NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `regions`
--

INSERT INTO `regions` (`id`, `title`, `alias`, `description`, `block_count`, `created`, `created_by`, `updated`, `updated_by`) VALUES
(3, 'none', 'none', '', 0, NULL, NULL, NULL, NULL),
(4, 'right', 'right', '', 6, NULL, NULL, NULL, NULL),
(6, 'left', 'left', '', 0, NULL, NULL, NULL, NULL),
(7, 'header', 'header', '', 0, NULL, NULL, NULL, NULL),
(8, 'footer', 'footer', '', 0, NULL, NULL, NULL, NULL),
(9, 'region1', 'region1', '', 0, NULL, NULL, NULL, NULL),
(10, 'region2', 'region2', '', 0, NULL, NULL, NULL, NULL),
(11, 'region3', 'region3', '', 0, NULL, NULL, NULL, NULL),
(12, 'region4', 'region4', '', 0, NULL, NULL, NULL, NULL),
(13, 'region5', 'region5', '', 0, NULL, NULL, NULL, NULL),
(14, 'region6', 'region6', '', 0, NULL, NULL, NULL, NULL),
(15, 'region7', 'region7', '', 0, NULL, NULL, NULL, NULL),
(16, 'region8', 'region8', '', 0, NULL, NULL, NULL, NULL),
(17, 'region9', 'region9', '', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rejects`
--

CREATE TABLE `rejects` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `archived` smallint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `rejects`
--

INSERT INTO `rejects` (`id`, `user_id`, `article_id`, `description`, `created`, `updated`, `archived`, `is_deleted`) VALUES
(1, 5, 1, 'test reject', '2019-11-11 09:41:03', '2019-11-11 09:41:03', 0, 0),
(2, 7, 10, 'dg dfs sdf', '2020-01-14 23:12:57', '2020-01-14 23:12:57', 1, 0),
(3, 7, 18, 'sdfsdfsdfs', '2020-01-25 17:47:33', '2020-01-25 17:47:33', 0, 0),
(4, 7, 19, 'sadf asasd as', '2020-01-25 17:59:52', '2020-01-25 17:59:52', 0, 0),
(5, 7, 11, 'gfgd', '2020-02-12 20:26:10', '2020-02-12 20:26:10', 1, 0),
(6, 6, 27, 'Żart', '2020-02-13 14:43:53', '2020-02-13 14:43:53', 0, 0),
(7, 31, 29, 'kłamstwo', '2020-02-18 16:56:05', '2020-02-18 16:56:05', 0, 0),
(8, 34, 23, 'Lorem ipsum', '2020-02-20 12:29:35', '2020-02-20 12:29:35', 1, 0),
(9, 7, 23, 'sdfgsd fsg dsf gsd sdfg sdfg sdg sd sd', '2020-02-24 23:23:30', '2020-02-24 23:23:30', 1, 0),
(10, 7, 32, 'sdfgds', '2020-02-29 20:05:33', '2020-02-29 20:05:55', 1, 1),
(11, 6, 32, 'testowy art.', '2020-03-03 14:22:40', '2020-03-03 14:22:40', 1, 0),
(12, 5, 40, 'odrzucam slaba tresc', '2020-04-04 17:18:05', '2020-04-04 17:18:05', 0, 0),
(13, 52, 46, 'sdsfghjkjkjhg', '2020-05-29 10:10:02', '2020-05-29 10:10:02', 1, 0),
(14, 7, 87, 'dsfds dsfs dfsd fdsf sdf', '2020-07-30 18:48:25', '2020-07-30 18:48:25', 0, 0),
(15, 7, 10, 'Kiepskie', '2020-08-21 13:49:07', '2020-08-21 13:49:07', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rejects_comments`
--

CREATE TABLE `rejects_comments` (
  `id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `reject_id` bigint NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `is_deleted_by` bigint NOT NULL DEFAULT '0',
  `is_edited` smallint NOT NULL DEFAULT '0',
  `is_edited_by` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reports`
--

CREATE TABLE `reports` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `report_type_id` smallint NOT NULL,
  `report_content_type_id` bigint NOT NULL,
  `content_id` bigint NOT NULL,
  `message` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` smallint NOT NULL,
  `report_status` smallint NOT NULL DEFAULT '0',
  `report_level` smallint NOT NULL DEFAULT '1',
  `moderated_by` bigint NOT NULL DEFAULT '0',
  `report_contact_time` int NOT NULL DEFAULT '0',
  `lang` varchar(20) NOT NULL DEFAULT 'pl_PL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `report_type_id`, `report_content_type_id`, `content_id`, `message`, `created`, `updated`, `status`, `report_status`, `report_level`, `moderated_by`, `report_contact_time`, `lang`) VALUES
(15, 51, 2, 2, 56, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"adsa\"}', '2020-07-13 08:13:55', '2020-07-18 19:32:42', 1, 3, 1, 7, 0, 'pl_PL'),
(16, 51, 2, 2, 49, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"oj tam oj tam22\"}', '2020-07-13 09:08:31', '2020-08-26 11:47:04', 1, 0, 1, 0, 1598442424, 'pl_PL'),
(17, 7, 2, 3, 31, '{\"reason_type\":3,\"reason_content\":\"aasgasgsaga afsaf asfasfasfasf\",\"description\":null}', '2020-07-13 19:47:53', '2020-07-13 19:47:53', 0, 0, 1, 0, 0, 'pl_PL'),
(18, 6, 1, 0, 5, '{\"reason_type\":\"11\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-18 17:00:51', '2020-08-26 12:17:42', 1, 3, 1, 7, 0, 'pl_PL'),
(19, 6, 2, 2, 22, '{\"reason_type\":\"2\",\"reason_content\":\"dsad   asdsadsa asdsdad  adadadadsad assddsaadd\",\"description\":\"Co by\\u0142o pierwsze jajko czy kura ?\"}', '2020-07-18 17:41:43', '2020-07-18 17:41:43', 0, 0, 1, 0, 0, 'pl_PL'),
(20, 6, 2, 1, 71, '{\"reason_type\":\"2\",\"reason_content\":\"asdsadas sad dsad adas asdas da\",\"description\":\"24324325vdfd433\"}', '2020-07-18 17:42:06', '2020-07-18 17:42:06', 0, 0, 1, 0, 0, 'pl_PL'),
(21, 51, 2, 1, 75, '{\"reason_type\":\"3\",\"reason_content\":\"asdas sada sdasd asdasd asd asddasda adssada \",\"description\":\"sfsdfasd\"}', '2020-07-18 17:54:43', '2020-09-14 06:43:12', 1, 3, 1, 6, 0, 'pl_PL'),
(22, 1, 1, 0, 51, '{\"reason_type\":\"12\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-18 21:52:42', '2020-07-18 21:52:42', 0, 0, 1, 0, 0, 'pl_PL'),
(23, 6, 1, 0, 51, '{\"reason_type\":\"12\",\"reason_content\":\"\",\"description\":\"\",\"2\":{\"report_content\":\"Ok jdnsajkd asnasjknd sankadsksa askndklasjdkla\"}}', '2020-07-18 21:53:47', '2020-07-22 01:31:31', 0, 0, 2, 0, 0, 'pl_PL'),
(24, 6, 1, 0, 51, '{\"reason_type\":\"14\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-19 11:17:05', '2020-07-19 11:17:05', 0, 0, 1, 0, 0, 'pl_PL'),
(25, 6, 2, 1, 51, '{\"reason_type\":\"2\",\"reason_content\":\"jsadjsa kldasjldja kljasdkljaskld\",\"description\":\"Dual-Y Example\"}', '2020-07-21 23:59:20', '2020-07-21 23:59:20', 0, 0, 1, 0, 0, 'pl_PL'),
(26, 7, 2, 1, 82, '{\"reason_type\":\"2\",\"reason_content\":\"httpkdsndlkjaksdkla\",\"description\":\"SDAD\",\"2\":{\"report_content\":\"Zr\\u00f3bcie co\\u015b bardzo prosze\"}}', '2020-07-22 00:12:07', '2020-07-25 14:08:08', 1, 4, 2, 31, 1595686088, 'pl_PL'),
(27, 7, 1, 0, 45, '{\"reason_type\":\"14\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-22 00:23:23', '2020-07-22 00:23:23', 0, 0, 1, 0, 0, 'pl_PL'),
(28, 7, 1, 0, 45, '{\"reason_type\":\"15\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-22 00:24:56', '2020-07-23 20:53:55', 1, 4, 1, 6, 0, 'pl_PL'),
(29, 6, 1, 0, 45, '{\"reason_type\":\"12\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-22 01:22:38', '2020-07-23 20:43:09', 1, 2, 1, 7, 0, 'pl_PL'),
(30, 31, 1, 0, 45, '{\"reason_type\":\"15\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-22 01:31:06', '2020-07-22 01:31:06', 0, 0, 1, 0, 0, 'pl_PL'),
(31, 31, 2, 2, 22, '{\"reason_type\":\"2\",\"reason_content\":\"dfsdgdsgs dsdsd sddfsdfs\",\"description\":\"Co by\\u0142o pierwsze jajko czy kura ?\"}', '2020-07-22 01:43:40', '2020-07-22 01:43:40', 0, 0, 1, 0, 0, 'pl_PL'),
(32, 31, 2, 1, 51, '{\"reason_type\":\"2\",\"reason_content\":\"asdasd sada sad asda adsd asa\",\"description\":\"Dual-Y Example\"}', '2020-07-22 01:45:35', '2020-07-22 01:45:35', 0, 0, 1, 0, 0, 'pl_PL'),
(33, 31, 2, 3, 31, '{\"reason_type\":2,\"reason_content\":\"sadasd asdasd sadas\",\"description\":null,\"2\":{\"report_content\":\"sadadsasdada sd asdasda ada\"}}', '2020-07-22 01:59:58', '2020-07-30 21:43:50', 0, 0, 2, 0, 0, 'pl_PL'),
(34, 31, 2, 6, 148, '{\"reason_type\":2,\"reason_content\":\"CScsd sadsa ad asd asd asd\",\"description\":null}', '2020-07-22 02:18:18', '2020-08-26 12:18:41', 1, 3, 1, 7, 0, 'pl_PL'),
(35, 31, 2, 4, 145, '{\"reason_type\":2,\"reason_content\":\"mklsaldkas asjndkjasnjkd jasdnjkasnjdkn lknadskjaskjdkljskla\",\"description\":null}', '2020-07-22 02:18:38', '2020-07-22 02:18:38', 0, 0, 1, 0, 0, 'pl_PL'),
(36, 6, 2, 1, 75, '{\"reason_type\":\"2\",\"reason_content\":\"hjbawjdhjsak kladsjkldasjkl kladsnkljsa klasdjlkasjlkdsmalk\",\"description\":\"sfsdfasd\"}', '2020-07-23 19:37:36', '2020-07-23 23:27:11', 1, 4, 1, 7, 1595546831, 'pl_PL'),
(37, 7, 1, 0, 5, '{\"reason_type\":\"14\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-23 21:24:10', '2020-07-23 21:26:42', 1, 4, 1, 6, 0, 'pl_PL'),
(38, 6, 2, 2, 85, '{\"reason_type\":\"2\",\"reason_content\":\"sasad saddasdas asdsa\",\"description\":\"asdasdd das d\"}', '2020-07-25 16:00:45', '2020-07-25 16:00:45', 0, 0, 1, 0, 0, 'pl_PL'),
(39, 6, 2, 2, 41, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"adjsahkj\"}', '2020-07-25 16:09:51', '2020-07-25 16:09:51', 0, 0, 1, 0, 0, 'pl_PL'),
(40, 7, 2, 2, 85, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"asdasdd das d\"}', '2020-07-25 16:16:25', '2020-07-25 16:16:25', 0, 0, 1, 0, 0, 'pl_PL'),
(41, 45, 2, 2, 85, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"asdasdd das d\"}', '2020-07-25 16:18:38', '2020-07-25 16:18:38', 0, 0, 1, 0, 0, 'pl_PL'),
(42, 45, 2, 2, 41, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"adjsahkj\"}', '2020-07-25 16:19:36', '2020-08-09 13:13:48', 1, 3, 1, 7, 0, 'pl_PL'),
(43, 45, 2, 1, 80, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"AJKSHJA kAJSKLJA nlkjdklaj NKLAJDKLj\"}', '2020-07-25 16:21:00', '2020-08-09 13:10:51', 1, 3, 1, 7, 0, 'pl_PL'),
(44, 45, 2, 2, 73, '{\"reason_type\":\"1\",\"reason_content\":\"\",\"description\":\"dfgd\"}', '2020-07-25 16:25:07', '2020-07-25 16:25:07', 0, 0, 1, 0, 0, 'pl_PL'),
(45, 51, 2, 2, 68, '{\"reason_type\":\"1\",\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"zczxczxc sdsdf\"}', '2020-07-25 16:31:47', '2020-07-25 19:21:06', 1, 4, 1, 7, 1595704866, 'pl_PL'),
(46, 7, 1, 0, 6, '{\"reason_type\":\"13\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-29 10:54:50', '2020-07-29 10:54:50', 0, 0, 1, 0, 0, 'pl_PL'),
(47, 7, 2, 1, 82, '{\"reason_type\":\"2\",\"reason_content\":\"asjkhs jakshdjkhaj jkashdjkb jkadshjhajk\",\"description\":\"SDAD\"}', '2020-07-29 10:55:12', '2020-07-29 10:55:12', 0, 0, 1, 0, 0, 'pl_PL'),
(48, 7, 2, 2, 83, '{\"reason_type\":\"2\",\"reason_content\":\"asdas asdasc asacas dasda sda sdasdas da sdasd \",\"description\":\"sdada asda asd asdas da\"}', '2020-07-29 10:55:31', '2020-07-29 10:55:31', 0, 0, 1, 0, 0, 'pl_PL'),
(49, 7, 2, 3, 53, '{\"reason_type\":2,\"reason_content\":\"sadasd sdasdas sdasdsdasdasdasda sdas\",\"description\":null}', '2020-07-29 10:55:53', '2020-07-29 10:55:53', 0, 0, 1, 0, 0, 'pl_PL'),
(50, 7, 2, 6, 170, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":null}', '2020-07-29 10:57:00', '2020-07-29 10:57:00', 0, 0, 1, 0, 0, 'pl_PL'),
(51, 7, 2, 1, 72, '{\"reason_type\":\"1\",\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"asdasd\"}', '2020-07-29 11:09:04', '2020-07-29 11:09:04', 0, 0, 1, 0, 0, 'pl_PL'),
(52, 6, 2, 3, 30, '{\"reason_type\":2,\"reason_content\":\"sadsa acasxs as as\",\"description\":null}', '2020-07-29 11:10:39', '2020-07-29 11:10:39', 0, 0, 1, 0, 0, 'pl_PL'),
(53, 6, 2, 3, 146, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":null}', '2020-07-29 11:11:10', '2020-07-29 11:11:10', 0, 0, 1, 0, 0, 'pl_PL'),
(54, 6, 2, 3, 77, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":null}', '2020-07-29 11:12:29', '2020-07-29 11:12:29', 0, 0, 1, 0, 0, 'pl_PL'),
(55, 6, 2, 3, 71, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":null}', '2020-07-29 11:14:34', '2020-07-29 11:14:34', 0, 0, 1, 0, 0, 'pl_PL'),
(56, 6, 2, 3, 166, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":null}', '2020-07-29 11:14:41', '2020-07-29 11:14:41', 0, 0, 1, 0, 0, 'pl_PL'),
(57, 6, 2, 3, 194, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":null}', '2020-07-29 11:23:33', '2020-07-29 11:23:33', 0, 0, 1, 0, 0, 'pl_PL'),
(58, 6, 2, 3, 172, '{\"reason_type\":3,\"reason_content\":\"hhjjhb jkbjkbk kjnkjjkn kjnjknjk  kjnjk jk jk jknjk njk \",\"description\":\"<p>CVXcvxc xvxcv xv xcvxvcx<\\/p>\\r\\n\"}', '2020-07-29 11:29:11', '2020-07-29 11:29:11', 0, 0, 1, 0, 0, 'pl_PL'),
(59, 7, 2, 4, 180, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":\"Kolejna pr\\u00f3ba :D\"}', '2020-07-29 11:45:31', '2020-07-29 11:45:31', 0, 0, 1, 0, 0, 'pl_PL'),
(60, 51, 2, 4, 145, '{\"reason_type\":3,\"reason_content\":\"dchdjndjk dkjndjknjkd dkldnklnfkd\",\"description\":\"zxcc zxczxczx zxczcz zxcz \"}', '2020-07-29 11:50:25', '2020-07-29 11:50:25', 0, 0, 1, 0, 0, 'pl_PL'),
(61, 7, 2, 6, 148, '{\"reason_type\":2,\"reason_content\":\"hjbjhb hjbhjbhj hjbhjb bhjbhj hj\",\"description\":\"gddrhtrfgfghfhfgh\"}', '2020-07-29 11:52:43', '2020-07-29 11:52:43', 0, 0, 1, 0, 0, 'pl_PL'),
(62, 51, 2, 5, 65, '{\"reason_type\":1,\"reason_content\":\"\",\"description\":\"sdfsd sdf sd ds\"}', '2020-07-29 11:55:37', '2020-07-29 14:26:22', 1, 3, 1, 7, 0, 'pl_PL'),
(63, 51, 2, 3, 30, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"Pierwsze by\\u0142o jajko\"}', '2020-07-29 12:05:17', '2020-08-26 12:08:06', 1, 3, 1, 6, 0, 'pl_PL'),
(64, 51, 2, 5, 183, '{\"reason_type\":2,\"reason_content\":\"ewerverbe r ewrw rrfr  rvwerew ervw\",\"description\":\"afasfas gdsfdsfs\"}', '2020-07-29 12:06:35', '2020-08-26 12:04:48', 1, 3, 1, 6, 0, 'pl_PL'),
(65, 7, 2, 3, 138, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\"}', '2020-07-29 12:08:30', '2020-08-08 12:37:25', 1, 2, 1, 6, 0, 'pl_PL'),
(66, 7, 2, 3, 138, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\"}', '2020-07-29 12:08:32', '2020-08-08 12:35:23', 1, 2, 1, 6, 0, 'pl_PL'),
(67, 7, 2, 3, 138, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"<p>aaa<strong>BBB<\\/strong><\\/p>\\n\"}', '2020-07-29 12:08:33', '2020-08-08 12:28:27', 1, 3, 1, 6, 0, 'pl_PL'),
(68, 7, 2, 3, 59, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i\"}', '2020-07-29 12:09:15', '2020-08-08 12:08:23', 1, 2, 1, 6, 0, 'pl_PL'),
(69, 7, 2, 3, 28, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"test answer\"}', '2020-07-29 12:12:10', '2020-08-08 12:04:19', 1, 2, 1, 6, 1496881385, 'pl_PL'),
(70, 7, 2, 3, 12, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"ddd\"}', '2020-07-29 12:12:42', '2020-08-08 09:50:55', 1, 0, 1, 6, 1596880255, 'pl_PL'),
(71, 7, 2, 3, 58, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"odpowiedz test\"}', '2020-07-29 12:13:24', '2020-08-08 09:44:15', 1, 0, 1, 6, 0, 'pl_PL'),
(72, 7, 2, 5, 117, '{\"reason_type\":1,\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"test2\"}', '2020-07-29 12:14:13', '2020-08-02 08:11:40', 1, 3, 1, 6, 0, 'pl_PL'),
(73, 6, 1, 0, 7, '{\"reason_type\":\"11\",\"reason_content\":\"\",\"description\":\"\",\"2\":{\"report_content\":\"jafnkjfa nasklasfnklsafn lkasnklas klasnklsandn a\"}}', '2020-07-29 13:44:33', '2020-08-08 11:42:15', 0, 0, 2, 0, 0, 'pl_PL'),
(74, 6, 2, 3, 167, '{\"reason_type\":3,\"reason_content\":\"dasdsc sdvdsv  dsvdsvsdv sddsvsdv sdvsdvsd sdvsdvs\",\"description\":\"<p>zxczxc zvzx cxzxvzb zffbzbzvbzv<\\/p>\\r\\n\"}', '2020-07-30 12:46:20', '2020-07-30 12:46:20', 0, 0, 1, 0, 0, 'pl_PL'),
(75, 6, 2, 3, 168, '{\"reason_type\":3,\"reason_content\":\"asdas \",\"description\":\"<p>Czxvzx zvzxvzxvzx vzvzxvxz<\\/p>\\r\\n\"}', '2020-07-30 12:48:14', '2020-07-30 12:48:14', 0, 0, 1, 0, 0, 'pl_PL'),
(76, 6, 1, 0, 7, '{\"reason_type\":\"11\",\"reason_content\":\"\",\"description\":\"\"}', '2020-07-30 21:34:26', '2020-07-30 21:34:26', 0, 0, 1, 0, 0, 'pl_PL'),
(77, 6, 1, 0, 48, '{\"reason_type\":\"14\",\"reason_content\":\"\",\"description\":\"\"}', '2020-08-09 13:54:57', '2020-08-09 13:55:32', 1, 2, 1, 7, 0, 'pl_PL'),
(78, 51, 2, 2, 22, '{\"reason_type\":\"1\",\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"Co by\\u0142o pierwsze jajko czy kura ?\"}', '2020-08-21 11:12:05', '2020-08-26 11:56:17', 1, 0, 1, 0, 1598442977, 'pl_PL'),
(79, 6, 2, 2, 52, '{\"reason_type\":\"1\",\"reason_content\":\"Liter\\u00f3wki i b\\u0142\\u0119dy (potrzeba edycji i korekty)\",\"description\":\"adsa\"}', '2020-08-26 12:03:30', '2020-08-26 12:25:23', 1, 8, 1, 31, 0, 'pl_PL'),
(80, 7, 2, 1, 101, '{\"reason_type\":\"2\",\"reason_content\":\"sgdfsdfsfs\",\"description\":\"asdadsadhjab\"}', '2020-09-04 07:06:26', '2020-09-04 07:06:26', 0, 0, 1, 0, 0, 'en_US');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reports_history`
--

CREATE TABLE `reports_history` (
  `id` bigint NOT NULL,
  `report_id` bigint NOT NULL,
  `moderated_by` bigint NOT NULL,
  `message` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `reports_history`
--

INSERT INTO `reports_history` (`id`, `report_id`, `moderated_by`, `message`, `created`, `updated`) VALUES
(1, 15, 7, '{\"reason_type\":3,\"reason_description\":\"zxZxZx  s asadasd sd asd a asdasdas asd adas\"}', '2020-07-18 19:32:42', '2020-07-18 19:32:42'),
(2, 23, 5, '{\"reason_type\":3,\"reason_description\":\"sakjhdjashj jkashdjkh jkashdjkha klajsdkljaskldj\"}', '2020-07-18 23:31:08', '2020-07-18 23:31:08'),
(3, 23, 6, '{\"reason_type\":5,\"reason_description\":\"Ok jdnsajkd asnasjknd sankadsksa askndklasjdkla\"}', '2020-07-22 01:31:31', '2020-07-22 01:31:31'),
(4, 26, 31, '{\"reason_type\":4,\"reason_description\":\"Zmie\\u0144 bo plagiat\"}', '2020-07-22 00:12:45', '2020-07-22 00:12:45'),
(5, 26, 31, '{\"reason_type\":4,\"reason_description\":\"Zmie\\u0144 bo plagiat i za ma\\u0142o tekstu loool\"}', '2020-07-22 00:12:59', '2020-07-22 00:12:59'),
(6, 26, 31, '{\"reason_type\":4,\"reason_description\":\"Zmie\\u0144 bo plagiat i za ma\\u0142o tekstu loool sdnfjkladsjklf asndaslkdklasdk\"}', '2020-07-22 00:13:13', '2020-07-22 00:13:13'),
(7, 33, 7, '{\"reason_type\":3,\"reason_description\":\"aiosjodsaij ioasdjiojas ioasjdiojasoidj\"}', '2020-07-22 02:25:40', '2020-07-22 02:25:40'),
(8, 26, 6, '{\"reason_type\":3,\"reason_description\":\"ygug hjhgg hjhgug jkhjkhjhjjhj jbjj knklmm;\"}', '2020-07-23 18:24:15', '2020-07-23 18:24:15'),
(9, 29, 7, '{\"reason_type\":2,\"reason_description\":\"Bo tak :P\"}', '2020-07-23 20:43:09', '2020-07-23 20:43:09'),
(10, 28, 6, '{\"reason_type\":4,\"reason_description\":\"Lolik xd\"}', '2020-07-23 20:53:55', '2020-07-23 20:53:55'),
(11, 37, 6, '{\"reason_type\":4,\"reason_description\":\"Ogarnij si\\u0119 :D\"}', '2020-07-23 21:24:35', '2020-07-23 21:24:35'),
(12, 37, 6, '{\"reason_type\":4,\"reason_description\":\"Ogarnij si\\u0119\"}', '2020-07-23 21:26:42', '2020-07-23 21:26:42'),
(13, 36, 7, '{\"reason_type\":4,\"reason_description\":\"Kontaktuje si\\u0119 z Tob\\u0105 bo musisz zmieni\\u0107 swoje post\\u0119powanie\"}', '2020-07-23 23:27:11', '2020-07-23 23:27:11'),
(14, 26, 7, '{\"reason_type\":5,\"reason_description\":\"Zr\\u00f3bcie co\\u015b bardzo prosze\"}', '2020-07-25 14:05:08', '2020-07-25 14:05:08'),
(15, 26, 31, '{\"reason_type\":4,\"reason_description\":\"fgdsgs sgsds sfs dsdf sdf sdfs fsdf\"}', '2020-07-25 14:07:58', '2020-07-25 14:07:58'),
(16, 26, 31, '{\"reason_type\":4,\"reason_description\":\"fgdsgs sgsds sfs dsdf sdf sdfs fsdf dsf dfsdf sdfsdfs sdfsdf sd fs\"}', '2020-07-25 14:08:02', '2020-07-25 14:08:02'),
(17, 26, 31, '{\"reason_type\":4,\"reason_description\":\"fgdsgs sgsds sfs dsdf sdf sdfs fsdf dsf dfsdf sdfsdfs sdfsdf sd fs\"}', '2020-07-25 14:08:08', '2020-07-25 14:08:08'),
(18, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:02', '2020-07-25 19:21:02'),
(19, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:04', '2020-07-25 19:21:04'),
(20, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:04', '2020-07-25 19:21:04'),
(21, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:04', '2020-07-25 19:21:04'),
(22, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:04', '2020-07-25 19:21:04'),
(23, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:05', '2020-07-25 19:21:05'),
(24, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:05', '2020-07-25 19:21:05'),
(25, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:05', '2020-07-25 19:21:05'),
(26, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:05', '2020-07-25 19:21:05'),
(27, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:05', '2020-07-25 19:21:05'),
(28, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:05', '2020-07-25 19:21:05'),
(29, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:06', '2020-07-25 19:21:06'),
(30, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:06', '2020-07-25 19:21:06'),
(31, 45, 7, '{\"reason_type\":4,\"reason_description\":\"acsdfcasd asdas d asd asdas da\"}', '2020-07-25 19:21:06', '2020-07-25 19:21:06'),
(32, 62, 7, '{\"reason_type\":3,\"reason_description\":\"nie poprawne\"}', '2020-07-29 14:26:22', '2020-07-29 14:26:22'),
(33, 73, 7, '{\"reason_type\":3,\"reason_description\":\"skndjks kjsndjksnjkdn\"}', '2020-07-29 14:29:06', '2020-07-29 14:29:06'),
(34, 33, 31, '{\"reason_type\":5,\"reason_description\":\"sadadsasdada sd asdasda ada\"}', '2020-07-30 21:43:50', '2020-07-30 21:43:50'),
(35, 72, 6, '{\"reason_type\":3,\"reason_description\":\"S\\u0142abo\"}', '2020-08-02 08:11:40', '2020-08-02 08:11:40'),
(36, 71, 6, '{\"reason_type\":4,\"reason_description\":\"Dawaj go\"}', '2020-08-08 09:44:15', '2020-08-08 09:44:15'),
(37, 70, 6, '{\"reason_type\":4,\"reason_description\":\"wesefgsv e esf sfs dfsfs fsdf\"}', '2020-08-08 09:50:55', '2020-08-08 09:50:55'),
(38, 69, 6, '{\"reason_type\":4,\"reason_description\":\"kajhjfka askldashdaskjh asdjksandjaskbdnsjkbdjkasdjksnjkas\"}', '2020-08-08 10:09:45', '2020-08-08 10:09:45'),
(39, 73, 6, '{\"reason_type\":5,\"reason_description\":\"jafnkjfa nasklasfnklsafn lkasnklas klasnklsandn a\"}', '2020-08-08 11:42:15', '2020-08-08 11:42:15'),
(40, 69, 6, '{\"reason_type\":2,\"reason_description\":\"Bez sesnsu\"}', '2020-08-08 12:04:19', '2020-08-08 12:04:19'),
(41, 68, 6, '{\"reason_type\":2,\"reason_description\":\"Nie na temat\"}', '2020-08-08 12:08:23', '2020-08-08 12:08:23'),
(42, 67, 6, '{\"reason_type\":3,\"reason_description\":\"Kiepskie zg\\u0142oszenie\"}', '2020-08-08 12:28:27', '2020-08-08 12:28:27'),
(43, 66, 6, '{\"reason_type\":2,\"reason_description\":\"jsdjbjdks ajsdjkand sakndjakd\"}', '2020-08-08 12:35:23', '2020-08-08 12:35:23'),
(44, 65, 6, '{\"reason_type\":2,\"reason_description\":\"scscas ddasdsada dasasdasdasdasda\"}', '2020-08-08 12:37:25', '2020-08-08 12:37:25'),
(45, 43, 7, '{\"reason_type\":3,\"reason_description\":\"Bez powodu\"}', '2020-08-09 13:10:51', '2020-08-09 13:10:51'),
(46, 42, 7, '{\"reason_type\":3,\"reason_description\":\"rththty 6y  y6t y56y 56y65y \"}', '2020-08-09 13:13:48', '2020-08-09 13:13:48'),
(47, 77, 7, '{\"reason_type\":2,\"reason_description\":\"Na 7 dni uwa\\u017caj\"}', '2020-08-09 13:55:32', '2020-08-09 13:55:32'),
(48, 78, 7, '{\"reason_type\":4,\"reason_description\":\"Popraw\"}', '2020-08-21 11:12:26', '2020-08-21 11:12:26'),
(49, 16, 6, '{\"reason_type\":4,\"reason_description\":\"mkfjsdjfn fkdjdsjfklnfdskljflkdsjfkln fksdjfkjsdklfnsd fsdfjsdfjfjksl\"}', '2020-08-26 11:47:04', '2020-08-26 11:47:04'),
(50, 78, 6, '{\"reason_type\":4,\"reason_description\":\"dkdklasjd klsadjklsa klasdkla klasdkla klasdmklasn\"}', '2020-08-26 11:56:17', '2020-08-26 11:56:17'),
(51, 64, 6, '{\"reason_type\":3,\"reason_description\":\"fdsfdsfsdfds\"}', '2020-08-26 12:04:48', '2020-08-26 12:04:48'),
(52, 64, 6, '{\"reason_type\":3,\"reason_description\":\"fdsfdsfsdfds\"}', '2020-08-26 12:07:42', '2020-08-26 12:07:42'),
(53, 63, 6, '{\"reason_type\":3,\"reason_description\":\"Test b\\u0142\\u0119du\"}', '2020-08-26 12:08:06', '2020-08-26 12:08:06'),
(54, 18, 7, '{\"reason_type\":3,\"reason_description\":\"dfdssdfsd sdf sdfsd fsdfsdf s\"}', '2020-08-26 12:17:42', '2020-08-26 12:17:42'),
(55, 34, 7, '{\"reason_type\":9,\"reason_description\":\"sasadsad sda sdasdasd a\"}', '2020-08-26 12:18:41', '2020-08-26 12:18:41'),
(56, 79, 31, '{\"reason_type\":8,\"reason_description\":\"sascsasd sadasd asdas dasd\"}', '2020-08-26 12:25:23', '2020-08-26 12:25:23'),
(57, 21, 6, '{\"reason_type\":3,\"reason_description\":\"csasdasd dasd as\"}', '2020-09-14 06:43:12', '2020-09-14 06:43:12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reports_statuses`
--

CREATE TABLE `reports_statuses` (
  `id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `article_id`, `description`, `created`, `updated`) VALUES
(1, 5, 1, 'test review', '2019-11-11 09:41:12', '2019-11-11 09:41:12'),
(2, 6, 7, 'Testowanie mikrofonu', '2019-11-22 11:26:42', '2019-11-22 11:26:42'),
(3, 6, 12, 'co to za art dupa blada', '2020-01-11 15:29:06', '2020-01-11 15:29:06');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reviews_comments`
--

CREATE TABLE `reviews_comments` (
  `id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `title`, `alias`, `created`, `created_by`, `updated`, `updated_by`) VALUES
(1, 'SuperAdmin', 'superadmin', '2009-04-05 00:10:34', NULL, '2009-04-05 00:10:34', NULL),
(2, 'Registered', 'registered', '2009-04-05 00:10:50', NULL, '2009-04-06 05:20:38', NULL),
(3, 'Public', 'public', '2009-04-05 00:12:38', NULL, '2009-04-07 01:41:45', NULL),
(4, 'Admin', 'admin', '2017-01-18 01:39:00', NULL, '2017-01-18 01:39:00', NULL),
(6, 'Publisher I', 'publisher-i', NULL, NULL, NULL, NULL),
(7, 'Publisher II', 'publisher-ii', NULL, NULL, NULL, NULL),
(8, 'Accept', 'accept', NULL, NULL, NULL, NULL),
(9, 'Editor', 'editor', NULL, NULL, NULL, NULL),
(10, 'Settle I', 'settle-i', NULL, NULL, NULL, NULL),
(11, 'Settle IV', 'settle-iv', NULL, NULL, NULL, NULL),
(13, 'Give permission II', 'give-permission-ii', NULL, NULL, NULL, NULL),
(14, 'Set Banner', 'set-banner', NULL, NULL, NULL, NULL),
(16, 'Newsletter accept', 'newsletter-accept', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles_blocks`
--

CREATE TABLE `roles_blocks` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `roles` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `report_id` bigint NOT NULL,
  `is_unblocked` tinyint NOT NULL DEFAULT '0',
  `blocked_time` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `roles_blocks`
--

INSERT INTO `roles_blocks` (`id`, `user_id`, `roles`, `created`, `updated`, `report_id`, `is_unblocked`, `blocked_time`) VALUES
(8, 70, '[8]', '2020-07-18 14:02:13', '2020-07-18 14:02:13', 25, 0, 1596283333),
(28, 5, '[8]', '2020-07-18 23:26:34', '2020-07-18 23:26:34', 0, 1, 1595719594),
(29, 31, '[8]', '2020-07-22 01:29:47', '2020-07-22 01:29:47', 0, 1, 1595460587),
(30, 31, '[9]', '2020-07-22 01:52:23', '2020-07-22 01:52:23', 0, 0, 1596585143),
(31, 45, '[8,12]', '2020-07-23 18:44:19', '2020-07-23 18:44:19', 0, 1, 1595616259),
(32, 7, '[14]', '2020-07-29 13:25:31', '2020-07-29 13:25:31', 0, 0, 1596633931),
(33, 6, '[8]', '2020-07-30 16:51:40', '2020-07-30 16:51:40', 0, 1, 1596214300),
(34, 48, '[8,7]', '2020-08-09 13:55:32', '2020-08-09 13:55:32', 77, 0, 1597586132);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles_users`
--

CREATE TABLE `roles_users` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `granted_by` int DEFAULT NULL,
  `blocked` int NOT NULL DEFAULT '0',
  `blocked_to` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `roles_users`
--

INSERT INTO `roles_users` (`id`, `user_id`, `role_id`, `granted_by`, `blocked`, `blocked_to`, `created`, `updated`) VALUES
(11, 7, 6, NULL, 0, NULL, NULL, NULL),
(12, 7, 7, NULL, 0, NULL, NULL, NULL),
(14, 9, 8, NULL, 0, NULL, NULL, NULL),
(15, 9, 6, NULL, 0, NULL, NULL, NULL),
(69, 29, 6, NULL, 0, NULL, NULL, NULL),
(71, 7, 10, NULL, 0, NULL, NULL, NULL),
(72, 7, 11, NULL, 0, NULL, NULL, NULL),
(76, 7, 16, NULL, 0, NULL, NULL, NULL),
(80, 31, 6, NULL, 0, NULL, NULL, NULL),
(81, 32, 8, NULL, 0, NULL, NULL, NULL),
(82, 32, 6, NULL, 0, NULL, NULL, NULL),
(83, 33, 8, NULL, 0, NULL, NULL, NULL),
(84, 33, 6, NULL, 0, NULL, NULL, NULL),
(85, 34, 8, NULL, 0, NULL, NULL, NULL),
(86, 34, 6, NULL, 0, NULL, NULL, NULL),
(87, 35, 8, NULL, 0, NULL, NULL, NULL),
(88, 35, 6, NULL, 0, NULL, NULL, NULL),
(89, 36, 8, NULL, 0, NULL, NULL, NULL),
(90, 36, 6, NULL, 0, NULL, NULL, NULL),
(91, 8, 6, NULL, 0, NULL, NULL, NULL),
(92, 8, 7, NULL, 0, NULL, NULL, NULL),
(93, 8, 8, NULL, 0, NULL, NULL, NULL),
(94, 8, 9, NULL, 0, NULL, NULL, NULL),
(95, 8, 10, NULL, 0, NULL, NULL, NULL),
(96, 8, 11, NULL, 0, NULL, NULL, NULL),
(97, 8, 12, NULL, 0, NULL, NULL, NULL),
(98, 8, 13, NULL, 0, NULL, NULL, NULL),
(99, 8, 14, NULL, 0, NULL, NULL, NULL),
(100, 8, 16, NULL, 0, NULL, NULL, NULL),
(101, 37, 8, NULL, 0, NULL, NULL, NULL),
(102, 37, 6, NULL, 0, NULL, NULL, NULL),
(103, 38, 8, NULL, 0, NULL, NULL, NULL),
(104, 38, 6, NULL, 0, NULL, NULL, NULL),
(107, 40, 8, NULL, 0, NULL, NULL, NULL),
(108, 40, 6, NULL, 0, NULL, NULL, NULL),
(109, 41, 8, NULL, 0, NULL, NULL, NULL),
(110, 41, 6, NULL, 0, NULL, NULL, NULL),
(111, 42, 8, NULL, 0, NULL, NULL, NULL),
(112, 42, 6, NULL, 0, NULL, NULL, NULL),
(113, 43, 8, NULL, 0, NULL, NULL, NULL),
(114, 43, 6, NULL, 0, NULL, NULL, NULL),
(119, 45, 6, NULL, 0, NULL, NULL, NULL),
(125, 48, 6, NULL, 0, NULL, NULL, NULL),
(126, 49, 8, NULL, 0, NULL, NULL, NULL),
(127, 49, 6, NULL, 0, NULL, NULL, NULL),
(129, 50, 8, NULL, 0, NULL, NULL, NULL),
(130, 50, 6, NULL, 0, NULL, NULL, NULL),
(143, 51, 1, NULL, 0, NULL, NULL, NULL),
(148, 55, 8, NULL, 0, NULL, NULL, NULL),
(149, 55, 6, NULL, 0, NULL, NULL, NULL),
(150, 56, 8, NULL, 0, NULL, NULL, NULL),
(151, 56, 6, NULL, 0, NULL, NULL, NULL),
(152, 57, 8, NULL, 0, NULL, NULL, NULL),
(153, 57, 6, NULL, 0, NULL, NULL, NULL),
(174, 31, 10, NULL, 0, NULL, NULL, NULL),
(175, 31, 11, NULL, 0, NULL, NULL, NULL),
(176, 31, 12, NULL, 0, NULL, NULL, NULL),
(177, 31, 13, NULL, 0, NULL, NULL, NULL),
(178, 31, 14, NULL, 0, NULL, NULL, NULL),
(231, 29, 8, NULL, 1, '2020-07-31', NULL, NULL),
(275, 6, 12, NULL, 0, NULL, NULL, NULL),
(276, 6, 13, NULL, 0, NULL, NULL, NULL),
(279, 6, 6, NULL, 0, NULL, NULL, NULL),
(280, 6, 7, NULL, 0, NULL, NULL, NULL),
(282, 6, 9, NULL, 0, NULL, NULL, NULL),
(299, 5, 8, NULL, 0, NULL, NULL, NULL),
(304, 31, 7, NULL, 0, NULL, NULL, NULL),
(305, 31, 16, NULL, 0, NULL, NULL, NULL),
(306, 31, 8, NULL, 0, NULL, NULL, NULL),
(307, 31, 9, NULL, 0, NULL, NULL, NULL),
(308, 45, 7, NULL, 0, NULL, NULL, NULL),
(309, 45, 9, NULL, 0, NULL, NULL, NULL),
(311, 45, 13, NULL, 0, NULL, NULL, NULL),
(313, 7, 13, NULL, 0, NULL, NULL, NULL),
(314, 6, 10, NULL, 0, NULL, NULL, NULL),
(315, 6, 11, NULL, 0, NULL, NULL, NULL),
(316, 6, 14, NULL, 0, NULL, NULL, NULL),
(317, 45, 8, NULL, 0, NULL, NULL, NULL),
(318, 45, 12, NULL, 0, NULL, NULL, NULL),
(319, 6, 8, NULL, 0, NULL, NULL, NULL),
(320, 5, 6, NULL, 0, NULL, NULL, NULL),
(321, 7, 8, NULL, 0, NULL, NULL, NULL),
(322, 7, 9, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `input_type` varchar(255) NOT NULL DEFAULT 'text',
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int DEFAULT NULL,
  `params` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `title`, `description`, `input_type`, `editable`, `weight`, `params`, `created`, `created_by`, `updated`, `updated_by`) VALUES
(6, 'Site.title', 'ccfound', '', '', '', 1, 1, '', NULL, NULL, NULL, 1),
(7, 'Site.tagline', 'A CakePHP powered Content Management System.', '', '', 'textarea', 1, 2, '', NULL, NULL, NULL, 1),
(8, 'Site.email', 'jakub26103@gmail.com', '', '', '', 1, 3, '', NULL, NULL, NULL, 1),
(9, 'Site.status', '1', '', '', 'checkbox', 1, 6, '', NULL, NULL, NULL, 1),
(12, 'Meta.robots', 'index, follow', '', '', '', 1, 6, '', NULL, NULL, NULL, NULL),
(13, 'Meta.keywords', 'croogo, Croogo', '', '', 'textarea', 1, 7, '', NULL, NULL, NULL, NULL),
(14, 'Meta.description', 'Croogo - A CakePHP powered Content Management System', '', '', 'textarea', 1, 8, '', NULL, NULL, NULL, NULL),
(15, 'Meta.generator', 'Croogo - Content Management System', '', '', '', 0, 9, '', NULL, NULL, NULL, NULL),
(16, 'Service.akismet_key', 'your-key', '', '', '', 1, 11, '', NULL, NULL, NULL, NULL),
(17, 'Service.recaptcha_public_key', 'your-public-key', '', '', '', 1, 12, '', NULL, NULL, NULL, NULL),
(18, 'Service.recaptcha_private_key', 'your-private-key', '', '', '', 1, 13, '', NULL, NULL, NULL, NULL),
(19, 'Service.akismet_url', 'http://your-blog.com', '', '', '', 1, 10, '', NULL, NULL, NULL, NULL),
(20, 'Site.theme', 'CryptoTheme', '', '', '', 0, 14, '', NULL, NULL, NULL, 1),
(21, 'Site.feed_url', '', '', '', '', 0, 15, '', NULL, NULL, NULL, NULL),
(22, 'Reading.nodes_per_page', '5', '', '', '', 1, 16, '', NULL, NULL, NULL, NULL),
(23, 'Writing.wysiwyg', '1', 'Enable WYSIWYG editor', '', 'checkbox', 1, 17, '', NULL, NULL, NULL, NULL),
(24, 'Comment.level', '1', '', 'levels deep (threaded comments)', '', 1, 18, '', NULL, NULL, NULL, NULL),
(25, 'Comment.feed_limit', '10', '', 'number of comments to show in feed', '', 1, 19, '', NULL, NULL, NULL, NULL),
(26, 'Site.locale', 'en_US', '', '', 'text', 1, 20, '', NULL, NULL, NULL, 1),
(27, 'Reading.date_time_format', 'EEE, MMM dd yyyy HH:mm:ss', '', '', '', 1, 21, '', NULL, NULL, NULL, NULL),
(28, 'Comment.date_time_format', 'MMM dd, yyyy', '', '', '', 1, 22, '', NULL, NULL, NULL, NULL),
(29, 'Site.timezone', 'UTC', '', 'Provide a valid timezone identifier as specified in https://php.net/manual/en/timezones.php', 'select', 1, 4, 'optionClass=Croogo/Settings.Timezones', NULL, NULL, NULL, 1),
(32, 'Hook.bootstraps', 'Croogo/Settings,Croogo/Contacts,Croogo/Nodes,Croogo/Meta,Croogo/Menus,Croogo/Users,Croogo/Blocks,Croogo/Taxonomy,Croogo/FileManager,Croogo/Wysiwyg,Croogo/Dashboards,Croogo/Translate', '', '', '', 0, 23, '', NULL, NULL, NULL, 1),
(33, 'Comment.email_notification', '1', 'Enable email notification', '', 'checkbox', 1, 24, '', NULL, NULL, NULL, NULL),
(34, 'Access Control.multiRole', '1', 'Enable Multiple Roles', '', 'checkbox', 1, 25, '', NULL, NULL, NULL, 1),
(35, 'Access Control.rowLevel', '0', 'Row Level Access Control', '', 'checkbox', 1, 26, '', NULL, NULL, NULL, 1),
(36, 'Access Control.autoLoginDuration', '', '\"Remember Me\" Duration', 'Eg: +1 day, +1 week. Leave empty to disable.', 'text', 1, 27, '', NULL, NULL, NULL, 1),
(37, 'Access Control.models', '', 'Models with Row Level Acl', 'Select models to activate Row Level Access Control on', 'multiple', 1, 26, 'multiple=checkbox\noptions={\"Croogo/Nodes.Nodes\": \"Nodes\", \"Croogo/Blocks.Blocks\": \"Blocks\", \"Croogo/Menus.Menus\": \"Menus\", \"Croogo/Menus.Links\": \"Links\"}', NULL, NULL, NULL, 1),
(38, 'Site.ipWhitelist', '127.0.0.1', 'Whitelisted IP Addresses', 'Separate multiple IP addresses with comma', 'text', 1, 27, '', NULL, NULL, NULL, 1),
(39, 'Site.asset_timestamp', 'force', 'Asset timestamp', 'Appends a timestamp which is last modified time of the particular file at the end of asset files URLs (CSS, JavaScript, Image). Useful to prevent visitors to visit the site with an outdated version of these files in their browser cache.', 'radio', 1, 28, 'options={\"0\": \"Disabled\", \"1\": \"Enabled in debug mode only\", \"force\": \"Always enabled\"}', NULL, NULL, NULL, 1),
(40, 'Site.admin_theme', 'Croogo/Core', 'Administration Theme', '', 'text', 1, 29, '', NULL, NULL, NULL, 1),
(41, 'Site.home_url', '', 'Home Url', 'Default action for home page in link string format.', 'text', 1, 30, '', NULL, NULL, NULL, 1),
(42, 'Croogo.version', '', 'Croogo Version', '', 'text', 0, 31, '', NULL, NULL, NULL, NULL),
(43, 'Croogo.appVersion', '', 'App Version', '', 'text', 0, 31, '', NULL, NULL, NULL, NULL),
(44, 'Theme.bgImagePath', '', 'Background Image', '', 'file', 1, 32, '', NULL, NULL, NULL, NULL),
(45, 'Access Control.splitSession', '0', 'Separate front-end and admin session', '', 'checkbox', 1, 32, '', NULL, NULL, NULL, 1),
(46, 'Croogo.installed', '1', '', '', '', 0, 0, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `social_profiles`
--

CREATE TABLE `social_profiles` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `access_token` blob NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birth_date` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `rodo` tinyint(1) NOT NULL DEFAULT '1',
  `language` varchar(3) NOT NULL DEFAULT 'PL',
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `rodo`, `language`, `created`) VALUES
(2, 'jb.szczubelek@gmail.com', 1, 'PL', '2020-03-19 19:25:03'),
(3, 'dark5tone.idle@gmail.com', 1, 'PL', '2020-05-05 17:47:43'),
(4, 'pmstrategie@gmail.com', 1, 'PL', '2020-05-06 12:23:46'),
(5, 'piotr@ententa.pl', 1, 'PL', '2020-05-06 12:31:11'),
(6, 'lala@ggmail.com', 1, 'PL', '2020-05-18 06:46:16'),
(7, 'test@test.pl', 1, 'PL', '2020-05-24 09:08:04'),
(8, 'test2@test.pl', 1, 'en', '2020-05-24 09:09:45'),
(9, 'asc@ads.pl', 1, 'en', '2020-05-24 09:47:25'),
(10, 'test3@test.pl', 1, 'en', '2020-05-24 09:53:12'),
(11, 'test4@test.pl', 1, 'en', '2020-05-24 09:54:27'),
(12, 'test6@test.pl', 1, 'pl', '2020-05-24 17:47:36'),
(13, 'test7@test.pl', 1, 'pl', '2020-05-24 19:42:42'),
(14, 'skrzych@protonmail.com', 1, 'pl', '2020-05-28 14:16:48'),
(15, 'test55@test.pl', 1, 'pl', '2020-05-31 12:56:08');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `taxonomies`
--

CREATE TABLE `taxonomies` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `term_id` int NOT NULL,
  `vocabulary_id` int NOT NULL,
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `taxonomies`
--

INSERT INTO `taxonomies` (`id`, `parent_id`, `term_id`, `vocabulary_id`, `lft`, `rght`) VALUES
(1, NULL, 1, 1, 1, 2),
(2, NULL, 2, 1, 3, 4),
(3, NULL, 3, 2, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `terms`
--

CREATE TABLE `terms` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `terms`
--

INSERT INTO `terms` (`id`, `title`, `slug`, `description`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Uncategorized', 'uncategorized', '', '2009-07-22 03:38:43', NULL, '2009-07-22 03:34:56', NULL),
(2, 'Announcements', 'announcements', '', '2010-05-16 23:57:06', NULL, '2009-07-22 03:45:37', NULL),
(3, 'mytag', 'mytag', '', '2009-08-26 14:42:43', NULL, '2009-08-26 14:42:43', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `types`
--

CREATE TABLE `types` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text,
  `format_show_author` tinyint(1) NOT NULL DEFAULT '1',
  `format_show_date` tinyint(1) NOT NULL DEFAULT '1',
  `format_use_wysiwyg` tinyint(1) NOT NULL DEFAULT '1',
  `comment_status` int NOT NULL DEFAULT '1',
  `comment_approve` tinyint(1) NOT NULL DEFAULT '1',
  `comment_spam_protection` tinyint(1) NOT NULL DEFAULT '0',
  `comment_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `params` text,
  `plugin` varchar(255) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `types`
--

INSERT INTO `types` (`id`, `title`, `alias`, `description`, `format_show_author`, `format_show_date`, `format_use_wysiwyg`, `comment_status`, `comment_approve`, `comment_spam_protection`, `comment_captcha`, `params`, `plugin`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Page', 'page', 'A page is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a page entry does not allow visitor comments.', 0, 0, 1, 0, 1, 0, 0, 'routes=true', NULL, '2009-09-09 00:23:24', NULL, '2009-09-02 18:06:27', NULL),
(2, 'Blog', 'blog', 'A blog entry is a single post to an online journal, or blog.', 1, 1, 1, 2, 1, 0, 0, 'routes=true', NULL, '2009-09-15 12:15:43', NULL, '2009-09-02 18:20:44', NULL),
(3, 'Attachment', 'attachment', NULL, 1, 1, 1, 1, 1, 0, 0, NULL, 'Croogo/FileManager', '2019-10-26 00:00:00', NULL, '2019-10-26 00:00:00', NULL),
(4, 'Node', 'node', 'Default content type.', 1, 1, 1, 2, 1, 0, 0, 'routes=true', NULL, '2009-10-06 21:53:15', NULL, '2009-09-05 23:51:56', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `types_articles`
--

CREATE TABLE `types_articles` (
  `id` smallint NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `types_articles`
--

INSERT INTO `types_articles` (`id`, `name`) VALUES
(1, 'Article'),
(2, 'Question');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `types_vocabularies`
--

CREATE TABLE `types_vocabularies` (
  `id` int NOT NULL,
  `type_id` int NOT NULL,
  `vocabulary_id` int NOT NULL,
  `weight` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `types_vocabularies`
--

INSERT INTO `types_vocabularies` (`id`, `type_id`, `vocabulary_id`, `weight`) VALUES
(24, 4, 1, NULL),
(25, 4, 2, NULL),
(30, 2, 1, NULL),
(31, 2, 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `role_id` int NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `activation_key` varchar(60) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `bio` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `timezone` varchar(40) NOT NULL DEFAULT 'UTC',
  `created_by` int DEFAULT NULL,
  `attributes` text,
  `is_blocked` tinyint NOT NULL DEFAULT '0',
  `is_blocked_time` int NOT NULL DEFAULT '0',
  `is_blocked_period` int NOT NULL DEFAULT '0',
  `is_blocked_by` int NOT NULL DEFAULT '0',
  `is_blocked_reason` varchar(255) DEFAULT NULL,
  `is_first_login` tinyint NOT NULL DEFAULT '0',
  `ref_link` varchar(255) DEFAULT NULL,
  `ref_link_user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `password`, `name`, `email`, `website`, `activation_key`, `image`, `bio`, `status`, `updated`, `updated_by`, `created`, `timezone`, `created_by`, `attributes`, `is_blocked`, `is_blocked_time`, `is_blocked_period`, `is_blocked_by`, `is_blocked_reason`, `is_first_login`, `ref_link`, `ref_link_user_id`) VALUES
(1, 1, 'admin', '$2y$10$XrY1MX1qjfMp36iM5OrOZeUuC1Ok8hvQStFwIp3Olh58aqUMIYVda', 'admin', '', NULL, 'da0ace2fd5db7fbe74a87ac6f3920884', NULL, NULL, 1, '2019-10-26 16:06:22', NULL, '2019-10-26 16:06:22', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(5, 2, 'jakub@test.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Jakub22', 'jakub@test.com', '', '87e1317dbc264a8d23846af86439d570e30de949', 'PP_rofile_copy.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, '2020-09-04 06:40:32', NULL, '2019-10-29 21:11:11', 'UTC', NULL, '{\"accepts\":{\"inbox\":\"1\",\"mail\":\"0\",\"frequency\":\"0\"},\"rejects\":{\"inbox\":\"0\",\"mail\":\"0\",\"frequency\":\"0\"},\"rejects_comments\":{\"inbox\":\"0\",\"mail\":\"0\",\"frequency\":\"0\"},\"newsletter\":{\"mail\":\"0\",\"frequency\":\"0\"}}', 1, 1593963563, 86400, 7, 'Brak aktywności', 0, '$2y$10$5q8q2CGNOu4roglcSfwKuA7IlX8oChfV8YRPvSqOR3S.e5G6CG6', NULL),
(6, 2, 'piotr@cryptoresearch.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Piotr Testowe', 'piotr@cryptoresearch.com', '', '0d509e35da090f1965e200984d3377d49b68d43b', 'Spojrzenie.jpg', 'Dzień dobry cześć i czołem, \r\npytacie skąd się wziąłem?\r\nŁukasz założył mi konto.', 1, '2020-09-15 00:26:00', NULL, '2019-11-14 22:01:01', 'UTC', NULL, '{\"accepts\":{\"inbox\":\"0\",\"mail\":\"0\",\"frequency\":\"0\"},\"rejects\":{\"inbox\":\"0\",\"mail\":\"0\",\"frequency\":\"0\"},\"rejects_comments\":{\"inbox\":\"0\",\"mail\":\"0\",\"frequency\":\"0\"},\"newsletter\":{\"mail\":\"0\",\"frequency\":\"0\"}}', 0, 0, 0, 0, 'Słabo', 0, NULL, NULL),
(7, 2, 'lukasz@cryptoresearch.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Lukasz', 'lukasz@cryptoresearch.com', '', NULL, '742073b7-2204-47f5-94fa-663c8b5af0a5-logo.png', 'sadfsdsafsad', 1, '2020-10-16 06:50:08', NULL, '2019-11-14 22:08:10', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(9, 2, 'tefohal412@hiwave.org', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'testtest', 'tefohal412@hiwave.org', NULL, '18038c6d661ffbb486575d3e190277e97a4886ba', NULL, NULL, 0, '2020-01-25 17:45:03', NULL, '2020-01-25 17:45:03', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(29, 2, 'nekkefurdi@enayu.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'nowyw', 'nekkefurdi@enayu.com', NULL, '1898da49e3ff5a9d119802a24acec6416f44b0c8', NULL, NULL, 1, '2020-08-26 12:52:56', NULL, '2020-02-03 22:37:18', 'UTC', NULL, NULL, 1, 1598446376, 2592000, 7, 'cczvv v fvdfvfdvdf vdfvdf', 0, NULL, NULL),
(30, 2, 'k.ziemecki@hotmail.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'balticmaniac', 'k.ziemecki@hotmail.com', '', '93316779f332f1fed835c81ffe0c9198deefaa40', 'Zrzut ekranu 2020-02-9 o 15.11.26.png', '', 1, '2020-02-09 14:11:54', NULL, '2020-02-05 11:48:22', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(31, 2, 'kieltyka.karol@gmail.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Karol Kieltyka', 'kieltyka.karol@gmail.com', NULL, '2b461240333b2efba40b06b9774340948a0103c8', NULL, NULL, 1, '2020-08-02 07:41:16', NULL, '2020-02-05 12:16:47', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(32, 2, 'dark5tone.idle@gmail.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Abcd12e', 'dark5tone.idle@gmail.com', NULL, '259be0cb655433f5723fb7665bef0f2f17581499', NULL, NULL, 0, '2020-02-05 12:18:43', NULL, '2020-02-05 12:18:43', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(33, 2, 'm8@em8.pl', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'MLaszczewski', 'm8@em8.pl', NULL, 'e1019293567341510424b5f3843e39a2bd3affb2', NULL, NULL, 1, '2020-02-05 12:35:34', NULL, '2020-02-05 12:32:39', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(34, 2, 'vader84@poczta.fm', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Lukasz Z', 'vader84@poczta.fm', NULL, '8fca802472e525fb63a5a2d94ab456ee39e26d22', 'IMG_1238.jpg', '', 1, '2020-03-07 13:10:47', NULL, '2020-02-05 14:24:50', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(35, 2, 'kamildomin@gmail.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'kamildomin', 'kamildomin@gmail.com', NULL, '3139443167c3d243f692f0a66b0af7aeb08f25df', NULL, NULL, 1, '2020-02-05 14:26:47', NULL, '2020-02-05 14:25:52', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(36, 2, 'poczta@prestigo.net', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'molotov25', 'poczta@prestigo.net', NULL, '3b48eb2fe35c611637b19a9d6db210b50273775f', 'dzik.jpg', 'Testuję portale o kryptowalutach. Czasami tez pracuję ;)', 1, '2020-02-05 18:49:38', NULL, '2020-02-05 15:22:13', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(37, 2, 'damareon.skyden@oolloo.org', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Dddddd7', 'damareon.skyden@oolloo.org', NULL, '0a4f160015b489e7e4b54ed1f6f4f3703eabbaff', NULL, NULL, 1, '2020-02-05 18:55:41', NULL, '2020-02-05 18:54:17', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(38, 2, 'martalange84@gmail.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Marta L', 'martalange84@gmail.com', NULL, '9d17b529fec691eccbfb8195848197fcc51e55e5', NULL, NULL, 1, '2020-02-05 19:03:49', NULL, '2020-02-05 19:03:07', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(39, 2, 'taszaka@tlen.pl', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'taszak', 'taszaka@tlen.pl', '', '1975d858c4dba688c525a38d149cd014241e71ab', NULL, NULL, 1, '2020-02-11 20:39:24', NULL, '2020-02-06 20:36:46', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(40, 2, 'cristen.13@xhanimatedm.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'test10', 'cristen.13@xhanimatedm.com', NULL, 'ca49e7ecc7c8cb74870947895d97572a64953e36', NULL, NULL, 1, '2020-02-06 20:42:44', NULL, '2020-02-06 20:42:11', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(41, 2, 'zcsewgs5@optimaweb.me', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'test100', 'zcsewgs5@optimaweb.me', NULL, '3706a3d71ef3e8298b095f5abf3aa49d981e75e7', NULL, NULL, 1, '2020-02-06 20:52:14', NULL, '2020-02-06 20:51:32', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(42, 2, 'pawel.marczak1989@gmail.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Pawel', 'pawel.marczak1989@gmail.com', NULL, '65e8e45794f8c6d964c878b1d285025d4d3f0254', NULL, NULL, 1, '2020-02-07 08:29:53', NULL, '2020-02-07 08:25:51', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(43, 2, 'oxfav7@optimaweb.me', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'taszakowski', 'oxfav7@optimaweb.me', NULL, '2fd708cb78c4616591b426688ec05552941a1508', 'sf.jpg', 'ath hodler', 1, '2020-02-10 08:41:25', NULL, '2020-02-10 08:32:13', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(45, 2, 'bbsmtmd37k@privacy-mail.top', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'testowy20', 'bbsmtmd37k@privacy-mail.top', NULL, '2ae56bc6f65059b19148ba1adfcfc3bea53b10fc', NULL, NULL, 1, '2020-08-02 07:41:16', NULL, '2020-02-12 20:35:18', 'UTC', NULL, NULL, 1, 1595536989, 86400, 7, 'Bo tak :P', 0, NULL, NULL),
(48, 2, 'jb.szczubelek@gmail.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'JakubOOO', 'jb.szczubelek@gmail.com', NULL, '43ccf068d8ba95b55057e21e0d999fad79b44020', NULL, NULL, 1, '2020-08-09 13:55:32', NULL, '2020-02-15 09:24:43', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(49, 2, 'tifsxh@userpdf.net', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'testttt', 'tifsxh@userpdf.net', NULL, 'fdee35cbc236988efa33e69919c11688b79db8e7', NULL, NULL, 1, '2020-02-15 09:51:35', NULL, '2020-02-15 09:51:18', 'UTC', NULL, NULL, 0, 0, 0, 0, '', 0, NULL, NULL),
(50, 2, 'jkristkw@sharklasers.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'aaaa', 'jkristkw@sharklasers.com', NULL, '36e49331bed6cfbf86f962da228f044d451dfcf6', NULL, NULL, 0, '2020-02-26 19:41:02', NULL, '2020-02-26 19:41:02', 'UTC', NULL, NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL),
(51, 1, 'office@adddesign.org', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'Adrian', 'office@adddesign.org', '', '00e39c0303c8f6f6cd95d57f8b24d826', '', '', 1, '2020-02-05 18:45:03', NULL, '2019-11-14 22:09:34', 'UTC', NULL, NULL, 1, 1580034258, 86400, 7, '', 0, '00e39c0303c8f6f6cd95d57f8b24d826', NULL),
(55, 2, 'gedikiy803@psk3n.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'ddd333', 'gedikiy803@psk3n.com', NULL, '120e89397af9de60bfafd04518d7e36d372b96fa', NULL, NULL, 1, '2020-06-01 07:40:34', NULL, '2020-06-01 07:38:40', 'UTC', NULL, NULL, 0, 0, 0, 0, NULL, 0, '8bd279e82d03c56c57a6cc81a9ddc7ea', 51),
(56, 2, 'asda@mailnd7.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'ooo3ooo', 'asda@mailnd7.com', NULL, '71712b3d6bfa4c1fc1b2244940913b7493ece875', NULL, NULL, 1, '2020-06-01 07:57:20', NULL, '2020-06-01 07:57:05', 'UTC', NULL, NULL, 0, 0, 0, 0, NULL, 0, 'b3c80014ef35f6d28b6f1d784772a8e5', 51),
(57, 2, 'asdfasfas@mailnd7.com', '$2y$10$6FMtbeIqPGdlU6pn7pBO2e3jW6pahbCrHJaSYaQao9wHnKDCuxMuW', 'dada3', 'asdfasfas@mailnd7.com', NULL, '51cc1a3d7698bc523f2fbcc495a024c050f655e5', NULL, NULL, 1, '2020-06-01 15:33:38', NULL, '2020-06-01 15:33:22', 'UTC', NULL, NULL, 0, 0, 0, 0, NULL, 1, '09addf1a0efd00f70a3aa29ebc68d5ef', 51);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_subscriptions`
--

CREATE TABLE `users_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `sub_user_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `users_subscriptions`
--

INSERT INTO `users_subscriptions` (`id`, `user_id`, `sub_user_id`, `created`) VALUES
(25, 51, 5, '2020-06-26 11:41:17'),
(26, 7, 5, '2020-06-26 17:37:06'),
(29, 7, 51, '2020-07-02 20:15:31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vocabularies`
--

CREATE TABLE `vocabularies` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `tags` tinyint(1) NOT NULL DEFAULT '0',
  `plugin` varchar(255) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `vocabularies`
--

INSERT INTO `vocabularies` (`id`, `title`, `alias`, `description`, `required`, `multiple`, `tags`, `plugin`, `weight`, `updated`, `updated_by`, `created`, `created_by`) VALUES
(1, 'Categories', 'categories', '', 0, 1, 0, NULL, 1, '2010-05-17 20:03:11', NULL, '2009-07-22 02:16:21', NULL),
(2, 'Tags', 'tags', '', 0, 1, 0, NULL, 2, '2010-05-17 20:03:11', NULL, '2009-07-22 02:16:34', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `votes`
--

CREATE TABLE `votes` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `article_id` bigint NOT NULL,
  `status` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `article_id`, `status`) VALUES
(1, 5, 1, 1),
(2, 5, 5, 1),
(3, 5, 5, 1),
(4, 5, 5, 1),
(5, 5, 5, 1),
(6, 6, 7, 1),
(7, 6, 7, 1),
(8, 6, 7, 1),
(12, 7, 11, 1),
(13, 7, 11, 0),
(14, 7, 11, 1),
(15, 7, 11, 0),
(16, 7, 11, 1),
(17, 7, 11, 0),
(19, 7, 12, 1),
(20, 6, 12, 0),
(22, 7, 14, 1),
(24, 7, 16, 1),
(35, 7, 10, 1),
(39, 7, 19, 1),
(43, 8, 19, 1),
(45, 29, 21, 1),
(51, 35, 19, 1),
(53, 36, 18, 1),
(54, 36, 23, 1),
(55, 36, 22, 1),
(57, 36, 16, 1),
(58, 5, 10, 1),
(59, 5, 22, 1),
(61, 37, 24, 1),
(65, 6, 22, 1),
(66, 7, 21, 1),
(68, 7, 27, 1),
(69, 38, 24, 1),
(70, 8, 29, 1),
(71, 31, 29, 1),
(72, 31, 30, 1),
(74, 5, 23, 1),
(75, 6, 10, 1),
(76, 8, 25, 1),
(78, 7, 36, 1),
(79, 7, 37, 1),
(81, 51, 49, 1),
(83, 7, 49, 1),
(96, 7, 22, 1),
(97, 7, 32, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `votes_notes`
--

CREATE TABLE `votes_notes` (
  `id` int NOT NULL,
  `note_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `votes_notes`
--

INSERT INTO `votes_notes` (`id`, `note_id`, `user_id`, `status`) VALUES
(4, 12, 5, 1),
(5, 12, 7, 0),
(6, 12, 8, 0),
(7, 11, 8, 1),
(8, 28, 5, 1),
(9, 30, 7, 1),
(10, 31, 29, 1),
(11, 36, 5, 0),
(12, 36, 7, 1),
(13, 30, 6, 1),
(14, 46, 36, 1),
(15, 77, 7, 1),
(16, 31, 7, 1),
(17, 31, 5, 1),
(18, 71, 7, 1),
(19, 70, 7, 0),
(20, 87, 7, 1),
(21, 54, 8, 1),
(22, 31, 8, 0),
(23, 12, 6, 1),
(24, 61, 8, 1),
(25, 31, 51, 1),
(26, 30, 51, 1),
(27, 119, 7, 1),
(28, 46, 7, 1),
(29, 61, 7, 0),
(30, 81, 7, 0),
(31, 146, 7, 1),
(32, 73, 51, 1),
(33, 29, 51, 1),
(34, 183, 51, 1),
(35, 182, 51, 1),
(36, 184, 7, 1),
(37, 185, 51, 1),
(38, 148, 51, 1),
(39, 173, 51, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `accepts`
--
ALTER TABLE `accepts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `accepts_comments`
--
ALTER TABLE `accepts_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `acos`
--
ALTER TABLE `acos`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `aros`
--
ALTER TABLE `aros`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `aros_acos`
--
ALTER TABLE `aros_acos`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `articles_admin_edit_history`
--
ALTER TABLE `articles_admin_edit_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `articles_resolves`
--
ALTER TABLE `articles_resolves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `articles_subscriptions`
--
ALTER TABLE `articles_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `a_dmad_social_auth_phinxlog`
--
ALTER TABLE `a_dmad_social_auth_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `categories_articles`
--
ALTER TABLE `categories_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `categories_subscriptions`
--
ALTER TABLE `categories_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model` (`model`,`foreign_key`);

--
-- Indeksy dla tabeli `comments_subscriptions`
--
ALTER TABLE `comments_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `cron_tab`
--
ALTER TABLE `cron_tab`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `croogo_acl_phinxlog`
--
ALTER TABLE `croogo_acl_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_blocks_phinxlog`
--
ALTER TABLE `croogo_blocks_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_comments_phinxlog`
--
ALTER TABLE `croogo_comments_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_contacts_phinxlog`
--
ALTER TABLE `croogo_contacts_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_dashboards_phinxlog`
--
ALTER TABLE `croogo_dashboards_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_extensions_phinxlog`
--
ALTER TABLE `croogo_extensions_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_file_manager_phinxlog`
--
ALTER TABLE `croogo_file_manager_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_menus_phinxlog`
--
ALTER TABLE `croogo_menus_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_meta_phinxlog`
--
ALTER TABLE `croogo_meta_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_nodes_phinxlog`
--
ALTER TABLE `croogo_nodes_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_settings_phinxlog`
--
ALTER TABLE `croogo_settings_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_taxonomy_phinxlog`
--
ALTER TABLE `croogo_taxonomy_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_translate_phinxlog`
--
ALTER TABLE `croogo_translate_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_users_phinxlog`
--
ALTER TABLE `croogo_users_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `croogo_wysiwyg_phinxlog`
--
ALTER TABLE `croogo_wysiwyg_phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indeksy dla tabeli `dashboards`
--
ALTER TABLE `dashboards`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `holds`
--
ALTER TABLE `holds`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `i18n`
--
ALTER TABLE `i18n`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locale` (`locale`,`model`,`foreign_key`);

--
-- Indeksy dla tabeli `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_languages_locale` (`locale`);

--
-- Indeksy dla tabeli `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`(190));

--
-- Indeksy dla tabeli `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `meta`
--
ALTER TABLE `meta`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `model_taxonomies`
--
ALTER TABLE `model_taxonomies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `model` (`model`,`foreign_key`,`taxonomy_id`);

--
-- Indeksy dla tabeli `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `newsletters_articles`
--
ALTER TABLE `newsletters_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `newsletters_messages`
--
ALTER TABLE `newsletters_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `nodes`
--
ALTER TABLE `nodes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `notes_comments`
--
ALTER TABLE `notes_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `notes_subscriptions`
--
ALTER TABLE `notes_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `notices_emails`
--
ALTER TABLE `notices_emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `notices_statuses`
--
ALTER TABLE `notices_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `notices_subscriptions`
--
ALTER TABLE `notices_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indeksy dla tabeli `rejects`
--
ALTER TABLE `rejects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `rejects_comments`
--
ALTER TABLE `rejects_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `reports_history`
--
ALTER TABLE `reports_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `reports_statuses`
--
ALTER TABLE `reports_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `reviews_comments`
--
ALTER TABLE `reviews_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indeksy dla tabeli `roles_blocks`
--
ALTER TABLE `roles_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indeksy dla tabeli `social_profiles`
--
ALTER TABLE `social_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `taxonomies`
--
ALTER TABLE `taxonomies`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`(190));

--
-- Indeksy dla tabeli `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`(190));

--
-- Indeksy dla tabeli `types_articles`
--
ALTER TABLE `types_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indeksy dla tabeli `types_vocabularies`
--
ALTER TABLE `types_vocabularies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_id` (`type_id`,`vocabulary_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users_subscriptions`
--
ALTER TABLE `users_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `vocabularies`
--
ALTER TABLE `vocabularies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`(190));

--
-- Indeksy dla tabeli `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `votes_notes`
--
ALTER TABLE `votes_notes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `accepts`
--
ALTER TABLE `accepts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT dla tabeli `accepts_comments`
--
ALTER TABLE `accepts_comments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `acos`
--
ALTER TABLE `acos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT dla tabeli `aros`
--
ALTER TABLE `aros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT dla tabeli `aros_acos`
--
ALTER TABLE `aros_acos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT dla tabeli `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT dla tabeli `articles_admin_edit_history`
--
ALTER TABLE `articles_admin_edit_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `articles_resolves`
--
ALTER TABLE `articles_resolves`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `articles_subscriptions`
--
ALTER TABLE `articles_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT dla tabeli `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `categories_articles`
--
ALTER TABLE `categories_articles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT dla tabeli `categories_subscriptions`
--
ALTER TABLE `categories_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `comments_subscriptions`
--
ALTER TABLE `comments_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `cron_tab`
--
ALTER TABLE `cron_tab`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `dashboards`
--
ALTER TABLE `dashboards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `holds`
--
ALTER TABLE `holds`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `i18n`
--
ALTER TABLE `i18n`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=749;

--
-- AUTO_INCREMENT dla tabeli `links`
--
ALTER TABLE `links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `meta`
--
ALTER TABLE `meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `model_taxonomies`
--
ALTER TABLE `model_taxonomies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `newsletters_articles`
--
ALTER TABLE `newsletters_articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `newsletters_messages`
--
ALTER TABLE `newsletters_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `nodes`
--
ALTER TABLE `nodes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT dla tabeli `notes_comments`
--
ALTER TABLE `notes_comments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT dla tabeli `notes_subscriptions`
--
ALTER TABLE `notes_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT dla tabeli `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=445;

--
-- AUTO_INCREMENT dla tabeli `notices_emails`
--
ALTER TABLE `notices_emails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `notices_statuses`
--
ALTER TABLE `notices_statuses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT dla tabeli `notices_subscriptions`
--
ALTER TABLE `notices_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT dla tabeli `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `rejects`
--
ALTER TABLE `rejects`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `rejects_comments`
--
ALTER TABLE `rejects_comments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT dla tabeli `reports_history`
--
ALTER TABLE `reports_history`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT dla tabeli `reports_statuses`
--
ALTER TABLE `reports_statuses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `reviews_comments`
--
ALTER TABLE `reviews_comments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `roles_blocks`
--
ALTER TABLE `roles_blocks`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT dla tabeli `roles_users`
--
ALTER TABLE `roles_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT dla tabeli `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT dla tabeli `social_profiles`
--
ALTER TABLE `social_profiles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `taxonomies`
--
ALTER TABLE `taxonomies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `types`
--
ALTER TABLE `types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `types_articles`
--
ALTER TABLE `types_articles`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `types_vocabularies`
--
ALTER TABLE `types_vocabularies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT dla tabeli `users_subscriptions`
--
ALTER TABLE `users_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT dla tabeli `vocabularies`
--
ALTER TABLE `vocabularies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT dla tabeli `votes_notes`
--
ALTER TABLE `votes_notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
