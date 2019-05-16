-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Maj 2019, 22:40
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sklep`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `Id_Product` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `Id_Product`, `amount`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2.00', '2019-05-10 12:15:06', '2019-05-10 12:15:06'),
(29, 11, 27, 5, '70.00', '2019-05-16 18:12:53', '2019-05-16 18:12:53'),
(30, 11, 73, 5, '59.95', '2019-05-16 18:13:15', '2019-05-16 18:13:15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
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
-- Zrzut danych tabeli `categories`
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
-- Struktura tabeli dla tabeli `cities`
--

CREATE TABLE `cities` (
  `Id_City` int(11) NOT NULL,
  `cityName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `cities`
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
-- Struktura tabeli dla tabeli `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(30) COLLATE utf8_bin NOT NULL,
  `type` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`) VALUES
(1, 'ABC123', 'fixed', 30, NULL),
(2, 'DFE456', 'percent', NULL, 50);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `data_rows`
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
-- Zrzut danych tabeli `data_rows`
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
(65, 10, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 10),
(66, 11, 'id_status', 'hidden', 'Id Status', 1, 1, 1, 1, 1, 0, '{}', 1),
(67, 11, 'type', 'text', 'Type', 1, 1, 1, 1, 1, 1, '{}', 2),
(68, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(69, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `data_types`
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
-- Zrzut danych tabeli `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-07 21:10:39', '2019-04-07 21:10:39'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-07 21:10:40', '2019-04-07 21:10:40'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-07 21:10:40', '2019-04-07 21:10:40'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-04-07 21:10:55', '2019-04-07 21:10:55'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-04-07 21:10:58', '2019-04-07 21:10:58'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(10, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-08 00:22:03', '2019-04-08 00:33:19'),
(11, 'order_status', 'order-status', 'Order Status', 'Order Statuses', 'voyager-check-circle', 'App\\OrderStatus', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-05-10 16:51:26', '2019-05-10 16:51:26');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-04-07 21:10:41', '2019-04-07 21:10:41');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu_items`
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
-- Zrzut danych tabeli `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-04-07 21:10:41', '2019-04-07 21:10:41', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2019-04-07 21:10:41', '2019-05-10 12:10:40', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2019-04-07 21:10:41', '2019-05-10 12:10:42', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2019-04-07 21:10:41', '2019-05-10 12:10:44', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-04-07 21:10:41', '2019-04-07 21:10:41', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-04-07 21:10:41', '2019-05-10 12:10:21', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-04-07 21:10:41', '2019-05-10 12:10:21', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-04-07 21:10:41', '2019-05-10 12:10:21', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-07 21:10:41', '2019-05-10 12:10:21', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2019-04-07 21:10:41', '2019-05-10 12:10:21', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 5, '2019-04-07 21:10:57', '2019-05-10 12:10:45', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 7, '2019-04-07 21:11:00', '2019-05-10 12:10:40', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 8, '2019-04-07 21:11:02', '2019-05-10 12:10:40', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-04-07 21:11:04', '2019-05-10 12:10:21', 'voyager.hooks', NULL),
(15, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 4, '2019-04-08 00:22:06', '2019-05-10 12:10:45', 'voyager.products.index', NULL),
(17, 1, 'Order Statuses', '', '_self', 'voyager-check-circle', NULL, NULL, 11, '2019-05-10 16:51:27', '2019-05-10 16:51:27', 'voyager.order-status.index', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
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
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(27, '2019_04_11_185136_create_orders_table', 3),
(28, '2019_04_11_185314_create_order_products_table', 3),
(29, '2019_04_14_182109_create_carts_table', 3),
(30, '2019_04_25_174455_create_order_product_table', 4),
(31, '2019_04_25_180135_create_order_product_table', 5),
(32, '2019_04_25_182534_create_order_product_table', 6),
(33, '2019_04_25_183344_create_order_product_table', 7),
(34, '2019_05_10_141736_create_order_status_table', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_status` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `total`, `id_status`, `created_at`, `updated_at`) VALUES
(51, 8, 'Kolomojska 54/19', '5.00', 5, '2019-05-09 17:51:31', '2019-05-09 17:51:31'),
(52, 9, 'Grunwaldzka 10/99', '9.40', 5, '2019-05-09 17:52:46', '2019-05-09 17:52:46'),
(53, 8, 'Kolomojska 54/19', '3.10', 4, '2019-05-10 04:58:50', '2019-05-10 04:58:50'),
(54, 10, 'test', '0.20', 4, '2019-05-11 10:47:07', '2019-05-11 10:47:07'),
(63, 10, 'test', '10.98', 4, '2019-05-12 12:57:29', '2019-05-12 12:57:29'),
(64, 11, 'sdfsf', '1.99', 1, '2019-05-16 14:19:47', '2019-05-16 14:19:47'),
(65, 11, 'sdfsf', '0.00', 1, '2019-05-16 14:48:21', '2019-05-16 14:48:21'),
(66, 11, 'sdfsf', '27.52', 1, '2019-05-16 16:35:40', '2019-05-16 16:35:40'),
(67, 11, 'sdfsf', '149.99', 1, '2019-05-16 17:20:44', '2019-05-16 17:20:44'),
(68, 11, 'sdfsf', '40.00', 1, '2019-05-16 18:11:57', '2019-05-16 18:11:57');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `Id_Product` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `Id_Product`, `amount`, `price`, `total`) VALUES
(27, 50, 1, '4.00', '2.00', '8.00'),
(28, 50, 22, '2.00', '23.98', '47.96'),
(29, 51, 65, '1.00', '5.00', '5.00'),
(30, 52, 14, '3.00', '1.80', '5.40'),
(31, 52, 5, '1.00', '4.00', '4.00'),
(32, 53, 3, '3.00', '0.20', '0.60'),
(33, 53, 11, '1.00', '2.50', '2.50'),
(34, 54, 3, '1.00', '0.20', '0.20'),
(35, 55, 12, '1.00', '8.00', '8.00'),
(36, 55, 68, '1.00', '50.00', '50.00'),
(37, 55, 5, '5.00', '4.00', '20.00'),
(38, 57, 17, '2.00', '4.00', '8.00'),
(39, 57, 5, '3.00', '4.00', '12.00'),
(40, 58, 2, '3.00', '1.99', '5.97'),
(41, 58, 5, '5.00', '4.00', '20.00'),
(42, 59, 1, '5.00', '2.00', '10.00'),
(43, 59, 44, '2.00', '4.49', '8.98'),
(44, 60, 4, '5.00', '3.00', '15.00'),
(45, 60, 50, '1.00', '4.69', '4.69'),
(46, 61, 1, '4.00', '2.00', '8.00'),
(47, 61, 50, '2.00', '4.69', '9.38'),
(48, 62, 1, '5.00', '2.00', '10.00'),
(49, 62, 47, '3.00', '2.49', '7.47'),
(50, 63, 1, '3.00', '2.00', '6.00'),
(51, 63, 47, '2.00', '2.49', '4.98'),
(52, 64, 2, '1.00', '1.99', '1.99'),
(53, 66, 2, '3.00', '1.99', '5.97'),
(54, 66, 32, '5.00', '4.31', '21.55'),
(55, 67, 1, '4.00', '2.00', '8.00'),
(56, 67, 27, '5.00', '14.00', '70.00'),
(57, 67, 27, '5.00', '14.00', '70.00'),
(58, 67, 2, '1.00', '1.99', '1.99'),
(59, 68, 12, '5.00', '8.00', '40.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_status`
--

CREATE TABLE `order_status` (
  `id_status` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `order_status`
--

INSERT INTO `order_status` (`id_status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Złozone', '2019-05-10 16:54:56', '2019-05-10 16:54:56'),
(2, 'Opłacone', '2019-05-10 16:55:13', '2019-05-10 16:55:13'),
(4, 'Wysłane', '2019-05-10 16:57:08', '2019-05-10 16:57:08'),
(5, 'Anulowane', '2019-05-10 16:58:10', '2019-05-10 16:58:10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pages`
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
-- Zrzut danych tabeli `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-04-07 21:11:02', '2019-04-07 21:11:02');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `permissions`
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
(46, 'delete_products', 'products', '2019-04-08 00:22:05', '2019-04-08 00:22:05'),
(47, 'browse_order_status', 'order_status', '2019-05-10 16:51:26', '2019-05-10 16:51:26'),
(48, 'read_order_status', 'order_status', '2019-05-10 16:51:26', '2019-05-10 16:51:26'),
(49, 'edit_order_status', 'order_status', '2019-05-10 16:51:26', '2019-05-10 16:51:26'),
(50, 'add_order_status', 'order_status', '2019-05-10 16:51:26', '2019-05-10 16:51:26'),
(51, 'delete_order_status', 'order_status', '2019-05-10 16:51:26', '2019-05-10 16:51:26');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `permission_role`
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
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posts`
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
-- Zrzut danych tabeli `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-07 21:11:01', '2019-04-07 21:11:01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
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
-- Zrzut danych tabeli `products`
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
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-04-07 21:10:41', '2019-04-07 21:10:41'),
(2, 'user', 'Normal User', '2019-04-07 21:10:42', '2019-04-07 21:10:42'),
(3, 'worker', 'Worker', '2019-04-07 23:30:49', '2019-04-07 23:30:49');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `settings`
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
-- Zrzut danych tabeli `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'U Jacka', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\April2019\\44K2gv70iyWeJ7pEBd8h.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'U Jacka', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to the Admin.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `translations`
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
-- Zrzut danych tabeli `translations`
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
-- Struktura tabeli dla tabeli `users`
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
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `surname`, `sex`, `address`, `postalcode`, `Id_City`, `phonenumber`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', '', NULL, NULL, NULL, NULL, NULL, 'admin@admin.com', 'users/default.png', NULL, '$2y$10$w5roInAPB6l1vDzmqiuOLeA2ckfzoilMgPSeh2w57ggn7XJxLw5Ry', 'lxoBuLuMbiNyvucpyhAOmzYAGBXnkaz6nai9X2NoHbda65VRtvxMiohzJ3gJ', '{\"locale\":\"en\"}', '2019-04-07 21:10:58', '2019-05-10 11:02:11'),
(3, 1, 'Artem', 'Zainier', 'M', 'Strutynska 31/61', '33-003', 20, '793228425', 'artemzainer@gmail.com', 'users\\May2019\\017bJ1RNCy6yGy2c7jT6.jpg', NULL, '$2y$10$2so8UzLxEFRdFsvKs1PW0eqmonoe1uvzPvGfiOrk5g/8CWb5gvwxa', NULL, '{\"locale\":\"en\"}', '2019-04-07 22:09:51', '2019-05-10 11:37:06'),
(4, 3, 'Konrad', 'Kirowski', 'M', 'Strutynska 14/19', '33-005', 24, '777888999', 'worker@gmail.com', 'users/default.png', NULL, '$2y$10$oT94wzdgZVqPwNGaxjJXRuRD1ag/17UV7aYMIvethyHFzqtGUEevC', NULL, NULL, '2019-04-07 23:28:52', '2019-04-07 23:28:52'),
(8, 2, 'Adam', 'Henc', 'M', 'Kolomojska 54/19', '32-998', 6, '999888666', 'user1@gmail.com', 'users/default.png', NULL, '$2y$10$jUgPmEMBFZKjWyXv9P/SHueNoul/Alb3RINfVx1YUApbI2qvTnpI6', NULL, NULL, '2019-05-09 17:48:15', '2019-05-09 17:48:15'),
(9, 2, 'Jan', 'Petelski', 'M', 'Grunwaldzka 10/99', '33-111', 5, '949577666', 'user2@gmail.com', 'users/default.png', NULL, '$2y$10$wom61bqzuuoEo.5kaCD8eeASwp.dG/yNQbIdSBSqWCAdnE8shelLC', NULL, NULL, '2019-05-09 17:49:11', '2019-05-09 17:49:11'),
(10, 2, 'Test', 'Test', 'M', 'test', '44-009', 2, '999888666', '239545@student.pwr.edu.pl', 'users/default.png', NULL, '$2y$10$GJwCVnY4WFRy2YnLCoje9eJ5GoIFF9yqONVC24FoffqKXLWuLT9wi', NULL, NULL, '2019-05-11 10:44:12', '2019-05-11 10:44:12'),
(11, 2, 'Rostysalv', 'Tymkiv', 'M', 'sdfsf', '51-628', 5, '123123123', 'rt@smart.com', 'users/default.png', NULL, '$2y$10$AE0Ips8YJnPnaumAx5HwOuPuusG5sl0Vtbzxz02gTLSQUgVbqk6Ki', NULL, NULL, '2019-05-16 14:19:40', '2019-05-16 14:19:40');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warehousedeliverers`
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
-- Zrzut danych tabeli `warehousedeliverers`
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
-- Struktura tabeli dla tabeli `warehousedeliveries`
--

CREATE TABLE `warehousedeliveries` (
  `WarehouseDeliveryID` int(11) NOT NULL,
  `DelivererRegon` varchar(50) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductsCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `warehousedeliveries`
--

INSERT INTO `warehousedeliveries` (`WarehouseDeliveryID`, `DelivererRegon`, `ProductID`, `ProductsCount`) VALUES
(1, '853135426', 2, 400);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_Product` (`Id_Product`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indeksy dla tabeli `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`Id_City`);

--
-- Indeksy dla tabeli `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeksy dla tabeli `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeksy dla tabeli `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeksy dla tabeli `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indeksy dla tabeli `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeksy dla tabeli `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeksy dla tabeli `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeksy dla tabeli `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id_Product`),
  ADD KEY `CategoryIDFK` (`Id_Category`),
  ADD KEY `WarehouseDeliveryIDFK` (`Id_WarehouseDelivery`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeksy dla tabeli `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeksy dla tabeli `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_id_city_foreign` (`Id_City`);

--
-- Indeksy dla tabeli `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indeksy dla tabeli `warehousedeliverers`
--
ALTER TABLE `warehousedeliverers`
  ADD PRIMARY KEY (`REGON`),
  ADD KEY `DelivererCityIDFK` (`DelivererCityID`);

--
-- Indeksy dla tabeli `warehousedeliveries`
--
ALTER TABLE `warehousedeliveries`
  ADD PRIMARY KEY (`WarehouseDeliveryID`),
  ADD KEY `ProductIDFK` (`ProductID`),
  ADD KEY `WarehouseDelivererRegonFK` (`DelivererRegon`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `cities`
--
ALTER TABLE `cities`
  MODIFY `Id_City` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT dla tabeli `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT dla tabeli `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT dla tabeli `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id_status` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT dla tabeli `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `Id_Product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`Id_Product`) REFERENCES `products` (`Id_Product`);

--
-- Ograniczenia dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `CategoryIDFK` FOREIGN KEY (`Id_Category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `WarehouseDeliveryIDFK` FOREIGN KEY (`Id_WarehouseDelivery`) REFERENCES `warehousedeliveries` (`WarehouseDeliveryID`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_city_foreign` FOREIGN KEY (`Id_City`) REFERENCES `cities` (`Id_City`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ograniczenia dla tabeli `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `warehousedeliverers`
--
ALTER TABLE `warehousedeliverers`
  ADD CONSTRAINT `warehousedeliverers_ibfk_1` FOREIGN KEY (`DelivererCityID`) REFERENCES `cities` (`Id_City`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
