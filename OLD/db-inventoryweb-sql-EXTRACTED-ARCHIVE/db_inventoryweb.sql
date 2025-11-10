-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Sep 2025 pada 05.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventoryweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_10_31_061811_create_menu_table', 1),
(4, '2022_11_01_041110_create_table_role', 1),
(5, '2022_11_01_083314_create_table_user', 1),
(6, '2022_11_03_023905_create_table_submenu', 1),
(7, '2022_11_03_064417_create_tbl_akses', 1),
(8, '2022_11_08_024215_create_tbl_web', 1),
(9, '2022_11_15_131148_create_tbl_jenisbarang', 2),
(10, '2022_11_15_173700_create_tbl_satuan', 3),
(11, '2022_11_15_180434_create_tbl_merk', 4),
(12, '2022_11_16_120018_create_tbl_appreance', 5),
(13, '2022_11_25_141731_create_tbl_barang', 6),
(14, '2022_11_26_011349_create_tbl_customer', 7),
(16, '2022_11_28_151108_create_tbl_barangmasuk', 8),
(17, '2022_11_30_115904_create_tbl_barangkeluar', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_akses`
--

CREATE TABLE `tbl_akses` (
  `akses_id` int(10) UNSIGNED NOT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `submenu_id` varchar(255) DEFAULT NULL,
  `othermenu_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) NOT NULL,
  `akses_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_akses`
--

INSERT INTO `tbl_akses` (`akses_id`, `menu_id`, `submenu_id`, `othermenu_id`, `role_id`, `akses_type`, `created_at`, `updated_at`) VALUES
(296, '1667444041', NULL, NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(297, '1667444041', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(298, '1667444041', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(299, '1667444041', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(301, '1668509889', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(302, '1668509889', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(303, '1668509889', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(304, '1668510437', NULL, NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(305, '1668510437', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(306, '1668510437', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(307, '1668510437', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(308, '1668510568', NULL, NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(309, '1668510568', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(310, '1668510568', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(311, '1668510568', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(312, NULL, '9', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(313, NULL, '9', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(314, NULL, '9', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(324, NULL, '10', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(325, NULL, '10', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(326, NULL, '10', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(345, NULL, NULL, '2', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(346, NULL, NULL, '3', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(347, NULL, NULL, '4', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(349, NULL, NULL, '6', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(350, NULL, NULL, '1', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(351, NULL, NULL, '2', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(352, NULL, NULL, '3', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(353, NULL, NULL, '4', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(355, NULL, NULL, '6', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(356, NULL, NULL, '1', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(357, NULL, NULL, '2', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(358, NULL, NULL, '3', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(359, NULL, NULL, '4', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(361, NULL, NULL, '6', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(362, NULL, NULL, '1', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(363, NULL, NULL, '2', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(364, NULL, NULL, '3', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(365, NULL, NULL, '4', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(367, NULL, NULL, '6', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(368, '1667444041', NULL, NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(369, '1667444041', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(370, '1667444041', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(371, '1667444041', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(373, '1668509889', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(374, '1668509889', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(375, '1668509889', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(376, '1668510437', NULL, NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(377, '1668510437', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(378, '1668510437', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(379, '1668510437', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(381, '1668510568', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(382, '1668510568', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(383, '1668510568', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(384, NULL, '9', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(385, NULL, '9', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(386, NULL, '9', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(387, NULL, '9', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(396, NULL, '10', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(397, NULL, '10', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(398, NULL, '10', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(399, NULL, '10', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(417, NULL, NULL, '2', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(418, NULL, NULL, '3', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(419, NULL, NULL, '4', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(420, NULL, NULL, '5', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(421, NULL, NULL, '6', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(422, NULL, NULL, '1', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(423, NULL, NULL, '2', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(424, NULL, NULL, '3', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(425, NULL, NULL, '4', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(426, NULL, NULL, '5', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(427, NULL, NULL, '6', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(428, NULL, NULL, '1', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(429, NULL, NULL, '2', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(430, NULL, NULL, '3', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(431, NULL, NULL, '4', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(432, NULL, NULL, '5', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(433, NULL, NULL, '6', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(434, NULL, NULL, '1', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(435, NULL, NULL, '2', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(436, NULL, NULL, '3', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(437, NULL, NULL, '4', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(438, NULL, NULL, '5', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(439, NULL, NULL, '6', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(445, '1669390641', NULL, NULL, '2', 'create', '2022-11-25 08:38:31', '2022-11-25 08:38:31'),
(446, '1669390641', NULL, NULL, '2', 'update', '2022-11-25 08:38:31', '2022-11-25 08:38:31'),
(447, '1669390641', NULL, NULL, '2', 'delete', '2022-11-25 08:38:32', '2022-11-25 08:38:32'),
(448, '1669390641', NULL, NULL, '3', 'view', '2022-11-25 08:38:49', '2022-11-25 08:38:49'),
(449, '1669390641', NULL, NULL, '3', 'create', '2022-11-25 08:38:55', '2022-11-25 08:38:55'),
(450, '1669390641', NULL, NULL, '3', 'update', '2022-11-25 08:38:55', '2022-11-25 08:38:55'),
(451, '1669390641', NULL, NULL, '3', 'delete', '2022-11-25 08:38:57', '2022-11-25 08:38:57'),
(464, NULL, '21', NULL, '2', 'view', '2022-11-30 05:58:28', '2022-11-30 05:58:28'),
(465, NULL, '22', NULL, '2', 'view', '2022-11-30 05:58:29', '2022-11-30 05:58:29'),
(466, NULL, '23', NULL, '2', 'view', '2022-11-30 05:58:31', '2022-11-30 05:58:31'),
(467, NULL, '21', NULL, '2', 'create', '2022-11-30 05:59:04', '2022-11-30 05:59:04'),
(468, NULL, '21', NULL, '2', 'update', '2022-11-30 05:59:05', '2022-11-30 05:59:05'),
(471, NULL, '22', NULL, '2', 'update', '2022-11-30 05:59:08', '2022-11-30 05:59:08'),
(472, NULL, '22', NULL, '2', 'create', '2022-11-30 05:59:09', '2022-11-30 05:59:09'),
(473, NULL, '23', NULL, '2', 'create', '2022-11-30 05:59:10', '2022-11-30 05:59:10'),
(474, NULL, '23', NULL, '2', 'update', '2022-11-30 05:59:11', '2022-11-30 05:59:11'),
(476, NULL, '21', NULL, '3', 'view', '2022-11-30 05:59:47', '2022-11-30 05:59:47'),
(477, NULL, '22', NULL, '3', 'view', '2022-11-30 05:59:48', '2022-11-30 05:59:48'),
(478, NULL, '23', NULL, '3', 'view', '2022-11-30 05:59:48', '2022-11-30 05:59:48'),
(479, NULL, '21', NULL, '3', 'create', '2022-11-30 06:00:24', '2022-11-30 06:00:24'),
(480, NULL, '21', NULL, '3', 'update', '2022-11-30 06:00:25', '2022-11-30 06:00:25'),
(481, NULL, '21', NULL, '3', 'delete', '2022-11-30 06:00:26', '2022-11-30 06:00:26'),
(482, NULL, '22', NULL, '3', 'delete', '2022-11-30 06:00:27', '2022-11-30 06:00:27'),
(483, NULL, '22', NULL, '3', 'update', '2022-11-30 06:00:28', '2022-11-30 06:00:28'),
(484, NULL, '22', NULL, '3', 'create', '2022-11-30 06:00:29', '2022-11-30 06:00:29'),
(485, NULL, '23', NULL, '3', 'create', '2022-11-30 06:00:30', '2022-11-30 06:00:30'),
(486, NULL, '23', NULL, '3', 'update', '2022-11-30 06:00:30', '2022-11-30 06:00:30'),
(487, NULL, '23', NULL, '3', 'delete', '2022-11-30 06:00:31', '2022-11-30 06:00:31'),
(570, '1668509889', NULL, NULL, '2', 'view', '2025-09-12 03:19:23', '2025-09-12 03:19:23'),
(614, '1667444041', NULL, NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(615, '1667444041', NULL, NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(616, '1667444041', NULL, NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(617, '1667444041', NULL, NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(618, '1668509889', NULL, NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(619, '1668509889', NULL, NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(620, '1668509889', NULL, NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(621, '1668509889', NULL, NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(622, '1669390641', NULL, NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(623, '1669390641', NULL, NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(624, '1669390641', NULL, NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(625, '1669390641', NULL, NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(626, '1668510437', NULL, NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(627, '1668510437', NULL, NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(628, '1668510437', NULL, NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(629, '1668510437', NULL, NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(630, '1668510568', NULL, NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(631, '1668510568', NULL, NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(632, '1668510568', NULL, NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(633, '1668510568', NULL, NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(634, NULL, '9', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(635, NULL, '9', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(636, NULL, '9', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(637, NULL, '9', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(638, NULL, '21', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(639, NULL, '21', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(640, NULL, '21', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(641, NULL, '21', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(642, NULL, '43', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(643, NULL, '43', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(644, NULL, '43', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(645, NULL, '43', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(646, NULL, '10', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(647, NULL, '10', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(648, NULL, '10', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(649, NULL, '10', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(650, NULL, '22', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(651, NULL, '22', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(652, NULL, '22', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(653, NULL, '22', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(654, NULL, '44', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(655, NULL, '44', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(656, NULL, '44', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(657, NULL, '44', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(658, NULL, '23', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(659, NULL, '23', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(660, NULL, '23', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(661, NULL, '23', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(662, NULL, '45', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(663, NULL, '45', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(664, NULL, '45', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(665, NULL, '45', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(666, NULL, '46', NULL, '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(667, NULL, '46', NULL, '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(668, NULL, '46', NULL, '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(669, NULL, '46', NULL, '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(670, NULL, NULL, '1', '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(671, NULL, NULL, '2', '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(672, NULL, NULL, '3', '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(673, NULL, NULL, '4', '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(674, NULL, NULL, '5', '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(675, NULL, NULL, '6', '1', 'view', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(676, NULL, NULL, '1', '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(677, NULL, NULL, '2', '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(678, NULL, NULL, '3', '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(679, NULL, NULL, '4', '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(680, NULL, NULL, '5', '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(681, NULL, NULL, '6', '1', 'create', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(682, NULL, NULL, '1', '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(683, NULL, NULL, '2', '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(684, NULL, NULL, '3', '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(685, NULL, NULL, '4', '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(686, NULL, NULL, '5', '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(687, NULL, NULL, '6', '1', 'update', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(688, NULL, NULL, '1', '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(689, NULL, NULL, '2', '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(690, NULL, NULL, '3', '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(691, NULL, NULL, '4', '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(692, NULL, NULL, '5', '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52'),
(693, NULL, NULL, '6', '1', 'delete', '2025-09-15 00:22:52', '2025-09-15 00:22:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_appreance`
--

CREATE TABLE `tbl_appreance` (
  `appreance_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `appreance_layout` varchar(255) DEFAULT NULL,
  `appreance_theme` varchar(255) DEFAULT NULL,
  `appreance_menu` varchar(255) DEFAULT NULL,
  `appreance_header` varchar(255) DEFAULT NULL,
  `appreance_sidestyle` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_appreance`
--

INSERT INTO `tbl_appreance` (`appreance_id`, `user_id`, `appreance_layout`, `appreance_theme`, `appreance_menu`, `appreance_header`, `appreance_sidestyle`, `created_at`, `updated_at`) VALUES
(2, '1', 'sidebar-mini', 'light-mode', 'light-menu', 'header-light', 'default-menu', '2022-11-22 02:45:47', '2025-09-15 05:05:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `barang_id` int(255) NOT NULL,
  `jenisbarang_id` varchar(255) DEFAULT NULL,
  `satuan_id` varchar(255) DEFAULT NULL,
  `merk_id` varchar(255) DEFAULT NULL,
  `barang_kode` varchar(255) NOT NULL,
  `barang_nama` varchar(255) NOT NULL,
  `barang_slug` varchar(255) DEFAULT NULL,
  `barang_harga` varchar(255) NOT NULL,
  `barang_stok` varchar(255) NOT NULL,
  `barang_gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`barang_id`, `jenisbarang_id`, `satuan_id`, `merk_id`, `barang_kode`, `barang_nama`, `barang_slug`, `barang_harga`, `barang_stok`, `barang_gambar`, `created_at`, `updated_at`) VALUES
(8, '11', '5', '7', 'BRG-1757561729525', 'TV Samsung 32 Smart TV', 'tv-samsung-32-smart-tv', '0', '1', 'image.png', '2025-09-10 20:36:18', '2025-09-10 20:41:05'),
(9, '11', '5', '7', 'BRG-1757561919814', 'TV LG 43 LED', 'tv-lg-43-led', '0', '11', 'image.png', '2025-09-10 20:40:40', '2025-09-10 20:40:51'),
(10, '11', '5', '7', 'BRG-1757562093653', 'TV Samsung 40 LED', 'tv-samsung-40-led', '0', '2', 'image.png', '2025-09-10 20:41:50', '2025-09-10 20:42:04'),
(11, '13', '5', '7', 'BRG-1757562133248', 'Cable HDMI', 'cable-hdmi', '0', '18', 'image.png', '2025-09-10 20:43:36', '2025-09-10 20:43:45'),
(12, '13', '5', '7', 'BRG-1757562232204', 'Cable USB', 'cable-usb', '0', '1', 'image.png', '2025-09-10 20:44:51', '2025-09-10 20:45:04'),
(13, '11', '5', '7', 'BRG-1757562354420', 'Lampu LED Solar', 'lampu-led-solar', '0', '4', 'image.png', '2025-09-10 20:46:42', '2025-09-10 20:46:55'),
(14, '11', '5', '7', 'BRG-1757562462437', 'Alarm u HP atau Laptop', 'alarm-u-hp-atau-laptop', '0', '10', 'image.png', '2025-09-10 20:48:56', '2025-09-10 20:49:08'),
(15, '11', '5', '7', 'BRG-1757562680546', 'Electric Pump', 'electric-pump', '0', '1', 'image.png', '2025-09-10 20:51:31', '2025-09-10 20:51:48'),
(16, '14', '5', '7', 'BRG-1757562721983', 'Papper Cutter', 'papper-cutter', '0', '2', 'image.png', '2025-09-10 20:52:11', '2025-09-10 20:52:17'),
(17, '14', '5', '7', 'BRG-1757562742126', 'Flash Disc', 'flash-disc', '0', '9', 'image.png', '2025-09-10 20:52:33', '2025-09-10 20:52:39'),
(18, '14', '5', '7', 'BRG-1757562765520', 'Time Keeper', 'time-keeper', '0', '4', 'image.png', '2025-09-10 20:52:58', '2025-09-10 20:53:04'),
(19, '14', '5', '7', 'BRG-1757562816474', 'Cutting Mate', 'cutting-mate', '0', '1', 'image.png', '2025-09-10 20:54:10', '2025-09-10 20:54:18'),
(20, '11', '5', '7', 'BRG-1757563304245', 'Handy Talky ICOM Hitam', 'handy-talky-icom-hitam', '0', '23', 'image.png', '2025-09-10 21:02:36', '2025-09-11 01:08:58'),
(21, '11', '5', '7', 'BRG-1757563379437', 'Handy Talky ICOM Putih', 'handy-talky-icom-putih', '0', '20', 'image.png', '2025-09-10 21:03:24', '2025-09-10 21:03:43'),
(22, '13', '5', '7', 'BRG-1757563488035', 'Perleng Colokan 4', 'perleng-colokan-4', '0', '0', 'image.png', '2025-09-10 21:05:21', '2025-09-10 21:05:21'),
(23, '13', '5', '7', 'BRG-1757563526778', 'Perleng Colokan 2', 'perleng-colokan-2', '0', '0', 'image.png', '2025-09-10 21:06:29', '2025-09-10 21:06:29'),
(24, '13', '7', '7', 'BRG-1757563598375', 'Perleng Colokan 3', 'perleng-colokan-3', '0', '0', 'image.png', '2025-09-10 21:06:54', '2025-09-10 21:06:54'),
(25, '11', '5', '7', 'BRG-1757563658264', 'Printer Epson L3210', 'printer-epson-l3210', '0', '3', 'image.png', '2025-09-10 21:08:07', '2025-09-10 21:09:30'),
(26, '11', '7', '7', 'BRG-1757566653967', 'Perfect Cue', 'perfect-cue', '0', '1', 'image.png', '2025-09-10 21:58:03', '2025-09-10 21:58:24'),
(27, '12', '5', '7', 'BRG-1757577788754', 'Keyboard Logitech', 'keyboard-logitech', '0', '3', 'image.png', '2025-09-11 01:03:38', '2025-09-11 01:04:08'),
(28, '11', '5', '7', 'BRG-1757577875520', 'Eartech', 'eartech', '0', '9', 'image.png', '2025-09-11 01:05:04', '2025-09-11 01:05:29'),
(29, '18', '5', '7', 'BRG-1757578064526', 'Tripod Signate', 'tripod-signate', '0', '8', 'image.png', '2025-09-11 01:08:19', '2025-09-15 00:15:59'),
(30, '11', '5', '7', 'BRG-1757578206909', 'Orbit', 'orbit', '0', '4', 'image.png', '2025-09-11 01:12:27', '2025-09-15 00:19:13'),
(31, '12', '5', '7', 'BRG-1757578632466', 'Mouse', 'mouse', '0', '0', 'image.png', '2025-09-11 01:17:38', '2025-09-11 01:17:38'),
(32, '13', '5', '7', 'BRG-1757579867210', 'Perleng Colokan 8', 'perleng-colokan-8', '0', '0', 'image.png', '2025-09-11 01:38:06', '2025-09-11 01:38:26'),
(33, '13', '5', '7', 'BRG-1757583193549', 'Cable LAN', 'cable-lan', '0', '0', 'image.png', '2025-09-11 02:33:35', '2025-09-11 02:33:35'),
(34, '13', '5', '7', 'BRG-1757583227294', 'Cable VGA', 'cable-vga', '0', '0', 'image.png', '2025-09-11 02:34:03', '2025-09-11 02:34:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barangkeluar`
--

CREATE TABLE `tbl_barangkeluar` (
  `bk_id` int(10) UNSIGNED NOT NULL,
  `bk_kode` varchar(255) NOT NULL,
  `barang_kode` varchar(255) NOT NULL,
  `bk_tanggal` varchar(255) NOT NULL,
  `bk_tujuan` varchar(255) DEFAULT NULL,
  `bk_jumlah` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_barangkeluar`
--

INSERT INTO `tbl_barangkeluar` (`bk_id`, `bk_kode`, `barang_kode`, `bk_tanggal`, `bk_tujuan`, `bk_jumlah`, `created_at`, `updated_at`) VALUES
(2, 'BK-1669811950758', 'BRG-1669390220236', '2022-11-01', 'Gudang Tasikmalaya', '20', '2022-11-30 05:39:22', '2022-11-30 05:47:14'),
(3, 'BK-1669812439198', 'BRG-1669390175622', '2022-11-02', 'Gudang Prindapan', '5', '2022-11-30 05:47:39', '2023-07-25 21:18:25'),
(4, 'BK-1757406775271', 'BRG-1669390220236', '2025-09-09', 'perbaikan', '2', '2025-09-09 01:33:32', '2025-09-09 01:33:32'),
(5, 'BK-1757584522934', 'BRG-1757562133248', '2025-09-11', 'Event SE', '5', '2025-09-11 02:56:04', '2025-09-11 02:56:04'),
(6, 'BK-1757669773927', 'BRG-1757578064526', '2025-09-12', 'Event daikin', '10', '2025-09-12 02:37:01', '2025-09-12 02:37:01'),
(7, 'BK-1757919393758', 'BRG-1757578206909', '2025-09-12', 'Event SE', '10', '2025-09-14 23:57:40', '2025-09-14 23:57:40'),
(8, 'BK-1757919393758', 'BRG-1757578064526', '2025-09-12', 'Event SE', '20', '2025-09-14 23:57:40', '2025-09-14 23:57:40'),
(9, 'BK-1757919804120', 'BRG-1757583193549', '2025-09-17', 'Event SE', '1', '2025-09-15 00:04:04', '2025-09-15 00:04:04'),
(10, 'BK-1757919804120', 'BRG-1757577875520', '2025-09-17', 'Event SE', '12', '2025-09-15 00:04:04', '2025-09-15 00:04:04'),
(11, 'BK-1757920538384', 'BRG-1757578064526', '2025-09-12', 'Event SE', '32', '2025-09-15 00:15:59', '2025-09-15 00:15:59'),
(12, 'BK-1757920709382', 'BRG-1757578206909', '2025-09-12', 'Event SE', '2', '2025-09-15 00:19:13', '2025-09-15 00:19:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barangmasuk`
--

CREATE TABLE `tbl_barangmasuk` (
  `bm_id` int(10) UNSIGNED NOT NULL,
  `bm_kode` varchar(255) NOT NULL,
  `barang_kode` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `bm_tanggal` varchar(255) NOT NULL,
  `bm_jumlah` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_barangmasuk`
--

INSERT INTO `tbl_barangmasuk` (`bm_id`, `bm_kode`, `barang_kode`, `customer_id`, `bm_tanggal`, `bm_jumlah`, `created_at`, `updated_at`) VALUES
(1, 'BM-1669730554623', 'BRG-1669390220236', '2', '2022-11-01', '50', '2022-11-29 07:02:43', '2022-11-29 07:20:13'),
(2, 'BM-1669731639801', 'BRG-1669390175622', '2', '2022-11-30', '10', '2022-11-29 07:20:55', '2022-11-29 07:20:55'),
(3, 'BM-1757584648318', 'BRG-1757562133248', '2', '2025-09-11', '5', '2025-09-11 02:58:09', '2025-09-11 02:58:09'),
(4, 'BM-1757918655984', 'BRG-1757578206909', '2', '2025-09-11', '5', '2025-09-14 23:45:28', '2025-09-14 23:45:28'),
(5, 'BM-1757918655984', 'BRG-1757578064526', '2', '2025-09-11', '21', '2025-09-14 23:45:28', '2025-09-14 23:45:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_nama` varchar(255) NOT NULL,
  `customer_slug` varchar(255) NOT NULL,
  `customer_alamat` text DEFAULT NULL,
  `customer_notelp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_nama`, `customer_slug`, `customer_alamat`, `customer_notelp`, `created_at`, `updated_at`) VALUES
(2, 'RA Fajar', 'ra-fajar', 'Jakarta', '087817379229', '2022-11-25 18:36:34', '2025-09-11 00:32:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jenisbarang`
--

CREATE TABLE `tbl_jenisbarang` (
  `jenisbarang_id` int(255) UNSIGNED NOT NULL,
  `jenisbarang_nama` varchar(255) NOT NULL,
  `jenisbarang_slug` varchar(255) NOT NULL,
  `jenisbarang_ket` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_jenisbarang`
--

INSERT INTO `tbl_jenisbarang` (`jenisbarang_id`, `jenisbarang_nama`, `jenisbarang_slug`, `jenisbarang_ket`, `created_at`, `updated_at`) VALUES
(11, 'Elektronik', 'elektronik', NULL, '2022-11-25 08:24:18', '2022-11-25 08:25:39'),
(12, 'Perangkat Komputer', 'perangkat-komputer', NULL, '2022-11-25 08:26:15', '2022-11-25 08:27:16'),
(13, 'Kelistrikan', 'kelistrikan', NULL, '2022-11-25 08:27:33', '2025-09-11 21:25:49'),
(14, 'ATK', 'atk', NULL, '2025-09-10 20:37:33', '2025-09-10 20:37:33'),
(15, 'Aksesoris', 'aksesoris', NULL, '2025-09-10 21:28:02', '2025-09-11 21:26:24'),
(18, 'Furniture', 'furniture', NULL, '2025-09-11 01:07:27', '2025-09-11 21:26:11'),
(19, 'Pecah Belah', 'pecah-belah', NULL, '2025-09-11 21:26:55', '2025-09-11 21:26:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `menu_judul` varchar(255) NOT NULL,
  `menu_slug` varchar(255) NOT NULL,
  `menu_icon` varchar(255) NOT NULL,
  `menu_redirect` varchar(255) NOT NULL,
  `menu_sort` varchar(255) NOT NULL,
  `menu_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`menu_id`, `menu_judul`, `menu_slug`, `menu_icon`, `menu_redirect`, `menu_sort`, `menu_type`, `created_at`, `updated_at`) VALUES
(1667444041, 'Dashboard', 'dashboard', 'home', '/dashboard', '1', '1', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(1668509889, 'Master Barang', 'master-barang', 'package', '-', '2', '2', '2022-11-15 03:58:09', '2022-11-15 04:03:15'),
(1668510437, 'Transaksi', 'transaksi', 'repeat', '-', '4', '2', '2022-11-15 04:07:17', '2025-09-14 23:51:08'),
(1668510568, 'Laporan', 'laporan', 'printer', '-', '5', '2', '2022-11-15 04:09:28', '2025-09-14 23:51:08'),
(1669390641, 'Customer', 'customer', 'user', '/customer', '3', '1', '2022-11-25 08:37:21', '2022-11-25 08:37:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_merk`
--

CREATE TABLE `tbl_merk` (
  `merk_id` int(10) UNSIGNED NOT NULL,
  `merk_nama` varchar(255) NOT NULL,
  `merk_slug` varchar(255) NOT NULL,
  `merk_keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_merk`
--

INSERT INTO `tbl_merk` (`merk_id`, `merk_nama`, `merk_slug`, `merk_keterangan`, `created_at`, `updated_at`) VALUES
(7, 'Aset Kantor', 'aset-kantor', NULL, '2022-11-25 08:29:27', '2025-09-10 20:38:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_role`
--

CREATE TABLE `tbl_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_title` varchar(255) NOT NULL,
  `role_slug` varchar(255) NOT NULL,
  `role_desc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_role`
--

INSERT INTO `tbl_role` (`role_id`, `role_title`, `role_slug`, `role_desc`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super-admin', '-', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(2, 'Admin', 'admin', 'Internal Orva', '2022-11-15 03:51:04', '2025-09-12 02:59:42'),
(3, 'Operator', 'operator', 'Eksternal', '2022-11-15 03:51:04', '2025-09-12 02:59:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_satuan`
--

CREATE TABLE `tbl_satuan` (
  `satuan_id` int(10) UNSIGNED NOT NULL,
  `satuan_nama` varchar(255) NOT NULL,
  `satuan_slug` varchar(255) NOT NULL,
  `satuan_keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_satuan`
--

INSERT INTO `tbl_satuan` (`satuan_id`, `satuan_nama`, `satuan_slug`, `satuan_keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Buah', 'buah', NULL, '2022-11-15 10:50:38', '2025-09-11 21:23:21'),
(5, 'Pcs', 'pcs', NULL, '2022-11-24 05:39:15', '2022-11-24 05:39:21'),
(7, 'Box', 'box', NULL, '2022-11-24 05:39:59', '2025-09-11 21:23:09'),
(8, 'Lusin', 'lusin', NULL, '2025-09-11 21:23:30', '2025-09-11 21:23:30'),
(9, 'Meter', 'meter', NULL, '2025-09-11 21:23:39', '2025-09-11 21:23:39'),
(10, 'Set', 'set', NULL, '2025-09-11 21:23:47', '2025-09-11 21:23:47'),
(11, 'Kardus', 'kardus', NULL, '2025-09-11 21:24:09', '2025-09-11 21:24:09'),
(12, 'Lembar', 'lembar', NULL, '2025-09-11 21:24:16', '2025-09-11 21:24:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_submenu`
--

CREATE TABLE `tbl_submenu` (
  `submenu_id` int(10) UNSIGNED NOT NULL,
  `menu_id` varchar(255) NOT NULL,
  `submenu_judul` varchar(255) NOT NULL,
  `submenu_slug` varchar(255) NOT NULL,
  `submenu_redirect` varchar(255) NOT NULL,
  `submenu_sort` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_submenu`
--

INSERT INTO `tbl_submenu` (`submenu_id`, `menu_id`, `submenu_judul`, `submenu_slug`, `submenu_redirect`, `submenu_sort`, `created_at`, `updated_at`) VALUES
(9, '1668510437', 'Barang Masuk', 'barang-masuk', '/barang-masuk', '1', '2022-11-15 04:08:19', '2022-11-15 04:08:19'),
(10, '1668510437', 'Barang Keluar', 'barang-keluar', '/barang-keluar', '2', '2022-11-15 04:08:19', '2022-11-15 04:08:19'),
(21, '1668510568', 'Lap Barang Masuk', 'lap-barang-masuk', '/lap-barang-masuk', '1', '2022-11-30 05:56:24', '2022-11-30 05:56:24'),
(22, '1668510568', 'Lap Barang Keluar', 'lap-barang-keluar', '/lap-barang-keluar', '2', '2022-11-30 05:56:24', '2022-11-30 05:56:24'),
(23, '1668510568', 'Lap Stok Barang', 'lap-stok-barang', '/lap-stok-barang', '3', '2022-11-30 05:56:24', '2022-11-30 05:56:24'),
(43, '1668509889', 'Jenis', 'jenis', '/jenisbarang', '1', '2025-09-14 23:22:50', '2025-09-14 23:22:50'),
(44, '1668509889', 'Satuan', 'satuan', '/satuan', '2', '2025-09-14 23:22:50', '2025-09-14 23:22:50'),
(45, '1668509889', 'Merk', 'merk', '/merk', '3', '2025-09-14 23:22:50', '2025-09-14 23:22:50'),
(46, '1668509889', 'Barang', 'barang', '/barang', '4', '2025-09-14 23:22:50', '2025-09-14 23:22:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` varchar(255) NOT NULL,
  `user_nmlengkap` varchar(255) NOT NULL,
  `user_nama` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_foto` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `role_id`, `user_nmlengkap`, `user_nama`, `user_email`, `user_foto`, `user_password`, `created_at`, `updated_at`) VALUES
(1, '1', 'Super Administrator', 'superadmin', 'superadmin@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(2, '2', 'Administrator', 'admin', 'admin@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(3, '3', 'Operator', 'operator', 'operator@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(4, '4', 'Manajer', 'manajer', 'manajer@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-12-06 02:33:54', '2022-12-06 02:33:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_web`
--

CREATE TABLE `tbl_web` (
  `web_id` int(10) UNSIGNED NOT NULL,
  `web_nama` varchar(255) NOT NULL,
  `web_logo` varchar(255) NOT NULL,
  `web_deskripsi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_web`
--

INSERT INTO `tbl_web` (`web_id`, `web_nama`, `web_logo`, `web_deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Orva Motion', 'rZ2qaf7GVeAdNo195yJ6Na38aibU8mQ3EbyNaZYn.png', 'Mengelola Data Barang Masuk & Barang Keluar', '2022-11-15 03:51:04', '2025-09-09 01:17:36');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `tbl_akses`
--
ALTER TABLE `tbl_akses`
  ADD PRIMARY KEY (`akses_id`);

--
-- Indeks untuk tabel `tbl_appreance`
--
ALTER TABLE `tbl_appreance`
  ADD PRIMARY KEY (`appreance_id`);

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`barang_id`,`barang_kode`,`barang_nama`,`barang_harga`,`barang_stok`);

--
-- Indeks untuk tabel `tbl_barangkeluar`
--
ALTER TABLE `tbl_barangkeluar`
  ADD PRIMARY KEY (`bk_id`);

--
-- Indeks untuk tabel `tbl_barangmasuk`
--
ALTER TABLE `tbl_barangmasuk`
  ADD PRIMARY KEY (`bm_id`);

--
-- Indeks untuk tabel `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `tbl_jenisbarang`
--
ALTER TABLE `tbl_jenisbarang`
  ADD PRIMARY KEY (`jenisbarang_id`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indeks untuk tabel `tbl_merk`
--
ALTER TABLE `tbl_merk`
  ADD PRIMARY KEY (`merk_id`);

--
-- Indeks untuk tabel `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  ADD PRIMARY KEY (`satuan_id`);

--
-- Indeks untuk tabel `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  ADD PRIMARY KEY (`submenu_id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `tbl_web`
--
ALTER TABLE `tbl_web`
  ADD PRIMARY KEY (`web_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_akses`
--
ALTER TABLE `tbl_akses`
  MODIFY `akses_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=694;

--
-- AUTO_INCREMENT untuk tabel `tbl_appreance`
--
ALTER TABLE `tbl_appreance`
  MODIFY `appreance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `barang_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `tbl_barangkeluar`
--
ALTER TABLE `tbl_barangkeluar`
  MODIFY `bk_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_barangmasuk`
--
ALTER TABLE `tbl_barangmasuk`
  MODIFY `bm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_jenisbarang`
--
ALTER TABLE `tbl_jenisbarang`
  MODIFY `jenisbarang_id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1669390642;

--
-- AUTO_INCREMENT untuk tabel `tbl_merk`
--
ALTER TABLE `tbl_merk`
  MODIFY `merk_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  MODIFY `satuan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  MODIFY `submenu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_web`
--
ALTER TABLE `tbl_web`
  MODIFY `web_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
