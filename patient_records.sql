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
(1, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 1, '2019-01-26 10:32:03', '2019-01-26 10:32:03'),
(2, 'Type AB', 4.00, 25.00, 10.00, 12.00, 13.00, 2, '2019-01-26 10:33:43', '2019-01-26 10:33:43'),
(3, 'Type B', 3.00, 24.00, 10.00, 12.00, 13.00, 3, '2019-01-26 10:36:14', '2019-01-26 10:36:14'),
(4, 'Type O', 6.00, 26.00, 11.00, 13.00, 14.00, 4, '2019-01-26 10:38:00', '2019-01-26 10:38:00'),
(5, 'Type B+', 5.00, 25.00, 10.00, 13.00, 14.00, 5, '2019-01-26 10:39:29', '2019-01-26 10:39:29'),
(6, 'Type AB-', 4.00, 25.00, 10.00, 12.00, 13.00, 6, '2019-01-26 10:42:29', '2019-01-26 10:42:29'),
(7, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 7, '2019-01-26 10:44:32', '2019-01-26 10:44:32'),
(8, 'Type O', 6.00, 28.00, 12.00, 13.00, 14.00, 8, '2019-01-26 10:46:18', '2019-01-26 10:46:18'),
(9, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 9, '2019-01-26 10:47:45', '2019-01-26 10:47:45'),
(10, 'Type AB+', 3.00, 24.00, 10.00, 12.00, 13.00, 10, '2019-01-26 10:50:08', '2019-01-26 10:50:08'),
(11, 'Type AB-', 3.00, 24.00, 10.00, 12.00, 13.00, 11, '2019-01-26 10:53:09', '2019-01-26 10:53:09'),
(12, 'Type AB', 3.00, 26.00, 10.00, 13.00, 13.00, 12, '2019-01-26 10:57:06', '2019-01-26 10:57:06'),
(13, 'Type O', 5.00, 30.00, 12.00, 13.00, 15.00, 13, '2019-01-26 10:58:50', '2019-01-26 10:58:50'),
(14, 'Type A+', 5.00, 25.00, 10.00, 12.00, 13.00, 14, '2019-01-26 11:00:22', '2019-01-26 11:00:22'),
(15, 'Type O', 3.00, 25.00, 10.00, 12.00, 13.00, 15, '2019-01-26 11:03:36', '2019-01-26 11:03:36'),
(16, 'Type A+', 5.00, 27.00, 13.00, 15.00, 16.00, 16, '2019-01-26 11:05:44', '2019-01-26 11:05:44'),
(17, 'Type B+', 5.00, 28.00, 10.00, 12.00, 23.00, 17, '2019-01-26 11:07:44', '2019-01-26 11:07:44'),
(18, 'Type A-', 8.00, 30.00, 12.00, 13.00, 15.00, 18, '2019-01-26 11:09:19', '2019-01-26 11:09:19'),
(19, 'Type AB', 6.00, 28.00, 10.00, 12.00, 13.00, 19, '2019-01-26 11:11:48', '2019-01-26 11:11:48'),
(20, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 20, '2019-01-26 11:13:55', '2019-01-26 11:13:55'),
(21, 'Type O', 3.00, 24.00, 10.00, 13.00, 13.00, 21, '2019-01-26 11:16:00', '2019-01-26 11:16:00'),
(22, 'Type A+', 4.00, 25.00, 10.00, 12.00, 13.00, 22, '2019-01-26 11:17:24', '2019-01-26 11:17:24'),
(23, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 23, '2019-01-26 11:19:16', '2019-01-26 11:19:16'),
(24, 'Type B-', 5.00, 29.00, 10.00, 12.00, 13.00, 24, '2019-01-26 11:20:56', '2019-01-26 11:20:56'),
(25, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 25, '2019-01-26 11:22:05', '2019-01-26 11:22:05'),
(26, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 26, '2019-01-26 11:23:32', '2019-01-26 11:23:32'),
(27, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 27, '2019-01-26 11:24:46', '2019-01-26 11:24:46'),
(28, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 28, '2019-01-26 11:26:49', '2019-01-26 11:26:49'),
(29, 'Type A+', 3.00, 30.00, 10.00, 12.00, 13.00, 29, '2019-01-26 11:29:14', '2019-01-26 11:29:14'),
(30, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 30, '2019-01-26 11:31:03', '2019-01-26 11:31:03'),
(31, 'Type A-', 5.20, 24.50, 11.50, 11.25, 10.30, 50, '2019-01-26 11:32:56', '2019-01-26 15:39:20'),
(32, 'Type A-', 3.24, 24.16, 10.00, 11.50, 11.60, 32, '2019-01-26 11:34:56', '2019-01-26 11:34:56'),
(33, 'Type A+', 5.17, 26.15, 10.00, 12.00, 13.00, 33, '2019-01-26 11:36:45', '2019-01-26 11:36:45'),
(34, 'Type AB', 4.00, 24.00, 10.00, 12.00, 13.00, 34, '2019-01-26 11:38:51', '2019-01-26 11:38:51'),
(35, 'Type A+', 5.00, 25.00, 10.00, 13.00, 13.00, 50, '2019-01-26 11:40:50', '2019-01-26 15:38:41'),
(36, 'Type A-', 4.00, 25.00, 10.00, 13.00, 15.00, 36, '2019-01-26 11:43:13', '2019-01-26 11:43:13'),
(37, 'Type B-', 4.00, 25.00, 10.00, 13.00, 15.00, 37, '2019-01-26 11:45:25', '2019-01-26 11:45:25'),
(38, 'Type AB-', 5.00, 28.00, 10.00, 14.00, 16.00, 38, '2019-01-26 11:47:31', '2019-01-26 11:47:31'),
(39, 'Type A+', 4.00, 25.00, 10.00, 11.00, 13.00, 39, '2019-01-26 11:49:16', '2019-01-26 11:49:16'),
(40, 'Type B+', 5.00, 28.00, 12.00, 13.00, 14.00, 40, '2019-01-26 11:50:58', '2019-01-26 11:50:58'),
(41, 'Type A+', 5.00, 28.00, 13.00, 14.00, 15.00, 41, '2019-01-26 11:52:58', '2019-01-26 11:52:58'),
(42, 'Type A+', 5.00, 29.00, 15.00, 15.00, 16.00, 42, '2019-01-26 11:54:39', '2019-01-26 11:54:39'),
(43, 'Type AB', 6.00, 30.00, 15.00, 16.00, 17.00, 43, '2019-01-26 11:56:21', '2019-01-26 11:56:21'),
(44, 'Type O', 7.00, 32.00, 16.00, 17.00, 15.00, 44, '2019-01-26 11:58:05', '2019-01-26 11:58:05'),
(45, 'Type A-', 5.00, 32.00, 10.00, 10.00, 10.00, 45, '2019-01-26 12:00:28', '2019-01-26 12:00:28'),
(46, 'Type O', 4.00, 24.00, 10.00, 13.00, 13.00, 46, '2019-01-26 12:03:08', '2019-01-26 12:03:08'),
(47, 'Type B', 4.00, 24.00, 10.00, 12.00, 13.00, 47, '2019-01-26 12:04:57', '2019-01-26 12:04:57'),
(48, 'Type A+', 5.00, 28.00, 15.00, 16.00, 17.00, 48, '2019-01-26 12:07:45', '2019-01-26 12:07:45'),
(49, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 49, '2019-01-26 12:09:50', '2019-01-26 12:09:50'),
(50, 'Type AB', 4.00, 25.00, 12.00, 13.00, 14.00, 50, '2019-01-26 12:11:08', '2019-01-26 12:11:08'),
(51, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 51, '2019-01-26 15:42:00', '2019-01-26 15:42:00'),
(52, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 52, '2019-01-26 15:43:59', '2019-01-26 15:43:59'),
(53, 'Type O', 6.00, 34.00, 15.00, 15.00, 18.00, 53, '2019-01-26 15:45:23', '2019-01-26 15:45:23'),
(54, 'Type A+', 3.00, 24.00, 10.00, 12.00, 16.00, 54, '2019-01-26 15:47:26', '2019-01-26 15:47:26'),
(55, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 55, '2019-01-26 15:48:43', '2019-01-26 15:48:43'),
(56, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 56, '2019-01-26 15:49:53', '2019-01-26 15:49:53'),
(57, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 57, '2019-01-26 15:51:20', '2019-01-26 15:51:20'),
(58, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 58, '2019-01-26 15:52:33', '2019-01-26 15:52:33'),
(59, 'Type B-', 3.00, 24.00, 10.00, 12.00, 13.00, 59, '2019-01-26 15:55:23', '2019-01-26 15:55:23'),
(60, 'Type AB+', 3.00, 24.00, 10.00, 12.00, 13.00, 60, '2019-01-26 15:56:47', '2019-01-26 15:56:47'),
(61, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 61, '2019-01-26 15:57:57', '2019-01-26 15:57:57'),
(62, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 62, '2019-01-26 15:59:55', '2019-01-26 15:59:55'),
(63, 'Type B+', 3.00, 24.00, 10.00, 12.00, 13.00, 63, '2019-01-26 16:01:12', '2019-01-26 16:01:12'),
(64, 'Type AB-', 3.00, 24.00, 10.00, 12.00, 13.00, 64, '2019-01-26 16:02:26', '2019-01-26 16:02:26'),
(65, 'Type AB+', 3.00, 24.00, 10.00, 12.00, 13.00, 65, '2019-01-26 16:03:36', '2019-01-26 16:03:36'),
(66, 'Type O', 3.00, 24.00, 10.00, 12.00, 13.00, 66, '2019-01-26 16:04:49', '2019-01-26 16:04:49'),
(67, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 67, '2019-01-26 16:06:11', '2019-01-26 16:06:11'),
(68, 'Type O', 3.00, 24.00, 10.00, 15.00, 16.00, 68, '2019-01-26 16:09:04', '2019-01-26 16:09:04'),
(69, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 69, '2019-01-26 16:10:32', '2019-01-26 16:10:32'),
(70, 'Type AB+', 3.00, 24.00, 10.00, 13.00, 15.00, 70, '2019-01-26 16:12:08', '2019-01-26 16:12:08'),
(71, 'Type A-', 3.00, 24.00, 10.00, 12.00, 13.00, 71, '2019-01-26 16:13:25', '2019-01-26 16:13:25'),
(72, 'Type A+', 4.00, 25.00, 10.00, 15.00, 18.00, 72, '2019-01-26 16:14:44', '2019-01-26 16:14:44'),
(73, 'Type AB', 5.00, 26.00, 12.00, 18.00, 19.00, 73, '2019-01-26 16:16:01', '2019-01-26 16:16:01'),
(74, 'Type B+', 6.00, 25.00, 14.00, 18.00, 16.00, 74, '2019-01-26 16:17:16', '2019-01-26 16:17:16'),
(75, 'Type A-', 3.00, 24.00, 10.00, 18.00, 13.00, 75, '2019-01-26 16:18:41', '2019-01-26 16:18:41'),
(76, 'Type B+', 5.00, 36.00, 25.00, 15.00, 20.50, 76, '2019-01-26 16:20:05', '2019-01-26 16:20:05'),
(77, 'Type O', 6.00, 25.00, 10.00, 18.00, 18.00, 77, '2019-01-26 16:21:26', '2019-01-26 16:21:26'),
(78, 'Type A+', 6.00, 29.00, 11.00, 15.00, 19.00, 78, '2019-01-26 16:22:41', '2019-01-26 16:22:41'),
(79, 'Type A+', 5.00, 25.00, 6.00, 7.00, 8.00, 79, '2019-01-26 12:06:45', '2019-01-26 12:06:45'),
(80, 'Type O', 20.00, 60.00, 16.00, 18.00, 19.00, 80, '2019-01-26 12:08:55', '2019-01-26 12:08:55'),
(81, 'Type A+', 5.00, 25.00, 10.00, 12.00, 13.00, 81, '2019-01-26 13:48:57', '2019-01-26 13:48:57'),
(82, 'Type B', 6.00, 36.00, 15.00, 16.00, 17.00, 82, '2019-01-26 13:50:30', '2019-01-26 13:50:30'),
(83, 'Type B-', 9.00, 39.00, 19.00, 12.00, 18.00, 83, '2019-01-26 13:52:05', '2019-01-26 13:52:05'),
(84, 'Type A+', 3.00, 28.00, 10.00, 12.00, 13.00, 84, '2019-01-26 13:53:32', '2019-01-26 13:53:32'),
(85, 'Type B+', 3.00, 24.00, 10.00, 12.00, 13.00, 85, '2019-01-26 13:54:49', '2019-01-26 13:54:49'),
(86, 'Type A-', 10.00, 30.00, 19.00, 18.00, 17.00, 86, '2019-01-26 13:57:28', '2019-01-26 13:57:28'),
(87, 'Type AB+', 4.00, 26.00, 10.00, 12.00, 13.00, 87, '2019-01-26 14:10:30', '2019-01-26 14:10:30'),
(88, 'Type AB', 9.00, 28.00, 13.00, 15.00, 17.00, 88, '2019-01-26 14:13:09', '2019-01-26 14:13:09'),
(89, 'Type B-', 6.00, 30.00, 15.00, 12.00, 13.00, 89, '2019-01-26 14:15:00', '2019-01-26 14:15:00'),
(90, 'Type A-', 12.00, 30.00, 15.00, 15.00, 16.00, 90, '2019-01-26 14:17:30', '2019-01-26 14:17:30'),
(91, 'Type AB+', 6.00, 36.00, 15.00, 18.00, 17.00, 91, '2019-01-26 14:19:32', '2019-01-26 14:19:32'),
(92, 'Type B-', 6.00, 26.00, 18.00, 19.00, 17.00, 92, '2019-01-26 14:21:25', '2019-01-26 14:21:25'),
(93, 'Type B-', 11.00, 26.00, 12.00, 18.00, 16.00, 93, '2019-01-26 14:22:56', '2019-01-26 14:22:56'),
(94, 'Type B+', 10.00, 38.00, 13.00, 18.00, 20.00, 94, '2019-01-26 14:24:33', '2019-01-26 14:24:33'),
(95, 'Type AB-', 3.00, 24.00, 10.00, 12.00, 13.00, 95, '2019-01-26 14:26:01', '2019-01-26 14:26:01'),
(96, 'Type AB', 3.00, 24.00, 10.00, 12.00, 13.00, 96, '2019-01-26 14:27:35', '2019-01-26 14:27:35'),
(97, 'Type B+', 3.00, 24.00, 10.00, 12.00, 13.00, 97, '2019-01-26 14:28:54', '2019-01-26 14:28:54'),
(98, 'Type AB+', 5.00, 28.00, 16.00, 18.00, 17.00, 98, '2019-01-26 14:30:44', '2019-01-26 14:30:44'),
(99, 'Type B-', 3.00, 24.00, 10.00, 12.00, 15.00, 99, '2019-01-26 14:32:03', '2019-01-26 14:32:03'),
(100, 'Type A+', 3.00, 24.00, 10.00, 12.00, 13.00, 100, '2019-01-26 14:33:12', '2019-01-26 14:33:12'),
(101, 'Type A+', 6.00, 36.00, 12.00, 13.00, 15.00, 101, '2019-01-29 03:09:15', '2019-01-29 03:09:15'),
(102, 'Type B+', 5.00, 34.00, 15.00, 18.00, 19.00, 102, '2019-01-29 03:11:24', '2019-01-29 03:11:24'),
(103, 'Type B+', 8.00, 36.00, 15.00, 18.00, 19.00, 103, '2019-01-29 03:13:04', '2019-01-29 03:13:04'),
(104, 'Type B-', 6.00, 36.00, 15.00, 18.00, 19.00, 104, '2019-01-29 03:14:59', '2019-01-29 03:14:59'),
(105, 'Type B+', 9.00, 39.00, 10.00, 15.00, 18.00, 105, '2019-01-29 03:17:14', '2019-01-29 03:17:14'),
(106, 'Type AB+', 6.00, 36.00, 20.00, 25.00, 17.00, 106, '2019-01-29 03:19:39', '2019-01-29 03:19:39'),
(107, 'Type B', 6.00, 24.00, 10.00, 12.00, 15.50, 107, '2019-01-29 03:21:22', '2019-01-29 03:21:22'),
(108, 'Type AB+', 12.00, 36.50, 15.00, 12.00, 18.90, 108, '2019-01-29 03:22:59', '2019-01-29 03:22:59'),
(109, 'Type AB-', 5.00, 36.00, 18.00, 15.00, 19.00, 109, '2019-01-29 03:24:30', '2019-01-29 03:24:30'),
(110, 'Type A', 6.00, 36.00, 15.00, 18.00, 19.00, 110, '2019-01-29 03:26:21', '2019-01-29 03:26:21'),
(111, 'Type A-', 6.00, 26.00, 15.00, 18.00, 25.00, 111, '2019-01-29 03:28:27', '2019-01-29 03:28:27'),
(112, 'Type AB+', 6.00, 46.00, 10.00, 18.00, 18.00, 112, '2019-01-29 03:31:04', '2019-01-29 03:31:04'),
(113, 'Type A-', 9.00, 36.00, 15.00, 19.50, 17.80, 113, '2019-01-29 03:33:50', '2019-01-29 03:33:50'),
(114, 'Type A+', 6.00, 25.00, 15.00, 18.00, 25.00, 114, '2019-01-29 03:35:28', '2019-01-29 03:35:28'),
(115, 'Type A', 6.00, 36.00, 18.00, 19.00, 25.00, 115, '2019-01-29 03:37:45', '2019-01-29 03:37:45'),
(116, 'Type O', 6.00, 25.00, 18.00, 25.00, 26.00, 116, '2019-01-29 03:40:54', '2019-01-29 03:40:54'),
(117, 'Type AB', 9.00, 39.00, 15.00, 19.00, 25.00, 117, '2019-01-29 03:44:34', '2019-01-29 03:44:34'),
(118, 'Type A+', 6.00, 25.00, 18.00, 19.00, 17.00, 118, '2019-01-29 03:46:25', '2019-01-29 03:46:25'),
(119, 'Type A-', 6.00, 36.00, 18.00, 19.00, 28.00, 119, '2019-01-29 03:48:04', '2019-01-29 03:48:04'),
(120, 'Type AB', 6.00, 36.00, 18.00, 25.00, 28.00, 120, '2019-01-29 03:49:44', '2019-01-29 03:49:44'),
(121, 'Type B', 25.00, 110.00, 20.00, 21.00, 22.00, 121, '2019-01-29 03:56:21', '2019-01-29 03:56:21'),
(122, 'Type O', 7.00, 61.50, 10.00, 12.00, 13.00, 122, '2019-01-29 03:57:51', '2019-01-29 03:57:51'),
(123, 'Type B+', 30.00, 120.50, 23.00, 25.00, 26.00, 123, '2019-01-29 03:59:55', '2019-01-29 03:59:55'),
(124, 'Type O', 24.00, 105.00, 24.00, 26.00, 27.00, 124, '2019-01-29 04:05:38', '2019-01-29 04:05:38'),
(125, 'Type AB', 32.00, 115.00, 26.00, 28.00, 29.00, 125, '2019-01-29 04:10:42', '2019-01-29 04:10:42'),
(126, 'Type B-', 32.00, 107.00, 24.00, 26.00, 27.00, 126, '2019-01-29 04:14:14', '2019-01-29 04:14:14'),
(127, 'Type AB+', 25.00, 100.00, 21.00, 23.00, 24.00, 127, '2019-01-29 04:17:15', '2019-01-29 04:17:15'),
(128, 'Type O', 25.00, 109.00, 15.00, 17.00, 18.00, 128, '2019-01-29 04:19:27', '2019-01-29 04:19:27'),
(129, 'Type AB+', 30.00, 120.00, 26.00, 27.00, 28.00, 129, '2019-01-29 04:21:37', '2019-01-29 04:21:37'),
(130, 'Type A+', 30.00, 110.00, 30.00, 32.00, 33.00, 130, '2019-01-29 04:23:43', '2019-01-29 04:23:43'),
(131, 'Type A+', 30.00, 115.00, 21.00, 23.00, 24.00, 131, '2019-01-29 04:25:39', '2019-01-29 04:25:39'),
(132, 'Type B+', 40.00, 140.00, 30.00, 33.00, 34.00, 132, '2019-01-29 04:27:27', '2019-01-29 04:27:27'),
(133, 'Type A+', 20.00, 95.00, 15.00, 17.00, 18.00, 133, '2019-01-29 04:28:51', '2019-01-29 04:28:51'),
(134, 'Type AB', 35.00, 150.00, 31.00, 33.00, 34.00, 134, '2019-01-29 04:30:26', '2019-01-29 04:30:26'),
(135, 'Type A-', 36.00, 140.00, 33.00, 35.00, 36.00, 135, '2019-01-29 04:32:56', '2019-01-29 04:32:56'),
(136, 'Type A', 15.00, 80.00, 10.00, 13.00, 14.00, 136, '2019-01-29 04:34:34', '2019-01-29 04:34:34'),
(137, 'Type O', 25.00, 118.00, 25.00, 26.00, 27.00, 137, '2019-01-29 04:39:40', '2019-01-29 04:39:40'),
(138, 'Type B', 30.00, 140.00, 25.00, 27.00, 28.00, 138, '2019-01-29 04:41:59', '2019-01-29 04:41:59'),
(139, 'Type A+', 25.00, 160.00, 20.00, 23.00, 24.00, 139, '2019-01-29 04:43:52', '2019-01-29 04:43:52'),
(140, 'Type A+', 20.00, 75.50, 14.00, 15.00, 16.00, 140, '2019-01-29 04:45:22', '2019-01-29 04:45:22'),
(141, 'Type B-', 40.00, 150.00, 30.00, 35.00, 36.00, 141, '2019-01-29 04:47:18', '2019-01-29 04:47:18'),
(142, 'Type AB', 36.00, 120.00, 25.00, 26.00, 27.00, 142, '2019-01-29 04:48:53', '2019-01-29 04:48:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient_records`
--
ALTER TABLE `patient_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_records_patient_id_foreign` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient_records`
--
ALTER TABLE `patient_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patient_records`
--
ALTER TABLE `patient_records`
  ADD CONSTRAINT `patient_records_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;