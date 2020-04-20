-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 20, 2020 at 01:50 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `Applicants`
--

CREATE TABLE `Applicants` (
  `applicants_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `last_name` text NOT NULL,
  `resume` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `status` text NOT NULL,
  `job_opening_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Applicants`
--

INSERT INTO `Applicants` (`applicants_id`, `name`, `last_name`, `resume`, `email`, `password`, `status`, `job_opening_id(fk)`) VALUES
(2, 'tyler', 'g', 'resume', 'test@mail.com', '1', 'on time', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Association`
--

CREATE TABLE `Association` (
  `association_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Association`
--

INSERT INTO `Association` (`association_id`, `name`, `description`, `address`) VALUES
(6, 'Association of oil and gas', 'Collection of oil and gas companies', 'oil and gas association address'),
(7, 'Association of technology', 'Collection of technology companies', 'Association of tech address'),
(29, 'a', 'a', 'a'),
(30, 'asdf', 'asdf', 'asdf'),
(32, 'adsf', 'asdf', 'asdf'),
(33, 'asdf', 'asd', 'asdf'),
(38, 'asdf', 'asdf', 'asdf'),
(39, 'adsf', 'asdf', 'sdf'),
(40, 'asdf', 'asdf', 'asdf'),
(42, 'asdf', 'asdf', 'asdf'),
(44, 'test', 'test', 'test'),
(46, 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `company_id` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `company_address` text NOT NULL,
  `company_description` longtext NOT NULL,
  `association_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`company_id`, `company_name`, `company_address`, `company_description`, `association_id`) VALUES
(2, 'Google', 'Google Headquarters, CA', 'Search engine giant', 7),
(3, 'Apple', 'Apple HQ, CA', 'Manufactures iPhone, iPods and more', 7),
(4, 'Chevron', 'Chevron HQ, CA', 'Large oil and gas producer, formerly Texaco', 6),
(5, 'Google', '101 Google Ave', 'Google\'s description', 6),
(6, 'name', 'addr', 'desc', 7),
(7, 'a', 'a', 'a', 7),
(8, 'd', 'd', 'd', 7),
(9, 'asd', 'asd', 'and', 6),
(10, 'asdf', 'asdf', 'asdf', 6),
(11, 'asdf', 'asdf', 'asdf', 6),
(12, 'asdf', 'asdf', 'asdf', 6),
(13, 'test', 'test', 'test', 44);

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `employee_id` int(11) NOT NULL,
  `emp_name` text NOT NULL,
  `emp_last_name` text NOT NULL,
  `emp_email` text NOT NULL,
  `emp_address` text NOT NULL,
  `emp_status` text NOT NULL,
  `emp_resume` text NOT NULL,
  `emp_password` text NOT NULL,
  `company_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`employee_id`, `emp_name`, `emp_last_name`, `emp_email`, `emp_address`, `emp_status`, `emp_resume`, `emp_password`, `company_id(fk)`) VALUES
(1, 'tyler', 'gallegos', 'tyler.gallegos30@gmail.com', '123 Street', 'Employee', 'Resume', 'password', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Job Opening`
--

CREATE TABLE `Job Opening` (
  `opening_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `status` text NOT NULL,
  `comp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Job Opening`
--

INSERT INTO `Job Opening` (`opening_id`, `description`, `date`, `status`, `comp_id`) VALUES
(1, 'Intern', '2020-04-19', 'Closed', 3),
(2, 'a', '2020-04-19', 'Closed', 2),
(3, 'desc', '2020-04-19', 'Closed', 2),
(4, 'a', '2020-04-19', 'Closed', 2),
(5, 'asdf', '2020-04-21', 'Open', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Search Committee`
--

CREATE TABLE `Search Committee` (
  `search_committee_id` int(11) NOT NULL,
  `job_opening_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Applicants`
--
ALTER TABLE `Applicants`
  ADD PRIMARY KEY (`applicants_id`),
  ADD KEY `job_opening_id1(fk)` (`job_opening_id(fk)`);

--
-- Indexes for table `Association`
--
ALTER TABLE `Association`
  ADD PRIMARY KEY (`association_id`);

--
-- Indexes for table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `association_id(fk)` (`association_id`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `company_id2(fk)` (`company_id(fk)`);

--
-- Indexes for table `Job Opening`
--
ALTER TABLE `Job Opening`
  ADD PRIMARY KEY (`opening_id`),
  ADD KEY `company_id1(fk)` (`comp_id`);

--
-- Indexes for table `Search Committee`
--
ALTER TABLE `Search Committee`
  ADD PRIMARY KEY (`search_committee_id`),
  ADD KEY `job_opening_id2(fk)` (`job_opening_id(fk)`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Applicants`
--
ALTER TABLE `Applicants`
  MODIFY `applicants_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Association`
--
ALTER TABLE `Association`
  MODIFY `association_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `Company`
--
ALTER TABLE `Company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Job Opening`
--
ALTER TABLE `Job Opening`
  MODIFY `opening_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Search Committee`
--
ALTER TABLE `Search Committee`
  MODIFY `search_committee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Applicants`
--
ALTER TABLE `Applicants`
  ADD CONSTRAINT `job_opening_id1(fk)` FOREIGN KEY (`job_opening_id(fk)`) REFERENCES `Job Opening` (`opening_id`);

--
-- Constraints for table `Company`
--
ALTER TABLE `Company`
  ADD CONSTRAINT `association_id(fk)` FOREIGN KEY (`association_id`) REFERENCES `Association` (`association_id`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `company_id2(fk)` FOREIGN KEY (`company_id(fk)`) REFERENCES `Company` (`company_id`);

--
-- Constraints for table `Job Opening`
--
ALTER TABLE `Job Opening`
  ADD CONSTRAINT `company_id1(fk)` FOREIGN KEY (`comp_id`) REFERENCES `Company` (`company_id`);

--
-- Constraints for table `Search Committee`
--
ALTER TABLE `Search Committee`
  ADD CONSTRAINT `job_opening_id2(fk)` FOREIGN KEY (`job_opening_id(fk)`) REFERENCES `Job Opening` (`opening_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
