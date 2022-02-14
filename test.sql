-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 12, 2022 at 02:26 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`) VALUES
(1, 'Milk'),
(2, 'Size'),
(3, 'Shots'),
(4, 'Kind');

-- --------------------------------------------------------

--
-- Table structure for table `option_types`
--

DROP TABLE IF EXISTS `option_types`;
CREATE TABLE IF NOT EXISTS `option_types` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `option_id` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `option_types`
--

INSERT INTO `option_types` (`id`, `name`, `option_id`) VALUES
(1, 'skim', 1),
(2, 'semi', 1),
(3, 'whole', 1),
(4, 'small', 2),
(5, 'medium', 2),
(6, 'large', 2),
(7, 'single', 3),
(8, 'double', 3),
(9, 'triple', 3),
(10, 'chocolate chip', 4),
(11, 'ginger', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) NOT NULL,
  `status` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `amount` int(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `count` int(20) NOT NULL DEFAULT '0',
  `OptionType_id` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'PersonalAccessToken', 'bd15193eb93120f5188b0680e1213a7d0061a3e96c5d4616ed90f7ecc3247da8', '[\"*\"]', NULL, '2022-02-12 05:03:56', '2022-02-12 05:03:56'),
(2, 'App\\Models\\User', 5, 'PersonalAccessToken', '267714bc024838e3a3c2efb5abc004901950b9ae1453483f62a8c742037c10f8', '[\"*\"]', NULL, '2022-02-12 05:06:37', '2022-02-12 05:06:37'),
(3, 'App\\Models\\User', 6, 'PersonalAccessToken', 'f1d35a911135bbf2d42a3dcba483853d9daf6282cb73f49ec190dc53c432d6b1', '[\"*\"]', NULL, '2022-02-12 05:13:53', '2022-02-12 05:13:53'),
(4, 'App\\Models\\User', 7, 'PersonalAccessToken', '4ea9a981ec3ca32a514a330dc902554ffdf22ba3998a074b159e573808810060', '[\"*\"]', NULL, '2022-02-12 05:21:03', '2022-02-12 05:21:03'),
(5, 'App\\Models\\User', 8, 'PersonalAccessToken', 'f666302440d78129530e6bb79df9edee5f2dd483f62359b77cd3a20d69f5263c', '[\"*\"]', NULL, '2022-02-12 05:23:12', '2022-02-12 05:23:12'),
(6, 'App\\Models\\User', 9, 'PersonalAccessToken', '97766dded3002bc50cbcbfadf7bfe37f8168c56ae3ef53dff3dc3a463aaa61b7', '[\"*\"]', NULL, '2022-02-12 05:24:24', '2022-02-12 05:24:24'),
(7, 'App\\Models\\User', 10, 'PersonalAccessToken', 'b321f4f52b57fbc23eac55087e20d8ddf135003438fd5ad776ad0512f396a996', '[\"*\"]', NULL, '2022-02-12 05:24:35', '2022-02-12 05:24:35'),
(8, 'App\\Models\\User', 11, 'PersonalAccessToken', '571b8fe3a8b9670ba43521dd85b57e54032774c40da775d958b838d2c5d501b6', '[\"*\"]', NULL, '2022-02-12 05:25:50', '2022-02-12 05:25:50'),
(9, 'App\\Models\\User', 12, 'PersonalAccessToken', '7e59040a831c8d085bf4d9bdb0fcecf90ebc9f54b7de6960ffd53750c85fbe8b', '[\"*\"]', NULL, '2022-02-12 05:26:17', '2022-02-12 05:26:17'),
(10, 'App\\Models\\User', 13, 'PersonalAccessToken', 'd080ab828600f86a2292a0dc868910ee2548faf37240aa71adf20afae305638b', '[\"*\"]', NULL, '2022-02-12 06:35:04', '2022-02-12 06:35:04'),
(11, 'App\\Models\\User', 14, 'PersonalAccessToken', '50eb92e5fe3f526fa454b28226952040250cd914461ebc0c610bf441789a48a5', '[\"*\"]', NULL, '2022-02-12 06:38:25', '2022-02-12 06:38:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(120) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `price` int(255) NOT NULL,
  `option_id` int(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `option_id`) VALUES
(1, 'test1', 10000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'user11', 'test21f11ohihhg1@gamil.com', NULL, '$2y$10$601COnrg538AGPKap9Ml7uqy4U8hJ4ob8NrmMRvO09ik4qu.0Eic6', NULL, '2022-02-12 05:24:35', '2022-02-12 05:24:35'),
(9, 'user11', 'test21f11oihhg1@gamil.com', NULL, '$2y$10$JVS3qXIDizRECZMWEkulDuQGaKvixIpN69JeLDwWo2D57EKZNP2vy', NULL, '2022-02-12 05:24:23', '2022-02-12 05:24:23'),
(8, 'user11', 'test21f11oi1@gamil.com', NULL, '$2y$10$X1Ujt0xU9sQdMiTEPfMCg.kRiohXpL3uL0OsF7YI4msAG64SpWJfy', NULL, '2022-02-12 05:23:12', '2022-02-12 05:23:12'),
(7, 'user11', 'test21f111@gamil.com', NULL, '$2y$10$74a2mg6CYDKbYvCoDOdSG.2M7bZCOa7a0JT5W5kL1bhYvqHv4o1om', NULL, '2022-02-12 05:21:03', '2022-02-12 05:21:03'),
(11, 'user11', 'test21f11ohihhg1@gamil.com', NULL, '$2y$10$suVaisL/XK./Ah1XVBQFf.xi4./o3nDoR.gZyCDw/GTs4RY6nIYdS', NULL, '2022-02-12 05:25:50', '2022-02-12 05:25:50'),
(12, 'user11', 'test21f11ohihhg1@gamil.com', NULL, '$2y$10$XduMarCbbUXrvTsoEiH/X.RjSerJ4fqHrSojog7ySq8iss8ibDC/W', NULL, '2022-02-12 05:26:17', '2022-02-12 05:26:17'),
(13, 'user11', 'test21f11ohihhg1@gamil.com', NULL, '$2y$10$UlN1TZsHC35Iz1PhXppEbexpfLR66gb9Q.J8mIHez5Q54nxKoqfCS', NULL, '2022-02-12 06:35:02', '2022-02-12 06:35:02'),
(14, 'user11', 'test21f11ohihhg1@gamil.com', NULL, '$2y$10$0qLllRk7DaCKQJJRFNJhX.L.9kjbgy8rxl28u2pLdFSP/iYcHZblC', NULL, '2022-02-12 06:38:25', '2022-02-12 06:38:25');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
