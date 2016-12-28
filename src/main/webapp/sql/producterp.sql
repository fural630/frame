/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : producterp

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2016-12-29 00:02:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for navigator
-- ----------------------------
DROP TABLE IF EXISTS `navigator`;
CREATE TABLE `navigator` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `nameCn` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `iconClass` varchar(255) default NULL,
  `isParent` int(11) default NULL,
  `parentId` int(11) default NULL,
  `sort` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator
-- ----------------------------
INSERT INTO `navigator` VALUES ('8', 'system.manage', '系统管理', null, 'icon-wrench', '1', '0', '1');
INSERT INTO `navigator` VALUES ('9', 'navigator.user.manage', '用户管理', '/system/userManage', 'icon-user', '0', '8', null);
INSERT INTO `navigator` VALUES ('10', 'product.center', '商品中心', null, 'icon-cube-alt', '1', '0', '2');
INSERT INTO `navigator` VALUES ('11', 'product.manage', '商品管理', '/product/productManage', 'icon-cubes', '0', '10', null);
INSERT INTO `navigator` VALUES ('12', 'navigator.cdiscount.area', 'Cdiscount 专区', null, 'icon-shopping-cart', '1', '0', '3');
INSERT INTO `navigator` VALUES ('13', 'cdiscount.publish.manage', '刊登管理', '/cdiscount/cdiscountPublishManage', 'icon-user', '0', '12', null);
INSERT INTO `navigator` VALUES ('14', 'cdiscount.ean.manage', 'EAN管理', '/cdiscount/cdiscountEanManage', 'icon-user', '0', '12', null);

-- ----------------------------
-- Table structure for navigator_user
-- ----------------------------
DROP TABLE IF EXISTS `navigator_user`;
CREATE TABLE `navigator_user` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL,
  `navigatorId` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `navigator_user` VALUES ('24', '2', '8');
INSERT INTO `navigator_user` VALUES ('25', '2', '9');
INSERT INTO `navigator_user` VALUES ('26', '2', '10');
INSERT INTO `navigator_user` VALUES ('27', '2', '11');
INSERT INTO `navigator_user` VALUES ('28', '2', '12');
INSERT INTO `navigator_user` VALUES ('29', '2', '13');
INSERT INTO `navigator_user` VALUES ('30', '2', '14');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `sku` varchar(255) default NULL,
  `spu` varchar(255) default NULL,
  `nameCn` varchar(255) default NULL,
  `nameEn` varchar(255) default NULL,
  `nameFr` varchar(255) default NULL,
  `nameDe` varchar(255) default NULL,
  `nameJp` varchar(255) default NULL,
  `nameIt` varchar(255) default NULL,
  `nameEs` varchar(255) default NULL,
  `declarationNameCn` varchar(255) default NULL,
  `declarationNameEn` varchar(255) default NULL,
  `purchaseUrl` varchar(255) default NULL,
  `purchasePrice` double default NULL,
  `purchaseNotes` text,
  `salesNotes` text,
  `packageWeight` double default NULL,
  `packageLength` double default NULL,
  `packageWidth` double default NULL,
  `packageHeight` double default NULL,
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
  `mainImage` varchar(255) default NULL,
  `optionLog` text,
  `creatorId` int(11) default NULL,
  `editorId` int(11) default NULL,
  `publishUserId` int(11) default NULL,
  `auditStatus` int(11) default NULL,
  `createTime` varchar(255) default NULL,
  `updateTime` varchar(255) default NULL,
  `size` varchar(255) default NULL,
  `color` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'D3', 'D4-3', '烘焙模具 六件套', 'cooking accessory', null, null, null, null, null, null, null, 'http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH', '50', '备注1', '销售备注2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '日志', '2', '2', '2', '10', '2016-10-24 16:09:34', '2016-10-28 16:09:34', null, null);
INSERT INTO `product` VALUES ('4', 'H108831', 'H10883-S', '香甜味玉米粒路亚软饵 假饵 淡水饵', 'Lixada', 'Lixada 30Pcs Leurre de pêche Appâts souples Simulation de grains de maïs avec Odeur de maïs', '', '', '', '', '', '', '', '5.49', '采购备', '销售备', '21.2', '11', '10', '0.5', '', '', '<strong>Sp&eacute;cifications:</strong><br />\nType: app&acirc;ts souple<br />\nQuantit&eacute;: 30pcs<br />\nMati&egrave;re: PVC<br />\nTaille de l&#39;emballage: Env. 11 * 10 * 0.5cm / 4.3 * 3.9 * 0.2in<br />\nPoids total: env. 15g / 0,5 oz<br />\n<br />\n<strong>Liste des paquets:</strong><br />\n30 * Leurres souple', '', '', '', '', '', '', '', '', '', 'Lixada 30Pcs Leurre de p&ecirc;che App&acirc;ts souples Simulation de grains de ma&iuml;s avec Odeur de ma&iuml;s', '', 'http://www.guphotos.com/images/H/H10883/H10883-1-065a-dK5z.jpg', '1: 【于 2016-12-23 14:18:04 由 老张1 操作, 创建商品】<br/>2: 【于 2016-12-23 17:34:25 由 老张1 操作, 修改了商品信息】<br/>3: 【于 2016-12-23 17:34:50 由 老张1 操作, 修改了商品信息】<br/>4: 【于 2016-12-23 17:46:22 由 老张1 操作, 修改了商品信息】<br/>5: 【于 2016-12-23 17:46:30 由 老张1 操作, 修改了商品信息】<br/>6: 【于 2016-12-24 11:51:49 由 老张1 操作, 修改了商品信息】<br/>7: 【于 2016-12-24 11:51:57 由 老张1 操作, 修改了商品信息】<br/>8: 【于 2016-12-24 11:55:38 由 老张1 操作, 修改了商品信息】', '2', '2', null, '10', '2016-12-23 14:18:04', '2016-12-24 11:55:38', null, null);
INSERT INTO `product` VALUES ('10', 'D10', 'D4-3', '烘焙模具 六件套', 'cooking accessory', null, null, null, null, null, null, null, 'http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH', '50', '备注1', '销售备注2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '日志', '2', '4', '6', '10', '2016-10-24 16:09:34', '2016-10-28 16:09:34', null, null);
INSERT INTO `product` VALUES ('11', 'D11', 'D4-3', '烘焙模具 六件套', 'cooking accessory', null, null, null, null, null, null, null, 'http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH', '50', '备注1', '销售备注2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '日志', '2', '4', '6', '10', '2016-10-24 16:09:34', '2016-10-28 16:09:34', null, null);
INSERT INTO `product` VALUES ('12', 'D12', 'D4-3', '烘焙模具 六件套', 'cooking accessory', null, null, null, null, null, null, null, 'http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH', '50', '备注1', '销售备注2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '日志', '2', '4', '6', '10', '2016-10-24 16:09:34', '2016-10-28 16:09:34', null, null);
INSERT INTO `product` VALUES ('13', 'D13', 'D4-3', '烘焙模具 六件套', 'cooking accessory', null, null, null, null, null, null, null, 'http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH', '50', '备注1', '销售备注2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '日志', '2', '4', '6', '10', '2016-10-24 16:09:34', '2016-10-28 16:09:34', null, null);
INSERT INTO `product` VALUES ('14', 'D14', 'D4-3', '烘焙模具 六件套', 'cooking accessory', null, null, null, null, null, null, null, 'http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH', '50', '备注1', '销售备注2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '日志', '2', '4', '6', '10', '2016-10-24 16:09:34', '2016-10-28 16:09:34', null, null);
INSERT INTO `product` VALUES ('15', 'D15', 'D4-3', '烘焙模具 六件套', 'cooking accessory', null, null, null, null, null, null, null, 'http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH', '50', '备注1', '销售备注2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '日志<br/>1: 【于 2016-12-24 11:46:14 由 老张1 操作, 修改了商品信息】<br/>2: 【于 2016-12-24 11:49:08 由 老张1 操作, 修改了商品信息】', '2', '3', '7', '10', '2016-10-24 16:09:34', '2016-12-24 11:49:08', null, null);
INSERT INTO `product` VALUES ('16', 'test1', 'tes2', '照片', 'photo', null, null, null, null, null, '电子相册', 'e-photo', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '3', null, null, '2', '3', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '1: 【于 2016-12-28 23:13:07 由 王单爆 操作, 创建了商品信息】', '2', null, null, '10', '2016-12-28 23:13:07', '2016-12-28 23:13:07', null, null);
INSERT INTO `product` VALUES ('17', 'DV3', 'tes2', '照片', 'photo', null, null, null, null, null, '电子相册', 'e-photo', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '3', null, null, '2', '3', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '1: 【于 2016-12-28 23:18:37 由 王单爆 操作, 创建了商品信息】', '2', null, null, '10', '2016-12-28 23:18:37', '2016-12-28 23:18:37', 'XM', '红色');

-- ----------------------------
-- Table structure for product_audit
-- ----------------------------
DROP TABLE IF EXISTS `product_audit`;
CREATE TABLE `product_audit` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `productId` int(11) default NULL,
  `comment` text,
  `createTime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_audit
-- ----------------------------
INSERT INTO `product_audit` VALUES ('1', '3', '15', '产品已编辑好请领导审核', '2016-04-05 17:28:38');
INSERT INTO `product_audit` VALUES ('2', '2', '15', '好，已经审核', '2016-04-08 17:28:38');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL auto_increment,
  `productId` int(11) default NULL,
  `imageUrl` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `product_image` VALUES ('25', '15', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');
INSERT INTO `product_image` VALUES ('30', '4', 'http://www.guphotos.com/images/H/H10883/H10883-1-065a-dK5z.jpg');
INSERT INTO `product_image` VALUES ('31', '4', 'http://www.guphotos.com/images/H/H10883/H10883-5-065a.JPG');
INSERT INTO `product_image` VALUES ('32', '16', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');
INSERT INTO `product_image` VALUES ('33', '17', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL auto_increment,
  `role_name` varchar(100) default NULL,
  `description` text,
  `create_time` varchar(30) default NULL,
  `update_time` varchar(30) default NULL,
  `log` text,
  `creator` int(11) default NULL,
  `updateor` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `userName` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `phone` char(30) default NULL,
  `status` int(11) default NULL,
  `email` varchar(255) default NULL,
  `log` text,
  `createTime` char(20) default NULL,
  `role` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '王单爆', '2028', '2jwecGD86G4=', '18677112630', '1', '312651213@qq.com', '1: 【于 2016-12-05 19:46:01 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 09:51:53 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-21 09:52:00 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-21 09:52:14 由 {name}，修改了账号信息】<br/>5: 【于 2016-12-21 09:52:26 由 {name}，修改了账号信息】<br/>6: 【于 2016-12-21 09:52:37 由 {name}，修改了账号信息】<br/>7: 【于 2016-12-21 09:55:28 由 {name}，修改了账号信息】<br/>8: 【于 2016-12-21 09:55:47 由 {name}，修改了账号信息】<br/>9: 【于 2016-12-21 09:56:03 由 {name}，修改了账号信息】<br/>10: 【于 2016-12-21 11:05:10 由 {name}，修改了账号信息】<br/>11: 【于 2016-12-25 17:28:39 由 {name}，修改了账号信息】<br/>12: 【于 2016-12-25 18:07:01 由 {name}，修改了账号信息】<br/>13: 【于 2016-12-25 18:07:35 由 {name}，修改了账号信息】<br/>14: 【于 2016-12-25 18:08:00 由 {name}，修改了账号信息】<br/>15: 【于 2016-12-25 18:08:34 由 {name}，修改了账号信息】<br/>16: 【于 2016-12-25 18:09:07 由 {name}，修改了账号信息】', '2016-12-05 19:46:01', '100');
INSERT INTO `user` VALUES ('3', '李四-主管', '1042', 'YeRz3EezyNw=', '', '1', '', '1: 【于 2016-12-05 19:49:45 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:05:20 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:44 由 {name}，修改了账号信息】', '2016-12-05 19:49:45', '10');
INSERT INTO `user` VALUES ('4', '玄奘-员工', '205', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:52:20 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:06:40 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:33 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:31:03 由 {name}，修改了账号信息】', '2016-12-05 19:52:20', '5');
INSERT INTO `user` VALUES ('6', '经理-漠然', '204', '2jwecGD86G4=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:06:29 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:21 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:30:27 由 {name}，修改了账号信息】<br/>5: 【于 2016-12-25 17:30:36 由 {name}，修改了账号信息】', '2016-12-05 19:52:37', '15');
INSERT INTO `user` VALUES ('7', '员工-小王', '203', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:05:34 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:00 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:30:15 由 {name}，修改了账号信息】', '2016-12-05 19:52:37', '5');
