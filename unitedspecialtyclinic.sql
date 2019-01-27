-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2019 at 06:13 AM
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
(1, 'admin', 'admin', 'USC', 'Laperal Bldg, Diego Silang Street, Baguio City', 9090000000, 'admin', '$2y$10$1o7sZOIAHj3SHn5Zzjw4C.rPDQk9./ZX9bkHR/2INSt2jluxCnRwK', NULL, NULL, NULL);

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
(31, '2019-01-27 03:32:56', '2019-01-27 03:32:56', 'Lopez', 'Ross', 'Angela', '2013-06-05', '33A/44 Bailey Springs Suite 202, Poblacion', 'Female', 'Harold Lopez', 'Jhoann Ross', 'Surgeon', 'Mathematician', 9785421852, 'Vacuum Extraction'),
(32, '2019-01-27 03:34:56', '2019-01-27 03:34:56', 'Lopez', 'Diaz', 'Sean', '2013-05-07', '12 Mills Villages Suite 512, Poblacion, Gingoog 2082 Agusan del Sur', 'Male', 'Matthew Lopez', 'Angela Diaz', 'Financial advisor', 'Lawyer', 9785421852, 'Vaginal Delivery'),
(33, '2019-01-27 03:36:45', '2019-01-27 03:36:45', 'Delos Santos', 'Cruz', 'Rafael', '2016-07-21', '59A/70 Okuneva Center, Poblacion, Bogo 6566 Lanao del Norte', 'Male', 'Ralph Delos Santos', 'Amy Cruz', 'Data processor', 'Song writer', 9785421785, 'Vaginal Delivery'),
(34, '2019-01-27 03:38:51', '2019-01-27 03:38:51', 'Magtanggol', 'Philipps', 'Victor', '2010-12-29', '53A Rath Flat, Poblacion, Bago 3205 Surigao del Norte', 'Male', 'Roger Magtanggol', 'Laura Philipps', 'Waiter', 'Choreographer', 9785421852, 'Natural Delivery'),
(35, '2019-01-27 03:40:50', '2019-01-27 03:40:50', 'Martin', 'Gonzales', 'Alice', '2010-04-08', '09/88 Wisozk Springs, Poblacion, Bacolod 6389 Batangas', 'Female', 'Carlo Martin', 'Maria Gonzales', 'Makeup artist', 'Art dealer', 9784512785, 'Vacuum Extraction'),
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
(50, '2019-01-27 04:11:08', '2019-01-27 04:11:08', 'Geraldez', 'Martin', 'Maureen', '2013-06-06', 'Engineers Hill, Baguio City', 'Female', 'Butch Geraldez', 'Noemi Geraldez', 'Housekeeper', 'Clockmaker', 9785285278, 'Vacuum Extraction');

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
(31, 'Type A-', 5.20, 24.50, 11.50, 11.25, 10.30, 31, '2019-01-27 03:32:56', '2019-01-27 03:32:56'),
(32, 'Type A-', 3.24, 24.16, 10.00, 11.50, 11.60, 32, '2019-01-27 03:34:56', '2019-01-27 03:34:56'),
(33, 'Type A+', 5.17, 26.15, 10.00, 12.00, 13.00, 33, '2019-01-27 03:36:45', '2019-01-27 03:36:45'),
(34, 'Type AB', 4.00, 24.00, 10.00, 12.00, 13.00, 34, '2019-01-27 03:38:51', '2019-01-27 03:38:51'),
(35, 'Type A+', 5.00, 25.00, 10.00, 13.00, 13.00, 35, '2019-01-27 03:40:50', '2019-01-27 03:40:50'),
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
(50, 'Type AB', 4.00, 25.00, 12.00, 13.00, 14.00, 50, '2019-01-27 04:11:08', '2019-01-27 04:11:08');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donesched`
--
ALTER TABLE `donesched`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `immunizations`
--
ALTER TABLE `immunizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `patient_records`
--
ALTER TABLE `patient_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
