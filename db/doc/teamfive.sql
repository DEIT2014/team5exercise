-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-12-29 09:39:42
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `teamfive`
--

-- --------------------------------------------------------

--
-- 表的结构 `stugrade`
--

CREATE TABLE IF NOT EXISTS `stugrade` (
  `stuname` varchar(5) DEFAULT NULL,
  `stuid` int(15) DEFAULT NULL,
  `xkcj` float DEFAULT NULL,
  `xsky` float DEFAULT NULL,
  `shhd` float DEFAULT NULL,
  `jxj` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `stugrade`
--

INSERT INTO `stugrade` (`stuname`, `stuid`, `xkcj`, `xsky`, `shhd`, `jxj`) VALUES
('haha', 1001, 80, 80, 80, 'first'),
('woo', 1002, 60, 100, 90, 'second'),
('zhang', 1032, 60, 60, 60, 'second');

-- --------------------------------------------------------

--
-- 表的结构 `teausers`
--

CREATE TABLE IF NOT EXISTS `teausers` (
  `yhm` int(15) DEFAULT NULL,
  `mm` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teausers`
--

INSERT INTO `teausers` (`yhm`, `mm`) VALUES
(5000, 5000),
(5001, 5001),
(5002, 5002),
(5003, 5003),
(5004, 5004),
(5005, 5005),
(5006, 5006),
(5007, 5007),
(5008, 5008),
(5009, 5009),
(5010, 5010);

-- --------------------------------------------------------

--
-- 表的结构 `tea_infor`
--

CREATE TABLE IF NOT EXISTS `tea_infor` (
  `teaname` varchar(11) NOT NULL,
  `teaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tea_infor`
--

INSERT INTO `tea_infor` (`teaname`, `teaid`) VALUES
('teawang', 101403401),
('teazhan', 101403402),
('teatu', 101403403);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `yhm` int(15) DEFAULT NULL,
  `mm` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`yhm`, `mm`) VALUES
(1212, 1111),
(1000, 1000),
(1000, 1000),
(1001, 1001),
(1002, 1002),
(1003, 1003),
(1004, 1004),
(1005, 1005),
(1006, 1006),
(1007, 1007),
(1008, 1008),
(1009, 1009),
(1010, 1010);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
