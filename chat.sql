-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- ホスト: mysql207.phy.lolipop.lan
-- 生成日時: 2022 年 11 月 22 日 10:02
-- サーバのバージョン: 5.7.36-log
-- PHP のバージョン: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `LAA1291148-kadai`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `board`
--

CREATE TABLE IF NOT EXISTS `board` (
  `board_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `task_id` int(5) NOT NULL,
  `post_date` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`board_id`),
  KEY `board_ibfk_1` (`user_id`),
  KEY `board_ibfk_2` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `room_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  KEY `member_ibfk_1` (`room_id`),
  KEY `member_ibfk_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `msgs`
--

CREATE TABLE IF NOT EXISTS `msgs` (
  `msg_id` int(50) NOT NULL AUTO_INCREMENT,
  `room_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `file_url` varchar(1000) NOT NULL,
  `send_time` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `msgs_ibfk_1` (`room_id`),
  KEY `msgs_ibfk_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(5) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- テーブルの構造 `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `partner_user_id` int(5) DEFAULT NULL,
  `language` varchar(10) NOT NULL,
  `ask_task` varchar(50) NOT NULL,
  `give_task` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `deadline` varchar(10) NOT NULL,
  `progress` int(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `task_ibfk_1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=15 ;

--
-- テーブルのデータのダンプ `task`
--

INSERT INTO `task` (`task_id`, `user_id`, `partner_user_id`, `language`, `ask_task`, `give_task`, `comment`, `deadline`, `progress`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, NULL, 'Spring', '課題1', '課題2', '*****', '11月1日', 0, '2022-10-31 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 5, NULL, 'PHP', '課題8', '課題7', '', '11月10日', 0, '2022-11-04 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 6, NULL, 'PHP', '課題5', '課題7', 'ください', '', 0, '2022-11-09 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 6, NULL, 'Spring', '課題1', '課題9', '寄越せ', '', 0, '2022-11-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 4, NULL, 'Spring', '課題3', '課題2', 'ちょうだい', '', 0, '2022-11-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `grade` int(1) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `good` int(5) NOT NULL,
  `bad` int(5) NOT NULL,
  `point` int(5) NOT NULL,
  `report` int(3) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=23 ;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `grade`, `mail`, `pass`, `good`, `bad`, `point`, `report`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'AAAA', 1, 'a@aaaa', 'aaaaaa', 0, 0, 500, 0, '2022-11-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'BBBB', 3, 'b@b', 'bbbbbb', 0, 0, 600, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'DDDD', 3, 'd@d', 'dddddd', 0, 0, 700, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'pppp', 1, 'p@p', 'pppppp', 0, 0, 500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'zzzz', 1, 'z@z', 'zzzzzz', 0, 0, 500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `board`
--
ALTER TABLE `board`
  ADD CONSTRAINT `board_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `board_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`);

--
-- テーブルの制約 `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- テーブルの制約 `msgs`
--
ALTER TABLE `msgs`
  ADD CONSTRAINT `msgs_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `msgs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- テーブルの制約 `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
