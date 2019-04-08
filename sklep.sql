-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2019 at 04:41 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Wypieki', 'wypieki', NULL, NULL),
(2, NULL, 1, 'Świeże', 'swieze', NULL, NULL),
(3, NULL, 1, 'Mrożone', 'mrozone', NULL, NULL),
(4, NULL, 1, 'Gotowe posiłki', 'gotowePosilki', NULL, NULL),
(5, NULL, 1, 'Napoje', 'napoje', NULL, NULL),
(6, NULL, 1, 'Nabiał', 'nabial', NULL, NULL),
(7, NULL, 1, 'Rozrywka', 'rozrywka', NULL, NULL),
(8, NULL, 1, 'Zdrowie i uroda', 'zdrowieUroda', NULL, NULL),
(9, NULL, 1, 'Artykuły spożywcze\r\n', 'artykulySpozywcze', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `Id_City` int(11) NOT NULL,
  `cityName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`Id_City`, `cityName`) VALUES
(1, 'Bielawa'),
(2, 'Bierutów'),
(3, 'Bogatynia'),
(4, 'Boguszów-Gorce'),
(5, 'Boleslawiec'),
(6, 'Bolków'),
(7, 'Brzeg Dolny'),
(8, 'Bystrzyca'),
(9, 'Klodzka'),
(10, 'Chocianów'),
(11, 'Chojnów'),
(12, 'Dlugoleka'),
(13, 'Duszniki-Zdrój'),
(14, 'Dzierzoniów'),
(15, 'Glogów'),
(16, 'Gluszyca'),
(17, 'Goerlitz'),
(18, 'Góra'),
(19, 'Gryfów Slaski'),
(20, 'Jawor'),
(21, 'Jelcz-Laskowice'),
(22, 'Jelenia Góra'),
(23, 'Kamienna Góra'),
(24, 'Karpacz'),
(25, 'Katy Wroclawskie');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 10, 'Id_Product', 'hidden', 'Id Product', 1, 1, 1, 1, 1, 0, '{}', 1),
(57, 10, 'Id_WarehouseDelivery', 'hidden', 'Id WarehouseDelivery', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 10, 'Id_Category', 'text', 'Id Category', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 10, 'Name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 10, 'NajlepszaOferta', 'hidden', 'NajlepszaOferta', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 10, 'UnitOfMeasurement', 'text', 'UnitOfMeasurement', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 10, 'Manufacturer', 'text', 'Manufacturer', 0, 1, 1, 1, 1, 1, '{}', 7),
(63, 10, 'Value', 'number', 'Value', 0, 1, 1, 1, 1, 1, '{}', 8),
(64, 10, 'AmountAvailable', 'text', 'AmountAvailable', 0, 1, 1, 1, 1, 1, '{}', 9),
(65, 10, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 10);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-07 21:10:39', '2019-04-07 21:10:39'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-07 21:10:40', '2019-04-07 21:10:40'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-07 21:10:40', '2019-04-07 21:10:40'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-04-07 21:10:55', '2019-04-07 21:10:55'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-04-07 21:10:58', '2019-04-07 21:10:58'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(10, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-08 00:22:03', '2019-04-08 00:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-04-07 21:10:41', '2019-04-07 21:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-04-07 21:10:41', '2019-04-07 21:10:41', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2019-04-07 21:10:57', '2019-04-07 21:10:57', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2019-04-07 21:11:00', '2019-04-07 21:11:00', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2019-04-07 21:11:02', '2019-04-07 21:11:02', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2019-04-07 21:11:04', '2019-04-07 21:11:04', 'voyager.hooks', NULL),
(15, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 15, '2019-04-08 00:22:06', '2019-04-08 00:22:06', 'voyager.products.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-04-07 21:11:02', '2019-04-07 21:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(2, 'browse_bread', NULL, '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(3, 'browse_database', NULL, '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(4, 'browse_media', NULL, '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(5, 'browse_compass', NULL, '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(6, 'browse_menus', 'menus', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(7, 'read_menus', 'menus', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(8, 'edit_menus', 'menus', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(9, 'add_menus', 'menus', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(10, 'delete_menus', 'menus', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(11, 'browse_roles', 'roles', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(12, 'read_roles', 'roles', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(13, 'edit_roles', 'roles', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(14, 'add_roles', 'roles', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(15, 'delete_roles', 'roles', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(16, 'browse_users', 'users', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(17, 'read_users', 'users', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(18, 'edit_users', 'users', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(19, 'add_users', 'users', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(20, 'delete_users', 'users', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(21, 'browse_settings', 'settings', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(22, 'read_settings', 'settings', '2019-04-07 21:10:43', '2019-04-07 21:10:43'),
(23, 'edit_settings', 'settings', '2019-04-07 21:10:43', '2019-04-07 21:10:43'),
(24, 'add_settings', 'settings', '2019-04-07 21:10:43', '2019-04-07 21:10:43'),
(25, 'delete_settings', 'settings', '2019-04-07 21:10:43', '2019-04-07 21:10:43'),
(26, 'browse_categories', 'categories', '2019-04-07 21:10:57', '2019-04-07 21:10:57'),
(27, 'read_categories', 'categories', '2019-04-07 21:10:57', '2019-04-07 21:10:57'),
(28, 'edit_categories', 'categories', '2019-04-07 21:10:57', '2019-04-07 21:10:57'),
(29, 'add_categories', 'categories', '2019-04-07 21:10:57', '2019-04-07 21:10:57'),
(30, 'delete_categories', 'categories', '2019-04-07 21:10:57', '2019-04-07 21:10:57'),
(31, 'browse_posts', 'posts', '2019-04-07 21:11:00', '2019-04-07 21:11:00'),
(32, 'read_posts', 'posts', '2019-04-07 21:11:00', '2019-04-07 21:11:00'),
(33, 'edit_posts', 'posts', '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(34, 'add_posts', 'posts', '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(35, 'delete_posts', 'posts', '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(36, 'browse_pages', 'pages', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(37, 'read_pages', 'pages', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(38, 'edit_pages', 'pages', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(39, 'add_pages', 'pages', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(40, 'delete_pages', 'pages', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(41, 'browse_hooks', NULL, '2019-04-07 21:11:04', '2019-04-07 21:11:04'),
(42, 'browse_products', 'products', '2019-04-08 00:22:05', '2019-04-08 00:22:05'),
(43, 'read_products', 'products', '2019-04-08 00:22:05', '2019-04-08 00:22:05'),
(44, 'edit_products', 'products', '2019-04-08 00:22:05', '2019-04-08 00:22:05'),
(45, 'add_products', 'products', '2019-04-08 00:22:05', '2019-04-08 00:22:05'),
(46, 'delete_products', 'products', '2019-04-08 00:22:05', '2019-04-08 00:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id_Product` int(11) NOT NULL,
  `Id_WarehouseDelivery` int(11) DEFAULT NULL,
  `Id_Category` int(11) UNSIGNED DEFAULT NULL,
  `Name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `NajlepszaOferta` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `UnitOfMeasurement` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `Manufacturer` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `Value` double DEFAULT NULL,
  `AmountAvailable` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id_Product`, `Id_WarehouseDelivery`, `Id_Category`, `Name`, `NajlepszaOferta`, `UnitOfMeasurement`, `Manufacturer`, `Value`, `AmountAvailable`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Donat', NULL, 'szt', 'Mocna Piekarnia', 2, 101, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(2, 1, 1, 'Bagietka czosnkowa', NULL, 'szt', 'Mocna Piekarnia', 1.99, 102, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(3, 1, 1, 'Bułka poranna', NULL, 'szt', 'Dobry Chleb', 0.2, 1000, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(4, 1, 1, 'Pączek', NULL, 'szt', 'Mocna Piekarnia', 3, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(5, 1, 1, 'Mini pizza', NULL, 'szt', 'Mocna Piekarnia', 4, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(6, 1, 1, 'Chleb żytni', NULL, 'szt', 'Dobry Chleb', 2.5, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(7, 1, 1, 'Chleb biały', NULL, 'szt', 'Dobry Chleb', 1.99, 1000, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(8, 1, 1, 'Ciastko z owocami', NULL, 'szt', 'Piekarnia Magdy', 2.3, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(9, 1, 1, 'Parówka w cieście', '1', 'szt', 'Piekarnia Magdy', 4.5, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(10, 1, 1, 'Chleb słowiański', NULL, 'szt', 'Piekarnia Magdy', 3.2, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(11, 1, 2, 'Kapusta pekińska', NULL, 'kg', 'Polskie Warzywka', 2.5, 31, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(12, 1, 2, 'Ogórki gruntowe', NULL, 'kg', 'Polskie Warzywka', 8, 20, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(13, 1, 2, 'Pomidory malinowe', '1', 'kg', 'Polskie Warzywka', 1.7, 32, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(14, 1, 2, 'Jabłka', NULL, 'kg', 'Polskie Warzywka', 1.8, 40, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(15, 1, 2, 'Grusze', NULL, 'kg', 'Polskie Warzywka', 2.7, 20, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(16, 1, 2, 'Cebula', NULL, 'kg', 'Polskie Warzywka', 0.7, 10, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(17, 1, 2, 'Banany', NULL, 'kg', 'Sloneczny Ogród', 4, 40, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(18, 1, 2, 'Ziemniaki', NULL, 'kg', 'Polskie Warzywka', 0.5, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(19, 1, 2, 'Buraki', NULL, 'kg', 'Polskie Warzywka', 0.8, 30, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(20, 1, 2, 'Pomarańcze', '1', 'kg', 'Sloneczny Ogród', 4, 30, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(21, 1, 3, 'Groszek zielony', NULL, 'szt', 'Hortex', 3.29, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(22, 1, 3, 'Pierś gęsia', NULL, 'kg', 'Indykpol', 23.98, 20, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(23, 1, 3, 'Pierogi ruskie', NULL, 'szt', 'Nordis', 5.6, 50, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(24, 1, 3, 'Filet z mintaja', '1', 'kg', 'Frosta', 17.22, 15, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(25, 1, 3, 'Paluszki rybne', NULL, 'szt', 'Nordis', 8.8, 80, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(26, 1, 3, 'Frytki Original', NULL, 'szt', 'Aviko', 3.69, 40, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(27, 1, 3, 'Owoce morza', '1', 'kg', 'Abramczyk', 14, 5, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(28, 1, 3, 'Uszka z kapustą i grzybami', '4', 'szt', 'Anita', 7.38, 20, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(29, 1, 3, 'Lody waniliowe z wiśniami', NULL, 'szt', 'Nordis', 5.99, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(30, 1, 3, 'Lody rożek truskawkowy', NULL, 'szt', 'Coral', 1.64, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(31, 1, 4, 'Zupa gulaszowa', NULL, 'szt', 'Profi', 3.84, 101, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(32, 1, 4, 'Leczo pieczarkowe', '1', 'szt', 'Lubnica', 4.31, 150, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(33, 1, 4, 'Goląbki w sosie pomidorowym', NULL, 'szt', 'Pudliszki', 4.76, 150, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(34, 1, 4, 'Koncentrat barszczu czerwonego', NULL, 'szt', 'Krakus', 3.28, 150, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(35, 1, 4, 'Sos spaghetti', NULL, 'szt', 'Lowicz', 5.99, 150, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(36, 1, 4, 'Pieczeń rzymska', NULL, 'szt', 'Sokolow', 4.88, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(37, 1, 4, 'Flaki po zamojsku', '1', 'szt', 'Zagloba', 5.61, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(38, 1, 4, 'Gotowe danie z kurczakiem', NULL, 'szt', 'U Jedrusia', 5.99, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(39, 1, 4, 'Kapusta postna z grzybami', NULL, 'szt', 'Senior Smaccini', 11.99, 47, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(40, 1, 4, 'Sos boloński z mięsem', NULL, 'szt', 'Senior Smaccini', 4.79, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(41, 1, 5, 'Woda Niegazowana', '1', 'szt', 'Zywiec Zdrój', 1.69, 400, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(42, 1, 5, 'Woda Gazowana', NULL, 'szt', 'Zywiec Zdrój', 1.69, 400, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(43, 1, 5, 'Sok pomarańczowy', '1', 'szt', 'Tymbark', 2.99, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(44, 1, 5, 'Coca-Cola', NULL, 'szt', 'Coca-Cola', 4.49, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(45, 1, 5, 'Syrop Malinowy', NULL, 'szt', 'Herbapol', 3.59, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(46, 1, 5, 'Sok Multiwitamina', NULL, 'szt', 'Tymbark', 2.99, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(47, 1, 5, 'Sok Banan Marchew Jabłko', NULL, 'szt', 'Kubus', 2.49, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(48, 1, 5, 'Sok pomidorowy', NULL, 'szt', 'Dawtona', 1.49, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(49, 1, 5, 'Sprite', NULL, 'szt', 'Sprite', 4.49, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(50, 1, 5, 'Pepsi', NULL, 'szt', 'Pepsi', 4.69, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(51, 1, 6, 'Mleko UHT', NULL, 'szt', 'Mlekovita', 2.49, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(52, 1, 6, 'Masło Extra', NULL, 'szt', 'Mlekovita', 6.99, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(53, 1, 6, 'Jogurt Naturalny', '1', 'szt', 'Zott', 1.29, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(54, 1, 6, 'Serek wiejski', NULL, 'szt', 'Piatnica', 2.19, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(55, 1, 6, 'Śmietana do zup 18%', NULL, 'szt', 'Piatnica', 1.59, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(56, 1, 6, 'Ser Królewski', NULL, 'szt', 'Sierpc', 3.99, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(57, 1, 6, 'Ser żółty Gauda', NULL, 'szt', 'Hochland', 3.79, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(58, 1, 6, 'Twaróg Półtłusty', '1', 'szt', 'Mlekpol', 3.69, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(59, 1, 6, 'Ser Mozzarella', NULL, 'szt', 'Galbani', 3.99, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(60, 1, 6, 'Jogurt Jagoda', NULL, 'szt', 'Jogobella', 1.39, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(61, 1, 7, 'Czasopismo Inspiracje', NULL, 'szt', 'Inspiracje', 5, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(62, 1, 7, 'Gazeta Wyborcza', NULL, 'szt', 'Wyborcza', 3.99, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(63, 1, 7, 'Czytanka dla dzieci', '1', 'szt', 'Centrum edukacji', 6.99, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(64, 1, 7, 'Zabawka piłka', '1', 'szt', 'Białe słońce', 2.99, 303, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(65, 1, 7, 'Kupon Lotto', NULL, 'szt', 'Awantura', 5, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(66, 1, 7, 'Książka Przepisy', NULL, 'szt', 'Centrum edukacji', 7, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(67, 1, 7, 'Krzyżówki łamigłówki', NULL, 'szt', 'Blok 1 Juniora', 3.99, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(68, 1, 7, 'Gra planszowa Monopoly', NULL, 'szt', 'Hasbro', 50, 10, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(69, 1, 7, 'Zawieszka na torebkę', NULL, 'szt', 'Maly krasnal', 1.5, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(70, 1, 7, 'Smycz na klucze', NULL, 'szt', 'Maly krasnal', 1.99, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(71, 1, 8, 'Chusteczki kosmetyczne', '1', 'szt', 'Regina', 3.89, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(72, 1, 8, 'Mydło w płynie', NULL, 'szt', 'Palmolive', 6, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(73, 1, 8, 'Pasta do zębów', NULL, 'szt', 'Elmex', 11.99, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(74, 1, 8, 'Gąbka do kąpieli', NULL, 'szt', 'For your Beauty', 2.19, 201, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(75, 1, 8, 'Żel pod prysznic', NULL, 'szt', 'Fresh juice', 12.99, 50, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(76, 1, 8, 'Szampon', '1', 'szt', 'Timotei', 9.49, 50, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(77, 1, 8, 'De-makijaż', NULL, 'szt', 'Ziaja', 5.99, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(78, 1, 8, 'Maszynka do golenia', NULL, 'szt', 'Gillette', 3.19, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(79, 1, 8, 'Krem Uniwersalny', NULL, 'szt', 'Nevea', 4.29, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(80, 1, 8, 'Mydło kosmetyczne', '1', 'szt', 'Palmolive', 1.59, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(81, 1, 9, 'Olej słonecznikowy', NULL, 'szt', 'Bartek', 4.99, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(82, 1, 9, 'Kasza gryczana', NULL, 'szt', 'Risana', 3.36, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(83, 1, 9, 'Makaron muszle', '1', 'szt', 'PastaZara', 5, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(84, 1, 9, 'Kukurudza w puszce', NULL, 'szt', 'Bonduelle', 3.2, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(85, 1, 9, 'Ryż długoziarnisty', NULL, 'szt', 'Risana', 2.99, 300, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(86, 1, 9, 'Ketczup pikantny', NULL, 'szt', 'Wroclawek', 3.88, 100, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(87, 1, 9, 'Majonez', NULL, 'szt', 'Winiary', 7.99, 150, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(88, 1, 9, 'Ciastka', NULL, 'szt', 'HIT', 4.79, 500, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(89, 1, 9, 'Cukierki', '1', 'szt', 'Toffino', 2.85, 401, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(90, 1, 9, 'Szprot w sosie pomidorowym', NULL, 'szt', 'King Oscar', 3.98, 200, '2019-04-08 02:23:46', '0000-00-00 00:00:00'),
(104, NULL, 8, 'Banany', NULL, NULL, NULL, 1, 12, '2019-04-08 02:23:46', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-04-07 21:10:41', '2019-04-07 21:10:41'),
(2, 'user', 'Normal User', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(3, 'worker', 'Worker', '2019-04-07 23:30:49', '2019-04-07 23:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'U Jacka', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\April2019\\44K2gv70iyWeJ7pEBd8h.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-04-07 21:11:02', '2019-04-07 21:11:02'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-04-07 21:11:03', '2019-04-07 21:11:03'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-04-07 21:11:04', '2019-04-07 21:11:04'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-04-07 21:11:04', '2019-04-07 21:11:04'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-04-07 21:11:04', '2019-04-07 21:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Id_City` int(11) DEFAULT NULL,
  `phonenumber` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `surname`, `sex`, `address`, `postalcode`, `Id_City`, `phonenumber`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', '', NULL, NULL, NULL, NULL, NULL, 'admin@admin.com', 'users/default.png', NULL, '$2y$10$6xKufKLF8.fkw/DYptJtl.OvsTQQix7nTcfTN1V2NPq7TgNoPSoCa', 'inOKPGtgJzzXwmxzyUqyzUsOvYQu6dg7gPcnxigXaaMyO1SUZvqdN0NYIkxo', NULL, '2019-04-07 21:10:58', '2019-04-07 21:10:58'),
(3, 1, 'Artem', 'Zainier', 'M', 'Strutynska 31/61', '33-003', 20, '793228425', 'artemzainer@gmail.com', 'users/default.png', NULL, '$2y$10$2so8UzLxEFRdFsvKs1PW0eqmonoe1uvzPvGfiOrk5g/8CWb5gvwxa', NULL, NULL, '2019-04-07 22:09:51', '2019-04-07 22:09:51'),
(4, 3, 'Konrad', 'Kirowski', 'M', 'Strutynska 14/19', '33-005', 24, '777888999', 'worker@gmail.com', 'users/default.png', NULL, '$2y$10$oT94wzdgZVqPwNGaxjJXRuRD1ag/17UV7aYMIvethyHFzqtGUEevC', NULL, NULL, '2019-04-07 23:28:52', '2019-04-07 23:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehousedeliverers`
--

CREATE TABLE `warehousedeliverers` (
  `REGON` varchar(9) CHARACTER SET latin1 NOT NULL,
  `NIP` varchar(10) CHARACTER SET latin1 NOT NULL,
  `DelivererName` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `DelivererAddress` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `DelivererCityID` int(2) DEFAULT NULL,
  `DelivererPostalCode` varchar(10) CHARACTER SET latin1 NOT NULL,
  `DelivererPhoneNumber` varchar(15) CHARACTER SET latin1 NOT NULL,
  `DelivererEmail` varchar(30) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `warehousedeliverers`
--

INSERT INTO `warehousedeliverers` (`REGON`, `NIP`, `DelivererName`, `DelivererAddress`, `DelivererCityID`, `DelivererPostalCode`, `DelivererPhoneNumber`, `DelivererEmail`) VALUES
('026776766', '2510892872', 'Sp.zoo \"Super Owca\"', 'Pl. Staszica St', 25, '50-223', '78 677 38 59', 'superowca@gmail.com\r'),
('341779261', '4388717383', 'Sp.zoo \"Wazna szyszka\"', 'ul. Monte Cassi', 25, '53-644', '69 888 11 78', 'waznaszyszka@gmail.com\r'),
('488739738', '5965127103', 'Sp.zoo \"Czarny pien\"', 'Pl. Marszalka P', 25, '51-152', '69 216 53 40', 'czarnypien@gmail.com\r'),
('541397056', '7661061893', 'Sp.zoo \"Wasia Pupkin\"', 'ul. Najswietsze', 25, '50-266', '69 737 54 25', 'wasiapupkin@gmail.com\r'),
('570834092', '8658325526', 'Sp.zoo \"Wnucza dziada i babci\"', 'ul. Psie Budy 9', 25, '50-080', '60 481 31 47', 'wnuczadziadaibabci@gmail.com\r'),
('843947899', '2325696813', 'Sp.zoo \"Morze po kolana\"', 'ul. Slowianska ', 25, '50-235', '72 118 69 04', 'morzepokolano@gmail.com\r'),
('853135426', '0220257706', 'Sp.zoo \"Pijany Jelen\"', 'ul. Szronowa 96', 25, '53-023', '72 831 02 41', 'pijanyjelen@gmail.com\r'),
('867764000', '5782211089', 'Sp.zoo \"Roga i Kopyta\"', 'ul. Kukulcza 12', 25, '51-418', '67 297 98 51', 'rogaikopyta@gmail.com\r'),
('917609398', '2720852979', 'Sp.zoo \"Blue water\"', 'ul. Drobuta Jan', 25, '51-507', '60 709 27 85', 'blue_water@gmail.com\r'),
('923993481', '2602280409', 'Sp.zoo \"Wiadro na glowie\"', 'ul. Tarnogórska', 25, '52-021', '88 788 35 94', 'wiadronaglowie@gmail.com\r');

-- --------------------------------------------------------

--
-- Table structure for table `warehousedeliveries`
--

CREATE TABLE `warehousedeliveries` (
  `WarehouseDeliveryID` int(11) NOT NULL,
  `DelivererRegon` varchar(50) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductsCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehousedeliveries`
--

INSERT INTO `warehousedeliveries` (`WarehouseDeliveryID`, `DelivererRegon`, `ProductID`, `ProductsCount`) VALUES
(1, '853135426', 2, 400);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`Id_City`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id_Product`),
  ADD KEY `CategoryIDFK` (`Id_Category`),
  ADD KEY `WarehouseDeliveryIDFK` (`Id_WarehouseDelivery`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_id_city_foreign` (`Id_City`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `warehousedeliverers`
--
ALTER TABLE `warehousedeliverers`
  ADD PRIMARY KEY (`REGON`),
  ADD KEY `DelivererCityIDFK` (`DelivererCityID`);

--
-- Indexes for table `warehousedeliveries`
--
ALTER TABLE `warehousedeliveries`
  ADD PRIMARY KEY (`WarehouseDeliveryID`),
  ADD KEY `ProductIDFK` (`ProductID`),
  ADD KEY `WarehouseDelivererRegonFK` (`DelivererRegon`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `Id_City` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id_Product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `CategoryIDFK` FOREIGN KEY (`Id_Category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `WarehouseDeliveryIDFK` FOREIGN KEY (`Id_WarehouseDelivery`) REFERENCES `warehousedeliveries` (`WarehouseDeliveryID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_city_foreign` FOREIGN KEY (`Id_City`) REFERENCES `cities` (`Id_City`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehousedeliverers`
--
ALTER TABLE `warehousedeliverers`
  ADD CONSTRAINT `warehousedeliverers_ibfk_1` FOREIGN KEY (`DelivererCityID`) REFERENCES `cities` (`Id_City`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;