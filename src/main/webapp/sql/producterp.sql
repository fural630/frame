/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : producterp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-01-18 18:47:52
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator_user
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('17', 'DV3', 'Y2639', '照片', 'photo', null, null, null, null, null, '电子相册', 'e-photo', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '15.3', null, null, '2', '3', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '1: 【于 2016-12-28 23:18:37 由 王单爆 操作, 创建了商品信息】<br/>2: 【于 2017-01-05 10:02:06 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-05 15:16:28 由 玄奘-员工 操作, 修改了商品信息】<br/>4: 【于 2017-01-05 16:08:45 由 王单爆 操作, 修改了商品信息】<br/>5: 【于 2017-01-18 17:49:32 由 王单爆 操作, 修改了商品信息】', '2', '4', '2', '10', '2016-12-28 23:18:37', '2017-01-18 17:49:32', 'XM', '红色');
INSERT INTO `product` VALUES ('18', 'Y2639BL', 'Y2639', 'CAMP607移动式侧板滑轮', 'Lixada 20KN Small Mobile Single Pulley Swing Side Climbing Rigging Rescue', '', 'Lixada 20KN kleine mobile Einzel Pulley Schaukel Side Kletter Rigging-Rettung', 'リギングレスキュークライミングLixada 20KN小型モバイルシングルプーリースイングサイド', 'Lixada 20KN Piccolo mobile singolo puleggia oscillazione laterale arrampicata Rigging Rescue', 'Lixada 20KN Pequeño móvil polea simple swing Escalada Aparejo Rescate Side', '移动式侧板滑轮', 'Mobile Single Pulley', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-oYyw.jpg', '12.99', '', '', '1', '3', '4', '7', '', 'Hot up your summer collection with this alluring bikini set. It has vintage floral print, off the shoulder top and flattering low-rise bottom. A definite lust worthy piece that will turn heads like no other on beach.<br />\n<br />\n&nbsp;', 'Hot votre collection d&amp;#39;&eacute;t&eacute; avec cet ensemble de bikini s&eacute;duisant. Il a imprim&eacute; floral vintage, du haut de l&amp;#39;&eacute;paule et en bas de faible hauteur flatteur. Une convoitise pi&egrave;ce digne d&eacute;finitive qui fera tourner les t&ecirc;tes comme aucun autre sur la plage.<br />\n&nbsp;', 'Hot up Ihre Sommer-Kollektion mit diesem verf&uuml;hrerischen Bikini-Set. Es hat Jahrgang Blumendruck, weg von der Schulter oben und schmeichelnd Flachbau unten. Eine definitive Lust w&uuml;rdig St&uuml;ck, die K&ouml;pfe wie kein anderer am Strand verwandeln wird.<br />\n&nbsp;', 'ホットアップこの魅力的なビキニセットであなたの夏のコレクション。これは、肩の上部と世辞低層の底から、ヴィンテージの花柄を持っています。ビーチで他に類をみない頭を向けるだろう明確な欲望に値する作品。<br />\n&nbsp;', 'Hot la vostra collezione estiva con questo set bikini seducente. Ha stampa floreale d&amp;#39;epoca, fuori dalla parte superiore della spalla e lusinghiero in basso a vita bassa. Decisamente un desiderio degno pezzo che non passa inosservato come nessun altro sulla spiaggia.<br />\n&nbsp;', 'Caliente hasta su colecci&oacute;n de verano con este conjunto de bikini atractivo. Tiene la impresi&oacute;n floral de la vendimia, de la parte superior del hombro y favorecedor parte inferior de poca altura. Un deseo definitivo pieza digna que har&aacute; girar las cabezas como ning&uacute;n otro en la playa.<br />\n&nbsp;', '', '', '', '', '', '', '', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg', '1: 【于 2017-01-06 09:45:22 由 李四-主管 操作, 创建了商品信息】<br/>2: 【于 2017-01-10 14:11:26 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-10 14:12:25 由 王单爆 操作, 修改了商品信息】<br/>4: 【于 2017-01-10 18:33:49 由 王单爆 操作, 修改了商品信息】<br/>5: 【于 2017-01-11 12:29:15 由 王单爆 操作, 修改了商品信息】', '3', '4', null, '20', '2017-01-06 09:45:22', '2017-01-11 12:29:15', 'XL', '蓝色');
INSERT INTO `product` VALUES ('19', 'Y2639BL', 'Y2639', '32', '23', '', '', '', '', '', '231', '23', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-18 18:13:02 由 王单爆 操作, 创建了商品信息】', '2', null, null, '5', '2017-01-18 18:13:02', '2017-01-18 18:13:02', '', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_audit
-- ----------------------------

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

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
INSERT INTO `product_image` VALUES ('53', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg');
INSERT INTO `product_image` VALUES ('54', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-ywVK.jpg');
INSERT INTO `product_image` VALUES ('55', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-66zO.jpg');
INSERT INTO `product_image` VALUES ('56', '18', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-Mcu3.jpg');
INSERT INTO `product_image` VALUES ('57', '17', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1418 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopee_category
-- ----------------------------
INSERT INTO `shopee_category` VALUES ('652', 'Women\'s Clothing', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('653', 'Dresses', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('654', 'Others', '653', '3', '4976');
INSERT INTO `shopee_category` VALUES ('655', 'Maxi Dresses', '653', '3', '6590');
INSERT INTO `shopee_category` VALUES ('656', 'Midi Dresses', '653', '3', '6589');
INSERT INTO `shopee_category` VALUES ('657', 'Mini Dresses', '653', '3', '6588');
INSERT INTO `shopee_category` VALUES ('658', 'Tops', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('659', 'Others', '658', '3', '4981');
INSERT INTO `shopee_category` VALUES ('660', 'Couple Wear', '658', '3', '6564');
INSERT INTO `shopee_category` VALUES ('661', 'Blouse', '658', '3', '6556');
INSERT INTO `shopee_category` VALUES ('662', 'Shirts', '658', '3', '6562');
INSERT INTO `shopee_category` VALUES ('663', 'Tanks & Camisoles', '658', '3', '6563');
INSERT INTO `shopee_category` VALUES ('664', 'Crop Tops', '658', '3', '6557');
INSERT INTO `shopee_category` VALUES ('665', 'T-Shirts', '658', '3', '6561');
INSERT INTO `shopee_category` VALUES ('666', 'Off Shoulder Tops', '658', '3', '9564');
INSERT INTO `shopee_category` VALUES ('667', 'Pants & Shorts', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('668', 'Jeans', '667', '3', '6597');
INSERT INTO `shopee_category` VALUES ('669', 'Long Pants', '667', '3', '6598');
INSERT INTO `shopee_category` VALUES ('670', 'Others', '667', '3', '4971');
INSERT INTO `shopee_category` VALUES ('671', 'Leggings', '667', '3', '6601');
INSERT INTO `shopee_category` VALUES ('672', 'Shorts', '667', '3', '6599');
INSERT INTO `shopee_category` VALUES ('673', 'Skorts & Culottes', '667', '3', '6600');
INSERT INTO `shopee_category` VALUES ('674', 'Skirts', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('675', 'Others', '674', '3', '4973');
INSERT INTO `shopee_category` VALUES ('676', 'Mini Skirts', '674', '3', '6592');
INSERT INTO `shopee_category` VALUES ('677', 'Maxi Skirts', '674', '3', '6595');
INSERT INTO `shopee_category` VALUES ('678', 'Midi Skirts', '674', '3', '6593');
INSERT INTO `shopee_category` VALUES ('679', 'Lingerie & Nightwear', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('680', 'Nightwear', '679', '3', '6610');
INSERT INTO `shopee_category` VALUES ('681', 'Others', '679', '3', '4969');
INSERT INTO `shopee_category` VALUES ('682', 'Lingerie', '679', '3', '6609');
INSERT INTO `shopee_category` VALUES ('683', 'Others', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('684', 'Others', '683', '3', '4967');
INSERT INTO `shopee_category` VALUES ('685', 'Playsuits & Jumpsuits', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('686', 'Others', '685', '3', '4977');
INSERT INTO `shopee_category` VALUES ('687', 'Women\'s Outerwear', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('688', 'Hoodies', '687', '3', '6572');
INSERT INTO `shopee_category` VALUES ('689', 'Others', '687', '3', '4978');
INSERT INTO `shopee_category` VALUES ('690', 'Sweaters', '687', '3', '6570');
INSERT INTO `shopee_category` VALUES ('691', 'Jackets & Blazers', '687', '3', '6574');
INSERT INTO `shopee_category` VALUES ('692', 'Cardigans', '687', '3', '6571');
INSERT INTO `shopee_category` VALUES ('693', 'Sports & Beachwear', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('694', 'Swimsuits', '693', '3', '6603');
INSERT INTO `shopee_category` VALUES ('695', 'Sportswear', '693', '3', '6604');
INSERT INTO `shopee_category` VALUES ('696', 'Others', '693', '3', '4968');
INSERT INTO `shopee_category` VALUES ('697', 'Bikini', '693', '3', '6602');
INSERT INTO `shopee_category` VALUES ('698', 'Traditional Wear', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('699', 'Cheongsams', '698', '3', '6612');
INSERT INTO `shopee_category` VALUES ('700', 'Saree & Anarkali', '698', '3', '6613');
INSERT INTO `shopee_category` VALUES ('701', 'Others', '698', '3', '4972');
INSERT INTO `shopee_category` VALUES ('702', 'Socks & Tights', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('703', 'Others', '702', '3', '9527');
INSERT INTO `shopee_category` VALUES ('704', 'Set Wear', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('705', 'Others', '704', '3', '9556');
INSERT INTO `shopee_category` VALUES ('706', 'Maternity Wear', '652', '2', null);
INSERT INTO `shopee_category` VALUES ('707', 'Others', '706', '3', '9808');
INSERT INTO `shopee_category` VALUES ('708', 'Men\'s Clothing', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('709', 'T-shirts & Singlets', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('710', 'Solid Tees', '709', '3', '6775');
INSERT INTO `shopee_category` VALUES ('711', 'Graphic Tees', '709', '3', '6774');
INSERT INTO `shopee_category` VALUES ('712', 'Others', '709', '3', '4939');
INSERT INTO `shopee_category` VALUES ('713', 'Singlets', '709', '3', '6773');
INSERT INTO `shopee_category` VALUES ('714', 'Long Sleeve Tees', '709', '3', '6772');
INSERT INTO `shopee_category` VALUES ('715', 'Statement Tees', '709', '3', '9617');
INSERT INTO `shopee_category` VALUES ('716', 'Pants', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('717', 'Others', '716', '3', '4937');
INSERT INTO `shopee_category` VALUES ('718', 'Shorts', '716', '3', '6784');
INSERT INTO `shopee_category` VALUES ('719', 'Joggers & Sweatpants', '716', '3', '6783');
INSERT INTO `shopee_category` VALUES ('720', 'Jeans', '716', '3', '6785');
INSERT INTO `shopee_category` VALUES ('721', 'Chinos', '716', '3', '6781');
INSERT INTO `shopee_category` VALUES ('722', 'Innerwear', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('723', 'Others', '722', '3', '4932');
INSERT INTO `shopee_category` VALUES ('724', 'Boxers & Trunks', '722', '3', '6805');
INSERT INTO `shopee_category` VALUES ('725', 'Briefs', '722', '3', '6804');
INSERT INTO `shopee_category` VALUES ('726', 'Shirts', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('727', 'Short-sleeved Shirts', '726', '3', '6778');
INSERT INTO `shopee_category` VALUES ('728', 'Others', '726', '3', '4936');
INSERT INTO `shopee_category` VALUES ('729', 'Long-sleeved Shirts', '726', '3', '6777');
INSERT INTO `shopee_category` VALUES ('730', 'Men\'s Outerwear', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('731', 'Suits', '730', '3', '6790');
INSERT INTO `shopee_category` VALUES ('732', 'Hoodies', '730', '3', '6789');
INSERT INTO `shopee_category` VALUES ('733', 'Sweater', '730', '3', '6791');
INSERT INTO `shopee_category` VALUES ('734', 'Jackets', '730', '3', '6788');
INSERT INTO `shopee_category` VALUES ('735', 'Others', '730', '3', '4935');
INSERT INTO `shopee_category` VALUES ('736', 'Others', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('737', 'Others', '736', '3', '4931');
INSERT INTO `shopee_category` VALUES ('738', 'Polo Shirts', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('739', 'Others', '738', '3', '4934');
INSERT INTO `shopee_category` VALUES ('740', 'Sports Wear', '708', '2', null);
INSERT INTO `shopee_category` VALUES ('741', 'Training Wear', '740', '3', '6797');
INSERT INTO `shopee_category` VALUES ('742', 'Others', '740', '3', '4933');
INSERT INTO `shopee_category` VALUES ('743', 'Jerseys', '740', '3', '6795');
INSERT INTO `shopee_category` VALUES ('744', 'Bags & Wallets', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('745', 'Women\'s Backpacks', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('746', 'Others', '745', '3', '4946');
INSERT INTO `shopee_category` VALUES ('747', 'Casual Backpacks', '745', '3', '6743');
INSERT INTO `shopee_category` VALUES ('748', 'Drawstrings', '745', '3', '6744');
INSERT INTO `shopee_category` VALUES ('749', 'Rucksacks', '745', '3', '6745');
INSERT INTO `shopee_category` VALUES ('750', 'Laptop Bags', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('751', 'Sleeves', '750', '3', '6752');
INSERT INTO `shopee_category` VALUES ('752', 'Backpacks', '750', '3', '6750');
INSERT INTO `shopee_category` VALUES ('753', 'Briefcases', '750', '3', '6751');
INSERT INTO `shopee_category` VALUES ('754', 'Others', '750', '3', '4942');
INSERT INTO `shopee_category` VALUES ('755', 'Luggage & Travel', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('756', 'Tags & Covers', '755', '3', '6759');
INSERT INTO `shopee_category` VALUES ('757', 'Travel Totes & Duffels', '755', '3', '6757');
INSERT INTO `shopee_category` VALUES ('758', 'Packing Organizers', '755', '3', '6758');
INSERT INTO `shopee_category` VALUES ('759', 'Suitcases', '755', '3', '6756');
INSERT INTO `shopee_category` VALUES ('760', 'Others', '755', '3', '4943');
INSERT INTO `shopee_category` VALUES ('761', 'Others', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('762', 'Others', '761', '3', '4940');
INSERT INTO `shopee_category` VALUES ('763', 'Tote Bags', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('764', 'Others', '763', '3', '4948');
INSERT INTO `shopee_category` VALUES ('765', 'Shoulder Bags', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('766', 'Others', '765', '3', '4947');
INSERT INTO `shopee_category` VALUES ('767', 'Clutches & Wristlets', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('768', 'Wristlets', '767', '3', '6749');
INSERT INTO `shopee_category` VALUES ('769', 'Clutches', '767', '3', '6748');
INSERT INTO `shopee_category` VALUES ('770', 'Others', '767', '3', '4945');
INSERT INTO `shopee_category` VALUES ('771', 'Sling Bags', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('772', 'Others', '771', '3', '4944');
INSERT INTO `shopee_category` VALUES ('773', 'Luxury Bags', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('774', 'Others', '773', '3', '4941');
INSERT INTO `shopee_category` VALUES ('775', 'Handbags', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('776', 'Business Handbags', '775', '3', '6739');
INSERT INTO `shopee_category` VALUES ('777', 'Set Handbags', '775', '3', '6741');
INSERT INTO `shopee_category` VALUES ('778', 'Casual Handbags', '775', '3', '6740');
INSERT INTO `shopee_category` VALUES ('779', 'Others', '775', '3', '4951');
INSERT INTO `shopee_category` VALUES ('780', 'Purses & Pouches', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('781', 'Coin Pouches', '780', '3', '9550');
INSERT INTO `shopee_category` VALUES ('782', 'Fold Over Purses', '780', '3', '6769');
INSERT INTO `shopee_category` VALUES ('783', 'Zip Purses', '780', '3', '6770');
INSERT INTO `shopee_category` VALUES ('784', 'Make Up Bags', '780', '3', '9548');
INSERT INTO `shopee_category` VALUES ('785', 'Multi Purpose Pouches', '780', '3', '9549');
INSERT INTO `shopee_category` VALUES ('786', 'Others', '780', '3', '6763');
INSERT INTO `shopee_category` VALUES ('787', 'Men\'s Bags & Wallets', '744', '2', null);
INSERT INTO `shopee_category` VALUES ('788', 'Men\'s Wallets', '787', '3', '9547');
INSERT INTO `shopee_category` VALUES ('789', 'Messenger Bags', '787', '3', '6766');
INSERT INTO `shopee_category` VALUES ('790', 'Others', '787', '3', '6765');
INSERT INTO `shopee_category` VALUES ('791', 'Waist & Cross Body Bags', '787', '3', '6767');
INSERT INTO `shopee_category` VALUES ('792', 'Men\'s Backpacks', '787', '3', '9546');
INSERT INTO `shopee_category` VALUES ('793', 'Accessories', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('794', 'Belts', '793', '2', null);
INSERT INTO `shopee_category` VALUES ('795', 'Men\'s Belt', '794', '3', '7122');
INSERT INTO `shopee_category` VALUES ('796', 'Others', '794', '3', '4863');
INSERT INTO `shopee_category` VALUES ('797', 'Women\'s Belt', '794', '3', '7123');
INSERT INTO `shopee_category` VALUES ('798', 'Eyewear', '793', '2', null);
INSERT INTO `shopee_category` VALUES ('799', 'Others', '798', '3', '4866');
INSERT INTO `shopee_category` VALUES ('800', 'Sunglasses', '798', '3', '7116');
INSERT INTO `shopee_category` VALUES ('801', 'Eyeglasses', '798', '3', '7117');
INSERT INTO `shopee_category` VALUES ('802', 'Others', '793', '2', null);
INSERT INTO `shopee_category` VALUES ('803', 'Others', '802', '3', '4862');
INSERT INTO `shopee_category` VALUES ('804', 'Jewellery', '793', '2', null);
INSERT INTO `shopee_category` VALUES ('805', 'Pendants & Necklaces', '804', '3', '7125');
INSERT INTO `shopee_category` VALUES ('806', 'Others', '804', '3', '4872');
INSERT INTO `shopee_category` VALUES ('807', 'Rings', '804', '3', '7126');
INSERT INTO `shopee_category` VALUES ('808', 'Bracelets & Charms', '804', '3', '7124');
INSERT INTO `shopee_category` VALUES ('809', 'Anklets', '804', '3', '7129');
INSERT INTO `shopee_category` VALUES ('810', 'Pin & Brooches', '804', '3', '7128');
INSERT INTO `shopee_category` VALUES ('811', 'Earrings', '804', '3', '7127');
INSERT INTO `shopee_category` VALUES ('812', 'More Accessories', '793', '2', null);
INSERT INTO `shopee_category` VALUES ('813', 'Scarves', '812', '3', '7131');
INSERT INTO `shopee_category` VALUES ('814', 'Temporary Tattoos', '812', '3', '7132');
INSERT INTO `shopee_category` VALUES ('815', 'Key Chains', '812', '3', '7134');
INSERT INTO `shopee_category` VALUES ('816', 'Others', '812', '3', '4871');
INSERT INTO `shopee_category` VALUES ('817', 'Bows & Ties', '812', '3', '7133');
INSERT INTO `shopee_category` VALUES ('818', 'Hats & Caps', '793', '2', null);
INSERT INTO `shopee_category` VALUES ('819', 'Beanies', '818', '3', '7120');
INSERT INTO `shopee_category` VALUES ('820', 'Others', '818', '3', '4864');
INSERT INTO `shopee_category` VALUES ('821', 'Caps', '818', '3', '7119');
INSERT INTO `shopee_category` VALUES ('822', 'Hats', '818', '3', '7121');
INSERT INTO `shopee_category` VALUES ('823', 'Hair Accessories', '793', '2', null);
INSERT INTO `shopee_category` VALUES ('824', 'Wigs & Extensions', '823', '3', '9545');
INSERT INTO `shopee_category` VALUES ('825', 'Hairpins & Hairclips', '823', '3', '9543');
INSERT INTO `shopee_category` VALUES ('826', 'Hairbands & Headpieces', '823', '3', '9542');
INSERT INTO `shopee_category` VALUES ('827', 'Hairties', '823', '3', '9544');
INSERT INTO `shopee_category` VALUES ('828', 'Others', '823', '3', '4869');
INSERT INTO `shopee_category` VALUES ('829', 'Home & Living', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('830', 'Kitchen & Dining', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('831', 'Cookware', '830', '3', '6908');
INSERT INTO `shopee_category` VALUES ('832', 'Knives & Sharpeners', '830', '3', '6904');
INSERT INTO `shopee_category` VALUES ('833', 'Tableware', '830', '3', '6907');
INSERT INTO `shopee_category` VALUES ('834', 'Others', '830', '3', '4909');
INSERT INTO `shopee_category` VALUES ('835', 'Kitchen Tools', '830', '3', '6909');
INSERT INTO `shopee_category` VALUES ('836', 'Bakeware', '830', '3', '6906');
INSERT INTO `shopee_category` VALUES ('837', 'Home Decor', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('838', 'Mirrors & Wall Art', '837', '3', '6925');
INSERT INTO `shopee_category` VALUES ('839', 'Rugs & Carpets', '837', '3', '6924');
INSERT INTO `shopee_category` VALUES ('840', 'Fragrance & Candles', '837', '3', '9890');
INSERT INTO `shopee_category` VALUES ('841', 'Curtains & Blinds', '837', '3', '9887');
INSERT INTO `shopee_category` VALUES ('842', 'Clocks', '837', '3', '6923');
INSERT INTO `shopee_category` VALUES ('843', 'Lighting', '837', '3', '6926');
INSERT INTO `shopee_category` VALUES ('844', 'Others', '837', '3', '4905');
INSERT INTO `shopee_category` VALUES ('845', 'Cushions & Covers', '837', '3', '9888');
INSERT INTO `shopee_category` VALUES ('846', 'Festive Decor', '837', '3', '9889');
INSERT INTO `shopee_category` VALUES ('847', 'Home Storage & Organization', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('848', 'Clothes Organization', '847', '3', '6911');
INSERT INTO `shopee_category` VALUES ('849', 'Others', '847', '3', '4907');
INSERT INTO `shopee_category` VALUES ('850', 'Storage Cabinets', '847', '3', '6914');
INSERT INTO `shopee_category` VALUES ('851', 'Racks & Shelves', '847', '3', '6912');
INSERT INTO `shopee_category` VALUES ('852', 'Others', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('853', 'Others', '852', '3', '4902');
INSERT INTO `shopee_category` VALUES ('854', 'Kitchen Storage', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('855', 'Bottles', '854', '3', '6945');
INSERT INTO `shopee_category` VALUES ('856', 'Storage Organizers', '854', '3', '9895');
INSERT INTO `shopee_category` VALUES ('857', 'Dish Racks & Sink', '854', '3', '6947');
INSERT INTO `shopee_category` VALUES ('858', 'Others', '854', '3', '4908');
INSERT INTO `shopee_category` VALUES ('859', 'Food Storage', '854', '3', '9896');
INSERT INTO `shopee_category` VALUES ('860', 'Canisters & Jars', '854', '3', '6946');
INSERT INTO `shopee_category` VALUES ('861', 'Bath & Bedding', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('862', 'Bedding Accessories', '861', '3', '6929');
INSERT INTO `shopee_category` VALUES ('863', 'Bathroom Accessories', '861', '3', '9884');
INSERT INTO `shopee_category` VALUES ('864', 'Mats, Towels & Robes', '861', '3', '9885');
INSERT INTO `shopee_category` VALUES ('865', 'Others', '861', '3', '4904');
INSERT INTO `shopee_category` VALUES ('866', 'Bedding Sets & Sheets', '861', '3', '6928');
INSERT INTO `shopee_category` VALUES ('867', 'Pillows & Bolsters', '861', '3', '9886');
INSERT INTO `shopee_category` VALUES ('868', 'Mattresses & Protectors', '861', '3', '6927');
INSERT INTO `shopee_category` VALUES ('869', 'Furniture', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('870', 'Living & Dining', '869', '3', '6952');
INSERT INTO `shopee_category` VALUES ('871', 'Office', '869', '3', '6953');
INSERT INTO `shopee_category` VALUES ('872', 'Others', '869', '3', '6950');
INSERT INTO `shopee_category` VALUES ('873', 'Bedroom', '869', '3', '6951');
INSERT INTO `shopee_category` VALUES ('874', 'Housekeeping & Supplies', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('875', 'Cleaning Supplies', '874', '3', '6958');
INSERT INTO `shopee_category` VALUES ('876', 'Pest Control', '874', '3', '9485');
INSERT INTO `shopee_category` VALUES ('877', 'Brooms & Mops', '874', '3', '10065');
INSERT INTO `shopee_category` VALUES ('878', 'Paper Products', '874', '3', '10066');
INSERT INTO `shopee_category` VALUES ('879', 'Laundry', '874', '3', '6960');
INSERT INTO `shopee_category` VALUES ('880', 'Others', '874', '3', '6957');
INSERT INTO `shopee_category` VALUES ('881', 'Home Improvement', '829', '2', null);
INSERT INTO `shopee_category` VALUES ('882', 'Plugs & Adaptors', '881', '3', '10064');
INSERT INTO `shopee_category` VALUES ('883', 'DIY Tools', '881', '3', '9524');
INSERT INTO `shopee_category` VALUES ('884', 'Chains & Locks', '881', '3', '9525');
INSERT INTO `shopee_category` VALUES ('885', 'Others', '881', '3', '9522');
INSERT INTO `shopee_category` VALUES ('886', 'Outdoor & Garden', '881', '3', '9523');
INSERT INTO `shopee_category` VALUES ('887', 'Toys, Kids & Babies', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('888', 'Nursery', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('889', 'Others', '888', '3', '4891');
INSERT INTO `shopee_category` VALUES ('890', 'Blankets & Pillows', '888', '3', '7042');
INSERT INTO `shopee_category` VALUES ('891', 'Bedding', '888', '3', '7041');
INSERT INTO `shopee_category` VALUES ('892', 'Baby Safety', '888', '3', '7040');
INSERT INTO `shopee_category` VALUES ('893', 'Maternity Care', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('894', 'Others', '893', '3', '4888');
INSERT INTO `shopee_category` VALUES ('895', 'Maternity Accessories', '893', '3', '7066');
INSERT INTO `shopee_category` VALUES ('896', 'Pregnancy Pillows', '893', '3', '9821');
INSERT INTO `shopee_category` VALUES ('897', 'Moisturizers & Creams', '893', '3', '7067');
INSERT INTO `shopee_category` VALUES ('898', 'Others', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('899', 'Others', '898', '3', '4887');
INSERT INTO `shopee_category` VALUES ('900', 'Baby Clothing', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('901', 'Nightwear', '900', '3', '9553');
INSERT INTO `shopee_category` VALUES ('902', 'Others', '900', '3', '4897');
INSERT INTO `shopee_category` VALUES ('903', 'Baby Clothing', '900', '3', '9551');
INSERT INTO `shopee_category` VALUES ('904', 'Mittens & Footwear', '900', '3', '9552');
INSERT INTO `shopee_category` VALUES ('905', 'Baby Gears', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('906', 'Car Seats', '905', '3', '6997');
INSERT INTO `shopee_category` VALUES ('907', 'Others', '905', '3', '4890');
INSERT INTO `shopee_category` VALUES ('908', 'Strollers', '905', '3', '6998');
INSERT INTO `shopee_category` VALUES ('909', 'Walkers & Bouncers', '905', '3', '9787');
INSERT INTO `shopee_category` VALUES ('910', 'Baby Carrier', '905', '3', '9792');
INSERT INTO `shopee_category` VALUES ('911', 'Feeding & Nursing', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('912', 'Breastfeeding', '911', '3', '9786');
INSERT INTO `shopee_category` VALUES ('913', 'Lunchboxes & Storage', '911', '3', '6979');
INSERT INTO `shopee_category` VALUES ('914', 'Others', '911', '3', '4900');
INSERT INTO `shopee_category` VALUES ('915', 'Food & Formula', '911', '3', '6976');
INSERT INTO `shopee_category` VALUES ('916', 'Baby Bibs', '911', '3', '6977');
INSERT INTO `shopee_category` VALUES ('917', 'Teethers & Pacifiers', '911', '3', '6975');
INSERT INTO `shopee_category` VALUES ('918', 'Bottle Feeding', '911', '3', '6973');
INSERT INTO `shopee_category` VALUES ('919', 'Sterilisers & Warmers', '911', '3', '6974');
INSERT INTO `shopee_category` VALUES ('920', 'Diapers & Potties', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('921', 'Potties', '920', '3', '7070');
INSERT INTO `shopee_category` VALUES ('922', 'Diaper Bag', '920', '3', '7071');
INSERT INTO `shopee_category` VALUES ('923', 'Diapers', '920', '3', '7069');
INSERT INTO `shopee_category` VALUES ('924', 'Others', '920', '3', '4889');
INSERT INTO `shopee_category` VALUES ('925', 'Bath & Skincare', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('926', 'Oral Care', '925', '3', '6983');
INSERT INTO `shopee_category` VALUES ('927', 'Others', '925', '3', '4899');
INSERT INTO `shopee_category` VALUES ('928', 'Bathing Accessories', '925', '3', '9846');
INSERT INTO `shopee_category` VALUES ('929', 'Bath & Shampoo', '925', '3', '6981');
INSERT INTO `shopee_category` VALUES ('930', 'Skincare', '925', '3', '6982');
INSERT INTO `shopee_category` VALUES ('931', 'Baby Wipes', '925', '3', '9794');
INSERT INTO `shopee_category` VALUES ('932', 'Toys & Education', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('933', 'Early Learning', '932', '3', '7037');
INSERT INTO `shopee_category` VALUES ('934', 'Sports & Outdoor Play', '932', '3', '7039');
INSERT INTO `shopee_category` VALUES ('935', 'Musical Toys', '932', '3', '9817');
INSERT INTO `shopee_category` VALUES ('936', 'Stuffed Toys', '932', '3', '7038');
INSERT INTO `shopee_category` VALUES ('937', 'Arts & Crafts', '932', '3', '9810');
INSERT INTO `shopee_category` VALUES ('938', 'Playmats', '932', '3', '9818');
INSERT INTO `shopee_category` VALUES ('939', 'Building Blocks', '932', '3', '9812');
INSERT INTO `shopee_category` VALUES ('940', 'Baby & Toddler Toys', '932', '3', '9811');
INSERT INTO `shopee_category` VALUES ('941', 'Others', '932', '3', '4895');
INSERT INTO `shopee_category` VALUES ('942', 'Pretend Play', '932', '3', '9819');
INSERT INTO `shopee_category` VALUES ('943', 'Dolls & Accessories', '932', '3', '9816');
INSERT INTO `shopee_category` VALUES ('944', 'Puzzles', '932', '3', '9820');
INSERT INTO `shopee_category` VALUES ('945', 'Accessories', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('946', 'Others', '945', '3', '4901');
INSERT INTO `shopee_category` VALUES ('947', 'Bags', '945', '3', '6969');
INSERT INTO `shopee_category` VALUES ('948', 'Hats & Caps', '945', '3', '6971');
INSERT INTO `shopee_category` VALUES ('949', 'Kids Hair Accessories', '945', '3', '9374');
INSERT INTO `shopee_category` VALUES ('950', 'Watches', '945', '3', '9845');
INSERT INTO `shopee_category` VALUES ('951', 'Kids Fashion', '887', '2', null);
INSERT INTO `shopee_category` VALUES ('952', 'Others', '951', '3', '4898');
INSERT INTO `shopee_category` VALUES ('953', 'Socks', '951', '3', '6988');
INSERT INTO `shopee_category` VALUES ('954', 'Boys Clothing', '951', '3', '6990');
INSERT INTO `shopee_category` VALUES ('955', 'Shoes', '951', '3', '9554');
INSERT INTO `shopee_category` VALUES ('956', 'Girls Clothing', '951', '3', '6989');
INSERT INTO `shopee_category` VALUES ('957', 'Hobbies, Games & Collectibles', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('958', 'Games for Consoles', '957', '2', null);
INSERT INTO `shopee_category` VALUES ('959', 'PS3', '958', '3', '7171');
INSERT INTO `shopee_category` VALUES ('960', 'PS4', '958', '3', '7169');
INSERT INTO `shopee_category` VALUES ('961', 'Xbox One', '958', '3', '7172');
INSERT INTO `shopee_category` VALUES ('962', 'Others', '958', '3', '4843');
INSERT INTO `shopee_category` VALUES ('963', 'PC', '958', '3', '7170');
INSERT INTO `shopee_category` VALUES ('964', 'Nintendo 3DS', '958', '3', '7174');
INSERT INTO `shopee_category` VALUES ('965', 'PS Vita', '958', '3', '7167');
INSERT INTO `shopee_category` VALUES ('966', 'Xbox 360', '958', '3', '7173');
INSERT INTO `shopee_category` VALUES ('967', 'Games & Collectibles', '957', '2', null);
INSERT INTO `shopee_category` VALUES ('968', 'Toy Vehicles', '967', '3', '7177');
INSERT INTO `shopee_category` VALUES ('969', 'Family Games', '967', '3', '7179');
INSERT INTO `shopee_category` VALUES ('970', 'Collectibles', '967', '3', '9484');
INSERT INTO `shopee_category` VALUES ('971', 'DIY Collectibles', '967', '3', '7176');
INSERT INTO `shopee_category` VALUES ('972', 'Others', '967', '3', '4842');
INSERT INTO `shopee_category` VALUES ('973', 'Action Figures', '967', '3', '7178');
INSERT INTO `shopee_category` VALUES ('974', 'Media & Music', '957', '2', null);
INSERT INTO `shopee_category` VALUES ('975', 'English Books', '974', '3', '7183');
INSERT INTO `shopee_category` VALUES ('976', 'CD/DVD/Blu-Ray', '974', '3', '7180');
INSERT INTO `shopee_category` VALUES ('977', 'Local Books', '974', '3', '7181');
INSERT INTO `shopee_category` VALUES ('978', 'Chinese Books', '974', '3', '7182');
INSERT INTO `shopee_category` VALUES ('979', 'Others', '974', '3', '4840');
INSERT INTO `shopee_category` VALUES ('980', 'Musical Instruments', '974', '3', '7184');
INSERT INTO `shopee_category` VALUES ('981', 'Others', '957', '2', null);
INSERT INTO `shopee_category` VALUES ('982', 'Others', '981', '3', '4835');
INSERT INTO `shopee_category` VALUES ('983', 'Consoles & Accessories', '957', '2', null);
INSERT INTO `shopee_category` VALUES ('984', 'Others', '983', '3', '4844');
INSERT INTO `shopee_category` VALUES ('985', 'Stationary Consoles', '983', '3', '7165');
INSERT INTO `shopee_category` VALUES ('986', 'Handheld Consoles', '983', '3', '7164');
INSERT INTO `shopee_category` VALUES ('987', 'Consoles Accessories', '983', '3', '7166');
INSERT INTO `shopee_category` VALUES ('988', 'Everything Else', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('989', 'Religion & Beliefs', '988', '2', null);
INSERT INTO `shopee_category` VALUES ('990', 'Statues & Figurines', '989', '3', '7228');
INSERT INTO `shopee_category` VALUES ('991', 'Accents', '989', '3', '7229');
INSERT INTO `shopee_category` VALUES ('992', 'Others', '989', '3', '4796');
INSERT INTO `shopee_category` VALUES ('993', 'Others', '988', '2', null);
INSERT INTO `shopee_category` VALUES ('994', 'Others', '993', '3', '4800');
INSERT INTO `shopee_category` VALUES ('995', 'Car Care & Parts', '988', '2', null);
INSERT INTO `shopee_category` VALUES ('996', 'Car Seats', '995', '3', '7225');
INSERT INTO `shopee_category` VALUES ('997', 'Dashboard Accessories', '995', '3', '7223');
INSERT INTO `shopee_category` VALUES ('998', 'Car Stickers', '995', '3', '7224');
INSERT INTO `shopee_category` VALUES ('999', 'Others', '995', '3', '4807');
INSERT INTO `shopee_category` VALUES ('1000', 'Electronic Cigarettes', '988', '2', null);
INSERT INTO `shopee_category` VALUES ('1001', 'Others', '1000', '3', '4810');
INSERT INTO `shopee_category` VALUES ('1002', 'Vape Mods', '1000', '3', '7220');
INSERT INTO `shopee_category` VALUES ('1003', 'Tanks & Accessories', '1000', '3', '7221');
INSERT INTO `shopee_category` VALUES ('1004', 'e-Juices', '1000', '3', '7222');
INSERT INTO `shopee_category` VALUES ('1005', 'Pets', '988', '2', null);
INSERT INTO `shopee_category` VALUES ('1006', 'Feeding & Grooming', '1005', '3', '7227');
INSERT INTO `shopee_category` VALUES ('1007', 'Clothes & Accessories', '1005', '3', '7226');
INSERT INTO `shopee_category` VALUES ('1008', 'Others', '1005', '3', '4806');
INSERT INTO `shopee_category` VALUES ('1009', 'Muslim Wear', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1010', 'Muslimah Jubah', '1009', '2', null);
INSERT INTO `shopee_category` VALUES ('1011', 'Jubah Dokoh', '1010', '3', '9851');
INSERT INTO `shopee_category` VALUES ('1012', 'Nursing Jubah', '1010', '3', '9852');
INSERT INTO `shopee_category` VALUES ('1013', 'Others', '1010', '3', '4855');
INSERT INTO `shopee_category` VALUES ('1014', 'Basic Jubah', '1010', '3', '9849');
INSERT INTO `shopee_category` VALUES ('1015', 'Fashion Jubah', '1010', '3', '9850');
INSERT INTO `shopee_category` VALUES ('1016', 'Muslimah Wear', '1009', '2', null);
INSERT INTO `shopee_category` VALUES ('1017', 'Baju Kebaya', '1016', '3', '9565');
INSERT INTO `shopee_category` VALUES ('1018', 'Telekung', '1016', '3', '7146');
INSERT INTO `shopee_category` VALUES ('1019', 'Others', '1016', '3', '4854');
INSERT INTO `shopee_category` VALUES ('1020', 'Kaftan & Kimonos', '1016', '3', '7147');
INSERT INTO `shopee_category` VALUES ('1021', 'Baju Kurung', '1016', '3', '7149');
INSERT INTO `shopee_category` VALUES ('1022', 'Pants & Skirts', '1016', '3', '7144');
INSERT INTO `shopee_category` VALUES ('1023', 'Hijab', '1009', '2', null);
INSERT INTO `shopee_category` VALUES ('1024', 'Instant Shawl', '1023', '3', '9623');
INSERT INTO `shopee_category` VALUES ('1025', 'Others', '1023', '3', '4853');
INSERT INTO `shopee_category` VALUES ('1026', 'Inner', '1023', '3', '9627');
INSERT INTO `shopee_category` VALUES ('1027', 'Wide Shawl', '1023', '3', '9625');
INSERT INTO `shopee_category` VALUES ('1028', 'Basic Shawl', '1023', '3', '9624');
INSERT INTO `shopee_category` VALUES ('1029', 'Bawal', '1023', '3', '9626');
INSERT INTO `shopee_category` VALUES ('1030', 'Blouse', '1009', '2', null);
INSERT INTO `shopee_category` VALUES ('1031', 'Long Blouse', '1030', '3', '9855');
INSERT INTO `shopee_category` VALUES ('1032', 'Fashion Blouse', '1030', '3', '9854');
INSERT INTO `shopee_category` VALUES ('1033', 'Others', '1030', '3', '4852');
INSERT INTO `shopee_category` VALUES ('1034', 'Basic Blouse', '1030', '3', '9853');
INSERT INTO `shopee_category` VALUES ('1035', 'Nursing Blouse', '1030', '3', '9856');
INSERT INTO `shopee_category` VALUES ('1036', 'Others', '1009', '2', null);
INSERT INTO `shopee_category` VALUES ('1037', 'Others', '1036', '3', '4850');
INSERT INTO `shopee_category` VALUES ('1038', 'Muslimin Wear', '1009', '2', null);
INSERT INTO `shopee_category` VALUES ('1039', 'Others', '1038', '3', '4851');
INSERT INTO `shopee_category` VALUES ('1040', 'Jubah', '1038', '3', '7141');
INSERT INTO `shopee_category` VALUES ('1041', 'Kurta', '1038', '3', '7142');
INSERT INTO `shopee_category` VALUES ('1042', 'Batik & Songket', '1009', '2', null);
INSERT INTO `shopee_category` VALUES ('1043', 'Others', '1042', '3', '7151');
INSERT INTO `shopee_category` VALUES ('1044', 'Women\'s Shoes', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1045', 'Heels', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1046', 'Others', '1045', '3', '4879');
INSERT INTO `shopee_category` VALUES ('1047', 'Platform Heels', '1045', '3', '7090');
INSERT INTO `shopee_category` VALUES ('1048', 'Low Heels', '1045', '3', '7089');
INSERT INTO `shopee_category` VALUES ('1049', 'High Heels', '1045', '3', '7087');
INSERT INTO `shopee_category` VALUES ('1050', 'Mid Heels', '1045', '3', '7088');
INSERT INTO `shopee_category` VALUES ('1051', 'Peep Toes', '1045', '3', '7091');
INSERT INTO `shopee_category` VALUES ('1052', 'Sports & Sneakers', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1053', 'Sneakers', '1052', '3', '7086');
INSERT INTO `shopee_category` VALUES ('1054', 'Sports Shoes', '1052', '3', '7085');
INSERT INTO `shopee_category` VALUES ('1055', 'Others', '1052', '3', '4880');
INSERT INTO `shopee_category` VALUES ('1056', 'Sandals & Slippers', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1057', 'Slippers', '1056', '3', '7096');
INSERT INTO `shopee_category` VALUES ('1058', 'Others', '1056', '3', '4878');
INSERT INTO `shopee_category` VALUES ('1059', 'Sandals', '1056', '3', '7095');
INSERT INTO `shopee_category` VALUES ('1060', 'Wedges & Platforms', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1061', 'Wedges', '1060', '3', '7112');
INSERT INTO `shopee_category` VALUES ('1062', 'Platforms', '1060', '3', '7113');
INSERT INTO `shopee_category` VALUES ('1063', 'Others', '1060', '3', '4875');
INSERT INTO `shopee_category` VALUES ('1064', 'Women\'s Leather Wear', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1065', 'Others', '1064', '3', '4874');
INSERT INTO `shopee_category` VALUES ('1066', 'Others', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1067', 'Others', '1066', '3', '4873');
INSERT INTO `shopee_category` VALUES ('1068', 'Flats', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1069', 'Peep Toes', '1068', '3', '7109');
INSERT INTO `shopee_category` VALUES ('1070', 'Loafers', '1068', '3', '7107');
INSERT INTO `shopee_category` VALUES ('1071', 'Others', '1068', '3', '4877');
INSERT INTO `shopee_category` VALUES ('1072', 'Ballet Flats', '1068', '3', '7108');
INSERT INTO `shopee_category` VALUES ('1073', 'Shoes Accessories', '1044', '2', null);
INSERT INTO `shopee_category` VALUES ('1074', 'Others', '1073', '3', '7115');
INSERT INTO `shopee_category` VALUES ('1075', 'Beauty & Personal Care', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1076', 'Personal Care', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1077', 'Oral Hygiene', '1076', '3', '6702');
INSERT INTO `shopee_category` VALUES ('1078', 'Slimming & Shaping', '1076', '3', '6699');
INSERT INTO `shopee_category` VALUES ('1079', 'Feminine Care', '1076', '3', '6705');
INSERT INTO `shopee_category` VALUES ('1080', 'Personal Pleasure', '1076', '3', '6704');
INSERT INTO `shopee_category` VALUES ('1081', 'Massage & Detox', '1076', '3', '6701');
INSERT INTO `shopee_category` VALUES ('1082', 'Others', '1076', '3', '4955');
INSERT INTO `shopee_category` VALUES ('1083', 'Bath & Body', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1084', 'Bath', '1083', '3', '6671');
INSERT INTO `shopee_category` VALUES ('1085', 'Body Scrubs', '1083', '3', '6673');
INSERT INTO `shopee_category` VALUES ('1086', 'Body Lotion & Butter', '1083', '3', '6672');
INSERT INTO `shopee_category` VALUES ('1087', 'Others', '1083', '3', '4959');
INSERT INTO `shopee_category` VALUES ('1088', 'Hair Care', '1083', '3', '6670');
INSERT INTO `shopee_category` VALUES ('1089', 'Fragrances', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1090', 'For Her', '1089', '3', '6675');
INSERT INTO `shopee_category` VALUES ('1091', 'Aromatherapy', '1089', '3', '6676');
INSERT INTO `shopee_category` VALUES ('1092', 'For Him', '1089', '3', '6674');
INSERT INTO `shopee_category` VALUES ('1093', 'Others', '1089', '3', '4957');
INSERT INTO `shopee_category` VALUES ('1094', 'Supplements', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1095', 'Sports Nutrition', '1094', '3', '9510');
INSERT INTO `shopee_category` VALUES ('1096', 'Well-being', '1094', '3', '9509');
INSERT INTO `shopee_category` VALUES ('1097', 'Traditional', '1094', '3', '9508');
INSERT INTO `shopee_category` VALUES ('1098', 'Nutritional Supplement', '1094', '3', '9511');
INSERT INTO `shopee_category` VALUES ('1099', 'Weight Management', '1094', '3', '9512');
INSERT INTO `shopee_category` VALUES ('1100', 'Others', '1094', '3', '4798');
INSERT INTO `shopee_category` VALUES ('1101', 'Others', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1102', 'Others', '1101', '3', '4952');
INSERT INTO `shopee_category` VALUES ('1103', 'Men\'s Grooming', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1104', 'Shaving', '1103', '3', '6709');
INSERT INTO `shopee_category` VALUES ('1105', 'For Skin', '1103', '3', '6706');
INSERT INTO `shopee_category` VALUES ('1106', 'Others', '1103', '3', '4802');
INSERT INTO `shopee_category` VALUES ('1107', 'For Hair', '1103', '3', '6707');
INSERT INTO `shopee_category` VALUES ('1108', 'Medical Supplies', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1109', 'Others', '1108', '3', '4953');
INSERT INTO `shopee_category` VALUES ('1110', 'Health Accessories', '1108', '3', '6693');
INSERT INTO `shopee_category` VALUES ('1111', 'Weighing Scale', '1108', '3', '6692');
INSERT INTO `shopee_category` VALUES ('1112', 'Ointments & Bandages', '1108', '3', '6695');
INSERT INTO `shopee_category` VALUES ('1113', 'Eye Care', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1114', 'Prescription Lens & Care', '1113', '3', '9663');
INSERT INTO `shopee_category` VALUES ('1115', 'Eye Mask', '1113', '3', '9662');
INSERT INTO `shopee_category` VALUES ('1116', 'Eye Cream & Serum', '1113', '3', '4960');
INSERT INTO `shopee_category` VALUES ('1117', 'Others', '1113', '3', '9664');
INSERT INTO `shopee_category` VALUES ('1118', 'Face Make Up', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1119', 'Powder & Compacts', '1118', '3', '6616');
INSERT INTO `shopee_category` VALUES ('1120', 'Others', '1118', '3', '4966');
INSERT INTO `shopee_category` VALUES ('1121', 'Make Up Sets', '1118', '3', '9666');
INSERT INTO `shopee_category` VALUES ('1122', 'Concealer', '1118', '3', '6619');
INSERT INTO `shopee_category` VALUES ('1123', 'Shading & Highlighting', '1118', '3', '6620');
INSERT INTO `shopee_category` VALUES ('1124', 'Foundation', '1118', '3', '6617');
INSERT INTO `shopee_category` VALUES ('1125', 'Blusher', '1118', '3', '6618');
INSERT INTO `shopee_category` VALUES ('1126', 'Eye Make Up', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1127', 'Eyeliner', '1126', '3', '6622');
INSERT INTO `shopee_category` VALUES ('1128', 'Mascara', '1126', '3', '6624');
INSERT INTO `shopee_category` VALUES ('1129', 'Cosmetic Contact Lens', '1126', '3', '6625');
INSERT INTO `shopee_category` VALUES ('1130', 'Eyebrow', '1126', '3', '6623');
INSERT INTO `shopee_category` VALUES ('1131', 'Others', '1126', '3', '4965');
INSERT INTO `shopee_category` VALUES ('1132', 'Eye Shadow', '1126', '3', '6621');
INSERT INTO `shopee_category` VALUES ('1133', 'Eyelid Tape & Eyelashes', '1126', '3', '6626');
INSERT INTO `shopee_category` VALUES ('1134', 'Lips', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1135', 'Lip Gloss', '1134', '3', '6643');
INSERT INTO `shopee_category` VALUES ('1136', 'Others', '1134', '3', '4964');
INSERT INTO `shopee_category` VALUES ('1137', 'Lip Tint', '1134', '3', '6647');
INSERT INTO `shopee_category` VALUES ('1138', 'Lip Liner', '1134', '3', '6645');
INSERT INTO `shopee_category` VALUES ('1139', 'Lipstick', '1134', '3', '6641');
INSERT INTO `shopee_category` VALUES ('1140', 'Lip Balm & Treatment', '1134', '3', '6642');
INSERT INTO `shopee_category` VALUES ('1141', 'Pedicure & Manicure', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1142', 'Others', '1141', '3', '4956');
INSERT INTO `shopee_category` VALUES ('1143', 'Treatment & Remover', '1141', '3', '6655');
INSERT INTO `shopee_category` VALUES ('1144', 'Nail Art & Stickers', '1141', '3', '6654');
INSERT INTO `shopee_category` VALUES ('1145', 'Top Coat & Base Coat', '1141', '3', '6653');
INSERT INTO `shopee_category` VALUES ('1146', 'Nail Care Tools', '1141', '3', '6656');
INSERT INTO `shopee_category` VALUES ('1147', 'Nail Polish', '1141', '3', '6651');
INSERT INTO `shopee_category` VALUES ('1148', 'Brushes & Beauty Tools', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1149', 'Hair Styling', '1148', '3', '6684');
INSERT INTO `shopee_category` VALUES ('1150', 'Brushes & Sponges', '1148', '3', '6681');
INSERT INTO `shopee_category` VALUES ('1151', 'Hair Removal', '1148', '3', '6685');
INSERT INTO `shopee_category` VALUES ('1152', 'Others', '1148', '3', '4963');
INSERT INTO `shopee_category` VALUES ('1153', 'Facial Tools', '1148', '3', '6682');
INSERT INTO `shopee_category` VALUES ('1154', 'Skincare', '1075', '2', null);
INSERT INTO `shopee_category` VALUES ('1155', 'Toner & Mists', '1154', '3', '9518');
INSERT INTO `shopee_category` VALUES ('1156', 'Essence & Serum', '1154', '3', '9516');
INSERT INTO `shopee_category` VALUES ('1157', 'Sunscreen & Aftersun', '1154', '3', '9514');
INSERT INTO `shopee_category` VALUES ('1158', 'Others', '1154', '3', '9507');
INSERT INTO `shopee_category` VALUES ('1159', 'Skin Sets', '1154', '3', '9665');
INSERT INTO `shopee_category` VALUES ('1160', 'Whitening', '1154', '3', '9515');
INSERT INTO `shopee_category` VALUES ('1161', 'Face Mask & Packs', '1154', '3', '9520');
INSERT INTO `shopee_category` VALUES ('1162', 'Cleanser', '1154', '3', '9519');
INSERT INTO `shopee_category` VALUES ('1163', 'Moisturizer & Cream', '1154', '3', '9517');
INSERT INTO `shopee_category` VALUES ('1164', 'Sports & Outdoor', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1165', 'Sports Gear & Accessories', '1164', '2', null);
INSERT INTO `shopee_category` VALUES ('1166', 'Individual Sports', '1165', '3', '7191');
INSERT INTO `shopee_category` VALUES ('1167', 'Others', '1165', '3', '4826');
INSERT INTO `shopee_category` VALUES ('1168', 'Team Sports', '1165', '3', '7192');
INSERT INTO `shopee_category` VALUES ('1169', 'Fitness Equipment', '1164', '2', null);
INSERT INTO `shopee_category` VALUES ('1170', 'Training Equipment', '1169', '3', '7187');
INSERT INTO `shopee_category` VALUES ('1171', 'Yoga', '1169', '3', '7186');
INSERT INTO `shopee_category` VALUES ('1172', 'Others', '1169', '3', '4828');
INSERT INTO `shopee_category` VALUES ('1173', 'Others', '1164', '2', null);
INSERT INTO `shopee_category` VALUES ('1174', 'Default', '1173', '3', '4825');
INSERT INTO `shopee_category` VALUES ('1175', 'Outdoor & Adventure', '1164', '2', null);
INSERT INTO `shopee_category` VALUES ('1176', 'Skates', '1175', '3', '7190');
INSERT INTO `shopee_category` VALUES ('1177', 'Camping & Hiking', '1175', '3', '7188');
INSERT INTO `shopee_category` VALUES ('1178', 'Others', '1175', '3', '4827');
INSERT INTO `shopee_category` VALUES ('1179', 'Cycling', '1175', '3', '7189');
INSERT INTO `shopee_category` VALUES ('1180', 'Mobile & Gadgets', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1181', 'Mobile Car Accessories', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1182', 'Others', '1181', '3', '4921');
INSERT INTO `shopee_category` VALUES ('1183', 'Tablets', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1184', 'Android', '1183', '3', '6856');
INSERT INTO `shopee_category` VALUES ('1185', 'Others', '1183', '3', '4920');
INSERT INTO `shopee_category` VALUES ('1186', 'iOS', '1183', '3', '6857');
INSERT INTO `shopee_category` VALUES ('1187', 'Cases & Covers', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1188', 'Others', '1187', '3', '4929');
INSERT INTO `shopee_category` VALUES ('1189', 'iPhone Hard Cover', '1187', '3', '6815');
INSERT INTO `shopee_category` VALUES ('1190', 'iPhone Soft Cover', '1187', '3', '9597');
INSERT INTO `shopee_category` VALUES ('1191', 'Android Hard Cover', '1187', '3', '9529');
INSERT INTO `shopee_category` VALUES ('1192', 'Tablet', '1187', '3', '6816');
INSERT INTO `shopee_category` VALUES ('1193', 'Android Soft Cover', '1187', '3', '9598');
INSERT INTO `shopee_category` VALUES ('1194', 'Phone Holder & Stand', '1187', '3', '9528');
INSERT INTO `shopee_category` VALUES ('1195', 'Powerbanks & Batteries', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1196', 'Powerbanks', '1195', '3', '6810');
INSERT INTO `shopee_category` VALUES ('1197', 'Fashion Powerbanks', '1195', '3', '6811');
INSERT INTO `shopee_category` VALUES ('1198', 'Phone Batteries', '1195', '3', '6813');
INSERT INTO `shopee_category` VALUES ('1199', 'Others', '1195', '3', '4930');
INSERT INTO `shopee_category` VALUES ('1200', 'Storage & Memory Cards', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1201', 'USB Drive', '1200', '3', '6842');
INSERT INTO `shopee_category` VALUES ('1202', 'Memory Cards', '1200', '3', '6843');
INSERT INTO `shopee_category` VALUES ('1203', 'Others', '1200', '3', '4925');
INSERT INTO `shopee_category` VALUES ('1204', 'Others', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1205', 'Others', '1204', '3', '4919');
INSERT INTO `shopee_category` VALUES ('1206', 'Cables & Chargers', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1207', 'Cables', '1206', '3', '6817');
INSERT INTO `shopee_category` VALUES ('1208', 'Chargers', '1206', '3', '6818');
INSERT INTO `shopee_category` VALUES ('1209', 'Docks', '1206', '3', '6821');
INSERT INTO `shopee_category` VALUES ('1210', 'Others', '1206', '3', '4928');
INSERT INTO `shopee_category` VALUES ('1211', 'Audio', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1212', 'Earphones', '1211', '3', '6848');
INSERT INTO `shopee_category` VALUES ('1213', 'Others', '1211', '3', '4924');
INSERT INTO `shopee_category` VALUES ('1214', 'Headphones & Headsets', '1211', '3', '6847');
INSERT INTO `shopee_category` VALUES ('1215', 'Speakers', '1211', '3', '6849');
INSERT INTO `shopee_category` VALUES ('1216', 'Cool Gadgets', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1217', 'Other Gadgets', '1216', '3', '6832');
INSERT INTO `shopee_category` VALUES ('1218', 'USB Fan', '1216', '3', '6829');
INSERT INTO `shopee_category` VALUES ('1219', 'USB Light', '1216', '3', '6831');
INSERT INTO `shopee_category` VALUES ('1220', 'Others', '1216', '3', '4927');
INSERT INTO `shopee_category` VALUES ('1221', 'Wearables', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1222', 'Fitness Tracker', '1221', '3', '6852');
INSERT INTO `shopee_category` VALUES ('1223', 'Others', '1221', '3', '4923');
INSERT INTO `shopee_category` VALUES ('1224', 'Smart Watch', '1221', '3', '6851');
INSERT INTO `shopee_category` VALUES ('1225', 'Mobile Phones', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1226', 'Sony', '1225', '3', '10113');
INSERT INTO `shopee_category` VALUES ('1227', 'Others', '1225', '3', '4922');
INSERT INTO `shopee_category` VALUES ('1228', 'Nokia', '1225', '3', '10111');
INSERT INTO `shopee_category` VALUES ('1229', 'Other Brands', '1225', '3', '6855');
INSERT INTO `shopee_category` VALUES ('1230', 'Asus', '1225', '3', '10110');
INSERT INTO `shopee_category` VALUES ('1231', 'Xiaomi', '1225', '3', '10094');
INSERT INTO `shopee_category` VALUES ('1232', 'Huawei & Honor', '1225', '3', '10093');
INSERT INTO `shopee_category` VALUES ('1233', 'Lenovo', '1225', '3', '10096');
INSERT INTO `shopee_category` VALUES ('1234', 'iPhone', '1225', '3', '6854');
INSERT INTO `shopee_category` VALUES ('1235', 'Samsung', '1225', '3', '6853');
INSERT INTO `shopee_category` VALUES ('1236', 'Screen Protectors', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1237', 'Matte', '1236', '3', '6837');
INSERT INTO `shopee_category` VALUES ('1238', 'Others', '1236', '3', '4926');
INSERT INTO `shopee_category` VALUES ('1239', 'Privacy', '1236', '3', '6838');
INSERT INTO `shopee_category` VALUES ('1240', 'Android Tempered Glass', '1236', '3', '6839');
INSERT INTO `shopee_category` VALUES ('1241', 'Clear', '1236', '3', '6836');
INSERT INTO `shopee_category` VALUES ('1242', 'iPhone Tempered Glass', '1236', '3', '9596');
INSERT INTO `shopee_category` VALUES ('1243', 'Camera & Accessories', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1244', 'Action & Sport Camera', '1243', '3', '9620');
INSERT INTO `shopee_category` VALUES ('1245', 'Camera Accessories', '1243', '3', '9622');
INSERT INTO `shopee_category` VALUES ('1246', 'Polaroid & Digital', '1243', '3', '9621');
INSERT INTO `shopee_category` VALUES ('1247', 'Others', '1243', '3', '9619');
INSERT INTO `shopee_category` VALUES ('1248', 'Selfie Accessories', '1180', '2', null);
INSERT INTO `shopee_category` VALUES ('1249', 'Others', '1248', '3', '9629');
INSERT INTO `shopee_category` VALUES ('1250', 'Design & Crafts', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1251', 'Fabric & Materials', '1250', '2', null);
INSERT INTO `shopee_category` VALUES ('1252', 'Others', '1251', '3', '4847');
INSERT INTO `shopee_category` VALUES ('1253', 'Fabrics', '1251', '3', '7162');
INSERT INTO `shopee_category` VALUES ('1254', 'Materials', '1251', '3', '7163');
INSERT INTO `shopee_category` VALUES ('1255', 'Stationery', '1250', '2', null);
INSERT INTO `shopee_category` VALUES ('1256', 'Others', '1255', '3', '4846');
INSERT INTO `shopee_category` VALUES ('1257', 'Arts & Graphics', '1255', '3', '7154');
INSERT INTO `shopee_category` VALUES ('1258', 'Writing Utensils', '1255', '3', '7153');
INSERT INTO `shopee_category` VALUES ('1259', 'Stickers & Tapes', '1255', '3', '7157');
INSERT INTO `shopee_category` VALUES ('1260', 'School & Office', '1255', '3', '7155');
INSERT INTO `shopee_category` VALUES ('1261', 'Diaries & Notebooks', '1255', '3', '7156');
INSERT INTO `shopee_category` VALUES ('1262', 'Others', '1250', '2', null);
INSERT INTO `shopee_category` VALUES ('1263', 'Others', '1262', '3', '4845');
INSERT INTO `shopee_category` VALUES ('1264', 'Handmade', '1250', '2', null);
INSERT INTO `shopee_category` VALUES ('1265', 'DIY', '1264', '3', '7160');
INSERT INTO `shopee_category` VALUES ('1266', 'Gifts', '1264', '3', '7159');
INSERT INTO `shopee_category` VALUES ('1267', 'Others', '1264', '3', '4849');
INSERT INTO `shopee_category` VALUES ('1268', 'Dolls', '1264', '3', '7161');
INSERT INTO `shopee_category` VALUES ('1269', 'Watches', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1270', 'Sports', '1269', '2', null);
INSERT INTO `shopee_category` VALUES ('1271', 'Sport Bands', '1270', '3', '6895');
INSERT INTO `shopee_category` VALUES ('1272', 'Sport Watches', '1270', '3', '6894');
INSERT INTO `shopee_category` VALUES ('1273', 'Others', '1270', '3', '4912');
INSERT INTO `shopee_category` VALUES ('1274', 'Men\'s Watches', '1269', '2', null);
INSERT INTO `shopee_category` VALUES ('1275', 'Men\'s Business', '1274', '3', '6863');
INSERT INTO `shopee_category` VALUES ('1276', 'Men\'s Analogue', '1274', '3', '6864');
INSERT INTO `shopee_category` VALUES ('1277', 'Others', '1274', '3', '4918');
INSERT INTO `shopee_category` VALUES ('1278', 'Men\'s Digital', '1274', '3', '6865');
INSERT INTO `shopee_category` VALUES ('1279', 'Men\'s Chronograph', '1274', '3', '6867');
INSERT INTO `shopee_category` VALUES ('1280', 'Others', '1269', '2', null);
INSERT INTO `shopee_category` VALUES ('1281', 'Others', '1280', '3', '4910');
INSERT INTO `shopee_category` VALUES ('1282', 'Women\'s Watches', '1269', '2', null);
INSERT INTO `shopee_category` VALUES ('1283', 'Others', '1282', '3', '4915');
INSERT INTO `shopee_category` VALUES ('1284', 'Women\'s Casual', '1282', '3', '6884');
INSERT INTO `shopee_category` VALUES ('1285', 'Women\'s Business', '1282', '3', '6882');
INSERT INTO `shopee_category` VALUES ('1286', 'Luxury', '1269', '2', null);
INSERT INTO `shopee_category` VALUES ('1287', 'Others', '1286', '3', '4911');
INSERT INTO `shopee_category` VALUES ('1288', 'Couple & Set Watches', '1269', '2', null);
INSERT INTO `shopee_category` VALUES ('1289', 'Others', '1288', '3', '4913');
INSERT INTO `shopee_category` VALUES ('1290', 'Watch Accessories', '1269', '2', null);
INSERT INTO `shopee_category` VALUES ('1291', 'Others', '1290', '3', '6899');
INSERT INTO `shopee_category` VALUES ('1292', 'Tickets & Vouchers', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1293', 'Restaurant & Spa Vouchers', '1292', '2', null);
INSERT INTO `shopee_category` VALUES ('1294', 'Spa Vouchers', '1293', '3', '7212');
INSERT INTO `shopee_category` VALUES ('1295', 'Others', '1293', '3', '4815');
INSERT INTO `shopee_category` VALUES ('1296', 'Restaurant Vouchers', '1293', '3', '7211');
INSERT INTO `shopee_category` VALUES ('1297', 'Events & Travel Vouchers', '1292', '2', null);
INSERT INTO `shopee_category` VALUES ('1298', 'Others', '1297', '3', '4813');
INSERT INTO `shopee_category` VALUES ('1299', 'Others', '1292', '2', null);
INSERT INTO `shopee_category` VALUES ('1300', 'Others', '1299', '3', '4811');
INSERT INTO `shopee_category` VALUES ('1301', 'Mobile Reloads & Sim Cards', '1292', '2', null);
INSERT INTO `shopee_category` VALUES ('1302', 'Others', '1301', '3', '4816');
INSERT INTO `shopee_category` VALUES ('1303', 'Mobile Reloads', '1301', '3', '7209');
INSERT INTO `shopee_category` VALUES ('1304', 'Sim Cards', '1301', '3', '7210');
INSERT INTO `shopee_category` VALUES ('1305', 'Bill Payments', '1292', '2', null);
INSERT INTO `shopee_category` VALUES ('1306', 'Home Bills', '1305', '3', '7214');
INSERT INTO `shopee_category` VALUES ('1307', 'Others', '1305', '3', '4814');
INSERT INTO `shopee_category` VALUES ('1308', 'Mobiles', '1305', '3', '7213');
INSERT INTO `shopee_category` VALUES ('1309', 'Shopee & Retail Vouchers', '1292', '2', null);
INSERT INTO `shopee_category` VALUES ('1310', 'Others', '1309', '3', '4812');
INSERT INTO `shopee_category` VALUES ('1311', 'Shopee Vouchers', '1309', '3', '7217');
INSERT INTO `shopee_category` VALUES ('1312', 'Retail Vouchers', '1309', '3', '7218');
INSERT INTO `shopee_category` VALUES ('1313', 'Services', '1292', '2', null);
INSERT INTO `shopee_category` VALUES ('1314', 'Others', '1313', '3', '7216');
INSERT INTO `shopee_category` VALUES ('1315', 'Postage', '1313', '3', '7219');
INSERT INTO `shopee_category` VALUES ('1316', 'Computers & Laptops', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1317', 'Components', '1316', '2', null);
INSERT INTO `shopee_category` VALUES ('1318', 'Fans & Heatsinks', '1317', '3', '7199');
INSERT INTO `shopee_category` VALUES ('1319', 'Others', '1317', '3', '4821');
INSERT INTO `shopee_category` VALUES ('1320', 'Graphic Cards', '1317', '3', '7200');
INSERT INTO `shopee_category` VALUES ('1321', 'Chargers & Power Supply', '1317', '3', '7201');
INSERT INTO `shopee_category` VALUES ('1322', 'RAM', '1317', '3', '7198');
INSERT INTO `shopee_category` VALUES ('1323', 'Laptops', '1316', '2', null);
INSERT INTO `shopee_category` VALUES ('1324', 'Macbooks', '1323', '3', '7202');
INSERT INTO `shopee_category` VALUES ('1325', 'Notebooks', '1323', '3', '7203');
INSERT INTO `shopee_category` VALUES ('1326', 'Others', '1323', '3', '4820');
INSERT INTO `shopee_category` VALUES ('1327', 'Computer Accessories', '1316', '2', null);
INSERT INTO `shopee_category` VALUES ('1328', 'Mouse', '1327', '3', '7196');
INSERT INTO `shopee_category` VALUES ('1329', 'Keyboard', '1327', '3', '7197');
INSERT INTO `shopee_category` VALUES ('1330', 'Others', '1327', '3', '4823');
INSERT INTO `shopee_category` VALUES ('1331', 'Monitors', '1327', '3', '7195');
INSERT INTO `shopee_category` VALUES ('1332', 'Others', '1316', '2', null);
INSERT INTO `shopee_category` VALUES ('1333', 'Others', '1332', '3', '4817');
INSERT INTO `shopee_category` VALUES ('1334', 'Hard Drives & SSDs', '1316', '2', null);
INSERT INTO `shopee_category` VALUES ('1335', 'Solid State Drives', '1334', '3', '7193');
INSERT INTO `shopee_category` VALUES ('1336', 'External Hard Drives', '1334', '3', '7194');
INSERT INTO `shopee_category` VALUES ('1337', 'Others', '1334', '3', '4824');
INSERT INTO `shopee_category` VALUES ('1338', 'Printers & Projectors', '1316', '2', null);
INSERT INTO `shopee_category` VALUES ('1339', 'Others', '1338', '3', '4819');
INSERT INTO `shopee_category` VALUES ('1340', 'Printers', '1338', '3', '7204');
INSERT INTO `shopee_category` VALUES ('1341', 'Ink', '1338', '3', '7206');
INSERT INTO `shopee_category` VALUES ('1342', 'Projectors', '1338', '3', '7205');
INSERT INTO `shopee_category` VALUES ('1343', 'Network Components', '1316', '2', null);
INSERT INTO `shopee_category` VALUES ('1344', 'Others', '1343', '3', '4818');
INSERT INTO `shopee_category` VALUES ('1345', 'Modems & Routers', '1343', '3', '7208');
INSERT INTO `shopee_category` VALUES ('1346', 'Cables & Adapters', '1343', '3', '7207');
INSERT INTO `shopee_category` VALUES ('1347', 'Men\'s Shoes', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1348', 'Others', '1347', '2', null);
INSERT INTO `shopee_category` VALUES ('1349', 'Others', '1348', '3', '4856');
INSERT INTO `shopee_category` VALUES ('1350', 'Sneakers', '1347', '2', null);
INSERT INTO `shopee_category` VALUES ('1351', 'Lace-Up', '1350', '3', '7136');
INSERT INTO `shopee_category` VALUES ('1352', 'Others', '1350', '3', '4857');
INSERT INTO `shopee_category` VALUES ('1353', 'Slip-On', '1350', '3', '7135');
INSERT INTO `shopee_category` VALUES ('1354', 'Sandals & Flip Flops', '1347', '2', null);
INSERT INTO `shopee_category` VALUES ('1355', 'Others', '1354', '3', '4861');
INSERT INTO `shopee_category` VALUES ('1356', 'Loafers & Boat Shoes', '1347', '2', null);
INSERT INTO `shopee_category` VALUES ('1357', 'Others', '1356', '3', '4860');
INSERT INTO `shopee_category` VALUES ('1358', 'Men\'s Leather Wear', '1347', '2', null);
INSERT INTO `shopee_category` VALUES ('1359', 'Others', '1358', '3', '4858');
INSERT INTO `shopee_category` VALUES ('1360', 'Sports Shoes', '1347', '2', null);
INSERT INTO `shopee_category` VALUES ('1361', 'Others', '1360', '3', '4859');
INSERT INTO `shopee_category` VALUES ('1362', 'Shoes Accessories', '1347', '2', null);
INSERT INTO `shopee_category` VALUES ('1363', 'Others', '1362', '3', '7138');
INSERT INTO `shopee_category` VALUES ('1364', 'Food', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1365', 'Others', '1364', '2', null);
INSERT INTO `shopee_category` VALUES ('1366', 'Others', '1365', '3', '4881');
INSERT INTO `shopee_category` VALUES ('1367', 'Instant & Packaged Food', '1364', '2', null);
INSERT INTO `shopee_category` VALUES ('1368', 'Others', '1367', '3', '4884');
INSERT INTO `shopee_category` VALUES ('1369', 'Instant Food', '1367', '3', '7080');
INSERT INTO `shopee_category` VALUES ('1370', 'Canned Food', '1367', '3', '7081');
INSERT INTO `shopee_category` VALUES ('1371', 'Spice & Sauce', '1367', '3', '9354');
INSERT INTO `shopee_category` VALUES ('1372', 'Candy & Chocolate', '1364', '2', null);
INSERT INTO `shopee_category` VALUES ('1373', 'Candy', '1372', '3', '7082');
INSERT INTO `shopee_category` VALUES ('1374', 'Chocolate', '1372', '3', '7083');
INSERT INTO `shopee_category` VALUES ('1375', 'Others', '1372', '3', '4883');
INSERT INTO `shopee_category` VALUES ('1376', 'Snacks & Desserts', '1364', '2', null);
INSERT INTO `shopee_category` VALUES ('1377', 'Nuts & Dried Snacks', '1376', '3', '7075');
INSERT INTO `shopee_category` VALUES ('1378', 'Others', '1376', '3', '4886');
INSERT INTO `shopee_category` VALUES ('1379', 'Desserts', '1376', '3', '7077');
INSERT INTO `shopee_category` VALUES ('1380', 'Crackers & Cookies', '1376', '3', '7076');
INSERT INTO `shopee_category` VALUES ('1381', 'Beverages', '1364', '2', null);
INSERT INTO `shopee_category` VALUES ('1382', 'Coffee & Tea', '1381', '3', '7072');
INSERT INTO `shopee_category` VALUES ('1383', 'Others', '1381', '3', '4885');
INSERT INTO `shopee_category` VALUES ('1384', 'Sport & Soft Drinks', '1381', '3', '7074');
INSERT INTO `shopee_category` VALUES ('1385', 'Instant Drinks', '1381', '3', '7073');
INSERT INTO `shopee_category` VALUES ('1386', 'Home Appliances', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1387', 'Others', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1388', 'Others', '1387', '3', '10042');
INSERT INTO `shopee_category` VALUES ('1389', 'Small Kitchen Appliances', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1390', 'Food Preparation', '1389', '3', '10056');
INSERT INTO `shopee_category` VALUES ('1391', 'Others', '1389', '3', '10044');
INSERT INTO `shopee_category` VALUES ('1392', 'Water Boilers', '1389', '3', '10059');
INSERT INTO `shopee_category` VALUES ('1393', 'Rice Steamers', '1389', '3', '10058');
INSERT INTO `shopee_category` VALUES ('1394', 'Fruit Juicers', '1389', '3', '10057');
INSERT INTO `shopee_category` VALUES ('1395', 'Garment Care', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1396', 'Irons', '1395', '3', '10060');
INSERT INTO `shopee_category` VALUES ('1397', 'Sewing Machines', '1395', '3', '10062');
INSERT INTO `shopee_category` VALUES ('1398', 'Others', '1395', '3', '10046');
INSERT INTO `shopee_category` VALUES ('1399', 'Garment Steamers', '1395', '3', '10061');
INSERT INTO `shopee_category` VALUES ('1400', 'Cooling & Heating', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1401', 'Others', '1400', '3', '10049');
INSERT INTO `shopee_category` VALUES ('1402', 'Air Purifiers, Dehumidifiers & Humidifiers', '1400', '3', '10067');
INSERT INTO `shopee_category` VALUES ('1403', 'Air Conditioners & Air Coolers', '1400', '3', '10063');
INSERT INTO `shopee_category` VALUES ('1404', 'Fans', '1400', '3', '10068');
INSERT INTO `shopee_category` VALUES ('1405', 'Security & Surveillance', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1406', 'CCTV & IP Cameras', '1405', '3', '10074');
INSERT INTO `shopee_category` VALUES ('1407', 'Home Sensors & Alarms', '1405', '3', '10075');
INSERT INTO `shopee_category` VALUES ('1408', 'Others', '1405', '3', '10051');
INSERT INTO `shopee_category` VALUES ('1409', 'Home Entertainment', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1410', 'Others', '1409', '3', '10053');
INSERT INTO `shopee_category` VALUES ('1411', 'Large Appliances', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1412', 'Others', '1411', '3', '10055');
INSERT INTO `shopee_category` VALUES ('1413', 'Housekeeping & Improvement', '1386', '2', null);
INSERT INTO `shopee_category` VALUES ('1414', 'Vacuum Cleaner', '1413', '3', '10071');
INSERT INTO `shopee_category` VALUES ('1415', 'Robot Vacuums', '1413', '3', '10072');
INSERT INTO `shopee_category` VALUES ('1416', 'Power Tools & Accessories', '1413', '3', '10073');
INSERT INTO `shopee_category` VALUES ('1417', 'Others', '1413', '3', '10070');

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
