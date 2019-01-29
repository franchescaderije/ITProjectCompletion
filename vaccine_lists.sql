-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2019 at 09:01 AM
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
-- Database: `unitedspecialtyclinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_lists`
--

CREATE TABLE `vaccine_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `vaccine_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaccine_lot_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaccine_receive_date` date NOT NULL,
  `vaccine_expiration_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `vaccine_price` int(11) NOT NULL,
  `status` enum('Available','Damaged','Expired','Returned','Replaced','Consumed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaccine_types_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_lists`
--

INSERT INTO `vaccine_lists` (`id`, `vaccine_name`, `vaccine_lot_number`, `vaccine_receive_date`, `vaccine_expiration_date`, `quantity`, `vaccine_price`, `status`, `vaccine_types_id`, `created_at`, `updated_at`) VALUES
(1, 'TICE BCG', '15151HD', '2019-01-15', '2020-01-23', 399, 1500, 'Available', 1, '2019-01-29 04:57:02', '2019-01-29 04:57:02'),
(2, 'TICE BCG', '18552DF', '2019-01-09', '2020-01-26', 499, 1500, 'Available', 1, '2019-01-29 04:58:07', '2019-01-29 04:58:07'),
(3, 'TICE BCG', '88545GH', '2018-01-22', '2019-03-14', 249, 1500, 'Available', 1, '2019-01-29 04:58:46', '2019-01-29 04:58:46'),
(4, 'Recombivax HB', '88548AF', '2019-01-24', '2019-09-07', 499, 2000, 'Available', 2, '2019-01-29 04:59:57', '2019-01-29 04:59:57'),
(5, 'Engerix-B', '88845GH', '2018-09-10', '2020-09-17', 498, 2500, 'Available', 2, '2019-01-29 05:00:44', '2019-01-29 05:00:44'),
(6, 'HEPLISAV-B', '26448AF', '2018-05-10', '2019-02-21', 300, 2000, 'Available', 2, '2019-01-29 05:01:41', '2019-01-29 05:01:41'),
(7, 'Certiva', '55252JK', '2018-10-02', '2020-01-09', 499, 2500, 'Available', 3, '2019-01-29 05:03:23', '2019-01-29 05:03:23'),
(8, 'Daptacel', '86636HY', '2018-05-10', '2020-10-10', 499, 2500, 'Available', 3, '2019-01-29 05:04:02', '2019-01-29 05:04:02'),
(9, 'Infanrix', '54541PK', '2018-02-16', '2019-03-04', 100, 2200, 'Available', 3, '2019-01-29 05:04:43', '2019-01-29 05:04:43'),
(10, 'Kinrix', '57445JH', '2018-06-09', '2019-05-17', 250, 2300, 'Available', 3, '2019-01-29 05:05:28', '2019-01-29 05:05:28'),
(11, 'Pediarix', '55252HG', '2018-10-10', '2019-09-14', 300, 2500, 'Available', 3, '2019-01-29 05:08:11', '2019-01-29 05:08:11'),
(12, 'IPOL', '55263BH', '2018-09-19', '2019-09-24', 499, 1500, 'Available', 4, '2019-01-29 05:10:50', '2019-01-29 05:10:50'),
(13, 'IPOL', '48452BG', '2018-05-16', '2019-03-25', 200, 1200, 'Available', 4, '2019-01-29 05:11:27', '2019-01-29 05:11:27'),
(14, 'IPOL', '22525NJ', '2018-12-02', '2019-09-24', 449, 1500, 'Available', 4, '2019-01-29 05:12:06', '2019-01-29 05:12:06'),
(15, 'Prevnar 13', '24848MK', '2019-01-29', '2020-12-12', 599, 2250, 'Available', 5, '2019-01-29 05:13:06', '2019-01-29 05:13:06'),
(16, 'Prevnar', '96654LO', '2019-01-01', '2020-09-08', 498, 2500, 'Available', 5, '2019-01-29 05:14:22', '2019-01-29 05:14:22'),
(17, 'Prevnar', '56588HG', '2018-06-09', '2019-09-12', 450, 2500, 'Available', 5, '2019-01-29 05:14:59', '2019-01-29 05:14:59'),
(18, 'ROTARIX', '77548KL', '2018-05-23', '2019-03-17', 250, 1500, 'Available', 6, '2019-01-29 05:15:54', '2019-01-29 05:15:54'),
(19, 'RotaTeq', '66589JU', '2018-09-19', '2019-06-11', 500, 1500, 'Available', 6, '2019-01-29 05:16:43', '2019-01-29 05:16:43'),
(20, 'RotaTeq', '55263HU', '2019-01-29', '2020-01-09', 500, 1500, 'Available', 6, '2019-01-29 05:17:26', '2019-01-29 05:17:26'),
(21, 'FluMist', '25236GH', '2018-09-01', '2020-05-03', 250, 1500, 'Available', 7, '2019-01-29 05:18:35', '2019-01-29 05:18:35'),
(22, 'Fluarix', '52118KL', '2018-06-05', '2020-06-05', 498, 1500, 'Available', 7, '2019-01-29 05:19:12', '2019-01-29 05:19:12'),
(23, 'Fluvirin', '55888FG', '2018-09-11', '2020-09-16', 499, 1500, 'Available', 7, '2019-01-29 05:19:51', '2019-01-29 05:19:51'),
(24, 'Agriflu', '66585FG', '2018-05-04', '2019-03-31', 150, 1500, 'Available', 7, '2019-01-29 05:20:51', '2019-01-29 05:20:51'),
(25, 'Afluria', '66585PO', '2018-09-09', '2019-06-18', 310, 1500, 'Available', 7, '2019-01-29 05:22:17', '2019-01-29 05:22:17'),
(26, 'M-M-Vax', '95858BY', '2018-12-03', '2020-03-09', 500, 2000, 'Available', 8, '2019-01-29 05:23:39', '2019-01-29 05:23:39'),
(27, 'M-M-R II', '23262NH', '2018-09-12', '2019-09-18', 599, 2000, 'Available', 8, '2019-01-29 05:24:27', '2019-01-29 05:24:27'),
(28, 'M-M-R II', '45484KL', '2018-06-11', '2019-09-25', 250, 2000, 'Available', 8, '2019-01-29 05:25:04', '2019-01-29 05:25:04'),
(29, 'ProQuad', '36366BM', '2018-05-18', '2019-05-11', 150, 2000, 'Available', 8, '2019-01-29 05:26:00', '2019-01-29 05:26:00'),
(30, 'Ixiaro', '99994GH', '2018-10-02', '2019-09-25', 299, 1500, 'Available', 9, '2019-01-29 05:26:55', '2019-01-29 05:26:55'),
(31, 'JE-Vax', '87844CD', '2018-12-16', '2019-06-09', 299, 1500, 'Available', 9, '2019-01-29 05:28:06', '2019-01-29 05:28:06'),
(32, 'JE-Vax', '35888YU', '2018-08-10', '2019-06-25', 300, 1500, 'Available', 9, '2019-01-29 05:28:42', '2019-01-29 05:28:42'),
(33, 'M-M-Vax', '25848JK', '2018-05-09', '2019-06-19', 500, 2000, 'Available', 10, '2019-01-29 05:30:33', '2019-01-29 05:30:33'),
(34, 'M-M-Vax', '98955VG', '2018-06-04', '2019-05-04', 250, 2000, 'Available', 10, '2019-01-29 05:31:05', '2019-01-29 05:31:05'),
(35, 'ProQuad', '65669HY', '2018-12-03', '2019-09-05', 300, 2000, 'Available', 10, '2019-01-29 05:31:52', '2019-01-29 05:31:52'),
(36, 'ProQuad', '58555PO', '2018-12-19', '2019-09-10', 250, 2000, 'Available', 10, '2019-01-29 05:32:30', '2019-01-29 05:32:30'),
(37, 'Varivax', '78855DA', '2019-01-01', '2019-12-18', 500, 1500, 'Available', 11, '2019-01-29 05:33:17', '2019-01-29 05:33:17'),
(38, 'Varivax', '63322KO', '2019-01-22', '2020-01-18', 400, 1500, 'Available', 11, '2019-01-29 05:33:50', '2019-01-29 05:33:50'),
(39, 'Varivax', '22544MN', '2018-10-03', '2019-06-24', 350, 1500, 'Available', 11, '2019-01-29 05:34:19', '2019-01-29 05:34:19'),
(40, 'Havrix', '57885LO', '2018-12-11', '2019-12-11', 500, 1500, 'Available', 12, '2019-01-29 05:35:19', '2019-01-29 05:35:19'),
(41, 'VAQTA', '33333HU', '2019-01-17', '2020-03-09', 498, 1500, 'Available', 12, '2019-01-29 05:36:07', '2019-01-29 05:36:07'),
(42, 'VAQTA', '55525UY', '2018-08-18', '2019-05-09', 250, 1500, 'Available', 12, '2019-01-29 05:36:39', '2019-01-29 05:36:39'),
(43, 'Twinrix', '15225IO', '2018-11-10', '2019-08-12', 400, 1500, 'Available', 12, '2019-01-29 05:37:24', '2019-01-29 05:37:24'),
(44, 'Gardasil', '45488LK', '2019-01-09', '2020-01-12', 500, 1700, 'Available', 13, '2019-01-29 05:38:17', '2019-01-29 05:38:17'),
(45, 'Cervarix', '48552TR', '2018-12-10', '2020-03-22', 500, 1700, 'Available', 13, '2019-01-29 05:39:20', '2019-01-29 05:39:20'),
(46, 'Cervarix', '54888LO', '2018-08-07', '2019-06-17', 250, 1700, 'Available', 13, '2019-01-29 05:39:51', '2019-01-29 05:39:51'),
(47, 'Gardasil 9', '98999JH', '2018-09-07', '2019-06-04', 250, 1700, 'Available', 13, '2019-01-29 05:40:29', '2019-01-29 05:40:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vaccine_lists`
--
ALTER TABLE `vaccine_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vaccine_lists_vaccine_types_id_foreign` (`vaccine_types_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vaccine_lists`
--
ALTER TABLE `vaccine_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vaccine_lists`
--
ALTER TABLE `vaccine_lists`
  ADD CONSTRAINT `vaccine_lists_vaccine_types_id_foreign` FOREIGN KEY (`vaccine_types_id`) REFERENCES `vaccine_types` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
