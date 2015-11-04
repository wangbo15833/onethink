-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015-11-04 17:18:14
-- 服务器版本: 5.5.46-0ubuntu0.14.04.2
-- PHP 版本: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `onethink_trunk`
--
CREATE DATABASE IF NOT EXISTS `onethink_trunk` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `onethink_trunk`;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_action`
--

CREATE TABLE IF NOT EXISTS `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `onethink_action`
--

INSERT INTO `onethink_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_action_log`
--

CREATE TABLE IF NOT EXISTS `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `onethink_action_log`
--

INSERT INTO `onethink_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-24 11:30登录了后台', 1, 1445657417),
(2, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-30 13:47登录了后台', 1, 1446184042),
(3, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-30 16:58登录了后台', 1, 1446195516),
(4, 10, 1, 2130706433, 'Menu', 122, '操作url：/index.php?s=/admin/menu/add.html', 1, 1446195842),
(5, 10, 1, 2130706433, 'Menu', 122, '操作url：/index.php?s=/admin/menu/edit.html', 1, 1446195862),
(6, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-04 11:41登录了后台', 1, 1446608486),
(7, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-04 13:14登录了后台', 1, 1446614071),
(8, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-04 15:20登录了后台', 1, 1446621601),
(9, 11, 1, 2130706433, 'category', 39, '操作url：/index.php?s=/Admin/Category/add.html', 1, 1446623006),
(10, 11, 1, 2130706433, 'category', 39, '操作url：/index.php?s=/Admin/Category/edit.html', 1, 1446623030);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_addons`
--

CREATE TABLE IF NOT EXISTS `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `onethink_addons`
--

INSERT INTO `onethink_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0),
(16, 'Message', '留言板', '留言板插件', 1, '{"reply":"1","title":"1","summary":"1","username":"1","phone":"1","addr":"0","email":"1","qq":"0","type":"0"}', 'nzing', '0.1', 1446184174, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_attachment`
--

CREATE TABLE IF NOT EXISTS `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_attribute`
--

CREATE TABLE IF NOT EXISTS `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `onethink_attribute`
--

INSERT INTO `onethink_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_extend`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `onethink_auth_extend`
--

INSERT INTO `onethink_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_group`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `onethink_auth_group`
--

INSERT INTO `onethink_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_auth_rule`
--

CREATE TABLE IF NOT EXISTS `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- 转存表中的数据 `onethink_auth_rule`
--

INSERT INTO `onethink_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_category`
--

CREATE TABLE IF NOT EXISTS `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=40 ;

--
-- 转存表中的数据 `onethink_category`
--

INSERT INTO `onethink_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'blog', '博客', 0, 0, 10, '', '', '', '', '', '', '', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1382701539, 1, 0),
(2, 'default_blog', '默认分类', 1, 1, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1386839751, 1, 31),
(39, 'download_blog', '下载频道', 1, 0, 10, '', '', '', '', '', '', '', '3', '2,1', 0, 1, 1, 1, 0, '', '', 1446623006, 1446623030, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_channel`
--

CREATE TABLE IF NOT EXISTS `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_channel`
--

INSERT INTO `onethink_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Index/index', 1, 1379475111, 1379923177, 1, 0),
(2, 0, '博客', 'Article/index?category=blog', 2, 1379475131, 1379483713, 1, 0),
(3, 0, '官网', 'http://www.onethink.cn', 3, 1379475154, 1387163458, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_config`
--

CREATE TABLE IF NOT EXISTS `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `onethink_config`
--

INSERT INTO `onethink_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, 'OneThink内容管理框架', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'OneThink内容管理框架', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_demo`
--

CREATE TABLE IF NOT EXISTS `onethink_demo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `cover_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_demo`
--

INSERT INTO `onethink_demo` (`id`, `title`, `description`, `content`, `create_time`, `uid`, `status`, `cover_id`) VALUES
(1, '名称', '描述', '详情', 1446197327, 1, 0, 0),
(2, 'aaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', 1446619556, 1, 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document`
--

CREATE TABLE IF NOT EXISTS `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `onethink_document`
--

INSERT INTO `onethink_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '', 'OneThink1.0正式版发布', 2, '大家期待的OneThink正式版发布', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 9, 0, 0, 0, 1387260660, 1387263112, 1),
(2, 1, '', 'JS代码：设为首页 加入收藏（兼容任何浏览器）', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446616502, 1446616502, 1),
(3, 1, '', '两岸领导人习近平、马英九将在新加坡会面', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446616577, 1446616577, 1),
(4, 1, '', '两岸领导人会面时互称“先生” 会面结束后将共进晚餐', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446616743, 1446616743, 1),
(5, 1, '', '陕西4位县委书记获&quot;全国优秀县委书记&quot;后被提拔', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446616821, 1446616821, 1),
(6, 1, '', '广东纪委:有官员在家供奉舍利子 落马怪祖坟', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446616868, 1446616868, 1),
(7, 1, '', '安徽广电原台长张苏洲受审 牵涉多家影视公司及歌手', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446617190, 1446617190, 1),
(8, 1, '', '法医：乘客遗体状况表明俄失事客机舱内或曾爆炸', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446617236, 1446617236, 1),
(9, 1, '', '苏树林辞去福建省长 曾批“胜利系”周永康“全家腐”', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446617277, 1446617277, 1),
(10, 1, '', '的哥兼职一天送五六个快递每月多赚两千靠谱吗', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446617391, 1446617391, 1),
(11, 1, '', '初创企业，如何寻找跨境电商的蓝海？', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446617427, 1446617427, 1),
(12, 1, '', '快递新政加速“通达系”洗牌', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446617457, 1446617457, 1),
(13, 1, '', 'PPTV前三季亏损7.05亿 被苏宁剥离将独立上市', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1446617508, 1446617508, 1),
(14, 1, '', '顺丰创始人王卫：顺丰不能为圈钱而上市', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446617542, 1446617542, 1),
(15, 1, '', '京东创始人刘强东：出身农村最喜欢吃红烧肉', 2, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 26, 0, 0, 0, 1446617580, 1446624740, 1),
(16, 1, '', 'vim命令打印版', 39, '', 0, 0, 3, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446623075, 1446623075, 1),
(17, 1, '', '实践审批表v1', 39, '', 0, 0, 3, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446623106, 1446623106, 1),
(18, 1, '', 'GIMP_实用教程---1文件的打开和存储', 39, '', 0, 0, 3, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446623167, 1446623167, 1),
(19, 1, '', 'GIMP_实用教程---2旋转', 39, '', 0, 0, 3, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446623187, 1446623187, 1),
(20, 1, '', 'GIMP_实用教程---4色阶的调整', 39, '', 0, 0, 3, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1446623212, 1446623212, 1),
(21, 1, '', '子文档测试子文档测试子文档测试', 39, '', 20, 20, 2, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446623889, 1446623889, 1),
(22, 1, '', '子文档第二次测试', 39, '', 20, 20, 2, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446623916, 1446623916, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_article`
--

CREATE TABLE IF NOT EXISTS `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `onethink_document_article`
--

INSERT INTO `onethink_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(1, 0, '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', 0),
(2, 0, '<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">// JavaScript Document</span><br />\r\n<b>// 加入收藏 &lt; a onclick="AddFavorite(window.location,document.title)" &gt;加入收藏&lt; /a&gt;<br />\r\n</b><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">function AddFavorite(sURL, sTitle)</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">{</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">try</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">{</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;window.external.addFavorite(sURL, sTitle);</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">}</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">catch (e)</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">{</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;try</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;{</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;window.sidebar.addPanel(sTitle, sURL, "");</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;}</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;catch (e)</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;{</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;alert("加入收藏失败，请使用Ctrl+D进行添加");</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;}</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">}</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">}</span><br />\r\n<b>//设为首页 &lt; a onclick="SetHome(this,window.location)" &gt; 设为首页 &lt; /a&gt;</b><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">function SetHome(obj,vrl){</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;try{</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;obj.style.behavior=''url(#default#homepage)'';obj.setHomePage(vrl);</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;}</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;catch(e){</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;if(window.netscape) {</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;try {</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;}</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;catch (e) {</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;alert("此操作被浏览器拒绝！\\n请在浏览器地址栏输入“about:config”并回车\\n然后将 [signed.applets.codebase_principal_support]的值设置为''true'',双击即可。");</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;}</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;var prefs = Components.classes[''@mozilla.org/preferences-service;1''].getService(Components.interfaces.nsIPrefBranch);</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;prefs.setCharPref(''browser.startup.homepage'',vrl);</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;}</span><br />\r\n<img class="tab" style="width:0px;height:0px;" /><span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&nbsp;}</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">}</span><br />\r\n<br />\r\n<b>使用</b><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&lt; a href="#" onclick="SetHome(this,window.location)" &gt; 设为首页 &lt; /a&gt;</span><br />\r\n<span style="font-family:''Droid Sans Fallback'';font-size:medium;line-height:normal;">&lt; a href="#" onclick="AddFavorite(window.location,document.title)"&gt; 收藏本站 &lt; /a&gt;</span>', '', 0),
(3, 0, '<p style="color:#393939;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">\r\n	　新华网北京１１月４日电　中共中央台湾工作办公室、国务院台湾事务办公室主任张志军４日宣布，经两岸有关方面协商，两岸领导人习近平、马英九将于１１月７日在新加坡会面，就推进两岸关系和平发展交换意见。\r\n</p>\r\n<p style="color:#393939;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">\r\n	　　张志军强调指出，此次会面双方以两岸领导人身份和名义举行，是双方商定的。这是在两岸政治分歧尚未解决情况下根据一个中国原则作出的务实安排。\r\n</p>', '', 0),
(4, 0, '<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	<strong>新华社北京１１月４日电</strong><span>（记者陈键兴）中共中央<a href="http://tw.haiwainet.cn/" target="_blank" class="keylink">台湾</a>工作办公室、国务院台湾事务办公室主任张志军４日宣布，经两岸有关方面协商，两岸领导人将于１１月７日在<a href="http://singapore.haiwainet.cn/" target="_blank" class="keylink">新加坡</a>会面，就推进两岸关系和平发展交换意见。</span>\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	<span>张志军专门就此次重要会面接受记者采访，介绍相关情况。他表示，即将举行的两岸领导人会面将开启两岸领导人直接交流沟通的先河，有利于两岸双方增进互信，巩固共同政治基础，推进两岸关系和平发展，维护台海和平稳定，是两岸关系发展史上具有里程碑意义的大事。张志军表示，实现两岸领导人会面是我们的一贯主张。我们的态度始终是积极开放的。过去７年多来，两岸双方在坚持“九二共识”、反对“台独”的共同政治基础上建立并增进互信，开辟了两岸关系和平发展道路，取得丰硕成果。两会协商签署了２３项协议，解决了关乎两岸同胞切身利益的一系列问题。两岸经济合作持续深化，实现全面直接双向“三通”，给两岸同胞带来了许多实实在在好处。两岸各领域交流蓬勃发展，密切了两岸同胞感情。两岸协商处理有关涉外事务，减少了内耗。受这些成果鼓舞，两岸许多同胞和海外侨胞呼吁两岸领导人举行会面，共商推动两岸关系更大发展之计。</span>\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	张志军介绍，国台办和台湾方面陆委会在２０１４年建立联系沟通机制后，一直就两岸关系发展中的重大问题保持沟通，努力促进两岸各领域各层次人员的交流互动，期间曾提到两岸领导人会面问题。前不久，我和陆委会主委夏立言在广州会面时，再次谈到这个话题，就此进行了初步沟通。双方都认为，两岸领导人会面对于两岸关系长远发展具有重要积极意义。此后，双方经过密切协商，就举行两岸领导人会面达成一致。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	张志军表示，两岸领导人会面是两岸关系发展史上具有里程碑意义的大事，两岸双方共同迈出这一步非常不容易。１９４９年以来，两岸关系历经风雨，跌宕起伏。从激烈军事冲突，到长期尖锐政治对峙，直到上个世纪八十年代末才打破相互隔绝的坚冰，两岸同胞开始交流往来。本世纪的前几年，由于“台独”分裂势力的挑衅，两岸关系一度濒临危机。在两岸关系紧张动荡的时候，是很难想象两岸领导人能够面对面坐在一起的。两岸领导人会面得以实现，来自于两岸双方和两岸同胞的共同努力，得益于两岸关系和平发展累积的丰硕成果。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	张志军强调，此次会面双方以两岸领导人身份和名义举行、见面时互称“先生”，是经双方商定的。这是在两岸政治分歧尚未彻底解决的情况下根据一个中国原则作出的务实安排，体现了搁置争议、相互尊重的精神。综合考虑各种因素，这次两岸领导人会面安排在新加坡举行。张志军介绍，两岸领导人此次会面，将就推进两岸关系和平发展交换意见，探讨深化两岸各领域交流合作、增进两岸民众福祉等重大问题，以维护和进一步推动两岸关系和平发展。会面结束后，两岸领导人还将共进晚餐。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	张志军指出，当前两岸关系再度处于重要节点，面临向何处去的问题。两岸同胞期望台海保持和平稳定，两岸关系继续和平发展并结出更多惠民硕果。两岸领导人在这个时候举行会面，是两岸双方顺应两岸同胞心愿和时代潮流共同采取的一项重大举措，将开启两岸领导人直接交流沟通的先河。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	张志军说，１９９３年４月，在海协会和台湾海基会１９９２年达成两岸各自以口头方式表述海峡两岸均坚持一个中国原则的共识基础上，第一次“汪辜会谈”在新加坡举行，建立了在一个中国原则基础上推进两岸制度化协商的机制，有力推动了两岸关系发展。２０１４年２月，国台办和陆委会在“九二共识”基础上建立两部门常态化联系沟通机制，开辟了新的两岸沟通管道，妥善处理和解决了两岸交往中的许多问题。张志军强调指出，两岸领导人实现会面是两岸关系发展史上具有里程碑意义的大事，将两岸交流互动提升到新高度，开辟两岸关系发展新空间。这将有利于两岸双方加强沟通、增进互信、管控矛盾分歧，巩固共同政治基础，推进两岸关系和平发展，维护台海和平稳定，也有利于地区和平稳定。相信一定会得到两岸各界和国际社会的广泛支持。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	【两岸领导人会面将开启两岸领导人直接交流沟通的先河】中共中央台办、国务院台办主任张志军表示，即将举行的两岸领导人会面将开启两岸领导人直接交流沟通的先河，有利于两岸双方增进互信，巩固共同政治基础，推进两岸关系和平发展，维护台海和平稳定，是两岸关系发展史上具有里程碑意义的大事。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	【会面结束后两岸领导人将共进晚餐】张志军介绍，两岸领导人此次会面，将就推进两岸关系和平发展交换意见，探讨深化两岸各领域交流合作、增进两岸民众福祉等重大问题，以维护和进一步推动两岸关系和平发展。会面结束后，两岸领导人还将共进晚餐。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	【两岸领导人会面将开辟两岸关系发展新空间】张志军强调，两岸领导人会面将两岸交流互动提升到新高度，开辟两岸关系发展新空间，有利于两岸双方加强沟通、增进互信、管控矛盾分歧，巩固共同政治基础，推进两岸关系和平发展，维护台海和平稳定，也有利于地区和平稳定，定会得到两岸各界和国际社会支持。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	【广州“张夏会”就两岸领导人会面初步沟通】张志军介绍，前不久，我和陆委会主委夏立言在广州会面时，再次谈到两岸领导人会面这个话题，就此进行了初步沟通。双方都认为，两岸领导人会面对于两岸关系长远发展具有重要积极意义。此后，双方经过密切协商，就举行两岸领导人会面达成一致。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;text-indent:2em;">\r\n	【两岸领导人会面时互称“先生”】张志军强调，此次会面双方以两岸领导人身份和名义举行、见面时互称“先生”，是经双方商定的。这是在两岸政治分歧尚未彻底解决的情况下根据一个中国原则作出的务实安排，体现了搁置争议、相互尊重的精神。综合考虑各种因素，这次两岸领导人会面安排在新加坡举行。\r\n</p>', '', 0),
(5, 0, '<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;text-align:center;">\r\n	<img src="http://himg2.huanqiu.com/attachment2010/2015/1104/08/32/20151104083222732.jpg" style="height:282px;width:500px;" />\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　王晓江从一名教师，一路成长为武功县团委书记，后在武功、旬阳、紫阳等县历任镇长、常委组织部长、县长、县委书记等职，也有丰富的基层经验。\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　省政府日前公布一批人事任免，涉及多位厅级干部，其中，任命王晓江为陕西省民政厅副厅长（试用期一年）。至此，我省今年七一前夕被授予“全国优秀县委书记”称号的4位县委书记全部提拔履新，时间仅仅过了4个月。\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　我省4人中：2人任副市长、1人任省民政厅副厅长、1人成市委常委\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　今年七一前夕，中组部授予全国102名县委书记为“优秀县委书记”称号，其中我省有4人获此殊荣，分别是时任紫阳县委书记王晓江、时任富县县委书记冯振东、时任礼泉县委书记孙矿玲（女）、时任宁强县委书记周景祥。\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　公开资料显示，上述4位县委书记均为60后，其中年龄最小的王晓江46岁，年龄最大的周景祥53岁。4人均为研究生学历，其中冯振东是经济学博士。4位县委书记均有在县域任职“一把手”的丰富履历。从他们的履新情况看，有1人“入常”、2人任副市长、1人进入省政府部门。\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　<strong>全国已有至少30名优秀县委书记获提拔，5人在拟任公示中</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　统计发现，截至昨日，全国至少有30名优秀县委书记履新。其中有不少人从县级“一把手”提拔为副厅级干部，不少人“入常”。如云南省福贡县委书记李红文（<a href="http://country.huanqiu.com/bai" class="linkAbout" target="_blank">白族</a>）就被提拔为怒江州委常委，河南淮滨县委书记吴刚出任南阳市委常委、邓州市委书记。有的优秀县委书记进入省级重要部门任职，如云南省师宗县委书记孟端平任云南省纪委党风政风监督室主任。\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　11月2日，浙江省委组织部公示，今年获评“全国优秀县委书记”的浙江开化县委书记鲍秀英，拟任浙江省监察厅副厅长。与鲍秀英一样，在拟任命公示期间的还有内<a href="http://country.huanqiu.com/mongolia" class="linkAbout" target="_blank">蒙古</a>卓资县委书记常培忠（<a href="http://country.huanqiu.com/manchu" class="linkAbout" target="_blank">满族</a>）、翁牛特旗旗委书记敖日格勒（<a href="http://country.huanqiu.com/mongols" class="linkAbout" target="_blank">蒙古族</a>）、贵州省长顺县委书记张惠民（<a href="http://country.huanqiu.com/buyei" class="linkAbout" target="_blank">布依族</a>）。黑龙江省绥化市望奎县委书记顾百文拟任佳木斯市委常委、纪委书记。\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　据官方媒体介绍，20年前，中央从2800多名县（市、区）委书记中遴选出100人作为全国优秀县委书记加以表彰，据不完全统计，其中至少有16人晋升到省部级。\r\n</p>\r\n<p style="font-size:14px;font-family:SimSun;color:#2B2B2B;">\r\n	　　今年获表彰的102名书记均系在县（市、区、旗）委书记岗位上取得优异成绩的领导干部，观察人士认为，他们的职务调整，一方面能将基层工作的实际经验带入上一级，在决策时更兼顾民生实际、更接地气；也能树立榜样典型，激励更多县委书记脚踏实地，在基层岗位上干出实绩。\r\n</p>', '', 0),
(6, 0, '<p style="font-family:SimSun;font-size:14px;">\r\n	　　“一顿公款吃喝、接受一个小‘红包’、一次口无遮拦议论、一次违规用车或打球、瞒报个人事项等看似不起眼的‘小问题’，现在动辄则咎、寸步不让，发现一起 查处一起，绝不含糊，并点名道姓通报曝光。”10月29日-30日，省纪委、省委组织部联合举办“全省新提任省管厅级领导干部集体廉政谈话教育活动”，为 广东省去年11月至今年10月新提任省管厅级领导职务的161名干部提供了“廉政教育套餐”，省委常委、省纪委书记黄先耀当堂讲课，句句铿锵。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　自党的十八大以来，这是广东省第三年举办此类活动。黄先耀强调，既要反对腐败也要反对不作为，鼓励敢闯敢试。省委常委、省委组织部部长李玉妹则要求，各级领导干部要时刻绷紧廉洁自律这根弦，增强防腐拒变的免疫力。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　“今年前9个月，我省查处省管干部149人，违纪违法行为延续到十八大之后的占53.1%，党风廉政建设和反腐败斗争形势依然严峻复杂，腐败与反腐败仍处 于胶着状态。”黄先耀说，去年以来，党中央、中央纪委提出“抓早抓小”，用纪律管住党员干部大多数。“‘抓早抓小’不是反腐败的‘转向’、‘减速’，更不 是抓小放大，把‘老虎’当‘苍蝇’打，而是体现中央全面从严治党、坚决铲除腐败滋生土壤的坚定决心，体现了露头就打、严格执纪的更加凌厉的高压态势。”\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　“越往后执纪越严、处分越重……大家要主动适应这一新要求、新常态！” 黄先耀说。据悉，仅今年前9个月，广东省就查处违反中央八项规定精神问题343件，给予党政纪处分425人。“在这样的形势下，谁还顶风违纪必将付出代 价！” 黄先耀要求，大家准确把握越往后执纪越严的新要求，正风反腐越来越严，纪律要求越来越严，执纪标准越来越严，干部监督越来越严，责任追究越来越严。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　有干部常年在家供奉舍利子 把落马归因于祖坟出了问题\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　黄先耀在讲话中剖析了当前一些领导干部为官不忠、不慎、不畏、不实、不廉的问题，希望新提任省管厅级领导干部们防止和警惕出现这些问题，提升廉洁从政新境界。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　有些领导干部台上讲马列主义头头是道，实际上思想阵地已被封建迷信所占领。有个被查处的领导干部常年在家布置风水局，收集供奉舍利子，每天念咒诵经吃斋拜佛，晚上还要打坐两个小时，把组织对其的调查当成“人生无常”，把落马原因归为祖坟出问题。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　有些领导干部为官不慎独、不慎微、不慎初、不慎友，生活不检点，享乐不节制，交友没界限。深圳市中级法院原副院长黄常青跟各种“老板”、“麻友”吃饭、喝 酒、打麻将，终让“麻友”将他从法庭的审判席拉到被告席。有的干部不敬畏组织、不敬畏人民、不敬畏法纪、心中无组织无纪律，大事不请示、外出不报告；有的 口无遮拦，对党的大政方针说三道四，甚至妄议中央；有的不顾中央和省委三令五申，饭照吃、钱照收、球照打。从今年1至9月全省纪检监察机关查处的343件 违反中央八项规定精神问题情况看，不收手、不收敛、顶风违纪的问题仍然时有发生。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　官商勾结买官卖官行贿受贿 三大为官不廉问题更加突出\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　有的干部做人不老实，做事不踏实，对组织不诚实，个人报告不真实。去年，广东对全省“裸官”进行了一次大起底，清出2190名“裸官”，对866人做了岗 位调整。但是还是有人企图欺骗组织、蒙混过关，近一年来又有10多名省管干部的“裸官”身份暴露出来，“他们绝大多数既是‘裸官’，又有严重的违纪违法问 题。”黄先耀说。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　而为官不廉的案例更加突出，从纪律审查和群众举报的情况看，当前广东省土地与工程领域的官商勾结、干部人事领域的买官卖官、以“红包”礼金名义行贿受贿等 三大问题依然比较突出。据统计，今年查处的149名省管干部中，涉及“红包”礼金的占51.2%，涉及土地与工程的占32.5%，涉及买官卖官的占 39%。特别是在当前正风反腐如此高压态势之下，一些干部仍然我行我素，顶风违纪。最典型的是广州的一位政协副主席，在被查处前，还收受他人贿送人民币 1200多万元。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	<strong>　　剖析贪腐官员的“五个标配” 贪财与好色往往是孪生兄弟</strong>\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　通过总结大量案件，黄先耀说，腐败分子人生经历和事发缘由虽然各有不同，但故事却惊人相似，发生贪腐行为一般都有“五个标配”。一是专横跋扈的“一把 手”。个别专横的“一把手”甚至把班子成员看成马仔，自己一手遮天，说一不二，不顾一切揽工程，力排众议上项目，乾纲独断用干部。“这样就离任性滥权、以 权谋私不远了。”二是过从甚密的商人。不少落马的领导干部，身边都曾围有一圈“大方、阔绰”的老板朋友，双方勾肩搭背、暗通款曲，不小心就会让所谓的朋友 用轿子抬着送上了法庭。三是不守本分的家属。家族腐败现象不少，社会戏言“贪腐父子兵”、“收钱夫妻档”、“寻租兄弟连”、“助贪亲友团”。四是势利相交 的“小圈子”。搞不清什么是<a href="http://jiankang.haiwainet.cn/" target="_blank" class="keylink">健康</a>交往、什么是庸俗的江湖义气，把团团伙伙与友谊混淆，交一些酒肉朋友、势利小人。五是如影随形的“艳事”。贪财与好色，往 往是孪生兄弟，有的贪腐因色而起，有的色欲因贪而生，鲜有例外。\r\n</p>\r\n<p style="font-family:SimSun;font-size:14px;">\r\n	　　黄先耀希望新提任的省管厅级干部们引起警觉，有则改之，无则加勉，“否则出事是迟早的事”。他劝大家慎独、慎微、慎言、慎初、慎权、慎友。（新快报记者 黄琼）\r\n</p>', '', 0),
(7, 0, '<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	　　新华网合肥１１月３日专电（记者刘美子）安徽广播电视台原党委书记、台长张苏洲涉嫌受贿贪污一案３日在安徽省淮南市中级人民法院一审开庭。检察机关指控，张苏洲涉嫌非法收受他人财物千余万元。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	　　张苏洲，１９５３年出生。淮南市人民检察院指控，２００６年４月至２０１４年７月，张苏洲在任安徽电视台台长、安徽省广电局局长、安徽广播电视台台长期间，利用职务便利，先后收受数十家单位和个人现金、物品，共计１１３９．６１４８万元人民币、４．７万美元、０．２万欧元、１７．９万元购物卡及价值１０７．２２３９万元的金条、玉器和手表等物品，在电视广播业务、购买电视剧及支付购剧款、电视台采购物品等方面为他人谋取利益；又利用职务之便，单独或者伙同他人，通过在单位报销个人购物消费、虚列奖金等手段非法占有公共财物共计３３９．３６５７万元。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	　　在检方所指控的受贿罪中，最大一笔是２０１１年至２０１３年间，张苏洲先后１４次共收受南京日景升投资咨询有限公司董事长程静（另案处理）４１４万元和价值１２．３９万元的百达翡丽手表一块，并伙同时任安徽电视台副台长赵红梅（另案处理）帮助程静公司承接安徽广播电视台的相关业务，谋取利润三人均分。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	　　据检方介绍，随着中央反腐力度的加大以及巡视组将进入安徽广播电视台，张苏洲害怕被查处，误以为程静共送给其８００多万元，于２０１４年１月委托赵红梅到南京退还给程静８３０万元，２０１４年６月又委托赵红梅将百达翡丽手表退还给程静。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	　　起诉书显示，经张苏洲同意，安徽广播电视台购买了《何以笙箫默》、《爱情公寓３》热播剧等的制作方——上海克顿文化传媒有限公司及其子公司引进或制作的多部电视剧。为感谢和寻求关照，克顿公司总裁吴涛（另案处理）先后１０次共送给张苏洲２４７万元和０．４万美元，克顿公司原高级顾问钮某某送给张苏洲１．５万元苏宁电器卡。２０１４年春节前，张苏洲通过其司机退给吴涛１９０万元。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	　　起诉书多达３０条的受贿指控显示，由于张苏洲掌握着广告经营、电视剧及节目购销、人事调整和大型综艺活动等诸多方面的高度决策权，有包括广告经营、电视剧和节目制作、商务旅游等公司１２家，安徽广电干部职工１６人，总政歌舞团歌唱演员２人向其送钱财和礼品。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	　　检察机关对其涉嫌贪污罪的指控中，张苏洲除个人贪污２０８．８２９７万元外，还伙同赵红梅共同贪污１３０．５３６万元，其中购买私人玉器等物品，安排公账报销，共同侵吞５８．５３６万元，购买私用相机，使用虚假发票从单位公款中报销，共同侵吞公款７万元，虚列名目，与赵红梅互为对方发奖金，共同侵吞公款６５万元。\r\n</p>', '', 0),
(8, 0, '<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　<a target="_blank" href="http://www.chinanews.com/">中新网</a>11月4日电 综合外媒3日消息，曾参与俄科加雷姆航空公司A321客机乘客遗体检查程序的一名埃及法医称，客机乘客遗体的损伤特点或说明，飞机撞击地面前机舱内曾发生爆炸。\r\n</p>\r\n<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　该法医表示，遗体的情况可能说明，在客机撞击地面前，机舱内就发生过强烈爆炸。此前有俄媒报道称，靠近客机尾部的乘客可能是因为爆炸受伤而遇难。而在飞机的前部的乘客则遭受失血，休克，开放性颅脑损伤和骨折等等情况。\r\n</p>\r\n<div style="margin:0px;padding:0px;font-family:微软雅黑;font-size:15px;text-align:center;background-color:#EEF2F6;">\r\n	<img alt="11月2日消息，由俄罗斯搜救人员、埃及军方和埃及卫生医疗对组成的搜救队伍正在客机失事现场展开搜救任务。一架从埃及沙姆沙伊赫飞往俄罗斯圣彼得堡的俄罗斯客机31日清晨起飞后不久坠毁于埃及西奈半岛阿里什地区南部的哈桑纳地区，机上共217名乘客和7名机组人员，乘客多为俄罗斯游客。俄罗斯驻埃及大使馆发布消息确认，机上乘客和机组人员无一人生还。" src="http://image1.chinanews.com.cn/cnsupload/big/2015/11-02/4-426/86047d2fb606442da63eef7b8fa14a3e.jpg" title="11月2日消息，由俄罗斯搜救人员、埃及军方和埃及卫生医疗对组成的搜救队伍正在客机失事现场展开搜救任务。一架从埃及沙姆沙伊赫飞往俄罗斯圣彼得堡的俄罗斯客机31日清晨起飞后不久坠毁于埃及西奈半岛阿里什地区南部的哈桑纳地区，机上共217名乘客和7名机组人员，乘客多为俄罗斯游客。俄罗斯驻埃及大使馆发布消息确认，机上乘客和机组人员无一人生还。" />\r\n</div>\r\n<div class="pictext" style="margin:5px 0px;padding:10px;border:1px solid #DEE9F2;color:#555555;font-size:13px;font-family:微软雅黑;background-color:#EEF2F6;">\r\n	11月2日消息，由俄罗斯搜救人员、埃及军方和埃及卫生医疗对组成的搜救队伍正在客机失事现场展开搜救任务。\r\n</div>\r\n<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　专家表示，考虑到大部分遗体的状况，或需要通过DNA鉴定辨别遇难者身份。\r\n</p>\r\n<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　此前，美国著名分析机构Stratfor认为，俄罗斯科加雷姆公司航班在西奈半岛失事的最有可能原因，是爆炸物被带上了飞机。\r\n</p>\r\n<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　另外，美国有线电视台(CNN)援引消息人士指出，坠机当时，西奈半岛上空一颗美国红外卫星曾侦测到热闪光。美国CBS电视台称，美卫星在坠机时记录到西奈半岛上空有热闪光，这可能意味着燃料箱爆炸，或是炸弹引爆。\r\n</p>\r\n<div style="margin:0px;padding:0px;font-family:微软雅黑;font-size:15px;text-align:center;background-color:#EEF2F6;">\r\n	<img alt="11月2日消息，由俄罗斯搜救人员、埃及军方和埃及卫生医疗对组成的搜救队伍正在客机失事现场展开搜救任务。一架从埃及沙姆沙伊赫飞往俄罗斯圣彼得堡的俄罗斯客机31日清晨起飞后不久坠毁于埃及西奈半岛阿里什地区南部的哈桑纳地区，机上共217名乘客和7名机组人员，乘客多为俄罗斯游客。俄罗斯驻埃及大使馆发布消息确认，机上乘客和机组人员无一人生还。" src="http://image1.chinanews.com.cn/cnsupload/big/2015/11-02/4-426/d876f297a705439a82f53ab4d6a6c535.jpg" title="11月2日消息，由俄罗斯搜救人员、埃及军方和埃及卫生医疗对组成的搜救队伍正在客机失事现场展开搜救任务。一架从埃及沙姆沙伊赫飞往俄罗斯圣彼得堡的俄罗斯客机31日清晨起飞后不久坠毁于埃及西奈半岛阿里什地区南部的哈桑纳地区，机上共217名乘客和7名机组人员，乘客多为俄罗斯游客。俄罗斯驻埃及大使馆发布消息确认，机上乘客和机组人员无一人生还。" /><a href="http://www.chinanews.com/tp/hd2011/2015/11-02/577394.shtml"><img src="http://www.chinanews.com/fileftp/2015/08/2015-08-31/U412P4T47D33289F968DT20150915144117.jpg" /></a>\r\n</div>\r\n<div class="pictext" style="margin:5px 0px;padding:10px;border:1px solid #DEE9F2;color:#555555;font-size:13px;font-family:微软雅黑;background-color:#EEF2F6;">\r\n	11月2日消息，由俄罗斯搜救人员、埃及军方和埃及卫生医疗对组成的搜救队伍正在客机失事现场展开搜救任务。\r\n</div>\r\n<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　不过，据俄罗斯媒体报道，德国飞行员工会发言人马库斯·瓦尔3日表示，应谨慎对待美国军用卫星有关俄罗斯在埃及失事的A321客机的信息，因还没有证据表明卫星能够追踪民航客机。\r\n</p>\r\n<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　俄罗斯民航高阶官员曾指出，飞机曾发生空中解体。科加雷姆航空公司主管史米尔诺夫2日在莫斯科记者会上表示，排除技术问题和人为疏忽。但调查官员称这一说法不符合事实。\r\n</p>\r\n<p style="color:#333333;font-family:微软雅黑;font-size:15px;background-color:#EEF2F6;">\r\n	　　俄罗斯科加雷姆航空公司一架从沙姆沙伊赫飞往圣彼得堡空客A321客机10月31日在西奈半岛失事，机上的217名乘客和7名机组人员全部遇难。\r\n</p>', '', 0),
(9, 0, '<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	<span style="color:#0070C0;"><strong>核心提示：</strong></span><strong>根据组织法、选举法和福建省人大常委会任免国家机关工作人员条例的有关规定，鉴于苏树林涉嫌严重违纪，会议经审议，决定接受苏树林辞去福建省人民政府省长职务的请求</strong>\r\n</p>\r\n<p style="text-indent:1em;font-size:14px;font-family:微软雅黑;color:#2B2B2B;text-align:center;">\r\n	<strong><img src="http://n6.cmsfile.pg0.cn/group1/M00/19/27/Cgqg11Y5SI6AJWhFAABWWpuyLRY183.jpg" title="" alt="" width="550" height="359" /></strong>\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;text-align:center;">\r\n	<span style="font-family:楷体, 楷体_GB2312, SimKai;">苏树林资料图</span>\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	3日上午，福建省十二届人大常委会第十八次会议在福州举行。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	福建省人大常委会主任尤权主持会议，副主任徐谦、陈桦、苏增添、张广敏、陈伦、潘征，秘书长牛纪刚和其他组成人员出席会议。副省长洪捷序，省法院院长马新岚、省检察院检察长何泽中列席会议。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	会议听取福建省委常委、组织部长姜信治作关于人事事项的说明，福建省人大常委会代表资格审查委员会主任委员徐谦作关于个别代表的代表资格的报告。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	根据组织法、选举法和省人大常委会任免国家机关工作人员条例的有关规定，鉴于苏树林涉嫌严重违纪，会议经审议，决定接受苏树林辞去福建省人民政府省长职务的请求，报省十二届人大第四次会议备案；决定接受苏树林辞去十二届全国人大代表职务的请求，报十二届全国人大常委会备案、公告。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	会议经审议，表决通过省十二届人大常委会代表资格审查委员会关于个别代表的代表资格的报告。依照代表法的有关规定，苏树林的省十二届人大代表资格终止。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	<strong>人物履历</strong>\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	1979.09——1983.07大庆石油学院勘探系石油地质专业本科学习，获工学学士学位；1983.07——1986.10大庆石油管理局龙虎泡试验区实习员、地质组组长；1986.10——1992.02大庆石油管理局采油九厂地质研究所副所长；1992.02——1994.05大庆石油管理局采油九厂副总地质师；1994.05——1996.03大庆石油管理局副总地质师、采油四厂厂长；1996.03——1997.01大庆石油管理局局长助理；\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	1997.01——1997.11大庆石油管理局局长助理兼第一油气开发事业部主任；1997.11——1999.01大庆石油管理局常务副局长、党委常委；1999.01——1999.11大庆石油管理局局长、党委副书记（1996.09——1999.03参加哈尔滨工程大学管理科学与工程专业研究生学习，1999.04获管理学硕士学位）；1999.11——2000.08中国石油天然气股份有限公司副总裁兼大庆油田有限责任公司董事长、总经理、党委书记，大庆石油管理局党委副书记；2000.08——2001.03中国石油天然气集团公司副总经理、党组成员兼中国石油天然气股份有限公司副总裁，大庆油田有限责任公司董事长、总经理、党委书记，大庆石油管理局党委副书记；2001.03——2002.12中国石油天然气集团公司副总经理、党组成员兼中国石油天然气股份有限公司副总裁，大庆油田有限责任公司董事长、总经理；2002.12——2003.12中国石油天然气集团公司副总经理、党组成员兼中国石油天然气股份有限公司董事、高级副总裁，大庆油田有限责任公司董事长、总经理；2003.12——2006.09中国石油天然气集团公司副总经理、党组成员兼中国石油天然气股份有限公司董事、高级副总裁；2006.09——2006.10辽宁省委常委；\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	2006.10——2007.06辽宁省委常委、组织部部长；\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	2007.06——2007.08中国石油化工集团公司总经理、党组书记；2007.08——2011.03中国石油化工集团公司总经理、党组书记兼中国石油化工股份有限公司董事长；2011.03——2011.04福建省委副书记；\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	2011.04——2011.07福建省委副书记，省政府副省长、代省长，省政府党组书记；2011.07——2015.11福建省委副书记，省政府省长，省政府党组书记。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	中共十六大、十七大、十八大代表，中共第十六届、十七届中央候补委员，第十八届中央委员。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	第十一届全国人大代表。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	<strong>违纪被查</strong>\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	2015年10月7日，据中央纪委监察部网站消息，福建省委副书记、省长苏树林涉嫌严重违纪，接受组织调查。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	<strong>辞去职务</strong>\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	2015年11月3日，福建省十二届人大常委会第十八次会议举行全体会议。会议表决通过了省人大常委会关于接受苏树林辞去福建省人民政府省长职务的请求的决定，省人大常委会关于接受苏树林辞去第十二届全国人大代表职务的请求的决定。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	<strong>曾批“胜利系”周永康“全家腐”</strong>\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	据《人民日报》8月报道，苏树林曾表示，对领导干部家庭来说，良好的家风无疑是抵御腐败的重要防线。没有良好的家风，领导干部就可能让自己和家庭成员变得“任性”。\r\n</p>\r\n<p style="text-indent:2em;font-size:16px;font-family:微软雅黑;color:#2B2B2B;">\r\n	周永康、薄熙来、徐才厚、令计划、苏荣等人的落马，都带有“全家腐”甚至是家族式腐败的特征。培育良好家风，关键在立家规、正己身、懂真爱。一人不廉全家不圆。领导干部自己不出事，又加强对家属子女的教育管理，整个家庭乃至家族平平安安，这也是一种幸福。(福建日报、人民日报综合报道)\r\n</p>', '', 0);
INSERT INTO `onethink_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(10, 0, '<br />\r\n最近，一款同城快递软件向杭城出租车司机抛出橄榄枝——<br />\r\n<br />\r\n一天送五六个快递，每月多赚两千元<br />\r\n<br />\r\n“的哥”兼职“快递小哥”靠谱吗？<br />\r\n<br />\r\n□本报记者 吴佳妮<br />\r\n<br />\r\n从去年下半年开始，传统出租车行业遭遇“寒冬”。虽然杭州出租车改革已先行启动，但改革带来的红利是否能落到出租车一线驾驶员身上，还是个未知数。<br />\r\n<br />\r\n其实，一些乐于接受新事物，并爱钻研的出租车司机，已经开始琢磨“自救”。<br />\r\n<br />\r\n前天，记者在杭州沈半路出租车服务区意外发现，一款名为“顺便带”的APP软件虽未正式开通，但已有不少“的哥”颇感兴趣，兴致勃勃地想要兼职一把“快递小哥”。<br />\r\n<br />\r\n同城快递软件向“的哥”抛出橄榄枝<br />\r\n<br />\r\n前天中午，沈半路出租车服务区食堂内挤满了来吃饭的“的哥”，其中一个穿西装的小伙子，显得特别显眼。他叫雍树龙，是来服务区专门向“的哥”们介绍一款由他带队研发、名为“顺便带”的APP软件的。<br />\r\n<br />\r\n这款APP运行原理非常简单，只需下载注册后，就能在线上发布快递单，或者在线抢快递业务。值得一提的是，在接单员抢了快递单，并接到快递开始运送后，APP上会显示该快递员的实时路径，发布快递业务者可以直接监控。<br />\r\n<br />\r\n“我们主要做同城快递，而且是当日达。”雍树龙说，“因为一般来说，大家需要的东西，同城都能有，而且人人都可以是快递员。这样实时发布快递单，并由快递员直接抢单，效率更高。而且如果有快递需及时送达，比如文件之类的，也有了更多选择。”<br />\r\n<br />\r\n记者了解到，如果要送一份快递，该 APP上的起步价为5元(不含公里数)，另叠加每公里1.5元费用，“基本上一份同城快递，5公里左右，费用是12.5元。“雍树龙说，“如果自己开车送，时间、停车成本会更高，而传统快递业务，有的无法快速送达，有的费用相对较高。”<br />\r\n<br />\r\n每天兼职送快递，一个月能多赚近2000元<br />\r\n<br />\r\n这样一个类似于同城快递的APP，为什么会到出租车服务区推介呢？<br />\r\n<br />\r\n“我们主要看中出租车司机的可信度比较高。”雍树龙解释。<br />\r\n<br />\r\n他告诉记者，如果想在APP上接单，需要上传身份证等证件进行审核，而且平台承诺，如果有意外，无法从快递员中追回损失，那则由平台承担，“但我们还是希望平台上承接快递业务的人能靠谱些，出租车司机是比较合适的。”<br />\r\n<br />\r\n在雍树龙看来，此模式如果能在杭州成功推广，那么在其他城市也能够迅速落地，毕竟每个城市都有出租车司机。<br />\r\n<br />\r\n在服务区，也有蛮多出租车司机对此感兴趣，“出租车后备厢那么大，放几件快递完全没问题啊。”正在吃饭的“的哥”王师傅说，“有空的时候带一带，一天送五六个，也能多赚60多元，一个月多赚近2000元，听上去还不错。”<br />\r\n<br />\r\n多一条赚钱途径不错，但实际操作会有问题<br />\r\n<br />\r\n大多数“的哥”认为，在开车的同时，能够多一条赚钱的途径很不错，但实际操作起来，可能并不如想象中顺利。<br />\r\n<br />\r\n“有没有足够多的快递，可以让我们顺路去送。”杭州外事出租车公司的杨师傅说，“另外也担心在送的过程当中耽搁时间或出现问题。”<br />\r\n<br />\r\n对出租车司机来说，时间就是金钱，接快递必然要耗时，“如果接单送单一切顺利，到了地方直接给、直接取，那就没问题。”杨师傅说，“但如果双方衔接不够紧凑，需要等在那儿耗时间，那就有可能得不偿失了。”<br />\r\n<br />\r\n而且，在杭城停车位如此紧张的情况下，能否顺利找到停车位，也是关键。<br />\r\n<br />\r\n对此，雍树龙表示，目前平台公司已与“尚妆”等网站沟通，“已经基本谈妥，软件一旦正式发布，就能够接到快递业务。”<br />\r\n<br />\r\n也有人认为，类似的业务，可能骑电动车更合适，“我们会把快递运送工具细分出来。”雍树龙说，“有电动车这一选项，发布快递业务者可以自行选择，快递价格也会进行区分。但无论如何，肯定是出租车司机更保险些，快递一些重要的东西更安全。”<br />\r\n<br />\r\n能否创收还得看实践，不影响乘客是底线<br />\r\n<br />\r\n目前，该软件公司已与7家出租车公司进行商谈，并与多家电子商务网站接洽，预计一切顺利的话，一周后就能正式上线。届时如果有“的哥”兼职“快递小哥”，能够让钱包稍微鼓起来点吗？<br />\r\n<br />\r\n对此，杭州市出租车行业协会秘书长许增期表示，这是出租车服务的一个延伸，从目前现状来看，还无法判断是否有普遍推广的可能。<br />\r\n<br />\r\n而大众出租车公司相关负责人认为，这算是一个利好消息，但是否能真正让出租车司机创收，还是要看推广的力度和方向。<br />\r\n<br />\r\n记者也就此咨询了杭州市运管部门，了解到目前相关法律方面还是空白，但按现有法律法规，出租车司机在接快递业务的同时，必须不影响驾驶，并且确保服务到位，不能够侵犯乘客的利益。<br />', '', 0),
(11, 0, '<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	“双十一”购物大战还没打响，各家电商平台已经开始摩拳擦掌。和往年相比，跨境电商在今年更受关注。除了传统巨头淘宝、京东、亚马逊等，不少新创业的电商平台也加入了这片没有硝烟的“战场”，期望能在市场上抢分一杯羹。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	电商市场是否已经饱和？如何寻找跨境电商的蓝海？新创业的电商平台有无突围的可能性？中国式创业如何成功？\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	对于这些问题，新创业的电商企业如何看待？“双十一”前夕，本土创业企业优梦优电商平台开始试运行，优梦优董事长闫伟在美国旧金山湾区接受了记者采访。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	闫伟认为，在目前的市场竞争环境中，新的电商平台要发展，不仅要为消费者提供一个购物比如海淘的优质渠道，也要帮助中国企业、中国品牌升级换代。以前电商主要关注客户，现在需要转变思路，关注商品、研发商品。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	近年来，跨境电商平台的爆发式增长，为中国品牌走向世界提供了一个绝佳的机遇。中国电子商务研究中心9月发布的报告显示，2015年上半年，中国电子商务交易额达7.63万亿元，同比增长30.4%；其中，跨境电商交易规模达2万亿，同比增长42.8%。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	越来越多的中国企业加入到了跨境电商的行列中。仅2014年一年，中国跨境电商平台超过5000家，境内涉及跨境电商的企业超过20万家。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	在闫伟看来，电商平台通过自身的技术和传播优势，尤其是大数据分析技术，可以帮助中国企业重新定位、策划、包装、推广，更好地与顾客对接、塑造品牌形象、打造市场影响力。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	在“互联网+”的时代中，中国外贸的研发、生产、销售等各个环节都在发生变化。闫伟说，无论产业链如何变化，以创新为内核、以技术为手段，始终是电商企业突围的不二法则，“企业的品牌做出来了，网站上的商品畅销了，电商平台自然也就盈利了。”\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	优梦优计划2016年初在美国旧金山和洛杉矶设立两个仓库，正式在海外“扎根”。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	闫伟从1987年就开始创业，涉及过多个领域。作为中年“创客”，他认为，和过去相比，现在的创业者文化水平都很高，创业热情也很高。但是无论在哪里做生意，做什么生意，核心理念都是相通的，最重要的就是公司信用。“创业要成功，一是坚持，二是有个好团队”，闫伟说。\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	电商市场竞争如此激烈，如果失败如何面对？闫伟回答：“创业过程中难免犯错、失败，错了就重新来过，无非就是多走了一条弯路。失败本身就是成功的一部分。”\r\n</p>\r\n<p style="font-size:14px;font-family:宋体;color:#333333;text-indent:2em;background-color:#FFFFFF;">\r\n	“不大张旗鼓，摸着石头过河”——他这样形容初创电商企业应有的姿态。\r\n</p>', '', 0),
(12, 0, '<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	并肩作战的“通达系”兄弟要分出一二三来了。近来，圆通、申通等“通达系”兄弟动作频频酝酿突围大计。通过资本层面的运作加速上市进程成为企业共同的选择。分析认为，在快递新政刺激下，快递业将迎来并购潮，如何在政策利好下站在收购一方，成为企业面临的严峻考验。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;谁是第一\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;同属第二梯队的“通达系”快递企业从没像今天这样急于从中站出来。究竟谁是“通达系”的领军企业在他们眼里变得至关重要。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;圆通速递董事长喻渭蛟日前公开发声，称圆通占据中国整个快递市场21%的市场份额，跃居行业第一，今年业务量将达到33亿件以上，营业收入达到350亿元。紧接着中通快递也不甘示弱，称在今年过去的10个月中，中通有8个月占据行业业务量榜首。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;表面的口水战只是其一，更重要的是快递企业资本层面的大动作。10月底，北京商报记者发现，圆通已完成股权变更，董事会完成调整，阿里系拿下两个席位。分析认为，完成股权变更的圆通将加速上市进程。圆通方面负责人对此也直言不讳，表示正在积极准备上市。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;但让行业始料不及的是，停牌近两个月的艾迪西日前发布公告称，公司已经与申通快递有限公司股东达成收购申通快递股权的初步合作意向，并签署发行股份购买资产框架协议。这意味着，申通快递将有望借壳登陆深交所，成为国内快递第一股。而就在此前，申通刚刚与天天快递完成重组，实行双品牌运作战略。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;借资本超车\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;“通达系”争夺头名背后是行业将迎来巨震。第二梯队和谐共处的日子将一去不复返。在快递专家赵小敏看来，目前国内铺设全国性网络的快递企业太多，“包括EMS、顺丰在内，未来全国性快递企业不会超过10家”。有业内人士甚至坦言，“三通一达”未来能剩几家都未成定论。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;快递企业启动资本运作是在与时间赛跑，加速“跑马圈地”。根据统计数据显示，目前“通达系”业务中超过70%是电商件，电商件中六成以上又来自阿里系。在赵小敏看来，拿到阿里投资的圆通已经上岸，“圆通以股权换取了业务量上的话语权，而圆通航空的首航更为上市增添‘故事’砝码”。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;申通的“借壳上市”则直接打乱了行业节奏。“以借壳的形式上市足见申通的急迫，但也不失为一招妙棋。”有分析人士认为，拿到社会资本后，将有利于申通实现一体化做大做强，“申通快递网点势力一直比较强，但由于加盟商势力比较大，一些网点实际掌握在加盟商手里。申通需要资金支持来收购加盟网点，这或许是申通一直寻求上市的重要原因”。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;据北京商报记者统计，目前包括中通、圆通、韵达、百世汇通、宅急送、全峰等多家主流快递企业都在谋划上市进程。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;淘汰赛加速\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;除了快递企业在加速冲刺外，外界也频频释放利好消息。赵小敏认为，最新出台的政策都将加速行业整合，尤其是实名制、全面安检等规范的实施也将迅速提高快递业门槛，“从2016年开始，快递业将迎来并购潮”。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;上周，快递业迎来最高政策支持。国务院发布了《关于促进快递业发展的若干意见》（以下简称“意见”），鼓励各类资本依法进入快递领域，支持快递企业兼并重组、上市融资。赵小敏认为，意见对行业发展整体利好，尤其是对大中型快递公司，“对中小型快递企业而言则加速淘汰” 。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;“当行业发展到一定阶段后，发生整合将是必然的市场规律。”在圆通速递总裁相峰看来，大品牌具有更多的资源优势、服务质量以及安全性。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;“阿里入股圆通成为资本进入快递业前不得不考虑的现实问题。”在赵小敏看来，阿里的加入给快递业带来了投资壁垒。而就在日前，公安部联合15部门发文表示，要求在全国范围内开展危爆物品、寄递物流清理整顿和矛盾纠纷排查化解专项行动。在实施寄递实名制的同时实行安检等措施。\r\n</p>\r\n<p style="font-size:16px;color:#393939;font-family:宋体;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;行业的规范将使企业面临巨大的资金投入，这对于中小型企业而言无疑充满挑战。北京商报记者根据公开信息估算，仅硬件升级一项，快递业整体投入就超过百亿元。\r\n</p>', '', 0),
(13, 0, '<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	<span style="font-family:KaiTi_GB2312, KaiTi;">苏宁“财技”：剥离PPTV剑指独立上市</span>\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　见习记者倪雨晴广州报道\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　成立于2005年的PPTV，十年之后脱离苏宁财报，重新“独立”。10月30日，苏宁发布公告称，其下属境外子公司Great Universe Limited和苏宁文化投资管理公司(以下简称苏宁文化)签署股权转让协议，前者将其所持的PPTV 68.08%股权转让给苏宁文化或其指定的子公司，转让价约为25.88亿元。\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　11月2日，PPTV聚力管理委员会主席范志军发布内部信称，PPTV未来将谋求独立上市。他在信中写道：“伴随此次剥离，PPTV的股东结构更加切合要求，这将为公司登陆国内资本市场扫清障碍。”\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　据公告内容，PPTV此次转让的直接原因是阿里巴巴<a class="wt_article_link" href="http://weibo.com/aligroup?zw=finance" target="_blank">[微博]</a>对苏宁的战略投资。若苏宁和阿里巴巴的交易完成，阿里巴巴将成为苏宁第二大股东，公司股份中将出现间接的外资持股。为避免外商投资产业政策对 PPTV后续业务发展可能造成的影响和限制，所以出售 PPTV股权。事实上，也避免了优酷土豆和PPTV之间的同业竞争。\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　剥离的另一大原因与业绩相关。数据显示，PPTV今年前三季度共计亏损7.05亿元。此次“内部转让”也是苏宁将亏损转移，预计将增加净利润约10.4亿元。\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　范志军在回复21世纪经济报道记者采访时称，剥离对双方都是利好。文创产业是任何一个打算立足于互联网时代的领先者都决不会放弃的板块。“PPTV从苏宁剥离出来转向苏宁文化，有利于集中资源，推动零售与文创产业的重组和专业化运行，也将给予PPTV更多的战略发展空间和驱动力。”\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　速途研究院院长丁道师向记者分析，在线视频是任何一个科技互联网巨头都要布局的领域，但苏宁选择PPTV 有很大风险，现在剥离会提高苏宁的利润率。\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　这并不意味着苏宁要完全放弃PPTV。PPTV和苏宁文化结合，做在线娱乐等文化产业，会避免与苏宁集团之前的业务重合。“如果不分出来，PPTV就真的在苏宁内部没什么声音了。”丁道师说。\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　不过，苏宁系的“指导”能否让PPTV获得新生仍面临考验。控股PPTV，苏宁看中的是其流量和入口作用，目的是抢占客厅经济。亿欧网CEO黄渊普对记者说，导流是短期的，苏宁正在从渠道商转向服务商，现在渠道价值在降低，PPTV 能够帮助苏宁在电商等服务上做更多探索。虽然PPTV处于在线视频第二梯队，但是它在体育内容上的优势，对苏宁的文娱、体育等产业将有帮助。\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　此次从苏宁财报剥离，PPTV是否在入口、服务上完成兑现不得而知。丁道师对记者说，“PPTV在视频领域翻身的机会很小，苏宁没有完全押对牌。”\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　据记者了解，PPTV和苏宁的战略合作一直在继续。双方一方面打通苏宁和PPTV的已有会员，通过PP云大数据，准确地分析用户行为、为用户推送内容；另一方面，与苏宁O2O线下渠道打通，实体品牌可通过PPTV精准匹配线上用户到线下实体消费。\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　对于业务规划，范志军在内部信中称，“目前，我们的战略重心集中在硬件销售、体育产业和内容自制三大方向。”\r\n</p>\r\n<p style="font-size:16px;font-family:''Microsoft YaHei'', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;">\r\n	　　“视频、游戏、金融、硬件都可能是PPTV转型的方向，但现在看起来都有难度。”丁道师称，当前PPTV的主要难题是提升市占率和内容。如果转型效果不佳，未来PPTV不排除被其他公司收购的可能。\r\n</p>', '', 0),
(14, 0, '<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	(中国电子商务研究中心讯)王卫，这个被马云所敬佩的人，管理着顺丰20余万名员工的庞大快递王国。而在22年前，在王卫22岁的时候，他还是一个一文不名的穷小子。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　1993年的<a href="http://www.100ec.cn/zt/df/" target="_blank">广东</a><a href="http://www.100ec.cn/zt/df/" target="_blank">深圳</a>街头，经常会看到一个年轻的小伙子，骑着一辆摩托车穿行在小巷里。和其他人摩托车后座上坐的是美女不同，这辆摩托车的后座上全是包裹，这个小伙子，就是王卫。\r\n</p>\r\n<p align="center" style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	<img alt="1" src="http://img3.qianzhan123.com/news/201511/02/20151102-14328c4d38538945_600x5000.jpg" width="547" height="281" />\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　初时，王卫仅是受朋友所托，从<a href="http://www.100ec.cn/zt/df/" target="_blank">香港</a>将包裹免费运到<a href="http://www.100ec.cn/zt/df/" target="_blank">深圳</a>指定的人手中，回来时也将一些信件带到<a href="http://www.100ec.cn/zt/df/" target="_blank">香港</a>，得到的无非是朋友的友情和一顿吃请。久而久之，托王卫送包裹的人越来越多，又不好意思每次免费，于是“小打小闹”的塞给王卫一些红包。王卫也因此结识了众多好友，那时的王卫也从这些友情上看到了商机，既然市场需求这么大，能否成立一家小公司，专门做运送业务呢？\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　王卫将他的想法向经常托他送货的人咨询，得到的回答非常爽快，“如果是这样那就太好了，以后运送包裹的业务，就全交给你。”随后，王卫将想法向父亲诉说，父亲的支持使他得到了创业最初的10万港币。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　在香港砵兰街，王卫寻找到一间仅三十多平方米的小店面，有了立足之地，又联系平时关系比较好的朋友帮忙，将想法说出来，有的感兴趣，有的则不置可否，哈哈一笑。发现商机低价抢夺市场\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　最终，王卫与5个朋友合作，成立了专送快件的小公司。王卫和小伙伴们肩背大旅行包，手里拖着行李箱，一趟趟来往于深港两地。那时王卫提供的运送快件服务，仅收取40元，而同样的快件，其他竞争对手则为70元一件。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　刚刚起家的王卫，事实上也正是依靠低价策略，从竞争对手中抢得了一片小小的天空，迅速壮大。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　1993年3月26日，一家名为顺丰的公司在<a href="http://www.100ec.cn/zt/df/" target="_blank">广东</a>顺德正式注册成立。一段时间之后，顺丰已经在局部垄断了深港货运，在顺德到香港的陆路通道上，70%的快递件由顺丰承运。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　<strong>　“暴发户”的迷失</strong>\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　王卫在回忆这段艰辛的创业岁月时说，我22岁开始创办顺丰，25岁公司初具规模，算是赚得了第一桶金。可能有人会说王卫很难得，年轻得志，却没有头脑发热变成“土豪”。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　其实，我25岁的时候也曾经是一副标准的暴发户做派。我穷过，相当清楚贫穷和被人歧视的滋味。后来当我25岁赚到人生第一桶金之后，有点目空一切的感觉，恨不得告诉全<a href="http://www.100ec.cn/zt/world/" target="_blank">世界</a>，我王卫再也不是从前那个样子了，我也是有钱人了！\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　有了钱的王卫，和其他暴发户一样，花钱大手大脚。但暴发户的感觉并不能让王卫寻找到精神满足，王卫在回忆这一段精神空虚的时期，庆幸他找到了精神寄托：佛教。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　他说，“随着事业不断迈上新台阶，个人的眼界和心胸不一样了。这段时期要感谢我的太太，她在我得意忘形的时候，不断泼我冷水，让我保持清醒和冷静。最重要的一点，是佛教让人内心平静，并且读懂了里面的因果关系，能够让人醍醐灌顶。”\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　王卫在办公室里摆放了8尊佛像。或许是天天礼佛的原因，王卫行事逐渐稳健，并将顺丰快递引向更快的发展，却也导致了资金的急迫需求。民营企业素来贷款较难，王卫所面临的情况也不例外。而当时国内快递市场门槛较低，几个人，一台车，就可以去各个高档写字楼发传单，揽生意。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　快递业的迅猛发展，也造成了大量快递公司的出现，想要占领市场，必须尽快在国内布点。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　<strong>　新的眼界格局开拓国内市场</strong>\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　布局国内市场需要大量资金，王卫在银行很难得到充裕资金，于是不得不一次次将商铺或者是物业抵押给银行，这是最为快捷的获得贷款的方式。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　从银行拿到的钱，变成了全国各地的一个个网点，而竞争对手更为疯狂的开店方式，使得王卫只能一次次将物业押给银行，计有九次之多。快递业开设分公司最为疯狂的2005年，资金也成为限制顺丰发展的主要障碍。不开店，便会落后，王卫在想了三天三夜之后，将顺丰公司作抵押，向银行贷款420万元，以用于开拓国内业务。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　自此，基本上国内任何一个城市，都会有顺丰的快递网点，这在增强顺丰渠道的同时，也大大增强了获得快递单数的能力。如雪片飞来的快递件，让王卫开始动起了更大的念头：用飞机送快递。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　当时的国内快递市场，还没有一家快递公司敢于使用飞机作运输工具。他与国内一家航空公司谈判，问：“你有几架货运飞机？”对方答：“五架。”王卫说：“我全包了。”此后，顺丰快递的速度成为当时快递市场最快的，异地次日到达的口碑也第一次成为顺丰的代名词。在意识到飞机介入快递所引起的变革之后，王卫将购买飞机自组航空公司提上议程，并最终于2009年底，获得民航总局批准，顺丰航空公司正式开始运营，直接为顺丰速运的航空快递运输业务服务。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　飞机冲天，似乎是一个隐喻，顺丰也进入了一个快速发展期。在王卫的战略布局图中，国内速递、<a href="http://www.100ec.cn/zt/world/" target="_blank">国际</a>快递、仓储、顺丰航空仅仅是其占比1/3的格局，他将顺丰的触角延伸向更大的商业帝国，即包括B2B、B2C、C2B、<a href="http://www.100ec.cn/zt/shfwo2o/" target="_blank">O2O</a>的全零售布局，同时随之配套的还有金融、移动互联、<a href="http://www.100ec.cn/zt/hlwsw/" target="_blank">大数据</a>战略。王卫对此则用一句话描述了顺丰的蓝图：“打造物流领域的‘百货公司’”。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　顺丰是否能够完成王卫的布局？竞争对手那里的评价最为客观。本刊记者联系到一位不愿透露姓名的某快递公司副总经理，他对此表示，“顺丰的每一次发展，确实都走在了行业的最前沿，这意味着我们不得不紧跟在王卫的身后。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　某种程度上而言，先发优势确实占尽先机，但同时也意味着危险。因此，顺丰的布局能否达成？这个问题不如换个角度，就是领头羊顺丰是否会犯错，他若犯错，那么行业内这么多同类型企业，就会一涌而上，占领市场。”\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　可能也正是因为这个原因，上述人士所在的公司，一直稳扎稳打，虽然没有特别出彩之处，但是也占据国内快递行业前五名的位置。(来源：前瞻网）\r\n</p>', '', 0),
(15, 0, '<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	(中国电子商务研究中心讯)成为<a href="http://www.100ec.cn/zt/B2C/" target="_blank">京东</a>掌门人之前，刘强东主要有三段工作经历：开饭馆、进日企、卖光碟。\r\n</p>\r\n<p align="center" style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	<img alt="1" src="http://img3.qianzhan123.com/news/201511/02/20151102-8ce49f7aa37a65bb_600x5000.jpg" width="401" height="484" /> \r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　家境贫寒的刘强东刚进大学时，只带了亲戚朋友凑的500块钱，然而大三时，他已靠给别人写编程拥有了一部2.6万的“大哥大”。靠编程积累的第一桶金，刘强东开了一家小饭馆，但由于缺乏管理和监督，钱几乎被员工贪光了，最后亏损20多万。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　在Japan Life工作了两年，又做了几份编程方面的工作，终于还清债的刘强东手拿1.2万块再次创业。他在中关村租下了一张低价柜台，卖光碟等消费电子品，柜名取作“<a href="http://www.100ec.cn/zt/B2C/" target="_blank">京东</a>多媒体”，这便是京东商城的前身。到2003年，他已经开了12家分店，赚到了1000多万元人民币。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	##分页##\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　<strong>34岁时经历“一夜白头”</strong> \r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　微胖、浓眉、圆脸，40岁的刘强东看上去像一个“萌憨”的青年，唯一给这张面孔增添了“老板”气质的，或许就是额前的小撮白发吧。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　上个月刘强东在母校<a href="http://www.100ec.cn/zt/zf/" target="_blank">人大</a>演讲时，专门提到了白发的来历。2008年，第一轮融资用光后的京东面临着倒闭的危险，正值金融危机之时，没有人愿意掏钱给一个不知何时能盈利的企业。那段时间，刘强东一天见五个投资人，说同样的话，得到的回答也是一样：走吧，走吧。“骨子那种恐惧感，还有那种对兄弟们那种愧疚、羞愧，带来的痛苦可以说是无法言喻的。”就这样，一个月之间，刘强东便愁白了头，直到现在也没有重新变黑。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　<strong>　每年都会当一天快递员</strong> \r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　收到快递时，只顾签收，不爱搭理快递员？在京东购物的话，这个习惯可得改改了。刘强东每年都会当一回快递员，亲自派送几十个快件，若是正赶巧送到你家门口，可别错过难得一遇的跟老板砍价的机会。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　2011年，刘强东还曾高调地在<a href="http://www.100ec.cn/zt/dswb/" target="_blank">微博</a>上称，“如果转发<a href="http://www.100ec.cn/zt/dswb/" target="_blank">微博</a>，还能当场认出东哥，50%off。”是不是作秀暂且不提，刘强东对物流的重视绝不是盖的，不光是他自己，连新入职的员工，也都要求从基层快递员干起。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　京东推出“211限时送达”之后，刘强东经常赶在10:48分这样的时间拍下货品，以检验配送效果。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　<strong>不得不说的三段恋情</strong> \r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　绯闻是名<a href="http://www.100ec.cn/zt/zf/" target="_blank">人大</a>佬躲不开的话题，对于40岁前依然单身的刘强东来说，若不是因为抢了广大男屌丝的“女神”，其扒来扒去也不过三、四段的绯闻，也实在不值一提。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　巧的是，刘强东的恋情总与京东的发展多少有些关系。初恋“官二代”龚小京是他的创业合伙人，也成就了“京东”的名字。其后“西红柿门”女主角、刘强东的下属庄佳，则见证了京东的快速崛起。而如今随着“东天恋”的大白于世，京东也已经提交了招股书，准备登陆<a href="http://www.100ec.cn/zt/world/" target="_blank">美国</a>股市。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　除了坊间广为流传的以上三段恋情，刘强东还被曝有婚史，并有一个8岁的儿子。在宁夏卫视《财富人生》2010年11月6日所做的“刘强东特辑”中，刘强东曾大方承认“儿子四岁多了”，还表示“从小到大，唯一觉得愧疚的就是他。”但孩子母亲是谁，刘强东是否结过婚，却不得而知。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	<strong>　　喜欢越野，开黑色悍马H2</strong> \r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　开着心爱的悍马H2独闯沙漠，是刘强东的最为上瘾的爱好。粗犷、狂野、肾上腺指数极高的越野项目同以“二、楞、硬”著称的刘强东很是契合。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　2010年，他参加的车队从<a href="http://www.100ec.cn/zt/df/" target="_blank">北京</a>出发去拉萨，途中多地闹洪灾，队员都被吓退了，最终只有他一个人抵达了目的地。刘强东还经常带着方便面、火腿和帐篷闯沙漠，一走就是两个月。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　2011年9月，当京东商城即将赴美<a href="http://www.100ec.cn/zt/dszb/" target="_blank">IPO</a>的消息轰动江湖之时，刘强东没作任何回应。10月，一张他独自站在沙漠里的照片公布，下面只配了两个字——孤独。爱在自家网站购物，累计消费100多万\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　在照顾自家生意这一点上，刘强东可谓十分精明。在接受采访时他曾表示，买东西90%都在京东网购，而且自己下单，偶尔也会去竞争对手那里体验一下。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　过去七八年间，刘强东在网上累计的消费共有100多万，其中最大件的是送给父母的约8万元的80英寸电视机。这一消息可能给广大屌丝们带去一丝安慰——身价百亿的人不过也在网上“淘”东西嘛，没准也得为了免邮凑单呢。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　说归说，刘强东自己也承认，他确实喜欢淘便宜货，打折季会在网站上买十多件几十块钱的<a href="http://www.100ec.cn/zt/fzh/" target="_blank">T恤</a>。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　<strong>　小时候爱吃红烧肉，如今喜素食</strong> \r\n</p>\r\n<p align="center" style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	<strong><img alt="1" src="http://img3.qianzhan123.com/news/201511/02/20151102-c6b038f6e5a14b81_600x5000.jpg" width="274" height="300" /></strong> \r\n</p>\r\n<p align="center" style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　童年时期的刘强东\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　哪怕如今身价几十亿，贫穷仍是刘强东挥之不去的记忆。刘强东出生在<a href="http://www.100ec.cn/zt/df/" target="_blank">江苏</a>宿迁的<a href="http://www.100ec.cn/zt/sndsh/" target="_blank">农村</a>，小时候<a href="http://www.100ec.cn/zt/rcpd/" target="_blank">学校</a>穷得四周没有强，一年也吃不上几次肉。而当时他因有一个亲戚在镇政府食堂上班的关系，曾有幸尝到红烧肉的味道，肥腻的诱惑曾是他走出<a href="http://www.100ec.cn/zt/sndsh/" target="_blank">农村</a>的动力。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　而如今，功成名就的刘强东更喜欢吃清淡、少盐的素食，由家里的厨师做好，每日带到办公室吃。FT记者曾列出了与其共进午餐的菜单：玉米、红薯各一小块，素炒白菜、山药片炒丝瓜，一碟宿迁小咸鱼，一碗粥以及草莓、小圣女果。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　赴哥伦比亚大学游学期间，刘强东爆出的菜谱更加简单——早餐牛奶加上鸡蛋，中午水煮白菜，晚餐牛奶加蓝莓。就这样，刘强东6个月减了36斤，瘦成了一道闪电。当然，不清楚让他下狠心减肥的，有没有爱情的力量。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　<strong>关于刘强东，还有哪些你不知道的？</strong> \r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　在<a href="http://www.100ec.cn/zt/world/" target="_blank">中国</a>电商界，刘强东被誉为“打不死的小强”，对外展现的大都是铁腕、强硬、霸气的形象。早期的合作伙伴回忆道，在京东办公室的走廊里，这个胖胖的年轻人把自己的照片挂得到处都是。在他们看来，这反映出刘强东的自负与大胆。刘强东还曾是微博发烧友，粉丝超过200万，在他的微博多产期，几乎每一条都会被记者弄成新闻。\r\n</p>\r\n<p style="color:#0E0A0A;font-family:宋体;font-size:14px;background-color:#FBFCFE;">\r\n	　　硬汉也有柔情、萌呆的一面，刘强东的桌子上，摆有十几张儿子的照片。他偶尔也会将自己的自拍照传到网上。另外，他还喜欢游泳和钓鱼，会演奏乐器，在街边帮卖艺小伙弹过贝斯。2013年，刘强东还当上了<a href="http://www.100ec.cn/zt/df/" target="_blank">上海</a>市政协委员，从政是他大学之前一直的梦想。(来源：前瞻网）\r\n</p>', '', 0),
(21, 0, '子文档测试子文档测试子文档测试子文档测试子文档测试子文档测试子文档测试子文档测试子文档测试', '', 0),
(22, 0, '子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试子文档第二次测试', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_document_download`
--

CREATE TABLE IF NOT EXISTS `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

--
-- 转存表中的数据 `onethink_document_download`
--

INSERT INTO `onethink_document_download` (`id`, `parse`, `content`, `template`, `file_id`, `download`, `size`) VALUES
(16, 0, 'vim命令打印版', '', 1, 0, 14890),
(17, 0, '实践审批表v1', '', 2, 0, 38400),
(18, 0, 'GIMP_实用教程---1文件的打开和存储', '', 3, 0, 1677520),
(19, 0, 'GIMP_实用教程---2旋转', '', 4, 0, 2091098),
(20, 0, 'GIMP_实用教程---4色阶的调整', '', 5, 1, 1694917);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_file`
--

CREATE TABLE IF NOT EXISTS `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `onethink_file`
--

INSERT INTO `onethink_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `create_time`) VALUES
(1, 'vim命令打印版.docx', '5639b75776654.docx', '2015-11-04/', 'docx', 'application/vnd.openxmlformats-officedoc', 14890, 'e24677a1e35f3703e52192ef08fc9a87', '30f60eeb3dcb8dd6a024823d14ad6af531d91058', 0, 1446623063),
(2, '实践审批表v1.doc', '5639b777b8099.doc', '2015-11-04/', 'doc', 'application/msword', 38400, 'a4351cc1a9f3c77aafbe9cddf7ab2e48', '9ee4cb3e07c4698a546dbe30ec1ebe752fe33c1b', 0, 1446623095),
(3, 'GIMP_实用教程---1文件的打开和存储.docx', '5639b7b529087.docx', '2015-11-04/', 'docx', 'application/vnd.openxmlformats-officedoc', 1677520, '09f212f65e64e9b172aa3f01187985cb', '9cb182bae47a75df03f6da1c87e588c66036eabd', 0, 1446623157),
(4, 'GIMP_实用教程---2旋转.docx', '5639b7c94b5fa.docx', '2015-11-04/', 'docx', 'application/vnd.openxmlformats-officedoc', 2091098, '73e1211ce127d42e01e6d07bf8478c60', 'edfecac0cd829336a7e36b3bd5abfc3680ab0867', 0, 1446623177),
(5, 'GIMP_实用教程---4色阶的调整.docx', '5639b7e35284a.docx', '2015-11-04/', 'docx', 'application/vnd.openxmlformats-officedoc', 1694917, '22327eaa0bfc01c9dd4c68abefa2549e', '9ee987d9bdff87b36a1e9ae99a83ca0556490ac8', 0, 1446623203);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_hooks`
--

CREATE TABLE IF NOT EXISTS `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `onethink_hooks`
--

INSERT INTO `onethink_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, ''),
(17, 'Message', '在线留言提交钩子', 1, 0, 'Message');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_member`
--

CREATE TABLE IF NOT EXISTS `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_member`
--

INSERT INTO `onethink_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', 0, '0000-00-00', '', 30, 7, 0, 1445657400, 2130706433, 1446621601, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_menu`
--

CREATE TABLE IF NOT EXISTS `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

--
-- 转存表中的数据 `onethink_menu`
--

INSERT INTO `onethink_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0),
(2, '内容', 0, 2, 'Article/mydocument', 0, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(93, '其他', 0, 5, 'other', 1, '', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0),
(122, '示例模型', 0, 99, 'Demo/index', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_message`
--

CREATE TABLE IF NOT EXISTS `onethink_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '留言名称',
  `summary` varchar(255) NOT NULL DEFAULT '' COMMENT '留言内容',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `qq` varchar(100) NOT NULL DEFAULT '' COMMENT 'QQ',
  `phone` varchar(100) NOT NULL DEFAULT '' COMMENT '电话',
  `addr` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型分组 1:投诉、建议 2:问题咨询 3:其他',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `reply_info` text NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='留言板表' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_model`
--

CREATE TABLE IF NOT EXISTS `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_model`
--

INSERT INTO `onethink_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `onethink_picture`
--

CREATE TABLE IF NOT EXISTS `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `onethink_picture`
--

INSERT INTO `onethink_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2015-10-30/563337fb34161.jpg', '', 'e1a076c5b5c60c9a53110ebb7adc62ad', '5c021e09c6599a148bd555a80a3d927f60c5fced', 1, 1446197243),
(2, '/Uploads/Picture/2015-11-04/5639a9b78cd21.jpg', '', '7e6a2731829994afa36e1ed1397fd210', 'f72848e6bb39de5fa20080c3025fa4e21ec478b7', 1, 1446619575),
(3, '/Uploads/Picture/2015-11-04/5639aa8d63322.jpg', '', '16448cd6ec7af958e948e07267798042', 'fd6d8d31c8dc583f083737a0c783eed5c75d912b', 1, 1446619789);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `onethink_ucenter_member`
--

INSERT INTO `onethink_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', 'a9b4ad048c33807db124a359ddcaf534', '492948155@qq.com', '', 1445657400, 2130706433, 1446621601, 2130706433, 1445657400, 1);

-- --------------------------------------------------------

--
-- 表的结构 `onethink_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_url`
--

CREATE TABLE IF NOT EXISTS `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `onethink_userdata`
--

CREATE TABLE IF NOT EXISTS `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
