-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para pokemon
CREATE DATABASE IF NOT EXISTS `pokemon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pokemon`;

-- Volcando estructura para tabla pokemon.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.cache: ~0 rows (aproximadamente)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('laravel-cache-pokeapi:pokemon:1', 'a:8:{s:2:"id";i:1;s:4:"name";s:9:"bulbasaur";s:6:"height";i:7;s:6:"weight";i:69;s:5:"types";a:2:{i:0;a:2:{s:4:"name";s:5:"grass";s:3:"url";s:34:"https://pokeapi.co/api/v2/type/12/";}i:1;a:2:{s:4:"name";s:6:"poison";s:3:"url";s:33:"https://pokeapi.co/api/v2/type/4/";}}s:9:"abilities";a:2:{i:0;a:2:{s:4:"name";s:8:"overgrow";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/65/";}i:1;a:2:{s:4:"name";s:11:"chlorophyll";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/34/";}}s:16:"official_artwork";s:101:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png";s:5:"stats";a:4:{s:2:"hp";i:45;s:6:"attack";i:49;s:7:"defense";i:49;s:5:"speed";i:45;}}', 1784746982),
	('laravel-cache-pokeapi:pokemon:2', 'a:8:{s:2:"id";i:2;s:4:"name";s:7:"ivysaur";s:6:"height";i:10;s:6:"weight";i:130;s:5:"types";a:2:{i:0;a:2:{s:4:"name";s:5:"grass";s:3:"url";s:34:"https://pokeapi.co/api/v2/type/12/";}i:1;a:2:{s:4:"name";s:6:"poison";s:3:"url";s:33:"https://pokeapi.co/api/v2/type/4/";}}s:9:"abilities";a:2:{i:0;a:2:{s:4:"name";s:8:"overgrow";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/65/";}i:1;a:2:{s:4:"name";s:11:"chlorophyll";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/34/";}}s:16:"official_artwork";s:101:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png";s:5:"stats";a:4:{s:2:"hp";i:60;s:6:"attack";i:62;s:7:"defense";i:63;s:5:"speed";i:60;}}', 1784746970),
	('laravel-cache-pokeapi:pokemon:3', 'a:8:{s:2:"id";i:3;s:4:"name";s:8:"venusaur";s:6:"height";i:20;s:6:"weight";i:1000;s:5:"types";a:2:{i:0;a:2:{s:4:"name";s:5:"grass";s:3:"url";s:34:"https://pokeapi.co/api/v2/type/12/";}i:1;a:2:{s:4:"name";s:6:"poison";s:3:"url";s:33:"https://pokeapi.co/api/v2/type/4/";}}s:9:"abilities";a:2:{i:0;a:2:{s:4:"name";s:8:"overgrow";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/65/";}i:1;a:2:{s:4:"name";s:11:"chlorophyll";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/34/";}}s:16:"official_artwork";s:101:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png";s:5:"stats";a:4:{s:2:"hp";i:80;s:6:"attack";i:82;s:7:"defense";i:83;s:5:"speed";i:80;}}', 1784746518),
	('laravel-cache-pokeapi:pokemon:4', 'a:8:{s:2:"id";i:4;s:4:"name";s:10:"charmander";s:6:"height";i:6;s:6:"weight";i:85;s:5:"types";a:1:{i:0;a:2:{s:4:"name";s:4:"fire";s:3:"url";s:34:"https://pokeapi.co/api/v2/type/10/";}}s:9:"abilities";a:2:{i:0;a:2:{s:4:"name";s:5:"blaze";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/66/";}i:1;a:2:{s:4:"name";s:11:"solar-power";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/94/";}}s:16:"official_artwork";s:101:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png";s:5:"stats";a:4:{s:2:"hp";i:39;s:6:"attack";i:52;s:7:"defense";i:43;s:5:"speed";i:65;}}', 1784746550),
	('laravel-cache-pokeapi:pokemon:5', 'a:8:{s:2:"id";i:5;s:4:"name";s:10:"charmeleon";s:6:"height";i:11;s:6:"weight";i:190;s:5:"types";a:1:{i:0;a:2:{s:4:"name";s:4:"fire";s:3:"url";s:34:"https://pokeapi.co/api/v2/type/10/";}}s:9:"abilities";a:2:{i:0;a:2:{s:4:"name";s:5:"blaze";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/66/";}i:1;a:2:{s:4:"name";s:11:"solar-power";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/94/";}}s:16:"official_artwork";s:101:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png";s:5:"stats";a:4:{s:2:"hp";i:58;s:6:"attack";i:64;s:7:"defense";i:58;s:5:"speed";i:80;}}', 1784746586),
	('laravel-cache-pokeapi:pokemon:55', 'a:8:{s:2:"id";i:55;s:4:"name";s:7:"golduck";s:6:"height";i:17;s:6:"weight";i:766;s:5:"types";a:1:{i:0;a:2:{s:4:"name";s:5:"water";s:3:"url";s:34:"https://pokeapi.co/api/v2/type/11/";}}s:9:"abilities";a:3:{i:0;a:2:{s:4:"name";s:4:"damp";s:3:"url";s:36:"https://pokeapi.co/api/v2/ability/6/";}i:1;a:2:{s:4:"name";s:10:"cloud-nine";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/13/";}i:2;a:2:{s:4:"name";s:10:"swift-swim";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/33/";}}s:16:"official_artwork";s:102:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/55.png";s:5:"stats";a:4:{s:2:"hp";i:80;s:6:"attack";i:82;s:7:"defense";i:78;s:5:"speed";i:85;}}', 1784746806),
	('laravel-cache-pokeapi:pokemon:56', 'a:8:{s:2:"id";i:56;s:4:"name";s:6:"mankey";s:6:"height";i:5;s:6:"weight";i:280;s:5:"types";a:1:{i:0;a:2:{s:4:"name";s:8:"fighting";s:3:"url";s:33:"https://pokeapi.co/api/v2/type/2/";}}s:9:"abilities";a:3:{i:0;a:2:{s:4:"name";s:12:"vital-spirit";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/72/";}i:1;a:2:{s:4:"name";s:11:"anger-point";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/83/";}i:2;a:2:{s:4:"name";s:7:"defiant";s:3:"url";s:38:"https://pokeapi.co/api/v2/ability/128/";}}s:16:"official_artwork";s:102:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/56.png";s:5:"stats";a:4:{s:2:"hp";i:40;s:6:"attack";i:80;s:7:"defense";i:35;s:5:"speed";i:70;}}', 1784747086),
	('laravel-cache-pokeapi:pokemon:chikorita', 'a:8:{s:2:"id";i:152;s:4:"name";s:9:"chikorita";s:6:"height";i:9;s:6:"weight";i:64;s:5:"types";a:1:{i:0;a:2:{s:4:"name";s:5:"grass";s:3:"url";s:34:"https://pokeapi.co/api/v2/type/12/";}}s:9:"abilities";a:2:{i:0;a:2:{s:4:"name";s:8:"overgrow";s:3:"url";s:37:"https://pokeapi.co/api/v2/ability/65/";}i:1;a:2:{s:4:"name";s:10:"leaf-guard";s:3:"url";s:38:"https://pokeapi.co/api/v2/ability/102/";}}s:16:"official_artwork";s:103:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/152.png";s:5:"stats";a:4:{s:2:"hp";i:45;s:6:"attack";i:49;s:7:"defense";i:65;s:5:"speed";i:45;}}', 1784746735);

-- Volcando estructura para tabla pokemon.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.cache_locks: ~0 rows (aproximadamente)

-- Volcando estructura para tabla pokemon.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla pokemon.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla pokemon.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.job_batches: ~0 rows (aproximadamente)

-- Volcando estructura para tabla pokemon.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.migrations: ~1 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_07_22_115224_create_pokemon_search_logs_table', 2);

-- Volcando estructura para tabla pokemon.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla pokemon.pokemon_search_logs
CREATE TABLE IF NOT EXISTS `pokemon_search_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pokemon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pokemon_id` int DEFAULT NULL,
  `searched_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.pokemon_search_logs: ~30 rows (aproximadamente)
INSERT INTO `pokemon_search_logs` (`id`, `pokemon`, `pokemon_id`, `searched_at`, `created_at`, `updated_at`) VALUES
	(1, 'pikachu', 25, '2026-07-22 17:56:40', '2026-07-22 17:56:40', '2026-07-22 17:56:40'),
	(2, 'chikorita', 152, '2026-07-22 17:56:49', '2026-07-22 17:56:49', '2026-07-22 17:56:49'),
	(3, 'charmander', 4, '2026-07-22 17:57:25', '2026-07-22 17:57:25', '2026-07-22 17:57:25'),
	(4, 'charizard', 6, '2026-07-22 17:57:33', '2026-07-22 17:57:33', '2026-07-22 17:57:33'),
	(5, 'chikorita', 152, '2026-07-22 17:57:38', '2026-07-22 17:57:38', '2026-07-22 17:57:38'),
	(6, 'charmander', 4, '2026-07-22 18:02:48', '2026-07-22 18:02:48', '2026-07-22 18:02:48'),
	(7, 'chikorita', 152, '2026-07-22 18:03:08', '2026-07-22 18:03:08', '2026-07-22 18:03:08'),
	(8, 'charizard', 6, '2026-07-22 18:03:42', '2026-07-22 18:03:42', '2026-07-22 18:03:42'),
	(9, 'metapod', 11, '2026-07-22 18:04:28', '2026-07-22 18:04:28', '2026-07-22 18:04:28'),
	(10, 'chikorita', 152, '2026-07-22 18:09:20', '2026-07-22 18:09:20', '2026-07-22 18:09:20'),
	(11, 'chikorita', 152, '2026-07-22 18:11:40', '2026-07-22 18:11:40', '2026-07-22 18:11:40'),
	(12, 'chikorita', 152, '2026-07-22 18:12:19', '2026-07-22 18:12:19', '2026-07-22 18:12:19'),
	(13, '152', 152, '2026-07-22 18:13:42', '2026-07-22 18:13:42', '2026-07-22 18:13:42'),
	(14, '152', 152, '2026-07-22 18:13:42', '2026-07-22 18:13:42', '2026-07-22 18:13:42'),
	(15, '150', 150, '2026-07-22 18:13:47', '2026-07-22 18:13:47', '2026-07-22 18:13:47'),
	(16, '150', 150, '2026-07-22 18:16:47', '2026-07-22 18:16:47', '2026-07-22 18:16:47'),
	(17, '150', 150, '2026-07-22 18:16:48', '2026-07-22 18:16:48', '2026-07-22 18:16:48'),
	(18, '150', 150, '2026-07-22 18:16:50', '2026-07-22 18:16:50', '2026-07-22 18:16:50'),
	(19, '150', 150, '2026-07-22 18:16:51', '2026-07-22 18:16:51', '2026-07-22 18:16:51'),
	(20, '150', 150, '2026-07-22 18:16:52', '2026-07-22 18:16:52', '2026-07-22 18:16:52'),
	(21, 'chikorita', 152, '2026-07-22 18:21:19', '2026-07-22 18:21:19', '2026-07-22 18:21:19'),
	(22, 'chikorita', 152, '2026-07-22 18:22:28', '2026-07-22 18:22:28', '2026-07-22 18:22:28'),
	(23, 'chikorita', 152, '2026-07-22 18:27:47', '2026-07-22 18:27:47', '2026-07-22 18:27:47'),
	(24, 'charmander', 4, '2026-07-22 18:28:09', '2026-07-22 18:28:09', '2026-07-22 18:28:09'),
	(25, '1', 1, '2026-07-22 18:28:19', '2026-07-22 18:28:19', '2026-07-22 18:28:19'),
	(26, '2', 2, '2026-07-22 18:40:45', '2026-07-22 18:40:45', '2026-07-22 18:40:45'),
	(27, '3', 3, '2026-07-22 18:45:19', '2026-07-22 18:45:19', '2026-07-22 18:45:19'),
	(28, '3', 3, '2026-07-22 18:45:47', '2026-07-22 18:45:47', '2026-07-22 18:45:47'),
	(29, '4', 4, '2026-07-22 18:45:50', '2026-07-22 18:45:50', '2026-07-22 18:45:50'),
	(30, '5', 5, '2026-07-22 18:46:26', '2026-07-22 18:46:26', '2026-07-22 18:46:26'),
	(31, 'chikorita', 152, '2026-07-22 18:48:57', '2026-07-22 18:48:57', '2026-07-22 18:48:57'),
	(32, 'chikorita', 152, '2026-07-22 18:50:00', '2026-07-22 18:50:00', '2026-07-22 18:50:00'),
	(33, '55', 55, '2026-07-22 18:50:15', '2026-07-22 18:50:15', '2026-07-22 18:50:15'),
	(34, '2', 2, '2026-07-22 18:52:51', '2026-07-22 18:52:51', '2026-07-22 18:52:51'),
	(35, '1', 1, '2026-07-22 18:53:04', '2026-07-22 18:53:04', '2026-07-22 18:53:04'),
	(36, '1', 1, '2026-07-22 18:53:08', '2026-07-22 18:53:08', '2026-07-22 18:53:08'),
	(37, '1', 1, '2026-07-22 18:53:12', '2026-07-22 18:53:12', '2026-07-22 18:53:12'),
	(38, '2', 2, '2026-07-22 18:53:16', '2026-07-22 18:53:16', '2026-07-22 18:53:16'),
	(39, '56', 56, '2026-07-22 18:54:47', '2026-07-22 18:54:47', '2026-07-22 18:54:47'),
	(40, '2', 2, '2026-07-22 18:54:56', '2026-07-22 18:54:56', '2026-07-22 18:54:56'),
	(41, '2', 2, '2026-07-22 18:55:07', '2026-07-22 18:55:07', '2026-07-22 18:55:07');

-- Volcando estructura para tabla pokemon.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.sessions: ~1 rows (aproximadamente)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('mkF1lIYhLHvyCJQq0Cvgz4BsYPe4h69IdRGTUM56', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0RkT2RrU1Z6Skx1UlBidlhhcDJGQ0hCZUtiUFRXRFBieFlHWWduVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9wb2tlbW9uLnRlc3QiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784745581),
	('TSZ4WbSMn3O3b4zGYa7livqT60bEyorcPRM5jlTk', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYnpNY2h6dFBHWG0xR2NkRTVodlZhbEtma05HYzhaS0oxUnU4RUNXciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9wb2tlbW9uLnRlc3QiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1784745558),
	('ufgNIKsQKZ7lFT7bIYMYuga3vZOjc7bWONhuhNmK', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT0I5OTJjdTA2QjllcG5PWWJjdzlQc3dZZzFjSlpVRVpUTVdyUlB5USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly9wb2tlbW9uLnRlc3QiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1784746519);

-- Volcando estructura para tabla pokemon.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla pokemon.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'brayam teofilo jimenez', 'brateomx@gmail.com', NULL, '$2y$12$FU3/WjrZ4wzxrzcOFlJQTeKad9YFplxsw3ef/MU.fvMjW/jdQX/Eq', NULL, '2026-07-22 17:36:11', '2026-07-22 17:36:11');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
