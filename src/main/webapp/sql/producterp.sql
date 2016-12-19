/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : producterp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-12-19 18:28:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for navigator
-- ----------------------------
DROP TABLE IF EXISTS `navigator`;
CREATE TABLE `navigator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nameCn` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `iconClass` varchar(255) DEFAULT NULL,
  `isParent` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator
-- ----------------------------
INSERT INTO `navigator` VALUES ('1', 'system.manage', '系统管理', null, 'icon-wrench', '1', '0', '1');
INSERT INTO `navigator` VALUES ('2', 'navigator.user.manage', '用户管理', '/system/userManage', 'icon-user', '0', '1', null);
INSERT INTO `navigator` VALUES ('3', 'product.center', '商品中心', null, 'icon-cubes', '1', '0', '2');
INSERT INTO `navigator` VALUES ('4', 'product.manage', '商品管理', '/product/productManage', 'icon-cubes', '0', '3', null);

-- ----------------------------
-- Table structure for navigator_user
-- ----------------------------
DROP TABLE IF EXISTS `navigator_user`;
CREATE TABLE `navigator_user` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `navigatorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator_user
-- ----------------------------
INSERT INTO `navigator_user` VALUES ('1', '2', '1');
INSERT INTO `navigator_user` VALUES ('2', '2', '2');
INSERT INTO `navigator_user` VALUES ('3', '2', '3');
INSERT INTO `navigator_user` VALUES ('4', '2', '4');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `description` text,
  `create_time` varchar(30) DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `log` text,
  `creator` int(11) DEFAULT NULL,
  `updateor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` char(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `log` text,
  `createTime` char(20) DEFAULT NULL,
  `updateTime` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '老张', '2028', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:46:01 由 {name}，创建了该账号】', '2016-12-05 19:46:01', '2016-12-05 19:46:01');
INSERT INTO `user` VALUES ('3', '李四', '1042', 'YeRz3EezyNw=', '', '0', '', '1: 【于 2016-12-05 19:49:45 由 {name}，创建了该账号】', '2016-12-05 19:49:45', '2016-12-05 19:49:45');
INSERT INTO `user` VALUES ('4', '2333', '123', 'J5xLW6wJJoQ=', '', '1', '', '1: 【于 2016-12-05 19:52:20 由 {name}，创建了该账号】', '2016-12-05 19:52:20', '2016-12-05 19:52:20');
INSERT INTO `user` VALUES ('5', '123', '12323', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('6', '1231', '12323', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('7', '1231', '123233df', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('8', '1231', '123233dff', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('9', '1231', '123233dffa', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('10', '1231', '123233dffas', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('11', '1231', '123233dffasd', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('12', '1231', '123233dffasds', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('13', '1231', '123233dffasdsd', '/cc49KdpWc8=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】', '2016-12-05 19:52:37', '2016-12-05 19:52:37');
INSERT INTO `user` VALUES ('14', '1231', '123233dffasdsd2aasdfs', '1ILFstgAJos=', '123', '0', '123@qq.com', '1: 【于 2016-12-08 18:50:59 由 老张，修改了账号信息】<br/>2: 【于 2016-12-08 18:55:12 由 老张，修改了账号信息】<br/>3: 【于 2016-12-08 18:56:30 由 老张，修改了账号信息】<br/>4: 【于 2016-12-08 18:57:09 由 老张，修改了账号信息】<br/>5: 【于 2016-12-08 18:58:10 由 老张，修改了账号信息】<br/>6: 【于 2016-12-08 18:58:23 由 老张，修改了账号信息】<br/>7: 【于 2016-12-13 14:22:45 由 老张，修改了账号信息】', '2016-12-05 19:52:37', '2016-12-13 14:22:45');
