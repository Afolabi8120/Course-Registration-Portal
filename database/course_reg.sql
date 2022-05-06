CREATE DATABASE course_reg;
USE course_reg;

-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2022 at 08:28 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `course_reg`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE IF NOT EXISTS `tbldepartment` (
  `faculty` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`faculty`, `department`) VALUES
('FFMS', 'ACCOUNTING'),
('FES', 'ART AND DESIGN'),
('FENG', 'CIVIL ENGINEERING'),
('FENG', 'COMPUTER ENGINEERING'),
('FSC', 'COMPUTER SCIENCE'),
('FENG', 'ELECTRICAL AND ELECTRONICS ENGINEERING'),
('FSC', 'GEOLOGY'),
('FSC', 'MATHEMATICS AND STATISTICS'),
('FENG', 'MECHANICAL ENGINEERING'),
('FENG', 'MECHATRONICS ENGINEERING'),
('FBCS', 'PUBLIC ADMINISTRATION'),
('FSC', 'SCIENCE LABORATORY AND TECHNOLOGY'),
('TEST FACULTY', 'TEST DEPARTMENT');

-- --------------------------------------------------------

--
-- Table structure for table `tblfaculty`
--

CREATE TABLE IF NOT EXISTS `tblfaculty` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfaculty`
--

INSERT INTO `tblfaculty` (`name`) VALUES
('FBCS'),
('FENG'),
('FES'),
('FFMS'),
('FSC'),
('TEST FACULTY');

-- --------------------------------------------------------

--
-- Table structure for table `tbllevel`
--

CREATE TABLE IF NOT EXISTS `tbllevel` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllevel`
--

INSERT INTO `tbllevel` (`name`) VALUES
('HND 1'),
('HND 2'),
('HND 3'),
('ND 1'),
('ND 2'),
('ND 3'),
('TEST LEVEL');

-- --------------------------------------------------------

--
-- Table structure for table `tblsemester`
--

CREATE TABLE IF NOT EXISTS `tblsemester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` varchar(50) NOT NULL,
  `session_from` int(4) NOT NULL,
  `session_to` int(4) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblsemester`
--

INSERT INTO `tblsemester` (`id`, `semester`, `session_from`, `session_to`, `status`) VALUES
(1, 'First Semester', 2021, 2022, 'Open'),
(2, 'Second Semester', 2021, 2022, 'Close'),
(3, 'Third Semester', 2021, 2022, 'Close');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudent`
--

CREATE TABLE IF NOT EXISTS `tblstudent` (
  `matricno` varchar(50) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `othername` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `level` varchar(50) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `program` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`matricno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudent`
--

INSERT INTO `tblstudent` (`matricno`, `surname`, `othername`, `gender`, `level`, `faculty`, `department`, `program`, `email`, `password`, `phone`, `address`, `image`, `status`) VALUES
('2007200', 'GB COMPASS', 'GBENGA', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'gbenga@gmail.com', '$2y$10$LwEjiMBSFoFakXDWj1FQn.qFswlMJ9bydp6HZH1OXeVZrWZ9acy4O', 'N/A', 'N/A', '01d11e2dab3e4e939ecafd80c0bb5c27.jpg', 'In-active'),
('2016309', 'OLUWADARE', 'EUNICE', 'Female', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'unexconice@gmail.com', '$2y$10$czLzpkKVmXPjncyQRFP9AuMKstxgpphQvCff4I6BaYYtwRgpzACYa', 'N/A', 'N/A', 'bdb7b4fc9f2b4a568015800f68afd561.jpg', 'Active'),
('2017070510111', 'OMOLOLA', 'OMOTOLA BIDEMI', 'Female', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'omolola@gmail.com', '$2y$10$OK3OYoYEuQKOV0cbvQ.swusjYjS7zknMCsPd3N215ayv6lufUa.VW', 'N/A', 'N/A', '44949d4da25d484ea0a36b133a2229bc.jpg', 'Active'),
('2017070510126', 'AFOLABI', 'TEMIDAYO TIMOTHY', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'afolabi8120@gmail.com', '$2y$10$xpWdPa2o2cs9yofQLNsuRu5Al5Bh8RD8BlO5jEcLAUMGxsWDYdGoO', '08090949669', 'N/A', '8a77f3825cf24415b8ac5bacb67fab28.jpg', 'Active'),
('2017070510222', 'OMOLE', 'DEBORAH OLUWASEYI', 'Female', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'omole.deb@yahoo.com', '$2y$10$n9keIWDbWBrwp9vVSQtmQuQk1.gSMKmcdZFBnK/Gm.M/QRpWXCFgG', 'N/A', 'N/A', 'IMG-20200106-WA0071.jpg', 'Active'),
('2017070510354', 'AKINYEMI', 'JUMOKE VICTORIA', 'Female', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'jumoke@gmail.com', '$2y$10$JCLer4pBLA9oSdgpQHv9Lui75OEpwoYidtEDins07aTSTAUs3bEem', 'N/A', 'N/A', '02c38a54d797495da994593e52487379.jpg', 'Active'),
('2017070510395', 'GBENRO', 'ROTIMI', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'meshackrotimi@gmail.com', '$2y$10$xlSx0GAuIGnVWFYFfG394.VPuZAxmOeHO6t7hh.Max7e3ACL63T6m', 'N/A', 'N/A', '0acb59f4f7ca4c57ad973519d3466084(1).jpg', 'Active'),
('2017070510625', 'KABIR', 'UTHMAN OPEYEMI', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'ope@gmail.com', '$2y$10$M2sP9ZPSUPO8A60y/aRY6.K.FfvhU2/1t.Y5LzICv2afOCOY52oeu', 'N/A', 'N/A', '1f1d017b49724e6fbb94b58d6accc242.jpg', 'Active'),
('2017070510630', 'OLADITI', 'MICHEAL PELUMI', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'm.oladiti1@gmail.com', '$2y$10$4wt2sPkYJztTMhAzJAC3c.VjjZTPNrC8rWp2g7.g3qWRwYHUyBjNe', 'N/A', 'N/A', '77dfae1751ad455494a1b08ed9530e24.jpg', 'Active'),
('2017070510872', 'AJAYI', 'GIDEON AYANFE', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'gideon@gmail.com', '$2y$10$npQPOFi1yTp6G.K0S9q1JeIEgyhpGSyW3P7QmqIjGDbYB2VQPMYga', 'N/A', 'N/A', 'c4f113c2d2b5414b921798704cbb2531.jpg', 'Active'),
('2017070510900', 'AFOLABI', 'TEMITOPE EMMANUEL', 'Male', 'ND 1', 'TEST FACULTY', 'TEST DEPARTMENT', 'FT', 'tee@gmail.com', '$2y$10$kbFCHzYhDYb2o495BOQdEe.GPSoiqhVxks2GAU6P6.oHljz0RHP0K', 'N/A', 'N/A', 'c3965b5c2d9a42c89ba3fa80f37853c8.jpg', 'Active'),
('2019070204008', 'SOLUTION', 'TWO', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'solution@gmail.com', '$2y$10$rpwvJOL4fm3uWSayCYxKleMnIyyipdJ/VriQB.G5v/wJae6wpfKYO', 'N/A', 'N/A', 'default.png', 'Active'),
('2019200508', 'OLAWALE ', 'OLAYINKA', 'Male', 'HND 1', 'FSC', 'COMPUTER SCIENCE', 'FT', 'olawaleolayinka0616@gmail.com', '$2y$10$IosUBGQOAgk9hqPnSlBtXuUfBhBE/micDPwr2iGyHYAf6/hL2X9WO', 'N/A', 'N/A', '420a5aae7cab49ae92230b4c60f5f97c.jpg', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE IF NOT EXISTS `tbluser` (
  `username` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `password` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `usertype` varchar(15) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`username`, `fullname`, `email`, `phone`, `address`, `password`, `picture`, `status`, `usertype`) VALUES
('Afolabi', 'AFOLABI TEMIDAYO TIMOTHY', 'afolabi8120@gmail.com', '08090949669', 'No 1 Adolak Street', '$2y$10$HZXN4lJxDuI5LvCFF7Yhi.ARPATSW0eYVYBNMBRUFVtXsN5/Am6D.', '4e247af595f442b2abf2cd1e1c3b73c8.jpg', 'Active', 'Super Admin'),
('Albert', 'ALBERT FAITH SEGUN', 'albert1@gmail.com', '08090949669', 'Ikotun, Lagos State.', '$2y$10$0IfbR17UkK4O1FLiTFMFJOOv7NfyNNTwa17JGNSvYO/n57PUlWY1C', '9c01c6c8f256490787977f9ec7fd9010.jpg', 'Active', 'Admin'),
('Deborah', 'OMOLE DEBORAH OLUWASEUN', 'deb@gmail.com', '08090949669', 'Lagos State', '$2y$10$oeByP40qDzPkFD/IQwQ07ul1HCYxYJe3nJhkqHpgwGGwrUxJiwMTS', '71ecf99a0b0c414f8c09cd0b69022993.jpg', 'Active', 'Admin'),
('Oladiti', 'OLADITI MICHEAL PELUMI', 'test@gmail.com', '09089976329', 'N/A', '$2y$10$a6M1k3G/uOZgqzlf3sETVu3LrbIhcffDxc9lIJWifFAqIt3VLvo2m', 'eaba9b3164ba49eb878a93e36a4fdfef.jpg', 'In-active', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_added_courses`
--

CREATE TABLE IF NOT EXISTS `tbl_added_courses` (
  `course_code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `program` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_added_courses`
--

INSERT INTO `tbl_added_courses` (`course_code`, `title`, `unit`, `grade`, `level`, `program`, `department`, `semester`, `session`) VALUES
('COM 311', 'OPERATING SYSTEM', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'First Semester', '2021-2022'),
('TEST 101', 'TEST ONE', '3', 'C', 'ND 1', 'FT', 'TEST DEPARTMENT', 'First Semester', '2021-2022'),
('TEST 102', 'TEST TWO', '3', 'E', 'ND 1', 'FT', 'TEST DEPARTMENT', 'First Semester', '2021-2022'),
('TEST 103', 'TEST THREE', '3', 'C', 'ND 1', 'FT', 'TEST DEPARTMENT', 'First Semester', '2021-2022'),
('TEST 104', 'TEST FOUR', '3', 'C', 'ND 1', 'FT', 'TEST DEPARTMENT', 'First Semester', '2021-2022'),
('TEST 105', 'TEST FIVE', '2', 'E', 'ND 1', 'FT', 'TEST DEPARTMENT', 'First Semester', '2021-2022'),
('COM 321', 'DATABASE DESIGN 2', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022'),
('COM 322', 'FLUTTER', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022'),
('COM 323', 'COMPUTER ARCHITECTURE', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022'),
('COM 324', 'OPERATING SYSTEM 2', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022'),
('GNS 302', 'COMMUNICATION IN ENGLISH', '2', 'G', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022'),
('MTH 321', 'ADVANCE ALGEBRA 2', '2', 'E', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022'),
('STA 321', 'STATISTICS THEORY 4', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022'),
('STA 323', 'OPERATION RESEARCH 2', '3', 'C', 'HND 1', 'FT', 'COMPUTER SCIENCE', 'Second Semester', '2021-2022');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_submitted_courses`
--

CREATE TABLE IF NOT EXISTS `tbl_submitted_courses` (
  `course_code` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `session` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `matricno` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Pending',
  `department` varchar(50) NOT NULL,
  `program` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_submitted_courses`
--

INSERT INTO `tbl_submitted_courses` (`course_code`, `title`, `unit`, `grade`, `session`, `semester`, `matricno`, `level`, `status`, `department`, `program`) VALUES
('COM 311', 'OPERATING SYSTEM', '3', 'C', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', '2021-2022', 'First Semester', '2017070510126', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 311', 'OPERATING SYSTEM', '3', 'C', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', '2021-2022', 'First Semester', '2017070510111', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 311', 'OPERATING SYSTEM', '3', 'C', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', '2021-2022', 'First Semester', '2017070510222', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 311', 'OPERATING SYSTEM', '3', 'C', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', '2021-2022', 'First Semester', '2017070510395', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 311', 'OPERATING SYSTEM', '3', 'C', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', '2021-2022', 'First Semester', '2017070510630', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 311', 'OPERATING SYSTEM', '3', 'C', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', '2021-2022', 'First Semester', '2017070510872', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 311', 'OPERATING SYSTEM', '3', 'C', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 312', 'DATABASE DESIGN I ', '3', 'C', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 313', 'COMPUTER PROGRAMING USING C++', '3', 'C', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('COM 314', 'COMPUTER ARCHITECTURE', '3', 'C', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('GNS 301', 'USE OF ENGLISH III', '2', 'G', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('MTH 312', 'ADVANCED ALGEBRA', '2', 'E', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 311', 'STATISTICS THEORY III', '2', 'C', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT'),
('STA 314', 'OPERATIONS RESEARCH I', '3', 'E', '2021-2022', 'First Semester', '2019070204008', 'HND 1', 'Submitted', 'COMPUTER SCIENCE', 'FT');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwprint`
--
CREATE TABLE IF NOT EXISTS `vwprint` (
`session` varchar(50)
,`semester` varchar(50)
,`matricno` varchar(50)
,`status` varchar(10)
,`surname` varchar(100)
,`othername` varchar(100)
,`level` varchar(50)
,`program` varchar(50)
,`faculty` varchar(50)
,`department` varchar(50)
,`image` varchar(255)
,`course_code` varchar(50)
,`title` varchar(255)
,`unit` varchar(10)
,`grade` varchar(10)
);
-- --------------------------------------------------------

--
-- Structure for view `vwprint`
--
DROP TABLE IF EXISTS `vwprint`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwprint` AS select `sub`.`session` AS `session`,`sub`.`semester` AS `semester`,`sub`.`matricno` AS `matricno`,`sub`.`status` AS `status`,`stu`.`surname` AS `surname`,`stu`.`othername` AS `othername`,`stu`.`level` AS `level`,`stu`.`program` AS `program`,`stu`.`faculty` AS `faculty`,`stu`.`department` AS `department`,`stu`.`image` AS `image`,`sub`.`course_code` AS `course_code`,`sub`.`title` AS `title`,`sub`.`unit` AS `unit`,`sub`.`grade` AS `grade` from (`tbl_submitted_courses` `sub` join `tblstudent` `stu` on((`sub`.`matricno` = `stu`.`matricno`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
