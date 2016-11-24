-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-11-22 04:51:49
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
('如花', 1001, 100, 100, 100, '国家奖学金'),
('似玉', 1212, 2, 2, 2, '无'),
('小七', 1002, 89, 40, 20, '优秀学生三等奖学金'),
('小天', 1003, 90, 20, 10, '优秀学生二等奖学金'),
('萧萧', 1004, 79, 60, 70, '优秀学生二等奖学金'),
('哈一', 1005, 30, 90, 90, '无'),
('芙予', 1006, 80, 78, 89, '优秀学生一等奖学金'),
('纾予', 1007, 90, 90, 90, '一等奖学金'),
('憨豆', 1008, 70, 99, 40, '优秀学生三等奖学金'),
('叶子', 1009, 90, 50, 60, '优秀学生二等奖学金'),
('苗苗', 1010, 99, 99, 20, '二等奖学金'),
('水蜜桃', 1000, 30, 40, 70, '无');

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
