-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 09, 2020 at 01:20 PM
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
  `status_of_application` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Association`
--

CREATE TABLE `Association` (
  `association_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `address` text NOT NULL,
  `id_number(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `id_number` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `description` longtext NOT NULL,
  `employee_id(fk)` int(11) NOT NULL,
  `job_opening_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id_number(fk)` int(11) NOT NULL
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
  `company_id(fk)` int(11) NOT NULL,
  `applicants_id(fk)` int(11) NOT NULL,
  `search_committee_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Search Committee`
--

CREATE TABLE `Search Committee` (
  `search_committee_id(fk)` int(11) NOT NULL,
  `employee_id(fk)` int(11) NOT NULL,
  `opening_id(fk)` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Applicants`
--
ALTER TABLE `Applicants`
  ADD PRIMARY KEY (`applicants_id`);

--
-- Indexes for table `Association`
--
ALTER TABLE `Association`
  ADD PRIMARY KEY (`association_id`),
  ADD KEY `id_number(fk)` (`id_number(fk)`);

--
-- Indexes for table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`id_number`),
  ADD KEY `job_opening_id(fk)` (`job_opening_id(fk)`),
  ADD KEY `employee_id1(fk)` (`employee_id(fk)`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `id_number(fk)` (`id_number(fk)`);

--
-- Indexes for table `Job Opening`
--
ALTER TABLE `Job Opening`
  ADD PRIMARY KEY (`opening_id`),
  ADD KEY `company_id(fk)` (`company_id(fk)`),
  ADD KEY `applicants_id(fk)` (`applicants_id(fk)`),
  ADD KEY `search_committee_id(fk)` (`search_committee_id(fk)`);

--
-- Indexes for table `Search Committee`
--
ALTER TABLE `Search Committee`
  ADD PRIMARY KEY (`search_committee_id(fk)`),
  ADD KEY `employee_id(fk)` (`employee_id(fk)`),
  ADD KEY `opening_id(fk)` (`opening_id(fk)`);

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
  MODIFY `association_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Company`
--
ALTER TABLE `Company`
  MODIFY `id_number` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `search_committee_id(fk)` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Association`
--
ALTER TABLE `Association`
  ADD CONSTRAINT `id_number1(fk)` FOREIGN KEY (`id_number(fk)`) REFERENCES `Company` (`id_number`);

--
-- Constraints for table `Company`
--
ALTER TABLE `Company`
  ADD CONSTRAINT `employee_id1(fk)` FOREIGN KEY (`employee_id(fk)`) REFERENCES `Employee` (`employee_id`),
  ADD CONSTRAINT `job_opening_id(fk)` FOREIGN KEY (`job_opening_id(fk)`) REFERENCES `Job Opening` (`opening_id`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `id_number(fk)` FOREIGN KEY (`id_number(fk)`) REFERENCES `Company` (`id_number`);

--
-- Constraints for table `Job Opening`
--
ALTER TABLE `Job Opening`
  ADD CONSTRAINT `applicants_id(fk)` FOREIGN KEY (`applicants_id(fk)`) REFERENCES `Applicants` (`applicants_id`),
  ADD CONSTRAINT `company_id(fk)` FOREIGN KEY (`company_id(fk)`) REFERENCES `Company` (`id_number`),
  ADD CONSTRAINT `search_committee_id(fk)` FOREIGN KEY (`search_committee_id(fk)`) REFERENCES `Search Committee` (`search_committee_id(fk)`);

--
-- Constraints for table `Search Committee`
--
ALTER TABLE `Search Committee`
  ADD CONSTRAINT `employee_id(fk)` FOREIGN KEY (`employee_id(fk)`) REFERENCES `Employee` (`employee_id`),
  ADD CONSTRAINT `opening_id(fk)` FOREIGN KEY (`opening_id(fk)`) REFERENCES `Job Opening` (`opening_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
