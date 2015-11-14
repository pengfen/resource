-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 09 月 19 日 09:27
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
-- 表的结构 `resource_logic`
--

CREATE TABLE IF NOT EXISTS `resource_logic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ac` varchar(100) NOT NULL DEFAULT '' COMMENT '控制器-操作方法',
  `content` text COMMENT '逻辑内容',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '逻辑备注',
  `pid` tinyint(1) unsigned DEFAULT '0' COMMENT '项目标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `resource_logic`
--

INSERT INTO `resource_logic` (`id`, `ac`, `content`, `note`, `pid`) VALUES
(6, 'Index-index', '判断用户是否登录\r\n显示对应的模板', '判断session 是否为空', 0),
(7, 'Auth-index', '获取所有权限信息\r\n向模板中分配数据及显示模板', 'getinfo(true) 获取所有权限信息', 0),
(8, 'Auth-add', '从index.html 模板中异步请求(Auth/add)\r\n获取顶级,次顶级权限\r\n向模板中分配数据及显示模板', 'getinfo() 获取顶级,次顶级权限', 0),
(9, 'Auth-insert', '实例化D(''Auth'') -> new \\Admin\\Model\\addAuth($_POST);\r\naddAuth($auth)添加权限方法\r\ninsert 生成一个新记录添加 name pid controller action\r\ngetPath 获取 path\r\nlevel 全路径里边中划线的个数\r\nupdate 更新 path level', 'getPath 获取全路径\r\n父id 等于 0 全路径等于id\r\n父id 不等于 0 全路径为父级全路径与本身id的连接信息', 0),
(10, 'Auth-edit', '根据id 获取要修改的那条记录\r\n获取顶级,次顶级权限\r\n// 向模板中分配数据及显示模板', '', 0),
(11, 'Bas-_empty', '直接显示对应的错误页面', '', 1),
(12, 'Bas-__construct', '调用父控制器中构造方法\r\n拼接当前的请求(控制器-操作方法)\r\n获取当前角色的id\r\n如果id存在 获取当前角色所拥有的所有权限 如果不存在 返回到登录页面\r\n如果当前角色访问的请求在他所拥有的权限中 显示请求页面 否则 提示无权访问', '', 1),
(13, 'Index-index', '判断用户是否登录\r\n显示对应的模板', '判断session 中是否为空', 1),
(14, 'Index-message', '长轮询 while(true){ ...}\r\n查询是否有消息\r\n有消息封装为json数据返回并退出长轮询\r\n睡眠一秒(每一秒轮询一次)', '', 1),
(15, 'Index-breadcrumb', '获取控制器和操作方法\r\n根据控制器和操作方法获取名字\r\n返回名字', '', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
