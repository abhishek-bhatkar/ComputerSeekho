-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 19, 2020 at 04:47 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computerseekho`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(50) NOT NULL,
  `aboutcourse` varchar(200) NOT NULL,
  `agegroup` varchar(20) NOT NULL,
  `durationhr` varchar(20) NOT NULL,
  `fees` decimal(10,3) NOT NULL,
  PRIMARY KEY (`courseid`),
  KEY `courseid` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coursedetails`
--

DROP TABLE IF EXISTS `coursedetails`;
CREATE TABLE IF NOT EXISTS `coursedetails` (
  `batchid` int(11) NOT NULL AUTO_INCREMENT,
  `batchdate` date NOT NULL,
  `batchname` varchar(50) NOT NULL,
  `batchtimings` varchar(50) NOT NULL,
  `batchfinaldate` date NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`batchid`),
  KEY `courseid` (`courseid`),
  KEY `batchid` (`batchid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
CREATE TABLE IF NOT EXISTS `enquiry` (
  `enquiryid` int(11) NOT NULL AUTO_INCREMENT,
  `studentname` varchar(50) NOT NULL,
  `contactno` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `parentsname` varchar(50) NOT NULL,
  `query` varchar(50) NOT NULL,
  `comments` varchar(50) NOT NULL,
  `close` varchar(50) NOT NULL,
  `closedate` date NOT NULL,
  `reason` varchar(50) NOT NULL,
  `followupdate` date NOT NULL,
  `enquirydate` date NOT NULL,
  `courseid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  PRIMARY KEY (`enquiryid`),
  KEY `staffid` (`staffid`),
  KEY `courseid` (`courseid`),
  KEY `enquiryid` (`enquiryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollmentform`
--

DROP TABLE IF EXISTS `enrollmentform`;
CREATE TABLE IF NOT EXISTS `enrollmentform` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `studentname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `parentsname` varchar(50) NOT NULL,
  `contactno1` varchar(50) NOT NULL,
  `contactno2` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `educationalquali` varchar(50) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `fees` decimal(10,3) NOT NULL,
  `officeaddress` varchar(50) NOT NULL,
  `bloodgroup` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `enrolleddate` date NOT NULL,
  `courseid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL,
  PRIMARY KEY (`studentid`),
  KEY `courseid` (`courseid`),
  KEY `batchid` (`batchid`),
  KEY `studentid` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `albumid` int(11) NOT NULL AUTO_INCREMENT,
  `albumtitle` varchar(20) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`albumid`),
  KEY `courseid` (`courseid`),
  KEY `albumid` (`albumid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymentdetails`
--

DROP TABLE IF EXISTS `paymentdetails`;
CREATE TABLE IF NOT EXISTS `paymentdetails` (
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  `paymentmode` varchar(50) NOT NULL,
  `paymentrefno` varchar(50) NOT NULL,
  `paidamount` decimal(10,3) NOT NULL,
  `balanceamount` decimal(10,3) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `paymentdate` date NOT NULL,
  `batchid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  PRIMARY KEY (`paymentid`),
  KEY `batchid` (`batchid`),
  KEY `courseid` (`courseid`),
  KEY `studentid` (`studentid`),
  KEY `paymentid` (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photoid` int(11) NOT NULL AUTO_INCREMENT,
  `photopath` varchar(50) NOT NULL,
  `coverphoto` varchar(50) NOT NULL,
  `albumid` int(11) NOT NULL,
  PRIMARY KEY (`photoid`),
  KEY `albumid` (`albumid`),
  KEY `photoid` (`photoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `staffname` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`staffid`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videolink`
--

DROP TABLE IF EXISTS `videolink`;
CREATE TABLE IF NOT EXISTS `videolink` (
  `videoid` int(11) NOT NULL AUTO_INCREMENT,
  `videolink` varchar(50) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`videoid`),
  KEY `courseid` (`courseid`),
  KEY `videoid` (`videoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coursedetails`
--
ALTER TABLE `coursedetails`
  ADD CONSTRAINT `coursedetails_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enquiry_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrollmentform`
--
ALTER TABLE `enrollmentform`
  ADD CONSTRAINT `enrollmentform_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrollmentform_ibfk_2` FOREIGN KEY (`batchid`) REFERENCES `coursedetails` (`batchid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paymentdetails`
--
ALTER TABLE `paymentdetails`
  ADD CONSTRAINT `paymentdetails_ibfk_1` FOREIGN KEY (`batchid`) REFERENCES `coursedetails` (`batchid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paymentdetails_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paymentdetails_ibfk_3` FOREIGN KEY (`studentid`) REFERENCES `enrollmentform` (`studentid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`albumid`) REFERENCES `gallery` (`albumid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videolink`
--
ALTER TABLE `videolink`
  ADD CONSTRAINT `videolink_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
