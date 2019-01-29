-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2019 at 09:03 AM
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
(1, 'BCG', 1, 'Bacillus Calmette–Guérin vaccine is a vaccine primarily used against tuberculosis.', '2019-01-26 16:24:05', '2019-01-26 16:24:05'),
(2, 'Hepatitis B', 5, 'Hepatitis B vaccine is a vaccine that prevents hepatitis B. The first dose is recommended within 24 hours of birth with either two or three more doses given after that.', '2019-01-26 16:32:49', '2019-01-26 16:32:49'),
(3, 'DTwP - Hib - Hep B and other DTaP combinations', 6, 'Diphtheria, Tetanus, Pertussis, Hepatitis B and Haemophilus influenzae type b conjugate vaccine (adsorbed), Abbreviation: DTwP-HepB-Hib (all-in-one), or DTwP-HepB+Hib (with separate freeze-dr', '2019-01-26 16:41:11', '2019-01-26 16:41:11'),
(4, 'IPV/OPV', 5, 'Inactivated polio vaccine (IPV) is the only polio vaccine that has been given in the United States since 2000. It is given by shot in the arm or leg, depending on the person\'s age. Oral polio', '2019-01-26 16:46:09', '2019-01-26 16:46:09'),
(5, 'PCV', 4, 'Pneumococcal conjugate vaccine is a pneumococcal vaccine and a conjugate vaccine used to protect infants, young children, and adults against disease caused by the bacterium Streptococcus pneu', '2019-01-26 16:49:30', '2019-01-26 16:49:30'),
(6, 'RV', 3, 'Rotavirus vaccine is a vaccine used to protect against rotavirus infections, which are the leading cause of severe diarrhea among young children. The vaccines prevent 15–34% of severe diarrhe', '2019-01-26 16:52:55', '2019-01-26 16:52:55'),
(7, 'Influenza', 10, 'Influenza vaccines, also known as flu shots or flu jabs, are vaccines that protect against infection by influenza viruses. A new version of the vaccine is developed twice a year, as the influ', '2019-01-26 16:56:54', '2019-01-26 16:56:54'),
(8, 'Measles', 1, 'Measles vaccine is a vaccine that prevents measles. After one dose at the age of nine months 85% are immune, while a dose at twelve months results in 95% immunity to measles.', '2019-01-26 17:01:44', '2019-01-26 17:01:44'),
(9, 'JE Vaccine', 2, 'Japanese encephalitis vaccine is a vaccine that protects against Japanese encephalitis. The vaccines are more than 90% effective. The duration of protection with the vaccine is not clear but', '2019-01-26 17:03:40', '2019-01-26 17:05:01'),
(10, 'MMR', 2, 'The MMR vaccine is a vaccine against measles, mumps, and rubella. The first dose is generally given to children around 9 to 15 months of age, with a second dose at 15 months to 6 years of age', '2019-01-26 17:05:29', '2019-01-26 17:05:29'),
(11, 'Varicella', 2, 'Varicella vaccine, also known as chickenpox vaccine, is a vaccine that protects against chickenpox. One dose of vaccine prevents 95% of moderate disease and 100% of severe disease. Two doses ', '2019-01-26 17:08:02', '2019-01-26 17:08:02'),
(12, 'Hepatitis A', 2, 'Hepatitis A vaccine is a vaccine that prevents hepatitis A. It is effective in around 95% of cases and lasts for at least fifteen years and possibly a person\'s entire life. If given, two dose', '2019-01-26 17:10:09', '2019-01-26 17:10:09'),
(13, 'HPV', 3, 'Human papilloma virus vaccines are vaccines that prevent infection by certain types of human papillomavirus. Available vaccines protect against either two, four, or nine types of HPV. All vac', '2019-01-26 17:13:26', '2019-01-26 17:13:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
