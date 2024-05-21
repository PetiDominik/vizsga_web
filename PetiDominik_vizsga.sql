-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 21. 17:52
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vizsga`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_21_135143_create_temas_table', 1),
(6, '2024_05_21_135150_create_szavaks_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szavaks`
--

CREATE TABLE IF NOT EXISTS `szavaks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `angol` varchar(255) NOT NULL,
  `magyar` varchar(255) NOT NULL,
  `temaId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `szavaks_temaid_foreign` (`temaId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `szavaks`
--

INSERT INTO `szavaks` (`id`, `angol`, `magyar`, `temaId`, `created_at`, `updated_at`) VALUES
(1, 'keyboard', 'billentyűzet', 1, '2024-05-21 12:12:55', '2024-05-21 12:12:55'),
(2, 'motherboard', 'alaplap', 1, '2024-05-21 12:12:55', '2024-05-21 12:12:55'),
(3, 'brake', 'fék', 2, '2024-05-21 12:12:55', '2024-05-21 12:12:55'),
(4, 'engine', 'motor', 2, '2024-05-21 12:12:55', '2024-05-21 12:12:55');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `temas`
--

CREATE TABLE IF NOT EXISTS `temas` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `temanev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `temas`
--

INSERT INTO `temas` (`id`, `temanev`, `created_at`, `updated_at`) VALUES
(1, 'informatikai', '2024-05-21 12:12:55', '2024-05-21 12:12:55'),
(2, 'autós', '2024-05-21 12:12:55', '2024-05-21 12:12:55');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `szavaks`
--
ALTER TABLE `szavaks`
  ADD CONSTRAINT `szavaks_temaid_foreign` FOREIGN KEY (`temaId`) REFERENCES `temas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
