/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : psm

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2018-06-28 18:01:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for codes
-- ----------------------------
DROP TABLE IF EXISTS `codes`;
CREATE TABLE `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `holdername` varchar(50) DEFAULT NULL,
  `isall` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of codes
-- ----------------------------
INSERT INTO `codes` VALUES ('3', 'autoFill', 'rent', '100', '', 'huang', null);

-- ----------------------------
-- Table structure for elsedetail
-- ----------------------------
DROP TABLE IF EXISTS `elsedetail`;
CREATE TABLE `elsedetail` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `times` date DEFAULT NULL,
  `column_name` varchar(50) DEFAULT NULL,
  `value` int(7) DEFAULT NULL,
  `holder_name` varchar(100) DEFAULT NULL,
  `expense_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of elsedetail
-- ----------------------------

-- ----------------------------
-- Table structure for expense
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense` (
  `id` varchar(50) NOT NULL,
  `times` date DEFAULT NULL,
  `income_total` int(7) DEFAULT NULL,
  `profit` int(7) DEFAULT NULL,
  `cost_daily` int(7) DEFAULT NULL,
  `eating` int(7) DEFAULT NULL,
  `supermarket` int(7) DEFAULT NULL,
  `party` int(7) DEFAULT NULL,
  `rent` int(7) DEFAULT NULL,
  `trafficexp` int(7) DEFAULT NULL,
  `elsecost` int(7) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `clothes` int(7) DEFAULT NULL,
  `book` int(7) DEFAULT NULL,
  `holdername` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense
-- ----------------------------
INSERT INTO `expense` VALUES ('9f00419acf3e479c8c1b372b89314004', '2018-06-26', '1000', '900', '100', null, null, null, '100', null, null, '', null, null, 'huang');

-- ----------------------------
-- Table structure for fuser
-- ----------------------------
DROP TABLE IF EXISTS `fuser`;
CREATE TABLE `fuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `showname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fuser
-- ----------------------------
INSERT INTO `fuser` VALUES ('1', 'huang', '123456', '上帝');
INSERT INTO `fuser` VALUES ('2', 'test', '123456', '平民');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL DEFAULT '0',
  `available` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `resource_type` enum('menu','button') CHARACTER SET latin1 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '\0', '用户管理', '0', '0/', 'userInfo:view', 'menu', 'userInfo/userList');
INSERT INTO `permission` VALUES ('2', '\0', '用户添加', '1', '0/1', 'userInfo:add', 'button', 'userInfo/userAdd');
INSERT INTO `permission` VALUES ('3', '\0', '用户删除', '1', '0/1', 'userInfo:del', 'button', 'userInfo/userDel');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `role` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', 'admin');
INSERT INTO `role` VALUES ('2', 'VIP会员', 'vip');
INSERT INTO `role` VALUES ('3', 'test', 'test');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('3', '2', '1');
INSERT INTO `role_permission` VALUES ('4', '3', '2');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');
