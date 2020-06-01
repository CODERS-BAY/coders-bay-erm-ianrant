-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2020 at 07:37 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codersbay`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` int(15) NOT NULL,
  `admin_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attends`
--

CREATE TABLE `attends` (
  `participant_id` int(15) NOT NULL,
  `subject_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `communicateswith`
--

CREATE TABLE `communicateswith` (
  `admin_id` int(15) NOT NULL,
  `job_center_agent_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `set_id` int(15) NOT NULL,
  `set_content` varchar(50) DEFAULT NULL,
  `participant_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `evaluates`
--

CREATE TABLE `evaluates` (
  `trainer_id` int(15) NOT NULL,
  `job_center_client` int(15) NOT NULL,
  `is_accepted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobcenteragent`
--

CREATE TABLE `jobcenteragent` (
  `job_center_agent_id` int(15) NOT NULL,
  `job_center_agent_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `job_center_client`
--

CREATE TABLE `job_center_client` (
  `job_center_client` int(15) NOT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `job_center_agent_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participant_id` int(15) NOT NULL,
  `participant_name` varchar(50) DEFAULT NULL,
  `set_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `receives`
--

CREATE TABLE `receives` (
  `participant_id` int(15) NOT NULL,
  `book_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studyresources`
--

CREATE TABLE `studyresources` (
  `book_id` int(15) NOT NULL,
  `book_title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(15) NOT NULL,
  `subject_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `trainer_id` int(15) NOT NULL,
  `subject_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `trainer_id` int(15) NOT NULL,
  `trainer_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attends`
--
ALTER TABLE `attends`
  ADD PRIMARY KEY (`participant_id`,`subject_id`);

--
-- Indexes for table `communicateswith`
--
ALTER TABLE `communicateswith`
  ADD PRIMARY KEY (`admin_id`,`job_center_agent_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`set_id`),
  ADD UNIQUE KEY `participant_id` (`participant_id`);

--
-- Indexes for table `evaluates`
--
ALTER TABLE `evaluates`
  ADD PRIMARY KEY (`trainer_id`,`job_center_client`);

--
-- Indexes for table `jobcenteragent`
--
ALTER TABLE `jobcenteragent`
  ADD PRIMARY KEY (`job_center_agent_id`);

--
-- Indexes for table `job_center_client`
--
ALTER TABLE `job_center_client`
  ADD PRIMARY KEY (`job_center_client`),
  ADD KEY `job_center_agent_id` (`job_center_agent_id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participant_id`),
  ADD UNIQUE KEY `set_id` (`set_id`);

--
-- Indexes for table `receives`
--
ALTER TABLE `receives`
  ADD PRIMARY KEY (`participant_id`,`book_id`);

--
-- Indexes for table `studyresources`
--
ALTER TABLE `studyresources`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`trainer_id`,`subject_id`),
  ADD UNIQUE KEY `subject_id` (`subject_id`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_center_client`
--
ALTER TABLE `job_center_client`
  ADD CONSTRAINT `job_center_client_ibfk_1` FOREIGN KEY (`job_center_agent_id`) REFERENCES `jobcenteragent` (`job_center_agent_id`);

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `equipment` (`set_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
