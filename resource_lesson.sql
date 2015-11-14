-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 09 月 19 日 09:28
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
-- 表的结构 `resource_lesson`
--

CREATE TABLE IF NOT EXISTS `resource_lesson` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL COMMENT '所属分类',
  `name` varchar(255) NOT NULL COMMENT '课程名',
  `target` varchar(255) NOT NULL COMMENT '课程目标',
  `content` text COMMENT '课程内容',
  `program` text COMMENT '程序内容',
  `homework` varchar(255) DEFAULT NULL COMMENT '课后作业',
  `answer` text COMMENT '作业答案',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `resource_lesson`
--

INSERT INTO `resource_lesson` (`id`, `pid`, `name`, `target`, `content`, `program`, `homework`, `answer`) VALUES
(2, 4, 'php 介绍', '知道PHP 是做网页的 并学会第一个welcome to here 程序', 'PHP 是什么 能干什么 第一个程序', '&lt;?php\r\necho ''welcome to here'';', '如何安装PHP 开发环境', ''),
(3, 4, 'PHP 开发环境', '安装wamp', '需要PHP 运行环境 用集成环境 wamp (如果安装不成功 可能需要安装vc 库)', '', '了解 apache php mysql 的关系', ''),
(4, 4, '编程', '知道编程就是说话 消除恐惧感', '做面条就是编程 烧水 下面 加盐 熄火', '$gender = ''''; // 定义变量\r\nif ($gender == ''男'') {\r\n    echo ''哥们'';\r\n} else {\r\n    echo ''姐们'';\r\n}', '搜索程序的三种控制结构', ''),
(5, 4, '变量', '知道变量的概念', '变量的定义 变量的命名规范', '$age = 28;\r\n$age = $age + 1;\r\necho $age;', '完成用自己的话描述对变量的理解', ''),
(6, 4, '运算符', '联系起小学时的加减乘除运算', '+ - * /\r\n&gt; &gt;= &lt; &lt;= != ==\r\n比较运算符的结果赋给变量 并提问这个变量有多少种结果\r\n计算机里没有差不多 只有真假\r\n有一类变量 只有二个值 就是真假 布尔型', '', '还有哪些运算符', ''),
(7, 4, '控制结构', '学会使用三种控制结构', '顺序 从上向下执行\r\n分支\r\n循环', '', '自行搜索 还有哪能些控制结构', ''),
(8, 4, '编程', '知道自己已经入门 提高信心', '打印1-100\r\n打印1-100 内的偶数', '$i = 1;\r\nwhile($i &lt;= 100) {\r\n    echo $i.''&lt;br/&gt;'';\r\n    $i++;\r\n}\r\n\r\nfor($i = 0; $i &lt;= 100; $i++) {\r\n    if ($i % 2 == 0) \r\n    echo $i;\r\n}', '写一个程序打印1 到 100 但是遇到数字为3的倍数的时候 打印 Fizz 替代数字 5的倍数用 Buzz 代替', ''),
(9, 7, 'php 原生添加sql 语句', '', NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
