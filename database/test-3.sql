-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 19, 2020 at 08:05 PM
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
  `applicant_id` text NOT NULL,
  `password` int(11) NOT NULL,
  `status_of_application` text NOT NULL,
  `job_opening_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(44, 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `company_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `description` longtext NOT NULL,
  `association_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Company`
--

INSERT INTO `Company` (`company_id`, `name`, `address`, `description`, `association_id(fk)`) VALUES
(2, 'Google', 'Google Headquarters, CA', 'Search engine giant', 7),
(3, 'Apple', 'Apple HQ, CA', 'Manufactures iPhone, iPods and more', 7),
(4, 'Chevron', 'Chevron HQ, CA', 'Large oil and gas producer, formerly Texaco', 6);

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `employee_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `resume` text NOT NULL,
  `emp_id` text NOT NULL,
  `password` text NOT NULL,
  `company_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Job Opening`
--

CREATE TABLE `Job Opening` (
  `opening_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `status` text NOT NULL,
  `company_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD KEY `association_id(fk)` (`association_id(fk)`);

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
  ADD KEY `company_id1(fk)` (`company_id(fk)`);

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
  MODIFY `applicants_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Association`
--
ALTER TABLE `Association`
  MODIFY `association_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `Company`
--
ALTER TABLE `Company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Job Opening`
--
ALTER TABLE `Job Opening`
  MODIFY `opening_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `association_id(fk)` FOREIGN KEY (`association_id(fk)`) REFERENCES `Association` (`association_id`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `company_id2(fk)` FOREIGN KEY (`company_id(fk)`) REFERENCES `Company` (`company_id`);

--
-- Constraints for table `Job Opening`
--
ALTER TABLE `Job Opening`
  ADD CONSTRAINT `company_id1(fk)` FOREIGN KEY (`company_id(fk)`) REFERENCES `Company` (`company_id`);

--
-- Constraints for table `Search Committee`
--
ALTER TABLE `Search Committee`
  ADD CONSTRAINT `job_opening_id2(fk)` FOREIGN KEY (`job_opening_id(fk)`) REFERENCES `Job Opening` (`opening_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
