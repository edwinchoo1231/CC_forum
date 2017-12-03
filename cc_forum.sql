-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2017 at 03:48 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cc_forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_Name` varchar(255) DEFAULT NULL,
  `Admin_Password` varchar(255) DEFAULT NULL,
  `Admin_Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Admin_Name`, `Admin_Password`, `Admin_Email`) VALUES
(1, 'CHOO HONG YEE', '123456', '179435@student.upm.edu.my'),
(2, 'LIM KOK SANG', '123456', '178025@student.upm.edu.my'),
(3, 'KUAN POH YEE', '123456', '176762@student.upm.edu.my'),
(4, 'FAIQAH', '123456', '178435@student.upm.edu.my');

-- --------------------------------------------------------

--
-- Table structure for table `admin_student`
--

CREATE TABLE `admin_student` (
  `Admin_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Reply_ID` int(11) NOT NULL,
  `Topic_ID` int(11) NOT NULL,
  `Report_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Cat_ID` int(11) NOT NULL,
  `Cat_Name` varchar(255) DEFAULT NULL,
  `Cat_Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Cat_ID`, `Cat_Name`, `Cat_Description`) VALUES
(1, 'engineering', 'engineering stuffs'),
(2, 'Computer science', 'Computer geeks'),
(3, 'Medical', 'An apple a day keeps dis doctors away'),
(4, 'Economy', 'Country\'s development based on their analysis');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `Reply_ID` int(11) NOT NULL,
  `Reply_Content` varchar(255) DEFAULT NULL,
  `Reply_Date` date DEFAULT NULL,
  `Reply_Topic` varchar(255) DEFAULT NULL,
  `Reply_By` varchar(255) DEFAULT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Topic_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `Report_ID` int(11) NOT NULL,
  `Report_By` varchar(255) DEFAULT NULL,
  `Report_Cat` varchar(255) DEFAULT NULL,
  `Report_Topic` varchar(255) DEFAULT NULL,
  `Report_Date` date DEFAULT NULL,
  `Report_Action` varchar(255) DEFAULT NULL,
  `Report_SolvedBy` varchar(255) DEFAULT NULL,
  `Reply_ID` int(11) DEFAULT NULL,
  `Topic_ID` int(11) DEFAULT NULL,
  `Student_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL,
  `Student_Matrik` int(6) NOT NULL,
  `Student_Name` varchar(255) DEFAULT NULL,
  `Student_Password` varchar(255) DEFAULT NULL,
  `Student_Email` varchar(255) DEFAULT NULL,
  `Student_RegDate` date DEFAULT NULL,
  `Student_Course` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Student_Matrik`, `Student_Name`, `Student_Password`, `Student_Email`, `Student_RegDate`, `Student_Course`) VALUES
(1, 0, 'test', '123456', '123456@123.com', '2017-12-01', 'COMPUTER AND COMMUNICATION SYSTEMS ENGINEERING'),
(2, 0, 'test_1', '12345', '12345@123.com', NULL, NULL),
(3, 0, 'test_2', '1234', '1234@123.com', NULL, NULL),
(4, 0, 'choo', '123456', 'choo@choo.com', '2017-12-01', 'ccse');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `Topic_ID` int(11) NOT NULL,
  `Topic_Subject` varchar(255) DEFAULT NULL,
  `Topic_Content` varchar(1000) NOT NULL,
  `Topic_Date` date DEFAULT NULL,
  `Topic_Cat` varchar(255) DEFAULT NULL,
  `Topic_By` varchar(255) DEFAULT NULL,
  `Cat_ID` int(11) DEFAULT NULL,
  `Student_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `admin_student`
--
ALTER TABLE `admin_student`
  ADD PRIMARY KEY (`Admin_ID`,`Student_ID`,`Reply_ID`,`Topic_ID`,`Report_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Reply_ID` (`Reply_ID`),
  ADD KEY `Topic_ID` (`Topic_ID`),
  ADD KEY `Report_ID` (`Report_ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Cat_ID`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`Reply_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Topic_ID` (`Topic_ID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`Report_ID`),
  ADD KEY `Reply_ID` (`Reply_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Topic_ID` (`Topic_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`Topic_ID`),
  ADD KEY `Cat_ID` (`Cat_ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Cat_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `Reply_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `Report_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `Topic_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_student`
--
ALTER TABLE `admin_student`
  ADD CONSTRAINT `admin_student_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`),
  ADD CONSTRAINT `admin_student_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `admin_student_ibfk_3` FOREIGN KEY (`Reply_ID`) REFERENCES `replies` (`Reply_ID`),
  ADD CONSTRAINT `admin_student_ibfk_4` FOREIGN KEY (`Topic_ID`) REFERENCES `topics` (`Topic_ID`),
  ADD CONSTRAINT `admin_student_ibfk_5` FOREIGN KEY (`Report_ID`) REFERENCES `report` (`Report_ID`);

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`Topic_ID`) REFERENCES `topics` (`Topic_ID`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`Reply_ID`) REFERENCES `replies` (`Reply_ID`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`Topic_ID`) REFERENCES `topics` (`Topic_ID`);

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`Cat_ID`),
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
