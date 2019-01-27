-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2019 at 10:39 AM
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
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointment_date` date NOT NULL,
  `patients_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Scheduled','Paid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `appointment_date`, `patients_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '2019-01-28', 57, 'Scheduled', NULL, NULL),
(2, '2019-01-31', 73, 'Scheduled', NULL, NULL),
(3, '2019-02-21', 43, 'Scheduled', NULL, NULL),
(4, '2019-01-30', 76, 'Scheduled', NULL, NULL),
(5, '2019-01-28', 66, 'Scheduled', NULL, NULL),
(6, '2019-01-28', 68, 'Scheduled', NULL, NULL),
(7, '2019-01-28', 71, 'Scheduled', NULL, NULL),
(8, '2019-01-29', 36, 'Scheduled', NULL, NULL),
(9, '2019-01-29', 21, 'Scheduled', NULL, NULL),
(10, '2019-01-28', 65, 'Scheduled', NULL, NULL),
(11, '2019-01-28', 52, 'Scheduled', NULL, NULL),
(12, '2019-01-28', 3, 'Scheduled', NULL, NULL),
(13, '2019-01-29', 44, 'Scheduled', NULL, NULL),
(14, '2019-01-30', 69, 'Scheduled', NULL, NULL),
(15, '2019-01-30', 37, 'Scheduled', NULL, NULL),
(16, '2019-01-30', 42, 'Scheduled', NULL, NULL),
(17, '2019-01-30', 75, 'Scheduled', NULL, NULL),
(18, '2019-01-30', 9, 'Scheduled', NULL, NULL),
(19, '2019-01-29', 5, 'Scheduled', NULL, NULL),
(20, '2019-01-28', 55, 'Scheduled', NULL, NULL),
(21, '2019-01-28', 77, 'Scheduled', NULL, NULL),
(22, '2019-01-29', 22, 'Scheduled', NULL, NULL),
(23, '2019-01-30', 50, 'Scheduled', NULL, NULL),
(24, '2019-01-31', 49, 'Scheduled', NULL, NULL),
(25, '2019-01-28', 42, 'Scheduled', NULL, NULL),
(26, '2019-01-28', 19, 'Scheduled', NULL, NULL),
(27, '2019-01-28', 51, 'Scheduled', NULL, NULL),
(28, '2019-01-28', 7, 'Scheduled', NULL, NULL),
(29, '2019-01-29', 23, 'Scheduled', NULL, NULL),
(30, '2019-01-29', 25, 'Scheduled', NULL, NULL),
(31, '2019-02-01', 67, 'Scheduled', NULL, NULL),
(32, '2019-02-01', 6, 'Scheduled', NULL, NULL),
(33, '2019-02-01', 24, 'Scheduled', NULL, NULL),
(34, '2019-02-01', 40, 'Scheduled', NULL, NULL),
(35, '2019-02-01', 27, 'Scheduled', NULL, NULL),
(36, '2019-02-01', 26, 'Scheduled', NULL, NULL),
(37, '2019-01-31', 56, 'Scheduled', NULL, NULL),
(38, '2019-01-31', 21, 'Scheduled', NULL, NULL),
(39, '2019-01-30', 48, 'Scheduled', NULL, NULL),
(40, '2019-01-31', 66, 'Scheduled', NULL, NULL),
(41, '2019-01-28', 60, 'Scheduled', NULL, NULL),
(42, '2019-01-29', 30, 'Scheduled', NULL, NULL),
(43, '2019-01-31', 8, 'Scheduled', NULL, NULL),
(44, '2019-01-29', 57, 'Scheduled', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `delivery_date` datetime NOT NULL,
  `date_received` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_transactions`
--

CREATE TABLE `delivery_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `vaccine_lists_id` int(10) UNSIGNED NOT NULL,
  `delivery_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnoses`
--

CREATE TABLE `diagnoses` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_administered` datetime DEFAULT NULL,
  `diagnosisNotes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `allergies` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `medical_records_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagnoses`
--

INSERT INTO `diagnoses` (`id`, `date_administered`, `diagnosisNotes`, `allergies`, `medical_records_id`, `created_at`, `updated_at`) VALUES
(1, '2018-11-20 00:00:00', 'Patient must avoid eating shrimp', 'N/A', 1, '2019-01-28 09:26:54', '2019-01-28 09:26:55'),
(2, NULL, 'Patient must avoid eating fish', 'N/A', 0, '2019-01-28 09:27:54', '2019-01-28 09:27:54'),
(3, NULL, 'Patient must avoid eating crab', 'N/A', 0, '2019-01-28 09:28:29', '2019-01-28 09:28:29'),
(4, '2019-01-28 00:00:00', 'Patient must avoid eating shrimp', 'N/A', 3, '2019-01-28 09:31:58', '2019-01-28 09:31:58'),
(5, '2019-01-07 00:00:00', 'Patient must avoid eating crab', 'N/A', 4, '2019-01-28 09:32:27', '2019-01-28 09:32:27'),
(6, '2019-01-09 00:00:00', 'Patient must avoid eating shrimp', 'N/A', 8, '2019-01-28 09:33:56', '2019-01-28 09:33:56'),
(7, '2019-01-29 00:00:00', 'Patient must avoid eating shrimp', 'Allergic to shrimp', 9, '2019-01-28 09:34:28', '2019-01-28 09:34:28'),
(8, '2018-11-20 00:00:00', 'Patient must avoid eating shrimp', 'Allergic to shrimp', 10, '2019-01-28 09:34:55', '2019-01-28 09:34:55'),
(9, '2018-09-13 00:00:00', 'Patient must avoid eating shrimp', 'Allergic to shrimp', 11, '2019-01-28 09:35:26', '2019-01-28 09:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `donesched`
--

CREATE TABLE `donesched` (
  `patient_lname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_mname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_fname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_bday` date NOT NULL,
  `patient_gender` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_lname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_fname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` bigint(20) NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `position`, `employee_lname`, `employee_fname`, `address`, `contact`, `username`, `password`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'admin', 'admin', 'USC', 'Laperal Bldg, Diego Silang Street, Baguio City', 9090000000, 'admin', '$2y$10$n.y7BErQuicHqeWtskHE1e2LhVGXeAPnIigppgcJlu59n0V.4oS.S', NULL, NULL, 'VkRGCg0rnwRHCwHu9kSQjiRvvXBJDrU4L233BA0pVOpi9HEuqM3Pbmx6SOj9'),
(2, 'doctor', 'Derije', 'Franchesca', 'Baguio City, Baguio City', 9457616581, 'Doctor Derije', '$2y$10$yUzUUmfDeGHRLV0FcmXFJecQp2YFzI2EHjiTDhUga0zd7V8CXR8J.', '2019-01-27 07:35:48', '2019-01-27 07:35:48', 'aIGb3tNz3Vf9ccqTMPTS5ygF4z7M9oi56n40DDZ0S5fyVHR6hA8FVFfTGYGm'),
(3, 'assistant', 'Cabiles', 'Bernadette', 'Cuyapo, Nueva Ecija', 9062805919, 'Assistant Cabiles', '$2y$10$Igt5Ij9mqh0UIRzdcjlX3.ZsxeNPSl5SyNAfZnjrWRrns2VMco3aO', '2019-01-27 07:37:17', '2019-01-27 07:37:17', '5jIGfqbtR5f5dTmyVKGruCgLtlytN9XRo3BGfWxEfetzzGft0GwOd2GMWLCZ'),
(4, 'assistant', 'Assistant admin', 'Admin', 'Admin', 9457616581, 'assistant admin', '$2y$10$tu43turimtdciJWZxeQvLeuywlN4dLcYXEwuwr2c1WMAuZfNVeCbm', '2019-01-27 08:39:29', '2019-01-27 08:39:29', 'QrF4s4GqGhZxOnPdQ4t4HcLwJ6XzIJ0DAHiLi4HDoNz3gqby4OklzBPsYw8G');

-- --------------------------------------------------------

--
-- Table structure for table `immunizations`
--

CREATE TABLE `immunizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `vdate_administered` date NOT NULL,
  `vaccine_lot_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaccine_types_id` int(10) UNSIGNED NOT NULL,
  `patients_id` int(10) UNSIGNED NOT NULL,
  `medical_records_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `immunizations`
--

INSERT INTO `immunizations` (`id`, `vdate_administered`, `vaccine_lot_number`, `vaccine_types_id`, `patients_id`, `medical_records_id`, `created_at`, `updated_at`) VALUES
(1, '2018-12-13', '22615', 1, 60, 0, '2019-01-28 09:32:41', '2019-01-28 09:32:41'),
(2, '2019-01-01', '29633', 7, 60, 0, '2019-01-28 09:32:55', '2019-01-28 09:32:55'),
(3, '2018-10-18', '29633', 7, 60, 0, '2019-01-28 09:33:09', '2019-01-28 09:33:09'),
(4, '2019-01-04', '29633', 7, 60, 0, '2019-01-28 09:33:19', '2019-01-28 09:33:19'),
(5, '2018-11-28', '65252', 6, 60, 0, '2019-01-28 09:33:33', '2019-01-28 09:33:33'),
(6, '2018-12-05', '15287', 4, 3, 0, '2019-01-28 09:35:41', '2019-01-28 09:35:41'),
(7, '2019-01-08', '52525', 10, 3, 0, '2019-01-28 09:35:54', '2019-01-28 09:35:54'),
(8, '2019-01-01', '12533', 7, 3, 0, '2019-01-28 09:36:14', '2019-01-28 09:36:14'),
(9, '2018-11-07', '25364', 7, 3, 0, '2019-01-28 09:36:27', '2019-01-28 09:36:27'),
(10, '2018-08-16', '11527', 4, 3, 0, '2019-01-28 09:36:43', '2019-01-28 09:36:43'),
(11, '2018-07-12', '15287', 4, 3, 0, '2019-01-28 09:37:04', '2019-01-28 09:37:04'),
(12, '2018-12-07', '36885', 10, 3, 0, '2019-01-28 09:37:26', '2019-01-28 09:37:26');

--
-- Triggers `immunizations`
--
DELIMITER $$
CREATE TRIGGER `adjust_inventory` AFTER INSERT ON `immunizations` FOR EACH ROW BEGIN
         DECLARE x INT;
         SET x = (SELECT `id` FROM `vaccine_lists` WHERE `vaccine_lot_number` = NEW.vaccine_lot_number); 
         
         UPDATE `vaccine_lists` 
         SET vaccine_lists.quantity = vaccine_lists.quantity - 1
         WHERE vaccine_lists.vaccine_lot_number = NEW.vaccine_lot_number;

         INSERT INTO `inventory_adjustments` 
         (`adjustment_date`, `adjustment_reason`, `amount_qty`,`vaccine_lists_id`,`vaccine_types_id`,`created_at`,`updated_at`)
         VALUES (now(),"Consumed",1,x,NEW.vaccine_types_id,now(),null);
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_adjustments`
--

CREATE TABLE `inventory_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_date` date NOT NULL,
  `adjustment_reason` enum('Disposed','Replacement','New Stock','Consumed','Expired','Restock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_qty` int(11) NOT NULL,
  `vaccine_lists_id` int(10) UNSIGNED NOT NULL,
  `vaccine_types_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_adjustments`
--

INSERT INTO `inventory_adjustments` (`id`, `adjustment_date`, `adjustment_reason`, `amount_qty`, `vaccine_lists_id`, `vaccine_types_id`, `created_at`, `updated_at`) VALUES
(1, '2019-01-27', 'New Stock', 100, 1, 1, '2019-01-27 08:28:12', '2019-01-27 08:28:12'),
(2, '2019-01-27', 'New Stock', 100, 2, 1, '2019-01-27 08:28:47', '2019-01-27 08:28:47'),
(3, '2019-01-27', 'New Stock', 50, 3, 1, '2019-01-27 08:29:29', '2019-01-27 08:29:29'),
(4, '2019-01-27', 'New Stock', 200, 4, 1, '2019-01-27 08:30:27', '2019-01-27 08:30:27'),
(5, '2019-01-27', 'New Stock', 100, 5, 1, '2019-01-27 08:31:08', '2019-01-27 08:31:08'),
(6, '2019-01-27', 'New Stock', 150, 6, 1, '2019-01-27 08:31:51', '2019-01-27 08:31:51'),
(7, '2019-01-27', 'New Stock', 200, 7, 2, '2019-01-27 08:34:13', '2019-01-27 08:34:13'),
(8, '2019-01-27', 'New Stock', 250, 8, 2, '2019-01-27 08:34:50', '2019-01-27 08:34:50'),
(9, '2019-01-27', 'New Stock', 200, 9, 2, '2019-01-27 08:35:40', '2019-01-27 08:35:40'),
(10, '2019-01-27', 'New Stock', 200, 10, 2, '2019-01-27 08:37:00', '2019-01-27 08:37:00'),
(11, '2019-01-27', 'New Stock', 200, 11, 3, '2019-01-27 08:42:57', '2019-01-27 08:42:57'),
(12, '2019-01-27', 'New Stock', 200, 12, 3, '2019-01-27 08:43:46', '2019-01-27 08:43:46'),
(13, '2019-01-27', 'New Stock', 250, 13, 3, '2019-01-27 08:44:40', '2019-01-27 08:44:40'),
(14, '2019-01-27', 'New Stock', 250, 14, 3, '2019-01-27 08:45:22', '2019-01-27 08:45:22'),
(15, '2019-01-27', 'New Stock', 300, 15, 4, '2019-01-27 08:47:07', '2019-01-27 08:47:07'),
(16, '2019-01-27', 'New Stock', 200, 16, 4, '2019-01-27 08:48:12', '2019-01-27 08:48:12'),
(17, '2019-01-27', 'New Stock', 250, 17, 4, '2019-01-27 08:48:50', '2019-01-27 08:48:50'),
(18, '2019-01-27', 'New Stock', 300, 18, 5, '2019-01-27 08:50:25', '2019-01-27 08:50:25'),
(19, '2019-01-27', 'New Stock', 300, 19, 5, '2019-01-27 08:51:17', '2019-01-27 08:51:17'),
(20, '2019-01-27', 'New Stock', 300, 20, 5, '2019-01-27 08:51:54', '2019-01-27 08:51:54'),
(21, '2019-01-27', 'New Stock', 300, 21, 6, '2019-01-27 08:53:38', '2019-01-27 08:53:38'),
(22, '2019-01-27', 'New Stock', 500, 22, 6, '2019-01-27 08:54:23', '2019-01-27 08:54:23'),
(23, '2019-01-27', 'New Stock', 300, 23, 6, '2019-01-27 08:55:55', '2019-01-27 08:55:55'),
(24, '2019-01-27', 'New Stock', 500, 24, 7, '2019-01-27 08:58:41', '2019-01-27 08:58:41'),
(25, '2019-01-27', 'New Stock', 200, 25, 7, '2019-01-27 08:59:12', '2019-01-27 08:59:12'),
(26, '2019-01-27', 'New Stock', 150, 26, 7, '2019-01-27 08:59:51', '2019-01-27 08:59:51'),
(27, '2019-01-27', 'New Stock', 200, 27, 7, '2019-01-27 09:00:27', '2019-01-27 09:00:27'),
(28, '2019-01-27', 'New Stock', 200, 28, 7, '2019-01-27 09:01:09', '2019-01-27 09:01:09'),
(29, '2019-01-27', 'New Stock', 500, 29, 8, '2019-01-27 09:02:28', '2019-01-27 09:02:28'),
(30, '2019-01-27', 'New Stock', 500, 30, 8, '2019-01-27 09:03:01', '2019-01-27 09:03:01'),
(31, '2019-01-27', 'New Stock', 500, 31, 9, '2019-01-27 09:04:25', '2019-01-27 09:04:25'),
(32, '2019-01-27', 'New Stock', 500, 32, 10, '2019-01-27 09:06:52', '2019-01-27 09:06:52'),
(33, '2019-01-27', 'New Stock', 600, 33, 10, '2019-01-27 09:07:30', '2019-01-27 09:07:30'),
(34, '2019-01-27', 'New Stock', 600, 34, 11, '2019-01-27 09:08:52', '2019-01-27 09:08:52'),
(35, '2019-01-27', 'New Stock', 600, 35, 11, '2019-01-27 09:09:35', '2019-01-27 09:09:35'),
(36, '2019-01-27', 'New Stock', 500, 36, 12, '2019-01-27 09:11:06', '2019-01-27 09:11:06'),
(37, '2019-01-27', 'New Stock', 400, 37, 12, '2019-01-27 09:11:42', '2019-01-27 09:11:42'),
(38, '2019-01-27', 'New Stock', 300, 38, 12, '2019-01-27 09:12:16', '2019-01-27 09:12:16'),
(39, '2019-01-27', 'New Stock', 500, 39, 13, '2019-01-27 09:14:23', '2019-01-27 09:14:23'),
(40, '2019-01-27', 'New Stock', 700, 40, 13, '2019-01-27 09:15:02', '2019-01-27 09:15:02'),
(41, '2019-01-28', 'Consumed', 1, 1, 1, '2019-01-28 09:32:41', NULL),
(42, '2019-01-28', 'Consumed', 1, 27, 7, '2019-01-28 09:32:55', NULL),
(43, '2019-01-28', 'Consumed', 1, 27, 7, '2019-01-28 09:33:09', NULL),
(44, '2019-01-28', 'Consumed', 1, 27, 7, '2019-01-28 09:33:19', NULL),
(45, '2019-01-28', 'Consumed', 1, 21, 6, '2019-01-28 09:33:33', NULL),
(46, '2019-01-28', 'Consumed', 1, 16, 4, '2019-01-28 09:35:41', NULL),
(47, '2019-01-28', 'Consumed', 1, 33, 10, '2019-01-28 09:35:54', NULL),
(48, '2019-01-28', 'Consumed', 1, 24, 7, '2019-01-28 09:36:14', NULL),
(49, '2019-01-28', 'Consumed', 1, 25, 7, '2019-01-28 09:36:27', NULL),
(50, '2019-01-28', 'Consumed', 1, 17, 4, '2019-01-28 09:36:43', NULL),
(51, '2019-01-28', 'Consumed', 1, 16, 4, '2019-01-28 09:37:04', NULL),
(52, '2019-01-28', 'Consumed', 1, 32, 10, '2019-01-28 09:37:26', NULL);

--
-- Triggers `inventory_adjustments`
--
DELIMITER $$
CREATE TRIGGER `adjust` AFTER INSERT ON `inventory_adjustments` FOR EACH ROW BEGIN
                  
         UPDATE `vaccine_lists` 
         SET vaccine_lists.quantity = vaccine_lists.quantity - NEW.amount_qty
         WHERE vaccine_lists.id = NEW.vaccine_lists_id
         AND NEW.adjustment_reason = "Damaged" OR NEW.adjustment_reason = "Expired" OR NEW.adjustment_reason = "Disposed" OR NEW.adjustment_reason = "Returned"
         AND NEW.adjustment_reason != "New Stock";

         UPDATE `vaccine_lists` 
         SET vaccine_lists.quantity = vaccine_lists.quantity + NEW.amount_qty
         WHERE vaccine_lists.id = NEW.vaccine_lists_id
         AND NEW.adjustment_reason = "Restock" OR  NEW.adjustment_reason = "Replacement";


        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `height` double(8,2) NOT NULL,
  `weight` double(8,2) NOT NULL,
  `respiration` double(8,2) NOT NULL,
  `pulse_rate` int(11) NOT NULL,
  `temperature` double(8,2) NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_records`
--

INSERT INTO `medical_records` (`id`, `date`, `height`, `weight`, `respiration`, `pulse_rate`, `temperature`, `patient_id`, `created_at`, `updated_at`) VALUES
(1, '2018-11-20', 125.00, 20.00, 30.00, 30, 35.00, 57, '2019-01-27 09:15:41', '2019-01-27 09:15:41'),
(2, '2018-07-12', 152.00, 10.00, 12.00, 50, 35.00, 73, '2019-01-27 09:16:44', '2019-01-27 09:16:44'),
(3, '2019-01-28', 10.00, 10.00, 10.00, 10, 10.00, 57, '2019-01-28 09:29:27', '2019-01-28 09:29:27'),
(4, '2019-01-07', 10.00, 10.00, 20.00, 20, 20.00, 60, '2019-01-28 09:30:01', '2019-01-28 09:30:01'),
(5, '2019-01-28', 20.00, 20.00, 20.00, 20, 20.00, 66, '2019-01-28 09:30:28', '2019-01-28 09:30:28'),
(6, '2019-01-03', 10.00, 10.00, 10.00, 10, 10.00, 68, '2019-01-28 09:30:51', '2019-01-28 09:30:51'),
(7, '2018-12-20', 10.00, 10.00, 10.00, 10, 10.00, 71, '2019-01-28 09:31:14', '2019-01-28 09:31:14'),
(8, '2019-01-09', 10.00, 10.00, 10.00, 10, 10.00, 3, '2019-01-28 09:31:33', '2019-01-28 09:31:33'),
(9, '2019-01-29', 10.00, 10.00, 10.00, 10, 10.00, 3, '2019-01-28 09:34:13', '2019-01-28 09:34:13'),
(10, '2018-11-20', 10.00, 20.00, 20.00, 20, 20.00, 3, '2019-01-28 09:34:44', '2019-01-28 09:34:44'),
(11, '2018-09-13', 20.00, 20.00, 20.00, 20, 20.00, 3, '2019-01-28 09:35:16', '2019-01-28 09:35:16');

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
(3, '2018_09_10_120210_create_patients_table', 1),
(4, '2018_09_10_120510_create_deliveries_table', 1),
(5, '2018_09_10_120827_create_patient_records_table', 1),
(6, '2018_09_10_120843_create_services_table', 1),
(7, '2018_09_10_120858_create_appointments_table', 1),
(8, '2018_09_10_122127_create_employees_table', 1),
(9, '2018_09_30_063554_create_vaccine_types_table', 1),
(10, '2018_09_30_063643_create_vaccine_lists_table', 1),
(11, '2018_09_30_073819_create_payments_table', 1),
(12, '2018_09_30_073947_create_sales_table', 1),
(13, '2018_10_01_163035_create_delivery_transactions_table', 1),
(14, '2018_10_01_163235_create_return_transactions_table', 1),
(15, '2018_10_05_130622_create_returns_table', 1),
(16, '2018_10_07_041723_create_purchases_table', 1),
(17, '2018_10_07_044247_create_service_use_table', 1),
(18, '2018_11_11_085746_appointment_service', 1),
(19, '2018_11_15_070813_create_immunizations_table', 1),
(20, '2018_11_15_070828_create_diagnoses_table', 1),
(21, '2018_11_15_070914_create_medical_records_table', 1),
(22, '2018_11_18_012810_create_vaccines_used_table', 1),
(23, '2018_11_20_034454_create_rendered_vaccine_table', 1),
(24, '2018_11_25_042047_create_notifications_table', 1),
(25, '2018_11_25_075934_create_sessions_table', 1),
(26, '2018_12_18_055641_create_inventory_adjustments_table', 1),
(27, '2018_12_18_080910_create_donesched_table', 1),
(28, '2019_01_07_005128_create_trigger', 1),
(29, '2019_01_10_060737_create_trigger2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `patient_lname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_mname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_fname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_bday` date NOT NULL,
  `patient_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_gender` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_occupation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_occupation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `type_of_delivery` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `created_at`, `updated_at`, `patient_lname`, `patient_mname`, `patient_fname`, `patient_bday`, `patient_address`, `patient_gender`, `father_name`, `mother_name`, `mother_occupation`, `father_occupation`, `contact_number`, `type_of_delivery`) VALUES
(1, '2019-01-27 02:32:03', '2019-01-27 02:32:03', 'Derije', 'Cabiles', 'Franchesca', '2010-01-20', 'Cuyapo, Nueva Ecija', 'Female', 'Virgilio Derije', 'Rosemarie Cabiles', 'Housewife', 'Agriculturist', 9457616581, 'Vaginal Delivery'),
(2, '2019-01-27 02:33:43', '2019-01-27 02:33:43', 'Valdez', 'Miguel', 'Drizzle', '2009-10-11', 'Candon City, Ilocos Sur', 'Female', 'Hugo Valdez', 'Salina Miguel', 'OFW', 'Engineer', 9112225522, 'Vaginal Birth After Cesarian'),
(3, '2019-01-27 02:36:14', '2019-01-27 02:36:14', 'Custodio', 'Mendoza', 'Danica', '2012-07-17', 'Tuding, Baguio City', 'Female', 'Chris Custodio', 'Shane Mendoza', 'Teacher', 'Doctor', 9225544847, 'Vaginal Delivery'),
(4, '2019-01-27 02:37:59', '2019-01-27 02:37:59', 'Dela Cruz', 'Bautista', 'Ojoj', '2009-08-10', 'Dominican, Baguio City', 'Male', 'Jojo Dela Cruz', 'Sylvia Bautista', 'OFW', 'Engineer', 9774455885, 'Natural Delivery'),
(5, '2019-01-27 02:39:29', '2019-01-27 02:39:29', 'Daclison', 'Cruz', 'John Brian', '2014-04-09', 'Trancoville, Baguio City', 'Male', 'Remy Daclison', 'Cecile Cruz', 'Teacher', 'Nurse', 9554411525, 'Forceps Delivery'),
(6, '2019-01-27 02:42:29', '2019-01-27 02:42:29', 'Salazar', 'Ramos', 'Von Karlos', '2015-01-13', 'Cabanatuan City, Nueva Ecija', 'Male', 'Roman Salazar', 'Zenaida Ramos', 'Principal', 'Doctor', 9442256631, 'Vaginal Birth After Cesarian'),
(7, '2019-01-27 02:44:32', '2019-01-27 02:44:32', 'Mendoza', 'Bayani', 'Renedez', '2017-03-07', 'Quirino Hill, Baguio City', 'Male', 'Rommel Mendoza', 'Katrina Bayani', 'Teacher', 'Engineer', NULL, 'Forceps Delivery'),
(8, '2019-01-27 02:46:18', '2019-01-27 02:46:18', 'Cerezo', 'David', 'Kyrie', '2013-08-12', 'Honeymoon Road, Baguio City', 'Male', 'Zoren Cerezo', 'Benita David', 'OFW', 'Nurse', NULL, 'C-Section'),
(9, '2019-01-27 02:47:45', '2019-01-27 02:47:45', 'Mercado', 'Tomas', 'Kimberly', '2014-01-14', 'Honeymoon Road, Baguio City', 'Female', 'Daniel Mercado', 'Krishna Tomas', 'Teacher', 'Police', 9555885541, 'Natural Delivery'),
(10, '2019-01-27 02:50:07', '2019-01-27 02:50:07', 'Wagner', 'Christie', 'Krishna', '2015-07-14', '2261 Aurora Boulevard 1300, Pasay City', 'Female', 'David Wagner', 'Katherine Christie', 'Teacher', 'Police', 9444455552, 'Vaginal Birth After Cesarian'),
(11, '2019-01-27 02:53:09', '2019-01-27 02:53:09', 'Columbus', 'Rodriguez', 'Shyanne', '2018-01-09', '07 Kling Walks, Poblacion, Oroquieta 6156 Metro Manila', 'Female', 'Johnny Columbus', 'Jenny Rodriguez', 'Anaesthetist', 'Barrister', NULL, 'Vaginal Birth After Cesarian'),
(12, '2019-01-27 02:57:06', '2019-01-27 02:57:06', 'Smith', 'Urban', 'Orlo', '2009-06-16', '42 Moore Roads Suite 773, Poblacion, Tarlac City', 'Male', 'Franklin Smith', 'Ursula Urban', 'Company director', 'Prison officer', 9555522228, 'Vaginal Delivery'),
(13, '2019-01-27 02:58:50', '2019-01-27 02:58:50', 'Marion', 'Emmerich', 'Hilario', '2013-08-13', 'Marcos Highway, Antipolo City 1870 Rizal', 'Male', 'Jarrod Marion', 'Laura Emmerich', 'Dental hygienist', 'Funeral director', NULL, 'Natural Delivery'),
(14, '2019-01-27 03:00:22', '2019-01-27 03:00:22', 'Robles', 'Forbes', 'Perry', '2009-10-06', 'Unit 104, G/F, Pacific Place Building, 104 Pearl Drive corner Amethyst Road, Ortigas Center, Pasig City 1605 Metro Manila', 'Female', 'Joel', 'Luna Forbes', 'Osteopath', 'Chimney sweep', NULL, 'Vacuum Extraction'),
(15, '2019-01-27 03:03:35', '2019-01-27 03:03:35', 'Jimenez', 'Williamson', 'Jeanne', '2016-05-10', 'Suite 82, Legaspi Suites, 178 Salcedo Street, Legaspi Village, Makati City 1229 Metro Manila', 'Female', 'Khalid Jimenez', 'Laura Williamson', 'Flight attendant', 'Civil servant', 9888555222, 'Forceps Delivery'),
(16, '2019-01-27 03:05:44', '2019-01-27 03:05:44', 'Aguilar', 'Gideon', 'Rima', '2010-07-14', '704 Laurel Street, Severina Industrial Estates, Paranaque City 1700 Metro Manila', 'Female', 'Arjun Aguilar', 'Cassidy Gideon', 'Anthropologist', 'Book keeper', 9553336636, 'Vacuum Extraction'),
(17, '2019-01-27 03:07:44', '2019-01-27 03:07:44', 'Perez', 'Oneil', 'Shania', '2015-08-12', 'Stall A, Adivay Building, 22, Lower Bonifacio Street, ABCR Barangay, Baguio City 2600 Benguet', 'Female', 'Brayden Perez', 'Laith Oneil', 'Auditor', 'Pathologist', NULL, 'Vacuum Extraction'),
(18, '2019-01-27 03:09:19', '2019-01-27 03:09:19', 'Perez', 'Evans', 'Arjun', '2011-08-16', '1 Adarna Street, Dizon Subdivision, Baguio City 2600 Benguet', 'Male', 'Tobey Perez', 'Philippa Evans', 'Bank manager', 'Firefighter', NULL, 'Vacuum Extraction'),
(19, '2019-01-27 03:11:48', '2019-01-27 03:11:48', 'Rayner', 'Terry', 'Shelbie', '2015-05-05', '2nd Floor, NBV Bldg., Lower Bonifacio Street, ABCR, Baguio City 2600 Benguet', 'Female', 'Hugo Rayner', 'Margot Terry', 'Manicurist', 'Gardener', NULL, 'Natural Delivery'),
(20, '2019-01-27 03:13:55', '2019-01-27 03:13:55', 'Cabiles', 'Empleo', 'Ashley Gwen', '2011-08-17', 'Brgy. Buli, Alabang, Muntinlupa City', 'Female', 'Amador Cabiles', 'Alma Empleo', 'Aircraft engineer', 'Coastguard', 9777555225, 'Natural Delivery'),
(21, '2019-01-27 03:16:00', '2019-01-27 03:16:00', 'Cabiles', 'Empleo', 'Arianne Gaile', '2010-02-17', 'Brgy. Buli, Alabang, Muntinlupa City', 'Female', 'Amador Cabiles', 'Alma Empleo', 'Aircraft Engineer', 'Coastguard', 9885522633, 'Forceps Delivery'),
(22, '2019-01-27 03:17:24', '2019-01-27 03:17:24', 'Sabay', 'Cabiles', 'Maria Angelica', '2014-04-10', 'Angeles City, Pampangga', 'Female', 'Bong Sabay', 'Maria Victoria Cabiles', 'Nurse', 'Soldier', 9552236663, 'Natural Delivery'),
(23, '2019-01-27 03:19:16', '2019-01-27 03:19:16', 'Sabay', 'Cabiles', 'Maria Therese', '2012-01-09', 'Angeles City, Pampangga', 'Female', 'Bong Sabay', 'Maria Victoria Cabiles', 'Nurse', 'Housekeeper', 9888855552, 'Natural Delivery'),
(24, '2019-01-27 03:20:56', '2019-01-27 03:20:56', 'Ibuan', 'Empleo', 'Zack Gabriel', '2012-03-14', 'Cuyapo, Nueva Ecija', 'Male', 'Jose Ibuan', 'Annie Rose Empleo', 'Housekeeper', 'Seaman', 9552221477, 'C-Section'),
(25, '2019-01-27 03:22:05', '2019-01-27 03:22:05', 'Derije', 'Lina', 'Jomar', '2009-06-25', 'Cuyapo, Nueva Ecija', 'Male', 'Amado Derije', 'Nora Lina', 'OFW', 'Housekeeper', 9785424865, 'Vaginal Birth After Cesarian'),
(26, '2019-01-27 03:23:32', '2019-01-27 03:23:32', 'Almuete', 'Ibuan', 'Zooey Audrey', '2015-06-24', 'Cuyapo, Nueva Ecija', 'Female', 'John Ross Almuete', 'Janine Ibuan', 'Housekeeper', 'Housekeeper', 9785412478, 'Forceps Delivery'),
(27, '2019-01-27 03:24:46', '2019-01-27 03:24:46', 'Almuete', 'Ibuan', 'Zion Austin', '2018-06-20', 'Cuyapo, Nueva Ecija', 'Male', 'John Ross Almuete', 'Janine Ibuan', 'Housekeeper', 'Housekeeper', 9785421585, 'Vacuum Extraction'),
(28, '2019-01-27 03:26:49', '2019-01-27 03:26:49', 'Castillo', 'Gomez', 'Leyla', '2011-08-11', 'Jose L. Briones Street North Reclamation Area, Brgy. Careta, Cebu City 6000 Cebu', 'Female', 'Richard Castillo', 'Shelbie Gomez', 'Anthropologist', 'Boat builder', 9785412078, 'Forceps Delivery'),
(29, '2019-01-27 03:29:14', '2019-01-27 03:29:14', 'Bonner', 'Beech', 'Emyr', '2003-07-16', '53A Bartoletti Parkway, Poblacion, Santiago 9713 Masbate', 'Male', 'Bobby Bonner', 'Jane Beech', 'Casual worker', 'Chiropodist', 9785421548, 'Vacuum Extraction'),
(30, '2019-01-27 03:31:03', '2019-01-27 03:31:03', 'Rodriguez', 'Alexander', 'Edward', '2015-09-23', '81A Strosin Rapid, Poblacion, Candon', 'Male', 'Bonnie Rodriguez', 'Ruby Alexander', 'Art historian', 'Film Director', 9785421085, 'Vacuum Extraction'),
(31, '2019-01-27 03:32:56', '2019-01-27 07:39:20', 'Lopez', 'Ross', 'Angela', '1998-06-05', '33A/44 Bailey Springs Suite 202, Poblacion', 'Female', 'Harold Lopez', 'Jhoann Ross', 'Surgeon', 'Mathematician', 9785421852, 'Vaginal Delivery'),
(32, '2019-01-27 03:34:56', '2019-01-27 03:34:56', 'Lopez', 'Diaz', 'Sean', '2013-05-07', '12 Mills Villages Suite 512, Poblacion, Gingoog 2082 Agusan del Sur', 'Male', 'Matthew Lopez', 'Angela Diaz', 'Financial advisor', 'Lawyer', 9785421852, 'Vaginal Delivery'),
(33, '2019-01-27 03:36:45', '2019-01-27 03:36:45', 'Delos Santos', 'Cruz', 'Rafael', '2016-07-21', '59A/70 Okuneva Center, Poblacion, Bogo 6566 Lanao del Norte', 'Male', 'Ralph Delos Santos', 'Amy Cruz', 'Data processor', 'Song writer', 9785421785, 'Vaginal Delivery'),
(34, '2019-01-27 03:38:51', '2019-01-27 03:38:51', 'Magtanggol', 'Philipps', 'Victor', '2010-12-29', '53A Rath Flat, Poblacion, Bago 3205 Surigao del Norte', 'Male', 'Roger Magtanggol', 'Laura Philipps', 'Waiter', 'Choreographer', 9785421852, 'Natural Delivery'),
(35, '2019-01-27 03:40:50', '2019-01-27 07:38:41', 'Martin', 'Gonzales', 'Alice', '1998-04-08', '09/88 Wisozk Springs, Poblacion, Bacolod 6389 Batangas', 'Female', 'Carlo Martin', 'Maria Gonzales', 'Makeup artist', 'Art dealer', 9784512785, 'Vaginal Delivery'),
(36, '2019-01-27 03:43:13', '2019-01-27 03:43:13', 'Jean', 'Moon', 'Billy', '2016-01-14', '46/93 Schumm Wells, Sibuco 0249 Occidental Mindoro', 'Male', 'Jilly Jean', 'Mary Moon', 'Crematorium worker', 'Lawyer', NULL, 'Forceps Delivery'),
(37, '2019-01-27 03:45:25', '2019-01-27 03:45:25', 'Styles', 'Edward', 'Harry', '2012-01-31', 'Redditch, United Kingdom', 'Male', 'Billy Styles', 'Anne Twist', 'Astrologer', 'Publican', 9785421785, 'C-Section'),
(38, '2019-01-27 03:47:31', '2019-01-27 03:47:31', 'Tomlinson', 'William', 'Louis', '2018-01-17', 'Doncaster, United Kingdom', 'Male', 'Willy Tomlinson', 'Johannah Deakin', 'Private investigator', 'Miner', 9877520853, 'Vaginal Birth After Cesarian'),
(39, '2019-01-27 03:49:16', '2019-01-27 03:49:16', 'Horan', 'James', 'Niall', '2017-09-13', 'Mullingar, Republic of Ireland', 'Male', 'Bobby Horan', 'Maura Gallagher', 'Factory worker', 'Insurance consultant', 9785421078, 'Vacuum Extraction'),
(40, '2019-01-27 03:50:58', '2019-01-27 03:50:58', 'Malik', 'Javad', 'Zayn', '2014-07-17', 'Bradford, United Kingdom', 'Male', 'Yaser Malik', 'Trisha Javad', 'Travel agent', 'Driving instructor', 9875412785, 'Vacuum Extraction'),
(41, '2019-01-27 03:52:58', '2019-01-27 03:52:58', 'Payne', 'James', 'Liam', '2013-12-31', 'New Cross Hospital, Wolverhampton, United Kingdom', 'Male', 'Kevin James', 'Karen James', 'Insurance consultant', 'Librarian', 9875412785, 'Vacuum Extraction'),
(42, '2019-01-27 03:54:38', '2019-01-27 03:54:38', 'Hemmings', 'Robert', 'Luke', '2010-05-20', 'Sydney, Australia Height: 1.93 m', 'Male', 'Loren Hemmings', 'Liz Robert', 'Salesperson', 'Pest controller', 9785420852, 'C-Section'),
(43, '2019-01-27 03:56:21', '2019-01-27 03:56:21', 'Irwin', 'Fletcher', 'Ashton', '2013-07-19', 'Hornsby, Australia', 'Male', 'Brian Irwin', 'Anne Marie Fletcher', 'Window cleaner', 'Tailor', 9785420754, 'C-Section'),
(44, '2019-01-27 03:58:05', '2019-01-27 03:58:05', 'Hood', 'Thomas', 'Calumn', '2013-01-16', 'Sydney, Australia', 'Male', 'Johnny Hood', 'Joy Thomas', 'Legal secretary', 'Car wash attendant', 9785421653, 'Vacuum Extraction'),
(45, '2019-01-27 04:00:28', '2019-01-27 04:00:28', 'Clifford', 'Deezer', 'Michael', '2009-04-08', 'Sydney, Australia', 'Male', 'Daryl Clifford', 'Karen Deezer', 'Barrister', 'Barber', 9852875285, 'Vacuum Extraction'),
(46, '2019-01-27 04:03:08', '2019-01-27 04:03:08', 'Maraj', 'Tanya', 'Onika', '2013-09-19', 'Saint James, Trinidad and Tobago, Port of Spain, Trinidad and Tobago', 'Female', 'Frank Maraj', 'Carol Tanya', 'Clerical assistant', 'Dressmaker', 9785421852, 'Forceps Delivery'),
(47, '2019-01-27 04:04:57', '2019-01-27 04:04:57', 'Carter', 'Michael', 'Dwayne', '2015-06-17', 'New Orleans, Louisiana, United States', 'Male', 'Roy Carter', 'Jacida Michael', 'Choreographer', 'Management consultant', 9785412875, 'Forceps Delivery'),
(48, '2019-01-27 04:07:45', '2019-01-27 04:07:45', 'Almanzar', 'Marlenis', 'Belcalis', '2011-06-08', 'The Bronx, New York City, New York, United States', 'Female', 'Nicholas Almanzar', 'Elizabeth Marlenis', 'Teacher', 'Politician', 9785421875, 'Forceps Delivery'),
(49, '2019-01-27 04:09:50', '2019-01-27 04:09:50', 'Halos', 'Cacho', 'Neri Mae', '2012-07-14', 'Sta Lucia, Ilocos Sur', 'Female', 'Daniel Halos', 'Kathryn Cacho', 'Teacher', 'Butcher', 9875421785, 'C-Section'),
(50, '2019-01-27 04:11:08', '2019-01-27 04:11:08', 'Geraldez', 'Martin', 'Maureen', '2013-06-06', 'Engineers Hill, Baguio City', 'Female', 'Butch Geraldez', 'Noemi Geraldez', 'Housekeeper', 'Clockmaker', 9785285278, 'Vacuum Extraction'),
(51, '2019-01-27 07:41:59', '2019-01-27 07:41:59', 'Robinson', 'Valdez', 'Scott', '2014-06-11', '66A Heidenreich Corners Suite 284, Calaca 4103 Lanao del Sur', 'Male', 'Douglas Robinson', 'Kate Valdez', 'Window Cleaner', 'Locksmith', NULL, 'Vacuum Extraction'),
(52, '2019-01-27 07:43:59', '2019-01-27 07:43:59', 'Torres', 'Parker', 'Douglas', '2014-09-24', '59A/39 Hahn Course Apt. 482, Poblacion, Laoag 3903 Dinagat Islands', 'Male', 'Dags Torres', 'Dina Parker', 'Management consultant', 'Councillor', NULL, 'C-Section'),
(53, '2019-01-27 07:45:23', '2019-01-27 07:45:23', 'Salazar', 'Jackson', 'Terry', '2014-07-08', '12 Kerluke Locks Apt. 618, La Paz 4161 South Cotabato', 'Female', 'Jerry Salazar', 'Alona Jackson', 'Psychiatrist', 'Telesales person', 9784521784, 'Natural Delivery'),
(54, '2019-01-27 07:47:26', '2019-01-27 07:47:26', 'Bautista', 'Lopez', 'Jose', '2014-01-16', '12 Kerluke Locks Apt. 618, La Paz 4161 South Cotabato', 'Male', 'Adam Bautista', 'Jane Lopez', 'Tax inspector', 'Machinist', 9875427854, 'Natural Delivery'),
(55, '2019-01-27 07:48:43', '2019-01-27 07:48:43', 'Ramos', 'Hernandez', 'Joe', '2015-08-12', '13 Cormier Groves Suite 185, Poblacion, Cagayan de Oro 7080 Camarines Sur', 'Male', 'Lino Ramos', 'Louis Hernandez', 'Animal breeder', 'Animal breeder', 9784578452, 'Vaginal Birth After Cesarian'),
(56, '2019-01-27 07:49:53', '2019-01-27 07:49:53', 'Bautista', 'Sanders', 'Laura', '2013-05-08', '33A/73 Graham Alley, Poblacion, Sagay 5075 Leyte', 'Female', 'Greg Bautista', 'Janice Sanders', 'Researcher', 'Researcher', NULL, 'Vacuum Extraction'),
(57, '2019-01-27 07:51:20', '2019-01-27 07:51:20', 'Santos', 'Foster', 'Amy', '2013-05-08', '84A Schiller Summit, Poblacion, Borongan 0732 Albay', 'Female', 'Jerry Santos', 'Margaret Foster', 'Miner', 'Interior designer', NULL, 'Natural Delivery'),
(58, '2019-01-27 07:52:33', '2019-01-27 07:52:33', 'Santos', 'Garcia', 'Karen', '2016-06-10', '72A/99 Satterfield Prairie Suite 491, Kabasalan 7068 Camarines Norte', 'Female', 'Jeremy Santos', 'Jennifer Garcia', 'Fairground worker', 'Fairground worker', NULL, 'Vacuum Extraction'),
(59, '2019-01-27 07:55:23', '2019-01-27 07:55:23', 'David', 'Butler', 'Pamela', '2015-07-15', '63A Brown Knoll, Poblacion, San Pablo 4005 La Union', 'Female', 'Dennis David', 'Mary Butler', 'Reporter', 'Reporter', 9784512785, 'Vaginal Birth After Cesarian'),
(60, '2019-01-27 07:56:46', '2019-01-27 07:56:46', 'Cruz', 'Moris', 'Ann', '2017-09-20', '84A/13 Stanton Cape Apt. 174, Poblacion, Isabela 0892 Camiguin', 'Female', 'Martin Cruz', 'Pamela Moris', 'Reporter', 'Reporter', 9784578452, 'Forceps Delivery'),
(61, '2019-01-27 07:57:57', '2019-01-27 07:57:57', 'Vegas', 'White', 'Carolyn', '2019-01-15', '42A/94 Stehr Islands, Poblacion, Kidapawan 8357 Misamis Occidental', 'Female', 'Allan Vegas', 'Anne White', 'Police officer', 'Carpenter', NULL, 'Vacuum Extraction'),
(62, '2019-01-27 07:59:55', '2019-01-27 07:59:55', 'Ocampo', 'Garcia', 'Bruce', '2015-07-15', '15A/00 Towne Fields, Poblacion, Calbayog 8591 Surigao del Sur', 'Male', 'Paulo Ocampo', 'Pauleen Garcia', 'Police officer', 'Police officer', 9784527852, 'Natural Delivery'),
(63, '2019-01-27 08:01:12', '2019-01-27 08:01:12', 'Ocampo', 'Turner', 'Ronald', '2016-08-17', '48A Cole Cliffs Apt. 810, Compostela 2410 Cavite', 'Male', 'James Ocampo', 'Rebecca Turner', 'Street entertainer', 'Street entertainer', NULL, 'Forceps Delivery'),
(64, '2019-01-27 08:02:26', '2019-01-27 08:02:26', 'Garcia', 'James', 'Rebecca', '2019-01-16', '54A Stamm Walks, Poblacion, Ozamiz 0845 Siquijor', 'Female', 'Joseph Garcia', 'Lauren James', 'Typist', 'Pharmacist', NULL, 'C-Section'),
(65, '2019-01-27 08:03:36', '2019-01-27 08:03:36', 'Garcia', 'Lopez', 'Donald', '2018-07-18', '46 Bailey Skyway Suite 511, Marcos 6675 Masbate', 'Male', 'Dante Garcia', 'Denise Lopez', 'Pharmacist', 'Pharmacist', 9785278542, 'Vaginal Delivery'),
(66, '2019-01-27 08:04:49', '2019-01-27 08:04:49', 'Martinez', 'Martin', 'Benjamin', '2016-05-10', '54A Stamm Walks, Poblacion, Ozamiz 0845 Siquijor', 'Male', 'Ryan Martinez', 'Amy Martin', 'Song writer', 'Song writer', NULL, 'Vaginal Delivery'),
(67, '2019-01-27 08:06:11', '2019-01-27 08:06:11', 'Domingo', 'White', 'Virginia', '2009-06-17', '00A/16 Shields Canyon, Poblacion, Isabela 5349 Batanes', 'Female', 'David Domingo', 'Donna White', 'Actor', 'Actor', 9784527854, 'Natural Delivery'),
(68, '2019-01-27 08:09:04', '2019-01-27 08:09:04', 'Martinez', 'Martin', 'Benjie', '2015-08-13', '55/95 Jakubowski Via, Sampaloc 2072 Compostela Valley', 'Male', 'Ryan Martinez', 'Ryza Martin', 'Baggage handler', 'Baggage handler', 9784512875, 'Natural Delivery'),
(69, '2019-01-27 08:10:32', '2019-01-27 08:10:32', 'Bautista', 'Rogers', 'Emily', '2012-07-17', '27/31 Mitchell Point Suite 890, Poblacion, Surigao City 2752 Negros Oriental', 'Female', 'Alexander Bautista', 'Anne Rogers', 'Engineer', 'Engineer', NULL, 'Natural Delivery'),
(70, '2019-01-27 08:12:08', '2019-01-27 08:12:08', 'Santos', 'Henderson', 'Bobby', '2018-08-15', '27A Kessler Valley, Asipulo 0279 Isabela', 'Male', 'Philip', 'Catherine Henderson', 'Engineer', 'Architect', 9784527854, 'Vaginal Birth After Cesarian'),
(71, '2019-01-27 08:13:25', '2019-01-27 08:13:25', 'Lopez', 'Simon', 'Betty', '2014-06-10', '36A Hand Mountain Apt. 831, Trece Martires City 6373 Dinagat Islands', 'Female', 'Ben Lopez', 'Betina Simon', 'Dentist', 'Dentist', NULL, 'Vacuum Extraction'),
(72, '2019-01-27 08:14:44', '2019-01-27 08:14:44', 'Lopez', 'Garcia', 'Renz', '2012-07-13', '02A Weber Inlet, Jomalig 2791 Davao del Norte', 'Male', 'William Lopez', 'Carla Garcia', 'Business owner', 'Business owner', 9485784525, 'Natural Delivery'),
(73, '2019-01-27 08:16:00', '2019-01-27 08:16:00', 'Santiagio', 'Barnes', 'Andrea', '2018-01-29', '91 Cassin Divide Suite 218, Poblacion, Urdaneta 0591 Aurora', 'Female', 'Ryan Santiago', 'Jane Barnes', 'Firefighter', 'Firefighter', NULL, 'Vacuum Extraction'),
(74, '2019-01-27 08:17:16', '2019-01-27 08:17:16', 'Cabalse', 'Baker', 'Roy', '2014-09-16', '91 Cassin Divide Suite 218, Poblacion, Urdaneta 0591 Aurora', 'Male', 'Bryan Cabalse', 'Brenda Baker', 'Community worker', 'Community worker', 9874527852, 'C-Section'),
(75, '2019-01-27 08:18:41', '2019-01-27 08:18:41', 'Sandoval', 'Cabiles', 'Kathleen', '2009-09-17', '82A/51 Romaguera Skyway, Biliran 8051 Pangasinan', 'Female', 'Albert Sandoval', 'Ellen Cabiles', 'Nurse', 'Doctor', 9874512785, 'Vacuum Extraction'),
(76, '2019-01-27 08:20:05', '2019-01-27 08:20:05', 'Mendoza', 'Sanchez', 'Anna', '2009-08-12', '06/90 Hirthe Circles, President Manuel A. Roxas 4946 Kalinga', 'Female', 'Rolly Mendoza', 'Rachel Sanchez', 'Editor', 'Editor', 9784512785, 'C-Section'),
(77, '2019-01-27 08:21:26', '2019-01-27 08:21:26', 'Perez', 'Alejo', 'Katy', '2008-09-24', '01/15 Ward Fork Apt. 345, Poblacion, Ligao 8739 Romblon', 'Female', 'Karlos Perez', 'Kathleen Alejo', 'Paramedic', 'Paramedic', 9784527854, 'Vacuum Extraction'),
(78, '2019-01-27 08:22:41', '2019-01-27 08:22:41', 'Walker', 'Russel', 'Jean', '2011-03-10', '96A Nienow Tunnel, Poblacion, Pagadian 4710 Compostela Valley', 'Female', 'Larry Walker', 'Louisa Russel', 'Electrician', 'Electrician', NULL, 'Natural Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `patient_records`
--

CREATE TABLE `patient_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `blood_type` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_weight` double(8,2) NOT NULL,
  `birth_length` double(8,2) NOT NULL,
  `head_cire` double(8,2) NOT NULL,
  `chest_cire` double(8,2) NOT NULL,
  `abdominal_cire` double(8,2) NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_records`
--

INSERT INTO `patient_records` (`id`, `blood_type`, `birth_weight`, `birth_length`, `head_cire`, `chest_cire`, `abdominal_cire`, `patient_id`, `created_at`, `updated_at`) VALUES
(1, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 1, '2019-01-27 02:32:03', '2019-01-27 02:32:03'),
(2, 'Type AB', 4.00, 25.00, 10.00, 12.00, 13.00, 2, '2019-01-27 02:33:43', '2019-01-27 02:33:43'),
(3, 'Type B', 3.00, 24.00, 10.00, 12.00, 13.00, 3, '2019-01-27 02:36:14', '2019-01-27 02:36:14'),
(4, 'Type O', 6.00, 26.00, 11.00, 13.00, 14.00, 4, '2019-01-27 02:38:00', '2019-01-27 02:38:00'),
(5, 'Type B+', 5.00, 25.00, 10.00, 13.00, 14.00, 5, '2019-01-27 02:39:29', '2019-01-27 02:39:29'),
(6, 'Type AB-', 4.00, 25.00, 10.00, 12.00, 13.00, 6, '2019-01-27 02:42:29', '2019-01-27 02:42:29'),
(7, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 7, '2019-01-27 02:44:32', '2019-01-27 02:44:32'),
(8, 'Type O', 6.00, 28.00, 12.00, 13.00, 14.00, 8, '2019-01-27 02:46:18', '2019-01-27 02:46:18'),
(9, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 9, '2019-01-27 02:47:45', '2019-01-27 02:47:45'),
(10, 'Type AB+', 3.00, 24.00, 10.00, 12.00, 13.00, 10, '2019-01-27 02:50:08', '2019-01-27 02:50:08'),
(11, 'Type AB-', 3.00, 24.00, 10.00, 12.00, 13.00, 11, '2019-01-27 02:53:09', '2019-01-27 02:53:09'),
(12, 'Type AB', 3.00, 26.00, 10.00, 13.00, 13.00, 12, '2019-01-27 02:57:06', '2019-01-27 02:57:06'),
(13, 'Type O', 5.00, 30.00, 12.00, 13.00, 15.00, 13, '2019-01-27 02:58:50', '2019-01-27 02:58:50'),
(14, 'Type A+', 5.00, 25.00, 10.00, 12.00, 13.00, 14, '2019-01-27 03:00:22', '2019-01-27 03:00:22'),
(15, 'Type O', 3.00, 25.00, 10.00, 12.00, 13.00, 15, '2019-01-27 03:03:36', '2019-01-27 03:03:36'),
(16, 'Type A+', 5.00, 27.00, 13.00, 15.00, 16.00, 16, '2019-01-27 03:05:44', '2019-01-27 03:05:44'),
(17, 'Type B+', 5.00, 28.00, 10.00, 12.00, 23.00, 17, '2019-01-27 03:07:44', '2019-01-27 03:07:44'),
(18, 'Type A-', 8.00, 30.00, 12.00, 13.00, 15.00, 18, '2019-01-27 03:09:19', '2019-01-27 03:09:19'),
(19, 'Type AB', 6.00, 28.00, 10.00, 12.00, 13.00, 19, '2019-01-27 03:11:48', '2019-01-27 03:11:48'),
(20, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 20, '2019-01-27 03:13:55', '2019-01-27 03:13:55'),
(21, 'Type O', 3.00, 24.00, 10.00, 13.00, 13.00, 21, '2019-01-27 03:16:00', '2019-01-27 03:16:00'),
(22, 'Type A+', 4.00, 25.00, 10.00, 12.00, 13.00, 22, '2019-01-27 03:17:24', '2019-01-27 03:17:24'),
(23, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 23, '2019-01-27 03:19:16', '2019-01-27 03:19:16'),
(24, 'Type B-', 5.00, 29.00, 10.00, 12.00, 13.00, 24, '2019-01-27 03:20:56', '2019-01-27 03:20:56'),
(25, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 25, '2019-01-27 03:22:05', '2019-01-27 03:22:05'),
(26, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 26, '2019-01-27 03:23:32', '2019-01-27 03:23:32'),
(27, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 27, '2019-01-27 03:24:46', '2019-01-27 03:24:46'),
(28, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 28, '2019-01-27 03:26:49', '2019-01-27 03:26:49'),
(29, 'Type A+', 3.00, 30.00, 10.00, 12.00, 13.00, 29, '2019-01-27 03:29:14', '2019-01-27 03:29:14'),
(30, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 30, '2019-01-27 03:31:03', '2019-01-27 03:31:03'),
(31, 'Type A-', 5.20, 24.50, 11.50, 11.25, 10.30, 50, '2019-01-27 03:32:56', '2019-01-27 07:39:20'),
(32, 'Type A-', 3.24, 24.16, 10.00, 11.50, 11.60, 32, '2019-01-27 03:34:56', '2019-01-27 03:34:56'),
(33, 'Type A+', 5.17, 26.15, 10.00, 12.00, 13.00, 33, '2019-01-27 03:36:45', '2019-01-27 03:36:45'),
(34, 'Type AB', 4.00, 24.00, 10.00, 12.00, 13.00, 34, '2019-01-27 03:38:51', '2019-01-27 03:38:51'),
(35, 'Type A+', 5.00, 25.00, 10.00, 13.00, 13.00, 50, '2019-01-27 03:40:50', '2019-01-27 07:38:41'),
(36, 'Type A-', 4.00, 25.00, 10.00, 13.00, 15.00, 36, '2019-01-27 03:43:13', '2019-01-27 03:43:13'),
(37, 'Type B-', 4.00, 25.00, 10.00, 13.00, 15.00, 37, '2019-01-27 03:45:25', '2019-01-27 03:45:25'),
(38, 'Type AB-', 5.00, 28.00, 10.00, 14.00, 16.00, 38, '2019-01-27 03:47:31', '2019-01-27 03:47:31'),
(39, 'Type A+', 4.00, 25.00, 10.00, 11.00, 13.00, 39, '2019-01-27 03:49:16', '2019-01-27 03:49:16'),
(40, 'Type B+', 5.00, 28.00, 12.00, 13.00, 14.00, 40, '2019-01-27 03:50:58', '2019-01-27 03:50:58'),
(41, 'Type A+', 5.00, 28.00, 13.00, 14.00, 15.00, 41, '2019-01-27 03:52:58', '2019-01-27 03:52:58'),
(42, 'Type A+', 5.00, 29.00, 15.00, 15.00, 16.00, 42, '2019-01-27 03:54:39', '2019-01-27 03:54:39'),
(43, 'Type AB', 6.00, 30.00, 15.00, 16.00, 17.00, 43, '2019-01-27 03:56:21', '2019-01-27 03:56:21'),
(44, 'Type O', 7.00, 32.00, 16.00, 17.00, 15.00, 44, '2019-01-27 03:58:05', '2019-01-27 03:58:05'),
(45, 'Type A-', 5.00, 32.00, 10.00, 10.00, 10.00, 45, '2019-01-27 04:00:28', '2019-01-27 04:00:28'),
(46, 'Type O', 4.00, 24.00, 10.00, 13.00, 13.00, 46, '2019-01-27 04:03:08', '2019-01-27 04:03:08'),
(47, 'Type B', 4.00, 24.00, 10.00, 12.00, 13.00, 47, '2019-01-27 04:04:57', '2019-01-27 04:04:57'),
(48, 'Type A+', 5.00, 28.00, 15.00, 16.00, 17.00, 48, '2019-01-27 04:07:45', '2019-01-27 04:07:45'),
(49, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 49, '2019-01-27 04:09:50', '2019-01-27 04:09:50'),
(50, 'Type AB', 4.00, 25.00, 12.00, 13.00, 14.00, 50, '2019-01-27 04:11:08', '2019-01-27 04:11:08'),
(51, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 51, '2019-01-27 07:42:00', '2019-01-27 07:42:00'),
(52, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 52, '2019-01-27 07:43:59', '2019-01-27 07:43:59'),
(53, 'Type O', 6.00, 34.00, 15.00, 15.00, 18.00, 53, '2019-01-27 07:45:23', '2019-01-27 07:45:23'),
(54, 'Type A+', 3.00, 24.00, 10.00, 12.00, 16.00, 54, '2019-01-27 07:47:26', '2019-01-27 07:47:26'),
(55, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 55, '2019-01-27 07:48:43', '2019-01-27 07:48:43'),
(56, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 56, '2019-01-27 07:49:53', '2019-01-27 07:49:53'),
(57, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 57, '2019-01-27 07:51:20', '2019-01-27 07:51:20'),
(58, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 58, '2019-01-27 07:52:33', '2019-01-27 07:52:33'),
(59, 'Type B-', 3.00, 24.00, 10.00, 12.00, 13.00, 59, '2019-01-27 07:55:23', '2019-01-27 07:55:23'),
(60, 'Type AB+', 3.00, 24.00, 10.00, 12.00, 13.00, 60, '2019-01-27 07:56:47', '2019-01-27 07:56:47'),
(61, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 61, '2019-01-27 07:57:57', '2019-01-27 07:57:57'),
(62, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 62, '2019-01-27 07:59:55', '2019-01-27 07:59:55'),
(63, 'Type B+', 3.00, 24.00, 10.00, 12.00, 13.00, 63, '2019-01-27 08:01:12', '2019-01-27 08:01:12'),
(64, 'Type AB-', 3.00, 24.00, 10.00, 12.00, 13.00, 64, '2019-01-27 08:02:26', '2019-01-27 08:02:26'),
(65, 'Type AB+', 3.00, 24.00, 10.00, 12.00, 13.00, 65, '2019-01-27 08:03:36', '2019-01-27 08:03:36'),
(66, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 66, '2019-01-27 08:04:49', '2019-01-27 08:04:49'),
(67, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 67, '2019-01-27 08:06:11', '2019-01-27 08:06:11'),
(68, 'Type O', 3.00, 24.00, 10.00, 15.00, 16.00, 68, '2019-01-27 08:09:04', '2019-01-27 08:09:04'),
(69, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 69, '2019-01-27 08:10:32', '2019-01-27 08:10:32'),
(70, 'Type AB+', 3.00, 24.00, 10.00, 13.00, 15.00, 70, '2019-01-27 08:12:08', '2019-01-27 08:12:08'),
(71, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 71, '2019-01-27 08:13:25', '2019-01-27 08:13:25'),
(72, 'Type A+', 4.00, 25.00, 10.00, 15.00, 18.00, 72, '2019-01-27 08:14:44', '2019-01-27 08:14:44'),
(73, 'Type AB', 5.00, 26.00, 12.00, 18.00, 19.00, 73, '2019-01-27 08:16:01', '2019-01-27 08:16:01'),
(74, 'Type B+', 6.00, 25.00, 14.00, 18.00, 16.00, 74, '2019-01-27 08:17:16', '2019-01-27 08:17:16'),
(75, 'Type A-', 3.00, 24.00, 10.00, 18.00, 13.00, 75, '2019-01-27 08:18:41', '2019-01-27 08:18:41'),
(76, 'Type B+', 5.00, 36.00, 25.00, 15.00, 20.50, 76, '2019-01-27 08:20:05', '2019-01-27 08:20:05'),
(77, 'Type O', 6.00, 25.00, 10.00, 18.00, 18.00, 77, '2019-01-27 08:21:26', '2019-01-27 08:21:26'),
(78, 'Type A+', 6.00, 29.00, 11.00, 15.00, 19.00, 78, '2019-01-27 08:22:41', '2019-01-27 08:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `patients_id` int(10) UNSIGNED NOT NULL,
  `appointments_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `patients_id`, `appointments_id`, `created_at`, `updated_at`) VALUES
(1, 1367.66, 3, 12, '2019-01-27 09:37:55', '2019-01-27 09:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `official_receipt` double(8,2) NOT NULL,
  `quantity_ordered` int(11) NOT NULL,
  `quantity_received` int(11) NOT NULL,
  `quantity_missing` int(11) NOT NULL,
  `quantity_damaged` int(11) NOT NULL,
  `purchase_price` double NOT NULL,
  `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaccine_list_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rendered_vaccine`
--

CREATE TABLE `rendered_vaccine` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_date` datetime NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `replacement_date` datetime DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaccine_lists_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_transactions`
--

CREATE TABLE `return_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `vaccine_lists_id` int(10) UNSIGNED NOT NULL,
  `return_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sales_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_use`
--

CREATE TABLE `service_use` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_use_date` datetime NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED DEFAULT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccines_used`
--

CREATE TABLE `vaccines_used` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_administered` date DEFAULT NULL,
  `vaccine_list_id` int(10) UNSIGNED DEFAULT NULL,
  `immunization_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'BCG', '22615', '2019-01-27', '2020-10-16', 99, 1500, 'Available', 1, '2019-01-27 08:28:12', '2019-01-27 08:28:12'),
(2, 'BCG', '22616', '2019-01-20', '2020-01-17', 100, 1500, 'Available', 1, '2019-01-27 08:28:47', '2019-01-27 08:28:47'),
(3, 'BCG', '21116', '2018-12-19', '2020-01-22', 50, 1500, 'Available', 1, '2019-01-27 08:29:29', '2019-01-27 08:29:29'),
(4, 'BCG', '26516', '2018-11-07', '2020-01-23', 200, 1500, 'Available', 1, '2019-01-27 08:30:26', '2019-01-27 08:30:26'),
(5, 'BCG', '22216', '2019-01-20', '2019-05-15', 100, 1500, 'Available', 1, '2019-01-27 08:31:08', '2019-01-27 08:31:08'),
(6, 'BCG', '22225', '2018-12-04', '2019-02-20', 150, 1500, 'Available', 1, '2019-01-27 08:31:51', '2019-01-27 08:31:51'),
(7, 'GlaxoSmithKline', '11516', '2018-01-27', '2019-11-25', 200, 2500, 'Available', 2, '2019-01-27 08:34:13', '2019-01-27 08:34:13'),
(8, 'Merck', '15114', '2018-07-23', '2020-04-10', 250, 2500, 'Available', 2, '2019-01-27 08:34:50', '2019-01-27 08:34:50'),
(9, 'Havrix', '22515', '2018-05-02', '2020-01-12', 200, 2500, 'Available', 2, '2019-01-27 08:35:39', '2019-01-27 08:35:39'),
(10, 'Vaqta', '11578', '0008-02-15', '2019-08-14', 200, 2500, 'Available', 2, '2019-01-27 08:37:00', '2019-01-27 08:37:00'),
(11, 'Pediarix', '11525', '2018-01-16', '2019-03-17', 200, 2500, 'Available', 3, '2019-01-27 08:42:57', '2019-01-27 08:42:57'),
(12, 'ProQuad', '11121', '2018-08-16', '2019-07-16', 200, 2000, 'Available', 3, '2019-01-27 08:43:46', '2019-01-27 08:43:46'),
(13, 'Kinrix', '12252', '2018-09-20', '2019-02-12', 250, 2000, 'Available', 3, '2019-01-27 08:44:40', '2019-01-27 08:44:40'),
(14, 'Pentacel', '11125', '2018-09-23', '2019-09-20', 250, 2000, 'Available', 3, '2019-01-27 08:45:22', '2019-01-27 08:45:22'),
(15, 'Ipol', '16228', '2018-12-08', '2019-09-22', 300, 2500, 'Available', 4, '2019-01-27 08:47:07', '2019-01-27 08:47:07'),
(16, 'Polio', '15287', '2018-01-16', '2019-03-07', 198, 2500, 'Available', 4, '2019-01-27 08:48:12', '2019-01-27 08:48:12'),
(17, 'Ipol', '11527', '2018-12-16', '2019-11-22', 249, 2500, 'Available', 4, '2019-01-27 08:48:50', '2019-01-27 08:48:50'),
(18, 'Prevnar 13', '12523', '2018-02-23', '2019-06-16', 300, 2000, 'Available', 5, '2019-01-27 08:50:25', '2019-01-27 08:50:25'),
(19, 'Pneumovax', '13674', '2018-12-18', '2020-09-25', 300, 2000, 'Available', 5, '2019-01-27 08:51:17', '2019-01-27 08:51:17'),
(20, 'Synflorix', '18741', '2018-01-30', '2019-10-18', 300, 2000, 'Available', 5, '2019-01-27 08:51:54', '2019-01-27 08:51:54'),
(21, 'RotaTeq', '65252', '2018-01-09', '2020-01-17', 299, 2000, 'Available', 6, '2019-01-27 08:53:38', '2019-01-27 08:53:38'),
(22, 'Rotarix', '65248', '2019-01-27', '2020-12-31', 500, 2000, 'Available', 6, '2019-01-27 08:54:23', '2019-01-27 08:54:23'),
(23, 'Rotarix', '12874', '2019-01-27', '2019-12-23', 300, 2000, 'Available', 6, '2019-01-27 08:55:54', '2019-01-27 08:55:54'),
(24, 'Afluria', '12533', '2018-12-15', '2020-02-24', 499, 1000, 'Available', 7, '2019-01-27 08:58:41', '2019-01-27 08:58:41'),
(25, 'Fluad', '25364', '2019-01-20', '2019-12-24', 199, 1000, 'Available', 7, '2019-01-27 08:59:12', '2019-01-27 08:59:12'),
(26, 'Fluarix', '25633', '2019-01-20', '2019-03-21', 150, 1000, 'Available', 7, '2019-01-27 08:59:51', '2019-01-27 08:59:51'),
(27, 'Flucelvax', '29633', '2018-03-16', '2019-09-08', 197, 1000, 'Available', 7, '2019-01-27 09:00:27', '2019-01-27 09:00:27'),
(28, 'Fluzone', '63251', '2018-12-25', '2019-08-16', 200, 1000, 'Available', 7, '2019-01-27 09:01:09', '2019-01-27 09:01:09'),
(29, 'M-M-R® II', '85526', '2019-01-02', '2019-12-24', 500, 2000, 'Available', 8, '2019-01-27 09:02:28', '2019-01-27 09:02:28'),
(30, 'ProQuad', '85412', '2019-01-23', '2020-03-24', 500, 2000, 'Available', 8, '2019-01-27 09:03:01', '2019-01-27 09:03:01'),
(31, 'Ixiaro', '36365', '2018-06-07', '2020-04-29', 500, 2500, 'Available', 9, '2019-01-27 09:04:24', '2019-01-27 09:04:24'),
(32, 'M-M-R® II', '36885', '2018-12-19', '2020-02-08', 499, 2200, 'Available', 10, '2019-01-27 09:06:52', '2019-01-27 09:06:52'),
(33, 'ProQuad', '52525', '2018-12-26', '2020-03-26', 599, 2300, 'Available', 10, '2019-01-27 09:07:30', '2019-01-27 09:07:30'),
(34, 'Varivax', '21425', '2019-01-15', '2020-09-10', 600, 2300, 'Available', 11, '2019-01-27 09:08:52', '2019-01-27 09:08:52'),
(35, 'Varivax', '18742', '2019-01-20', '2020-01-22', 600, 2300, 'Available', 11, '2019-01-27 09:09:35', '2019-01-27 09:09:35'),
(36, 'Havrix', '85215', '2018-12-04', '2020-02-20', 500, 2500, 'Available', 12, '2019-01-27 09:11:06', '2019-01-27 09:11:06'),
(37, 'Vaqta', '98552', '2018-09-03', '2019-12-09', 400, 2200, 'Available', 12, '2019-01-27 09:11:42', '2019-01-27 09:11:42'),
(38, 'Twinrix', '85475', '2018-01-09', '2019-12-09', 300, 2100, 'Available', 12, '2019-01-27 09:12:16', '2019-01-27 09:12:16'),
(39, 'Gardasil', '21536', '2018-12-20', '2020-09-24', 500, 2300, 'Available', 13, '2019-01-27 09:14:23', '2019-01-27 09:14:23'),
(40, 'Gardasil', '84215', '2018-01-14', '2020-09-25', 700, 2300, 'Available', 13, '2019-01-27 09:15:02', '2019-01-27 09:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_types`
--

CREATE TABLE `vaccine_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `vaccine_type_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vaccine_dose` int(11) NOT NULL,
  `vaccine_type_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_types`
--

INSERT INTO `vaccine_types` (`id`, `vaccine_type_name`, `vaccine_dose`, `vaccine_type_description`, `created_at`, `updated_at`) VALUES
(1, 'BCG', 1, 'Bacillus Calmette–Guérin vaccine is a vaccine primarily used against tuberculosis.', '2019-01-27 08:24:05', '2019-01-27 08:24:05'),
(2, 'Hepatitis B', 5, 'Hepatitis B vaccine is a vaccine that prevents hepatitis B. The first dose is recommended within 24 hours of birth with either two or three more doses given after that.', '2019-01-27 08:32:49', '2019-01-27 08:32:49'),
(3, 'DTwP - Hib - Hep B and other DTaP combinations', 6, 'Diphtheria, Tetanus, Pertussis, Hepatitis B and Haemophilus influenzae type b conjugate vaccine (adsorbed), Abbreviation: DTwP-HepB-Hib (all-in-one), or DTwP-HepB+Hib (with separate freeze-dr', '2019-01-27 08:41:11', '2019-01-27 08:41:11'),
(4, 'IPV/OPV', 5, 'Inactivated polio vaccine (IPV) is the only polio vaccine that has been given in the United States since 2000. It is given by shot in the arm or leg, depending on the person\'s age. Oral polio', '2019-01-27 08:46:09', '2019-01-27 08:46:09'),
(5, 'PCV', 4, 'Pneumococcal conjugate vaccine is a pneumococcal vaccine and a conjugate vaccine used to protect infants, young children, and adults against disease caused by the bacterium Streptococcus pneu', '2019-01-27 08:49:30', '2019-01-27 08:49:30'),
(6, 'RV', 3, 'Rotavirus vaccine is a vaccine used to protect against rotavirus infections, which are the leading cause of severe diarrhea among young children. The vaccines prevent 15–34% of severe diarrhe', '2019-01-27 08:52:55', '2019-01-27 08:52:55'),
(7, 'Influenza', 10, 'Influenza vaccines, also known as flu shots or flu jabs, are vaccines that protect against infection by influenza viruses. A new version of the vaccine is developed twice a year, as the influ', '2019-01-27 08:56:54', '2019-01-27 08:56:54'),
(8, 'Measles', 1, 'Measles vaccine is a vaccine that prevents measles. After one dose at the age of nine months 85% are immune, while a dose at twelve months results in 95% immunity to measles.', '2019-01-27 09:01:44', '2019-01-27 09:01:44'),
(9, 'JE Vaccine', 2, 'Japanese encephalitis vaccine is a vaccine that protects against Japanese encephalitis. The vaccines are more than 90% effective. The duration of protection with the vaccine is not clear but', '2019-01-27 09:03:40', '2019-01-27 09:05:01'),
(10, 'MMR', 2, 'The MMR vaccine is a vaccine against measles, mumps, and rubella. The first dose is generally given to children around 9 to 15 months of age, with a second dose at 15 months to 6 years of age', '2019-01-27 09:05:29', '2019-01-27 09:05:29'),
(11, 'Varicella', 2, 'Varicella vaccine, also known as chickenpox vaccine, is a vaccine that protects against chickenpox. One dose of vaccine prevents 95% of moderate disease and 100% of severe disease. Two doses ', '2019-01-27 09:08:02', '2019-01-27 09:08:02'),
(12, 'Hepatitis A', 2, 'Hepatitis A vaccine is a vaccine that prevents hepatitis A. It is effective in around 95% of cases and lasts for at least fifteen years and possibly a person\'s entire life. If given, two dose', '2019-01-27 09:10:09', '2019-01-27 09:10:09'),
(13, 'HPV', 3, 'Human papilloma virus vaccines are vaccines that prevent infection by certain types of human papillomavirus. Available vaccines protect against either two, four, or nine types of HPV. All vac', '2019-01-27 09:13:26', '2019-01-27 09:13:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_patients_id_foreign` (`patients_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_transactions`
--
ALTER TABLE `delivery_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_transactions_vaccine_lists_id_foreign` (`vaccine_lists_id`),
  ADD KEY `delivery_transactions_delivery_id_foreign` (`delivery_id`);

--
-- Indexes for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donesched`
--
ALTER TABLE `donesched`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `immunizations_vaccine_types_id_foreign` (`vaccine_types_id`),
  ADD KEY `immunizations_patients_id_foreign` (`patients_id`);

--
-- Indexes for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_adjustments_vaccine_lists_id_foreign` (`vaccine_lists_id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medical_records_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_records`
--
ALTER TABLE `patient_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_records_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_patients_id_foreign` (`patients_id`),
  ADD KEY `payments_appointments_id_foreign` (`appointments_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_vaccine_list_id_foreign` (`vaccine_list_id`);

--
-- Indexes for table `rendered_vaccine`
--
ALTER TABLE `rendered_vaccine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returns_vaccine_lists_id_foreign` (`vaccine_lists_id`);

--
-- Indexes for table `return_transactions`
--
ALTER TABLE `return_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_transactions_vaccine_lists_id_foreign` (`vaccine_lists_id`),
  ADD KEY `return_transactions_return_id_foreign` (`return_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_service_id_foreign` (`service_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_use`
--
ALTER TABLE `service_use`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_use_service_id_foreign` (`service_id`),
  ADD KEY `service_use_appointment_id_foreign` (`appointment_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vaccines_used`
--
ALTER TABLE `vaccines_used`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vaccines_used_vaccine_list_id_foreign` (`vaccine_list_id`),
  ADD KEY `vaccines_used_immunization_id_foreign` (`immunization_id`);

--
-- Indexes for table `vaccine_lists`
--
ALTER TABLE `vaccine_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vaccine_lists_vaccine_types_id_foreign` (`vaccine_types_id`);

--
-- Indexes for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_transactions`
--
ALTER TABLE `delivery_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnoses`
--
ALTER TABLE `diagnoses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `donesched`
--
ALTER TABLE `donesched`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `immunizations`
--
ALTER TABLE `immunizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `patient_records`
--
ALTER TABLE `patient_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rendered_vaccine`
--
ALTER TABLE `rendered_vaccine`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_transactions`
--
ALTER TABLE `return_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_use`
--
ALTER TABLE `service_use`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccines_used`
--
ALTER TABLE `vaccines_used`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccine_lists`
--
ALTER TABLE `vaccine_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_patients_id_foreign` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `delivery_transactions`
--
ALTER TABLE `delivery_transactions`
  ADD CONSTRAINT `delivery_transactions_delivery_id_foreign` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_transactions_vaccine_lists_id_foreign` FOREIGN KEY (`vaccine_lists_id`) REFERENCES `vaccine_lists` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `donesched`
--
ALTER TABLE `donesched`
  ADD CONSTRAINT `donesched_id_foreign` FOREIGN KEY (`id`) REFERENCES `patients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD CONSTRAINT `immunizations_patients_id_foreign` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `immunizations_vaccine_types_id_foreign` FOREIGN KEY (`vaccine_types_id`) REFERENCES `vaccine_types` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  ADD CONSTRAINT `inventory_adjustments_vaccine_lists_id_foreign` FOREIGN KEY (`vaccine_lists_id`) REFERENCES `vaccine_lists` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `medical_records_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `patient_records`
--
ALTER TABLE `patient_records`
  ADD CONSTRAINT `patient_records_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_appointments_id_foreign` FOREIGN KEY (`appointments_id`) REFERENCES `appointments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_patients_id_foreign` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_vaccine_list_id_foreign` FOREIGN KEY (`vaccine_list_id`) REFERENCES `vaccine_lists` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_vaccine_lists_id_foreign` FOREIGN KEY (`vaccine_lists_id`) REFERENCES `vaccine_lists` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `return_transactions`
--
ALTER TABLE `return_transactions`
  ADD CONSTRAINT `return_transactions_return_id_foreign` FOREIGN KEY (`return_id`) REFERENCES `return_transactions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `return_transactions_vaccine_lists_id_foreign` FOREIGN KEY (`vaccine_lists_id`) REFERENCES `vaccine_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `service_use`
--
ALTER TABLE `service_use`
  ADD CONSTRAINT `service_use_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `service_use_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `vaccines_used`
--
ALTER TABLE `vaccines_used`
  ADD CONSTRAINT `vaccines_used_immunization_id_foreign` FOREIGN KEY (`immunization_id`) REFERENCES `immunizations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vaccines_used_vaccine_list_id_foreign` FOREIGN KEY (`vaccine_list_id`) REFERENCES `vaccine_lists` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `vaccine_lists`
--
ALTER TABLE `vaccine_lists`
  ADD CONSTRAINT `vaccine_lists_vaccine_types_id_foreign` FOREIGN KEY (`vaccine_types_id`) REFERENCES `vaccine_types` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
