-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 09 月 04 日 01:36
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `resource`
--
CREATE DATABASE IF NOT EXISTS `resource` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `resource`;

-- --------------------------------------------------------

--
-- 表的结构 `resource_assoc`
--

CREATE TABLE IF NOT EXISTS `resource_assoc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '表名',
  `struct` text COMMENT '表结构',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `pid` tinyint(1) unsigned DEFAULT '0' COMMENT '项目标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `resource_assoc`
--

INSERT INTO `resource_assoc` (`id`, `name`, `struct`, `note`, `pid`) VALUES
(2, '权限表', 'CREATE TABLE `resource_auth` (\r\n`id`  smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT ,\r\n`name`  varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '''' COMMENT ''权限名'' ,\r\n`pid`  smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT ''父id'' ,\r\n`controller`  varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '''' COMMENT ''控制器'' ,\r\n`action`  varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '''' COMMENT ''操作方法'' ,\r\n`path`  varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '''' COMMENT ''全路径'' ,\r\n`level`  tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT ''权限级别'' ,\r\nPRIMARY KEY (`id`)\r\n)\r\nENGINE=InnoDB\r\nDEFAULT CHARACTER SET=utf8\r\n;', 'level \r\n为0 顶级权限(权限管理 ...) \r\n为1 次顶级权限(权限列表 ... ) \r\n为2 次次顶级权限(增删改等)', 0),
(3, '目录关联表', '-- 目录关联表\r\ncreate table resource_assoc(\r\n	id int unsigned not null primary key auto_increment,\r\n	name varchar(30) not null default '''' comment ''表名'',\r\n	struct text comment ''表结构'',\r\n	note varchar(255) not null default '''' comment ''备注''\r\n)engine=innodb default charset=utf8;', '目录表resource_dir 中的aid 字段关联此表中的id', 0),
(5, '逻辑表', 'create table resource_logic(\r\n	id int unsigned not null primary key auto_increment,\r\n	ac varchar(100) not null default '''' comment ''控制器-操作方法'',\r\n	content text comment ''逻辑内容'',\r\n	note varchar(255) not null default '''' comment ''逻辑备注''\r\n)engine=innodb default charset=utf8;', '存储方法中的逻辑分析', 0),
(6, '', '', '', 0),
(7, '逻辑表', 'ddd\r\ndd', 'dd', 0),
(8, '', '', '', 0),
(9, '', '', '', 0),
(10, '', '', '', 0),
(11, '', '', '', 0),
(12, '权限表', 'create table blog_auth(\r\n	id smallint(6) unsigned not null primary key auto_increment,\r\n	name varchar(20) not null default '''' comment ''权限名'',\r\n	pid smallint(6) not null default 0 comment ''父id'',\r\n	controller varchar(32) not null default '''' comment ''控制器'',\r\n	action varchar(32) not null default '''' comment ''操作方法'',\r\n	path varchar(32) not null default '''' comment ''全路径'',\r\n	level tinyint(4) not null default 0 comment ''权限级别''\r\n)engine=innodb default charset=utf8;', 'level 0 顶级权限 1 次顶级权限 2 次次顶级权限', 1);

-- --------------------------------------------------------

--
-- 表的结构 `resource_auth`
--

CREATE TABLE IF NOT EXISTS `resource_auth` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限名',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `controller` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(32) NOT NULL DEFAULT '' COMMENT '操作方法',
  `path` varchar(32) NOT NULL DEFAULT '' COMMENT '全路径',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '权限级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `resource_auth`
--

INSERT INTO `resource_auth` (`id`, `name`, `pid`, `controller`, `action`, `path`, `level`) VALUES
(1, '权限管理', 0, '', '', '1', 0),
(2, '权限列表', 1, 'Auth', 'index', '1-2', 1),
(3, '管理员列表', 1, 'Manager', 'index', '1-3', 1),
(4, '会员管理', 0, '', '', '4', 0),
(5, '会员列表', 4, 'User', 'index', '4-5', 1),
(6, '目录管理', 0, '', '', '5', 0),
(7, '后台目录列表', 6, 'Dir', 'index', '5-7', 1),
(10, '目录关联列表', 6, 'Assoc', 'index', '5-10', 1),
(11, '方法逻辑列表', 6, 'Logic', 'index', '5-11', 1),
(12, '项目记录列表', 6, 'Project', 'index', '5-12', 1),
(13, '角色列表', 1, 'Role', 'index', '1-13', 1);

-- --------------------------------------------------------

--
-- 表的结构 `resource_dir`
--

CREATE TABLE IF NOT EXISTS `resource_dir` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联表id',
  `controller` varchar(50) NOT NULL DEFAULT '' COMMENT '控制器',
  `method` text COMMENT '控制器中方法',
  `model` varchar(50) DEFAULT NULL COMMENT '模型名',
  `metmod` text COMMENT '模型中方法',
  `template` text COMMENT '模板',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '结构图',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '前后台标志',
  `des` text COMMENT '描述',
  `pid` tinyint(1) unsigned DEFAULT '0' COMMENT '项目编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `resource_dir`
--

INSERT INTO `resource_dir` (`id`, `name`, `aid`, `controller`, `method`, `model`, `metmod`, `template`, `image`, `flag`, `des`, `pid`) VALUES
(1, '后台首页', 0, 'IndexController', 'index 首页(判断用户是否登录)', '', '', 'index.html 首页(所有列表的父模板), menu.html 导航菜单(Nav/menu 调用此模板)', '', 0, '左边导航使用{:W(''Nav/menu'')}', 0),
(2, '导航组件', 0, 'NavWidget', 'menu 导航菜单(加载顶级 次顶级权限)', '', NULL, 'menu.html 导航菜单', '', 0, '', 0),
(3, '权限控制', 2, 'AuthController', 'index 权限列表(所有权限)\r\n, add 添加界面(项级 次顶级权限)\r\n, insert 添加数据(调用模型中addAuth方法)\r\n, edit 修改界面(顶级 次顶级权限)\r\n, update 修改数据(调用模型中updAuth方法)\r\n, delete 删除权限\r\n, getInfo 获取权限信息', 'AuthModel', 'index.html 权限列表\r\n, add.html 添加界面(父模板)\r\n, edit.html 修改界面(继承add.html模板)', 'index.html 权限列表\r\n, add.html 添加界面(父模板)\r\n, edit.html 修改界面(继承add.html模板)', '', 0, '', 0),
(4, '角色', 0, 'RoleController', 'index 角色列表', '', NULL, '', '', 0, '', 0),
(6, '', 0, '', NULL, NULL, NULL, NULL, '', 0, '', 0),
(7, '拦截权限(基类)', 0, 'BaseController', '__construct 构造方法(拦截权限), _empty() 非空操作方法处理', '', '', '', '', 0, '', 1),
(8, '后台首页', 0, 'IndexController', 'index 后台首页, message 消息推送, breadcrumb 面包路径', '', '', 'index.html 首页模板, message.html 消息模板, menu.html 导航模板', '', 0, '', 1);

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

-- --------------------------------------------------------

--
-- 表的结构 `resource_manager`
--

CREATE TABLE IF NOT EXISTS `resource_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理名称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '管理密码',
  `regtime` int(10) unsigned DEFAULT NULL COMMENT '注册时间',
  `logtime` int(10) unsigned DEFAULT NULL COMMENT '登录时间',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `rid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `resource_manager`
--

INSERT INTO `resource_manager` (`id`, `username`, `password`, `regtime`, `logtime`, `email`, `rid`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1439805718, 1439805718, 'caopeng8787@163.com', 0),
(3, 'apeng', 'e10adc3949ba59abbe56e057f20f883e', 1439817214, 1439817214, 'apeng@qq.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `resource_project`
--

CREATE TABLE IF NOT EXISTS `resource_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名',
  `des` varchar(255) NOT NULL DEFAULT '' COMMENT '项目描述',
  `starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `techn` text COMMENT '技术描述',
  `summary` text COMMENT '项目心得',
  `env` varchar(255) NOT NULL DEFAULT '' COMMENT '开发环境介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `resource_project`
--

INSERT INTO `resource_project` (`id`, `name`, `des`, `starttime`, `endtime`, `techn`, `summary`, `env`) VALUES
(1, '畅享世界', '本系统为博客型交友系统,前台有动态、个人中心、说说、日志、相册、留言板、资料库、好友等。后台有权限管理、会员管理、资源管理、公告管理。', 0, 0, '使用SVN 控制版本\r\n使用ThinkPHP 框架搭建\r\n前后台页面使用Bootstrap 框架\r\n通过后台添加及修改等使用Ajax 异步请求更深刻的体会Ajax 在后台的运用。\r\n通过在主模板封装JS 函数及搜索分页控制器等，更深刻的体会代码的重用性。\r\n通过使用反向Ajax 更好的熟练使用消息推送(Ajax 长轮询)。\r\n后台使用基于角色的访问权限管理（RBAC Role-Based Access Control）。\r\nOOP思想、MVC 模式等', 'ThinkPHP  作为框架，项目过程更理解OOP 思想，深刻体会MVC 模式的便捷性(代码的重用等)。对\r\nJavaScript、Ajax、jQuery 的运用更加熟练。\r\n', 'windows 系统 sublime 编辑器'),
(2, '测试二', 'hjkl', 0, 0, 'yk\r\nhk\r\nj', 'dd\r\njkl', 'windows');

-- --------------------------------------------------------

--
-- 表的结构 `resource_role`
--

CREATE TABLE IF NOT EXISTS `resource_role` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名',
  `aids` varchar(128) NOT NULL DEFAULT '' COMMENT '权限ids',
  `aac` text COMMENT '控制器-操作方法',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `resource_role`
--

INSERT INTO `resource_role` (`id`, `name`, `aids`, `aac`) VALUES
(1, '董事长', '', NULL),
(2, '经理', '', NULL),
(3, '主管', '', NULL),
(4, '会员专员', '', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
