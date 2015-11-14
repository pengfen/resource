-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 11 月 14 日 09:35
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
CREATE DATABASE IF NOT EXISTS `resource` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
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
(2, '留言信息表', 'create table if not EXISTS info(\r\n  id int not null auto_increment primary key,\r\n  name varchar(16) not null comment ''访客名字'',\r\n  content text not null comment ''发布内容'',\r\n  content_time varchar(14) not null comment ''发布时间''\r\n)engine=MyISAM default charset=utf8;', '所属留言模块', 0),
(3, '留言回复表', 'create table if not EXISTS reply(\r\n  id int not null primary key auto_increment,\r\n  info_id varchar(11) not null comment ''留言id'',\r\n  reply text not null comment ''回复内容'',\r\n  reply_time varchar(14) not null comment ''回复时间''\r\n)engine=MyISAM default charset=utf8;', '所属留言模块', 0),
(5, '逻辑表', 'create table resource_logic(\r\n	id int unsigned not null primary key auto_increment,\r\n	ac varchar(100) not null default '''' comment ''控制器-操作方法'',\r\n	content text comment ''逻辑内容'',\r\n	note varchar(255) not null default '''' comment ''逻辑备注''\r\n)engine=innodb default charset=utf8;', '存储方法中的逻辑分析', 0),
(6, '', '', '', 0),
(7, '逻辑表', 'ddd\r\ndd', 'dd', 1),
(8, '', '', '', 0),
(9, '', '', '', 0),
(10, '', '', '', 0),
(11, '', '', '', 0),
(12, '权限表', 'create table blog_auth(\r\n	id smallint(6) unsigned not null primary key auto_increment,\r\n	name varchar(20) not null default '''' comment ''权限名'',\r\n	pid smallint(6) not null default 0 comment ''父id'',\r\n	controller varchar(32) not null default '''' comment ''控制器'',\r\n	action varchar(32) not null default '''' comment ''操作方法'',\r\n	path varchar(32) not null default '''' comment ''全路径'',\r\n	level tinyint(4) not null default 0 comment ''权限级别''\r\n)engine=innodb default charset=utf8;', 'level 0 顶级权限 1 次顶级权限 2 次次顶级权限', 1);

-- --------------------------------------------------------

--
-- 表的结构 `resource_assoc_page`
--

CREATE TABLE IF NOT EXISTS `resource_assoc_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '页面名',
  `des` text COMMENT '功能描述',
  `techn` text COMMENT '涉及技术',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '所属分类',
  `assoc` varchar(255) DEFAULT NULL COMMENT '涉及表ids',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `resource_assoc_page`
--

INSERT INTO `resource_assoc_page` (`id`, `name`, `des`, `techn`, `pid`, `assoc`) VALUES
(1, '留言浏览页 (index.php)', '按照留言先后顺序 分页显示留言信息', 'PHP', 9, '2'),
(2, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `resource_auth`
--

CREATE TABLE IF NOT EXISTS `resource_auth` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限名',
  `pid` smallint(6) NOT NULL DEFAULT '0' COMMENT '父id',
  `controller` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(32) NOT NULL DEFAULT '' COMMENT '操作方法',
  `path` varchar(32) NOT NULL DEFAULT '' COMMENT '全路径',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权限级别',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '权限关联图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `resource_auth`
--

INSERT INTO `resource_auth` (`id`, `name`, `pid`, `controller`, `action`, `path`, `level`, `image`) VALUES
(1, '权限管理', 0, '', '', '1', 0, 'Uploads/2015-09-20/55fea199dc54b.png'),
(2, '权限列表', 1, 'Auth', 'index', '1-2', 1, 'Uploads/2015-09-20/55fe7e2c1485f.png'),
(3, '管理员列表', 1, 'Manager', 'index', '1-3', 1, 'Uploads/2015-09-12/55f3e4df5f257.png'),
(4, '会员管理', 0, '', '', '4', 0, 'Uploads/2015-10-13/561cfe2187ff2.png'),
(5, '会员列表', 4, 'User', 'index', '4-5', 1, ''),
(6, '目录管理', 0, '', '', '5', 0, 'Uploads/2015-09-12/55f4245783d4e.png'),
(7, '后台目录列表', 6, 'Dir', 'index', '5-7', 1, 'Uploads/2015-09-12/55f424dd34473.png'),
(10, '目录关联列表', 6, 'Assoc', 'index', '5-10', 1, 'Uploads/2015-09-12/55f4249b4acf4.png'),
(11, '方法逻辑列表', 6, 'Logic', 'index', '5-11', 1, 'Uploads/2015-09-12/55f424afb57dc.png'),
(12, '项目记录列表', 6, 'Project', 'index', '5-12', 1, 'Uploads/2015-09-12/55f424ca1470d.png'),
(13, '角色列表', 1, 'Role', 'index', '1-13', 1, 'Uploads/2015-09-12/55f3e4995016d.png'),
(14, '资料管理', 0, '', '', '14', 0, 'Uploads/2015-09-13/55f51aa09ab1b.png'),
(15, '技术分类', 24, 'Categorys', 'index', '24-15', 1, 'Uploads/2015-09-13/55f51abddbcec.png'),
(16, '课程列表', 34, 'Lesson', 'index', '34-16', 1, 'Uploads/2015-09-13/55f51ad91d546.png'),
(17, '功能列表', 14, 'Function', 'index', '14-17', 1, 'Uploads/2015-09-13/55f51aefefda6.png'),
(18, '关联页', 14, 'AssocPage', 'index', '14-18', 1, 'Uploads/2015-09-13/55f4bd42aef12.png'),
(19, '模块列表', 14, 'Module', 'index', '14-19', 1, 'Uploads/2015-09-13/55f51b0dddb17.png'),
(20, '实例列表', 14, 'Instance', 'index', '14-20', 1, 'Uploads/2015-09-13/55f51b2075bcc.png'),
(21, '页面管理', 0, '', '', '21', 0, 'Uploads/2015-09-27/560741556e5fd.png'),
(22, '逻辑列表', 21, 'BusinessLogic', 'index', '21-22', 1, 'Uploads/2015-09-25/56054957d4b2d.png'),
(23, '导航列表', 21, 'Nav', 'index', '21-23', 1, ''),
(24, '分类管理', 0, '', '', '24', 0, 'Uploads/2015-09-20/55fe08fe3ae2a.png'),
(25, '技术方向列表', 24, 'Direct', 'index', '24-25', 1, ''),
(26, '难度列表', 24, 'Difficult', 'index', '24-26', 1, ''),
(27, '实现及bug管理', 0, '', '', '27', 0, ''),
(28, '功能实现列表', 27, 'Realize', 'index', '27-28', 1, ''),
(29, '开发团队列表', 27, 'Develop', 'index', '27-29', 1, ''),
(30, 'bug 列表', 27, 'Bug', 'index', '27-30', 1, ''),
(31, '回收站管理', 0, '', '', '31', 0, ''),
(32, '图片回收列表', 31, 'ImageRecycle', 'index', '31-32', 1, ''),
(34, '课程管理', 0, '', '', '34', 0, 'Uploads/2015-09-21/55fffd6d53b09.png'),
(35, '用户关联课程列表', 34, 'UserLesson', 'index', '34-35', 1, ''),
(36, '课程评论列表', 34, 'LessonComment', 'index', '34-36', 1, ''),
(37, '课程笔记列表', 34, 'LessonNote', 'index', '34-37', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `resource_bug`
--

CREATE TABLE IF NOT EXISTS `resource_bug` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报告者id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'bug 名',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT 'bug 描述',
  `did` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改者id',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT 'bug图',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '修改好的截图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `resource_bug`
--

INSERT INTO `resource_bug` (`id`, `mid`, `name`, `content`, `did`, `image`, `img`) VALUES
(1, 0, '权限关联图', '在模板文件中 进行非空处理', 1, 'Uploads/2015-09-20/55fe4f11247d2.png', 'Uploads/2015-09-20/55fe56df0e996.png');

-- --------------------------------------------------------

--
-- 表的结构 `resource_business_logic`
--

CREATE TABLE IF NOT EXISTS `resource_business_logic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '逻辑名',
  `image` varchar(50) NOT NULL DEFAULT '' COMMENT '逻辑图',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '导航标志 0 无导航 1 有导航',
  `des` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `resource_business_logic`
--

INSERT INTO `resource_business_logic` (`id`, `name`, `image`, `flag`, `des`) VALUES
(2, '后台首页', 'Uploads/2015-09-26/560648beb39b1.png', 1, '进入后台首页时 立即显示'),
(3, '前台个人设置', '', 1, '个人中心设置页 导航'),
(4, '前台个人中心', '', 1, '前台个人中心 包括会员所有信息的入口');

-- --------------------------------------------------------

--
-- 表的结构 `resource_categorys`
--

CREATE TABLE IF NOT EXISTS `resource_categorys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(100) NOT NULL COMMENT '分类名',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属方向',
  `did` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属难度',
  `path` varchar(255) NOT NULL DEFAULT '0,' COMMENT '全路径',
  `image` varchar(255) NOT NULL COMMENT '分类总结图',
  `addtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `resource_categorys`
--

INSERT INTO `resource_categorys` (`id`, `catename`, `pid`, `rid`, `did`, `path`, `image`, `addtime`) VALUES
(1, '课程', 0, 0, 0, '0,', '', 1442640181),
(2, 'php', 1, 0, 0, '0,1,', '', 1442640225),
(3, 'php 基础', 2, 3, 1, '0,1,2,', '', 1442640256);

-- --------------------------------------------------------

--
-- 表的结构 `resource_develop`
--

CREATE TABLE IF NOT EXISTS `resource_develop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '开发人员名',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开发人员职位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `resource_develop`
--

INSERT INTO `resource_develop` (`id`, `name`, `flag`) VALUES
(2, 'admin', 0),
(3, 'apeng1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `resource_difficult`
--

CREATE TABLE IF NOT EXISTS `resource_difficult` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '技术难度',
  `des` text COMMENT '难度描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `resource_difficult`
--

INSERT INTO `resource_difficult` (`id`, `name`, `des`) VALUES
(1, '初级', ''),
(2, '中级', ''),
(3, '高级', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

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
(8, '后台首页', 0, 'IndexController', 'index 后台首页, message 消息推送, breadcrumb 面包路径', '', '', 'index.html 首页模板, message.html 消息模板, menu.html 导航模板', '', 0, '', 1),
(9, '后台基类', 0, 'BaseController', 'controller构造方法, empty 非空处理', '', '', '', '', 0, '负责拦截权限', 2);

-- --------------------------------------------------------

--
-- 表的结构 `resource_direct`
--

CREATE TABLE IF NOT EXISTS `resource_direct` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '技术方向名',
  `des` text COMMENT '技术方向描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `resource_direct`
--

INSERT INTO `resource_direct` (`id`, `name`, `des`) VALUES
(1, '前端开发', '包括前端技术 但不包括移动端'),
(3, '后端开发', ''),
(4, '移动开发', ''),
(5, '数据处理', ''),
(6, '图像处理', '');

-- --------------------------------------------------------

--
-- 表的结构 `resource_function`
--

CREATE TABLE IF NOT EXISTS `resource_function` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL COMMENT '所属分类',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '功能名',
  `code` text COMMENT '功能代码',
  `note` text COMMENT '功能描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `resource_function`
--

INSERT INTO `resource_function` (`id`, `pid`, `name`, `code`, `note`) VALUES
(1, 0, 'php 添加 sql 语句', '// 使用php 连接mysql 服务器\r\n$link = mysql_connect(''localhost'', ''root'', '''');\r\n// 判断mysql 服务器连接是否成功\r\nif (!$link) {\r\n    echo ''mysql 连接失败&lt;br/&gt; 错误号: ''.mysql_errno().''错误信息: ''.mysql_error();\r\n} else {\r\n    echo ''连接成功'';\r\n}\r\n// 选择数据库\r\nmysql_select_db(DBNAME, $link);\r\n// 设置字符集编码\r\nmysql_set_charset(''utf8'', $link);\r\n// 定义sql 语句\r\n$sql = &quot;insert into student(name,age,sex,grade,des,addtime) values(''小明'', 18, ''w'', ''s24'', ''小明是个好同志'',&quot;.time().&quot;)&quot;;\r\n// 发送sql 语句\r\n$result = mysql_query($sql, $link);\r\n// 处理结果\r\nif ($result) {\r\n    echo &quot;添加成功&lt;br/&gt; 共添加了&quot;.mysql_afftected_rows($link).&quot;行&lt;br/&gt; 获取上一次添加的自增id&quot;.mysql_insert_id($link);\r\n} else {\r\n    echo ''添加失败&lt;br/&gt;''.mysql_errno.'' : ''.mysql_error();\r\n}\r\n// 关闭连接资源\r\nmysql_close($link);', ''),
(3, 7, 'TP 添加 sql 语句', 'public function insert(){\r\n		$_POST[''name''] = I(''post.name'');\r\n		$_POST[''code''] = I(''post.code'');\r\n		$_POST[''pid''] = I(''post.pid'');\r\n		$_POST[''note''] = I(''post.note'');\r\n		$res = D(''Function'') -&gt; add($_POST);\r\n		$mess = new MessController();\r\n		$mess -&gt; ajaxMessage($res, ''添加成功'', ''添加失败'');\r\n	}', '异步添加'),
(4, 7, 'iwebshop 添加 sql 语句', 'public function add(){\r\n// 获取参数并验证\r\n$id = IFilter::act(IReq::get(''id''), ''int'');\r\n// 实例化表\r\n$table = IModel(''student'');\r\n// 添加数据\r\n$data = array(''id''=&gt;$id...);\r\n$table-&gt;setData($data);\r\n// 添加\r\n$table-&gt;add();\r\n// 跳转页面\r\n$this-&gt;redirect(''index'');\r\n}', '');

-- --------------------------------------------------------

--
-- 表的结构 `resource_image_recycle`
--

CREATE TABLE IF NOT EXISTS `resource_image_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作者id',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '删除的图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `resource_image_recycle`
--

INSERT INTO `resource_image_recycle` (`id`, `uid`, `image`) VALUES
(2, 1, 'Uploads/2015-09-20/55fea199dc54b.png'),
(21, 1, 'Uploads/2015-09-25/560546e4d4223.png');

-- --------------------------------------------------------

--
-- 表的结构 `resource_instance`
--

CREATE TABLE IF NOT EXISTS `resource_instance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '实例名',
  `quest` varchar(255) NOT NULL DEFAULT '' COMMENT '问题',
  `plan` text COMMENT '方案',
  `discuss` text COMMENT '讨论',
  `suggestion` varchar(255) DEFAULT NULL COMMENT '参考',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '所属分类',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `resource_instance`
--

INSERT INTO `resource_instance` (`id`, `name`, `quest`, `plan`, `discuss`, `suggestion`, `pid`, `uid`) VALUES
(1, '访问子字符串', '你想知道一个字符串是否包含一个特殊的子字符串 例如 你想找出包含@的电子邮件地址', '', '', '', 11, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `resource_lesson`
--

CREATE TABLE IF NOT EXISTS `resource_lesson` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '课程名',
  `target` varchar(255) NOT NULL DEFAULT '' COMMENT '课程目标',
  `video` varchar(255) NOT NULL DEFAULT '' COMMENT '课程视频',
  `content` text COMMENT '课程内容',
  `program` text COMMENT '程序内容',
  `data` varchar(255) NOT NULL DEFAULT '' COMMENT '课程相关资料',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '流程图',
  `homework` varchar(255) DEFAULT NULL COMMENT '课后作业',
  `answer` text COMMENT '作业答案',
  `learn` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学习人数',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `resource_lesson`
--

INSERT INTO `resource_lesson` (`id`, `pid`, `name`, `target`, `video`, `content`, `program`, `data`, `image`, `homework`, `answer`, `learn`, `views`, `comments`) VALUES
(1, 3, 'php 介绍', '知道PHP 是做网页的 并学会第一个 welcome to here 程序', '', 'PHP 是什么\r\n能干什么\r\n第一个程序', 'echo welcome to here', '', '', '如何安装PHP 开发环境', '', 0, 0, 0);

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
-- 表的结构 `resource_member`
--

CREATE TABLE IF NOT EXISTS `resource_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '用户地址',
  `birthday` char(10) NOT NULL DEFAULT '' COMMENT '用户生日',
  `online` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '在线时间',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `logtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `resource_module`
--

CREATE TABLE IF NOT EXISTS `resource_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模块名',
  `des` text COMMENT '功能描述',
  `image` varchar(32) NOT NULL DEFAULT '' COMMENT '流程描述',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '代码压缩包',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `resource_module`
--

INSERT INTO `resource_module` (`id`, `name`, `des`, `image`, `code`) VALUES
(1, '留言板模块', '留言提交: 访客提交留言', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `resource_nav`
--

CREATE TABLE IF NOT EXISTS `resource_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '导航名',
  `bid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属页面id',
  `href` varchar(255) NOT NULL DEFAULT '' COMMENT '导航路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `resource_nav`
--

INSERT INTO `resource_nav` (`id`, `name`, `bid`, `href`) VALUES
(1, '个人资料', 3, 'UserSetting/info'),
(2, '头像设置', 3, 'UserSetting/headImg'),
(3, '修改密码', 3, 'UserSetting/updatePass'),
(4, '我的课程', 4, 'User/lesson'),
(5, '我的课程评论', 4, 'User/lessonComment'),
(6, '我的计划', 4, 'User/plan'),
(7, '我的代码', 4, 'User/code'),
(8, '我的笔记', 4, 'User/note');

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
(2, '资料系统', '整理所学资料', 0, 0, 'yk\r\nhk\r\nj', 'dd\r\njkl', 'windows');

-- --------------------------------------------------------

--
-- 表的结构 `resource_realize`
--

CREATE TABLE IF NOT EXISTS `resource_realize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开发者',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '实现名',
  `content` text COMMENT '实现描述',
  `addtime` int(10) unsigned DEFAULT NULL COMMENT '实现时间',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '参考地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `resource_realize`
--

INSERT INTO `resource_realize` (`id`, `did`, `name`, `content`, `addtime`, `url`) VALUES
(1, 3, '分类管理关联权限图', '参考 权限列表中的分类管理', 1442709525, 'http://localhost/resource/index.php/Admin/Auth/index'),
(3, 3, '权限关联图回收', '修改关联图 删除操作时 回收关联图', 1442710863, 'http://localhost/resource/index.php/Admin/ImageRecycle/index');

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
(3, '主管', '1,2,3,13', 'Auth-index,Manager-index,Role-index'),
(4, '会员专员', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `resource_user`
--

CREATE TABLE IF NOT EXISTS `resource_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '用户手机',
  `grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `experience` varchar(255) NOT NULL DEFAULT '0' COMMENT '经验值',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `vocation` varchar(255) NOT NULL DEFAULT '' COMMENT '用户职业',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `resource_user`
--

INSERT INTO `resource_user` (`id`, `username`, `password`, `email`, `mobile`, `grade`, `experience`, `sign`, `image`, `vocation`) VALUES
(1, 'apeng', '96e79218965eb72c92a549dd5a330112', '', '', 0, '0', '', '', ''),
(2, '', '96e79218965eb72c92a549dd5a330112', 'apeng1@qq.com', '', 0, '0', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `resource_user_lesson`
--

CREATE TABLE IF NOT EXISTS `resource_user_lesson` (
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `lid` int(10) unsigned DEFAULT NULL COMMENT '课程id',
  `homework` text COMMENT '我的作业'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
