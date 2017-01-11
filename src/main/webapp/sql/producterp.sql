/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : producterp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-01-10 18:41:03
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for navigator_user
-- ----------------------------
DROP TABLE IF EXISTS `navigator_user`;
CREATE TABLE `navigator_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `navigatorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

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
INSERT INTO `navigator_user` VALUES ('103', '4', '31');
INSERT INTO `navigator_user` VALUES ('104', '4', '32');
INSERT INTO `navigator_user` VALUES ('105', '4', '41');
INSERT INTO `navigator_user` VALUES ('106', '4', '42');
INSERT INTO `navigator_user` VALUES ('107', '4', '43');
INSERT INTO `navigator_user` VALUES ('108', '6', '31');
INSERT INTO `navigator_user` VALUES ('109', '6', '32');
INSERT INTO `navigator_user` VALUES ('110', '3', '31');
INSERT INTO `navigator_user` VALUES ('111', '3', '32');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('17', 'DV3', 'tes2', '照片', 'photo', null, null, null, null, null, '电子相册', 'e-photo', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '15.3', null, null, '2', '3', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '1: 【于 2016-12-28 23:18:37 由 王单爆 操作, 创建了商品信息】<br/>2: 【于 2017-01-05 10:02:06 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-05 15:16:28 由 玄奘-员工 操作, 修改了商品信息】<br/>4: 【于 2017-01-05 16:08:45 由 王单爆 操作, 修改了商品信息】', '2', '4', '2', '10', '2016-12-28 23:18:37', '2017-01-05 16:08:45', 'XM', '红色');
INSERT INTO `product` VALUES ('18', 'Y2639BL', 'Y2639', 'CAMP607移动式侧板滑轮', 'Lixada 20KN Small Mobile Single Pulley Swing Side Climbing Rigging Rescue', '', 'Lixada 20KN kleine mobile Einzel Pulley Schaukel Side Kletter Rigging-Rettung', 'リギングレスキュークライミングLixada 20KN小型モバイルシングルプーリースイングサイド', 'Lixada 20KN Piccolo mobile singolo puleggia oscillazione laterale arrampicata Rigging Rescue', 'Lixada 20KN Pequeño móvil polea simple swing Escalada Aparejo Rescate Side', '移动式侧板滑轮', 'Mobile Single Pulley', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-oYyw.jpg', '12.99', '', '', '1', '3', '4', '7', '', 'Hot up your summer collection with this alluring bikini set. It has vintage floral print, off the shoulder top and flattering low-rise bottom. A definite lust worthy piece that will turn heads like no other on beach.<br />\n<br />\n<strong>Features:</strong><br />\nCrafted from fine fabric, soft and smooth.<br />\nAll-over floral print and off the shoulder design.<br />\nBanded short sleeves and removable soft cups.<br />\nLow-rise waist and slim side straps.<br />\nIt has been cut with a bodycon fit.<br />\n<br />\n<strong>Specifications:</strong><br />\nItem Type: Bikini Set<br />\nSize: S (US2-4 UK4-6 EU30-32) / M (US4-6 UK6-8 EU32-34) / L (US6-8 UK8-10 EU34-36) / XL (US8-10 UK10-12 EU36-38) (optional)<br />\nColor: Black<br />\nGender: Women<br />\nMaterial: Nylon &amp; Spandex<br />\nPattern Type: Floral<br />\nCup Padding: Yes (Removable)<br />\nSupport Type: Wire Free<br />\nWaist: Low Waist<br />\nStyle: Sexy<br />\nWeight: Approx. 125-155g / 4.4-5.5oz<br />\n<br />\n<strong>Size Details:</strong>', '', '', '', '', '', '', '', '', '', '', '', '', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg', '1: 【于 2017-01-06 09:45:22 由 李四-主管 操作, 创建了商品信息】<br/>2: 【于 2017-01-10 14:11:26 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-10 14:12:25 由 王单爆 操作, 修改了商品信息】<br/>4: 【于 2017-01-10 18:33:49 由 王单爆 操作, 修改了商品信息】', '3', '4', null, '10', '2017-01-06 09:45:22', '2017-01-10 18:33:49', 'XL', '蓝色');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
INSERT INTO `product_audit` VALUES ('13', '3', '18', '通过', '2017-01-06 09:45:48');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

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
INSERT INTO `product_image` VALUES ('49', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg');
INSERT INTO `product_image` VALUES ('50', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-ywVK.jpg');
INSERT INTO `product_image` VALUES ('51', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-66zO.jpg');
INSERT INTO `product_image` VALUES ('52', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-Mcu3.jpg');

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
INSERT INTO `user` VALUES ('3', '李四-主管', '1042', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:49:45 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:05:20 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:44 由 {name}，修改了账号信息】<br/>4: 【于 2017-01-03 18:32:13 由 {name}，修改了账号信息】<br/>5: 【于 2017-01-06 09:36:57 由 {name}，修改了账号信息】', '2016-12-05 19:49:45', '10');
INSERT INTO `user` VALUES ('4', '玄奘-员工', '205', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:52:20 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:06:40 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:33 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:31:03 由 {name}，修改了账号信息】<br/>5: 【于 2017-01-03 16:19:02 由 {name}，修改了账号信息】', '2016-12-05 19:52:20', '5');
INSERT INTO `user` VALUES ('6', '经理-漠然', '204', '2jwecGD86G4=', '123', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:06:29 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:21 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:30:27 由 {name}，修改了账号信息】<br/>5: 【于 2016-12-25 17:30:36 由 {name}，修改了账号信息】<br/>6: 【于 2017-01-06 09:36:10 由 {name}，修改了账号信息】', '2016-12-05 19:52:37', '15');
INSERT INTO `user` VALUES ('7', '员工-小王', '203', '2jwecGD86G4=', '', '1', '', '1: 【于 2016-12-05 19:52:37 由 {name}，创建了该账号】<br/>2: 【于 2016-12-21 11:05:34 由 {name}，修改了账号信息】<br/>3: 【于 2016-12-25 17:29:00 由 {name}，修改了账号信息】<br/>4: 【于 2016-12-25 17:30:15 由 {name}，修改了账号信息】', '2016-12-05 19:52:37', '5');
