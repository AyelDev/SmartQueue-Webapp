-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.2:3307
-- Generation Time: Feb 11, 2025 at 09:29 AM
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
  `id_number` varchar(220) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `purpose` varchar(220) NOT NULL,
  `servicetype` varchar(100) NOT NULL,
  `window_number` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `queue_status` varchar(20) NOT NULL DEFAULT 'QUEUE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_counters`
--

CREATE TABLE `tbl_counters` (
  `id` int(11) NOT NULL,
  `counter_number` int(11) NOT NULL,
  `description` varchar(220) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(220) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_counters`
--

INSERT INTO `tbl_counters` (`id`, `counter_number`, `description`, `date_created`, `status`) VALUES
(46, 2, 'Records', '2025-01-28 02:51:54', 'active'),
(47, 1, 'Admission', '2025-01-28 12:14:51', 'active'),
(48, 3, 'Archiving', '2025-01-28 12:15:16', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_admin`
--

CREATE TABLE `tbl_login_admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile_picture` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login_admin`
--

INSERT INTO `tbl_login_admin` (`admin_id`, `username`, `password`, `profile_picture`) VALUES
(1, 'cecadmin', 'cecadminpass', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_staff`
--

CREATE TABLE `tbl_login_staff` (
  `staff_id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(220) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isLocked` tinyint(1) NOT NULL DEFAULT 0,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `pin_number` varchar(100) DEFAULT NULL,
  `profile_picture` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_media`
--

CREATE TABLE `tbl_media` (
  `id` int(11) NOT NULL,
  `fileName` varchar(220) NOT NULL,
  `path` varchar(500) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_media`
--

INSERT INTO `tbl_media` (`id`, `fileName`, `path`, `type`) VALUES
(94, 'videosample2.mp4', 'C:\\Users\\63966\\git\\smartqueueweb\\src\\main\\webapp\\media', 'video/mp4'),
(96, 'videosample3.mp4', 'C:\\Users\\63966\\git\\smartqueueweb\\src\\main\\webapp\\media', 'video/mp4');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_month_queue_summary`
--

CREATE TABLE `tbl_month_queue_summary` (
  `id` int(11) NOT NULL,
  `month` date NOT NULL,
  `inquiries` int(11) NOT NULL DEFAULT 0,
  `date_modified` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_month_queue_summary`
--

INSERT INTO `tbl_month_queue_summary` (`id`, `month`, `inquiries`, `date_modified`) VALUES
(1, '2025-01-01', 16, '2025-01-30'),
(2, '2025-02-01', 0, '2025-01-30'),
(3, '2025-03-01', 0, '2025-01-30'),
(4, '2025-04-01', 0, '2025-01-30'),
(5, '2025-05-01', 0, '2025-01-30'),
(6, '2025-06-01', 0, '2025-01-30'),
(7, '2025-07-01', 0, '2025-01-30'),
(8, '2025-08-01', 0, '2025-01-30'),
(9, '2025-09-01', 0, '2025-01-30'),
(10, '2024-10-01', 0, '2025-01-30'),
(11, '2024-11-01', 0, '2025-01-30'),
(12, '2024-12-01', 0, '2025-01-30');

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
  `program` varchar(220) DEFAULT NULL,
  `purpose` varchar(220) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `servicetype` varchar(50) NOT NULL DEFAULT 'GENERAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `program`, `purpose`, `amount`, `servicetype`) VALUES
(1, 'BACHELOR OF SCIENCE IN INFORMATION TECHNOLOGY [BSIT]', NULL, 0, 'GENERAL'),
(2, 'BACHELOR OF ELEMENTARY EDUCATION [BEED]', NULL, 0, 'GENERAL'),
(3, 'BACHELOR OF SECONDARY EDUCATION [BSED]', NULL, 0, 'GENERAL'),
(4, 'BACHELOR OF SCIENCE IN TOURISM MANAGEMENT [BSTM]', NULL, 0, 'GENERAL'),
(5, 'BACHELOR OF SCIENCE IN HOSPITALITY MANAGEMENT [BSHM]', NULL, 0, 'GENERAL'),
(6, NULL, 'enrollment', 0, 'GENERAL'),
(7, NULL, 'certification', 150, 'RECORDS'),
(8, '', 'good moral', 150, 'RECORDS'),
(9, NULL, 'form 137', 150, 'RECORDS'),
(10, NULL, 'transcript of records (TOR)', 600, 'RECORDS'),
(11, NULL, 'diploma', 600, 'RECORDS'),
(12, NULL, 'grade evaluation', 150, 'RECORDS'),
(13, NULL, 'gwa', 200, 'RECORDS'),
(14, NULL, 'application of honors', 150, 'RECORDS'),
(15, NULL, 'PSA', 0, 'ARCHIVING'),
(16, NULL, 'FORM 137', 0, 'ARCHIVING'),
(68, 'BACHELOR OF SCIENCE IN CRIMINOLOGY [BS CRIM]', NULL, 0, 'GENERAL'),
(78, NULL, 'GOOD MORAL', 0, 'ARCHIVING'),
(79, NULL, 'FORM 138', 0, 'ARCHIVING');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicetype`
--

CREATE TABLE `tbl_servicetype` (
  `window_number` tinyint(4) NOT NULL,
  `servicetype` varchar(30) NOT NULL,
  `is_occupied` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_servicetype`
--

INSERT INTO `tbl_servicetype` (`window_number`, `servicetype`, `is_occupied`) VALUES
(1, 'GENERAL', 0),
(2, 'RECORDS', 0),
(3, 'ARCHIVING', 0);

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
  `id_number` bigint(220) NOT NULL,
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
(2110599, 'Tristan Rodd', 'Monisit', 'Acompañado', 'BSIT', 0),
(2110872, 'Merilyn', 'Villamor', 'Geronda', 'BEED', 0),
(2210551, 'Rosemarie', '', 'Obtina', 'BEED', 0),
(2210770, 'Cristel', 'Jayme', 'Navarro', 'BEED', 0),
(2210820, 'Catherine Mae', '', 'Abaya', 'BEED', 0),
(2211077, 'Crystal', 'Pendejito', 'Salmin', 'BEED', 0),
(2310060, 'Harold', 'Calvario', 'Mendoza', 'BSIT', 0),
(2311775, 'Shainua', 'Araneta', 'Hinoguin', 'BSHM', 0),
(2410275, 'Allester', 'Dana', 'Abellanosa', 'BSIT', 0),
(2410304, 'Rhealyn', 'Cadungog', 'Buhawe', 'BSTM', 0),
(2410381, 'Weljun', 'Ocariza', 'Baculi', 'BSIT', 0),
(2410691, 'JB', 'Cabunilas', 'Recaña', 'BSHM', 0),
(2410929, 'Shiela Mae', 'Aniñon', 'Filipinas', 'BSHM', 0),
(2411730, 'Daniell', 'Astillero', 'Labay', 'BSHM', 0),
(2412282, 'Juvilla', 'Celebrado', 'Amance', 'BSHM', 0),
(2412461, 'Franzy', 'Ebardo', 'Cabugwang', 'BSTM', 0),
(2412656, 'John Daryl', 'Cabarse', 'Gabiana', 'BSIT', 0),
(2413256, 'Jamuera', 'Dypongco', 'Encarnacion', 'BSED', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_info_temp`
--

CREATE TABLE `tbl_student_info_temp` (
  `id` int(11) NOT NULL,
  `id_number` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `course` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `queue_status` (`queue_status`),
  ADD KEY `queue_status_2` (`queue_status`),
  ADD KEY `purpose` (`purpose`),
  ADD KEY `window_number` (`window_number`),
  ADD KEY `servicetype` (`servicetype`);

--
-- Indexes for table `tbl_counters`
--
ALTER TABLE `tbl_counters`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tbl_media`
--
ALTER TABLE `tbl_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fileName` (`fileName`);

--
-- Indexes for table `tbl_month_queue_summary`
--
ALTER TABLE `tbl_month_queue_summary`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`window_number`),
  ADD UNIQUE KEY `servicetype` (`servicetype`);

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
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `window_number` (`window_number`);

--
-- Indexes for table `tbl_student_info`
--
ALTER TABLE `tbl_student_info`
  ADD PRIMARY KEY (`id_number`);

--
-- Indexes for table `tbl_student_info_temp`
--
ALTER TABLE `tbl_student_info_temp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesstokens`
--
ALTER TABLE `accesstokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `student_queue_entries`
--
ALTER TABLE `student_queue_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13330;

--
-- AUTO_INCREMENT for table `tbl_counters`
--
ALTER TABLE `tbl_counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_login_admin`
--
ALTER TABLE `tbl_login_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_login_staff`
--
ALTER TABLE `tbl_login_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `tbl_media`
--
ALTER TABLE `tbl_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `tbl_month_queue_summary`
--
ALTER TABLE `tbl_month_queue_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tbl_servicetype`
--
ALTER TABLE `tbl_servicetype`
  MODIFY `window_number` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_staff_request_password`
--
ALTER TABLE `tbl_staff_request_password`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `tbl_student_info_temp`
--
ALTER TABLE `tbl_student_info_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_queue_entries`
--
ALTER TABLE `student_queue_entries`
  ADD CONSTRAINT `student_queue_entries_ibfk_2` FOREIGN KEY (`queue_status`) REFERENCES `tbl_queue_status` (`queue_status`),
  ADD CONSTRAINT `student_queue_entries_ibfk_3` FOREIGN KEY (`window_number`) REFERENCES `tbl_servicetype` (`window_number`),
  ADD CONSTRAINT `student_queue_entries_ibfk_4` FOREIGN KEY (`servicetype`) REFERENCES `tbl_servicetype` (`servicetype`);

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
  ADD CONSTRAINT `tbl_staff_windowhandlers_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `tbl_login_staff` (`staff_id`),
  ADD CONSTRAINT `tbl_staff_windowhandlers_ibfk_2` FOREIGN KEY (`window_number`) REFERENCES `tbl_servicetype` (`window_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
