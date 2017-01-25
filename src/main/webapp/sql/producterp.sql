/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : producterp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-01-25 14:14:27
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator
-- ----------------------------
INSERT INTO `navigator` VALUES ('46', 'system.manage', '系统管理', null, 'icon-wrench', '1', '0', '1');
INSERT INTO `navigator` VALUES ('47', 'navigator.user.manage', '用户管理', '/system/userManage', 'icon-user', '0', '46', null);
INSERT INTO `navigator` VALUES ('48', 'product.center', '商品中心', null, 'icon-cube-alt', '1', '0', '2');
INSERT INTO `navigator` VALUES ('49', 'product.manage', '商品管理', '/product/productManage', 'icon-cubes', '0', '48', null);
INSERT INTO `navigator` VALUES ('50', 'navigator.cdiscount.area', 'Cdiscount 专区', null, 'icon-shopping-cart', '1', '0', '4');
INSERT INTO `navigator` VALUES ('51', 'cdiscount.publish.manage', '刊登管理', '/cdiscount/cdiscountPublishManage', 'icon-user', '0', '50', null);
INSERT INTO `navigator` VALUES ('52', 'cdiscount.ean.manage', 'EAN管理', '/cdiscount/cdiscountEanManage', 'icon-user', '0', '50', null);
INSERT INTO `navigator` VALUES ('53', 'navigator.shopee.area', 'Shopee 专区', null, 'icon-shopping-cart', '1', '0', '3');
INSERT INTO `navigator` VALUES ('54', 'shopee.publish.manage', '刊登管理', '/shopee/shopeePublishManage', 'icon-table', '0', '53', null);
INSERT INTO `navigator` VALUES ('55', 'shopee.category.manage', '类别管理', '/shopee/shopeeCategoryManage', 'icon-bars', '0', '53', null);

-- ----------------------------
-- Table structure for navigator_user
-- ----------------------------
DROP TABLE IF EXISTS `navigator_user`;
CREATE TABLE `navigator_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `navigatorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator_user
-- ----------------------------
INSERT INTO `navigator_user` VALUES ('1', '3', '48');
INSERT INTO `navigator_user` VALUES ('2', '3', '49');
INSERT INTO `navigator_user` VALUES ('5', '4', '48');
INSERT INTO `navigator_user` VALUES ('6', '4', '49');
INSERT INTO `navigator_user` VALUES ('7', '4', '53');
INSERT INTO `navigator_user` VALUES ('8', '4', '54');
INSERT INTO `navigator_user` VALUES ('9', '4', '55');
INSERT INTO `navigator_user` VALUES ('10', '7', '53');
INSERT INTO `navigator_user` VALUES ('11', '7', '54');
INSERT INTO `navigator_user` VALUES ('12', '7', '55');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('17', 'DV3', 'Y2639', '照片', 'photo', null, null, null, null, null, '电子相册', 'e-photo', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '15.3', null, null, '2', '3', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '1: 【于 2016-12-28 23:18:37 由 王单爆 操作, 创建了商品信息】<br/>2: 【于 2017-01-05 10:02:06 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-05 15:16:28 由 玄奘-员工 操作, 修改了商品信息】<br/>4: 【于 2017-01-05 16:08:45 由 王单爆 操作, 修改了商品信息】<br/>5: 【于 2017-01-18 17:49:32 由 王单爆 操作, 修改了商品信息】<br/>6: 【于 2017-01-20 18:21:30 由 玄奘-员工 操作, 修改了商品信息】<br/>7: 【于 2017-01-20 18:22:14 由 玄奘-员工 操作, 修改了商品信息】', '2', '4', '4', '10', '2016-12-28 23:18:37', '2017-01-20 18:22:14', 'XMt', '红色');
INSERT INTO `product` VALUES ('18', 'Y2639BL', 'Y2639', 'CAMP607移动式侧板滑轮', 'Lixada 20KN Small Mobile Single Pulley Swing Side Climbing Rigging Rescue', '', 'Lixada 20KN kleine mobile Einzel Pulley Schaukel Side Kletter Rigging-Rettung', 'リギングレスキュークライミングLixada 20KN小型モバイルシングルプーリースイングサイド', 'Lixada 20KN Piccolo mobile singolo puleggia oscillazione laterale arrampicata Rigging Rescue', 'Lixada 20KN Pequeño móvil polea simple swing Escalada Aparejo Rescate Side', '移动式侧板滑轮', 'Mobile Single Pulley', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-oYyw.jpg', '12.99', '', '', '1', '3', '4', '7', '', 'Hot up your summer collection with this alluring bikini set. It has vintage floral print, off the shoulder top and flattering low-rise bottom. A definite lust worthy piece that will turn heads like no other on beach.<br />\n<br />\n&nbsp;', 'Hot votre collection d&amp;#39;&eacute;t&eacute; avec cet ensemble de bikini s&eacute;duisant. Il a imprim&eacute; floral vintage, du haut de l&amp;#39;&eacute;paule et en bas de faible hauteur flatteur. Une convoitise pi&egrave;ce digne d&eacute;finitive qui fera tourner les t&ecirc;tes comme aucun autre sur la plage.<br />\n&nbsp;', 'Hot up Ihre Sommer-Kollektion mit diesem verf&uuml;hrerischen Bikini-Set. Es hat Jahrgang Blumendruck, weg von der Schulter oben und schmeichelnd Flachbau unten. Eine definitive Lust w&uuml;rdig St&uuml;ck, die K&ouml;pfe wie kein anderer am Strand verwandeln wird.<br />\n&nbsp;', 'ホットアップこの魅力的なビキニセットであなたの夏のコレクション。これは、肩の上部と世辞低層の底から、ヴィンテージの花柄を持っています。ビーチで他に類をみない頭を向けるだろう明確な欲望に値する作品。<br />\n&nbsp;', 'Hot la vostra collezione estiva con questo set bikini seducente. Ha stampa floreale d&amp;#39;epoca, fuori dalla parte superiore della spalla e lusinghiero in basso a vita bassa. Decisamente un desiderio degno pezzo che non passa inosservato come nessun altro sulla spiaggia.<br />\n&nbsp;', 'Caliente hasta su colecci&oacute;n de verano con este conjunto de bikini atractivo. Tiene la impresi&oacute;n floral de la vendimia, de la parte superior del hombro y favorecedor parte inferior de poca altura. Un deseo definitivo pieza digna que har&aacute; girar las cabezas como ning&uacute;n otro en la playa.<br />\n&nbsp;', '', '', '', '', '', '', '', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg', '1: 【于 2017-01-06 09:45:22 由 李四-主管 操作, 创建了商品信息】<br/>2: 【于 2017-01-10 14:11:26 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-10 14:12:25 由 王单爆 操作, 修改了商品信息】<br/>4: 【于 2017-01-10 18:33:49 由 王单爆 操作, 修改了商品信息】<br/>5: 【于 2017-01-11 12:29:15 由 王单爆 操作, 修改了商品信息】<br/>6: 【于 2017-01-20 17:12:28 由 玄奘-员工 操作, 修改了商品信息】<br/>7: 【于 2017-01-20 18:11:05 由 玄奘-员工 操作, 修改了商品信息】<br/>8: 【于 2017-01-20 18:12:52 由 玄奘-员工 操作, 修改了商品信息】<br/>9: 【于 2017-01-20 18:15:33 由 玄奘-员工 操作, 修改了商品信息】<br/>10: 【于 2017-01-20 18:16:00 由 王单爆 操作, 修改了商品信息】<br/>11: 【于 2017-01-20 18:20:31 由 玄奘-员工 操作, 修改了商品信息】<br/>12: 【于 2017-01-20 18:20:44 由 玄奘-员工 操作, 修改了商品信息】', '3', '4', '4', '20', '2017-01-06 09:45:22', '2017-01-20 18:20:44', 'XL12', '蓝色');
INSERT INTO `product` VALUES ('20', 'W3770-B', 'W3770', '医用心脏心血管听诊器', '', '', '', '', '', '', '', '', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 12:05:51 由 王单爆 操作, 创建了商品信息】', '2', null, '4', '5', '2017-01-21 12:05:51', '2017-01-21 12:05:51', '', 'B');
INSERT INTO `product` VALUES ('21', 'W3770-BL', 'W3770', '医用心脏心血管听诊器', '', '', '', '', '', '', '', '', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 12:05:52 由 王单爆 操作, 创建了商品信息】', '2', null, '7', '5', '2017-01-21 12:05:52', '2017-01-21 12:05:52', '', 'BL');
INSERT INTO `product` VALUES ('22', 'W3770-PU', 'W3770', '医用心脏心血管听诊器', '', '', '', '', '', '', '', '', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 12:05:52 由 王单爆 操作, 创建了商品信息】', '2', null, null, '5', '2017-01-21 12:05:52', '2017-01-21 12:05:52', '', 'PU');
INSERT INTO `product` VALUES ('23', 'W3770-R', 'W3770', '医用心脏心血管听诊器', '', '', '', '', '', '', '', '', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 12:05:52 由 王单爆 操作, 创建了商品信息】<br/>2: 【于 2017-01-21 12:10:17 由 王单爆 操作, 修改了商品信息】', '2', null, null, '5', '2017-01-21 12:05:52', '2017-01-21 12:10:17', '', 'R');
INSERT INTO `product` VALUES ('24', 'W3770-RT', 'W3770', '', '', '', '', '', '', '', '', '', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 12:13:30 由 王单爆 操作, 创建了商品信息】', '2', null, null, '5', '2017-01-21 12:13:30', '2017-01-21 12:13:30', '', '');
INSERT INTO `product` VALUES ('25', 'W3770-X', 'W3770', '23', '23', '', '', '', '', '', '23', '12', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 14:14:10 由 王单爆 操作, 创建了商品信息】', '2', null, null, '5', '2017-01-21 14:14:10', '2017-01-21 14:14:10', '', 'X');
INSERT INTO `product` VALUES ('26', 'W3770-T', 'W3770', '23', '23', '', '', '', '', '', '23', '12', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 14:14:10 由 王单爆 操作, 创建了商品信息】<br/>2: 【于 2017-01-21 14:14:42 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-21 14:26:54 由 王单爆 操作, 修改了商品信息】', '2', null, null, '5', '2017-01-21 14:14:10', '2017-01-21 14:26:54', 'D', '');
INSERT INTO `product` VALUES ('27', 'W3770-23', 'W3770', '23', '23', '', '', '', '', '', '23', '12', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-21 14:14:10 由 王单爆 操作, 创建了商品信息】', '2', null, null, '5', '2017-01-21 14:14:10', '2017-01-21 14:14:10', '', 'dD');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_audit
-- ----------------------------
INSERT INTO `product_audit` VALUES ('1', '2', '19', '图片再整理一下', '2017-01-20 17:28:16');
INSERT INTO `product_audit` VALUES ('2', '2', '18', '描述再翻译好点', '2017-01-20 17:29:02');
INSERT INTO `product_audit` VALUES ('3', '2', '18', '通过', '2017-01-20 18:16:23');
INSERT INTO `product_audit` VALUES ('4', '4', '17', '请审核', '2017-01-20 18:21:47');
INSERT INTO `product_audit` VALUES ('5', '2', '17', '通过', '2017-01-20 18:23:01');
INSERT INTO `product_audit` VALUES ('6', '2', '17', '再改一下描述', '2017-01-20 18:23:59');
INSERT INTO `product_audit` VALUES ('7', '4', '17', '请审核', '2017-01-20 18:26:44');
INSERT INTO `product_audit` VALUES ('8', '2', '17', '123', '2017-01-20 18:34:47');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

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
INSERT INTO `product_image` VALUES ('82', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg');
INSERT INTO `product_image` VALUES ('83', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-ywVK.jpg');
INSERT INTO `product_image` VALUES ('84', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-Mcu3.jpg');
INSERT INTO `product_image` VALUES ('85', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-66zO.jpg');
INSERT INTO `product_image` VALUES ('87', '17', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');

-- ----------------------------
-- Table structure for shopee_category
-- ----------------------------
DROP TABLE IF EXISTS `shopee_category`;
CREATE TABLE `shopee_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `importTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3716 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopee_category
-- ----------------------------
INSERT INTO `shopee_category` VALUES ('2950', 'Women\'s Clothing', '0', '1', null, '2017-01-25 12:19:34');
INSERT INTO `shopee_category` VALUES ('2951', 'Dresses', '2950', '2', null, '2017-01-25 12:19:34');
INSERT INTO `shopee_category` VALUES ('2952', 'Others', '2951', '3', '4976', '2017-01-25 12:19:34');
INSERT INTO `shopee_category` VALUES ('2953', 'Maxi Dresses', '2951', '3', '6590', '2017-01-25 12:19:34');
INSERT INTO `shopee_category` VALUES ('2954', 'Midi Dresses', '2951', '3', '6589', '2017-01-25 12:19:34');
INSERT INTO `shopee_category` VALUES ('2955', 'Mini Dresses', '2951', '3', '6588', '2017-01-25 12:19:34');
INSERT INTO `shopee_category` VALUES ('2956', 'Tops', '2950', '2', null, '2017-01-25 12:19:34');
INSERT INTO `shopee_category` VALUES ('2957', 'Others', '2956', '3', '4981', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2958', 'Couple Wear', '2956', '3', '6564', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2959', 'Blouse', '2956', '3', '6556', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2960', 'Shirts', '2956', '3', '6562', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2961', 'Tanks & Camisoles', '2956', '3', '6563', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2962', 'Crop Tops', '2956', '3', '6557', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2963', 'T-Shirts', '2956', '3', '6561', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2964', 'Off Shoulder Tops', '2956', '3', '9564', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2965', 'Pants & Shorts', '2950', '2', null, '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2966', 'Jeans', '2965', '3', '6597', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2967', 'Long Pants', '2965', '3', '6598', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2968', 'Others', '2965', '3', '4971', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2969', 'Leggings', '2965', '3', '6601', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2970', 'Shorts', '2965', '3', '6599', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2971', 'Skorts & Culottes', '2965', '3', '6600', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2972', 'Skirts', '2950', '2', null, '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2973', 'Others', '2972', '3', '4973', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2974', 'Mini Skirts', '2972', '3', '6592', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2975', 'Maxi Skirts', '2972', '3', '6595', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2976', 'Midi Skirts', '2972', '3', '6593', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2977', 'Lingerie & Nightwear', '2950', '2', null, '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2978', 'Nightwear', '2977', '3', '6610', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2979', 'Others', '2977', '3', '4969', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2980', 'Lingerie', '2977', '3', '6609', '2017-01-25 12:19:35');
INSERT INTO `shopee_category` VALUES ('2981', 'Others', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2982', 'Others', '2981', '3', '4967', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2983', 'Playsuits & Jumpsuits', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2984', 'Others', '2983', '3', '4977', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2985', 'Women\'s Outerwear', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2986', 'Hoodies', '2985', '3', '6572', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2987', 'Others', '2985', '3', '4978', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2988', 'Sweaters', '2985', '3', '6570', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2989', 'Jackets & Blazers', '2985', '3', '6574', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2990', 'Cardigans', '2985', '3', '6571', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2991', 'Sports & Beachwear', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2992', 'Swimsuits', '2991', '3', '6603', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2993', 'Sportswear', '2991', '3', '6604', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2994', 'Others', '2991', '3', '4968', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2995', 'Bikini', '2991', '3', '6602', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2996', 'Traditional Wear', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2997', 'Cheongsams', '2996', '3', '6612', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2998', 'Saree & Anarkali', '2996', '3', '6613', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('2999', 'Others', '2996', '3', '4972', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3000', 'Socks & Tights', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3001', 'Others', '3000', '3', '9527', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3002', 'Set Wear', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3003', 'Others', '3002', '3', '9556', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3004', 'Maternity Wear', '2950', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3005', 'Others', '3004', '3', '9808', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3006', 'Men\'s Clothing', '0', '1', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3007', 'T-shirts & Singlets', '3006', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3008', 'Solid Tees', '3007', '3', '6775', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3009', 'Graphic Tees', '3007', '3', '6774', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3010', 'Others', '3007', '3', '4939', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3011', 'Singlets', '3007', '3', '6773', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3012', 'Long Sleeve Tees', '3007', '3', '6772', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3013', 'Statement Tees', '3007', '3', '9617', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3014', 'Pants', '3006', '2', null, '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3015', 'Others', '3014', '3', '4937', '2017-01-25 12:19:36');
INSERT INTO `shopee_category` VALUES ('3016', 'Shorts', '3014', '3', '6784', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3017', 'Joggers & Sweatpants', '3014', '3', '6783', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3018', 'Jeans', '3014', '3', '6785', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3019', 'Chinos', '3014', '3', '6781', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3020', 'Innerwear', '3006', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3021', 'Others', '3020', '3', '4932', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3022', 'Boxers & Trunks', '3020', '3', '6805', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3023', 'Briefs', '3020', '3', '6804', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3024', 'Shirts', '3006', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3025', 'Short-sleeved Shirts', '3024', '3', '6778', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3026', 'Others', '3024', '3', '4936', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3027', 'Long-sleeved Shirts', '3024', '3', '6777', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3028', 'Men\'s Outerwear', '3006', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3029', 'Suits', '3028', '3', '6790', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3030', 'Hoodies', '3028', '3', '6789', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3031', 'Sweater', '3028', '3', '6791', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3032', 'Jackets', '3028', '3', '6788', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3033', 'Others', '3028', '3', '4935', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3034', 'Others', '3006', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3035', 'Others', '3034', '3', '4931', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3036', 'Polo Shirts', '3006', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3037', 'Others', '3036', '3', '4934', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3038', 'Sports Wear', '3006', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3039', 'Training Wear', '3038', '3', '6797', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3040', 'Others', '3038', '3', '4933', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3041', 'Jerseys', '3038', '3', '6795', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3042', 'Bags & Wallets', '0', '1', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3043', 'Women\'s Backpacks', '3042', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3044', 'Others', '3043', '3', '4946', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3045', 'Casual Backpacks', '3043', '3', '6743', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3046', 'Drawstrings', '3043', '3', '6744', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3047', 'Rucksacks', '3043', '3', '6745', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3048', 'Laptop Bags', '3042', '2', null, '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3049', 'Sleeves', '3048', '3', '6752', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3050', 'Backpacks', '3048', '3', '6750', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3051', 'Briefcases', '3048', '3', '6751', '2017-01-25 12:19:37');
INSERT INTO `shopee_category` VALUES ('3052', 'Others', '3048', '3', '4942', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3053', 'Luggage & Travel', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3054', 'Tags & Covers', '3053', '3', '6759', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3055', 'Travel Totes & Duffels', '3053', '3', '6757', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3056', 'Packing Organizers', '3053', '3', '6758', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3057', 'Suitcases', '3053', '3', '6756', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3058', 'Others', '3053', '3', '4943', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3059', 'Others', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3060', 'Others', '3059', '3', '4940', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3061', 'Tote Bags', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3062', 'Others', '3061', '3', '4948', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3063', 'Shoulder Bags', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3064', 'Others', '3063', '3', '4947', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3065', 'Clutches & Wristlets', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3066', 'Wristlets', '3065', '3', '6749', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3067', 'Clutches', '3065', '3', '6748', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3068', 'Others', '3065', '3', '4945', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3069', 'Sling Bags', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3070', 'Others', '3069', '3', '4944', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3071', 'Luxury Bags', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3072', 'Others', '3071', '3', '4941', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3073', 'Handbags', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3074', 'Business Handbags', '3073', '3', '6739', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3075', 'Set Handbags', '3073', '3', '6741', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3076', 'Casual Handbags', '3073', '3', '6740', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3077', 'Others', '3073', '3', '4951', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3078', 'Purses & Pouches', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3079', 'Coin Pouches', '3078', '3', '9550', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3080', 'Fold Over Purses', '3078', '3', '6769', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3081', 'Zip Purses', '3078', '3', '6770', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3082', 'Make Up Bags', '3078', '3', '9548', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3083', 'Multi Purpose Pouches', '3078', '3', '9549', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3084', 'Others', '3078', '3', '6763', '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3085', 'Men\'s Bags & Wallets', '3042', '2', null, '2017-01-25 12:19:38');
INSERT INTO `shopee_category` VALUES ('3086', 'Men\'s Wallets', '3085', '3', '9547', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3087', 'Messenger Bags', '3085', '3', '6766', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3088', 'Others', '3085', '3', '6765', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3089', 'Waist & Cross Body Bags', '3085', '3', '6767', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3090', 'Men\'s Backpacks', '3085', '3', '9546', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3091', 'Accessories', '0', '1', null, '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3092', 'Belts', '3091', '2', null, '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3093', 'Men\'s Belt', '3092', '3', '7122', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3094', 'Others', '3092', '3', '4863', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3095', 'Women\'s Belt', '3092', '3', '7123', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3096', 'Eyewear', '3091', '2', null, '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3097', 'Others', '3096', '3', '4866', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3098', 'Sunglasses', '3096', '3', '7116', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3099', 'Eyeglasses', '3096', '3', '7117', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3100', 'Others', '3091', '2', null, '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3101', 'Others', '3100', '3', '4862', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3102', 'Jewellery', '3091', '2', null, '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3103', 'Pendants & Necklaces', '3102', '3', '7125', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3104', 'Others', '3102', '3', '4872', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3105', 'Rings', '3102', '3', '7126', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3106', 'Bracelets & Charms', '3102', '3', '7124', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3107', 'Anklets', '3102', '3', '7129', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3108', 'Pin & Brooches', '3102', '3', '7128', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3109', 'Earrings', '3102', '3', '7127', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3110', 'More Accessories', '3091', '2', null, '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3111', 'Scarves', '3110', '3', '7131', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3112', 'Temporary Tattoos', '3110', '3', '7132', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3113', 'Key Chains', '3110', '3', '7134', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3114', 'Others', '3110', '3', '4871', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3115', 'Bows & Ties', '3110', '3', '7133', '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3116', 'Hats & Caps', '3091', '2', null, '2017-01-25 12:19:39');
INSERT INTO `shopee_category` VALUES ('3117', 'Beanies', '3116', '3', '7120', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3118', 'Others', '3116', '3', '4864', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3119', 'Caps', '3116', '3', '7119', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3120', 'Hats', '3116', '3', '7121', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3121', 'Hair Accessories', '3091', '2', null, '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3122', 'Wigs & Extensions', '3121', '3', '9545', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3123', 'Hairpins & Hairclips', '3121', '3', '9543', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3124', 'Hairbands & Headpieces', '3121', '3', '9542', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3125', 'Hairties', '3121', '3', '9544', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3126', 'Others', '3121', '3', '4869', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3127', 'Home & Living', '0', '1', null, '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3128', 'Kitchen & Dining', '3127', '2', null, '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3129', 'Cookware', '3128', '3', '6908', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3130', 'Knives & Sharpeners', '3128', '3', '6904', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3131', 'Tableware', '3128', '3', '6907', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3132', 'Others', '3128', '3', '4909', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3133', 'Kitchen Tools', '3128', '3', '6909', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3134', 'Bakeware', '3128', '3', '6906', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3135', 'Home Decor', '3127', '2', null, '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3136', 'Mirrors & Wall Art', '3135', '3', '6925', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3137', 'Rugs & Carpets', '3135', '3', '6924', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3138', 'Fragrance & Candles', '3135', '3', '9890', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3139', 'Curtains & Blinds', '3135', '3', '9887', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3140', 'Clocks', '3135', '3', '6923', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3141', 'Lighting', '3135', '3', '6926', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3142', 'Others', '3135', '3', '4905', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3143', 'Cushions & Covers', '3135', '3', '9888', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3144', 'Festive Decor', '3135', '3', '9889', '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3145', 'Home Storage & Organization', '3127', '2', null, '2017-01-25 12:19:40');
INSERT INTO `shopee_category` VALUES ('3146', 'Clothes Organization', '3145', '3', '6911', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3147', 'Others', '3145', '3', '4907', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3148', 'Storage Cabinets', '3145', '3', '6914', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3149', 'Racks & Shelves', '3145', '3', '6912', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3150', 'Others', '3127', '2', null, '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3151', 'Others', '3150', '3', '4902', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3152', 'Kitchen Storage', '3127', '2', null, '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3153', 'Bottles', '3152', '3', '6945', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3154', 'Storage Organizers', '3152', '3', '9895', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3155', 'Dish Racks & Sink', '3152', '3', '6947', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3156', 'Others', '3152', '3', '4908', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3157', 'Food Storage', '3152', '3', '9896', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3158', 'Canisters & Jars', '3152', '3', '6946', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3159', 'Bath & Bedding', '3127', '2', null, '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3160', 'Bedding Accessories', '3159', '3', '6929', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3161', 'Bathroom Accessories', '3159', '3', '9884', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3162', 'Mats, Towels & Robes', '3159', '3', '9885', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3163', 'Others', '3159', '3', '4904', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3164', 'Bedding Sets & Sheets', '3159', '3', '6928', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3165', 'Pillows & Bolsters', '3159', '3', '9886', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3166', 'Mattresses & Protectors', '3159', '3', '6927', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3167', 'Furniture', '3127', '2', null, '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3168', 'Living & Dining', '3167', '3', '6952', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3169', 'Office', '3167', '3', '6953', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3170', 'Others', '3167', '3', '6950', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3171', 'Bedroom', '3167', '3', '6951', '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3172', 'Housekeeping & Supplies', '3127', '2', null, '2017-01-25 12:19:41');
INSERT INTO `shopee_category` VALUES ('3173', 'Cleaning Supplies', '3172', '3', '6958', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3174', 'Pest Control', '3172', '3', '9485', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3175', 'Brooms & Mops', '3172', '3', '10065', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3176', 'Paper Products', '3172', '3', '10066', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3177', 'Laundry', '3172', '3', '6960', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3178', 'Others', '3172', '3', '6957', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3179', 'Home Improvement', '3127', '2', null, '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3180', 'Plugs & Adaptors', '3179', '3', '10064', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3181', 'DIY Tools', '3179', '3', '9524', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3182', 'Chains & Locks', '3179', '3', '9525', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3183', 'Others', '3179', '3', '9522', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3184', 'Outdoor & Garden', '3179', '3', '9523', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3185', 'Toys, Kids & Babies', '0', '1', null, '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3186', 'Nursery', '3185', '2', null, '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3187', 'Others', '3186', '3', '4891', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3188', 'Blankets & Pillows', '3186', '3', '7042', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3189', 'Bedding', '3186', '3', '7041', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3190', 'Baby Safety', '3186', '3', '7040', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3191', 'Maternity Care', '3185', '2', null, '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3192', 'Others', '3191', '3', '4888', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3193', 'Maternity Accessories', '3191', '3', '7066', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3194', 'Pregnancy Pillows', '3191', '3', '9821', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3195', 'Moisturizers & Creams', '3191', '3', '7067', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3196', 'Others', '3185', '2', null, '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3197', 'Others', '3196', '3', '4887', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3198', 'Baby Clothing', '3185', '2', null, '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3199', 'Nightwear', '3198', '3', '9553', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3200', 'Others', '3198', '3', '4897', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3201', 'Baby Clothing', '3198', '3', '9551', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3202', 'Mittens & Footwear', '3198', '3', '9552', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3203', 'Baby Gears', '3185', '2', null, '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3204', 'Car Seats', '3203', '3', '6997', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3205', 'Others', '3203', '3', '4890', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3206', 'Strollers', '3203', '3', '6998', '2017-01-25 12:19:42');
INSERT INTO `shopee_category` VALUES ('3207', 'Walkers & Bouncers', '3203', '3', '9787', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3208', 'Baby Carrier', '3203', '3', '9792', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3209', 'Feeding & Nursing', '3185', '2', null, '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3210', 'Breastfeeding', '3209', '3', '9786', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3211', 'Lunchboxes & Storage', '3209', '3', '6979', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3212', 'Others', '3209', '3', '4900', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3213', 'Food & Formula', '3209', '3', '6976', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3214', 'Baby Bibs', '3209', '3', '6977', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3215', 'Teethers & Pacifiers', '3209', '3', '6975', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3216', 'Bottle Feeding', '3209', '3', '6973', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3217', 'Sterilisers & Warmers', '3209', '3', '6974', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3218', 'Diapers & Potties', '3185', '2', null, '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3219', 'Potties', '3218', '3', '7070', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3220', 'Diaper Bag', '3218', '3', '7071', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3221', 'Diapers', '3218', '3', '7069', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3222', 'Others', '3218', '3', '4889', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3223', 'Bath & Skincare', '3185', '2', null, '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3224', 'Oral Care', '3223', '3', '6983', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3225', 'Others', '3223', '3', '4899', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3226', 'Bathing Accessories', '3223', '3', '9846', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3227', 'Bath & Shampoo', '3223', '3', '6981', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3228', 'Skincare', '3223', '3', '6982', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3229', 'Baby Wipes', '3223', '3', '9794', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3230', 'Toys & Education', '3185', '2', null, '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3231', 'Early Learning', '3230', '3', '7037', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3232', 'Sports & Outdoor Play', '3230', '3', '7039', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3233', 'Musical Toys', '3230', '3', '9817', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3234', 'Stuffed Toys', '3230', '3', '7038', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3235', 'Arts & Crafts', '3230', '3', '9810', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3236', 'Playmats', '3230', '3', '9818', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3237', 'Building Blocks', '3230', '3', '9812', '2017-01-25 12:19:43');
INSERT INTO `shopee_category` VALUES ('3238', 'Baby & Toddler Toys', '3230', '3', '9811', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3239', 'Others', '3230', '3', '4895', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3240', 'Pretend Play', '3230', '3', '9819', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3241', 'Dolls & Accessories', '3230', '3', '9816', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3242', 'Puzzles', '3230', '3', '9820', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3243', 'Accessories', '3185', '2', null, '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3244', 'Others', '3243', '3', '4901', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3245', 'Bags', '3243', '3', '6969', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3246', 'Hats & Caps', '3243', '3', '6971', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3247', 'Kids Hair Accessories', '3243', '3', '9374', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3248', 'Watches', '3243', '3', '9845', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3249', 'Kids Fashion', '3185', '2', null, '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3250', 'Others', '3249', '3', '4898', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3251', 'Socks', '3249', '3', '6988', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3252', 'Boys Clothing', '3249', '3', '6990', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3253', 'Shoes', '3249', '3', '9554', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3254', 'Girls Clothing', '3249', '3', '6989', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3255', 'Hobbies, Games & Collectibles', '0', '1', null, '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3256', 'Games for Consoles', '3255', '2', null, '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3257', 'PS3', '3256', '3', '7171', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3258', 'PS4', '3256', '3', '7169', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3259', 'Xbox One', '3256', '3', '7172', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3260', 'Others', '3256', '3', '4843', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3261', 'PC', '3256', '3', '7170', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3262', 'Nintendo 3DS', '3256', '3', '7174', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3263', 'PS Vita', '3256', '3', '7167', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3264', 'Xbox 360', '3256', '3', '7173', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3265', 'Games & Collectibles', '3255', '2', null, '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3266', 'Toy Vehicles', '3265', '3', '7177', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3267', 'Family Games', '3265', '3', '7179', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3268', 'Collectibles', '3265', '3', '9484', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3269', 'DIY Collectibles', '3265', '3', '7176', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3270', 'Others', '3265', '3', '4842', '2017-01-25 12:19:44');
INSERT INTO `shopee_category` VALUES ('3271', 'Action Figures', '3265', '3', '7178', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3272', 'Media & Music', '3255', '2', null, '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3273', 'English Books', '3272', '3', '7183', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3274', 'CD/DVD/Blu-Ray', '3272', '3', '7180', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3275', 'Local Books', '3272', '3', '7181', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3276', 'Chinese Books', '3272', '3', '7182', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3277', 'Others', '3272', '3', '4840', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3278', 'Musical Instruments', '3272', '3', '7184', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3279', 'Others', '3255', '2', null, '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3280', 'Others', '3279', '3', '4835', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3281', 'Consoles & Accessories', '3255', '2', null, '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3282', 'Others', '3281', '3', '4844', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3283', 'Stationary Consoles', '3281', '3', '7165', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3284', 'Handheld Consoles', '3281', '3', '7164', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3285', 'Consoles Accessories', '3281', '3', '7166', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3286', 'Everything Else', '0', '1', null, '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3287', 'Religion & Beliefs', '3286', '2', null, '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3288', 'Statues & Figurines', '3287', '3', '7228', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3289', 'Accents', '3287', '3', '7229', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3290', 'Others', '3287', '3', '4796', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3291', 'Others', '3286', '2', null, '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3292', 'Others', '3291', '3', '4800', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3293', 'Car Care & Parts', '3286', '2', null, '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3294', 'Car Seats', '3293', '3', '7225', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3295', 'Dashboard Accessories', '3293', '3', '7223', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3296', 'Car Stickers', '3293', '3', '7224', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3297', 'Others', '3293', '3', '4807', '2017-01-25 12:19:45');
INSERT INTO `shopee_category` VALUES ('3298', 'Electronic Cigarettes', '3286', '2', null, '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3299', 'Others', '3298', '3', '4810', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3300', 'Vape Mods', '3298', '3', '7220', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3301', 'Tanks & Accessories', '3298', '3', '7221', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3302', 'e-Juices', '3298', '3', '7222', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3303', 'Pets', '3286', '2', null, '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3304', 'Feeding & Grooming', '3303', '3', '7227', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3305', 'Clothes & Accessories', '3303', '3', '7226', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3306', 'Others', '3303', '3', '4806', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3307', 'Muslim Wear', '0', '1', null, '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3308', 'Muslimah Jubah', '3307', '2', null, '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3309', 'Jubah Dokoh', '3308', '3', '9851', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3310', 'Nursing Jubah', '3308', '3', '9852', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3311', 'Others', '3308', '3', '4855', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3312', 'Basic Jubah', '3308', '3', '9849', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3313', 'Fashion Jubah', '3308', '3', '9850', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3314', 'Muslimah Wear', '3307', '2', null, '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3315', 'Baju Kebaya', '3314', '3', '9565', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3316', 'Telekung', '3314', '3', '7146', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3317', 'Others', '3314', '3', '4854', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3318', 'Kaftan & Kimonos', '3314', '3', '7147', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3319', 'Baju Kurung', '3314', '3', '7149', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3320', 'Pants & Skirts', '3314', '3', '7144', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3321', 'Hijab', '3307', '2', null, '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3322', 'Instant Shawl', '3321', '3', '9623', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3323', 'Others', '3321', '3', '4853', '2017-01-25 12:19:46');
INSERT INTO `shopee_category` VALUES ('3324', 'Inner', '3321', '3', '9627', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3325', 'Wide Shawl', '3321', '3', '9625', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3326', 'Basic Shawl', '3321', '3', '9624', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3327', 'Bawal', '3321', '3', '9626', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3328', 'Blouse', '3307', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3329', 'Long Blouse', '3328', '3', '9855', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3330', 'Fashion Blouse', '3328', '3', '9854', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3331', 'Others', '3328', '3', '4852', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3332', 'Basic Blouse', '3328', '3', '9853', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3333', 'Nursing Blouse', '3328', '3', '9856', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3334', 'Others', '3307', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3335', 'Others', '3334', '3', '4850', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3336', 'Muslimin Wear', '3307', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3337', 'Others', '3336', '3', '4851', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3338', 'Jubah', '3336', '3', '7141', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3339', 'Kurta', '3336', '3', '7142', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3340', 'Batik & Songket', '3307', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3341', 'Others', '3340', '3', '7151', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3342', 'Women\'s Shoes', '0', '1', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3343', 'Heels', '3342', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3344', 'Others', '3343', '3', '4879', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3345', 'Platform Heels', '3343', '3', '7090', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3346', 'Low Heels', '3343', '3', '7089', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3347', 'High Heels', '3343', '3', '7087', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3348', 'Mid Heels', '3343', '3', '7088', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3349', 'Peep Toes', '3343', '3', '7091', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3350', 'Sports & Sneakers', '3342', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3351', 'Sneakers', '3350', '3', '7086', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3352', 'Sports Shoes', '3350', '3', '7085', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3353', 'Others', '3350', '3', '4880', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3354', 'Sandals & Slippers', '3342', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3355', 'Slippers', '3354', '3', '7096', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3356', 'Others', '3354', '3', '4878', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3357', 'Sandals', '3354', '3', '7095', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3358', 'Wedges & Platforms', '3342', '2', null, '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3359', 'Wedges', '3358', '3', '7112', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3360', 'Platforms', '3358', '3', '7113', '2017-01-25 12:19:47');
INSERT INTO `shopee_category` VALUES ('3361', 'Others', '3358', '3', '4875', '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3362', 'Women\'s Leather Wear', '3342', '2', null, '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3363', 'Others', '3362', '3', '4874', '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3364', 'Others', '3342', '2', null, '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3365', 'Others', '3364', '3', '4873', '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3366', 'Flats', '3342', '2', null, '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3367', 'Peep Toes', '3366', '3', '7109', '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3368', 'Loafers', '3366', '3', '7107', '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3369', 'Others', '3366', '3', '4877', '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3370', 'Ballet Flats', '3366', '3', '7108', '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3371', 'Shoes Accessories', '3342', '2', null, '2017-01-25 12:19:48');
INSERT INTO `shopee_category` VALUES ('3372', 'Others', '3371', '3', '7115', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3373', 'Beauty & Personal Care', '0', '1', null, '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3374', 'Personal Care', '3373', '2', null, '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3375', 'Oral Hygiene', '3374', '3', '6702', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3376', 'Slimming & Shaping', '3374', '3', '6699', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3377', 'Feminine Care', '3374', '3', '6705', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3378', 'Personal Pleasure', '3374', '3', '6704', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3379', 'Massage & Detox', '3374', '3', '6701', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3380', 'Others', '3374', '3', '4955', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3381', 'Bath & Body', '3373', '2', null, '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3382', 'Bath', '3381', '3', '6671', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3383', 'Body Scrubs', '3381', '3', '6673', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3384', 'Body Lotion & Butter', '3381', '3', '6672', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3385', 'Others', '3381', '3', '4959', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3386', 'Hair Care', '3381', '3', '6670', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3387', 'Fragrances', '3373', '2', null, '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3388', 'For Her', '3387', '3', '6675', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3389', 'Aromatherapy', '3387', '3', '6676', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3390', 'For Him', '3387', '3', '6674', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3391', 'Others', '3387', '3', '4957', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3392', 'Supplements', '3373', '2', null, '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3393', 'Sports Nutrition', '3392', '3', '9510', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3394', 'Well-being', '3392', '3', '9509', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3395', 'Traditional', '3392', '3', '9508', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3396', 'Nutritional Supplement', '3392', '3', '9511', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3397', 'Weight Management', '3392', '3', '9512', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3398', 'Others', '3392', '3', '4798', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3399', 'Others', '3373', '2', null, '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3400', 'Others', '3399', '3', '4952', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3401', 'Men\'s Grooming', '3373', '2', null, '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3402', 'Shaving', '3401', '3', '6709', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3403', 'For Skin', '3401', '3', '6706', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3404', 'Others', '3401', '3', '4802', '2017-01-25 12:19:49');
INSERT INTO `shopee_category` VALUES ('3405', 'For Hair', '3401', '3', '6707', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3406', 'Medical Supplies', '3373', '2', null, '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3407', 'Others', '3406', '3', '4953', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3408', 'Health Accessories', '3406', '3', '6693', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3409', 'Weighing Scale', '3406', '3', '6692', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3410', 'Ointments & Bandages', '3406', '3', '6695', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3411', 'Eye Care', '3373', '2', null, '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3412', 'Prescription Lens & Care', '3411', '3', '9663', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3413', 'Eye Mask', '3411', '3', '9662', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3414', 'Eye Cream & Serum', '3411', '3', '4960', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3415', 'Others', '3411', '3', '9664', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3416', 'Face Make Up', '3373', '2', null, '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3417', 'Powder & Compacts', '3416', '3', '6616', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3418', 'Others', '3416', '3', '4966', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3419', 'Make Up Sets', '3416', '3', '9666', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3420', 'Concealer', '3416', '3', '6619', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3421', 'Shading & Highlighting', '3416', '3', '6620', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3422', 'Foundation', '3416', '3', '6617', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3423', 'Blusher', '3416', '3', '6618', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3424', 'Eye Make Up', '3373', '2', null, '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3425', 'Eyeliner', '3424', '3', '6622', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3426', 'Mascara', '3424', '3', '6624', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3427', 'Cosmetic Contact Lens', '3424', '3', '6625', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3428', 'Eyebrow', '3424', '3', '6623', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3429', 'Others', '3424', '3', '4965', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3430', 'Eye Shadow', '3424', '3', '6621', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3431', 'Eyelid Tape & Eyelashes', '3424', '3', '6626', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3432', 'Lips', '3373', '2', null, '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3433', 'Lip Gloss', '3432', '3', '6643', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3434', 'Others', '3432', '3', '4964', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3435', 'Lip Tint', '3432', '3', '6647', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3436', 'Lip Liner', '3432', '3', '6645', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3437', 'Lipstick', '3432', '3', '6641', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3438', 'Lip Balm & Treatment', '3432', '3', '6642', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3439', 'Pedicure & Manicure', '3373', '2', null, '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3440', 'Others', '3439', '3', '4956', '2017-01-25 12:19:50');
INSERT INTO `shopee_category` VALUES ('3441', 'Treatment & Remover', '3439', '3', '6655', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3442', 'Nail Art & Stickers', '3439', '3', '6654', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3443', 'Top Coat & Base Coat', '3439', '3', '6653', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3444', 'Nail Care Tools', '3439', '3', '6656', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3445', 'Nail Polish', '3439', '3', '6651', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3446', 'Brushes & Beauty Tools', '3373', '2', null, '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3447', 'Hair Styling', '3446', '3', '6684', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3448', 'Brushes & Sponges', '3446', '3', '6681', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3449', 'Hair Removal', '3446', '3', '6685', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3450', 'Others', '3446', '3', '4963', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3451', 'Facial Tools', '3446', '3', '6682', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3452', 'Skincare', '3373', '2', null, '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3453', 'Toner & Mists', '3452', '3', '9518', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3454', 'Essence & Serum', '3452', '3', '9516', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3455', 'Sunscreen & Aftersun', '3452', '3', '9514', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3456', 'Others', '3452', '3', '9507', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3457', 'Skin Sets', '3452', '3', '9665', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3458', 'Whitening', '3452', '3', '9515', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3459', 'Face Mask & Packs', '3452', '3', '9520', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3460', 'Cleanser', '3452', '3', '9519', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3461', 'Moisturizer & Cream', '3452', '3', '9517', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3462', 'Sports & Outdoor', '0', '1', null, '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3463', 'Sports Gear & Accessories', '3462', '2', null, '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3464', 'Individual Sports', '3463', '3', '7191', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3465', 'Others', '3463', '3', '4826', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3466', 'Team Sports', '3463', '3', '7192', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3467', 'Fitness Equipment', '3462', '2', null, '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3468', 'Training Equipment', '3467', '3', '7187', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3469', 'Yoga', '3467', '3', '7186', '2017-01-25 12:19:51');
INSERT INTO `shopee_category` VALUES ('3470', 'Others', '3467', '3', '4828', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3471', 'Others', '3462', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3472', 'Default', '3471', '3', '4825', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3473', 'Outdoor & Adventure', '3462', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3474', 'Skates', '3473', '3', '7190', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3475', 'Camping & Hiking', '3473', '3', '7188', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3476', 'Others', '3473', '3', '4827', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3477', 'Cycling', '3473', '3', '7189', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3478', 'Mobile & Gadgets', '0', '1', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3479', 'Mobile Car Accessories', '3478', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3480', 'Others', '3479', '3', '4921', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3481', 'Tablets', '3478', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3482', 'Android', '3481', '3', '6856', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3483', 'Others', '3481', '3', '4920', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3484', 'iOS', '3481', '3', '6857', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3485', 'Cases & Covers', '3478', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3486', 'Others', '3485', '3', '4929', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3487', 'iPhone Hard Cover', '3485', '3', '6815', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3488', 'iPhone Soft Cover', '3485', '3', '9597', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3489', 'Android Hard Cover', '3485', '3', '9529', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3490', 'Tablet', '3485', '3', '6816', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3491', 'Android Soft Cover', '3485', '3', '9598', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3492', 'Phone Holder & Stand', '3485', '3', '9528', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3493', 'Powerbanks & Batteries', '3478', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3494', 'Powerbanks', '3493', '3', '6810', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3495', 'Fashion Powerbanks', '3493', '3', '6811', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3496', 'Phone Batteries', '3493', '3', '6813', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3497', 'Others', '3493', '3', '4930', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3498', 'Storage & Memory Cards', '3478', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3499', 'USB Drive', '3498', '3', '6842', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3500', 'Memory Cards', '3498', '3', '6843', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3501', 'Others', '3498', '3', '4925', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3502', 'Others', '3478', '2', null, '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3503', 'Others', '3502', '3', '4919', '2017-01-25 12:19:52');
INSERT INTO `shopee_category` VALUES ('3504', 'Cables & Chargers', '3478', '2', null, '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3505', 'Cables', '3504', '3', '6817', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3506', 'Chargers', '3504', '3', '6818', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3507', 'Docks', '3504', '3', '6821', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3508', 'Others', '3504', '3', '4928', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3509', 'Audio', '3478', '2', null, '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3510', 'Earphones', '3509', '3', '6848', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3511', 'Others', '3509', '3', '4924', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3512', 'Headphones & Headsets', '3509', '3', '6847', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3513', 'Speakers', '3509', '3', '6849', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3514', 'Cool Gadgets', '3478', '2', null, '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3515', 'Other Gadgets', '3514', '3', '6832', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3516', 'USB Fan', '3514', '3', '6829', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3517', 'USB Light', '3514', '3', '6831', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3518', 'Others', '3514', '3', '4927', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3519', 'Wearables', '3478', '2', null, '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3520', 'Fitness Tracker', '3519', '3', '6852', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3521', 'Others', '3519', '3', '4923', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3522', 'Smart Watch', '3519', '3', '6851', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3523', 'Mobile Phones', '3478', '2', null, '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3524', 'Sony', '3523', '3', '10113', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3525', 'Others', '3523', '3', '4922', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3526', 'Nokia', '3523', '3', '10111', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3527', 'Other Brands', '3523', '3', '6855', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3528', 'Asus', '3523', '3', '10110', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3529', 'Xiaomi', '3523', '3', '10094', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3530', 'Huawei & Honor', '3523', '3', '10093', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3531', 'Lenovo', '3523', '3', '10096', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3532', 'iPhone', '3523', '3', '6854', '2017-01-25 12:19:53');
INSERT INTO `shopee_category` VALUES ('3533', 'Samsung', '3523', '3', '6853', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3534', 'Screen Protectors', '3478', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3535', 'Matte', '3534', '3', '6837', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3536', 'Others', '3534', '3', '4926', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3537', 'Privacy', '3534', '3', '6838', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3538', 'Android Tempered Glass', '3534', '3', '6839', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3539', 'Clear', '3534', '3', '6836', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3540', 'iPhone Tempered Glass', '3534', '3', '9596', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3541', 'Camera & Accessories', '3478', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3542', 'Action & Sport Camera', '3541', '3', '9620', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3543', 'Camera Accessories', '3541', '3', '9622', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3544', 'Polaroid & Digital', '3541', '3', '9621', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3545', 'Others', '3541', '3', '9619', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3546', 'Selfie Accessories', '3478', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3547', 'Others', '3546', '3', '9629', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3548', 'Design & Crafts', '0', '1', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3549', 'Fabric & Materials', '3548', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3550', 'Others', '3549', '3', '4847', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3551', 'Fabrics', '3549', '3', '7162', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3552', 'Materials', '3549', '3', '7163', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3553', 'Stationery', '3548', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3554', 'Others', '3553', '3', '4846', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3555', 'Arts & Graphics', '3553', '3', '7154', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3556', 'Writing Utensils', '3553', '3', '7153', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3557', 'Stickers & Tapes', '3553', '3', '7157', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3558', 'School & Office', '3553', '3', '7155', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3559', 'Diaries & Notebooks', '3553', '3', '7156', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3560', 'Others', '3548', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3561', 'Others', '3560', '3', '4845', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3562', 'Handmade', '3548', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3563', 'DIY', '3562', '3', '7160', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3564', 'Gifts', '3562', '3', '7159', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3565', 'Others', '3562', '3', '4849', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3566', 'Dolls', '3562', '3', '7161', '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3567', 'Watches', '0', '1', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3568', 'Sports', '3567', '2', null, '2017-01-25 12:19:54');
INSERT INTO `shopee_category` VALUES ('3569', 'Sport Bands', '3568', '3', '6895', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3570', 'Sport Watches', '3568', '3', '6894', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3571', 'Others', '3568', '3', '4912', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3572', 'Men\'s Watches', '3567', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3573', 'Men\'s Business', '3572', '3', '6863', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3574', 'Men\'s Analogue', '3572', '3', '6864', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3575', 'Others', '3572', '3', '4918', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3576', 'Men\'s Digital', '3572', '3', '6865', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3577', 'Men\'s Chronograph', '3572', '3', '6867', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3578', 'Others', '3567', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3579', 'Others', '3578', '3', '4910', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3580', 'Women\'s Watches', '3567', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3581', 'Others', '3580', '3', '4915', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3582', 'Women\'s Casual', '3580', '3', '6884', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3583', 'Women\'s Business', '3580', '3', '6882', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3584', 'Luxury', '3567', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3585', 'Others', '3584', '3', '4911', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3586', 'Couple & Set Watches', '3567', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3587', 'Others', '3586', '3', '4913', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3588', 'Watch Accessories', '3567', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3589', 'Others', '3588', '3', '6899', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3590', 'Tickets & Vouchers', '0', '1', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3591', 'Restaurant & Spa Vouchers', '3590', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3592', 'Spa Vouchers', '3591', '3', '7212', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3593', 'Others', '3591', '3', '4815', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3594', 'Restaurant Vouchers', '3591', '3', '7211', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3595', 'Events & Travel Vouchers', '3590', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3596', 'Others', '3595', '3', '4813', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3597', 'Others', '3590', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3598', 'Others', '3597', '3', '4811', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3599', 'Mobile Reloads & Sim Cards', '3590', '2', null, '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3600', 'Others', '3599', '3', '4816', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3601', 'Mobile Reloads', '3599', '3', '7209', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3602', 'Sim Cards', '3599', '3', '7210', '2017-01-25 12:19:55');
INSERT INTO `shopee_category` VALUES ('3603', 'Bill Payments', '3590', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3604', 'Home Bills', '3603', '3', '7214', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3605', 'Others', '3603', '3', '4814', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3606', 'Mobiles', '3603', '3', '7213', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3607', 'Shopee & Retail Vouchers', '3590', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3608', 'Others', '3607', '3', '4812', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3609', 'Shopee Vouchers', '3607', '3', '7217', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3610', 'Retail Vouchers', '3607', '3', '7218', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3611', 'Services', '3590', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3612', 'Others', '3611', '3', '7216', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3613', 'Postage', '3611', '3', '7219', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3614', 'Computers & Laptops', '0', '1', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3615', 'Components', '3614', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3616', 'Fans & Heatsinks', '3615', '3', '7199', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3617', 'Others', '3615', '3', '4821', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3618', 'Graphic Cards', '3615', '3', '7200', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3619', 'Chargers & Power Supply', '3615', '3', '7201', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3620', 'RAM', '3615', '3', '7198', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3621', 'Laptops', '3614', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3622', 'Macbooks', '3621', '3', '7202', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3623', 'Notebooks', '3621', '3', '7203', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3624', 'Others', '3621', '3', '4820', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3625', 'Computer Accessories', '3614', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3626', 'Mouse', '3625', '3', '7196', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3627', 'Keyboard', '3625', '3', '7197', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3628', 'Others', '3625', '3', '4823', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3629', 'Monitors', '3625', '3', '7195', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3630', 'Others', '3614', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3631', 'Others', '3630', '3', '4817', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3632', 'Hard Drives & SSDs', '3614', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3633', 'Solid State Drives', '3632', '3', '7193', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3634', 'External Hard Drives', '3632', '3', '7194', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3635', 'Others', '3632', '3', '4824', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3636', 'Printers & Projectors', '3614', '2', null, '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3637', 'Others', '3636', '3', '4819', '2017-01-25 12:19:56');
INSERT INTO `shopee_category` VALUES ('3638', 'Printers', '3636', '3', '7204', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3639', 'Ink', '3636', '3', '7206', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3640', 'Projectors', '3636', '3', '7205', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3641', 'Network Components', '3614', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3642', 'Others', '3641', '3', '4818', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3643', 'Modems & Routers', '3641', '3', '7208', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3644', 'Cables & Adapters', '3641', '3', '7207', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3645', 'Men\'s Shoes', '0', '1', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3646', 'Others', '3645', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3647', 'Others', '3646', '3', '4856', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3648', 'Sneakers', '3645', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3649', 'Lace-Up', '3648', '3', '7136', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3650', 'Others', '3648', '3', '4857', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3651', 'Slip-On', '3648', '3', '7135', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3652', 'Sandals & Flip Flops', '3645', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3653', 'Others', '3652', '3', '4861', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3654', 'Loafers & Boat Shoes', '3645', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3655', 'Others', '3654', '3', '4860', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3656', 'Men\'s Leather Wear', '3645', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3657', 'Others', '3656', '3', '4858', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3658', 'Sports Shoes', '3645', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3659', 'Others', '3658', '3', '4859', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3660', 'Shoes Accessories', '3645', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3661', 'Others', '3660', '3', '7138', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3662', 'Food', '0', '1', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3663', 'Others', '3662', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3664', 'Others', '3663', '3', '4881', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3665', 'Instant & Packaged Food', '3662', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3666', 'Others', '3665', '3', '4884', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3667', 'Instant Food', '3665', '3', '7080', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3668', 'Canned Food', '3665', '3', '7081', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3669', 'Spice & Sauce', '3665', '3', '9354', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3670', 'Candy & Chocolate', '3662', '2', null, '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3671', 'Candy', '3670', '3', '7082', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3672', 'Chocolate', '3670', '3', '7083', '2017-01-25 12:19:57');
INSERT INTO `shopee_category` VALUES ('3673', 'Others', '3670', '3', '4883', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3674', 'Snacks & Desserts', '3662', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3675', 'Nuts & Dried Snacks', '3674', '3', '7075', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3676', 'Others', '3674', '3', '4886', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3677', 'Desserts', '3674', '3', '7077', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3678', 'Crackers & Cookies', '3674', '3', '7076', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3679', 'Beverages', '3662', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3680', 'Coffee & Tea', '3679', '3', '7072', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3681', 'Others', '3679', '3', '4885', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3682', 'Sport & Soft Drinks', '3679', '3', '7074', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3683', 'Instant Drinks', '3679', '3', '7073', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3684', 'Home Appliances', '0', '1', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3685', 'Others', '3684', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3686', 'Others', '3685', '3', '10042', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3687', 'Small Kitchen Appliances', '3684', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3688', 'Food Preparation', '3687', '3', '10056', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3689', 'Others', '3687', '3', '10044', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3690', 'Water Boilers', '3687', '3', '10059', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3691', 'Rice Steamers', '3687', '3', '10058', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3692', 'Fruit Juicers', '3687', '3', '10057', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3693', 'Garment Care', '3684', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3694', 'Irons', '3693', '3', '10060', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3695', 'Sewing Machines', '3693', '3', '10062', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3696', 'Others', '3693', '3', '10046', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3697', 'Garment Steamers', '3693', '3', '10061', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3698', 'Cooling & Heating', '3684', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3699', 'Others', '3698', '3', '10049', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3700', 'Air Purifiers, Dehumidifiers & Humidifiers', '3698', '3', '10067', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3701', 'Air Conditioners & Air Coolers', '3698', '3', '10063', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3702', 'Fans', '3698', '3', '10068', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3703', 'Security & Surveillance', '3684', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3704', 'CCTV & IP Cameras', '3703', '3', '10074', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3705', 'Home Sensors & Alarms', '3703', '3', '10075', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3706', 'Others', '3703', '3', '10051', '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3707', 'Home Entertainment', '3684', '2', null, '2017-01-25 12:19:58');
INSERT INTO `shopee_category` VALUES ('3708', 'Others', '3707', '3', '10053', '2017-01-25 12:19:59');
INSERT INTO `shopee_category` VALUES ('3709', 'Large Appliances', '3684', '2', null, '2017-01-25 12:19:59');
INSERT INTO `shopee_category` VALUES ('3710', 'Others', '3709', '3', '10055', '2017-01-25 12:19:59');
INSERT INTO `shopee_category` VALUES ('3711', 'Housekeeping & Improvement', '3684', '2', null, '2017-01-25 12:19:59');
INSERT INTO `shopee_category` VALUES ('3712', 'Vacuum Cleaner', '3711', '3', '10071', '2017-01-25 12:19:59');
INSERT INTO `shopee_category` VALUES ('3713', 'Robot Vacuums', '3711', '3', '10072', '2017-01-25 12:19:59');
INSERT INTO `shopee_category` VALUES ('3714', 'Power Tools & Accessories', '3711', '3', '10073', '2017-01-25 12:19:59');
INSERT INTO `shopee_category` VALUES ('3715', 'Others', '3711', '3', '10070', '2017-01-25 12:19:59');

-- ----------------------------
-- Table structure for shopee_publish
-- ----------------------------
DROP TABLE IF EXISTS `shopee_publish`;
CREATE TABLE `shopee_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `parentSku` varchar(255) DEFAULT NULL,
  `categoryPath` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `shipOutIn` int(11) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int(11) DEFAULT NULL,
  `publishUserId` int(11) DEFAULT NULL,
  `mainImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopee_publish
-- ----------------------------
INSERT INTO `shopee_publish` VALUES ('3', 'W3770-BL', 'W3770', null, null, '', null, null, '0', null, null, '', '5', '7', null);
INSERT INTO `shopee_publish` VALUES ('9', 'DV3', 'Y2639', null, null, 'photo', null, null, '0.002', null, null, null, '5', '4', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');
INSERT INTO `shopee_publish` VALUES ('10', 'Y2639BL', 'Y2639', null, null, 'Lixada 20KN Small Mobile Single Pulley Swing Side Climbing Rigging Rescue', null, null, '0.001', null, null, 'Hot up your summer collection with this alluring bikini set. It has vintage floral print, off the shoulder top and flattering low-rise bottom. A definite lust worthy piece that will turn heads like no other on beach.<br />\n<br />\n&nbsp;', '5', '4', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg');

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
