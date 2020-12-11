/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : chat_core

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-12-10 14:26:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_chat_conversation_1_1`
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_conversation_1_1`;
CREATE TABLE `tb_chat_conversation_1_1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'thời gian chat',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_chat_conversation_1_1_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_chat_conversation_1_1
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_chat_group`
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_group`;
CREATE TABLE `tb_chat_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL,
  `chat_info_id` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `chat_info_id` (`chat_info_id`),
  CONSTRAINT `tb_chat_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `tb_chat_group` (`id`),
  CONSTRAINT `tb_chat_group_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `tb_chat_group_ibfk_3` FOREIGN KEY (`chat_info_id`) REFERENCES `tb_chat_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_chat_group
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_chat_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_info`;
CREATE TABLE `tb_chat_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(30) DEFAULT NULL,
  `create_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'thời gian tạo nhóm',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập nhóm',
  `document` varchar(100) DEFAULT NULL,
  `library` varchar(100) DEFAULT NULL,
  `pin_id` int(10) DEFAULT NULL,
  `background_link` varchar(100) DEFAULT NULL,
  `color` varchar(10) NOT NULL DEFAULT '#fff',
  `notification` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_chat_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_users`
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên',
  `lastname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Họ và tên đệm',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tài khoản đăng nhập ',
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'mật khẩu',
  `gender` tinyint(4) NOT NULL COMMENT 'Giới tình',
  `birthday` date NOT NULL COMMENT 'Sinh nhật',
  `avatar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Link ảnh đại diện',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chuỗi xác nhận tài khoản',
  `forgot_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'chuỗi xác minh khi nhận forgot pass',
  `status` tinyint(4) NOT NULL COMMENT 'Trạng Thái, 1:hoạt động: 0 Ngừng hoạt động,2:chuyển về thùng rác',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'thời gian tạo tài khoản',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập tài khoản',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'thời gian xóa tài khoản',
  `last_login_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập tài khoản',
  `tb_groups_id` int(10) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên social',
  `oauth_uid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'uid',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `face_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên tài khoản facebook',
  `face_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Link tài khoản facebook',
  `zalo_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên tài khoản facebook',
  `zalo_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Link tài khoản facebook',
  PRIMARY KEY (`id`),
  KEY `tb_groups_id` (`tb_groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
