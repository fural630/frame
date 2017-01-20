/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : producterp

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-01-20 18:37:22
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigator_user
-- ----------------------------
INSERT INTO `navigator_user` VALUES ('1', '3', '48');
INSERT INTO `navigator_user` VALUES ('2', '3', '49');
INSERT INTO `navigator_user` VALUES ('3', '4', '48');
INSERT INTO `navigator_user` VALUES ('4', '4', '49');

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
INSERT INTO `product` VALUES ('17', 'DV3', 'Y2639', '照片', 'photo', null, null, null, null, null, '电子相册', 'e-photo', 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '15.3', null, null, '2', '3', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'http://www.guphotos.com/images/D/D1816W-EU/D1816W-EU-4-375a.jpg', '1: 【于 2016-12-28 23:18:37 由 王单爆 操作, 创建了商品信息】<br/>2: 【于 2017-01-05 10:02:06 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-05 15:16:28 由 玄奘-员工 操作, 修改了商品信息】<br/>4: 【于 2017-01-05 16:08:45 由 王单爆 操作, 修改了商品信息】<br/>5: 【于 2017-01-18 17:49:32 由 王单爆 操作, 修改了商品信息】<br/>6: 【于 2017-01-20 18:21:30 由 玄奘-员工 操作, 修改了商品信息】<br/>7: 【于 2017-01-20 18:22:14 由 玄奘-员工 操作, 修改了商品信息】', '2', '4', null, '10', '2016-12-28 23:18:37', '2017-01-20 18:22:14', 'XMt', '红色');
INSERT INTO `product` VALUES ('18', 'Y2639BL', 'Y2639', 'CAMP607移动式侧板滑轮', 'Lixada 20KN Small Mobile Single Pulley Swing Side Climbing Rigging Rescue', '', 'Lixada 20KN kleine mobile Einzel Pulley Schaukel Side Kletter Rigging-Rettung', 'リギングレスキュークライミングLixada 20KN小型モバイルシングルプーリースイングサイド', 'Lixada 20KN Piccolo mobile singolo puleggia oscillazione laterale arrampicata Rigging Rescue', 'Lixada 20KN Pequeño móvil polea simple swing Escalada Aparejo Rescate Side', '移动式侧板滑轮', 'Mobile Single Pulley', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-oYyw.jpg', '12.99', '', '', '1', '3', '4', '7', '', 'Hot up your summer collection with this alluring bikini set. It has vintage floral print, off the shoulder top and flattering low-rise bottom. A definite lust worthy piece that will turn heads like no other on beach.<br />\n<br />\n&nbsp;', 'Hot votre collection d&amp;#39;&eacute;t&eacute; avec cet ensemble de bikini s&eacute;duisant. Il a imprim&eacute; floral vintage, du haut de l&amp;#39;&eacute;paule et en bas de faible hauteur flatteur. Une convoitise pi&egrave;ce digne d&eacute;finitive qui fera tourner les t&ecirc;tes comme aucun autre sur la plage.<br />\n&nbsp;', 'Hot up Ihre Sommer-Kollektion mit diesem verf&uuml;hrerischen Bikini-Set. Es hat Jahrgang Blumendruck, weg von der Schulter oben und schmeichelnd Flachbau unten. Eine definitive Lust w&uuml;rdig St&uuml;ck, die K&ouml;pfe wie kein anderer am Strand verwandeln wird.<br />\n&nbsp;', 'ホットアップこの魅力的なビキニセットであなたの夏のコレクション。これは、肩の上部と世辞低層の底から、ヴィンテージの花柄を持っています。ビーチで他に類をみない頭を向けるだろう明確な欲望に値する作品。<br />\n&nbsp;', 'Hot la vostra collezione estiva con questo set bikini seducente. Ha stampa floreale d&amp;#39;epoca, fuori dalla parte superiore della spalla e lusinghiero in basso a vita bassa. Decisamente un desiderio degno pezzo che non passa inosservato come nessun altro sulla spiaggia.<br />\n&nbsp;', 'Caliente hasta su colecci&oacute;n de verano con este conjunto de bikini atractivo. Tiene la impresi&oacute;n floral de la vendimia, de la parte superior del hombro y favorecedor parte inferior de poca altura. Un deseo definitivo pieza digna que har&aacute; girar las cabezas como ning&uacute;n otro en la playa.<br />\n&nbsp;', '', '', '', '', '', '', '', 'http://www.guphotos.com/images/Y/L/Y2639BL/Y2639BL-1-d704-KP3L.jpg', '1: 【于 2017-01-06 09:45:22 由 李四-主管 操作, 创建了商品信息】<br/>2: 【于 2017-01-10 14:11:26 由 王单爆 操作, 修改了商品信息】<br/>3: 【于 2017-01-10 14:12:25 由 王单爆 操作, 修改了商品信息】<br/>4: 【于 2017-01-10 18:33:49 由 王单爆 操作, 修改了商品信息】<br/>5: 【于 2017-01-11 12:29:15 由 王单爆 操作, 修改了商品信息】<br/>6: 【于 2017-01-20 17:12:28 由 玄奘-员工 操作, 修改了商品信息】<br/>7: 【于 2017-01-20 18:11:05 由 玄奘-员工 操作, 修改了商品信息】<br/>8: 【于 2017-01-20 18:12:52 由 玄奘-员工 操作, 修改了商品信息】<br/>9: 【于 2017-01-20 18:15:33 由 玄奘-员工 操作, 修改了商品信息】<br/>10: 【于 2017-01-20 18:16:00 由 王单爆 操作, 修改了商品信息】<br/>11: 【于 2017-01-20 18:20:31 由 玄奘-员工 操作, 修改了商品信息】<br/>12: 【于 2017-01-20 18:20:44 由 玄奘-员工 操作, 修改了商品信息】', '3', '4', null, '20', '2017-01-06 09:45:22', '2017-01-20 18:20:44', 'XL12', '蓝色');
INSERT INTO `product` VALUES ('19', 'Y2639BL', 'Y2639', '32', '23', '', '', '', '', '', '231', '23', '', null, '', '', null, null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1: 【于 2017-01-18 18:13:02 由 王单爆 操作, 创建了商品信息】', '2', null, null, '10', '2017-01-18 18:13:02', '2017-01-18 18:13:02', '', '');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2184 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopee_category
-- ----------------------------
INSERT INTO `shopee_category` VALUES ('1418', 'Women\'s Clothing', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1419', 'Dresses', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1420', 'Others', '1419', '3', '4976');
INSERT INTO `shopee_category` VALUES ('1421', 'Maxi Dresses', '1419', '3', '6590');
INSERT INTO `shopee_category` VALUES ('1422', 'Midi Dresses', '1419', '3', '6589');
INSERT INTO `shopee_category` VALUES ('1423', 'Mini Dresses', '1419', '3', '6588');
INSERT INTO `shopee_category` VALUES ('1424', 'Tops', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1425', 'Others', '1424', '3', '4981');
INSERT INTO `shopee_category` VALUES ('1426', 'Couple Wear', '1424', '3', '6564');
INSERT INTO `shopee_category` VALUES ('1427', 'Blouse', '1424', '3', '6556');
INSERT INTO `shopee_category` VALUES ('1428', 'Shirts', '1424', '3', '6562');
INSERT INTO `shopee_category` VALUES ('1429', 'Tanks & Camisoles', '1424', '3', '6563');
INSERT INTO `shopee_category` VALUES ('1430', 'Crop Tops', '1424', '3', '6557');
INSERT INTO `shopee_category` VALUES ('1431', 'T-Shirts', '1424', '3', '6561');
INSERT INTO `shopee_category` VALUES ('1432', 'Off Shoulder Tops', '1424', '3', '9564');
INSERT INTO `shopee_category` VALUES ('1433', 'Pants & Shorts', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1434', 'Jeans', '1433', '3', '6597');
INSERT INTO `shopee_category` VALUES ('1435', 'Long Pants', '1433', '3', '6598');
INSERT INTO `shopee_category` VALUES ('1436', 'Others', '1433', '3', '4971');
INSERT INTO `shopee_category` VALUES ('1437', 'Leggings', '1433', '3', '6601');
INSERT INTO `shopee_category` VALUES ('1438', 'Shorts', '1433', '3', '6599');
INSERT INTO `shopee_category` VALUES ('1439', 'Skorts & Culottes', '1433', '3', '6600');
INSERT INTO `shopee_category` VALUES ('1440', 'Skirts', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1441', 'Others', '1440', '3', '4973');
INSERT INTO `shopee_category` VALUES ('1442', 'Mini Skirts', '1440', '3', '6592');
INSERT INTO `shopee_category` VALUES ('1443', 'Maxi Skirts', '1440', '3', '6595');
INSERT INTO `shopee_category` VALUES ('1444', 'Midi Skirts', '1440', '3', '6593');
INSERT INTO `shopee_category` VALUES ('1445', 'Lingerie & Nightwear', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1446', 'Nightwear', '1445', '3', '6610');
INSERT INTO `shopee_category` VALUES ('1447', 'Others', '1445', '3', '4969');
INSERT INTO `shopee_category` VALUES ('1448', 'Lingerie', '1445', '3', '6609');
INSERT INTO `shopee_category` VALUES ('1449', 'Others', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1450', 'Others', '1449', '3', '4967');
INSERT INTO `shopee_category` VALUES ('1451', 'Playsuits & Jumpsuits', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1452', 'Others', '1451', '3', '4977');
INSERT INTO `shopee_category` VALUES ('1453', 'Women\'s Outerwear', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1454', 'Hoodies', '1453', '3', '6572');
INSERT INTO `shopee_category` VALUES ('1455', 'Others', '1453', '3', '4978');
INSERT INTO `shopee_category` VALUES ('1456', 'Sweaters', '1453', '3', '6570');
INSERT INTO `shopee_category` VALUES ('1457', 'Jackets & Blazers', '1453', '3', '6574');
INSERT INTO `shopee_category` VALUES ('1458', 'Cardigans', '1453', '3', '6571');
INSERT INTO `shopee_category` VALUES ('1459', 'Sports & Beachwear', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1460', 'Swimsuits', '1459', '3', '6603');
INSERT INTO `shopee_category` VALUES ('1461', 'Sportswear', '1459', '3', '6604');
INSERT INTO `shopee_category` VALUES ('1462', 'Others', '1459', '3', '4968');
INSERT INTO `shopee_category` VALUES ('1463', 'Bikini', '1459', '3', '6602');
INSERT INTO `shopee_category` VALUES ('1464', 'Traditional Wear', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1465', 'Cheongsams', '1464', '3', '6612');
INSERT INTO `shopee_category` VALUES ('1466', 'Saree & Anarkali', '1464', '3', '6613');
INSERT INTO `shopee_category` VALUES ('1467', 'Others', '1464', '3', '4972');
INSERT INTO `shopee_category` VALUES ('1468', 'Socks & Tights', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1469', 'Others', '1468', '3', '9527');
INSERT INTO `shopee_category` VALUES ('1470', 'Set Wear', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1471', 'Others', '1470', '3', '9556');
INSERT INTO `shopee_category` VALUES ('1472', 'Maternity Wear', '1418', '2', null);
INSERT INTO `shopee_category` VALUES ('1473', 'Others', '1472', '3', '9808');
INSERT INTO `shopee_category` VALUES ('1474', 'Men\'s Clothing', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1475', 'T-shirts & Singlets', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1476', 'Solid Tees', '1475', '3', '6775');
INSERT INTO `shopee_category` VALUES ('1477', 'Graphic Tees', '1475', '3', '6774');
INSERT INTO `shopee_category` VALUES ('1478', 'Others', '1475', '3', '4939');
INSERT INTO `shopee_category` VALUES ('1479', 'Singlets', '1475', '3', '6773');
INSERT INTO `shopee_category` VALUES ('1480', 'Long Sleeve Tees', '1475', '3', '6772');
INSERT INTO `shopee_category` VALUES ('1481', 'Statement Tees', '1475', '3', '9617');
INSERT INTO `shopee_category` VALUES ('1482', 'Pants', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1483', 'Others', '1482', '3', '4937');
INSERT INTO `shopee_category` VALUES ('1484', 'Shorts', '1482', '3', '6784');
INSERT INTO `shopee_category` VALUES ('1485', 'Joggers & Sweatpants', '1482', '3', '6783');
INSERT INTO `shopee_category` VALUES ('1486', 'Jeans', '1482', '3', '6785');
INSERT INTO `shopee_category` VALUES ('1487', 'Chinos', '1482', '3', '6781');
INSERT INTO `shopee_category` VALUES ('1488', 'Innerwear', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1489', 'Others', '1488', '3', '4932');
INSERT INTO `shopee_category` VALUES ('1490', 'Boxers & Trunks', '1488', '3', '6805');
INSERT INTO `shopee_category` VALUES ('1491', 'Briefs', '1488', '3', '6804');
INSERT INTO `shopee_category` VALUES ('1492', 'Shirts', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1493', 'Short-sleeved Shirts', '1492', '3', '6778');
INSERT INTO `shopee_category` VALUES ('1494', 'Others', '1492', '3', '4936');
INSERT INTO `shopee_category` VALUES ('1495', 'Long-sleeved Shirts', '1492', '3', '6777');
INSERT INTO `shopee_category` VALUES ('1496', 'Men\'s Outerwear', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1497', 'Suits', '1496', '3', '6790');
INSERT INTO `shopee_category` VALUES ('1498', 'Hoodies', '1496', '3', '6789');
INSERT INTO `shopee_category` VALUES ('1499', 'Sweater', '1496', '3', '6791');
INSERT INTO `shopee_category` VALUES ('1500', 'Jackets', '1496', '3', '6788');
INSERT INTO `shopee_category` VALUES ('1501', 'Others', '1496', '3', '4935');
INSERT INTO `shopee_category` VALUES ('1502', 'Others', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1503', 'Others', '1502', '3', '4931');
INSERT INTO `shopee_category` VALUES ('1504', 'Polo Shirts', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1505', 'Others', '1504', '3', '4934');
INSERT INTO `shopee_category` VALUES ('1506', 'Sports Wear', '1474', '2', null);
INSERT INTO `shopee_category` VALUES ('1507', 'Training Wear', '1506', '3', '6797');
INSERT INTO `shopee_category` VALUES ('1508', 'Others', '1506', '3', '4933');
INSERT INTO `shopee_category` VALUES ('1509', 'Jerseys', '1506', '3', '6795');
INSERT INTO `shopee_category` VALUES ('1510', 'Bags & Wallets', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1511', 'Women\'s Backpacks', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1512', 'Others', '1511', '3', '4946');
INSERT INTO `shopee_category` VALUES ('1513', 'Casual Backpacks', '1511', '3', '6743');
INSERT INTO `shopee_category` VALUES ('1514', 'Drawstrings', '1511', '3', '6744');
INSERT INTO `shopee_category` VALUES ('1515', 'Rucksacks', '1511', '3', '6745');
INSERT INTO `shopee_category` VALUES ('1516', 'Laptop Bags', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1517', 'Sleeves', '1516', '3', '6752');
INSERT INTO `shopee_category` VALUES ('1518', 'Backpacks', '1516', '3', '6750');
INSERT INTO `shopee_category` VALUES ('1519', 'Briefcases', '1516', '3', '6751');
INSERT INTO `shopee_category` VALUES ('1520', 'Others', '1516', '3', '4942');
INSERT INTO `shopee_category` VALUES ('1521', 'Luggage & Travel', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1522', 'Tags & Covers', '1521', '3', '6759');
INSERT INTO `shopee_category` VALUES ('1523', 'Travel Totes & Duffels', '1521', '3', '6757');
INSERT INTO `shopee_category` VALUES ('1524', 'Packing Organizers', '1521', '3', '6758');
INSERT INTO `shopee_category` VALUES ('1525', 'Suitcases', '1521', '3', '6756');
INSERT INTO `shopee_category` VALUES ('1526', 'Others', '1521', '3', '4943');
INSERT INTO `shopee_category` VALUES ('1527', 'Others', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1528', 'Others', '1527', '3', '4940');
INSERT INTO `shopee_category` VALUES ('1529', 'Tote Bags', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1530', 'Others', '1529', '3', '4948');
INSERT INTO `shopee_category` VALUES ('1531', 'Shoulder Bags', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1532', 'Others', '1531', '3', '4947');
INSERT INTO `shopee_category` VALUES ('1533', 'Clutches & Wristlets', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1534', 'Wristlets', '1533', '3', '6749');
INSERT INTO `shopee_category` VALUES ('1535', 'Clutches', '1533', '3', '6748');
INSERT INTO `shopee_category` VALUES ('1536', 'Others', '1533', '3', '4945');
INSERT INTO `shopee_category` VALUES ('1537', 'Sling Bags', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1538', 'Others', '1537', '3', '4944');
INSERT INTO `shopee_category` VALUES ('1539', 'Luxury Bags', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1540', 'Others', '1539', '3', '4941');
INSERT INTO `shopee_category` VALUES ('1541', 'Handbags', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1542', 'Business Handbags', '1541', '3', '6739');
INSERT INTO `shopee_category` VALUES ('1543', 'Set Handbags', '1541', '3', '6741');
INSERT INTO `shopee_category` VALUES ('1544', 'Casual Handbags', '1541', '3', '6740');
INSERT INTO `shopee_category` VALUES ('1545', 'Others', '1541', '3', '4951');
INSERT INTO `shopee_category` VALUES ('1546', 'Purses & Pouches', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1547', 'Coin Pouches', '1546', '3', '9550');
INSERT INTO `shopee_category` VALUES ('1548', 'Fold Over Purses', '1546', '3', '6769');
INSERT INTO `shopee_category` VALUES ('1549', 'Zip Purses', '1546', '3', '6770');
INSERT INTO `shopee_category` VALUES ('1550', 'Make Up Bags', '1546', '3', '9548');
INSERT INTO `shopee_category` VALUES ('1551', 'Multi Purpose Pouches', '1546', '3', '9549');
INSERT INTO `shopee_category` VALUES ('1552', 'Others', '1546', '3', '6763');
INSERT INTO `shopee_category` VALUES ('1553', 'Men\'s Bags & Wallets', '1510', '2', null);
INSERT INTO `shopee_category` VALUES ('1554', 'Men\'s Wallets', '1553', '3', '9547');
INSERT INTO `shopee_category` VALUES ('1555', 'Messenger Bags', '1553', '3', '6766');
INSERT INTO `shopee_category` VALUES ('1556', 'Others', '1553', '3', '6765');
INSERT INTO `shopee_category` VALUES ('1557', 'Waist & Cross Body Bags', '1553', '3', '6767');
INSERT INTO `shopee_category` VALUES ('1558', 'Men\'s Backpacks', '1553', '3', '9546');
INSERT INTO `shopee_category` VALUES ('1559', 'Accessories', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1560', 'Belts', '1559', '2', null);
INSERT INTO `shopee_category` VALUES ('1561', 'Men\'s Belt', '1560', '3', '7122');
INSERT INTO `shopee_category` VALUES ('1562', 'Others', '1560', '3', '4863');
INSERT INTO `shopee_category` VALUES ('1563', 'Women\'s Belt', '1560', '3', '7123');
INSERT INTO `shopee_category` VALUES ('1564', 'Eyewear', '1559', '2', null);
INSERT INTO `shopee_category` VALUES ('1565', 'Others', '1564', '3', '4866');
INSERT INTO `shopee_category` VALUES ('1566', 'Sunglasses', '1564', '3', '7116');
INSERT INTO `shopee_category` VALUES ('1567', 'Eyeglasses', '1564', '3', '7117');
INSERT INTO `shopee_category` VALUES ('1568', 'Others', '1559', '2', null);
INSERT INTO `shopee_category` VALUES ('1569', 'Others', '1568', '3', '4862');
INSERT INTO `shopee_category` VALUES ('1570', 'Jewellery', '1559', '2', null);
INSERT INTO `shopee_category` VALUES ('1571', 'Pendants & Necklaces', '1570', '3', '7125');
INSERT INTO `shopee_category` VALUES ('1572', 'Others', '1570', '3', '4872');
INSERT INTO `shopee_category` VALUES ('1573', 'Rings', '1570', '3', '7126');
INSERT INTO `shopee_category` VALUES ('1574', 'Bracelets & Charms', '1570', '3', '7124');
INSERT INTO `shopee_category` VALUES ('1575', 'Anklets', '1570', '3', '7129');
INSERT INTO `shopee_category` VALUES ('1576', 'Pin & Brooches', '1570', '3', '7128');
INSERT INTO `shopee_category` VALUES ('1577', 'Earrings', '1570', '3', '7127');
INSERT INTO `shopee_category` VALUES ('1578', 'More Accessories', '1559', '2', null);
INSERT INTO `shopee_category` VALUES ('1579', 'Scarves', '1578', '3', '7131');
INSERT INTO `shopee_category` VALUES ('1580', 'Temporary Tattoos', '1578', '3', '7132');
INSERT INTO `shopee_category` VALUES ('1581', 'Key Chains', '1578', '3', '7134');
INSERT INTO `shopee_category` VALUES ('1582', 'Others', '1578', '3', '4871');
INSERT INTO `shopee_category` VALUES ('1583', 'Bows & Ties', '1578', '3', '7133');
INSERT INTO `shopee_category` VALUES ('1584', 'Hats & Caps', '1559', '2', null);
INSERT INTO `shopee_category` VALUES ('1585', 'Beanies', '1584', '3', '7120');
INSERT INTO `shopee_category` VALUES ('1586', 'Others', '1584', '3', '4864');
INSERT INTO `shopee_category` VALUES ('1587', 'Caps', '1584', '3', '7119');
INSERT INTO `shopee_category` VALUES ('1588', 'Hats', '1584', '3', '7121');
INSERT INTO `shopee_category` VALUES ('1589', 'Hair Accessories', '1559', '2', null);
INSERT INTO `shopee_category` VALUES ('1590', 'Wigs & Extensions', '1589', '3', '9545');
INSERT INTO `shopee_category` VALUES ('1591', 'Hairpins & Hairclips', '1589', '3', '9543');
INSERT INTO `shopee_category` VALUES ('1592', 'Hairbands & Headpieces', '1589', '3', '9542');
INSERT INTO `shopee_category` VALUES ('1593', 'Hairties', '1589', '3', '9544');
INSERT INTO `shopee_category` VALUES ('1594', 'Others', '1589', '3', '4869');
INSERT INTO `shopee_category` VALUES ('1595', 'Home & Living', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1596', 'Kitchen & Dining', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1597', 'Cookware', '1596', '3', '6908');
INSERT INTO `shopee_category` VALUES ('1598', 'Knives & Sharpeners', '1596', '3', '6904');
INSERT INTO `shopee_category` VALUES ('1599', 'Tableware', '1596', '3', '6907');
INSERT INTO `shopee_category` VALUES ('1600', 'Others', '1596', '3', '4909');
INSERT INTO `shopee_category` VALUES ('1601', 'Kitchen Tools', '1596', '3', '6909');
INSERT INTO `shopee_category` VALUES ('1602', 'Bakeware', '1596', '3', '6906');
INSERT INTO `shopee_category` VALUES ('1603', 'Home Decor', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1604', 'Mirrors & Wall Art', '1603', '3', '6925');
INSERT INTO `shopee_category` VALUES ('1605', 'Rugs & Carpets', '1603', '3', '6924');
INSERT INTO `shopee_category` VALUES ('1606', 'Fragrance & Candles', '1603', '3', '9890');
INSERT INTO `shopee_category` VALUES ('1607', 'Curtains & Blinds', '1603', '3', '9887');
INSERT INTO `shopee_category` VALUES ('1608', 'Clocks', '1603', '3', '6923');
INSERT INTO `shopee_category` VALUES ('1609', 'Lighting', '1603', '3', '6926');
INSERT INTO `shopee_category` VALUES ('1610', 'Others', '1603', '3', '4905');
INSERT INTO `shopee_category` VALUES ('1611', 'Cushions & Covers', '1603', '3', '9888');
INSERT INTO `shopee_category` VALUES ('1612', 'Festive Decor', '1603', '3', '9889');
INSERT INTO `shopee_category` VALUES ('1613', 'Home Storage & Organization', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1614', 'Clothes Organization', '1613', '3', '6911');
INSERT INTO `shopee_category` VALUES ('1615', 'Others', '1613', '3', '4907');
INSERT INTO `shopee_category` VALUES ('1616', 'Storage Cabinets', '1613', '3', '6914');
INSERT INTO `shopee_category` VALUES ('1617', 'Racks & Shelves', '1613', '3', '6912');
INSERT INTO `shopee_category` VALUES ('1618', 'Others', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1619', 'Others', '1618', '3', '4902');
INSERT INTO `shopee_category` VALUES ('1620', 'Kitchen Storage', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1621', 'Bottles', '1620', '3', '6945');
INSERT INTO `shopee_category` VALUES ('1622', 'Storage Organizers', '1620', '3', '9895');
INSERT INTO `shopee_category` VALUES ('1623', 'Dish Racks & Sink', '1620', '3', '6947');
INSERT INTO `shopee_category` VALUES ('1624', 'Others', '1620', '3', '4908');
INSERT INTO `shopee_category` VALUES ('1625', 'Food Storage', '1620', '3', '9896');
INSERT INTO `shopee_category` VALUES ('1626', 'Canisters & Jars', '1620', '3', '6946');
INSERT INTO `shopee_category` VALUES ('1627', 'Bath & Bedding', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1628', 'Bedding Accessories', '1627', '3', '6929');
INSERT INTO `shopee_category` VALUES ('1629', 'Bathroom Accessories', '1627', '3', '9884');
INSERT INTO `shopee_category` VALUES ('1630', 'Mats, Towels & Robes', '1627', '3', '9885');
INSERT INTO `shopee_category` VALUES ('1631', 'Others', '1627', '3', '4904');
INSERT INTO `shopee_category` VALUES ('1632', 'Bedding Sets & Sheets', '1627', '3', '6928');
INSERT INTO `shopee_category` VALUES ('1633', 'Pillows & Bolsters', '1627', '3', '9886');
INSERT INTO `shopee_category` VALUES ('1634', 'Mattresses & Protectors', '1627', '3', '6927');
INSERT INTO `shopee_category` VALUES ('1635', 'Furniture', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1636', 'Living & Dining', '1635', '3', '6952');
INSERT INTO `shopee_category` VALUES ('1637', 'Office', '1635', '3', '6953');
INSERT INTO `shopee_category` VALUES ('1638', 'Others', '1635', '3', '6950');
INSERT INTO `shopee_category` VALUES ('1639', 'Bedroom', '1635', '3', '6951');
INSERT INTO `shopee_category` VALUES ('1640', 'Housekeeping & Supplies', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1641', 'Cleaning Supplies', '1640', '3', '6958');
INSERT INTO `shopee_category` VALUES ('1642', 'Pest Control', '1640', '3', '9485');
INSERT INTO `shopee_category` VALUES ('1643', 'Brooms & Mops', '1640', '3', '10065');
INSERT INTO `shopee_category` VALUES ('1644', 'Paper Products', '1640', '3', '10066');
INSERT INTO `shopee_category` VALUES ('1645', 'Laundry', '1640', '3', '6960');
INSERT INTO `shopee_category` VALUES ('1646', 'Others', '1640', '3', '6957');
INSERT INTO `shopee_category` VALUES ('1647', 'Home Improvement', '1595', '2', null);
INSERT INTO `shopee_category` VALUES ('1648', 'Plugs & Adaptors', '1647', '3', '10064');
INSERT INTO `shopee_category` VALUES ('1649', 'DIY Tools', '1647', '3', '9524');
INSERT INTO `shopee_category` VALUES ('1650', 'Chains & Locks', '1647', '3', '9525');
INSERT INTO `shopee_category` VALUES ('1651', 'Others', '1647', '3', '9522');
INSERT INTO `shopee_category` VALUES ('1652', 'Outdoor & Garden', '1647', '3', '9523');
INSERT INTO `shopee_category` VALUES ('1653', 'Toys, Kids & Babies', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1654', 'Nursery', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1655', 'Others', '1654', '3', '4891');
INSERT INTO `shopee_category` VALUES ('1656', 'Blankets & Pillows', '1654', '3', '7042');
INSERT INTO `shopee_category` VALUES ('1657', 'Bedding', '1654', '3', '7041');
INSERT INTO `shopee_category` VALUES ('1658', 'Baby Safety', '1654', '3', '7040');
INSERT INTO `shopee_category` VALUES ('1659', 'Maternity Care', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1660', 'Others', '1659', '3', '4888');
INSERT INTO `shopee_category` VALUES ('1661', 'Maternity Accessories', '1659', '3', '7066');
INSERT INTO `shopee_category` VALUES ('1662', 'Pregnancy Pillows', '1659', '3', '9821');
INSERT INTO `shopee_category` VALUES ('1663', 'Moisturizers & Creams', '1659', '3', '7067');
INSERT INTO `shopee_category` VALUES ('1664', 'Others', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1665', 'Others', '1664', '3', '4887');
INSERT INTO `shopee_category` VALUES ('1666', 'Baby Clothing', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1667', 'Nightwear', '1666', '3', '9553');
INSERT INTO `shopee_category` VALUES ('1668', 'Others', '1666', '3', '4897');
INSERT INTO `shopee_category` VALUES ('1669', 'Baby Clothing', '1666', '3', '9551');
INSERT INTO `shopee_category` VALUES ('1670', 'Mittens & Footwear', '1666', '3', '9552');
INSERT INTO `shopee_category` VALUES ('1671', 'Baby Gears', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1672', 'Car Seats', '1671', '3', '6997');
INSERT INTO `shopee_category` VALUES ('1673', 'Others', '1671', '3', '4890');
INSERT INTO `shopee_category` VALUES ('1674', 'Strollers', '1671', '3', '6998');
INSERT INTO `shopee_category` VALUES ('1675', 'Walkers & Bouncers', '1671', '3', '9787');
INSERT INTO `shopee_category` VALUES ('1676', 'Baby Carrier', '1671', '3', '9792');
INSERT INTO `shopee_category` VALUES ('1677', 'Feeding & Nursing', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1678', 'Breastfeeding', '1677', '3', '9786');
INSERT INTO `shopee_category` VALUES ('1679', 'Lunchboxes & Storage', '1677', '3', '6979');
INSERT INTO `shopee_category` VALUES ('1680', 'Others', '1677', '3', '4900');
INSERT INTO `shopee_category` VALUES ('1681', 'Food & Formula', '1677', '3', '6976');
INSERT INTO `shopee_category` VALUES ('1682', 'Baby Bibs', '1677', '3', '6977');
INSERT INTO `shopee_category` VALUES ('1683', 'Teethers & Pacifiers', '1677', '3', '6975');
INSERT INTO `shopee_category` VALUES ('1684', 'Bottle Feeding', '1677', '3', '6973');
INSERT INTO `shopee_category` VALUES ('1685', 'Sterilisers & Warmers', '1677', '3', '6974');
INSERT INTO `shopee_category` VALUES ('1686', 'Diapers & Potties', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1687', 'Potties', '1686', '3', '7070');
INSERT INTO `shopee_category` VALUES ('1688', 'Diaper Bag', '1686', '3', '7071');
INSERT INTO `shopee_category` VALUES ('1689', 'Diapers', '1686', '3', '7069');
INSERT INTO `shopee_category` VALUES ('1690', 'Others', '1686', '3', '4889');
INSERT INTO `shopee_category` VALUES ('1691', 'Bath & Skincare', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1692', 'Oral Care', '1691', '3', '6983');
INSERT INTO `shopee_category` VALUES ('1693', 'Others', '1691', '3', '4899');
INSERT INTO `shopee_category` VALUES ('1694', 'Bathing Accessories', '1691', '3', '9846');
INSERT INTO `shopee_category` VALUES ('1695', 'Bath & Shampoo', '1691', '3', '6981');
INSERT INTO `shopee_category` VALUES ('1696', 'Skincare', '1691', '3', '6982');
INSERT INTO `shopee_category` VALUES ('1697', 'Baby Wipes', '1691', '3', '9794');
INSERT INTO `shopee_category` VALUES ('1698', 'Toys & Education', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1699', 'Early Learning', '1698', '3', '7037');
INSERT INTO `shopee_category` VALUES ('1700', 'Sports & Outdoor Play', '1698', '3', '7039');
INSERT INTO `shopee_category` VALUES ('1701', 'Musical Toys', '1698', '3', '9817');
INSERT INTO `shopee_category` VALUES ('1702', 'Stuffed Toys', '1698', '3', '7038');
INSERT INTO `shopee_category` VALUES ('1703', 'Arts & Crafts', '1698', '3', '9810');
INSERT INTO `shopee_category` VALUES ('1704', 'Playmats', '1698', '3', '9818');
INSERT INTO `shopee_category` VALUES ('1705', 'Building Blocks', '1698', '3', '9812');
INSERT INTO `shopee_category` VALUES ('1706', 'Baby & Toddler Toys', '1698', '3', '9811');
INSERT INTO `shopee_category` VALUES ('1707', 'Others', '1698', '3', '4895');
INSERT INTO `shopee_category` VALUES ('1708', 'Pretend Play', '1698', '3', '9819');
INSERT INTO `shopee_category` VALUES ('1709', 'Dolls & Accessories', '1698', '3', '9816');
INSERT INTO `shopee_category` VALUES ('1710', 'Puzzles', '1698', '3', '9820');
INSERT INTO `shopee_category` VALUES ('1711', 'Accessories', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1712', 'Others', '1711', '3', '4901');
INSERT INTO `shopee_category` VALUES ('1713', 'Bags', '1711', '3', '6969');
INSERT INTO `shopee_category` VALUES ('1714', 'Hats & Caps', '1711', '3', '6971');
INSERT INTO `shopee_category` VALUES ('1715', 'Kids Hair Accessories', '1711', '3', '9374');
INSERT INTO `shopee_category` VALUES ('1716', 'Watches', '1711', '3', '9845');
INSERT INTO `shopee_category` VALUES ('1717', 'Kids Fashion', '1653', '2', null);
INSERT INTO `shopee_category` VALUES ('1718', 'Others', '1717', '3', '4898');
INSERT INTO `shopee_category` VALUES ('1719', 'Socks', '1717', '3', '6988');
INSERT INTO `shopee_category` VALUES ('1720', 'Boys Clothing', '1717', '3', '6990');
INSERT INTO `shopee_category` VALUES ('1721', 'Shoes', '1717', '3', '9554');
INSERT INTO `shopee_category` VALUES ('1722', 'Girls Clothing', '1717', '3', '6989');
INSERT INTO `shopee_category` VALUES ('1723', 'Hobbies, Games & Collectibles', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1724', 'Games for Consoles', '1723', '2', null);
INSERT INTO `shopee_category` VALUES ('1725', 'PS3', '1724', '3', '7171');
INSERT INTO `shopee_category` VALUES ('1726', 'PS4', '1724', '3', '7169');
INSERT INTO `shopee_category` VALUES ('1727', 'Xbox One', '1724', '3', '7172');
INSERT INTO `shopee_category` VALUES ('1728', 'Others', '1724', '3', '4843');
INSERT INTO `shopee_category` VALUES ('1729', 'PC', '1724', '3', '7170');
INSERT INTO `shopee_category` VALUES ('1730', 'Nintendo 3DS', '1724', '3', '7174');
INSERT INTO `shopee_category` VALUES ('1731', 'PS Vita', '1724', '3', '7167');
INSERT INTO `shopee_category` VALUES ('1732', 'Xbox 360', '1724', '3', '7173');
INSERT INTO `shopee_category` VALUES ('1733', 'Games & Collectibles', '1723', '2', null);
INSERT INTO `shopee_category` VALUES ('1734', 'Toy Vehicles', '1733', '3', '7177');
INSERT INTO `shopee_category` VALUES ('1735', 'Family Games', '1733', '3', '7179');
INSERT INTO `shopee_category` VALUES ('1736', 'Collectibles', '1733', '3', '9484');
INSERT INTO `shopee_category` VALUES ('1737', 'DIY Collectibles', '1733', '3', '7176');
INSERT INTO `shopee_category` VALUES ('1738', 'Others', '1733', '3', '4842');
INSERT INTO `shopee_category` VALUES ('1739', 'Action Figures', '1733', '3', '7178');
INSERT INTO `shopee_category` VALUES ('1740', 'Media & Music', '1723', '2', null);
INSERT INTO `shopee_category` VALUES ('1741', 'English Books', '1740', '3', '7183');
INSERT INTO `shopee_category` VALUES ('1742', 'CD/DVD/Blu-Ray', '1740', '3', '7180');
INSERT INTO `shopee_category` VALUES ('1743', 'Local Books', '1740', '3', '7181');
INSERT INTO `shopee_category` VALUES ('1744', 'Chinese Books', '1740', '3', '7182');
INSERT INTO `shopee_category` VALUES ('1745', 'Others', '1740', '3', '4840');
INSERT INTO `shopee_category` VALUES ('1746', 'Musical Instruments', '1740', '3', '7184');
INSERT INTO `shopee_category` VALUES ('1747', 'Others', '1723', '2', null);
INSERT INTO `shopee_category` VALUES ('1748', 'Others', '1747', '3', '4835');
INSERT INTO `shopee_category` VALUES ('1749', 'Consoles & Accessories', '1723', '2', null);
INSERT INTO `shopee_category` VALUES ('1750', 'Others', '1749', '3', '4844');
INSERT INTO `shopee_category` VALUES ('1751', 'Stationary Consoles', '1749', '3', '7165');
INSERT INTO `shopee_category` VALUES ('1752', 'Handheld Consoles', '1749', '3', '7164');
INSERT INTO `shopee_category` VALUES ('1753', 'Consoles Accessories', '1749', '3', '7166');
INSERT INTO `shopee_category` VALUES ('1754', 'Everything Else', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1755', 'Religion & Beliefs', '1754', '2', null);
INSERT INTO `shopee_category` VALUES ('1756', 'Statues & Figurines', '1755', '3', '7228');
INSERT INTO `shopee_category` VALUES ('1757', 'Accents', '1755', '3', '7229');
INSERT INTO `shopee_category` VALUES ('1758', 'Others', '1755', '3', '4796');
INSERT INTO `shopee_category` VALUES ('1759', 'Others', '1754', '2', null);
INSERT INTO `shopee_category` VALUES ('1760', 'Others', '1759', '3', '4800');
INSERT INTO `shopee_category` VALUES ('1761', 'Car Care & Parts', '1754', '2', null);
INSERT INTO `shopee_category` VALUES ('1762', 'Car Seats', '1761', '3', '7225');
INSERT INTO `shopee_category` VALUES ('1763', 'Dashboard Accessories', '1761', '3', '7223');
INSERT INTO `shopee_category` VALUES ('1764', 'Car Stickers', '1761', '3', '7224');
INSERT INTO `shopee_category` VALUES ('1765', 'Others', '1761', '3', '4807');
INSERT INTO `shopee_category` VALUES ('1766', 'Electronic Cigarettes', '1754', '2', null);
INSERT INTO `shopee_category` VALUES ('1767', 'Others', '1766', '3', '4810');
INSERT INTO `shopee_category` VALUES ('1768', 'Vape Mods', '1766', '3', '7220');
INSERT INTO `shopee_category` VALUES ('1769', 'Tanks & Accessories', '1766', '3', '7221');
INSERT INTO `shopee_category` VALUES ('1770', 'e-Juices', '1766', '3', '7222');
INSERT INTO `shopee_category` VALUES ('1771', 'Pets', '1754', '2', null);
INSERT INTO `shopee_category` VALUES ('1772', 'Feeding & Grooming', '1771', '3', '7227');
INSERT INTO `shopee_category` VALUES ('1773', 'Clothes & Accessories', '1771', '3', '7226');
INSERT INTO `shopee_category` VALUES ('1774', 'Others', '1771', '3', '4806');
INSERT INTO `shopee_category` VALUES ('1775', 'Muslim Wear', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1776', 'Muslimah Jubah', '1775', '2', null);
INSERT INTO `shopee_category` VALUES ('1777', 'Jubah Dokoh', '1776', '3', '9851');
INSERT INTO `shopee_category` VALUES ('1778', 'Nursing Jubah', '1776', '3', '9852');
INSERT INTO `shopee_category` VALUES ('1779', 'Others', '1776', '3', '4855');
INSERT INTO `shopee_category` VALUES ('1780', 'Basic Jubah', '1776', '3', '9849');
INSERT INTO `shopee_category` VALUES ('1781', 'Fashion Jubah', '1776', '3', '9850');
INSERT INTO `shopee_category` VALUES ('1782', 'Muslimah Wear', '1775', '2', null);
INSERT INTO `shopee_category` VALUES ('1783', 'Baju Kebaya', '1782', '3', '9565');
INSERT INTO `shopee_category` VALUES ('1784', 'Telekung', '1782', '3', '7146');
INSERT INTO `shopee_category` VALUES ('1785', 'Others', '1782', '3', '4854');
INSERT INTO `shopee_category` VALUES ('1786', 'Kaftan & Kimonos', '1782', '3', '7147');
INSERT INTO `shopee_category` VALUES ('1787', 'Baju Kurung', '1782', '3', '7149');
INSERT INTO `shopee_category` VALUES ('1788', 'Pants & Skirts', '1782', '3', '7144');
INSERT INTO `shopee_category` VALUES ('1789', 'Hijab', '1775', '2', null);
INSERT INTO `shopee_category` VALUES ('1790', 'Instant Shawl', '1789', '3', '9623');
INSERT INTO `shopee_category` VALUES ('1791', 'Others', '1789', '3', '4853');
INSERT INTO `shopee_category` VALUES ('1792', 'Inner', '1789', '3', '9627');
INSERT INTO `shopee_category` VALUES ('1793', 'Wide Shawl', '1789', '3', '9625');
INSERT INTO `shopee_category` VALUES ('1794', 'Basic Shawl', '1789', '3', '9624');
INSERT INTO `shopee_category` VALUES ('1795', 'Bawal', '1789', '3', '9626');
INSERT INTO `shopee_category` VALUES ('1796', 'Blouse', '1775', '2', null);
INSERT INTO `shopee_category` VALUES ('1797', 'Long Blouse', '1796', '3', '9855');
INSERT INTO `shopee_category` VALUES ('1798', 'Fashion Blouse', '1796', '3', '9854');
INSERT INTO `shopee_category` VALUES ('1799', 'Others', '1796', '3', '4852');
INSERT INTO `shopee_category` VALUES ('1800', 'Basic Blouse', '1796', '3', '9853');
INSERT INTO `shopee_category` VALUES ('1801', 'Nursing Blouse', '1796', '3', '9856');
INSERT INTO `shopee_category` VALUES ('1802', 'Others', '1775', '2', null);
INSERT INTO `shopee_category` VALUES ('1803', 'Others', '1802', '3', '4850');
INSERT INTO `shopee_category` VALUES ('1804', 'Muslimin Wear', '1775', '2', null);
INSERT INTO `shopee_category` VALUES ('1805', 'Others', '1804', '3', '4851');
INSERT INTO `shopee_category` VALUES ('1806', 'Jubah', '1804', '3', '7141');
INSERT INTO `shopee_category` VALUES ('1807', 'Kurta', '1804', '3', '7142');
INSERT INTO `shopee_category` VALUES ('1808', 'Batik & Songket', '1775', '2', null);
INSERT INTO `shopee_category` VALUES ('1809', 'Others', '1808', '3', '7151');
INSERT INTO `shopee_category` VALUES ('1810', 'Women\'s Shoes', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1811', 'Heels', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1812', 'Others', '1811', '3', '4879');
INSERT INTO `shopee_category` VALUES ('1813', 'Platform Heels', '1811', '3', '7090');
INSERT INTO `shopee_category` VALUES ('1814', 'Low Heels', '1811', '3', '7089');
INSERT INTO `shopee_category` VALUES ('1815', 'High Heels', '1811', '3', '7087');
INSERT INTO `shopee_category` VALUES ('1816', 'Mid Heels', '1811', '3', '7088');
INSERT INTO `shopee_category` VALUES ('1817', 'Peep Toes', '1811', '3', '7091');
INSERT INTO `shopee_category` VALUES ('1818', 'Sports & Sneakers', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1819', 'Sneakers', '1818', '3', '7086');
INSERT INTO `shopee_category` VALUES ('1820', 'Sports Shoes', '1818', '3', '7085');
INSERT INTO `shopee_category` VALUES ('1821', 'Others', '1818', '3', '4880');
INSERT INTO `shopee_category` VALUES ('1822', 'Sandals & Slippers', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1823', 'Slippers', '1822', '3', '7096');
INSERT INTO `shopee_category` VALUES ('1824', 'Others', '1822', '3', '4878');
INSERT INTO `shopee_category` VALUES ('1825', 'Sandals', '1822', '3', '7095');
INSERT INTO `shopee_category` VALUES ('1826', 'Wedges & Platforms', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1827', 'Wedges', '1826', '3', '7112');
INSERT INTO `shopee_category` VALUES ('1828', 'Platforms', '1826', '3', '7113');
INSERT INTO `shopee_category` VALUES ('1829', 'Others', '1826', '3', '4875');
INSERT INTO `shopee_category` VALUES ('1830', 'Women\'s Leather Wear', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1831', 'Others', '1830', '3', '4874');
INSERT INTO `shopee_category` VALUES ('1832', 'Others', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1833', 'Others', '1832', '3', '4873');
INSERT INTO `shopee_category` VALUES ('1834', 'Flats', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1835', 'Peep Toes', '1834', '3', '7109');
INSERT INTO `shopee_category` VALUES ('1836', 'Loafers', '1834', '3', '7107');
INSERT INTO `shopee_category` VALUES ('1837', 'Others', '1834', '3', '4877');
INSERT INTO `shopee_category` VALUES ('1838', 'Ballet Flats', '1834', '3', '7108');
INSERT INTO `shopee_category` VALUES ('1839', 'Shoes Accessories', '1810', '2', null);
INSERT INTO `shopee_category` VALUES ('1840', 'Others', '1839', '3', '7115');
INSERT INTO `shopee_category` VALUES ('1841', 'Beauty & Personal Care', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1842', 'Personal Care', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1843', 'Oral Hygiene', '1842', '3', '6702');
INSERT INTO `shopee_category` VALUES ('1844', 'Slimming & Shaping', '1842', '3', '6699');
INSERT INTO `shopee_category` VALUES ('1845', 'Feminine Care', '1842', '3', '6705');
INSERT INTO `shopee_category` VALUES ('1846', 'Personal Pleasure', '1842', '3', '6704');
INSERT INTO `shopee_category` VALUES ('1847', 'Massage & Detox', '1842', '3', '6701');
INSERT INTO `shopee_category` VALUES ('1848', 'Others', '1842', '3', '4955');
INSERT INTO `shopee_category` VALUES ('1849', 'Bath & Body', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1850', 'Bath', '1849', '3', '6671');
INSERT INTO `shopee_category` VALUES ('1851', 'Body Scrubs', '1849', '3', '6673');
INSERT INTO `shopee_category` VALUES ('1852', 'Body Lotion & Butter', '1849', '3', '6672');
INSERT INTO `shopee_category` VALUES ('1853', 'Others', '1849', '3', '4959');
INSERT INTO `shopee_category` VALUES ('1854', 'Hair Care', '1849', '3', '6670');
INSERT INTO `shopee_category` VALUES ('1855', 'Fragrances', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1856', 'For Her', '1855', '3', '6675');
INSERT INTO `shopee_category` VALUES ('1857', 'Aromatherapy', '1855', '3', '6676');
INSERT INTO `shopee_category` VALUES ('1858', 'For Him', '1855', '3', '6674');
INSERT INTO `shopee_category` VALUES ('1859', 'Others', '1855', '3', '4957');
INSERT INTO `shopee_category` VALUES ('1860', 'Supplements', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1861', 'Sports Nutrition', '1860', '3', '9510');
INSERT INTO `shopee_category` VALUES ('1862', 'Well-being', '1860', '3', '9509');
INSERT INTO `shopee_category` VALUES ('1863', 'Traditional', '1860', '3', '9508');
INSERT INTO `shopee_category` VALUES ('1864', 'Nutritional Supplement', '1860', '3', '9511');
INSERT INTO `shopee_category` VALUES ('1865', 'Weight Management', '1860', '3', '9512');
INSERT INTO `shopee_category` VALUES ('1866', 'Others', '1860', '3', '4798');
INSERT INTO `shopee_category` VALUES ('1867', 'Others', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1868', 'Others', '1867', '3', '4952');
INSERT INTO `shopee_category` VALUES ('1869', 'Men\'s Grooming', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1870', 'Shaving', '1869', '3', '6709');
INSERT INTO `shopee_category` VALUES ('1871', 'For Skin', '1869', '3', '6706');
INSERT INTO `shopee_category` VALUES ('1872', 'Others', '1869', '3', '4802');
INSERT INTO `shopee_category` VALUES ('1873', 'For Hair', '1869', '3', '6707');
INSERT INTO `shopee_category` VALUES ('1874', 'Medical Supplies', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1875', 'Others', '1874', '3', '4953');
INSERT INTO `shopee_category` VALUES ('1876', 'Health Accessories', '1874', '3', '6693');
INSERT INTO `shopee_category` VALUES ('1877', 'Weighing Scale', '1874', '3', '6692');
INSERT INTO `shopee_category` VALUES ('1878', 'Ointments & Bandages', '1874', '3', '6695');
INSERT INTO `shopee_category` VALUES ('1879', 'Eye Care', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1880', 'Prescription Lens & Care', '1879', '3', '9663');
INSERT INTO `shopee_category` VALUES ('1881', 'Eye Mask', '1879', '3', '9662');
INSERT INTO `shopee_category` VALUES ('1882', 'Eye Cream & Serum', '1879', '3', '4960');
INSERT INTO `shopee_category` VALUES ('1883', 'Others', '1879', '3', '9664');
INSERT INTO `shopee_category` VALUES ('1884', 'Face Make Up', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1885', 'Powder & Compacts', '1884', '3', '6616');
INSERT INTO `shopee_category` VALUES ('1886', 'Others', '1884', '3', '4966');
INSERT INTO `shopee_category` VALUES ('1887', 'Make Up Sets', '1884', '3', '9666');
INSERT INTO `shopee_category` VALUES ('1888', 'Concealer', '1884', '3', '6619');
INSERT INTO `shopee_category` VALUES ('1889', 'Shading & Highlighting', '1884', '3', '6620');
INSERT INTO `shopee_category` VALUES ('1890', 'Foundation', '1884', '3', '6617');
INSERT INTO `shopee_category` VALUES ('1891', 'Blusher', '1884', '3', '6618');
INSERT INTO `shopee_category` VALUES ('1892', 'Eye Make Up', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1893', 'Eyeliner', '1892', '3', '6622');
INSERT INTO `shopee_category` VALUES ('1894', 'Mascara', '1892', '3', '6624');
INSERT INTO `shopee_category` VALUES ('1895', 'Cosmetic Contact Lens', '1892', '3', '6625');
INSERT INTO `shopee_category` VALUES ('1896', 'Eyebrow', '1892', '3', '6623');
INSERT INTO `shopee_category` VALUES ('1897', 'Others', '1892', '3', '4965');
INSERT INTO `shopee_category` VALUES ('1898', 'Eye Shadow', '1892', '3', '6621');
INSERT INTO `shopee_category` VALUES ('1899', 'Eyelid Tape & Eyelashes', '1892', '3', '6626');
INSERT INTO `shopee_category` VALUES ('1900', 'Lips', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1901', 'Lip Gloss', '1900', '3', '6643');
INSERT INTO `shopee_category` VALUES ('1902', 'Others', '1900', '3', '4964');
INSERT INTO `shopee_category` VALUES ('1903', 'Lip Tint', '1900', '3', '6647');
INSERT INTO `shopee_category` VALUES ('1904', 'Lip Liner', '1900', '3', '6645');
INSERT INTO `shopee_category` VALUES ('1905', 'Lipstick', '1900', '3', '6641');
INSERT INTO `shopee_category` VALUES ('1906', 'Lip Balm & Treatment', '1900', '3', '6642');
INSERT INTO `shopee_category` VALUES ('1907', 'Pedicure & Manicure', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1908', 'Others', '1907', '3', '4956');
INSERT INTO `shopee_category` VALUES ('1909', 'Treatment & Remover', '1907', '3', '6655');
INSERT INTO `shopee_category` VALUES ('1910', 'Nail Art & Stickers', '1907', '3', '6654');
INSERT INTO `shopee_category` VALUES ('1911', 'Top Coat & Base Coat', '1907', '3', '6653');
INSERT INTO `shopee_category` VALUES ('1912', 'Nail Care Tools', '1907', '3', '6656');
INSERT INTO `shopee_category` VALUES ('1913', 'Nail Polish', '1907', '3', '6651');
INSERT INTO `shopee_category` VALUES ('1914', 'Brushes & Beauty Tools', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1915', 'Hair Styling', '1914', '3', '6684');
INSERT INTO `shopee_category` VALUES ('1916', 'Brushes & Sponges', '1914', '3', '6681');
INSERT INTO `shopee_category` VALUES ('1917', 'Hair Removal', '1914', '3', '6685');
INSERT INTO `shopee_category` VALUES ('1918', 'Others', '1914', '3', '4963');
INSERT INTO `shopee_category` VALUES ('1919', 'Facial Tools', '1914', '3', '6682');
INSERT INTO `shopee_category` VALUES ('1920', 'Skincare', '1841', '2', null);
INSERT INTO `shopee_category` VALUES ('1921', 'Toner & Mists', '1920', '3', '9518');
INSERT INTO `shopee_category` VALUES ('1922', 'Essence & Serum', '1920', '3', '9516');
INSERT INTO `shopee_category` VALUES ('1923', 'Sunscreen & Aftersun', '1920', '3', '9514');
INSERT INTO `shopee_category` VALUES ('1924', 'Others', '1920', '3', '9507');
INSERT INTO `shopee_category` VALUES ('1925', 'Skin Sets', '1920', '3', '9665');
INSERT INTO `shopee_category` VALUES ('1926', 'Whitening', '1920', '3', '9515');
INSERT INTO `shopee_category` VALUES ('1927', 'Face Mask & Packs', '1920', '3', '9520');
INSERT INTO `shopee_category` VALUES ('1928', 'Cleanser', '1920', '3', '9519');
INSERT INTO `shopee_category` VALUES ('1929', 'Moisturizer & Cream', '1920', '3', '9517');
INSERT INTO `shopee_category` VALUES ('1930', 'Sports & Outdoor', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1931', 'Sports Gear & Accessories', '1930', '2', null);
INSERT INTO `shopee_category` VALUES ('1932', 'Individual Sports', '1931', '3', '7191');
INSERT INTO `shopee_category` VALUES ('1933', 'Others', '1931', '3', '4826');
INSERT INTO `shopee_category` VALUES ('1934', 'Team Sports', '1931', '3', '7192');
INSERT INTO `shopee_category` VALUES ('1935', 'Fitness Equipment', '1930', '2', null);
INSERT INTO `shopee_category` VALUES ('1936', 'Training Equipment', '1935', '3', '7187');
INSERT INTO `shopee_category` VALUES ('1937', 'Yoga', '1935', '3', '7186');
INSERT INTO `shopee_category` VALUES ('1938', 'Others', '1935', '3', '4828');
INSERT INTO `shopee_category` VALUES ('1939', 'Others', '1930', '2', null);
INSERT INTO `shopee_category` VALUES ('1940', 'Default', '1939', '3', '4825');
INSERT INTO `shopee_category` VALUES ('1941', 'Outdoor & Adventure', '1930', '2', null);
INSERT INTO `shopee_category` VALUES ('1942', 'Skates', '1941', '3', '7190');
INSERT INTO `shopee_category` VALUES ('1943', 'Camping & Hiking', '1941', '3', '7188');
INSERT INTO `shopee_category` VALUES ('1944', 'Others', '1941', '3', '4827');
INSERT INTO `shopee_category` VALUES ('1945', 'Cycling', '1941', '3', '7189');
INSERT INTO `shopee_category` VALUES ('1946', 'Mobile & Gadgets', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('1947', 'Mobile Car Accessories', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1948', 'Others', '1947', '3', '4921');
INSERT INTO `shopee_category` VALUES ('1949', 'Tablets', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1950', 'Android', '1949', '3', '6856');
INSERT INTO `shopee_category` VALUES ('1951', 'Others', '1949', '3', '4920');
INSERT INTO `shopee_category` VALUES ('1952', 'iOS', '1949', '3', '6857');
INSERT INTO `shopee_category` VALUES ('1953', 'Cases & Covers', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1954', 'Others', '1953', '3', '4929');
INSERT INTO `shopee_category` VALUES ('1955', 'iPhone Hard Cover', '1953', '3', '6815');
INSERT INTO `shopee_category` VALUES ('1956', 'iPhone Soft Cover', '1953', '3', '9597');
INSERT INTO `shopee_category` VALUES ('1957', 'Android Hard Cover', '1953', '3', '9529');
INSERT INTO `shopee_category` VALUES ('1958', 'Tablet', '1953', '3', '6816');
INSERT INTO `shopee_category` VALUES ('1959', 'Android Soft Cover', '1953', '3', '9598');
INSERT INTO `shopee_category` VALUES ('1960', 'Phone Holder & Stand', '1953', '3', '9528');
INSERT INTO `shopee_category` VALUES ('1961', 'Powerbanks & Batteries', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1962', 'Powerbanks', '1961', '3', '6810');
INSERT INTO `shopee_category` VALUES ('1963', 'Fashion Powerbanks', '1961', '3', '6811');
INSERT INTO `shopee_category` VALUES ('1964', 'Phone Batteries', '1961', '3', '6813');
INSERT INTO `shopee_category` VALUES ('1965', 'Others', '1961', '3', '4930');
INSERT INTO `shopee_category` VALUES ('1966', 'Storage & Memory Cards', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1967', 'USB Drive', '1966', '3', '6842');
INSERT INTO `shopee_category` VALUES ('1968', 'Memory Cards', '1966', '3', '6843');
INSERT INTO `shopee_category` VALUES ('1969', 'Others', '1966', '3', '4925');
INSERT INTO `shopee_category` VALUES ('1970', 'Others', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1971', 'Others', '1970', '3', '4919');
INSERT INTO `shopee_category` VALUES ('1972', 'Cables & Chargers', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1973', 'Cables', '1972', '3', '6817');
INSERT INTO `shopee_category` VALUES ('1974', 'Chargers', '1972', '3', '6818');
INSERT INTO `shopee_category` VALUES ('1975', 'Docks', '1972', '3', '6821');
INSERT INTO `shopee_category` VALUES ('1976', 'Others', '1972', '3', '4928');
INSERT INTO `shopee_category` VALUES ('1977', 'Audio', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1978', 'Earphones', '1977', '3', '6848');
INSERT INTO `shopee_category` VALUES ('1979', 'Others', '1977', '3', '4924');
INSERT INTO `shopee_category` VALUES ('1980', 'Headphones & Headsets', '1977', '3', '6847');
INSERT INTO `shopee_category` VALUES ('1981', 'Speakers', '1977', '3', '6849');
INSERT INTO `shopee_category` VALUES ('1982', 'Cool Gadgets', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1983', 'Other Gadgets', '1982', '3', '6832');
INSERT INTO `shopee_category` VALUES ('1984', 'USB Fan', '1982', '3', '6829');
INSERT INTO `shopee_category` VALUES ('1985', 'USB Light', '1982', '3', '6831');
INSERT INTO `shopee_category` VALUES ('1986', 'Others', '1982', '3', '4927');
INSERT INTO `shopee_category` VALUES ('1987', 'Wearables', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1988', 'Fitness Tracker', '1987', '3', '6852');
INSERT INTO `shopee_category` VALUES ('1989', 'Others', '1987', '3', '4923');
INSERT INTO `shopee_category` VALUES ('1990', 'Smart Watch', '1987', '3', '6851');
INSERT INTO `shopee_category` VALUES ('1991', 'Mobile Phones', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('1992', 'Sony', '1991', '3', '10113');
INSERT INTO `shopee_category` VALUES ('1993', 'Others', '1991', '3', '4922');
INSERT INTO `shopee_category` VALUES ('1994', 'Nokia', '1991', '3', '10111');
INSERT INTO `shopee_category` VALUES ('1995', 'Other Brands', '1991', '3', '6855');
INSERT INTO `shopee_category` VALUES ('1996', 'Asus', '1991', '3', '10110');
INSERT INTO `shopee_category` VALUES ('1997', 'Xiaomi', '1991', '3', '10094');
INSERT INTO `shopee_category` VALUES ('1998', 'Huawei & Honor', '1991', '3', '10093');
INSERT INTO `shopee_category` VALUES ('1999', 'Lenovo', '1991', '3', '10096');
INSERT INTO `shopee_category` VALUES ('2000', 'iPhone', '1991', '3', '6854');
INSERT INTO `shopee_category` VALUES ('2001', 'Samsung', '1991', '3', '6853');
INSERT INTO `shopee_category` VALUES ('2002', 'Screen Protectors', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('2003', 'Matte', '2002', '3', '6837');
INSERT INTO `shopee_category` VALUES ('2004', 'Others', '2002', '3', '4926');
INSERT INTO `shopee_category` VALUES ('2005', 'Privacy', '2002', '3', '6838');
INSERT INTO `shopee_category` VALUES ('2006', 'Android Tempered Glass', '2002', '3', '6839');
INSERT INTO `shopee_category` VALUES ('2007', 'Clear', '2002', '3', '6836');
INSERT INTO `shopee_category` VALUES ('2008', 'iPhone Tempered Glass', '2002', '3', '9596');
INSERT INTO `shopee_category` VALUES ('2009', 'Camera & Accessories', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('2010', 'Action & Sport Camera', '2009', '3', '9620');
INSERT INTO `shopee_category` VALUES ('2011', 'Camera Accessories', '2009', '3', '9622');
INSERT INTO `shopee_category` VALUES ('2012', 'Polaroid & Digital', '2009', '3', '9621');
INSERT INTO `shopee_category` VALUES ('2013', 'Others', '2009', '3', '9619');
INSERT INTO `shopee_category` VALUES ('2014', 'Selfie Accessories', '1946', '2', null);
INSERT INTO `shopee_category` VALUES ('2015', 'Others', '2014', '3', '9629');
INSERT INTO `shopee_category` VALUES ('2016', 'Design & Crafts', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('2017', 'Fabric & Materials', '2016', '2', null);
INSERT INTO `shopee_category` VALUES ('2018', 'Others', '2017', '3', '4847');
INSERT INTO `shopee_category` VALUES ('2019', 'Fabrics', '2017', '3', '7162');
INSERT INTO `shopee_category` VALUES ('2020', 'Materials', '2017', '3', '7163');
INSERT INTO `shopee_category` VALUES ('2021', 'Stationery', '2016', '2', null);
INSERT INTO `shopee_category` VALUES ('2022', 'Others', '2021', '3', '4846');
INSERT INTO `shopee_category` VALUES ('2023', 'Arts & Graphics', '2021', '3', '7154');
INSERT INTO `shopee_category` VALUES ('2024', 'Writing Utensils', '2021', '3', '7153');
INSERT INTO `shopee_category` VALUES ('2025', 'Stickers & Tapes', '2021', '3', '7157');
INSERT INTO `shopee_category` VALUES ('2026', 'School & Office', '2021', '3', '7155');
INSERT INTO `shopee_category` VALUES ('2027', 'Diaries & Notebooks', '2021', '3', '7156');
INSERT INTO `shopee_category` VALUES ('2028', 'Others', '2016', '2', null);
INSERT INTO `shopee_category` VALUES ('2029', 'Others', '2028', '3', '4845');
INSERT INTO `shopee_category` VALUES ('2030', 'Handmade', '2016', '2', null);
INSERT INTO `shopee_category` VALUES ('2031', 'DIY', '2030', '3', '7160');
INSERT INTO `shopee_category` VALUES ('2032', 'Gifts', '2030', '3', '7159');
INSERT INTO `shopee_category` VALUES ('2033', 'Others', '2030', '3', '4849');
INSERT INTO `shopee_category` VALUES ('2034', 'Dolls', '2030', '3', '7161');
INSERT INTO `shopee_category` VALUES ('2035', 'Watches', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('2036', 'Sports', '2035', '2', null);
INSERT INTO `shopee_category` VALUES ('2037', 'Sport Bands', '2036', '3', '6895');
INSERT INTO `shopee_category` VALUES ('2038', 'Sport Watches', '2036', '3', '6894');
INSERT INTO `shopee_category` VALUES ('2039', 'Others', '2036', '3', '4912');
INSERT INTO `shopee_category` VALUES ('2040', 'Men\'s Watches', '2035', '2', null);
INSERT INTO `shopee_category` VALUES ('2041', 'Men\'s Business', '2040', '3', '6863');
INSERT INTO `shopee_category` VALUES ('2042', 'Men\'s Analogue', '2040', '3', '6864');
INSERT INTO `shopee_category` VALUES ('2043', 'Others', '2040', '3', '4918');
INSERT INTO `shopee_category` VALUES ('2044', 'Men\'s Digital', '2040', '3', '6865');
INSERT INTO `shopee_category` VALUES ('2045', 'Men\'s Chronograph', '2040', '3', '6867');
INSERT INTO `shopee_category` VALUES ('2046', 'Others', '2035', '2', null);
INSERT INTO `shopee_category` VALUES ('2047', 'Others', '2046', '3', '4910');
INSERT INTO `shopee_category` VALUES ('2048', 'Women\'s Watches', '2035', '2', null);
INSERT INTO `shopee_category` VALUES ('2049', 'Others', '2048', '3', '4915');
INSERT INTO `shopee_category` VALUES ('2050', 'Women\'s Casual', '2048', '3', '6884');
INSERT INTO `shopee_category` VALUES ('2051', 'Women\'s Business', '2048', '3', '6882');
INSERT INTO `shopee_category` VALUES ('2052', 'Luxury', '2035', '2', null);
INSERT INTO `shopee_category` VALUES ('2053', 'Others', '2052', '3', '4911');
INSERT INTO `shopee_category` VALUES ('2054', 'Couple & Set Watches', '2035', '2', null);
INSERT INTO `shopee_category` VALUES ('2055', 'Others', '2054', '3', '4913');
INSERT INTO `shopee_category` VALUES ('2056', 'Watch Accessories', '2035', '2', null);
INSERT INTO `shopee_category` VALUES ('2057', 'Others', '2056', '3', '6899');
INSERT INTO `shopee_category` VALUES ('2058', 'Tickets & Vouchers', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('2059', 'Restaurant & Spa Vouchers', '2058', '2', null);
INSERT INTO `shopee_category` VALUES ('2060', 'Spa Vouchers', '2059', '3', '7212');
INSERT INTO `shopee_category` VALUES ('2061', 'Others', '2059', '3', '4815');
INSERT INTO `shopee_category` VALUES ('2062', 'Restaurant Vouchers', '2059', '3', '7211');
INSERT INTO `shopee_category` VALUES ('2063', 'Events & Travel Vouchers', '2058', '2', null);
INSERT INTO `shopee_category` VALUES ('2064', 'Others', '2063', '3', '4813');
INSERT INTO `shopee_category` VALUES ('2065', 'Others', '2058', '2', null);
INSERT INTO `shopee_category` VALUES ('2066', 'Others', '2065', '3', '4811');
INSERT INTO `shopee_category` VALUES ('2067', 'Mobile Reloads & Sim Cards', '2058', '2', null);
INSERT INTO `shopee_category` VALUES ('2068', 'Others', '2067', '3', '4816');
INSERT INTO `shopee_category` VALUES ('2069', 'Mobile Reloads', '2067', '3', '7209');
INSERT INTO `shopee_category` VALUES ('2070', 'Sim Cards', '2067', '3', '7210');
INSERT INTO `shopee_category` VALUES ('2071', 'Bill Payments', '2058', '2', null);
INSERT INTO `shopee_category` VALUES ('2072', 'Home Bills', '2071', '3', '7214');
INSERT INTO `shopee_category` VALUES ('2073', 'Others', '2071', '3', '4814');
INSERT INTO `shopee_category` VALUES ('2074', 'Mobiles', '2071', '3', '7213');
INSERT INTO `shopee_category` VALUES ('2075', 'Shopee & Retail Vouchers', '2058', '2', null);
INSERT INTO `shopee_category` VALUES ('2076', 'Others', '2075', '3', '4812');
INSERT INTO `shopee_category` VALUES ('2077', 'Shopee Vouchers', '2075', '3', '7217');
INSERT INTO `shopee_category` VALUES ('2078', 'Retail Vouchers', '2075', '3', '7218');
INSERT INTO `shopee_category` VALUES ('2079', 'Services', '2058', '2', null);
INSERT INTO `shopee_category` VALUES ('2080', 'Others', '2079', '3', '7216');
INSERT INTO `shopee_category` VALUES ('2081', 'Postage', '2079', '3', '7219');
INSERT INTO `shopee_category` VALUES ('2082', 'Computers & Laptops', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('2083', 'Components', '2082', '2', null);
INSERT INTO `shopee_category` VALUES ('2084', 'Fans & Heatsinks', '2083', '3', '7199');
INSERT INTO `shopee_category` VALUES ('2085', 'Others', '2083', '3', '4821');
INSERT INTO `shopee_category` VALUES ('2086', 'Graphic Cards', '2083', '3', '7200');
INSERT INTO `shopee_category` VALUES ('2087', 'Chargers & Power Supply', '2083', '3', '7201');
INSERT INTO `shopee_category` VALUES ('2088', 'RAM', '2083', '3', '7198');
INSERT INTO `shopee_category` VALUES ('2089', 'Laptops', '2082', '2', null);
INSERT INTO `shopee_category` VALUES ('2090', 'Macbooks', '2089', '3', '7202');
INSERT INTO `shopee_category` VALUES ('2091', 'Notebooks', '2089', '3', '7203');
INSERT INTO `shopee_category` VALUES ('2092', 'Others', '2089', '3', '4820');
INSERT INTO `shopee_category` VALUES ('2093', 'Computer Accessories', '2082', '2', null);
INSERT INTO `shopee_category` VALUES ('2094', 'Mouse', '2093', '3', '7196');
INSERT INTO `shopee_category` VALUES ('2095', 'Keyboard', '2093', '3', '7197');
INSERT INTO `shopee_category` VALUES ('2096', 'Others', '2093', '3', '4823');
INSERT INTO `shopee_category` VALUES ('2097', 'Monitors', '2093', '3', '7195');
INSERT INTO `shopee_category` VALUES ('2098', 'Others', '2082', '2', null);
INSERT INTO `shopee_category` VALUES ('2099', 'Others', '2098', '3', '4817');
INSERT INTO `shopee_category` VALUES ('2100', 'Hard Drives & SSDs', '2082', '2', null);
INSERT INTO `shopee_category` VALUES ('2101', 'Solid State Drives', '2100', '3', '7193');
INSERT INTO `shopee_category` VALUES ('2102', 'External Hard Drives', '2100', '3', '7194');
INSERT INTO `shopee_category` VALUES ('2103', 'Others', '2100', '3', '4824');
INSERT INTO `shopee_category` VALUES ('2104', 'Printers & Projectors', '2082', '2', null);
INSERT INTO `shopee_category` VALUES ('2105', 'Others', '2104', '3', '4819');
INSERT INTO `shopee_category` VALUES ('2106', 'Printers', '2104', '3', '7204');
INSERT INTO `shopee_category` VALUES ('2107', 'Ink', '2104', '3', '7206');
INSERT INTO `shopee_category` VALUES ('2108', 'Projectors', '2104', '3', '7205');
INSERT INTO `shopee_category` VALUES ('2109', 'Network Components', '2082', '2', null);
INSERT INTO `shopee_category` VALUES ('2110', 'Others', '2109', '3', '4818');
INSERT INTO `shopee_category` VALUES ('2111', 'Modems & Routers', '2109', '3', '7208');
INSERT INTO `shopee_category` VALUES ('2112', 'Cables & Adapters', '2109', '3', '7207');
INSERT INTO `shopee_category` VALUES ('2113', 'Men\'s Shoes', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('2114', 'Others', '2113', '2', null);
INSERT INTO `shopee_category` VALUES ('2115', 'Others', '2114', '3', '4856');
INSERT INTO `shopee_category` VALUES ('2116', 'Sneakers', '2113', '2', null);
INSERT INTO `shopee_category` VALUES ('2117', 'Lace-Up', '2116', '3', '7136');
INSERT INTO `shopee_category` VALUES ('2118', 'Others', '2116', '3', '4857');
INSERT INTO `shopee_category` VALUES ('2119', 'Slip-On', '2116', '3', '7135');
INSERT INTO `shopee_category` VALUES ('2120', 'Sandals & Flip Flops', '2113', '2', null);
INSERT INTO `shopee_category` VALUES ('2121', 'Others', '2120', '3', '4861');
INSERT INTO `shopee_category` VALUES ('2122', 'Loafers & Boat Shoes', '2113', '2', null);
INSERT INTO `shopee_category` VALUES ('2123', 'Others', '2122', '3', '4860');
INSERT INTO `shopee_category` VALUES ('2124', 'Men\'s Leather Wear', '2113', '2', null);
INSERT INTO `shopee_category` VALUES ('2125', 'Others', '2124', '3', '4858');
INSERT INTO `shopee_category` VALUES ('2126', 'Sports Shoes', '2113', '2', null);
INSERT INTO `shopee_category` VALUES ('2127', 'Others', '2126', '3', '4859');
INSERT INTO `shopee_category` VALUES ('2128', 'Shoes Accessories', '2113', '2', null);
INSERT INTO `shopee_category` VALUES ('2129', 'Others', '2128', '3', '7138');
INSERT INTO `shopee_category` VALUES ('2130', 'Food', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('2131', 'Others', '2130', '2', null);
INSERT INTO `shopee_category` VALUES ('2132', 'Others', '2131', '3', '4881');
INSERT INTO `shopee_category` VALUES ('2133', 'Instant & Packaged Food', '2130', '2', null);
INSERT INTO `shopee_category` VALUES ('2134', 'Others', '2133', '3', '4884');
INSERT INTO `shopee_category` VALUES ('2135', 'Instant Food', '2133', '3', '7080');
INSERT INTO `shopee_category` VALUES ('2136', 'Canned Food', '2133', '3', '7081');
INSERT INTO `shopee_category` VALUES ('2137', 'Spice & Sauce', '2133', '3', '9354');
INSERT INTO `shopee_category` VALUES ('2138', 'Candy & Chocolate', '2130', '2', null);
INSERT INTO `shopee_category` VALUES ('2139', 'Candy', '2138', '3', '7082');
INSERT INTO `shopee_category` VALUES ('2140', 'Chocolate', '2138', '3', '7083');
INSERT INTO `shopee_category` VALUES ('2141', 'Others', '2138', '3', '4883');
INSERT INTO `shopee_category` VALUES ('2142', 'Snacks & Desserts', '2130', '2', null);
INSERT INTO `shopee_category` VALUES ('2143', 'Nuts & Dried Snacks', '2142', '3', '7075');
INSERT INTO `shopee_category` VALUES ('2144', 'Others', '2142', '3', '4886');
INSERT INTO `shopee_category` VALUES ('2145', 'Desserts', '2142', '3', '7077');
INSERT INTO `shopee_category` VALUES ('2146', 'Crackers & Cookies', '2142', '3', '7076');
INSERT INTO `shopee_category` VALUES ('2147', 'Beverages', '2130', '2', null);
INSERT INTO `shopee_category` VALUES ('2148', 'Coffee & Tea', '2147', '3', '7072');
INSERT INTO `shopee_category` VALUES ('2149', 'Others', '2147', '3', '4885');
INSERT INTO `shopee_category` VALUES ('2150', 'Sport & Soft Drinks', '2147', '3', '7074');
INSERT INTO `shopee_category` VALUES ('2151', 'Instant Drinks', '2147', '3', '7073');
INSERT INTO `shopee_category` VALUES ('2152', 'Home Appliances', '0', '1', null);
INSERT INTO `shopee_category` VALUES ('2153', 'Others', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2154', 'Others', '2153', '3', '10042');
INSERT INTO `shopee_category` VALUES ('2155', 'Small Kitchen Appliances', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2156', 'Food Preparation', '2155', '3', '10056');
INSERT INTO `shopee_category` VALUES ('2157', 'Others', '2155', '3', '10044');
INSERT INTO `shopee_category` VALUES ('2158', 'Water Boilers', '2155', '3', '10059');
INSERT INTO `shopee_category` VALUES ('2159', 'Rice Steamers', '2155', '3', '10058');
INSERT INTO `shopee_category` VALUES ('2160', 'Fruit Juicers', '2155', '3', '10057');
INSERT INTO `shopee_category` VALUES ('2161', 'Garment Care', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2162', 'Irons', '2161', '3', '10060');
INSERT INTO `shopee_category` VALUES ('2163', 'Sewing Machines', '2161', '3', '10062');
INSERT INTO `shopee_category` VALUES ('2164', 'Others', '2161', '3', '10046');
INSERT INTO `shopee_category` VALUES ('2165', 'Garment Steamers', '2161', '3', '10061');
INSERT INTO `shopee_category` VALUES ('2166', 'Cooling & Heating', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2167', 'Others', '2166', '3', '10049');
INSERT INTO `shopee_category` VALUES ('2168', 'Air Purifiers, Dehumidifiers & Humidifiers', '2166', '3', '10067');
INSERT INTO `shopee_category` VALUES ('2169', 'Air Conditioners & Air Coolers', '2166', '3', '10063');
INSERT INTO `shopee_category` VALUES ('2170', 'Fans', '2166', '3', '10068');
INSERT INTO `shopee_category` VALUES ('2171', 'Security & Surveillance', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2172', 'CCTV & IP Cameras', '2171', '3', '10074');
INSERT INTO `shopee_category` VALUES ('2173', 'Home Sensors & Alarms', '2171', '3', '10075');
INSERT INTO `shopee_category` VALUES ('2174', 'Others', '2171', '3', '10051');
INSERT INTO `shopee_category` VALUES ('2175', 'Home Entertainment', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2176', 'Others', '2175', '3', '10053');
INSERT INTO `shopee_category` VALUES ('2177', 'Large Appliances', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2178', 'Others', '2177', '3', '10055');
INSERT INTO `shopee_category` VALUES ('2179', 'Housekeeping & Improvement', '2152', '2', null);
INSERT INTO `shopee_category` VALUES ('2180', 'Vacuum Cleaner', '2179', '3', '10071');
INSERT INTO `shopee_category` VALUES ('2181', 'Robot Vacuums', '2179', '3', '10072');
INSERT INTO `shopee_category` VALUES ('2182', 'Power Tools & Accessories', '2179', '3', '10073');
INSERT INTO `shopee_category` VALUES ('2183', 'Others', '2179', '3', '10070');

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
