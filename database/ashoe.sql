-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2020 at 10:56 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ashoe`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `nama`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas.png', NULL, NULL),
(2, 'Nike', 'nike.png', NULL, NULL),
(3, 'Puma', 'puma.png', NULL, NULL),
(4, 'New Balance', 'nb.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_26_080245_create_brands_table', 1),
(5, '2020_12_26_080408_create_products_table', 1),
(7, '2020_12_26_080502_create_order_details_table', 1),
(8, '2020_12_26_080443_create_orders_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_pemesanan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_harga` int(11) NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `kode_pemesanan`, `status`, `total_harga`, `kode_unik`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'AS-4', '2', 4620000, 145, 1, '2020-12-27 01:04:50', '2020-12-27 01:14:11'),
(6, 'AS-6', '1', 2038000, 602, 1, '2020-12-27 01:29:31', '2020-12-27 01:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `nomer_sepatu` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `jumlah_pesanan`, `total_harga`, `nomer_sepatu`, `product_id`, `order_id`, `created_at`, `updated_at`) VALUES
(7, 3, 4620000, 43, 2, 4, '2020-12-27 01:04:50', '2020-12-27 01:04:50'),
(9, 1, 2038000, 43, 3, 6, '2020-12-27 01:29:31', '2020-12-27 01:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `is_ready` tinyint(1) NOT NULL DEFAULT 1,
  `warna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `nama`, `harga`, `is_ready`, `warna`, `deskripsi`, `gambar`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Adidas Tokio Solar Hu Shoes', 1800000, 1, 'Green', 'The latest partnership between Pharrell and NIGO has birthed the adidas TOKIO SOLAR HU, a piece of friendship for the ages.', 'adidas1.png', 1, '2020-12-26 13:36:36', '2020-12-26 13:36:36'),
(2, 'Adidas X9000L4 Shoes', 1540000, 1, 'Black', 'These adidas X9000L Shoes are designed for the fast pace and high energy of our hyperconnected world.', 'adidas2.png', 1, '2020-12-26 13:36:36', '2020-12-26 13:36:36'),
(3, 'Nike LeBron 17 Fire Shoes', 2038000, 1, 'Red', 'The LeBron 17 harnesses LeBron\'s strength and speed with containment and support for all-court domination.', 'nike1.png', 2, '2020-12-26 13:41:00', '2020-12-26 13:41:00'),
(4, 'Nike Zoomx Superrep Surge', 1777000, 1, 'Black', 'The Nike ZoomX SuperRep Surge is built for classes and workouts that keep you moving. From the treadmill to the rowing machine to strength training.', 'nike2.png', 2, '2020-12-26 13:44:05', '2020-12-26 13:44:05'),
(6, 'Puma Mercedes-AMG Petronas', 2073000, 1, 'Gray', 'In 1999, the iconic Speedcatwas unleashed to the public, bringing fast-paced F1 track style to the street, setting the tone for the race-inspired streetwear and the low profile trend.', 'puma1.png', 3, '2020-12-26 14:21:24', '2020-12-26 14:21:24'),
(7, 'Puma x Porsche Legacy RS-2K', 1800660, 1, 'Black', 'PRODUCT STORY These PUMA x Porsche Legacy shoes are the ultimate in motorsport fashion. Featuring a bulky silhouette and a plush, moulded sockliner, plus bold PUMA and Porsche Legacy branding, you\'ll feel on trend, every step of the way.', 'puma2.png', 3, NULL, NULL),
(8, 'New Balance 574 Core Men\'s', 1299000, 1, 'Gray', 'The 574 Sport brings New Balance\'s newest running technology and a touch of current fashion into one shoe.', 'nb1.png', 4, '2020-12-26 14:27:30', '2020-12-26 14:27:30'),
(9, 'New Balance Fuelcell TC', 2391769, 0, 'Red', 'ngineered to meet the demands of marathons and training runs alike, our FuelCell TC running shoe combines a fast and fierce feel with impressive durability.', 'nb2.png', 4, '2020-12-26 14:29:46', '2020-12-26 14:29:46'),
(10, 'Nike Jumpman Air Jordan 1 Mid', 1833524, 1, 'Blue', 'The Air Jordan 1 Mid “Blue” is yet another crisp colorway of Michael Jordan’s signature shoe in its mid-top design.', 'nike3.png', 2, '2020-12-27 09:41:56', '2020-12-27 09:41:56'),
(11, 'Nike Jordan Max 200 Men\'s Shoe', 1438000, 1, 'Red', 'With design elements inspired by the Air Jordan 4, the Jordan Max 200 brings a new level of Air to Jordan, for details anchored in legacy and comfort made for the future.', 'nike4.png', 2, '2020-12-27 09:46:59', '2020-12-27 09:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `alamat`, `nohp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohammad Salah', 'msalah@gmail.com', NULL, '$2y$10$6GA5fuD872pygw5TXOS0D.y0/gB3pX0/avI5694a/suCwnnRcA0dG', 'Jl. Anfield No.11', '08999447656', NULL, '2020-12-26 03:22:11', '2020-12-27 01:14:11'),
(2, 'Tammy Abraham', 'abraham@gmail.com', NULL, '$2y$10$UhFtFnxGakGu.IBPjSSfNeuYXPcDpjGft0nomdqtLl7DtxkjB2W2G', NULL, NULL, NULL, '2020-12-26 22:06:27', '2020-12-26 22:06:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
