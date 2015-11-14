-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 09 月 19 日 04:45
-- 服务器版本: 5.6.24
-- PHP 版本: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `resource`
--

-- --------------------------------------------------------

--
-- 表的结构 `resource_categorys`
--

CREATE TABLE IF NOT EXISTS `resource_categorys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(100) NOT NULL COMMENT '分类名',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `path` varchar(255) NOT NULL DEFAULT '0,' COMMENT '全路径',
  `image` varchar(255) NOT NULL COMMENT '分类总结图',
  `addtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `resource_categorys`
--

INSERT INTO `resource_categorys` (`id`, `catename`, `pid`, `path`, `image`, `addtime`) VALUES
(3, '课程', 0, '0,', '', 1441373844),
(4, 'php 基础', 3, '0,3,', '', 1441373866),
(6, '功能', 0, '0,', '', 1442018028),
(7, 'sql 添加', 6, '0,6,', '', 1442020867),
(8, '模块', 0, '0,', '', 1442102930),
(9, '留言板模块', 8, '0,8,', '', 1442102959),
(10, 'php 实例', 3, '0,3,', '', 1442108804),
(11, '子符串实例', 10, '0,3,10,', '', 1442108839);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
