-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-01-05 04:38:29
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
  `stuname` varchar(20) DEFAULT NULL,
  `stuid` int(20) DEFAULT NULL,
  `xkcj` float DEFAULT NULL,
  `xsky` float DEFAULT NULL,
  `shhd` float DEFAULT NULL,
  `jxj` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `stugrade`
--

INSERT INTO `stugrade` (`stuname`, `stuid`, `xkcj`, `xsky`, `shhd`, `jxj`) VALUES
('hua', 1001, 100, 100, 100, 'first'),
('yu', 1002, 80, 90, 80, 'second'),
('qing', 1003, 30, 40, 50, 'no'),
('li', 1004, 70, 66, 90, 'third');

-- --------------------------------------------------------

--
-- 表的结构 `stulogin`
--

CREATE TABLE IF NOT EXISTS `stulogin` (
  `stuid` int(20) DEFAULT NULL,
  `stupassword` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `stulogin`
--

INSERT INTO `stulogin` (`stuid`, `stupassword`) VALUES
(1001, 1001),
(1002, 1002),
(1003, 1003),
(1004, 1004);

-- --------------------------------------------------------

--
-- 表的结构 `teainfo`
--

CREATE TABLE IF NOT EXISTS `teainfo` (
  `teaname` varchar(20) DEFAULT NULL,
  `teaid` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teainfo`
--

INSERT INTO `teainfo` (`teaname`, `teaid`) VALUES
('hu', 2001),
('qun', 2002),
('wei', 2003),
('lu', 2004);

-- --------------------------------------------------------

--
-- 表的结构 `tealogin`
--

CREATE TABLE IF NOT EXISTS `tealogin` (
  `teaid` int(20) DEFAULT NULL,
  `teapassword` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tealogin`
--

INSERT INTO `tealogin` (`teaid`, `teapassword`) VALUES
(2001, 2001),
(2002, 2002),
(2003, 2003),
(2004, 2004);

-- --------------------------------------------------------

--
-- 表的结构 `xkcj_show`
--

CREATE TABLE IF NOT EXISTS `xkcj_show` (
  `stuname` varchar(20) DEFAULT NULL,
  `stuid` int(20) DEFAULT NULL,
  `math` float DEFAULT NULL,
  `deit` float DEFAULT NULL,
  `phy` float DEFAULT NULL,
  `english` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xkcj_show`
--

INSERT INTO `xkcj_show` (`stuname`, `stuid`, `math`, `deit`, `phy`, `english`) VALUES
('hua', 1001, 90, 90, 100, 100),
('yu', 1002, 80, 76, 83, 77),
('qing', 1003, 29, 40, 33, 27),
('li', 1004, 78, 82, 79, 83);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
