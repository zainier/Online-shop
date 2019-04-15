-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Kwi 2019, 18:54
-- Wersja serwera: 10.1.38-MariaDB
-- Wersja PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `dfdf`
--
CREATE DATABASE IF NOT EXISTS `dfdf` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dfdf`;
--
-- Baza danych: `forge`
--
CREATE DATABASE IF NOT EXISTS `forge` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forge`;

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
(60, 6, 2, 3, '5.97', '2019-04-15 14:39:08', '2019-04-15 14:48:17'),
(61, 6, 62, 2, '7.98', '2019-04-15 14:47:57', '2019-04-15 14:48:04'),
(62, 6, 62, 1, '3.99', '2019-04-15 14:48:02', '2019-04-15 14:48:02'),
(63, 6, 52, 4, '27.96', '2019-04-15 14:48:14', '2019-04-15 14:48:21');

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
(65, 10, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 10);

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
(10, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-04-08 00:22:03', '2019-04-08 00:33:19');

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
(29, '2019_04_14_182109_create_carts_table', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_products`
--

CREATE TABLE `order_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(46, 'delete_products', 'products', '2019-04-08 00:22:05', '2019-04-08 00:22:05');

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
(46, 1);

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
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
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
(1, 1, 'Admin', '', NULL, NULL, NULL, NULL, NULL, 'admin@admin.com', 'users/default.png', NULL, '$2y$10$6xKufKLF8.fkw/DYptJtl.OvsTQQix7nTcfTN1V2NPq7TgNoPSoCa', 'inOKPGtgJzzXwmxzyUqyzUsOvYQu6dg7gPcnxigXaaMyO1SUZvqdN0NYIkxo', NULL, '2019-04-07 21:10:58', '2019-04-07 21:10:58'),
(3, 1, 'Artem', 'Zainier', 'M', 'Strutynska 31/61', '33-003', 20, '793228425', 'artemzainer@gmail.com', 'users/default.png', NULL, '$2y$10$2so8UzLxEFRdFsvKs1PW0eqmonoe1uvzPvGfiOrk5g/8CWb5gvwxa', NULL, NULL, '2019-04-07 22:09:51', '2019-04-07 22:09:51'),
(4, 3, 'Konrad', 'Kirowski', 'M', 'Strutynska 14/19', '33-005', 24, '777888999', 'worker@gmail.com', 'users/default.png', NULL, '$2y$10$oT94wzdgZVqPwNGaxjJXRuRD1ag/17UV7aYMIvethyHFzqtGUEevC', NULL, NULL, '2019-04-07 23:28:52', '2019-04-07 23:28:52'),
(6, 2, 'kdz', 'asdf', 'M', 'asdfsdf', '25-100', 2, '123123123', 'dkrzysio@gmail.com', 'users/default.png', NULL, '$2y$10$mzHNOPP5837DxAPmDzZzt.8yu/4HMTx.Xby0zc1vBp8VIu700GCUq', NULL, NULL, '2019-04-14 16:24:10', '2019-04-14 16:24:10'),
(7, 2, 'ksdjlaf', 'asdfasdf', 'M', 'asdfsdf', '25-100', 2, '123123123', 'd@gmail.com', 'users/default.png', NULL, '$2y$10$IIF8fRHqHjhME19GlRJBXuBWAjehS9ujPooQTz1lBR73.ioknfH.K', NULL, NULL, '2019-04-15 12:21:49', '2019-04-15 12:21:49');

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
-- Indeksy dla tabeli `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
-- AUTO_INCREMENT dla tabeli `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT dla tabeli `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
--
-- Baza danych: `homestead`
--
CREATE DATABASE IF NOT EXISTS `homestead` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `homestead`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `administrators`
--

CREATE TABLE `administrators` (
  `AdministratorID` int(11) NOT NULL,
  `PESELadministrator` varchar(11) NOT NULL,
  `AdministratorName` varchar(15) NOT NULL,
  `AdministratorSurname` varchar(15) NOT NULL,
  `AdministratorSex` varchar(1) NOT NULL,
  `AdministratorPhoneNumber` varchar(15) DEFAULT NULL,
  `AdministratorEmail` varchar(30) NOT NULL,
  `AdministratorPassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `administrators`
--

INSERT INTO `administrators` (`AdministratorID`, `PESELadministrator`, `AdministratorName`, `AdministratorSurname`, `AdministratorSex`, `AdministratorPhoneNumber`, `AdministratorEmail`, `AdministratorPassword`) VALUES
(1, '9606101366', 'Tomasz', 'Kowalski', '', '530538339', 'tomasz.kowalski@gmail.com', 'damien47'),
(2, '97110710921', 'Denys', 'Khmelnytskyi ', '', '576884210', 'denys.khmelnytskyi @gmail.com', 'denysDenys'),
(3, '00000000001', 'Rostyslav', 'Tymkiv', 'M', '796241212', 'damien5830@gmail.com', 'r1s2i3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `Id_Category` int(11) NOT NULL,
  `CategoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`Id_Category`, `CategoryName`) VALUES
(1, 'Wypieki'),
(2, 'Świeże'),
(3, 'Mrożone'),
(4, 'Gotowe posiłki'),
(5, 'Napoje'),
(6, 'Nabiał'),
(7, 'Rozrywka'),
(8, 'Zdrowie i uroda'),
(9, 'Artykuły spożywcze');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cities`
--

CREATE TABLE `cities` (
  `Id_City` int(11) NOT NULL,
  `CityName` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `cities`
--

INSERT INTO `cities` (`Id_City`, `CityName`) VALUES
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
(25, 'Katy Wroclawskie'),
(26, 'Klodzko'),
(27, 'Kowary'),
(28, 'Kudowa-Zdrój'),
(29, 'Ladek-Zdrój'),
(30, 'Legnica'),
(31, 'Luban'),
(32, 'Lubawka'),
(33, 'Lubin'),
(34, 'Lwówek Slaski'),
(35, 'Milicz'),
(36, 'Nowa Ruda'),
(37, 'Oborniki Slaskie'),
(38, 'Olesnica '),
(39, 'Piechowice'),
(40, 'Piensk'),
(41, 'Pieszyce'),
(42, 'Pilawa Górna'),
(43, 'Polanica-Zdrój'),
(44, 'Polkowice'),
(45, 'Przemków'),
(46, 'Siechnice'),
(47, 'Sobótka'),
(48, 'Stronie Slaskie'),
(49, 'Strzegom'),
(50, 'Strzelin'),
(51, 'Syców'),
(52, 'Szczawno-Zdrój'),
(53, 'Szklarska Poreba'),
(54, 'Sroda Slaska'),
(55, 'Swidnica'),
(56, 'Swiebodzice'),
(57, 'Swieradów-Zdrój'),
(58, 'Trzebnica'),
(59, 'Twardogóra'),
(60, 'Walbrzych'),
(61, 'Wolów'),
(62, 'Wroclaw'),
(63, 'Zabkowice'),
(64, 'Slaskie'),
(65, 'Zgorzelec'),
(66, 'Ziebice'),
(67, 'Zlotoryja'),
(68, 'Zarów'),
(69, 'Zmigród'),
(70, 'Olawa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ProdID` int(11) DEFAULT NULL,
  `ProductCount` smallint(6) DEFAULT NULL,
  `DateTime` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `orderitems`
--

INSERT INTO `orderitems` (`OrderItemID`, `OrderID`, `ProdID`, `ProductCount`, `DateTime`) VALUES
(5, '2018-01-22 11:12:46_1334681703', 41, 7, '2018-01-23 02:33:59'),
(6, '2018-01-22 11:12:46_1334681703', 12, 1, '2018-01-23 02:44:20'),
(7, '2018-01-23 03:12:12_677366733', 1, 7, '2018-01-23 03:14:24'),
(8, '2018-01-23 03:12:12_677366733', 32, 10, '2018-01-23 03:14:30'),
(9, '2018-01-23 03:14:41_1996178870', 31, 1, '2018-01-23 03:15:36'),
(10, '2018-01-23 03:14:41_1996178870', 2, 1, '2018-01-23 03:20:26'),
(11, '2018-01-23 03:20:30_1896079156', 1, 1, '2018-01-23 03:21:04'),
(12, '2018-01-23 03:21:07_902500692', 1, 1, '2018-01-23 03:23:02'),
(13, '2018-01-23 03:23:17_540175329', 2, 1, '2018-01-23 03:23:35'),
(14, '2018-01-23 03:23:36_1181566230', 39, 7, '2018-01-23 04:40:12'),
(15, '2018-01-23 03:23:36_1181566230', 11, 1, '2018-01-23 04:40:15'),
(17, '2018-01-23 04:40:21_846013929', 64, 3, '2018-01-23 05:36:16'),
(18, '2018-11-02 06:27:33_582840568', 20, 0, '2018-11-02 06:27:33'),
(19, '2018-11-02 06:27:33_582840568', 40, 1, '2018-11-02 06:28:06'),
(22, '2018-11-02 06:56:47_683371446', 74, 1, '2018-11-02 07:12:15'),
(23, '2018-11-02 06:56:47_683371446', 89, 1, '2018-11-02 07:12:23'),
(24, '2018-11-03 06:29:47_480053685', 9, 4, '2018-11-03 06:29:47'),
(25, '2018-11-03 06:29:47_480053685', 33, 2, '2018-11-03 06:29:58'),
(27, '2018-11-09 01:22:08_876663934', 81, 1, '2018-11-09 01:23:31'),
(28, '2018-11-09 01:22:08_876663934', 82, 1, '2018-11-09 01:23:33'),
(29, '2018-11-09 01:22:08_876663934', 42, 1, '2018-11-09 01:23:35'),
(30, '2018-11-13 07:32:33_1675776982', 1, 1, '2018-11-13 07:34:16'),
(31, '2018-11-13 07:32:33_1675776982', 2, 1, '2018-11-13 07:34:19');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ClientIDf` int(11) DEFAULT NULL,
  `WorkerIDf` int(11) DEFAULT NULL,
  `TotalValue` double DEFAULT NULL,
  `OrderDateTime` varchar(20) DEFAULT NULL,
  `Confirmed` int(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`OrderID`, `ClientIDf`, `WorkerIDf`, `TotalValue`, `OrderDateTime`, `Confirmed`) VALUES
('2018-01-22 11:12:46_1334681703', 18, 1, 19.83, '2018-01-23 03:12:12', 1),
('2018-01-23 03:12:12_677366733', NULL, 1, 57.1, '2018-01-23 03:14:41', 1),
('2018-01-23 03:14:41_1996178870', NULL, 1, 5.83, '2018-01-23 03:20:30', 2),
('2018-01-23 03:20:30_1896079156', NULL, 1, 2, '2018-01-23 03:21:07', 1),
('2018-01-23 03:21:07_902500692', NULL, 1, 2, '2018-01-23 03:23:04', 2),
('2018-01-23 03:23:17_540175329', NULL, 1, 1.99, '2018-01-23 03:23:36', 2),
('2018-01-23 03:23:36_1181566230', NULL, 1, 86.43, '2018-01-23 04:40:21', 2),
('2018-01-23 04:40:21_846013929', NULL, 1, 8.97, '2018-01-23 05:36:26', 2),
('2018-11-02 06:27:33_582840568', NULL, 1, 4.79, '2018-11-02 06:28:13', 1),
('2018-11-02 06:56:47_683371446', NULL, 1, 5.04, '2018-11-02 07:12:26', 2),
('2018-11-03 06:29:47_480053685', 17, NULL, 27.52, '2018-11-03 06:30:07', 0),
('2018-11-09 01:10:28_1132133439', NULL, 1, 0, '2018-11-09 01:22:08', 2),
('2018-11-09 01:22:08_876663934', 9, 1, 10.04, '2018-11-09 01:23:41', 1),
('2018-11-13 07:32:33_1675776982', 20, 1, 3.99, '2018-11-13 07:35:02', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `Id_Product` int(11) NOT NULL,
  `Id_WarehouseDelivery` int(11) DEFAULT NULL,
  `Id_Category` int(11) DEFAULT NULL,
  `Name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `NajlepszaOferta` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `UnitOfMeasurement` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `Manufacturer` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `Value` double DEFAULT NULL,
  `AmountAvailable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`Id_Product`, `Id_WarehouseDelivery`, `Id_Category`, `Name`, `NajlepszaOferta`, `UnitOfMeasurement`, `Manufacturer`, `Value`, `AmountAvailable`) VALUES
(1, 1, 1, 'Donat', NULL, 'szt', 'Mocna Piekarnia', 2, 101),
(2, 1, 1, 'Bagietka czosnkowa', NULL, 'szt', 'Mocna Piekarnia', 1.99, 102),
(3, 1, 1, 'Bułka poranna', NULL, 'szt', 'Dobry Chleb', 0.2, 1000),
(4, 1, 1, 'Pączek', NULL, 'szt', 'Mocna Piekarnia', 3, 300),
(5, 1, 1, 'Mini pizza', NULL, 'szt', 'Mocna Piekarnia', 4, 300),
(6, 1, 1, 'Chleb żytni', NULL, 'szt', 'Dobry Chleb', 2.5, 500),
(7, 1, 1, 'Chleb biały', NULL, 'szt', 'Dobry Chleb', 1.99, 1000),
(8, 1, 1, 'Ciastko z owocami', NULL, 'szt', 'Piekarnia Magdy', 2.3, 300),
(9, 1, 1, 'Parówka w cieście', '1', 'szt', 'Piekarnia Magdy', 4.5, 300),
(10, 1, 1, 'Chleb słowiański', NULL, 'szt', 'Piekarnia Magdy', 3.2, 100),
(11, 1, 2, 'Kapusta pekińska', NULL, 'kg', 'Polskie Warzywka', 2.5, 31),
(12, 1, 2, 'Ogórki gruntowe', NULL, 'kg', 'Polskie Warzywka', 8, 20),
(13, 1, 2, 'Pomidory malinowe', '1', 'kg', 'Polskie Warzywka', 1.7, 32),
(14, 1, 2, 'Jabłka', NULL, 'kg', 'Polskie Warzywka', 1.8, 40),
(15, 1, 2, 'Grusze', NULL, 'kg', 'Polskie Warzywka', 2.7, 20),
(16, 1, 2, 'Cebula', NULL, 'kg', 'Polskie Warzywka', 0.7, 10),
(17, 1, 2, 'Banany', NULL, 'kg', 'Sloneczny Ogród', 4, 40),
(18, 1, 2, 'Ziemniaki', NULL, 'kg', 'Polskie Warzywka', 0.5, 100),
(19, 1, 2, 'Buraki', NULL, 'kg', 'Polskie Warzywka', 0.8, 30),
(20, 1, 2, 'Pomarańcze', '1', 'kg', 'Sloneczny Ogród', 4, 30),
(21, 1, 3, 'Groszek zielony', NULL, 'szt', 'Hortex', 3.29, 100),
(22, 1, 3, 'Pierś gęsia', NULL, 'kg', 'Indykpol', 23.98, 20),
(23, 1, 3, 'Pierogi ruskie', NULL, 'szt', 'Nordis', 5.6, 50),
(24, 1, 3, 'Filet z mintaja', '1', 'kg', 'Frosta', 17.22, 15),
(25, 1, 3, 'Paluszki rybne', NULL, 'szt', 'Nordis', 8.8, 80),
(26, 1, 3, 'Frytki Original', NULL, 'szt', 'Aviko', 3.69, 40),
(27, 1, 3, 'Owoce morza', '1', 'kg', 'Abramczyk', 14, 5),
(28, 1, 3, 'Uszka z kapustą i grzybami', '4', 'szt', 'Anita', 7.38, 20),
(29, 1, 3, 'Lody waniliowe z wiśniami', NULL, 'szt', 'Nordis', 5.99, 100),
(30, 1, 3, 'Lody rożek truskawkowy', NULL, 'szt', 'Coral', 1.64, 200),
(31, 1, 4, 'Zupa gulaszowa', NULL, 'szt', 'Profi', 3.84, 101),
(32, 1, 4, 'Leczo pieczarkowe', '1', 'szt', 'Lubnica', 4.31, 150),
(33, 1, 4, 'Goląbki w sosie pomidorowym', NULL, 'szt', 'Pudliszki', 4.76, 150),
(34, 1, 4, 'Koncentrat barszczu czerwonego', NULL, 'szt', 'Krakus', 3.28, 150),
(35, 1, 4, 'Sos spaghetti', NULL, 'szt', 'Lowicz', 5.99, 150),
(36, 1, 4, 'Pieczeń rzymska', NULL, 'szt', 'Sokolow', 4.88, 100),
(37, 1, 4, 'Flaki po zamojsku', '1', 'szt', 'Zagloba', 5.61, 100),
(38, 1, 4, 'Gotowe danie z kurczakiem', NULL, 'szt', 'U Jedrusia', 5.99, 100),
(39, 1, 4, 'Kapusta postna z grzybami', NULL, 'szt', 'Senior Smaccini', 11.99, 47),
(40, 1, 4, 'Sos boloński z mięsem', NULL, 'szt', 'Senior Smaccini', 4.79, 100),
(41, 1, 5, 'Woda Niegazowana', '1', 'szt', 'Zywiec Zdrój', 1.69, 400),
(42, 1, 5, 'Woda Gazowana', NULL, 'szt', 'Zywiec Zdrój', 1.69, 400),
(43, 1, 5, 'Sok pomarańczowy', '1', 'szt', 'Tymbark', 2.99, 300),
(44, 1, 5, 'Coca-Cola', NULL, 'szt', 'Coca-Cola', 4.49, 300),
(45, 1, 5, 'Syrop Malinowy', NULL, 'szt', 'Herbapol', 3.59, 100),
(46, 1, 5, 'Sok Multiwitamina', NULL, 'szt', 'Tymbark', 2.99, 200),
(47, 1, 5, 'Sok Banan Marchew Jabłko', NULL, 'szt', 'Kubus', 2.49, 500),
(48, 1, 5, 'Sok pomidorowy', NULL, 'szt', 'Dawtona', 1.49, 300),
(49, 1, 5, 'Sprite', NULL, 'szt', 'Sprite', 4.49, 300),
(50, 1, 5, 'Pepsi', NULL, 'szt', 'Pepsi', 4.69, 200),
(51, 1, 6, 'Mleko UHT', NULL, 'szt', 'Mlekovita', 2.49, 300),
(52, 1, 6, 'Masło Extra', NULL, 'szt', 'Mlekovita', 6.99, 300),
(53, 1, 6, 'Jogurt Naturalny', '1', 'szt', 'Zott', 1.29, 500),
(54, 1, 6, 'Serek wiejski', NULL, 'szt', 'Piatnica', 2.19, 500),
(55, 1, 6, 'Śmietana do zup 18%', NULL, 'szt', 'Piatnica', 1.59, 500),
(56, 1, 6, 'Ser Królewski', NULL, 'szt', 'Sierpc', 3.99, 300),
(57, 1, 6, 'Ser żółty Gauda', NULL, 'szt', 'Hochland', 3.79, 300),
(58, 1, 6, 'Twaróg Półtłusty', '1', 'szt', 'Mlekpol', 3.69, 200),
(59, 1, 6, 'Ser Mozzarella', NULL, 'szt', 'Galbani', 3.99, 100),
(60, 1, 6, 'Jogurt Jagoda', NULL, 'szt', 'Jogobella', 1.39, 500),
(61, 1, 7, 'Czasopismo Inspiracje', NULL, 'szt', 'Inspiracje', 5, 200),
(62, 1, 7, 'Gazeta Wyborcza', NULL, 'szt', 'Wyborcza', 3.99, 200),
(63, 1, 7, 'Czytanka dla dzieci', '1', 'szt', 'Centrum edukacji', 6.99, 200),
(64, 1, 7, 'Zabawka piłka', '1', 'szt', 'Białe słońce', 2.99, 303),
(65, 1, 7, 'Kupon Lotto', NULL, 'szt', 'Awantura', 5, 500),
(66, 1, 7, 'Książka Przepisy', NULL, 'szt', 'Centrum edukacji', 7, 300),
(67, 1, 7, 'Krzyżówki łamigłówki', NULL, 'szt', 'Blok 1 Juniora', 3.99, 300),
(68, 1, 7, 'Gra planszowa Monopoly', NULL, 'szt', 'Hasbro', 50, 10),
(69, 1, 7, 'Zawieszka na torebkę', NULL, 'szt', 'Maly krasnal', 1.5, 500),
(70, 1, 7, 'Smycz na klucze', NULL, 'szt', 'Maly krasnal', 1.99, 300),
(71, 1, 8, 'Chusteczki kosmetyczne', '1', 'szt', 'Regina', 3.89, 200),
(72, 1, 8, 'Mydło w płynie', NULL, 'szt', 'Palmolive', 6, 100),
(73, 1, 8, 'Pasta do zębów', NULL, 'szt', 'Elmex', 11.99, 200),
(74, 1, 8, 'Gąbka do kąpieli', NULL, 'szt', 'For your Beauty', 2.19, 201),
(75, 1, 8, 'Żel pod prysznic', NULL, 'szt', 'Fresh juice', 12.99, 50),
(76, 1, 8, 'Szampon', '1', 'szt', 'Timotei', 9.49, 50),
(77, 1, 8, 'De-makijaż', NULL, 'szt', 'Ziaja', 5.99, 100),
(78, 1, 8, 'Maszynka do golenia', NULL, 'szt', 'Gillette', 3.19, 100),
(79, 1, 8, 'Krem Uniwersalny', NULL, 'szt', 'Nevea', 4.29, 100),
(80, 1, 8, 'Mydło kosmetyczne', '1', 'szt', 'Palmolive', 1.59, 100),
(81, 1, 9, 'Olej słonecznikowy', NULL, 'szt', 'Bartek', 4.99, 200),
(82, 1, 9, 'Kasza gryczana', NULL, 'szt', 'Risana', 3.36, 500),
(83, 1, 9, 'Makaron muszle', '1', 'szt', 'PastaZara', 5, 500),
(84, 1, 9, 'Kukurudza w puszce', NULL, 'szt', 'Bonduelle', 3.2, 200),
(85, 1, 9, 'Ryż długoziarnisty', NULL, 'szt', 'Risana', 2.99, 300),
(86, 1, 9, 'Ketczup pikantny', NULL, 'szt', 'Wroclawek', 3.88, 100),
(87, 1, 9, 'Majonez', NULL, 'szt', 'Winiary', 7.99, 150),
(88, 1, 9, 'Ciastka', NULL, 'szt', 'HIT', 4.79, 500),
(89, 1, 9, 'Cukierki', '1', 'szt', 'Toffino', 2.85, 401),
(90, 1, 9, 'Szprot w sosie pomidorowym', NULL, 'szt', 'King Oscar', 3.98, 200),
(104, NULL, 8, 'Banany', NULL, NULL, NULL, 1, 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `Id_User` int(11) NOT NULL,
  `Name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Surname` varchar(30) CHARACTER SET latin1 NOT NULL,
  `Sex` varchar(1) CHARACTER SET latin1 DEFAULT NULL,
  `Address` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `PostalCode` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `Id_City` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Password` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Role` varchar(11) COLLATE ucs2_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`Id_User`, `Name`, `Surname`, `Sex`, `Address`, `PostalCode`, `Id_City`, `PhoneNumber`, `Email`, `Password`, `Role`) VALUES
(1, 'Client', 'Example', 'M', 'ul. Wittiga 5', '51-628', 62, '796241212', 'client@gmail.com', 'qwerty', NULL),
(3, 'Zuzanna', 'Gliwa', 'K', 'ul. Brzoskwiniowa 23', '59-850', 20, '881768753', 'eqynnosiss8323@yopmail.com', '7jscVKRHtU\r', NULL),
(4, 'Stanislaw', 'Klopotowski', 'M', 'ul. Zelazna 83', '51-628', 49, '790043596', 'ayoubmagicien@tryprice.co', 'X2EgqhGcRw\r', NULL),
(5, 'Tadeusz', 'Napieralski', 'M', 'ul. Slaska 114', '58-170', 4, '699243378', 'marm1939@rhyta.com', 'G7xSzCK2cw\r', NULL),
(6, 'Kazimierz', 'Francuz', 'M', 'ul. Dywizjonu 3', '55-130', 35, '699047660', 'oppennollutt8336@yopmail.com', 'tJekmzuCHo\r', NULL),
(7, 'Paulina', 'Szafran', 'K', 'ul. Robotnicza 121', '54-512', 14, '782971701', 'erreffeffac0656@yopmail.com', 'W7P2MDHTgZ\r', NULL),
(8, 'Teresa', 'Brozyna', 'K', 'ul. Poprzeczna 144', '54-517', 69, '722956621', 'ennekige4043@yopmail.com', 'QoxMEwQQWt\r', NULL),
(9, 'Ewelina', 'Konieczka', 'K', 'ul. Robotnicza 35', '54-067', 32, '789866014', 'dapamela1221@yopmail.com', 'LPBqzoqtqx\r', NULL),
(10, 'Daniel', 'Pacan', 'M', 'ul. Bernardynska 136', '54-049', 16, '733577828', 'ehessony-3265@yopmail.com', 'fL4ucfymze\r', NULL),
(11, 'Maria', 'Motyka', 'K', 'ul. Polna 145', '58-330', 38, '729400267', 'effopijele-5307@yopmail.com', 'bygdofZc9P\r', NULL),
(12, 'Andrzej', 'Plawecki', 'M', 'ul. Lapanowska 83', '58-550', 1, '787677202', 'deffecajab-8023@yopmail.com', 'LP3H38Djo2\r', NULL),
(13, 'Jerzy', 'Luty', 'M', 'ul. Michlewskiej Stefanii 61', '58-520', 62, '727713742', 'erroxipiss-2399@yopmail.com', 'aPZCHCjGpj\r', NULL),
(14, 'Ryszard', 'Beben', 'M', 'ul. Malinowa 133', '59-930', 3, '884042936', 'onnefufedo-2186@yopmail.com', 'mzxMGZkLH7\r', NULL),
(15, 'Janina', 'Sabat', 'K', 'ul. Pocztowa 15', '59-123', 43, '604637297', 'typiqurrec-3991@yopmail.com', 'ck5TXSyov7\r', NULL),
(16, 'Ewa', 'Kamionka', 'K', 'ul. Klaudyny 137', '52-328', 53, '889191525', 'kugussexille-3528@yopmail.com', 'B5m38u6QAT\r', NULL),
(17, 'Helena', 'Okrasa', 'K', 'ul. Bratków 56', '58-613', 38, '722818297', 'uddulottettu-1901@yopmail.com', 'ynTwy2Wjc6\r', NULL),
(18, 'Adam', 'Fialkowski', 'M', 'ul. Lutycka 48', '57-352', 44, '798209462', 'acuzippin-3264@yopmail.com', 'PPPk9dC7Zx\r', NULL),
(19, 'Zdzislaw', 'Makowiecki', 'M', 'ul. Szpitalna 133', '54-958', 67, '699031488', 'jaddettuho-0821@yopmail.com', 'D32qvykZPk\r', NULL),
(20, 'Miroslaw', 'Jaszczyk', 'M', 'ul. Ludwika 69', '53-823', 66, '795211764', 'ymillulla-5074@yopmail.com', 'kN7DJ557MG\r', NULL),
(21, 'Piotr', 'Baranski', 'M', 'ul. Gliwicka 73', '51-628', 68, '783760384', 'esulyddiff-8220@yopmail.com', 'B3WRMvuP2T\r', NULL),
(22, 'Jadwiga', 'Goluch', 'K', 'ul. Siedleckiego Waclawa 18', '58-190', 54, '883488499', 'kolarippe-4249@yopmail.com', 'L6ndUgbDGq\r', NULL),
(23, 'Zbigniew', 'Dobrosielski', 'M', 'ul. Wyrobka Zygmunta 100', '57-834', 33, '722153589', 'ivovekemm-7070@yopmail.com', 'psDUvMqZjB\r', NULL),
(24, 'Kazimierz', 'Trojan', 'M', 'ul. Malopolska 76', '50-112', 41, '883466451', 'kuwomotyg-0493@yopmail.com', '7m5tBgowvP\r', NULL),
(25, 'Aleksandra', 'Lukaszek', 'K', 'ul. Wojciechowskiego Stanislawa 132', '53-234', 5, '600635271', 'qassuzifefu-6796@yopmail.com', 'QGkBkDjVHq\r', NULL),
(26, 'Rostyslav', 'Tymkiv', 'M', 'Wittiga 4', '51-628', 3, '721955543', 'damien5830@gmai.com', '123123', NULL),
(27, 'Rostyslav', 'TYMKIV', 'M', 'wittigaa', '51-628', 32, '721955543', 'damien49@sdfsf.com', '456456', NULL),
(33, 'Kamil', 'Nowak', 'M', 'asdasd', '55-009', 6, '4334534', 'kamil@gmai.com', '$2y$10$.doAfHHQxDY4uTY.Eb677.FQ8ezyQBuJuaEGpDHdeljr9Me455NiC', NULL),
(34, 'Artem', 'Zainier', 'M', 'Strutynska 31/61', '33-003', 28, '793228425', 'artemzainer@gmail.com', '$2y$10$.w6aJywF.P6FIabHarMqy..uNKAKQsYn8MALdcRJB9NlqfjJdYNVi', 'admin'),
(39, 'asd', 'asdasd', 'M', 'asdasd', '44-009', 3, 'asddas', 'q@gmail.com', '$2y$10$Y4X8gFCfsdS7N.3Z3CmUU.zn4y/Y6XjA66u2N18/M8/.o/csuCpiW', NULL),
(40, 'Adam', 'Ritter', 'M', 'qwdqwdqw', '33-998', 17, '777999666', 'worker@gmail.com', '$2y$10$OoksCMmnX1i/F2le1.HQH.wDWwV/hhKLwM2MrOiyjb5/tIvHCDAby', 'worker'),
(41, 'Rostyslav', 'Tymkiv', 'M', 'witt', '51-628', 3, '123123123', 'rt@smartitgang.com', '$2y$10$iHWfQHXTNmrBzbRlCdskR.fJsoaa8a3TJjQkZb9Xk7jw1IcAX8d26', NULL);

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
('026776766', '2510892872', 'Sp.zoo \"Super Owca\"', 'Pl. Staszica St', 62, '50-223', '78 677 38 59', 'superowca@gmail.com\r'),
('341779261', '4388717383', 'Sp.zoo \"Wazna szyszka\"', 'ul. Monte Cassi', 62, '53-644', '69 888 11 78', 'waznaszyszka@gmail.com\r'),
('488739738', '5965127103', 'Sp.zoo \"Czarny pien\"', 'Pl. Marszalka P', 62, '51-152', '69 216 53 40', 'czarnypien@gmail.com\r'),
('541397056', '7661061893', 'Sp.zoo \"Wasia Pupkin\"', 'ul. Najswietsze', 62, '50-266', '69 737 54 25', 'wasiapupkin@gmail.com\r'),
('570834092', '8658325526', 'Sp.zoo \"Wnucza dziada i babci\"', 'ul. Psie Budy 9', 62, '50-080', '60 481 31 47', 'wnuczadziadaibabci@gmail.com\r'),
('843947899', '2325696813', 'Sp.zoo \"Morze po kolana\"', 'ul. Slowianska ', 62, '50-235', '72 118 69 04', 'morzepokolano@gmail.com\r'),
('853135426', '0220257706', 'Sp.zoo \"Pijany Jelen\"', 'ul. Szronowa 96', 62, '53-023', '72 831 02 41', 'pijanyjelen@gmail.com\r'),
('867764000', '5782211089', 'Sp.zoo \"Roga i Kopyta\"', 'ul. Kukulcza 12', 62, '51-418', '67 297 98 51', 'rogaikopyta@gmail.com\r'),
('917609398', '2720852979', 'Sp.zoo \"Blue water\"', 'ul. Drobuta Jan', 62, '51-507', '60 709 27 85', 'blue_water@gmail.com\r'),
('923993481', '2602280409', 'Sp.zoo \"Wiadro na glowie\"', 'ul. Tarnogórska', 62, '52-021', '88 788 35 94', 'wiadronaglowie@gmail.com\r');

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `workers`
--

CREATE TABLE `workers` (
  `WorkerID` int(11) NOT NULL,
  `PESELworker` varchar(15) DEFAULT NULL,
  `WorkerName` varchar(30) NOT NULL,
  `WorkerSurname` varchar(30) NOT NULL,
  `WorkerSex` char(1) NOT NULL,
  `WorkerAddress` varchar(30) DEFAULT NULL,
  `WorkerCityID` int(11) DEFAULT NULL,
  `WorkerPhoneNumber` varchar(15) DEFAULT NULL,
  `WorkerEmail` varchar(30) NOT NULL,
  `WorkerPassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `workers`
--

INSERT INTO `workers` (`WorkerID`, `PESELworker`, `WorkerName`, `WorkerSurname`, `WorkerSex`, `WorkerAddress`, `WorkerCityID`, `WorkerPhoneNumber`, `WorkerEmail`, `WorkerPassword`) VALUES
(1, '12345678910', 'Worker', 'Example', 'M', 'ul.Wittiga 5', 62, '88 934 12 83', 'worker@gmail.com', 'Damien47R1s2i3'),
(2, '90021811118', 'Jan', 'Nowak', 'M', 'ul. Sloneczna 119', 1, '69 321 17 67', 'maught73@gmail.us', 'qCah0K'),
(3, '56121347377', 'Andrzej', 'Kowalski', 'M', 'ul. Kosciuszki 57', 6, '88 277 38 59', 'otedyfot1357@gmail.com', '1atkHb'),
(4, '59052063194', 'Piotr', 'Wisniewski', 'M', 'Al. Pokoju 58', 31, '88 570 90 52', 'thertions1955@gmail.com', 'TLMJuw'),
(5, '77011739696', 'Krzysztof', 'Dabrowski', 'M', 'ul. Podbialowa 65', 18, '88 456 33 47', 'xanotulli6815@gmail.com', '2hWTLl'),
(6, '67030171371', 'Stanislaw', 'Lewandowski', 'M', 'ul. Cypryjska 69', 14, '79 297 78 43', 'jilerrafe8365@gmail.com', 'eq0QcE'),
(7, '47080136135', 'Tomasz', 'Wójcik', 'M', 'ul. Letnia 37', 55, '88 467 93 45', 'orodeko6399@gmail.com', 'GwTwm7'),
(8, '61071582138', 'Pawel', 'Kaminski', 'M', 'ul. Dabrowszczaków 145', 32, '79 264 54 58', 'bunoboky@gmail.com', 'sdeck'),
(9, '62010639375', 'Józef', 'Kowalczyk', 'M', 'ul. Zeromskiego 93', 7, '51 755 41 82', 'elerson3@gmail.com', 'dtu1NV'),
(10, '73020634599', 'Marcin', 'Zielinski', 'M', 'ul. Cieszynska 144', 34, '79 130 20 20', 'gsmn@gmail.com', 'tQrWBh'),
(11, '81020241299', 'Marek', 'Szymanski', 'M', 'ul. Swietej Barbary 52', 63, '88 995 05 05', 'chyuf@gmail.pl', '6QjGAS'),
(12, '60041912487', 'Anna', 'Zalewska', 'K', 'ul. Malczycka 116', 37, '78 809 77 60', 'quierjiriu@gmail.com', 'm7RRRZ'),
(13, '57031858661', 'Maria', 'Jakubowska', 'K', 'ul. Krzyzowa 125', 32, '78 252 07 61', 'thyiz_1993@gmail.com', '8FNanZ'),
(14, '48012313848', 'Katarzyna', 'Jasinska', 'K', 'ul. Wislisko 28', 13, '72 250 81 14', 'sekoukyag@mail.ru', 'D12FoG'),
(15, '50080238745', 'Malgorzata', 'Zawadzka', 'K', 'ul. Wrzesniowa 77', 43, '66 222 04 79', 'miol@gmail.com', 'IcTIXV'),
(16, '53050825626', 'Agnieszka', 'Sadowska', 'K', 'ul. Ludna 28', 20, '51 184 21 09', 'cyxaeke@gmail.pl', 'HNavXj'),
(17, '70092489827', 'Krystyna', 'Bak', 'K', 'ul. Bukowska 119', 2, '72 215 89 38', 'quucor@gmail.com', 'UsYhE3'),
(19, '81102812421', 'Ewa', 'Wlodarczyk', 'K', 'ul. Chorzowska 46', 40, '67 410 43 53', 'raetuz@gmail.pl', 'MFpL0i'),
(20, '71020995168', 'Elzbieta', 'Borkowska', 'K', 'ul. Belgijska 93', 53, '60 300 04 99', 'chiekooty@gmail.com', 'wRHJn9'),
(21, '48092471863', 'Zofia', 'Czarnecka', 'K', 'ul. Jagielly Wladyslawa 7', 11, '67 442 69 41', 'biazjigju@gmail.com', '4EDevB');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`AdministratorID`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Id_Category`);

--
-- Indeksy dla tabeli `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`Id_City`);

--
-- Indeksy dla tabeli `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `ProdIDFK` (`ProdID`),
  ADD KEY `OrderIDFk` (`OrderID`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ClientIDfFK` (`ClientIDf`),
  ADD KEY `WorkerIDfFK` (`WorkerIDf`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id_Product`),
  ADD KEY `CategoryIDFK` (`Id_Category`),
  ADD KEY `WarehouseDeliveryIDFK` (`Id_WarehouseDelivery`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id_User`),
  ADD UNIQUE KEY `ClientEmail` (`Email`),
  ADD KEY `CLientCityFK` (`Id_City`);

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
-- Indeksy dla tabeli `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`WorkerID`),
  ADD KEY `WorkerCityIDFK` (`WorkerCityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `administrators`
--
ALTER TABLE `administrators`
  MODIFY `AdministratorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `Id_Category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `cities`
--
ALTER TABLE `cities`
  MODIFY `Id_City` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT dla tabeli `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `Id_Product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `Id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT dla tabeli `workers`
--
ALTER TABLE `workers`
  MODIFY `WorkerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `OrderIDFk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `ProdIDFK` FOREIGN KEY (`ProdID`) REFERENCES `products` (`Id_Product`);

--
-- Ograniczenia dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `ClientIDfFK` FOREIGN KEY (`ClientIDf`) REFERENCES `users` (`Id_User`),
  ADD CONSTRAINT `WorkerIDfFK` FOREIGN KEY (`WorkerIDf`) REFERENCES `workers` (`WorkerID`);

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `CategoryIDFK` FOREIGN KEY (`Id_Category`) REFERENCES `categories` (`Id_Category`),
  ADD CONSTRAINT `WarehouseDeliveryIDFK` FOREIGN KEY (`Id_WarehouseDelivery`) REFERENCES `warehousedeliveries` (`WarehouseDeliveryID`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `CLientCityFK` FOREIGN KEY (`Id_City`) REFERENCES `cities` (`Id_City`);

--
-- Ograniczenia dla tabeli `warehousedeliverers`
--
ALTER TABLE `warehousedeliverers`
  ADD CONSTRAINT `DelivererCityIDFK` FOREIGN KEY (`DelivererCityID`) REFERENCES `cities` (`Id_City`);

--
-- Ograniczenia dla tabeli `warehousedeliveries`
--
ALTER TABLE `warehousedeliveries`
  ADD CONSTRAINT `ProductIDFK` FOREIGN KEY (`ProductID`) REFERENCES `products` (`Id_Product`),
  ADD CONSTRAINT `WarehouseDelivererRegonFK` FOREIGN KEY (`DelivererRegon`) REFERENCES `warehousedeliverers` (`REGON`);

--
-- Ograniczenia dla tabeli `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `WorkerCityIDFK` FOREIGN KEY (`WorkerCityID`) REFERENCES `cities` (`Id_City`);
--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Zrzut danych tabeli `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Zrzut danych tabeli `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'sklep2', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"ZawartoÅ›Ä‡ tabeli @TABLE@\",\"latex_data_continued_caption\":\"ZawartoÅ›Ä‡ tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'server', 'sklep2', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"dfdf\",\"forge\",\"homestead\",\"phpmyadmin\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"ZawartoÅ›Ä‡ tabeli @TABLE@\",\"latex_data_continued_caption\":\"ZawartoÅ›Ä‡ tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"forge\",\"table\":\"products\"},{\"db\":\"forge\",\"table\":\"categories\"},{\"db\":\"forge\",\"table\":\"carts\"},{\"db\":\"forge\",\"table\":\"users\"},{\"db\":\"forge\",\"table\":\"order_products\"},{\"db\":\"forge\",\"table\":\"orders\"},{\"db\":\"forge\",\"table\":\"cities\"},{\"db\":\"forge\",\"table\":\"data_rows\"},{\"db\":\"forge\",\"table\":\"order_product\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'forge', 'carts', '[]', '2019-04-14 18:08:44'),
('root', 'forge', 'products', '{\"sorted_col\":\"`Id_Product` ASC\"}', '2019-04-14 17:43:12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('maxair', '2019-04-09 16:51:22', '{\"lang\":\"pl\",\"Console\\/Mode\":\"collapse\"}'),
('root', '2019-04-15 14:22:15', '{\"lang\":\"pl\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
