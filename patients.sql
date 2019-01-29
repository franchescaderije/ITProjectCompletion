-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2019 at 09:00 AM
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
(1, '2019-01-26 10:32:03', '2019-01-26 10:32:03', 'Derije', 'Cabiles', 'Franchesca', '2010-01-20', 'Cuyapo, Nueva Ecija', 'Female', 'Virgilio Derije', 'Rosemarie Cabiles', 'Housewife', 'Agriculturist', 9457616581, 'Vaginal Delivery'),
(2, '2019-01-26 10:33:43', '2019-01-26 10:33:43', 'Valdez', 'Miguel', 'Drizzle', '2009-10-11', 'Candon City, Ilocos Sur', 'Female', 'Hugo Valdez', 'Salina Miguel', 'OFW', 'Engineer', 9112225522, 'Vaginal Birth After Cesarian'),
(3, '2019-01-26 10:36:14', '2019-01-26 10:36:14', 'Custodio', 'Mendoza', 'Danica', '2012-07-17', 'Tuding, Baguio City', 'Female', 'Chris Custodio', 'Shane Mendoza', 'Teacher', 'Doctor', 9225544847, 'Vaginal Delivery'),
(4, '2019-01-26 10:37:59', '2019-01-26 10:37:59', 'Dela Cruz', 'Bautista', 'Ojoj', '2009-08-10', 'Dominican, Baguio City', 'Male', 'Jojo Dela Cruz', 'Sylvia Bautista', 'OFW', 'Engineer', 9774455885, 'Natural Delivery'),
(5, '2019-01-26 10:39:29', '2019-01-26 10:39:29', 'Daclison', 'Cruz', 'John Brian', '2014-04-09', 'Trancoville, Baguio City', 'Male', 'Remy Daclison', 'Cecile Cruz', 'Teacher', 'Nurse', 9554411525, 'Forceps Delivery'),
(6, '2019-01-26 10:42:29', '2019-01-26 10:42:29', 'Salazar', 'Ramos', 'Von Karlos', '2015-01-13', 'Cabanatuan City, Nueva Ecija', 'Male', 'Roman Salazar', 'Zenaida Ramos', 'Principal', 'Doctor', 9442256631, 'Vaginal Birth After Cesarian'),
(7, '2019-01-26 10:44:32', '2019-01-26 10:44:32', 'Mendoza', 'Bayani', 'Renedez', '2017-03-07', 'Quirino Hill, Baguio City', 'Male', 'Rommel Mendoza', 'Katrina Bayani', 'Teacher', 'Engineer', NULL, 'Forceps Delivery'),
(8, '2019-01-26 10:46:18', '2019-01-26 10:46:18', 'Cerezo', 'David', 'Kyrie', '2013-08-12', 'Honeymoon Road, Baguio City', 'Male', 'Zoren Cerezo', 'Benita David', 'OFW', 'Nurse', NULL, 'C-Section'),
(9, '2019-01-26 10:47:45', '2019-01-26 10:47:45', 'Mercado', 'Tomas', 'Kimberly', '2014-01-14', 'Honeymoon Road, Baguio City', 'Female', 'Daniel Mercado', 'Krishna Tomas', 'Teacher', 'Police', 9555885541, 'Natural Delivery'),
(10, '2019-01-26 10:50:07', '2019-01-26 10:50:07', 'Wagner', 'Christie', 'Krishna', '2015-07-14', '2261 Aurora Boulevard 1300, Pasay City', 'Female', 'David Wagner', 'Katherine Christie', 'Teacher', 'Police', 9444455552, 'Vaginal Birth After Cesarian'),
(11, '2019-01-26 10:53:09', '2019-01-26 10:53:09', 'Columbus', 'Rodriguez', 'Shyanne', '2018-01-09', '07 Kling Walks, Poblacion, Oroquieta 6156 Metro Manila', 'Female', 'Johnny Columbus', 'Jenny Rodriguez', 'Anaesthetist', 'Barrister', NULL, 'Vaginal Birth After Cesarian'),
(12, '2019-01-26 10:57:06', '2019-01-26 10:57:06', 'Smith', 'Urban', 'Orlo', '2009-06-16', '42 Moore Roads Suite 773, Poblacion, Tarlac City', 'Male', 'Franklin Smith', 'Ursula Urban', 'Company director', 'Prison officer', 9555522228, 'Vaginal Delivery'),
(13, '2019-01-26 10:58:50', '2019-01-26 10:58:50', 'Marion', 'Emmerich', 'Hilario', '2013-08-13', 'Marcos Highway, Antipolo City 1870 Rizal', 'Male', 'Jarrod Marion', 'Laura Emmerich', 'Dental hygienist', 'Funeral director', NULL, 'Natural Delivery'),
(14, '2019-01-26 11:00:22', '2019-01-26 11:00:22', 'Robles', 'Forbes', 'Perry', '2009-10-06', 'Unit 104, G/F, Pacific Place Building, 104 Pearl Drive corner Amethyst Road, Ortigas Center, Pasig City 1605 Metro Manila', 'Female', 'Joel', 'Luna Forbes', 'Osteopath', 'Chimney sweep', NULL, 'Vacuum Extraction'),
(15, '2019-01-26 11:03:35', '2019-01-26 11:03:35', 'Jimenez', 'Williamson', 'Jeanne', '2016-05-10', 'Suite 82, Legaspi Suites, 178 Salcedo Street, Legaspi Village, Makati City 1229 Metro Manila', 'Female', 'Khalid Jimenez', 'Laura Williamson', 'Flight attendant', 'Civil servant', 9888555222, 'Forceps Delivery'),
(16, '2019-01-26 11:05:44', '2019-01-26 11:05:44', 'Aguilar', 'Gideon', 'Rima', '2010-07-14', '704 Laurel Street, Severina Industrial Estates, Paranaque City 1700 Metro Manila', 'Female', 'Arjun Aguilar', 'Cassidy Gideon', 'Anthropologist', 'Book keeper', 9553336636, 'Vacuum Extraction'),
(17, '2019-01-26 11:07:44', '2019-01-26 11:07:44', 'Perez', 'Oneil', 'Shania', '2015-08-12', 'Stall A, Adivay Building, 22, Lower Bonifacio Street, ABCR Barangay, Baguio City 2600 Benguet', 'Female', 'Brayden Perez', 'Laith Oneil', 'Auditor', 'Pathologist', NULL, 'Vacuum Extraction'),
(18, '2019-01-26 11:09:19', '2019-01-26 11:09:19', 'Perez', 'Evans', 'Arjun', '2011-08-16', '1 Adarna Street, Dizon Subdivision, Baguio City 2600 Benguet', 'Male', 'Tobey Perez', 'Philippa Evans', 'Bank manager', 'Firefighter', NULL, 'Vacuum Extraction'),
(19, '2019-01-26 11:11:48', '2019-01-26 11:11:48', 'Rayner', 'Terry', 'Shelbie', '2015-05-05', '2nd Floor, NBV Bldg., Lower Bonifacio Street, ABCR, Baguio City 2600 Benguet', 'Female', 'Hugo Rayner', 'Margot Terry', 'Manicurist', 'Gardener', NULL, 'Natural Delivery'),
(20, '2019-01-26 11:13:55', '2019-01-26 11:13:55', 'Cabiles', 'Empleo', 'Ashley Gwen', '2011-08-17', 'Brgy. Buli, Alabang, Muntinlupa City', 'Female', 'Amador Cabiles', 'Alma Empleo', 'Aircraft engineer', 'Coastguard', 9777555225, 'Natural Delivery'),
(21, '2019-01-26 11:16:00', '2019-01-26 11:16:00', 'Cabiles', 'Empleo', 'Arianne Gaile', '2010-02-17', 'Brgy. Buli, Alabang, Muntinlupa City', 'Female', 'Amador Cabiles', 'Alma Empleo', 'Aircraft Engineer', 'Coastguard', 9885522633, 'Forceps Delivery'),
(22, '2019-01-26 11:17:24', '2019-01-26 11:17:24', 'Sabay', 'Cabiles', 'Maria Angelica', '2014-04-10', 'Angeles City, Pampangga', 'Female', 'Bong Sabay', 'Maria Victoria Cabiles', 'Nurse', 'Soldier', 9552236663, 'Natural Delivery'),
(23, '2019-01-26 11:19:16', '2019-01-26 11:19:16', 'Sabay', 'Cabiles', 'Maria Therese', '2012-01-09', 'Angeles City, Pampangga', 'Female', 'Bong Sabay', 'Maria Victoria Cabiles', 'Nurse', 'Housekeeper', 9888855552, 'Natural Delivery'),
(24, '2019-01-26 11:20:56', '2019-01-26 11:20:56', 'Ibuan', 'Empleo', 'Zack Gabriel', '2012-03-14', 'Cuyapo, Nueva Ecija', 'Male', 'Jose Ibuan', 'Annie Rose Empleo', 'Housekeeper', 'Seaman', 9552221477, 'C-Section'),
(25, '2019-01-26 11:22:05', '2019-01-26 11:22:05', 'Derije', 'Lina', 'Jomar', '2009-06-25', 'Cuyapo, Nueva Ecija', 'Male', 'Amado Derije', 'Nora Lina', 'OFW', 'Housekeeper', 9785424865, 'Vaginal Birth After Cesarian'),
(26, '2019-01-26 11:23:32', '2019-01-26 11:23:32', 'Almuete', 'Ibuan', 'Zooey Audrey', '2015-06-24', 'Cuyapo, Nueva Ecija', 'Female', 'John Ross Almuete', 'Janine Ibuan', 'Housekeeper', 'Housekeeper', 9785412478, 'Forceps Delivery'),
(27, '2019-01-26 11:24:46', '2019-01-26 11:24:46', 'Almuete', 'Ibuan', 'Zion Austin', '2018-06-20', 'Cuyapo, Nueva Ecija', 'Male', 'John Ross Almuete', 'Janine Ibuan', 'Housekeeper', 'Housekeeper', 9785421585, 'Vacuum Extraction'),
(28, '2019-01-26 11:26:49', '2019-01-26 11:26:49', 'Castillo', 'Gomez', 'Leyla', '2011-08-11', 'Jose L. Briones Street North Reclamation Area, Brgy. Careta, Cebu City 6000 Cebu', 'Female', 'Richard Castillo', 'Shelbie Gomez', 'Anthropologist', 'Boat builder', 9785412078, 'Forceps Delivery'),
(29, '2019-01-26 11:29:14', '2019-01-26 11:29:14', 'Bonner', 'Beech', 'Emyr', '2003-07-16', '53A Bartoletti Parkway, Poblacion, Santiago 9713 Masbate', 'Male', 'Bobby Bonner', 'Jane Beech', 'Casual worker', 'Chiropodist', 9785421548, 'Vacuum Extraction'),
(30, '2019-01-26 11:31:03', '2019-01-26 11:31:03', 'Rodriguez', 'Alexander', 'Edward', '2015-09-23', '81A Strosin Rapid, Poblacion, Candon', 'Male', 'Bonnie Rodriguez', 'Ruby Alexander', 'Art historian', 'Film Director', 9785421085, 'Vacuum Extraction'),
(31, '2019-01-26 11:32:56', '2019-01-26 15:39:20', 'Lopez', 'Ross', 'Angela', '1998-06-05', '33A/44 Bailey Springs Suite 202, Poblacion', 'Female', 'Harold Lopez', 'Jhoann Ross', 'Surgeon', 'Mathematician', 9785421852, 'Vaginal Delivery'),
(32, '2019-01-26 11:34:56', '2019-01-26 11:34:56', 'Lopez', 'Diaz', 'Sean', '2013-05-07', '12 Mills Villages Suite 512, Poblacion, Gingoog 2082 Agusan del Sur', 'Male', 'Matthew Lopez', 'Angela Diaz', 'Financial advisor', 'Lawyer', 9785421852, 'Vaginal Delivery'),
(33, '2019-01-26 11:36:45', '2019-01-26 11:36:45', 'Delos Santos', 'Cruz', 'Rafael', '2016-07-21', '59A/70 Okuneva Center, Poblacion, Bogo 6566 Lanao del Norte', 'Male', 'Ralph Delos Santos', 'Amy Cruz', 'Data processor', 'Song writer', 9785421785, 'Vaginal Delivery'),
(34, '2019-01-26 11:38:51', '2019-01-26 11:38:51', 'Magtanggol', 'Philipps', 'Victor', '2010-12-29', '53A Rath Flat, Poblacion, Bago 3205 Surigao del Norte', 'Male', 'Roger Magtanggol', 'Laura Philipps', 'Waiter', 'Choreographer', 9785421852, 'Natural Delivery'),
(35, '2019-01-26 11:40:50', '2019-01-26 15:38:41', 'Martin', 'Gonzales', 'Alice', '1998-04-08', '09/88 Wisozk Springs, Poblacion, Bacolod 6389 Batangas', 'Female', 'Carlo Martin', 'Maria Gonzales', 'Makeup artist', 'Art dealer', 9784512785, 'Vaginal Delivery'),
(36, '2019-01-26 11:43:13', '2019-01-26 11:43:13', 'Jean', 'Moon', 'Billy', '2016-01-14', '46/93 Schumm Wells, Sibuco 0249 Occidental Mindoro', 'Male', 'Jilly Jean', 'Mary Moon', 'Crematorium worker', 'Lawyer', NULL, 'Forceps Delivery'),
(37, '2019-01-26 11:45:25', '2019-01-26 11:45:25', 'Styles', 'Edward', 'Harry', '2012-01-31', 'Redditch, United Kingdom', 'Male', 'Billy Styles', 'Anne Twist', 'Astrologer', 'Publican', 9785421785, 'C-Section'),
(38, '2019-01-26 11:47:31', '2019-01-26 11:47:31', 'Tomlinson', 'William', 'Louis', '2018-01-17', 'Doncaster, United Kingdom', 'Male', 'Willy Tomlinson', 'Johannah Deakin', 'Private investigator', 'Miner', 9877520853, 'Vaginal Birth After Cesarian'),
(39, '2019-01-26 11:49:16', '2019-01-26 11:49:16', 'Horan', 'James', 'Niall', '2017-09-13', 'Mullingar, Republic of Ireland', 'Male', 'Bobby Horan', 'Maura Gallagher', 'Factory worker', 'Insurance consultant', 9785421078, 'Vacuum Extraction'),
(40, '2019-01-26 11:50:58', '2019-01-26 11:50:58', 'Malik', 'Javad', 'Zayn', '2014-07-17', 'Bradford, United Kingdom', 'Male', 'Yaser Malik', 'Trisha Javad', 'Travel agent', 'Driving instructor', 9875412785, 'Vacuum Extraction'),
(41, '2019-01-26 11:52:58', '2019-01-26 11:52:58', 'Payne', 'James', 'Liam', '2013-12-31', 'New Cross Hospital, Wolverhampton, United Kingdom', 'Male', 'Kevin James', 'Karen James', 'Insurance consultant', 'Librarian', 9875412785, 'Vacuum Extraction'),
(42, '2019-01-26 11:54:38', '2019-01-26 11:54:38', 'Hemmings', 'Robert', 'Luke', '2010-05-20', 'Sydney, Australia Height: 1.93 m', 'Male', 'Loren Hemmings', 'Liz Robert', 'Salesperson', 'Pest controller', 9785420852, 'C-Section'),
(43, '2019-01-26 11:56:21', '2019-01-26 11:56:21', 'Irwin', 'Fletcher', 'Ashton', '2013-07-19', 'Hornsby, Australia', 'Male', 'Brian Irwin', 'Anne Marie Fletcher', 'Window cleaner', 'Tailor', 9785420754, 'C-Section'),
(44, '2019-01-26 11:58:05', '2019-01-26 11:58:05', 'Hood', 'Thomas', 'Calumn', '2013-01-16', 'Sydney, Australia', 'Male', 'Johnny Hood', 'Joy Thomas', 'Legal secretary', 'Car wash attendant', 9785421653, 'Vacuum Extraction'),
(45, '2019-01-26 12:00:28', '2019-01-26 12:00:28', 'Clifford', 'Deezer', 'Michael', '2009-04-08', 'Sydney, Australia', 'Male', 'Daryl Clifford', 'Karen Deezer', 'Barrister', 'Barber', 9852875285, 'Vacuum Extraction'),
(46, '2019-01-26 12:03:08', '2019-01-26 12:03:08', 'Maraj', 'Tanya', 'Onika', '2013-09-19', 'Saint James, Trinidad and Tobago, Port of Spain, Trinidad and Tobago', 'Female', 'Frank Maraj', 'Carol Tanya', 'Clerical assistant', 'Dressmaker', 9785421852, 'Forceps Delivery'),
(47, '2019-01-26 12:04:57', '2019-01-26 12:04:57', 'Carter', 'Michael', 'Dwayne', '2015-06-17', 'New Orleans, Louisiana, United States', 'Male', 'Roy Carter', 'Jacida Michael', 'Choreographer', 'Management consultant', 9785412875, 'Forceps Delivery'),
(48, '2019-01-26 12:07:45', '2019-01-26 12:07:45', 'Almanzar', 'Marlenis', 'Belcalis', '2011-06-08', 'The Bronx, New York City, New York, United States', 'Female', 'Nicholas Almanzar', 'Elizabeth Marlenis', 'Teacher', 'Politician', 9785421875, 'Forceps Delivery'),
(49, '2019-01-26 12:09:50', '2019-01-26 12:09:50', 'Halos', 'Cacho', 'Neri Mae', '2012-07-14', 'Sta Lucia, Ilocos Sur', 'Female', 'Daniel Halos', 'Kathryn Cacho', 'Teacher', 'Butcher', 9875421785, 'C-Section'),
(50, '2019-01-26 12:11:08', '2019-01-26 12:11:08', 'Geraldez', 'Martin', 'Maureen', '2013-06-06', 'Engineers Hill, Baguio City', 'Female', 'Butch Geraldez', 'Noemi Geraldez', 'Housekeeper', 'Clockmaker', 9785285278, 'Vacuum Extraction'),
(51, '2019-01-26 15:41:59', '2019-01-26 15:41:59', 'Robinson', 'Valdez', 'Scott', '2014-06-11', '66A Heidenreich Corners Suite 284, Calaca 4103 Lanao del Sur', 'Male', 'Douglas Robinson', 'Kate Valdez', 'Window Cleaner', 'Locksmith', NULL, 'Vacuum Extraction'),
(52, '2019-01-26 15:43:59', '2019-01-26 15:43:59', 'Torres', 'Parker', 'Douglas', '2014-09-24', '59A/39 Hahn Course Apt. 482, Poblacion, Laoag 3903 Dinagat Islands', 'Male', 'Dags Torres', 'Dina Parker', 'Management consultant', 'Councillor', NULL, 'C-Section'),
(53, '2019-01-26 15:45:23', '2019-01-26 15:45:23', 'Salazar', 'Jackson', 'Terry', '2014-07-08', '12 Kerluke Locks Apt. 618, La Paz 4161 South Cotabato', 'Female', 'Jerry Salazar', 'Alona Jackson', 'Psychiatrist', 'Telesales person', 9784521784, 'Natural Delivery'),
(54, '2019-01-26 15:47:26', '2019-01-26 15:47:26', 'Bautista', 'Lopez', 'Jose', '2014-01-16', '12 Kerluke Locks Apt. 618, La Paz 4161 South Cotabato', 'Male', 'Adam Bautista', 'Jane Lopez', 'Tax inspector', 'Machinist', 9875427854, 'Natural Delivery'),
(55, '2019-01-26 15:48:43', '2019-01-26 15:48:43', 'Ramos', 'Hernandez', 'Joe', '2015-08-12', '13 Cormier Groves Suite 185, Poblacion, Cagayan de Oro 7080 Camarines Sur', 'Male', 'Lino Ramos', 'Louis Hernandez', 'Animal breeder', 'Animal breeder', 9784578452, 'Vaginal Birth After Cesarian'),
(56, '2019-01-26 15:49:53', '2019-01-26 15:49:53', 'Bautista', 'Sanders', 'Laura', '2013-05-08', '33A/73 Graham Alley, Poblacion, Sagay 5075 Leyte', 'Female', 'Greg Bautista', 'Janice Sanders', 'Researcher', 'Researcher', NULL, 'Vacuum Extraction'),
(57, '2019-01-26 15:51:20', '2019-01-26 15:51:20', 'Santos', 'Foster', 'Amy', '2013-05-08', '84A Schiller Summit, Poblacion, Borongan 0732 Albay', 'Female', 'Jerry Santos', 'Margaret Foster', 'Miner', 'Interior designer', NULL, 'Natural Delivery'),
(58, '2019-01-26 15:52:33', '2019-01-26 15:52:33', 'Santos', 'Garcia', 'Karen', '2016-06-10', '72A/99 Satterfield Prairie Suite 491, Kabasalan 7068 Camarines Norte', 'Female', 'Jeremy Santos', 'Jennifer Garcia', 'Fairground worker', 'Fairground worker', NULL, 'Vacuum Extraction'),
(59, '2019-01-26 15:55:23', '2019-01-26 15:55:23', 'David', 'Butler', 'Pamela', '2015-07-15', '63A Brown Knoll, Poblacion, San Pablo 4005 La Union', 'Female', 'Dennis David', 'Mary Butler', 'Reporter', 'Reporter', 9784512785, 'Vaginal Birth After Cesarian'),
(60, '2019-01-26 15:56:46', '2019-01-26 15:56:46', 'Cruz', 'Moris', 'Ann', '2017-09-20', '84A/13 Stanton Cape Apt. 174, Poblacion, Isabela 0892 Camiguin', 'Female', 'Martin Cruz', 'Pamela Moris', 'Reporter', 'Reporter', 9784578452, 'Forceps Delivery'),
(61, '2019-01-26 15:57:57', '2019-01-26 15:57:57', 'Vegas', 'White', 'Carolyn', '2019-01-15', '42A/94 Stehr Islands, Poblacion, Kidapawan 8357 Misamis Occidental', 'Female', 'Allan Vegas', 'Anne White', 'Police officer', 'Carpenter', NULL, 'Vacuum Extraction'),
(62, '2019-01-26 15:59:55', '2019-01-26 15:59:55', 'Ocampo', 'Garcia', 'Bruce', '2015-07-15', '15A/00 Towne Fields, Poblacion, Calbayog 8591 Surigao del Sur', 'Male', 'Paulo Ocampo', 'Pauleen Garcia', 'Police officer', 'Police officer', 9784527852, 'Natural Delivery'),
(63, '2019-01-26 16:01:12', '2019-01-26 16:01:12', 'Ocampo', 'Turner', 'Ronald', '2016-08-17', '48A Cole Cliffs Apt. 810, Compostela 2410 Cavite', 'Male', 'James Ocampo', 'Rebecca Turner', 'Street entertainer', 'Street entertainer', NULL, 'Forceps Delivery'),
(64, '2019-01-26 16:02:26', '2019-01-26 16:02:26', 'Garcia', 'James', 'Rebecca', '2019-01-16', '54A Stamm Walks, Poblacion, Ozamiz 0845 Siquijor', 'Female', 'Joseph Garcia', 'Lauren James', 'Typist', 'Pharmacist', NULL, 'C-Section'),
(65, '2019-01-26 16:03:36', '2019-01-26 16:03:36', 'Garcia', 'Lopez', 'Donald', '2018-07-18', '46 Bailey Skyway Suite 511, Marcos 6675 Masbate', 'Male', 'Dante Garcia', 'Denise Lopez', 'Pharmacist', 'Pharmacist', 9785278542, 'Vaginal Delivery'),
(66, '2019-01-26 16:04:49', '2019-01-26 16:04:49', 'Martinez', 'Martin', 'Benjamin', '2016-05-10', '54A Stamm Walks, Poblacion, Ozamiz 0845 Siquijor', 'Male', 'Ryan Martinez', 'Amy Martin', 'Song writer', 'Song writer', NULL, 'Vaginal Delivery'),
(67, '2019-01-26 16:06:11', '2019-01-26 16:06:11', 'Domingo', 'White', 'Virginia', '2009-06-17', '00A/16 Shields Canyon, Poblacion, Isabela 5349 Batanes', 'Female', 'David Domingo', 'Donna White', 'Actor', 'Actor', 9784527854, 'Natural Delivery'),
(68, '2019-01-26 16:09:04', '2019-01-26 16:09:04', 'Martinez', 'Martin', 'Benjie', '2015-08-13', '55/95 Jakubowski Via, Sampaloc 2072 Compostela Valley', 'Male', 'Ryan Martinez', 'Ryza Martin', 'Baggage handler', 'Baggage handler', 9784512875, 'Natural Delivery'),
(69, '2019-01-26 16:10:32', '2019-01-26 16:10:32', 'Bautista', 'Rogers', 'Emily', '2012-07-17', '27/31 Mitchell Point Suite 890, Poblacion, Surigao City 2752 Negros Oriental', 'Female', 'Alexander Bautista', 'Anne Rogers', 'Engineer', 'Engineer', NULL, 'Natural Delivery'),
(70, '2019-01-26 16:12:08', '2019-01-26 16:12:08', 'Santos', 'Henderson', 'Bobby', '2018-08-15', '27A Kessler Valley, Asipulo 0279 Isabela', 'Male', 'Philip', 'Catherine Henderson', 'Engineer', 'Architect', 9784527854, 'Vaginal Birth After Cesarian'),
(71, '2019-01-26 16:13:25', '2019-01-26 16:13:25', 'Lopez', 'Simon', 'Betty', '2014-06-10', '36A Hand Mountain Apt. 831, Trece Martires City 6373 Dinagat Islands', 'Female', 'Ben Lopez', 'Betina Simon', 'Dentist', 'Dentist', NULL, 'Vacuum Extraction'),
(72, '2019-01-26 16:14:44', '2019-01-26 16:14:44', 'Lopez', 'Garcia', 'Renz', '2012-07-13', '02A Weber Inlet, Jomalig 2791 Davao del Norte', 'Male', 'William Lopez', 'Carla Garcia', 'Business owner', 'Business owner', 9485784525, 'Natural Delivery'),
(73, '2019-01-26 16:16:00', '2019-01-26 16:16:00', 'Santiagio', 'Barnes', 'Andrea', '2018-01-29', '91 Cassin Divide Suite 218, Poblacion, Urdaneta 0591 Aurora', 'Female', 'Ryan Santiago', 'Jane Barnes', 'Firefighter', 'Firefighter', NULL, 'Vacuum Extraction'),
(74, '2019-01-26 16:17:16', '2019-01-26 16:17:16', 'Cabalse', 'Baker', 'Roy', '2014-09-16', '91 Cassin Divide Suite 218, Poblacion, Urdaneta 0591 Aurora', 'Male', 'Bryan Cabalse', 'Brenda Baker', 'Community worker', 'Community worker', 9874527852, 'C-Section'),
(75, '2019-01-26 16:18:41', '2019-01-26 16:18:41', 'Sandoval', 'Cabiles', 'Kathleen', '2009-09-17', '82A/51 Romaguera Skyway, Biliran 8051 Pangasinan', 'Female', 'Albert Sandoval', 'Ellen Cabiles', 'Nurse', 'Doctor', 9874512785, 'Vacuum Extraction'),
(76, '2019-01-26 16:20:05', '2019-01-26 16:20:05', 'Mendoza', 'Sanchez', 'Anna', '2009-08-12', '06/90 Hirthe Circles, President Manuel A. Roxas 4946 Kalinga', 'Female', 'Rolly Mendoza', 'Rachel Sanchez', 'Editor', 'Editor', 9784512785, 'C-Section'),
(77, '2019-01-26 16:21:26', '2019-01-26 16:21:26', 'Perez', 'Alejo', 'Katy', '2008-09-24', '01/15 Ward Fork Apt. 345, Poblacion, Ligao 8739 Romblon', 'Female', 'Karlos Perez', 'Kathleen Alejo', 'Paramedic', 'Paramedic', 9784527854, 'Vacuum Extraction'),
(78, '2019-01-26 16:22:41', '2019-01-26 16:22:41', 'Walker', 'Russel', 'Jean', '2011-03-10', '96A Nienow Tunnel, Poblacion, Pagadian 4710 Compostela Valley', 'Female', 'Larry Walker', 'Louisa Russel', 'Electrician', 'Electrician', NULL, 'Natural Delivery'),
(79, '2019-01-26 12:06:45', '2019-01-26 12:06:45', 'Kim', 'Seok', 'Jin', '2011-12-05', '4904 Broadway Street, Myrtle Beach, South Carolina', 'Male', 'Yujin Kim', 'Sooji Seok', 'Judge', 'Coastguard', 9456321035, 'Forceps Delivery'),
(80, '2019-01-26 12:08:55', '2019-01-26 12:08:55', 'Brians', 'Mercado', 'Monica', '2010-07-07', '4837 Lilac Lane, Pearson, Georgia', 'Female', 'Don Cloy Brians', 'Denisse Mercado', 'Hairdresser', 'Broadcaster', 9456321065, 'Natural Delivery'),
(81, '2019-01-26 13:48:57', '2019-01-26 14:51:49', 'Moore', 'Lewis', 'Robert', '1998-07-12', '62/52 Johnston Vista Apt. 852, Teresa 0947 Agusan del Sur', 'Male', 'Ralph Moore', 'Donna Lewis', 'Computer analyst', 'Computer analyst', 9785427854, 'Vaginal Delivery'),
(82, '2019-01-26 13:50:30', '2019-01-26 14:51:49', 'Lewis', 'Cooper', 'Benjamin', '1998-07-12', '04/34 Gislason Point, Poblacion, Batangas City', 'Male', 'Todd Lewis', 'Rachel Cooper', 'Sports coach', 'Sports coach', 9874512085, 'Vaginal Delivery'),
(83, '2019-01-26 13:52:05', '2019-01-26 14:51:49', 'Miller', 'Todd', 'Andrea', '1998-07-12', '92 Sanford Cliffs Suite 832, Batad 0171 Sorsogon', 'Female', 'Jack Miller', 'Sharon Todd', 'Secretary', 'Cook', 9785485542, 'Vaginal Delivery'),
(84, '2019-01-26 13:53:32', '2019-01-26 14:51:49', 'Anderson', 'Griffin', 'Mark', '1998-07-12', '85A/40 VonRueden Corners, Manukan 8889 Benguet', 'Male', 'Harold Anderson', 'Marie Griffin', 'Chimney sweep', 'Economist', 9784517854, 'Vaginal Delivery'),
(85, '2019-01-26 13:54:49', '2019-01-26 14:51:49', 'Rivera', 'Smith', 'Anne', '1998-07-12', '12A/13 Borer Trace, Kawit 3394 Zamboanga Sibugay', 'Female', 'Harold Rivera', 'Helen Smith', 'Cashier', 'Cashier', 9785412785, 'Vaginal Delivery'),
(86, '2019-01-26 13:57:28', '2019-01-26 14:51:49', 'Dela Cruz', 'Robinson', 'Kenneth', '1998-07-12', '75A/18 Schaefer Lake Suite 122, Poblacion, Calbayog 0048 Negros Oriental', 'Male', 'James Dela Cruz', 'Kate Robinson', 'Herbalist', 'Landowner', 9785412752, 'Vaginal Delivery'),
(87, '2019-01-26 14:10:30', '2019-01-26 14:51:49', 'Swift', 'Alison', 'Taylor', '1998-07-12', '2196  Barrington Court, Manila', 'Female', 'Lorenzo Swift', 'Nicole Alison', 'Tour guide', 'Labourer', NULL, 'Vaginal Delivery'),
(88, '2019-01-26 14:13:09', '2019-01-26 14:51:49', 'Reyes', 'Gray', 'Patricia', '1998-07-12', '48A Williamson Creek, Poblacion, Tacurong 9686 La Union', 'Female', 'James Reyes', 'Lori Gray', 'Traffic warden', 'Priest', NULL, 'Vaginal Delivery'),
(89, '2019-01-26 14:15:00', '2019-01-26 14:51:49', 'Santos', 'Rogers', 'Jaqueline', '1998-07-12', '43 Olson Skyway, Poblacion, Navotas 1101 Pampanga', 'Female', 'Jack Santos', 'Jacky Rogers', 'Receptionist', 'Street entertainer', NULL, 'Vaginal Delivery'),
(90, '2019-01-26 14:17:30', '2019-01-26 14:51:49', 'Ramos', 'Mendoza', 'Oliver', '1998-07-12', '54A/06 Swift Junctions, Poblacion, Pasig 2343 Lanao del Sur', 'Male', 'Rivera Ramos', 'Lorena Mendoza', 'Occupational therapist', 'Private investigator', 9784512865, 'Vaginal Delivery'),
(91, '2019-01-26 14:19:32', '2019-01-26 14:51:49', 'Bautista', 'Kelly', 'Ruby', '1998-07-12', '59/78 Deckow Street, Poblacion, Tuguegarao 6499 Laguna', 'Female', 'Romano Bautista', 'Ramona Kelly', 'Librarian', 'Home worker', 9515326565, 'Vaginal Delivery'),
(92, '2019-01-26 14:21:25', '2019-01-26 14:51:49', 'Garcia', 'Solomon', 'Victor', '1998-07-12', '34A Ferry Lights, Poblacion, Butuan 3168 Metro Manila', 'Male', 'Andre Garcia', 'Victoria Solomon', 'Gas fitter', 'Tax inspector', 9452654132, 'Vaginal Delivery'),
(93, '2019-01-26 14:22:56', '2019-01-26 14:51:49', 'Ocampo', 'Philip', 'Cathy', '1998-07-12', '28A/05 Gislason Bypass, Lagonglong 2479 Nueva Ecija', 'Female', 'Charles Ocampo', 'Catherine Philip', 'Factory worker', 'Literary agent', 9784520754, 'Vaginal Delivery'),
(94, '2019-01-26 14:24:33', '2019-01-26 14:51:49', 'Torres', 'Mendoza', 'Julia', '1998-07-12', '32/01 Stroman Fork Suite 101, Poblacion, Dipolog 9308 Cavite', 'Female', 'Julio Torres', 'Julie Mendoza', 'Carpet fitter', 'Crane driver', 9745127854, 'Vaginal Delivery'),
(95, '2019-01-26 14:26:01', '2019-01-26 14:51:49', 'Ballesteros', 'Bailey', 'Jerry', '1998-07-12', '32/01 Stroman Fork Suite 101, Poblacion, Dipolog 9308 Cavite', 'Male', 'Jack Ballesteros', 'Kathy Bailey', 'Private investigator', 'Pop star', 9874512785, 'Vaginal Delivery'),
(96, '2019-01-26 14:27:35', '2019-01-26 14:51:49', 'Flores', 'Hector', 'Marie', '1998-07-12', '89/13 Gorczany Mall, Poblacion, Puerto Princesa 6876 Aurora', 'Female', 'Mario Flores', 'Rose Hector', 'Assembly line worker', 'Tax inspector', NULL, 'Vaginal Delivery'),
(97, '2019-01-26 14:28:54', '2019-01-26 14:51:49', 'Tomas', 'Jenkins', 'Deborah', '1998-07-12', '34A Ferry Lights, Poblacion, Butuan 3168 Metro Manila', 'Female', 'Devone Tomas', 'Debby Jenkins', 'Animal breeder', 'Cashier', 9784512785, 'Vaginal Delivery'),
(98, '2019-01-26 14:30:44', '2019-01-26 14:51:49', 'Trump', 'Mack', 'Donald', '1998-07-12', '91 Stark Dam Suite 785, Poblacion, Cabadbaran 2978 Nueva Ecija', 'Male', 'Gerald Trump', 'Helen Mack', 'Anthropologist', 'Sports coach', 9875421785, 'Vaginal Delivery'),
(99, '2019-01-26 14:32:03', '2019-01-26 14:51:49', 'Santos', 'Thompson', 'Paula', '1998-07-12', '95 Dickens Trafficway, Poblacion, Dumaguete 6640 Compostela Valley', 'Female', 'Paulo Santos', 'Stephanie Thompson', 'Fitness instructor', 'Canteen assistant', 9785421784, 'Vaginal Delivery'),
(100, '2019-01-26 14:33:12', '2019-01-26 14:51:49', 'Joo', 'Bok', 'Kim', '1998-07-12', '49A Kohler Way Suite 362, Pikit 3973 Misamis Oriental', 'Female', 'Johnny Joo', 'Kimberly Bok', 'Street entertainer', 'Jewellery maker', 9784578547, 'Vaginal Delivery'),
(101, '2019-01-29 03:09:15', '2019-01-29 03:09:15', 'Dacanay', 'Flores', 'Roger', '2014-01-07', '24 San Pablo Street Kapitolyo 1600 Pasig City', 'Male', 'Jack Dacanay', 'Marilyn Flores', 'Antique dealer', 'Publisher', 9785421852, 'C-Section'),
(102, '2019-01-29 03:11:24', '2019-01-29 03:11:24', 'Dacua', 'Johnson', 'Marilyn', '2009-07-14', '3/F Lydia Building39 Polaris Street Bel-Air 1200 Makati City', 'Female', 'Peter Dacua', 'Gloria Johnson', 'Herbalist', 'Herbalist', 9785287528, 'Forceps Delivery'),
(103, '2019-01-29 03:13:04', '2019-01-29 03:13:04', 'Dagohoy', 'Harris', 'Peter', '2018-02-05', '903 Paragon Plaza, Edsa cor., Mandaluyong City', 'Male', 'Johnny Dagohoy', 'Janet Harris', 'Interpreter', 'Interpreter', 9785421785, 'C-Section'),
(104, '2019-01-29 03:14:59', '2019-01-29 03:14:59', 'Dalisay', 'Diaz', 'Larry', '2005-08-23', '24A/04 Luettgen Inlet Apt. 274, Poblacion, Antipolo 4813 Agusan del Sur', 'Male', 'Stephen Dalisay', 'Jean Diaz', 'Childcare worker', 'Childcare worker', 9785478547, 'Forceps Delivery'),
(105, '2019-01-29 03:17:14', '2019-01-29 03:17:14', 'Batumbakal', 'Narda', 'Annie', '2010-09-22', '93A Lindgren Mount, Cabanatuan City', 'Female', 'Anthony Batumbakal', 'Patricia Narda', 'Dentist', 'Dentist', 9785428528, 'Forceps Delivery'),
(106, '2019-01-29 03:19:39', '2019-01-29 03:19:39', 'De Castro', 'Jenkins', 'Kathryn', '2010-09-22', '23 Orn Inlet, Poblacion, Dipolog', 'Female', 'Douglas De Castro', 'Allysa Jenkins', 'Brewer', 'Brewer', NULL, 'Vacuum Extraction'),
(107, '2019-01-29 03:21:22', '2019-01-29 03:21:22', 'Diaz', 'Castro', 'Irene', '2013-06-05', '08A/68 Russel Parkways, Odiongan 7902 Benguet', 'Female', 'Ralph Diaz', 'Donna Castro', 'Designer', 'Travel agent', 9785278542, 'Vaginal Delivery'),
(108, '2019-01-29 03:22:59', '2019-01-29 03:22:59', 'Fontanilla', 'Stewart', 'Shirley', '2013-03-05', '20/00 Bruen Ports Apt. 529, Lupao 4017 Surigao del Sur', 'Female', 'Craig Fontanilla', 'Angela Stewart', 'Machinist', 'Machinist', NULL, 'C-Section'),
(109, '2019-01-29 03:24:30', '2019-01-29 03:24:30', 'Flores', 'Brooks', 'Julia', '2009-10-14', '80 Mertz Grove Apt. 169, Noveleta 3537 Camiguin', 'Female', 'Patrick Flores', 'Alice Brooks', 'Beauty therapist', 'Chiropractor', NULL, 'Vaginal Delivery'),
(110, '2019-01-29 03:26:21', '2019-01-29 03:26:21', 'Gonzaga', 'Murphy', 'Zedd', '2016-11-30', '90A Hammes Radial, Poblacion, Vigan 5602 Albay', 'Male', 'Vic Gonzaga', 'Carolym Murphy', 'Scientist', 'Museum Curator', 9784578547, 'Natural Delivery'),
(111, '2019-01-29 03:28:27', '2019-01-29 03:28:27', 'Flores', 'Quing', 'Jonathan', '2013-05-02', '21 Kshlerin Square Apt. 881, Poblacion, Cebu City 4631 Siquijor', 'Male', 'Lorenz Flores', 'Brenda Quing', 'Sportsperson', 'Camera operator', NULL, 'Vaginal Delivery'),
(112, '2019-01-29 03:31:03', '2019-01-29 03:31:03', 'Gomez', 'Cox', 'Tedd', '2014-09-17', '02 Kiehn Isle, Dolores 0160 Palawan', 'Male', 'Jonah Gomez', 'Cora Cox', 'Meteorologist', 'Gardener', 9784527852, 'Forceps Delivery'),
(113, '2019-01-29 03:33:49', '2019-01-29 03:33:49', 'Halili', 'Clarkson', 'Kelly', '2016-09-22', '55/97 Wilkinson Fall, Poblacion, Santa Rosa 5885 Ilocos Norte', 'Female', 'Craig Halili', 'Cora Clarkson', 'Assembly line worker', 'Electrician', 9785478542, 'Vacuum Extraction'),
(114, '2019-01-29 03:35:27', '2019-01-29 03:35:27', 'Binay', 'Washington', 'Nancy', '2017-04-05', '78 Lakin Alley, Poblacion, Roxas 8116 Pangasinan', 'Female', 'Jejomar Binay', 'Jane Washington', 'Marketing director', 'Butcher', 9785278528, 'Natural Delivery'),
(115, '2019-01-29 03:37:45', '2019-01-29 03:37:45', 'Ibarra', 'Young', 'Jane', '2010-10-21', '21 Eichmann Union, Orion 8449 Bulacan', 'Female', 'Jerry Ibarra', 'Jenny Young', 'Labourer', 'Astrologer', 9785278528, 'Forceps Delivery'),
(116, '2019-01-29 03:40:54', '2019-01-29 03:40:54', 'Langit', 'Thompson', 'Julie', '2014-06-11', '84A Kunde Circles Suite 591, Libungan 8585 Antique', 'Female', 'Charles Langit', 'Janet Thompson', 'Auditor', 'Factory worker', NULL, 'Vaginal Birth After Cesarian'),
(117, '2019-01-29 03:44:33', '2019-01-29 03:44:33', 'Kalaw', 'Russel', 'Phyllis', '2013-09-25', '77/22 Lakin Divide Suite 245, San Luis 6790 Ilocos Sur', 'Male', 'Jason Kalaw', 'Martha Russel', 'Pawnbroker', 'Broadcaster', NULL, 'Vacuum Extraction'),
(118, '2019-01-29 03:46:25', '2019-01-29 03:46:25', 'Legaspi', 'Baker', 'Martha', '2016-09-21', '16/06 Sanford Plain Suite 071, Mabini 0468 Southern Leyte', 'Female', 'Jason Legaspi', 'Hannah Baker', 'Auditor', 'Roofer', 9745278542, 'Forceps Delivery'),
(119, '2019-01-29 03:48:04', '2019-01-29 03:48:04', 'Liwanag', 'Thompson', 'Margaret', '2017-12-21', '11/35 Abshire Burgs, Poblacion, Lipa 0812 Antique', 'Female', 'Margo Liwanag', 'Marga Thompson', 'Television presenter', 'Careers advisor', 9784512785, 'C-Section'),
(120, '2019-01-29 03:49:44', '2019-01-29 03:49:44', 'Maghanoy', 'Lopez', 'Ernesto', '2017-06-14', '94/41 Kirlin Crescent, Alfonso 6794 Bulacan', 'Male', 'Joe Maghanoy', 'Laura Lopez', 'Magician', 'Marketing director', NULL, 'C-Section'),
(121, '2019-01-29 03:56:21', '2019-01-29 03:56:21', 'Castillo', 'Miguel', 'Aaron', '2012-06-12', 'San Fernando, La Union, Philippines', 'Male', 'Jojo Castillo', 'Catherine Miguel', 'OFW', 'Driver', 9456318532, 'C-Section'),
(122, '2019-01-29 03:57:51', '2019-01-29 03:57:51', 'Castillo', 'Miguel', 'Tristan', '2018-08-21', 'San Fernando, La Union, Philippines', 'Male', 'Jojo Castillo', 'Catherine Miguel', 'OFW', 'Driver', 9456321068, 'Natural Delivery'),
(123, '2019-01-29 03:59:55', '2019-01-29 03:59:55', 'Castillo', 'Miguel', 'Tristan', '2013-01-07', 'San Juan, La Union, Philippines', 'Female', 'Christian Castillo', 'Amelaine Miguel', 'Teacher', 'Technician', 9456326412, 'Vaginal Delivery'),
(124, '2019-01-29 04:05:38', '2019-01-29 04:05:38', 'White', 'Phifer', 'Rosa', '2011-06-15', '520  New Street, Atlanta, Georgia', 'Female', 'Will White', 'Violet Phifer', 'Fitness instructor', 'Aircraft engineer', 9845612348, 'C-Section'),
(125, '2019-01-29 04:10:42', '2019-01-29 04:10:42', 'Peterson', 'Will', 'Alivia', '2010-12-30', '75A/39 Zemlak Station, Poblacion, Iloilo City', 'Female', 'Howard Harris', 'Catherine Peterson', 'Local govt worker', 'Lighthouse keeper', 7849561248, 'Forceps Delivery'),
(126, '2019-01-29 04:14:14', '2019-01-29 04:14:14', 'Jimenez', 'Anderson', 'Denisse', '2012-01-11', '92/32 Durgan Track, Poblacion, Dumaguete', 'Male', 'Paul Jimenez', 'Janey Anderson', 'Author', 'Dressmaker', 9894651248, 'Vaginal Birth After Cesarian'),
(127, '2019-01-29 04:17:15', '2019-01-29 04:17:15', 'Steve', 'Mendoza', 'Christine', '2012-07-16', '86A/42 Krajcik Tunnel Suite 765, Poblacion', 'Female', 'Thomas Steve', 'Catherine Mendoza', 'Farmer', 'Careers advisor', 9854128496, 'Vacuum Extraction'),
(128, '2019-01-29 04:19:27', '2019-01-29 04:19:27', 'White', 'Briana', 'Steve', '2012-09-26', '31A McKenzie Plain, Poblacion, Marikina', 'Male', 'Steven White', 'Belle Briana', 'Croupier', 'Tarot Reader', 9749865189, 'Forceps Delivery'),
(129, '2019-01-29 04:21:37', '2019-01-29 04:21:37', 'Daniels', 'Roberts', 'Charles', '2012-10-16', '94 Larson Islands, Poblacion, Calapa', 'Male', 'Robert Daniels', 'Daniela Roberts', 'Aromatherapist', 'Composer', 9784512894, 'Vaginal Delivery'),
(130, '2019-01-29 04:23:43', '2019-01-29 04:23:43', 'Gonzales', 'Victor', 'Keith', '2012-05-08', '17A/44 Bartell Crescent Apt. 189, San Jose', 'Female', 'Ryan Gonzales', 'Aniza Victor', 'Building labourer', 'Conservationist', 9789645132, 'Vacuum Extraction'),
(131, '2019-01-29 04:25:39', '2019-01-29 04:25:39', 'Bill', 'Porter', 'Arnold', '2013-01-03', '66A/82 Predovic Meadows Apt. 564, Poblacion, San Juan', 'Male', 'Ronald Bill', 'Detha Porter', 'Comedian', 'Computer engineer', 9789465123, 'Vacuum Extraction'),
(132, '2019-01-29 04:27:27', '2019-01-29 04:27:27', 'Manzano', 'Gallardo', 'Alyanna Dyan', '2011-01-12', '123 San Antonio, Cando City, Ilocos Sur', 'Female', 'Alejandro Manzano', 'Doris Gallardo', 'Local Government Worker', 'Police Officer', 9798465123, 'Vaginal Birth After Cesarian'),
(133, '2019-01-29 04:28:51', '2019-01-29 04:28:51', 'Valdez', 'Elizarde', 'Vonica Andrea', '2015-12-01', '85A Sanford Valleys, Poblacion, Davao City', 'Female', 'Edy Valdez', 'Nenita Elizarde', 'Retired Accountant', 'Bank Teller', 9789465123, 'Vaginal Birth After Cesarian'),
(134, '2019-01-29 04:30:26', '2019-01-29 04:30:26', 'Pagaduan', 'Jimenez', 'Kristian', '2011-07-14', '41A McGlynn Divide, Rosario', 'Male', 'Kristian Pagaduan', 'Karla Jimenez', 'Pop star', 'Physiotherapist', 9978645317, 'Forceps Delivery'),
(135, '2019-01-29 04:32:56', '2019-01-29 04:32:56', 'Miguel', 'Castillo', 'Grace', '2010-12-29', '11A Lind Islands Suite 953, Poblacion, Valenzuela', 'Female', 'Cleve Miguel', 'Teresita Castillo', 'Teacher', 'Soldier', 9987465132, 'Forceps Delivery'),
(136, '2019-01-29 04:34:34', '2019-01-29 04:34:34', 'Valdez', 'Villanueva', 'Hugo Evelio', '2016-08-24', '29/96 Muller Villages Apt. 855, San Juan', 'Male', 'Celestino Valdez', 'Telesfora Villanueva', 'Fashionista', 'Councilor', 9784965138, 'Natural Delivery'),
(137, '2019-01-29 04:39:40', '2019-01-29 04:39:40', 'Cleve', 'Coles', 'Jude', '2013-10-16', '20 Cassin Glen Suite 809, Poblacion, Trece Martires', 'Male', 'Basil Cleve', 'Cloey Coles', 'Picture framer', 'Cleric', 9784651237, 'Natural Delivery'),
(138, '2019-01-29 04:41:59', '2019-01-29 04:41:59', 'Steven', 'Hayes', 'Joy', '2012-01-07', '25A Satterfield Trace Suite 586, Ivana', 'Female', 'Stevens Steven', 'Joy Hayes', 'Moneylender', 'Park ranger', 9846513279, 'Natural Delivery'),
(139, '2019-01-29 04:43:51', '2019-01-29 04:43:51', 'Simpson', 'Brendon', 'Angie', '2013-01-03', '93 Morar Well Apt. 225, Poblacion, Victorias', 'Female', 'Angelo Simpson', 'Gennie Brendon', 'Dancer', 'Gardener', 9789645132, 'C-Section'),
(140, '2019-01-29 04:45:21', '2019-01-29 04:45:21', 'Gonzaga', 'Gaceta', 'Angelo', '2016-03-09', '53/44 McDermott Prairie, Caluya', 'Male', 'Brandon Gonzaga', 'Gladys Gaceta', 'Clockmaker', 'Heating engineer', 9798465132, 'Vacuum Extraction'),
(141, '2019-01-29 04:47:17', '2019-01-29 04:47:17', 'Reed', 'Perry', 'Angela', '2010-12-30', '21 Pollich Island Apt. 076, Poblacion', 'Female', 'Angelo Reed', 'Andrea Perry', 'Journalist', 'Lock keeper', 9798465127, 'Forceps Delivery'),
(142, '2019-01-29 04:48:53', '2019-01-29 04:48:53', 'Matt', 'Evans', 'Roberto', '2013-01-09', '41A Bartell Centers Apt. 175, Conner', 'Male', 'William Matt', 'Laura Evans', 'Shop assistant', 'Funeral director', 9789465132, 'Vaginal Delivery');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
