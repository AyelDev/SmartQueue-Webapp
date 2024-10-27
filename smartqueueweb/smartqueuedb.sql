-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.2:3307
-- Generation Time: Oct 27, 2024 at 01:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartqueuedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstokens`
--

CREATE TABLE `accesstokens` (
  `token_id` int(11) NOT NULL,
  `role` varchar(10) NOT NULL,
  `value` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_expired` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_queue_entries`
--

CREATE TABLE `student_queue_entries` (
  `id` int(11) NOT NULL,
  `queue_number` varchar(11) NOT NULL,
  `id_number` bigint(30) NOT NULL DEFAULT 0,
  `fullname` varchar(200) NOT NULL,
  `purpose` varchar(20) NOT NULL,
  `servicetype` varchar(20) NOT NULL,
  `window_number` tinyint(4) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `queue_status` varchar(20) NOT NULL DEFAULT 'QUEUE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_admin`
--

CREATE TABLE `tbl_login_admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login_admin`
--

INSERT INTO `tbl_login_admin` (`admin_id`, `username`, `password`) VALUES
(1, 'cecadmin', 'cecadminpass');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_staff`
--

CREATE TABLE `tbl_login_staff` (
  `staff_id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `contact_number` bigint(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isLocked` tinyint(1) NOT NULL DEFAULT 0,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_queue_status`
--

CREATE TABLE `tbl_queue_status` (
  `queue_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_queue_status`
--

INSERT INTO `tbl_queue_status` (`queue_status`) VALUES
('DONE'),
('QUEUE'),
('SERVING');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL,
  `program` varchar(50) DEFAULT NULL,
  `purpose` varchar(220) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `servicetype` varchar(50) NOT NULL DEFAULT 'GENERAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `program`, `purpose`, `amount`, `servicetype`) VALUES
(1, 'BSIT', NULL, 0, 'GENERAL'),
(6, 'BEED', NULL, 0, 'GENERAL'),
(7, 'BSED', NULL, 0, 'GENERAL'),
(8, 'BSTM', NULL, 0, 'GENERAL'),
(9, 'BSHM', NULL, 0, 'GENERAL'),
(10, NULL, 'certification', 150, 'RECORDS'),
(11, NULL, 'good moral', 150, 'RECORDS'),
(12, NULL, 'form 137', 150, 'RECORDS'),
(13, NULL, 'transcript or records (TOR)', 600, 'RECORDS'),
(14, NULL, 'diploma', 600, 'RECORDS'),
(15, NULL, 'grade evaluation', 150, 'RECORDS'),
(16, NULL, 'gwa', 200, 'RECORDS'),
(17, NULL, 'application of honors', 150, 'RECORDS'),
(18, NULL, 'enrollment', 0, 'ARCHIVING'),
(19, NULL, 'assessment', 0, 'ARCHIVING'),
(20, NULL, 'enrollment', 0, 'GENERAL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicetype`
--

CREATE TABLE `tbl_servicetype` (
  `servicetype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_servicetype`
--

INSERT INTO `tbl_servicetype` (`servicetype`) VALUES
('ARCHIVING'),
('GENERAL'),
('RECORDS');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_request_password`
--

CREATE TABLE `tbl_staff_request_password` (
  `request_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(220) NOT NULL,
  `date_requested` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_windowhandlers`
--

CREATE TABLE `tbl_staff_windowhandlers` (
  `staff_id` int(100) NOT NULL,
  `queue_number` int(11) NOT NULL,
  `window_number` tinyint(4) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'OFFLINE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_info`
--

CREATE TABLE `tbl_student_info` (
  `id_number` bigint(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `course` varchar(10) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student_info`
--

INSERT INTO `tbl_student_info` (`id_number`, `first_name`, `middle_name`, `last_name`, `course`, `isDeleted`) VALUES
(2110010, 'cindy mae', '', 'labra', 'BSIT', 0),
(2110598, 'Tristan Rodd', 'Monist', 'Acompañado', 'BSIT', 0),
(2110872, 'Merilyn', 'Geronda', 'Villamor', 'BEED', 1),
(2210551, 'Rosemari', '', 'Obtina', 'BEED', 0),
(2210770, 'Cristel', 'Jayme', 'Navarro', 'BEED', 0),
(2210820, 'Catherine', 'Jayme', 'Abaya', 'BEED', 0),
(2410304, 'Rhealyn', 'Cadungog', 'Cabugwang', 'BSTM', 0),
(2410691, 'JB', 'Cabunilas', 'Recaña', 'BSHM', 0),
(2410929, 'Sheila Mae', 'Aniñon', 'Filipinas', 'BSHM', 0),
(2411730, 'Daniel', 'Astillero', 'Labay', 'BSHM', 0),
(2412282, 'Juvilla', 'Celebrado', 'Amance', 'BSHM', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesstokens`
--
ALTER TABLE `accesstokens`
  ADD PRIMARY KEY (`token_id`);

--
-- Indexes for table `student_queue_entries`
--
ALTER TABLE `student_queue_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_number` (`id_number`),
  ADD KEY `id_number_2` (`id_number`),
  ADD KEY `queue_status` (`queue_status`),
  ADD KEY `queue_status_2` (`queue_status`);

--
-- Indexes for table `tbl_login_admin`
--
ALTER TABLE `tbl_login_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_login_staff`
--
ALTER TABLE `tbl_login_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tbl_queue_status`
--
ALTER TABLE `tbl_queue_status`
  ADD PRIMARY KEY (`queue_status`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicetype` (`servicetype`);

--
-- Indexes for table `tbl_servicetype`
--
ALTER TABLE `tbl_servicetype`
  ADD PRIMARY KEY (`servicetype`);

--
-- Indexes for table `tbl_staff_request_password`
--
ALTER TABLE `tbl_staff_request_password`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `tbl_staff_windowhandlers`
--
ALTER TABLE `tbl_staff_windowhandlers`
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `tbl_student_info`
--
ALTER TABLE `tbl_student_info`
  ADD PRIMARY KEY (`id_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesstokens`
--
ALTER TABLE `accesstokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `student_queue_entries`
--
ALTER TABLE `student_queue_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `tbl_login_admin`
--
ALTER TABLE `tbl_login_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_login_staff`
--
ALTER TABLE `tbl_login_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_staff_request_password`
--
ALTER TABLE `tbl_staff_request_password`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_queue_entries`
--
ALTER TABLE `student_queue_entries`
  ADD CONSTRAINT `student_queue_entries_ibfk_2` FOREIGN KEY (`queue_status`) REFERENCES `tbl_queue_status` (`queue_status`);

--
-- Constraints for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD CONSTRAINT `tbl_service_ibfk_1` FOREIGN KEY (`servicetype`) REFERENCES `tbl_servicetype` (`servicetype`);

--
-- Constraints for table `tbl_staff_request_password`
--
ALTER TABLE `tbl_staff_request_password`
  ADD CONSTRAINT `tbl_staff_request_password_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tbl_login_staff` (`username`),
  ADD CONSTRAINT `tbl_staff_request_password_ibfk_2` FOREIGN KEY (`email`) REFERENCES `tbl_login_staff` (`email`);

--
-- Constraints for table `tbl_staff_windowhandlers`
--
ALTER TABLE `tbl_staff_windowhandlers`
  ADD CONSTRAINT `tbl_staff_windowhandlers_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `tbl_login_staff` (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
