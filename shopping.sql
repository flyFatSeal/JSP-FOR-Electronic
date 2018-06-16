/*
Navicat MySQL Data Transfer

Source Server         : finish
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-06-16 13:30:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `SP_NO` int(4) NOT NULL AUTO_INCREMENT,
  `SP_NAME` varchar(20) NOT NULL,
  `SP_PRICE` varchar(20) NOT NULL,
  `BUY_NUM` varchar(20) DEFAULT NULL,
  `COUNT` varchar(20) NOT NULL,
  `IMG` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SP_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('102', 'Letchover女鞋008', '2695', '4', '10780.0', 'img/2.2.jpg');
INSERT INTO `cart` VALUES ('103', '商品', '1235.0', '3', '3705.0', 'img/3.jpg');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `SP_NO` int(4) NOT NULL AUTO_INCREMENT,
  `SP_NAME` varchar(20) DEFAULT NULL,
  `SP_PRICE` varchar(20) DEFAULT NULL,
  `SP_INFO` varchar(20) DEFAULT NULL,
  `SP_PIC1` varchar(20) DEFAULT NULL,
  `SP_PIC` varchar(20) DEFAULT NULL,
  `SP_A` varchar(20) DEFAULT NULL,
  `IMG` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SP_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1001', 'Letchover 女士夹克', '2695.0', 'bighead绝版夹克', 'img/1.1.jpg', 'img/1.jpg', 'shangpin1.jsp', 'img/1.1.jpg');
INSERT INTO `shop` VALUES ('1002', 'Letchover 女士夹克外套', '2688', 'bighead绝版休闲夹克', 'img/1.2.jpg', 'img/2.jpg', 'shangpin1.jsp', 'img/1.2.jpg');
INSERT INTO `shop` VALUES ('1003', 'Letchover 女士夹克02', '2399', 'bighead绝版花色夹克', 'img/1.3.jpg', 'img/3.jpg', 'shangpin1.jsp', 'img/1.3.jpg');
INSERT INTO `shop` VALUES ('1004', 'Letchover 女士夹克01', '3400', 'bighead绝版休闲白色夹克', 'img/1.4.jpg', 'img/4.jpg', 'shangpin1.jsp', 'img/1.4.jpg');
INSERT INTO `shop` VALUES ('1005', 'Letchover 女士夹克', '2695', 'bighead绝版油画夹克', 'img/1.5.jpg', 'img/5.jpg', 'shangpin1.jsp', 'img/1.5.jpg');
INSERT INTO `shop` VALUES ('1006', 'Letchover 女士夹克休闲01', '3200', 'bighead绝版花色夹克', 'img/1.6.jpg', 'img/6.jpg', 'shangpin1.jsp', 'img/1.6.jpg');
INSERT INTO `shop` VALUES ('1007', 'Letchover女鞋009', '2692.0', 'NIKE新式高跟鞋', 'img/1.7.jpg', 'img/xie1.jpg', 'shangpin1.jsp', 'img/2.1.jpg');
INSERT INTO `shop` VALUES ('1008', 'Letchover女鞋008', '2695', 'NIKE新式高跟鞋', 'img/1.8.jpg', 'img/xie2.jpg', 'shangpin1.jsp', 'img/2.2.jpg');
INSERT INTO `shop` VALUES ('1009', 'Letchover女鞋005', '2695', 'NIKE新式高跟鞋', 'img/1.9.jpg', 'img/xie3.jpg', 'shangpin1.jsp', 'img/2.3.jpg');
INSERT INTO `shop` VALUES ('1010', 'Letchover女鞋003', '2695', 'NIKE新式高跟鞋', 'img/1.10.jpg', 'img/xie4.jpg', 'shangpin1.jsp', 'img/2.4.jpg');
INSERT INTO `shop` VALUES ('1011', 'Letchover女鞋002', '2695', 'NIKE新式高跟鞋', 'img/1.11.jpg', 'img/xie5.jpg', 'shangpin1.jsp', 'img/2.5.jpg');
INSERT INTO `shop` VALUES ('1012', 'Letchover女鞋001', '2695', 'NIKE新式高跟鞋', 'img/1.12.jpg', 'img/xie6.jpg', 'shangpin1.jsp', 'img/2.6.jpg');
INSERT INTO `shop` VALUES ('1013', 'Letchover女包006', '2695', 'NIKE新式高跟鞋', 'img/1.13.jpg', 'img/bao1.jpg', 'shangpin1.jsp', 'img/bao1.jpg');
INSERT INTO `shop` VALUES ('1014', 'Letchover女包005', '2695', 'NIKE新式高跟鞋', 'img/1.14.jpg', 'img/bao2.jpg', 'shangpin1.jsp', 'img/bao2.jpg');
INSERT INTO `shop` VALUES ('1015', 'Letchover女包004', '2695', 'NIKE新式高跟鞋', 'img/1.15.jpg', 'img/bao3.jpg', 'shangpin1.jsp', 'img/bao3.jpg');
INSERT INTO `shop` VALUES ('1016', 'Letchover女包003', '2695', 'NIKE新式高跟鞋', 'img/1.16.jpg', 'img/bao4.jpg', 'shangpin1.jsp', 'img/bao4.jpg');
INSERT INTO `shop` VALUES ('1017', 'Letchover女包002', '2695', 'NIKE新式高跟鞋', 'img/1.17.jpg', 'img/bao5.jpg', 'shangpin1.jsp', 'img/bao5.jpg');
INSERT INTO `shop` VALUES ('1018', 'Letchover女包001', '2695', 'NIKE新式高跟鞋', 'img/1.18.jpg', 'img/bao6.jpg', 'shangpin1.jsp', 'img/bao6.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `eamil` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('AdvancedUser', 'Advance1234', 'Advance@123.com');
INSERT INTO `user` VALUES ('AminUser', 'admin1234', 'admin@123.com');
INSERT INTO `user` VALUES ('AverageUser', 'average1234', 'average@123.com');
INSERT INTO `user` VALUES ('DemoUser', 'demo1234', 'demo@123.com');
INSERT INTO `user` VALUES ('ModerateUser', 'Moderate1234', 'Moderate@123.com');
