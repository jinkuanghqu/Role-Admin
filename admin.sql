/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : admin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-20 17:59:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '管理员姓名',
  `email` varchar(255) NOT NULL COMMENT '管理员邮箱',
  `role_id` int(11) NOT NULL COMMENT '用户组ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(1启用,0未启用)',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间戳',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '最新修改时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manage_email` (`email`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin@vip.126.cn', '6', '1', '235310a823b04a4fc63a3d26f27a6b382ecb834d', '1455702916', '1513763843');

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `log` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin` (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('61', '1', 'admin', '1513763236', '127.0.0.1', '登录');
INSERT INTO `admin_log` VALUES ('62', '1', 'admin', '1513763333', '127.0.0.1', '删除菜单：[238,271,61,63,64,65,66,67,69,176,177,178,179,90,114,115,275,274,94,95,105,118,119,120,121,122,152,172,277,276,273] 成功！');
INSERT INTO `admin_log` VALUES ('63', '1', 'admin', '1513763339', '127.0.0.1', '登出');
INSERT INTO `admin_log` VALUES ('64', '1', 'admin', '1513763342', '127.0.0.1', '登录');
INSERT INTO `admin_log` VALUES ('65', '1', 'admin', '1513763434', '127.0.0.1', '删除菜单：[124,70,85,199,200,201,203,204] 成功！');
INSERT INTO `admin_log` VALUES ('66', '1', 'admin', '1513763453', '127.0.0.1', '删除菜单：[123,125,126,127,128,129,130] 成功！');
INSERT INTO `admin_log` VALUES ('67', '1', 'admin', '1513763459', '127.0.0.1', '登出');
INSERT INTO `admin_log` VALUES ('68', '1', 'admin', '1513763461', '127.0.0.1', '登录');
INSERT INTO `admin_log` VALUES ('69', '1', 'admin', '1513763569', '127.0.0.1', '登出');
INSERT INTO `admin_log` VALUES ('70', '1', 'admin', '1513763572', '127.0.0.1', '登录');
INSERT INTO `admin_log` VALUES ('71', '1', 'admin', '1513763639', '127.0.0.1', '登出');
INSERT INTO `admin_log` VALUES ('72', '1', 'admin', '1513763641', '127.0.0.1', '登录');
INSERT INTO `admin_log` VALUES ('73', '1', 'admin', '1513763761', '127.0.0.1', '登出');
INSERT INTO `admin_log` VALUES ('74', '1', 'admin', '1513763763', '127.0.0.1', '登录');
INSERT INTO `admin_log` VALUES ('75', '1', 'admin', '1513763840', '127.0.0.1', '登出');
INSERT INTO `admin_log` VALUES ('76', '1', 'admin', '1513763842', '127.0.0.1', '登录');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '权限',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '权限名称',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `islink` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否菜单',
  `sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_url` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('8', '0', 'System', '系统管理', 'glyphicon glyphicon-paperclip', '1', '99');
INSERT INTO `auth_rule` VALUES ('7', '0', 'Index/index', '控制台', 'glyphicon glyphicon-home', '1', '0');
INSERT INTO `auth_rule` VALUES ('9', '8', 'Menu/index', '菜单管理', '', '1', '1');
INSERT INTO `auth_rule` VALUES ('10', '8', 'Menu/add', '添加菜单', '', '1', '2');
INSERT INTO `auth_rule` VALUES ('11', '8', 'Menu/verifyname', '验证菜单链接', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('12', '8', 'Menu/edit', '修改菜单', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('13', '8', 'Menu/destroy', '删除菜单', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('14', '7', 'Index/main', '后面首页', '', '1', '0');
INSERT INTO `auth_rule` VALUES ('15', '0', 'Admin', '用户及组', 'glyphicon glyphicon-user', '1', '0');
INSERT INTO `auth_rule` VALUES ('16', '15', 'Admin/index', '用户管理', '', '1', '0');
INSERT INTO `auth_rule` VALUES ('17', '15', 'Admin/add', '新增用户', '', '1', '1');
INSERT INTO `auth_rule` VALUES ('24', '7', 'Index/clearCache', '清除缓存', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('18', '15', 'Admin/edit', '用户修改', '', '0', '2');
INSERT INTO `auth_rule` VALUES ('19', '15', 'Admin/destroy', '删除用户', '', '0', '3');
INSERT INTO `auth_rule` VALUES ('20', '15', 'Role/index', '用户组管理', '', '1', '4');
INSERT INTO `auth_rule` VALUES ('21', '15', 'Role/edit', '修改用户组', '', '0', '6');
INSERT INTO `auth_rule` VALUES ('22', '15', 'Role/add', '新增用户组', '', '1', '5');
INSERT INTO `auth_rule` VALUES ('23', '15', 'Role/destroy', '用户组删除', '', '0', '7');
INSERT INTO `auth_rule` VALUES ('25', '8', 'Menu/sort', '修改菜单排序', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('26', '15', 'Admin/verifyemail', '验证邮箱', '', '0', '3');
INSERT INTO `auth_rule` VALUES ('57', '56', '/admin/message/sendMessage', '发消息', '', '0', '1');
INSERT INTO `auth_rule` VALUES ('59', '56', '/admin/message/unsentMessage', '待发消息', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('60', '56', '/admin/message/haSendMessage', '已发消息', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('62', '7', 'Index/mainTestView', '后台视图样例', '', '1', '255');
INSERT INTO `auth_rule` VALUES ('71', '8', 'System/verifyKey', '自定义名称验证', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('159', '7', 'Index/download', '下载', '', '0', '255');
INSERT INTO `auth_rule` VALUES ('202', '8', 'Seo/destroy', '删除页面搜索引擎优化', '', '0', '255');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(20) NOT NULL COMMENT '菜单名称',
  `url` varchar(50) DEFAULT NULL COMMENT 'url',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用(1启用,0未启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '注释',
  `sort` smallint(6) unsigned DEFAULT NULL COMMENT '排序',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '菜单等级(1模块,2操作)',
  PRIMARY KEY (`id`),
  KEY `level` (`level`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '权限管理', '', 'icon-ios', '1', '权限管理呀', '1', '0', '1');
INSERT INTO `menu` VALUES ('2', '角色管理', '/Admin/Rbac/roleManage', 'icon-ios', '1', '角色管理呀', '1', '1', '2');
INSERT INTO `menu` VALUES ('3', '系统管理', '', 'icon-cps-3', '1', null, '0', '0', '1');
INSERT INTO `menu` VALUES ('4', '商品管理', '#', 'icon-cps-2', '1', null, '2', '0', '1');
INSERT INTO `menu` VALUES ('5', '管理员管理', '/Admin/Rbac/adminManage', '', '1', null, '0', '1', '2');
INSERT INTO `menu` VALUES ('6', '节点管理', '/Admin/Rbac/nodeManage', '', '1', null, '5', '1', '2');
INSERT INTO `menu` VALUES ('7', '菜单管理', '/Admin/Rbac/menuManage', '', '1', null, '0', '1', '2');
INSERT INTO `menu` VALUES ('8', '商品列表', '/Admin/Goods/index', '', '1', null, '50', '4', '2');
INSERT INTO `menu` VALUES ('9', '类目列表', '/Admin/Category/index', '', '1', null, '45', '4', '2');
INSERT INTO `menu` VALUES ('10', '品牌列表', '/Admin/Brand/index', '', '1', null, '40', '4', '2');
INSERT INTO `menu` VALUES ('11', '规格列表', '/Admin/Spec/index', '', '1', null, '35', '4', '2');
INSERT INTO `menu` VALUES ('12', '订单管理', '#', 'icon-auto-renew', '1', null, '0', '0', '1');
INSERT INTO `menu` VALUES ('13', '会员管理', '#', 'icon-account-2', '1', null, '0', '0', '1');
INSERT INTO `menu` VALUES ('14', '营销管理', '#', 'icon-text-free', '1', null, '0', '0', '1');
INSERT INTO `menu` VALUES ('15', '店铺管理', '#', 'icon-ots', '1', null, '0', '0', '1');
INSERT INTO `menu` VALUES ('16', '采购单管理', '#', 'icon-list-close', '1', null, '0', '0', '1');
INSERT INTO `menu` VALUES ('17', '配送管理', '/Admin/Delivery/dlist', '', '1', null, '0', '3', '2');
INSERT INTO `menu` VALUES ('18', '支付方式管理', '/Admin/UsablePayment/plist', '', '1', null, '0', '3', '2');
INSERT INTO `menu` VALUES ('19', '店铺列表', '/Admin/Store/index', '', '1', null, '50', '15', '2');
INSERT INTO `menu` VALUES ('20', '消息中心', '#', 'icon-wo-email', '1', null, '0', '0', '1');
INSERT INTO `menu` VALUES ('21', '发信息', '/admin/message/sendMessage', '', '1', null, '4', '20', '2');
INSERT INTO `menu` VALUES ('23', '未发送的消息', '/admin/message/unsentMessage', '', '1', null, '3', '20', '2');
INSERT INTO `menu` VALUES ('28', '已发送的消息', '/admin/message/haSendMessage', '', '1', null, '2', '20', '2');
INSERT INTO `menu` VALUES ('25', '用户列表', '/Admin/User/index', '', '1', null, '0', '13', '2');
INSERT INTO `menu` VALUES ('26', '店铺等级列表', '/Admin/StoreGrade/index', '', '1', null, '35', '15', '2');
INSERT INTO `menu` VALUES ('27', '会员等级', '/Admin/User/userGrade', '', '1', null, '0', '13', '2');
INSERT INTO `menu` VALUES ('29', '自定义变量', '/Admin/System/Variable', '', '1', '', '0', '3', '1');
INSERT INTO `menu` VALUES ('30', '规格列表', '/Admin/Spec/index', '', '1', null, '5', '11', '2');
INSERT INTO `menu` VALUES ('31', '订单列表', '/Admin/Order/index', '', '1', null, '10', '12', '2');
INSERT INTO `menu` VALUES ('32', '优惠券管理', '/Admin/Coupon/index', '', '1', null, '0', '14', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `pid` smallint(6) DEFAULT NULL COMMENT '父ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态(1启用,0未启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='角色表(用户组)';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('6', '系统管理员', null, '1', '系统管理员');

-- ----------------------------
-- Table structure for role_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `role_auth_rule`;
CREATE TABLE `role_auth_rule` (
  `auth_rule_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`auth_rule_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_auth_rule
-- ----------------------------
INSERT INTO `role_auth_rule` VALUES ('7', '6');
INSERT INTO `role_auth_rule` VALUES ('8', '6');
INSERT INTO `role_auth_rule` VALUES ('9', '6');
INSERT INTO `role_auth_rule` VALUES ('10', '6');
INSERT INTO `role_auth_rule` VALUES ('11', '6');
INSERT INTO `role_auth_rule` VALUES ('12', '6');
INSERT INTO `role_auth_rule` VALUES ('13', '6');
INSERT INTO `role_auth_rule` VALUES ('14', '6');
INSERT INTO `role_auth_rule` VALUES ('15', '6');
INSERT INTO `role_auth_rule` VALUES ('16', '6');
INSERT INTO `role_auth_rule` VALUES ('17', '6');
INSERT INTO `role_auth_rule` VALUES ('18', '6');
INSERT INTO `role_auth_rule` VALUES ('19', '6');
INSERT INTO `role_auth_rule` VALUES ('20', '6');
INSERT INTO `role_auth_rule` VALUES ('21', '6');
INSERT INTO `role_auth_rule` VALUES ('22', '6');
INSERT INTO `role_auth_rule` VALUES ('23', '6');
INSERT INTO `role_auth_rule` VALUES ('24', '6');
INSERT INTO `role_auth_rule` VALUES ('25', '6');
INSERT INTO `role_auth_rule` VALUES ('26', '6');
INSERT INTO `role_auth_rule` VALUES ('62', '6');
INSERT INTO `role_auth_rule` VALUES ('70', '6');
INSERT INTO `role_auth_rule` VALUES ('71', '6');
INSERT INTO `role_auth_rule` VALUES ('85', '6');
INSERT INTO `role_auth_rule` VALUES ('90', '6');
INSERT INTO `role_auth_rule` VALUES ('94', '6');
INSERT INTO `role_auth_rule` VALUES ('95', '6');
INSERT INTO `role_auth_rule` VALUES ('105', '6');
INSERT INTO `role_auth_rule` VALUES ('114', '6');
INSERT INTO `role_auth_rule` VALUES ('115', '6');
INSERT INTO `role_auth_rule` VALUES ('118', '6');
INSERT INTO `role_auth_rule` VALUES ('119', '6');
INSERT INTO `role_auth_rule` VALUES ('120', '6');
INSERT INTO `role_auth_rule` VALUES ('121', '6');
INSERT INTO `role_auth_rule` VALUES ('122', '6');
INSERT INTO `role_auth_rule` VALUES ('123', '6');
INSERT INTO `role_auth_rule` VALUES ('124', '6');
INSERT INTO `role_auth_rule` VALUES ('125', '6');
INSERT INTO `role_auth_rule` VALUES ('126', '6');
INSERT INTO `role_auth_rule` VALUES ('127', '6');
INSERT INTO `role_auth_rule` VALUES ('128', '6');
INSERT INTO `role_auth_rule` VALUES ('129', '6');
INSERT INTO `role_auth_rule` VALUES ('130', '6');
INSERT INTO `role_auth_rule` VALUES ('152', '6');
INSERT INTO `role_auth_rule` VALUES ('159', '6');
INSERT INTO `role_auth_rule` VALUES ('172', '6');
INSERT INTO `role_auth_rule` VALUES ('199', '6');
INSERT INTO `role_auth_rule` VALUES ('200', '6');
INSERT INTO `role_auth_rule` VALUES ('201', '6');
INSERT INTO `role_auth_rule` VALUES ('202', '6');
INSERT INTO `role_auth_rule` VALUES ('203', '6');
INSERT INTO `role_auth_rule` VALUES ('204', '6');
INSERT INTO `role_auth_rule` VALUES ('238', '6');
INSERT INTO `role_auth_rule` VALUES ('273', '6');
INSERT INTO `role_auth_rule` VALUES ('274', '6');
INSERT INTO `role_auth_rule` VALUES ('275', '6');
INSERT INTO `role_auth_rule` VALUES ('276', '6');
INSERT INTO `role_auth_rule` VALUES ('277', '6');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL COMMENT '角色ID',
  `user_id` char(32) DEFAULT NULL COMMENT '用户ID',
  KEY `group_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色用户对应表';

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('bmuaj8ea2v5muoihtjrl34ptc2', '1480645955', 0x686F6D655F7C613A313A7B733A343A2275736572223B613A313A7B733A373A22757365725F6964223B693A303B7D7D);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `key` varchar(100) NOT NULL COMMENT '变量',
  `value` tinytext NOT NULL COMMENT '值',
  `sort` tinyint(255) NOT NULL COMMENT '0系统，1自定义',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `group` char(10) NOT NULL DEFAULT 'main' COMMENT '分组',
  `input_types` char(10) NOT NULL DEFAULT 'text' COMMENT '输入框类型 ',
  `check` varchar(50) DEFAULT 'required',
  PRIMARY KEY (`key`),
  KEY `k` (`key`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('DEFAULTIMAGE', './Public/uploads/2016-03-07/2016-03-07.14573294458241.jpg', '1', '后台默认图片', 'display', 'file', 'required');
INSERT INTO `setting` VALUES ('IFRAME_BODY_SETTIME', '1000', '1', '后台锁定时间', 'main', 'number', 'required');
INSERT INTO `setting` VALUES ('title', '测试网站标题', '0', '网站标题', 'main', 'text', 'required');
INSERT INTO `setting` VALUES ('sitename', '测试标题', '0', '网站SEO标题', 'main', 'text', 'required');
INSERT INTO `setting` VALUES ('keywords', '测试关键词', '0', '关键词', 'main', 'text', 'required');
INSERT INTO `setting` VALUES ('description', '测试描述ada', '0', '网站描述', 'main', 'textarea', 'required');
INSERT INTO `setting` VALUES ('footer', '底部内容', '0', '底部内容', 'main', 'textarea', 'required');
INSERT INTO `setting` VALUES ('MAIL_HOST', 'smtp.exmail.qq.com', '2', '邮件smtp服务器的名称', 'email', 'text', 'required');
INSERT INTO `setting` VALUES ('MAIL_SMTPAUTH', 'TRUE', '2', '是否启用SMTP认证', 'email', 'radio', 'required');
INSERT INTO `setting` VALUES ('MAIL_USERNAME', 'service@sinob2b.com', '2', '发件人邮箱名', 'email', 'text', 'required');
INSERT INTO `setting` VALUES ('MAIL_FROM', 'service@sinob2b.com', '2', '发件人地址', 'email', 'text', 'required');
INSERT INTO `setting` VALUES ('MAIL_FROMNAME', 'sinob2b', '2', '发件人姓名', 'email', 'text', 'required');
INSERT INTO `setting` VALUES ('MAIL_PASSWORD', 'Sinob2b', '2', '邮箱密码', 'email', 'password', 'required');
INSERT INTO `setting` VALUES ('MAIL_CHARSET', 'utf8', '2', '设置邮件编码', 'email', 'hidden', 'required');
INSERT INTO `setting` VALUES ('MAIL_ISHTML', 'TRUE', '2', '是否HTML格式邮件', 'email', 'hidden', 'required');
INSERT INTO `setting` VALUES ('CATEGORY_GOODS_NUM', '20', '1', '前台商品默认显示数量', 'display', 'number', 'required');
INSERT INTO `setting` VALUES ('INDEX_SAVE_BIG_CATEGORY_ID', '77', '5', '首页 SAVE BIG 分类内容', 'display', 'text', 'required');
INSERT INTO `setting` VALUES ('NO_LOGIN_CATR_MAX_LIFE_TIME', '10000', '5', '未登录用户在购物车中商品记录时间', 'display', 'number', 'required');
INSERT INTO `setting` VALUES ('REGISTRATION_AGREEMENT', '卓创资讯用户注册协议\r\n\r\n\r\n1、卓创资讯服务条款确认\r\n卓创资讯的各项网络电子服务的所有权和运营权归山东卓创资讯集团，任何单位和个人非经本公司授权不得以本公司及其所有的网站名义进', '1', '用户注册协议', 'main', 'textarea', 'required');
INSERT INTO `setting` VALUES ('GOODS_DEFAULT_STAR', '5', '123', '商品默认星级', 'main', 'number', 'required');
INSERT INTO `setting` VALUES ('UPLOAD_IMG_MAX_SIZE', '1024', '127', '上传附件大小(KB)', 'main', 'number', 'required');
INSERT INTO `setting` VALUES ('UPLOAD_IMG_COUNT', '2', '127', '单次上传图片张数', 'main', 'text', 'required');
INSERT INTO `setting` VALUES ('earnestProp', '0.3', '0', '采购单定金比例', 'main', 'text', 'required');
INSERT INTO `setting` VALUES ('POINTS_BY_PURE_TEXT_COMMENT', '2', '123', '纯文字评论获取积分', 'main', 'number', 'required');
INSERT INTO `setting` VALUES ('POINTS_BY_TEXT_IMAGE_COMMENT', '4', '124', '文字+图片评论获取积分', 'main', 'number', 'required');
INSERT INTO `setting` VALUES ('POINTS_RATIO_BY_ORDER_FINISH', '0.1', '125', '订单成交后获取积分比例', 'main', 'number', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_HOST', 'smtp.exmail.qq.com', '2', '邮件smtp服务器的名称', 'sub_email', 'text', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_SMTPAUTH', 'TRUE', '2', '是否启用SMTP认证', 'sub_email', 'radio', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_USERNAME', 'newsletter@sinob2b.com', '2', '发件人邮箱名', 'sub_email', 'text', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_FROM', 'newsletter@sinob2b.com', '2', '发件人地址', 'sub_email', 'text', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_FROMNAME', 'sinob2b', '2', '发件人姓名', 'sub_email', 'text', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_PASSWORD', 'Sinob2b', '2', '邮箱密码', 'sub_email', 'password', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_CHARSET', 'utf8', '2', '设置邮件编码', 'sub_email', 'hidden', 'required');
INSERT INTO `setting` VALUES ('SUB_MAIL_ISHTML', 'TRUE', '2', '是否HTML格式邮件', 'sub_email', 'hidden', 'required');
INSERT INTO `setting` VALUES ('RMB_TATE', '0.65', '0', '人民币汇率', 'main', 'number', 'required');

-- ----------------------------
-- Table structure for sql_log
-- ----------------------------
DROP TABLE IF EXISTS `sql_log`;
CREATE TABLE `sql_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块',
  `url` varchar(255) NOT NULL COMMENT '控制器/操作',
  `sql` varchar(255) DEFAULT NULL COMMENT 'SQL',
  `use_time` varchar(32) DEFAULT NULL COMMENT '执行时间S',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8009 DEFAULT CHARSET=utf8 COMMENT='Sql日志表';

-- ----------------------------
-- Records of sql_log
-- ----------------------------
INSERT INTO `sql_log` VALUES ('7017', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0005', '2017-12-20 17:47:02');
INSERT INTO `sql_log` VALUES ('7018', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0006', '2017-12-20 17:47:16');
INSERT INTO `sql_log` VALUES ('7019', 'Admin', 'Default/login', 'SELECT * FROM `admin` WHERE `email` = \'admin@vip.126.cn\' LIMIT 1  ', '0.0004', '2017-12-20 17:47:16');
INSERT INTO `sql_log` VALUES ('7020', 'Admin', 'Default/login', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0009', '2017-12-20 17:47:16');
INSERT INTO `sql_log` VALUES ('7021', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7022', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/index\' LIMIT 1  ', '0.0017', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7023', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0008', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7024', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'12', '0.0020', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7025', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'12', '0.0019', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7026', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0010', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7027', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0015', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7028', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0019', '2017-12-20 17:47:17');
INSERT INTO `sql_log` VALUES ('7029', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0008', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7030', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0008', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7031', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0006', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7032', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0009', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7033', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 238 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0005', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7034', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'12', '0.0006', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7035', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'12', '0.0007', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7036', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0006', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7037', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 124 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0006', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7038', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 70 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0006', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7039', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 199 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0006', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7040', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 90 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0010', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7041', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 114 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0007', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7042', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 115 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0009', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7043', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 94 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0009', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7044', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 95 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'1', '0.0008', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7045', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 273 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0011', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7046', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0009', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7047', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0008', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7048', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0006', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7049', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 AND `islink` = 1 AND `id` IN (\'7\',\'8\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'24\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'90\',\'94\',\'95\',\'105\',\'114\',\'115\',\'118\',\'119\',\'120\',\'121\',\'122\',\'', '0.0007', '2017-12-20 17:47:18');
INSERT INTO `sql_log` VALUES ('7050', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:47:19');
INSERT INTO `sql_log` VALUES ('7051', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0008', '2017-12-20 17:47:19');
INSERT INTO `sql_log` VALUES ('7052', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0005', '2017-12-20 17:47:19');
INSERT INTO `sql_log` VALUES ('7053', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0012', '2017-12-20 17:47:44');
INSERT INTO `sql_log` VALUES ('7054', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:47:44');
INSERT INTO `sql_log` VALUES ('7055', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0005', '2017-12-20 17:47:44');
INSERT INTO `sql_log` VALUES ('7056', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7057', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7058', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7059', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7060', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7061', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7062', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7063', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7064', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7065', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7066', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7067', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7068', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7069', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7070', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7071', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7072', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 238 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7073', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 271 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7074', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7075', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7076', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7077', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7078', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 124 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7079', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 70 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7080', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7081', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7082', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7083', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7084', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 85 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7085', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 199 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7086', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 200 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:45');
INSERT INTO `sql_log` VALUES ('7087', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 201 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7088', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7089', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 203 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7090', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 204 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7091', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 61 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7092', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 63 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7093', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 64 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7094', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 65 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7095', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 66 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7096', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 67 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7097', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 69 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7098', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 176 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7099', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 177 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7100', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 178 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7101', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 179 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7102', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 90 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7103', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 114 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7104', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 115 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7105', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 275 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7106', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 274 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7107', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 94 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7108', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 95 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7109', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 105 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7110', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 118 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7111', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 119 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7112', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 120 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7113', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 121 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7114', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 122 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7115', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 152 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7116', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 172 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7117', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 277 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7118', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 276 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7119', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 273 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7120', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:46');
INSERT INTO `sql_log` VALUES ('7121', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:47');
INSERT INTO `sql_log` VALUES ('7122', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 126 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:47');
INSERT INTO `sql_log` VALUES ('7123', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:47');
INSERT INTO `sql_log` VALUES ('7124', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:47:47');
INSERT INTO `sql_log` VALUES ('7125', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 129 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:47:47');
INSERT INTO `sql_log` VALUES ('7126', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 130 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:47:47');
INSERT INTO `sql_log` VALUES ('7127', 'Admin', 'Menu/destroy', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:48:53');
INSERT INTO `sql_log` VALUES ('7128', 'Admin', 'Menu/destroy', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/destroy\' LIMIT 1  ', '0.0005', '2017-12-20 17:48:53');
INSERT INTO `sql_log` VALUES ('7129', 'Admin', 'Menu/destroy', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:48:53');
INSERT INTO `sql_log` VALUES ('7130', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7131', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7132', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7133', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7134', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7135', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7136', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7137', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7138', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7139', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7140', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7141', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7142', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7143', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7144', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7145', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7146', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7147', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7148', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7149', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7150', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7151', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7152', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7153', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 124 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7154', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 70 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7155', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7156', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7157', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7158', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:48:55');
INSERT INTO `sql_log` VALUES ('7159', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 85 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7160', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 199 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7161', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 200 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7162', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 201 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7163', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7164', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 203 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7165', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 204 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7166', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7167', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7168', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 126 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7169', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7170', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7171', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 129 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7172', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 130 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:48:56');
INSERT INTO `sql_log` VALUES ('7173', 'Admin', 'Default/logout', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/logout\' LIMIT 1  ', '0.0004', '2017-12-20 17:48:59');
INSERT INTO `sql_log` VALUES ('7174', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0003', '2017-12-20 17:49:00');
INSERT INTO `sql_log` VALUES ('7175', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0004', '2017-12-20 17:49:02');
INSERT INTO `sql_log` VALUES ('7176', 'Admin', 'Default/login', 'SELECT * FROM `admin` WHERE `email` = \'admin@vip.126.cn\' LIMIT 1  ', '0.0004', '2017-12-20 17:49:02');
INSERT INTO `sql_log` VALUES ('7177', 'Admin', 'Default/login', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:49:02');
INSERT INTO `sql_log` VALUES ('7178', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7179', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/index\' LIMIT 1  ', '0.0011', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7180', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0010', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7181', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\',', '0.0014', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7182', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\',', '0.0017', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7183', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0014', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7184', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0013', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7185', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0013', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7186', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0016', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7187', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0007', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7188', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0007', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7189', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0007', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7190', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\',', '0.0009', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7191', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\',', '0.0006', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7192', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0007', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7193', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 124 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200', '0.0009', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7194', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 70 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200\'', '0.0007', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7195', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 199 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200', '0.0007', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7196', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200', '0.0008', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7197', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200', '0.0006', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7198', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200', '0.0005', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7199', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'70\',\'71\',\'85\',\'123\',\'124\',\'125\',\'126\',\'127\',\'128\',\'129\',\'130\',\'159\',\'199\',\'200', '0.0006', '2017-12-20 17:49:04');
INSERT INTO `sql_log` VALUES ('7200', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0009', '2017-12-20 17:49:05');
INSERT INTO `sql_log` VALUES ('7201', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0008', '2017-12-20 17:49:05');
INSERT INTO `sql_log` VALUES ('7202', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0007', '2017-12-20 17:49:05');
INSERT INTO `sql_log` VALUES ('7203', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0011', '2017-12-20 17:49:09');
INSERT INTO `sql_log` VALUES ('7204', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0004', '2017-12-20 17:49:10');
INSERT INTO `sql_log` VALUES ('7205', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:49:10');
INSERT INTO `sql_log` VALUES ('7206', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0003', '2017-12-20 17:49:10');
INSERT INTO `sql_log` VALUES ('7207', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0005', '2017-12-20 17:49:10');
INSERT INTO `sql_log` VALUES ('7208', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:49:11');
INSERT INTO `sql_log` VALUES ('7209', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:49:11');
INSERT INTO `sql_log` VALUES ('7210', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0005', '2017-12-20 17:49:11');
INSERT INTO `sql_log` VALUES ('7211', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:49:11');
INSERT INTO `sql_log` VALUES ('7212', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:11');
INSERT INTO `sql_log` VALUES ('7213', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7214', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7215', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0019', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7216', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7217', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0024', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7218', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7219', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7220', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7221', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7222', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7223', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7224', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7225', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7226', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7227', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7228', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7229', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7230', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7231', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 124 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7232', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 70 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:12');
INSERT INTO `sql_log` VALUES ('7233', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7234', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7235', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7236', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7237', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 85 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7238', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 199 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7239', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 200 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7240', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 201 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7241', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7242', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 203 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7243', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 204 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7244', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7245', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7246', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 126 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7247', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7248', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7249', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 129 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7250', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 130 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:49:13');
INSERT INTO `sql_log` VALUES ('7251', 'Admin', 'System/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:49:19');
INSERT INTO `sql_log` VALUES ('7252', 'Admin', 'System/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'System/add\' LIMIT 1  ', '0.0010', '2017-12-20 17:49:19');
INSERT INTO `sql_log` VALUES ('7253', 'Admin', 'System/add', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0006', '2017-12-20 17:49:19');
INSERT INTO `sql_log` VALUES ('7254', 'Admin', 'System/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:49:23');
INSERT INTO `sql_log` VALUES ('7255', 'Admin', 'System/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'System/add\' LIMIT 1  ', '0.0004', '2017-12-20 17:49:23');
INSERT INTO `sql_log` VALUES ('7256', 'Admin', 'System/add', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:49:23');
INSERT INTO `sql_log` VALUES ('7257', 'Admin', 'System/editSystem', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0002', '2017-12-20 17:49:24');
INSERT INTO `sql_log` VALUES ('7258', 'Admin', 'System/editSystem', 'SELECT * FROM `auth_rule` WHERE `name` = \'System/editSystem\' LIMIT 1  ', '0.0006', '2017-12-20 17:49:24');
INSERT INTO `sql_log` VALUES ('7259', 'Admin', 'System/editSystem', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:49:24');
INSERT INTO `sql_log` VALUES ('7260', 'Admin', 'System/editSystem', 'SELECT * FROM `setting` ORDER BY sort ASC ', '0.0018', '2017-12-20 17:49:24');
INSERT INTO `sql_log` VALUES ('7261', 'Admin', 'Menu/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:49:25');
INSERT INTO `sql_log` VALUES ('7262', 'Admin', 'Menu/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/add\' LIMIT 1  ', '0.0007', '2017-12-20 17:49:25');
INSERT INTO `sql_log` VALUES ('7263', 'Admin', 'Menu/add', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:49:25');
INSERT INTO `sql_log` VALUES ('7264', 'Admin', 'Menu/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ', '0.0009', '2017-12-20 17:49:25');
INSERT INTO `sql_log` VALUES ('7265', 'Admin', 'System/editSystem', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:49:26');
INSERT INTO `sql_log` VALUES ('7266', 'Admin', 'System/editSystem', 'SELECT * FROM `auth_rule` WHERE `name` = \'System/editSystem\' LIMIT 1  ', '0.0007', '2017-12-20 17:49:26');
INSERT INTO `sql_log` VALUES ('7267', 'Admin', 'System/editSystem', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0007', '2017-12-20 17:49:26');
INSERT INTO `sql_log` VALUES ('7268', 'Admin', 'System/editSystem', 'SELECT * FROM `setting` ORDER BY sort ASC ', '0.0008', '2017-12-20 17:49:27');
INSERT INTO `sql_log` VALUES ('7269', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:49:39');
INSERT INTO `sql_log` VALUES ('7270', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7271', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7272', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7273', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7274', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7275', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7276', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7277', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7278', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7279', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7280', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7281', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7282', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7283', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7284', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7285', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7286', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7287', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7288', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7289', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7290', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7291', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7292', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 124 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7293', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 70 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7294', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7295', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7296', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7297', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7298', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 85 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7299', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 199 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7300', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 200 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7301', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 201 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:40');
INSERT INTO `sql_log` VALUES ('7302', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7303', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 203 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7304', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 204 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7305', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7306', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7307', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 126 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7308', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7309', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7310', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 129 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7311', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 130 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:49:41');
INSERT INTO `sql_log` VALUES ('7312', 'Admin', 'Menu/destroy', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:50:34');
INSERT INTO `sql_log` VALUES ('7313', 'Admin', 'Menu/destroy', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/destroy\' LIMIT 1  ', '0.0007', '2017-12-20 17:50:34');
INSERT INTO `sql_log` VALUES ('7314', 'Admin', 'Menu/destroy', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0007', '2017-12-20 17:50:35');
INSERT INTO `sql_log` VALUES ('7315', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7316', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0010', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7317', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0010', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7318', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7319', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7320', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7321', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7322', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7323', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7324', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7325', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7326', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7327', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7328', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7329', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7330', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7331', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7332', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7333', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7334', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:36');
INSERT INTO `sql_log` VALUES ('7335', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7336', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7337', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7338', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7339', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0042', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7340', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7341', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7342', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7343', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7344', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7345', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 126 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7346', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7347', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7348', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 129 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7349', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 130 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:50:37');
INSERT INTO `sql_log` VALUES ('7350', 'Admin', 'User/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:50:38');
INSERT INTO `sql_log` VALUES ('7351', 'Admin', 'User/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'User/index\' LIMIT 1  ', '0.0010', '2017-12-20 17:50:38');
INSERT INTO `sql_log` VALUES ('7352', 'Admin', 'User/index', 'SELECT * FROM `auth_rule` WHERE `id` = 123 LIMIT 1  ', '0.0015', '2017-12-20 17:50:39');
INSERT INTO `sql_log` VALUES ('7353', 'Admin', 'User/index', 'SELECT COUNT(*) AS tp_count FROM `user` LIMIT 1  ', '0.0009', '2017-12-20 17:50:39');
INSERT INTO `sql_log` VALUES ('7354', 'Admin', 'User/index', 'SELECT * FROM `user` LIMIT 0,20  ', '0.0018', '2017-12-20 17:50:39');
INSERT INTO `sql_log` VALUES ('7355', 'Admin', 'User/userGrade', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:50:40');
INSERT INTO `sql_log` VALUES ('7356', 'Admin', 'User/userGrade', 'SELECT * FROM `auth_rule` WHERE `name` = \'User/userGrade\' LIMIT 1  ', '0.0005', '2017-12-20 17:50:40');
INSERT INTO `sql_log` VALUES ('7357', 'Admin', 'User/userGrade', 'SELECT * FROM `auth_rule` WHERE `id` = 123 LIMIT 1  ', '0.0004', '2017-12-20 17:50:40');
INSERT INTO `sql_log` VALUES ('7358', 'Admin', 'User/userGradeAddModify', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:50:41');
INSERT INTO `sql_log` VALUES ('7359', 'Admin', 'User/userGradeAddModify', 'SELECT * FROM `auth_rule` WHERE `name` = \'User/userGradeAddModify\' LIMIT 1  ', '0.0005', '2017-12-20 17:50:41');
INSERT INTO `sql_log` VALUES ('7360', 'Admin', 'User/userGradeAddModify', 'SELECT * FROM `auth_rule` WHERE `id` = 123 LIMIT 1  ', '0.0005', '2017-12-20 17:50:41');
INSERT INTO `sql_log` VALUES ('7361', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7362', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7363', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7364', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7365', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7366', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7367', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7368', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7369', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7370', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7371', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7372', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7373', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7374', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7375', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7376', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7377', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7378', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7379', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7380', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:50:43');
INSERT INTO `sql_log` VALUES ('7381', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7382', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7383', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7384', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7385', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7386', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7387', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7388', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7389', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 123 ORDER BY sort Asc ', '0.0018', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7390', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 125 ORDER BY sort Asc ', '0.0018', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7391', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 126 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7392', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 127 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7393', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 128 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7394', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 129 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7395', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 130 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:50:44');
INSERT INTO `sql_log` VALUES ('7396', 'Admin', 'Menu/destroy', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0006', '2017-12-20 17:50:53');
INSERT INTO `sql_log` VALUES ('7397', 'Admin', 'Menu/destroy', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/destroy\' LIMIT 1  ', '0.0005', '2017-12-20 17:50:53');
INSERT INTO `sql_log` VALUES ('7398', 'Admin', 'Menu/destroy', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0008', '2017-12-20 17:50:53');
INSERT INTO `sql_log` VALUES ('7399', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:50:54');
INSERT INTO `sql_log` VALUES ('7400', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:50:54');
INSERT INTO `sql_log` VALUES ('7401', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7402', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7403', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7404', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7405', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7406', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7407', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7408', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7409', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7410', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7411', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7412', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7413', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7414', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7415', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7416', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7417', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7418', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7419', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7420', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7421', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7422', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7423', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7424', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7425', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7426', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:50:55');
INSERT INTO `sql_log` VALUES ('7427', 'Admin', 'Default/logout', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/logout\' LIMIT 1  ', '0.0007', '2017-12-20 17:50:59');
INSERT INTO `sql_log` VALUES ('7428', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0004', '2017-12-20 17:51:00');
INSERT INTO `sql_log` VALUES ('7429', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0004', '2017-12-20 17:51:01');
INSERT INTO `sql_log` VALUES ('7430', 'Admin', 'Default/login', 'SELECT * FROM `admin` WHERE `email` = \'admin@vip.126.cn\' LIMIT 1  ', '0.0010', '2017-12-20 17:51:01');
INSERT INTO `sql_log` VALUES ('7431', 'Admin', 'Default/login', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:51:02');
INSERT INTO `sql_log` VALUES ('7432', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7433', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/index\' LIMIT 1  ', '0.0007', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7434', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7435', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7436', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0009', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7437', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7438', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7439', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0022', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7440', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0017', '2017-12-20 17:51:03');
INSERT INTO `sql_log` VALUES ('7441', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0018', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7442', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0019', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7443', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0020', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7444', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0017', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7445', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0022', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7446', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0010', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7447', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0009', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7448', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0005', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7449', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0006', '2017-12-20 17:51:04');
INSERT INTO `sql_log` VALUES ('7450', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:51:07');
INSERT INTO `sql_log` VALUES ('7451', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0007', '2017-12-20 17:51:07');
INSERT INTO `sql_log` VALUES ('7452', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0011', '2017-12-20 17:51:07');
INSERT INTO `sql_log` VALUES ('7453', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0005', '2017-12-20 17:51:07');
INSERT INTO `sql_log` VALUES ('7454', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0035', '2017-12-20 17:51:07');
INSERT INTO `sql_log` VALUES ('7455', 'Admin', 'Role/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:51:09');
INSERT INTO `sql_log` VALUES ('7456', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/index\' LIMIT 1  ', '0.0007', '2017-12-20 17:51:09');
INSERT INTO `sql_log` VALUES ('7457', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0009', '2017-12-20 17:51:09');
INSERT INTO `sql_log` VALUES ('7458', 'Admin', 'Role/index', 'SELECT COUNT(*) AS tp_count FROM `role` LIMIT 1  ', '0.0005', '2017-12-20 17:51:09');
INSERT INTO `sql_log` VALUES ('7459', 'Admin', 'Role/index', 'SELECT * FROM `role` LIMIT 0,20  ', '0.0004', '2017-12-20 17:51:09');
INSERT INTO `sql_log` VALUES ('7460', 'Admin', 'Admin/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:51:10');
INSERT INTO `sql_log` VALUES ('7461', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/add\' LIMIT 1  ', '0.0007', '2017-12-20 17:51:10');
INSERT INTO `sql_log` VALUES ('7462', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0007', '2017-12-20 17:51:10');
INSERT INTO `sql_log` VALUES ('7463', 'Admin', 'Admin/add', 'SELECT * FROM `role` ', '0.0004', '2017-12-20 17:51:10');
INSERT INTO `sql_log` VALUES ('7464', 'Admin', 'Role/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7465', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/add\' LIMIT 1  ', '0.0006', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7466', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0012', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7467', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7468', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7469', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7470', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0023', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7471', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7472', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7473', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7474', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7475', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7476', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7477', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7478', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7479', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7480', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7481', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7482', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7483', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:11');
INSERT INTO `sql_log` VALUES ('7484', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7485', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7486', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7487', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7488', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7489', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7490', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7491', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:51:12');
INSERT INTO `sql_log` VALUES ('7492', 'Admin', 'Default/logout', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/logout\' LIMIT 1  ', '0.0004', '2017-12-20 17:52:49');
INSERT INTO `sql_log` VALUES ('7493', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0004', '2017-12-20 17:52:51');
INSERT INTO `sql_log` VALUES ('7494', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0006', '2017-12-20 17:52:52');
INSERT INTO `sql_log` VALUES ('7495', 'Admin', 'Default/login', 'SELECT * FROM `admin` WHERE `email` = \'admin@vip.126.cn\' LIMIT 1  ', '0.0004', '2017-12-20 17:52:52');
INSERT INTO `sql_log` VALUES ('7496', 'Admin', 'Default/login', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:52:52');
INSERT INTO `sql_log` VALUES ('7497', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:52:53');
INSERT INTO `sql_log` VALUES ('7498', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:52:53');
INSERT INTO `sql_log` VALUES ('7499', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0006', '2017-12-20 17:52:53');
INSERT INTO `sql_log` VALUES ('7500', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:52:53');
INSERT INTO `sql_log` VALUES ('7501', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0008', '2017-12-20 17:52:53');
INSERT INTO `sql_log` VALUES ('7502', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7503', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7504', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7505', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0010', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7506', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7507', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7508', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7509', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7510', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7511', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0013', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7512', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0006', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7513', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0006', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7514', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0005', '2017-12-20 17:52:54');
INSERT INTO `sql_log` VALUES ('7515', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:52:56');
INSERT INTO `sql_log` VALUES ('7516', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:52:56');
INSERT INTO `sql_log` VALUES ('7517', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:52:56');
INSERT INTO `sql_log` VALUES ('7518', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0004', '2017-12-20 17:52:56');
INSERT INTO `sql_log` VALUES ('7519', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0005', '2017-12-20 17:52:56');
INSERT INTO `sql_log` VALUES ('7520', 'Admin', 'Admin/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:52:57');
INSERT INTO `sql_log` VALUES ('7521', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/add\' LIMIT 1  ', '0.0013', '2017-12-20 17:52:57');
INSERT INTO `sql_log` VALUES ('7522', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0008', '2017-12-20 17:52:57');
INSERT INTO `sql_log` VALUES ('7523', 'Admin', 'Admin/add', 'SELECT * FROM `role` ', '0.0006', '2017-12-20 17:52:57');
INSERT INTO `sql_log` VALUES ('7524', 'Admin', 'Role/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:52:58');
INSERT INTO `sql_log` VALUES ('7525', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:52:58');
INSERT INTO `sql_log` VALUES ('7526', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:52:58');
INSERT INTO `sql_log` VALUES ('7527', 'Admin', 'Role/index', 'SELECT COUNT(*) AS tp_count FROM `role` LIMIT 1  ', '0.0004', '2017-12-20 17:52:58');
INSERT INTO `sql_log` VALUES ('7528', 'Admin', 'Role/index', 'SELECT * FROM `role` LIMIT 0,20  ', '0.0006', '2017-12-20 17:52:58');
INSERT INTO `sql_log` VALUES ('7529', 'Admin', 'Role/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7530', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/add\' LIMIT 1  ', '0.0007', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7531', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7532', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7533', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7534', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7535', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7536', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7537', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7538', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7539', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7540', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7541', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7542', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7543', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:52:59');
INSERT INTO `sql_log` VALUES ('7544', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7545', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7546', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7547', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7548', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7549', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7550', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7551', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7552', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7553', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7554', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7555', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7556', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7557', 'Admin', 'Role/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7558', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/add\' LIMIT 1  ', '0.0004', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7559', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7560', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7561', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7562', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7563', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7564', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7565', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7566', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7567', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:53:00');
INSERT INTO `sql_log` VALUES ('7568', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7569', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7570', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7571', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7572', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7573', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7574', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7575', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7576', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0019', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7577', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7578', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7579', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7580', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7581', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7582', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7583', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7584', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:53:01');
INSERT INTO `sql_log` VALUES ('7585', 'Admin', 'Role/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:53:02');
INSERT INTO `sql_log` VALUES ('7586', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/index\' LIMIT 1  ', '0.0004', '2017-12-20 17:53:02');
INSERT INTO `sql_log` VALUES ('7587', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:53:02');
INSERT INTO `sql_log` VALUES ('7588', 'Admin', 'Role/index', 'SELECT COUNT(*) AS tp_count FROM `role` LIMIT 1  ', '0.0003', '2017-12-20 17:53:02');
INSERT INTO `sql_log` VALUES ('7589', 'Admin', 'Role/index', 'SELECT * FROM `role` LIMIT 0,20  ', '0.0004', '2017-12-20 17:53:02');
INSERT INTO `sql_log` VALUES ('7590', 'Admin', 'Role/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7591', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/add\' LIMIT 1  ', '0.0013', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7592', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0014', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7593', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7594', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7595', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7596', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7597', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7598', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7599', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7600', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7601', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7602', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7603', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7604', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7605', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7606', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7607', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7608', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7609', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7610', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:04');
INSERT INTO `sql_log` VALUES ('7611', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:05');
INSERT INTO `sql_log` VALUES ('7612', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:05');
INSERT INTO `sql_log` VALUES ('7613', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:05');
INSERT INTO `sql_log` VALUES ('7614', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:05');
INSERT INTO `sql_log` VALUES ('7615', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:05');
INSERT INTO `sql_log` VALUES ('7616', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:53:05');
INSERT INTO `sql_log` VALUES ('7617', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:05');
INSERT INTO `sql_log` VALUES ('7618', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:53:08');
INSERT INTO `sql_log` VALUES ('7619', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:53:08');
INSERT INTO `sql_log` VALUES ('7620', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:53:08');
INSERT INTO `sql_log` VALUES ('7621', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0003', '2017-12-20 17:53:08');
INSERT INTO `sql_log` VALUES ('7622', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0006', '2017-12-20 17:53:08');
INSERT INTO `sql_log` VALUES ('7623', 'Admin', 'Admin/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:53:09');
INSERT INTO `sql_log` VALUES ('7624', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/add\' LIMIT 1  ', '0.0007', '2017-12-20 17:53:10');
INSERT INTO `sql_log` VALUES ('7625', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:53:10');
INSERT INTO `sql_log` VALUES ('7626', 'Admin', 'Admin/add', 'SELECT * FROM `role` ', '0.0005', '2017-12-20 17:53:10');
INSERT INTO `sql_log` VALUES ('7627', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7628', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7629', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0007', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7630', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7631', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7632', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7633', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7634', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7635', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0023', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7636', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:53:11');
INSERT INTO `sql_log` VALUES ('7637', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7638', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7639', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7640', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7641', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7642', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7643', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7644', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7645', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7646', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7647', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7648', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7649', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7650', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7651', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7652', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7653', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7654', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7655', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0002', '2017-12-20 17:53:12');
INSERT INTO `sql_log` VALUES ('7656', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0004', '2017-12-20 17:53:13');
INSERT INTO `sql_log` VALUES ('7657', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:53:13');
INSERT INTO `sql_log` VALUES ('7658', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0010', '2017-12-20 17:53:13');
INSERT INTO `sql_log` VALUES ('7659', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0014', '2017-12-20 17:53:13');
INSERT INTO `sql_log` VALUES ('7660', 'Admin', 'Default/logout', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/logout\' LIMIT 1  ', '0.0004', '2017-12-20 17:53:59');
INSERT INTO `sql_log` VALUES ('7661', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0006', '2017-12-20 17:54:00');
INSERT INTO `sql_log` VALUES ('7662', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0008', '2017-12-20 17:54:01');
INSERT INTO `sql_log` VALUES ('7663', 'Admin', 'Default/login', 'SELECT * FROM `admin` WHERE `email` = \'admin@vip.126.cn\' LIMIT 1  ', '0.0004', '2017-12-20 17:54:02');
INSERT INTO `sql_log` VALUES ('7664', 'Admin', 'Default/login', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0012', '2017-12-20 17:54:02');
INSERT INTO `sql_log` VALUES ('7665', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7666', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7667', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7668', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7669', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7670', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7671', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0008', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7672', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0008', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7673', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7674', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7675', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0008', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7676', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7677', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0008', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7678', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7679', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0010', '2017-12-20 17:54:03');
INSERT INTO `sql_log` VALUES ('7680', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0002', '2017-12-20 17:54:04');
INSERT INTO `sql_log` VALUES ('7681', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0004', '2017-12-20 17:54:04');
INSERT INTO `sql_log` VALUES ('7682', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0008', '2017-12-20 17:54:04');
INSERT INTO `sql_log` VALUES ('7683', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:54:05');
INSERT INTO `sql_log` VALUES ('7684', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0007', '2017-12-20 17:54:05');
INSERT INTO `sql_log` VALUES ('7685', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0007', '2017-12-20 17:54:05');
INSERT INTO `sql_log` VALUES ('7686', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0017', '2017-12-20 17:54:05');
INSERT INTO `sql_log` VALUES ('7687', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0005', '2017-12-20 17:54:05');
INSERT INTO `sql_log` VALUES ('7688', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7689', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0004', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7690', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0007', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7691', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7692', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0018', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7693', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7694', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7695', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7696', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7697', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7698', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7699', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7700', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7701', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7702', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7703', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7704', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7705', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7706', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7707', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7708', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7709', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7710', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7711', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:54:06');
INSERT INTO `sql_log` VALUES ('7712', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:54:07');
INSERT INTO `sql_log` VALUES ('7713', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0020', '2017-12-20 17:54:07');
INSERT INTO `sql_log` VALUES ('7714', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:07');
INSERT INTO `sql_log` VALUES ('7715', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:54:07');
INSERT INTO `sql_log` VALUES ('7716', 'Admin', 'Menu/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:07');
INSERT INTO `sql_log` VALUES ('7717', 'Admin', 'Menu/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/add\' LIMIT 1  ', '0.0006', '2017-12-20 17:54:07');
INSERT INTO `sql_log` VALUES ('7718', 'Admin', 'Menu/add', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:54:07');
INSERT INTO `sql_log` VALUES ('7719', 'Admin', 'Menu/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ', '0.0005', '2017-12-20 17:54:08');
INSERT INTO `sql_log` VALUES ('7720', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:54:09');
INSERT INTO `sql_log` VALUES ('7721', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:54:09');
INSERT INTO `sql_log` VALUES ('7722', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:54:09');
INSERT INTO `sql_log` VALUES ('7723', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0003', '2017-12-20 17:54:09');
INSERT INTO `sql_log` VALUES ('7724', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0005', '2017-12-20 17:54:09');
INSERT INTO `sql_log` VALUES ('7725', 'Admin', 'Admin/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:11');
INSERT INTO `sql_log` VALUES ('7726', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/add\' LIMIT 1  ', '0.0005', '2017-12-20 17:54:11');
INSERT INTO `sql_log` VALUES ('7727', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:54:11');
INSERT INTO `sql_log` VALUES ('7728', 'Admin', 'Admin/add', 'SELECT * FROM `role` ', '0.0003', '2017-12-20 17:54:11');
INSERT INTO `sql_log` VALUES ('7729', 'Admin', 'Role/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0014', '2017-12-20 17:54:12');
INSERT INTO `sql_log` VALUES ('7730', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:54:12');
INSERT INTO `sql_log` VALUES ('7731', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0005', '2017-12-20 17:54:12');
INSERT INTO `sql_log` VALUES ('7732', 'Admin', 'Role/index', 'SELECT COUNT(*) AS tp_count FROM `role` LIMIT 1  ', '0.0004', '2017-12-20 17:54:13');
INSERT INTO `sql_log` VALUES ('7733', 'Admin', 'Role/index', 'SELECT * FROM `role` LIMIT 0,20  ', '0.0005', '2017-12-20 17:54:13');
INSERT INTO `sql_log` VALUES ('7734', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7735', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7736', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7737', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7738', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7739', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7740', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7741', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7742', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7743', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7744', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7745', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7746', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7747', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7748', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0019', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7749', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7750', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7751', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7752', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:42');
INSERT INTO `sql_log` VALUES ('7753', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7754', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7755', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7756', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7757', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7758', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7759', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7760', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7761', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:54:43');
INSERT INTO `sql_log` VALUES ('7762', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:44');
INSERT INTO `sql_log` VALUES ('7763', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0012', '2017-12-20 17:54:44');
INSERT INTO `sql_log` VALUES ('7764', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0005', '2017-12-20 17:54:44');
INSERT INTO `sql_log` VALUES ('7765', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0004', '2017-12-20 17:54:44');
INSERT INTO `sql_log` VALUES ('7766', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0006', '2017-12-20 17:54:44');
INSERT INTO `sql_log` VALUES ('7767', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:45');
INSERT INTO `sql_log` VALUES ('7768', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0004', '2017-12-20 17:54:45');
INSERT INTO `sql_log` VALUES ('7769', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0005', '2017-12-20 17:54:45');
INSERT INTO `sql_log` VALUES ('7770', 'Admin', 'Index/mainTestView', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:45');
INSERT INTO `sql_log` VALUES ('7771', 'Admin', 'Index/mainTestView', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/mainTestView\' LIMIT 1  ', '0.0012', '2017-12-20 17:54:46');
INSERT INTO `sql_log` VALUES ('7772', 'Admin', 'Index/mainTestView', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0011', '2017-12-20 17:54:46');
INSERT INTO `sql_log` VALUES ('7773', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:54:47');
INSERT INTO `sql_log` VALUES ('7774', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0011', '2017-12-20 17:54:47');
INSERT INTO `sql_log` VALUES ('7775', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0007', '2017-12-20 17:54:47');
INSERT INTO `sql_log` VALUES ('7776', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:54:47');
INSERT INTO `sql_log` VALUES ('7777', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0004', '2017-12-20 17:54:47');
INSERT INTO `sql_log` VALUES ('7778', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0012', '2017-12-20 17:54:47');
INSERT INTO `sql_log` VALUES ('7779', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0007', '2017-12-20 17:54:48');
INSERT INTO `sql_log` VALUES ('7780', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0010', '2017-12-20 17:54:48');
INSERT INTO `sql_log` VALUES ('7781', 'Admin', 'Admin/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:54:49');
INSERT INTO `sql_log` VALUES ('7782', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/add\' LIMIT 1  ', '0.0011', '2017-12-20 17:54:49');
INSERT INTO `sql_log` VALUES ('7783', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0007', '2017-12-20 17:54:49');
INSERT INTO `sql_log` VALUES ('7784', 'Admin', 'Admin/add', 'SELECT * FROM `role` ', '0.0009', '2017-12-20 17:54:49');
INSERT INTO `sql_log` VALUES ('7785', 'Admin', 'Role/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:54:50');
INSERT INTO `sql_log` VALUES ('7786', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/index\' LIMIT 1  ', '0.0007', '2017-12-20 17:54:50');
INSERT INTO `sql_log` VALUES ('7787', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:54:50');
INSERT INTO `sql_log` VALUES ('7788', 'Admin', 'Role/index', 'SELECT COUNT(*) AS tp_count FROM `role` LIMIT 1  ', '0.0007', '2017-12-20 17:54:50');
INSERT INTO `sql_log` VALUES ('7789', 'Admin', 'Role/index', 'SELECT * FROM `role` LIMIT 0,20  ', '0.0010', '2017-12-20 17:54:50');
INSERT INTO `sql_log` VALUES ('7790', 'Admin', 'Default/logout', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/logout\' LIMIT 1  ', '0.0004', '2017-12-20 17:56:01');
INSERT INTO `sql_log` VALUES ('7791', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0005', '2017-12-20 17:56:02');
INSERT INTO `sql_log` VALUES ('7792', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0005', '2017-12-20 17:56:04');
INSERT INTO `sql_log` VALUES ('7793', 'Admin', 'Default/login', 'SELECT * FROM `admin` WHERE `email` = \'admin@vip.126.cn\' LIMIT 1  ', '0.0005', '2017-12-20 17:56:04');
INSERT INTO `sql_log` VALUES ('7794', 'Admin', 'Default/login', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:56:04');
INSERT INTO `sql_log` VALUES ('7795', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7796', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7797', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7798', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7799', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7800', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7801', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7802', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0008', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7803', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7804', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7805', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:56:05');
INSERT INTO `sql_log` VALUES ('7806', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:06');
INSERT INTO `sql_log` VALUES ('7807', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0009', '2017-12-20 17:56:06');
INSERT INTO `sql_log` VALUES ('7808', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:06');
INSERT INTO `sql_log` VALUES ('7809', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:06');
INSERT INTO `sql_log` VALUES ('7810', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:56:06');
INSERT INTO `sql_log` VALUES ('7811', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0009', '2017-12-20 17:56:06');
INSERT INTO `sql_log` VALUES ('7812', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0006', '2017-12-20 17:56:06');
INSERT INTO `sql_log` VALUES ('7813', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7814', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0007', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7815', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0009', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7816', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7817', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7818', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7819', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7820', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7821', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7822', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7823', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7824', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7825', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:07');
INSERT INTO `sql_log` VALUES ('7826', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7827', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7828', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7829', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7830', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7831', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7832', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7833', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7834', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7835', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7836', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7837', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7838', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7839', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7840', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:56:08');
INSERT INTO `sql_log` VALUES ('7841', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:56:09');
INSERT INTO `sql_log` VALUES ('7842', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:56:09');
INSERT INTO `sql_log` VALUES ('7843', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:56:10');
INSERT INTO `sql_log` VALUES ('7844', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0004', '2017-12-20 17:56:10');
INSERT INTO `sql_log` VALUES ('7845', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0005', '2017-12-20 17:56:10');
INSERT INTO `sql_log` VALUES ('7846', 'Admin', 'Admin/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:56:11');
INSERT INTO `sql_log` VALUES ('7847', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/add\' LIMIT 1  ', '0.0006', '2017-12-20 17:56:11');
INSERT INTO `sql_log` VALUES ('7848', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0006', '2017-12-20 17:56:11');
INSERT INTO `sql_log` VALUES ('7849', 'Admin', 'Admin/add', 'SELECT * FROM `role` ', '0.0005', '2017-12-20 17:56:11');
INSERT INTO `sql_log` VALUES ('7850', 'Admin', 'Role/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:56:13');
INSERT INTO `sql_log` VALUES ('7851', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:56:13');
INSERT INTO `sql_log` VALUES ('7852', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:56:13');
INSERT INTO `sql_log` VALUES ('7853', 'Admin', 'Role/index', 'SELECT COUNT(*) AS tp_count FROM `role` LIMIT 1  ', '0.0003', '2017-12-20 17:56:13');
INSERT INTO `sql_log` VALUES ('7854', 'Admin', 'Role/index', 'SELECT * FROM `role` LIMIT 0,20  ', '0.0011', '2017-12-20 17:56:13');
INSERT INTO `sql_log` VALUES ('7855', 'Admin', 'Role/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7856', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/add\' LIMIT 1  ', '0.0006', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7857', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0004', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7858', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7859', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7860', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7861', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7862', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7863', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7864', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7865', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7866', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7867', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7868', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7869', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7870', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:56:14');
INSERT INTO `sql_log` VALUES ('7871', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7872', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7873', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7874', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7875', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7876', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7877', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7878', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7879', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7880', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7881', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7882', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:56:15');
INSERT INTO `sql_log` VALUES ('7883', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:57:14');
INSERT INTO `sql_log` VALUES ('7884', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:57:14');
INSERT INTO `sql_log` VALUES ('7885', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0008', '2017-12-20 17:57:14');
INSERT INTO `sql_log` VALUES ('7886', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0004', '2017-12-20 17:57:14');
INSERT INTO `sql_log` VALUES ('7887', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0005', '2017-12-20 17:57:14');
INSERT INTO `sql_log` VALUES ('7888', 'Admin', 'Admin/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:57:15');
INSERT INTO `sql_log` VALUES ('7889', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/add\' LIMIT 1  ', '0.0005', '2017-12-20 17:57:15');
INSERT INTO `sql_log` VALUES ('7890', 'Admin', 'Admin/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0005', '2017-12-20 17:57:15');
INSERT INTO `sql_log` VALUES ('7891', 'Admin', 'Admin/add', 'SELECT * FROM `role` ', '0.0004', '2017-12-20 17:57:15');
INSERT INTO `sql_log` VALUES ('7892', 'Admin', 'Role/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:57:16');
INSERT INTO `sql_log` VALUES ('7893', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/index\' LIMIT 1  ', '0.0010', '2017-12-20 17:57:16');
INSERT INTO `sql_log` VALUES ('7894', 'Admin', 'Role/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0010', '2017-12-20 17:57:16');
INSERT INTO `sql_log` VALUES ('7895', 'Admin', 'Role/index', 'SELECT COUNT(*) AS tp_count FROM `role` LIMIT 1  ', '0.0003', '2017-12-20 17:57:16');
INSERT INTO `sql_log` VALUES ('7896', 'Admin', 'Role/index', 'SELECT * FROM `role` LIMIT 0,20  ', '0.0006', '2017-12-20 17:57:16');
INSERT INTO `sql_log` VALUES ('7897', 'Admin', 'Role/add', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0004', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7898', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `name` = \'Role/add\' LIMIT 1  ', '0.0007', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7899', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0005', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7900', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7901', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7902', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7903', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7904', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7905', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7906', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7907', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7908', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7909', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7910', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7911', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7912', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0007', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7913', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7914', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7915', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7916', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7917', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7918', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7919', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7920', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7921', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7922', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:17');
INSERT INTO `sql_log` VALUES ('7923', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7924', 'Admin', 'Role/add', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7925', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7926', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0013', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7927', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0013', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7928', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0017', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7929', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0018', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7930', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7931', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0016', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7932', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7933', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7934', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0018', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7935', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7936', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7937', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7938', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7939', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7940', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7941', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7942', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7943', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7944', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7945', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7946', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7947', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0009', '2017-12-20 17:57:18');
INSERT INTO `sql_log` VALUES ('7948', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:57:19');
INSERT INTO `sql_log` VALUES ('7949', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:19');
INSERT INTO `sql_log` VALUES ('7950', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:19');
INSERT INTO `sql_log` VALUES ('7951', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:19');
INSERT INTO `sql_log` VALUES ('7952', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0008', '2017-12-20 17:57:19');
INSERT INTO `sql_log` VALUES ('7953', 'Admin', 'Default/logout', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/logout\' LIMIT 1  ', '0.0005', '2017-12-20 17:57:20');
INSERT INTO `sql_log` VALUES ('7954', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0004', '2017-12-20 17:57:21');
INSERT INTO `sql_log` VALUES ('7955', 'Admin', 'Default/login', 'SELECT * FROM `auth_rule` WHERE `name` = \'Default/login\' LIMIT 1  ', '0.0006', '2017-12-20 17:57:22');
INSERT INTO `sql_log` VALUES ('7956', 'Admin', 'Default/login', 'SELECT * FROM `admin` WHERE `email` = \'admin@vip.126.cn\' LIMIT 1  ', '0.0004', '2017-12-20 17:57:22');
INSERT INTO `sql_log` VALUES ('7957', 'Admin', 'Default/login', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:57:23');
INSERT INTO `sql_log` VALUES ('7958', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0021', '2017-12-20 17:57:24');
INSERT INTO `sql_log` VALUES ('7959', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/index\' LIMIT 1  ', '0.0006', '2017-12-20 17:57:24');
INSERT INTO `sql_log` VALUES ('7960', 'Admin', 'Index/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:57:24');
INSERT INTO `sql_log` VALUES ('7961', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:24');
INSERT INTO `sql_log` VALUES ('7962', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7963', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7964', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7965', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0012', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7966', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0012', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7967', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0018', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7968', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0007', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7969', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0008', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7970', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7971', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7972', 'Admin', 'Index/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 AND `islink` = 1 AND `id` IN (\'8\',\'7\',\'9\',\'10\',\'11\',\'12\',\'13\',\'14\',\'15\',\'16\',\'17\',\'24\',\'18\',\'19\',\'20\',\'21\',\'22\',\'23\',\'25\',\'26\',\'62\',\'71\',\'159\',\'202\') ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7973', 'Admin', 'Index/main', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0016', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7974', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `name` = \'Index/main\' LIMIT 1  ', '0.0007', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7975', 'Admin', 'Index/main', 'SELECT * FROM `auth_rule` WHERE `id` = 7 LIMIT 1  ', '0.0008', '2017-12-20 17:57:25');
INSERT INTO `sql_log` VALUES ('7976', 'Admin', 'Admin/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0005', '2017-12-20 17:57:26');
INSERT INTO `sql_log` VALUES ('7977', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Admin/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:57:26');
INSERT INTO `sql_log` VALUES ('7978', 'Admin', 'Admin/index', 'SELECT * FROM `auth_rule` WHERE `id` = 15 LIMIT 1  ', '0.0005', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7979', 'Admin', 'Admin/index', 'SELECT COUNT(*) AS tp_count FROM `admin` LIMIT 1  ', '0.0006', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7980', 'Admin', 'Admin/index', 'SELECT * FROM `admin` LIMIT 0,20  ', '0.0021', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7981', 'Admin', 'Menu/index', 'SELECT * FROM `role` WHERE `id` = 6 LIMIT 1  ', '0.0003', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7982', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `name` = \'Menu/index\' LIMIT 1  ', '0.0005', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7983', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `id` = 8 LIMIT 1  ', '0.0004', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7984', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 0 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7985', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 7 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7986', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 14 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7987', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 24 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7988', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 62 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7989', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 159 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7990', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 15 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:27');
INSERT INTO `sql_log` VALUES ('7991', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 16 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7992', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 17 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7993', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 18 ORDER BY sort Asc ', '0.0005', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7994', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 19 ORDER BY sort Asc ', '0.0004', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7995', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 26 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7996', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 20 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7997', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 22 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7998', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 21 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('7999', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 23 ORDER BY sort Asc ', '0.0011', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8000', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 8 ORDER BY sort Asc ', '0.0013', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8001', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 25 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8002', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 9 ORDER BY sort Asc ', '0.0014', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8003', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 10 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8004', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 11 ORDER BY sort Asc ', '0.0015', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8005', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 12 ORDER BY sort Asc ', '0.0010', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8006', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 13 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8007', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 71 ORDER BY sort Asc ', '0.0012', '2017-12-20 17:57:28');
INSERT INTO `sql_log` VALUES ('8008', 'Admin', 'Menu/index', 'SELECT * FROM `auth_rule` WHERE `pid` = 202 ORDER BY sort Asc ', '0.0006', '2017-12-20 17:57:28');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员ID',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '会员电子邮箱',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '会员密码',
  `first_name` varchar(32) DEFAULT NULL COMMENT 'first name',
  `last_name` varchar(32) DEFAULT '' COMMENT 'last name',
  `real_name` varchar(60) DEFAULT '' COMMENT '会员真实姓名',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone_tel` varchar(60) DEFAULT '' COMMENT '座机号码',
  `phone_mob` varchar(60) DEFAULT '' COMMENT '手机号码',
  `fax` varchar(60) DEFAULT '' COMMENT '传真',
  `location` varchar(60) DEFAULT '' COMMENT '国家',
  `industry` varchar(60) DEFAULT '' COMMENT '行业',
  `company_name` varchar(60) DEFAULT '' COMMENT '公司名称',
  `reg_time` int(10) unsigned DEFAULT '0' COMMENT '注册时间',
  `last_login` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  `last_ip` char(15) DEFAULT '' COMMENT '最后登录IP',
  `logins` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `paypoints` int(10) unsigned DEFAULT '0' COMMENT '积分',
  `ugrade` tinyint(3) DEFAULT '0' COMMENT '用户等级',
  `portrait` varchar(255) DEFAULT '' COMMENT '头像照片地址',
  `activation` tinyint(2) DEFAULT '0' COMMENT '是否激活',
  `feed_config` text COMMENT '推送事件配置',
  `level` tinyint(4) DEFAULT '0' COMMENT '0:普通会员  1:待审核的VIP会员  2:VIP会员',
  `level_time` int(11) DEFAULT '0' COMMENT '会员晋升时间',
  PRIMARY KEY (`id`),
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '137726687@qq.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'abc', 'b', '', '0', null, 'a-b-c', '', 'a-b-c', '', '', '', '1459911635', '1484729909', '127.0.0.1', '21', '0', '0', '', '1', null, '0', '0');
INSERT INTO `user` VALUES ('2', '1031310562@qq.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'L', 'cy', '', '0', null, '', '', '', '', '', '', '1459912224', '1465693928', '127.0.0.1', '34', '10', '0', '', '1', null, '0', '0');
INSERT INTO `user` VALUES ('3', 'zft55052623@163.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'luffy', 'zhao', '', '0', null, '', '', '', '', '', '', '1459926319', '1471571316', '127.0.0.1', '8', '0', '0', '', '1', null, '0', '0');
INSERT INTO `user` VALUES ('4', '9387524@qq.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'fae', 'dfadf', '', '0', null, '', '', '', 'Gabon', 'IT', 'globex', '1460103493', '1460362952', '127.0.0.1', '2', '0', '0', '', '1', null, '0', '0');
INSERT INTO `user` VALUES ('5', 'LeeongPeng@globex.cn', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'fae', 'dfadf', '', '0', null, '', '', '', 'Gabon', 'IT', 'globex', '1460105673', null, '', '0', '0', '0', '', '1', null, '0', '0');
INSERT INTO `user` VALUES ('6', '103131052@qq.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'df', 'df', '', '0', null, '', '', '', 'df', 'df', 'df', '1461059440', null, '', '0', '0', '0', '', '0', null, '0', '0');
