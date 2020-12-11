/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ckuster_core

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-09-17 10:17:12
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for `tb_products_categories`
-- ----------------------------
DROP TABLE IF EXISTS `tb_products_categories`;
CREATE TABLE `tb_products_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_products_categories
-- ----------------------------
INSERT INTO `tb_products_categories` VALUES ('1', 'Điện Thoại', null, '1', '1', '2019-08-07 16:49:24', '2019-08-07 16:49:26');
INSERT INTO `tb_products_categories` VALUES ('2', 'Tablet', null, '1', '1', '2019-07-10 16:43:00', '2019-07-10 16:43:00');
INSERT INTO `tb_products_categories` VALUES ('3', 'Phụ Kiện', null, '1', '0', '2019-07-16 22:41:00', '2019-07-16 22:41:00');
INSERT INTO `tb_products_categories` VALUES ('4', 'Điện Thoại Bàn', null, '1', '0', '2019-07-16 22:44:00', '2019-07-16 22:44:00');
INSERT INTO `tb_products_categories` VALUES ('5', 'Laptop', null, '0', '0', '2019-07-16 22:44:00', '2019-07-16 22:44:00');
INSERT INTO `tb_products_categories` VALUES ('6', 'Máy Tính Bàn', null, '0', '0', '2019-07-16 22:45:00', '2019-07-16 22:45:00');
INSERT INTO `tb_products_categories` VALUES ('7', 'Màn Hình LCD', null, '0', '0', '2019-08-07 16:50:11', '2019-08-07 16:50:13');
INSERT INTO `tb_products_categories` VALUES ('8', 'Máy In', null, '1', '1', '2019-07-19 02:09:00', '2019-07-19 02:09:00');
INSERT INTO `tb_products_categories` VALUES ('9', 'Phu Kiện Máy Tính', '1', '1', '1', '2019-07-19 02:24:00', '2019-07-19 02:24:00');
INSERT INTO `tb_products_categories` VALUES ('10', 'SamSung', '1', '1', '1', '2019-08-07 16:49:04', '2019-08-07 16:49:07');
INSERT INTO `tb_products_categories` VALUES ('11', 'Iphone', '1', '1', '1', '2019-07-19 03:00:00', '2019-07-19 03:00:00');
INSERT INTO `tb_products_categories` VALUES ('12', 'Oppo', '1', '1', '1', '2019-07-19 03:01:00', '2019-07-19 03:01:00');
INSERT INTO `tb_products_categories` VALUES ('13', 'Vsmart', '1', '1', '0', '2019-07-19 03:01:00', '2019-07-19 03:01:00');
INSERT INTO `tb_products_categories` VALUES ('14', 'Nokia', '1', '1', '1', '2019-07-19 03:02:00', '2019-07-19 03:02:00');
INSERT INTO `tb_products_categories` VALUES ('15', 'Realme', '1', '1', '1', '2019-08-07 16:50:37', '2019-08-07 16:50:38');
INSERT INTO `tb_products_categories` VALUES ('16', 'Vivo', '1', '1', '1', '2019-07-19 03:02:00', '2019-07-19 03:02:00');
INSERT INTO `tb_products_categories` VALUES ('17', 'Huawei', '1', '1', '0', '2019-07-23 09:56:12', '2019-07-23 09:56:12');
INSERT INTO `tb_products_categories` VALUES ('18', 'Xiaomi', '1', '1', '0', '2020-09-17 09:52:02', '2020-09-17 09:52:02');
INSERT INTO `tb_products_categories` VALUES ('19', 'Điện Thoại Hai Sim', '1', '1', null, '2020-09-17 09:52:18', '2020-09-17 09:52:18');
INSERT INTO `tb_products_categories` VALUES ('20', 'Màn Hình Tràn viền', '1', '1', null, '2020-09-17 09:52:26', '2020-09-17 09:52:26');
INSERT INTO `tb_products_categories` VALUES ('21', 'Camera kép', '1', '1', null, '2020-09-17 09:52:45', '2020-09-17 09:52:45');
INSERT INTO `tb_products_categories` VALUES ('22', 'Ipad', '2', '1', null, '2020-09-17 09:53:30', '2020-09-17 09:53:30');
INSERT INTO `tb_products_categories` VALUES ('23', 'SamSung', '2', '1', null, '2020-09-17 09:53:35', '2020-09-17 09:53:35');
INSERT INTO `tb_products_categories` VALUES ('24', 'lenovo', '2', '1', null, '2020-09-17 09:53:43', '2020-09-17 09:53:43');
INSERT INTO `tb_products_categories` VALUES ('25', 'Huawei', '2', '1', null, '2020-09-17 09:53:51', '2020-09-17 09:53:51');
INSERT INTO `tb_products_categories` VALUES ('26', 'Acer', '2', '1', null, '2020-09-17 09:54:02', '2020-09-17 09:54:02');
INSERT INTO `tb_products_categories` VALUES ('27', 'Apple Watch', '3', '1', null, '2020-09-17 09:54:27', '2020-09-17 09:54:27');
INSERT INTO `tb_products_categories` VALUES ('28', 'AirPods', '3', '1', null, '2020-09-17 09:54:44', '2020-09-17 09:54:44');
INSERT INTO `tb_products_categories` VALUES ('29', 'Đồng Hồ thông minh', '3', '1', null, '2020-09-17 09:54:58', '2020-09-17 09:54:58');
INSERT INTO `tb_products_categories` VALUES ('30', 'Củ sạc', '3', '1', null, '2020-09-17 09:55:08', '2020-09-17 09:55:08');

-- ----------------------------
-- Table structure for `tb_configs`
-- ----------------------------
DROP TABLE IF EXISTS `tb_configs`;
CREATE TABLE `tb_configs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_id` int(10) DEFAULT NULL COMMENT 'Tham chiếu từ bảng tb_users',
  `updated_id` int(10) DEFAULT NULL COMMENT 'Tham chiếu từ bảng tb_users',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tb_configs_ibfk_2` (`updated_id`) USING BTREE,
  KEY `tb_configs_ibfk_1` (`created_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_configs
-- ----------------------------
INSERT INTO `tb_configs` VALUES ('5', '.system.show.header', '1', 'hiển thị header', 'hien thi header', '', '29', null, '2019-07-23 00:47:00', '2019-07-23 00:47:00');
INSERT INTO `tb_configs` VALUES ('6', '.system.show.footer', '1', 'hiển thị footer', 'hien thi footer', '', '28', null, '2019-07-23 13:36:50', '2019-07-23 13:36:50');
INSERT INTO `tb_configs` VALUES ('7', '.system.phone', '2', 'số điện thoại', '0964589904', '0964589904', '28', null, '2019-07-25 14:38:37', '2019-07-25 14:38:37');

-- ----------------------------
-- Table structure for `tb_groups`
-- ----------------------------
DROP TABLE IF EXISTS `tb_groups`;
CREATE TABLE `tb_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên của Group (Admin, Nhân viên bán hàng , Nhân viên Nhập Kho , Giám đốc ...)',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mô tả chức năng từng nhóm và quyền hạn được cấp',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_groups
-- ----------------------------
INSERT INTO `tb_groups` VALUES ('3', 'Giám đốc', 'Giám sát ', '2019-07-11 09:01:00', '2019-07-11 09:01:00');
INSERT INTO `tb_groups` VALUES ('4', 'Người quản lí hệ thống', 'Quản lí', '2019-07-11 17:18:00', '2019-07-11 17:18:00');
INSERT INTO `tb_groups` VALUES ('5', 'Người đăng bài ', 'Đăng các bài viết', '2019-07-11 17:21:00', '2019-07-11 17:21:00');
INSERT INTO `tb_groups` VALUES ('6', 'Khách hàng', 'Các quyền dành riêng cho khách hàng', '2019-07-11 17:21:00', '2019-07-11 17:21:00');
INSERT INTO `tb_groups` VALUES ('7', 'Nhân viên hỗ trợ', 'Nhân viên hỗ trợ chăm sóc khách hàng cấp 1', '2019-07-11 17:22:00', '2019-07-11 17:22:00');
INSERT INTO `tb_groups` VALUES ('8', 'Thành viên đăng kí', 'Các quyền cho thành viên đăng ký cấp 1', '2019-07-11 17:24:00', '2019-07-11 17:24:00');

-- ----------------------------
-- Table structure for `tb_list_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `tb_list_permissions`;
CREATE TABLE `tb_list_permissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên quyền được phép truy nhập',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mô tả cụ thể các chức năng của quyền đó',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_list_permissions
-- ----------------------------
INSERT INTO `tb_list_permissions` VALUES ('3', 'post.can_edit_news', 'Có thể sửa Bài viết');
INSERT INTO `tb_list_permissions` VALUES ('4', 'post.can_view_list_post_video ', 'Có thể xem danh sách Bài viết');
INSERT INTO `tb_list_permissions` VALUES ('5', 'post.can_view_uploads_news ', 'Có thể xem Bài viết');
INSERT INTO `tb_list_permissions` VALUES ('36', 'post.can_delete_list_post_video', 'Có thể xóa bài viết');
INSERT INTO `tb_list_permissions` VALUES ('38', 'can_add_roles_keys', 'có thể thêm phân quyền');
INSERT INTO `tb_list_permissions` VALUES ('39', 'can_edit_roles_keys', 'Có thể chỉnh sửa phân quyền');
INSERT INTO `tb_list_permissions` VALUES ('40', 'can_view_roles_keys', 'Có thể xem phân quyền');
INSERT INTO `tb_list_permissions` VALUES ('41', 'can_delete_roles_keys', 'Có thể xóa phân quyền');

-- ----------------------------
-- Table structure for `tb_orders`
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders`;
CREATE TABLE `tb_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) DEFAULT NULL COMMENT 'id của người mua hàng',
  `delivery_at` datetime NOT NULL COMMENT 'thời gian mua hàng',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'Trang thái đơn hàng (chờ xử lí , giao hàng , nhận hàng , xác nhận , đánh giá sản phẩm )',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Địa chỉ',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_recipient` int(10) NOT NULL COMMENT 'số điện thoại người nhận',
  `name_recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên người nhập ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Thời gian đặt hàng',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_cost` int(10) DEFAULT NULL,
  `type_ship` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_orders
-- ----------------------------
INSERT INTO `tb_orders` VALUES ('1', '33', '2019-07-17 09:34:00', '1000', '10', 'Ha Dong', 'thu@gmail.com', '904401250', 'Tam Anh', '2019-07-17 16:34:00', '2019-07-17 16:34:00', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('2', '30', '2019-07-25 19:24:00', '1011', '10', '3A, Duy Tân', 'hai@gmail.com', '904401250', 'Tú', '2019-07-25 19:25:00', '2019-07-25 19:25:00', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('3', '23', '2019-07-17 10:25:00', '1002', '10', 'Thanh Xuân', 'ba@gmail.com', '457263132', 'tam', '2019-07-17 10:24:00', '2019-07-17 10:24:00', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('5', '30', '2019-07-19 09:32:18', '1003', '10', 'Duy Tân ', 'nam@gmail.com', '904401250', 'anh', '2019-07-19 09:32:22', '2019-07-19 09:32:22', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('6', '27', '2019-07-19 14:20:00', '1001', '10', 'Lala land', 'tam@gmail.com', '904401250', 'Hoa', '2019-07-19 14:20:00', '2019-07-19 14:20:00', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('8', '21', '2019-07-19 15:48:00', '1006', '9', 'Long Biên', 'tu@gmail.com', '904401250', 'Hoa', '2019-07-19 22:48:00', '2019-07-19 22:48:00', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('9', '23', '2019-07-19 15:56:00', '1004', '10', 'Cau Giay', 'ngu@gmail.com', '904401250', 'tam', '2019-07-19 22:56:00', '2019-07-19 22:56:00', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('10', '40', '0000-00-00 00:00:00', '1005', '0', 'Thanh Xuân Ha Noi', 'luc@gmail.com', '904401250', 'Linh', '2019-08-05 17:51:07', '2019-08-05 17:51:07', null, null, '0');
INSERT INTO `tb_orders` VALUES ('22', '30', '2019-07-29 13:14:00', '1212', '10', 'HN', 'con@gmail.com', '904401250', 'Nguyễn', '2019-07-22 14:34:00', '2019-07-22 14:34:00', '', '0', '0');
INSERT INTO `tb_orders` VALUES ('23', '33', '2019-07-25 17:28:00', '1009', '10', 'Cau Giay', 'kia@gmail.com', '457263132', 'Linh', '2019-07-26 00:28:00', '2019-07-26 00:28:00', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('24', '27', '2019-07-25 17:23:00', '1005', '10', 'Văn Quán, Hà Đông', 'moter@gmail.com', '904401250', 'Thái', '2019-07-25 19:22:00', '2019-07-25 19:22:00', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('25', '33', '2019-07-29 09:54:00', '1010', '10', 'Văn Phú', 'vespa@gmail.com', '904401250', 'Hoa', '2019-07-29 09:54:00', '2019-07-29 09:54:00', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('26', '21', '2019-07-29 09:59:00', '1997', '10', 'Thanh Xuân', 'vin@gmail.com', '904401250', 'Linh', '2019-07-29 16:59:00', '2019-07-29 16:59:00', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('30', '21', '2019-07-29 11:20:00', '1021', '10', 'Ha Dong', 'center@gmail.com', '904401250', 'tâm', '2019-07-29 18:20:00', '2019-07-29 18:20:00', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('31', '22', '2019-07-29 11:27:00', '1022', '10', 'Japan', 'hoem@gmail.com', '904401250', 'Linh', '2019-07-29 18:27:00', '2019-07-29 18:27:00', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('32', '25', '2019-08-05 11:08:16', '2019-08-05', '1', 'ha noi', 'kus@gmail.com', '904401250', 'sam sam', '2019-07-31 11:29:13', '2019-07-31 11:29:13', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('33', '21', '2019-08-05 11:08:59', '2019-08-05', '1', 'ha noi', 'cute@gmail.com', '904401250', 'Linh', '2019-07-31 11:29:56', '2019-07-31 11:29:56', '', '0', '1');
INSERT INTO `tb_orders` VALUES ('65', '23', '2019-08-05 16:08:58', '2019-08-05', '1', 'ha noi', 'han.ngothu@gmail.com', '904401250', 'Linh', '2019-07-31 16:44:55', '2019-07-31 16:44:55', '', '44', '1');
INSERT INTO `tb_orders` VALUES ('66', '24', '2019-08-05 17:08:01', '2019-08-05', '1', 'Ha Dong', 'tam', '904401250', 'sam sam', '2019-07-31 17:44:57', '2019-07-31 17:44:57', '', '615', '1');
INSERT INTO `tb_orders` VALUES ('71', '35', '2019-08-01 14:46:39', '1035', '10', 'Từ Liêm', 'taptit@gmail.com', '457263132', 'Linh', '2019-08-01 14:47:07', '2019-08-01 14:47:07', null, null, '2');
INSERT INTO `tb_orders` VALUES ('72', '36', '2019-08-01 14:47:48', '1036', '10', 'Chương Mỹ', null, '457263132', 'Hoa', '2019-08-01 14:47:43', '2019-08-01 14:47:43', null, null, '2');
INSERT INTO `tb_orders` VALUES ('73', '29', '2019-08-01 14:50:00', '1037', '10', 'Gia Lâm', null, '457263132', 'Lâm', '2019-08-01 21:50:00', '2019-08-01 21:50:00', null, null, '2');
INSERT INTO `tb_orders` VALUES ('74', '29', '2019-08-01 15:00:00', '1032', '10', 'Đông Anh', null, '457263132', 'Anh', '2019-08-01 22:00:00', '2019-08-01 22:00:00', null, null, '2');
INSERT INTO `tb_orders` VALUES ('75', '29', '2019-08-01 15:06:00', '1025', '10', 'Thanh Trì', null, '457263132', 'Trì', '2019-08-01 22:06:00', '2019-08-01 22:06:00', null, null, '2');
INSERT INTO `tb_orders` VALUES ('76', '29', '2019-08-01 15:09:00', '1029', '10', 'Hoàng Mai', null, '457263132', 'mai', '2019-08-01 22:09:00', '2019-08-01 22:09:00', null, null, '2');
INSERT INTO `tb_orders` VALUES ('77', '30', '2019-08-01 15:15:00', '1036', '1', 'Thanh Hóa', null, '457263132', 'Hóa', '2019-08-01 22:15:00', '2019-08-01 22:15:00', null, null, '1');
INSERT INTO `tb_orders` VALUES ('78', '39', '2019-08-01 15:30:00', '1039', '10', 'Quế', null, '457263132', 'Linh', '2019-08-01 22:30:00', '2019-08-01 22:30:00', null, null, '2');
INSERT INTO `tb_orders` VALUES ('79', '40', '2019-08-01 15:31:00', '1040', '9', 'Điện Biên Phủ', null, '457263132', 'Bình', '2019-08-01 22:31:00', '2019-08-01 22:31:00', null, null, '2');
INSERT INTO `tb_orders` VALUES ('80', '33', '2019-08-01 15:32:00', '1033', '10', 'Thái Bình', null, '33334572', 'Ba', '2019-08-01 22:32:00', '2019-08-01 22:32:00', null, null, '2');
INSERT INTO `tb_orders` VALUES ('81', '21', '2019-08-07 15:08:00', '2019-08-07', '1', 'Nam Dinh', 'han.ngothu@gmail.com', '457263132', 'Sam San', '2019-08-02 15:15:56', '2019-08-02 15:15:56', 'dsad', '22', '2');
INSERT INTO `tb_orders` VALUES ('82', '25', '2019-08-07 15:08:00', '2019-08-07', '1', 'Quang Ninh', 'han.ngothu@gmail.com', '457263132', 'Linh', '2019-08-02 15:17:56', '2019-08-02 15:17:56', 'dsad', '22', '2');
INSERT INTO `tb_orders` VALUES ('83', '24', '2019-08-07 15:08:17', '2019-08-07', '1', 'Thanh Hoa', 'han.ngothu@gmail.com', '457263132', 'Linh', '2019-08-02 15:18:13', '2019-08-02 15:18:13', 'dsad', '22', '0');
INSERT INTO `tb_orders` VALUES ('84', '23', '2019-08-07 15:08:31', '2019-08-07', '1', 'Chuong Duong', 'han.ngothu@gmail.com', '457263132', 'Sam San', '2019-08-02 15:18:27', '2019-08-02 15:18:27', 'dsad', '22', '0');
INSERT INTO `tb_orders` VALUES ('85', null, '2019-08-07 15:08:49', '2019-08-07', '1', 'Vu Han', 'han.ngothu@gmail.com', '457263132', 'Linh', '2019-08-02 15:18:45', '2019-08-02 15:18:45', 'dsad', '22', '0');
INSERT INTO `tb_orders` VALUES ('86', null, '2019-08-07 15:08:19', '2019-08-07', '1', 'Bac Kinh', 'han.ngothu@gmail.com', '457263132', 'Sam San', '2019-08-02 15:21:15', '2019-08-02 15:21:15', '', '22', '0');
INSERT INTO `tb_orders` VALUES ('87', null, '2019-08-07 15:08:41', '2019-08-07', '1', 'New York', 'han.ngothu@gmail.com', '457263132', 'Linh', '2019-08-02 15:24:37', '2019-08-02 15:24:37', '', '11', '0');
INSERT INTO `tb_orders` VALUES ('88', null, '2019-08-07 15:08:06', '2019-08-07', '1', 'Home', 'duc@gmail.com', '457263132', 'Kim Nguyễn', '2019-08-02 15:42:02', '2019-08-02 15:42:02', '', '11', '0');
INSERT INTO `tb_orders` VALUES ('89', '23', '2019-08-06 10:23:00', '4151215', '0', 'Xuân Thủy', 'nam@gmaill.com', '457263132', 'Thủy ', '2019-08-06 16:29:00', '2019-08-06 16:29:00', null, null, '0');
INSERT INTO `tb_orders` VALUES ('90', '21', '2019-08-08 08:09:00', '451234', '2', 'Xuân Thủy', 'viet@gmail.com', '282845724', 'Tám', '2019-08-06 10:44:53', '2019-08-06 10:44:53', null, null, '0');
INSERT INTO `tb_orders` VALUES ('91', '24', '2019-08-11 10:08:46', '2019-08-11', '1', 'Duong That', 'duc@gmail.com', '457263132', 'Kim Nguyễn', '2019-08-06 10:48:40', '2019-08-06 10:48:40', 'gfd', '700', '0');
INSERT INTO `tb_orders` VALUES ('92', '24', '2019-08-11 10:08:23', '2019-08-11', '1', 'Kien Xuong', 'duc@gmail.com', '457263132', 'Kim Nguyễn', '2019-08-06 10:50:17', '2019-08-06 10:50:17', '', '180', '0');
INSERT INTO `tb_orders` VALUES ('93', '20', '2019-08-09 10:09:00', '1561134', '9', 'Long Biên', 'nam@gmail.com', '373745726', 'Linh', '2019-08-06 11:13:00', '2019-08-06 11:13:00', null, null, '0');
INSERT INTO `tb_orders` VALUES ('94', null, '2019-08-12 17:08:10', '2019-08-12', '1', 'ha noi', 'han.ngothu@gmail.com', '457263132', 'Linh', '2019-08-07 17:08:04', '2019-08-07 17:08:04', 's', '218', '0');
INSERT INTO `tb_orders` VALUES ('95', null, '2019-08-12 17:08:36', '2019-08-12', '1', 'Trung Kính', 'han.ngothu@gmail.com', '457263132', 'Linh', '2019-08-07 17:08:30', '2019-08-07 17:08:30', 's', '218', '0');
INSERT INTO `tb_orders` VALUES ('96', null, '2019-08-12 17:08:43', '2019-08-12', '1', 'Mễ Trì Hạ', 'han.ngothu@gmail.com', '457263132', 'Linh', '2019-08-07 17:08:37', '2019-08-07 17:08:37', 's', '218', '0');
INSERT INTO `tb_orders` VALUES ('97', '28', '2019-08-14 15:08:46', '2019-08-14', '1', 'Xuân Thủy', 'tamptit2016@gmail.com', '457263132', 'Tâm Anh Hoàng', '2019-08-09 15:10:37', '2019-08-09 15:10:37', 'thử thật', '53', '0');

-- ----------------------------
-- Table structure for `tb_orders_products`
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders_products`;
CREATE TABLE `tb_orders_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tb_orders_id` int(10) NOT NULL,
  `tb_products_id` int(10) NOT NULL,
  `price` int(10) DEFAULT NULL COMMENT 'giá sản phẩm',
  `quantity` int(10) DEFAULT NULL COMMENT 'số lượng sản phẩm',
  `tb_products_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price_entered` int(10) DEFAULT NULL COMMENT 'Giá tại lúc đã nhập ',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_orders_id` (`tb_orders_id`),
  KEY `tb_products_id` (`tb_products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_orders_products
-- ----------------------------
INSERT INTO `tb_orders_products` VALUES ('1', '1', '14', '1000', '109', 'thừa còn sai :3', '10', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('2', '1', '17', '100', '444', 'sai rrrr', '10', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('3', '1', '44', '10000002', '1', 'your name', '10', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('4', '2', '80', '100', '3', 'sp1', '10', '/tb_products/order-2');
INSERT INTO `tb_orders_products` VALUES ('5', '2', '81', '100', '5', 'sp1', '10', '/tb_products/order-2');
INSERT INTO `tb_orders_products` VALUES ('6', '3', '69', '100', '2', 'sp3', '10', '/tb_products/order-3');
INSERT INTO `tb_orders_products` VALUES ('7', '5', '18', '111', '111', 'không set Text như này', '100', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('8', '6', '19', '100', '10', 'sp6', '50', '/tb_products/order-6');
INSERT INTO `tb_orders_products` VALUES ('9', '8', '19', '100', '100', 'sản phẩm 19', '90', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('10', '9', '37', '100', '100', 'sp 37', '80', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('11', '10', '55', '20', '2', 'sp10', '0', '/tb_products/order-10');
INSERT INTO `tb_orders_products` VALUES ('12', '22', '17', '200', '2', 'sp22 pr 17', '5', '/tb_products/17');
INSERT INTO `tb_orders_products` VALUES ('13', '22', '69', '200', '2', 'sp22 pr69', '10', '/tb_products/order-22');
INSERT INTO `tb_orders_products` VALUES ('14', '23', '61', '500', '5', 'sp23', '10', '/tb_products/order-23');
INSERT INTO `tb_orders_products` VALUES ('15', '24', '44', '12000', '2', 'sp24 pr 44', '70', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('16', '25', '44', '120000', '1', 'kkk', '100', '/uploads/day-chuyen-1.jpg');
INSERT INTO `tb_orders_products` VALUES ('17', '26', '65', '600', '10', 'sp26 pr65', '10', '/tb_products/order-26');
INSERT INTO `tb_orders_products` VALUES ('18', '30', '14', '200', '10', 'sp30 pr14', '50', '/tb_products/14');
INSERT INTO `tb_orders_products` VALUES ('19', '31', '44', '300', '30', 'sp31 pr44', '10', '/tb_products/order-31');
INSERT INTO `tb_orders_products` VALUES ('20', '32', '37', '400', '5', 'sp32 pr37', '20', '/tb_products/order-32');
INSERT INTO `tb_orders_products` VALUES ('21', '33', '37', '400', '5', 'sp32 pr37', '20', '/tb_products/order-37');
INSERT INTO `tb_orders_products` VALUES ('22', '65', '53', '6500', '2', 'sp65 pr53', '10', '/tb_products/order-65');
INSERT INTO `tb_orders_products` VALUES ('23', '66', '55', '25000', '4', 'sp66 pr55', '10', '/tb_products/order-66');
INSERT INTO `tb_orders_products` VALUES ('24', '81', '54', '100', '1', 'sp81 pr54', '20', '/tb_products/54');
INSERT INTO `tb_orders_products` VALUES ('25', '84', '54', '100', '1', 'test chon file', '30', '/tb_products/54');
INSERT INTO `tb_orders_products` VALUES ('26', '85', '54', '100', '1', 'test chon file', '40', '/tb_products/54');
INSERT INTO `tb_orders_products` VALUES ('27', '86', '54', '100', '1', 'test chon file', '10', '/tb_products/54');
INSERT INTO `tb_orders_products` VALUES ('28', '87', '53', '100', '1', 'test chon file', '10', '/tb_products/53');
INSERT INTO `tb_orders_products` VALUES ('29', '88', '54', '100', '1', 'test chon file', '10', '/tb_products/54');
INSERT INTO `tb_orders_products` VALUES ('30', '91', '54', '500000', '10', 'test chon file', '10', '/tb_products/54');
INSERT INTO `tb_orders_products` VALUES ('31', '92', '53', '10000000', '2', 'test chon file', '5', '/tb_products/53');
INSERT INTO `tb_orders_products` VALUES ('32', '96', '85', '13', '16', 'Product chưa có ảnh thì sao', '500', '/tb_products/85');
INSERT INTO `tb_orders_products` VALUES ('33', '97', '19', '40', '1', 'rrr', '4', '/tb_products/19');
INSERT INTO `tb_orders_products` VALUES ('34', '97', '85', '13', '1', 'Product chưa có ảnh thì sao', '500', '/tb_products/85');

DROP TABLE IF EXISTS `tb_pages_categories`;
CREATE TABLE `tb_pages_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `tb_pages`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pages`;
CREATE TABLE `tb_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pages_categories_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề trang',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh mô tả bài viết',
  `shortContent` mediumtext  COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung mô tả trang',
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nội dung của trang',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trang thái bài viết',
  `users_id` int(10) DEFAULT NULL COMMENT 'id người viết bài',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian tạo bài viết',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập bài viết',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link',
  `count_views` int(10) DEFAULT 0 COMMENT 'Lượt xem của trang',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` tinyint(4) DEFAULT 0 COMMENT 'Ngôn ngữ ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `tb_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `tb_permissions`;
CREATE TABLE `tb_permissions` (
  `list_permissions_id` int(10) NOT NULL COMMENT 'lấy 2 khóa chính của 2 bảng phân quyền và group để tạo khóa chính',
  `groups_id` int(10) NOT NULL COMMENT 'lấy 2 khóa chính của 2 bảng phân quyền và group để tạo khóa chính',
  `value` tinyint(4) NOT NULL COMMENT '1: được cấp quyền ,0 : không được cấp quyền',
  KEY `list_permissions_id` (`list_permissions_id`),
  KEY `groups_id` (`groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_permissions
-- ----------------------------
INSERT INTO `tb_permissions` VALUES ('40', '3', '1');
INSERT INTO `tb_permissions` VALUES ('41', '3', '1');
INSERT INTO `tb_permissions` VALUES ('38', '3', '1');
INSERT INTO `tb_permissions` VALUES ('39', '3', '1');

-- ----------------------------
-- Table structure for `tb_products`
-- ----------------------------
DROP TABLE IF EXISTS `tb_products`;
CREATE TABLE `tb_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên sản phẩm',
  `price_sale` int(10) NOT NULL COMMENT 'Giá bán ra',
  `price_entered` int(10) NOT NULL COMMENT 'Giá nhập vào',
  `price_commercial` int(10) DEFAULT NULL,
  `quantity` int(10) NOT NULL COMMENT 'số lượng tồn kho',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Miểu tả ',
  `products_categories_id` int(10) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link ',
  `count_views` int(10) DEFAULT NULL COMMENT 'Số lượt xem sản phẩm',
  `status` tinyint(4) DEFAULT NULL COMMENT 'Hiển thị chức năng là đã xóa hay chưa',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `products_categories_id` (`products_categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_products
-- ----------------------------
INSERT INTO `tb_products` VALUES ('14', 'vòng', '150000', '200', '10', '99', '/uploads/day-chuyen-1-100x100.jpg', '<p>Test conflict V&ograve;ng nữ</p>', '5', 'vong', '101', '1', '2019-07-17 17:45:00', '2019-07-17 17:45:00');
INSERT INTO `tb_products` VALUES ('17', 'edit không phải chọn lại ảnh', '150000', '600', '10', '66', '/uploads/ring-1-300x300.jpg', '<p>test img ship</p>', '2', 'ab7', '1', '1', '2024-07-17 18:15:00', '2024-07-17 18:15:00');
INSERT INTO `tb_products` VALUES ('18', 'X99', '150000', '2', '20', '22', '/uploads/earring-2.jpg', '<p style=\"text-align: justify;\">test tiny<br /><em>italic</em></p>\r\n<p style=\"text-align: justify;\"><strong>Bold</strong></p>', '6', 'x99', '2', '1', '2019-07-18 16:02:55', '2019-07-18 16:02:00');
INSERT INTO `tb_products` VALUES ('19', 'Main board', '150000', '4', '40', '4', '/uploads/day-chuyen-2-100x100.jpg', '<p>test edit</p>', '4', 'rrr', '4', '1', '2019-07-18 16:48:24', '2019-07-18 16:48:00');
INSERT INTO `tb_products` VALUES ('37', 'edit không phải chọn lại ảnh', '150000', '34', '10', '1', '/uploads/ring-5-300x300.jpg', '<p>t&ocirc;i th&iacute;ch bạn.. test conflict</p>', '5', 'test-tiny', '1', '1', '2019-07-23 22:51:00', '2019-07-23 22:51:00');
INSERT INTO `tb_products` VALUES ('44', 'H110', '150000', '123', '10', '1', '/uploads/ring-1-300x300.jpg', '<p>test editor 5:15</p>', '5', 'test', '1', '1', '2019-07-25 00:15:00', '2019-07-25 00:15:00');
INSERT INTO `tb_products` VALUES ('53', 'test Mac', '150000', '11', '90', '11', '/uploads/ring-3-300x300.jpg', '<p>test chon file</p>', '3', 'test-chon', '11', '2', '2019-07-29 22:24:00', '2019-07-29 22:24:00');
INSERT INTO `tb_products` VALUES ('54', 'test chon file', '150000', '11', '100', '11', '/uploads/ring-5-300x300.jpg', '<p>test chon file</p>', '3', 'abc', '11', '2', '2019-07-29 22:24:00', '2019-07-29 22:24:00');
INSERT INTO `tb_products` VALUES ('55', 'H110', '150000', '12', '70', '12', '/uploads/ring-3-100x100.jpg', '<p>test chon file ring-5.jpg</p>', '5', 'abe', '12', '3', '2019-07-29 22:26:00', '2019-07-29 22:26:00');
INSERT INTO `tb_products` VALUES ('57', 'test chon file', '150000', '11', '50', '11', '/uploads/day-chuyen-2-100x100.jpg', '<p>test chon file</p>', '2', 'fi', '11', '5', '2019-07-29 22:43:00', '2019-07-29 22:43:00');
INSERT INTO `tb_products` VALUES ('58', 'test Mac', '150000', '11', '50', '11', '/uploads/day-chuyen-1.jpg', '<p>test add sp co chon file</p>', '5', 'mac', '11', '4', '2019-07-29 23:07:00', '2019-07-29 23:07:00');
INSERT INTO `tb_products` VALUES ('59', 'H81', '150000', '123', '0', '1', '/uploads/ring-3.jpg', '<p>them chon file cho add sp.. ring 3</p>', '2', 'add', '1', '4', '2019-07-29 23:12:00', '2019-07-29 23:12:00');
INSERT INTO `tb_products` VALUES ('61', 'tesst fix conflict', '150000', '123', '0', '1', '/uploads/ring-5.jpg', '<p>test danh mục select</p>', '2', 'danh', '1', '1', '2019-07-29 23:56:00', '2019-07-29 23:56:00');
INSERT INTO `tb_products` VALUES ('63', 'test validation slug trùng', '150000', '123', '0', '123', '/uploads/logo.png', '<p>tesst confilct</p>', '1', 'slug', '123', '1', '2019-07-30 23:30:00', '2019-07-30 16:31:19');
INSERT INTO `tb_products` VALUES ('65', 'test validation', '150000', '1', '0', '123', '/uploads/ring-4-100x100.jpg', '<p>test validation</p>', '17', 'z1', '1', '1', '2019-07-31 00:49:00', '2019-07-30 17:52:00');
INSERT INTO `tb_products` VALUES ('66', 'test validation slug trùng', '150000', '1', '0', '123', '/uploads/ring-3-300x300.jpg', '<p>test validation... slug tr&ugrave;ng</p>', '17', 'z2', '1', '1', '2019-07-31 00:49:00', '2019-07-30 17:53:00');
INSERT INTO `tb_products` VALUES ('67', 'test chon file', '150000', '1230000', '0', '1', '/uploads/day-chuyen-1.jpg', 'test', '3', 'slug-co-tam', '789', '1', '2019-07-31 17:47:00', '2019-07-31 10:50:10');
INSERT INTO `tb_products` VALUES ('68', 'H110', '150000', '123', '0', '1', '/uploads/day-chuyen-1.jpg', 'mm', '2', 'oke', '1', '1', '2019-07-31 18:02:00', '2019-07-31 11:03:08');
INSERT INTO `tb_products` VALUES ('69', 'Mac2017', '150000', '123', '0', '123', '/uploads/day-chuyen-2.jpg', 'ax', '2', 'anh-abdx-safa', '1', '1', '2019-07-31 18:08:00', '2019-07-31 11:10:54');
INSERT INTO `tb_products` VALUES ('70', 'Dây chuyền', '150000', '12', '0', '12', '/uploads/day-chuyen-2.jpg', 'day chuyen', '5', 'day-chuyen', '12', '4', '2019-08-01 21:52:00', '2019-08-01 14:53:23');
INSERT INTO `tb_products` VALUES ('71', 'earriing blue', '150000', '11', '0', '11', '/uploads/earring-3.jpg', 'earring blue\r\n- blue\r\n- yellow', '1', 'earriing-blue', '11', '1', '2019-08-01 21:54:00', '2019-08-01 14:56:41');
INSERT INTO `tb_products` VALUES ('72', 'bông tai xanh ', '150000', '11', '0', '11', '/uploads/earring-3.jpg', 'bông tai', '5', 'earring-blue', '11', '3', '2019-08-01 21:57:00', '2019-08-01 14:57:47');
INSERT INTO `tb_products` VALUES ('73', 'Bông Tai xanh ngọc', '150000', '89', '0', '89', '/uploads/earring-4.jpg', 'xanh ngọc', '5', 'earring-04', '89', '4', '2019-08-01 21:58:00', '2019-08-01 14:59:12');
INSERT INTO `tb_products` VALUES ('74', 'Ví đỏ', '150000', '33', '0', '33', '/uploads/ring-5-300x300.jpg', 'ví da nữ, màu đỏ tươi', '5', 'cate-1', '33', '2', '2019-08-01 22:04:00', '2019-08-01 15:05:00');
INSERT INTO `tb_products` VALUES ('75', 'check lại add', '150000', '123', '0', '1', '/uploads/day-chuyen-1.jpg', 'check lại add', '1', 'check-lai-add', '1', '1', '2019-08-02 17:43:00', '2019-08-02 10:44:33');
INSERT INTO `tb_products` VALUES ('76', 'bông tai xanh ', '150000', '123', '0', '123', '/uploads/day-chuyen-1.jpg', 'check action add, chọn file ', '1', 'check-add-file', '1', '1', '2019-08-02 17:46:00', '2019-08-02 10:47:55');
INSERT INTO `tb_products` VALUES ('77', 'check action add', '150000', '123', '1', '1', '/uploads/day-chuyen-1.jpg', 'check uploads đã có ảnh này', '9', 'check-action-add', '123', '1', '2019-08-02 17:52:00', '2019-08-02 10:53:00');
INSERT INTO `tb_products` VALUES ('78', 'test không chọn danh muc', '150000', '123', '0', '123', '/uploads/day-chuyen-1.jpg', 'test không chọn danh muc', '1', 'test-khong-chon-danh-muc', '123', '1', '2019-08-02 17:56:00', '2019-08-02 10:57:04');
INSERT INTO `tb_products` VALUES ('79', 'bông tai xanh ', '150000', '123', '0', '123', '/uploads/ship.png', 'cau', '2', 'a-b-c', '123', '1', '2019-08-02 18:08:00', '2019-08-02 11:10:06');
INSERT INTO `tb_products` VALUES ('80', 'Dell PC', '150000', '123', '0', '123', '/uploads/tam.jpg', 'acc', '2', 'acc-1', '123', '1', '2019-08-02 18:23:00', '2019-08-02 11:25:14');
INSERT INTO `tb_products` VALUES ('81', 'bông tai xanh ', '150000', '123', '0', '123', '/uploads/tam.jpg', 'tesst add ko danh muc', '2', 'add-1', '123', '1', '2019-08-02 20:13:00', '2019-08-02 13:15:25');
INSERT INTO `tb_products` VALUES ('82', 'Dell PC', '150000', '123', '0', '123', '/uploads/rsz_tam.jpg', 'add', '2', 'add-2', '123', '1', '2019-08-02 20:27:00', '2019-08-02 13:28:23');
INSERT INTO `tb_products` VALUES ('83', 'bông tai xanh ', '150000', '123', '0', '123', '/uploads/BlackWhite.jpg', 'nhap', '1', 'g-h', '123', '5', '2019-08-02 22:58:00', '2019-08-02 16:10:54');
INSERT INTO `tb_products` VALUES ('84', 'laptop', '150000', '1200', '5', '23', '/uploads/ring-2-300x300.jpg', 'mô tả', '3', 'abcdgfgs', '234', '5', '2019-08-02 23:20:00', '2019-08-02 16:21:00');
INSERT INTO `tb_products` VALUES ('85', 'Product chưa có ảnh thì sao', '150000', '500', '13', '10', '/uploads/ring-3-300x300.jpg', 'test edit ảnh', '8', 'product-chua-co-anh', '10', '3', '2019-08-07 00:33:00', '2019-08-06 17:34:00');
INSERT INTO `tb_products` VALUES ('86', 'Dell PC', '150000', '2000', '15', '200', '/uploads/ring-4-300x300.jpg', 'test add ', '3', 'dell-pc-2019', '2000', '4', '2019-08-07 00:39:00', '2019-08-06 17:40:00');
INSERT INTO `tb_products` VALUES ('87', 'test created_at', '150000', '700', '20', '1', '/uploads/ring-3-300x300.jpg', 'test bỏ created, lưu db', '16', 'tieu-dung', '1', '1', '2019-08-07 10:42:46', '2019-08-07 10:42:00');
INSERT INTO `tb_products` VALUES ('88', 'Vòng Co thu nhat', '150000', '200000', '100000', '10', '/uploads/day-chuyen-1-100x100.jpg', 'Noi dung mo ta', '5', null, '100', '1', '2020-09-16 12:00:47', '2020-09-16 12:00:47');

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
  -- social info
  `oauth_provider` varchar(50) DEFAULT NULL COMMENT 'Tên social',
  `oauth_uid` varchar(100) DEFAULT NULL COMMENT 'uid',
  `ip_address` varchar(45) NOT NULL,
	-- social: facebook, zalo, google
  `face_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên tài khoản facebook',
  `face_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Link tài khoản facebook',
  
  `zalo_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên tài khoản zalo',
  `zalo_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Link tài khoản zalo',
  PRIMARY KEY (`id`),
  KEY `tb_groups_id` (`tb_groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('20', 'Tạ Văn ', 'Chung', 'chung@gmail.com', 'chung', '$2y$10$rrKVlBc6neFcOAfBFGcV1OC8l1YwAk5L.CEbtICMTMni/SEBFFrfG', '0', '2003-07-16', '', '', '0', '2019-07-16 13:22:27', '2019-07-16 13:22:27', null, '6', '0', '');
INSERT INTO `tb_users` VALUES ('21', 'Nguyễn ', 'Việt Long', 'long@gmail.com', 'long', '$2y$10$UQx2bo6jLlcxhleGI8kIGuYaIaiLYJecKfZkAPX5CF8cUex6aJ1K2', '0', '1996-06-10', '', '4535323', '0', '2019-07-16 13:23:30', '2019-07-16 13:23:30', null, '3', '0', '');
INSERT INTO `tb_users` VALUES ('22', 'Nguyễnn', 'Tất Vinh', 'vinh@gmail.com', 'vinh', '$2y$10$9TDOTBhFMSPMxgKfpAFrWOucv2CMam1Oq1RFYZUkappQFOSee7ACm', '0', '1999-09-16', '', '', '0', '2019-07-16 13:37:17', '2019-07-16 13:37:17', null, '6', '0', '');
INSERT INTO `tb_users` VALUES ('23', 'Phạm ', 'Thảo', 'bthao@gmail.com', 'bthao', '$2y$10$8Ak5VlUmswDMc9CnyMp4weCGA1tvFaZtnw/jv8MLqsgRvVDuN.7Vi', '1', '1997-09-01', '', '197', '0', '2019-07-16 13:39:47', '2019-07-16 13:39:47', null, '6', '0', '');
INSERT INTO `tb_users` VALUES ('24', 'Nguyễn', 'Kim', 'duc@gmail.com', 'admin123', '$2y$10$5gAQKoYiOuXOsmS2a7xfJ.rbwy0hThXyKRsljv8Ou4X7a9MfMWlEW', '0', '2016-06-05', 'Kim', '', '0', '2019-07-16 14:31:14', '2019-07-16 14:31:14', null, '5', '0', '');
INSERT INTO `tb_users` VALUES ('25', 'Trần ', 'Lớn', 'lon123@gmail.com', 'tl', '123', '1', '2019-07-19', null, null, '1', '2019-07-19 14:53:20', '2019-07-19 14:53:23', null, '6', '0', '');
INSERT INTO `tb_users` VALUES ('26', 'thoải', 'mái', 'mai@gmail,com', 'mai', 'mai', '0', '2019-07-22', null, null, '0', '2019-07-22 16:57:06', '2019-07-22 16:57:17', null, '7', '0', '');
INSERT INTO `tb_users` VALUES ('27', 'Nguyễn ', 'Tiến Đạt', 'dat09@gmail.com', 'dat123', '$2y$10$IlGxMC1QW8v6vhf7cuAlPuTcwQf2HkXOIrHdpNn4M/r/ukijJD76y', '0', '1997-03-13', 'Image Pasted at 2019-7-17 08-57.png', null, '1', '2019-07-17 10:24:59', '2019-07-17 10:24:59', null, '6', '0', '');
INSERT INTO `tb_users` VALUES ('28', 'Hoàng', 'Tâm Anh', 'tamptit2016@gmail.com', 'tam', '$2y$10$S0GxuekqB3s3yGX6QUDkU.W28mn3McW885PxPv62Ck6/W8DHqqN.C', '0', '2001-09-09', 'tam.jpg', null, '0', '2019-07-17 11:26:02', '2019-07-17 11:26:02', null, '4', '0', '');
INSERT INTO `tb_users` VALUES ('29', 'quang', 'tạ', 'quang.tavan@vietis.com.vn', 'admin', '$2y$10$LdFE6RztrQKg8EW.ImpuHOLzm7cEST9ysElKpLWlWC.mCIVJx3UrC', '0', '2000-01-18', '', null, '0', '2019-07-17 16:51:56', '2019-07-17 16:51:56', null, '3', '0', '');
INSERT INTO `tb_users` VALUES ('30', 'zz', 'zz', 'z2016@gmail.com', 'zzz', '$2y$10$TliKYu11A6yeQwXSOP7LO.9R8F.q8oB5DOisVWYWqfxbowkJNIp8y', '0', '2000-11-20', '', null, '0', '2019-07-18 16:00:12', '2019-07-18 16:00:12', null, '7', '0', '');
INSERT INTO `tb_users` VALUES ('32', 'vu', 'hanh', 'hanhvu123@gmail.com', 'hanh123', '$2y$10$sT2RVLCsnS2iE6RqOcLPiOzJ0cfAdtSjcpQqk3V7FlcGSwfRSWzVq', '1', '2014-02-02', '', null, '0', '2019-07-19 08:39:50', '2019-07-19 08:39:50', null, '3', '0', '');
INSERT INTO `tb_users` VALUES ('33', 'ta', 'ta', 'ta2016@gmail.com', 'ta', '$2y$10$7pd3n.e/kc.cIa7yPS6Qye2uKmDZXly7AQDNGm/whePAmd7C.9Lw2', '0', '2004-02-17', '', null, '0', '2019-07-22 09:42:16', '2019-07-22 09:42:16', null, '3', '0', '');
INSERT INTO `tb_users` VALUES ('34', 'Đinh', 'tạ', 'dinhta@gmail.com', 'dinh123', '$2y$10$TS8nl6/Hyh.3scrQFSwQK.kuF2HLitswtldhRXThPttMiip8e0h2m', '0', '2005-10-16', '', null, '0', '2019-07-22 09:43:20', '2019-07-22 09:43:20', null, '8', '0', '');
INSERT INTO `tb_users` VALUES ('35', 'qwe', 'à', 'han.ngothu@vietis.com.vn', 'sa', '$2y$10$C6nUh5wzkMhhE73cDt5Ks.bKRMh.Dm7qs92j2utuXOxKKocwLPCYG', '0', '2004-01-20', 'day-chuyen-1.jpg', null, '0', '2019-07-23 08:46:55', '2019-07-23 08:46:55', null, '3', '0', '');
INSERT INTO `tb_users` VALUES ('36', 'San', 'Sam', 'han.ngothu@gmail.com', 'samsam', '$2y$10$JCxGXVYiJqc3qUTgEJjn8.7AtW0Sumhd/mDkj.hhZddtAhMre3wQ6', '1', '2006-10-19', 'avatar_2.png', null, '0', '2019-07-25 13:48:24', '2019-07-25 13:48:24', null, '4', '0', '');
INSERT INTO `tb_users` VALUES ('37', 'vu', 'dfwef', 'ta@gmail.com.vn', 'abc', '$2y$10$TLvU1fZ5l/fyq.xHzvgBde5sOr0NgCJB6KfiUEdy3cVpnX029AFSO', '0', '2018-01-01', 'sprite-skin-flat.png', null, '0', '2019-07-26 09:35:30', '2019-07-26 09:35:30', null, '3', '0', '');
INSERT INTO `tb_users` VALUES ('39', 'Hoa', 'Thanh', 'quethanhhoa@gmail.com', 'hoa', '$2y$10$cR9T2kxb5IiyPtTTiWmhUeobZFXbcTHp1a2urZFFqQPUwbAz/ZqIO', '1', '2018-08-19', 'cate-2.jpg', null, '0', '2019-08-01 15:28:03', '2019-08-01 15:28:03', null, '8', '0', '');
INSERT INTO `tb_users` VALUES ('40', 'My', 'Name', 'name@vietis.com', 'user', '$2y$10$3E761DhqSH672dyC6bDzOOCQBYk78NPPVgEZVBPGeFQLIOhG.Ahpi', '0', '2003-12-15', 'customer-4-100x100.png', null, '0', '2019-08-01 15:28:53', '2019-08-01 15:28:53', null, '8', '0', '');
INSERT INTO `tb_users` VALUES ('45', 'ac', 'ac', 'ac@gmail.com', 'ac', '$2y$10$ybYID9fYSycW3XeLJBrmOuFMC3fKE5PbOm90ZvnwgteV98r6xsee6', '1', '2003-02-18', 'tam.jpg', null, '0', '2019-08-02 11:16:31', '2019-08-02 11:16:31', null, '3', '0', '');
INSERT INTO `tb_users` VALUES ('47', 'not', 'null', 'null@gmail.com', 'null', '$2y$10$n04XCgRrZaBHbC1AWWcw6OL0EcLbbTsRx.llk5b24vIuBzJy3smE.', '0', '2007-09-17', '', null, '1', '2019-08-05 09:58:43', '2019-08-05 09:58:43', null, '5', '0', '');
INSERT INTO `tb_users` VALUES ('48', 'Ngô thị', 'Thu hân', 'han@gmail.com', 'hanhan', '$2y$10$WW74Co4g5Ow0uiEAAFJNTeaqjQ/gQvEqTP2B6q9DpJhSUhq8RRJri', '1', '1997-08-02', '', null, '0', '2019-08-09 13:52:20', '2019-08-09 13:52:20', null, '5', '0', '');

DROP TABLE IF EXISTS `tb_province`;
CREATE TABLE `tb_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_province
-- ----------------------------
INSERT INTO `tb_province` VALUES ('1', '211', 'Tuyên Quang', '0');
INSERT INTO `tb_province` VALUES ('2', '817', 'Trà Vinh', '0');
INSERT INTO `tb_province` VALUES ('3', '805', 'An Giang', '0');
INSERT INTO `tb_province` VALUES ('4', '717', 'Bà Rịa - Vũng Tàu', '0');
INSERT INTO `tb_province` VALUES ('5', '207', 'Bắc Cạn', '0');
INSERT INTO `tb_province` VALUES ('6', '221', 'Bắc Giang', '0');
INSERT INTO `tb_province` VALUES ('7', '821', 'Bạc Liêu', '0');
INSERT INTO `tb_province` VALUES ('8', '223', 'Bắc Ninh', '0');
INSERT INTO `tb_province` VALUES ('9', '811', 'Bến Tre', '0');
INSERT INTO `tb_province` VALUES ('10', '507', 'Bình Định', '0');
INSERT INTO `tb_province` VALUES ('11', '711', 'Bình Dương', '0');
INSERT INTO `tb_province` VALUES ('12', '707', 'Bình Phước', '0');
INSERT INTO `tb_province` VALUES ('13', '715', 'Bình Thuận', '0');
INSERT INTO `tb_province` VALUES ('14', '823', 'Cà Mau', '0');
INSERT INTO `tb_province` VALUES ('15', '815', 'Cần Thơ', '0');
INSERT INTO `tb_province` VALUES ('16', '203', 'Cao Bằng', '0');
INSERT INTO `tb_province` VALUES ('17', '501', 'Đà Nẵng', '0');
INSERT INTO `tb_province` VALUES ('18', '605', 'Đắc Lắc', '0');
INSERT INTO `tb_province` VALUES ('19', '606', 'Đắk Nông', '0');
INSERT INTO `tb_province` VALUES ('20', '301', 'Điện Biên', '0');
INSERT INTO `tb_province` VALUES ('21', '713', 'Đồng Nai', '0');
INSERT INTO `tb_province` VALUES ('22', '803', 'Đồng Tháp', '0');
INSERT INTO `tb_province` VALUES ('23', '603', 'Gia Lai', '0');
INSERT INTO `tb_province` VALUES ('24', '201', 'Hà Giang', '0');
INSERT INTO `tb_province` VALUES ('25', '111', 'Hà Nam', '0');
INSERT INTO `tb_province` VALUES ('26', '101', 'Hà Nội', '0');
INSERT INTO `tb_province` VALUES ('27', '405', 'Hà Tĩnh', '0');
INSERT INTO `tb_province` VALUES ('28', '107', 'Hải Dương', '0');
INSERT INTO `tb_province` VALUES ('29', '103', 'Hải Phòng', '0');
INSERT INTO `tb_province` VALUES ('30', '816', 'Hậu Giang', '0');
INSERT INTO `tb_province` VALUES ('31', '305', 'Hòa Bình', '0');
INSERT INTO `tb_province` VALUES ('32', '109', 'Hưng Yên', '0');
INSERT INTO `tb_province` VALUES ('33', '511', 'Khánh Hòa', '0');
INSERT INTO `tb_province` VALUES ('34', '813', 'Kiên Giang', '0');
INSERT INTO `tb_province` VALUES ('35', '601', 'Kon Tum', '0');
INSERT INTO `tb_province` VALUES ('36', '302', 'Lai Châu', '0');
INSERT INTO `tb_province` VALUES ('37', '703', 'Lâm Đồng', '0');
INSERT INTO `tb_province` VALUES ('38', '209', 'Lạng Sơn', '0');
INSERT INTO `tb_province` VALUES ('39', '205', 'Lào Cai', '0');
INSERT INTO `tb_province` VALUES ('40', '801', 'Long An', '0');
INSERT INTO `tb_province` VALUES ('41', '113', 'Nam Định', '0');
INSERT INTO `tb_province` VALUES ('42', '403', 'Nghệ An', '0');
INSERT INTO `tb_province` VALUES ('43', '117', 'Ninh Bình', '0');
INSERT INTO `tb_province` VALUES ('44', '705', 'Ninh Thuận', '0');
INSERT INTO `tb_province` VALUES ('45', '217', 'Phú Thọ', '0');
INSERT INTO `tb_province` VALUES ('46', '509', 'Phú Yên', '0');
INSERT INTO `tb_province` VALUES ('47', '407', 'Quảng Bình', '0');
INSERT INTO `tb_province` VALUES ('48', '503', 'Quảng Nam', '0');
INSERT INTO `tb_province` VALUES ('49', '505', 'Quảng Ngãi', '0');
INSERT INTO `tb_province` VALUES ('50', '225', 'Quảng Ninh', '0');
INSERT INTO `tb_province` VALUES ('51', '409', 'Quảng Trị', '0');
INSERT INTO `tb_province` VALUES ('52', '819', 'Sóc Trăng', '0');
INSERT INTO `tb_province` VALUES ('53', '303', 'Sơn La', '0');
INSERT INTO `tb_province` VALUES ('54', '709', 'Tây Ninh', '0');
INSERT INTO `tb_province` VALUES ('55', '115', 'Thái Bình', '0');
INSERT INTO `tb_province` VALUES ('56', '215', 'Thái Nguyên', '0');
INSERT INTO `tb_province` VALUES ('57', '401', 'Thanh Hoá', '0');
INSERT INTO `tb_province` VALUES ('58', '411', 'Thừa Thiên - Huế', '0');
INSERT INTO `tb_province` VALUES ('59', '807', 'Tiền Giang', '0');
INSERT INTO `tb_province` VALUES ('60', '701', 'TP Hồ Chí Minh', '0');
INSERT INTO `tb_province` VALUES ('61', '809', 'Vĩnh Long', '0');
INSERT INTO `tb_province` VALUES ('62', '219', 'Vĩnh Phúc', '0');
INSERT INTO `tb_province` VALUES ('63', '213', 'Yên Bái', '0');

DROP TABLE IF EXISTS `tb_ward`;
CREATE TABLE `tb_ward` (
  `id` int(11) NOT NULL,
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
  PRIMARY KEY (`id`),
	KEY `district_id` (`district_id`),
	KEY `city_id` (`city_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_ward
-- ----------------------------
INSERT INTO `tb_ward` VALUES ('1', 'Phúc Xá', 'Ba Đình', '1', 'Hà Nội', '1', 'phuc-xa', 'Phường', 'Phường Phúc Xá, Ba Đình, Hà Nội', '21.0467979', '105.8481116', null);
INSERT INTO `tb_ward` VALUES ('4', 'Trúc Bạch', 'Ba Đình', '1', 'Hà Nội', '1', 'truc-bach', 'Phường', 'Phường Trúc Bạch, Ba Đình, Hà Nội', '21.0452531', '105.8415062', null);
INSERT INTO `tb_ward` VALUES ('6', 'Vĩnh Phúc', 'Ba Đình', '1', 'Hà Nội', '1', 'vinh-phuc', 'Phường', 'Phường Vĩnh Phúc, Ba Đình, Hà Nội', '21.0417308', '105.8099499', null);
INSERT INTO `tb_ward` VALUES ('7', 'Cống Vị', 'Ba Đình', '1', 'Hà Nội', '1', 'cong-vi', 'Phường', 'Phường Cống Vị, Ba Đình, Hà Nội', '21.0352802', '105.8092161', null);
INSERT INTO `tb_ward` VALUES ('8', 'Liễu Giai', 'Ba Đình', '1', 'Hà Nội', '1', 'lieu-giai', 'Phường', 'Phường Liễu Giai, Ba Đình, Hà Nội', '21.0379972', '105.8187558', null);
INSERT INTO `tb_ward` VALUES ('10', 'Nguyễn Trung Trực', 'Ba Đình', '1', 'Hà Nội', '1', 'nguyen-trung-truc', 'Phường', 'Phường Nguyễn Trung Trực, Ba Đình, Hà Nội', '21.0417971', '105.8473777', null);
INSERT INTO `tb_ward` VALUES ('13', 'Quán Thánh', 'Ba Đình', '1', 'Hà Nội', '1', 'quan-thanh', 'Phường', 'Phường Quán Thánh, Ba Đình, Hà Nội', '21.0389429', '105.8393044', null);
INSERT INTO `tb_ward` VALUES ('16', 'Ngọc Hà', 'Ba Đình', '1', 'Hà Nội', '1', 'ngoc-ha', 'Phường', 'Phường Ngọc Hà, Ba Đình, Hà Nội', '21.0378157', '105.8282959', null);
INSERT INTO `tb_ward` VALUES ('19', 'Điện Biên', 'Ba Đình', '1', 'Hà Nội', '1', 'dien-bien', 'Phường', 'Phường Điện Biên, Ba Đình, Hà Nội', '21.0331477', '105.8393044', null);
INSERT INTO `tb_ward` VALUES ('22', 'Đội Cấn', 'Ba Đình', '1', 'Hà Nội', '1', 'doi-can', 'Phường', 'Phường Đội Cấn, Ba Đình, Hà Nội', '21.0353362', '105.8238927', null);
INSERT INTO `tb_ward` VALUES ('25', 'Ngọc Khánh', 'Ba Đình', '1', 'Hà Nội', '1', 'ngoc-khanh', 'Phường', 'Phường Ngọc Khánh, Ba Đình, Hà Nội', '21.0301393', '105.8099499', null);
INSERT INTO `tb_ward` VALUES ('28', 'Kim Mã', 'Ba Đình', '1', 'Hà Nội', '1', 'kim-ma', 'Phường', 'Phường Kim Mã, Ba Đình, Hà Nội', '21.0316443', '105.8246266', null);
INSERT INTO `tb_ward` VALUES ('31', 'Giảng Võ', 'Ba Đình', '1', 'Hà Nội', '1', 'giang-vo', 'Phường', 'Phường Giảng Võ, Ba Đình, Hà Nội', '21.0270609', '105.8194896', null);
INSERT INTO `tb_ward` VALUES ('34', 'Thành Công', 'Ba Đình', '1', 'Hà Nội', '1', 'thanh-cong', 'Phường', 'Phường Thành Công, Ba Đình, Hà Nội', '21.0208890', '105.8158204', null);
INSERT INTO `tb_ward` VALUES ('37', 'Phúc Tân', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'phuc-tan', 'Phường', 'Phường Phúc Tân, Hoàn Kiếm, Hà Nội', '21.0372674', '105.8569193', null);
INSERT INTO `tb_ward` VALUES ('40', 'Đồng Xuân', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'dong-xuan', 'Phường', 'Phường Đồng Xuân, Hoàn Kiếm, Hà Nội', '21.0392122', '105.8498353', null);
INSERT INTO `tb_ward` VALUES ('43', 'Hàng Mã', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-ma', 'Phường', 'Phường Hàng Mã, Hoàn Kiếm, Hà Nội', '21.0375904', '105.8459098', null);
INSERT INTO `tb_ward` VALUES ('46', 'Hàng Buồm', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-buom', 'Phường', 'Phường Hàng Buồm, Hoàn Kiếm, Hà Nội', '21.0355832', '105.8517814', null);
INSERT INTO `tb_ward` VALUES ('49', 'Hàng Đào', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-dao', 'Phường', 'Phường Hàng Đào, Hoàn Kiếm, Hà Nội', '21.0346712', '105.8499465', null);
INSERT INTO `tb_ward` VALUES ('52', 'Hàng Bồ', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bo', 'Phường', 'Phường Hàng Bồ, Hoàn Kiếm, Hà Nội', '21.0348806', '105.8477447', null);
INSERT INTO `tb_ward` VALUES ('55', 'Cửa Đông', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'cua-dong', 'Phường', 'Phường Cửa Đông, Hoàn Kiếm, Hà Nội', '21.0329168', '105.8455428', null);
INSERT INTO `tb_ward` VALUES ('58', 'Lý Thái Tổ', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'ly-thai-to', 'Phường', 'Phường Lý Thái Tổ, Hoàn Kiếm, Hà Nội', '21.0309577', '105.8547173', null);
INSERT INTO `tb_ward` VALUES ('61', 'Hàng Bạc', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bac', 'Phường', 'Phường Hàng Bạc, Hoàn Kiếm, Hà Nội', '21.0329432', '105.8528824', null);
INSERT INTO `tb_ward` VALUES ('64', 'Hàng Gai', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-gai', 'Phường', 'Phường Hàng Gai, Hoàn Kiếm, Hà Nội', '21.0319133', '105.8484786', null);
INSERT INTO `tb_ward` VALUES ('67', 'Chương Dương Độ', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'chuong-duong-do', 'Phường', 'Phường Chương Dương Độ, Hoàn Kiếm, Hà Nội', '21.0265395', '105.8621601', null);
INSERT INTO `tb_ward` VALUES ('70', 'Hàng Trống', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-trong', 'Phường', 'Phường Hàng Trống, Hoàn Kiếm, Hà Nội', '21.0284792', '105.8503135', null);
INSERT INTO `tb_ward` VALUES ('73', 'Cửa Nam', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'cua-nam', 'Phường', 'Phường Cửa Nam, Hoàn Kiếm, Hà Nội', '21.0252277', '105.8426071', null);
INSERT INTO `tb_ward` VALUES ('76', 'Hàng Bông', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bong', 'Phường', 'Phường Hàng Bông, Hoàn Kiếm, Hà Nội', '21.0288979', '105.8459098', null);
INSERT INTO `tb_ward` VALUES ('79', 'Tràng Tiền', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'trang-tien', 'Phường', 'Phường Tràng Tiền, Hoàn Kiếm, Hà Nội', '21.0251629', '105.8547173', null);
INSERT INTO `tb_ward` VALUES ('82', 'Trần Hưng Đạo', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'tran-hung-dao', 'Phường', 'Phường Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', '21.0229634', '105.8473777', null);
INSERT INTO `tb_ward` VALUES ('85', 'Phan Chu Trinh', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'phan-chu-trinh', 'Phường', 'Phường Phan Chu Trinh, Hoàn Kiếm, Hà Nội', '21.0205376', '105.8576533', null);
INSERT INTO `tb_ward` VALUES ('88', 'Hàng Bài', 'Hoàn Kiếm', '2', 'Hà Nội', '1', 'hang-bai', 'Phường', 'Phường Hàng Bài, Hoàn Kiếm, Hà Nội', '21.0210960', '105.8517814', null);
INSERT INTO `tb_ward` VALUES ('91', 'Phú Thượng', 'Tây Hồ', '3', 'Hà Nội', '1', 'phu-thuong', 'Phường', 'Phường Phú Thượng, Tây Hồ, Hà Nội', '21.0838905', '105.8084823', null);
INSERT INTO `tb_ward` VALUES ('94', 'Nhật Tân', 'Tây Hồ', '3', 'Hà Nội', '1', 'nhat-tan', 'Phường', 'Phường Nhật Tân, Tây Hồ, Hà Nội', '21.0764202', '105.8260943', null);
INSERT INTO `tb_ward` VALUES ('97', 'Tứ Liên', 'Tây Hồ', '3', 'Hà Nội', '1', 'tu-lien', 'Phường', 'Phường Tứ Liên, Tây Hồ, Hà Nội', '21.0695076', '105.8378366', null);
INSERT INTO `tb_ward` VALUES ('100', 'Quảng An', 'Tây Hồ', '3', 'Hà Nội', '1', 'quang-an', 'Phường', 'Phường Quảng An, Tây Hồ, Hà Nội', '21.0635910', '105.8260436', null);
INSERT INTO `tb_ward` VALUES ('103', 'Xuân La', 'Tây Hồ', '3', 'Hà Nội', '1', 'xuan-la', 'Phường', 'Phường Xuân La, Tây Hồ, Hà Nội', '21.0596756', '105.8040796', null);
INSERT INTO `tb_ward` VALUES ('106', 'Yên Phụ', 'Tây Hồ', '3', 'Hà Nội', '1', 'yen-phu', 'Phường', 'Phường Yên Phụ, Tây Hồ, Hà Nội', '21.0534309', '105.8393044', null);
INSERT INTO `tb_ward` VALUES ('109', 'Bưởi', 'Tây Hồ', '3', 'Hà Nội', '1', 'buoi', 'Phường', 'Phường Bưởi, Tây Hồ, Hà Nội', '21.0530438', '105.8128851', null);
INSERT INTO `tb_ward` VALUES ('112', 'Thụy Khuê', 'Tây Hồ', '3', 'Hà Nội', '1', 'thuy-khue', 'Phường', 'Phường Thụy Khuê, Tây Hồ, Hà Nội', '21.0461330', '105.8246266', null);
INSERT INTO `tb_ward` VALUES ('115', 'Thượng Thanh', 'Long Biên', '4', 'Hà Nội', '1', 'thuong-thanh', 'Phường', 'Phường Thượng Thanh, Long Biên, Hà Nội', '21.0655013', '105.8883137', null);
INSERT INTO `tb_ward` VALUES ('118', 'Ngọc Thụy', 'Long Biên', '4', 'Hà Nội', '1', 'ngoc-thuy', 'Phường', 'Phường Ngọc Thụy, Long Biên, Hà Nội', '21.0588582', '105.8583873', null);
INSERT INTO `tb_ward` VALUES ('121', 'Giang Biên', 'Long Biên', '4', 'Hà Nội', '1', 'giang-bien', 'Phường', 'Phường Giang Biên, Long Biên, Hà Nội', '21.0674567', '105.9200531', null);
INSERT INTO `tb_ward` VALUES ('124', 'Đức Giang', 'Long Biên', '4', 'Hà Nội', '1', 'duc-giang', 'Phường', 'Phường Đức Giang, Long Biên, Hà Nội', '21.0701691', '105.9068373', null);
INSERT INTO `tb_ward` VALUES ('127', 'Việt Hưng', 'Long Biên', '4', 'Hà Nội', '1', 'viet-hung', 'Phường', 'Phường Việt Hưng, Long Biên, Hà Nội', '21.0575538', '105.9024322', null);
INSERT INTO `tb_ward` VALUES ('130', 'Gia Thụy', 'Long Biên', '4', 'Hà Nội', '1', 'gia-thuy', 'Phường', 'Phường Gia Thụy, Long Biên, Hà Nội', '21.0489560', '105.8862812', null);
INSERT INTO `tb_ward` VALUES ('133', 'Ngọc Lâm', 'Long Biên', '4', 'Hà Nội', '1', 'ngoc-lam', 'Phường', 'Phường Ngọc Lâm, Long Biên, Hà Nội', '21.0448412', '105.8686635', null);
INSERT INTO `tb_ward` VALUES ('136', 'Phúc Lợi', 'Long Biên', '4', 'Hà Nội', '1', 'phuc-loi', 'Phường', 'Phường Phúc Lợi, Long Biên, Hà Nội', '21.0437208', '105.9259271', null);
INSERT INTO `tb_ward` VALUES ('139', 'Bồ Đề', 'Long Biên', '4', 'Hà Nội', '1', 'bo-de', 'Phường', 'Phường Bồ Đề, Long Biên, Hà Nội', '21.0371784', '105.8730678', null);

-- ----------------------------
-- Table structure for `tb_xaphuong`
-- ----------------------------
DROP TABLE IF EXISTS `tb_xaphuong`;
CREATE TABLE `tb_xaphuong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `province_code` int(11) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `district_code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
	KEY `province_code` (`province_code`),
	KEY `district_code` (`district_code`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_xaphuong
-- ----------------------------
INSERT INTO `tb_xaphuong` VALUES ('1', '1010101', 'Phường Phúc Xá', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('2', '1010103', 'Phường Trúc Bạch', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('3', '1010105', 'Phường Vĩnh Phúc', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('4', '1010107', 'Phường Cống Vị', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('5', '1010109', 'Phường Liễu Giai', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('6', '1010111', 'P. Nguyễn Trung Trực', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('7', '1010113', 'Phường Ngọc Hà', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('8', '1010115', 'Phường Đội Cấn', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('9', '1010117', 'Phường Kim Mã', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('10', '1010119', 'Phường Giảng Võ', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('11', '1010121', 'Phường Thành Công', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('12', '1010123', 'Phường Điện Biên', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('13', '1010125', 'Phường Quán Thánh', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('14', '1010127', 'Phường Ngọc Khánh', '10101', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('15', '1010301', 'Phường Nhật Tân', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('16', '1010303', 'Phường Tứ Liên', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('17', '1010305', 'Phường Quảng An', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('18', '1010307', 'Phường Xuân La', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('19', '1010309', 'Phường Bưởi', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('20', '1010311', 'Phường Thuỵ Khuê', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('21', '1010313', 'Phường Phú Thượng', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('22', '1010315', 'Phường Yên Phụ', '10103', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('23', '1010501', 'Phường Phúc Tân', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('24', '1010503', 'Phường Hàng Mã', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('25', '1010505', 'Phường Hàng Buồm', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('26', '1010507', 'Phường Hàng Đào', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('27', '1010509', 'Phường Hàng Bồ', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('28', '1010511', 'Phường Lý Thái Tổ', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('29', '1010513', 'Phường Hàng Bạc', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('30', '1010515', 'Phường Chương Dương Độ', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('31', '1010517', 'Phường Hàng Trống', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('32', '1010519', 'Phường Cửa Nam', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('33', '1010521', 'Phường Trần Hưng Đạo', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('34', '1010523', 'Phường Phan Chu Trinh', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('35', '1010525', 'Phường Hàng Bài', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('36', '1010527', 'Phường Hàng Bông', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('37', '1010529', 'Phường Đồng Xuân', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('38', '1010531', 'Phường Cửa Đông', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('39', '1010533', 'Phường Hàng Gai', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('40', '1010535', 'Phường Tràng Tiền', '10105', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('41', '1010601', 'Phường Giang Biên', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('42', '1010603', 'Phường Đức Giang', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('43', '1010605', 'Phường Việt Hưng', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('44', '1010607', 'Phường Gia Thuỵ', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('45', '1010609', 'Phường Phúc Lợi', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('46', '1010611', 'Phường Bồ Đề', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('47', '1010613', 'Phường Sài Đồng', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('48', '1010615', 'Phường Thạch Bàn', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('49', '1010617', 'Phường Phúc Đồng', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('50', '1010619', 'Phường Cự Khối', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('51', '1010621', 'Phường Thượng Thanh', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('52', '1010623', 'Phường Ngọc Thuỵ', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('53', '1010625', 'Phường Ngọc Lâm', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('54', '1010627', 'Phường Long Biên', '10106', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('55', '1010701', 'Phường Lê Đại Hành', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('56', '1010703', 'Phường Đồng Nhân', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('57', '1010705', 'Phường Đống Mác', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('58', '1010707', 'Phường Thanh Lương', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('59', '1010709', 'Phường Thanh Nhàn', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('60', '1010711', 'Phường Cầu Dền', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('61', '1010713', 'Phường Bách Khoa', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('62', '1010715', 'Phường Đồng Tâm', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('63', '1010717', 'Phường Vĩnh Tuy', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('64', '1010719', 'Phường Bạch Mai', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('65', '1010721', 'Phường Quỳnh Lôi', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('66', '1010723', 'Phường Trương Định', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('67', '1010725', 'Phường Ngô Thì Nhậm', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('68', '1010727', 'Phường Bạch Đằng', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('69', '1010729', 'Phường Phạm Đình Hổ', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('70', '1010731', 'Phường Bùi Thị Xuân', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('71', '1010733', 'Phường Phố Huế', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('72', '1010735', 'Phường Minh Khai', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('73', '1010737', 'Phường Quỳnh Mai', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('74', '1010739', 'Phường Nguyễn Du', '10107', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('75', '1010801', 'Phường Vĩnh Hưng', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('76', '1010803', 'Phường Định Công', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('77', '1010805', 'Phường Mai Động', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('78', '1010807', 'Phường Tương Mai', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('79', '1010809', 'Phường Tân Mai', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('80', '1010811', 'Phường Hoàng Văn Thụ', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('81', '1010813', 'Phường Giáp Bát', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('82', '1010815', 'Phường Thịnh Liệt', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('83', '1010817', 'Phường Hoàng Liệt', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('84', '1010819', 'Phường Trần Phú', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('85', '1010821', 'Phường Thanh Trì', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('86', '1010823', 'Phường Đại Kim', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('87', '1010825', 'Phường Lĩnh Nam', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('88', '1010827', 'Phường Yên Sở', '10108', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('89', '1010901', 'Phường Cát Linh', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('90', '1010903', 'Phường Văn Miếu', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('91', '1010905', 'Phường Láng Thượng', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('92', '1010907', 'Phường ô Chợ Dừa', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('93', '1010909', 'Phường Hàng Bột', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('94', '1010911', 'Phường Khâm Thiên', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('95', '1010913', 'Phường Thổ Quan', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('96', '1010915', 'Phường Nam Đồng', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('97', '1010917', 'Phường Quang Trung', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('98', '1010919', 'Phường Trung Liệt', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('99', '1010921', 'Phường Phương Liên', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('100', '1010923', 'Phường Thịnh Quang', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('101', '1010925', 'Phường Kim Liên', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('102', '1010927', 'Phường Ngã Tư Sở', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('103', '1010929', 'Phường Khương Thượng', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('104', '1010931', 'Phường Văn Chương', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('105', '1010933', 'Phường Phương Mai', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('106', '1010935', 'Phường Quốc Tử Giám', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('107', '1010937', 'Phường Láng Hạ', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('108', '1010939', 'Phường Trung Phụng', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('109', '1010941', 'Phường Trung Tự', '10109', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('110', '1011101', 'Phường Nhân Chính', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('111', '1011103', 'Phường Thượng Đình', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('112', '1011105', 'Phường Khương Trung', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('113', '1011107', 'Phường Thanh Xuân Trung', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('114', '1011109', 'Phường Phương Liệt', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('115', '1011111', 'Phường Hạ Đình', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('116', '1011113', 'Phường Khương Đình', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('117', '1011115', 'Phường Kim Giang', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('118', '1011117', 'Phường Thanh Xuân Nam', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('119', '1011119', 'Phường Khương Mai', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('120', '1011121', 'Phường Thanh Xuân Bắc', '10111', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('121', '1011301', 'Phường Mai Dịch', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('122', '1011303', 'Phường Dịch Vọng', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('123', '1011305', 'Phường Dịch Vọng Hậu', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('124', '1011307', 'Phường Quan Hoa', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('125', '1011309', 'Phường Trung Hoà', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('126', '1011311', 'Phường Nghĩa Đô', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('127', '1011313', 'Phường Nghĩa Tân', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('128', '1011315', 'Phường Yên Hoà', '10113', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('129', '1011501', 'Thị trấn Sóc Sơn', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('130', '1011503', 'Xã Bắc Sơn', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('131', '1011505', 'Xã Hồng Kỳ', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('132', '1011507', 'Xã Nam Sơn', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('133', '1011509', 'Xã Trung Giã', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('134', '1011511', 'Xã Minh Phú', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('135', '1011513', 'Xã Phù Linh', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('136', '1011515', 'Xã Bắc Phú', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('137', '1011517', 'Xã Quang Tiến', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('138', '1011519', 'Xã Hiền Ninh', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('139', '1011521', 'Xã Việt Long', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('140', '1011523', 'Xã Xuân Giang', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('141', '1011525', 'Xã Mai Đình', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('142', '1011527', 'Xã Thanh Xuân', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('143', '1011529', 'Xã Đông Xuân', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('144', '1011531', 'Xã Kim Lũ', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('145', '1011533', 'Xã Phú Minh', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('146', '1011535', 'Xã Xuân Thu', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('147', '1011537', 'Xã Tân Dân', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('148', '1011539', 'Xã Phù Lỗ', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('149', '1011541', 'Xã Minh Trí', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('150', '1011543', 'Xã Tân Hưng', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('151', '1011545', 'Xã Tân Minh', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('152', '1011547', 'Xã Tiên Dược', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('153', '1011549', 'Xã Đức Hoà', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('154', '1011551', 'Xã Phú Cường', '10115', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('155', '1011701', 'Xã Xuân Nộn', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('156', '1011703', 'Xã Thuỵ Lâm', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('157', '1011705', 'Xã Bắc Hồng', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('158', '1011707', 'Xã Nam Hồng', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('159', '1011709', 'Xã Tiên Dương', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('160', '1011711', 'Xã Vân Hà', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('161', '1011713', 'Xã Liên Hà', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('162', '1011715', 'Xã Việt Hùng', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('163', '1011717', 'Xã Kim Chung', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('164', '1011719', 'Xã Dục Tú', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('165', '1011721', 'Xã Vĩnh Ngọc', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('166', '1011723', 'Xã Cổ Loa', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('167', '1011725', 'Xã Hải Bối', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('168', '1011727', 'Xã Võng La', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('169', '1011729', 'Xã Mai Lâm', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('170', '1011731', 'Xã Vân Nội', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('171', '1011733', 'Xã Tầm Xá', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('172', '1011735', 'Thị trấn Đông Anh', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('173', '1011737', 'Xã Nguyên Khê', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('174', '1011739', 'Xã Uy Nỗ', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('175', '1011741', 'Xã Kim Nỗ', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('176', '1011743', 'Xã Đại Mạch', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('177', '1011745', 'Xã Xuân Canh', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('178', '1011747', 'Xã Đông Hội', '10117', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('179', '1011901', 'Xã Kiêu Kỵ', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('180', '1011903', 'Xã Bát Tràng', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('181', '1011905', 'Xã Kim Lan', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('182', '1011907', 'Xã Văn Đức', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('183', '1011909', 'Xã Đa Tốn', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('184', '1011911', 'Thị trấn Yên Viên', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('185', '1011913', 'Xã Yên Thường', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('186', '1011915', 'Xã Yên Viên', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('187', '1011917', 'Xã Đình Xuyên', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('188', '1011919', 'Xã Dương Hà', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('189', '1011921', 'Xã Phù Đổng', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('190', '1011923', 'Xã Cổ Bi', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('191', '1011925', 'Xã Đặng Xá', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('192', '1011927', 'Xã Kim Sơn', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('193', '1011929', 'Xã Trâu Quỳ', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('194', '1011931', 'Xã Dương Quang', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('195', '1011933', 'Xã Đông Dư', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('196', '1011935', 'Xã Lệ Chi', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('197', '1011937', 'Xã Ninh Hiệp', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('198', '1011939', 'Xã Trung Mầu', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('199', '1011941', 'Xã Phú Thị', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('200', '1011943', 'Xã Dương Xá', '10119', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('201', '1012101', 'Thị trấn Cầu Diễn', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('202', '1012103', 'Xã Thượng Cát', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('203', '1012105', 'Xã Thuỵ Phương', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('204', '1012107', 'Xã Tây Tựu', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('205', '1012109', 'Xã Xuân Đỉnh', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('206', '1012111', 'Xã Cổ Nhuế', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('207', '1012113', 'Xã Phú Diễn', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('208', '1012115', 'Xã Xuân Phương', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('209', '1012117', 'Xã Tây Mỗ', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('210', '1012119', 'Xã Mễ Trì', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('211', '1012121', 'Xã Liên Mạc', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('212', '1012123', 'Xã Đại Mỗ', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('213', '1012125', 'Xã Đông Ngạc', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('214', '1012127', 'Xã Minh Khai', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('215', '1012129', 'Xã Mỹ Đình', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('216', '1012131', 'Xã Trung Văn', '10121', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('217', '1012301', 'Thị trấn Văn Điển', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('218', '1012303', 'Xã Tân Triều', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('219', '1012305', 'Xã Thanh Liệt', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('220', '1012307', 'Xã Hữu Hoà', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('221', '1012309', 'Xã Tam Hiệp', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('222', '1012311', 'Xã Tứ Hiệp', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('223', '1012313', 'Xã Vĩnh Quỳnh', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('224', '1012315', 'Xã Duyên Hà', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('225', '1012317', 'Xã Vạn Phúc', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('226', '1012319', 'Xã Đại áng', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('227', '1012321', 'Xã Liên Ninh', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('228', '1012323', 'Xã Ngũ Hiệp', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('229', '1012325', 'Xã Tả Thanh Oai', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('230', '1012327', 'Xã Yên Mỹ', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('231', '1012329', 'Xã Ngọc Hồi', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('232', '1012331', 'Xã Đông Mỹ', '10123', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('233', '1012501', 'Xã Đại Thịnh', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('234', '1012503', 'Xã Kim Hoa', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('235', '1012505', 'Xã Thạch Đà', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('236', '1012507', 'Xã Tự Lập', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('237', '1012509', 'Xã Thanh Lâm', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('238', '1012511', 'Xã Liên Mạc', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('239', '1012513', 'Xã Vạn Yên', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('240', '1012515', 'Xã Chu Phan', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('241', '1012517', 'Xã Mê Linh', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('242', '1012519', 'Xã Văn Khê', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('243', '1012521', 'Xã Hoàng Kim', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('244', '1012523', 'Xã Tráng Việt', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('245', '1012525', 'Thị trấn Quang Minh', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('246', '1012527', 'Xã Tiến Thắng', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('247', '1012529', 'Xã Tam Đồng', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('248', '1012531', 'Xã Tiến Thịnh', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('249', '1012533', 'Xã Tiền Phong', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('250', '1012535', 'Thị trấn Chi Đông', '10125', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('251', '1012701', 'Phường Nguyễn Trãi', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('252', '1012703', 'Phường Mỗ Lao', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('253', '1012704', 'Phường Văn Quán', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('254', '1012705', 'Phường Vạn Phúc', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('255', '1012707', 'Phường Quang Trung', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('256', '1012709', 'Phường Phúc La', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('257', '1012711', 'Phường Hà Cầu', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('258', '1012713', 'Xã Yên Nghĩa', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('259', '1012715', 'Xã Kiến Hưng', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('260', '1012717', 'Xã Phú Lãm', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('261', '1012719', 'Xã Dương Nội', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('262', '1012721', 'Xã Đồng Mai', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('263', '1012723', 'Xã Biên Giang', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('264', '1012725', 'Xã Phú Lương', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('265', '1012727', 'Phường Phú La', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('266', '1012728', 'Phường La Khê', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('267', '1012729', 'Phường Yết Kiêu', '10127', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('268', '1012901', 'Phường Phú Thịnh', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('269', '1012903', 'Phường Quang Trung', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('270', '1012905', 'Phường Sơn Lộc', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('271', '1012907', 'Phường Xuân Khanh', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('272', '1012909', 'Xã Đường Lâm', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('273', '1012911', 'Xã Xuân Sơn', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('274', '1012913', 'Phường Trung Hưng', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('275', '1012915', 'Xã Thanh Mỹ', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('276', '1012917', 'Xã Kim Sơn', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('277', '1012919', 'Xã Sơn Đông', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('278', '1012921', 'Xã Cổ Đông', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('279', '1012923', 'Phường Lê Lợi', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('280', '1012925', 'Phường Ngô Quyền', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('281', '1012927', 'Phường Viên Sơn', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('282', '1012929', 'Phường Trung Sơn Trầm', '10129', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('283', '1013101', 'Xã Vân Hà', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('284', '1013103', 'Xã Vân Phúc', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('285', '1013105', 'Xã Vân Nam', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('286', '1013107', 'Xã Xuân Phú', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('287', '1013109', 'Xã Sen Chiểu', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('288', '1013111', 'Xã Cẩm Đình', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('289', '1013113', 'Xã Võng Xuyên', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('290', '1013115', 'Xã Long Xuyên', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('291', '1013117', 'Xã Thượng Cốc', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('292', '1013119', 'Xã Thanh Đa', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('293', '1013121', 'Xã Trạch Mỹ Lộc', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('294', '1013123', 'Xã Phúc Hòa', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('295', '1013125', 'Xã Phụng Thượng', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('296', '1013127', 'Xã Tam Thuấn', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('297', '1013129', 'Xã Tam Hiệp', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('298', '1013131', 'Xã Hát Môn', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('299', '1013133', 'Thị trấn Phúc Thọ', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('300', '1013135', 'Xã Phương Độ', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('301', '1013137', 'Xã Thọ Lộc', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('302', '1013139', 'Xã Tích Giang', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('303', '1013141', 'Xã Ngọc Tảo', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('304', '1013143', 'Xã Hiệp Thuận', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('305', '1013145', 'Xã Liên Hiệp', '10131', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('306', '1013301', 'Xã Thọ An', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('307', '1013303', 'Xã Phương Đình', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('308', '1013305', 'Xã Hạ Mỗ', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('309', '1013307', 'Xã Tân Hội', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('310', '1013309', 'Xã Song Phượng', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('311', '1013311', 'Thị trấn Phùng', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('312', '1013313', 'Xã Trung Châu', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('313', '1013315', 'Xã Thọ Xuân', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('314', '1013317', 'Xã Hồng Hà', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('315', '1013319', 'Xã Liên Hồng', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('316', '1013321', 'Xã Liên Hà', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('317', '1013323', 'Xã Liên Trung', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('318', '1013325', 'Xã Thượng Mỗ', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('319', '1013327', 'Xã Tân Lập', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('320', '1013329', 'Xã Đan Phượng', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('321', '1013331', 'Xã Đồng Tháp', '10133', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('322', '1013501', 'Xã Phú Kim', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('323', '1013503', 'Xã Hữu Bằng', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('324', '1013505', 'Xã Lại Thượng', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('325', '1013507', 'Xã Kim Quan', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('326', '1013509', 'Xã Thạch Hoà', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('327', '1013511', 'Xã Tân Xã', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('328', '1013513', 'Xã Hạ Bằng', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('329', '1013515', 'Thị trấn Liên Quan', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('330', '1013517', 'Xã Đại Đồng', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('331', '1013519', 'Xã Cẩm Yên', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('332', '1013521', 'Xã Hương Ngải', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('333', '1013523', 'Xã Canh Nậu', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('334', '1013525', 'Xã Dị Nậu', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('335', '1013527', 'Xã Bình Yên', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('336', '1013529', 'Xã Chàng Sơn', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('337', '1013531', 'Xã Cần Kiệm', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('338', '1013533', 'Xã Phùng Xá', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('339', '1013535', 'Xã Thạch Xá', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('340', '1013537', 'Xã Bình Phú', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('341', '1013539', 'Xã Đồng Trúc', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('342', '1013541', 'Xã Yên Bình', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('343', '1013543', 'Xã Yên Trung', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('344', '1013545', 'Xã Tiến Xuân', '10135', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('345', '1013701', 'Xã Di Trạch', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('346', '1013703', 'Xã Song Phương', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('347', '1013705', 'Xã Dương Liễu', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('348', '1013707', 'Xã Kim Chung', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('349', '1013709', 'Xã Đắc Sở', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('350', '1013711', 'Xã An Khánh', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('351', '1013713', 'Xã Đông La', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('352', '1013715', 'Thị trấn Trạm Trôi', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('353', '1013717', 'Xã Đức Thượng', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('354', '1013719', 'Xã Minh Khai', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('355', '1013721', 'Xã Đức Giang', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('356', '1013723', 'Xã Cát Quế', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('357', '1013725', 'Xã Yên Sở', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('358', '1013727', 'Xã Sơn Đồng', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('359', '1013729', 'Xã Vân Canh', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('360', '1013731', 'Xã Lại Yên', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('361', '1013733', 'Xã Tiền Yên', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('362', '1013735', 'Xã An Thượng', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('363', '1013737', 'Xã Vân Côn', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('364', '1013739', 'Xã La Phù', '10137', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('365', '1013901', 'Xã Ngọc Liệp', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('366', '1013903', 'Xã Đại Thành', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('367', '1013905', 'Xã Phượng Cách', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('368', '1013907', 'Xã Thạch Thán', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('369', '1013909', 'Xã Nghĩa Hương', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('370', '1013911', 'Xã Phú Mãn', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('371', '1013913', 'Xã Đông Yên', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('372', '1013915', 'Thị trấn Quốc Oai', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('373', '1013917', 'Xã Sài Sơn', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('374', '1013919', 'Xã Yên Sơn', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('375', '1013921', 'Xã Ngọc Mỹ', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('376', '1013923', 'Xã Liệp Tuyết', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('377', '1013925', 'Xã Đồng Quang', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('378', '1013927', 'Xã Phú Cát', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('379', '1013929', 'Xã Tuyết Nghĩa', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('380', '1013931', 'Xã Cộng Hòa', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('381', '1013933', 'Xã Tân Phú', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('382', '1013935', 'Xã Cấn Hữu', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('383', '1013937', 'Xã Tân Hòa', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('384', '1013939', 'Xã Hòa Thạch', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('385', '1013941', 'Xã Đông Xuân', '10139', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('386', '1014101', 'Xã Mỹ Hưng', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('387', '1014103', 'Xã Thanh Mai', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('388', '1014105', 'Xã Cao Dương', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('389', '1014107', 'Xã Cự Khê', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('390', '1014109', 'Xã Kim An', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('391', '1014111', 'Xã Tân Ước', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('392', '1014113', 'Xã Xuân Dương', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('393', '1014115', 'Xã Cao Viên', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('394', '1014117', 'Xã Bình Minh', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('395', '1014119', 'Xã Tam Hưng', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('396', '1014121', 'Xã Thanh Cao', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('397', '1014123', 'Xã Thanh Thùy', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('398', '1014125', 'Xã Thanh Văn', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('399', '1014127', 'Xã Đỗ Động', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('400', '1014129', 'Xã Kim Thư', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('401', '1014131', 'Xã Phương Trung', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('402', '1014133', 'Xã Dân Hòa', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('403', '1014135', 'Xã Liên Châu', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('404', '1014137', 'Xã Hồng Dương', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('405', '1014139', 'Thị trấn Kim Bài', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('406', '1014141', 'Xã Bích Hòa', '10141', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('407', '1014301', 'Xã Hồng Vân', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('408', '1014303', 'Xã Quất Động', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('409', '1014305', 'Xã Vạn Điểm', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('410', '1014307', 'Xã Nhị Khê', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('411', '1014309', 'Xã Văn Bình', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('412', '1014311', 'Xã Liên Phương', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('413', '1014313', 'Xã Hà Hồi', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('414', '1014315', 'Xã Chương Dương', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('415', '1014317', 'Xã Dũng Tiến', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('416', '1014319', 'Xã Văn Tự', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('417', '1014321', 'Thị trấn Thường Tín', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('418', '1014323', 'Xã Ninh Sở', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('419', '1014325', 'Xã Duyên Thái', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('420', '1014327', 'Xã Khánh Hà', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('421', '1014329', 'Xã Hòa Bình', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('422', '1014331', 'Xã Hiền Giang', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('423', '1014333', 'Xã Vân Tảo', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('424', '1014335', 'Xã Văn Phú', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('425', '1014337', 'Xã Tự Nhiên', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('426', '1014339', 'Xã Tiền Phong', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('427', '1014341', 'Xã Thư Phú', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('428', '1014343', 'Xã Nguyễn Trãi', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('429', '1014345', 'Xã Tân Minh', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('430', '1014347', 'Xã Lê Lợi', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('431', '1014349', 'Xã Thắng Lợi', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('432', '1014351', 'Xã Thống Nhất', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('433', '1014353', 'Xã Nghiêm Xuyên', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('434', '1014355', 'Xã Tô Hiệu', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('435', '1014357', 'Xã Minh Cường', '10143', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('436', '1014501', 'Thị trấn Đại Nghĩa', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('437', '1014503', 'Xã An Tiến', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('438', '1014505', 'Xã Phúc Lâm', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('439', '1014507', 'Xã An Mỹ', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('440', '1014509', 'Xã Xuy Xá', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('441', '1014511', 'Xã Phù Lưu Tế', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('442', '1014513', 'Xã Đại Hưng', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('443', '1014515', 'Xã Vạn Kim', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('444', '1014517', 'Xã Đốc Tín', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('445', '1014519', 'Xã Hương Sơn', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('446', '1014521', 'Xã Hùng Tiến', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('447', '1014523', 'Xã Hợp Tiến', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('448', '1014525', 'Xã Hợp Thanh', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('449', '1014527', 'Xã An Phú', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('450', '1014529', 'Xã Phùng Xá', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('451', '1014531', 'Xã Đồng Tâm', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('452', '1014533', 'Xã Thượng Lâm', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('453', '1014535', 'Xã Tuy Lai', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('454', '1014537', 'Xã Mỹ Thành', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('455', '1014539', 'Xã Bột Xuyên', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('456', '1014541', 'Xã Hồng Sơn', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('457', '1014543', 'Xã Lê Thanh', '10145', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('458', '1014701', 'Xã Đông Lỗ', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('459', '1014703', 'Xã Hòa Xá', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('460', '1014705', 'Xã Sơn Công', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('461', '1014707', 'Xã Viên An', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('462', '1014709', 'Xã Trường Thịnh', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('463', '1014711', 'Xã Đồng Tiến', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('464', '1014713', 'Xã Tảo Dương Văn', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('465', '1014715', 'Xã Trầm Lộng', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('466', '1014717', 'Xã Lưu Hoàng', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('467', '1014719', 'Thị trấn Vân Đình', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('468', '1014721', 'Xã Viên Nội', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('469', '1014723', 'Xã Hoa Sơn', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('470', '1014725', 'Xã Quảng Phú Cầu', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('471', '1014727', 'Xã Cao Thành', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('472', '1014729', 'Xã Liên Bạt', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('473', '1014731', 'Xã Phương Tú', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('474', '1014733', 'Xã Trung Tú', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('475', '1014735', 'Xã Đồng Tân', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('476', '1014737', 'Xã Vạn Thái', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('477', '1014739', 'Xã Minh Đức', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('478', '1014741', 'Xã Hòa Lâm', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('479', '1014743', 'Xã Kim Đường', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('480', '1014745', 'Xã Hòa Nam', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('481', '1014747', 'Xã Hòa Phú', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('482', '1014749', 'Xã Đội Bình', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('483', '1014751', 'Xã Đại Hùng', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('484', '1014753', 'Xã Phù Lưu', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('485', '1014755', 'Xã Đại Cường', '10147', '0', '101');
INSERT INTO `tb_xaphuong` VALUES ('486', '1014757', 'Xã Hồng Quang', '10147', '0', '101');

DROP TABLE IF EXISTS `tb_log_action`;
CREATE TABLE `tb_log_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `tb_system_menu`;
CREATE TABLE `tb_system_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `tb_posts_categories`;
CREATE TABLE `tb_posts_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `tb_posts`
-- ----------------------------
DROP TABLE IF EXISTS `tb_posts`;
CREATE TABLE `tb_posts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `posts_categories_id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề trang',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh mô tả bài viết',
  `shortContent` mediumtext  COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung mô tả trang',
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nội dung của trang',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trang thái bài viết',
  `users_id` int(10) DEFAULT NULL COMMENT 'id người viết bài',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian tạo bài viết',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập bài viết',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link',
  `count_views` int(10) DEFAULT 0 COMMENT 'Lượt xem của trang',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` tinyint(4) DEFAULT 0 COMMENT 'Ngôn ngữ ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tb_services_categories`;
CREATE TABLE `tb_services_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `tb_services`
-- ----------------------------
DROP TABLE IF EXISTS `tb_services`;
CREATE TABLE `tb_services` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `services_categories_id` int(10) NOT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề trang',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh mô tả bài viết',
  `shortContent` mediumtext  COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung mô tả trang',
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nội dung của trang',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trang thái bài viết',
  `users_id` int(10) DEFAULT NULL COMMENT 'id người viết bài',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian tạo bài viết',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập bài viết',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link',
  `count_views` int(10) DEFAULT 0 COMMENT 'Lượt xem của trang',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` tinyint(4) DEFAULT 0 COMMENT 'Ngôn ngữ ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tb_projects_categories`;
CREATE TABLE `tb_projects_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `tb_projects`
-- ----------------------------
DROP TABLE IF EXISTS `tb_projects`;
CREATE TABLE `tb_projects` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `projects_categories_id` int(10) NOT NULL ,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề trang',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh mô tả bài viết',
  `shortContent` mediumtext  COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung mô tả trang',
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nội dung của trang',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trang thái bài viết',
  `users_id` int(10) DEFAULT NULL COMMENT 'id người viết bài',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian tạo bài viết',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập bài viết',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link',
  `count_views` int(10) DEFAULT 0 COMMENT 'Lượt xem của trang',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` tinyint(4) DEFAULT 0 COMMENT 'Ngôn ngữ ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `tb_career_categories`;
CREATE TABLE `tb_career_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `tb_carer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_career`;
CREATE TABLE `tb_career` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `career_categories_id` int(10) NOT NULL ,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề trang',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh mô tả bài viết',
  `shortContent` mediumtext  COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung mô tả trang',
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nội dung của trang',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trang thái bài viết',
  `users_id` int(10) DEFAULT NULL COMMENT 'id người viết bài',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian tạo bài viết',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập bài viết',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link',
  `count_views` int(10) DEFAULT 0 COMMENT 'Lượt xem của trang',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` tinyint(4) DEFAULT 0 COMMENT 'Ngôn ngữ ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_events_categories`;
CREATE TABLE `tb_events_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for `tb_events`
-- ----------------------------
DROP TABLE IF EXISTS `tb_events`;
CREATE TABLE `tb_events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `events_categories_id` int(10) NOT NULL ,
  `language_code` varchar(5) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tiêu đề trang',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh mô tả bài viết',
  `shortContent` mediumtext  COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung mô tả trang',
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nội dung của trang',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trang thái bài viết',
  `users_id` int(10) DEFAULT NULL COMMENT 'id người viết bài',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian tạo bài viết',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Thời gian cập nhập bài viết',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tối giản link',
  `count_views` int(10) DEFAULT 0 COMMENT 'Lượt xem của trang',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` tinyint(4) DEFAULT 0 COMMENT 'Ngôn ngữ ',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_library_categories`;
CREATE TABLE `tb_library_categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên loại cấu hình',
  `parent_id` int(10) DEFAULT NULL COMMENT 'tên danh mục cha nếu có là id_category của thằng cha',
  `type` tinyint(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT 'Trạng thái',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `library_categories_id` int(10) NOT NULL ,
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

ALTER TABLE tb_projects_categories ADD FOREIGN KEY (parent_id) REFERENCES tb_projects_categories(id);
ALTER TABLE tb_events_categories ADD FOREIGN KEY (user_id) REFERENCES tb_users(id);

ALTER TABLE tb_services ADD FOREIGN KEY (users_id) REFERENCES tb_users(id);
ALTER TABLE tb_career ADD FOREIGN KEY (career_categories_id) REFERENCES tb_career_categories(id);
ALTER TABLE tb_events_categories ADD FOREIGN KEY (user_id) REFERENCES tb_users(id);

ALTER TABLE tb_library ADD FOREIGN KEY (library_categories_id) REFERENCES tb_library_categories(id);
ALTER TABLE tb_library_categories ADD FOREIGN KEY (user_id) REFERENCES tb_users(id);

ALTER TABLE tb_library ADD FOREIGN KEY (library_categories_id) REFERENCES tb_library_categories(id);
ALTER TABLE tb_library_categories ADD FOREIGN KEY (user_id) REFERENCES tb_users(id);

ALTER TABLE tb_library ADD FOREIGN KEY (library_categories_id) REFERENCES tb_library_categories(id);
ALTER TABLE tb_library_categories ADD FOREIGN KEY (user_id) REFERENCES tb_users(id);