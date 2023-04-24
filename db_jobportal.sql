-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2023 at 05:14 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_jobportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` bigint(20) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_type`) VALUES
(101, 'ZXV', 'Software'),
(102, 'ABC Corp', 'Manufacturing'),
(103, 'GHI Corporation', 'Telecommunications'),
(104, 'LMN Corporation', 'Telecom'),
(105, 'MNO Enterprises', 'Construction'),
(106, 'EFG Industries', 'Energy'),
(107, 'LMN Group', 'Healthcare'),
(108, 'UVW Corporation', 'Technology'),
(109, 'RST Solutions', 'Consulting'),
(110, 'JKL Enterprises', 'Transportation');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) DEFAULT NULL,
  `admin_email` varchar(30) DEFAULT NULL,
  `admin_password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(101, 'Admin', 'admin@gmail.com', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_applications`
--

CREATE TABLE `tbl_applications` (
  `application_id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_applications`
--

INSERT INTO `tbl_applications` (`application_id`, `job_id`, `user_id`) VALUES
(1, 13, '101'),
(2, 13, '101'),
(3, 13, '101'),
(4, 12, '101'),
(5, 12, '101'),
(6, 12, '101');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_job`
--

CREATE TABLE `tbl_job` (
  `job_id` int(20) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `job_type` varchar(255) NOT NULL,
  `job_salary` int(11) NOT NULL,
  `job_description` varchar(255) NOT NULL,
  `job_location` varchar(30) NOT NULL,
  `job_last_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_job`
--

INSERT INTO `tbl_job` (`job_id`, `job_title`, `job_type`, `job_salary`, `job_description`, `job_location`, `job_last_date`) VALUES
(1, 'Software Engineer', 'Remote', 50000, 'Java, Angular', 'Mumbai', '2023-05-01'),
(2, 'Python Developer', 'Full-Time', 70000, 'Python, Django', 'Pune', '2023-06-01'),
(3, 'Sales Manager', 'Remote', 80000, 'Sales, Marketing', '', '2023-05-15'),
(4, 'Accountant', 'Full-Time', 55000, 'Accounting, Finance', '', '2023-07-01'),
(5, 'Front-End Developer', 'Remote', 65000, 'JavaScript, React', '', '2023-06-30'),
(6, 'Software Developer', 'Full-Time', 75000, 'C++, Algorithms', '', '2023-05-20'),
(7, 'HR Manager', 'Remote', 85000, 'Human Resources, Recruitment', '', '2023-06-15'),
(8, 'Operations Manager', 'Full-Time', 90000, 'Operations, Logistics', '', '2023-07-15'),
(9, 'Data Analyst', 'Remote', 60000, 'Data Analysis, Statistics', '', '2023-05-31'),
(10, 'Project Manager', 'Full-Time', 80000, 'Civil Engineering, Project Management', '', '2023-06-15'),
(11, 'Sr Software Engineer', 'Full-Time', 5000, 'Something', 'Pune', '2023-04-18'),
(12, 'Sr Software', 'Full Time', 5000, 'Something', 'Mumbai', '2023-11-30'),
(13, 'Sr Software', 'Full Time', 5000, 'Something', 'Mumbai', '2023-12-31'),
(14, 'Sr Software', 'Full Time', 5000, 'Something', 'Mumbai', '2023-12-31'),
(15, 'Python Developer', 'Full-Time', 70000, 'Python, Django', 'Mumbai', '2023-06-01'),
(17, 'Sr Software Engineer', 'Remote', 50000, 'Something', 'Mumbai', '2023-04-24'),
(18, 'Sr Software', 'Part Time', 5000, 'Something', 'Mumbai', '2023-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_job_details`
--

CREATE TABLE `tbl_job_details` (
  `job_id` bigint(20) NOT NULL,
  `job_last_date` varchar(255) NOT NULL,
  `job_required_skills` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `job_type` varchar(255) NOT NULL,
  `job_salary` int(11) NOT NULL,
  `company_company_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_job_details`
--

INSERT INTO `tbl_job_details` (`job_id`, `job_last_date`, `job_required_skills`, `job_title`, `job_type`, `job_salary`, `company_company_id`) VALUES
(1, '2023-05-01', 'Java, Angular', 'Software Engineer', 'Remote', 50000, 101),
(2, '2023-06-01', 'Python, Django', 'Python Developer', 'Full-Time', 70000, 101),
(3, '2023-05-15', 'Sales, Marketing', 'Sales Manager', 'Remote', 80000, 102),
(4, '2023-07-01', 'Accounting, Finance', 'Accountant', 'Full-Time', 55000, 102),
(5, '2023-06-30', 'JavaScript, React', 'Front-End Developer', 'Remote', 65000, 103),
(6, '2023-05-20', 'C++, Algorithms', 'Software Developer', 'Full-Time', 75000, 103),
(7, '2023-06-15', 'Human Resources, Recruitment', 'HR Manager', 'Remote', 85000, 104),
(8, '2023-07-15', 'Operations, Logistics', 'Operations Manager', 'Full-Time', 90000, 104),
(9, '2023-05-31', 'Data Analysis, Statistics', 'Data Analyst', 'Remote', 60000, 105),
(10, '2023-06-15', 'Civil Engineering, Project Management', 'Project Manager', 'Full-Time', 80000, 105);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(101, 'User', 'user@gmail.com', 'user@123'),
(102, 'waseem', 'waseem@gmail.com', 'waseem');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_applications`
--
ALTER TABLE `tbl_applications`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `tbl_job`
--
ALTER TABLE `tbl_job`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `tbl_job_details`
--
ALTER TABLE `tbl_job_details`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `FK4ofsk4do4kwwp0r0f8gk8yvx3` (`company_company_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `tbl_applications`
--
ALTER TABLE `tbl_applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_job`
--
ALTER TABLE `tbl_job`
  MODIFY `job_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_job_details`
--
ALTER TABLE `tbl_job_details`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_job_details`
--
ALTER TABLE `tbl_job_details`
  ADD CONSTRAINT `FK4ofsk4do4kwwp0r0f8gk8yvx3` FOREIGN KEY (`company_company_id`) REFERENCES `company` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
