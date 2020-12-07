-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 11, 2019 lúc 07:13 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `swatch`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `category_id`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Đồng hồ Orient', 2, '1692458063.jpg', 'dong-ho-orient', '2018-11-19 19:14:14', '2019-01-06 23:41:24'),
(2, 'Đồng hồ Seiko', 2, '1722988061.jpg', 'dong-ho-seiko', '2018-11-19 19:15:01', '2018-11-19 19:15:01'),
(3, 'Đồng hồ Citizen', 2, '2008864913.jpg', 'dong-ho-citizen', '2018-11-19 19:15:22', '2019-01-06 23:47:40'),
(4, 'Đồng hồ Gucci', 1, '1073392755.jpg', 'dong-ho-gucci', '2018-11-19 22:33:06', '2019-01-06 23:48:04'),
(5, 'Đồng hồ Edox', 1, '56526418.jpg', 'dong-ho-edox', '2018-11-19 22:33:38', '2018-11-19 22:33:38'),
(6, 'Đồng hồ Tissot', 1, '362164903.jpg', 'dong-ho-tissot', '2018-11-19 22:34:12', '2018-11-19 22:34:12'),
(7, 'Đồng hồ Hamilton', 1, '130847991.jpg', 'dong-ho-hamilton', '2018-11-19 22:34:48', '2018-11-19 22:34:48'),
(8, 'Đồng hồ Orgival', 1, '1589476776.jpg', 'dong-ho-orgival', '2018-11-19 22:35:30', '2018-11-19 22:35:30'),
(9, 'Đồng hồ Calvin Klein', 1, '1863530380.jpg', 'dong-ho-calvil-klein', '2018-11-19 22:36:12', '2018-11-19 22:36:12'),
(10, 'Đồng hồ Elle', 3, '807490416.jpg', 'dong-ho-elle', '2018-11-19 22:36:49', '2018-11-19 22:36:49'),
(11, 'Đồng hồ Michel Herbelin', 3, '844902370.jpg', 'dong-ho-michel-herbelin', '2018-11-19 22:37:36', '2018-11-19 22:37:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Đồng hồ Thụy Sỹ', '2018-11-19 19:10:25', '2018-11-19 19:10:25'),
(2, 'Đồng hồ Nhật Bản', '2018-11-19 19:10:37', '2018-11-19 19:10:37'),
(3, 'Đồng hồ Pháp', '2018-11-19 19:10:46', '2018-11-19 19:10:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `name`, `product_id`, `content`, `created_at`, `updated_at`) VALUES
(24, 'Samantha Taylor', 4, '123', '2018-11-29 03:16:40', '2018-11-29 03:16:40'),
(25, 'Samantha Taylor', 4, '123', '2018-11-29 03:16:50', '2018-11-29 03:16:50'),
(26, 'abc', 4, 'abc', '2018-11-29 03:18:19', '2018-11-29 03:18:19'),
(27, 'Ngô Thị Diệu Linh', 4, '123', '2018-11-29 03:20:36', '2018-11-29 03:20:36'),
(28, 'abc', 4, 'abc', '2018-11-29 03:23:35', '2018-11-29 03:23:35'),
(29, 'Ngô Thị Diệu Linh', 4, '123', '2018-11-29 03:26:44', '2018-11-29 03:26:44'),
(30, '123', 4, '123', '2018-11-29 03:28:57', '2018-11-29 03:28:57'),
(31, 'Ngô Thị Diệu Linh', 4, '123', '2018-11-29 03:30:43', '2018-11-29 03:30:43'),
(32, '123', 4, '123', '2018-11-29 03:31:32', '2018-11-29 03:31:32'),
(33, 'Ngô Thị Diệu Linh', 4, '123', '2018-11-29 03:34:16', '2018-11-29 03:34:16'),
(34, 'abc', 4, 'abc', '2018-11-29 03:35:45', '2018-11-29 03:35:45'),
(35, 'abc', 2, 'abc', '2018-11-29 03:37:25', '2018-11-29 03:37:25'),
(36, 'Ngô Thị Diệu Linh', 2, 'abc', '2018-12-03 22:19:14', '2018-12-03 22:19:14'),
(37, 'Ngô Thị Diệu Linh', 1, 'abc', '2018-12-06 00:35:57', '2018-12-06 00:35:57'),
(38, 'Ngô Thị Diệu Linh', 5, 'abc', '2019-01-07 02:33:34', '2019-01-07 02:33:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `website`, `title`, `content`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Samantha Taylor', 'hansena020897@gmail.com', NULL, 'Khiếu nại', 'abc', 1, '2018-12-07 03:32:07', '2018-12-07 03:34:20'),
(5, 'hai nguyen', 'hansena020897@gmail.com', NULL, 'Khiếu nại', 'abc', 1, '2018-12-07 03:50:55', '2018-12-11 03:28:14'),
(6, 'ha', 'nts@gmail.com', NULL, 'abc', 'abc', 1, '2019-01-07 01:53:28', '2019-01-07 01:58:29'),
(7, 'abc', 'hansena020897@gmail.com', NULL, 'Khiếu nại', 'abc', 0, '2019-01-07 02:22:05', '2019-01-07 02:22:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `email`, `phone`, `gender`, `created_at`, `updated_at`) VALUES
(29, 'ngo thi thu han', '10 nguyễn trãi', 'hansena020897@gmail.com', 1654086955, 1, '2019-01-07 01:30:07', '2019-01-07 01:30:07'),
(31, 'hai nguyen', '123 Nguyễn Trãi, Thanh Xuân, Hà Nội', 'nts@gmail.com', 1654086954, 0, '2019-01-07 01:52:38', '2019-01-07 01:52:38'),
(32, 'hai nguyen', '123 Nguyễn Trãi, Thanh Xuân, Hà Nội', 'nts1997Z@gmail.com', 1654086955, 1, '2019-01-07 02:20:46', '2019-01-07 02:20:46'),
(33, 'thuhan', 'Yên Mỹ, Yên Mỹ, Hưng Yên', 'hansena020897@gmail.com', 354086955, 1, '2019-04-27 10:21:11', '2019-04-27 10:21:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_10_29_025611_create_users_table', 1),
(2, '2018_10_30_042505_create_categories_table', 1),
(3, '2018_11_01_070053_create_brands_table', 1),
(4, '2018_11_01_072053_create_products_table', 1),
(5, '2018_11_01_072136_create_sales_table', 1),
(6, '2018_11_01_074311_create_customers_table', 1),
(7, '2018_11_01_074324_create_comments_table', 1),
(8, '2018_11_01_084133_create_orders_table', 1),
(9, '2018_11_01_084155_create_order_details_table', 1),
(10, '2017_06_26_000000_create_shopping_cart_table', 2),
(11, '2018_11_02_074324_create_comments_table', 3),
(12, '2018_12_06_032949_create_contacts_table', 4),
(13, '2018_12_26_034940_create_statistics_table', 5),
(14, '2019_04_30_080107_create_social_facebook_accounts_table', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_order` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_quantity`, `total_price`, `status`, `date_order`, `created_at`, `updated_at`) VALUES
(7, 29, '10 Nguyễn Trãi', 16, 73700000, 2, '2019-01-07 08:30:07', '2019-01-07 01:30:07', '2019-01-07 01:30:41'),
(8, 31, '123 Nguyễn Trãi, Thanh Xuân, Hà Nội', 1, 5000000, 2, '2019-01-07 08:52:38', '2019-01-07 01:52:38', '2019-01-07 02:21:16'),
(9, 32, '123 Nguyễn Trãi, Thanh Xuân, Hà Nội', 5, 22500000, 1, '2019-01-07 09:20:46', '2019-01-07 02:20:46', '2019-01-07 02:20:46'),
(10, 33, 'Yên Mỹ, Yên Mỹ, Hưng Yên', 1, 5000000, 1, '2019-04-27 17:21:11', '2019-04-27 10:21:11', '2019-04-27 10:21:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(7, 3, 11, 4500000, '2019-01-07 01:30:07', '2019-01-07 01:30:07'),
(7, 2, 4, 4800000, '2019-01-07 01:30:07', '2019-01-07 01:30:07'),
(7, 1, 1, 5000000, '2019-01-07 01:30:07', '2019-01-07 01:30:07'),
(8, 1, 1, 5000000, '2019-01-07 01:52:38', '2019-01-07 01:52:38'),
(9, 3, 5, 4500000, '2019-01-07 02:20:46', '2019-01-07 02:20:46'),
(10, 2, 1, 5000000, '2019-04-27 10:21:11', '2019-04-27 10:21:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `shell_material` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chain_material` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `glass_material` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `presure` int(11) NOT NULL,
  `guarantee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `special` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `gender`, `brand_id`, `image`, `price`, `size`, `shell_material`, `chain_material`, `glass_material`, `presure`, `guarantee`, `description`, `status`, `special`, `created_at`, `updated_at`) VALUES
(1, 'NH8350-08A', 'dong-ho-nam', 1, '1884138533.jpg', 100, 40, 'Thép không gỉ', 'Dây da', 'Kính cứng', 50, '1 năm', NULL, 1, 1, '2018-11-19 19:21:49', '2018-11-26 18:29:42'),
(2, 'NH8350-08B', 'dong-ho-nam', 3, '862440442.jpg', 100, 40, 'Thép không gỉ', 'Dây da', 'Kính cứng', 50, '1 năm', NULL, 1, 1, '2018-11-19 19:23:14', '2019-01-06 23:50:58'),
(3, 'NH8353-00H', 'dong-ho-nu', 3, '2108350872.jpg', 100, 40, 'Thép không gỉ', 'Kim loại', 'Kính cứng', 50, '1 năm', NULL, 1, 1, '2018-11-19 19:26:30', '2019-01-06 23:50:33'),
(4, 'NH8350-08G', 'dong-ho-nu', 6, '1984526444.jpg', 100, 40, 'Kim loại', 'Kim loại', 'Kính cứng', 50, '1 năm', NULL, 1, 1, '2018-11-19 22:58:11', '2019-01-06 23:50:07'),
(5, 'GC25A-007', 'dong-ho-nam', 2, '2014138500.jpg', 100, 40, 'Kim loại', 'Dây vải', 'Kính cứng', 200, '1 năm', NULL, 1, 1, '2019-01-06 23:52:52', '2019-01-06 23:52:52'),
(6, 'OG125B-001', 'dong-ho-nam', 8, '585692745.jpg', 100, 40, 'Kim loại', 'Kim loại', 'Kính cứng', 200, '1 năm', NULL, 1, 1, '2019-01-06 23:54:03', '2019-01-07 00:42:41'),
(7, 'OG134H-003', 'dong-ho-nu', 8, '16256424.jpg', 100, 40, 'Kim loại', 'Kim loại', 'Kính cứng', 200, '1 năm', NULL, 1, NULL, '2019-01-06 23:54:52', '2019-01-07 00:55:01'),
(8, 'MH254N-00H', 'dong-ho-nam', 11, '1401202828.jpg', 100, 50, 'Kim loại', 'Kim loại', 'Kính cứng', 100, '1 năm', NULL, 1, 1, '2019-01-06 23:56:29', '2019-01-06 23:56:29'),
(9, 'OR100A-07H', 'dong-ho-nam', 1, '1051211101.jpg', 100, 40, 'Kim loại', 'Kim loại', 'Kính cứng', 200, '1 năm', NULL, 1, NULL, '2019-01-06 23:58:07', '2019-01-07 00:54:29'),
(10, 'OR100A-07B', 'dong-ho-nam', 1, '1786574668.jpg', 100, 35, 'Kim loại', 'Kim loại', 'Kính cứng', 200, '1 năm', NULL, 1, 1, '2019-01-06 23:59:36', '2019-01-07 00:43:15'),
(11, 'EL00B-001', 'dong-ho-nu', 10, '2094793015.jpg', 100, 30, 'Kim loại', 'Kim loại', 'Kính cứng', 200, '1 năm', NULL, 1, NULL, '2019-01-07 00:02:18', '2019-01-07 00:02:18'),
(12, '2GC-001', 'dong-ho-doi', 4, '744176023.jpg', 100, 40, 'Kim loại', 'Kim loại', 'Kính cứng', 200, '1 năm', NULL, 1, 1, '2019-01-07 00:11:33', '2019-01-07 00:11:33'),
(14, '2HM001-00B', 'dong-ho-doi', 7, '962450635.jpg', 100, 40, 'Kim loại', 'Dây da', 'Kính cứng', 200, '1 năm', NULL, 1, NULL, '2019-01-07 00:13:13', '2019-01-07 00:13:13'),
(15, '2CK00H-001', 'dong-ho-doi', 9, '185952313.jpg', 100, 40, 'Kim loại', 'Kim loại', 'Kính cứng', 200, '1 năm', NULL, 1, NULL, '2019-01-07 00:14:23', '2019-01-07 00:14:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `discount` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_facebook_accounts`
--

CREATE TABLE `social_facebook_accounts` (
  `user_id` int(11) NOT NULL,
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `social_facebook_accounts`
--

INSERT INTO `social_facebook_accounts` (`user_id`, `provider_user_id`, `provider`, `created_at`, `updated_at`) VALUES
(15, '469056507167963', 'facebook', '2019-05-16 09:11:29', '2019-05-16 09:11:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statistics`
--

CREATE TABLE `statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `statistics`
--

INSERT INTO `statistics` (`id`, `ip`, `date`, `created_at`, `updated_at`) VALUES
(1, '111', '0000-00-00', '2018-12-26 07:38:40', '0000-00-00 00:00:00'),
(2, '111', '2018-12-18', '2018-12-26 07:38:40', '0000-00-00 00:00:00'),
(3, '118.70.176.12', '2018-12-26', '2018-12-26 00:39:12', '2018-12-26 00:39:12'),
(4, '118.70.176.12', '2018-12-26', '2018-12-26 00:41:11', '2018-12-26 00:41:11'),
(5, '118.70.176.12', '2018-12-27', '2018-12-27 03:12:13', '2018-12-27 03:12:13'),
(6, '118.70.176.12', '2019-01-07', '2019-01-06 23:40:14', '2019-01-06 23:40:14'),
(7, '42.114.34.25', '2019-04-27', '2019-04-27 09:08:10', '2019-04-27 09:08:10'),
(8, '42.114.34.25', '2019-04-28', '2019-04-27 10:20:26', '2019-04-27 10:20:26'),
(9, '42.114.34.25', '2019-04-29', '2019-04-29 07:59:13', '2019-04-29 07:59:13'),
(10, '42.114.34.25', '2019-04-30', '2019-04-29 23:36:48', '2019-04-29 23:36:48'),
(11, '103.7.37.114', '2019-05-03', '2019-05-02 22:36:47', '2019-05-02 22:36:47'),
(12, '103.7.37.118', '2019-05-03', '2019-05-02 22:37:58', '2019-05-02 22:37:58'),
(13, '103.7.37.112', '2019-05-03', '2019-05-02 22:39:16', '2019-05-02 22:39:16'),
(14, '103.7.37.115', '2019-05-03', '2019-05-02 22:42:50', '2019-05-02 22:42:50'),
(15, '42.114.35.207', '2019-05-04', '2019-05-03 20:34:51', '2019-05-03 20:34:51'),
(16, '45.126.98.83', '2019-05-10', '2019-05-09 19:26:23', '2019-05-09 19:26:23'),
(17, '45.126.98.81', '2019-05-10', '2019-05-09 20:03:50', '2019-05-09 20:03:50'),
(18, '27.67.136.196', '2019-05-10', '2019-05-09 20:33:38', '2019-05-09 20:33:38'),
(19, '45.126.98.87', '2019-05-10', '2019-05-09 21:32:14', '2019-05-09 21:32:14'),
(20, '45.126.98.82', '2019-05-10', '2019-05-09 22:45:21', '2019-05-09 22:45:21'),
(21, '45.126.98.86', '2019-05-10', '2019-05-09 22:50:48', '2019-05-09 22:50:48'),
(22, '45.126.98.80', '2019-05-10', '2019-05-09 23:13:20', '2019-05-09 23:13:20'),
(23, '45.126.98.84', '2019-05-10', '2019-05-09 23:26:10', '2019-05-09 23:26:10'),
(24, '45.126.98.85', '2019-05-10', '2019-05-09 23:49:32', '2019-05-09 23:49:32'),
(25, '42.114.34.156', '2019-05-16', '2019-05-16 08:41:14', '2019-05-16 08:41:14'),
(26, '42.114.34.156', '2019-05-17', '2019-05-16 10:01:02', '2019-05-16 10:01:02'),
(27, '103.7.37.149', '2019-05-17', '2019-05-16 20:41:10', '2019-05-16 20:41:10'),
(28, '103.7.37.146', '2019-05-17', '2019-05-16 20:42:00', '2019-05-16 20:42:00'),
(29, '103.7.37.151', '2019-05-17', '2019-05-16 20:50:29', '2019-05-16 20:50:29'),
(30, '103.7.37.145', '2019-05-17', '2019-05-16 21:36:05', '2019-05-16 21:36:05'),
(31, '103.7.37.148', '2019-05-17', '2019-05-16 21:56:23', '2019-05-16 21:56:23'),
(32, '103.7.37.147', '2019-05-17', '2019-05-16 23:20:36', '2019-05-16 23:20:36'),
(33, '103.7.37.144', '2019-05-17', '2019-05-17 00:03:10', '2019-05-17 00:03:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `level`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'han@gmail.com', 'samantha', '$2y$10$Jwm9hRy2mO6mnrcG0k25u.dQWLWojI/UonXZhOUDA8UZ6O3p04aty', 1, '44991280.png', 'gRTcZ1D94FISwmQo9jfJPGMt3QjbjpwRsXzcEaCq8OseWrkydzWsODVyT0xt', '2018-12-06 00:47:36', '2018-12-06 23:52:25'),
(2, 'nts1997z@gmail.com', 'roger', '$2y$10$dFKpb8uuVuVPQRkF3FzJ5OwkFJmuEOCmlzek2j1SNwi4L1oChvB4G', 1, '897433588.png', 'JQqdzlOQp6VflYHhDLgf58uHsL9FtN8oNuBIYNcagcxCFksq7HPwP8BI6dSD', '2018-12-06 03:13:53', '2018-12-06 03:13:53'),
(3, 'hansena020897@gmail.com', 'rok', '$2y$10$mdNWdBNGfHGQwZt38VFnyuu2A.491Hc75pbqza1Svwly9sArZ/1M2', 2, '1639472872.png', 'Mtyg5ekYCveiUgF10nE95uIiQ5UpLis00eGFfcngfGTO389PVx4qA3WR9Z21', '2018-12-11 00:16:30', '2018-12-11 00:23:47'),
(4, 'hansena020897@gmail.com', 'Hân Hân', '08fc80de8121419136e443a70489c123', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'cLlv6BpMemNKtE7giz2WymaoQBRDuaWLMMFTF5bLlBMn2DV7m19T9OTH0PU6', '2019-05-09 20:33:34', '2019-05-09 20:33:34'),
(5, 'hansena020897@gmail.com', 'Hân Hân', 'a18ad9f9bcd4e260979d102a260fc262', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'bIdbgyLEN7JQKu2VIgoc7qmRscvy2S3FW7rKaaNxGfuR71BdGIhd7DchSa0i', '2019-05-10 00:55:56', '2019-05-10 00:55:56'),
(6, 'hansena020897@gmail.com', 'Hân Hân', '2de7cf2043693db2ee898479a6e44529', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'bOkCbgeyxI39BTq100vgqcu3EmMTxhL5iKpBc05xgcqNy4KhuMDYnldfVfbC', '2019-05-10 01:00:20', '2019-05-10 01:00:20'),
(7, 'hansena020897@gmail.com', 'Hân Hân', '5cb22b6ada9b860235e5e20975f23de3', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'yBO4NyUcBkZ6kyZe4knjgMyq5XQo3l73pJUBPMIOaUZFlXBr2FNOgSYHpXHg', '2019-05-10 01:05:37', '2019-05-10 01:05:37'),
(8, 'hansena020897@gmail.com', 'Hân Hân', '3cec07e9ba5f5bb252d13f5f431e4bbb', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'nB0xVaXBxGvCEf7aAzKNUYj16PCWhLEDqqf8EpveILpPK8Ro3k9V6MJ1oj3c', '2019-05-10 01:07:37', '2019-05-10 01:07:37'),
(9, 'hansena020897@gmail.com', 'Hân Hân', '54baf7f8288c87badf5f2dfb62baa1c3', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'eW7RI844MWDEc3oQJyrKHo0BhRbZj5lZN7Y0dQoiFnN3mg1626WmOHqjT5uj', '2019-05-10 01:07:47', '2019-05-10 01:07:47'),
(10, 'hansena020897@gmail.com', 'Hân Hân', '8fe6833df81e224e08ce9be4abfa89a0', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'LwlFXViDhIgDaFPOIBadeKwX7VjXALditr06SViC9mATQs8dJujZ6FMhdjiv', '2019-05-10 01:09:52', '2019-05-10 01:09:52'),
(11, 'hansena020897@gmail.com', 'Hân Hân', 'c1b70d965ca504aa751ddb62ad69c63f', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'oBocFDg8A9jSUU8QUyW4W37TIlQ2uT0wzcrCZTVa8dAfuafSRvkwAniKLEb2', '2019-05-10 01:10:04', '2019-05-10 01:10:04'),
(12, 'hansena020897@gmail.com', 'Hân Hân', '6492d38d732122c58b44e3fdc3e9e9f3', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'PXFt12CkqHxwwDs0mOx0IdE4TDcMXHHpvuvrQzy5XtC9maHHlVXWMRwSgJGT', '2019-05-10 01:12:14', '2019-05-10 01:12:14'),
(13, 'hansena020897@gmail.com', 'Hân Hân', '761b42cfff120aac30045f7a110d0256', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', '1guJCAbZWRHW89OUHdpHOfw8sOs6BlRU56MG8OtTYfK7Qa8GFo5ChEqUyZbN', '2019-05-10 01:12:51', '2019-05-10 01:12:51'),
(14, 'hansena020897@gmail.com', 'Hân Hân', 'b51a15f382ac914391a58850ab343b00', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', '56mHhRj7O7qPiQxWfu9yD50DQA7bzg8OSw1fFnaAKQ6FPe2VsJF0BqLqNnos', '2019-05-16 08:52:54', '2019-05-16 08:52:54'),
(15, 'hansena020897@gmail.com', 'Hân Hân', 'b5b41fac0361d157d9673ecb926af5ae', 1, 'https://graph.facebook.com/v3.0/469056507167963/picture?type=normal', 'Rz9MyHPotiE0ZkN2xLp2BsiLMsyXgwv2XkVMm6jrcADbdTZmCYR1UZnXbwuD', '2019-05-16 09:11:29', '2019-05-16 09:11:29');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`,`instance`);

--
-- Chỉ mục cho bảng `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Các ràng buộc cho bảng `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
