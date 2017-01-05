/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : producterp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-01-05 18:24:48
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator
-- ----------------------------
INSERT INTO `navigator` VALUES ('29', 'system.manage', '系统管理', null, 'icon-wrench', '1', '0', '1');
INSERT INTO `navigator` VALUES ('30', 'navigator.user.manage', '用户管理', '/system/userManage', 'icon-user', '0', '29', null);
INSERT INTO `navigator` VALUES ('31', 'product.center', '商品中心', null, 'icon-cube-alt', '1', '0', '2');
INSERT INTO `navigator` VALUES ('32', 'product.manage', '商品管理', '/product/productManage', 'icon-cubes', '1', '31', null);
INSERT INTO `navigator` VALUES ('34', 'navigator.cdiscount.area', 'Cdiscount 专区', null, 'icon-shopping-cart', '1', '0', '3');
INSERT INTO `navigator` VALUES ('36', 'cdiscount.ean.manage', 'EAN管理', '/cdiscount/cdiscountEanManage', 'icon-user', '0', '34', null);
INSERT INTO `navigator` VALUES ('38', 'cdiscount.publish.manage', '刊登管理', '/cdiscount/cdiscountPublishManage', 'icon-user', '0', '34', null);
INSERT INTO `navigator` VALUES ('39', 'add.product', '添加产品', '/product/saveProduct', null, '0', '32', null);
INSERT INTO `navigator` VALUES ('40', 'batch.import.product', '批量导入商品', '/product/uploadProduct', null, '0', '32', null);
INSERT INTO `navigator` VALUES ('41', 'batch.distribute.edit.user', '批量分配编辑人', '/product/saveProductEditUser', null, '0', '32', null);
INSERT INTO `navigator` VALUES ('42', 'batch.distribute.publish.user', '批量分配刊登人', '/product/saveProductPublishUser', null, '0', '32', null);
INSERT INTO `navigator` VALUES ('43', 'batch.delete.product', '批量删除', '/product/deleteProductByIds', null, '0', '32', null);

-- ----------------------------
-- Table structure for navigator_user
-- ----------------------------
DROP TABLE IF EXISTS `navigator_user`;
CREATE TABLE `navigator_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `navigatorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator_user
-- ----------------------------
INSERT INTO `navigator_user` VALUES ('17', '14', '12');
INSERT INTO `navigator_user` VALUES ('18', '14', '13');
INSERT INTO `navigator_user` VALUES ('19', '14', '14');
INSERT INTO `navigator_user` VALUES ('20', '14', '8');
INSERT INTO `navigator_user` VALUES ('21', '14', '9');
INSERT INTO `navigator_user` VALUES ('22', '14', '10');
INSERT INTO `navigator_user` VALUES ('23', '14', '11');
INSERT INTO `navigator_user` VALUES ('47', '7', '29');
INSERT INTO `navigator_user` VALUES ('48', '7', '30');
INSERT INTO `navigator_user` VALUES ('49', '7', '31');
INSERT INTO `navigator_user` VALUES ('50', '7', '32');
INSERT INTO `navigator_user` VALUES ('51', '7', '34');
INSERT INTO `navigator_user` VALUES ('52', '7', '35');
INSERT INTO `navigator_user` VALUES ('53', '7', '36');
INSERT INTO `navigator_user` VALUES ('75', '2', '29');
INSERT INTO `navigator_user` VALUES ('76', '2', '30');
INSERT INTO `navigator_user` VALUES ('77', '2', '31');
INSERT INTO `navigator_user` VALUES ('78', '2', '32');
INSERT INTO `navigator_user` VALUES ('79', '2', '39');
INSERT INTO `navigator_user` VALUES ('80', '2', '40');
INSERT INTO `navigator_user` VALUES ('81', '2', '41');
INSERT INTO `navigator_user` VALUES ('82', '2', '42');
INSERT INTO `navigator_user` VALUES ('83', '2', '43');
INSERT INTO `navigator_user` VALUES ('84', '2', '34');
INSERT INTO `navigator_user` VALUES ('85', '2', '36');
INSERT INTO `navigator_user` VALUES ('86', '2', '38');
INSERT INTO `navigator_user` VALUES ('94', '4', '31');
INSERT INTO `navigator_user` VALUES ('95', '4', '32');
INSERT INTO `navigator_user` VALUES ('96', '3', '31');
INSERT INTO `navigator_user` VALUES ('97', '3', '32');
INSERT INTO `navigator_user` VALUES ('98', '3', '39');
INSERT INTO `navigator_user` VALUES ('99', '3', '40');
INSERT INTO `navigator_user` VALUES ('100', '3', '41');
INSERT INTO `navigator_user` VALUES ('101', '3', '42');
INSERT INTO `navigator_user` VALUES ('102', '3', '43');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `spu` varchar(255) DEFAULT NULL,
  `nameCn` varchar(255) DEFAULT NULL,
  `nameEn` varchar(255) DEFAULT NULL,
  `nameFr` varchar(255) DEFAULT NULL,
  `nameDe` varchar(255) DEFAULT NULL,
  `nameJp` varchar(255) DEFAULT NULL,
  `nameIt` varchar(255) DEFAULT NULL,
  `nameEs` varchar(255) DEFAULT NULL,
  `declarationNameCn` varchar(255) DEFAULT NULL,
  `declarationNameEn` varchar(255) DEFAULT NULL,
  `purchaseUrl` varchar(255) DEFAULT NULL,
  `purchasePrice` double DEFAULT NULL,
  `purchaseNotes` text,
  `salesNotes` text,
  `packageWeight` double DEFAULT NULL,
  `packageLength` double DEFAULT NULL,
  `packageWidth` double DEFAULT NULL,
  `packageHeight` double DEFAULT NULL,
  `descriptionCn` text,
  `descriptionEn` text,
  `descriptionFr` text,
  `descriptionDe` text,
  `descriptionJp` text,
  `descriptionIt` text,
  `descriptionEs` text,
  `briefDescriptionCn` text,
  `briefDescriptionIt` text,
  `briefDescriptionEs` text,
  `briefDescriptionJp` text,
  `briefDescriptionDe` text,
  `briefDescriptionFr` text,
  `briefDescriptionEn` text,
  `mainImage` varchar(255) DEFAULT NULL,
  `optionLog` text,
  `creatorId` int(11) DEFAULT NULL,
  `editorId` int(11) DEFAULT NULL,
  `publishUserId` int(11) DEFAULT NULL,
  `auditStatus` int(11) DEFAULT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  `updateTime` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('17', 'DV3', 'tes2', '照片', 'photo', null, null, null, null, null, '电子相册', 'e-photo', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '15.3', null, null, '2', '3', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '1: 【于 2016-12-28 23:18:37 由 王单爆 操作, 创建了商品信息】<br/>2: 【于 2017-01-05 10:02:06 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-05 15:16:28 由 玄奘-员工 操作, 修改了商品信息】<br/>4: 【于 2017-01-05 16:08:45 由 王单爆 操作, 修改了商品信息】', '2', '4', '2', '20', '2016-12-28 23:18:37', '2017-01-05 16:08:45', 'XM', '红色');

-- ----------------------------
-- Table structure for product_audit
-- ----------------------------
DROP TABLE IF EXISTS `product_audit`;
CREATE TABLE `product_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `comment` text,
  `createTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_audit
-- ----------------------------
INSERT INTO `product_audit` VALUES ('1', '3', '15', '产品已编辑好请领导审核', '2016-04-05 17:28:38');
INSERT INTO `product_audit` VALUES ('2', '2', '15', '好，已经审核', '2016-04-08 17:28:38');
INSERT INTO `product_audit` VALUES ('3', '4', '15', '老大请审核', '2017-01-04 18:15:03');
INSERT INTO `product_audit` VALUES ('4', '4', '17', '请领导审核', '2017-01-05 15:04:33');
INSERT INTO `product_audit` VALUES ('5', '2', '17', '价格再降低些', '2017-01-05 15:14:49');
INSERT INTO `product_audit` VALUES ('6', '4', '17', '改好了', '2017-01-05 15:17:18');
INSERT INTO `product_audit` VALUES ('7', '2', '17', '通过', '2017-01-05 15:28:41');
INSERT INTO `product_audit` VALUES ('8', '4', '17', '212', '2017-01-05 16:37:01');
INSERT INTO `product_audit` VALUES ('9', '2', '17', '通过', '2017-01-05 16:50:12');
INSERT INTO `product_audit` VALUES ('10', '2', '17', '通过', '2017-01-05 16:51:45');
INSERT INTO `product_audit` VALUES ('11', '2', '17', '23', '2017-01-05 17:03:32');
INSERT INTO `product_audit` VALUES ('12', '2', '17', '通过', '2017-01-05 17:03:48');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('1', '2', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');
INSERT INTO `product_image` VALUES ('2', '2', 'http://www.guphotos.com/images/H/H10883/H10883-3-065a.JPG');
INSERT INTO `product_image` VALUES ('3', '3', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');
INSERT INTO `product_image` VALUES ('4', '3', 'http://www.guphotos.com/images/H/H10883/H10883-3-065a.JPG');
INSERT INTO `product_image` VALUES ('5', '3', 'http://www.guphotos.com/images/H/H10883/H10883-3-065a.JPG');
INSERT INTO `product_image` VALUES ('6', '3', 'http://www.guphotos.com/images/H/H10883/H10883-1-065a-dK5z.jpg');
INSERT INTO `product_image` VALUES ('7', '3', 'http://www.guphotos.com/images/H/H10883/H10883-5-065a.JPG');
INSERT INTO `product_image` VALUES ('36', '17', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');

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
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '王单爆', '2028', '2jwecGD86G4=', '18677112630', '1', '312651213@qq.com', '1: 【于 2016-12-05 19:46:01 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 09:51:53 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-21 09:52:00 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-21 09:52:14 由 {name}，修改了账号信息】<br/>5: 【于 2016-12-21 09:52:26 由 {name}，修改了账号信息】<br/>6: 【于 2016-12-21 09:52:37 由 {name}，修改了账号信息】<br/>7: 【于 2016-12-21 09:55:28 由 {name}，修改了账号信息】<br/>8: 【于 2016-12-21 09:55:47 由 {name}，修改了账号信息】<br/>9: 【于 2016-12-21 09:56:03 由 {name}，修改了账号信息】<br/>10: 【于 2016-12-21 11:05:10 由 {name}，修改了账号信息】<br/>11: 【于 2016-12-25 17:28:39 由 {name}，修改了账号信息】<br/>12: 【于 2016-12-25 18:07:01 由 {name}，修改了账号信息】<br/>13: 【于 2016-12-25 18:07:35 由 {name}，修改了账号信息】<br/>14: 【于 2016-12-25 18:08:00 由 {name}，修改了账号信息】<br/>15: 【于 2016-12-25 18:08:34 由 {name}，修改了账号信息】<br/>16: 【于 2016-12-25 18:09:07 由 {name}，修改了账号信息】', '2016-12-05 19:46:01', '100');
INSERT INTO `user` VALUES ('3', '李四-主管', '1042', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:49:45 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:05:20 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:44 由 {name}，修改了账号信息】<br/>4: 【于 2017-01-03 18:32:13 由 {name}，修改了账号信息】', '2016-12-05 19:49:45', '10');
INSERT INTO `user` VALUES ('4', '玄奘-员工', '205', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:52:20 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:06:40 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:33 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:31:03 由 {name}，修改了账号信息】<br/>5: 【于 2017-01-03 16:19:02 由 {name}，修改了账号信息】', '2016-12-05 19:52:20', '5');
INSERT INTO `user` VALUES ('6', '经理-漠然', '204', '2jwecGD86G4=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:06:29 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:21 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:30:27 由 {name}，修改了账号信息】<br/>5: 【于 2016-12-25 17:30:36 由 {name}，修改了账号信息】', '2016-12-05 19:52:37', '15');
INSERT INTO `user` VALUES ('7', '员工-小王', '203', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:05:34 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:00 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:30:15 由 {name}，修改了账号信息】', '2016-12-05 19:52:37', '5');
