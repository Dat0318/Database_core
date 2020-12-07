/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : baominh_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-09-17 10:18:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ap_account`
-- ----------------------------
DROP TABLE IF EXISTS `ap_account`;
CREATE TABLE `ap_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_provider` varchar(50) DEFAULT NULL COMMENT 'Tên social',
  `oauth_uid` varchar(100) DEFAULT NULL COMMENT 'uid',
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL COMMENT '1:hoạt động: 0 Ngừng hoạt động,2:chuyển về thùng rác',
  `full_name` varchar(100) DEFAULT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  `updated_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `avatar` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` tinyint(3) DEFAULT 1 COMMENT '1: Nam 2: Nữ 3: Còn lại',
  `birthday` date DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_account
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_account_groups`
-- ----------------------------
DROP TABLE IF EXISTS `ap_account_groups`;
CREATE TABLE `ap_account_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL COMMENT '1:học viên, 2 giảng viên, 3 cộng tác viên',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE,
  KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE,
  KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_account_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_banner`
-- ----------------------------
DROP TABLE IF EXISTS `ap_banner`;
CREATE TABLE `ap_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(5) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `is_status` tinyint(1) unsigned NOT NULL DEFAULT 2 COMMENT 'trang thai',
  `displayed_time` datetime NOT NULL COMMENT 'ngay publish',
  `created_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngay tao',
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'ngay sua',
  `mobile_thumbnail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_banner
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_banner_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_banner_translations`;
CREATE TABLE `ap_banner_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_banner_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_banner_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_candidate`
-- ----------------------------
DROP TABLE IF EXISTS `ap_candidate`;
CREATE TABLE `ap_candidate` (
  `career_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `file_cv` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `is_readed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_candidate
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_career`
-- ----------------------------
DROP TABLE IF EXISTS `ap_career`;
CREATE TABLE `ap_career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `file_cv` varchar(255) DEFAULT NULL,
  `file_letter` varchar(255) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `salary` varchar(50) DEFAULT NULL,
  `deadline` date NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location_id` tinyint(1) DEFAULT NULL,
  `type_id` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_career
-- ----------------------------
INSERT INTO `ap_career` VALUES ('1', '', null, null, '', null, null, null, '2020-02-26 10:48:04', '2020-02-26 10:48:04', '', '2020-05-30', null, null, null);

-- ----------------------------
-- Table structure for `ap_career_category`
-- ----------------------------
DROP TABLE IF EXISTS `ap_career_category`;
CREATE TABLE `ap_career_category` (
  `career_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`career_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_career_category
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_career_property`
-- ----------------------------
DROP TABLE IF EXISTS `ap_career_property`;
CREATE TABLE `ap_career_property` (
  `career_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`career_id`,`property_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_career_property
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_career_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_career_translations`;
CREATE TABLE `ap_career_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `content_more` text DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_post_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_career_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_category`
-- ----------------------------
DROP TABLE IF EXISTS `ap_category`;
CREATE TABLE `ap_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `thumbnail` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_featured` varchar(255) DEFAULT NULL COMMENT 'Background for parent_id = 0',
  `style` varchar(255) DEFAULT NULL COMMENT 'style html',
  `class` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'post' COMMENT 'type theo đúng tên controller',
  `order` int(3) DEFAULT 0,
  `is_status` tinyint(2) NOT NULL DEFAULT 1,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `album` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_category
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_category_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_category_translations`;
CREATE TABLE `ap_category_translations` (
  `id` int(11) NOT NULL,
  `language_code` char(2) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `banner_adv` varchar(255) DEFAULT NULL,
  `thumb_home` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_category_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_category_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_contact`
-- ----------------------------
DROP TABLE IF EXISTS `ap_contact`;
CREATE TABLE `ap_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(250) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  `title` varchar(250) DEFAULT NULL,
  `company` varchar(259) DEFAULT NULL,
  `country` varchar(259) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_contact
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_country`
-- ----------------------------
DROP TABLE IF EXISTS `ap_country`;
CREATE TABLE `ap_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_country
-- ----------------------------
INSERT INTO `ap_country` VALUES ('1', 'Afghanistan', '+93', 'AF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('2', 'Aland Islands', '+358', 'AX', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('3', 'Albania', '+355', 'AL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('4', 'Algeria', '+213', 'DZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('5', 'AmericanSamoa', '+1 684', 'AS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('6', 'Andorra', '+376', 'AD', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('7', 'Angola', '+244', 'AO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('8', 'Anguilla', '+1 264', 'AI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('9', 'Antarctica', '+672', 'AQ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('10', 'Antigua and Barbuda', '+1268', 'AG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('11', 'Argentina', '+54', 'AR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('12', 'Armenia', '+374', 'AM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('13', 'Aruba', '+297', 'AW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('14', 'Australia', '+61', 'AU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('15', 'Austria', '+43', 'AT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('16', 'Azerbaijan', '+994', 'AZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('17', 'Bahamas', '+1 242', 'BS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('18', 'Bahrain', '+973', 'BH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('19', 'Bangladesh', '+880', 'BD', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('20', 'Barbados', '+1 246', 'BB', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('21', 'Belarus', '+375', 'BY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('22', 'Belgium', '+32', 'BE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('23', 'Belize', '+501', 'BZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('24', 'Benin', '+229', 'BJ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('25', 'Bermuda', '+1 441', 'BM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('26', 'Bhutan', '+975', 'BT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('27', 'Bolivia, Plurinational State of', '+591', 'BO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('28', 'Bosnia and Herzegovina', '+387', 'BA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('29', 'Botswana', '+267', 'BW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('30', 'Brazil', '+55', 'BR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('31', 'British Indian Ocean Territory', '+246', 'IO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('32', 'Brunei Darussalam', '+673', 'BN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('33', 'Bulgaria', '+359', 'BG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('34', 'Burkina Faso', '+226', 'BF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('35', 'Burundi', '+257', 'BI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('36', 'Cambodia', '+855', 'KH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('37', 'Cameroon', '+237', 'CM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('38', 'Canada', '+1', 'CA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('39', 'Cape Verde', '+238', 'CV', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('40', 'Cayman Islands', '+ 345', 'KY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('41', 'Central African Republic', '+236', 'CF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('42', 'Chad', '+235', 'TD', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('43', 'Chile', '+56', 'CL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('44', 'China', '+86', 'CN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('45', 'Christmas Island', '+61', 'CX', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('46', 'Cocos (Keeling) Islands', '+61', 'CC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('47', 'Colombia', '+57', 'CO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('48', 'Comoros', '+269', 'KM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('49', 'Congo', '+242', 'CG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('50', 'Congo, The Democratic Republic of the Congo', '+243', 'CD', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('51', 'Cook Islands', '+682', 'CK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('52', 'Costa Rica', '+506', 'CR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('53', 'Cote d\'Ivoire', '+225', 'CI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('54', 'Croatia', '+385', 'HR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('55', 'Cuba', '+53', 'CU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('56', 'Cyprus', '+357', 'CY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('57', 'Czech Republic', '+420', 'CZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('58', 'Denmark', '+45', 'DK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('59', 'Djibouti', '+253', 'DJ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('60', 'Dominica', '+1 767', 'DM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('61', 'Dominican Republic', '+1 849', 'DO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('62', 'Ecuador', '+593', 'EC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('63', 'Egypt', '+20', 'EG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('64', 'El Salvador', '+503', 'SV', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('65', 'Equatorial Guinea', '+240', 'GQ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('66', 'Eritrea', '+291', 'ER', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('67', 'Estonia', '+372', 'EE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('68', 'Ethiopia', '+251', 'ET', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('69', 'Falkland Islands (Malvinas)', '+500', 'FK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('70', 'Faroe Islands', '+298', 'FO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('71', 'Fiji', '+679', 'FJ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('72', 'Finland', '+358', 'FI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('73', 'France', '+33', 'FR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('74', 'French Guiana', '+594', 'GF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('75', 'French Polynesia', '+689', 'PF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('76', 'Gabon', '+241', 'GA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('77', 'Gambia', '+220', 'GM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('78', 'Georgia', '+995', 'GE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('79', 'Germany', '+49', 'DE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('80', 'Ghana', '+233', 'GH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('81', 'Gibraltar', '+350', 'GI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('82', 'Greece', '+30', 'GR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('83', 'Greenland', '+299', 'GL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('84', 'Grenada', '+1 473', 'GD', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('85', 'Guadeloupe', '+590', 'GP', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('86', 'Guam', '+1 671', 'GU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('87', 'Guatemala', '+502', 'GT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('88', 'Guernsey', '+44', 'GG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('89', 'Guinea', '+224', 'GN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('90', 'Guinea-Bissau', '+245', 'GW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('91', 'Guyana', '+595', 'GY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('92', 'Haiti', '+509', 'HT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('93', 'Holy See (Vatican City State)', '+379', 'VA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('94', 'Honduras', '+504', 'HN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('95', 'Hong Kong', '+852', 'HK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('96', 'Hungary', '+36', 'HU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('97', 'Iceland', '+354', 'IS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('98', 'India', '+91', 'IN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('99', 'Indonesia', '+62', 'ID', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('100', 'Iran, Islamic Republic of Persian Gulf', '+98', 'IR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('101', 'Iraq', '+964', 'IQ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('102', 'Ireland', '+353', 'IE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('103', 'Isle of Man', '+44', 'IM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('104', 'Israel', '+972', 'IL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('105', 'Italy', '+39', 'IT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('106', 'Jamaica', '+1 876', 'JM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('107', 'Japan', '+81', 'JP', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('108', 'Jersey', '+44', 'JE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('109', 'Jordan', '+962', 'JO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('110', 'Kazakhstan', '+7 7', 'KZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('111', 'Kenya', '+254', 'KE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('112', 'Kiribati', '+686', 'KI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('113', 'Korea, Democratic People\'s Republic of Korea', '+850', 'KP', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('114', 'Korea, Republic of South Korea', '+82', 'KR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('115', 'Kuwait', '+965', 'KW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('116', 'Kyrgyzstan', '+996', 'KG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('117', 'Laos', '+856', 'LA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('118', 'Latvia', '+371', 'LV', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('119', 'Lebanon', '+961', 'LB', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('120', 'Lesotho', '+266', 'LS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('121', 'Liberia', '+231', 'LR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('122', 'Libyan Arab Jamahiriya', '+218', 'LY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('123', 'Liechtenstein', '+423', 'LI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('124', 'Lithuania', '+370', 'LT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('125', 'Luxembourg', '+352', 'LU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('126', 'Macao', '+853', 'MO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('127', 'Macedonia', '+389', 'MK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('128', 'Madagascar', '+261', 'MG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('129', 'Malawi', '+265', 'MW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('130', 'Malaysia', '+60', 'MY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('131', 'Maldives', '+960', 'MV', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('132', 'Mali', '+223', 'ML', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('133', 'Malta', '+356', 'MT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('134', 'Marshall Islands', '+692', 'MH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('135', 'Martinique', '+596', 'MQ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('136', 'Mauritania', '+222', 'MR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('137', 'Mauritius', '+230', 'MU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('138', 'Mayotte', '+262', 'YT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('139', 'Mexico', '+52', 'MX', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('140', 'Micronesia, Federated States of Micronesia', '+691', 'FM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('141', 'Moldova', '+373', 'MD', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('142', 'Monaco', '+377', 'MC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('143', 'Mongolia', '+976', 'MN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('144', 'Montenegro', '+382', 'ME', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('145', 'Montserrat', '+1664', 'MS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('146', 'Morocco', '+212', 'MA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('147', 'Mozambique', '+258', 'MZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('148', 'Myanmar', '+95', 'MM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('149', 'Namibia', '+264', 'NA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('150', 'Nauru', '+674', 'NR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('151', 'Nepal', '+977', 'NP', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('152', 'Netherlands', '+31', 'NL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('153', 'Netherlands Antilles', '+599', 'AN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('154', 'New Caledonia', '+687', 'NC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('155', 'New Zealand', '+64', 'NZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('156', 'Nicaragua', '+505', 'NI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('157', 'Niger', '+227', 'NE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('158', 'Nigeria', '+234', 'NG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('159', 'Niue', '+683', 'NU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('160', 'Norfolk Island', '+672', 'NF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('161', 'Northern Mariana Islands', '+1 670', 'MP', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('162', 'Norway', '+47', 'NO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('163', 'Oman', '+968', 'OM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('164', 'Pakistan', '+92', 'PK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('165', 'Palau', '+680', 'PW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('166', 'Palestinian Territory, Occupied', '+970', 'PS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('167', 'Panama', '+507', 'PA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('168', 'Papua New Guinea', '+675', 'PG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('169', 'Paraguay', '+595', 'PY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('170', 'Peru', '+51', 'PE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('171', 'Philippines', '+63', 'PH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('172', 'Pitcairn', '+872', 'PN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('173', 'Poland', '+48', 'PL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('174', 'Portugal', '+351', 'PT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('175', 'Puerto Rico', '+1 939', 'PR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('176', 'Qatar', '+974', 'QA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('177', 'Romania', '+40', 'RO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('178', 'Russia', '+7', 'RU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('179', 'Rwanda', '+250', 'RW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('180', 'Reunion', '+262', 'RE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('181', 'Saint Barthelemy', '+590', 'BL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('182', 'Saint Helena, Ascension and Tristan Da Cunha', '+290', 'SH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('183', 'Saint Kitts and Nevis', '+1 869', 'KN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('184', 'Saint Lucia', '+1 758', 'LC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('185', 'Saint Martin', '+590', 'MF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('186', 'Saint Pierre and Miquelon', '+508', 'PM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('187', 'Saint Vincent and the Grenadines', '+1 784', 'VC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('188', 'Samoa', '+685', 'WS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('189', 'San Marino', '+378', 'SM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('190', 'Sao Tome and Principe', '+239', 'ST', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('191', 'Saudi Arabia', '+966', 'SA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('192', 'Senegal', '+221', 'SN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('193', 'Serbia', '+381', 'RS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('194', 'Seychelles', '+248', 'SC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('195', 'Sierra Leone', '+232', 'SL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('196', 'Singapore', '+65', 'SG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('197', 'Slovakia', '+421', 'SK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('198', 'Slovenia', '+386', 'SI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('199', 'Solomon Islands', '+677', 'SB', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('200', 'Somalia', '+252', 'SO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('201', 'South Africa', '+27', 'ZA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('202', 'South Georgia and the South Sandwich Islands', '+500', 'GS', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('203', 'Spain', '+34', 'ES', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('204', 'Sri Lanka', '+94', 'LK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('205', 'Sudan', '+249', 'SD', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('206', 'Suriname', '+597', 'SR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('207', 'Svalbard and Jan Mayen', '+47', 'SJ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('208', 'Swaziland', '+268', 'SZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('209', 'Sweden', '+46', 'SE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('210', 'Switzerland', '+41', 'CH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('211', 'Syrian Arab Republic', '+963', 'SY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('212', 'Taiwan', '+886', 'TW', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('213', 'Tajikistan', '+992', 'TJ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('214', 'Tanzania, United Republic of Tanzania', '+255', 'TZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('215', 'Thailand', '+66', 'TH', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('216', 'Timor-Leste', '+670', 'TL', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('217', 'Togo', '+228', 'TG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('218', 'Tokelau', '+690', 'TK', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('219', 'Tonga', '+676', 'TO', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('220', 'Trinidad and Tobago', '+1 868', 'TT', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('221', 'Tunisia', '+216', 'TN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('222', 'Turkey', '+90', 'TR', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('223', 'Turkmenistan', '+993', 'TM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('224', 'Turks and Caicos Islands', '+1 649', 'TC', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('225', 'Tuvalu', '+688', 'TV', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('226', 'Uganda', '+256', 'UG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('227', 'Ukraine', '+380', 'UA', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('228', 'United Arab Emirates', '+971', 'AE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('229', 'United Kingdom', '+44', 'GB', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('230', 'United States', '+1', 'US', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('231', 'Uruguay', '+598', 'UY', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('232', 'Uzbekistan', '+998', 'UZ', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('233', 'Vanuatu', '+678', 'VU', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('234', 'Venezuela, Bolivarian Republic of Venezuela', '+58', 'VE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('235', 'Vietnam', '+84', 'VN', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('236', 'Virgin Islands, British', '+1 284', 'VG', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('237', 'Virgin Islands, U.S.', '+1 340', 'VI', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('238', 'Wallis and Futuna', '+681', 'WF', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('239', 'Yemen', '+967', 'YE', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('240', 'Zambia', '+260', 'ZM', null, null, null, '2020-03-07 10:11:23');
INSERT INTO `ap_country` VALUES ('241', 'Zimbabwe', '+263', 'ZW', null, null, null, '2020-03-07 10:11:23');

-- ----------------------------
-- Table structure for `ap_district`
-- ----------------------------
DROP TABLE IF EXISTS `ap_district`;
CREATE TABLE `ap_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `province_code` int(11) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_district
-- ----------------------------
INSERT INTO `ap_district` VALUES ('1', '22107', 'Huyện Lục Ngạn', '221', '0');
INSERT INTO `ap_district` VALUES ('2', '10103', 'Quận Tây Hồ', '101', '0');
INSERT INTO `ap_district` VALUES ('3', '10111', 'Quận Thanh Xuân', '101', '0');
INSERT INTO `ap_district` VALUES ('4', '10129', 'Thị xã Sơn Tây', '101', '0');
INSERT INTO `ap_district` VALUES ('5', '70139', 'Huyện Bình Chánh', '701', '0');
INSERT INTO `ap_district` VALUES ('6', '70143', 'Huyện Cần Giờ', '701', '0');
INSERT INTO `ap_district` VALUES ('7', '70135', 'Huyện Củ Chi', '701', '0');
INSERT INTO `ap_district` VALUES ('8', '70137', 'Huyện Hóc Môn', '701', '0');
INSERT INTO `ap_district` VALUES ('9', '70141', 'Huyện Nhà Bè', '701', '0');
INSERT INTO `ap_district` VALUES ('10', '70101', 'Quận 1', '701', '0');
INSERT INTO `ap_district` VALUES ('11', '70119', 'Quận 10', '701', '0');
INSERT INTO `ap_district` VALUES ('12', '70121', 'Quận 11', '701', '0');
INSERT INTO `ap_district` VALUES ('13', '70123', 'Quận 12', '701', '0');
INSERT INTO `ap_district` VALUES ('14', '70103', 'Quận 2', '701', '0');
INSERT INTO `ap_district` VALUES ('15', '70105', 'Quận 3', '701', '0');
INSERT INTO `ap_district` VALUES ('16', '70107', 'Quận 4', '701', '0');
INSERT INTO `ap_district` VALUES ('17', '70109', 'Quận 5', '701', '0');
INSERT INTO `ap_district` VALUES ('18', '70111', 'Quận 6', '701', '0');
INSERT INTO `ap_district` VALUES ('19', '70113', 'Quận 7', '701', '0');
INSERT INTO `ap_district` VALUES ('20', '70115', 'Quận 8', '701', '0');
INSERT INTO `ap_district` VALUES ('21', '70117', 'Quận 9', '701', '0');
INSERT INTO `ap_district` VALUES ('22', '70134', 'Quận Bình Tân', '701', '0');
INSERT INTO `ap_district` VALUES ('23', '70129', 'Quận Bình Thạnh', '701', '0');
INSERT INTO `ap_district` VALUES ('24', '70125', 'Quận Gò Vấp', '701', '0');
INSERT INTO `ap_district` VALUES ('25', '70131', 'Quận Phú Nhuận', '701', '0');
INSERT INTO `ap_district` VALUES ('26', '70127', 'Quận Tân Bình', '701', '0');
INSERT INTO `ap_district` VALUES ('27', '70128', 'Quận Tân Phú', '701', '0');
INSERT INTO `ap_district` VALUES ('28', '80505', 'Huyện An Phú', '805', '0');
INSERT INTO `ap_district` VALUES ('29', '80511', 'Huyện Châu Phú', '805', '0');
INSERT INTO `ap_district` VALUES ('30', '80519', 'Huyện Châu Thành', '805', '0');
INSERT INTO `ap_district` VALUES ('31', '80517', 'Huyện Chợ Mới', '805', '0');
INSERT INTO `ap_district` VALUES ('32', '80509', 'Huyện Phú Tân', '805', '0');
INSERT INTO `ap_district` VALUES ('33', '80507', 'Huyện Tân Châu', '805', '0');
INSERT INTO `ap_district` VALUES ('34', '80521', 'Huyện Thoại Sơn', '805', '0');
INSERT INTO `ap_district` VALUES ('35', '80513', 'Huyện Tịnh Biên', '805', '0');
INSERT INTO `ap_district` VALUES ('36', '80515', 'Huyện Tri Tôn', '805', '0');
INSERT INTO `ap_district` VALUES ('37', '80501', 'Thành phố Long Xuyên', '805', '0');
INSERT INTO `ap_district` VALUES ('38', '80503', 'Thị xã Châu Đốc', '805', '0');
INSERT INTO `ap_district` VALUES ('39', '71705', 'Huyện Châu Đức', '717', '0');
INSERT INTO `ap_district` VALUES ('40', '71713', 'Huyện Côn Đảo', '717', '0');
INSERT INTO `ap_district` VALUES ('41', '71712', 'Huyện Đất Đỏ', '717', '0');
INSERT INTO `ap_district` VALUES ('42', '71711', 'Huyện Long Điền', '717', '0');
INSERT INTO `ap_district` VALUES ('43', '71709', 'Huyện Tân Thành', '717', '0');
INSERT INTO `ap_district` VALUES ('44', '71707', 'Huyện Xuyên Mộc', '717', '0');
INSERT INTO `ap_district` VALUES ('45', '71701', 'Thành phố Vũng Tầu', '717', '0');
INSERT INTO `ap_district` VALUES ('46', '71703', 'Thị xã Bà Rịa', '717', '0');
INSERT INTO `ap_district` VALUES ('47', '20703', 'Huyện Ba Bể', '207', '0');
INSERT INTO `ap_district` VALUES ('48', '20711', 'Huyện Bạch Thông', '207', '0');
INSERT INTO `ap_district` VALUES ('49', '20707', 'Huyện Chợ Đồn', '207', '0');
INSERT INTO `ap_district` VALUES ('50', '20713', 'Huyện Chợ Mới', '207', '0');
INSERT INTO `ap_district` VALUES ('51', '20709', 'Huyện Na Rì', '207', '0');
INSERT INTO `ap_district` VALUES ('52', '20705', 'Huyện Ngân Sơn', '207', '0');
INSERT INTO `ap_district` VALUES ('53', '20704', 'Huyện Pác Nặm', '207', '0');
INSERT INTO `ap_district` VALUES ('54', '20701', 'Thị xã Bắc Kạn', '207', '0');
INSERT INTO `ap_district` VALUES ('55', '22109', 'Huyện Hiệp Hòa', '221', '0');
INSERT INTO `ap_district` VALUES ('56', '22111', 'Huyện Lạng Giang', '221', '0');
INSERT INTO `ap_district` VALUES ('57', '22115', 'Huyện Lục Nam', '221', '0');
INSERT INTO `ap_district` VALUES ('58', '22113', 'Huyện Sơn Động', '221', '0');
INSERT INTO `ap_district` VALUES ('59', '22105', 'Huyện Tân Yên', '221', '0');
INSERT INTO `ap_district` VALUES ('60', '22117', 'Huyện Việt Yên', '221', '0');
INSERT INTO `ap_district` VALUES ('61', '22119', 'Huyện Yên Dũng', '221', '0');
INSERT INTO `ap_district` VALUES ('62', '22103', 'Huyện Yên Thế', '221', '0');
INSERT INTO `ap_district` VALUES ('63', '22101', 'Thành phố Bắc Giang', '221', '0');
INSERT INTO `ap_district` VALUES ('64', '82111', 'Huyện Đông Hải', '821', '0');
INSERT INTO `ap_district` VALUES ('65', '82107', 'Huyện Giá Rai', '821', '0');
INSERT INTO `ap_district` VALUES ('66', '82106', 'Huyện Hòa Bình', '821', '0');
INSERT INTO `ap_district` VALUES ('67', '82103', 'Huyện Hồng Dân', '821', '0');
INSERT INTO `ap_district` VALUES ('68', '82109', 'Huyện Phước Long', '821', '0');
INSERT INTO `ap_district` VALUES ('69', '82105', 'Huyện Vĩnh Lợi', '821', '0');
INSERT INTO `ap_district` VALUES ('70', '82101', 'Thị xã Bạc Liêu', '821', '0');
INSERT INTO `ap_district` VALUES ('71', '22315', 'Huyện Gia Bình', '223', '0');
INSERT INTO `ap_district` VALUES ('72', '22311', 'Huyện Lương Tài', '223', '0');
INSERT INTO `ap_district` VALUES ('73', '22305', 'Huyện Quế Võ', '223', '0');
INSERT INTO `ap_district` VALUES ('74', '22309', 'Huyện Thuận Thành', '223', '0');
INSERT INTO `ap_district` VALUES ('75', '22307', 'Huyện Tiên Du', '223', '0');
INSERT INTO `ap_district` VALUES ('76', '22303', 'Huyện Yên Phong', '223', '0');
INSERT INTO `ap_district` VALUES ('77', '22301', 'Thành phố Bắc Ninh', '223', '0');
INSERT INTO `ap_district` VALUES ('78', '22313', 'Thị xã Từ Sơn', '223', '0');
INSERT INTO `ap_district` VALUES ('79', '81113', 'Huyện Ba Tri', '811', '0');
INSERT INTO `ap_district` VALUES ('80', '81111', 'Huyện Bình Đại', '811', '0');
INSERT INTO `ap_district` VALUES ('81', '81103', 'Huyện Châu Thành', '811', '0');
INSERT INTO `ap_district` VALUES ('82', '81105', 'Huyện Chợ Lách', '811', '0');
INSERT INTO `ap_district` VALUES ('83', '81109', 'Huyện Giồng Trôm', '811', '0');
INSERT INTO `ap_district` VALUES ('84', '81108', 'Huyện Mỏ Cày Bắc', '811', '0');
INSERT INTO `ap_district` VALUES ('85', '81107', 'Huyện Mỏ Cày Nam', '811', '0');
INSERT INTO `ap_district` VALUES ('86', '81115', 'Huyện Thạnh Phú', '811', '0');
INSERT INTO `ap_district` VALUES ('87', '81101', 'Thị xã Bến Tre', '811', '0');
INSERT INTO `ap_district` VALUES ('88', '50703', 'Huyện An Lão', '507', '0');
INSERT INTO `ap_district` VALUES ('89', '50717', 'Huyện An Nhơn', '507', '0');
INSERT INTO `ap_district` VALUES ('90', '50707', 'Huyện Hoài Ân', '507', '0');
INSERT INTO `ap_district` VALUES ('91', '50705', 'Huyện Hoài Nhơn', '507', '0');
INSERT INTO `ap_district` VALUES ('92', '50713', 'Huyện Phù Cát', '507', '0');
INSERT INTO `ap_district` VALUES ('93', '50709', 'Huyện Phù Mỹ', '507', '0');
INSERT INTO `ap_district` VALUES ('94', '50715', 'Huyện Tây Sơn', '507', '0');
INSERT INTO `ap_district` VALUES ('95', '50719', 'Huyện Tuy Phước', '507', '0');
INSERT INTO `ap_district` VALUES ('96', '50721', 'Huyện Vân Canh', '507', '0');
INSERT INTO `ap_district` VALUES ('97', '50711', 'Huyện Vĩnh Thạnh', '507', '0');
INSERT INTO `ap_district` VALUES ('98', '50701', 'Thành phố Quy Nhơn', '507', '0');
INSERT INTO `ap_district` VALUES ('99', '71103', 'Huyện Bến Cát', '711', '0');
INSERT INTO `ap_district` VALUES ('100', '71113', 'Huyện Dầu Tiếng', '711', '0');
INSERT INTO `ap_district` VALUES ('101', '71109', 'Huyện Dĩ An', '711', '0');
INSERT INTO `ap_district` VALUES ('102', '71111', 'Huyện Phú Giáo', '711', '0');
INSERT INTO `ap_district` VALUES ('103', '71105', 'Huyện Tân Uyên', '711', '0');
INSERT INTO `ap_district` VALUES ('104', '71107', 'Huyện Thuận An', '711', '0');
INSERT INTO `ap_district` VALUES ('105', '71101', 'Thị xã Thủ Dầu Một', '711', '0');
INSERT INTO `ap_district` VALUES ('106', '70709', 'Huyện Bình Long', '707', '0');
INSERT INTO `ap_district` VALUES ('107', '70707', 'Huyện Bù Đăng', '707', '0');
INSERT INTO `ap_district` VALUES ('108', '70706', 'Huyện Bù Đốp', '707', '0');
INSERT INTO `ap_district` VALUES ('109', '70710', 'Huyện Chơn Thành', '707', '0');
INSERT INTO `ap_district` VALUES ('110', '70701', 'Huyện Đồng Phù', '707', '0');
INSERT INTO `ap_district` VALUES ('111', '70705', 'Huyện Lộc Ninh', '707', '0');
INSERT INTO `ap_district` VALUES ('112', '70703', 'Huyện Phước Long', '707', '0');
INSERT INTO `ap_district` VALUES ('113', '70711', 'Thị xã Đồng Xoài', '707', '0');
INSERT INTO `ap_district` VALUES ('114', '71505', 'Huyện Bắc Bình', '715', '0');
INSERT INTO `ap_district` VALUES ('115', '71515', 'Huyện Đức Linh', '715', '0');
INSERT INTO `ap_district` VALUES ('116', '71514', 'Huyện Hàm Tân', '715', '0');
INSERT INTO `ap_district` VALUES ('117', '71507', 'Huyện Hàm Thuận Bắc', '715', '0');
INSERT INTO `ap_district` VALUES ('118', '71509', 'Huyện Hàm Thuận Nam', '715', '0');
INSERT INTO `ap_district` VALUES ('119', '71517', 'Huyện Phú Quí', '715', '0');
INSERT INTO `ap_district` VALUES ('120', '71511', 'Huyện Tánh Linh', '715', '0');
INSERT INTO `ap_district` VALUES ('121', '71503', 'Huyện Tuy Phong', '715', '0');
INSERT INTO `ap_district` VALUES ('122', '71501', 'Thành phố Phan Thiết', '715', '0');
INSERT INTO `ap_district` VALUES ('123', '71513', 'Thị xã Lagi', '715', '0');
INSERT INTO `ap_district` VALUES ('124', '82309', 'Huyện Cái Nước', '823', '0');
INSERT INTO `ap_district` VALUES ('125', '82311', 'Huyện Đầm Dơi', '823', '0');
INSERT INTO `ap_district` VALUES ('126', '82312', 'Huyện Năm Căn', '823', '0');
INSERT INTO `ap_district` VALUES ('127', '82313', 'Huyện Ngọc Hiển', '823', '0');
INSERT INTO `ap_district` VALUES ('128', '82308', 'Huyện Phú Tân', '823', '0');
INSERT INTO `ap_district` VALUES ('129', '82303', 'Huyện Thới Bình', '823', '0');
INSERT INTO `ap_district` VALUES ('130', '82307', 'Huyện Trần Văn Thời', '823', '0');
INSERT INTO `ap_district` VALUES ('131', '82305', 'Huyện U Minh', '823', '0');
INSERT INTO `ap_district` VALUES ('132', '82301', 'Thành phố Cà Mau', '823', '0');
INSERT INTO `ap_district` VALUES ('133', '80319', 'Huyện Lai Vung', '803', '0');
INSERT INTO `ap_district` VALUES ('134', '81527', 'Huyện Cờ Đỏ', '815', '0');
INSERT INTO `ap_district` VALUES ('135', '81529', 'Huyện Phong Điền', '815', '0');
INSERT INTO `ap_district` VALUES ('136', '81531', 'Huyện Thới Lai', '815', '0');
INSERT INTO `ap_district` VALUES ('137', '81525', 'Huyện Vĩnh Thạnh', '815', '0');
INSERT INTO `ap_district` VALUES ('138', '81521', 'Quận Bình Thuỷ', '815', '0');
INSERT INTO `ap_district` VALUES ('139', '81523', 'Quận Cái Răng', '815', '0');
INSERT INTO `ap_district` VALUES ('140', '81519', 'Quận Ninh Kiều', '815', '0');
INSERT INTO `ap_district` VALUES ('141', '81505', 'Quận Ô Môn', '815', '0');
INSERT INTO `ap_district` VALUES ('142', '81503', 'Quận Thốt Nốt', '815', '0');
INSERT INTO `ap_district` VALUES ('143', '20303', 'Huyện Bảo Lạc', '203', '0');
INSERT INTO `ap_district` VALUES ('144', '20319', 'Huyện Hạ Lang', '203', '0');
INSERT INTO `ap_district` VALUES ('145', '20305', 'Huyện Hà Quảng', '203', '0');
INSERT INTO `ap_district` VALUES ('146', '20315', 'Huyện Hoà An', '203', '0');
INSERT INTO `ap_district` VALUES ('147', '20313', 'Huyện Nguyên Bình', '203', '0');
INSERT INTO `ap_district` VALUES ('148', '20318', 'Huyện Phục Hoà', '203', '0');
INSERT INTO `ap_district` VALUES ('149', '20317', 'Huyện Quảng Uyên', '203', '0');
INSERT INTO `ap_district` VALUES ('150', '20321', 'Huyện Thạch An', '203', '0');
INSERT INTO `ap_district` VALUES ('151', '20307', 'Huyện Thông Nông', '203', '0');
INSERT INTO `ap_district` VALUES ('152', '20309', 'Huyện Trà Lĩnh', '203', '0');
INSERT INTO `ap_district` VALUES ('153', '20311', 'Huyện Trùng Khánh', '203', '0');
INSERT INTO `ap_district` VALUES ('154', '20323', 'Huyện Bảo Lâm', '203', '0');
INSERT INTO `ap_district` VALUES ('155', '20301', 'Thị xã Cao Bằng', '203', '0');
INSERT INTO `ap_district` VALUES ('156', '50111', 'Huyện Hoà Vang', '501', '0');
INSERT INTO `ap_district` VALUES ('157', '50113', 'Huyện Hoàng Sa', '501', '0');
INSERT INTO `ap_district` VALUES ('158', '50115', 'Quận Cẩm Lệ', '501', '0');
INSERT INTO `ap_district` VALUES ('159', '50101', 'Quận Hải Châu', '501', '0');
INSERT INTO `ap_district` VALUES ('160', '50109', 'Quận Liên Chiểu', '501', '0');
INSERT INTO `ap_district` VALUES ('161', '50107', 'Quận Ngũ Hành Sơn', '501', '0');
INSERT INTO `ap_district` VALUES ('162', '50105', 'Quận Sơn Trà', '501', '0');
INSERT INTO `ap_district` VALUES ('163', '50103', 'Quận Thanh Khê', '501', '0');
INSERT INTO `ap_district` VALUES ('164', '60511', 'Huyện Buôn Đôn', '605', '0');
INSERT INTO `ap_district` VALUES ('165', '60537', 'Huyện Cư Kuin', '605', '0');
INSERT INTO `ap_district` VALUES ('166', '60513', 'Huyện Cư M-gar', '605', '0');
INSERT INTO `ap_district` VALUES ('167', '60503', 'Huyện Ea H-leo', '605', '0');
INSERT INTO `ap_district` VALUES ('168', '60515', 'Huyện Ea Kar', '605', '0');
INSERT INTO `ap_district` VALUES ('169', '60505', 'Huyện Ea Súp', '605', '0');
INSERT INTO `ap_district` VALUES ('170', '60523', 'Huyện Krông A Na', '605', '0');
INSERT INTO `ap_district` VALUES ('171', '60525', 'Huyện Krông Bông', '605', '0');
INSERT INTO `ap_district` VALUES ('172', '60539', 'Huyện Krông Búk', '605', '0');
INSERT INTO `ap_district` VALUES ('173', '60507', 'Huyện Krông Năng', '605', '0');
INSERT INTO `ap_district` VALUES ('174', '60519', 'Huyện Krông Pắc', '605', '0');
INSERT INTO `ap_district` VALUES ('175', '60531', 'Huyện Lắk', '605', '0');
INSERT INTO `ap_district` VALUES ('176', '60517', 'Huyện M-Đrắk', '605', '0');
INSERT INTO `ap_district` VALUES ('177', '60501', 'Thành phố Buôn Ma Thuột', '605', '0');
INSERT INTO `ap_district` VALUES ('178', '60509', 'Thị Xã Buôn Hồ', '605', '0');
INSERT INTO `ap_district` VALUES ('179', '60603', 'Huyện Cư Jút', '606', '0');
INSERT INTO `ap_district` VALUES ('180', '60615', 'Huyện Đắk Glong', '606', '0');
INSERT INTO `ap_district` VALUES ('181', '60607', 'Huyện Đắk Mil', '606', '0');
INSERT INTO `ap_district` VALUES ('182', '60611', 'Huyện Đắk R-Lấp', '606', '0');
INSERT INTO `ap_district` VALUES ('183', '60609', 'Huyện Đắk Song', '606', '0');
INSERT INTO `ap_district` VALUES ('184', '60605', 'Huyện Krông Nô', '606', '0');
INSERT INTO `ap_district` VALUES ('185', '60617', 'Huyện Tuy Đức', '606', '0');
INSERT INTO `ap_district` VALUES ('186', '60613', 'Thị xã Gia Nghĩa', '606', '0');
INSERT INTO `ap_district` VALUES ('187', '30117', 'Huyện Điện Biên', '301', '0');
INSERT INTO `ap_district` VALUES ('188', '30119', 'Huyện Điện Biên Đông', '301', '0');
INSERT INTO `ap_district` VALUES ('189', '30121', 'Huyện Mường ảng', '301', '0');
INSERT INTO `ap_district` VALUES ('190', '30111', 'Huyện Mường Chà', '301', '0');
INSERT INTO `ap_district` VALUES ('191', '30104', 'Huyện Mường Nhé', '301', '0');
INSERT INTO `ap_district` VALUES ('192', '30113', 'Huyện Tủa Chùa', '301', '0');
INSERT INTO `ap_district` VALUES ('193', '30115', 'Huyện Tuần Giáo', '301', '0');
INSERT INTO `ap_district` VALUES ('194', '30101', 'Thành phố Điện Biên Phủ', '301', '0');
INSERT INTO `ap_district` VALUES ('195', '30103', 'Thị xã Mường Lay', '301', '0');
INSERT INTO `ap_district` VALUES ('196', '71311', 'Huyện Cẩm Mỹ', '713', '0');
INSERT INTO `ap_district` VALUES ('197', '71305', 'Huyện Định Quán', '713', '0');
INSERT INTO `ap_district` VALUES ('198', '71315', 'Huyện Long Thành', '713', '0');
INSERT INTO `ap_district` VALUES ('199', '71317', 'Huyện Nhơn Trạch', '713', '0');
INSERT INTO `ap_district` VALUES ('200', '71303', 'Huyện Tân Phú', '713', '0');
INSERT INTO `ap_district` VALUES ('201', '71309', 'Huyện Thống Nhất', '713', '0');
INSERT INTO `ap_district` VALUES ('202', '71308', 'Huyện Trảng Bom', '713', '0');
INSERT INTO `ap_district` VALUES ('203', '71307', 'Huyện Vĩnh Cửu', '713', '0');
INSERT INTO `ap_district` VALUES ('204', '71313', 'Huyện Xuân Lộc', '713', '0');
INSERT INTO `ap_district` VALUES ('205', '71301', 'Thành phố Biên Hòa', '713', '0');
INSERT INTO `ap_district` VALUES ('206', '71302', 'Thị xã Long Khánh', '713', '0');
INSERT INTO `ap_district` VALUES ('207', '80315', 'Huyện Cao Lãnh', '803', '0');
INSERT INTO `ap_district` VALUES ('208', '80321', 'Huyện Châu Thành', '803', '0');
INSERT INTO `ap_district` VALUES ('209', '80307', 'Huyện Hồng Ngự', '803', '0');
INSERT INTO `ap_district` VALUES ('210', '80317', 'Huyện Lấp Vò', '803', '0');
INSERT INTO `ap_district` VALUES ('211', '80309', 'Huyện Tam Nông', '803', '0');
INSERT INTO `ap_district` VALUES ('212', '80305', 'Huyện Tân Hồng', '803', '0');
INSERT INTO `ap_district` VALUES ('213', '80311', 'Huyện Thanh Bình', '803', '0');
INSERT INTO `ap_district` VALUES ('214', '80313', 'Huyện Tháp Mười', '803', '0');
INSERT INTO `ap_district` VALUES ('215', '80301', 'Thành phố Cao Lãnh', '803', '0');
INSERT INTO `ap_district` VALUES ('216', '80323', 'Thị xã Hồng Ngự', '803', '0');
INSERT INTO `ap_district` VALUES ('217', '80303', 'Thị xã Sa Đéc', '803', '0');
INSERT INTO `ap_district` VALUES ('218', '60307', 'Huyện Chư Păh', '603', '0');
INSERT INTO `ap_district` VALUES ('219', '60317', 'Huyện Chư Prông', '603', '0');
INSERT INTO `ap_district` VALUES ('220', '60319', 'Huyện Chư Sê', '603', '0');
INSERT INTO `ap_district` VALUES ('221', '60325', 'Huyện Đăk Đoa', '603', '0');
INSERT INTO `ap_district` VALUES ('222', '60327', 'Huyện Đăk Pơ', '603', '0');
INSERT INTO `ap_district` VALUES ('223', '60315', 'Huyện Đức Cơ', '603', '0');
INSERT INTO `ap_district` VALUES ('224', '60309', 'Huyện Ia Grai', '603', '0');
INSERT INTO `ap_district` VALUES ('225', '60320', 'Huyện Ia Pa', '603', '0');
INSERT INTO `ap_district` VALUES ('226', '60303', 'Huyện KBang', '603', '0');
INSERT INTO `ap_district` VALUES ('227', '60313', 'Huyện Kông Chro', '603', '0');
INSERT INTO `ap_district` VALUES ('228', '60323', 'Huyện Krông Pa', '603', '0');
INSERT INTO `ap_district` VALUES ('229', '60305', 'Huyện Mang Yang', '603', '0');
INSERT INTO `ap_district` VALUES ('230', '60329', 'Huyện Phú Thiện', '603', '0');
INSERT INTO `ap_district` VALUES ('231', '60301', 'Thành phố Pleiku', '603', '0');
INSERT INTO `ap_district` VALUES ('232', '60311', 'Thị xã An Khê', '603', '0');
INSERT INTO `ap_district` VALUES ('233', '60321', 'Thị xã Ayun Pa', '603', '0');
INSERT INTO `ap_district` VALUES ('234', '20111', 'Huyện Bắc Mê', '201', '0');
INSERT INTO `ap_district` VALUES ('235', '20119', 'Huyện Bắc Quang', '201', '0');
INSERT INTO `ap_district` VALUES ('236', '20103', 'Huyện Đồng Văn', '201', '0');
INSERT INTO `ap_district` VALUES ('237', '20113', 'Huyện Hoàng Su Phì', '201', '0');
INSERT INTO `ap_district` VALUES ('238', '20105', 'Huyện Mèo Vạc', '201', '0');
INSERT INTO `ap_district` VALUES ('239', '20109', 'Huyện Quản Bạ', '201', '0');
INSERT INTO `ap_district` VALUES ('240', '20118', 'Huyện Quang Bình', '201', '0');
INSERT INTO `ap_district` VALUES ('241', '20115', 'Huyện Vị Xuyên', '201', '0');
INSERT INTO `ap_district` VALUES ('242', '20117', 'Huyện Xín Mần', '201', '0');
INSERT INTO `ap_district` VALUES ('243', '20107', 'Huyện Yên Minh', '201', '0');
INSERT INTO `ap_district` VALUES ('244', '20101', 'Thị xã Hà Giang', '201', '0');
INSERT INTO `ap_district` VALUES ('245', '11111', 'Huyện Bình Lục', '111', '0');
INSERT INTO `ap_district` VALUES ('246', '11103', 'Huyện Duy Tiên', '111', '0');
INSERT INTO `ap_district` VALUES ('247', '11105', 'Huyện Kim Bảng', '111', '0');
INSERT INTO `ap_district` VALUES ('248', '11107', 'Huyện Lý Nhân', '111', '0');
INSERT INTO `ap_district` VALUES ('249', '11109', 'Huyện Thanh Liêm', '111', '0');
INSERT INTO `ap_district` VALUES ('250', '11101', 'Thành Phố Phủ Lý', '111', '0');
INSERT INTO `ap_district` VALUES ('251', '40515', 'Huyện Cẩm Xuyên', '405', '0');
INSERT INTO `ap_district` VALUES ('252', '40511', 'Huyện Can Lộc', '405', '0');
INSERT INTO `ap_district` VALUES ('253', '40507', 'Huyện Đức Thọ', '405', '0');
INSERT INTO `ap_district` VALUES ('254', '40517', 'Huyện Hương Khê', '405', '0');
INSERT INTO `ap_district` VALUES ('255', '40509', 'Huyện Hương Sơn', '405', '0');
INSERT INTO `ap_district` VALUES ('256', '40519', 'Huyện Kỳ Anh', '405', '0');
INSERT INTO `ap_district` VALUES ('257', '40523', 'Huyện Lộc Hà', '405', '0');
INSERT INTO `ap_district` VALUES ('258', '40505', 'Huyện Nghi Xuân', '405', '0');
INSERT INTO `ap_district` VALUES ('259', '40513', 'Huyện Thạch Hà', '405', '0');
INSERT INTO `ap_district` VALUES ('260', '40521', 'Huyện Vũ Quang', '405', '0');
INSERT INTO `ap_district` VALUES ('261', '40501', 'Thành phố Hà Tĩnh', '405', '0');
INSERT INTO `ap_district` VALUES ('262', '40503', 'Thị xã Hồng Lĩnh', '405', '0');
INSERT INTO `ap_district` VALUES ('263', '10719', 'Huyện Bình Giang', '107', '0');
INSERT INTO `ap_district` VALUES ('264', '10717', 'Huyện Cẩm Giàng', '107', '0');
INSERT INTO `ap_district` VALUES ('265', '10703', 'Huyện Chí Linh', '107', '0');
INSERT INTO `ap_district` VALUES ('266', '10713', 'Huyện Gia Lộc', '107', '0');
INSERT INTO `ap_district` VALUES ('267', '10711', 'Huyện Kim Thành', '107', '0');
INSERT INTO `ap_district` VALUES ('268', '10709', 'Huyện Kinh Môn', '107', '0');
INSERT INTO `ap_district` VALUES ('269', '10705', 'Huyện Nam Sách', '107', '0');
INSERT INTO `ap_district` VALUES ('270', '10723', 'Huyện Ninh Giang', '107', '0');
INSERT INTO `ap_district` VALUES ('271', '10707', 'Huyện Thanh Hà', '107', '0');
INSERT INTO `ap_district` VALUES ('272', '10721', 'Huyện Thanh Miện', '107', '0');
INSERT INTO `ap_district` VALUES ('273', '10715', 'Huyện Tứ Kỳ', '107', '0');
INSERT INTO `ap_district` VALUES ('274', '10701', 'Thành phố Hải Dương', '107', '0');
INSERT INTO `ap_district` VALUES ('275', '10313', 'Huyện An Dương', '103', '0');
INSERT INTO `ap_district` VALUES ('276', '10315', 'Huyện An Lão', '103', '0');
INSERT INTO `ap_district` VALUES ('277', '10325', 'Huyện Bạch Long Vĩ', '103', '0');
INSERT INTO `ap_district` VALUES ('278', '10323', 'Huyện Cát Hải', '103', '0');
INSERT INTO `ap_district` VALUES ('279', '10317', 'Huyện Kiến Thuỵ', '103', '0');
INSERT INTO `ap_district` VALUES ('280', '10311', 'Huyện Thuỷ Nguyên', '103', '0');
INSERT INTO `ap_district` VALUES ('281', '10319', 'Huyện Tiên Lãng', '103', '0');
INSERT INTO `ap_district` VALUES ('282', '10321', 'Huyện Vĩnh Bảo', '103', '0');
INSERT INTO `ap_district` VALUES ('283', '10309', 'Quận Đồ Sơn', '103', '0');
INSERT INTO `ap_district` VALUES ('284', '10327', 'Quận Dương Kinh', '103', '0');
INSERT INTO `ap_district` VALUES ('285', '10304', 'Quận Hải An', '103', '0');
INSERT INTO `ap_district` VALUES ('286', '10301', 'Quận Hồng Bàng', '103', '0');
INSERT INTO `ap_district` VALUES ('287', '10307', 'Quận Kiến An', '103', '0');
INSERT INTO `ap_district` VALUES ('288', '10305', 'Quận Lê Chân', '103', '0');
INSERT INTO `ap_district` VALUES ('289', '10303', 'Quận Ngô Quyền', '103', '0');
INSERT INTO `ap_district` VALUES ('290', '81603', 'Huyện Châu Thành A', '816', '0');
INSERT INTO `ap_district` VALUES ('291', '81605', 'Huyện Châu Thành', '816', '0');
INSERT INTO `ap_district` VALUES ('292', '81611', 'Huyện Long Mỹ', '816', '0');
INSERT INTO `ap_district` VALUES ('293', '81608', 'Huyện Phụng Hiệp', '816', '0');
INSERT INTO `ap_district` VALUES ('294', '81609', 'Huyện Vị Thuỷ', '816', '0');
INSERT INTO `ap_district` VALUES ('295', '81607', 'Thị xã Ngã Bảy', '816', '0');
INSERT INTO `ap_district` VALUES ('296', '81601', 'Thị xã Vị Thanh', '816', '0');
INSERT INTO `ap_district` VALUES ('297', '30510', 'Huyện Cao Phong', '305', '0');
INSERT INTO `ap_district` VALUES ('298', '30503', 'Huyện Đà Bắc', '305', '0');
INSERT INTO `ap_district` VALUES ('299', '30511', 'Huyện Kim Bôi', '305', '0');
INSERT INTO `ap_district` VALUES ('300', '30507', 'Huyện Kỳ Sơn', '305', '0');
INSERT INTO `ap_district` VALUES ('301', '30515', 'Huyện Lạc Sơn', '305', '0');
INSERT INTO `ap_district` VALUES ('302', '30517', 'Huyện Lạc Thủy', '305', '0');
INSERT INTO `ap_district` VALUES ('303', '30509', 'Huyện Lương Sơn', '305', '0');
INSERT INTO `ap_district` VALUES ('304', '30505', 'Huyện Mai Châu', '305', '0');
INSERT INTO `ap_district` VALUES ('305', '30513', 'Huyện Tân Lạc', '305', '0');
INSERT INTO `ap_district` VALUES ('306', '30519', 'Huyện Yên Thủy', '305', '0');
INSERT INTO `ap_district` VALUES ('307', '30501', 'Thành phố Hòa Bình', '305', '0');
INSERT INTO `ap_district` VALUES ('308', '10907', 'Huyện Ân Thi', '109', '0');
INSERT INTO `ap_district` VALUES ('309', '10905', 'Huyện Khoái Châu', '109', '0');
INSERT INTO `ap_district` VALUES ('310', '10909', 'Huyện Kim Động', '109', '0');
INSERT INTO `ap_district` VALUES ('311', '10903', 'Huyện Mỹ Hào', '109', '0');
INSERT INTO `ap_district` VALUES ('312', '10911', 'Huyện Phù Cừ', '109', '0');
INSERT INTO `ap_district` VALUES ('313', '10913', 'Huyện Tiên Lữ', '109', '0');
INSERT INTO `ap_district` VALUES ('314', '10915', 'Huyện Văn Giang', '109', '0');
INSERT INTO `ap_district` VALUES ('315', '10917', 'Huyện Văn Lâm', '109', '0');
INSERT INTO `ap_district` VALUES ('316', '10919', 'Huyện Yên Mỹ', '109', '0');
INSERT INTO `ap_district` VALUES ('317', '10901', 'Thành phố Hưng Yên', '109', '0');
INSERT INTO `ap_district` VALUES ('318', '51117', 'Huyện Cam Lâm', '511', '0');
INSERT INTO `ap_district` VALUES ('319', '51107', 'Huyện Diên Khánh', '511', '0');
INSERT INTO `ap_district` VALUES ('320', '51113', 'Huyện Khánh Sơn', '511', '0');
INSERT INTO `ap_district` VALUES ('321', '51111', 'Huyện Khánh Vĩnh', '511', '0');
INSERT INTO `ap_district` VALUES ('322', '51105', 'Huyện Ninh Hòa', '511', '0');
INSERT INTO `ap_district` VALUES ('323', '51115', 'Huyện Trường Sa', '511', '0');
INSERT INTO `ap_district` VALUES ('324', '51103', 'Huyện Vạn Ninh', '511', '0');
INSERT INTO `ap_district` VALUES ('325', '51101', 'Thành phố Nha Trang', '511', '0');
INSERT INTO `ap_district` VALUES ('326', '51109', 'Thị xã Cam Ranh', '511', '0');
INSERT INTO `ap_district` VALUES ('327', '81315', 'Huyện An Biên', '813', '0');
INSERT INTO `ap_district` VALUES ('328', '81317', 'Huyện An Minh', '813', '0');
INSERT INTO `ap_district` VALUES ('329', '81309', 'Huyện Châu Thành', '813', '0');
INSERT INTO `ap_district` VALUES ('330', '81311', 'Huyện Giồng Riềng', '813', '0');
INSERT INTO `ap_district` VALUES ('331', '81313', 'Huyện Gò Quao', '813', '0');
INSERT INTO `ap_district` VALUES ('332', '81305', 'Huyện Hòn Đất', '813', '0');
INSERT INTO `ap_district` VALUES ('333', '81323', 'Huyện Kiên Hải', '813', '0');
INSERT INTO `ap_district` VALUES ('334', '81303', 'Huyện Kiên Lương', '813', '0');
INSERT INTO `ap_district` VALUES ('335', '81321', 'Huyện Phú Quốc', '813', '0');
INSERT INTO `ap_district` VALUES ('336', '81307', 'Huyện Tân Hiệp', '813', '0');
INSERT INTO `ap_district` VALUES ('337', '81327', 'Huyện U Minh Thượng', '813', '0');
INSERT INTO `ap_district` VALUES ('338', '81319', 'Huyện Vĩnh Thuận', '813', '0');
INSERT INTO `ap_district` VALUES ('339', '81301', 'Thành phố Rạch Giá', '813', '0');
INSERT INTO `ap_district` VALUES ('340', '81325', 'Thị xã Hà Tiên', '813', '0');
INSERT INTO `ap_district` VALUES ('341', '60103', 'Huyện Đắk Glei', '601', '0');
INSERT INTO `ap_district` VALUES ('342', '60111', 'Huyện Đắk Hà', '601', '0');
INSERT INTO `ap_district` VALUES ('343', '60107', 'Huyện Đắk Tô', '601', '0');
INSERT INTO `ap_district` VALUES ('344', '60109', 'Huyện Kon Plông', '601', '0');
INSERT INTO `ap_district` VALUES ('345', '60108', 'Huyện Kon Rẫy', '601', '0');
INSERT INTO `ap_district` VALUES ('346', '60105', 'Huyện Ngọc Hồi', '601', '0');
INSERT INTO `ap_district` VALUES ('347', '60113', 'Huyện Sa Thầy', '601', '0');
INSERT INTO `ap_district` VALUES ('348', '60115', 'Huyện Tu Mơ Rông', '601', '0');
INSERT INTO `ap_district` VALUES ('349', '60101', 'Thành phố Kon Tum', '601', '0');
INSERT INTO `ap_district` VALUES ('350', '30201', 'Huyện Mường Tè', '302', '0');
INSERT INTO `ap_district` VALUES ('351', '30203', 'Huyện Phong Thổ', '302', '0');
INSERT INTO `ap_district` VALUES ('352', '30207', 'Huyện Sìn Hồ', '302', '0');
INSERT INTO `ap_district` VALUES ('353', '30205', 'Huyện Tam Đường', '302', '0');
INSERT INTO `ap_district` VALUES ('354', '30211', 'Huyện Tân Uyên', '302', '0');
INSERT INTO `ap_district` VALUES ('355', '30209', 'Huyện Than Uyên', '302', '0');
INSERT INTO `ap_district` VALUES ('356', '30202', 'Thị xã Lai Châu', '302', '0');
INSERT INTO `ap_district` VALUES ('357', '70313', 'Huyện Bảo Lâm', '703', '0');
INSERT INTO `ap_district` VALUES ('358', '70321', 'Huyện Cát Tiên', '703', '0');
INSERT INTO `ap_district` VALUES ('359', '70317', 'Huyện Đạ Huoai', '703', '0');
INSERT INTO `ap_district` VALUES ('360', '70319', 'Huyện Đạ Tẻh', '703', '0');
INSERT INTO `ap_district` VALUES ('361', '70323', 'Huyện Đam Rông', '703', '0');
INSERT INTO `ap_district` VALUES ('362', '70315', 'Huyện Di Linh', '703', '0');
INSERT INTO `ap_district` VALUES ('363', '70307', 'Huyện Đơn Dương', '703', '0');
INSERT INTO `ap_district` VALUES ('364', '70309', 'Huyện Đức Trọng', '703', '0');
INSERT INTO `ap_district` VALUES ('365', '70305', 'Huyện Lạc Dương', '703', '0');
INSERT INTO `ap_district` VALUES ('366', '70311', 'Huyện Lâm Hà', '703', '0');
INSERT INTO `ap_district` VALUES ('367', '70301', 'Thành phố Đà Lạt', '703', '0');
INSERT INTO `ap_district` VALUES ('368', '70303', 'Thị xã Bảo Lộc', '703', '0');
INSERT INTO `ap_district` VALUES ('369', '20909', 'Huyện Bắc Sơn', '209', '0');
INSERT INTO `ap_district` VALUES ('370', '20907', 'Huyện Bình Gia', '209', '0');
INSERT INTO `ap_district` VALUES ('371', '20913', 'Huyện Cao Lộc', '209', '0');
INSERT INTO `ap_district` VALUES ('372', '20917', 'Huyện Chi Lăng', '209', '0');
INSERT INTO `ap_district` VALUES ('373', '20919', 'Huyện Đình Lập', '209', '0');
INSERT INTO `ap_district` VALUES ('374', '20921', 'Huyện Hữu Lũng', '209', '0');
INSERT INTO `ap_district` VALUES ('375', '20915', 'Huyện Lộc Bình', '209', '0');
INSERT INTO `ap_district` VALUES ('376', '20903', 'Huyện Tràng Định', '209', '0');
INSERT INTO `ap_district` VALUES ('377', '20905', 'Huyện Văn Lãng', '209', '0');
INSERT INTO `ap_district` VALUES ('378', '20911', 'Huyện Văn Quan', '209', '0');
INSERT INTO `ap_district` VALUES ('379', '20901', 'Thành phố Lạng Sơn', '209', '0');
INSERT INTO `ap_district` VALUES ('380', '20509', 'Huyện Bắc Hà', '205', '0');
INSERT INTO `ap_district` VALUES ('381', '20511', 'Huyện Bảo Thắng', '205', '0');
INSERT INTO `ap_district` VALUES ('382', '20515', 'Huyện Bảo Yên', '205', '0');
INSERT INTO `ap_district` VALUES ('383', '20507', 'Huyện Bát Xát', '205', '0');
INSERT INTO `ap_district` VALUES ('384', '20505', 'Huyện Mường Khương', '205', '0');
INSERT INTO `ap_district` VALUES ('385', '20513', 'Huyện Sa Pa', '205', '0');
INSERT INTO `ap_district` VALUES ('386', '20521', 'Huyện Si Ma Cai', '205', '0');
INSERT INTO `ap_district` VALUES ('387', '20519', 'Huyện Văn Bàn', '205', '0');
INSERT INTO `ap_district` VALUES ('388', '20501', 'Thành phố Lào Cai', '205', '0');
INSERT INTO `ap_district` VALUES ('389', '80117', 'Huyện Bến Lức', '801', '0');
INSERT INTO `ap_district` VALUES ('390', '80125', 'Huyện Cần Đước', '801', '0');
INSERT INTO `ap_district` VALUES ('391', '80127', 'Huyện Cần Giuộc', '801', '0');
INSERT INTO `ap_district` VALUES ('392', '80121', 'Huyện Châu Thành', '801', '0');
INSERT INTO `ap_district` VALUES ('393', '80115', 'Huyện Đức Hòa', '801', '0');
INSERT INTO `ap_district` VALUES ('394', '80113', 'Huyện Đức Huệ', '801', '0');
INSERT INTO `ap_district` VALUES ('395', '80107', 'Huyện Mộc Hóa', '801', '0');
INSERT INTO `ap_district` VALUES ('396', '80103', 'Huyện Tân Hưng', '801', '0');
INSERT INTO `ap_district` VALUES ('397', '80109', 'Huyện Tân Thạnh', '801', '0');
INSERT INTO `ap_district` VALUES ('398', '80123', 'Huyện Tân Trụ', '801', '0');
INSERT INTO `ap_district` VALUES ('399', '80111', 'Huyện Thạnh Hóa', '801', '0');
INSERT INTO `ap_district` VALUES ('400', '80119', 'Huyện Thủ Thừa', '801', '0');
INSERT INTO `ap_district` VALUES ('401', '80105', 'Huyện Vĩnh Hưng', '801', '0');
INSERT INTO `ap_district` VALUES ('402', '80101', 'Thị xã Tân An', '801', '0');
INSERT INTO `ap_district` VALUES ('403', '11315', 'Huyện Giao Thủy', '113', '0');
INSERT INTO `ap_district` VALUES ('404', '11319', 'Huyện Hải Hậu', '113', '0');
INSERT INTO `ap_district` VALUES ('405', '11305', 'Huyện Mỹ Lộc', '113', '0');
INSERT INTO `ap_district` VALUES ('406', '11309', 'Huyện Nam Trực', '113', '0');
INSERT INTO `ap_district` VALUES ('407', '11317', 'Huyện Nghĩa Hưng', '113', '0');
INSERT INTO `ap_district` VALUES ('408', '11311', 'Huyện Trực Ninh', '113', '0');
INSERT INTO `ap_district` VALUES ('409', '11303', 'Huyện Vụ Bản', '113', '0');
INSERT INTO `ap_district` VALUES ('410', '11313', 'Huyện Xuân Trường', '113', '0');
INSERT INTO `ap_district` VALUES ('411', '11307', 'Huyện ý Yên', '113', '0');
INSERT INTO `ap_district` VALUES ('412', '11301', 'Thành phố Nam Định', '113', '0');
INSERT INTO `ap_district` VALUES ('413', '40327', 'Huyện Anh Sơn', '403', '0');
INSERT INTO `ap_district` VALUES ('414', '40321', 'Huyện Con Cuông', '403', '0');
INSERT INTO `ap_district` VALUES ('415', '40325', 'Huyện Diễn Châu', '403', '0');
INSERT INTO `ap_district` VALUES ('416', '40329', 'Huyện Đô Lương', '403', '0');
INSERT INTO `ap_district` VALUES ('417', '40337', 'Huyện Hưng Nguyên', '403', '0');
INSERT INTO `ap_district` VALUES ('418', '40309', 'Huyện Kỳ Sơn', '403', '0');
INSERT INTO `ap_district` VALUES ('419', '40335', 'Huyện Nam Đàn', '403', '0');
INSERT INTO `ap_district` VALUES ('420', '40333', 'Huyện Nghi Lộc', '403', '0');
INSERT INTO `ap_district` VALUES ('421', '40313', 'Huyện Nghĩa Đàn', '403', '0');
INSERT INTO `ap_district` VALUES ('422', '40305', 'Huyện Quế Phong', '403', '0');
INSERT INTO `ap_district` VALUES ('423', '40307', 'Huyện Quỳ Châu', '403', '0');
INSERT INTO `ap_district` VALUES ('424', '40311', 'Huyện Quỳ Hợp', '403', '0');
INSERT INTO `ap_district` VALUES ('425', '40317', 'Huyện Quỳnh Lưu', '403', '0');
INSERT INTO `ap_district` VALUES ('426', '40319', 'Huyện Tân Kỳ', '403', '0');
INSERT INTO `ap_district` VALUES ('427', '40331', 'Huyện Thanh Chương', '403', '0');
INSERT INTO `ap_district` VALUES ('428', '40315', 'Huyện Tương Dương', '403', '0');
INSERT INTO `ap_district` VALUES ('429', '40323', 'Huyện Yên Thành', '403', '0');
INSERT INTO `ap_district` VALUES ('430', '40301', 'Thành phố Vinh', '403', '0');
INSERT INTO `ap_district` VALUES ('431', '40303', 'Thị xã Cửa Lò', '403', '0');
INSERT INTO `ap_district` VALUES ('432', '40314', 'TX Thái Hoà', '403', '0');
INSERT INTO `ap_district` VALUES ('433', '11707', 'Huyện Gia Viễn', '117', '0');
INSERT INTO `ap_district` VALUES ('434', '11709', 'Huyện Hoa Lư', '117', '0');
INSERT INTO `ap_district` VALUES ('435', '11715', 'Huyện Kim Sơn', '117', '0');
INSERT INTO `ap_district` VALUES ('436', '11705', 'Huyện Nho Quan', '117', '0');
INSERT INTO `ap_district` VALUES ('437', '11713', 'Huyện Yên Khánh', '117', '0');
INSERT INTO `ap_district` VALUES ('438', '11711', 'Huyện Yên Mô', '117', '0');
INSERT INTO `ap_district` VALUES ('439', '11701', 'Thành Phố Ninh Bình', '117', '0');
INSERT INTO `ap_district` VALUES ('440', '11703', 'Thị xã Tam Điệp', '117', '0');
INSERT INTO `ap_district` VALUES ('441', '70509', 'Huyện Bác ái', '705', '0');
INSERT INTO `ap_district` VALUES ('442', '70505', 'Huyện Ninh Hải', '705', '0');
INSERT INTO `ap_district` VALUES ('443', '70507', 'Huyện Ninh Phước', '705', '0');
INSERT INTO `ap_district` VALUES ('444', '70503', 'Huyện Ninh Sơn', '705', '0');
INSERT INTO `ap_district` VALUES ('445', '70511', 'Huyện Thuận Bắc', '705', '0');
INSERT INTO `ap_district` VALUES ('446', '70513', 'Huyện Thuận Nam', '705', '0');
INSERT INTO `ap_district` VALUES ('447', '70501', 'TP. Phan Rang - Tháp Chàm', '705', '0');
INSERT INTO `ap_district` VALUES ('448', '21713', 'Huyện Cẩm Khê', '217', '0');
INSERT INTO `ap_district` VALUES ('449', '21705', 'Huyện Đoan Hùng', '217', '0');
INSERT INTO `ap_district` VALUES ('450', '21707', 'Huyện Hạ Hoà', '217', '0');
INSERT INTO `ap_district` VALUES ('451', '21721', 'Huyện Lâm Thao', '217', '0');
INSERT INTO `ap_district` VALUES ('452', '21711', 'Huyện Phù Ninh', '217', '0');
INSERT INTO `ap_district` VALUES ('453', '21717', 'Huyện Tam Nông', '217', '0');
INSERT INTO `ap_district` VALUES ('454', '21720', 'Huyện Tân Sơn', '217', '0');
INSERT INTO `ap_district` VALUES ('455', '21709', 'Huyện Thanh Ba', '217', '0');
INSERT INTO `ap_district` VALUES ('456', '21719', 'Huyện Thanh Sơn', '217', '0');
INSERT INTO `ap_district` VALUES ('457', '21723', 'Huyện Thanh Thuỷ', '217', '0');
INSERT INTO `ap_district` VALUES ('458', '21715', 'Huyện Yên Lập', '217', '0');
INSERT INTO `ap_district` VALUES ('459', '21701', 'Thành phố Việt Trì', '217', '0');
INSERT INTO `ap_district` VALUES ('460', '21703', 'Thị xã Phú Thọ', '217', '0');
INSERT INTO `ap_district` VALUES ('461', '50911', 'Huyện Đông Hòa', '509', '0');
INSERT INTO `ap_district` VALUES ('462', '50903', 'Huyện Đồng Xuân', '509', '0');
INSERT INTO `ap_district` VALUES ('463', '50915', 'Huyện Phú Hoà', '509', '0');
INSERT INTO `ap_district` VALUES ('464', '50909', 'Huyện Sơn Hòa', '509', '0');
INSERT INTO `ap_district` VALUES ('465', '50905', 'Huyện Sông Cầu', '509', '0');
INSERT INTO `ap_district` VALUES ('466', '50913', 'Huyện Sông Hinh', '509', '0');
INSERT INTO `ap_district` VALUES ('467', '50912', 'Huyện Tây Hòa', '509', '0');
INSERT INTO `ap_district` VALUES ('468', '50907', 'Huyện Tuy An', '509', '0');
INSERT INTO `ap_district` VALUES ('469', '50901', 'Thành phố Tuy Hòa', '509', '0');
INSERT INTO `ap_district` VALUES ('470', '40709', 'Huyện Bố Trạch', '407', '0');
INSERT INTO `ap_district` VALUES ('471', '40713', 'Huyện Lệ Thủy', '407', '0');
INSERT INTO `ap_district` VALUES ('472', '40705', 'Huyện Minh Hóa', '407', '0');
INSERT INTO `ap_district` VALUES ('473', '40711', 'Huyện Quảng Ninh', '407', '0');
INSERT INTO `ap_district` VALUES ('474', '40707', 'Huyện Quảng Trạch', '407', '0');
INSERT INTO `ap_district` VALUES ('475', '40703', 'Huyện Tuyên Hóa', '407', '0');
INSERT INTO `ap_district` VALUES ('476', '40701', 'Thành phố Đồng Hới', '407', '0');
INSERT INTO `ap_district` VALUES ('477', '50327', 'Huyện Bắc Trà My', '503', '0');
INSERT INTO `ap_district` VALUES ('478', '50307', 'Huyện Đại Lộc', '503', '0');
INSERT INTO `ap_district` VALUES ('479', '50309', 'Huyện Điện Bàn', '503', '0');
INSERT INTO `ap_district` VALUES ('480', '50305', 'Huyện Đông Giang', '503', '0');
INSERT INTO `ap_district` VALUES ('481', '50311', 'Huyện Duy Xuyên', '503', '0');
INSERT INTO `ap_district` VALUES ('482', '50319', 'Huyện Hiệp Đức', '503', '0');
INSERT INTO `ap_district` VALUES ('483', '50313', 'Huyện Nam Giang', '503', '0');
INSERT INTO `ap_district` VALUES ('484', '50329', 'Huyện Nam Trà My', '503', '0');
INSERT INTO `ap_district` VALUES ('485', '50318', 'Huyện Nông Sơn', '503', '0');
INSERT INTO `ap_district` VALUES ('486', '50325', 'Huyện Núi Thành', '503', '0');
INSERT INTO `ap_district` VALUES ('487', '50302', 'Huyện Phú Ninh', '503', '0');
INSERT INTO `ap_district` VALUES ('488', '50323', 'Huyện Phước Sơn', '503', '0');
INSERT INTO `ap_district` VALUES ('489', '50317', 'Huyện Quế Sơn', '503', '0');
INSERT INTO `ap_district` VALUES ('490', '50304', 'Huyện Tây Giang', '503', '0');
INSERT INTO `ap_district` VALUES ('491', '50315', 'Huyện Thăng Bình', '503', '0');
INSERT INTO `ap_district` VALUES ('492', '50321', 'Huyện Tiên Phước', '503', '0');
INSERT INTO `ap_district` VALUES ('493', '50303', 'Thành Phố Hội An', '503', '0');
INSERT INTO `ap_district` VALUES ('494', '50301', 'Thành phố Tam Kỳ', '503', '0');
INSERT INTO `ap_district` VALUES ('495', '50525', 'Huyện Ba Tơ', '505', '0');
INSERT INTO `ap_district` VALUES ('496', '50505', 'Huyện Bình Sơn', '505', '0');
INSERT INTO `ap_district` VALUES ('497', '50523', 'Huyện Đức Phổ', '505', '0');
INSERT INTO `ap_district` VALUES ('498', '50503', 'Huyện Lý Sơn', '505', '0');
INSERT INTO `ap_district` VALUES ('499', '50519', 'Huyện Minh Long', '505', '0');
INSERT INTO `ap_district` VALUES ('500', '50521', 'Huyện Mộ Đức', '505', '0');
INSERT INTO `ap_district` VALUES ('501', '50517', 'Huyện Nghĩa Hành', '505', '0');
INSERT INTO `ap_district` VALUES ('502', '50513', 'Huyện Sơn Hà', '505', '0');
INSERT INTO `ap_district` VALUES ('503', '50511', 'Huyện Sơn Tây', '505', '0');
INSERT INTO `ap_district` VALUES ('504', '50509', 'Huyện Sơn Tịnh', '505', '0');
INSERT INTO `ap_district` VALUES ('505', '50508', 'Huyện Tây Trà', '505', '0');
INSERT INTO `ap_district` VALUES ('506', '50507', 'Huyện Trà Bồng', '505', '0');
INSERT INTO `ap_district` VALUES ('507', '50515', 'Huyện Tư Nghĩa', '505', '0');
INSERT INTO `ap_district` VALUES ('508', '50501', 'Thành phố Quảng Ngãi', '505', '0');
INSERT INTO `ap_district` VALUES ('509', '22515', 'Huyện Ba Chẽ', '225', '0');
INSERT INTO `ap_district` VALUES ('510', '22507', 'Huyện Bình Liêu', '225', '0');
INSERT INTO `ap_district` VALUES ('511', '22523', 'Huyện Cô Tô', '225', '0');
INSERT INTO `ap_district` VALUES ('512', '22527', 'Huyện Đầm Hà', '225', '0');
INSERT INTO `ap_district` VALUES ('513', '22521', 'Huyện Đông Triều', '225', '0');
INSERT INTO `ap_district` VALUES ('514', '22511', 'Huyện Hải Hà', '225', '0');
INSERT INTO `ap_district` VALUES ('515', '22519', 'Huyện Hoành Bồ', '225', '0');
INSERT INTO `ap_district` VALUES ('516', '22513', 'Huyện Tiên Yên', '225', '0');
INSERT INTO `ap_district` VALUES ('517', '22517', 'Huyện Vân Đồn', '225', '0');
INSERT INTO `ap_district` VALUES ('518', '22525', 'Huyện Yên Hưng', '225', '0');
INSERT INTO `ap_district` VALUES ('519', '22501', 'Thành phố Hạ Long', '225', '0');
INSERT INTO `ap_district` VALUES ('520', '22509', 'Thành Phố Móng Cái', '225', '0');
INSERT INTO `ap_district` VALUES ('521', '22503', 'Thị xã Cẩm Phả', '225', '0');
INSERT INTO `ap_district` VALUES ('522', '22505', 'Thị xã Uông Bí', '225', '0');
INSERT INTO `ap_district` VALUES ('523', '40909', 'Huyện Cam Lộ', '409', '0');
INSERT INTO `ap_district` VALUES ('524', '40917', 'Huyện Đa Krông', '409', '0');
INSERT INTO `ap_district` VALUES ('525', '40919', 'Huyện Đảo Cồn Cỏ', '409', '0');
INSERT INTO `ap_district` VALUES ('526', '40907', 'Huyện Gio Linh', '409', '0');
INSERT INTO `ap_district` VALUES ('527', '40913', 'Huyện Hải Lăng', '409', '0');
INSERT INTO `ap_district` VALUES ('528', '40915', 'Huyện Hướng Hóa', '409', '0');
INSERT INTO `ap_district` VALUES ('529', '40911', 'Huyện Triệu Phong', '409', '0');
INSERT INTO `ap_district` VALUES ('530', '40905', 'Huyện Vĩnh Linh', '409', '0');
INSERT INTO `ap_district` VALUES ('531', '40901', 'Thị xã Đông Hà', '409', '0');
INSERT INTO `ap_district` VALUES ('532', '40903', 'Thị xã Quảng Trị', '409', '0');
INSERT INTO `ap_district` VALUES ('533', '81915', 'Huyện Châu Thành', '819', '0');
INSERT INTO `ap_district` VALUES ('534', '81906', 'Huyện Cù Lao Dung', '819', '0');
INSERT INTO `ap_district` VALUES ('535', '81903', 'Huyện Kế Sách', '819', '0');
INSERT INTO `ap_district` VALUES ('536', '81905', 'Huyện Long Phú', '819', '0');
INSERT INTO `ap_district` VALUES ('537', '81907', 'Huyện Mỹ Tú', '819', '0');
INSERT INTO `ap_district` VALUES ('538', '81909', 'Huyện Mỹ Xuyên', '819', '0');
INSERT INTO `ap_district` VALUES ('539', '81912', 'Huyện Ngã Năm', '819', '0');
INSERT INTO `ap_district` VALUES ('540', '81911', 'Huyện Thạnh Trị', '819', '0');
INSERT INTO `ap_district` VALUES ('541', '81913', 'Huyện Vĩnh Châu', '819', '0');
INSERT INTO `ap_district` VALUES ('542', '81901', 'Thành phố Sóc Trăng', '819', '0');
INSERT INTO `ap_district` VALUES ('543', '30309', 'Huyện Bắc Yên', '303', '0');
INSERT INTO `ap_district` VALUES ('544', '30313', 'Huyện Mai Sơn', '303', '0');
INSERT INTO `ap_district` VALUES ('545', '30319', 'Huyện Mộc Châu', '303', '0');
INSERT INTO `ap_district` VALUES ('546', '30305', 'Huyện Mường La', '303', '0');
INSERT INTO `ap_district` VALUES ('547', '30311', 'Huyện Phù Yên', '303', '0');
INSERT INTO `ap_district` VALUES ('548', '30303', 'Huyện Quỳnh Nhai', '303', '0');
INSERT INTO `ap_district` VALUES ('549', '30315', 'Huyện Sông Mã', '303', '0');
INSERT INTO `ap_district` VALUES ('550', '30321', 'Huyện Sốp Cộp', '303', '0');
INSERT INTO `ap_district` VALUES ('551', '30307', 'Huyện Thuận Châu', '303', '0');
INSERT INTO `ap_district` VALUES ('552', '30317', 'Huyện Yên Châu', '303', '0');
INSERT INTO `ap_district` VALUES ('553', '30301', 'Thành Phố Sơn La', '303', '0');
INSERT INTO `ap_district` VALUES ('554', '70913', 'Huyện Bến Cầu', '709', '0');
INSERT INTO `ap_district` VALUES ('555', '70909', 'Huyện Châu Thành', '709', '0');
INSERT INTO `ap_district` VALUES ('556', '70907', 'Huyện Dương Minh Châu', '709', '0');
INSERT INTO `ap_district` VALUES ('557', '70915', 'Huyện Gò Dầu', '709', '0');
INSERT INTO `ap_district` VALUES ('558', '70911', 'Huyện Hòa Thành', '709', '0');
INSERT INTO `ap_district` VALUES ('559', '70903', 'Huyện Tân Biên', '709', '0');
INSERT INTO `ap_district` VALUES ('560', '70905', 'Huyện Tân Châu', '709', '0');
INSERT INTO `ap_district` VALUES ('561', '70917', 'Huyện Trảng Bàng', '709', '0');
INSERT INTO `ap_district` VALUES ('562', '70901', 'Thị xã Tây Ninh', '709', '0');
INSERT INTO `ap_district` VALUES ('563', '11509', 'Huyện Đông Hưng', '115', '0');
INSERT INTO `ap_district` VALUES ('564', '11505', 'Huyện Hưng Hà', '115', '0');
INSERT INTO `ap_district` VALUES ('565', '11513', 'Huyện Kiến Xương', '115', '0');
INSERT INTO `ap_district` VALUES ('566', '11503', 'Huyện Quỳnh Phụ', '115', '0');
INSERT INTO `ap_district` VALUES ('567', '11507', 'Huyện Thái Thụy', '115', '0');
INSERT INTO `ap_district` VALUES ('568', '11515', 'Huyện Tiền Hải', '115', '0');
INSERT INTO `ap_district` VALUES ('569', '11511', 'Huyện Vũ Thư', '115', '0');
INSERT INTO `ap_district` VALUES ('570', '11501', 'Thành phố Thái Bình', '115', '0');
INSERT INTO `ap_district` VALUES ('571', '21513', 'Huyện Đại Từ', '215', '0');
INSERT INTO `ap_district` VALUES ('572', '21505', 'Huyện Định Hóa', '215', '0');
INSERT INTO `ap_district` VALUES ('573', '21511', 'Huyện Đồng Hỷ', '215', '0');
INSERT INTO `ap_district` VALUES ('574', '21517', 'Huyện Phổ Yên', '215', '0');
INSERT INTO `ap_district` VALUES ('575', '21515', 'Huyện Phú Bình', '215', '0');
INSERT INTO `ap_district` VALUES ('576', '21509', 'Huyện Phú Lương', '215', '0');
INSERT INTO `ap_district` VALUES ('577', '21507', 'Huyện Võ Nhai', '215', '0');
INSERT INTO `ap_district` VALUES ('578', '21501', 'Thành phố Thái Nguyên', '215', '0');
INSERT INTO `ap_district` VALUES ('579', '21503', 'Thị xã Sông Công', '215', '0');
INSERT INTO `ap_district` VALUES ('580', '40113', 'Huyện Bá Thước', '401', '0');
INSERT INTO `ap_district` VALUES ('581', '40115', 'Huyện Cẩm Thủy', '401', '0');
INSERT INTO `ap_district` VALUES ('582', '40145', 'Huyện Đông Sơn', '401', '0');
INSERT INTO `ap_district` VALUES ('583', '40131', 'Huyện Hà Trung', '401', '0');
INSERT INTO `ap_district` VALUES ('584', '40139', 'Huyện Hậu Lộc', '401', '0');
INSERT INTO `ap_district` VALUES ('585', '40143', 'Huyện Hoằng Hóa', '401', '0');
INSERT INTO `ap_district` VALUES ('586', '40117', 'Huyện Lang Chánh', '401', '0');
INSERT INTO `ap_district` VALUES ('587', '40107', 'Huyện Mường Lát', '401', '0');
INSERT INTO `ap_district` VALUES ('588', '40133', 'Huyện Nga Sơn', '401', '0');
INSERT INTO `ap_district` VALUES ('589', '40121', 'Huyện Ngọc Lặc', '401', '0');
INSERT INTO `ap_district` VALUES ('590', '40127', 'Huyện Như Thanh', '401', '0');
INSERT INTO `ap_district` VALUES ('591', '40125', 'Huyện Như Xuân', '401', '0');
INSERT INTO `ap_district` VALUES ('592', '40151', 'Huyện Nông Cống', '401', '0');
INSERT INTO `ap_district` VALUES ('593', '40109', 'Huyện Quan Hóa', '401', '0');
INSERT INTO `ap_district` VALUES ('594', '40111', 'Huyện Quan Sơn', '401', '0');
INSERT INTO `ap_district` VALUES ('595', '40149', 'Huyện Quảng Xương', '401', '0');
INSERT INTO `ap_district` VALUES ('596', '40119', 'Huyện Thạch Thành', '401', '0');
INSERT INTO `ap_district` VALUES ('597', '40141', 'Huyện Thiệu Hoá', '401', '0');
INSERT INTO `ap_district` VALUES ('598', '40137', 'Huyện Thọ Xuân', '401', '0');
INSERT INTO `ap_district` VALUES ('599', '40123', 'Huyện Thường Xuân', '401', '0');
INSERT INTO `ap_district` VALUES ('600', '40153', 'Huyện Tĩnh Gia', '401', '0');
INSERT INTO `ap_district` VALUES ('601', '40147', 'Huyện Triệu Sơn', '401', '0');
INSERT INTO `ap_district` VALUES ('602', '40129', 'Huyện Vĩnh Lộc', '401', '0');
INSERT INTO `ap_district` VALUES ('603', '40135', 'Huyện Yên Định', '401', '0');
INSERT INTO `ap_district` VALUES ('604', '40101', 'Thành phố Thanh Hóa', '401', '0');
INSERT INTO `ap_district` VALUES ('605', '40103', 'Thị xã Bỉm Sơn', '401', '0');
INSERT INTO `ap_district` VALUES ('606', '40105', 'Thị xã Sầm Sơn', '401', '0');
INSERT INTO `ap_district` VALUES ('607', '41115', 'Huyện A Lưới', '411', '0');
INSERT INTO `ap_district` VALUES ('608', '41111', 'Huyện Hương Thủy', '411', '0');
INSERT INTO `ap_district` VALUES ('609', '41107', 'Huyện Hương Trà', '411', '0');
INSERT INTO `ap_district` VALUES ('610', '41117', 'Huyện Nam Đông', '411', '0');
INSERT INTO `ap_district` VALUES ('611', '41103', 'Huyện Phong Điền', '411', '0');
INSERT INTO `ap_district` VALUES ('612', '41113', 'Huyện Phú Lộc', '411', '0');
INSERT INTO `ap_district` VALUES ('613', '41109', 'Huyện Phú Vang', '411', '0');
INSERT INTO `ap_district` VALUES ('614', '41105', 'Huyện Quảng Điền', '411', '0');
INSERT INTO `ap_district` VALUES ('615', '41101', 'Thành phố Huế', '411', '0');
INSERT INTO `ap_district` VALUES ('616', '80713', 'Huyện Cái Bè', '807', '0');
INSERT INTO `ap_district` VALUES ('617', '80709', 'Huyện Cai Lậy', '807', '0');
INSERT INTO `ap_district` VALUES ('618', '80707', 'Huyện Châu Thành', '807', '0');
INSERT INTO `ap_district` VALUES ('619', '80711', 'Huyện Chợ Gạo', '807', '0');
INSERT INTO `ap_district` VALUES ('620', '80717', 'Huyện Gò Công Đông', '807', '0');
INSERT INTO `ap_district` VALUES ('621', '80715', 'Huyện Gò Công Tây', '807', '0');
INSERT INTO `ap_district` VALUES ('622', '80719', 'Huyện Tân Phú Đông', '807', '0');
INSERT INTO `ap_district` VALUES ('623', '80705', 'Huyện Tân Phước', '807', '0');
INSERT INTO `ap_district` VALUES ('624', '80701', 'Thành phố Mỹ Tho', '807', '0');
INSERT INTO `ap_district` VALUES ('625', '80703', 'Thị xã Gò Công', '807', '0');
INSERT INTO `ap_district` VALUES ('626', '81703', 'Huyện Càng Long', '817', '0');
INSERT INTO `ap_district` VALUES ('627', '81707', 'Huyện Cầu Kè', '817', '0');
INSERT INTO `ap_district` VALUES ('628', '81711', 'Huyện Cầu Ngang', '817', '0');
INSERT INTO `ap_district` VALUES ('629', '81705', 'Huyện Châu Thành', '817', '0');
INSERT INTO `ap_district` VALUES ('630', '81715', 'Huyện Duyên Hải', '817', '0');
INSERT INTO `ap_district` VALUES ('631', '81709', 'Huyện Tiểu Cần', '817', '0');
INSERT INTO `ap_district` VALUES ('632', '70133', 'Quận Thủ Đức', '701', '0');
INSERT INTO `ap_district` VALUES ('633', '10151', 'Huyện Ba Vì', '101', '0');
INSERT INTO `ap_district` VALUES ('634', '10153', 'Huyện Chương Mỹ', '101', '0');
INSERT INTO `ap_district` VALUES ('635', '10133', 'Huyện Đan Phượng', '101', '0');
INSERT INTO `ap_district` VALUES ('636', '10117', 'Huyện Đông Anh', '101', '0');
INSERT INTO `ap_district` VALUES ('637', '10119', 'Huyện Gia Lâm', '101', '0');
INSERT INTO `ap_district` VALUES ('638', '10137', 'Huyện Hoài Đức', '101', '0');
INSERT INTO `ap_district` VALUES ('639', '10125', 'Huyện Mê Linh', '101', '0');
INSERT INTO `ap_district` VALUES ('640', '10145', 'Huyện Mỹ Đức', '101', '0');
INSERT INTO `ap_district` VALUES ('641', '10149', 'Huyện Phú Xuyên', '101', '0');
INSERT INTO `ap_district` VALUES ('642', '10131', 'Huyện Phúc Thọ', '101', '0');
INSERT INTO `ap_district` VALUES ('643', '10139', 'Huyện Quốc Oai', '101', '0');
INSERT INTO `ap_district` VALUES ('644', '10115', 'Huyện Sóc Sơn', '101', '0');
INSERT INTO `ap_district` VALUES ('645', '10135', 'Huyện Thạch Thất', '101', '0');
INSERT INTO `ap_district` VALUES ('646', '10141', 'Huyện Thanh Oai', '101', '0');
INSERT INTO `ap_district` VALUES ('647', '10123', 'Huyện Thanh Trì', '101', '0');
INSERT INTO `ap_district` VALUES ('648', '10143', 'Huyện Thường Tín', '101', '0');
INSERT INTO `ap_district` VALUES ('649', '10121', 'Huyện Từ Liêm', '101', '0');
INSERT INTO `ap_district` VALUES ('650', '10147', 'Huyện ứng Hòa', '101', '0');
INSERT INTO `ap_district` VALUES ('651', '10101', 'Quận Ba Đình', '101', '0');
INSERT INTO `ap_district` VALUES ('652', '10113', 'Quận Cầu Giấy', '101', '0');
INSERT INTO `ap_district` VALUES ('653', '10109', 'Quận Đống Đa', '101', '0');
INSERT INTO `ap_district` VALUES ('654', '10127', 'Quận Hà Đông', '101', '0');
INSERT INTO `ap_district` VALUES ('655', '10107', 'Quận Hai Bà Trưng', '101', '0');
INSERT INTO `ap_district` VALUES ('656', '10105', 'Quận Hoàn Kiếm', '101', '0');
INSERT INTO `ap_district` VALUES ('657', '10108', 'Quận Hoàng Mai', '101', '0');
INSERT INTO `ap_district` VALUES ('658', '10106', 'Quận Long Biên', '101', '0');
INSERT INTO `ap_district` VALUES ('659', '81713', 'Huyện Trà Cú', '817', '0');
INSERT INTO `ap_district` VALUES ('660', '81701', 'Thị xã Trà Vinh', '817', '0');
INSERT INTO `ap_district` VALUES ('661', '21105', 'Huyện Chiêm Hóa', '211', '0');
INSERT INTO `ap_district` VALUES ('662', '21107', 'Huyện Hàm Yên', '211', '0');
INSERT INTO `ap_district` VALUES ('663', '21103', 'Huyện Nà Hang', '211', '0');
INSERT INTO `ap_district` VALUES ('664', '21111', 'Huyện Sơn Dương', '211', '0');
INSERT INTO `ap_district` VALUES ('665', '21109', 'Huyện Yên Sơn', '211', '0');
INSERT INTO `ap_district` VALUES ('666', '21101', 'Thị xã Tuyên Quang', '211', '0');
INSERT INTO `ap_district` VALUES ('667', '80907', 'Huyện Bình Minh', '809', '0');
INSERT INTO `ap_district` VALUES ('668', '80908', 'Huyện Bình Tân', '809', '0');
INSERT INTO `ap_district` VALUES ('669', '80903', 'Huyện Long Hồ', '809', '0');
INSERT INTO `ap_district` VALUES ('670', '80905', 'Huyện Mang Thít', '809', '0');
INSERT INTO `ap_district` VALUES ('671', '80909', 'Huyện Tam Bình', '809', '0');
INSERT INTO `ap_district` VALUES ('672', '80911', 'Huyện Trà ôn', '809', '0');
INSERT INTO `ap_district` VALUES ('673', '80913', 'Huyện Vũng Liêm', '809', '0');
INSERT INTO `ap_district` VALUES ('674', '80901', 'Thành Phố Vĩnh Long', '809', '0');
INSERT INTO `ap_district` VALUES ('675', '21913', 'Huyện Bình Xuyên', '219', '0');
INSERT INTO `ap_district` VALUES ('676', '21903', 'Huyện Lập Thạch', '219', '0');
INSERT INTO `ap_district` VALUES ('677', '21915', 'Huyện Sông Lô', '219', '0');
INSERT INTO `ap_district` VALUES ('678', '21904', 'Huyện Tam Đảo', '219', '0');
INSERT INTO `ap_district` VALUES ('679', '21905', 'Huyện Tam Dương', '219', '0');
INSERT INTO `ap_district` VALUES ('680', '21907', 'Huyện Vĩnh Tường', '219', '0');
INSERT INTO `ap_district` VALUES ('681', '21909', 'Huyện Yên Lạc', '219', '0');
INSERT INTO `ap_district` VALUES ('682', '21901', 'Thành Phố Vĩnh Yên', '219', '0');
INSERT INTO `ap_district` VALUES ('683', '21902', 'Thị xã Phúc Yên', '219', '0');
INSERT INTO `ap_district` VALUES ('684', '21305', 'Huyện Lục Yên', '213', '0');
INSERT INTO `ap_district` VALUES ('685', '21309', 'Huyện Mù Cang Chải', '213', '0');
INSERT INTO `ap_district` VALUES ('686', '21317', 'Huyện Trạm Tấu', '213', '0');
INSERT INTO `ap_district` VALUES ('687', '21311', 'Huyện Trấn Yên', '213', '0');
INSERT INTO `ap_district` VALUES ('688', '21315', 'Huyện Văn Chấn', '213', '0');
INSERT INTO `ap_district` VALUES ('689', '21307', 'Huyện Văn Yên', '213', '0');
INSERT INTO `ap_district` VALUES ('690', '21313', 'Huyện Yên Bình', '213', '0');
INSERT INTO `ap_district` VALUES ('691', '21301', 'Thành phố Yên Bái', '213', '0');
INSERT INTO `ap_district` VALUES ('692', '21303', 'Thị xã Nghĩa Lộ', '213', '0');

-- ----------------------------
-- Table structure for `ap_groups`
-- ----------------------------
DROP TABLE IF EXISTS `ap_groups`;
CREATE TABLE `ap_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `permission` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_groups
-- ----------------------------
INSERT INTO `ap_groups` VALUES ('1', 'Admin', 'Administrator', '{\"post\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"product\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"report\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"page\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"promotion\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"career\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"candidate\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"category\":{\"post\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"product\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"career\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"}},\"property\":{\"type\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"volume\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"packing\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"location\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"}},\"location\":{\"city\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"district\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"ward\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"}}}');
INSERT INTO `ap_groups` VALUES ('2', 'Biên tập viên', 'Nhóm biên tập quản trị nội dung web', '{\"post\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"product\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\"},\"report\":{\"view\":\"1\"},\"page\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"career\":{\"view\":\"1\"},\"candidate\":{\"view\":\"1\"},\"category\":{\"post\":{\"view\":\"1\",\"edit\":\"1\"},\"product\":{\"view\":\"1\",\"add\":\"1\",\"delete\":\"1\"},\"career\":{\"view\":\"1\"}},\"property\":{\"type\":{\"view\":\"1\",\"add\":\"1\"},\"volume\":{\"view\":\"1\",\"add\":\"1\"},\"packing\":{\"view\":\"1\",\"edit\":\"1\"},\"location\":{\"view\":\"1\"}},\"location\":{\"city\":{\"view\":\"1\"},\"ward\":{\"view\":\"1\"}}}');
INSERT INTO `ap_groups` VALUES ('4', 'Nhóm demo', 'Nhóm demo', '{\"historydv\":{\"view\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"working_field\":{\"view\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"project\":{\"view\":\"1\",\"add\":\"1\"},\"career\":{\"view\":\"1\",\"edit\":\"1\"},\"candidate\":{\"view\":\"1\"},\"question\":{\"view\":\"1\",\"delete\":\"1\"},\"category\":{\"post\":{\"view\":\"1\"}}}');

-- ----------------------------
-- Table structure for `ap_history`
-- ----------------------------
DROP TABLE IF EXISTS `ap_history`;
CREATE TABLE `ap_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(255) NOT NULL,
  `is_status` tinyint(2) unsigned NOT NULL DEFAULT 2 COMMENT 'trang thai',
  `displayed_time` date NOT NULL COMMENT 'ngay publish',
  `created_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngay tao',
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'ngay sua',
  `created_by` int(11) DEFAULT NULL COMMENT 'Người tạo',
  `updated_by` int(11) DEFAULT NULL COMMENT 'Người sửa',
  `order` int(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_history
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_history_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_history_translations`;
CREATE TABLE `ap_history_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_history_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_history_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_library`
-- ----------------------------
DROP TABLE IF EXISTS `ap_library`;
CREATE TABLE `ap_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(255) DEFAULT NULL,
  `album` text DEFAULT NULL,
  `is_status` tinyint(2) NOT NULL DEFAULT 2,
  `displayed_time` date DEFAULT NULL,
  `order` tinyint(1) NOT NULL,
  `linkvideo` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `type` tinyint(2) NOT NULL COMMENT '1: album anh 2:video  3:document',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_library
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_library_category`
-- ----------------------------
DROP TABLE IF EXISTS `ap_library_category`;
CREATE TABLE `ap_library_category` (
  `library_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`library_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_library_category
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_library_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_library_translations`;
CREATE TABLE `ap_library_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  KEY `id` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_library_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_location_city`
-- ----------------------------
DROP TABLE IF EXISTS `ap_location_city`;
CREATE TABLE `ap_location_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `region` tinyint(4) DEFAULT NULL COMMENT '1:mien bac 2:mien trung 3: mien nam',
  `name_with_type` varchar(250) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `order` int(6) DEFAULT 0,
  `thumbnail` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ap_location_city
-- ----------------------------
INSERT INTO `ap_location_city` VALUES ('1', 'Hà Nội', '1', 'Thành phố', 'ha-noi', '1', 'Thành phố Hà Nội', '21.0031177', '105.82014079999999', '5', '1556854168.jpeg', '1');
INSERT INTO `ap_location_city` VALUES ('2', 'Hà Giang', '24', 'Tỉnh', 'ha-giang', '1', 'Tỉnh Hà Giang', '22.7662056', '104.9388853', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('4', 'Cao Bằng', '17', 'Tỉnh', 'cao-bang', '1', 'Tỉnh Cao Bằng', '22.6356890', '106.2522143', '0', null, '1');
INSERT INTO `ap_location_city` VALUES ('6', 'Bắc Kạn', '6', 'Tỉnh', 'bac-kan', '1', 'Tỉnh Bắc Kạn', '22.3032923', '105.8760040', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('8', 'Tuyên Quang', '60', 'Tỉnh', 'tuyen-quang', '1', 'Tỉnh Tuyên Quang', '22.1726708', '105.3131185', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('10', 'Lào Cai', '38', 'Tỉnh', 'lao-cai', '1', 'Tỉnh Lào Cai', '22.3380865', '104.1487055', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('11', 'Điện Biên', '20', 'Tỉnh', 'dien-bien', '1', 'Tỉnh Điện Biên', '21.8042309', '103.1076525', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('12', 'Lai Châu', '35', 'Tỉnh', 'lai-chau', '1', 'Tỉnh Lai Châu', '22.3686613', '103.3119085', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('14', 'Sơn La', '52', 'Tỉnh', 'son-la', '1', 'Tỉnh Sơn La', '21.1022284', '103.7289167', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('15', 'Yên Bái', '63', 'Tỉnh', 'yen-bai', '1', 'Tỉnh Yên Bái', '21.6837923', '104.4551361', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('17', 'Hoà Bình', '30', 'Tỉnh', 'hoa-binh', '1', 'Tỉnh Hoà Bình', '20.6861265', '105.3131185', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('19', 'Thái Nguyên', '55', 'Tỉnh', 'thai-nguyen', '1', 'Tỉnh Thái Nguyên', '21.5613771', '105.8760040', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('20', 'Lạng Sơn', '37', 'Tỉnh', 'lang-son', '1', 'Tỉnh Lạng Sơn', '21.8563705', '106.6291304', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('22', 'Quảng Ninh', '49', 'Tỉnh', 'quang-ninh', '1', 'Tỉnh Quảng Ninh', '21.0063820', '107.2925144', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('24', 'Bắc Giang', '5', 'Tỉnh', 'bac-giang', '1', 'Tỉnh Bắc Giang', '21.3014947', '106.6291304', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('25', 'Phú Thọ', '44', 'Tỉnh', 'phu-tho', '1', 'Tỉnh Phú Thọ', '21.2684430', '105.2045573', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('26', 'Vĩnh Phúc', '62', 'Tỉnh', 'vinh-phuc', '1', 'Tỉnh Vĩnh Phúc', '21.3608805', '105.5474373', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('27', 'Bắc Ninh', '8', 'Tỉnh', 'bac-ninh', '1', 'Tỉnh Bắc Ninh', '21.1214440', '106.1110501', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('30', 'Hải Dương', '25', 'Tỉnh', 'hai-duong', '1', 'Tỉnh Hải Dương', '20.9385958', '106.3206861', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('31', 'Hải Phòng', '4', 'Thành phố', 'hai-phong', '1', 'Thành phố Hải Phòng', '20.8449115', '106.6880841', '2', null, '0');
INSERT INTO `ap_location_city` VALUES ('33', 'Hưng Yên', '31', 'Tỉnh', 'hung-yen', '1', 'Tỉnh Hưng Yên', '20.8525711', '106.0169971', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('34', 'Thái Bình', '54', 'Tỉnh', 'thai-binh', '1', 'Tỉnh Thái Bình', '20.5386936', '106.3934777', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('35', 'Hà Nam', '27', 'Tỉnh', 'ha-nam', '1', 'Tỉnh Hà Nam', '20.5835196', '105.9229900', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('36', 'Nam Định', '40', 'Tỉnh', 'nam-dinh', '1', 'Tỉnh Nam Định', '20.2791804', '106.2051484', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('37', 'Ninh Bình', '42', 'Tỉnh', 'ninh-binh', '1', 'Tỉnh Ninh Bình', '20.2129969', '105.9229900', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('38', 'Thanh Hóa', '56', 'Tỉnh', 'thanh-hoa', '2', 'Tỉnh Thanh Hóa', '20.1291279', '105.3131185', '0', null, '1');
INSERT INTO `ap_location_city` VALUES ('40', 'Nghệ An', '41', 'Tỉnh', 'nghe-an', '2', 'Tỉnh Nghệ An', '19.2342489', '104.9200365', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('42', 'Hà Tĩnh', '28', 'Tỉnh', 'ha-tinh', '2', 'Tỉnh Hà Tĩnh', '18.2943776', '105.6745247', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('44', 'Quảng Bình', '46', 'Tỉnh', 'quang-binh', '2', 'Tỉnh Quảng Bình', '17.6102715', '106.3487474', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('45', 'Quảng Trị', '50', 'Tỉnh', 'quang-tri', '2', 'Tỉnh Quảng Trị', '16.7943472', '106.9634090', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('46', 'Thừa Thiên Huế', '57', 'Tỉnh', 'thua-thien-hue', '2', 'Tỉnh Thừa Thiên Huế', '16.4673970', '107.5905326', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('48', 'Đà Nẵng', '3', 'Thành phố', 'da-nang', '2', 'Thành phố Đà Nẵng', '16.0544068', '108.2021667', '3', null, '0');
INSERT INTO `ap_location_city` VALUES ('49', 'Quảng Nam', '47', 'Tỉnh', 'quang-nam', '2', 'Tỉnh Quảng Nam', '15.5393538', '108.0191020', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('51', 'Quảng Ngãi', '48', 'Tỉnh', 'quang-ngai', '2', 'Tỉnh Quảng Ngãi', '15.0759838', '108.7125791', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('52', 'Bình Định', '11', 'Tỉnh', 'binh-dinh', '2', 'Tỉnh Bình Định', '14.1665324', '108.9026830', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('54', 'Phú Yên', '45', 'Tỉnh', 'phu-yen', '2', 'Tỉnh Phú Yên', '13.0881861', '109.0928764', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('56', 'Khánh Hòa', '32', 'Tỉnh', 'khanh-hoa', '2', 'Tỉnh Khánh Hòa', '12.2585098', '109.0526076', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('58', 'Ninh Thuận', '43', 'Tỉnh', 'ninh-thuan', '2', 'Tỉnh Ninh Thuận', '11.6738767', '108.8629572', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('60', 'Bình Thuận', '14', 'Tỉnh', 'binh-thuan', '2', 'Tỉnh Bình Thuận', '11.0903703', '108.0720781', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('62', 'Kon Tum', '34', 'Tỉnh', 'kon-tum', '2', 'Tỉnh Kon Tum', '14.6611670', '107.8388500', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('64', 'Gia Lai', '23', 'Tỉnh', 'gia-lai', '2', 'Tỉnh Gia Lai', '13.8078943', '108.1093750', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('66', 'Đắk Lắk', '18', 'Tỉnh', 'dak-lak', '2', 'Tỉnh Đắk Lắk', '12.7100116', '108.2377519', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('67', 'Đắk Nông', '19', 'Tỉnh', 'dak-nong', '2', 'Tỉnh Đắk Nông', '12.2646476', '107.6098060', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('68', 'Lâm Đồng', '36', 'Tỉnh', 'lam-dong', '3', 'Tỉnh Lâm Đồng', '11.5752791', '108.1428669', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('70', 'Bình Phước', '13', 'Tỉnh', 'binh-phuoc', '3', 'Tỉnh Bình Phước', '11.7511894', '106.7234639', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('72', 'Tây Ninh', '53', 'Tỉnh', 'tay-ninh', '3', 'Tỉnh Tây Ninh', '11.3494766', '106.0640179', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('74', 'Bình Dương', '12', 'Tỉnh', 'binh-duong', '3', 'Tỉnh Bình Dương', '11.3254024', '106.4770170', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('75', 'Đồng Nai', '21', 'Tỉnh', 'dong-nai', '3', 'Tỉnh Đồng Nai', '11.0686305', '107.1675976', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('77', 'Bà Rịa - Vũng Tàu', '9', 'Tỉnh', 'ba-ria---vung-tau', '3', 'Tỉnh Bà Rịa - Vũng Tàu', '10.5417397', '107.2429976', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('79', 'Hồ Chí Minh', '2', 'Thành phố', 'ho-chi-minh', '3', 'Thành phố Hồ Chí Minh', '10.8230989', '106.6296638', '4', 'hinh-anh-thiet-ke-noi-that-chung-cu-hoa-binh-green-112620-060217.jpg', '1');
INSERT INTO `ap_location_city` VALUES ('80', 'Long An', '39', 'Tỉnh', 'long-an', '3', 'Tỉnh Long An', '10.6955720', '106.2431205', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('82', 'Tiền Giang', '58', 'Tỉnh', 'tien-giang', '3', 'Tỉnh Tiền Giang', '10.4493324', '106.3420504', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('83', 'Bến Tre', '10', 'Tỉnh', 'ben-tre', '3', 'Tỉnh Bến Tre', '10.1081553', '106.4405872', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('84', 'Trà Vinh', '59', 'Tỉnh', 'tra-vinh', '3', 'Tỉnh Trà Vinh', '9.8127410', '106.2992912', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('86', 'Vĩnh Long', '61', 'Tỉnh', 'vinh-long', '3', 'Tỉnh Vĩnh Long', '10.0861281', '106.0169971', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('87', 'Đồng Tháp', '22', 'Tỉnh', 'dong-thap', '3', 'Tỉnh Đồng Tháp', '10.4937989', '105.6881788', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('89', 'An Giang', '5', 'Tỉnh', 'an-giang', '3', 'Tỉnh An Giang', '10.5215836', '105.1258955', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('91', 'Kiên Giang', '33', 'Tỉnh', 'kien-giang', '3', 'Tỉnh Kiên Giang', '9.8249587', '105.1258955', '0', null, '0');
INSERT INTO `ap_location_city` VALUES ('92', 'Cần Thơ', '5', 'Thành phố', 'can-tho', '3', 'Thành phố Cần Thơ', '10.0451618', '105.7468535', '1', null, '1');
INSERT INTO `ap_location_city` VALUES ('93', 'Hậu Giang', '29', 'Tỉnh', 'hau-giang', '3', 'Tỉnh Hậu Giang', '9.7578980', '105.6412527', '0', null, '1');
INSERT INTO `ap_location_city` VALUES ('94', 'Sóc Trăng', '51', 'Tỉnh', 'soc-trang', '3', 'Tỉnh Sóc Trăng', '9.6003688', '105.9599539', '0', null, '1');
INSERT INTO `ap_location_city` VALUES ('95', 'Bạc Liêu', '7', 'Tỉnh', 'bac-lieu', '3', 'Tỉnh Bạc Liêu', '9.2515555', '105.5136472', '0', null, '1');
INSERT INTO `ap_location_city` VALUES ('96', 'Cà Mau', '15', 'Tỉnh', 'ca-mau', '3', 'Tỉnh Cà Mau', '8.9624099', '105.1258955', '0', null, '1');

-- ----------------------------
-- Table structure for `ap_location_country`
-- ----------------------------
DROP TABLE IF EXISTS `ap_location_country`;
CREATE TABLE `ap_location_country` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `format` decimal(10,2) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '1:hien, 0: ẩn',
  `currency_apply` int(1) DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp(),
  `updated_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_location_country
-- ----------------------------
INSERT INTO `ap_location_country` VALUES ('6', 'Việt Nam', 'Dong', 'VND', '₫', '2222.00', '1', '0', '2019-06-10 10:24:18', '2019-06-10 10:24:18');
INSERT INTO `ap_location_country` VALUES ('7', 'English', 'EURO', 'EUR', '€', '1.00', '1', '1', '2019-07-08 04:36:07', '2019-07-08 04:36:07');
INSERT INTO `ap_location_country` VALUES ('8', 'Denmark', 'Krone', 'DKK', 'kr', '7.47', '1', '1', '2019-07-08 04:36:07', '2019-07-08 04:36:07');
INSERT INTO `ap_location_country` VALUES ('31', 'Úc', 'Đô la Úc', 'AUD', '$, A$, AU$', '30000.00', '1', '0', '2019-08-01 15:09:39', '2019-08-01 15:09:39');
INSERT INTO `ap_location_country` VALUES ('39', 'Germany', 'EUR', 'EUR', 'DE', '3500.00', '1', '0', '2019-08-21 22:45:57', '2019-08-21 22:45:57');
INSERT INTO `ap_location_country` VALUES ('40', 'Singapore', null, null, null, null, '1', '0', '2019-08-26 17:29:48', '2019-08-26 17:29:48');
INSERT INTO `ap_location_country` VALUES ('41', 'sweden', 'Kronor', 'SEK', 'SEK', '10.00', '1', '0', '2019-08-28 06:15:19', '2019-08-28 06:15:19');

-- ----------------------------
-- Table structure for `ap_location_district`
-- ----------------------------
DROP TABLE IF EXISTS `ap_location_district`;
CREATE TABLE `ap_location_district` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Tỉnh / TP Trực thuộc TW',
  `title` varchar(250) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `name_with_type` varchar(250) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `is_featured` int(2) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=976 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ap_location_district
-- ----------------------------
INSERT INTO `ap_location_district` VALUES ('973', '96', 'Ngọc Hiển', '354', 'Huyện', 'ngoc-hien', 'Huyện Ngọc Hiển, Cà Mau', '8.6677256', '105.0032366', null, '0');
INSERT INTO `ap_location_district` VALUES ('972', '96', 'Phú Tân', '399', 'Huyện', 'phu-tan', 'Huyện Phú Tân, Cà Mau', '8.9291357', '104.8921668', null, '0');
INSERT INTO `ap_location_district` VALUES ('971', '96', 'Năm Căn', '332', 'Huyện', 'nam-can', 'Huyện Năm Căn, Cà Mau', '8.8153071', '105.0557415', null, '0');
INSERT INTO `ap_location_district` VALUES ('970', '96', 'Đầm Dơi', '671', 'Huyện', 'dam-doi', 'Huyện Đầm Dơi, Cà Mau', '8.9994186', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('969', '96', 'Cái Nước', '75', 'Huyện', 'cai-nuoc', 'Huyện Cái Nước, Cà Mau', '8.9867763', '105.0557415', null, '0');
INSERT INTO `ap_location_district` VALUES ('968', '96', 'Trần Văn Thời', '568', 'Huyện', 'tran-van-thoi', 'Huyện Trần Văn Thời, Cà Mau', '9.1009716', '104.8921668', null, '0');
INSERT INTO `ap_location_district` VALUES ('966', '96', 'U Minh', '594', 'Huyện', 'u-minh', 'Huyện U Minh, Cà Mau', '9.3554435', '104.9856176', null, '0');
INSERT INTO `ap_location_district` VALUES ('967', '96', 'Thới Bình', '537', 'Huyện', 'thoi-binh', 'Huyện Thới Bình, Cà Mau', '9.3473628', '105.1726816', null, '0');
INSERT INTO `ap_location_district` VALUES ('964', '96', 'Cà Mau', '71', 'Thành phố', 'ca-mau', 'Thành phố Cà Mau, Cà Mau', '9.1526728', '105.1960795', null, '0');
INSERT INTO `ap_location_district` VALUES ('961', '95', 'Hoà Bình', '195', 'Huyện', 'hoa-binh', 'Huyện Hoà Bình, Bạc Liêu', '9.2704595', '105.5897386', null, '0');
INSERT INTO `ap_location_district` VALUES ('959', '95', 'Giá Rai', '157', 'Thị xã', 'gia-rai', 'Thị xã Giá Rai, Bạc Liêu', '9.2601360', '105.3753129', null, '0');
INSERT INTO `ap_location_district` VALUES ('960', '95', 'Đông Hải', '690', 'Huyện', 'dong-hai', 'Huyện Đông Hải, Bạc Liêu', '9.1630642', '105.4536718', null, '0');
INSERT INTO `ap_location_district` VALUES ('958', '95', 'Vĩnh Lợi', '621', 'Huyện', 'vinh-loi', 'Huyện Vĩnh Lợi, Bạc Liêu', '9.3450296', '105.7116464', null, '0');
INSERT INTO `ap_location_district` VALUES ('956', '95', 'Hồng Dân', '213', 'Huyện', 'hong-dan', 'Huyện Hồng Dân, Bạc Liêu', '9.5539029', '105.4520500', null, '0');
INSERT INTO `ap_location_district` VALUES ('957', '95', 'Phước Long', '410', 'Huyện', 'phuoc-long', 'Huyện Phước Long, Bạc Liêu', '9.4006715', '105.4302383', null, '0');
INSERT INTO `ap_location_district` VALUES ('954', '95', 'Bạc Liêu', '26', 'Thành phố', 'bac-lieu', 'Thành phố Bạc Liêu, Bạc Liêu', '9.2573324', '105.7557791', null, '0');
INSERT INTO `ap_location_district` VALUES ('951', '94', 'Trần Đề', '570', 'Huyện', 'tran-de', 'Huyện Trần Đề, Sóc Trăng', '9.4997800', '106.0875326', null, '0');
INSERT INTO `ap_location_district` VALUES ('950', '94', 'Vĩnh Châu', '616', 'Thị xã', 'vinh-chau', 'Thị xã Vĩnh Châu, Sóc Trăng', '9.3249582', '105.9804542', null, '0');
INSERT INTO `ap_location_district` VALUES ('949', '94', 'Thạnh Trị', '531', 'Huyện', 'thanh-tri', 'Huyện Thạnh Trị, Sóc Trăng', '9.4741407', '105.7116464', null, '0');
INSERT INTO `ap_location_district` VALUES ('948', '94', 'Ngã Năm', '344', 'Thị xã', 'nga-nam', 'Thị xã Ngã Năm, Sóc Trăng', '9.5215171', '105.6177942', null, '0');
INSERT INTO `ap_location_district` VALUES ('947', '94', 'Mỹ Xuyên', '328', 'Huyện', 'my-xuyen', 'Huyện Mỹ Xuyên, Sóc Trăng', '9.4655111', '105.8994956', null, '0');
INSERT INTO `ap_location_district` VALUES ('946', '94', 'Long Phú', '289', 'Huyện', 'long-phu', 'Huyện Long Phú, Sóc Trăng', '9.6289421', '106.0875326', null, '0');
INSERT INTO `ap_location_district` VALUES ('945', '94', 'Cù Lao Dung', '136', 'Huyện', 'cu-lao-dung', 'Huyện Cù Lao Dung, Sóc Trăng', '9.5791522', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('944', '94', 'Mỹ Tú', '327', 'Huyện', 'my-tu', 'Huyện Mỹ Tú, Sóc Trăng', '9.5991040', '105.8055471', null, '0');
INSERT INTO `ap_location_district` VALUES ('943', '94', 'Kế Sách', '231', 'Huyện', 'ke-sach', 'Huyện Kế Sách, Sóc Trăng', '9.8310108', '105.9229900', null, '0');
INSERT INTO `ap_location_district` VALUES ('942', '94', 'Châu Thành', '112', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Sóc Trăng', '9.6809726', '105.8994956', null, '0');
INSERT INTO `ap_location_district` VALUES ('941', '94', 'Sóc Trăng', '455', 'Thành phố', 'soc-trang', 'Thành phố Sóc Trăng, Sóc Trăng', '9.6025210', '105.9739049', null, '0');
INSERT INTO `ap_location_district` VALUES ('937', '93', 'Long Mỹ', '288', 'Thị xã', 'long-my', 'Thị xã Long Mỹ, Hậu Giang', '9.6695970', '105.5650239', null, '0');
INSERT INTO `ap_location_district` VALUES ('935', '93', 'Vị Thuỷ', '610', 'Huyện', 'vi-thuy', 'Huyện Vị Thuỷ, Hậu Giang', '9.8260824', '105.5708865', null, '0');
INSERT INTO `ap_location_district` VALUES ('936', '93', 'Long Mỹ', '287', 'Huyện', 'long-my', 'Huyện Long Mỹ, Hậu Giang', '9.6552847', '105.5239912', null, '0');
INSERT INTO `ap_location_district` VALUES ('934', '93', 'Phụng Hiệp', '408', 'Huyện', 'phung-hiep', 'Huyện Phụng Hiệp, Hậu Giang', '9.7762126', '105.7116464', null, '0');
INSERT INTO `ap_location_district` VALUES ('933', '93', 'Châu Thành', '111', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Hậu Giang', '9.9216255', '105.8073554', null, '0');
INSERT INTO `ap_location_district` VALUES ('932', '93', 'Châu Thành A', '113', 'Huyện', 'chau-thanh-a', 'Huyện Châu Thành A, Hậu Giang', '9.9267260', '105.6315594', null, '0');
INSERT INTO `ap_location_district` VALUES ('931', '93', 'Ngã Bảy', '343', 'Thị xã', 'nga-bay', 'Thị xã Ngã Bảy, Hậu Giang', '9.8252566', '105.8172881', null, '0');
INSERT INTO `ap_location_district` VALUES ('930', '93', 'Vị Thanh', '609', 'Thành phố', 'vi-thanh', 'Thành phố Vị Thanh, Hậu Giang', '9.7731921', '105.4537082', null, '0');
INSERT INTO `ap_location_district` VALUES ('927', '92', 'Thới Lai', '538', 'Huyện', 'thoi-lai', 'Huyện Thới Lai, Cần Thơ', '10.0681881', '105.5599728', null, '0');
INSERT INTO `ap_location_district` VALUES ('925', '92', 'Cờ Đỏ', '131', 'Huyện', 'co-do', 'Huyện Cờ Đỏ, Cần Thơ', '10.0972302', '105.4304423', null, '0');
INSERT INTO `ap_location_district` VALUES ('926', '92', 'Phong Điền', '382', 'Huyện', 'phong-dien', 'Huyện Phong Điền, Cần Thơ', '9.9967657', '105.6686611', null, '0');
INSERT INTO `ap_location_district` VALUES ('924', '92', 'Vĩnh Thạnh', '624', 'Huyện', 'vinh-thanh', 'Huyện Vĩnh Thạnh, Cần Thơ', '10.2322696', '105.3987034', null, '0');
INSERT INTO `ap_location_district` VALUES ('923', '92', 'Thốt Nốt', '541', 'Quận', 'thot-not', 'Quận Thốt Nốt, Cần Thơ', '10.2405338', '105.5336815', null, '0');
INSERT INTO `ap_location_district` VALUES ('919', '92', 'Cái Răng', '76', 'Quận', 'cai-rang', 'Quận Cái Răng, Cần Thơ', '9.9992392', '105.8043572', null, '0');
INSERT INTO `ap_location_district` VALUES ('918', '92', 'Bình Thuỷ', '61', 'Quận', 'binh-thuy', 'Quận Bình Thuỷ, Cần Thơ', '10.0622567', '105.7381017', null, '0');
INSERT INTO `ap_location_district` VALUES ('917', '92', 'Ô Môn', '375', 'Quận', 'o-mon', 'Quận Ô Môn, Cần Thơ', '10.1164943', '105.6326457', null, '0');
INSERT INTO `ap_location_district` VALUES ('916', '92', 'Ninh Kiều', '369', 'Quận', 'ninh-kieu', 'Quận Ninh Kiều, Cần Thơ', '10.0272537', '105.7698039', null, '0');
INSERT INTO `ap_location_district` VALUES ('914', '91', 'Giang Thành', '159', 'Huyện', 'giang-thanh', 'Huyện Giang Thành, Kiên Giang', '10.4771358', '104.6821048', null, '0');
INSERT INTO `ap_location_district` VALUES ('913', '91', 'U Minh Thượng', '595', 'Huyện', 'u-minh-thuong', 'Huyện U Minh Thượng, Kiên Giang', '9.6311125', '105.1025075', null, '0');
INSERT INTO `ap_location_district` VALUES ('912', '91', 'Kiên Hải', '236', 'Huyện', 'kien-hai', 'Huyện Kiên Hải, Kiên Giang', '9.8091362', '104.6296338', null, '0');
INSERT INTO `ap_location_district` VALUES ('911', '91', 'Phú Quốc', '396', 'Huyện', 'phu-quoc', 'Huyện Phú Quốc, Kiên Giang', '10.1586245', '103.9840200', null, '0');
INSERT INTO `ap_location_district` VALUES ('910', '91', 'Vĩnh Thuận', '625', 'Huyện', 'vinh-thuan', 'Huyện Vĩnh Thuận, Kiên Giang', '9.5384134', '105.2428853', null, '0');
INSERT INTO `ap_location_district` VALUES ('909', '91', 'An Minh', '6', 'Huyện', 'an-minh', 'Huyện An Minh, Kiên Giang', '9.6647183', '104.9495651', null, '0');
INSERT INTO `ap_location_district` VALUES ('907', '91', 'Gò Quao', '168', 'Huyện', 'go-quao', 'Huyện Gò Quao, Kiên Giang', '9.7525077', '105.2897042', null, '0');
INSERT INTO `ap_location_district` VALUES ('908', '91', 'An Biên', '1', 'Huyện', 'an-bien', 'Huyện An Biên, Kiên Giang', '9.8064559', '105.0557415', null, '0');
INSERT INTO `ap_location_district` VALUES ('906', '91', 'Giồng Riềng', '162', 'Huyện', 'giong-rieng', 'Huyện Giồng Riềng, Kiên Giang', '9.9238222', '105.3728845', null, '0');
INSERT INTO `ap_location_district` VALUES ('905', '91', 'Châu Thành', '110', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Kiên Giang', '9.8889535', '105.1492869', null, '0');
INSERT INTO `ap_location_district` VALUES ('904', '91', 'Tân Hiệp', '484', 'Huyện', 'tan-hiep', 'Huyện Tân Hiệp, Kiên Giang', '10.1154358', '105.2834404', null, '0');
INSERT INTO `ap_location_district` VALUES ('903', '91', 'Hòn Đất', '211', 'Huyện', 'hon-dat', 'Huyện Hòn Đất, Kiên Giang', '10.2227003', '104.9856176', null, '0');
INSERT INTO `ap_location_district` VALUES ('902', '91', 'Kiên Lương', '237', 'Huyện', 'kien-luong', 'Huyện Kiên Lương, Kiên Giang', '10.3043903', '104.6354631', null, '0');
INSERT INTO `ap_location_district` VALUES ('900', '91', 'Hà Tiên', '175', 'Thị xã', 'ha-tien', 'Thị xã Hà Tiên, Kiên Giang', '10.3819090', '104.4901728', null, '0');
INSERT INTO `ap_location_district` VALUES ('899', '91', 'Rạch Giá', '447', 'Thành phố', 'rach-gia', 'Thành phố Rạch Giá, Kiên Giang', '10.0215070', '105.0910974', null, '0');
INSERT INTO `ap_location_district` VALUES ('894', '89', 'Thoại Sơn', '536', 'Huyện', 'thoai-son', 'Huyện Thoại Sơn, An Giang', '10.2595103', '105.2608002', null, '0');
INSERT INTO `ap_location_district` VALUES ('893', '89', 'Chợ Mới', '122', 'Huyện', 'cho-moi', 'Huyện Chợ Mới, An Giang', '10.4825247', '105.4771084', null, '0');
INSERT INTO `ap_location_district` VALUES ('891', '89', 'Tri Tôn', '574', 'Huyện', 'tri-ton', 'Huyện Tri Tôn, An Giang', '10.3972321', '104.9856176', null, '0');
INSERT INTO `ap_location_district` VALUES ('892', '89', 'Châu Thành', '109', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, An Giang', '10.4454629', '105.3835120', null, '0');
INSERT INTO `ap_location_district` VALUES ('890', '89', 'Tịnh Biên', '560', 'Huyện', 'tinh-bien', 'Huyện Tịnh Biên, An Giang', '10.5491070', '105.0089888', null, '0');
INSERT INTO `ap_location_district` VALUES ('889', '89', 'Châu Phú', '102', 'Huyện', 'chau-phu', 'Huyện Châu Phú, An Giang', '10.5630265', '105.1726816', null, '0');
INSERT INTO `ap_location_district` VALUES ('888', '89', 'Phú Tân', '398', 'Huyện', 'phu-tan', 'Huyện Phú Tân, An Giang', '10.5942654', '105.3528491', null, '0');
INSERT INTO `ap_location_district` VALUES ('887', '89', 'Tân Châu', '483', 'Thị xã', 'tan-chau', 'Thị xã Tân Châu, An Giang', '10.8026827', '105.1960795', null, '0');
INSERT INTO `ap_location_district` VALUES ('886', '89', 'An Phú', '8', 'Huyện', 'an-phu', 'Huyện An Phú, An Giang', '10.8512167', '105.1025075', null, '0');
INSERT INTO `ap_location_district` VALUES ('884', '89', 'Châu Đốc', '114', 'Thành phố', 'chau-doc', 'Thành phố Châu Đốc, An Giang', '10.6820814', '105.0823967', null, '0');
INSERT INTO `ap_location_district` VALUES ('883', '89', 'Long Xuyên', '291', 'Thành phố', 'long-xuyen', 'Thành phố Long Xuyên, An Giang', '10.3759416', '105.4185406', null, '0');
INSERT INTO `ap_location_district` VALUES ('877', '87', 'Châu Thành', '108', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Đồng Tháp', '10.2050554', '105.8055471', null, '0');
INSERT INTO `ap_location_district` VALUES ('876', '87', 'Lai Vung', '267', 'Huyện', 'lai-vung', 'Huyện Lai Vung, Đồng Tháp', '10.2554550', '105.6647142', null, '0');
INSERT INTO `ap_location_district` VALUES ('874', '87', 'Thanh Bình', '518', 'Huyện', 'thanh-binh', 'Huyện Thanh Bình, Đồng Tháp', '10.6135294', '105.4771084', null, '0');
INSERT INTO `ap_location_district` VALUES ('875', '87', 'Lấp Vò', '277', 'Huyện', 'lap-vo', 'Huyện Lấp Vò, Đồng Tháp', '10.3578054', '105.6308159', null, '0');
INSERT INTO `ap_location_district` VALUES ('873', '87', 'Cao Lãnh', '94', 'Huyện', 'cao-lanh', 'Huyện Cao Lãnh, Đồng Tháp', '10.4659577', '105.7059785', null, '0');
INSERT INTO `ap_location_district` VALUES ('872', '87', 'Tháp Mười', '533', 'Huyện', 'thap-muoi', 'Huyện Tháp Mười, Đồng Tháp', '10.5302706', '105.8290298', null, '0');
INSERT INTO `ap_location_district` VALUES ('870', '87', 'Hồng Ngự', '216', 'Huyện', 'hong-ngu', 'Huyện Hồng Ngự, Đồng Tháp', '10.7979866', '105.2897042', null, '0');
INSERT INTO `ap_location_district` VALUES ('871', '87', 'Tam Nông', '475', 'Huyện', 'tam-nong', 'Huyện Tam Nông, Đồng Tháp', '10.7192793', '105.5474373', null, '0');
INSERT INTO `ap_location_district` VALUES ('869', '87', 'Tân Hồng', '485', 'Huyện', 'tan-hong', 'Huyện Tân Hồng, Đồng Tháp', '10.8761150', '105.4771084', null, '0');
INSERT INTO `ap_location_district` VALUES ('868', '87', 'Hồng Ngự', '215', 'Thị xã', 'hong-ngu', 'Thị xã Hồng Ngự, Đồng Tháp', '10.8255238', '105.3950939', null, '0');
INSERT INTO `ap_location_district` VALUES ('867', '87', 'Sa Đéc', '450', 'Thành phố', 'sa-dec', 'Thành phố Sa Đéc, Đồng Tháp', '10.3057678', '105.7468535', null, '0');
INSERT INTO `ap_location_district` VALUES ('866', '87', 'Cao Lãnh', '93', 'Thành phố', 'cao-lanh', 'Thành phố Cao Lãnh, Đồng Tháp', '10.4549723', '105.6340352', null, '0');
INSERT INTO `ap_location_district` VALUES ('862', '86', 'Trà Ôn', '565', 'Huyện', 'tra-on', 'Huyện Trà Ôn, Vĩnh Long', '9.9789961', '105.9934910', null, '0');
INSERT INTO `ap_location_district` VALUES ('863', '86', 'Bình Tân', '59', 'Huyện', 'binh-tan', 'Huyện Bình Tân, Vĩnh Long', '10.1218894', '105.7728863', null, '0');
INSERT INTO `ap_location_district` VALUES ('861', '86', 'Bình Minh', '56', 'Thị xã', 'binh-minh', 'Thị xã Bình Minh, Vĩnh Long', '10.0291920', '105.8525154', null, '0');
INSERT INTO `ap_location_district` VALUES ('860', '86', 'Tam Bình', '471', 'Huyện', 'tam-binh', 'Huyện Tam Bình, Vĩnh Long', '10.0679356', '105.9464874', null, '0');
INSERT INTO `ap_location_district` VALUES ('859', '86', 'Vũng Liêm', '632', 'Huyện', '#NAME?', 'Huyện Vũng Liêm, Vĩnh Long', '10.0586320', '106.1345705', null, '0');
INSERT INTO `ap_location_district` VALUES ('858', '86', 'Mang Thít', '303', 'Huyện', 'mang-thit', 'Huyện Mang Thít, Vĩnh Long', '10.1807600', '106.0757749', null, '0');
INSERT INTO `ap_location_district` VALUES ('857', '86', 'Long Hồ', '285', 'Huyện', 'long-ho', 'Huyện Long Hồ, Vĩnh Long', '10.1980682', '105.9464874', null, '0');
INSERT INTO `ap_location_district` VALUES ('855', '86', 'Vĩnh Long', '622', 'Thành phố', 'vinh-long', 'Thành phố Vĩnh Long, Vĩnh Long', '10.2448442', '105.9588650', null, '0');
INSERT INTO `ap_location_district` VALUES ('851', '84', 'Duyên Hải', '149', 'Thị xã', 'duyen-hai', 'Thị xã Duyên Hải, Trà Vinh', '9.6331608', '106.4975726', null, '0');
INSERT INTO `ap_location_district` VALUES ('849', '84', 'Trà Cú', '563', 'Huyện', 'tra-cu', 'Huyện Trà Cú, Trà Vinh', '9.7060851', '106.2757514', null, '0');
INSERT INTO `ap_location_district` VALUES ('850', '84', 'Duyên Hải', '148', 'Huyện', 'duyen-hai', 'Huyện Duyên Hải, Trà Vinh', '9.6311842', '106.4877072', null, '0');
INSERT INTO `ap_location_district` VALUES ('848', '84', 'Cầu Ngang', '101', 'Huyện', 'cau-ngang', 'Huyện Cầu Ngang, Trà Vinh', '9.7830517', '106.4641459', null, '0');
INSERT INTO `ap_location_district` VALUES ('847', '84', 'Châu Thành', '107', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Trà Vinh', '9.8331585', '106.3228338', null, '0');
INSERT INTO `ap_location_district` VALUES ('845', '84', 'Cầu Kè', '100', 'Huyện', 'cau-ke', 'Huyện Cầu Kè, Trà Vinh', '9.8878863', '106.0875326', null, '0');
INSERT INTO `ap_location_district` VALUES ('846', '84', 'Tiểu Cần', '559', 'Huyện', 'tieu-can', 'Huyện Tiểu Cần, Trà Vinh', '9.7969156', '106.1816196', null, '0');
INSERT INTO `ap_location_district` VALUES ('844', '84', 'Càng Long', '91', 'Huyện', 'cang-long', 'Huyện Càng Long, Trà Vinh', '9.9674087', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('842', '84', 'Trà Vinh', '566', 'Thành phố', 'tra-vinh', 'Thành phố Trà Vinh, Trà Vinh', '9.9513316', '106.3346061', null, '0');
INSERT INTO `ap_location_district` VALUES ('838', '83', 'Mỏ Cày Bắc', '309', 'Huyện', 'mo-cay-bac', 'Huyện Mỏ Cày Bắc, Bến Tre', '10.1700758', '106.2875210', null, '0');
INSERT INTO `ap_location_district` VALUES ('836', '83', 'Ba Tri', '17', 'Huyện', 'ba-tri', 'Huyện Ba Tri, Bến Tre', '10.0417849', '106.5936741', null, '0');
INSERT INTO `ap_location_district` VALUES ('837', '83', 'Thạnh Phú', '527', 'Huyện', 'thanh-phu', 'Huyện Thạnh Phú, Bến Tre', '9.9077234', '106.5584071', null, '0');
INSERT INTO `ap_location_district` VALUES ('835', '83', 'Bình Đại', '63', 'Huyện', 'binh-dai', 'Huyện Bình Đại, Bến Tre', '10.1596899', '106.6998767', null, '0');
INSERT INTO `ap_location_district` VALUES ('834', '83', 'Giồng Trôm', '163', 'Huyện', 'giong-trom', 'Huyện Giồng Trôm, Bến Tre', '10.1718844', '106.4641459', null, '0');
INSERT INTO `ap_location_district` VALUES ('833', '83', 'Mỏ Cày Nam', '310', 'Huyện', 'mo-cay-nam', 'Huyện Mỏ Cày Nam, Bến Tre', '10.0468396', '106.3699271', null, '0');
INSERT INTO `ap_location_district` VALUES ('832', '83', 'Chợ Lách', '120', 'Huyện', 'cho-lach', 'Huyện Chợ Lách, Bến Tre', '10.2410940', '106.1698563', null, '0');
INSERT INTO `ap_location_district` VALUES ('831', '83', 'Châu Thành', '106', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Bến Tre', '10.3067813', '106.3699271', null, '0');
INSERT INTO `ap_location_district` VALUES ('829', '83', 'Bến Tre', '47', 'Thành phố', 'ben-tre', 'Thành phố Bến Tre, Bến Tre', '10.2413610', '106.3762601', null, '0');
INSERT INTO `ap_location_district` VALUES ('825', '82', 'Tân Phú Đông', '491', 'Huyện', 'tan-phu-dong', 'Huyện Tân Phú Đông, Tiền Giang', '10.2462427', '106.6998767', null, '0');
INSERT INTO `ap_location_district` VALUES ('824', '82', 'Gò Công Đông', '166', 'Huyện', 'go-cong-dong', 'Huyện Gò Công Đông, Tiền Giang', '10.3737254', '106.7470536', null, '0');
INSERT INTO `ap_location_district` VALUES ('823', '82', 'Gò Công Tây', '165', 'Huyện', 'go-cong-tay', 'Huyện Gò Công Tây, Tiền Giang', '10.3378629', '106.6055534', null, '0');
INSERT INTO `ap_location_district` VALUES ('822', '82', 'Chợ Gạo', '119', 'Huyện', 'cho-gao', 'Huyện Chợ Gạo, Tiền Giang', '10.3793903', '106.4541903', null, '0');
INSERT INTO `ap_location_district` VALUES ('820', '82', 'Cai Lậy', '74', 'Huyện', 'cai-lay', 'Huyện Cai Lậy, Tiền Giang', '10.4287401', '106.1110501', null, '0');
INSERT INTO `ap_location_district` VALUES ('821', '82', 'Châu Thành', '105', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Tiền Giang', '10.4009358', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('819', '82', 'Cái Bè', '72', 'Huyện', 'cai-be', 'Huyện Cái Bè, Tiền Giang', '10.3718873', '105.9464874', null, '0');
INSERT INTO `ap_location_district` VALUES ('818', '82', 'Tân Phước', '492', 'Huyện', 'tan-phuoc', 'Huyện Tân Phước, Tiền Giang', '10.5314211', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('816', '82', 'Gò Công', '164', 'Thị xã', 'go-cong', 'Thị xã Gò Công, Tiền Giang', '10.4106494', '106.6645007', null, '0');
INSERT INTO `ap_location_district` VALUES ('817', '82', 'Cai Lậy', '73', 'Thị xã', 'cai-lay', 'Thị xã Cai Lậy, Tiền Giang', '10.4050639', '106.1186715', null, '0');
INSERT INTO `ap_location_district` VALUES ('815', '82', 'Mỹ Tho', '326', 'Thành phố', 'my-tho', 'Thành phố Mỹ Tho, Tiền Giang', '10.3765284', '106.3438891', null, '0');
INSERT INTO `ap_location_district` VALUES ('808', '80', 'Châu Thành', '104', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Long An', '10.4640645', '106.4759262', null, '0');
INSERT INTO `ap_location_district` VALUES ('806', '80', 'Cần Đước', '90', 'Huyện', 'can-duoc', 'Huyện Cần Đước, Long An', '10.5549448', '106.6055534', null, '0');
INSERT INTO `ap_location_district` VALUES ('807', '80', 'Cần Giuộc', '88', 'Huyện', 'can-giuoc', 'Huyện Cần Giuộc, Long An', '10.6009679', '106.6650358', null, '0');
INSERT INTO `ap_location_district` VALUES ('805', '80', 'Tân Trụ', '496', 'Huyện', 'tan-tru', 'Huyện Tân Trụ, Long An', '10.5280095', '106.4994889', null, '0');
INSERT INTO `ap_location_district` VALUES ('804', '80', 'Thủ Thừa', '543', 'Huyện', 'thu-thua', 'Huyện Thủ Thừa, Long An', '10.7006857', '106.3228338', null, '0');
INSERT INTO `ap_location_district` VALUES ('802', '80', 'Đức Hòa', '703', 'Huyện', 'duc-hoa', 'Huyện Đức Hòa, Long An', '10.9023378', '106.4185340', null, '0');
INSERT INTO `ap_location_district` VALUES ('803', '80', 'Bến Lức', '46', 'Huyện', 'ben-luc', 'Huyện Bến Lức, Long An', '10.6411620', '106.4856006', null, '0');
INSERT INTO `ap_location_district` VALUES ('801', '80', 'Đức Huệ', '704', 'Huyện', 'duc-hue', 'Huyện Đức Huệ, Long An', '10.8777796', '106.2757514', null, '0');
INSERT INTO `ap_location_district` VALUES ('800', '80', 'Thạnh Hóa', '522', 'Huyện', 'thanh-hoa', 'Huyện Thạnh Hóa, Long An', '10.6645870', '106.1816196', null, '0');
INSERT INTO `ap_location_district` VALUES ('799', '80', 'Tân Thạnh', '495', 'Huyện', 'tan-thanh', 'Huyện Tân Thạnh, Long An', '10.6078027', '106.0169971', null, '0');
INSERT INTO `ap_location_district` VALUES ('798', '80', 'Mộc Hóa', '313', 'Huyện', 'moc-hoa', 'Huyện Mộc Hóa, Long An', '10.7642485', '105.9464874', null, '0');
INSERT INTO `ap_location_district` VALUES ('797', '80', 'Vĩnh Hưng', '618', 'Huyện', 'vinh-hung', 'Huyện Vĩnh Hưng, Long An', '10.9028612', '105.8055471', null, '0');
INSERT INTO `ap_location_district` VALUES ('796', '80', 'Tân Hưng', '486', 'Huyện', 'tan-hung', 'Huyện Tân Hưng, Long An', '10.8226522', '105.6647142', null, '0');
INSERT INTO `ap_location_district` VALUES ('794', '80', 'Tân An', '479', 'Thành phố', 'tan-an', 'Thành phố Tân An, Long An', '10.5330098', '106.4052541', null, '0');
INSERT INTO `ap_location_district` VALUES ('795', '80', 'Kiến Tường', '239', 'Thị xã', 'kien-tuong', 'Thị xã Kiến Tường, Long An', '10.7667086', '105.8994956', null, '0');
INSERT INTO `ap_location_district` VALUES ('787', '79', 'Cần Giờ', '87', 'Huyện', 'can-gio', 'Huyện Cần Giờ, Hồ Chí Minh', '10.5083266', '106.8635004', null, '0');
INSERT INTO `ap_location_district` VALUES ('786', '79', 'Nhà Bè', '359', 'Huyện', 'nha-be', 'Huyện Nhà Bè, Hồ Chí Minh', '10.6952642', '106.7048740', null, '0');
INSERT INTO `ap_location_district` VALUES ('785', '79', 'Bình Chánh', '50', 'Huyện', 'binh-chanh', 'Huyện Bình Chánh, Hồ Chí Minh', '10.6873920', '106.5938538', null, '0');
INSERT INTO `ap_location_district` VALUES ('783', '79', 'Củ Chi', '133', 'Huyện', 'cu-chi', 'Huyện Củ Chi, Hồ Chí Minh', '11.0066683', '106.5131967', null, '0');
INSERT INTO `ap_location_district` VALUES ('784', '79', 'Hóc Môn', '208', 'Huyện', 'hoc-mon', 'Huyện Hóc Môn, Hồ Chí Minh', '10.8839675', '106.5870611', null, '0');
INSERT INTO `ap_location_district` VALUES ('778', '79', 'Quận 7', '422', 'Quận', 'quan-7', 'Quận 7, Hồ Chí Minh', '10.7340344', '106.7215787', null, '0');
INSERT INTO `ap_location_district` VALUES ('777', '79', 'Bình Tân', '58', 'Quận', 'binh-tan', 'Quận Bình Tân, Hồ Chí Minh', '10.7652581', '106.6038535', null, '0');
INSERT INTO `ap_location_district` VALUES ('775', '79', 'Quận 6', '421', 'Quận', 'quan-6', 'Quận 6, Hồ Chí Minh', '10.7480929', '106.6352362', null, '0');
INSERT INTO `ap_location_district` VALUES ('776', '79', 'Quận 8', '423', 'Quận', 'quan-8', 'Quận 8, Hồ Chí Minh', '10.7240878', '106.6286259', null, '0');
INSERT INTO `ap_location_district` VALUES ('774', '79', 'Quận 5', '420', 'Quận', 'quan-5', 'Quận 5, Hồ Chí Minh', '10.7540279', '106.6633746', null, '0');
INSERT INTO `ap_location_district` VALUES ('772', '79', 'Quận 11', '415', 'Quận', 'quan-11', 'Quận 11, Hồ Chí Minh', '10.7629739', '106.6500840', null, '0');
INSERT INTO `ap_location_district` VALUES ('773', '79', 'Quận 4', '419', 'Quận', 'quan-4', 'Quận 4, Hồ Chí Minh', '10.7578263', '106.7012968', null, '0');
INSERT INTO `ap_location_district` VALUES ('771', '79', 'Quận 10', '414', 'Quận', 'quan-10', 'Quận 10, Hồ Chí Minh', '10.7745965', '106.6679542', null, '0');
INSERT INTO `ap_location_district` VALUES ('769', '79', 'Quận 2', '417', 'Quận', 'quan-2', 'Quận 2, Hồ Chí Minh', '10.7872729', '106.7498105', null, '0');
INSERT INTO `ap_location_district` VALUES ('770', '79', 'Quận 3', '418', 'Quận', 'quan-3', 'Quận 3, Hồ Chí Minh', '10.7843695', '106.6844089', null, '0');
INSERT INTO `ap_location_district` VALUES ('768', '79', 'Phú Nhuận', '392', 'Quận', 'phu-nhuan', 'Quận Phú Nhuận, Hồ Chí Minh', '10.7991944', '106.6802639', null, '0');
INSERT INTO `ap_location_district` VALUES ('767', '79', 'Tân Phú', '490', 'Quận', 'tan-phu', 'Quận Tân Phú, Hồ Chí Minh', '10.7900517', '106.6281901', null, '0');
INSERT INTO `ap_location_district` VALUES ('766', '79', 'Tân Bình', '481', 'Quận', 'tan-binh', 'Quận Tân Bình, Hồ Chí Minh', '10.8014659', '106.6525974', null, '0');
INSERT INTO `ap_location_district` VALUES ('764', '79', 'Gò Vấp', '169', 'Quận', 'go-vap', 'Quận Gò Vấp, Hồ Chí Minh', '10.8386779', '106.6652904', null, '0');
INSERT INTO `ap_location_district` VALUES ('765', '79', 'Bình Thạnh', '60', 'Quận', 'binh-thanh', 'Quận Bình Thạnh, Hồ Chí Minh', '10.8105831', '106.7091422', null, '0');
INSERT INTO `ap_location_district` VALUES ('763', '79', 'Quận 9', '424', 'Quận', 'quan-9', 'Quận 9, Hồ Chí Minh', '10.8428402', '106.8286851', null, '0');
INSERT INTO `ap_location_district` VALUES ('762', '79', 'Thủ Đức', '544', 'Quận', 'thu-duc', 'Quận Thủ Đức, Hồ Chí Minh', '10.8494094', '106.7537055', null, '0');
INSERT INTO `ap_location_district` VALUES ('760', '79', 'Quận 1', '413', 'Quận', 'quan-1', 'Quận 1, Hồ Chí Minh', '10.7756587', '106.7004238', null, '0');
INSERT INTO `ap_location_district` VALUES ('761', '79', 'Quận 12', '416', 'Quận', 'quan-12', 'Quận 12, Hồ Chí Minh', '10.8671531', '106.6413322', null, '0');
INSERT INTO `ap_location_district` VALUES ('754', '77', 'Tân Thành', '494', 'Huyện', 'tan-thanh', 'Huyện Tân Thành, Bà Rịa - Vũng Tàu', '10.5640726', '107.0595233', null, '0');
INSERT INTO `ap_location_district` VALUES ('753', '77', 'Đất Đỏ', '675', 'Huyện', 'dat-do', 'Huyện Đất Đỏ, Bà Rịa - Vũng Tàu', '10.4728035', '107.3139304', null, '0');
INSERT INTO `ap_location_district` VALUES ('752', '77', 'Long Điền', '292', 'Huyện', 'long-dien', 'Huyện Long Điền, Bà Rịa - Vũng Tàu', '10.4449241', '107.2311774', null, '0');
INSERT INTO `ap_location_district` VALUES ('751', '77', 'Xuyên Mộc', '637', 'Huyện', 'xuyen-moc', 'Huyện Xuyên Mộc, Bà Rịa - Vũng Tàu', '10.6177683', '107.4321959', null, '0');
INSERT INTO `ap_location_district` VALUES ('750', '77', 'Châu Đức', '115', 'Huyện', 'chau-duc', 'Huyện Châu Đức, Bà Rịa - Vũng Tàu', '10.6284702', '107.2429976', null, '0');
INSERT INTO `ap_location_district` VALUES ('748', '77', 'Bà Rịa', '14', 'Thành phố', 'ba-ria', 'Thành phố Bà Rịa, Bà Rịa - Vũng Tàu', '10.5089280', '107.1816257', null, '0');
INSERT INTO `ap_location_district` VALUES ('747', '77', 'Vũng Tàu', '633', 'Thành phố', 'vung-tau', 'Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu', '10.4113797', '107.1362240', null, '0');
INSERT INTO `ap_location_district` VALUES ('741', '75', 'Xuân Lộc', '635', 'Huyện', 'xuan-loc', 'Huyện Xuân Lộc, Đồng Nai', '10.9652026', '107.4321959', null, '0');
INSERT INTO `ap_location_district` VALUES ('742', '75', 'Nhơn Trạch', '362', 'Huyện', 'nhon-trach', 'Huyện Nhơn Trạch, Đồng Nai', '10.6968843', '106.8907696', null, '0');
INSERT INTO `ap_location_district` VALUES ('739', '75', 'Cẩm Mỹ', '82', 'Huyện', 'cam-my', 'Huyện Cẩm Mỹ, Đồng Nai', '10.8225699', '107.2666396', null, '0');
INSERT INTO `ap_location_district` VALUES ('740', '75', 'Long Thành', '290', 'Huyện', 'long-thanh', 'Huyện Long Thành, Đồng Nai', '10.7932946', '107.0135297', null, '0');
INSERT INTO `ap_location_district` VALUES ('738', '75', 'Thống Nhất', '539', 'Huyện', 'thong-nhat', 'Huyện Thống Nhất, Đồng Nai', '10.9943590', '107.1547158', null, '0');
INSERT INTO `ap_location_district` VALUES ('737', '75', 'Trảng Bom', '572', 'Huyện', 'trang-bom', 'Huyện Trảng Bom, Đồng Nai', '10.9667039', '107.0303221', null, '0');
INSERT INTO `ap_location_district` VALUES ('736', '75', 'Định Quán', '682', 'Huyện', 'dinh-quan', 'Huyện Định Quán, Đồng Nai', '11.1576779', '107.2740528', null, '0');
INSERT INTO `ap_location_district` VALUES ('735', '75', 'Vĩnh Cửu', '617', 'Huyện', 'vinh-cuu', 'Huyện Vĩnh Cửu, Đồng Nai', '11.3049005', '107.0605278', null, '0');
INSERT INTO `ap_location_district` VALUES ('734', '75', 'Tân Phú', '489', 'Huyện', 'tan-phu', 'Huyện Tân Phú, Đồng Nai', '11.4275308', '107.3612300', null, '0');
INSERT INTO `ap_location_district` VALUES ('732', '75', 'Long Khánh', '286', 'Thị xã', 'long-khanh', 'Thị xã Long Khánh, Đồng Nai', '10.9442612', '107.2311774', null, '0');
INSERT INTO `ap_location_district` VALUES ('726', '74', 'Bắc Tân Uyên', '31', 'Huyện', 'bac-tan-uyen', 'Huyện Bắc Tân Uyên, Bình Dương', '11.1498411', '106.8452402', null, '0');
INSERT INTO `ap_location_district` VALUES ('731', '75', 'Biên Hòa', '48', 'Thành phố', 'bien-hoa', 'Thành phố Biên Hòa, Đồng Nai', '10.9574128', '106.8426871', null, '0');
INSERT INTO `ap_location_district` VALUES ('725', '74', 'Thuận An', '545', 'Thị xã', 'thuan-an', 'Thị xã Thuận An, Bình Dương', '10.9302095', '106.7116700', null, '0');
INSERT INTO `ap_location_district` VALUES ('724', '74', 'Dĩ An', '140', 'Thị xã', 'di-an', 'Thị xã Dĩ An, Bình Dương', '10.9155965', '106.7692013', null, '0');
INSERT INTO `ap_location_district` VALUES ('723', '74', 'Tân Uyên', '498', 'Thị xã', 'tan-uyen', 'Thị xã Tân Uyên, Bình Dương', '11.0715863', '106.6943524', null, '0');
INSERT INTO `ap_location_district` VALUES ('722', '74', 'Phú Giáo', '386', 'Huyện', 'phu-giao', 'Huyện Phú Giáo, Bình Dương', '11.2655822', '106.7706458', null, '0');
INSERT INTO `ap_location_district` VALUES ('721', '74', 'Bến Cát', '44', 'Thị xã', 'ben-cat', 'Thị xã Bến Cát, Bình Dương', '11.1013020', '106.5819789', null, '0');
INSERT INTO `ap_location_district` VALUES ('720', '74', 'Dầu Tiếng', '139', 'Huyện', 'dau-tieng', 'Huyện Dầu Tiếng, Bình Dương', '11.3489090', '106.4641459', null, '0');
INSERT INTO `ap_location_district` VALUES ('719', '74', 'Bàu Bàng', '43', 'Huyện', 'bau-bang', 'Huyện Bàu Bàng, Bình Dương', '11.2454323', '106.6243358', null, '0');
INSERT INTO `ap_location_district` VALUES ('718', '74', 'Thủ Dầu Một', '542', 'Thành phố', 'thu-dau-mot', 'Thành phố Thủ Dầu Một, Bình Dương', '10.9929842', '106.6557073', null, '0');
INSERT INTO `ap_location_district` VALUES ('712', '72', 'Trảng Bàng', '571', 'Huyện', 'trang-bang', 'Huyện Trảng Bàng, Tây Ninh', '11.0328111', '106.3645677', null, '0');
INSERT INTO `ap_location_district` VALUES ('711', '72', 'Bến Cầu', '45', 'Huyện', 'ben-cau', 'Huyện Bến Cầu, Tây Ninh', '11.1506368', '106.0875326', null, '0');
INSERT INTO `ap_location_district` VALUES ('710', '72', 'Gò Dầu', '167', 'Huyện', 'go-dau', 'Huyện Gò Dầu, Tây Ninh', '11.1402783', '106.2757514', null, '0');
INSERT INTO `ap_location_district` VALUES ('709', '72', 'Hòa Thành', '197', 'Huyện', 'hoa-thanh', 'Huyện Hòa Thành, Tây Ninh', '11.2680459', '106.1463317', null, '0');
INSERT INTO `ap_location_district` VALUES ('708', '72', 'Châu Thành', '103', 'Huyện', 'chau-thanh', 'Huyện Châu Thành, Tây Ninh', '11.3081393', '106.0169971', null, '0');
INSERT INTO `ap_location_district` VALUES ('707', '72', 'Dương Minh Châu', '145', 'Huyện', 'duong-minh-chau', 'Huyện Dương Minh Châu, Tây Ninh', '11.3595908', '106.2757514', null, '0');
INSERT INTO `ap_location_district` VALUES ('706', '72', 'Tân Châu', '482', 'Huyện', 'tan-chau', 'Huyện Tân Châu, Tây Ninh', '11.5614393', '106.2051484', null, '0');
INSERT INTO `ap_location_district` VALUES ('705', '72', 'Tân Biên', '480', 'Huyện', 'tan-bien', 'Huyện Tân Biên, Tây Ninh', '11.5721150', '106.0169971', null, '0');
INSERT INTO `ap_location_district` VALUES ('703', '72', 'Tây Ninh', '504', 'Thành phố', 'tay-ninh', 'Thành phố Tây Ninh, Tây Ninh', '11.3675415', '106.1192802', null, '0');
INSERT INTO `ap_location_district` VALUES ('698', '70', 'Phú Riềng', '397', 'Huyện', 'phu-rieng', 'Huyện Phú Riềng, Bình Phước', '11.6698337', '106.9021946', null, '0');
INSERT INTO `ap_location_district` VALUES ('697', '70', 'Chơn Thành', '124', 'Huyện', 'chon-thanh', 'Huyện Chơn Thành, Bình Phước', '11.4696902', '106.6527099', null, '0');
INSERT INTO `ap_location_district` VALUES ('696', '70', 'Bù Đăng', '66', 'Huyện', 'bu-dang', 'Huyện Bù Đăng, Bình Phước', '11.7693374', '107.1484521', null, '0');
INSERT INTO `ap_location_district` VALUES ('695', '70', 'Đồng Phú', '695', 'Huyện', 'dong-phu', 'Huyện Đồng Phú, Bình Phước', '11.5123355', '106.9905473', null, '0');
INSERT INTO `ap_location_district` VALUES ('694', '70', 'Hớn Quản', '210', 'Huyện', 'hon-quan', 'Huyện Hớn Quản, Bình Phước', '11.6014622', '106.6527099', null, '0');
INSERT INTO `ap_location_district` VALUES ('693', '70', 'Bù Đốp', '67', 'Huyện', 'bu-dop', 'Huyện Bù Đốp, Bình Phước', '11.9891869', '106.7942405', null, '0');
INSERT INTO `ap_location_district` VALUES ('692', '70', 'Lộc Ninh', '283', 'Huyện', 'loc-ninh', 'Huyện Lộc Ninh, Bình Phước', '11.8036770', '106.5819789', null, '0');
INSERT INTO `ap_location_district` VALUES ('691', '70', 'Bù Gia Mập', '65', 'Huyện', 'bu-gia-map', 'Huyện Bù Gia Mập, Bình Phước', '12.0392238', '107.0539434', null, '0');
INSERT INTO `ap_location_district` VALUES ('690', '70', 'Bình Long', '54', 'Thị xã', 'binh-long', 'Thị xã Bình Long, Bình Phước', '11.6922032', '106.6055534', null, '0');
INSERT INTO `ap_location_district` VALUES ('689', '70', 'Đồng Xoài', '699', 'Thị xã', 'dong-xoai', 'Thị xã Đồng Xoài, Bình Phước', '11.5360230', '106.8908253', null, '0');
INSERT INTO `ap_location_district` VALUES ('688', '70', 'Phước Long', '409', 'Thị xã', 'phuoc-long', 'Thị xã Phước Long, Bình Phước', '11.8337331', '106.9948945', null, '0');
INSERT INTO `ap_location_district` VALUES ('683', '68', 'Cát Tiên', '98', 'Huyện', 'cat-tien', 'Huyện Cát Tiên, Lâm Đồng', '11.6903361', '107.3612300', null, '0');
INSERT INTO `ap_location_district` VALUES ('682', '68', 'Đạ Tẻh', '659', 'Huyện', 'da-teh', 'Huyện Đạ Tẻh, Lâm Đồng', '11.5705176', '107.5268471', null, '0');
INSERT INTO `ap_location_district` VALUES ('681', '68', 'Đạ Huoai', '656', 'Huyện', 'da-huoai', 'Huyện Đạ Huoai, Lâm Đồng', '11.4101516', '107.6452085', null, '0');
INSERT INTO `ap_location_district` VALUES ('680', '68', 'Bảo Lâm', '38', 'Huyện', 'bao-lam', 'Huyện Bảo Lâm, Lâm Đồng', '11.7337863', '107.7162500', null, '0');
INSERT INTO `ap_location_district` VALUES ('679', '68', 'Di Linh', '141', 'Huyện', 'di-linh', 'Huyện Di Linh, Lâm Đồng', '11.5346745', '108.0954351', null, '0');
INSERT INTO `ap_location_district` VALUES ('678', '68', 'Đức Trọng', '708', 'Huyện', 'duc-trong', 'Huyện Đức Trọng, Lâm Đồng', '11.6419270', '108.3102916', null, '0');
INSERT INTO `ap_location_district` VALUES ('677', '68', 'Đơn Dương', '686', 'Huyện', 'don-duong', 'Huyện Đơn Dương, Lâm Đồng', '11.7452329', '108.5463165', null, '0');
INSERT INTO `ap_location_district` VALUES ('676', '68', 'Lâm Hà', '270', 'Huyện', 'lam-ha', 'Huyện Lâm Hà, Lâm Đồng', '11.7906825', '108.1903059', null, '0');
INSERT INTO `ap_location_district` VALUES ('675', '68', 'Lạc Dương', '263', 'Huyện', 'lac-duong', 'Huyện Lạc Dương, Lâm Đồng', '12.1218309', '108.4750846', null, '0');
INSERT INTO `ap_location_district` VALUES ('674', '68', 'Đam Rông', '673', 'Huyện', 'dam-rong', 'Huyện Đam Rông, Lâm Đồng', '12.0598218', '108.0954351', null, '0');
INSERT INTO `ap_location_district` VALUES ('673', '68', 'Bảo Lộc', '39', 'Thành phố', 'bao-loc', 'Thành phố Bảo Lộc, Lâm Đồng', '11.5731051', '107.8346924', null, '0');
INSERT INTO `ap_location_district` VALUES ('672', '68', 'Đà Lạt', '658', 'Thành phố', 'da-lat', 'Thành phố Đà Lạt, Lâm Đồng', '11.9404192', '108.4583132', null, '0');
INSERT INTO `ap_location_district` VALUES ('667', '67', 'Tuy Đức', '591', 'Huyện', 'tuy-duc', 'Huyện Tuy Đức, Đắk Nông', '12.1576117', '107.4342313', null, '0');
INSERT INTO `ap_location_district` VALUES ('666', '67', 'Đắk R\'Lấp', '667', 'Huyện', 'dak-r\'lap', 'Huyện Đắk R\'Lấp, Đắk Nông', '11.9213338', '107.5268471', null, '0');
INSERT INTO `ap_location_district` VALUES ('665', '67', 'Đắk Song', '668', 'Huyện', 'dak-song', 'Huyện Đắk Song, Đắk Nông', '12.2328311', '107.6216789', null, '0');
INSERT INTO `ap_location_district` VALUES ('664', '67', 'Krông Nô', '255', 'Huyện', 'krong-no', 'Huyện Krông Nô, Đắk Nông', '12.3426475', '107.8110000', null, '0');
INSERT INTO `ap_location_district` VALUES ('663', '67', 'Đắk Mil', '665', 'Huyện', 'dak-mil', 'Huyện Đắk Mil, Đắk Nông', '12.5049537', '107.6925674', null, '0');
INSERT INTO `ap_location_district` VALUES ('662', '67', 'Cư Jút', '134', 'Huyện', 'cu-jut', 'Huyện Cư Jút, Đắk Nông', '12.6572820', '107.8656124', null, '0');
INSERT INTO `ap_location_district` VALUES ('661', '67', 'Đăk Glong', '663', 'Huyện', 'dak-glong', 'Huyện Đăk Glong, Đắk Nông', '12.1013642', '107.8023543', null, '0');
INSERT INTO `ap_location_district` VALUES ('660', '67', 'Gia Nghĩa', '156', 'Thị xã', 'gia-nghia', 'Thị xã Gia Nghĩa, Đắk Nông', '12.0036455', '107.6876481', null, '0');
INSERT INTO `ap_location_district` VALUES ('656', '66', 'Lắk', '268', 'Huyện', 'lak', 'Huyện Lắk, Đắk Lắk', '12.3169361', '108.1903059', null, '0');
INSERT INTO `ap_location_district` VALUES ('657', '66', 'Cư Kuin', '135', 'Huyện', 'cu-kuin', 'Huyện Cư Kuin, Đắk Lắk', '12.5810594', '108.1903059', null, '0');
INSERT INTO `ap_location_district` VALUES ('655', '66', 'Krông A Na', '251', 'Huyện', 'krong-a-na', 'Huyện Krông A Na, Đắk Lắk', '12.4823793', '108.0243010', null, '0');
INSERT INTO `ap_location_district` VALUES ('654', '66', 'Krông Pắc', '257', 'Huyện', 'krong-pac', 'Huyện Krông Pắc, Đắk Lắk', '12.7439968', '108.3801314', null, '0');
INSERT INTO `ap_location_district` VALUES ('653', '66', 'Krông Bông', '252', 'Huyện', 'krong-bong', 'Huyện Krông Bông, Đắk Lắk', '12.4730320', '108.4750846', null, '0');
INSERT INTO `ap_location_district` VALUES ('652', '66', 'M\'Đrắk', '300', 'Huyện', 'm\'drak', 'Huyện M\'Đrắk, Đắk Lắk', '12.7165586', '108.7600963', null, '0');
INSERT INTO `ap_location_district` VALUES ('651', '66', 'Ea Kar', '151', 'Huyện', 'ea-kar', 'Huyện Ea Kar, Đắk Lắk', '12.7981778', '108.5463165', null, '0');
INSERT INTO `ap_location_district` VALUES ('650', '66', 'Krông Năng', '254', 'Huyện', 'krong-nang', 'Huyện Krông Năng, Đắk Lắk', '13.0089192', '108.3801314', null, '0');
INSERT INTO `ap_location_district` VALUES ('649', '66', 'Krông Búk', '253', 'Huyện', 'krong-buk', 'Huyện Krông Búk, Đắk Lắk', '13.0226831', '108.1903059', null, '0');
INSERT INTO `ap_location_district` VALUES ('648', '66', 'Cư M\'gar', '137', 'Huyện', 'cu-m\'gar', 'Huyện Cư M\'gar, Đắk Lắk', '12.8525649', '108.0954351', null, '0');
INSERT INTO `ap_location_district` VALUES ('647', '66', 'Buôn Đôn', '70', 'Huyện', 'buon-don', 'Huyện Buôn Đôn, Đắk Lắk', '12.8791607', '107.7162500', null, '0');
INSERT INTO `ap_location_district` VALUES ('646', '66', 'Ea Súp', '152', 'Huyện', 'ea-sup', 'Huyện Ea Súp, Đắk Lắk', '13.1862227', '107.7636210', null, '0');
INSERT INTO `ap_location_district` VALUES ('645', '66', 'Ea H\'leo', '150', 'Huyện', 'ea-h\'leo', 'Huyện Ea H\'leo, Đắk Lắk', '13.1998141', '108.1903059', null, '0');
INSERT INTO `ap_location_district` VALUES ('644', '66', 'Buôn Hồ', '68', 'Thị xã', 'buon-ho', 'Thị xã Buôn Hồ, Đắk Lắk', '12.8628297', '108.2614775', null, '0');
INSERT INTO `ap_location_district` VALUES ('643', '66', 'Buôn Ma Thuột', '69', 'Thành phố', 'buon-ma-thuot', 'Thành phố Buôn Ma Thuột, Đắk Lắk', '12.6661944', '108.0382475', null, '0');
INSERT INTO `ap_location_district` VALUES ('639', '64', 'Chư Pưh', '127', 'Huyện', 'chu-puh', 'Huyện Chư Pưh, Gia Lai', '13.4730527', '108.0954351', null, '0');
INSERT INTO `ap_location_district` VALUES ('637', '64', 'Krông Pa', '256', 'Huyện', 'krong-pa', 'Huyện Krông Pa, Gia Lai', '13.2160038', '108.6726891', null, '0');
INSERT INTO `ap_location_district` VALUES ('638', '64', 'Phú Thiện', '400', 'Huyện', 'phu-thien', 'Huyện Phú Thiện, Gia Lai', '13.4589308', '108.2852049', null, '0');
INSERT INTO `ap_location_district` VALUES ('635', '64', 'Ia Pa', '229', 'Huyện', 'ia-pa', 'Huyện Ia Pa, Gia Lai', '13.5261514', '108.5700636', null, '0');
INSERT INTO `ap_location_district` VALUES ('634', '64', 'Đăk Pơ', '666', 'Huyện', 'dak-po', 'Huyện Đăk Pơ, Gia Lai', '13.9464250', '108.5938124', null, '0');
INSERT INTO `ap_location_district` VALUES ('633', '64', 'Chư Sê', '128', 'Huyện', 'chu-se', 'Huyện Chư Sê, Gia Lai', '13.7399629', '108.0954351', null, '0');
INSERT INTO `ap_location_district` VALUES ('632', '64', 'Chư Prông', '126', 'Huyện', 'chu-prong', 'Huyện Chư Prông, Gia Lai', '13.5419180', '107.7636210', null, '0');
INSERT INTO `ap_location_district` VALUES ('631', '64', 'Đức Cơ', '702', 'Huyện', 'duc-co', 'Huyện Đức Cơ, Gia Lai', '13.7752327', '107.6215321', null, '0');
INSERT INTO `ap_location_district` VALUES ('630', '64', 'Kông Chro', '250', 'Huyện', 'kong-chro', 'Huyện Kông Chro, Gia Lai', '13.7037218', '108.5700636', null, '0');
INSERT INTO `ap_location_district` VALUES ('628', '64', 'Ia Grai', '227', 'Huyện', 'ia-grai', 'Huyện Ia Grai, Gia Lai', '13.9539099', '107.6215321', null, '0');
INSERT INTO `ap_location_district` VALUES ('629', '64', 'Mang Yang', '304', 'Huyện', 'mang-yang', 'Huyện Mang Yang, Gia Lai', '13.9928022', '108.2852049', null, '0');
INSERT INTO `ap_location_district` VALUES ('627', '64', 'Chư Păh', '125', 'Huyện', 'chu-pah', 'Huyện Chư Păh, Gia Lai', '14.1765309', '107.9294815', null, '0');
INSERT INTO `ap_location_district` VALUES ('626', '64', 'Đăk Đoa', '670', 'Huyện', 'dak-doa', 'Huyện Đăk Đoa, Gia Lai', '14.1135412', '108.1665855', null, '0');
INSERT INTO `ap_location_district` VALUES ('625', '64', 'KBang', '230', 'Huyện', 'kbang', 'Huyện KBang, Gia Lai', '14.3348056', '108.4750846', null, '0');
INSERT INTO `ap_location_district` VALUES ('624', '64', 'Ayun Pa', '11', 'Thị xã', 'ayun-pa', 'Thị xã Ayun Pa, Gia Lai', '13.3743393', '108.3989809', null, '0');
INSERT INTO `ap_location_district` VALUES ('623', '64', 'An Khê', '3', 'Thị xã', 'an-khe', 'Thị xã An Khê, Gia Lai', '14.0279256', '108.6888227', null, '0');
INSERT INTO `ap_location_district` VALUES ('622', '64', 'Pleiku', '412', 'Thành phố', 'pleiku', 'Thành phố Pleiku, Gia Lai', '13.9718356', '108.0150796', null, '0');
INSERT INTO `ap_location_district` VALUES ('618', '62', 'Ia H\' Drai', '228', 'Huyện', 'ia-h\'-drai', 'Huyện Ia H\' Drai, Kon Tum', '14.0189165', '107.4477032', null, '0');
INSERT INTO `ap_location_district` VALUES ('617', '62', 'Tu Mơ Rông', '581', 'Huyện', 'tu-mo-rong', 'Huyện Tu Mơ Rông, Kon Tum', '14.9105786', '108.0005933', null, '0');
INSERT INTO `ap_location_district` VALUES ('616', '62', 'Sa Thầy', '449', 'Huyện', 'sa-thay', 'Huyện Sa Thầy, Kon Tum', '14.4355779', '107.7636210', null, '0');
INSERT INTO `ap_location_district` VALUES ('614', '62', 'Kon Rẫy', '248', 'Huyện', 'kon-ray', 'Huyện Kon Rẫy, Kon Tum', '14.5607568', '108.1665855', null, '0');
INSERT INTO `ap_location_district` VALUES ('615', '62', 'Đắk Hà', '664', 'Huyện', 'dak-ha', 'Huyện Đắk Hà, Kon Tum', '14.6412140', '108.0005933', null, '0');
INSERT INTO `ap_location_district` VALUES ('613', '62', 'Kon Plông', '247', 'Huyện', 'kon-plong', 'Huyện Kon Plông, Kon Tum', '14.7976892', '108.2852049', null, '0');
INSERT INTO `ap_location_district` VALUES ('612', '62', 'Đắk Tô', '669', 'Huyện', 'dak-to', 'Huyện Đắk Tô, Kon Tum', '14.6562021', '107.8110000', null, '0');
INSERT INTO `ap_location_district` VALUES ('611', '62', 'Ngọc Hồi', '355', 'Huyện', 'ngoc-hoi', 'Huyện Ngọc Hồi, Kon Tum', '14.6710249', '107.6215321', null, '0');
INSERT INTO `ap_location_district` VALUES ('610', '62', 'Đắk Glei', '662', 'Huyện', 'dak-glei', 'Huyện Đắk Glei, Kon Tum', '15.1134720', '107.7162500', null, '0');
INSERT INTO `ap_location_district` VALUES ('608', '62', 'Kon Tum', '249', 'Thành phố', 'kon-tum', 'Thành phố Kon Tum, Kon Tum', '14.3497403', '108.0004606', null, '0');
INSERT INTO `ap_location_district` VALUES ('602', '60', 'Phú Quí', '395', 'Huyện', 'phu-qui', 'Huyện Phú Quí, Bình Thuận', '10.5335281', '108.9442804', null, '0');
INSERT INTO `ap_location_district` VALUES ('601', '60', 'Hàm Tân', '186', 'Huyện', 'ham-tan', 'Huyện Hàm Tân, Bình Thuận', '10.6935927', '107.6215321', null, '0');
INSERT INTO `ap_location_district` VALUES ('600', '60', 'Đức Linh', '705', 'Huyện', 'duc-linh', 'Huyện Đức Linh, Bình Thuận', '11.1977289', '107.5505152', null, '0');
INSERT INTO `ap_location_district` VALUES ('599', '60', 'Tánh Linh', '500', 'Huyện', 'tanh-linh', 'Huyện Tánh Linh, Bình Thuận', '11.0980639', '107.6785010', null, '0');
INSERT INTO `ap_location_district` VALUES ('598', '60', 'Hàm Thuận Nam', '188', 'Huyện', 'ham-thuan-nam', 'Huyện Hàm Thuận Nam, Bình Thuận', '10.8502937', '107.9057813', null, '0');
INSERT INTO `ap_location_district` VALUES ('597', '60', 'Hàm Thuận Bắc', '187', 'Huyện', 'ham-thuan-bac', 'Huyện Hàm Thuận Bắc, Bình Thuận', '11.1116858', '108.1319634', null, '0');
INSERT INTO `ap_location_district` VALUES ('596', '60', 'Bắc Bình', '22', 'Huyện', 'bac-binh', 'Huyện Bắc Bình, Bình Thuận', '11.2551834', '108.3801314', null, '0');
INSERT INTO `ap_location_district` VALUES ('594', '60', 'La Gi', '262', 'Thị xã', 'la-gi', 'Thị xã La Gi, Bình Thuận', '10.7157400', '107.7991545', null, '0');
INSERT INTO `ap_location_district` VALUES ('595', '60', 'Tuy Phong', '589', 'Huyện', 'tuy-phong', 'Huyện Tuy Phong, Bình Thuận', '11.3178827', '108.6579603', null, '0');
INSERT INTO `ap_location_district` VALUES ('593', '60', 'Phan Thiết', '378', 'Thành phố', 'phan-thiet', 'Thành phố Phan Thiết, Bình Thuận', '10.9804603', '108.2614775', null, '0');
INSERT INTO `ap_location_district` VALUES ('589', '58', 'Thuận Nam', '548', 'Huyện', 'thuan-nam', 'Huyện Thuận Nam, Ninh Thuận', '11.4702151', '108.9145675', null, '0');
INSERT INTO `ap_location_district` VALUES ('588', '58', 'Thuận Bắc', '546', 'Huyện', 'thuan-bac', 'Huyện Thuận Bắc, Ninh Thuận', '11.7533327', '109.0690976', null, '0');
INSERT INTO `ap_location_district` VALUES ('587', '58', 'Ninh Phước', '370', 'Huyện', 'ninh-phuoc', 'Huyện Ninh Phước, Ninh Thuận', '11.4850435', '108.8551484', null, '0');
INSERT INTO `ap_location_district` VALUES ('586', '58', 'Ninh Hải', '367', 'Huyện', 'ninh-hai', 'Huyện Ninh Hải, Ninh Thuận', '11.7032481', '109.1642208', null, '0');
INSERT INTO `ap_location_district` VALUES ('585', '58', 'Ninh Sơn', '371', 'Huyện', 'ninh-son', 'Huyện Ninh Sơn, Ninh Thuận', '11.6888699', '108.7363370', null, '0');
INSERT INTO `ap_location_district` VALUES ('584', '58', 'Bác Ái', '21', 'Huyện', 'bac-ai', 'Huyện Bác Ái, Ninh Thuận', '11.8334154', '108.8551484', null, '0');
INSERT INTO `ap_location_district` VALUES ('582', '58', 'Phan Rang - Tháp Chàm', '377', 'Thành phố', 'phan-rang-thap-cham', 'Thành phố Phan Rang-Tháp Chàm, Ninh Thuận', '11.5825677', '108.9912066', null, '0');
INSERT INTO `ap_location_district` VALUES ('576', '56', 'Trường Sa', '579', 'Huyện', 'truong-sa', 'Huyện Trường Sa, Khánh Hòa', '12.2469211', '109.1944155', null, '0');
INSERT INTO `ap_location_district` VALUES ('575', '56', 'Khánh Sơn', '232', 'Huyện', 'khanh-son', 'Huyện Khánh Sơn, Khánh Hòa', '12.0249415', '108.9264524', null, '0');
INSERT INTO `ap_location_district` VALUES ('574', '56', 'Diên Khánh', '143', 'Huyện', 'dien-khanh', 'Huyện Diên Khánh, Khánh Hòa', '12.2570417', '109.0453200', null, '0');
INSERT INTO `ap_location_district` VALUES ('573', '56', 'Khánh Vĩnh', '233', 'Huyện', 'khanh-vinh', 'Huyện Khánh Vĩnh, Khánh Hòa', '12.2705951', '108.8551484', null, '0');
INSERT INTO `ap_location_district` VALUES ('572', '56', 'Ninh Hòa', '368', 'Thị xã', 'ninh-hoa', 'Thị xã Ninh Hòa, Khánh Hòa', '12.5129970', '109.1404380', null, '0');
INSERT INTO `ap_location_district` VALUES ('570', '56', 'Cam Lâm', '79', 'Huyện', 'cam-lam', 'Huyện Cam Lâm, Khánh Hòa', '12.0753900', '109.1404380', null, '0');
INSERT INTO `ap_location_district` VALUES ('571', '56', 'Vạn Ninh', '605', 'Huyện', 'van-ninh', 'Huyện Vạn Ninh, Khánh Hòa', '12.7243439', '109.2626992', null, '0');
INSERT INTO `ap_location_district` VALUES ('569', '56', 'Cam Ranh', '84', 'Thành phố', 'cam-ranh', 'Thành phố Cam Ranh, Khánh Hòa', '11.9008657', '109.1404380', null, '0');
INSERT INTO `ap_location_district` VALUES ('568', '56', 'Nha Trang', '360', 'Thành phố', 'nha-trang', 'Thành phố Nha Trang, Khánh Hòa', '12.2387911', '109.1967488', null, '0');
INSERT INTO `ap_location_district` VALUES ('564', '54', 'Đông Hòa', '691', 'Huyện', 'dong-hoa', 'Huyện Đông Hòa, Phú Yên', '12.9580642', '109.3545270', null, '0');
INSERT INTO `ap_location_district` VALUES ('563', '54', 'Phú Hoà', '387', 'Huyện', 'phu-hoa', 'Huyện Phú Hoà, Phú Yên', '13.0606953', '109.1642208', null, '0');
INSERT INTO `ap_location_district` VALUES ('562', '54', 'Tây Hoà', '503', 'Huyện', 'tay-hoa', 'Huyện Tây Hoà, Phú Yên', '12.9285815', '109.1642208', null, '0');
INSERT INTO `ap_location_district` VALUES ('561', '54', 'Sông Hinh', '467', 'Huyện', 'song-hinh', 'Huyện Sông Hinh, Phú Yên', '12.8786353', '108.9502232', null, '0');
INSERT INTO `ap_location_district` VALUES ('560', '54', 'Sơn Hòa', '458', 'Huyện', 'son-hoa', 'Huyện Sơn Hòa, Phú Yên', '13.1431691', '108.9502232', null, '0');
INSERT INTO `ap_location_district` VALUES ('558', '54', 'Đồng Xuân', '700', 'Huyện', 'dong-xuan', 'Huyện Đồng Xuân, Phú Yên', '13.4083074', '108.9502232', null, '0');
INSERT INTO `ap_location_district` VALUES ('559', '54', 'Tuy An', '587', 'Huyện', 'tuy-an', 'Huyện Tuy An, Phú Yên', '13.2977350', '109.2355764', null, '0');
INSERT INTO `ap_location_district` VALUES ('557', '54', 'Sông Cầu', '465', 'Thị xã', 'song-cau', 'Thị xã Sông Cầu, Phú Yên', '13.4744193', '109.2355764', null, '0');
INSERT INTO `ap_location_district` VALUES ('555', '54', 'Tuy Hoà', '588', 'Thành phố', 'tuy-hoa', 'Thành phố Tuy Hoà, Phú Yên', '13.1057062', '109.2950480', null, '0');
INSERT INTO `ap_location_district` VALUES ('551', '52', 'Vân Canh', '599', 'Huyện', 'van-canh', 'Huyện Vân Canh, Bình Định', '13.6740330', '108.9502232', null, '0');
INSERT INTO `ap_location_district` VALUES ('550', '52', 'Tuy Phước', '590', 'Huyện', 'tuy-phuoc', 'Huyện Tuy Phước, Bình Định', '13.8565034', '109.1642208', null, '0');
INSERT INTO `ap_location_district` VALUES ('549', '52', 'An Nhơn', '7', 'Thị xã', 'an-nhon', 'Thị xã An Nhơn, Bình Định', '13.8641717', '109.0690976', null, '0');
INSERT INTO `ap_location_district` VALUES ('548', '52', 'Phù Cát', '384', 'Huyện', 'phu-cat', 'Huyện Phù Cát, Bình Định', '14.0134002', '109.0547476', null, '0');
INSERT INTO `ap_location_district` VALUES ('547', '52', 'Tây Sơn', '505', 'Huyện', 'tay-son', 'Huyện Tây Sơn, Bình Định', '13.9479428', '108.8551484', null, '0');
INSERT INTO `ap_location_district` VALUES ('545', '52', 'Phù Mỹ', '391', 'Huyện', 'phu-my', 'Huyện Phù Mỹ, Bình Định', '14.2157645', '109.1166566', null, '0');
INSERT INTO `ap_location_district` VALUES ('546', '52', 'Vĩnh Thạnh', '623', 'Huyện', 'vinh-thanh', 'Huyện Vĩnh Thạnh, Bình Định', '14.2468401', '108.7363370', null, '0');
INSERT INTO `ap_location_district` VALUES ('544', '52', 'Hoài Ân', '199', 'Huyện', 'hoai-an', 'Huyện Hoài Ân, Bình Định', '14.3040385', '108.8551484', null, '0');
INSERT INTO `ap_location_district` VALUES ('543', '52', 'Hoài Nhơn', '200', 'Huyện', 'hoai-nhon', 'Huyện Hoài Nhơn, Bình Định', '14.4666386', '109.0453200', null, '0');
INSERT INTO `ap_location_district` VALUES ('542', '52', 'An Lão', '5', 'Huyện', 'an-lao', 'Huyện An Lão, Bình Định', '14.5717294', '108.8551484', null, '0');
INSERT INTO `ap_location_district` VALUES ('540', '52', 'Qui Nhơn', '440', 'Thành phố', 'qui-nhon', 'Thành phố Qui Nhơn, Bình Định', '13.7829673', '109.2196634', null, '0');
INSERT INTO `ap_location_district` VALUES ('536', '51', 'Lý Sơn', '299', 'Huyện', 'ly-son', 'Huyện Lý Sơn, Quảng Ngãi', '15.3833610', '109.1107114', null, '0');
INSERT INTO `ap_location_district` VALUES ('535', '51', 'Ba Tơ', '16', 'Huyện', 'ba-to', 'Huyện Ba Tơ, Quảng Ngãi', '14.7663789', '108.6650678', null, '0');
INSERT INTO `ap_location_district` VALUES ('534', '51', 'Đức Phổ', '706', 'Huyện', 'duc-pho', 'Huyện Đức Phổ, Quảng Ngãi', '14.7627960', '108.9739954', null, '0');
INSERT INTO `ap_location_district` VALUES ('533', '51', 'Mộ Đức', '311', 'Huyện', 'mo-duc', 'Huyện Mộ Đức, Quảng Ngãi', '14.9498041', '108.8789150', null, '0');
INSERT INTO `ap_location_district` VALUES ('532', '51', 'Nghĩa Hành', '349', 'Huyện', 'nghia-hanh', 'Huyện Nghĩa Hành, Quảng Ngãi', '15.0026852', '108.7838572', null, '0');
INSERT INTO `ap_location_district` VALUES ('531', '51', 'Minh Long', '308', 'Huyện', 'minh-long', 'Huyện Minh Long, Quảng Ngãi', '14.9659262', '108.6888227', null, '0');
INSERT INTO `ap_location_district` VALUES ('530', '51', 'Sơn Tây', '461', 'Huyện', 'son-tay', 'Huyện Sơn Tây, Quảng Ngãi', '14.9488528', '108.3563972', null, '0');
INSERT INTO `ap_location_district` VALUES ('529', '51', 'Sơn Hà', '457', 'Huyện', 'son-ha', 'Huyện Sơn Hà, Quảng Ngãi', '15.0431944', '108.5700636', null, '0');
INSERT INTO `ap_location_district` VALUES ('528', '51', 'Tư Nghĩa', '582', 'Huyện', 'tu-nghia', 'Huyện Tư Nghĩa, Quảng Ngãi', '15.1065785', '108.7482165', null, '0');
INSERT INTO `ap_location_district` VALUES ('527', '51', 'Sơn Tịnh', '462', 'Huyện', 'son-tinh', 'Huyện Sơn Tịnh, Quảng Ngãi', '15.1860945', '108.7363370', null, '0');
INSERT INTO `ap_location_district` VALUES ('526', '51', 'Tây Trà', '506', 'Huyện', 'tay-tra', 'Huyện Tây Trà, Quảng Ngãi', '15.1734012', '108.3563972', null, '0');
INSERT INTO `ap_location_district` VALUES ('525', '51', 'Trà Bồng', '562', 'Huyện', 'tra-bong', 'Huyện Trà Bồng, Quảng Ngãi', '15.2512645', '108.4988269', null, '0');
INSERT INTO `ap_location_district` VALUES ('524', '51', 'Bình Sơn', '57', 'Huyện', 'binh-son', 'Huyện Bình Sơn, Quảng Ngãi', '15.3166491', '108.7838572', null, '0');
INSERT INTO `ap_location_district` VALUES ('522', '51', 'Quảng Ngãi', '429', 'Thành phố', 'quang-ngai', 'Thành phố Quảng Ngãi, Quảng Ngãi', '15.1213873', '108.8044145', null, '0');
INSERT INTO `ap_location_district` VALUES ('519', '49', 'Nông Sơn', '373', 'Huyện', 'nong-son', 'Huyện Nông Sơn, Quảng Nam', '15.6557978', '107.9768875', null, '0');
INSERT INTO `ap_location_district` VALUES ('518', '49', 'Phú Ninh', '394', 'Huyện', 'phu-ninh', 'Huyện Phú Ninh, Quảng Nam', '15.5743256', '108.4038672', null, '0');
INSERT INTO `ap_location_district` VALUES ('517', '49', 'Núi Thành', '374', 'Huyện', 'nui-thanh', 'Huyện Núi Thành, Quảng Nam', '15.4229422', '108.5938124', null, '0');
INSERT INTO `ap_location_district` VALUES ('516', '49', 'Nam Trà My', '337', 'Huyện', 'nam-tra-my', 'Huyện Nam Trà My, Quảng Nam', '15.0826614', '108.0954351', null, '0');
INSERT INTO `ap_location_district` VALUES ('515', '49', 'Bắc Trà My', '32', 'Huyện', 'bac-tra-my', 'Huyện Bắc Trà My, Quảng Nam', '15.3202715', '108.2140280', null, '0');
INSERT INTO `ap_location_district` VALUES ('514', '49', 'Tiên Phước', '557', 'Huyện', 'tien-phuoc', 'Huyện Tiên Phước, Quảng Nam', '15.4964006', '108.2614775', null, '0');
INSERT INTO `ap_location_district` VALUES ('513', '49', 'Thăng Bình', '516', 'Huyện', 'thang-binh', 'Huyện Thăng Bình, Quảng Nam', '15.6890346', '108.3801314', null, '0');
INSERT INTO `ap_location_district` VALUES ('512', '49', 'Hiệp Đức', '192', 'Huyện', 'hiep-duc', 'Huyện Hiệp Đức, Quảng Nam', '15.5590682', '108.0805694', null, '0');
INSERT INTO `ap_location_district` VALUES ('511', '49', 'Phước Sơn', '411', 'Huyện', 'phuoc-son', 'Huyện Phước Sơn, Quảng Nam', '15.3762517', '107.8110000', null, '0');
INSERT INTO `ap_location_district` VALUES ('510', '49', 'Nam Giang', '333', 'Huyện', 'nam-giang', 'Huyện Nam Giang, Quảng Nam', '15.6628546', '107.6215321', null, '0');
INSERT INTO `ap_location_district` VALUES ('509', '49', 'Quế Sơn', '438', 'Huyện', 'que-son', 'Huyện Quế Sơn, Quảng Nam', '15.6848385', '108.1665855', null, '0');
INSERT INTO `ap_location_district` VALUES ('508', '49', 'Duy Xuyên', '147', 'Huyện', 'duy-xuyen', 'Huyện Duy Xuyên, Quảng Nam', '15.7751100', '108.1665855', null, '0');
INSERT INTO `ap_location_district` VALUES ('507', '49', 'Điện Bàn', '676', 'Thị xã', 'dien-ban', 'Thị xã Điện Bàn, Quảng Nam', '15.8902573', '108.2522087', null, '0');
INSERT INTO `ap_location_district` VALUES ('506', '49', 'Đại Lộc', '660', 'Huyện', 'dai-loc', 'Huyện Đại Lộc, Quảng Nam', '15.8497875', '108.0668661', null, '0');
INSERT INTO `ap_location_district` VALUES ('505', '49', 'Đông Giang', '688', 'Huyện', 'dong-giang', 'Huyện Đông Giang, Quảng Nam', '15.9660249', '107.7831632', null, '0');
INSERT INTO `ap_location_district` VALUES ('504', '49', 'Tây Giang', '501', 'Huyện', 'tay-giang', 'Huyện Tây Giang, Quảng Nam', '15.8852628', '107.4890302', null, '0');
INSERT INTO `ap_location_district` VALUES ('503', '49', 'Hội An', '209', 'Thành phố', 'hoi-an', 'Thành phố Hội An, Quảng Nam', '15.8800584', '108.3380469', null, '0');
INSERT INTO `ap_location_district` VALUES ('497', '48', 'Hòa Vang', '198', 'Huyện', 'hoa-vang', 'Huyện Hòa Vang, Đà Nẵng', '15.9999880', '108.1457994', null, '0');
INSERT INTO `ap_location_district` VALUES ('502', '49', 'Tam Kỳ', '473', 'Thành phố', 'tam-ky', 'Thành phố Tam Kỳ, Quảng Nam', '15.5638825', '108.4786313', null, '0');
INSERT INTO `ap_location_district` VALUES ('495', '48', 'Cẩm Lệ', '80', 'Quận', 'cam-le', 'Quận Cẩm Lệ, Đà Nẵng', '16.0153669', '108.1962362', null, '0');
INSERT INTO `ap_location_district` VALUES ('493', '48', 'Sơn Trà', '463', 'Quận', 'son-tra', 'Quận Sơn Trà, Đà Nẵng', '16.1069981', '108.2521815', null, '0');
INSERT INTO `ap_location_district` VALUES ('494', '48', 'Ngũ Hành Sơn', '357', 'Quận', 'ngu-hanh-son', 'Quận Ngũ Hành Sơn, Đà Nẵng', '15.9955056', '108.2588049', null, '0');
INSERT INTO `ap_location_district` VALUES ('492', '48', 'Hải Châu', '181', 'Quận', 'hai-chau', 'Quận Hải Châu, Đà Nẵng', '16.0472002', '108.2199588', null, '0');
INSERT INTO `ap_location_district` VALUES ('491', '48', 'Thanh Khê', '523', 'Quận', 'thanh-khe', 'Quận Thanh Khê, Đà Nẵng', '16.0641802', '108.1873407', null, '0');
INSERT INTO `ap_location_district` VALUES ('490', '48', 'Liên Chiểu', '280', 'Quận', 'lien-chieu', 'Quận Liên Chiểu, Đà Nẵng', '16.0717704', '108.1503823', null, '0');
INSERT INTO `ap_location_district` VALUES ('483', '46', 'Nam Đông', '342', 'Huyện', 'nam-dong', 'Huyện Nam Đông, Thừa Thiên Huế', '16.1249688', '107.6707417', null, '0');
INSERT INTO `ap_location_district` VALUES ('482', '46', 'Phú Lộc', '388', 'Huyện', 'phu-loc', 'Huyện Phú Lộc, Thừa Thiên Huế', '16.2725431', '107.9394761', null, '0');
INSERT INTO `ap_location_district` VALUES ('481', '46', 'A Lưới', '0', 'Huyện', 'a-luoi', 'Huyện A Lưới, Thừa Thiên Huế', '16.2303741', '107.3375791', null, '0');
INSERT INTO `ap_location_district` VALUES ('480', '46', 'Hương Trà', '225', 'Thị xã', 'huong-tra', 'Thị xã Hương Trà, Thừa Thiên Huế', '16.4207960', '107.5031811', null, '0');
INSERT INTO `ap_location_district` VALUES ('479', '46', 'Hương Thủy', '224', 'Thị xã', 'huong-thuy', 'Thị xã Hương Thủy, Thừa Thiên Huế', '16.4198395', '107.6464295', null, '0');
INSERT INTO `ap_location_district` VALUES ('478', '46', 'Phú Vang', '402', 'Huyện', 'phu-vang', 'Huyện Phú Vang, Thừa Thiên Huế', '16.4912130', '107.7399345', null, '0');
INSERT INTO `ap_location_district` VALUES ('476', '46', 'Phong Điền', '381', 'Huyện', 'phong-dien', 'Huyện Phong Điền, Thừa Thiên Huế', '16.5031120', '107.3375791', null, '0');
INSERT INTO `ap_location_district` VALUES ('477', '46', 'Quảng Điền', '436', 'Huyện', 'quang-dien', 'Huyện Quảng Điền, Thừa Thiên Huế', '16.5902415', '107.5150139', null, '0');
INSERT INTO `ap_location_district` VALUES ('474', '46', 'Huế', '217', 'Thành phố', 'hue', 'Thành phố Huế, Thừa Thiên Huế', '16.4498000', '107.5623501', null, '0');
INSERT INTO `ap_location_district` VALUES ('470', '45', 'Hải Lăng', '185', 'Huyện', 'hai-lang', 'Huyện Hải Lăng, Quảng Trị', '16.7140020', '107.2666396', null, '0');
INSERT INTO `ap_location_district` VALUES ('469', '45', 'Triệu Phong', '575', 'Huyện', 'trieu-phong', 'Huyện Triệu Phong, Quảng Trị', '16.8091840', '107.2193578', null, '0');
INSERT INTO `ap_location_district` VALUES ('468', '45', 'Cam Lộ', '81', 'Huyện', 'cam-lo', 'Huyện Cam Lộ, Quảng Trị', '16.7836950', '106.9830865', null, '0');
INSERT INTO `ap_location_district` VALUES ('467', '45', 'Đa Krông', '657', 'Huyện', 'da-krong', 'Huyện Đa Krông, Quảng Trị', '16.5349165', '106.9594723', null, '0');
INSERT INTO `ap_location_district` VALUES ('466', '45', 'Gio Linh', '161', 'Huyện', 'gio-linh', 'Huyện Gio Linh, Quảng Trị', '16.9165711', '107.0303221', null, '0');
INSERT INTO `ap_location_district` VALUES ('465', '45', 'Hướng Hóa', '221', 'Huyện', 'huong-hoa', 'Huyện Hướng Hóa, Quảng Trị', '16.6495512', '106.6762920', null, '0');
INSERT INTO `ap_location_district` VALUES ('464', '45', 'Vĩnh Linh', '619', 'Huyện', 'vinh-linh', 'Huyện Vĩnh Linh, Quảng Trị', '17.0743311', '107.0539434', null, '0');
INSERT INTO `ap_location_district` VALUES ('462', '45', 'Quảng Trị', '432', 'Thị xã', 'quang-tri', 'Thị xã Quảng Trị, Quảng Trị', '16.7505630', '107.1857063', null, '0');
INSERT INTO `ap_location_district` VALUES ('461', '45', 'Đông Hà', '689', 'Thành phố', 'dong-ha', 'Thành phố Đông Hà, Quảng Trị', '16.8088928', '107.0893798', null, '0');
INSERT INTO `ap_location_district` VALUES ('458', '44', 'Ba Đồn', '20', 'Thị xã', 'ba-don', 'Thị xã Ba Đồn, Quảng Bình', '17.7530355', '106.4235285', null, '0');
INSERT INTO `ap_location_district` VALUES ('457', '44', 'Lệ Thủy', '279', 'Huyện', 'le-thuy', 'Huyện Lệ Thủy, Quảng Bình', '17.1064913', '106.6762920', null, '0');
INSERT INTO `ap_location_district` VALUES ('456', '44', 'Quảng Ninh', '430', 'Huyện', 'quang-ninh', 'Huyện Quảng Ninh, Quảng Bình', '17.2394584', '106.4616246', null, '0');
INSERT INTO `ap_location_district` VALUES ('455', '44', 'Bố Trạch', '64', 'Huyện', 'bo-trach', 'Huyện Bố Trạch, Quảng Bình', '17.5047078', '106.2992912', null, '0');
INSERT INTO `ap_location_district` VALUES ('453', '44', 'Tuyên Hóa', '592', 'Huyện', 'tuyen-hoa', 'Huyện Tuyên Hóa, Quảng Bình', '17.9319039', '105.9722814', null, '0');
INSERT INTO `ap_location_district` VALUES ('454', '44', 'Quảng Trạch', '431', 'Huyện', 'quang-trach', 'Huyện Quảng Trạch, Quảng Bình', '17.8640126', '106.3934777', null, '0');
INSERT INTO `ap_location_district` VALUES ('452', '44', 'Minh Hóa', '307', 'Huyện', 'minh-hoa', 'Huyện Minh Hóa, Quảng Bình', '17.7198160', '105.9229900', null, '0');
INSERT INTO `ap_location_district` VALUES ('450', '44', 'Đồng Hới', '692', 'Thành phố', 'dong-hoi', 'Thành phố Đồng Hới, Quảng Bình', '17.4659391', '106.5983958', null, '0');
INSERT INTO `ap_location_district` VALUES ('449', '42', 'Kỳ Anh', '259', 'Thị xã', 'ky-anh', 'Thị xã Kỳ Anh, Hà Tĩnh', '18.0654497', '106.2994872', null, '0');
INSERT INTO `ap_location_district` VALUES ('448', '42', 'Lộc Hà', '282', 'Huyện', 'loc-ha', 'Huyện Lộc Hà, Hà Tĩnh', '18.4817584', '105.8994956', null, '0');
INSERT INTO `ap_location_district` VALUES ('447', '42', 'Kỳ Anh', '258', 'Huyện', 'ky-anh', 'Huyện Kỳ Anh, Hà Tĩnh', '18.0559583', '106.2992912', null, '0');
INSERT INTO `ap_location_district` VALUES ('446', '42', 'Cẩm Xuyên', '86', 'Huyện', 'cam-xuyen', 'Huyện Cẩm Xuyên, Hà Tĩnh', '18.1721653', '106.0169971', null, '0');
INSERT INTO `ap_location_district` VALUES ('445', '42', 'Thạch Hà', '508', 'Huyện', 'thach-ha', 'Huyện Thạch Hà, Hà Tĩnh', '18.3013160', '105.8525154', null, '0');
INSERT INTO `ap_location_district` VALUES ('444', '42', 'Hương Khê', '222', 'Huyện', 'huong-khe', 'Huyện Hương Khê, Hà Tĩnh', '18.2037562', '105.6412527', null, '0');
INSERT INTO `ap_location_district` VALUES ('443', '42', 'Can Lộc', '89', 'Huyện', 'can-loc', 'Huyện Can Lộc, Hà Tĩnh', '18.4516009', '105.7116464', null, '0');
INSERT INTO `ap_location_district` VALUES ('442', '42', 'Nghi Xuân', '348', 'Huyện', 'nghi-xuan', 'Huyện Nghi Xuân, Hà Tĩnh', '18.6282217', '105.8055471', null, '0');
INSERT INTO `ap_location_district` VALUES ('441', '42', 'Vũ Quang', '630', 'Huyện', 'vu-quang', 'Huyện Vũ Quang, Hà Tĩnh', '18.3365936', '105.4302383', null, '0');
INSERT INTO `ap_location_district` VALUES ('440', '42', 'Đức Thọ', '707', 'Huyện', 'duc-tho', 'Huyện Đức Thọ, Hà Tĩnh', '18.5056718', '105.6177942', null, '0');
INSERT INTO `ap_location_district` VALUES ('439', '42', 'Hương Sơn', '223', 'Huyện', 'huong-son', 'Huyện Hương Sơn, Hà Tĩnh', '18.5118006', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('437', '42', 'Hồng Lĩnh', '214', 'Thị xã', 'hong-linh', 'Thị xã Hồng Lĩnh, Hà Tĩnh', '18.5301567', '105.7064569', null, '0');
INSERT INTO `ap_location_district` VALUES ('436', '42', 'Hà Tĩnh', '176', 'Thành phố', 'ha-tinh', 'Thành phố Hà Tĩnh, Hà Tĩnh', '18.3559537', '105.8877494', null, '0');
INSERT INTO `ap_location_district` VALUES ('432', '40', 'Hoàng Mai', '205', 'Thị xã', 'hoang-mai', 'Thị xã Hoàng Mai, Nghệ An', '19.2370094', '105.7116464', null, '0');
INSERT INTO `ap_location_district` VALUES ('430', '40', 'Nam Đàn', '340', 'Huyện', 'nam-dan', 'Huyện Nam Đàn, Nghệ An', '18.6983445', '105.5239912', null, '0');
INSERT INTO `ap_location_district` VALUES ('431', '40', 'Hưng Nguyên', '219', 'Huyện', 'hung-nguyen', 'Huyện Hưng Nguyên, Nghệ An', '18.6316742', '105.6295230', null, '0');
INSERT INTO `ap_location_district` VALUES ('429', '40', 'Nghi Lộc', '347', 'Huyện', 'nghi-loc', 'Huyện Nghi Lộc, Nghệ An', '18.8142042', '105.5835663', null, '0');
INSERT INTO `ap_location_district` VALUES ('428', '40', 'Thanh Chương', '519', 'Huyện', 'thanh-chuong', 'Huyện Thanh Chương, Nghệ An', '18.6967739', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('427', '40', 'Đô Lương', '683', 'Huyện', 'do-luong', 'Huyện Đô Lương, Nghệ An', '18.8990982', '105.3365360', null, '0');
INSERT INTO `ap_location_district` VALUES ('426', '40', 'Yên Thành', '651', 'Huyện', 'yen-thanh', 'Huyện Yên Thành, Nghệ An', '19.0511285', '105.4536718', null, '0');
INSERT INTO `ap_location_district` VALUES ('425', '40', 'Diễn Châu', '142', 'Huyện', 'dien-chau', 'Huyện Diễn Châu, Nghệ An', '19.0179688', '105.5708865', null, '0');
INSERT INTO `ap_location_district` VALUES ('424', '40', 'Anh Sơn', '10', 'Huyện', 'anh-son', 'Huyện Anh Sơn, Nghệ An', '18.9688054', '105.0557415', null, '0');
INSERT INTO `ap_location_district` VALUES ('423', '40', 'Tân Kỳ', '487', 'Huyện', 'tan-ky', 'Huyện Tân Kỳ, Nghệ An', '19.0748796', '105.1726816', null, '0');
INSERT INTO `ap_location_district` VALUES ('421', '40', 'Quỳnh Lưu', '444', 'Huyện', 'quynh-luu', 'Huyện Quỳnh Lưu, Nghệ An', '19.2200256', '105.6412527', null, '0');
INSERT INTO `ap_location_district` VALUES ('422', '40', 'Con Cuông', '132', 'Huyện', 'con-cuong', 'Huyện Con Cuông, Nghệ An', '19.0130593', '104.7987710', null, '0');
INSERT INTO `ap_location_district` VALUES ('420', '40', 'Quỳ Hợp', '443', 'Huyện', 'quy-hop', 'Huyện Quỳ Hợp, Nghệ An', '19.3528917', '105.1726816', null, '0');
INSERT INTO `ap_location_district` VALUES ('419', '40', 'Nghĩa Đàn', '352', 'Huyện', 'nghia-dan', 'Huyện Nghĩa Đàn, Nghệ An', '19.4003352', '105.4302383', null, '0');
INSERT INTO `ap_location_district` VALUES ('418', '40', 'Tương Dương', '586', 'Huyện', 'tuong-duong', 'Huyện Tương Dương, Nghệ An', '19.2640131', '104.5655273', null, '0');
INSERT INTO `ap_location_district` VALUES ('417', '40', 'Kỳ Sơn', '261', 'Huyện', 'ky-son', 'Huyện Kỳ Sơn, Nghệ An', '19.3854700', '104.1827912', null, '0');
INSERT INTO `ap_location_district` VALUES ('416', '40', 'Quỳ Châu', '442', 'Huyện', 'quy-chau', 'Huyện Quỳ Châu, Nghệ An', '19.5463056', '105.0791228', null, '0');
INSERT INTO `ap_location_district` VALUES ('415', '40', 'Quế Phong', '437', 'Huyện', 'que-phong', 'Huyện Quế Phong, Nghệ An', '19.6862686', '104.9563176', null, '0');
INSERT INTO `ap_location_district` VALUES ('414', '40', 'Thái Hoà', '512', 'Thị xã', 'thai-hoa', 'Thị xã Thái Hoà, Nghệ An', '19.2931124', '105.4653897', null, '0');
INSERT INTO `ap_location_district` VALUES ('413', '40', 'Cửa Lò', '138', 'Thị xã', 'cua-lo', 'Thị xã Cửa Lò, Nghệ An', '18.7916127', '105.7175138', null, '0');
INSERT INTO `ap_location_district` VALUES ('412', '40', 'Vinh', '614', 'Thành phố', 'vinh', 'Thành phố Vinh, Nghệ An', '18.6795848', '105.6813333', null, '0');
INSERT INTO `ap_location_district` VALUES ('407', '38', 'Tĩnh Gia', '561', 'Huyện', 'tinh-gia', 'Huyện Tĩnh Gia, Thanh Hóa', '19.4383800', '105.7745131', null, '0');
INSERT INTO `ap_location_district` VALUES ('406', '38', 'Quảng Xương', '434', 'Huyện', 'quang-xuong', 'Huyện Quảng Xương, Thanh Hóa', '19.6913377', '105.8055471', null, '0');
INSERT INTO `ap_location_district` VALUES ('405', '38', 'Đông Sơn', '696', 'Huyện', 'dong-son', 'Huyện Đông Sơn, Thanh Hóa', '19.8049755', '105.6999122', null, '0');
INSERT INTO `ap_location_district` VALUES ('404', '38', 'Nông Cống', '372', 'Huyện', 'nong-cong', 'Huyện Nông Cống, Thanh Hóa', '19.6113284', '105.6647142', null, '0');
INSERT INTO `ap_location_district` VALUES ('403', '38', 'Như Thanh', '363', 'Huyện', 'nhu-thanh', 'Huyện Như Thanh, Thanh Hóa', '19.5733122', '105.5708865', null, '0');
INSERT INTO `ap_location_district` VALUES ('402', '38', 'Như Xuân', '364', 'Huyện', 'nhu-xuan', 'Huyện Như Xuân, Thanh Hóa', '19.6149135', '105.3599568', null, '0');
INSERT INTO `ap_location_district` VALUES ('400', '38', 'Hậu Lộc', '190', 'Huyện', 'hau-loc', 'Huyện Hậu Lộc, Thanh Hóa', '19.9268879', '105.8877494', null, '0');
INSERT INTO `ap_location_district` VALUES ('401', '38', 'Nga Sơn', '345', 'Huyện', 'nga-son', 'Huyện Nga Sơn, Thanh Hóa', '19.9981878', '105.9934910', null, '0');
INSERT INTO `ap_location_district` VALUES ('399', '38', 'Hoằng Hóa', '203', 'Huyện', 'hoang-hoa', 'Huyện Hoằng Hóa, Thanh Hóa', '19.8216851', '105.8994956', null, '0');
INSERT INTO `ap_location_district` VALUES ('398', '38', 'Thiệu Hóa', '534', 'Huyện', 'thieu-hoa', 'Huyện Thiệu Hóa, Thanh Hóa', '19.8891820', '105.6647142', null, '0');
INSERT INTO `ap_location_district` VALUES ('397', '38', 'Triệu Sơn', '576', 'Huyện', 'trieu-son', 'Huyện Triệu Sơn, Thanh Hóa', '19.8512387', '105.5708865', null, '0');
INSERT INTO `ap_location_district` VALUES ('396', '38', 'Thường Xuân', '551', 'Huyện', 'thuong-xuan', 'Huyện Thường Xuân, Thanh Hóa', '19.9012787', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('395', '38', 'Thọ Xuân', '535', 'Huyện', 'tho-xuan', 'Huyện Thọ Xuân, Thanh Hóa', '19.9059121', '105.4771084', null, '0');
INSERT INTO `ap_location_district` VALUES ('393', '38', 'Vĩnh Lộc', '620', 'Huyện', 'vinh-loc', 'Huyện Vĩnh Lộc, Thanh Hóa', '20.0408049', '105.6529830', null, '0');
INSERT INTO `ap_location_district` VALUES ('394', '38', 'Yên Định', '654', 'Huyện', 'yen-dinh', 'Huyện Yên Định, Thanh Hóa', '19.9860515', '105.6177942', null, '0');
INSERT INTO `ap_location_district` VALUES ('392', '38', 'Hà Trung', '177', 'Huyện', 'ha-trung', 'Huyện Hà Trung, Thanh Hóa', '20.0617086', '105.8055471', null, '0');
INSERT INTO `ap_location_district` VALUES ('391', '38', 'Thạch Thành', '509', 'Huyện', 'thach-thanh', 'Huyện Thạch Thành, Thanh Hóa', '20.2177814', '105.6177942', null, '0');
INSERT INTO `ap_location_district` VALUES ('390', '38', 'Cẩm Thủy', '85', 'Huyện', 'cam-thuy', 'Huyện Cẩm Thủy, Thanh Hóa', '20.1841010', '105.4771084', null, '0');
INSERT INTO `ap_location_district` VALUES ('389', '38', 'Ngọc Lặc', '356', 'Huyện', 'ngoc-lac', 'Huyện Ngọc Lặc, Thanh Hóa', '20.0785891', '105.3599568', null, '0');
INSERT INTO `ap_location_district` VALUES ('388', '38', 'Lang Chánh', '272', 'Huyện', 'lang-chanh', 'Huyện Lang Chánh, Thanh Hóa', '20.1667590', '105.1492869', null, '0');
INSERT INTO `ap_location_district` VALUES ('387', '38', 'Quan Sơn', '427', 'Huyện', 'quan-son', 'Huyện Quan Sơn, Thanh Hóa', '20.2123327', '104.8921668', null, '0');
INSERT INTO `ap_location_district` VALUES ('385', '38', 'Quan Hóa', '426', 'Huyện', 'quan-hoa', 'Huyện Quan Hóa, Thanh Hóa', '20.4830433', '104.9856176', null, '0');
INSERT INTO `ap_location_district` VALUES ('386', '38', 'Bá Thước', '15', 'Huyện', 'ba-thuoc', 'Huyện Bá Thước, Thanh Hóa', '20.3653356', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('384', '38', 'Mường Lát', '320', 'Huyện', 'muong-lat', 'Huyện Mường Lát, Thanh Hóa', '20.4941326', '104.5888356', null, '0');
INSERT INTO `ap_location_district` VALUES ('382', '38', 'Sầm Sơn', '451', 'Thị xã', 'sam-son', 'Thị xã Sầm Sơn, Thanh Hóa', '19.7575271', '105.9053689', null, '0');
INSERT INTO `ap_location_district` VALUES ('381', '38', 'Bỉm Sơn', '49', 'Thị xã', 'bim-son', 'Thị xã Bỉm Sơn, Thanh Hóa', '20.0889153', '105.8877494', null, '0');
INSERT INTO `ap_location_district` VALUES ('380', '38', 'Thanh Hóa', '521', 'Thành phố', 'thanh-hoa', 'Thành phố Thanh Hóa, Thanh Hóa', '19.8066920', '105.7851816', null, '0');
INSERT INTO `ap_location_district` VALUES ('377', '37', 'Yên Mô', '647', 'Huyện', 'yen-mo', 'Huyện Yên Mô, Ninh Bình', '20.1370289', '105.9934910', null, '0');
INSERT INTO `ap_location_district` VALUES ('376', '37', 'Kim Sơn', '243', 'Huyện', 'kim-son', 'Huyện Kim Sơn, Ninh Bình', '20.0462334', '106.0992910', null, '0');
INSERT INTO `ap_location_district` VALUES ('375', '37', 'Yên Khánh', '643', 'Huyện', 'yen-khanh', 'Huyện Yên Khánh, Ninh Bình', '20.1872280', '106.0757749', null, '0');
INSERT INTO `ap_location_district` VALUES ('374', '37', 'Hoa Lư', '196', 'Huyện', 'hoa-lu', 'Huyện Hoa Lư, Ninh Bình', '20.2488130', '105.9112424', null, '0');
INSERT INTO `ap_location_district` VALUES ('373', '37', 'Gia Viễn', '158', 'Huyện', 'gia-vien', 'Huyện Gia Viễn, Ninh Bình', '20.3353002', '105.8525154', null, '0');
INSERT INTO `ap_location_district` VALUES ('372', '37', 'Nho Quan', '361', 'Huyện', 'nho-quan', 'Huyện Nho Quan, Ninh Bình', '20.2976274', '105.7585908', null, '0');
INSERT INTO `ap_location_district` VALUES ('370', '37', 'Tam Điệp', '477', 'Thành phố', 'tam-diep', 'Thành phố Tam Điệp, Ninh Bình', '20.1564917', '105.8736936', null, '0');
INSERT INTO `ap_location_district` VALUES ('369', '37', 'Ninh Bình', '365', 'Thành phố', 'ninh-binh', 'Thành phố Ninh Bình, Ninh Bình', '20.2506149', '105.9744536', null, '0');
INSERT INTO `ap_location_district` VALUES ('366', '36', 'Hải Hậu', '184', 'Huyện', 'hai-hau', 'Huyện Hải Hậu, Nam Định', '20.1568875', '106.2757514', null, '0');
INSERT INTO `ap_location_district` VALUES ('365', '36', 'Giao Thủy', '160', 'Huyện', 'giao-thuy', 'Huyện Giao Thủy, Nam Định', '20.2314086', '106.4641459', null, '0');
INSERT INTO `ap_location_district` VALUES ('364', '36', 'Xuân Trường', '636', 'Huyện', 'xuan-truong', 'Huyện Xuân Trường, Nam Định', '20.2993311', '106.3581527', null, '0');
INSERT INTO `ap_location_district` VALUES ('363', '36', 'Trực Ninh', '577', 'Huyện', 'truc-ninh', 'Huyện Trực Ninh, Nam Định', '20.2433760', '106.2169139', null, '0');
INSERT INTO `ap_location_district` VALUES ('362', '36', 'Nam Trực', '338', 'Huyện', 'nam-truc', 'Huyện Nam Trực, Nam Định', '20.3358927', '106.2169139', null, '0');
INSERT INTO `ap_location_district` VALUES ('361', '36', 'Nghĩa Hưng', '350', 'Huyện', 'nghia-hung', 'Huyện Nghĩa Hưng, Nam Định', '20.0732479', '106.1816196', null, '0');
INSERT INTO `ap_location_district` VALUES ('360', '36', 'Ý Yên', '638', 'Huyện', 'y-yen', 'Huyện Ý Yên, Nam Định', '20.3684984', '105.9934910', null, '0');
INSERT INTO `ap_location_district` VALUES ('359', '36', 'Vụ Bản', '629', 'Huyện', 'vu-ban', 'Huyện Vụ Bản, Nam Định', '20.3701420', '106.0992910', null, '0');
INSERT INTO `ap_location_district` VALUES ('358', '36', 'Mỹ Lộc', '325', 'Huyện', 'my-loc', 'Huyện Mỹ Lộc, Nam Định', '20.4604906', '106.1228099', null, '0');
INSERT INTO `ap_location_district` VALUES ('353', '35', 'Lý Nhân', '298', 'Huyện', 'ly-nhan', 'Huyện Lý Nhân, Hà Nam', '20.5553005', '106.0992910', null, '0');
INSERT INTO `ap_location_district` VALUES ('356', '36', 'Nam Định', '341', 'Thành phố', 'nam-dinh', 'Thành phố Nam Định, Nam Định', '20.4388225', '106.1621053', null, '0');
INSERT INTO `ap_location_district` VALUES ('352', '35', 'Bình Lục', '55', 'Huyện', 'binh-luc', 'Huyện Bình Lục, Hà Nam', '20.5029885', '106.0405060', null, '0');
INSERT INTO `ap_location_district` VALUES ('351', '35', 'Thanh Liêm', '524', 'Huyện', 'thanh-liem', 'Huyện Thanh Liêm, Hà Nam', '20.4699057', '105.8994956', null, '0');
INSERT INTO `ap_location_district` VALUES ('350', '35', 'Kim Bảng', '241', 'Huyện', 'kim-bang', 'Huyện Kim Bảng, Hà Nam', '20.5633623', '105.8562473', null, '0');
INSERT INTO `ap_location_district` VALUES ('349', '35', 'Duy Tiên', '146', 'Huyện', 'duy-tien', 'Huyện Duy Tiên, Hà Nam', '20.6268420', '105.9515540', null, '0');
INSERT INTO `ap_location_district` VALUES ('344', '34', 'Vũ Thư', '631', 'Huyện', 'vu-thu', 'Huyện Vũ Thư, Thái Bình', '20.4343787', '106.2757514', null, '0');
INSERT INTO `ap_location_district` VALUES ('347', '35', 'Phủ Lý', '390', 'Thành phố', 'phu-ly', 'Thành phố Phủ Lý, Hà Nam', '20.5476734', '105.9347384', null, '0');
INSERT INTO `ap_location_district` VALUES ('343', '34', 'Kiến Xương', '240', 'Huyện', 'kien-xuong', 'Huyện Kiến Xương, Thái Bình', '20.4208256', '106.4170311', null, '0');
INSERT INTO `ap_location_district` VALUES ('342', '34', 'Tiền Hải', '554', 'Huyện', 'tien-hai', 'Huyện Tiền Hải, Thái Bình', '20.3609414', '106.5584071', null, '0');
INSERT INTO `ap_location_district` VALUES ('341', '34', 'Thái Thụy', '514', 'Huyện', 'thai-thuy', 'Huyện Thái Thụy, Thái Bình', '20.5655791', '106.5648803', null, '0');
INSERT INTO `ap_location_district` VALUES ('340', '34', 'Đông Hưng', '693', 'Huyện', 'dong-hung', 'Huyện Đông Hưng, Thái Bình', '20.5640924', '106.3699271', null, '0');
INSERT INTO `ap_location_district` VALUES ('339', '34', 'Hưng Hà', '218', 'Huyện', 'hung-ha', 'Huyện Hưng Hà, Thái Bình', '20.5903748', '106.2169139', null, '0');
INSERT INTO `ap_location_district` VALUES ('338', '34', 'Quỳnh Phụ', '446', 'Huyện', 'quynh-phu', 'Huyện Quỳnh Phụ, Thái Bình', '20.6608254', '106.3276864', null, '0');
INSERT INTO `ap_location_district` VALUES ('336', '34', 'Thái Bình', '511', 'Thành phố', 'thai-binh', 'Thành phố Thái Bình, Thái Bình', '20.4463471', '106.3365828', null, '0');
INSERT INTO `ap_location_district` VALUES ('333', '33', 'Phù Cừ', '385', 'Huyện', 'phu-cu', 'Huyện Phù Cừ, Hưng Yên', '20.7083369', '106.1933837', null, '0');
INSERT INTO `ap_location_district` VALUES ('332', '33', 'Tiên Lữ', '556', 'Huyện', 'tien-lu', 'Huyện Tiên Lữ, Hưng Yên', '20.6919516', '106.1228099', null, '0');
INSERT INTO `ap_location_district` VALUES ('331', '33', 'Kim Động', '245', 'Huyện', 'kim-dong', 'Huyện Kim Động, Hưng Yên', '20.7325036', '106.0563755', null, '0');
INSERT INTO `ap_location_district` VALUES ('330', '33', 'Khoái Châu', '234', 'Huyện', 'khoai-chau', 'Huyện Khoái Châu, Hưng Yên', '20.8415456', '105.9804247', null, '0');
INSERT INTO `ap_location_district` VALUES ('328', '33', 'Mỹ Hào', '324', 'Huyện', 'my-hao', 'Huyện Mỹ Hào, Hưng Yên', '20.9257379', '106.0992910', null, '0');
INSERT INTO `ap_location_district` VALUES ('329', '33', 'Ân Thi', '9', 'Huyện', 'an-thi', 'Huyện Ân Thi, Hưng Yên', '20.8099609', '106.0992910', null, '0');
INSERT INTO `ap_location_district` VALUES ('327', '33', 'Yên Mỹ', '648', 'Huyện', 'yen-my', 'Huyện Yên Mỹ, Hưng Yên', '20.8861904', '106.0287512', null, '0');
INSERT INTO `ap_location_district` VALUES ('326', '33', 'Văn Giang', '601', 'Huyện', 'van-giang', 'Huyện Văn Giang, Hưng Yên', '20.9414842', '105.9569025', null, '0');
INSERT INTO `ap_location_district` VALUES ('325', '33', 'Văn Lâm', '603', 'Huyện', 'van-lam', 'Huyện Văn Lâm, Hưng Yên', '20.9854595', '106.0463746', null, '0');
INSERT INTO `ap_location_district` VALUES ('317', '31', 'Cát Hải', '97', 'Huyện', 'cat-hai', 'Huyện Cát Hải, Hải Phòng', '20.8041045', '106.9302268', null, '0');
INSERT INTO `ap_location_district` VALUES ('323', '33', 'Hưng Yên', '220', 'Thành phố', 'hung-yen', 'Thành phố Hưng Yên, Hưng Yên', '20.6523683', '106.0522616', null, '0');
INSERT INTO `ap_location_district` VALUES ('316', '31', 'Vĩnh Bảo', '615', 'Huyện', 'vinh-bao', 'Huyện Vĩnh Bảo, Hải Phòng', '20.6889140', '106.4814255', null, '0');
INSERT INTO `ap_location_district` VALUES ('315', '31', 'Tiên Lãng', '555', 'Huyện', 'tien-lang', 'Huyện Tiên Lãng, Hải Phòng', '20.7240400', '106.5535966', null, '0');
INSERT INTO `ap_location_district` VALUES ('314', '31', 'Kiến Thuỵ', '238', 'Huyện', 'kien-thuy', 'Huyện Kiến Thuỵ, Hải Phòng', '20.7515698', '106.6701329', null, '0');
INSERT INTO `ap_location_district` VALUES ('313', '31', 'An Lão', '4', 'Huyện', 'an-lao', 'Huyện An Lão, Hải Phòng', '20.8214217', '106.5565478', null, '0');
INSERT INTO `ap_location_district` VALUES ('312', '31', 'An Dương', '2', 'Huyện', 'an-duong', 'Huyện An Dương, Hải Phòng', '20.9003561', '106.5788703', null, '0');
INSERT INTO `ap_location_district` VALUES ('311', '31', 'Thuỷ Nguyên', '552', 'Huyện', 'thuy-nguyen', 'Huyện Thuỷ Nguyên, Hải Phòng', '20.9451331', '106.6715543', null, '0');
INSERT INTO `ap_location_district` VALUES ('308', '31', 'Đồ Sơn', '684', 'Quận', 'do-son', 'Quận Đồ Sơn, Hải Phòng', '20.7247533', '106.7742534', null, '0');
INSERT INTO `ap_location_district` VALUES ('309', '31', 'Dương Kinh', '144', 'Quận', 'duong-kinh', 'Quận Dương Kinh, Hải Phòng', '20.7733918', '106.7213703', null, '0');
INSERT INTO `ap_location_district` VALUES ('307', '31', 'Kiến An', '235', 'Quận', 'kien-an', 'Quận Kiến An, Hải Phòng', '20.8013772', '106.6263194', null, '0');
INSERT INTO `ap_location_district` VALUES ('306', '31', 'Hải An', '179', 'Quận', 'hai-an', 'Quận Hải An, Hải Phòng', '20.8300935', '106.7219631', null, '0');
INSERT INTO `ap_location_district` VALUES ('305', '31', 'Lê Chân', '278', 'Quận', 'le-chan', 'Quận Lê Chân, Hải Phòng', '20.8345046', '106.6831336', null, '0');
INSERT INTO `ap_location_district` VALUES ('304', '31', 'Ngô Quyền', '353', 'Quận', 'ngo-quyen', 'Quận Ngô Quyền, Hải Phòng', '20.8566653', '106.6994903', null, '0');
INSERT INTO `ap_location_district` VALUES ('303', '31', 'Hồng Bàng', '212', 'Quận', 'hong-bang', 'Quận Hồng Bàng, Hải Phòng', '20.8595313', '106.6669930', null, '0');
INSERT INTO `ap_location_district` VALUES ('300', '30', 'Thanh Miện', '525', 'Huyện', 'thanh-mien', 'Huyện Thanh Miện, Hải Dương', '20.7821204', '106.2203815', null, '0');
INSERT INTO `ap_location_district` VALUES ('298', '30', 'Tứ Kỳ', '580', 'Huyện', 'tu-ky', 'Huyện Tứ Kỳ, Hải Dương', '20.8168182', '106.4112446', null, '0');
INSERT INTO `ap_location_district` VALUES ('299', '30', 'Ninh Giang', '366', 'Huyện', 'ninh-giang', 'Huyện Ninh Giang, Hải Dương', '20.7491091', '106.3699271', null, '0');
INSERT INTO `ap_location_district` VALUES ('297', '30', 'Gia Lộc', '155', 'Huyện', 'gia-loc', 'Huyện Gia Lộc, Hải Dương', '20.8612295', '106.2875210', null, '0');
INSERT INTO `ap_location_district` VALUES ('296', '30', 'Bình Giang', '52', 'Huyện', 'binh-giang', 'Huyện Bình Giang, Hải Dương', '20.8703560', '106.1933837', null, '0');
INSERT INTO `ap_location_district` VALUES ('295', '30', 'Cẩm Giàng', '77', 'Huyện', 'cam-giang', 'Huyện Cẩm Giàng, Hải Dương', '20.9479485', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('294', '30', 'Thanh Hà', '520', 'Huyện', 'thanh-ha', 'Huyện Thanh Hà, Hải Dương', '20.9083580', '106.4276087', null, '0');
INSERT INTO `ap_location_district` VALUES ('293', '30', 'Kim Thành', '244', 'Huyện', 'kim-thanh', 'Huyện Kim Thành, Hải Dương', '20.8984531', '106.5141873', null, '0');
INSERT INTO `ap_location_district` VALUES ('292', '30', 'Kinh Môn', '246', 'Huyện', 'kinh-mon', 'Huyện Kinh Môn, Hải Dương', '21.0110318', '106.5273651', null, '0');
INSERT INTO `ap_location_district` VALUES ('290', '30', 'Chí Linh', '117', 'Thị xã', 'chi-linh', 'Thị xã Chí Linh, Hải Dương', '21.1608547', '106.4170311', null, '0');
INSERT INTO `ap_location_district` VALUES ('291', '30', 'Nam Sách', '336', 'Huyện', 'nam-sach', 'Huyện Nam Sách, Hải Dương', '20.9954640', '106.3346061', null, '0');
INSERT INTO `ap_location_district` VALUES ('288', '30', 'Hải Dương', '182', 'Thành phố', 'hai-duong', 'Thành phố Hải Dương, Hải Dương', '20.9373413', '106.3145542', null, '0');
INSERT INTO `ap_location_district` VALUES ('264', '27', 'Lương Tài', '297', 'Huyện', 'luong-tai', 'Huyện Lương Tài, Bắc Ninh', '21.0278149', '106.2404468', null, '0');
INSERT INTO `ap_location_district` VALUES ('263', '27', 'Gia Bình', '153', 'Huyện', 'gia-binh', 'Huyện Gia Bình, Bắc Ninh', '21.0764073', '106.2169139', null, '0');
INSERT INTO `ap_location_district` VALUES ('262', '27', 'Thuận Thành', '549', 'Huyện', 'thuan-thanh', 'Huyện Thuận Thành, Bắc Ninh', '21.0357781', '106.0792574', null, '0');
INSERT INTO `ap_location_district` VALUES ('261', '27', 'Từ Sơn', '583', 'Thị xã', 'tu-son', 'Thị xã Từ Sơn, Bắc Ninh', '21.1196529', '105.9623161', null, '0');
INSERT INTO `ap_location_district` VALUES ('260', '27', 'Tiên Du', '553', 'Huyện', 'tien-du', 'Huyện Tiên Du, Bắc Ninh', '21.1178311', '106.0287512', null, '0');
INSERT INTO `ap_location_district` VALUES ('258', '27', 'Yên Phong', '649', 'Huyện', 'yen-phong', 'Huyện Yên Phong, Bắc Ninh', '21.2029570', '105.9581624', null, '0');
INSERT INTO `ap_location_district` VALUES ('259', '27', 'Quế Võ', '439', 'Huyện', 'que-vo', 'Huyện Quế Võ, Bắc Ninh', '21.1377307', '106.1816196', null, '0');
INSERT INTO `ap_location_district` VALUES ('256', '27', 'Bắc Ninh', '28', 'Thành phố', 'bac-ninh', 'Thành phố Bắc Ninh, Bắc Ninh', '21.1766814', '106.0621591', null, '0');
INSERT INTO `ap_location_district` VALUES ('253', '26', 'Sông Lô', '468', 'Huyện', 'song-lo', 'Huyện Sông Lô, Vĩnh Phúc', '21.4564665', '105.3950939', null, '0');
INSERT INTO `ap_location_district` VALUES ('252', '26', 'Vĩnh Tường', '626', 'Huyện', 'vinh-tuong', 'Huyện Vĩnh Tường, Vĩnh Phúc', '21.2537742', '105.4899167', null, '0');
INSERT INTO `ap_location_district` VALUES ('251', '26', 'Yên Lạc', '644', 'Huyện', 'yen-lac', 'Huyện Yên Lạc, Vĩnh Phúc', '21.1962199', '105.5708865', null, '0');
INSERT INTO `ap_location_district` VALUES ('249', '26', 'Bình Xuyên', '62', 'Huyện', 'binh-xuyen', 'Huyện Bình Xuyên, Vĩnh Phúc', '21.3138570', '105.6764461', null, '0');
INSERT INTO `ap_location_district` VALUES ('248', '26', 'Tam Đảo', '476', 'Huyện', 'tam-dao', 'Huyện Tam Đảo, Vĩnh Phúc', '21.4747064', '105.5708865', null, '0');
INSERT INTO `ap_location_district` VALUES ('247', '26', 'Tam Dương', '472', 'Huyện', 'tam-duong', 'Huyện Tam Dương, Vĩnh Phúc', '21.3713778', '105.5591615', null, '0');
INSERT INTO `ap_location_district` VALUES ('246', '26', 'Lập Thạch', '276', 'Huyện', 'lap-thach', 'Huyện Lập Thạch, Vĩnh Phúc', '21.4371499', '105.4771084', null, '0');
INSERT INTO `ap_location_district` VALUES ('244', '26', 'Phúc Yên', '407', 'Thị xã', 'phuc-yen', 'Thị xã Phúc Yên, Vĩnh Phúc', '21.3325846', '105.7233814', null, '0');
INSERT INTO `ap_location_district` VALUES ('243', '26', 'Vĩnh Yên', '627', 'Thành phố', 'vinh-yen', 'Thành phố Vĩnh Yên, Vĩnh Phúc', '21.2973262', '105.6060661', null, '0');
INSERT INTO `ap_location_district` VALUES ('240', '25', 'Tân Sơn', '493', 'Huyện', 'tan-son', 'Huyện Tân Sơn, Phú Thọ', '21.1665519', '104.9894851', null, '0');
INSERT INTO `ap_location_district` VALUES ('239', '25', 'Thanh Thuỷ', '529', 'Huyện', 'thanh-thuy', 'Huyện Thanh Thuỷ, Phú Thọ', '21.1141818', '105.2807163', null, '0');
INSERT INTO `ap_location_district` VALUES ('237', '25', 'Lâm Thao', '271', 'Huyện', 'lam-thao', 'Huyện Lâm Thao, Phú Thọ', '21.3026143', '105.3014109', null, '0');
INSERT INTO `ap_location_district` VALUES ('238', '25', 'Thanh Sơn', '528', 'Huyện', 'thanh-son', 'Huyện Thanh Sơn, Phú Thọ', '21.0240198', '105.1726816', null, '0');
INSERT INTO `ap_location_district` VALUES ('236', '25', 'Tam Nông', '474', 'Huyện', 'tam-nong', 'Huyện Tam Nông, Phú Thọ', '21.2858685', '105.2311827', null, '0');
INSERT INTO `ap_location_district` VALUES ('235', '25', 'Cẩm Khê', '78', 'Huyện', 'cam-khe', 'Huyện Cẩm Khê, Phú Thọ', '21.4298041', '105.0557415', null, '0');
INSERT INTO `ap_location_district` VALUES ('234', '25', 'Yên Lập', '645', 'Huyện', 'yen-lap', 'Huyện Yên Lập, Phú Thọ', '21.3410625', '105.0089888', null, '0');
INSERT INTO `ap_location_district` VALUES ('233', '25', 'Phù Ninh', '393', 'Huyện', 'phu-ninh', 'Huyện Phù Ninh, Phú Thọ', '21.4753257', '105.2844608', null, '0');
INSERT INTO `ap_location_district` VALUES ('232', '25', 'Thanh Ba', '517', 'Huyện', 'thanh-ba', 'Huyện Thanh Ba, Phú Thọ', '21.4677045', '105.1492869', null, '0');
INSERT INTO `ap_location_district` VALUES ('230', '25', 'Đoan Hùng', '685', 'Huyện', 'doan-hung', 'Huyện Đoan Hùng, Phú Thọ', '21.6071636', '105.1492869', null, '0');
INSERT INTO `ap_location_district` VALUES ('231', '25', 'Hạ Hoà', '171', 'Huyện', 'ha-hoa', 'Huyện Hạ Hoà, Phú Thọ', '21.5735989', '105.0089888', null, '0');
INSERT INTO `ap_location_district` VALUES ('228', '25', 'Phú Thọ', '401', 'Thị xã', 'phu-tho', 'Thị xã Phú Thọ, Phú Thọ', '21.4252786', '105.2311827', null, '0');
INSERT INTO `ap_location_district` VALUES ('227', '25', 'Việt Trì', '612', 'Thành phố', 'viet-tri', 'Thành phố Việt Trì, Phú Thọ', '21.3425399', '105.3716684', null, '0');
INSERT INTO `ap_location_district` VALUES ('223', '24', 'Hiệp Hòa', '191', 'Huyện', 'hiep-hoa', 'Huyện Hiệp Hòa, Bắc Giang', '21.3552222', '105.9790377', null, '0');
INSERT INTO `ap_location_district` VALUES ('222', '24', 'Việt Yên', '613', 'Huyện', 'viet-yen', 'Huyện Việt Yên, Bắc Giang', '21.2858633', '106.0875326', null, '0');
INSERT INTO `ap_location_district` VALUES ('221', '24', 'Yên Dũng', '642', 'Huyện', 'yen-dung', 'Huyện Yên Dũng, Bắc Giang', '21.2257315', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('220', '24', 'Sơn Động', '464', 'Huyện', 'son-dong', 'Huyện Sơn Động, Bắc Giang', '21.3520004', '106.8849897', null, '0');
INSERT INTO `ap_location_district` VALUES ('219', '24', 'Lục Ngạn', '294', 'Huyện', 'luc-ngan', 'Huyện Lục Ngạn, Bắc Giang', '21.4354043', '106.6762920', null, '0');
INSERT INTO `ap_location_district` VALUES ('218', '24', 'Lục Nam', '293', 'Huyện', 'luc-nam', 'Huyện Lục Nam, Bắc Giang', '21.2996631', '106.4170311', null, '0');
INSERT INTO `ap_location_district` VALUES ('217', '24', 'Lạng Giang', '273', 'Huyện', 'lang-giang', 'Huyện Lạng Giang, Bắc Giang', '21.3646422', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('216', '24', 'Tân Yên', '499', 'Huyện', 'tan-yen', 'Huyện Tân Yên, Bắc Giang', '21.3785203', '106.0875326', null, '0');
INSERT INTO `ap_location_district` VALUES ('215', '24', 'Yên Thế', '652', 'Huyện', 'yen-the', 'Huyện Yên Thế, Bắc Giang', '21.5128774', '106.1345705', null, '0');
INSERT INTO `ap_location_district` VALUES ('207', '22', 'Cô Tô', '130', 'Huyện', 'co-to', 'Huyện Cô Tô, Quảng Ninh', '21.1062206', '107.8346924', null, '0');
INSERT INTO `ap_location_district` VALUES ('213', '24', 'Bắc Giang', '23', 'Thành phố', 'bac-giang', 'Thành phố Bắc Giang, Bắc Giang', '21.2909028', '106.1867027', null, '0');
INSERT INTO `ap_location_district` VALUES ('206', '22', 'Quảng Yên', '435', 'Thị xã', 'quang-yen', 'Thị xã Quảng Yên, Quảng Ninh', '20.9334638', '106.8414374', null, '0');
INSERT INTO `ap_location_district` VALUES ('205', '22', 'Đông Triều', '697', 'Thị xã', 'dong-trieu', 'Thị xã Đông Triều, Quảng Ninh', '21.0958153', '106.6055534', null, '0');
INSERT INTO `ap_location_district` VALUES ('204', '22', 'Hoành Bồ', '207', 'Huyện', 'hoanh-bo', 'Huyện Hoành Bồ, Quảng Ninh', '21.0551849', '107.0405167', null, '0');
INSERT INTO `ap_location_district` VALUES ('203', '22', 'Vân Đồn', '608', 'Huyện', 'van-don', 'Huyện Vân Đồn, Quảng Ninh', '21.0693983', '107.4202262', null, '0');
INSERT INTO `ap_location_district` VALUES ('202', '22', 'Ba Chẽ', '13', 'Huyện', 'ba-che', 'Huyện Ba Chẽ, Quảng Ninh', '21.2943250', '107.1484521', null, '0');
INSERT INTO `ap_location_district` VALUES ('201', '22', 'Hải Hà', '183', 'Huyện', 'hai-ha', 'Huyện Hải Hà, Quảng Ninh', '21.4182232', '107.7162500', null, '0');
INSERT INTO `ap_location_district` VALUES ('200', '22', 'Đầm Hà', '672', 'Huyện', 'dam-ha', 'Huyện Đầm Hà, Quảng Ninh', '21.3619435', '107.5978577', null, '0');
INSERT INTO `ap_location_district` VALUES ('199', '22', 'Tiên Yên', '558', 'Huyện', 'tien-yen', 'Huyện Tiên Yên, Quảng Ninh', '21.3666878', '107.3375791', null, '0');
INSERT INTO `ap_location_district` VALUES ('198', '22', 'Bình Liêu', '53', 'Huyện', 'binh-lieu', 'Huyện Bình Liêu, Quảng Ninh', '21.5410162', '107.4321959', null, '0');
INSERT INTO `ap_location_district` VALUES ('196', '22', 'Uông Bí', '597', 'Thành phố', 'uong-bi', 'Thành phố Uông Bí, Quảng Ninh', '21.0815850', '106.7470536', null, '0');
INSERT INTO `ap_location_district` VALUES ('195', '22', 'Cẩm Phả', '83', 'Thành phố', 'cam-pha', 'Thành phố Cẩm Phả, Quảng Ninh', '21.0694762', '107.3139304', null, '0');
INSERT INTO `ap_location_district` VALUES ('194', '22', 'Móng Cái', '314', 'Thành phố', 'mong-cai', 'Thành phố Móng Cái, Quảng Ninh', '21.5419456', '107.8794943', null, '0');
INSERT INTO `ap_location_district` VALUES ('193', '22', 'Hạ Long', '173', 'Thành phố', 'ha-long', 'Thành phố Hạ Long, Quảng Ninh', '20.9711977', '107.0448069', null, '0');
INSERT INTO `ap_location_district` VALUES ('189', '20', 'Đình Lập', '681', 'Huyện', 'dinh-lap', 'Huyện Đình Lập, Lạng Sơn', '21.5711978', '107.1484521', null, '0');
INSERT INTO `ap_location_district` VALUES ('187', '20', 'Chi Lăng', '116', 'Huyện', 'chi-lang', 'Huyện Chi Lăng, Lạng Sơn', '21.6506944', '106.6055534', null, '0');
INSERT INTO `ap_location_district` VALUES ('188', '20', 'Lộc Bình', '281', 'Huyện', 'loc-binh', 'Huyện Lộc Bình, Lạng Sơn', '21.7757592', '106.9594723', null, '0');
INSERT INTO `ap_location_district` VALUES ('186', '20', 'Hữu Lũng', '226', 'Huyện', 'huu-lung', 'Huyện Hữu Lũng, Lạng Sơn', '21.5659824', '106.2992912', null, '0');
INSERT INTO `ap_location_district` VALUES ('185', '20', 'Bắc Sơn', '30', 'Huyện', 'bac-son', 'Huyện Bắc Sơn, Lạng Sơn', '21.8437729', '106.2992912', null, '0');
INSERT INTO `ap_location_district` VALUES ('184', '20', 'Văn Quan', '606', 'Huyện', 'van-quan', 'Huyện Văn Quan, Lạng Sơn', '21.8453587', '106.5112712', null, '0');
INSERT INTO `ap_location_district` VALUES ('183', '20', 'Cao Lộc', '95', 'Huyện', 'cao-loc', 'Huyện Cao Lộc, Lạng Sơn', '21.9036302', '106.8414374', null, '0');
INSERT INTO `ap_location_district` VALUES ('182', '20', 'Văn Lãng', '604', 'Huyện', 'van-lang', 'Huyện Văn Lãng, Lạng Sơn', '22.0924829', '106.5819789', null, '0');
INSERT INTO `ap_location_district` VALUES ('181', '20', 'Bình Gia', '51', 'Huyện', 'binh-gia', 'Huyện Bình Gia, Lạng Sơn', '22.0639906', '106.3340858', null, '0');
INSERT INTO `ap_location_district` VALUES ('180', '20', 'Tràng Định', '573', 'Huyện', 'trang-dinh', 'Huyện Tràng Định, Lạng Sơn', '22.2872995', '106.4877072', null, '0');
INSERT INTO `ap_location_district` VALUES ('173', '19', 'Phú Bình', '383', 'Huyện', 'phu-binh', 'Huyện Phú Bình, Thái Nguyên', '21.4849768', '105.9464874', null, '0');
INSERT INTO `ap_location_district` VALUES ('178', '20', 'Lạng Sơn', '274', 'Thành phố', 'lang-son', 'Thành phố Lạng Sơn, Lạng Sơn', '21.8537080', '106.7615190', null, '0');
INSERT INTO `ap_location_district` VALUES ('172', '19', 'Phổ Yên', '379', 'Thị xã', 'pho-yen', 'Thị xã Phổ Yên, Thái Nguyên', '21.4138750', '105.8486183', null, '0');
INSERT INTO `ap_location_district` VALUES ('171', '19', 'Đại Từ', '661', 'Huyện', 'dai-tu', 'Huyện Đại Từ, Thái Nguyên', '21.6304358', '105.6412527', null, '0');
INSERT INTO `ap_location_district` VALUES ('170', '19', 'Võ Nhai', '628', 'Huyện', 'vo-nhai', 'Huyện Võ Nhai, Thái Nguyên', '21.7793409', '106.0169971', null, '0');
INSERT INTO `ap_location_district` VALUES ('169', '19', 'Đồng Hỷ', '694', 'Huyện', 'dong-hy', 'Huyện Đồng Hỷ, Thái Nguyên', '21.6286393', '105.8994956', null, '0');
INSERT INTO `ap_location_district` VALUES ('168', '19', 'Phú Lương', '389', 'Huyện', 'phu-luong', 'Huyện Phú Lương, Thái Nguyên', '21.7860570', '105.7116464', null, '0');
INSERT INTO `ap_location_district` VALUES ('167', '19', 'Định Hóa', '680', 'Huyện', 'dinh-hoa', 'Huyện Định Hóa, Thái Nguyên', '21.8879551', '105.6177942', null, '0');
INSERT INTO `ap_location_district` VALUES ('165', '19', 'Sông Công', '466', 'Thành phố', 'song-cong', 'Thành phố Sông Công, Thái Nguyên', '21.4757637', '105.8234766', null, '0');
INSERT INTO `ap_location_district` VALUES ('159', '17', 'Lạc Thủy', '265', 'Huyện', 'lac-thuy', 'Huyện Lạc Thủy, Hoà Bình', '20.5136724', '105.7333455', null, '0');
INSERT INTO `ap_location_district` VALUES ('164', '19', 'Thái Nguyên', '513', 'Thành phố', 'thai-nguyen', 'Thành phố Thái Nguyên, Thái Nguyên', '21.5671559', '105.8252038', null, '0');
INSERT INTO `ap_location_district` VALUES ('158', '17', 'Yên Thủy', '653', 'Huyện', 'yen-thuy', 'Huyện Yên Thủy, Hoà Bình', '20.4032247', '105.6177942', null, '0');
INSERT INTO `ap_location_district` VALUES ('157', '17', 'Lạc Sơn', '264', 'Huyện', 'lac-son', 'Huyện Lạc Sơn, Hoà Bình', '20.4413353', '105.4536718', null, '0');
INSERT INTO `ap_location_district` VALUES ('156', '17', 'Mai Châu', '301', 'Huyện', 'mai-chau', 'Huyện Mai Châu, Hoà Bình', '20.6901339', '105.0089888', null, '0');
INSERT INTO `ap_location_district` VALUES ('154', '17', 'Cao Phong', '96', 'Huyện', 'cao-phong', 'Huyện Cao Phong, Hoà Bình', '20.7072205', '105.3365360', null, '0');
INSERT INTO `ap_location_district` VALUES ('155', '17', 'Tân Lạc', '488', 'Huyện', 'tan-lac', 'Huyện Tân Lạc, Hoà Bình', '20.6228033', '105.2428853', null, '0');
INSERT INTO `ap_location_district` VALUES ('153', '17', 'Kim Bôi', '242', 'Huyện', 'kim-boi', 'Huyện Kim Bôi, Hoà Bình', '20.6901132', '105.5239912', null, '0');
INSERT INTO `ap_location_district` VALUES ('151', '17', 'Kỳ Sơn', '260', 'Huyện', 'ky-son', 'Huyện Kỳ Sơn, Hoà Bình', '20.9030231', '105.3932378', null, '0');
INSERT INTO `ap_location_district` VALUES ('152', '17', 'Lương Sơn', '296', 'Huyện', 'luong-son', 'Huyện Lương Sơn, Hoà Bình', '20.8719130', '105.5040269', null, '0');
INSERT INTO `ap_location_district` VALUES ('150', '17', 'Đà Bắc', '655', 'Huyện', 'da-bac', 'Huyện Đà Bắc, Hoà Bình', '20.8381545', '105.1726816', null, '0');
INSERT INTO `ap_location_district` VALUES ('148', '17', 'Hòa Bình', '194', 'Thành phố', 'hoa-binh', 'Thành phố Hòa Bình, Hoà Bình', '20.8285780', '105.3380302', null, '0');
INSERT INTO `ap_location_district` VALUES ('141', '15', 'Yên Bình', '640', 'Huyện', 'yen-binh', 'Huyện Yên Bình, Yên Bái', '21.7850519', '104.9856176', null, '0');
INSERT INTO `ap_location_district` VALUES ('140', '15', 'Văn Chấn', '600', 'Huyện', 'van-chan', 'Huyện Văn Chấn, Yên Bái', '21.4298431', '104.7987710', null, '0');
INSERT INTO `ap_location_district` VALUES ('139', '15', 'Trạm Tấu', '567', 'Huyện', 'tram-tau', 'Huyện Trạm Tấu, Yên Bái', '21.4629385', '104.4257533', null, '0');
INSERT INTO `ap_location_district` VALUES ('138', '15', 'Trấn Yên', '569', 'Huyện', 'tran-yen', 'Huyện Trấn Yên, Yên Bái', '21.6160083', '104.7987710', null, '0');
INSERT INTO `ap_location_district` VALUES ('137', '15', 'Mù Căng Chải', '315', 'Huyện', 'mu-cang-chai', 'Huyện Mù Căng Chải, Yên Bái', '21.7670046', '104.1466046', null, '0');
INSERT INTO `ap_location_district` VALUES ('136', '15', 'Văn Yên', '607', 'Huyện', 'van-yen', 'Huyện Văn Yên, Yên Bái', '21.8698428', '104.5655273', null, '0');
INSERT INTO `ap_location_district` VALUES ('135', '15', 'Lục Yên', '295', 'Huyện', 'luc-yen', 'Huyện Lục Yên, Yên Bái', '22.0900049', '104.7054310', null, '0');
INSERT INTO `ap_location_district` VALUES ('133', '15', 'Nghĩa Lộ', '351', 'Thị xã', 'nghia-lo', 'Thị xã Nghĩa Lộ, Yên Bái', '21.6018769', '104.5062651', null, '0');
INSERT INTO `ap_location_district` VALUES ('132', '15', 'Yên Bái', '639', 'Thành phố', 'yen-bai', 'Thành phố Yên Bái, Yên Bái', '21.7167689', '104.8985878', null, '0');
INSERT INTO `ap_location_district` VALUES ('128', '14', 'Vân Hồ', '602', 'Huyện', 'van-ho', 'Huyện Vân Hồ, Sơn La', '20.7931051', '104.7637619', null, '0');
INSERT INTO `ap_location_district` VALUES ('127', '14', 'Sốp Cộp', '470', 'Huyện', 'sop-cop', 'Huyện Sốp Cộp, Sơn La', '20.8874516', '103.4974258', null, '0');
INSERT INTO `ap_location_district` VALUES ('125', '14', 'Mai Sơn', '302', 'Huyện', 'mai-son', 'Huyện Mai Sơn, Sơn La', '21.1219095', '104.0536760', null, '0');
INSERT INTO `ap_location_district` VALUES ('126', '14', 'Sông Mã', '469', 'Huyện', 'song-ma', 'Huyện Sông Mã, Sơn La', '21.0593251', '103.6825860', null, '0');
INSERT INTO `ap_location_district` VALUES ('124', '14', 'Yên Châu', '641', 'Huyện', 'yen-chau', 'Huyện Yên Châu, Sơn La', '21.0050006', '104.3326440', null, '0');
INSERT INTO `ap_location_district` VALUES ('123', '14', 'Mộc Châu', '312', 'Huyện', 'moc-chau', 'Huyện Mộc Châu, Sơn La', '20.9220823', '104.7520939', null, '0');
INSERT INTO `ap_location_district` VALUES ('122', '14', 'Phù Yên', '404', 'Huyện', 'phu-yen', 'Huyện Phù Yên, Sơn La', '21.2623608', '104.6441102', null, '0');
INSERT INTO `ap_location_district` VALUES ('121', '14', 'Bắc Yên', '34', 'Huyện', 'bac-yen', 'Huyện Bắc Yên, Sơn La', '21.2765545', '104.4257533', null, '0');
INSERT INTO `ap_location_district` VALUES ('120', '14', 'Mường La', '319', 'Huyện', 'muong-la', 'Huyện Mường La, Sơn La', '21.4951120', '104.0536760', null, '0');
INSERT INTO `ap_location_district` VALUES ('119', '14', 'Thuận Châu', '547', 'Huyện', 'thuan-chau', 'Huyện Thuận Châu, Sơn La', '21.3900652', '103.6362715', null, '0');
INSERT INTO `ap_location_district` VALUES ('118', '14', 'Quỳnh Nhai', '445', 'Huyện', 'quynh-nhai', 'Huyện Quỳnh Nhai, Sơn La', '21.7132038', '103.6825860', null, '0');
INSERT INTO `ap_location_district` VALUES ('116', '14', 'Sơn La', '459', 'Thành phố', 'son-la', 'Thành phố Sơn La, Sơn La', '21.3270341', '103.9141288', null, '0');
INSERT INTO `ap_location_district` VALUES ('112', '12', 'Nậm Nhùn', '334', 'Huyện', 'nam-nhun', 'Huyện Nậm Nhùn, Lai Châu', '22.1443402', '103.0215186', null, '0');
INSERT INTO `ap_location_district` VALUES ('111', '12', 'Tân Uyên', '497', 'Huyện', 'tan-uyen', 'Huyện Tân Uyên, Lai Châu', '22.0868845', '103.6825860', null, '0');
INSERT INTO `ap_location_district` VALUES ('110', '12', 'Than Uyên', '515', 'Huyện', 'than-uyen', 'Huyện Than Uyên, Lai Châu', '21.8922107', '103.7752634', null, '0');
INSERT INTO `ap_location_district` VALUES ('108', '12', 'Sìn Hồ', '453', 'Huyện', 'sin-ho', 'Huyện Sìn Hồ, Lai Châu', '22.3048884', '103.3125299', null, '0');
INSERT INTO `ap_location_district` VALUES ('109', '12', 'Phong Thổ', '380', 'Huyện', 'phong-tho', 'Huyện Phong Thổ, Lai Châu', '22.5776336', '103.4049445', null, '0');
INSERT INTO `ap_location_district` VALUES ('107', '12', 'Mường Tè', '323', 'Huyện', 'muong-te', 'Huyện Mường Tè, Lai Châu', '22.4003790', '102.7135121', null, '0');
INSERT INTO `ap_location_district` VALUES ('106', '12', 'Tam Đường', '478', 'Huyện', 'tam-duong', 'Huyện Tam Đường, Lai Châu', '22.3497051', '103.6131203', null, '0');
INSERT INTO `ap_location_district` VALUES ('105', '12', 'Lai Châu', '266', 'Thành phố', 'lai-chau', 'Thành phố Lai Châu, Lai Châu', '22.0730990', '103.1574020', null, '0');
INSERT INTO `ap_location_district` VALUES ('103', '11', 'Nậm Pồ', '335', 'Huyện', 'nam-po', 'Huyện Nậm Pồ, Điện Biên', '21.8284538', '102.7541010', null, '0');
INSERT INTO `ap_location_district` VALUES ('102', '11', 'Mường Ảng', '316', 'Huyện', 'muong-ang', 'Huyện Mường Ảng, Điện Biên', '21.5641438', '103.2201828', null, '0');
INSERT INTO `ap_location_district` VALUES ('101', '11', 'Điện Biên Đông', '679', 'Huyện', 'dien-bien-dong', 'Huyện Điện Biên Đông, Điện Biên', '21.2835093', '103.2201828', null, '0');
INSERT INTO `ap_location_district` VALUES ('100', '11', 'Điện Biên', '677', 'Huyện', 'dien-bien', 'Huyện Điện Biên, Điện Biên', '21.2044768', '103.0356940', null, '0');
INSERT INTO `ap_location_district` VALUES ('99', '11', 'Tuần Giáo', '585', 'Huyện', 'tuan-giao', 'Huyện Tuần Giáo, Điện Biên', '21.6427019', '103.4049445', null, '0');
INSERT INTO `ap_location_district` VALUES ('98', '11', 'Tủa Chùa', '584', 'Huyện', 'tua-chua', 'Huyện Tủa Chùa, Điện Biên', '21.9232005', '103.4049445', null, '0');
INSERT INTO `ap_location_district` VALUES ('97', '11', 'Mường Chà', '317', 'Huyện', 'muong-cha', 'Huyện Mường Chà, Điện Biên', '21.8596604', '103.0356940', null, '0');
INSERT INTO `ap_location_district` VALUES ('96', '11', 'Mường Nhé', '322', 'Huyện', 'muong-nhe', 'Huyện Mường Nhé, Điện Biên', '22.0832638', '102.5757028', null, '0');
INSERT INTO `ap_location_district` VALUES ('95', '11', 'Mường Lay', '321', 'Thị xã', 'muong-lay', 'Thị xã Mường Lay, Điện Biên', '22.0498734', '103.1634988', null, '0');
INSERT INTO `ap_location_district` VALUES ('94', '11', 'Điện Biên Phủ', '678', 'Thành phố', 'dien-bien-phu', 'Thành phố Điện Biên Phủ, Điện Biên', '21.4094269', '103.0355852', null, '0');
INSERT INTO `ap_location_district` VALUES ('89', '10', 'Văn Bàn', '598', 'Huyện', 'van-ban', 'Huyện Văn Bàn, Lào Cai', '22.0894109', '104.1930918', null, '0');
INSERT INTO `ap_location_district` VALUES ('88', '10', 'Sa Pa', '448', 'Huyện', 'sa-pa', 'Huyện Sa Pa, Lào Cai', '22.2497168', '103.9608091', null, '0');
INSERT INTO `ap_location_district` VALUES ('87', '10', 'Bảo Yên', '41', 'Huyện', 'bao-yen', 'Huyện Bảo Yên, Lào Cai', '22.2763301', '104.4490398', null, '0');
INSERT INTO `ap_location_district` VALUES ('86', '10', 'Bảo Thắng', '40', 'Huyện', 'bao-thang', 'Huyện Bảo Thắng, Lào Cai', '22.3266996', '104.1466046', null, '0');
INSERT INTO `ap_location_district` VALUES ('85', '10', 'Bắc Hà', '24', 'Huyện', 'bac-ha', 'Huyện Bắc Hà, Lào Cai', '22.4965469', '104.3326440', null, '0');
INSERT INTO `ap_location_district` VALUES ('84', '10', 'Si Ma Cai', '452', 'Huyện', 'si-ma-cai', 'Huyện Si Ma Cai, Lào Cai', '22.6659838', '104.2628510', null, '0');
INSERT INTO `ap_location_district` VALUES ('82', '10', 'Bát Xát', '42', 'Huyện', 'bat-xat', 'Huyện Bát Xát, Lào Cai', '22.5539336', '103.6825860', null, '0');
INSERT INTO `ap_location_district` VALUES ('83', '10', 'Mường Khương', '318', 'Huyện', 'muong-khuong', 'Huyện Mường Khương, Lào Cai', '22.6785309', '104.1233667', null, '0');
INSERT INTO `ap_location_district` VALUES ('80', '10', 'Lào Cai', '275', 'Thành phố', 'lao-cai', 'Thành phố Lào Cai, Lào Cai', '22.4458835', '104.0037764', null, '0');
INSERT INTO `ap_location_district` VALUES ('76', '8', 'Sơn Dương', '456', 'Huyện', 'son-duong', 'Huyện Sơn Dương, Tuyên Quang', '21.6571812', '105.3599568', null, '0');
INSERT INTO `ap_location_district` VALUES ('75', '8', 'Yên Sơn', '650', 'Huyện', 'yen-son', 'Huyện Yên Sơn, Tuyên Quang', '21.9447986', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('74', '8', 'Hàm Yên', '189', 'Huyện', 'ham-yen', 'Huyện Hàm Yên, Tuyên Quang', '22.0839452', '105.0271740', null, '0');
INSERT INTO `ap_location_district` VALUES ('73', '8', 'Chiêm Hóa', '118', 'Huyện', 'chiem-hoa', 'Huyện Chiêm Hóa, Tuyên Quang', '22.1306765', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('72', '8', 'Nà Hang', '330', 'Huyện', 'na-hang', 'Huyện Nà Hang, Tuyên Quang', '22.4933358', '105.3599568', null, '0');
INSERT INTO `ap_location_district` VALUES ('71', '8', 'Lâm Bình', '269', 'Huyện', 'lam-binh', 'Huyện Lâm Bình, Tuyên Quang', '22.5987975', '105.2316283', null, '0');
INSERT INTO `ap_location_district` VALUES ('70', '8', 'Tuyên Quang', '593', 'Thành phố', 'tuyen-quang', 'Thành phố Tuyên Quang, Tuyên Quang', '21.7767246', '105.2280196', null, '0');
INSERT INTO `ap_location_district` VALUES ('65', '6', 'Chợ Mới', '121', 'Huyện', 'cho-moi', 'Huyện Chợ Mới, Bắc Kạn', '21.8796650', '105.7776653', null, '0');
INSERT INTO `ap_location_district` VALUES ('66', '6', 'Na Rì', '331', 'Huyện', 'na-ri', 'Huyện Na Rì, Bắc Kạn', '22.1406595', '106.1110501', null, '0');
INSERT INTO `ap_location_district` VALUES ('64', '6', 'Chợ Đồn', '123', 'Huyện', 'cho-don', 'Huyện Chợ Đồn, Bắc Kạn', '22.1964994', '105.5474373', null, '0');
INSERT INTO `ap_location_district` VALUES ('63', '6', 'Bạch Thông', '35', 'Huyện', 'bach-thong', 'Huyện Bạch Thông, Bắc Kạn', '22.2360787', '105.8525154', null, '0');
INSERT INTO `ap_location_district` VALUES ('62', '6', 'Ngân Sơn', '346', 'Huyện', 'ngan-son', 'Huyện Ngân Sơn, Bắc Kạn', '22.4281787', '106.0169971', null, '0');
INSERT INTO `ap_location_district` VALUES ('61', '6', 'Ba Bể', '12', 'Huyện', 'ba-be', 'Huyện Ba Bể, Bắc Kạn', '22.3636887', '105.7351171', null, '0');
INSERT INTO `ap_location_district` VALUES ('60', '6', 'Pác Nặm', '376', 'Huyện', 'pac-nam', 'Huyện Pác Nặm, Bắc Kạn', '22.6126367', '105.6703226', null, '0');
INSERT INTO `ap_location_district` VALUES ('58', '6', 'Bắc Kạn', '25', 'Thành phố', 'bac-kan', 'Thành phố Bắc Kạn, Bắc Kạn', '22.1329032', '105.8407722', null, '0');
INSERT INTO `ap_location_district` VALUES ('53', '4', 'Thạch An', '507', 'Huyện', 'thach-an', 'Huyện Thạch An, Cao Bằng', '22.4663561', '106.3228338', null, '0');
INSERT INTO `ap_location_district` VALUES ('52', '4', 'Nguyên Bình', '358', 'Huyện', 'nguyen-binh', 'Huyện Nguyên Bình, Cao Bằng', '22.6230856', '105.9229900', null, '0');
INSERT INTO `ap_location_district` VALUES ('51', '4', 'Hoà An', '193', 'Huyện', 'hoa-an', 'Huyện Hoà An, Cao Bằng', '22.7538704', '106.2286800', null, '0');
INSERT INTO `ap_location_district` VALUES ('50', '4', 'Phục Hoà', '405', 'Huyện', 'phuc-hoa', 'Huyện Phục Hoà, Cao Bằng', '22.5392684', '106.5112712', null, '0');
INSERT INTO `ap_location_district` VALUES ('48', '4', 'Hạ Lang', '172', 'Huyện', 'ha-lang', 'Huyện Hạ Lang, Cao Bằng', '22.7042438', '106.6998767', null, '0');
INSERT INTO `ap_location_district` VALUES ('49', '4', 'Quảng Uyên', '433', 'Huyện', 'quang-uyen', 'Huyện Quảng Uyên, Cao Bằng', '22.6829900', '106.4641459', null, '0');
INSERT INTO `ap_location_district` VALUES ('47', '4', 'Trùng Khánh', '578', 'Huyện', 'trung-khanh', 'Huyện Trùng Khánh, Cao Bằng', '22.8323826', '106.5819789', null, '0');
INSERT INTO `ap_location_district` VALUES ('46', '4', 'Trà Lĩnh', '564', 'Huyện', 'tra-linh', 'Huyện Trà Lĩnh, Cao Bằng', '22.7903474', '106.3228338', null, '0');
INSERT INTO `ap_location_district` VALUES ('45', '4', 'Hà Quảng', '174', 'Huyện', 'ha-quang', 'Huyện Hà Quảng, Cao Bằng', '22.9025402', '106.1345705', null, '0');
INSERT INTO `ap_location_district` VALUES ('44', '4', 'Thông Nông', '540', 'Huyện', 'thong-nong', 'Huyện Thông Nông, Cao Bằng', '22.8439088', '105.9520986', null, '0');
INSERT INTO `ap_location_district` VALUES ('43', '4', 'Bảo Lạc', '36', 'Huyện', 'bao-lac', 'Huyện Bảo Lạc, Cao Bằng', '22.8786248', '105.6881788', null, '0');
INSERT INTO `ap_location_district` VALUES ('42', '4', 'Bảo Lâm', '37', 'Huyện', 'bao-lam', 'Huyện Bảo Lâm, Cao Bằng', '22.8464077', '105.5061553', null, '0');
INSERT INTO `ap_location_district` VALUES ('40', '4', 'Cao Bằng', '92', 'Thành phố', 'cao-bang', 'Thành phố Cao Bằng, Cao Bằng', '22.6655648', '106.2606733', null, '0');
INSERT INTO `ap_location_district` VALUES ('35', '2', 'Quang Bình', '428', 'Huyện', 'quang-binh', 'Huyện Quang Bình, Hà Giang', '22.4624387', '104.7054310', null, '0');
INSERT INTO `ap_location_district` VALUES ('34', '2', 'Bắc Quang', '29', 'Huyện', 'bac-quang', 'Huyện Bắc Quang, Hà Giang', '22.4450248', '104.8921668', null, '0');
INSERT INTO `ap_location_district` VALUES ('33', '2', 'Xín Mần', '634', 'Huyện', 'xin-man', 'Huyện Xín Mần, Hà Giang', '22.6659156', '104.5189214', null, '0');
INSERT INTO `ap_location_district` VALUES ('31', '2', 'Bắc Mê', '27', 'Huyện', 'bac-me', 'Huyện Bắc Mê, Hà Giang', '22.7811484', '105.2662931', null, '0');
INSERT INTO `ap_location_district` VALUES ('32', '2', 'Hoàng Su Phì', '206', 'Huyện', 'hoang-su-phi', 'Huyện Hoàng Su Phì, Hà Giang', '22.7417169', '104.7054310', null, '0');
INSERT INTO `ap_location_district` VALUES ('30', '2', 'Vị Xuyên', '611', 'Huyện', 'vi-xuyen', 'Huyện Vị Xuyên, Hà Giang', '22.7241336', '104.8921668', null, '0');
INSERT INTO `ap_location_district` VALUES ('29', '2', 'Quản Bạ', '425', 'Huyện', 'quan-ba', 'Huyện Quản Bạ, Hà Giang', '23.0871860', '104.9856176', null, '0');
INSERT INTO `ap_location_district` VALUES ('28', '2', 'Yên Minh', '646', 'Huyện', 'yen-minh', 'Huyện Yên Minh, Hà Giang', '23.0434955', '105.1960795', null, '0');
INSERT INTO `ap_location_district` VALUES ('27', '2', 'Mèo Vạc', '306', 'Huyện', 'meo-vac', 'Huyện Mèo Vạc, Hà Giang', '23.1341053', '105.4536718', null, '0');
INSERT INTO `ap_location_district` VALUES ('26', '2', 'Đồng Văn', '698', 'Huyện', 'dong-van', 'Huyện Đồng Văn, Hà Giang', '23.2246718', '105.2428853', null, '0');
INSERT INTO `ap_location_district` VALUES ('24', '2', 'Hà Giang', '170', 'Thành phố', 'ha-giang', 'Thành phố Hà Giang, Hà Giang', '22.8025588', '104.9784494', null, '0');
INSERT INTO `ap_location_district` VALUES ('282', '1', 'Mỹ Đức', '329', 'Huyện', 'my-duc', 'Huyện Mỹ Đức, Hà Nội', '20.7257680', '105.7157513', null, '0');
INSERT INTO `ap_location_district` VALUES ('281', '1', 'Ứng Hòa', '596', 'Huyện', 'ung-hoa', 'Huyện Ứng Hòa, Hà Nội', '20.7296140', '105.7782061', null, '0');
INSERT INTO `ap_location_district` VALUES ('280', '1', 'Phú Xuyên', '403', 'Huyện', 'phu-xuyen', 'Huyện Phú Xuyên, Hà Nội', '20.7280728', '105.9029374', null, '0');
INSERT INTO `ap_location_district` VALUES ('279', '1', 'Thường Tín', '550', 'Huyện', 'thuong-tin', 'Huyện Thường Tín, Hà Nội', '20.8055441', '105.8838579', null, '0');
INSERT INTO `ap_location_district` VALUES ('278', '1', 'Thanh Oai', '526', 'Huyện', 'thanh-oai', 'Huyện Thanh Oai, Hà Nội', '20.8532165', '105.7688513', null, '0');
INSERT INTO `ap_location_district` VALUES ('277', '1', 'Chương Mỹ', '129', 'Huyện', 'chuong-my', 'Huyện Chương Mỹ, Hà Nội', '20.8746466', '105.6712465', null, '0');
INSERT INTO `ap_location_district` VALUES ('276', '1', 'Thạch Thất', '510', 'Huyện', 'thach-that', 'Huyện Thạch Thất, Hà Nội', '20.9905234', '105.5251894', null, '0');
INSERT INTO `ap_location_district` VALUES ('274', '1', 'Hoài Đức', '201', 'Huyện', 'hoai-duc', 'Huyện Hoài Đức, Hà Nội', '21.0243168', '105.6988892', null, '0');
INSERT INTO `ap_location_district` VALUES ('275', '1', 'Quốc Oai', '441', 'Huyện', 'quoc-oai', 'Huyện Quốc Oai, Hà Nội', '20.9924634', '105.6404254', null, '0');
INSERT INTO `ap_location_district` VALUES ('273', '1', 'Đan Phượng', '674', 'Huyện', 'dan-phuong', 'Huyện Đan Phượng, Hà Nội', '21.0848550', '105.6690963', null, '0');
INSERT INTO `ap_location_district` VALUES ('272', '1', 'Phúc Thọ', '406', 'Huyện', 'phuc-tho', 'Huyện Phúc Thọ, Hà Nội', '21.1241396', '105.5939066', null, '0');
INSERT INTO `ap_location_district` VALUES ('271', '1', 'Ba Vì', '18', 'Huyện', 'ba-vi', 'Huyện Ba Vì, Hà Nội', '21.1992298', '105.4232116', null, '0');
INSERT INTO `ap_location_district` VALUES ('269', '1', 'Sơn Tây', '460', 'Thị xã', 'son-tay', 'Thị xã Sơn Tây, Hà Nội', '21.1032279', '105.4969964', null, '0');
INSERT INTO `ap_location_district` VALUES ('268', '1', 'Hà Đông', '178', 'Quận', 'ha-dong', 'Quận Hà Đông, Hà Nội', '20.9558350', '105.7563658', null, '0');
INSERT INTO `ap_location_district` VALUES ('250', '1', 'Mê Linh', '305', 'Huyện', 'me-linh', 'Huyện Mê Linh, Hà Nội', '21.1753431', '105.7308045', null, '0');
INSERT INTO `ap_location_district` VALUES ('21', '1', 'Bắc Từ Liêm', '33', 'Quận', 'bac-tu-liem', 'Quận Bắc Từ Liêm, Hà Nội', '21.0730201', '105.7703287', null, '0');
INSERT INTO `ap_location_district` VALUES ('20', '1', 'Thanh Trì', '530', 'Huyện', 'thanh-tri', 'Huyện Thanh Trì, Hà Nội', '20.9344418', '105.8462288', null, '0');
INSERT INTO `ap_location_district` VALUES ('18', '1', 'Gia Lâm', '154', 'Huyện', 'gia-lam', 'Huyện Gia Lâm, Hà Nội', '21.0105208', '105.9529410', null, '0');
INSERT INTO `ap_location_district` VALUES ('19', '1', 'Nam Từ Liêm', '339', 'Quận', 'nam-tu-liem', 'Quận Nam Từ Liêm, Hà Nội', '21.0034608', '105.7703287', null, '0');
INSERT INTO `ap_location_district` VALUES ('17', '1', 'Đông Anh', '687', 'Huyện', 'dong-anh', 'Huyện Đông Anh, Hà Nội', '21.1245303', '105.8271398', null, '0');
INSERT INTO `ap_location_district` VALUES ('16', '1', 'Sóc Sơn', '454', 'Huyện', 'soc-son', 'Huyện Sóc Sơn, Hà Nội', '21.2573126', '105.8480203', null, '0');
INSERT INTO `ap_location_district` VALUES ('8', '1', 'Hoàng Mai', '204', 'Quận', 'hoang-mai', 'Quận Hoàng Mai, Hà Nội', '20.9836984', '105.8636257', null, '0');
INSERT INTO `ap_location_district` VALUES ('9', '1', 'Thanh Xuân', '532', 'Quận', 'thanh-xuan', 'Quận Thanh Xuân, Hà Nội', '20.9959819', '105.8097244', null, '0');
INSERT INTO `ap_location_district` VALUES ('7', '1', 'Hai Bà Trưng', '180', 'Quận', 'hai-ba-trung', 'Quận Hai Bà Trưng, Hà Nội', '21.0090571', '105.8607507', null, '0');
INSERT INTO `ap_location_district` VALUES ('6', '1', 'Đống Đa', '701', 'Quận', 'dong-da', 'Quận Đống Đa, Hà Nội', '21.0180725', '105.8299495', null, '0');
INSERT INTO `ap_location_district` VALUES ('5', '1', 'Cầu Giấy', '99', 'Quận', 'cau-giay', 'Quận Cầu Giấy, Hà Nội', '21.0362368', '105.7905825', null, '0');
INSERT INTO `ap_location_district` VALUES ('4', '1', 'Long Biên', '284', 'Quận', 'long-bien', 'Quận Long Biên, Hà Nội', '21.0548635', '105.8884966', null, '0');
INSERT INTO `ap_location_district` VALUES ('2', '1', 'Hoàn Kiếm', '202', 'Quận', 'hoan-kiem', 'Quận Hoàn Kiếm, Hà Nội', '21.0279640', '105.8510132', null, '0');
INSERT INTO `ap_location_district` VALUES ('3', '1', 'Tây Hồ', '502', 'Quận', 'tay-ho', 'Quận Tây Hồ, Hà Nội', '21.0811211', '105.8180306', null, '0');
INSERT INTO `ap_location_district` VALUES ('1', '1', 'Ba Đình', '19', 'Quận', 'ba-dinh', 'Quận Ba Đình, Hà Nội', '21.0337815', '105.8140539', null, '1');

-- ----------------------------
-- Table structure for `ap_location_street`
-- ----------------------------
DROP TABLE IF EXISTS `ap_location_street`;
CREATE TABLE `ap_location_street` (
  `id` int(11) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quận huyện',
  `title` varchar(250) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `name_with_type` varchar(250) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `path_with_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ap_location_street
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_location_ward`
-- ----------------------------
DROP TABLE IF EXISTS `ap_location_ward`;
CREATE TABLE `ap_location_ward` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `district` varchar(30) NOT NULL DEFAULT '0' COMMENT 'Quận huyện',
  `district_id` int(11) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `name_with_type` varchar(250) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ap_location_ward
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_logged_device`
-- ----------------------------
DROP TABLE IF EXISTS `ap_logged_device`;
CREATE TABLE `ap_logged_device` (
  `user_id` bigint(20) NOT NULL,
  `ip_address` varchar(45) NOT NULL COMMENT 'IP client',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `device_code` char(32) NOT NULL COMMENT 'Mã md5 thiết bị + key secret',
  `user_agent` varchar(255) NOT NULL COMMENT 'Tên thiết bị',
  UNIQUE KEY `ap_logged_device_user_id_ip_address_user_agent_pk` (`user_id`,`ip_address`,`user_agent`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_logged_device
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_login_attempts`
-- ----------------------------
DROP TABLE IF EXISTS `ap_login_attempts`;
CREATE TABLE `ap_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_login_attempts
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_log_action`
-- ----------------------------
DROP TABLE IF EXISTS `ap_log_action`;
CREATE TABLE `ap_log_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1153 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_log_action
-- ----------------------------
INSERT INTO `ap_log_action` VALUES ('1', 'category', 'Insert category: 1', '1', '2019-10-31 05:00:27');
INSERT INTO `ap_log_action` VALUES ('2', 'system_menu', 'Delete system_menu: 103', '1', '2019-10-31 05:08:23');
INSERT INTO `ap_log_action` VALUES ('3', 'system_menu', 'Delete system_menu: 96', '1', '2019-11-01 01:40:47');
INSERT INTO `ap_log_action` VALUES ('4', 'system_menu', 'Delete system_menu: 81', '1', '2019-11-01 01:43:19');
INSERT INTO `ap_log_action` VALUES ('5', 'system_menu', 'Insert system_menu: 105', '1', '2019-11-05 10:20:38');
INSERT INTO `ap_log_action` VALUES ('6', 'system_menu', 'Insert system_menu: 106', '1', '2019-11-05 10:23:58');
INSERT INTO `ap_log_action` VALUES ('7', 'category', 'Insert category: 2', '1', '2019-11-05 03:54:28');
INSERT INTO `ap_log_action` VALUES ('8', 'category', 'Insert category: 3', '1', '2019-11-05 03:54:58');
INSERT INTO `ap_log_action` VALUES ('9', 'category', 'Insert category: 4', '1', '2019-11-05 03:55:12');
INSERT INTO `ap_log_action` VALUES ('10', 'category', 'Insert category: 5', '1', '2019-11-05 03:55:39');
INSERT INTO `ap_log_action` VALUES ('11', 'system_menu', 'Insert system_menu: 107', '1', '2019-11-05 04:00:31');
INSERT INTO `ap_log_action` VALUES ('12', 'system_menu', 'Insert system_menu: 108', '1', '2019-11-05 04:01:27');
INSERT INTO `ap_log_action` VALUES ('13', 'system_menu', 'Insert system_menu: 109', '1', '2019-11-05 04:03:08');
INSERT INTO `ap_log_action` VALUES ('14', 'system_menu', 'Update system_menu: 89', '1', '2019-11-05 04:03:35');
INSERT INTO `ap_log_action` VALUES ('15', 'system_menu', 'Update system_menu: 75', '1', '2019-11-05 04:03:51');
INSERT INTO `ap_log_action` VALUES ('16', 'system_menu', 'Update system_menu: 79', '1', '2019-11-05 04:04:00');
INSERT INTO `ap_log_action` VALUES ('17', 'system_menu', 'Update system_menu: 109', '1', '2019-11-05 04:04:12');
INSERT INTO `ap_log_action` VALUES ('18', 'system_menu', 'Delete system_menu: 76', '1', '2019-11-05 04:04:46');
INSERT INTO `ap_log_action` VALUES ('19', 'system_menu', 'Update system_menu: 108', '1', '2019-11-05 04:05:14');
INSERT INTO `ap_log_action` VALUES ('20', 'system_menu', 'Update system_menu: 109', '1', '2019-11-05 04:06:11');
INSERT INTO `ap_log_action` VALUES ('21', 'system_menu', 'Update system_menu: 108', '1', '2019-11-05 04:06:48');
INSERT INTO `ap_log_action` VALUES ('22', 'property', 'Insert property: 0', '1', '2019-11-05 04:10:00');
INSERT INTO `ap_log_action` VALUES ('23', 'property', 'Insert property: 0', '1', '2019-11-05 04:37:06');
INSERT INTO `ap_log_action` VALUES ('24', 'property', 'Insert property: 0', '1', '2019-11-05 04:37:15');
INSERT INTO `ap_log_action` VALUES ('25', 'property', 'Update property: 3', '1', '2019-11-05 04:38:22');
INSERT INTO `ap_log_action` VALUES ('26', 'property', 'Update property: 2', '1', '2019-11-05 04:38:28');
INSERT INTO `ap_log_action` VALUES ('27', 'property', 'Insert property: 0', '1', '2019-11-05 05:07:44');
INSERT INTO `ap_log_action` VALUES ('28', 'property', 'Insert property: 0', '1', '2019-11-05 05:07:54');
INSERT INTO `ap_log_action` VALUES ('29', 'property', 'Insert property: 0', '1', '2019-11-05 05:08:08');
INSERT INTO `ap_log_action` VALUES ('30', 'product', 'Insert product: 1', '1', '2019-11-06 10:17:45');
INSERT INTO `ap_log_action` VALUES ('31', 'product', 'Update product: 1', '1', '2019-11-06 10:32:27');
INSERT INTO `ap_log_action` VALUES ('32', 'product', 'Update product: 1', '1', '2019-11-06 10:36:14');
INSERT INTO `ap_log_action` VALUES ('33', 'product', 'Update product: 1', '1', '2019-11-06 10:36:21');
INSERT INTO `ap_log_action` VALUES ('34', 'product', 'Insert product: 2', '1', '2019-11-06 11:14:07');
INSERT INTO `ap_log_action` VALUES ('35', 'account', 'Insert account: 2', '1', '2019-11-06 01:34:30');
INSERT INTO `ap_log_action` VALUES ('36', 'account', 'Update account: 2', '1', '2019-11-06 01:39:28');
INSERT INTO `ap_log_action` VALUES ('37', 'account', 'Update account: 2', '1', '2019-11-06 01:44:38');
INSERT INTO `ap_log_action` VALUES ('38', 'account', 'Update account: 2', '1', '2019-11-06 01:46:27');
INSERT INTO `ap_log_action` VALUES ('39', 'account', 'Update account: 2', '1', '2019-11-06 01:46:49');
INSERT INTO `ap_log_action` VALUES ('40', 'account', 'Update account: 2', '1', '2019-11-06 01:46:56');
INSERT INTO `ap_log_action` VALUES ('41', 'account', 'Update account: 2', '1', '2019-11-06 01:47:02');
INSERT INTO `ap_log_action` VALUES ('42', 'account', 'Update account: 2', '1', '2019-11-06 01:47:49');
INSERT INTO `ap_log_action` VALUES ('43', 'account', 'Update account: 2', '1', '2019-11-06 01:48:01');
INSERT INTO `ap_log_action` VALUES ('44', 'account', 'Update account: 2', '1', '2019-11-06 01:48:14');
INSERT INTO `ap_log_action` VALUES ('45', 'account', 'Update account: 2', '1', '2019-11-06 01:48:35');
INSERT INTO `ap_log_action` VALUES ('46', 'account', 'Update account: 2', '1', '2019-11-06 01:48:41');
INSERT INTO `ap_log_action` VALUES ('47', 'account', 'Update account: 2', '1', '2019-11-06 01:48:47');
INSERT INTO `ap_log_action` VALUES ('48', 'account', 'Update account: 2', '1', '2019-11-06 01:48:51');
INSERT INTO `ap_log_action` VALUES ('49', 'account', 'Update account: 2', '1', '2019-11-06 02:22:41');
INSERT INTO `ap_log_action` VALUES ('50', 'account', 'Update account: 2', '1', '2019-11-06 02:22:46');
INSERT INTO `ap_log_action` VALUES ('51', 'promotion', 'Update promotion: 2597', '1', '2019-11-06 04:52:44');
INSERT INTO `ap_log_action` VALUES ('52', 'promotion', 'Update promotion: 2598', '1', '2019-11-06 04:52:44');
INSERT INTO `ap_log_action` VALUES ('53', 'promotion', 'Update promotion: 2594', '1', '2019-11-06 04:52:44');
INSERT INTO `ap_log_action` VALUES ('54', 'promotion', 'Update promotion: 2595', '1', '2019-11-06 04:52:44');
INSERT INTO `ap_log_action` VALUES ('55', 'promotion', 'Insert promotion: 2599', '1', '2019-11-06 04:54:59');
INSERT INTO `ap_log_action` VALUES ('56', 'promotion', 'ưpdate promotion: 2599', '1', '2019-11-06 04:58:29');
INSERT INTO `ap_log_action` VALUES ('57', 'promotion', 'ưpdate promotion: 2599', '1', '2019-11-06 04:59:38');
INSERT INTO `ap_log_action` VALUES ('58', 'promotion', 'ưpdate promotion: 2599', '1', '2019-11-06 05:03:59');
INSERT INTO `ap_log_action` VALUES ('59', 'promotion', 'ưpdate promotion: 2599', '1', '2019-11-06 05:06:03');
INSERT INTO `ap_log_action` VALUES ('60', 'promotion', 'ưpdate promotion: 2599', '1', '2019-11-06 05:06:11');
INSERT INTO `ap_log_action` VALUES ('61', 'promotion', 'Insert promotion: 1', '1', '2019-11-07 09:41:58');
INSERT INTO `ap_log_action` VALUES ('62', 'post', 'Insert post: 1', '1', '2019-11-07 11:01:57');
INSERT INTO `ap_log_action` VALUES ('63', 'post', 'Update post: 1', '1', '2019-11-07 11:02:24');
INSERT INTO `ap_log_action` VALUES ('64', 'product', 'Update product: 2', '1', '2019-11-07 01:55:01');
INSERT INTO `ap_log_action` VALUES ('65', 'stock', 'Update stock: stock', '1', '2019-11-07 02:25:44');
INSERT INTO `ap_log_action` VALUES ('66', 'stock', 'Update stock: stock', '1', '2019-11-07 02:25:47');
INSERT INTO `ap_log_action` VALUES ('67', 'stock', 'Update stock: stock', '1', '2019-11-07 05:03:20');
INSERT INTO `ap_log_action` VALUES ('68', 'stock', 'Update stock: stock', '1', '2019-11-07 05:03:33');
INSERT INTO `ap_log_action` VALUES ('69', 'stock', 'Update stock: stock', '1', '2019-11-07 05:14:09');
INSERT INTO `ap_log_action` VALUES ('70', 'stock', 'Update stock: stock', '1', '2019-11-07 05:14:41');
INSERT INTO `ap_log_action` VALUES ('71', 'system_menu', 'Insert system_menu: 110', '1', '2019-11-08 01:36:19');
INSERT INTO `ap_log_action` VALUES ('72', 'system_menu', 'Insert system_menu: 111', '1', '2019-11-08 01:37:38');
INSERT INTO `ap_log_action` VALUES ('73', 'system_menu', 'Insert system_menu: 112', '1', '2019-11-08 01:38:17');
INSERT INTO `ap_log_action` VALUES ('74', 'system_menu', 'Insert system_menu: 113', '1', '2019-11-08 01:38:43');
INSERT INTO `ap_log_action` VALUES ('75', 'system_menu', 'Insert system_menu: 114', '1', '2019-11-08 01:42:56');
INSERT INTO `ap_log_action` VALUES ('76', 'voucher', 'Insert voucher: 542', '1', '2019-11-08 02:06:32');
INSERT INTO `ap_log_action` VALUES ('77', 'voucher', 'Update voucher: 542', '1', '2019-11-08 02:35:37');
INSERT INTO `ap_log_action` VALUES ('78', 'voucher', 'Update voucher: 542', '1', '2019-11-08 03:00:29');
INSERT INTO `ap_log_action` VALUES ('79', 'voucher', 'Update voucher: 542', '1', '2019-11-08 03:00:34');
INSERT INTO `ap_log_action` VALUES ('80', 'voucher', 'Update voucher: 542', '1', '2019-11-08 03:00:38');
INSERT INTO `ap_log_action` VALUES ('81', 'system_menu', 'Insert system_menu: 115', '1', '2019-11-08 04:45:01');
INSERT INTO `ap_log_action` VALUES ('82', 'system_menu', 'Insert system_menu: 116', '1', '2019-11-12 02:00:59');
INSERT INTO `ap_log_action` VALUES ('83', 'system_menu', 'Insert system_menu: 117', '1', '2019-11-12 02:05:29');
INSERT INTO `ap_log_action` VALUES ('84', 'question', 'Insert question: 1', '1', '2019-11-12 02:06:10');
INSERT INTO `ap_log_action` VALUES ('85', 'stock', 'Update stock: stock', '1', '2019-11-12 05:07:44');
INSERT INTO `ap_log_action` VALUES ('86', 'system_menu', 'Update system_menu: 112', '1', '2019-11-13 10:05:04');
INSERT INTO `ap_log_action` VALUES ('87', 'category', 'Update category: 2', '1', '2019-11-14 10:18:15');
INSERT INTO `ap_log_action` VALUES ('88', 'category', 'Update category: 2', '1', '2019-11-14 10:21:07');
INSERT INTO `ap_log_action` VALUES ('89', 'category', 'Update category: 3', '1', '2019-11-14 10:21:29');
INSERT INTO `ap_log_action` VALUES ('90', 'category', 'Update category: 3', '1', '2019-11-14 10:21:37');
INSERT INTO `ap_log_action` VALUES ('91', 'category', 'Update category: 2', '1', '2019-11-14 10:26:33');
INSERT INTO `ap_log_action` VALUES ('92', 'groups', 'Update groups: 2', '1', '2019-11-16 11:01:33');
INSERT INTO `ap_log_action` VALUES ('93', 'groups', 'Update groups: 2', '1', '2019-11-16 11:04:29');
INSERT INTO `ap_log_action` VALUES ('94', 'groups', 'Update groups: 2', '1', '2019-11-16 11:06:02');
INSERT INTO `ap_log_action` VALUES ('95', 'groups', 'Update groups: 2', '1', '2019-11-16 11:08:11');
INSERT INTO `ap_log_action` VALUES ('96', 'groups', 'Update groups: 2', '1', '2019-11-16 11:09:39');
INSERT INTO `ap_log_action` VALUES ('97', 'groups', 'Update groups: 2', '1', '2019-11-16 11:11:02');
INSERT INTO `ap_log_action` VALUES ('98', 'groups', 'Update groups: 2', '1', '2019-11-16 11:12:02');
INSERT INTO `ap_log_action` VALUES ('99', 'groups', 'Update groups: 2', '1', '2019-11-16 11:14:44');
INSERT INTO `ap_log_action` VALUES ('100', 'groups', 'Update groups: 2', '1', '2019-11-16 11:14:48');
INSERT INTO `ap_log_action` VALUES ('101', 'groups', 'Update groups: 2', '1', '2019-11-16 11:14:54');
INSERT INTO `ap_log_action` VALUES ('102', 'groups', 'Update groups: 2', '1', '2019-11-16 11:21:55');
INSERT INTO `ap_log_action` VALUES ('103', 'groups', 'Update groups: 2', '1', '2019-11-16 11:24:56');
INSERT INTO `ap_log_action` VALUES ('104', 'groups', 'Update groups: 2', '1', '2019-11-16 11:25:00');
INSERT INTO `ap_log_action` VALUES ('105', 'groups', 'Update groups: 2', '1', '2019-11-16 02:54:54');
INSERT INTO `ap_log_action` VALUES ('106', 'groups', 'Update groups: 2', '1', '2019-11-16 02:54:59');
INSERT INTO `ap_log_action` VALUES ('107', 'groups', 'Update groups: 2', '1', '2019-11-16 03:56:13');
INSERT INTO `ap_log_action` VALUES ('108', 'category', 'Insert category: 6', '2', '2019-11-16 04:39:20');
INSERT INTO `ap_log_action` VALUES ('109', 'category', 'Update category: 6', '2', '2019-11-16 05:00:59');
INSERT INTO `ap_log_action` VALUES ('110', 'category', 'Insert category: 7', '2', '2019-11-16 05:07:40');
INSERT INTO `ap_log_action` VALUES ('111', 'category', 'Update category: 7', '2', '2019-11-16 05:07:48');
INSERT INTO `ap_log_action` VALUES ('112', 'stock', 'Update stock: stock', '1', '2019-11-16 05:08:33');
INSERT INTO `ap_log_action` VALUES ('113', 'stock', 'Update stock: stock', '1', '2019-11-16 05:08:45');
INSERT INTO `ap_log_action` VALUES ('114', 'category', 'Update category: 1', '2', '2019-11-16 05:09:47');
INSERT INTO `ap_log_action` VALUES ('115', 'category', 'Insert category: 8', '2', '2019-11-16 05:16:27');
INSERT INTO `ap_log_action` VALUES ('116', 'category', 'Update category: 8', '2', '2019-11-16 05:16:30');
INSERT INTO `ap_log_action` VALUES ('117', 'category', 'Update category: 1', '2', '2019-11-16 05:16:40');
INSERT INTO `ap_log_action` VALUES ('118', 'groups', 'Update groups: 2', '1', '2019-11-16 05:34:07');
INSERT INTO `ap_log_action` VALUES ('119', 'category', 'Update category: 1', '2', '2019-11-16 05:45:21');
INSERT INTO `ap_log_action` VALUES ('120', 'groups', 'Update groups: 2', '1', '2019-11-18 10:35:10');
INSERT INTO `ap_log_action` VALUES ('121', 'system_menu', 'Update system_menu: 100', '1', '2019-11-18 10:57:17');
INSERT INTO `ap_log_action` VALUES ('122', 'post', 'Update post: 1', '1', '2019-11-18 11:02:23');
INSERT INTO `ap_log_action` VALUES ('123', 'system_menu', 'Delete system_menu: 100', '1', '2019-11-18 11:06:28');
INSERT INTO `ap_log_action` VALUES ('124', 'system_menu', 'Delete system_menu: 101', '1', '2019-11-18 11:09:04');
INSERT INTO `ap_log_action` VALUES ('125', 'groups', 'Update groups: 2', '1', '2019-11-18 11:57:22');
INSERT INTO `ap_log_action` VALUES ('126', 'groups', 'Update groups: 2', '1', '2019-11-18 12:00:20');
INSERT INTO `ap_log_action` VALUES ('127', 'groups', 'Update groups: 2', '1', '2019-11-18 01:35:01');
INSERT INTO `ap_log_action` VALUES ('128', 'groups', 'Update groups: 2', '1', '2019-11-18 01:39:12');
INSERT INTO `ap_log_action` VALUES ('129', 'post', 'Insert post: 2', '2', '2019-11-18 02:14:29');
INSERT INTO `ap_log_action` VALUES ('130', 'groups', 'Update groups: 2', '1', '2019-11-18 03:25:18');
INSERT INTO `ap_log_action` VALUES ('131', 'product', 'Update product: 2', '2', '2019-11-18 03:36:12');
INSERT INTO `ap_log_action` VALUES ('132', 'stock', 'Update stock: stock', '1', '2019-11-18 04:54:34');
INSERT INTO `ap_log_action` VALUES ('133', 'promotion', 'ưpdate promotion: 1', '1', '2019-11-18 04:56:28');
INSERT INTO `ap_log_action` VALUES ('134', 'promotion', 'ưpdate promotion: 1', '1', '2019-11-18 04:56:41');
INSERT INTO `ap_log_action` VALUES ('135', 'promotion', 'ưpdate promotion: 1', '1', '2019-11-18 04:56:51');
INSERT INTO `ap_log_action` VALUES ('136', 'promotion', 'ưpdate promotion: 1', '1', '2019-11-18 04:57:43');
INSERT INTO `ap_log_action` VALUES ('137', 'promotion', 'ưpdate promotion: 1', '1', '2019-11-18 05:11:02');
INSERT INTO `ap_log_action` VALUES ('138', 'promotion', 'Insert promotion: 2', '1', '2019-11-18 05:11:22');
INSERT INTO `ap_log_action` VALUES ('139', 'promotion', 'ưpdate promotion: 2', '1', '2019-11-18 05:52:34');
INSERT INTO `ap_log_action` VALUES ('140', 'promotion', 'ưpdate promotion: 2', '1', '2019-11-18 06:25:27');
INSERT INTO `ap_log_action` VALUES ('141', 'product', 'Insert product: 5', '1', '2019-11-19 09:19:24');
INSERT INTO `ap_log_action` VALUES ('142', 'product', 'Insert product: 6', '1', '2019-11-19 09:20:01');
INSERT INTO `ap_log_action` VALUES ('143', 'product', 'Insert product: 7', '1', '2019-11-19 09:20:26');
INSERT INTO `ap_log_action` VALUES ('144', 'property', 'Update property: 1', '1', '2019-11-19 09:20:44');
INSERT INTO `ap_log_action` VALUES ('145', 'property', 'Insert property: 0', '1', '2019-11-19 09:20:53');
INSERT INTO `ap_log_action` VALUES ('146', 'product', 'Insert product: 8', '1', '2019-11-19 09:21:36');
INSERT INTO `ap_log_action` VALUES ('147', 'product', 'Insert product: 9', '1', '2019-11-19 09:22:16');
INSERT INTO `ap_log_action` VALUES ('148', 'product', 'Insert product: 10', '1', '2019-11-19 09:22:46');
INSERT INTO `ap_log_action` VALUES ('149', 'category', 'Update category: 2', '1', '2019-11-25 04:52:56');
INSERT INTO `ap_log_action` VALUES ('150', 'category', 'Update category: 3', '1', '2019-11-25 04:54:11');
INSERT INTO `ap_log_action` VALUES ('151', 'category', 'Update category: 4', '1', '2019-11-25 04:55:19');
INSERT INTO `ap_log_action` VALUES ('152', 'category', 'Update category: 5', '1', '2019-11-25 04:55:46');
INSERT INTO `ap_log_action` VALUES ('153', 'category', 'Update category: 3', '1', '2019-11-26 09:47:05');
INSERT INTO `ap_log_action` VALUES ('154', 'product', 'Update product: 9', '1', '2019-11-26 09:48:37');
INSERT INTO `ap_log_action` VALUES ('155', 'product', 'Update product: 8', '1', '2019-11-26 09:49:18');
INSERT INTO `ap_log_action` VALUES ('156', 'product', 'Update product: 9', '1', '2019-11-26 09:49:27');
INSERT INTO `ap_log_action` VALUES ('157', 'product', 'Update product: 7', '1', '2019-11-26 09:49:51');
INSERT INTO `ap_log_action` VALUES ('158', 'product', 'Update product: 6', '1', '2019-11-26 09:50:33');
INSERT INTO `ap_log_action` VALUES ('159', 'product', 'Update product: 5', '1', '2019-11-26 09:51:05');
INSERT INTO `ap_log_action` VALUES ('160', 'product', 'Update product: 2', '1', '2019-11-26 09:51:41');
INSERT INTO `ap_log_action` VALUES ('161', 'product', 'Update product: 10', '1', '2019-11-26 09:52:27');
INSERT INTO `ap_log_action` VALUES ('162', 'product', 'Update product: 1', '1', '2019-11-26 09:53:09');
INSERT INTO `ap_log_action` VALUES ('163', 'product', 'Update product: 1', '1', '2019-11-26 09:53:30');
INSERT INTO `ap_log_action` VALUES ('164', 'product', 'Update product: 10', '1', '2019-11-26 09:53:52');
INSERT INTO `ap_log_action` VALUES ('165', 'product', 'Update product: 2', '1', '2019-11-26 09:54:05');
INSERT INTO `ap_log_action` VALUES ('166', 'product', 'Update product: 5', '1', '2019-11-26 09:54:40');
INSERT INTO `ap_log_action` VALUES ('167', 'product', 'Update product: 2', '1', '2019-11-26 09:55:08');
INSERT INTO `ap_log_action` VALUES ('168', 'product', 'Update product: 10', '1', '2019-11-26 09:55:37');
INSERT INTO `ap_log_action` VALUES ('169', 'product', 'Update product: 1', '1', '2019-11-26 09:55:58');
INSERT INTO `ap_log_action` VALUES ('170', 'product', 'Update product: 6', '1', '2019-11-26 09:56:17');
INSERT INTO `ap_log_action` VALUES ('171', 'product', 'Insert product: 11', '1', '2019-11-26 09:57:05');
INSERT INTO `ap_log_action` VALUES ('172', 'product', 'Insert product: 12', '1', '2019-11-26 09:57:47');
INSERT INTO `ap_log_action` VALUES ('173', 'property', 'Insert property: 0', '1', '2019-11-26 09:58:03');
INSERT INTO `ap_log_action` VALUES ('174', 'product', 'Insert product: 13', '1', '2019-11-26 09:58:39');
INSERT INTO `ap_log_action` VALUES ('175', 'product', 'Insert product: 14', '1', '2019-11-26 09:59:19');
INSERT INTO `ap_log_action` VALUES ('176', 'product', 'Update product: 7', '1', '2019-11-26 10:02:36');
INSERT INTO `ap_log_action` VALUES ('177', 'post', 'Update post: 2', '1', '2019-11-26 10:30:12');
INSERT INTO `ap_log_action` VALUES ('178', 'post', 'Update post: 2', '1', '2019-11-26 10:30:34');
INSERT INTO `ap_log_action` VALUES ('179', 'post', 'Insert post: 5', '1', '2019-11-26 10:32:45');
INSERT INTO `ap_log_action` VALUES ('180', 'category', 'Update category: 1', '1', '2019-11-26 10:35:50');
INSERT INTO `ap_log_action` VALUES ('181', 'system_menu', 'Insert system_menu: 118', '1', '2019-11-28 02:48:34');
INSERT INTO `ap_log_action` VALUES ('182', 'transport', 'Insert transport: 31', '1', '2019-11-30 09:53:49');
INSERT INTO `ap_log_action` VALUES ('183', 'category', 'Update category: 4', '1', '2019-12-05 09:45:24');
INSERT INTO `ap_log_action` VALUES ('184', 'promotion', 'ưpdate promotion: 2', '1', '2019-12-05 11:32:11');
INSERT INTO `ap_log_action` VALUES ('185', 'post', 'Update post: 5', '1', '2019-12-05 11:32:31');
INSERT INTO `ap_log_action` VALUES ('186', 'system_menu', 'Update system_menu: 69', '1', '2019-12-05 02:27:52');
INSERT INTO `ap_log_action` VALUES ('187', 'system_menu', 'Update system_menu: 90', '1', '2019-12-05 02:28:22');
INSERT INTO `ap_log_action` VALUES ('188', 'system_menu', 'Update system_menu: 91', '1', '2019-12-05 02:28:35');
INSERT INTO `ap_log_action` VALUES ('189', 'system_menu', 'Update system_menu: 109', '1', '2019-12-05 02:29:04');
INSERT INTO `ap_log_action` VALUES ('190', 'system_menu', 'Update system_menu: 115', '1', '2019-12-05 02:29:28');
INSERT INTO `ap_log_action` VALUES ('191', 'system_menu', 'Update system_menu: 114', '1', '2019-12-05 02:30:15');
INSERT INTO `ap_log_action` VALUES ('192', 'system_menu', 'Update system_menu: 87', '1', '2019-12-05 02:30:29');
INSERT INTO `ap_log_action` VALUES ('193', 'system_menu', 'Insert system_menu: 119', '1', '2019-12-05 02:30:57');
INSERT INTO `ap_log_action` VALUES ('194', 'system_menu', 'Insert system_menu: 120', '1', '2019-12-05 02:32:32');
INSERT INTO `ap_log_action` VALUES ('195', 'system_menu', 'Update system_menu: 119', '1', '2019-12-05 02:32:46');
INSERT INTO `ap_log_action` VALUES ('196', 'system_menu', 'Insert system_menu: 121', '1', '2019-12-05 02:33:25');
INSERT INTO `ap_log_action` VALUES ('197', 'groups', 'Insert groups: 3', '1', '2019-12-05 03:22:46');
INSERT INTO `ap_log_action` VALUES ('198', 'groups', 'Update groups: 3', '1', '2019-12-05 03:24:42');
INSERT INTO `ap_log_action` VALUES ('199', 'groups', 'Update groups: 3', '1', '2019-12-05 03:25:00');
INSERT INTO `ap_log_action` VALUES ('200', 'groups', 'Update groups: 3', '1', '2019-12-05 03:25:50');
INSERT INTO `ap_log_action` VALUES ('201', 'groups', 'Update groups: 3', '1', '2019-12-05 03:26:44');
INSERT INTO `ap_log_action` VALUES ('202', 'groups', 'Insert groups: 4', '1', '2019-12-05 03:26:54');
INSERT INTO `ap_log_action` VALUES ('203', 'groups', 'Insert groups: 5', '1', '2019-12-05 03:27:01');
INSERT INTO `ap_log_action` VALUES ('204', 'groups', 'Update groups: 5', '1', '2019-12-05 03:27:11');
INSERT INTO `ap_log_action` VALUES ('205', 'groups', 'Update groups: 4', '1', '2019-12-05 03:27:12');
INSERT INTO `ap_log_action` VALUES ('206', 'users', 'Insert users: 0', '1', '2019-12-05 05:26:17');
INSERT INTO `ap_log_action` VALUES ('207', 'account', 'Update account: 6', '1', '2019-12-06 09:52:41');
INSERT INTO `ap_log_action` VALUES ('208', 'account', 'Insert account: 7', '1', '2019-12-06 10:08:26');
INSERT INTO `ap_log_action` VALUES ('209', 'account', 'Update account: 7', '1', '2019-12-06 10:08:42');
INSERT INTO `ap_log_action` VALUES ('210', 'account', 'Update account: 7', '1', '2019-12-06 10:08:54');
INSERT INTO `ap_log_action` VALUES ('211', 'users', 'Update users: 2', '1', '2019-12-06 02:38:58');
INSERT INTO `ap_log_action` VALUES ('212', 'groups', 'Update groups: 1', '1', '2019-12-06 02:49:50');
INSERT INTO `ap_log_action` VALUES ('213', 'system_menu', 'Update system_menu: 119', '1', '2019-12-06 02:51:39');
INSERT INTO `ap_log_action` VALUES ('214', 'banner', 'Sửa Banner có id là 1', '1', '2019-12-06 02:59:37');
INSERT INTO `ap_log_action` VALUES ('215', 'recruit', 'Thêm cửa hàng có id là 7', '1', '2019-12-06 03:00:23');
INSERT INTO `ap_log_action` VALUES ('216', 'recruit', 'Thêm cửa hàng có id là 9', '1', '2019-12-06 03:03:45');
INSERT INTO `ap_log_action` VALUES ('217', 'banner', 'Sửa Banner có id là 9', '1', '2019-12-06 03:04:32');
INSERT INTO `ap_log_action` VALUES ('218', 'banner', 'Sửa Banner có id là 9', '1', '2019-12-06 03:04:37');
INSERT INTO `ap_log_action` VALUES ('219', 'banner', 'Sửa Banner có id là 7', '1', '2019-12-06 03:04:43');
INSERT INTO `ap_log_action` VALUES ('220', 'banner', 'Sửa Banner có id là 1', '1', '2019-12-06 03:54:50');
INSERT INTO `ap_log_action` VALUES ('221', 'banner', 'Sửa Banner có id là 1', '1', '2019-12-06 04:12:07');
INSERT INTO `ap_log_action` VALUES ('222', 'banner', 'Sửa Banner có id là 9', '1', '2019-12-06 04:44:16');
INSERT INTO `ap_log_action` VALUES ('223', 'banner', 'Sửa Banner có id là 7', '1', '2019-12-06 04:44:26');
INSERT INTO `ap_log_action` VALUES ('224', 'banner', 'Sửa Banner có id là 1', '1', '2019-12-06 04:44:35');
INSERT INTO `ap_log_action` VALUES ('225', 'category', 'Update category: 8', '1', '2019-12-06 05:40:18');
INSERT INTO `ap_log_action` VALUES ('226', 'category', 'Update category: 7', '1', '2019-12-06 05:40:20');
INSERT INTO `ap_log_action` VALUES ('227', 'category', 'Update category: 6', '1', '2019-12-06 05:40:22');
INSERT INTO `ap_log_action` VALUES ('228', 'category', 'Insert category: 10', '1', '2019-12-06 05:41:27');
INSERT INTO `ap_log_action` VALUES ('229', 'question', 'Update question: 1', '1', '2019-12-06 05:46:50');
INSERT INTO `ap_log_action` VALUES ('230', 'post', 'Update post: 5', '1', '2019-12-09 09:32:54');
INSERT INTO `ap_log_action` VALUES ('231', 'post', 'Update post: 5', '1', '2019-12-09 09:36:48');
INSERT INTO `ap_log_action` VALUES ('232', 'post', 'Update post: 4', '1', '2019-12-09 09:38:20');
INSERT INTO `ap_log_action` VALUES ('233', 'category', 'Update category: 10', '1', '2019-12-09 10:18:36');
INSERT INTO `ap_log_action` VALUES ('234', 'category', 'Insert category: 11', '1', '2019-12-09 10:18:53');
INSERT INTO `ap_log_action` VALUES ('235', 'question', 'Update question: 1', '1', '2019-12-09 10:19:12');
INSERT INTO `ap_log_action` VALUES ('236', 'question', 'Insert question: 2', '1', '2019-12-09 10:19:19');
INSERT INTO `ap_log_action` VALUES ('237', 'question', 'Insert question: 3', '1', '2019-12-09 10:19:28');
INSERT INTO `ap_log_action` VALUES ('238', 'question', 'Update question: 2', '1', '2019-12-09 10:19:34');
INSERT INTO `ap_log_action` VALUES ('239', 'question', 'Insert question: 4', '1', '2019-12-09 10:20:40');
INSERT INTO `ap_log_action` VALUES ('240', 'question', 'Insert question: 5', '1', '2019-12-09 10:20:47');
INSERT INTO `ap_log_action` VALUES ('241', 'category', 'Insert category: 12', '1', '2019-12-09 11:45:49');
INSERT INTO `ap_log_action` VALUES ('242', 'category', 'Update category: 12', '1', '2019-12-09 11:47:59');
INSERT INTO `ap_log_action` VALUES ('243', 'category', 'Insert category: 13', '1', '2019-12-09 11:48:31');
INSERT INTO `ap_log_action` VALUES ('244', 'category', 'Update category: 13', '1', '2019-12-09 11:49:50');
INSERT INTO `ap_log_action` VALUES ('245', 'post', 'Update post: 5', '1', '2019-12-09 03:28:55');
INSERT INTO `ap_log_action` VALUES ('246', 'post', 'Update post: 2', '1', '2019-12-09 03:31:40');
INSERT INTO `ap_log_action` VALUES ('247', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('248', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('249', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('250', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('251', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('252', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('253', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('254', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('255', 'system_menu', 'Delete system_menu: 73', '1', '2020-02-13 03:13:54');
INSERT INTO `ap_log_action` VALUES ('256', 'system_menu', 'Delete system_menu: 95', '1', '2020-02-13 03:13:59');
INSERT INTO `ap_log_action` VALUES ('257', 'system_menu', 'Delete system_menu: 95', '1', '2020-02-13 03:13:59');
INSERT INTO `ap_log_action` VALUES ('258', 'system_menu', 'Delete system_menu: 119', '1', '2020-02-13 03:14:03');
INSERT INTO `ap_log_action` VALUES ('259', 'system_menu', 'Delete system_menu: 119', '1', '2020-02-13 03:14:03');
INSERT INTO `ap_log_action` VALUES ('260', 'system_menu', 'Delete system_menu: 119', '1', '2020-02-13 03:14:03');
INSERT INTO `ap_log_action` VALUES ('261', 'system_menu', 'Delete system_menu: 88', '1', '2020-02-13 03:14:06');
INSERT INTO `ap_log_action` VALUES ('262', 'system_menu', 'Delete system_menu: 92', '1', '2020-02-13 03:14:19');
INSERT INTO `ap_log_action` VALUES ('263', 'system_menu', 'Delete system_menu: 92', '1', '2020-02-13 03:14:19');
INSERT INTO `ap_log_action` VALUES ('264', 'system_menu', 'Delete system_menu: 92', '1', '2020-02-13 03:14:19');
INSERT INTO `ap_log_action` VALUES ('265', 'system_menu', 'Delete system_menu: 92', '1', '2020-02-13 03:14:19');
INSERT INTO `ap_log_action` VALUES ('266', 'system_menu', 'Update system_menu: 128', '1', '2020-02-13 03:43:21');
INSERT INTO `ap_log_action` VALUES ('267', 'system_menu', 'Update system_menu: 130', '1', '2020-02-13 03:43:51');
INSERT INTO `ap_log_action` VALUES ('268', 'category', 'Update category: 5', '1', '2020-02-13 03:53:41');
INSERT INTO `ap_log_action` VALUES ('269', 'category', 'Update category: 5', '1', '2020-02-13 03:53:59');
INSERT INTO `ap_log_action` VALUES ('270', 'category', 'Update category: 5', '1', '2020-02-13 03:54:07');
INSERT INTO `ap_log_action` VALUES ('271', 'post', 'Update post: 4', '1', '2020-02-13 03:59:40');
INSERT INTO `ap_log_action` VALUES ('272', 'post', 'Update post: 3', '1', '2020-02-13 03:59:44');
INSERT INTO `ap_log_action` VALUES ('273', 'category', 'Insert category: 14', '1', '2020-02-13 04:17:06');
INSERT INTO `ap_log_action` VALUES ('274', 'category', 'Update category: 12', '1', '2020-02-13 04:17:12');
INSERT INTO `ap_log_action` VALUES ('275', 'category', 'Update category: 13', '1', '2020-02-13 04:17:16');
INSERT INTO `ap_log_action` VALUES ('276', 'product', 'Insert product: 1', '1', '2020-02-13 05:12:30');
INSERT INTO `ap_log_action` VALUES ('277', 'product', 'Update product: 1', '1', '2020-02-13 05:12:49');
INSERT INTO `ap_log_action` VALUES ('278', 'category', 'Insert category: 15', '1', '2020-02-13 05:18:29');
INSERT INTO `ap_log_action` VALUES ('279', 'pro_service', 'Update pro_service: 1', '1', '2020-02-13 05:51:04');
INSERT INTO `ap_log_action` VALUES ('280', 'pro_service', 'Insert pro_service: 2', '1', '2020-02-13 05:51:22');
INSERT INTO `ap_log_action` VALUES ('281', 'pro_service', 'Update pro_service: 1', '1', '2020-02-13 05:51:34');
INSERT INTO `ap_log_action` VALUES ('282', 'category', 'Insert category: 16', '1', '2020-02-14 11:50:39');
INSERT INTO `ap_log_action` VALUES ('283', 'category', 'Insert category: 17', '1', '2020-02-14 11:50:50');
INSERT INTO `ap_log_action` VALUES ('284', 'project', 'Insert project: 0', '1', '2020-02-14 12:03:08');
INSERT INTO `ap_log_action` VALUES ('285', 'project', 'Update project: 1', '1', '2020-02-14 12:03:24');
INSERT INTO `ap_log_action` VALUES ('286', 'project', 'Update project: 1', '1', '2020-02-14 01:34:20');
INSERT INTO `ap_log_action` VALUES ('287', 'project', 'Insert project: 0', '1', '2020-02-14 01:34:51');
INSERT INTO `ap_log_action` VALUES ('288', 'category', 'Update category: 5', '1', '2020-02-14 02:01:25');
INSERT INTO `ap_log_action` VALUES ('289', 'category', 'Update category: 5', '1', '2020-02-14 02:02:32');
INSERT INTO `ap_log_action` VALUES ('290', 'category', 'Update category: 5', '1', '2020-02-14 02:07:49');
INSERT INTO `ap_log_action` VALUES ('291', 'pro_service', 'Update pro_service: 1', '1', '2020-02-14 02:12:30');
INSERT INTO `ap_log_action` VALUES ('292', 'pro_service', 'Update pro_service: 1', '1', '2020-02-14 02:12:57');
INSERT INTO `ap_log_action` VALUES ('293', 'pro_service', 'Update pro_service: 1', '1', '2020-02-14 02:17:16');
INSERT INTO `ap_log_action` VALUES ('294', 'pro_service', 'Update pro_service: 1', '1', '2020-02-14 02:17:24');
INSERT INTO `ap_log_action` VALUES ('295', 'page', 'Update page: 14', '1', '2020-02-14 02:22:56');
INSERT INTO `ap_log_action` VALUES ('296', 'pro_service', 'Update pro_service: 1', '1', '2020-02-14 02:28:44');
INSERT INTO `ap_log_action` VALUES ('297', 'project', 'Update project: 1', '1', '2020-02-14 02:32:27');
INSERT INTO `ap_log_action` VALUES ('298', 'project', 'Update project: 1', '1', '2020-02-14 02:34:42');
INSERT INTO `ap_log_action` VALUES ('299', 'project', 'Update project: 1', '1', '2020-02-14 02:37:52');
INSERT INTO `ap_log_action` VALUES ('300', 'property', 'Insert property: 0', '1', '2020-02-14 02:40:13');
INSERT INTO `ap_log_action` VALUES ('301', 'career', 'Insert career: 2', '1', '2020-02-14 02:48:37');
INSERT INTO `ap_log_action` VALUES ('302', 'career', 'Update career: 2', '1', '2020-02-14 02:49:54');
INSERT INTO `ap_log_action` VALUES ('303', 'category', 'Insert category: 18', '1', '2020-02-14 02:52:06');
INSERT INTO `ap_log_action` VALUES ('304', 'property', 'Insert property: 0', '1', '2020-02-14 02:54:29');
INSERT INTO `ap_log_action` VALUES ('305', 'property', 'Update property: 9', '1', '2020-02-14 02:55:32');
INSERT INTO `ap_log_action` VALUES ('306', 'property', 'Update property: 9', '1', '2020-02-14 02:57:47');
INSERT INTO `ap_log_action` VALUES ('307', 'post', 'Update post: 3', '1', '2020-02-14 03:04:28');
INSERT INTO `ap_log_action` VALUES ('308', 'post', 'Update post: 4', '1', '2020-02-14 03:04:34');
INSERT INTO `ap_log_action` VALUES ('309', 'page', 'Insert page: 0', '1', '2020-02-14 03:14:21');
INSERT INTO `ap_log_action` VALUES ('310', 'post', 'Thêm Banner có id là 1', '1', '2020-02-14 04:45:35');
INSERT INTO `ap_log_action` VALUES ('311', 'banner', 'Sửa Banner có id là 1', '1', '2020-02-14 05:24:55');
INSERT INTO `ap_log_action` VALUES ('312', 'groups', 'Insert groups: 3', '1', '2020-02-17 11:07:28');
INSERT INTO `ap_log_action` VALUES ('313', 'groups', 'Update groups: 3', '1', '2020-02-17 11:07:42');
INSERT INTO `ap_log_action` VALUES ('314', 'groups', 'Update groups: 3', '1', '2020-02-17 11:07:46');
INSERT INTO `ap_log_action` VALUES ('315', 'groups', 'Insert groups: 4', '1', '2020-02-17 02:02:02');
INSERT INTO `ap_log_action` VALUES ('316', 'property', 'Update property: 9', '1', '2020-02-17 02:03:09');
INSERT INTO `ap_log_action` VALUES ('317', 'property', 'Update property: 10', '1', '2020-02-17 02:03:09');
INSERT INTO `ap_log_action` VALUES ('318', 'groups', 'Insert groups: 5', '1', '2020-02-17 02:07:58');
INSERT INTO `ap_log_action` VALUES ('319', 'property', 'Insert property: 0', '1', '2020-02-17 02:08:20');
INSERT INTO `ap_log_action` VALUES ('320', 'groups', 'Insert groups: 6', '1', '2020-02-17 02:08:20');
INSERT INTO `ap_log_action` VALUES ('321', 'groups', 'Insert groups: 7', '1', '2020-02-17 02:08:58');
INSERT INTO `ap_log_action` VALUES ('322', 'groups', 'Insert groups: 8', '1', '2020-02-17 02:12:05');
INSERT INTO `ap_log_action` VALUES ('323', 'groups', 'Update groups: 8', '1', '2020-02-17 02:12:39');
INSERT INTO `ap_log_action` VALUES ('324', 'groups', 'Update groups: 4', '1', '2020-02-17 02:16:08');
INSERT INTO `ap_log_action` VALUES ('325', 'groups', 'Update groups: 4', '1', '2020-02-17 02:16:25');
INSERT INTO `ap_log_action` VALUES ('326', 'groups', 'Update groups: 4', '1', '2020-02-17 02:16:40');
INSERT INTO `ap_log_action` VALUES ('327', 'groups', 'Update groups: 4', '1', '2020-02-17 02:17:36');
INSERT INTO `ap_log_action` VALUES ('328', 'groups', 'Update groups: 4', '1', '2020-02-17 02:17:47');
INSERT INTO `ap_log_action` VALUES ('329', 'groups', 'Update groups: 4', '1', '2020-02-17 02:18:01');
INSERT INTO `ap_log_action` VALUES ('330', 'groups', 'Insert groups: 9', '1', '2020-02-17 02:19:46');
INSERT INTO `ap_log_action` VALUES ('331', 'groups', 'Update groups: 6', '1', '2020-02-17 02:19:53');
INSERT INTO `ap_log_action` VALUES ('332', 'groups', 'Insert groups: 10', '1', '2020-02-17 02:20:02');
INSERT INTO `ap_log_action` VALUES ('333', 'groups', 'Insert groups: 11', '1', '2020-02-17 02:20:17');
INSERT INTO `ap_log_action` VALUES ('334', 'groups', 'Insert groups: 12', '1', '2020-02-17 02:20:27');
INSERT INTO `ap_log_action` VALUES ('335', 'groups', 'Update groups: 6', '1', '2020-02-17 02:21:06');
INSERT INTO `ap_log_action` VALUES ('336', 'groups', 'Update groups: 12', '1', '2020-02-17 02:21:19');
INSERT INTO `ap_log_action` VALUES ('337', 'groups', 'Insert groups: 13', '1', '2020-02-17 02:25:58');
INSERT INTO `ap_log_action` VALUES ('338', 'groups', 'Update groups: 13', '1', '2020-02-17 02:26:28');
INSERT INTO `ap_log_action` VALUES ('339', 'groups', 'Update groups: 13', '1', '2020-02-17 02:26:45');
INSERT INTO `ap_log_action` VALUES ('340', 'groups', 'Update groups: 13', '1', '2020-02-17 02:27:00');
INSERT INTO `ap_log_action` VALUES ('341', 'groups', 'Update groups: 13', '1', '2020-02-17 02:27:10');
INSERT INTO `ap_log_action` VALUES ('342', 'groups', 'Update groups: 13', '1', '2020-02-17 02:27:26');
INSERT INTO `ap_log_action` VALUES ('343', 'groups', 'Update groups: 13', '1', '2020-02-17 02:27:39');
INSERT INTO `ap_log_action` VALUES ('344', 'groups', 'Update groups: 13', '1', '2020-02-17 02:27:48');
INSERT INTO `ap_log_action` VALUES ('345', 'groups', 'Update groups: 13', '1', '2020-02-17 02:28:22');
INSERT INTO `ap_log_action` VALUES ('346', 'groups', 'Update groups: 13', '1', '2020-02-17 02:30:17');
INSERT INTO `ap_log_action` VALUES ('347', 'groups', 'Update groups: 8', '1', '2020-02-17 02:31:20');
INSERT INTO `ap_log_action` VALUES ('348', 'groups', 'Update groups: 7', '1', '2020-02-17 02:31:20');
INSERT INTO `ap_log_action` VALUES ('349', 'groups', 'Insert groups: 14', '1', '2020-02-17 02:39:51');
INSERT INTO `ap_log_action` VALUES ('350', 'property', 'Update property: 11', '1', '2020-02-17 02:40:21');
INSERT INTO `ap_log_action` VALUES ('351', 'groups', 'Update groups: 14', '1', '2020-02-17 02:43:13');
INSERT INTO `ap_log_action` VALUES ('352', 'groups', 'Insert groups: 15', '1', '2020-02-17 02:45:14');
INSERT INTO `ap_log_action` VALUES ('353', 'groups', 'Insert groups: 16', '1', '2020-02-17 02:45:31');
INSERT INTO `ap_log_action` VALUES ('354', 'groups', 'Insert groups: 17', '1', '2020-02-17 02:45:52');
INSERT INTO `ap_log_action` VALUES ('355', 'groups', 'Insert groups: 18', '1', '2020-02-17 02:46:13');
INSERT INTO `ap_log_action` VALUES ('356', 'groups', 'Update groups: 16', '1', '2020-02-17 02:48:13');
INSERT INTO `ap_log_action` VALUES ('357', 'property', 'Update property: 11', '1', '2020-02-17 02:48:40');
INSERT INTO `ap_log_action` VALUES ('358', 'property', 'Insert property: 0', '1', '2020-02-17 02:49:09');
INSERT INTO `ap_log_action` VALUES ('359', 'property', 'Update property: 12', '1', '2020-02-17 03:03:50');
INSERT INTO `ap_log_action` VALUES ('360', 'property', 'Update property: 12', '1', '2020-02-17 03:04:15');
INSERT INTO `ap_log_action` VALUES ('361', 'property', 'Update property: 12', '1', '2020-02-17 03:05:01');
INSERT INTO `ap_log_action` VALUES ('362', 'property', 'Update property: 12', '1', '2020-02-17 03:05:34');
INSERT INTO `ap_log_action` VALUES ('363', 'property', 'Update property: 12', '1', '2020-02-17 03:05:45');
INSERT INTO `ap_log_action` VALUES ('364', 'groups', 'Update groups: 18', '1', '2020-02-17 03:18:30');
INSERT INTO `ap_log_action` VALUES ('365', 'groups', 'Update groups: 17', '1', '2020-02-17 03:18:30');
INSERT INTO `ap_log_action` VALUES ('366', 'groups', 'Update groups: 16', '1', '2020-02-17 03:18:30');
INSERT INTO `ap_log_action` VALUES ('367', 'groups', 'Update groups: 15', '1', '2020-02-17 03:18:40');
INSERT INTO `ap_log_action` VALUES ('368', 'groups', 'Update groups: 14', '1', '2020-02-17 03:18:40');
INSERT INTO `ap_log_action` VALUES ('369', 'groups', 'Update groups: 11', '1', '2020-02-17 03:18:41');
INSERT INTO `ap_log_action` VALUES ('370', 'groups', 'Update groups: 10', '1', '2020-02-17 03:18:41');
INSERT INTO `ap_log_action` VALUES ('371', 'groups', 'Update groups: 9', '1', '2020-02-17 03:18:41');
INSERT INTO `ap_log_action` VALUES ('372', 'groups', 'Update groups: 6', '1', '2020-02-17 03:18:41');
INSERT INTO `ap_log_action` VALUES ('373', 'groups', 'Update groups: 5', '1', '2020-02-17 03:18:53');
INSERT INTO `ap_log_action` VALUES ('374', 'groups', 'Update groups: 5', '1', '2020-02-17 03:22:45');
INSERT INTO `ap_log_action` VALUES ('375', 'groups', 'Update groups: 4', '1', '2020-02-17 03:23:54');
INSERT INTO `ap_log_action` VALUES ('376', 'users', 'Update users: 3', '1', '2020-02-17 03:45:42');
INSERT INTO `ap_log_action` VALUES ('377', 'users', 'Update users: 1', '1', '2020-02-17 03:52:14');
INSERT INTO `ap_log_action` VALUES ('378', 'users', 'Update users: 1', '1', '2020-02-17 03:52:44');
INSERT INTO `ap_log_action` VALUES ('379', 'users', 'Update users: 1', '1', '2020-02-17 03:52:57');
INSERT INTO `ap_log_action` VALUES ('380', 'users', 'Insert users: 0', '1', '2020-02-17 03:54:24');
INSERT INTO `ap_log_action` VALUES ('381', 'users', 'Insert users: 0', '1', '2020-02-17 03:55:41');
INSERT INTO `ap_log_action` VALUES ('382', 'users', 'delete users: 5', '1', '2020-02-17 03:56:02');
INSERT INTO `ap_log_action` VALUES ('383', 'category', 'Insert category: 19', '1', '2020-02-17 03:59:40');
INSERT INTO `ap_log_action` VALUES ('384', 'users', 'Insert users: 0', '1', '2020-02-17 04:00:43');
INSERT INTO `ap_log_action` VALUES ('385', 'users', 'Update users: 6', '1', '2020-02-17 04:01:07');
INSERT INTO `ap_log_action` VALUES ('386', 'category', 'Update category: 19', '1', '2020-02-17 04:02:25');
INSERT INTO `ap_log_action` VALUES ('387', 'category', 'Update category: 18', '1', '2020-02-17 04:03:32');
INSERT INTO `ap_log_action` VALUES ('388', 'users', 'Insert users: 0', '1', '2020-02-17 04:07:04');
INSERT INTO `ap_log_action` VALUES ('389', 'users', 'Insert users: 0', '1', '2020-02-17 04:07:58');
INSERT INTO `ap_log_action` VALUES ('390', 'users', 'Insert users: 0', '1', '2020-02-17 04:09:34');
INSERT INTO `ap_log_action` VALUES ('391', 'users', 'Insert users: 0', '1', '2020-02-17 04:10:13');
INSERT INTO `ap_log_action` VALUES ('392', 'users', 'Insert users: 0', '1', '2020-02-17 04:11:21');
INSERT INTO `ap_log_action` VALUES ('393', 'users', 'Insert users: 0', '1', '2020-02-17 04:11:56');
INSERT INTO `ap_log_action` VALUES ('394', 'users', 'delete users: 12', '1', '2020-02-17 04:12:36');
INSERT INTO `ap_log_action` VALUES ('395', 'users', 'delete users: 10', '1', '2020-02-17 04:12:46');
INSERT INTO `ap_log_action` VALUES ('396', 'users', 'delete users: 9', '1', '2020-02-17 04:12:46');
INSERT INTO `ap_log_action` VALUES ('397', 'users', 'Update users: 6', '1', '2020-02-17 04:25:34');
INSERT INTO `ap_log_action` VALUES ('398', 'users', 'Update users: 6', '1', '2020-02-17 04:25:42');
INSERT INTO `ap_log_action` VALUES ('399', 'users', 'Update users: 6', '1', '2020-02-17 04:26:09');
INSERT INTO `ap_log_action` VALUES ('400', 'users', 'Update users: 6', '1', '2020-02-17 04:26:15');
INSERT INTO `ap_log_action` VALUES ('401', 'users', 'Update users: 6', '1', '2020-02-17 04:26:22');
INSERT INTO `ap_log_action` VALUES ('402', 'users', 'Update users: 6', '1', '2020-02-17 04:27:54');
INSERT INTO `ap_log_action` VALUES ('403', 'users', 'Update users: 11', '1', '2020-02-17 04:30:07');
INSERT INTO `ap_log_action` VALUES ('404', 'users', 'Update users: 11', '1', '2020-02-17 04:30:20');
INSERT INTO `ap_log_action` VALUES ('405', 'users', 'Update users: 11', '1', '2020-02-17 04:30:32');
INSERT INTO `ap_log_action` VALUES ('406', 'users', 'Update users: 11', '1', '2020-02-17 04:30:50');
INSERT INTO `ap_log_action` VALUES ('407', 'users', 'Update users: 8', '1', '2020-02-17 04:31:06');
INSERT INTO `ap_log_action` VALUES ('408', 'users', 'Update users: 8', '1', '2020-02-17 04:31:31');
INSERT INTO `ap_log_action` VALUES ('409', 'users', 'delete users: 8', '1', '2020-02-17 04:31:46');
INSERT INTO `ap_log_action` VALUES ('410', 'users', 'delete users: 11', '1', '2020-02-17 04:31:48');
INSERT INTO `ap_log_action` VALUES ('411', 'users', 'Update users: 7', '1', '2020-02-17 04:36:57');
INSERT INTO `ap_log_action` VALUES ('412', 'users', 'delete users: 7', '1', '2020-02-17 04:46:32');
INSERT INTO `ap_log_action` VALUES ('413', 'users', 'delete users: 6', '1', '2020-02-17 04:46:32');
INSERT INTO `ap_log_action` VALUES ('414', 'users', 'delete users: 4', '1', '2020-02-17 04:46:32');
INSERT INTO `ap_log_action` VALUES ('415', 'career', 'Insert career: 5', '1', '2020-02-18 09:19:09');
INSERT INTO `ap_log_action` VALUES ('416', 'career', 'Update career: 4', '1', '2020-02-18 09:20:48');
INSERT INTO `ap_log_action` VALUES ('417', 'career', 'Update career: 3', '1', '2020-02-18 09:20:51');
INSERT INTO `ap_log_action` VALUES ('418', 'property', 'Insert property: 0', '1', '2020-02-18 09:23:24');
INSERT INTO `ap_log_action` VALUES ('419', 'property', 'Insert property: 0', '1', '2020-02-18 09:23:50');
INSERT INTO `ap_log_action` VALUES ('420', 'career', 'Update career: 5', '1', '2020-02-18 09:24:21');
INSERT INTO `ap_log_action` VALUES ('421', 'category', 'Insert category: 20', '1', '2020-02-18 09:28:40');
INSERT INTO `ap_log_action` VALUES ('422', 'category', 'Insert category: 21', '1', '2020-02-18 09:28:53');
INSERT INTO `ap_log_action` VALUES ('423', 'category', 'Update category: 6', '1', '2020-02-18 09:29:31');
INSERT INTO `ap_log_action` VALUES ('424', 'category', 'Update category: 9', '1', '2020-02-18 09:29:57');
INSERT INTO `ap_log_action` VALUES ('425', 'category', 'Update category: 9', '1', '2020-02-18 09:30:11');
INSERT INTO `ap_log_action` VALUES ('426', 'category', 'Update category: 9', '1', '2020-02-18 09:30:21');
INSERT INTO `ap_log_action` VALUES ('427', 'category', 'Insert category: 22', '1', '2020-02-18 09:33:00');
INSERT INTO `ap_log_action` VALUES ('428', 'category', 'Insert category: 23', '1', '2020-02-18 09:34:03');
INSERT INTO `ap_log_action` VALUES ('429', 'category', 'Insert category: 24', '1', '2020-02-18 09:36:29');
INSERT INTO `ap_log_action` VALUES ('430', 'category', 'Insert category: 25', '1', '2020-02-18 09:38:47');
INSERT INTO `ap_log_action` VALUES ('431', 'category', 'Update category: 25', '1', '2020-02-18 09:39:33');
INSERT INTO `ap_log_action` VALUES ('432', 'career', 'Update career: 2', '1', '2020-02-18 09:45:03');
INSERT INTO `ap_log_action` VALUES ('433', 'category', 'Insert category: 26', '1', '2020-02-18 09:48:37');
INSERT INTO `ap_log_action` VALUES ('434', 'category', 'Insert category: 27', '1', '2020-02-18 09:48:42');
INSERT INTO `ap_log_action` VALUES ('435', 'category', 'Insert category: 28', '1', '2020-02-18 09:49:10');
INSERT INTO `ap_log_action` VALUES ('436', 'category', 'Update category: 28', '1', '2020-02-18 09:56:57');
INSERT INTO `ap_log_action` VALUES ('437', 'post', 'Update post: 4', '1', '2020-02-18 10:01:46');
INSERT INTO `ap_log_action` VALUES ('438', 'category', 'Update category: 28', '1', '2020-02-18 10:02:35');
INSERT INTO `ap_log_action` VALUES ('439', 'category', 'Update category: 25', '1', '2020-02-18 10:02:41');
INSERT INTO `ap_log_action` VALUES ('440', 'category', 'Update category: 24', '1', '2020-02-18 10:02:41');
INSERT INTO `ap_log_action` VALUES ('441', 'category', 'Update category: 26', '1', '2020-02-18 10:03:10');
INSERT INTO `ap_log_action` VALUES ('442', 'category', 'Insert category: 29', '1', '2020-02-18 10:04:47');
INSERT INTO `ap_log_action` VALUES ('443', 'category', 'Update category: 29', '1', '2020-02-18 10:06:16');
INSERT INTO `ap_log_action` VALUES ('444', 'category', 'Insert category: 30', '1', '2020-02-18 10:17:21');
INSERT INTO `ap_log_action` VALUES ('445', 'category', 'Update category: 30', '1', '2020-02-18 10:21:12');
INSERT INTO `ap_log_action` VALUES ('446', 'category', 'Update category: 30', '1', '2020-02-18 10:22:45');
INSERT INTO `ap_log_action` VALUES ('447', 'category', 'Update category: 30', '1', '2020-02-18 10:26:58');
INSERT INTO `ap_log_action` VALUES ('448', 'post', 'Insert post: 5', '1', '2020-02-18 10:39:23');
INSERT INTO `ap_log_action` VALUES ('449', 'post', 'Update post: 5', '1', '2020-02-18 10:40:13');
INSERT INTO `ap_log_action` VALUES ('450', 'post', 'Insert post: 6', '1', '2020-02-18 10:41:11');
INSERT INTO `ap_log_action` VALUES ('451', 'post', 'Update post: 4', '1', '2020-02-18 10:50:45');
INSERT INTO `ap_log_action` VALUES ('452', 'post', 'Update post: 4', '1', '2020-02-18 10:50:59');
INSERT INTO `ap_log_action` VALUES ('453', 'post', 'Update post: 6', '1', '2020-02-18 10:59:34');
INSERT INTO `ap_log_action` VALUES ('454', 'post', 'Update post: 4', '1', '2020-02-18 10:59:34');
INSERT INTO `ap_log_action` VALUES ('455', 'post', 'Insert post: 7', '1', '2020-02-18 10:59:56');
INSERT INTO `ap_log_action` VALUES ('456', 'post', 'Insert post: 8', '1', '2020-02-18 11:00:23');
INSERT INTO `ap_log_action` VALUES ('457', 'post', 'Update post: 5', '1', '2020-02-18 11:19:59');
INSERT INTO `ap_log_action` VALUES ('458', 'post', 'Insert post: 9', '1', '2020-02-18 11:22:13');
INSERT INTO `ap_log_action` VALUES ('459', 'post', 'Update post: 9', '1', '2020-02-18 11:22:31');
INSERT INTO `ap_log_action` VALUES ('460', 'post', 'Update post: 9', '1', '2020-02-18 11:22:42');
INSERT INTO `ap_log_action` VALUES ('461', 'post', 'Update post: 9', '1', '2020-02-18 11:22:57');
INSERT INTO `ap_log_action` VALUES ('462', 'post', 'Update post: 9', '1', '2020-02-18 11:23:07');
INSERT INTO `ap_log_action` VALUES ('463', 'post', 'Update post: 9', '1', '2020-02-18 11:23:15');
INSERT INTO `ap_log_action` VALUES ('464', 'post', 'Update post: 9', '1', '2020-02-18 11:23:36');
INSERT INTO `ap_log_action` VALUES ('465', 'post', 'Update post: 9', '1', '2020-02-18 11:23:45');
INSERT INTO `ap_log_action` VALUES ('466', 'post', 'Update post: 9', '1', '2020-02-18 11:24:05');
INSERT INTO `ap_log_action` VALUES ('467', 'post', 'Update post: 9', '1', '2020-02-18 11:24:16');
INSERT INTO `ap_log_action` VALUES ('468', 'post', 'Insert post: 10', '1', '2020-02-18 11:24:51');
INSERT INTO `ap_log_action` VALUES ('469', 'post', 'Update post: 10', '1', '2020-02-18 11:26:17');
INSERT INTO `ap_log_action` VALUES ('470', 'post', 'Update post: 10', '1', '2020-02-18 11:26:37');
INSERT INTO `ap_log_action` VALUES ('471', 'post', 'Insert post: 11', '1', '2020-02-18 11:39:31');
INSERT INTO `ap_log_action` VALUES ('472', 'post', 'Update post: 11', '1', '2020-02-18 11:40:00');
INSERT INTO `ap_log_action` VALUES ('473', 'post', 'Update post: 11', '1', '2020-02-18 11:44:17');
INSERT INTO `ap_log_action` VALUES ('474', 'career', 'Insert career: 6', '1', '2020-02-18 11:50:51');
INSERT INTO `ap_log_action` VALUES ('475', 'post', 'Update post: 11', '1', '2020-02-18 01:44:04');
INSERT INTO `ap_log_action` VALUES ('476', 'post', 'Update post: 10', '1', '2020-02-18 01:44:16');
INSERT INTO `ap_log_action` VALUES ('477', 'post', 'Update post: 9', '1', '2020-02-18 01:44:17');
INSERT INTO `ap_log_action` VALUES ('478', 'post', 'Update post: 8', '1', '2020-02-18 01:44:17');
INSERT INTO `ap_log_action` VALUES ('479', 'post', 'Update post: 5', '1', '2020-02-18 01:44:17');
INSERT INTO `ap_log_action` VALUES ('480', 'page', 'Update page: 13', '1', '2020-02-18 01:45:12');
INSERT INTO `ap_log_action` VALUES ('481', 'page', 'Update page: 13', '1', '2020-02-18 01:45:29');
INSERT INTO `ap_log_action` VALUES ('482', 'page', 'Insert page: 0', '1', '2020-02-18 01:46:10');
INSERT INTO `ap_log_action` VALUES ('483', 'page', 'Update page: 9', '1', '2020-02-18 01:46:55');
INSERT INTO `ap_log_action` VALUES ('484', 'page', 'Update page: 9', '1', '2020-02-18 01:47:07');
INSERT INTO `ap_log_action` VALUES ('485', 'page', 'Update page: 16', '1', '2020-02-18 02:03:40');
INSERT INTO `ap_log_action` VALUES ('486', 'page', 'Insert page: 0', '1', '2020-02-18 02:17:56');
INSERT INTO `ap_log_action` VALUES ('487', 'page', 'Insert page: 0', '1', '2020-02-18 02:18:52');
INSERT INTO `ap_log_action` VALUES ('488', 'page', 'Update page: 17', '1', '2020-02-18 02:21:42');
INSERT INTO `ap_log_action` VALUES ('489', 'page', 'Update page: 16', '1', '2020-02-18 02:23:38');
INSERT INTO `ap_log_action` VALUES ('490', 'page', 'Update page: 18', '1', '2020-02-18 02:23:50');
INSERT INTO `ap_log_action` VALUES ('491', 'page', 'Insert page: 0', '1', '2020-02-18 02:24:34');
INSERT INTO `ap_log_action` VALUES ('492', 'page', 'Insert page: 0', '1', '2020-02-18 02:28:31');
INSERT INTO `ap_log_action` VALUES ('493', 'page', 'Update page: 20', '1', '2020-02-18 02:31:09');
INSERT INTO `ap_log_action` VALUES ('494', 'page', 'Update page: 20', '1', '2020-02-18 02:33:51');
INSERT INTO `ap_log_action` VALUES ('495', 'page', 'Update page: 19', '1', '2020-02-18 02:37:11');
INSERT INTO `ap_log_action` VALUES ('496', 'page', 'Update page: 19', '1', '2020-02-18 02:37:22');
INSERT INTO `ap_log_action` VALUES ('497', 'page', 'Update page: 19', '1', '2020-02-18 02:37:32');
INSERT INTO `ap_log_action` VALUES ('498', 'page', 'Update page: 19', '1', '2020-02-18 02:37:38');
INSERT INTO `ap_log_action` VALUES ('499', 'page', 'Update page: 19', '1', '2020-02-18 02:37:42');
INSERT INTO `ap_log_action` VALUES ('500', 'page', 'Update page: 17', '1', '2020-02-18 02:37:44');
INSERT INTO `ap_log_action` VALUES ('501', 'contact', 'Update contact: 3', '1', '2020-02-18 03:07:15');
INSERT INTO `ap_log_action` VALUES ('502', 'contact', 'Update contact: 5', '1', '2020-02-18 03:07:19');
INSERT INTO `ap_log_action` VALUES ('503', 'contact', 'Update contact: 6', '1', '2020-02-18 03:22:10');
INSERT INTO `ap_log_action` VALUES ('504', 'category', 'Update category: 29', '1', '2020-02-18 03:32:12');
INSERT INTO `ap_log_action` VALUES ('505', 'category', 'Update category: 6', '1', '2020-02-18 03:52:10');
INSERT INTO `ap_log_action` VALUES ('506', 'post', 'Thêm Banner có id là 2', '1', '2020-02-18 03:56:18');
INSERT INTO `ap_log_action` VALUES ('507', 'category', 'Insert category: 31', '1', '2020-02-18 04:13:04');
INSERT INTO `ap_log_action` VALUES ('508', 'category', 'Update category: 31', '1', '2020-02-18 04:15:39');
INSERT INTO `ap_log_action` VALUES ('509', 'category', 'Insert category: 32', '1', '2020-02-18 04:16:02');
INSERT INTO `ap_log_action` VALUES ('510', 'category', 'Update category: 32', '1', '2020-02-18 04:19:54');
INSERT INTO `ap_log_action` VALUES ('511', 'category', 'Insert category: 33', '1', '2020-02-18 04:20:09');
INSERT INTO `ap_log_action` VALUES ('512', 'category', 'Update category: 33', '1', '2020-02-18 04:21:04');
INSERT INTO `ap_log_action` VALUES ('513', 'category', 'Update category: 27', '1', '2020-02-18 04:40:42');
INSERT INTO `ap_log_action` VALUES ('514', 'question', 'Insert question: 6', '1', '2020-02-18 05:23:39');
INSERT INTO `ap_log_action` VALUES ('515', 'newsletter', 'Update newsletter: 19', '1', '2020-02-18 05:47:00');
INSERT INTO `ap_log_action` VALUES ('516', 'newsletter', 'Update newsletter: 18', '1', '2020-02-18 05:47:00');
INSERT INTO `ap_log_action` VALUES ('517', 'newsletter', 'Update newsletter: 17', '1', '2020-02-18 05:47:03');
INSERT INTO `ap_log_action` VALUES ('518', 'category', 'Update category: 3', '1', '2020-02-19 09:35:11');
INSERT INTO `ap_log_action` VALUES ('519', 'category', 'Insert category: 34', '1', '2020-02-19 09:35:50');
INSERT INTO `ap_log_action` VALUES ('520', 'category', 'Insert category: 35', '1', '2020-02-19 09:35:59');
INSERT INTO `ap_log_action` VALUES ('521', 'category', 'Insert category: 36', '1', '2020-02-19 09:36:10');
INSERT INTO `ap_log_action` VALUES ('522', 'category', 'Insert category: 37', '1', '2020-02-19 09:36:29');
INSERT INTO `ap_log_action` VALUES ('523', 'category', 'Insert category: 38', '1', '2020-02-19 09:40:40');
INSERT INTO `ap_log_action` VALUES ('524', 'category', 'Update category: 37', '1', '2020-02-19 09:42:15');
INSERT INTO `ap_log_action` VALUES ('525', 'category', 'Update category: 37', '1', '2020-02-19 09:42:41');
INSERT INTO `ap_log_action` VALUES ('526', 'category', 'Update category: 36', '1', '2020-02-19 09:50:53');
INSERT INTO `ap_log_action` VALUES ('527', 'category', 'Insert category: 39', '1', '2020-02-19 09:54:48');
INSERT INTO `ap_log_action` VALUES ('528', 'category', 'Insert category: 40', '1', '2020-02-19 09:54:56');
INSERT INTO `ap_log_action` VALUES ('529', 'category', 'Insert category: 41', '1', '2020-02-19 09:55:14');
INSERT INTO `ap_log_action` VALUES ('530', 'category', 'Update category: 38', '1', '2020-02-19 09:56:49');
INSERT INTO `ap_log_action` VALUES ('531', 'category', 'Update category: 39', '1', '2020-02-19 09:57:45');
INSERT INTO `ap_log_action` VALUES ('532', 'category', 'Update category: 38', '1', '2020-02-19 09:57:51');
INSERT INTO `ap_log_action` VALUES ('533', 'category', 'Insert category: 42', '1', '2020-02-19 09:58:07');
INSERT INTO `ap_log_action` VALUES ('534', 'category', 'Update category: 42', '1', '2020-02-19 09:58:17');
INSERT INTO `ap_log_action` VALUES ('535', 'pro_service', 'Insert pro_service: 3', '1', '2020-02-19 09:58:49');
INSERT INTO `ap_log_action` VALUES ('536', 'category', 'Update category: 41', '1', '2020-02-19 09:58:55');
INSERT INTO `ap_log_action` VALUES ('537', 'category', 'Update category: 40', '1', '2020-02-19 09:59:29');
INSERT INTO `ap_log_action` VALUES ('538', 'pro_service', 'Update pro_service: 3', '1', '2020-02-19 10:17:12');
INSERT INTO `ap_log_action` VALUES ('539', 'category', 'Update category: 34', '1', '2020-02-19 10:17:22');
INSERT INTO `ap_log_action` VALUES ('540', 'pro_service', 'Update pro_service: 3', '1', '2020-02-19 10:17:34');
INSERT INTO `ap_log_action` VALUES ('541', 'category', 'Update category: 35', '1', '2020-02-19 10:17:43');
INSERT INTO `ap_log_action` VALUES ('542', 'category', 'Insert category: 43', '1', '2020-02-19 10:20:57');
INSERT INTO `ap_log_action` VALUES ('543', 'category', 'Update category: 43', '1', '2020-02-19 10:21:12');
INSERT INTO `ap_log_action` VALUES ('544', 'category', 'Insert category: 44', '1', '2020-02-19 10:35:54');
INSERT INTO `ap_log_action` VALUES ('545', 'category', 'Insert category: 45', '1', '2020-02-19 10:39:00');
INSERT INTO `ap_log_action` VALUES ('546', 'category', 'Insert category: 46', '1', '2020-02-19 10:43:05');
INSERT INTO `ap_log_action` VALUES ('547', 'category', 'Update category: 46', '1', '2020-02-19 10:47:26');
INSERT INTO `ap_log_action` VALUES ('548', 'category', 'Update category: 46', '1', '2020-02-19 10:53:38');
INSERT INTO `ap_log_action` VALUES ('549', 'category', 'Update category: 46', '1', '2020-02-19 10:54:25');
INSERT INTO `ap_log_action` VALUES ('550', 'category', 'Update category: 45', '1', '2020-02-19 10:54:48');
INSERT INTO `ap_log_action` VALUES ('551', 'category', 'Update category: 40', '1', '2020-02-19 10:54:53');
INSERT INTO `ap_log_action` VALUES ('552', 'pro_service', 'Update pro_service: 2', '1', '2020-02-19 10:56:11');
INSERT INTO `ap_log_action` VALUES ('553', 'system_menu', 'Insert system_menu: 136', '1', '2020-02-19 10:56:18');
INSERT INTO `ap_log_action` VALUES ('554', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 10:57:08');
INSERT INTO `ap_log_action` VALUES ('555', 'pro_service', 'Update pro_service: 1', '1', '2020-02-19 11:00:26');
INSERT INTO `ap_log_action` VALUES ('556', 'pro_service', 'Update pro_service: 3', '1', '2020-02-19 11:00:35');
INSERT INTO `ap_log_action` VALUES ('557', 'category', 'Update category: 36', '1', '2020-02-19 11:00:56');
INSERT INTO `ap_log_action` VALUES ('558', 'pro_service', 'Insert pro_service: 4', '1', '2020-02-19 11:09:28');
INSERT INTO `ap_log_action` VALUES ('559', 'pro_service', 'Update pro_service: 4', '1', '2020-02-19 11:10:26');
INSERT INTO `ap_log_action` VALUES ('560', 'pro_service', 'Update pro_service: 4', '1', '2020-02-19 11:10:59');
INSERT INTO `ap_log_action` VALUES ('561', 'pro_service', 'Update pro_service: 4', '1', '2020-02-19 11:11:27');
INSERT INTO `ap_log_action` VALUES ('562', 'pro_service', 'Insert pro_service: 5', '1', '2020-02-19 11:20:47');
INSERT INTO `ap_log_action` VALUES ('563', 'pro_service', 'Update pro_service: 2', '1', '2020-02-19 11:21:34');
INSERT INTO `ap_log_action` VALUES ('564', 'pro_service', 'Insert pro_service: 6', '1', '2020-02-19 11:22:14');
INSERT INTO `ap_log_action` VALUES ('565', 'pro_service', 'Update pro_service: 6', '1', '2020-02-19 11:25:02');
INSERT INTO `ap_log_action` VALUES ('566', 'post', 'Thêm Banner có id là 3', '1', '2020-02-19 11:36:24');
INSERT INTO `ap_log_action` VALUES ('567', 'pro_service', 'Insert pro_service: 7', '1', '2020-02-19 11:36:32');
INSERT INTO `ap_log_action` VALUES ('568', 'pro_service', 'Update pro_service: 4', '1', '2020-02-19 11:37:00');
INSERT INTO `ap_log_action` VALUES ('569', 'pro_service', 'Update pro_service: 1', '1', '2020-02-19 11:37:16');
INSERT INTO `ap_log_action` VALUES ('570', 'pro_service', 'Update pro_service: 1', '1', '2020-02-19 11:37:36');
INSERT INTO `ap_log_action` VALUES ('571', 'pro_service', 'Update pro_service: 5', '1', '2020-02-19 11:38:36');
INSERT INTO `ap_log_action` VALUES ('572', 'pro_service', 'Insert pro_service: 8', '1', '2020-02-19 11:46:17');
INSERT INTO `ap_log_action` VALUES ('573', 'pro_service', 'Update pro_service: 2', '1', '2020-02-19 01:41:01');
INSERT INTO `ap_log_action` VALUES ('574', 'pro_service', 'Update pro_service: 8', '1', '2020-02-19 01:41:08');
INSERT INTO `ap_log_action` VALUES ('575', 'pro_service', 'Insert pro_service: 9', '1', '2020-02-19 01:41:30');
INSERT INTO `ap_log_action` VALUES ('576', 'pro_service', 'Insert pro_service: 10', '1', '2020-02-19 01:44:02');
INSERT INTO `ap_log_action` VALUES ('577', 'pro_service', 'Update pro_service: 9', '1', '2020-02-19 01:44:14');
INSERT INTO `ap_log_action` VALUES ('578', 'pro_service', 'Update pro_service: 10', '1', '2020-02-19 01:45:52');
INSERT INTO `ap_log_action` VALUES ('579', 'pro_service', 'Insert pro_service: 11', '1', '2020-02-19 01:46:37');
INSERT INTO `ap_log_action` VALUES ('580', 'recruit', 'Thêm cửa hàng có id là 10', '1', '2020-02-19 01:46:37');
INSERT INTO `ap_log_action` VALUES ('581', 'banner', 'Sửa Banner có id là 10', '1', '2020-02-19 01:46:52');
INSERT INTO `ap_log_action` VALUES ('582', 'recruit', 'Thêm cửa hàng có id là 11', '1', '2020-02-19 01:47:28');
INSERT INTO `ap_log_action` VALUES ('583', 'pro_service', 'Insert pro_service: 12', '1', '2020-02-19 01:48:11');
INSERT INTO `ap_log_action` VALUES ('584', 'pro_service', 'Update pro_service: 12', '1', '2020-02-19 01:48:42');
INSERT INTO `ap_log_action` VALUES ('585', 'pro_service', 'Update pro_service: 12', '1', '2020-02-19 01:49:05');
INSERT INTO `ap_log_action` VALUES ('586', 'pro_service', 'Update pro_service: 12', '1', '2020-02-19 01:49:36');
INSERT INTO `ap_log_action` VALUES ('587', 'pro_service', 'Update pro_service: 12', '1', '2020-02-19 01:50:58');
INSERT INTO `ap_log_action` VALUES ('588', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 01:57:00');
INSERT INTO `ap_log_action` VALUES ('589', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:04:04');
INSERT INTO `ap_log_action` VALUES ('590', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:06:07');
INSERT INTO `ap_log_action` VALUES ('591', 'historydv', 'Update historydv: 4', '1', '2020-02-19 02:06:16');
INSERT INTO `ap_log_action` VALUES ('592', 'historydv', 'Update historydv: 1', '1', '2020-02-19 02:09:51');
INSERT INTO `ap_log_action` VALUES ('593', 'historydv', 'Update historydv: 1', '1', '2020-02-19 02:10:11');
INSERT INTO `ap_log_action` VALUES ('594', 'historydv', 'Update historydv: 1', '1', '2020-02-19 02:10:33');
INSERT INTO `ap_log_action` VALUES ('595', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:10:49');
INSERT INTO `ap_log_action` VALUES ('596', 'historydv', 'Update historydv: 1', '1', '2020-02-19 02:11:05');
INSERT INTO `ap_log_action` VALUES ('597', 'historydv', 'Update historydv: 1', '1', '2020-02-19 02:11:16');
INSERT INTO `ap_log_action` VALUES ('598', 'historydv', 'Update historydv: 5', '1', '2020-02-19 02:11:32');
INSERT INTO `ap_log_action` VALUES ('599', 'historydv', 'Update historydv: 2', '1', '2020-02-19 02:11:37');
INSERT INTO `ap_log_action` VALUES ('600', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:12:58');
INSERT INTO `ap_log_action` VALUES ('601', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:13:14');
INSERT INTO `ap_log_action` VALUES ('602', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:13:36');
INSERT INTO `ap_log_action` VALUES ('603', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:15:21');
INSERT INTO `ap_log_action` VALUES ('604', 'historydv', 'Update historydv: 7', '1', '2020-02-19 02:17:15');
INSERT INTO `ap_log_action` VALUES ('605', 'historydv', 'Update historydv: 1', '1', '2020-02-19 02:18:05');
INSERT INTO `ap_log_action` VALUES ('606', 'historydv', 'Update historydv: 1', '1', '2020-02-19 02:18:19');
INSERT INTO `ap_log_action` VALUES ('607', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:18:51');
INSERT INTO `ap_log_action` VALUES ('608', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:19:04');
INSERT INTO `ap_log_action` VALUES ('609', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:20:32');
INSERT INTO `ap_log_action` VALUES ('610', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:20:41');
INSERT INTO `ap_log_action` VALUES ('611', 'historydv', 'Update historydv: 4', '1', '2020-02-19 02:21:08');
INSERT INTO `ap_log_action` VALUES ('612', 'historydv', 'Update historydv: 13', '1', '2020-02-19 02:26:32');
INSERT INTO `ap_log_action` VALUES ('613', 'historydv', 'Update historydv: 9', '1', '2020-02-19 02:28:28');
INSERT INTO `ap_log_action` VALUES ('614', 'historydv', 'Update historydv: 13', '1', '2020-02-19 02:28:37');
INSERT INTO `ap_log_action` VALUES ('615', 'contact', 'Update contact: 10', '1', '2020-02-19 02:29:05');
INSERT INTO `ap_log_action` VALUES ('616', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:37:48');
INSERT INTO `ap_log_action` VALUES ('617', 'historydv', 'Update historydv: 14', '1', '2020-02-19 02:37:58');
INSERT INTO `ap_log_action` VALUES ('618', 'historydv', 'Update historydv: 14', '1', '2020-02-19 02:38:28');
INSERT INTO `ap_log_action` VALUES ('619', 'historydv', 'Update historydv: 14', '1', '2020-02-19 02:39:53');
INSERT INTO `ap_log_action` VALUES ('620', 'historydv', 'Update historydv: 8', '1', '2020-02-19 02:39:56');
INSERT INTO `ap_log_action` VALUES ('621', 'historydv', 'Update historydv: 7', '1', '2020-02-19 02:39:59');
INSERT INTO `ap_log_action` VALUES ('622', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:42:51');
INSERT INTO `ap_log_action` VALUES ('623', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:43:24');
INSERT INTO `ap_log_action` VALUES ('624', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:43:55');
INSERT INTO `ap_log_action` VALUES ('625', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:44:15');
INSERT INTO `ap_log_action` VALUES ('626', 'historydv', 'Insert historydv: 0', '1', '2020-02-19 02:45:32');
INSERT INTO `ap_log_action` VALUES ('627', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:48:27');
INSERT INTO `ap_log_action` VALUES ('628', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:49:02');
INSERT INTO `ap_log_action` VALUES ('629', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:49:24');
INSERT INTO `ap_log_action` VALUES ('630', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:49:51');
INSERT INTO `ap_log_action` VALUES ('631', 'historydv', 'Update historydv: 15', '1', '2020-02-19 02:49:59');
INSERT INTO `ap_log_action` VALUES ('632', 'category', 'Insert category: 47', '1', '2020-02-19 03:19:56');
INSERT INTO `ap_log_action` VALUES ('633', 'category', 'Insert category: 48', '1', '2020-02-19 03:24:09');
INSERT INTO `ap_log_action` VALUES ('634', 'system_menu', 'Insert system_menu: 137', '1', '2020-02-19 03:36:46');
INSERT INTO `ap_log_action` VALUES ('635', 'category', 'Insert category: 49', '1', '2020-02-19 03:45:37');
INSERT INTO `ap_log_action` VALUES ('636', 'category', 'Insert category: 50', '1', '2020-02-19 03:50:12');
INSERT INTO `ap_log_action` VALUES ('637', 'category', 'Insert category: 51', '1', '2020-02-19 03:50:27');
INSERT INTO `ap_log_action` VALUES ('638', 'category', 'Insert category: 52', '1', '2020-02-19 03:50:34');
INSERT INTO `ap_log_action` VALUES ('639', 'category', 'Insert category: 53', '1', '2020-02-19 03:50:42');
INSERT INTO `ap_log_action` VALUES ('640', 'category', 'Insert category: 54', '1', '2020-02-19 03:50:49');
INSERT INTO `ap_log_action` VALUES ('641', 'category', 'Insert category: 55', '1', '2020-02-19 03:51:06');
INSERT INTO `ap_log_action` VALUES ('642', 'category', 'Insert category: 56', '1', '2020-02-19 04:12:50');
INSERT INTO `ap_log_action` VALUES ('643', 'category', 'Update category: 56', '1', '2020-02-19 04:17:06');
INSERT INTO `ap_log_action` VALUES ('644', 'category', 'Insert category: 57', '1', '2020-02-19 04:27:22');
INSERT INTO `ap_log_action` VALUES ('645', 'category', 'Update category: 57', '1', '2020-02-19 04:28:18');
INSERT INTO `ap_log_action` VALUES ('646', 'category', 'Update category: 56', '1', '2020-02-19 04:29:54');
INSERT INTO `ap_log_action` VALUES ('647', 'system_menu', 'Insert system_menu: 138', '1', '2020-02-19 04:55:53');
INSERT INTO `ap_log_action` VALUES ('648', 'category', 'Insert category: 58', '1', '2020-02-19 05:04:09');
INSERT INTO `ap_log_action` VALUES ('649', 'category', 'Update category: 58', '1', '2020-02-19 05:28:45');
INSERT INTO `ap_log_action` VALUES ('650', 'working_field', 'Insert working_field: 0', '1', '2020-02-19 05:36:45');
INSERT INTO `ap_log_action` VALUES ('651', 'working_field', 'Insert working_field: 0', '1', '2020-02-19 05:37:28');
INSERT INTO `ap_log_action` VALUES ('652', 'working_field', 'Insert working_field: 0', '1', '2020-02-19 05:37:41');
INSERT INTO `ap_log_action` VALUES ('653', 'project', 'Insert project: 13', '1', '2020-02-20 08:54:48');
INSERT INTO `ap_log_action` VALUES ('654', 'project', 'Update project: 13', '1', '2020-02-20 08:54:59');
INSERT INTO `ap_log_action` VALUES ('655', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 08:55:29');
INSERT INTO `ap_log_action` VALUES ('656', 'project', 'Update project: 13', '1', '2020-02-20 09:02:02');
INSERT INTO `ap_log_action` VALUES ('657', 'project', 'Update project: 13', '1', '2020-02-20 09:02:15');
INSERT INTO `ap_log_action` VALUES ('658', 'category', 'Insert category: 59', '1', '2020-02-20 09:04:44');
INSERT INTO `ap_log_action` VALUES ('659', 'category', 'Insert category: 60', '1', '2020-02-20 09:05:58');
INSERT INTO `ap_log_action` VALUES ('660', 'document', 'Insert document: 10', '1', '2020-02-20 09:08:34');
INSERT INTO `ap_log_action` VALUES ('661', 'document', 'Insert document: 11', '1', '2020-02-20 09:09:38');
INSERT INTO `ap_log_action` VALUES ('662', 'document', 'Insert document: 12', '1', '2020-02-20 09:10:51');
INSERT INTO `ap_log_action` VALUES ('663', 'document', 'Update document: 12', '1', '2020-02-20 09:11:19');
INSERT INTO `ap_log_action` VALUES ('664', 'document', 'Update document: 11', '1', '2020-02-20 09:11:19');
INSERT INTO `ap_log_action` VALUES ('665', 'document', 'Update document: 10', '1', '2020-02-20 09:11:32');
INSERT INTO `ap_log_action` VALUES ('666', 'document', 'Insert document: 13', '1', '2020-02-20 09:12:15');
INSERT INTO `ap_log_action` VALUES ('667', 'system_menu', 'Update system_menu: 129', '1', '2020-02-20 09:17:07');
INSERT INTO `ap_log_action` VALUES ('668', 'pro_service', 'Update pro_service: 12', '1', '2020-02-20 09:17:36');
INSERT INTO `ap_log_action` VALUES ('669', 'category', 'Insert category: 61', '1', '2020-02-20 09:21:32');
INSERT INTO `ap_log_action` VALUES ('670', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:21:54');
INSERT INTO `ap_log_action` VALUES ('671', 'pro_service', 'Insert pro_service: 1', '1', '2020-02-20 09:21:56');
INSERT INTO `ap_log_action` VALUES ('672', 'working_field', 'Update working_field: 4', '1', '2020-02-20 09:22:31');
INSERT INTO `ap_log_action` VALUES ('673', 'working_field', 'Update working_field: 4', '1', '2020-02-20 09:22:48');
INSERT INTO `ap_log_action` VALUES ('674', 'working_field', 'Update working_field: 4', '1', '2020-02-20 09:28:10');
INSERT INTO `ap_log_action` VALUES ('675', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:28:18');
INSERT INTO `ap_log_action` VALUES ('676', 'working_field', 'Update working_field: 5', '1', '2020-02-20 09:28:22');
INSERT INTO `ap_log_action` VALUES ('677', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:28:41');
INSERT INTO `ap_log_action` VALUES ('678', 'working_field', 'Update working_field: 6', '1', '2020-02-20 09:28:44');
INSERT INTO `ap_log_action` VALUES ('679', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:31:14');
INSERT INTO `ap_log_action` VALUES ('680', 'working_field', 'Update working_field: 7', '1', '2020-02-20 09:33:01');
INSERT INTO `ap_log_action` VALUES ('681', 'working_field', 'Update working_field: 7', '1', '2020-02-20 09:33:55');
INSERT INTO `ap_log_action` VALUES ('682', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:34:57');
INSERT INTO `ap_log_action` VALUES ('683', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:38:49');
INSERT INTO `ap_log_action` VALUES ('684', 'working_field', 'Update working_field: 9', '1', '2020-02-20 09:39:00');
INSERT INTO `ap_log_action` VALUES ('685', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:43:17');
INSERT INTO `ap_log_action` VALUES ('686', 'working_field', 'Update working_field: 10', '1', '2020-02-20 09:43:48');
INSERT INTO `ap_log_action` VALUES ('687', 'working_field', 'Update working_field: 10', '1', '2020-02-20 09:44:15');
INSERT INTO `ap_log_action` VALUES ('688', 'working_field', 'Update working_field: 10', '1', '2020-02-20 09:44:38');
INSERT INTO `ap_log_action` VALUES ('689', 'working_field', 'Update working_field: 10', '1', '2020-02-20 09:53:10');
INSERT INTO `ap_log_action` VALUES ('690', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:53:37');
INSERT INTO `ap_log_action` VALUES ('691', 'category', 'Update category: 59', '1', '2020-02-20 09:53:44');
INSERT INTO `ap_log_action` VALUES ('692', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:53:45');
INSERT INTO `ap_log_action` VALUES ('693', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:54:02');
INSERT INTO `ap_log_action` VALUES ('694', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:54:08');
INSERT INTO `ap_log_action` VALUES ('695', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 09:54:16');
INSERT INTO `ap_log_action` VALUES ('696', 'category', 'Insert category: 62', '1', '2020-02-20 09:54:59');
INSERT INTO `ap_log_action` VALUES ('697', 'working_field', 'Update working_field: 7', '1', '2020-02-20 09:55:26');
INSERT INTO `ap_log_action` VALUES ('698', 'working_field', 'Update working_field: 8', '1', '2020-02-20 09:55:27');
INSERT INTO `ap_log_action` VALUES ('699', 'category', 'Insert category: 63', '1', '2020-02-20 09:55:40');
INSERT INTO `ap_log_action` VALUES ('700', 'working_field', 'Update working_field: 9', '1', '2020-02-20 09:55:52');
INSERT INTO `ap_log_action` VALUES ('701', 'working_field', 'Update working_field: 15', '1', '2020-02-20 09:55:57');
INSERT INTO `ap_log_action` VALUES ('702', 'category', 'Update category: 63', '1', '2020-02-20 09:56:15');
INSERT INTO `ap_log_action` VALUES ('703', 'working_field', 'Update working_field: 1', '1', '2020-02-20 09:57:11');
INSERT INTO `ap_log_action` VALUES ('704', 'project', 'Insert project: 14', '1', '2020-02-20 09:58:01');
INSERT INTO `ap_log_action` VALUES ('705', 'category', 'Insert category: 64', '1', '2020-02-20 10:02:06');
INSERT INTO `ap_log_action` VALUES ('706', 'pro_service', 'Insert pro_service: 2', '1', '2020-02-20 10:02:29');
INSERT INTO `ap_log_action` VALUES ('707', 'category', 'Update category: 58', '1', '2020-02-20 10:09:26');
INSERT INTO `ap_log_action` VALUES ('708', 'category', 'Update category: 56', '1', '2020-02-20 10:09:26');
INSERT INTO `ap_log_action` VALUES ('709', 'category', 'Update category: 57', '1', '2020-02-20 10:09:26');
INSERT INTO `ap_log_action` VALUES ('710', 'category', 'Update category: 54', '1', '2020-02-20 10:09:27');
INSERT INTO `ap_log_action` VALUES ('711', 'category', 'Update category: 53', '1', '2020-02-20 10:09:27');
INSERT INTO `ap_log_action` VALUES ('712', 'category', 'Update category: 51', '1', '2020-02-20 10:09:27');
INSERT INTO `ap_log_action` VALUES ('713', 'category', 'Update category: 49', '1', '2020-02-20 10:09:27');
INSERT INTO `ap_log_action` VALUES ('714', 'category', 'Update category: 50', '1', '2020-02-20 10:09:51');
INSERT INTO `ap_log_action` VALUES ('715', 'project', 'Update project: 13', '1', '2020-02-20 10:10:24');
INSERT INTO `ap_log_action` VALUES ('716', 'category', 'Update category: 55', '1', '2020-02-20 10:10:29');
INSERT INTO `ap_log_action` VALUES ('717', 'project', 'Insert project: 15', '1', '2020-02-20 10:11:42');
INSERT INTO `ap_log_action` VALUES ('718', 'project', 'Insert project: 16', '1', '2020-02-20 10:12:14');
INSERT INTO `ap_log_action` VALUES ('719', 'document', 'Update document: 13', '1', '2020-02-20 10:14:02');
INSERT INTO `ap_log_action` VALUES ('720', 'project', 'Insert project: 17', '1', '2020-02-20 10:19:59');
INSERT INTO `ap_log_action` VALUES ('721', 'project', 'Insert project: 18', '1', '2020-02-20 10:31:47');
INSERT INTO `ap_log_action` VALUES ('722', 'project', 'Insert project: 19', '1', '2020-02-20 10:41:11');
INSERT INTO `ap_log_action` VALUES ('723', 'project', 'Insert project: 20', '1', '2020-02-20 10:41:40');
INSERT INTO `ap_log_action` VALUES ('724', 'project', 'Insert project: 21', '1', '2020-02-20 10:41:59');
INSERT INTO `ap_log_action` VALUES ('725', 'project', 'Insert project: 22', '1', '2020-02-20 10:42:09');
INSERT INTO `ap_log_action` VALUES ('726', 'project', 'Insert project: 23', '1', '2020-02-20 10:42:28');
INSERT INTO `ap_log_action` VALUES ('727', 'project', 'Update project: 18', '1', '2020-02-20 11:01:38');
INSERT INTO `ap_log_action` VALUES ('728', 'project', 'Update project: 17', '1', '2020-02-20 11:02:05');
INSERT INTO `ap_log_action` VALUES ('729', 'project', 'Insert project: 24', '1', '2020-02-20 11:07:57');
INSERT INTO `ap_log_action` VALUES ('730', 'project', 'Insert project: 25', '1', '2020-02-20 11:09:30');
INSERT INTO `ap_log_action` VALUES ('731', 'project', 'Update project: 24', '1', '2020-02-20 11:12:13');
INSERT INTO `ap_log_action` VALUES ('732', 'project', 'Update project: 24', '1', '2020-02-20 11:12:31');
INSERT INTO `ap_log_action` VALUES ('733', 'project', 'Insert project: 26', '1', '2020-02-20 11:14:26');
INSERT INTO `ap_log_action` VALUES ('734', 'project', 'Insert project: 27', '1', '2020-02-20 11:16:34');
INSERT INTO `ap_log_action` VALUES ('735', 'project', 'Insert project: 28', '1', '2020-02-20 11:17:33');
INSERT INTO `ap_log_action` VALUES ('736', 'project', 'Update project: 28', '1', '2020-02-20 11:17:46');
INSERT INTO `ap_log_action` VALUES ('737', 'project', 'Insert project: 29', '1', '2020-02-20 11:21:49');
INSERT INTO `ap_log_action` VALUES ('738', 'project', 'Insert project: 30', '1', '2020-02-20 11:22:47');
INSERT INTO `ap_log_action` VALUES ('739', 'project', 'Update project: 30', '1', '2020-02-20 11:23:20');
INSERT INTO `ap_log_action` VALUES ('740', 'project', 'Update project: 30', '1', '2020-02-20 11:24:19');
INSERT INTO `ap_log_action` VALUES ('741', 'project', 'Insert project: 31', '1', '2020-02-20 11:36:38');
INSERT INTO `ap_log_action` VALUES ('742', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 11:57:22');
INSERT INTO `ap_log_action` VALUES ('743', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 01:51:15');
INSERT INTO `ap_log_action` VALUES ('744', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 01:59:26');
INSERT INTO `ap_log_action` VALUES ('745', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 01:59:35');
INSERT INTO `ap_log_action` VALUES ('746', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 01:59:45');
INSERT INTO `ap_log_action` VALUES ('747', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 01:59:54');
INSERT INTO `ap_log_action` VALUES ('748', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:00:12');
INSERT INTO `ap_log_action` VALUES ('749', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:00:26');
INSERT INTO `ap_log_action` VALUES ('750', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:00:34');
INSERT INTO `ap_log_action` VALUES ('751', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:00:49');
INSERT INTO `ap_log_action` VALUES ('752', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:04:49');
INSERT INTO `ap_log_action` VALUES ('753', 'gallery', 'Update gallery: 24', '1', '2020-02-20 02:05:09');
INSERT INTO `ap_log_action` VALUES ('754', 'gallery', 'Update gallery: 24', '1', '2020-02-20 02:05:41');
INSERT INTO `ap_log_action` VALUES ('755', 'gallery', 'Update gallery: 24', '1', '2020-02-20 02:06:22');
INSERT INTO `ap_log_action` VALUES ('756', 'gallery', 'Update gallery: 24', '1', '2020-02-20 02:07:30');
INSERT INTO `ap_log_action` VALUES ('757', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:09:13');
INSERT INTO `ap_log_action` VALUES ('758', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:12:07');
INSERT INTO `ap_log_action` VALUES ('759', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:12:33');
INSERT INTO `ap_log_action` VALUES ('760', 'gallery', 'Update gallery: 27', '1', '2020-02-20 02:13:03');
INSERT INTO `ap_log_action` VALUES ('761', 'gallery', 'Update gallery: 27', '1', '2020-02-20 02:13:11');
INSERT INTO `ap_log_action` VALUES ('762', 'gallery', 'Update gallery: 9', '1', '2020-02-20 02:14:31');
INSERT INTO `ap_log_action` VALUES ('763', 'gallery', 'Update gallery: 21', '1', '2020-02-20 02:14:40');
INSERT INTO `ap_log_action` VALUES ('764', 'gallery', 'Update gallery: 26', '1', '2020-02-20 02:14:40');
INSERT INTO `ap_log_action` VALUES ('765', 'gallery', 'Update gallery: 14', '1', '2020-02-20 02:14:44');
INSERT INTO `ap_log_action` VALUES ('766', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:15:44');
INSERT INTO `ap_log_action` VALUES ('767', 'gallery', 'Update gallery: 28', '1', '2020-02-20 02:20:20');
INSERT INTO `ap_log_action` VALUES ('768', 'gallery', 'Update gallery: 27', '1', '2020-02-20 02:22:06');
INSERT INTO `ap_log_action` VALUES ('769', 'gallery', 'Update gallery: 25', '1', '2020-02-20 02:22:06');
INSERT INTO `ap_log_action` VALUES ('770', 'gallery', 'Update gallery: 28', '1', '2020-02-20 02:22:23');
INSERT INTO `ap_log_action` VALUES ('771', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:25:53');
INSERT INTO `ap_log_action` VALUES ('772', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:29:58');
INSERT INTO `ap_log_action` VALUES ('773', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:31:20');
INSERT INTO `ap_log_action` VALUES ('774', 'gallery', 'Update gallery: 31', '1', '2020-02-20 02:31:49');
INSERT INTO `ap_log_action` VALUES ('775', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:33:06');
INSERT INTO `ap_log_action` VALUES ('776', 'gallery', 'Update gallery: 18', '1', '2020-02-20 02:41:30');
INSERT INTO `ap_log_action` VALUES ('777', 'gallery', 'Update gallery: 32', '1', '2020-02-20 02:44:16');
INSERT INTO `ap_log_action` VALUES ('778', 'gallery', 'Update gallery: 31', '1', '2020-02-20 02:44:29');
INSERT INTO `ap_log_action` VALUES ('779', 'gallery', 'Update gallery: 32', '1', '2020-02-20 02:45:06');
INSERT INTO `ap_log_action` VALUES ('780', 'gallery', 'Update gallery: 32', '1', '2020-02-20 02:45:35');
INSERT INTO `ap_log_action` VALUES ('781', 'gallery', 'Update gallery: 32', '1', '2020-02-20 02:45:55');
INSERT INTO `ap_log_action` VALUES ('782', 'gallery', 'Update gallery: 32', '1', '2020-02-20 02:47:49');
INSERT INTO `ap_log_action` VALUES ('783', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 02:47:59');
INSERT INTO `ap_log_action` VALUES ('784', 'gallery', 'Update gallery: 32', '1', '2020-02-20 02:48:15');
INSERT INTO `ap_log_action` VALUES ('785', 'gallery', 'Update gallery: 33', '1', '2020-02-20 02:55:13');
INSERT INTO `ap_log_action` VALUES ('786', 'gallery', 'Update gallery: 32', '1', '2020-02-20 02:55:13');
INSERT INTO `ap_log_action` VALUES ('787', 'gallery', 'Update gallery: 31', '1', '2020-02-20 02:55:13');
INSERT INTO `ap_log_action` VALUES ('788', 'gallery', 'Update gallery: 30', '1', '2020-02-20 02:55:13');
INSERT INTO `ap_log_action` VALUES ('789', 'gallery', 'Update gallery: 29', '1', '2020-02-20 02:55:13');
INSERT INTO `ap_log_action` VALUES ('790', 'gallery', 'Update gallery: 23', '1', '2020-02-20 02:55:13');
INSERT INTO `ap_log_action` VALUES ('791', 'project', 'Insert project: 32', '1', '2020-02-20 02:56:28');
INSERT INTO `ap_log_action` VALUES ('792', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 03:02:19');
INSERT INTO `ap_log_action` VALUES ('793', 'category', 'Insert category: 65', '1', '2020-02-20 03:43:09');
INSERT INTO `ap_log_action` VALUES ('794', 'category', 'Insert category: 66', '1', '2020-02-20 03:44:25');
INSERT INTO `ap_log_action` VALUES ('795', 'system_menu', 'Insert system_menu: 139', '1', '2020-02-20 03:44:37');
INSERT INTO `ap_log_action` VALUES ('796', 'system_menu', 'Insert system_menu: 140', '1', '2020-02-20 03:44:58');
INSERT INTO `ap_log_action` VALUES ('797', 'system_menu', 'Update system_menu: 140', '1', '2020-02-20 03:45:29');
INSERT INTO `ap_log_action` VALUES ('798', 'system_menu', 'Insert system_menu: 141', '1', '2020-02-20 03:46:15');
INSERT INTO `ap_log_action` VALUES ('799', 'pro_service', 'Insert pro_service: 3', '1', '2020-02-20 03:47:33');
INSERT INTO `ap_log_action` VALUES ('800', 'pro_service', 'Update pro_service: 3', '1', '2020-02-20 03:47:44');
INSERT INTO `ap_log_action` VALUES ('801', 'project', 'Insert project: 33', '1', '2020-02-20 03:48:55');
INSERT INTO `ap_log_action` VALUES ('802', 'historydv', 'Insert historydv: 0', '1', '2020-02-20 03:49:13');
INSERT INTO `ap_log_action` VALUES ('803', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 03:49:35');
INSERT INTO `ap_log_action` VALUES ('804', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 03:49:57');
INSERT INTO `ap_log_action` VALUES ('805', 'recruit', 'Thêm cửa hàng có id là 12', '1', '2020-02-20 03:53:39');
INSERT INTO `ap_log_action` VALUES ('806', 'category', 'Update category: 52', '1', '2020-02-20 03:57:12');
INSERT INTO `ap_log_action` VALUES ('807', 'category', 'Update category: 52', '1', '2020-02-20 03:57:30');
INSERT INTO `ap_log_action` VALUES ('808', 'category', 'Update category: 52', '1', '2020-02-20 03:57:48');
INSERT INTO `ap_log_action` VALUES ('809', 'category', 'Insert category: 67', '1', '2020-02-20 04:09:44');
INSERT INTO `ap_log_action` VALUES ('810', 'category', 'Insert category: 68', '1', '2020-02-20 04:09:55');
INSERT INTO `ap_log_action` VALUES ('811', 'category', 'Insert category: 69', '1', '2020-02-20 04:10:14');
INSERT INTO `ap_log_action` VALUES ('812', 'pro_service', 'Insert pro_service: 4', '1', '2020-02-20 04:10:32');
INSERT INTO `ap_log_action` VALUES ('813', 'category', 'Insert category: 70', '1', '2020-02-20 04:11:06');
INSERT INTO `ap_log_action` VALUES ('814', 'project', 'Insert project: 34', '1', '2020-02-20 04:11:19');
INSERT INTO `ap_log_action` VALUES ('815', 'historydv', 'Insert historydv: 0', '1', '2020-02-20 04:11:28');
INSERT INTO `ap_log_action` VALUES ('816', 'category', 'Insert category: 71', '1', '2020-02-20 04:12:17');
INSERT INTO `ap_log_action` VALUES ('817', 'document', 'Insert document: 36', '1', '2020-02-20 04:13:03');
INSERT INTO `ap_log_action` VALUES ('818', 'video', 'Insert video: 0', '1', '2020-02-20 04:15:22');
INSERT INTO `ap_log_action` VALUES ('819', 'video', 'Update video: 37', '1', '2020-02-20 04:15:39');
INSERT INTO `ap_log_action` VALUES ('820', 'career', 'Insert career: 7', '1', '2020-02-20 04:18:40');
INSERT INTO `ap_log_action` VALUES ('821', 'career', 'Update career: 7', '1', '2020-02-20 04:18:42');
INSERT INTO `ap_log_action` VALUES ('822', 'post', 'Update post: 7', '1', '2020-02-20 04:19:20');
INSERT INTO `ap_log_action` VALUES ('823', 'post', 'Update post: 3', '1', '2020-02-20 04:19:20');
INSERT INTO `ap_log_action` VALUES ('824', 'post', 'Insert post: 12', '1', '2020-02-20 04:19:42');
INSERT INTO `ap_log_action` VALUES ('825', 'property', 'Insert property: 0', '1', '2020-02-20 04:20:04');
INSERT INTO `ap_log_action` VALUES ('826', 'property', 'Update property: 15', '1', '2020-02-20 04:20:07');
INSERT INTO `ap_log_action` VALUES ('827', 'post', 'Update post: 12', '1', '2020-02-20 04:22:23');
INSERT INTO `ap_log_action` VALUES ('828', 'category', 'Update category: 27', '1', '2020-02-20 04:22:44');
INSERT INTO `ap_log_action` VALUES ('829', 'category', 'Update category: 23', '1', '2020-02-20 04:22:45');
INSERT INTO `ap_log_action` VALUES ('830', 'category', 'Update category: 21', '1', '2020-02-20 04:22:45');
INSERT INTO `ap_log_action` VALUES ('831', 'category', 'Update category: 20', '1', '2020-02-20 04:22:45');
INSERT INTO `ap_log_action` VALUES ('832', 'category', 'Update category: 9', '1', '2020-02-20 04:22:45');
INSERT INTO `ap_log_action` VALUES ('833', 'category', 'Update category: 22', '1', '2020-02-20 04:23:00');
INSERT INTO `ap_log_action` VALUES ('834', 'category', 'Insert category: 72', '1', '2020-02-20 04:23:10');
INSERT INTO `ap_log_action` VALUES ('835', 'category', 'Insert category: 73', '1', '2020-02-20 04:23:18');
INSERT INTO `ap_log_action` VALUES ('836', 'category', 'Insert category: 74', '1', '2020-02-20 04:23:28');
INSERT INTO `ap_log_action` VALUES ('837', 'category', 'Insert category: 75', '1', '2020-02-20 04:23:42');
INSERT INTO `ap_log_action` VALUES ('838', 'category', 'Insert category: 76', '1', '2020-02-20 04:23:48');
INSERT INTO `ap_log_action` VALUES ('839', 'post', 'Insert post: 13', '1', '2020-02-20 04:24:03');
INSERT INTO `ap_log_action` VALUES ('840', 'post', 'Insert post: 14', '1', '2020-02-20 04:24:26');
INSERT INTO `ap_log_action` VALUES ('841', 'video', 'Update video: 37', '1', '2020-02-20 04:24:42');
INSERT INTO `ap_log_action` VALUES ('842', 'video', 'Insert video: 0', '1', '2020-02-20 04:27:29');
INSERT INTO `ap_log_action` VALUES ('843', 'category', 'Insert category: 77', '1', '2020-02-20 04:36:26');
INSERT INTO `ap_log_action` VALUES ('844', 'post', 'Insert post: 15', '1', '2020-02-20 04:39:20');
INSERT INTO `ap_log_action` VALUES ('845', 'post', 'Thêm Banner có id là 4', '1', '2020-02-20 04:39:49');
INSERT INTO `ap_log_action` VALUES ('846', 'page', 'Insert page: 0', '1', '2020-02-20 04:40:35');
INSERT INTO `ap_log_action` VALUES ('847', 'page', 'Update page: 21', '1', '2020-02-20 04:40:39');
INSERT INTO `ap_log_action` VALUES ('848', 'question', 'Insert question: 7', '1', '2020-02-20 04:40:58');
INSERT INTO `ap_log_action` VALUES ('849', 'question', 'Update question: 7', '1', '2020-02-20 04:41:04');
INSERT INTO `ap_log_action` VALUES ('850', 'category', 'Insert category: 78', '1', '2020-02-20 04:41:28');
INSERT INTO `ap_log_action` VALUES ('851', 'question', 'Insert question: 8', '1', '2020-02-20 04:42:23');
INSERT INTO `ap_log_action` VALUES ('852', 'question', 'Update question: 8', '1', '2020-02-20 04:42:26');
INSERT INTO `ap_log_action` VALUES ('853', 'category', 'Insert category: 79', '1', '2020-02-20 04:42:30');
INSERT INTO `ap_log_action` VALUES ('854', 'category', 'Insert category: 80', '1', '2020-02-20 04:43:04');
INSERT INTO `ap_log_action` VALUES ('855', 'category', 'Insert category: 81', '1', '2020-02-20 04:43:11');
INSERT INTO `ap_log_action` VALUES ('856', 'category', 'Update category: 81', '1', '2020-02-20 04:43:17');
INSERT INTO `ap_log_action` VALUES ('857', 'pro_service', 'Insert pro_service: 5', '1', '2020-02-20 04:43:36');
INSERT INTO `ap_log_action` VALUES ('858', 'pro_service', 'Update pro_service: 5', '1', '2020-02-20 04:43:39');
INSERT INTO `ap_log_action` VALUES ('859', 'category', 'Insert category: 82', '1', '2020-02-20 04:44:10');
INSERT INTO `ap_log_action` VALUES ('860', 'category', 'Update category: 82', '1', '2020-02-20 04:44:12');
INSERT INTO `ap_log_action` VALUES ('861', 'project', 'Insert project: 35', '1', '2020-02-20 04:44:34');
INSERT INTO `ap_log_action` VALUES ('862', 'project', 'Update project: 35', '1', '2020-02-20 04:44:37');
INSERT INTO `ap_log_action` VALUES ('863', 'historydv', 'Insert historydv: 0', '1', '2020-02-20 04:45:09');
INSERT INTO `ap_log_action` VALUES ('864', 'historydv', 'Update historydv: 19', '1', '2020-02-20 04:45:13');
INSERT INTO `ap_log_action` VALUES ('865', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 04:45:26');
INSERT INTO `ap_log_action` VALUES ('866', 'working_field', 'Update working_field: 17', '1', '2020-02-20 04:45:28');
INSERT INTO `ap_log_action` VALUES ('867', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 04:45:59');
INSERT INTO `ap_log_action` VALUES ('868', 'gallery', 'Update gallery: 39', '1', '2020-02-20 04:46:01');
INSERT INTO `ap_log_action` VALUES ('869', 'video', 'Update video: 38', '1', '2020-02-20 04:46:16');
INSERT INTO `ap_log_action` VALUES ('870', 'video', 'Update video: 38', '1', '2020-02-20 04:46:23');
INSERT INTO `ap_log_action` VALUES ('871', 'recruit', 'Thêm cửa hàng có id là 13', '1', '2020-02-20 04:46:30');
INSERT INTO `ap_log_action` VALUES ('872', 'video', 'Insert video: 0', '1', '2020-02-20 04:47:24');
INSERT INTO `ap_log_action` VALUES ('873', 'video', 'Update video: 40', '1', '2020-02-20 04:47:26');
INSERT INTO `ap_log_action` VALUES ('874', 'category', 'Insert category: 83', '1', '2020-02-20 04:47:45');
INSERT INTO `ap_log_action` VALUES ('875', 'category', 'Update category: 83', '1', '2020-02-20 04:47:48');
INSERT INTO `ap_log_action` VALUES ('876', 'category', 'Insert category: 84', '1', '2020-02-20 04:48:46');
INSERT INTO `ap_log_action` VALUES ('877', 'category', 'Update category: 84', '1', '2020-02-20 04:48:49');
INSERT INTO `ap_log_action` VALUES ('878', 'video', 'Update video: 37', '1', '2020-02-20 04:48:55');
INSERT INTO `ap_log_action` VALUES ('879', 'property', 'Insert property: 0', '1', '2020-02-20 04:48:58');
INSERT INTO `ap_log_action` VALUES ('880', 'property', 'Update property: 16', '1', '2020-02-20 04:49:00');
INSERT INTO `ap_log_action` VALUES ('881', 'career', 'Insert career: 8', '1', '2020-02-20 04:49:24');
INSERT INTO `ap_log_action` VALUES ('882', 'career', 'Update career: 8', '1', '2020-02-20 04:49:30');
INSERT INTO `ap_log_action` VALUES ('883', 'video', 'Update video: 38', '1', '2020-02-20 04:49:38');
INSERT INTO `ap_log_action` VALUES ('884', 'career', 'Insert career: 9', '1', '2020-02-20 04:50:46');
INSERT INTO `ap_log_action` VALUES ('885', 'category', 'Update category: 77', '1', '2020-02-20 05:01:12');
INSERT INTO `ap_log_action` VALUES ('886', 'post', 'Update post: 15', '1', '2020-02-20 05:01:41');
INSERT INTO `ap_log_action` VALUES ('887', 'category', 'Update category: 78', '1', '2020-02-20 05:02:47');
INSERT INTO `ap_log_action` VALUES ('888', 'pro_service', 'Insert pro_service: 6', '1', '2020-02-20 05:04:36');
INSERT INTO `ap_log_action` VALUES ('889', 'project', 'Insert project: 36', '1', '2020-02-20 05:06:38');
INSERT INTO `ap_log_action` VALUES ('890', 'historydv', 'Insert historydv: 0', '1', '2020-02-20 05:07:54');
INSERT INTO `ap_log_action` VALUES ('891', 'historydv', 'Update historydv: 20', '1', '2020-02-20 05:08:19');
INSERT INTO `ap_log_action` VALUES ('892', 'working_field', 'Insert working_field: 0', '1', '2020-02-20 05:08:32');
INSERT INTO `ap_log_action` VALUES ('893', 'gallery', 'Insert gallery: 0', '1', '2020-02-20 05:09:25');
INSERT INTO `ap_log_action` VALUES ('894', 'gallery', 'Update gallery: 41', '1', '2020-02-20 05:09:30');
INSERT INTO `ap_log_action` VALUES ('895', 'video', 'Insert video: 0', '1', '2020-02-20 05:09:59');
INSERT INTO `ap_log_action` VALUES ('896', 'recruit', 'Thêm cửa hàng có id là 14', '1', '2020-02-20 05:10:38');
INSERT INTO `ap_log_action` VALUES ('897', 'career', 'Update career: 9', '1', '2020-02-20 05:13:05');
INSERT INTO `ap_log_action` VALUES ('898', 'system_menu', 'Insert system_menu: 142', '1', '2020-02-20 05:33:44');
INSERT INTO `ap_log_action` VALUES ('899', 'document', 'Update document: 36', '1', '2020-02-20 05:34:35');
INSERT INTO `ap_log_action` VALUES ('900', 'video', 'Update video: 42', '1', '2020-02-21 09:07:18');
INSERT INTO `ap_log_action` VALUES ('901', 'video', 'Insert video: 0', '1', '2020-02-21 09:13:22');
INSERT INTO `ap_log_action` VALUES ('902', 'video', 'Insert video: 0', '1', '2020-02-21 09:13:57');
INSERT INTO `ap_log_action` VALUES ('903', 'video', 'Update video: 38', '1', '2020-02-21 09:14:20');
INSERT INTO `ap_log_action` VALUES ('904', 'video', 'Update video: 44', '1', '2020-02-21 09:14:26');
INSERT INTO `ap_log_action` VALUES ('905', 'video', 'Update video: 44', '1', '2020-02-21 09:17:57');
INSERT INTO `ap_log_action` VALUES ('906', 'video', 'Insert video: 0', '1', '2020-02-21 09:18:18');
INSERT INTO `ap_log_action` VALUES ('907', 'video', 'Update video: 45', '1', '2020-02-21 09:18:21');
INSERT INTO `ap_log_action` VALUES ('908', 'video', 'Insert video: 0', '1', '2020-02-21 09:31:53');
INSERT INTO `ap_log_action` VALUES ('909', 'video', 'Update video: 46', '1', '2020-02-21 09:34:43');
INSERT INTO `ap_log_action` VALUES ('910', 'video', 'Insert video: 0', '1', '2020-02-21 09:51:41');
INSERT INTO `ap_log_action` VALUES ('911', 'video', 'Insert video: 0', '1', '2020-02-21 09:52:45');
INSERT INTO `ap_log_action` VALUES ('912', 'video', 'Update video: 43', '1', '2020-02-21 09:53:14');
INSERT INTO `ap_log_action` VALUES ('913', 'video', 'Insert video: 0', '1', '2020-02-21 09:54:45');
INSERT INTO `ap_log_action` VALUES ('914', 'video', 'Insert video: 0', '1', '2020-02-21 09:55:11');
INSERT INTO `ap_log_action` VALUES ('915', 'video', 'Insert video: 0', '1', '2020-02-21 09:55:44');
INSERT INTO `ap_log_action` VALUES ('916', 'video', 'Update video: 51', '1', '2020-02-21 09:56:29');
INSERT INTO `ap_log_action` VALUES ('917', 'video', 'Insert video: 0', '1', '2020-02-21 09:57:04');
INSERT INTO `ap_log_action` VALUES ('918', 'video', 'Insert video: 0', '1', '2020-02-21 09:57:24');
INSERT INTO `ap_log_action` VALUES ('919', 'video', 'Insert video: 0', '1', '2020-02-21 09:57:57');
INSERT INTO `ap_log_action` VALUES ('920', 'video', 'Update video: 37', '1', '2020-02-21 09:58:04');
INSERT INTO `ap_log_action` VALUES ('921', 'video', 'Insert video: 0', '1', '2020-02-21 09:58:33');
INSERT INTO `ap_log_action` VALUES ('922', 'video', 'Update video: 38', '1', '2020-02-21 09:58:42');
INSERT INTO `ap_log_action` VALUES ('923', 'video', 'Update video: 52', '1', '2020-02-21 10:05:45');
INSERT INTO `ap_log_action` VALUES ('924', 'video', 'Update video: 51', '1', '2020-02-21 10:05:48');
INSERT INTO `ap_log_action` VALUES ('925', 'video', 'Update video: 55', '1', '2020-02-21 10:06:10');
INSERT INTO `ap_log_action` VALUES ('926', 'video', 'Update video: 48', '1', '2020-02-21 10:06:10');
INSERT INTO `ap_log_action` VALUES ('927', 'video', 'Update video: 54', '1', '2020-02-21 10:06:10');
INSERT INTO `ap_log_action` VALUES ('928', 'video', 'Update video: 53', '1', '2020-02-21 10:06:11');
INSERT INTO `ap_log_action` VALUES ('929', 'video', 'Update video: 50', '1', '2020-02-21 10:06:11');
INSERT INTO `ap_log_action` VALUES ('930', 'video', 'Update video: 47', '1', '2020-02-21 10:06:11');
INSERT INTO `ap_log_action` VALUES ('931', 'category', 'Insert category: 85', '1', '2020-02-21 10:36:03');
INSERT INTO `ap_log_action` VALUES ('932', 'category', 'Insert category: 86', '1', '2020-02-21 10:36:27');
INSERT INTO `ap_log_action` VALUES ('933', 'users', 'Insert users: 0', '1', '2020-02-21 10:42:43');
INSERT INTO `ap_log_action` VALUES ('934', 'groups', 'Update groups: 4', '1', '2020-02-21 10:43:25');
INSERT INTO `ap_log_action` VALUES ('935', 'users', 'Insert users: 0', '1', '2020-02-21 10:45:33');
INSERT INTO `ap_log_action` VALUES ('936', 'category', 'Update category: 76', '13', '2020-02-21 10:57:36');
INSERT INTO `ap_log_action` VALUES ('937', 'pro_service', 'Update pro_service: 6', '1', '2020-02-21 11:20:48');
INSERT INTO `ap_log_action` VALUES ('938', 'working_field', 'Update working_field: 18', '1', '2020-02-21 11:21:43');
INSERT INTO `ap_log_action` VALUES ('939', 'working_field', 'Update working_field: 16', '1', '2020-02-21 11:21:57');
INSERT INTO `ap_log_action` VALUES ('940', 'working_field', 'Update working_field: 14', '1', '2020-02-21 11:21:57');
INSERT INTO `ap_log_action` VALUES ('941', 'working_field', 'Update working_field: 13', '1', '2020-02-21 11:21:57');
INSERT INTO `ap_log_action` VALUES ('942', 'working_field', 'Update working_field: 12', '1', '2020-02-21 11:21:58');
INSERT INTO `ap_log_action` VALUES ('943', 'working_field', 'Update working_field: 11', '1', '2020-02-21 11:21:58');
INSERT INTO `ap_log_action` VALUES ('944', 'working_field', 'Update working_field: 9', '1', '2020-02-21 11:21:58');
INSERT INTO `ap_log_action` VALUES ('945', 'gallery', 'Update gallery: 35', '1', '2020-02-21 11:22:28');
INSERT INTO `ap_log_action` VALUES ('946', 'gallery', 'Update gallery: 34', '1', '2020-02-21 11:22:28');
INSERT INTO `ap_log_action` VALUES ('947', 'gallery', 'Update gallery: 22', '1', '2020-02-21 11:22:28');
INSERT INTO `ap_log_action` VALUES ('948', 'category', 'Insert category: 87', '1', '2020-02-21 01:40:52');
INSERT INTO `ap_log_action` VALUES ('949', 'category', 'Update category: 86', '1', '2020-02-21 01:41:17');
INSERT INTO `ap_log_action` VALUES ('950', 'document', 'Insert document: 56', '1', '2020-02-21 01:42:11');
INSERT INTO `ap_log_action` VALUES ('951', 'category', 'Insert category: 88', '1', '2020-02-21 01:43:41');
INSERT INTO `ap_log_action` VALUES ('952', 'category', 'Update category: 87', '1', '2020-02-21 01:44:23');
INSERT INTO `ap_log_action` VALUES ('953', 'category', 'Update category: 87', '1', '2020-02-21 01:46:27');
INSERT INTO `ap_log_action` VALUES ('954', 'category', 'Update category: 87', '1', '2020-02-21 01:47:10');
INSERT INTO `ap_log_action` VALUES ('955', 'category', 'Update category: 67', '1', '2020-02-21 01:47:48');
INSERT INTO `ap_log_action` VALUES ('956', 'category', 'Update category: 67', '1', '2020-02-21 01:48:14');
INSERT INTO `ap_log_action` VALUES ('957', 'document', 'Update document: 36', '1', '2020-02-21 02:01:16');
INSERT INTO `ap_log_action` VALUES ('958', 'document', 'Insert document: 57', '1', '2020-02-21 02:05:10');
INSERT INTO `ap_log_action` VALUES ('959', 'document', 'Update document: 56', '1', '2020-02-21 02:08:03');
INSERT INTO `ap_log_action` VALUES ('960', 'document', 'Insert document: 58', '1', '2020-02-21 02:11:02');
INSERT INTO `ap_log_action` VALUES ('961', 'document', 'Insert document: 59', '1', '2020-02-21 02:11:57');
INSERT INTO `ap_log_action` VALUES ('962', 'document', 'Update document: 59', '1', '2020-02-21 02:13:02');
INSERT INTO `ap_log_action` VALUES ('963', 'document', 'Update document: 59', '1', '2020-02-21 02:14:39');
INSERT INTO `ap_log_action` VALUES ('964', 'document', 'Update document: 58', '1', '2020-02-21 02:14:47');
INSERT INTO `ap_log_action` VALUES ('965', 'category', 'Update category: 85', '1', '2020-02-21 02:15:06');
INSERT INTO `ap_log_action` VALUES ('966', 'users', 'delete users: 14', '1', '2020-02-21 02:15:20');
INSERT INTO `ap_log_action` VALUES ('967', 'historydv', 'Update historydv: 17', '1', '2020-02-21 02:15:32');
INSERT INTO `ap_log_action` VALUES ('968', 'document', 'Update document: 56', '1', '2020-02-21 02:18:27');
INSERT INTO `ap_log_action` VALUES ('969', 'document', 'Update document: 36', '1', '2020-02-21 02:18:48');
INSERT INTO `ap_log_action` VALUES ('970', 'working_field', 'Update working_field: 3', '1', '2020-02-21 03:01:36');
INSERT INTO `ap_log_action` VALUES ('971', 'document', 'Insert document: 60', '1', '2020-02-21 03:13:43');
INSERT INTO `ap_log_action` VALUES ('972', 'career', 'Update career: 5', '1', '2020-02-21 03:14:40');
INSERT INTO `ap_log_action` VALUES ('973', 'users', 'Insert users: 0', '1', '2020-02-21 03:27:24');
INSERT INTO `ap_log_action` VALUES ('974', 'post', 'Update post: 14', '1', '2020-02-21 03:33:30');
INSERT INTO `ap_log_action` VALUES ('975', 'post', 'Update post: 14', '1', '2020-02-21 03:33:42');
INSERT INTO `ap_log_action` VALUES ('976', 'post', 'Update post: 13', '1', '2020-02-21 03:34:44');
INSERT INTO `ap_log_action` VALUES ('977', 'post', 'Update post: 13', '1', '2020-02-21 03:34:52');
INSERT INTO `ap_log_action` VALUES ('978', 'category', 'Update category: 76', '1', '2020-02-21 03:35:56');
INSERT INTO `ap_log_action` VALUES ('979', 'category', 'Update category: 76', '1', '2020-02-21 03:36:13');
INSERT INTO `ap_log_action` VALUES ('980', 'category', 'Insert category: 89', '1', '2020-02-21 03:37:59');
INSERT INTO `ap_log_action` VALUES ('981', 'post', 'Thêm Banner có id là 5', '1', '2020-02-21 03:38:10');
INSERT INTO `ap_log_action` VALUES ('982', 'banner', 'Sửa Banner có id là 5', '1', '2020-02-21 03:38:28');
INSERT INTO `ap_log_action` VALUES ('983', 'page', 'Insert page: 0', '1', '2020-02-21 03:44:04');
INSERT INTO `ap_log_action` VALUES ('984', 'question', 'Insert question: 9', '1', '2020-02-21 03:44:34');
INSERT INTO `ap_log_action` VALUES ('985', 'category', 'Insert category: 90', '1', '2020-02-21 03:44:50');
INSERT INTO `ap_log_action` VALUES ('986', 'category', 'Insert category: 91', '1', '2020-02-21 03:45:16');
INSERT INTO `ap_log_action` VALUES ('987', 'document', 'Update document: 60', '1', '2020-02-21 03:45:20');
INSERT INTO `ap_log_action` VALUES ('988', 'category', 'Update category: 80', '1', '2020-02-21 03:45:33');
INSERT INTO `ap_log_action` VALUES ('989', 'category', 'Insert category: 92', '1', '2020-02-21 03:45:57');
INSERT INTO `ap_log_action` VALUES ('990', 'pro_service', 'Insert pro_service: 7', '1', '2020-02-21 03:46:16');
INSERT INTO `ap_log_action` VALUES ('991', 'category', 'Insert category: 93', '1', '2020-02-21 03:46:30');
INSERT INTO `ap_log_action` VALUES ('992', 'project', 'Update project: 31', '1', '2020-02-21 03:46:44');
INSERT INTO `ap_log_action` VALUES ('993', 'historydv', 'Update historydv: 18', '1', '2020-02-21 03:46:58');
INSERT INTO `ap_log_action` VALUES ('994', 'working_field', 'Insert working_field: 0', '1', '2020-02-21 03:47:15');
INSERT INTO `ap_log_action` VALUES ('995', 'gallery', 'Insert gallery: 0', '1', '2020-02-21 03:48:15');
INSERT INTO `ap_log_action` VALUES ('996', 'video', 'Insert video: 0', '1', '2020-02-21 03:48:34');
INSERT INTO `ap_log_action` VALUES ('997', 'recruit', 'Thêm cửa hàng có id là 15', '1', '2020-02-21 03:49:09');
INSERT INTO `ap_log_action` VALUES ('998', 'category', 'Insert category: 94', '1', '2020-02-21 03:49:31');
INSERT INTO `ap_log_action` VALUES ('999', 'property', 'Insert property: 0', '1', '2020-02-21 03:49:47');
INSERT INTO `ap_log_action` VALUES ('1000', 'career', 'Insert career: 10', '1', '2020-02-21 03:50:16');
INSERT INTO `ap_log_action` VALUES ('1001', 'post', 'Insert post: 16', '1', '2020-02-21 03:51:07');
INSERT INTO `ap_log_action` VALUES ('1002', 'post', 'Update post: 16', '1', '2020-02-21 03:51:16');
INSERT INTO `ap_log_action` VALUES ('1003', 'post', 'Update post: 13', '1', '2020-02-21 03:51:27');
INSERT INTO `ap_log_action` VALUES ('1004', 'post', 'Insert post: 17', '1', '2020-02-21 03:51:45');
INSERT INTO `ap_log_action` VALUES ('1005', 'document', 'Insert document: 63', '1', '2020-02-21 04:08:13');
INSERT INTO `ap_log_action` VALUES ('1006', 'users', 'Update users: 15', '1', '2020-02-21 04:08:59');
INSERT INTO `ap_log_action` VALUES ('1007', 'users', 'Update users: 2', '1', '2020-02-21 04:09:25');
INSERT INTO `ap_log_action` VALUES ('1008', 'users', 'Update users: 15', '1', '2020-02-21 04:14:42');
INSERT INTO `ap_log_action` VALUES ('1009', 'users', 'Update users: 2', '1', '2020-02-21 04:14:51');
INSERT INTO `ap_log_action` VALUES ('1010', 'post', 'Insert post: 18', '1', '2020-02-21 04:33:53');
INSERT INTO `ap_log_action` VALUES ('1011', 'page', 'Insert page: 0', '1', '2020-02-21 04:44:57');
INSERT INTO `ap_log_action` VALUES ('1012', 'page', 'Update page: 23', '1', '2020-02-21 04:45:41');
INSERT INTO `ap_log_action` VALUES ('1013', 'category', 'Update category: 71', '1', '2020-02-21 04:46:52');
INSERT INTO `ap_log_action` VALUES ('1014', 'category', 'Insert category: 95', '1', '2020-02-21 04:46:58');
INSERT INTO `ap_log_action` VALUES ('1015', 'career', 'Insert career: 11', '1', '2020-02-21 04:47:38');
INSERT INTO `ap_log_action` VALUES ('1016', 'career', 'Update career: 10', '1', '2020-02-21 04:50:36');
INSERT INTO `ap_log_action` VALUES ('1017', 'category', 'Insert category: 96', '1', '2020-02-21 04:59:38');
INSERT INTO `ap_log_action` VALUES ('1018', 'category', 'Update category: 89', '1', '2020-02-21 05:06:33');
INSERT INTO `ap_log_action` VALUES ('1019', 'category', 'Update category: 76', '1', '2020-02-21 05:06:36');
INSERT INTO `ap_log_action` VALUES ('1020', 'category', 'Insert category: 97', '1', '2020-02-21 05:10:03');
INSERT INTO `ap_log_action` VALUES ('1021', 'category', 'Update category: 97', '1', '2020-02-21 05:10:43');
INSERT INTO `ap_log_action` VALUES ('1022', 'post', 'Insert post: 19', '1', '2020-02-21 05:11:18');
INSERT INTO `ap_log_action` VALUES ('1023', 'category', 'Update category: 97', '13', '2020-02-21 05:13:53');
INSERT INTO `ap_log_action` VALUES ('1024', 'category', 'Insert category: 98', '13', '2020-02-21 05:14:04');
INSERT INTO `ap_log_action` VALUES ('1025', 'category', 'Update category: 98', '13', '2020-02-21 05:14:37');
INSERT INTO `ap_log_action` VALUES ('1026', 'category', 'Update category: 98', '13', '2020-02-21 05:14:49');
INSERT INTO `ap_log_action` VALUES ('1027', 'category', 'Update category: 98', '13', '2020-02-21 05:15:03');
INSERT INTO `ap_log_action` VALUES ('1028', 'post', 'Insert post: 20', '1', '2020-02-21 05:15:16');
INSERT INTO `ap_log_action` VALUES ('1029', 'gallery', 'Update gallery: 20', '1', '2020-02-21 05:15:42');
INSERT INTO `ap_log_action` VALUES ('1030', 'gallery', 'Update gallery: 19', '1', '2020-02-21 05:15:44');
INSERT INTO `ap_log_action` VALUES ('1031', 'gallery', 'Update gallery: 18', '1', '2020-02-21 05:15:47');
INSERT INTO `ap_log_action` VALUES ('1032', 'gallery', 'Update gallery: 17', '1', '2020-02-21 05:15:49');
INSERT INTO `ap_log_action` VALUES ('1033', 'gallery', 'Update gallery: 16', '1', '2020-02-21 05:15:51');
INSERT INTO `ap_log_action` VALUES ('1034', 'gallery', 'Update gallery: 15', '1', '2020-02-21 05:15:53');
INSERT INTO `ap_log_action` VALUES ('1035', 'post', 'Update post: 19', '1', '2020-02-21 05:16:03');
INSERT INTO `ap_log_action` VALUES ('1036', 'gallery', 'Insert gallery: 0', '1', '2020-02-21 05:16:32');
INSERT INTO `ap_log_action` VALUES ('1037', 'post', 'Update post: 19', '1', '2020-02-21 05:16:55');
INSERT INTO `ap_log_action` VALUES ('1038', 'post', 'Insert post: 21', '1', '2020-02-21 05:19:14');
INSERT INTO `ap_log_action` VALUES ('1039', 'post', 'Insert post: 22', '1', '2020-02-21 05:22:57');
INSERT INTO `ap_log_action` VALUES ('1040', 'post', 'Update post: 19', '1', '2020-02-21 05:25:12');
INSERT INTO `ap_log_action` VALUES ('1041', 'post', 'Update post: 19', '1', '2020-02-21 05:25:18');
INSERT INTO `ap_log_action` VALUES ('1042', 'post', 'Update post: 21', '1', '2020-02-21 05:28:48');
INSERT INTO `ap_log_action` VALUES ('1043', 'post', 'Update post: 20', '1', '2020-02-21 05:28:48');
INSERT INTO `ap_log_action` VALUES ('1044', 'post', 'Update post: 22', '1', '2020-02-21 05:28:48');
INSERT INTO `ap_log_action` VALUES ('1045', 'post', 'Update post: 18', '1', '2020-02-21 05:28:48');
INSERT INTO `ap_log_action` VALUES ('1046', 'post', 'Insert post: 23', '1', '2020-02-21 05:30:30');
INSERT INTO `ap_log_action` VALUES ('1047', 'category', 'Update category: 98', '1', '2020-02-21 05:32:30');
INSERT INTO `ap_log_action` VALUES ('1048', 'post', 'Update post: 23', '1', '2020-02-21 05:32:59');
INSERT INTO `ap_log_action` VALUES ('1049', 'category', 'Update category: 98', '1', '2020-02-21 05:33:18');
INSERT INTO `ap_log_action` VALUES ('1050', 'page', 'Update page: 23', '1', '2020-02-21 05:35:48');
INSERT INTO `ap_log_action` VALUES ('1051', 'category', 'Insert category: 99', '1', '2020-02-22 09:10:28');
INSERT INTO `ap_log_action` VALUES ('1052', 'category', 'Update category: 66', '1', '2020-02-22 09:10:45');
INSERT INTO `ap_log_action` VALUES ('1053', 'category', 'Update category: 65', '1', '2020-02-22 09:10:49');
INSERT INTO `ap_log_action` VALUES ('1054', 'category', 'Update category: 99', '1', '2020-02-22 09:10:56');
INSERT INTO `ap_log_action` VALUES ('1055', 'category', 'Update category: 80', '1', '2020-02-22 09:19:21');
INSERT INTO `ap_log_action` VALUES ('1056', 'historydv', 'Update historydv: 16', '1', '2020-02-22 09:29:43');
INSERT INTO `ap_log_action` VALUES ('1057', 'historydv', 'Insert historydv: 0', '1', '2020-02-22 09:33:14');
INSERT INTO `ap_log_action` VALUES ('1058', 'category', 'Insert category: 100', '1', '2020-02-22 09:50:15');
INSERT INTO `ap_log_action` VALUES ('1059', 'pro_service', 'Insert pro_service: 8', '1', '2020-02-22 09:50:57');
INSERT INTO `ap_log_action` VALUES ('1060', 'category', 'Update category: 96', '1', '2020-02-22 10:28:20');
INSERT INTO `ap_log_action` VALUES ('1061', 'project', 'Update project: 36', '1', '2020-02-22 10:31:17');
INSERT INTO `ap_log_action` VALUES ('1062', 'working_field', 'Update working_field: 3', '1', '2020-02-22 10:45:44');
INSERT INTO `ap_log_action` VALUES ('1063', 'working_field', 'Insert working_field: 0', '1', '2020-02-22 10:45:52');
INSERT INTO `ap_log_action` VALUES ('1064', 'working_field', 'Update working_field: 3', '1', '2020-02-22 10:46:09');
INSERT INTO `ap_log_action` VALUES ('1065', 'working_field', 'Update working_field: 3', '1', '2020-02-22 10:47:55');
INSERT INTO `ap_log_action` VALUES ('1066', 'working_field', 'Insert working_field: 0', '1', '2020-02-22 10:51:17');
INSERT INTO `ap_log_action` VALUES ('1067', 'working_field', 'Insert working_field: 0', '1', '2020-02-22 10:51:40');
INSERT INTO `ap_log_action` VALUES ('1068', 'users', 'Update users: 1', '1', '2020-02-22 10:56:47');
INSERT INTO `ap_log_action` VALUES ('1069', 'users', 'Update users: 1', '1', '2020-02-22 10:57:28');
INSERT INTO `ap_log_action` VALUES ('1070', 'users', 'Update users: 13', '1', '2020-02-22 10:58:21');
INSERT INTO `ap_log_action` VALUES ('1071', 'users', 'Update users: 13', '13', '2020-02-22 10:59:48');
INSERT INTO `ap_log_action` VALUES ('1072', 'users', 'Update users: 13', '13', '2020-02-22 11:02:19');
INSERT INTO `ap_log_action` VALUES ('1073', 'project', 'Update project: 36', '1', '2020-02-22 11:03:21');
INSERT INTO `ap_log_action` VALUES ('1074', 'category', 'Update category: 93', '1', '2020-02-22 11:09:01');
INSERT INTO `ap_log_action` VALUES ('1075', 'category', 'Update category: 93', '1', '2020-02-22 11:09:17');
INSERT INTO `ap_log_action` VALUES ('1076', 'category', 'Update category: 93', '1', '2020-02-22 11:09:37');
INSERT INTO `ap_log_action` VALUES ('1077', 'category', 'Update category: 93', '1', '2020-02-22 11:10:03');
INSERT INTO `ap_log_action` VALUES ('1078', 'category', 'Update category: 93', '1', '2020-02-22 11:10:37');
INSERT INTO `ap_log_action` VALUES ('1079', 'project', 'Insert project: 37', '1', '2020-02-22 11:11:37');
INSERT INTO `ap_log_action` VALUES ('1080', 'gallery', 'Insert gallery: 0', '1', '2020-02-22 11:12:43');
INSERT INTO `ap_log_action` VALUES ('1081', 'gallery', 'Insert gallery: 0', '1', '2020-02-22 11:13:20');
INSERT INTO `ap_log_action` VALUES ('1082', 'video', 'Insert video: 0', '1', '2020-02-22 11:23:21');
INSERT INTO `ap_log_action` VALUES ('1083', 'video', 'Insert video: 0', '1', '2020-02-22 11:25:14');
INSERT INTO `ap_log_action` VALUES ('1084', 'video', 'Update video: 67', '1', '2020-02-22 11:26:34');
INSERT INTO `ap_log_action` VALUES ('1085', 'video', 'Insert video: 0', '1', '2020-02-22 11:26:42');
INSERT INTO `ap_log_action` VALUES ('1086', 'document', 'Update document: 36', '1', '2020-02-22 11:33:18');
INSERT INTO `ap_log_action` VALUES ('1087', 'working_field', 'Update working_field: 22', '1', '2020-02-22 03:44:05');
INSERT INTO `ap_log_action` VALUES ('1088', 'video', 'Update video: 68', '1', '2020-02-22 04:29:15');
INSERT INTO `ap_log_action` VALUES ('1089', 'video', 'Update video: 68', '1', '2020-02-22 04:29:51');
INSERT INTO `ap_log_action` VALUES ('1090', 'video', 'Update video: 68', '1', '2020-02-22 04:29:55');
INSERT INTO `ap_log_action` VALUES ('1091', 'video', 'Update video: 68', '1', '2020-02-22 04:30:30');
INSERT INTO `ap_log_action` VALUES ('1092', 'groups', 'Update groups: 4', '1', '2020-02-22 06:45:47');
INSERT INTO `ap_log_action` VALUES ('1093', 'users', 'Update users: 13', '1', '2020-02-22 06:46:03');
INSERT INTO `ap_log_action` VALUES ('1094', 'groups', 'Update groups: 4', '1', '2020-02-22 11:10:50');
INSERT INTO `ap_log_action` VALUES ('1095', 'post', 'Update post: 17', '1', '2020-02-22 11:16:36');
INSERT INTO `ap_log_action` VALUES ('1096', 'page', 'Update page: 22', '1', '2020-02-22 11:18:28');
INSERT INTO `ap_log_action` VALUES ('1097', 'working_field', 'Insert working_field: 0', '1', '2020-02-22 11:27:31');
INSERT INTO `ap_log_action` VALUES ('1098', 'gallery', 'Insert gallery: 0', '1', '2020-02-22 11:31:22');
INSERT INTO `ap_log_action` VALUES ('1099', 'gallery', 'Update gallery: 70', '1', '2020-02-22 11:31:25');
INSERT INTO `ap_log_action` VALUES ('1100', 'gallery', 'Update gallery: 66', '1', '2020-02-22 11:33:57');
INSERT INTO `ap_log_action` VALUES ('1101', 'gallery', 'Update gallery: 66', '1', '2020-02-22 11:34:07');
INSERT INTO `ap_log_action` VALUES ('1102', 'gallery', 'Update gallery: 65', '1', '2020-02-22 11:34:17');
INSERT INTO `ap_log_action` VALUES ('1103', 'gallery', 'Update gallery: 65', '1', '2020-02-22 11:34:18');
INSERT INTO `ap_log_action` VALUES ('1104', 'gallery', 'Update gallery: 65', '1', '2020-02-22 11:34:19');
INSERT INTO `ap_log_action` VALUES ('1105', 'gallery', 'Update gallery: 66', '1', '2020-02-22 11:34:26');
INSERT INTO `ap_log_action` VALUES ('1106', 'gallery', 'Update gallery: 66', '1', '2020-02-22 11:34:34');
INSERT INTO `ap_log_action` VALUES ('1107', 'video', 'Insert video: 0', '1', '2020-02-22 11:36:26');
INSERT INTO `ap_log_action` VALUES ('1108', 'video', 'Update video: 71', '1', '2020-02-22 11:38:21');
INSERT INTO `ap_log_action` VALUES ('1109', 'video', 'Update video: 71', '1', '2020-02-22 11:38:23');
INSERT INTO `ap_log_action` VALUES ('1110', 'video', 'Update video: 71', '1', '2020-02-22 11:38:24');
INSERT INTO `ap_log_action` VALUES ('1111', 'video', 'Update video: 69', '1', '2020-02-22 11:38:37');
INSERT INTO `ap_log_action` VALUES ('1112', 'video', 'Update video: 69', '1', '2020-02-22 11:38:38');
INSERT INTO `ap_log_action` VALUES ('1113', 'video', 'Insert video: 0', '1', '2020-02-22 11:38:50');
INSERT INTO `ap_log_action` VALUES ('1114', 'video', 'Update video: 72', '1', '2020-02-22 11:39:01');
INSERT INTO `ap_log_action` VALUES ('1115', 'video', 'Insert video: 0', '1', '2020-02-22 11:39:09');
INSERT INTO `ap_log_action` VALUES ('1116', 'video', 'Update video: 73', '1', '2020-02-22 11:39:21');
INSERT INTO `ap_log_action` VALUES ('1117', 'video', 'Update video: 73', '1', '2020-02-22 11:39:21');
INSERT INTO `ap_log_action` VALUES ('1118', 'video', 'Update video: 73', '1', '2020-02-22 11:39:22');
INSERT INTO `ap_log_action` VALUES ('1119', 'video', 'Update video: 73', '1', '2020-02-22 11:39:22');
INSERT INTO `ap_log_action` VALUES ('1120', 'video', 'Update video: 73', '1', '2020-02-22 11:39:23');
INSERT INTO `ap_log_action` VALUES ('1121', 'video', 'Update video: 73', '1', '2020-02-22 11:39:24');
INSERT INTO `ap_log_action` VALUES ('1122', 'video', 'Update video: 73', '1', '2020-02-22 11:42:14');
INSERT INTO `ap_log_action` VALUES ('1123', 'video', 'Update video: 72', '1', '2020-02-22 11:42:25');
INSERT INTO `ap_log_action` VALUES ('1124', 'video', 'Update video: 72', '1', '2020-02-22 11:42:34');
INSERT INTO `ap_log_action` VALUES ('1125', 'video', 'Update video: 71', '1', '2020-02-22 11:42:52');
INSERT INTO `ap_log_action` VALUES ('1126', 'video', 'Update video: 69', '1', '2020-02-22 11:42:54');
INSERT INTO `ap_log_action` VALUES ('1127', 'video', 'Update video: 49', '1', '2020-02-22 11:43:12');
INSERT INTO `ap_log_action` VALUES ('1128', 'video', 'Update video: 49', '1', '2020-02-22 11:43:14');
INSERT INTO `ap_log_action` VALUES ('1129', 'category', 'Insert category: 101', '1', '2020-02-23 09:11:37');
INSERT INTO `ap_log_action` VALUES ('1130', 'system_menu', 'Delete system_menu: 71', '1', '2020-02-24 09:32:14');
INSERT INTO `ap_log_action` VALUES ('1131', 'post', 'Update post: 23', '1', '2020-02-24 10:13:01');
INSERT INTO `ap_log_action` VALUES ('1132', 'pro_service', 'Update pro_service: 8', '1', '2020-02-24 10:23:46');
INSERT INTO `ap_log_action` VALUES ('1133', 'pro_service', 'Update pro_service: 8', '1', '2020-02-24 10:51:11');
INSERT INTO `ap_log_action` VALUES ('1134', 'pro_service', 'Update pro_service: 8', '1', '2020-02-24 10:58:05');
INSERT INTO `ap_log_action` VALUES ('1135', 'pro_service', 'Update pro_service: 8', '1', '2020-02-24 11:00:43');
INSERT INTO `ap_log_action` VALUES ('1136', 'working_field', 'Update working_field: 23', '1', '2020-02-24 11:35:33');
INSERT INTO `ap_log_action` VALUES ('1137', 'gallery', 'Update gallery: 66', '1', '2020-02-24 11:49:56');
INSERT INTO `ap_log_action` VALUES ('1138', 'gallery', 'Update gallery: 65', '1', '2020-02-24 11:52:04');
INSERT INTO `ap_log_action` VALUES ('1139', 'gallery', 'Update gallery: 65', '1', '2020-02-24 11:52:13');
INSERT INTO `ap_log_action` VALUES ('1140', 'video', 'Update video: 72', '1', '2020-02-24 11:52:51');
INSERT INTO `ap_log_action` VALUES ('1141', 'video', 'Update video: 62', '1', '2020-02-24 11:53:05');
INSERT INTO `ap_log_action` VALUES ('1142', 'video', 'Update video: 67', '1', '2020-02-24 11:53:13');
INSERT INTO `ap_log_action` VALUES ('1143', 'video', 'Update video: 68', '1', '2020-02-24 11:53:37');
INSERT INTO `ap_log_action` VALUES ('1144', 'question', 'Update question: 3', '1', '2020-02-24 03:36:57');
INSERT INTO `ap_log_action` VALUES ('1145', 'career', 'Update career: 11', '1', '2020-02-24 04:16:49');
INSERT INTO `ap_log_action` VALUES ('1146', 'career', 'Update career: 6', '1', '2020-02-24 04:16:58');
INSERT INTO `ap_log_action` VALUES ('1147', 'career', 'Update career: 5', '1', '2020-02-24 04:17:08');
INSERT INTO `ap_log_action` VALUES ('1148', 'property', 'Update property: 17', '1', '2020-02-24 04:23:54');
INSERT INTO `ap_log_action` VALUES ('1149', 'career', 'Insert career: 1', '1', '2020-02-26 10:48:04');
INSERT INTO `ap_log_action` VALUES ('1150', 'post', 'Update post: 23', '1', '2020-02-27 03:42:13');
INSERT INTO `ap_log_action` VALUES ('1151', 'video', 'Update video: 73', '1', '2020-05-04 09:20:07');
INSERT INTO `ap_log_action` VALUES ('1152', 'system_menu', 'Insert system_menu: 143', '1', '2020-05-04 09:48:29');

-- ----------------------------
-- Table structure for `ap_menus`
-- ----------------------------
DROP TABLE IF EXISTS `ap_menus`;
CREATE TABLE `ap_menus` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#',
  `parent_id` int(2) NOT NULL DEFAULT 0,
  `order` tinyint(2) DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` smallint(4) NOT NULL,
  `language_code` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_menus
-- ----------------------------
INSERT INTO `ap_menus` VALUES ('10', 'Sản phẩm', '', 'san-pham', '0', '1', '', '2', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('11', 'Khuyến mại', '', 'khuyen-mai', '0', '2', '', '2', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('12', 'Hệ thống cửa hàng', '', 'he-thong-cua-hang', '0', '3', '', '2', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('13', 'Tư vấn dinh dưỡng', '', 'tu-van-dinh-duong', '0', '4', '', '2', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('14', 'Câu hỏi thường gặp', '', 'cau-hoi-thuong-gap', '0', '5', '', '2', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('15', 'Hướng dẫn mua hàng', '', 'huong-dan-mua-hang', '0', '1', '', '3', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('16', 'Chính sách giao hàng', '', 'chinh-sach-giao-hang', '0', '2', '', '3', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('17', 'Chính sách đổi trả', '', 'chinh-sach-doi-tra', '0', '3', '', '3', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('18', 'Chính sách giá cả & thanh toán', '', 'chinh-sach-gia-ca-thanh-toan', '0', '4', '', '3', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('19', 'Hóa đơn điện tử', '', 'hoa-don-dien-tu', '0', '5', '', '3', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('21', 'Liên hệ', '', 'lien-he', '0', '1', '', '4', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('22', 'Kiểm tra đơn hàng', '', 'kiem-tra-don-hang', '0', '2', '', '4', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('23', 'Sản phẩm', '', 'san-pham', '0', '1', '', '1', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('24', 'Khuyến mại', '', 'khuyen-mai', '0', '2', '', '1', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('25', 'Hệ thống cửa hàng', '', 'he-thong-cua-hang', '0', '3', '', '1', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('26', 'Tư vấn dinh dưỡng', '', 'tu-van-dinh-duong', '0', '4', '', '1', 'vi', 'page');
INSERT INTO `ap_menus` VALUES ('27', 'Hướng dẫn mua hàng', '', 'huong-dan-mua-hang', '0', '5', '', '1', 'vi', 'page');

-- ----------------------------
-- Table structure for `ap_newsletter`
-- ----------------------------
DROP TABLE IF EXISTS `ap_newsletter`;
CREATE TABLE `ap_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ap_newsletter_email_uindex` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_newsletter
-- ----------------------------
INSERT INTO `ap_newsletter` VALUES ('1', 'ngavt@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('2', 'hongha@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('3', 'toandoan@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('4', 'linhnguyen@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('5', 'quangvu@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('6', 'huongnguyen@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('7', 'huyenthanh@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('8', 'tranglinh@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('9', 'haiho@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('10', 'vanninh@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('11', 'phattai@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('12', 'uyenvu@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('13', 'duyendoan@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('14', 'huonglinh@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('15', 'anhdo@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('16', 'khiemtran@gmailcom', '2020-02-18 16:31:14');
INSERT INTO `ap_newsletter` VALUES ('20', 'ngocbich@gmailcom', '2020-02-18 16:31:14');

-- ----------------------------
-- Table structure for `ap_page`
-- ----------------------------
DROP TABLE IF EXISTS `ap_page`;
CREATE TABLE `ap_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `style` varchar(20) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_status` tinyint(1) unsigned NOT NULL DEFAULT 2 COMMENT 'trang thai',
  `file` varchar(255) DEFAULT NULL,
  `time_thanhlap` datetime NOT NULL,
  `displayed_time` datetime NOT NULL COMMENT 'ngay publish',
  `created_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngay tao',
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'ngay sua',
  `album` text DEFAULT NULL,
  `block` text DEFAULT NULL,
  `order` int(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_page
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_page_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_page_translations`;
CREATE TABLE `ap_page_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `file_timeline` varchar(255) DEFAULT NULL,
  `content_more` longtext DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_page_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_page_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_post`
-- ----------------------------
DROP TABLE IF EXISTS `ap_post`;
CREATE TABLE `ap_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(255) NOT NULL,
  `album` text DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `is_status` tinyint(2) unsigned NOT NULL DEFAULT 2 COMMENT 'trang thai',
  `displayed_time` date NOT NULL COMMENT 'ngay publish',
  `type` varchar(100) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngay tao',
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'ngay sua',
  `created_by` int(11) DEFAULT NULL COMMENT 'Người tạo',
  `updated_by` int(11) DEFAULT NULL COMMENT 'Người sửa',
  `order` int(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_post
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_post_category`
-- ----------------------------
DROP TABLE IF EXISTS `ap_post_category`;
CREATE TABLE `ap_post_category` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_post_category
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_post_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_post_translations`;
CREATE TABLE `ap_post_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `content_more` text DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_post_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_post_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_project`
-- ----------------------------
DROP TABLE IF EXISTS `ap_project`;
CREATE TABLE `ap_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(255) NOT NULL,
  `album` text DEFAULT NULL,
  `is_status` tinyint(2) NOT NULL COMMENT 'Trạng thái',
  `displayed_time` date DEFAULT NULL COMMENT 'Ngày publish',
  `created_time` datetime NOT NULL COMMENT 'Ngày tạo',
  `updated_time` datetime NOT NULL COMMENT 'Ngày sửa',
  `created_by` int(11) DEFAULT NULL COMMENT 'Người tạo',
  `updated_by` int(11) DEFAULT NULL COMMENT 'Người sửa',
  `weblink` varchar(255) DEFAULT NULL COMMENT 'link website',
  `order` int(6) DEFAULT NULL COMMENT 'Xắp xếp',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_project
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_project_category`
-- ----------------------------
DROP TABLE IF EXISTS `ap_project_category`;
CREATE TABLE `ap_project_category` (
  `project_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_project_category
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_project_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_project_translations`;
CREATE TABLE `ap_project_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_featured` int(2) DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `content_more` text DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  KEY `id` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_project_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_property`
-- ----------------------------
DROP TABLE IF EXISTS `ap_property`;
CREATE TABLE `ap_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `order` int(6) NOT NULL DEFAULT 0,
  `is_status` tinyint(1) unsigned NOT NULL DEFAULT 2 COMMENT 'trang thai',
  `created_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngay tao',
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'ngay sua',
  `thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_property
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_property_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_property_translations`;
CREATE TABLE `ap_property_translations` (
  `id` int(11) NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_banner_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_property_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_province`
-- ----------------------------
DROP TABLE IF EXISTS `ap_province`;
CREATE TABLE `ap_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_province
-- ----------------------------
INSERT INTO `ap_province` VALUES ('1', '211', 'Tuyên Quang', '0');
INSERT INTO `ap_province` VALUES ('2', '817', 'Trà Vinh', '0');
INSERT INTO `ap_province` VALUES ('3', '805', 'An Giang', '0');
INSERT INTO `ap_province` VALUES ('4', '717', 'Bà Rịa - Vũng Tàu', '0');
INSERT INTO `ap_province` VALUES ('5', '207', 'Bắc Cạn', '0');
INSERT INTO `ap_province` VALUES ('6', '221', 'Bắc Giang', '0');
INSERT INTO `ap_province` VALUES ('7', '821', 'Bạc Liêu', '0');
INSERT INTO `ap_province` VALUES ('8', '223', 'Bắc Ninh', '0');
INSERT INTO `ap_province` VALUES ('9', '811', 'Bến Tre', '0');
INSERT INTO `ap_province` VALUES ('10', '507', 'Bình Định', '0');
INSERT INTO `ap_province` VALUES ('11', '711', 'Bình Dương', '0');
INSERT INTO `ap_province` VALUES ('12', '707', 'Bình Phước', '0');
INSERT INTO `ap_province` VALUES ('13', '715', 'Bình Thuận', '0');
INSERT INTO `ap_province` VALUES ('14', '823', 'Cà Mau', '0');
INSERT INTO `ap_province` VALUES ('15', '815', 'Cần Thơ', '0');
INSERT INTO `ap_province` VALUES ('16', '203', 'Cao Bằng', '0');
INSERT INTO `ap_province` VALUES ('17', '501', 'Đà Nẵng', '0');
INSERT INTO `ap_province` VALUES ('18', '605', 'Đắc Lắc', '0');
INSERT INTO `ap_province` VALUES ('19', '606', 'Đắk Nông', '0');
INSERT INTO `ap_province` VALUES ('20', '301', 'Điện Biên', '0');
INSERT INTO `ap_province` VALUES ('21', '713', 'Đồng Nai', '0');
INSERT INTO `ap_province` VALUES ('22', '803', 'Đồng Tháp', '0');
INSERT INTO `ap_province` VALUES ('23', '603', 'Gia Lai', '0');
INSERT INTO `ap_province` VALUES ('24', '201', 'Hà Giang', '0');
INSERT INTO `ap_province` VALUES ('25', '111', 'Hà Nam', '0');
INSERT INTO `ap_province` VALUES ('26', '101', 'Hà Nội', '0');
INSERT INTO `ap_province` VALUES ('27', '405', 'Hà Tĩnh', '0');
INSERT INTO `ap_province` VALUES ('28', '107', 'Hải Dương', '0');
INSERT INTO `ap_province` VALUES ('29', '103', 'Hải Phòng', '0');
INSERT INTO `ap_province` VALUES ('30', '816', 'Hậu Giang', '0');
INSERT INTO `ap_province` VALUES ('31', '305', 'Hòa Bình', '0');
INSERT INTO `ap_province` VALUES ('32', '109', 'Hưng Yên', '0');
INSERT INTO `ap_province` VALUES ('33', '511', 'Khánh Hòa', '0');
INSERT INTO `ap_province` VALUES ('34', '813', 'Kiên Giang', '0');
INSERT INTO `ap_province` VALUES ('35', '601', 'Kon Tum', '0');
INSERT INTO `ap_province` VALUES ('36', '302', 'Lai Châu', '0');
INSERT INTO `ap_province` VALUES ('37', '703', 'Lâm Đồng', '0');
INSERT INTO `ap_province` VALUES ('38', '209', 'Lạng Sơn', '0');
INSERT INTO `ap_province` VALUES ('39', '205', 'Lào Cai', '0');
INSERT INTO `ap_province` VALUES ('40', '801', 'Long An', '0');
INSERT INTO `ap_province` VALUES ('41', '113', 'Nam Định', '0');
INSERT INTO `ap_province` VALUES ('42', '403', 'Nghệ An', '0');
INSERT INTO `ap_province` VALUES ('43', '117', 'Ninh Bình', '0');
INSERT INTO `ap_province` VALUES ('44', '705', 'Ninh Thuận', '0');
INSERT INTO `ap_province` VALUES ('45', '217', 'Phú Thọ', '0');
INSERT INTO `ap_province` VALUES ('46', '509', 'Phú Yên', '0');
INSERT INTO `ap_province` VALUES ('47', '407', 'Quảng Bình', '0');
INSERT INTO `ap_province` VALUES ('48', '503', 'Quảng Nam', '0');
INSERT INTO `ap_province` VALUES ('49', '505', 'Quảng Ngãi', '0');
INSERT INTO `ap_province` VALUES ('50', '225', 'Quảng Ninh', '0');
INSERT INTO `ap_province` VALUES ('51', '409', 'Quảng Trị', '0');
INSERT INTO `ap_province` VALUES ('52', '819', 'Sóc Trăng', '0');
INSERT INTO `ap_province` VALUES ('53', '303', 'Sơn La', '0');
INSERT INTO `ap_province` VALUES ('54', '709', 'Tây Ninh', '0');
INSERT INTO `ap_province` VALUES ('55', '115', 'Thái Bình', '0');
INSERT INTO `ap_province` VALUES ('56', '215', 'Thái Nguyên', '0');
INSERT INTO `ap_province` VALUES ('57', '401', 'Thanh Hoá', '0');
INSERT INTO `ap_province` VALUES ('58', '411', 'Thừa Thiên - Huế', '0');
INSERT INTO `ap_province` VALUES ('59', '807', 'Tiền Giang', '0');
INSERT INTO `ap_province` VALUES ('60', '701', 'TP Hồ Chí Minh', '0');
INSERT INTO `ap_province` VALUES ('61', '809', 'Vĩnh Long', '0');
INSERT INTO `ap_province` VALUES ('62', '219', 'Vĩnh Phúc', '0');
INSERT INTO `ap_province` VALUES ('63', '213', 'Yên Bái', '0');

-- ----------------------------
-- Table structure for `ap_pro_service`
-- ----------------------------
DROP TABLE IF EXISTS `ap_pro_service`;
CREATE TABLE `ap_pro_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(255) NOT NULL,
  `album` text DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `is_status` tinyint(2) unsigned NOT NULL DEFAULT 2 COMMENT 'trang thai',
  `displayed_time` date NOT NULL COMMENT 'ngay publish',
  `type` varchar(100) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngay tao',
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'ngay sua',
  `created_by` int(11) DEFAULT NULL COMMENT 'Người tạo',
  `updated_by` int(11) DEFAULT NULL COMMENT 'Người sửa',
  `order` int(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_pro_service
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_pro_service_category`
-- ----------------------------
DROP TABLE IF EXISTS `ap_pro_service_category`;
CREATE TABLE `ap_pro_service_category` (
  `pro_service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`pro_service_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_pro_service_category
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_pro_service_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_pro_service_translations`;
CREATE TABLE `ap_pro_service_translations` (
  `id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `content_more` text DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(170) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ap_post_translations_id_language_code_pk` (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_pro_service_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_question`
-- ----------------------------
DROP TABLE IF EXISTS `ap_question`;
CREATE TABLE `ap_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `is_status` int(1) NOT NULL DEFAULT 1,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_question
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_question_category`
-- ----------------------------
DROP TABLE IF EXISTS `ap_question_category`;
CREATE TABLE `ap_question_category` (
  `question_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_question_category
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_question_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ap_question_translations`;
CREATE TABLE `ap_question_translations` (
  `id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`language_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_question_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_redirect`
-- ----------------------------
DROP TABLE IF EXISTS `ap_redirect`;
CREATE TABLE `ap_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ap_redirect
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_registers`
-- ----------------------------
DROP TABLE IF EXISTS `ap_registers`;
CREATE TABLE `ap_registers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` int(11) NOT NULL COMMENT '0: Hội đồng cao cấp, 1: Hội đồng thường, 2: Hội đồng tích cực',
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_registers
-- ----------------------------

-- ----------------------------
-- Table structure for `ap_system_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ap_system_menu`;
CREATE TABLE `ap_system_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(75) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `href` varchar(255) NOT NULL DEFAULT '#',
  `controller` varchar(30) DEFAULT NULL,
  `parent_id` int(4) NOT NULL DEFAULT 0,
  `class` varchar(255) DEFAULT NULL,
  `order` int(4) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_system_menu
-- ----------------------------
INSERT INTO `ap_system_menu` VALUES ('1', 'Bảng điều khiển', 'fa fa-dashboard', '#', null, '0', '', '30', null);
INSERT INTO `ap_system_menu` VALUES ('68', 'Quản lý thành viên', 'fa fa-users', '#', null, '0', 'treeview', '29', '_self');
INSERT INTO `ap_system_menu` VALUES ('69', 'Danh sách nhóm quyền', 'fa fa-users', 'groups', 'groups', '68', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('70', 'Danh sách thành viên', 'fa fa-user', 'users', 'users', '68', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('72', 'Quản trị nội dung', 'fa fa-newspaper-o', '#', null, '0', 'treeview', '28', '_self');
INSERT INTO `ap_system_menu` VALUES ('80', 'Quản lý địa điểm', 'fa fa-location-arrow', '#', null, '0', 'treeview', '21', '_self');
INSERT INTO `ap_system_menu` VALUES ('82', 'Quản lý tỉnh/thành phố', 'fa fa-bank', 'location/city', 'location', '80', '', '1', '_self');
INSERT INTO `ap_system_menu` VALUES ('83', 'Danh mục bài viết', 'fa fa-list-ol', 'category/post', 'category', '72', '', '6', '_self');
INSERT INTO `ap_system_menu` VALUES ('84', 'Danh sách bài viết', 'fa fa-list-alt', 'post', 'post', '72', '', '5', '_self');
INSERT INTO `ap_system_menu` VALUES ('85', 'Menu hệ thống', 'fa fa-align-justify', 'system_menu', 'system_menu', '0', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('86', 'Quản lý media', 'fa fa-picture-o', 'media', 'media', '98', '', '22', '_self');
INSERT INTO `ap_system_menu` VALUES ('87', 'Quản lý khuyến mãi', 'fa fa-cart-arrow-down', 'promotion', 'promotion', '87', '', '25', '_self');
INSERT INTO `ap_system_menu` VALUES ('90', 'Quản lý menu', 'fa fa-align-justify', 'menus', null, '72', '', '4', '_self');
INSERT INTO `ap_system_menu` VALUES ('91', 'Quản lý trang tĩnh', 'fa fa-navicon', 'page', 'page', '72', '', '3', '_self');
INSERT INTO `ap_system_menu` VALUES ('98', 'Quản lý đa phương tiện', 'fa fa-picture-o', '#', null, '0', 'treeview', '23', '_self');
INSERT INTO `ap_system_menu` VALUES ('105', 'Quản lý Quận/Huyện', 'fa fa-500px', 'location/district', 'location', '80', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('106', 'Quản lý phường xã', 'fa fa-address-card-o', 'location/ward', 'location', '80', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('110', 'Quản lý tuyển dụng', 'fa fa-address-card', '', null, '0', 'treeview', '1', '_self');
INSERT INTO `ap_system_menu` VALUES ('111', 'Ngành nghề tuyển dụng', 'fa fa-list-ul', 'category/career', 'category', '110', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('112', 'Quản lý địa điểm', 'fa fa-list-ul', 'property/location', 'property', '110', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('113', 'Danh sách tuyển dụng', 'fa fa-list', 'career', 'career', '110', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('114', 'Quản lý voucher', 'fa fa-gift', 'voucher', 'voucher', '87', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('116', 'Quản lý ứng viên', 'fa fa-address-book-o', 'candidate', 'candidate', '110', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('117', 'Quản lý câu hỏi', 'fa fa-question', 'question', 'question', '72', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('122', 'Quản lý cửa hàng', 'fa fa-stop', 'store', null, '0', '', '2', '_self');
INSERT INTO `ap_system_menu` VALUES ('123', 'Quản lý câu hỏi', 'fa fa-question-circle', '', null, '0', 'treeview', '10', '_self');
INSERT INTO `ap_system_menu` VALUES ('124', 'Danh mục câu hỏi', 'fa fa-list-ul', 'category/question', 'category', '123', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('125', 'Danh sách câu hỏi', 'fa fa-list-ul', 'question', 'question', '123', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('126', 'Quản lý liên hệ', 'fa fa-question-circle', '#', null, '0', 'treeview', '10', '_self');
INSERT INTO `ap_system_menu` VALUES ('127', 'Danh sách newsletter', 'fa fa-list-ul', 'newsletter', 'newsletter', '126', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('128', 'Quản lý sản phẩm', 'fa fa-product-hunt', '#', null, '0', 'treeview', '10', '_self');
INSERT INTO `ap_system_menu` VALUES ('129', 'Danh mục sản phẩm', 'fa fa-list-ul', 'category/pro_service', 'category', '128', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('130', 'Sản phẩm / dịch vụ', 'fa fa-angellist', 'pro_service', 'pro_service', '128', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('131', 'Danh sách liên hệ', 'fa fa-list-ul', 'contact', 'contact', '126', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('132', 'Quản lý dự án', 'fa fa-product-hunt', '#', null, '0', 'treeview', '10', '_self');
INSERT INTO `ap_system_menu` VALUES ('133', 'Danh mục dự án', 'fa fa-list-ul', 'category/project', 'category', '132', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('134', 'Danh sách dự án', 'fa fa-angellist', 'project', 'project', '132', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('135', 'Danh sách banner', 'fa fa-list-alt', 'banner', 'banner', '72', '', '5', '_self');
INSERT INTO `ap_system_menu` VALUES ('136', 'Lịch sử phát triển', 'fa fa-align-right', 'historydv', 'historydv', '0', '', '8', '_self');
INSERT INTO `ap_system_menu` VALUES ('137', 'Lĩnh vực hoạt động', 'fa fa-asl-interpreting', 'working_field', 'working_field', '0', '', '6', '_self');
INSERT INTO `ap_system_menu` VALUES ('138', 'Quản lý thư viện ảnh', 'fa fa-area-chart', 'gallery', null, '0', '', '6', '_self');
INSERT INTO `ap_system_menu` VALUES ('139', 'Quản lý tài liệu', 'fa fa-address-book', '#', null, '0', 'treeview', '11', '_self');
INSERT INTO `ap_system_menu` VALUES ('140', 'Quản lý Video', 'fa fa-camera-retro', 'video', null, '0', '', '6', '_self');
INSERT INTO `ap_system_menu` VALUES ('141', 'Danh mục tài liệu', 'fa fa-list-ul', 'category/document', 'category', '139', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('142', 'Danh sách tài liệu', 'fa fa-list', 'document', 'document', '139', '', '0', '_self');
INSERT INTO `ap_system_menu` VALUES ('143', 'Quản lý điều hướng', 'fa fa-unlink', 'redirect', 'redirect', '0', '', '0', '_self');

-- ----------------------------
-- Table structure for `ap_users`
-- ----------------------------
DROP TABLE IF EXISTS `ap_users`;
CREATE TABLE `ap_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `thumbnail_small` varchar(255) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_users
-- ----------------------------
INSERT INTO `ap_users` VALUES ('1', '127.0.0.1', 'admin', 'Chu ', 'Quang Khanh', 'Khanh Chu Quang', 'admin@gmail.com', '0987654321', '$2y$08$sfdKtkBCYka44/AgqHIKJuFRmDqevIJeZFpD91aFRw5cJTIRnxqvi', '', 'author.jpg', null, 'Apecsoft1', '', null, null, null, '1268889823', '1', null, '1588556845', '2019-01-31 17:30:53', '2017-12-17 00:49:09');
INSERT INTO `ap_users` VALUES ('2', '127.0.0.1', 'Khanhcq', 'Khanh', 'Chu', 'Khanh Chu', 'askeyh3t@gmail.com', '01233456789', '$2y$08$xx9FuqfUyX6DaOJhnSGPU.wKYggkQ9wexS0ZsFFoh.d3q4MHK3saO', null, null, null, 'Apecsoft', null, null, null, null, '1570591220', '1', null, '1575618607', null, null);
INSERT INTO `ap_users` VALUES ('3', '14.177.235.179', 'huyendtt', 'huyen', 'thanh', null, 'huyendtt@apecsoft.asia', '0362180456', '$2y$08$qTzybygB67h9a4eW/fvLruJGBRlT..vGExMt7PsPBObPa.sFufHoK', null, null, null, '', null, null, null, null, '1575541577', '1', null, '1575597784', null, null);
INSERT INTO `ap_users` VALUES ('13', '118.70.155.191', 'demo', 'demo1', 'demo12', null, 'demo@gmail.com', '0987654333', '$2y$08$610cI1Fab2kDZYbOkVjO..ufGrU4YNr0xzbkyydEAH/qqvXIU3ctG', null, null, null, 'apec12', null, null, null, null, '1582256563', '1', null, '1582387912', null, null);
INSERT INTO `ap_users` VALUES ('15', '118.70.155.191', 'ThanhHuyen', 'Nguyễn Thị Thanh Huyền', '', null, 'tuptt@apecasia.com', '0987654321', '$2y$08$fQSl6spcz6lZDKWfIXSQKeiHISBoelAy35GKsM4DFHyqSBZDPW2si', null, null, null, '', null, null, null, null, '1582273644', '1', null, null, null, null);

-- ----------------------------
-- Table structure for `ap_users_groups`
-- ----------------------------
DROP TABLE IF EXISTS `ap_users_groups`;
CREATE TABLE `ap_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE,
  KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE,
  KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE,
  CONSTRAINT `ap_users_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `ap_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ap_users_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ap_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_users_groups
-- ----------------------------
INSERT INTO `ap_users_groups` VALUES ('244', '1', '1');
INSERT INTO `ap_users_groups` VALUES ('286', '2', '1');
INSERT INTO `ap_users_groups` VALUES ('275', '3', '2');
INSERT INTO `ap_users_groups` VALUES ('288', '13', '4');
INSERT INTO `ap_users_groups` VALUES ('285', '15', '1');

-- ----------------------------
-- Table structure for `ap_ward`
-- ----------------------------
DROP TABLE IF EXISTS `ap_ward`;
CREATE TABLE `ap_ward` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `district` varchar(30) NOT NULL DEFAULT '0' COMMENT 'Quận huyện',
  `district_id` int(11) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `name_with_type` varchar(250) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ap_ward
-- ----------------------------
INSERT INTO `ap_ward` VALUES ('1', 'Phúc Xá', 'Ba Đình', '1', 'Hà Nội', '1', 'phuc-xa', 'Phường', 'Phường Phúc Xá, Ba Đình, Hà Nội', '21.0467979', '105.8481116', null);
INSERT INTO `ap_ward` VALUES ('4', 'Trúc Bạch', 'Ba Đình', '1', 'Hà Nội', '1', 'truc-bach', 'Phường', 'Phường Trúc Bạch, Ba Đình, Hà Nội', '21.0452531', '105.8415062', null);
INSERT INTO `ap_ward` VALUES ('6', 'Vĩnh Phúc', 'Ba Đình', '1', 'Hà Nội', '1', 'vinh-phuc', 'Phường', 'Phường Vĩnh Phúc, Ba Đình, Hà Nội', '21.0417308', '105.8099499', null);
INSERT INTO `ap_ward` VALUES ('7', 'Cống Vị', 'Ba Đình', '1', 'Hà Nội', '1', 'cong-vi', 'Phường', 'Phường Cống Vị, Ba Đình, Hà Nội', '21.0352802', '105.8092161', null);
INSERT INTO `ap_ward` VALUES ('8', 'Liễu Giai', 'Ba Đình', '1', 'Hà Nội', '1', 'lieu-giai', 'Phường', 'Phường Liễu Giai, Ba Đình, Hà Nội', '21.0379972', '105.8187558', null);
INSERT INTO `ap_ward` VALUES ('10', 'Nguyễn Trung Trực', 'Ba Đình', '1', 'Hà Nội', '1', 'nguyen-trung-truc', 'Phường', 'Phường Nguyễn Trung Trực, Ba Đình, Hà Nội', '21.0417971', '105.8473777', null);
INSERT INTO `ap_ward` VALUES ('13', 'Quán Thánh', 'Ba Đình', '1', 'Hà Nội', '1', 'quan-thanh', 'Phường', 'Phường Quán Thánh, Ba Đình, Hà Nội', '21.0389429', '105.8393044', null);
INSERT INTO `ap_ward` VALUES ('16', 'Ngọc Hà', 'Ba Đình', '1', 'Hà Nội', '1', 'ngoc-ha', 'Phường', 'Phường Ngọc Hà, Ba Đình, Hà Nội', '21.0378157', '105.8282959', null);
INSERT INTO `ap_ward` VALUES ('19', 'Điện Biên', 'Ba Đình', '1', 'Hà Nội', '1', 'dien-bien', 'Phường', 'Phường Điện Biên, Ba Đình, Hà Nội', '21.0331477', '105.8393044', null);
INSERT INTO `ap_ward` VALUES ('22', 'Đội Cấn', 'Ba Đình', '1', 'Hà Nội', '1', 'doi-can', 'Phường', 'Phường Đội Cấn, Ba Đình, Hà Nội', '21.0353362', '105.8238927', null);
INSERT INTO `ap_ward` VALUES ('25', 'Ngọc Khánh', 'Ba Đình', '1', 'Hà Nội', '1', 'ngoc-khanh', 'Phường', 'Phường Ngọc Khánh, Ba Đình, Hà Nội', '21.0301393', '105.8099499', null);
INSERT INTO `ap_ward` VALUES ('28', 'Kim Mã', 'Ba Đình', '1', 'Hà Nội', '1', 'kim-ma', 'Phường', 'Phường Kim Mã, Ba Đình, Hà Nội', '21.0316443', '105.8246266', null);
INSERT INTO `ap_ward` VALUES ('31', 'Giảng Võ', 'Ba Đình', '1', 'Hà Nội', '1', 'giang-vo', 'Phường', 'Phường Giảng Võ, Ba Đình, Hà Nội', '21.0270609', '105.8194896', null);
INSERT INTO `ap_ward` VALUES ('34', 'Thành Công', 'Ba Đình', '1', 'Hà Nội', '1', 'thanh-cong', 'Phường', 'Phường Thành Công, Ba Đình, Hà Nội', '21.0208890', '105.8158204', null);
INSERT INTO `ap_ward` VALUES ('37', 'Phúc Tân', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'phuc-tan', 'Phường', 'Phường Phúc Tân, Hoàn Kiếm, Hà Nội', '21.0372674', '105.8569193', null);
INSERT INTO `ap_ward` VALUES ('40', 'Đồng Xuân', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'dong-xuan', 'Phường', 'Phường Đồng Xuân, Hoàn Kiếm, Hà Nội', '21.0392122', '105.8498353', null);
INSERT INTO `ap_ward` VALUES ('43', 'Hàng Mã', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-ma', 'Phường', 'Phường Hàng Mã, Hoàn Kiếm, Hà Nội', '21.0375904', '105.8459098', null);
INSERT INTO `ap_ward` VALUES ('46', 'Hàng Buồm', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-buom', 'Phường', 'Phường Hàng Buồm, Hoàn Kiếm, Hà Nội', '21.0355832', '105.8517814', null);
INSERT INTO `ap_ward` VALUES ('49', 'Hàng Đào', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-dao', 'Phường', 'Phường Hàng Đào, Hoàn Kiếm, Hà Nội', '21.0346712', '105.8499465', null);
INSERT INTO `ap_ward` VALUES ('52', 'Hàng Bồ', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bo', 'Phường', 'Phường Hàng Bồ, Hoàn Kiếm, Hà Nội', '21.0348806', '105.8477447', null);
INSERT INTO `ap_ward` VALUES ('55', 'Cửa Đông', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'cua-dong', 'Phường', 'Phường Cửa Đông, Hoàn Kiếm, Hà Nội', '21.0329168', '105.8455428', null);
INSERT INTO `ap_ward` VALUES ('58', 'Lý Thái Tổ', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'ly-thai-to', 'Phường', 'Phường Lý Thái Tổ, Hoàn Kiếm, Hà Nội', '21.0309577', '105.8547173', null);
INSERT INTO `ap_ward` VALUES ('61', 'Hàng Bạc', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bac', 'Phường', 'Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', '21.0329432', '105.8528824', null);
INSERT INTO `ap_ward` VALUES ('64', 'Hàng Gai', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-gai', 'Phường', 'Phường Hàng Gai, Hoàn Kiếm, Hà Nội', '21.0319133', '105.8484786', null);
INSERT INTO `ap_ward` VALUES ('67', 'Chương Dương Độ', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'chuong-duong-do', 'Phường', 'Phường Chương Dương Độ, Hoàn Kiếm, Hà Nội', '21.0265395', '105.8621601', null);
INSERT INTO `ap_ward` VALUES ('70', 'Hàng Trống', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-trong', 'Phường', 'Phường Hàng Trống, Hoàn Kiếm, Hà Nội', '21.0284792', '105.8503135', null);
INSERT INTO `ap_ward` VALUES ('73', 'Cửa Nam', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'cua-nam', 'Phường', 'Phường Cửa Nam, Hoàn Kiếm, Hà Nội', '21.0252277', '105.8426071', null);
INSERT INTO `ap_ward` VALUES ('76', 'Hàng Bông', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bong', 'Phường', 'Phường Hàng Bông, Hoàn Kiếm, Hà Nội', '21.0288979', '105.8459098', null);
INSERT INTO `ap_ward` VALUES ('79', 'Tràng Tiền', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'trang-tien', 'Phường', 'Phường Tràng Tiền, Hoàn Kiếm, Hà Nội', '21.0251629', '105.8547173', null);
INSERT INTO `ap_ward` VALUES ('82', 'Trần Hưng Đạo', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'tran-hung-dao', 'Phường', 'Phường Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', '21.0229634', '105.8473777', null);
INSERT INTO `ap_ward` VALUES ('85', 'Phan Chu Trinh', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'phan-chu-trinh', 'Phường', 'Phường Phan Chu Trinh, Hoàn Kiếm, Hà Nội', '21.0205376', '105.8576533', null);
INSERT INTO `ap_ward` VALUES ('88', 'Hàng Bài', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bai', 'Phường', 'Phường Hàng Bài, Hoàn Kiếm, Hà Nội', '21.0210960', '105.8517814', null);
INSERT INTO `ap_ward` VALUES ('91', 'Phú Thượng', 'Tây Hồ', '3', 'Hà Nội', '1', 'phu-thuong', 'Phường', 'Phường Phú Thượng, Tây Hồ, Hà Nội', '21.0838905', '105.8084823', null);
INSERT INTO `ap_ward` VALUES ('94', 'Nhật Tân', 'Tây Hồ', '3', 'Hà Nội', '1', 'nhat-tan', 'Phường', 'Phường Nhật Tân, Tây Hồ, Hà Nội', '21.0764202', '105.8260943', null);
INSERT INTO `ap_ward` VALUES ('97', 'Tứ Liên', 'Tây Hồ', '3', 'Hà Nội', '1', 'tu-lien', 'Phường', 'Phường Tứ Liên, Tây Hồ, Hà Nội', '21.0695076', '105.8378366', null);
INSERT INTO `ap_ward` VALUES ('100', 'Quảng An', 'Tây Hồ', '3', 'Hà Nội', '1', 'quang-an', 'Phường', 'Phường Quảng An, Tây Hồ, Hà Nội', '21.0635910', '105.8260436', null);
INSERT INTO `ap_ward` VALUES ('103', 'Xuân La', 'Tây Hồ', '3', 'Hà Nội', '1', 'xuan-la', 'Phường', 'Phường Xuân La, Tây Hồ, Hà Nội', '21.0596756', '105.8040796', null);
INSERT INTO `ap_ward` VALUES ('106', 'Yên Phụ', 'Tây Hồ', '3', 'Hà Nội', '1', 'yen-phu', 'Phường', 'Phường Yên Phụ, Tây Hồ, Hà Nội', '21.0534309', '105.8393044', null);
INSERT INTO `ap_ward` VALUES ('109', 'Bưởi', 'Tây Hồ', '3', 'Hà Nội', '1', 'buoi', 'Phường', 'Phường Bưởi, Tây Hồ, Hà Nội', '21.0530438', '105.8128851', null);
INSERT INTO `ap_ward` VALUES ('112', 'Thụy Khuê', 'Tây Hồ', '3', 'Hà Nội', '1', 'thuy-khue', 'Phường', 'Phường Thụy Khuê, Tây Hồ, Hà Nội', '21.0461330', '105.8246266', null);
INSERT INTO `ap_ward` VALUES ('115', 'Thượng Thanh', 'Long Biên', '4', 'Hà Nội', '1', 'thuong-thanh', 'Phường', 'Phường Thượng Thanh, Long Biên, Hà Nội', '21.0655013', '105.8883137', null);
INSERT INTO `ap_ward` VALUES ('118', 'Ngọc Thụy', 'Long Biên', '4', 'Hà Nội', '1', 'ngoc-thuy', 'Phường', 'Phường Ngọc Thụy, Long Biên, Hà Nội', '21.0588582', '105.8583873', null);
INSERT INTO `ap_ward` VALUES ('121', 'Giang Biên', 'Long Biên', '4', 'Hà Nội', '1', 'giang-bien', 'Phường', 'Phường Giang Biên, Long Biên, Hà Nội', '21.0674567', '105.9200531', null);
INSERT INTO `ap_ward` VALUES ('124', 'Đức Giang', 'Long Biên', '4', 'Hà Nội', '1', 'duc-giang', 'Phường', 'Phường Đức Giang, Long Biên, Hà Nội', '21.0701691', '105.9068373', null);
INSERT INTO `ap_ward` VALUES ('127', 'Việt Hưng', 'Long Biên', '4', 'Hà Nội', '1', 'viet-hung', 'Phường', 'Phường Việt Hưng, Long Biên, Hà Nội', '21.0575538', '105.9024322', null);
INSERT INTO `ap_ward` VALUES ('130', 'Gia Thụy', 'Long Biên', '4', 'Hà Nội', '1', 'gia-thuy', 'Phường', 'Phường Gia Thụy, Long Biên, Hà Nội', '21.0489560', '105.8862812', null);
INSERT INTO `ap_ward` VALUES ('133', 'Ngọc Lâm', 'Long Biên', '4', 'Hà Nội', '1', 'ngoc-lam', 'Phường', 'Phường Ngọc Lâm, Long Biên, Hà Nội', '21.0448412', '105.8686635', null);
INSERT INTO `ap_ward` VALUES ('136', 'Phúc Lợi', 'Long Biên', '4', 'Hà Nội', '1', 'phuc-loi', 'Phường', 'Phường Phúc Lợi, Long Biên, Hà Nội', '21.0437208', '105.9259271', null);
INSERT INTO `ap_ward` VALUES ('139', 'Bồ Đề', 'Long Biên', '4', 'Hà Nội', '1', 'bo-de', 'Phường', 'Phường Bồ Đề, Long Biên, Hà Nội', '21.0371784', '105.8730678', null);

-- ----------------------------
-- Table structure for `ap_xaphuong`
-- ----------------------------
DROP TABLE IF EXISTS `ap_xaphuong`;
CREATE TABLE `ap_xaphuong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `province_code` int(11) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `district_code` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ap_xaphuong
-- ----------------------------
INSERT INTO `ap_xaphuong` VALUES ('1', '1010101', 'Phường Phúc Xá', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('2', '1010103', 'Phường Trúc Bạch', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('3', '1010105', 'Phường Vĩnh Phúc', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('4', '1010107', 'Phường Cống Vị', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('5', '1010109', 'Phường Liễu Giai', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('6', '1010111', 'P. Nguyễn Trung Trực', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('7', '1010113', 'Phường Ngọc Hà', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('8', '1010115', 'Phường Đội Cấn', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('9', '1010117', 'Phường Kim Mã', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('10', '1010119', 'Phường Giảng Võ', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('11', '1010121', 'Phường Thành Công', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('12', '1010123', 'Phường Điện Biên', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('13', '1010125', 'Phường Quán Thánh', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('14', '1010127', 'Phường Ngọc Khánh', '10101', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('15', '1010301', 'Phường Nhật Tân', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('16', '1010303', 'Phường Tứ Liên', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('17', '1010305', 'Phường Quảng An', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('18', '1010307', 'Phường Xuân La', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('19', '1010309', 'Phường Bưởi', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('20', '1010311', 'Phường Thuỵ Khuê', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('21', '1010313', 'Phường Phú Thượng', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('22', '1010315', 'Phường Yên Phụ', '10103', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('23', '1010501', 'Phường Phúc Tân', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('24', '1010503', 'Phường Hàng Mã', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('25', '1010505', 'Phường Hàng Buồm', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('26', '1010507', 'Phường Hàng Đào', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('27', '1010509', 'Phường Hàng Bồ', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('28', '1010511', 'Phường Lý Thái Tổ', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('29', '1010513', 'Phường Hàng Bạc', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('30', '1010515', 'Phường Chương Dương Độ', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('31', '1010517', 'Phường Hàng Trống', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('32', '1010519', 'Phường Cửa Nam', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('33', '1010521', 'Phường Trần Hưng Đạo', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('34', '1010523', 'Phường Phan Chu Trinh', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('35', '1010525', 'Phường Hàng Bài', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('36', '1010527', 'Phường Hàng Bông', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('37', '1010529', 'Phường Đồng Xuân', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('38', '1010531', 'Phường Cửa Đông', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('39', '1010533', 'Phường Hàng Gai', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('40', '1010535', 'Phường Tràng Tiền', '10105', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('41', '1010601', 'Phường Giang Biên', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('42', '1010603', 'Phường Đức Giang', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('43', '1010605', 'Phường Việt Hưng', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('44', '1010607', 'Phường Gia Thuỵ', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('45', '1010609', 'Phường Phúc Lợi', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('46', '1010611', 'Phường Bồ Đề', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('47', '1010613', 'Phường Sài Đồng', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('48', '1010615', 'Phường Thạch Bàn', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('49', '1010617', 'Phường Phúc Đồng', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('50', '1010619', 'Phường Cự Khối', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('51', '1010621', 'Phường Thượng Thanh', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('52', '1010623', 'Phường Ngọc Thuỵ', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('53', '1010625', 'Phường Ngọc Lâm', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('54', '1010627', 'Phường Long Biên', '10106', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('55', '1010701', 'Phường Lê Đại Hành', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('56', '1010703', 'Phường Đồng Nhân', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('57', '1010705', 'Phường Đống Mác', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('58', '1010707', 'Phường Thanh Lương', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('59', '1010709', 'Phường Thanh Nhàn', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('60', '1010711', 'Phường Cầu Dền', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('61', '1010713', 'Phường Bách Khoa', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('62', '1010715', 'Phường Đồng Tâm', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('63', '1010717', 'Phường Vĩnh Tuy', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('64', '1010719', 'Phường Bạch Mai', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('65', '1010721', 'Phường Quỳnh Lôi', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('66', '1010723', 'Phường Trương Định', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('67', '1010725', 'Phường Ngô Thì Nhậm', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('68', '1010727', 'Phường Bạch Đằng', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('69', '1010729', 'Phường Phạm Đình Hổ', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('70', '1010731', 'Phường Bùi Thị Xuân', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('71', '1010733', 'Phường Phố Huế', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('72', '1010735', 'Phường Minh Khai', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('73', '1010737', 'Phường Quỳnh Mai', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('74', '1010739', 'Phường Nguyễn Du', '10107', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('75', '1010801', 'Phường Vĩnh Hưng', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('76', '1010803', 'Phường Định Công', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('77', '1010805', 'Phường Mai Động', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('78', '1010807', 'Phường Tương Mai', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('79', '1010809', 'Phường Tân Mai', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('80', '1010811', 'Phường Hoàng Văn Thụ', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('81', '1010813', 'Phường Giáp Bát', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('82', '1010815', 'Phường Thịnh Liệt', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('83', '1010817', 'Phường Hoàng Liệt', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('84', '1010819', 'Phường Trần Phú', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('85', '1010821', 'Phường Thanh Trì', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('86', '1010823', 'Phường Đại Kim', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('87', '1010825', 'Phường Lĩnh Nam', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('88', '1010827', 'Phường Yên Sở', '10108', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('89', '1010901', 'Phường Cát Linh', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('90', '1010903', 'Phường Văn Miếu', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('91', '1010905', 'Phường Láng Thượng', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('92', '1010907', 'Phường ô Chợ Dừa', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('93', '1010909', 'Phường Hàng Bột', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('94', '1010911', 'Phường Khâm Thiên', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('95', '1010913', 'Phường Thổ Quan', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('96', '1010915', 'Phường Nam Đồng', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('97', '1010917', 'Phường Quang Trung', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('98', '1010919', 'Phường Trung Liệt', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('99', '1010921', 'Phường Phương Liên', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('100', '1010923', 'Phường Thịnh Quang', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('101', '1010925', 'Phường Kim Liên', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('102', '1010927', 'Phường Ngã Tư Sở', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('103', '1010929', 'Phường Khương Thượng', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('104', '1010931', 'Phường Văn Chương', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('105', '1010933', 'Phường Phương Mai', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('106', '1010935', 'Phường Quốc Tử Giám', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('107', '1010937', 'Phường Láng Hạ', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('108', '1010939', 'Phường Trung Phụng', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('109', '1010941', 'Phường Trung Tự', '10109', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('110', '1011101', 'Phường Nhân Chính', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('111', '1011103', 'Phường Thượng Đình', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('112', '1011105', 'Phường Khương Trung', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('113', '1011107', 'Phường Thanh Xuân Trung', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('114', '1011109', 'Phường Phương Liệt', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('115', '1011111', 'Phường Hạ Đình', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('116', '1011113', 'Phường Khương Đình', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('117', '1011115', 'Phường Kim Giang', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('118', '1011117', 'Phường Thanh Xuân Nam', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('119', '1011119', 'Phường Khương Mai', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('120', '1011121', 'Phường Thanh Xuân Bắc', '10111', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('121', '1011301', 'Phường Mai Dịch', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('122', '1011303', 'Phường Dịch Vọng', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('123', '1011305', 'Phường Dịch Vọng Hậu', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('124', '1011307', 'Phường Quan Hoa', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('125', '1011309', 'Phường Trung Hoà', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('126', '1011311', 'Phường Nghĩa Đô', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('127', '1011313', 'Phường Nghĩa Tân', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('128', '1011315', 'Phường Yên Hoà', '10113', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('129', '1011501', 'Thị trấn Sóc Sơn', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('130', '1011503', 'Xã Bắc Sơn', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('131', '1011505', 'Xã Hồng Kỳ', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('132', '1011507', 'Xã Nam Sơn', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('133', '1011509', 'Xã Trung Giã', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('134', '1011511', 'Xã Minh Phú', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('135', '1011513', 'Xã Phù Linh', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('136', '1011515', 'Xã Bắc Phú', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('137', '1011517', 'Xã Quang Tiến', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('138', '1011519', 'Xã Hiền Ninh', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('139', '1011521', 'Xã Việt Long', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('140', '1011523', 'Xã Xuân Giang', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('141', '1011525', 'Xã Mai Đình', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('142', '1011527', 'Xã Thanh Xuân', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('143', '1011529', 'Xã Đông Xuân', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('144', '1011531', 'Xã Kim Lũ', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('145', '1011533', 'Xã Phú Minh', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('146', '1011535', 'Xã Xuân Thu', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('147', '1011537', 'Xã Tân Dân', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('148', '1011539', 'Xã Phù Lỗ', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('149', '1011541', 'Xã Minh Trí', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('150', '1011543', 'Xã Tân Hưng', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('151', '1011545', 'Xã Tân Minh', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('152', '1011547', 'Xã Tiên Dược', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('153', '1011549', 'Xã Đức Hoà', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('154', '1011551', 'Xã Phú Cường', '10115', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('155', '1011701', 'Xã Xuân Nộn', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('156', '1011703', 'Xã Thuỵ Lâm', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('157', '1011705', 'Xã Bắc Hồng', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('158', '1011707', 'Xã Nam Hồng', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('159', '1011709', 'Xã Tiên Dương', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('160', '1011711', 'Xã Vân Hà', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('161', '1011713', 'Xã Liên Hà', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('162', '1011715', 'Xã Việt Hùng', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('163', '1011717', 'Xã Kim Chung', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('164', '1011719', 'Xã Dục Tú', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('165', '1011721', 'Xã Vĩnh Ngọc', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('166', '1011723', 'Xã Cổ Loa', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('167', '1011725', 'Xã Hải Bối', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('168', '1011727', 'Xã Võng La', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('169', '1011729', 'Xã Mai Lâm', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('170', '1011731', 'Xã Vân Nội', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('171', '1011733', 'Xã Tầm Xá', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('172', '1011735', 'Thị trấn Đông Anh', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('173', '1011737', 'Xã Nguyên Khê', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('174', '1011739', 'Xã Uy Nỗ', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('175', '1011741', 'Xã Kim Nỗ', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('176', '1011743', 'Xã Đại Mạch', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('177', '1011745', 'Xã Xuân Canh', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('178', '1011747', 'Xã Đông Hội', '10117', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('179', '1011901', 'Xã Kiêu Kỵ', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('180', '1011903', 'Xã Bát Tràng', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('181', '1011905', 'Xã Kim Lan', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('182', '1011907', 'Xã Văn Đức', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('183', '1011909', 'Xã Đa Tốn', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('184', '1011911', 'Thị trấn Yên Viên', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('185', '1011913', 'Xã Yên Thường', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('186', '1011915', 'Xã Yên Viên', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('187', '1011917', 'Xã Đình Xuyên', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('188', '1011919', 'Xã Dương Hà', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('189', '1011921', 'Xã Phù Đổng', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('190', '1011923', 'Xã Cổ Bi', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('191', '1011925', 'Xã Đặng Xá', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('192', '1011927', 'Xã Kim Sơn', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('193', '1011929', 'Xã Trâu Quỳ', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('194', '1011931', 'Xã Dương Quang', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('195', '1011933', 'Xã Đông Dư', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('196', '1011935', 'Xã Lệ Chi', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('197', '1011937', 'Xã Ninh Hiệp', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('198', '1011939', 'Xã Trung Mầu', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('199', '1011941', 'Xã Phú Thị', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('200', '1011943', 'Xã Dương Xá', '10119', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('201', '1012101', 'Thị trấn Cầu Diễn', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('202', '1012103', 'Xã Thượng Cát', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('203', '1012105', 'Xã Thuỵ Phương', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('204', '1012107', 'Xã Tây Tựu', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('205', '1012109', 'Xã Xuân Đỉnh', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('206', '1012111', 'Xã Cổ Nhuế', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('207', '1012113', 'Xã Phú Diễn', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('208', '1012115', 'Xã Xuân Phương', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('209', '1012117', 'Xã Tây Mỗ', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('210', '1012119', 'Xã Mễ Trì', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('211', '1012121', 'Xã Liên Mạc', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('212', '1012123', 'Xã Đại Mỗ', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('213', '1012125', 'Xã Đông Ngạc', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('214', '1012127', 'Xã Minh Khai', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('215', '1012129', 'Xã Mỹ Đình', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('216', '1012131', 'Xã Trung Văn', '10121', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('217', '1012301', 'Thị trấn Văn Điển', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('218', '1012303', 'Xã Tân Triều', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('219', '1012305', 'Xã Thanh Liệt', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('220', '1012307', 'Xã Hữu Hoà', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('221', '1012309', 'Xã Tam Hiệp', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('222', '1012311', 'Xã Tứ Hiệp', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('223', '1012313', 'Xã Vĩnh Quỳnh', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('224', '1012315', 'Xã Duyên Hà', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('225', '1012317', 'Xã Vạn Phúc', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('226', '1012319', 'Xã Đại áng', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('227', '1012321', 'Xã Liên Ninh', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('228', '1012323', 'Xã Ngũ Hiệp', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('229', '1012325', 'Xã Tả Thanh Oai', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('230', '1012327', 'Xã Yên Mỹ', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('231', '1012329', 'Xã Ngọc Hồi', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('232', '1012331', 'Xã Đông Mỹ', '10123', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('233', '1012501', 'Xã Đại Thịnh', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('234', '1012503', 'Xã Kim Hoa', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('235', '1012505', 'Xã Thạch Đà', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('236', '1012507', 'Xã Tự Lập', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('237', '1012509', 'Xã Thanh Lâm', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('238', '1012511', 'Xã Liên Mạc', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('239', '1012513', 'Xã Vạn Yên', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('240', '1012515', 'Xã Chu Phan', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('241', '1012517', 'Xã Mê Linh', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('242', '1012519', 'Xã Văn Khê', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('243', '1012521', 'Xã Hoàng Kim', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('244', '1012523', 'Xã Tráng Việt', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('245', '1012525', 'Thị trấn Quang Minh', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('246', '1012527', 'Xã Tiến Thắng', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('247', '1012529', 'Xã Tam Đồng', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('248', '1012531', 'Xã Tiến Thịnh', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('249', '1012533', 'Xã Tiền Phong', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('250', '1012535', 'Thị trấn Chi Đông', '10125', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('251', '1012701', 'Phường Nguyễn Trãi', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('252', '1012703', 'Phường Mỗ Lao', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('253', '1012704', 'Phường Văn Quán', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('254', '1012705', 'Phường Vạn Phúc', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('255', '1012707', 'Phường Quang Trung', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('256', '1012709', 'Phường Phúc La', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('257', '1012711', 'Phường Hà Cầu', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('258', '1012713', 'Xã Yên Nghĩa', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('259', '1012715', 'Xã Kiến Hưng', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('260', '1012717', 'Xã Phú Lãm', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('261', '1012719', 'Xã Dương Nội', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('262', '1012721', 'Xã Đồng Mai', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('263', '1012723', 'Xã Biên Giang', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('264', '1012725', 'Xã Phú Lương', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('265', '1012727', 'Phường Phú La', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('266', '1012728', 'Phường La Khê', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('267', '1012729', 'Phường Yết Kiêu', '10127', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('268', '1012901', 'Phường Phú Thịnh', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('269', '1012903', 'Phường Quang Trung', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('270', '1012905', 'Phường Sơn Lộc', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('271', '1012907', 'Phường Xuân Khanh', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('272', '1012909', 'Xã Đường Lâm', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('273', '1012911', 'Xã Xuân Sơn', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('274', '1012913', 'Phường Trung Hưng', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('275', '1012915', 'Xã Thanh Mỹ', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('276', '1012917', 'Xã Kim Sơn', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('277', '1012919', 'Xã Sơn Đông', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('278', '1012921', 'Xã Cổ Đông', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('279', '1012923', 'Phường Lê Lợi', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('280', '1012925', 'Phường Ngô Quyền', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('281', '1012927', 'Phường Viên Sơn', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('282', '1012929', 'Phường Trung Sơn Trầm', '10129', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('283', '1013101', 'Xã Vân Hà', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('284', '1013103', 'Xã Vân Phúc', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('285', '1013105', 'Xã Vân Nam', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('286', '1013107', 'Xã Xuân Phú', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('287', '1013109', 'Xã Sen Chiểu', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('288', '1013111', 'Xã Cẩm Đình', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('289', '1013113', 'Xã Võng Xuyên', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('290', '1013115', 'Xã Long Xuyên', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('291', '1013117', 'Xã Thượng Cốc', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('292', '1013119', 'Xã Thanh Đa', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('293', '1013121', 'Xã Trạch Mỹ Lộc', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('294', '1013123', 'Xã Phúc Hòa', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('295', '1013125', 'Xã Phụng Thượng', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('296', '1013127', 'Xã Tam Thuấn', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('297', '1013129', 'Xã Tam Hiệp', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('298', '1013131', 'Xã Hát Môn', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('299', '1013133', 'Thị trấn Phúc Thọ', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('300', '1013135', 'Xã Phương Độ', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('301', '1013137', 'Xã Thọ Lộc', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('302', '1013139', 'Xã Tích Giang', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('303', '1013141', 'Xã Ngọc Tảo', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('304', '1013143', 'Xã Hiệp Thuận', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('305', '1013145', 'Xã Liên Hiệp', '10131', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('306', '1013301', 'Xã Thọ An', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('307', '1013303', 'Xã Phương Đình', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('308', '1013305', 'Xã Hạ Mỗ', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('309', '1013307', 'Xã Tân Hội', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('310', '1013309', 'Xã Song Phượng', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('311', '1013311', 'Thị trấn Phùng', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('312', '1013313', 'Xã Trung Châu', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('313', '1013315', 'Xã Thọ Xuân', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('314', '1013317', 'Xã Hồng Hà', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('315', '1013319', 'Xã Liên Hồng', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('316', '1013321', 'Xã Liên Hà', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('317', '1013323', 'Xã Liên Trung', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('318', '1013325', 'Xã Thượng Mỗ', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('319', '1013327', 'Xã Tân Lập', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('320', '1013329', 'Xã Đan Phượng', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('321', '1013331', 'Xã Đồng Tháp', '10133', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('322', '1013501', 'Xã Phú Kim', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('323', '1013503', 'Xã Hữu Bằng', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('324', '1013505', 'Xã Lại Thượng', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('325', '1013507', 'Xã Kim Quan', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('326', '1013509', 'Xã Thạch Hoà', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('327', '1013511', 'Xã Tân Xã', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('328', '1013513', 'Xã Hạ Bằng', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('329', '1013515', 'Thị trấn Liên Quan', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('330', '1013517', 'Xã Đại Đồng', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('331', '1013519', 'Xã Cẩm Yên', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('332', '1013521', 'Xã Hương Ngải', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('333', '1013523', 'Xã Canh Nậu', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('334', '1013525', 'Xã Dị Nậu', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('335', '1013527', 'Xã Bình Yên', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('336', '1013529', 'Xã Chàng Sơn', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('337', '1013531', 'Xã Cần Kiệm', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('338', '1013533', 'Xã Phùng Xá', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('339', '1013535', 'Xã Thạch Xá', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('340', '1013537', 'Xã Bình Phú', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('341', '1013539', 'Xã Đồng Trúc', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('342', '1013541', 'Xã Yên Bình', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('343', '1013543', 'Xã Yên Trung', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('344', '1013545', 'Xã Tiến Xuân', '10135', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('345', '1013701', 'Xã Di Trạch', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('346', '1013703', 'Xã Song Phương', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('347', '1013705', 'Xã Dương Liễu', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('348', '1013707', 'Xã Kim Chung', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('349', '1013709', 'Xã Đắc Sở', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('350', '1013711', 'Xã An Khánh', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('351', '1013713', 'Xã Đông La', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('352', '1013715', 'Thị trấn Trạm Trôi', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('353', '1013717', 'Xã Đức Thượng', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('354', '1013719', 'Xã Minh Khai', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('355', '1013721', 'Xã Đức Giang', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('356', '1013723', 'Xã Cát Quế', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('357', '1013725', 'Xã Yên Sở', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('358', '1013727', 'Xã Sơn Đồng', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('359', '1013729', 'Xã Vân Canh', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('360', '1013731', 'Xã Lại Yên', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('361', '1013733', 'Xã Tiền Yên', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('362', '1013735', 'Xã An Thượng', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('363', '1013737', 'Xã Vân Côn', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('364', '1013739', 'Xã La Phù', '10137', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('365', '1013901', 'Xã Ngọc Liệp', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('366', '1013903', 'Xã Đại Thành', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('367', '1013905', 'Xã Phượng Cách', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('368', '1013907', 'Xã Thạch Thán', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('369', '1013909', 'Xã Nghĩa Hương', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('370', '1013911', 'Xã Phú Mãn', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('371', '1013913', 'Xã Đông Yên', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('372', '1013915', 'Thị trấn Quốc Oai', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('373', '1013917', 'Xã Sài Sơn', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('374', '1013919', 'Xã Yên Sơn', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('375', '1013921', 'Xã Ngọc Mỹ', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('376', '1013923', 'Xã Liệp Tuyết', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('377', '1013925', 'Xã Đồng Quang', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('378', '1013927', 'Xã Phú Cát', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('379', '1013929', 'Xã Tuyết Nghĩa', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('380', '1013931', 'Xã Cộng Hòa', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('381', '1013933', 'Xã Tân Phú', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('382', '1013935', 'Xã Cấn Hữu', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('383', '1013937', 'Xã Tân Hòa', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('384', '1013939', 'Xã Hòa Thạch', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('385', '1013941', 'Xã Đông Xuân', '10139', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('386', '1014101', 'Xã Mỹ Hưng', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('387', '1014103', 'Xã Thanh Mai', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('388', '1014105', 'Xã Cao Dương', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('389', '1014107', 'Xã Cự Khê', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('390', '1014109', 'Xã Kim An', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('391', '1014111', 'Xã Tân Ước', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('392', '1014113', 'Xã Xuân Dương', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('393', '1014115', 'Xã Cao Viên', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('394', '1014117', 'Xã Bình Minh', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('395', '1014119', 'Xã Tam Hưng', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('396', '1014121', 'Xã Thanh Cao', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('397', '1014123', 'Xã Thanh Thùy', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('398', '1014125', 'Xã Thanh Văn', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('399', '1014127', 'Xã Đỗ Động', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('400', '1014129', 'Xã Kim Thư', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('401', '1014131', 'Xã Phương Trung', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('402', '1014133', 'Xã Dân Hòa', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('403', '1014135', 'Xã Liên Châu', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('404', '1014137', 'Xã Hồng Dương', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('405', '1014139', 'Thị trấn Kim Bài', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('406', '1014141', 'Xã Bích Hòa', '10141', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('407', '1014301', 'Xã Hồng Vân', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('408', '1014303', 'Xã Quất Động', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('409', '1014305', 'Xã Vạn Điểm', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('410', '1014307', 'Xã Nhị Khê', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('411', '1014309', 'Xã Văn Bình', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('412', '1014311', 'Xã Liên Phương', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('413', '1014313', 'Xã Hà Hồi', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('414', '1014315', 'Xã Chương Dương', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('415', '1014317', 'Xã Dũng Tiến', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('416', '1014319', 'Xã Văn Tự', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('417', '1014321', 'Thị trấn Thường Tín', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('418', '1014323', 'Xã Ninh Sở', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('419', '1014325', 'Xã Duyên Thái', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('420', '1014327', 'Xã Khánh Hà', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('421', '1014329', 'Xã Hòa Bình', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('422', '1014331', 'Xã Hiền Giang', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('423', '1014333', 'Xã Vân Tảo', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('424', '1014335', 'Xã Văn Phú', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('425', '1014337', 'Xã Tự Nhiên', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('426', '1014339', 'Xã Tiền Phong', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('427', '1014341', 'Xã Thư Phú', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('428', '1014343', 'Xã Nguyễn Trãi', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('429', '1014345', 'Xã Tân Minh', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('430', '1014347', 'Xã Lê Lợi', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('431', '1014349', 'Xã Thắng Lợi', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('432', '1014351', 'Xã Thống Nhất', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('433', '1014353', 'Xã Nghiêm Xuyên', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('434', '1014355', 'Xã Tô Hiệu', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('435', '1014357', 'Xã Minh Cường', '10143', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('436', '1014501', 'Thị trấn Đại Nghĩa', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('437', '1014503', 'Xã An Tiến', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('438', '1014505', 'Xã Phúc Lâm', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('439', '1014507', 'Xã An Mỹ', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('440', '1014509', 'Xã Xuy Xá', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('441', '1014511', 'Xã Phù Lưu Tế', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('442', '1014513', 'Xã Đại Hưng', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('443', '1014515', 'Xã Vạn Kim', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('444', '1014517', 'Xã Đốc Tín', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('445', '1014519', 'Xã Hương Sơn', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('446', '1014521', 'Xã Hùng Tiến', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('447', '1014523', 'Xã Hợp Tiến', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('448', '1014525', 'Xã Hợp Thanh', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('449', '1014527', 'Xã An Phú', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('450', '1014529', 'Xã Phùng Xá', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('451', '1014531', 'Xã Đồng Tâm', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('452', '1014533', 'Xã Thượng Lâm', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('453', '1014535', 'Xã Tuy Lai', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('454', '1014537', 'Xã Mỹ Thành', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('455', '1014539', 'Xã Bột Xuyên', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('456', '1014541', 'Xã Hồng Sơn', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('457', '1014543', 'Xã Lê Thanh', '10145', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('458', '1014701', 'Xã Đông Lỗ', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('459', '1014703', 'Xã Hòa Xá', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('460', '1014705', 'Xã Sơn Công', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('461', '1014707', 'Xã Viên An', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('462', '1014709', 'Xã Trường Thịnh', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('463', '1014711', 'Xã Đồng Tiến', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('464', '1014713', 'Xã Tảo Dương Văn', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('465', '1014715', 'Xã Trầm Lộng', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('466', '1014717', 'Xã Lưu Hoàng', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('467', '1014719', 'Thị trấn Vân Đình', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('468', '1014721', 'Xã Viên Nội', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('469', '1014723', 'Xã Hoa Sơn', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('470', '1014725', 'Xã Quảng Phú Cầu', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('471', '1014727', 'Xã Cao Thành', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('472', '1014729', 'Xã Liên Bạt', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('473', '1014731', 'Xã Phương Tú', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('474', '1014733', 'Xã Trung Tú', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('475', '1014735', 'Xã Đồng Tân', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('476', '1014737', 'Xã Vạn Thái', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('477', '1014739', 'Xã Minh Đức', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('478', '1014741', 'Xã Hòa Lâm', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('479', '1014743', 'Xã Kim Đường', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('480', '1014745', 'Xã Hòa Nam', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('481', '1014747', 'Xã Hòa Phú', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('482', '1014749', 'Xã Đội Bình', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('483', '1014751', 'Xã Đại Hùng', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('484', '1014753', 'Xã Phù Lưu', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('485', '1014755', 'Xã Đại Cường', '10147', '0', '101');
INSERT INTO `ap_xaphuong` VALUES ('486', '1014757', 'Xã Hồng Quang', '10147', '0', '101');
