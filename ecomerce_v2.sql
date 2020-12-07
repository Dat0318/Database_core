/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ecomerce_v2

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-09-17 10:50:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_cart`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cart`;
CREATE TABLE `tbl_cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idUser` int(10) DEFAULT NULL,
  `idProduct` int(10) DEFAULT NULL,
  `amount` tinyint(4) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_category`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `idParent` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_city`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE `tbl_city` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_city
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_district`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_district`;
CREATE TABLE `tbl_district` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_district
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_order`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `id` int(10) DEFAULT NULL,
  `idUser` int(10) DEFAULT NULL,
  `idProduct` int(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `idCity` int(10) DEFAULT NULL,
  `idDistrict` int(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_people`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_people`;
CREATE TABLE `tbl_people` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `avatar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_people
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_products`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE `tbl_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `longDescription` text DEFAULT NULL,
  `quality` int(5) DEFAULT NULL,
  `idCategory` int(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `imageDetails` varchar(255) DEFAULT NULL,
  `lastModified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(1) DEFAULT NULL,
  `amount` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_products
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_seller`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_seller`;
CREATE TABLE `tbl_seller` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position` tinyint(2) DEFAULT NULL,
  `id_people` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_seller
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_users`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `token` varchar(30) DEFAULT NULL,
  `id_people` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
