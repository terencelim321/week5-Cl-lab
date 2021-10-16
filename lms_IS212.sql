-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2021 at 08:33 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `is212_example`
--
CREATE DATABASE IF NOT EXISTS `lms_IS212` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lms_IS212`;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(50) DEFAULT NULL,
  `courseDesc` varchar(50) DEFAULT NULL,
  `preRequisites` varchar(50) DEFAULT NULL,
  `classesID` int(11)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- Table structure for table `Classes`
--

CREATE TABLE `Classes` (
  `classesID` int(11)  NOT NULL,
  `startDate` date DEFAULT NULL,
  `startTime` timestamp  DEFAULT NULL,
  `endDate` date  DEFAULT NULL,
  `endTime` timestamp  DEFAULT NULL,
  `classesSize` int(11) DEFAULT NULL,
  `trainerAssigned` varchar(50)  DEFAULT NULL,
  `lessonID` int(11)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- --------------------------------------------------------
-- Table structure for table `Lesson`
--

CREATE TABLE `Lesson` (
  `lessonID` int(11)  NOT NULL,
  `courseMaterial` varchar(50) DEFAULT NULL,
  `quizID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- --------------------------------------------------------
-- Table structure for table `Quiz`
--

CREATE TABLE `Quiz` (
  `quizID` int(11)  NOT NULL,
  `qn` varchar(50) DEFAULT NULL,
  `qnID` int(11) DEFAULT NULL,
  `ans` varchar(50) DEFAULT NULL,
  `ansID` int(11) DEFAULT NULL,
  `qnType` varchar(50) DEFAULT NULL,
  `StartTime` timestamp DEFAULT NULL,
  `EndTime` timestamp DEFAULT NULL,
  `qnDuration` timestamp DEFAULT NULL,
  `attemptNo` int(11) DEFAULT NULL,
  `quizScore` float(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Table structure for table `Administrator`
--

CREATE TABLE `Administrator` (
  `administratorID` int(11) NOT NULL  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Administrator`
--

INSERT INTO `Administrator` (`administratorID`) VALUES
(1);

-- --------------------------------------------------------
-- Table structure for table `Trainer`
--

CREATE TABLE `Trainer` (
  `trainerID` int(11) NOT NULL,
  `coursesTeaching` varchar(50) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Trainer`
--

INSERT INTO `Trainer` (`trainerID`, `coursesTeaching`) VALUES
(1, 'IS212'),
(2, 'IS213'),
(3, 'IS214');

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE `Learner` (
  `learnerID` int(11) NOT NULL,
  `CoursesTaking` varchar(50)  DEFAULT NULL,
  `CompletedCourses` varchar(50)  DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Learner`
--

INSERT INTO `Learner` (`learnerID`, `CoursesTaking`, `CompletedCourses`) VALUES
(1, 'IS212,IS213', 'IS214'),
(2, 'IS212', 'IS213,IS214'),
(3, 'IS214', 'IS212,IS213');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `Employee` (
  `staffID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CurrentDesignation` varchar(50) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `ContactNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`staffID`, `Name`, `Username`,`Email`,`CurrentDesignation`,`Department`,`ContactNo`) VALUES
(1, 'Phris Coskitt', 'csok','coski@gmail.com','administrator','hr','90227823'),
(2, 'Arnold de Mari', 'Dr','Dr@gmail.com','trainer','Training','82329832'),
(3, 'Constance Wilkinson', 'cons','cons@gmail.com','learner','Learning','92130843');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`courseID`),
  ADD KEY `classesID` (`classesID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`classesID`);

--
-- Indexes for table `Lesson`
--
ALTER TABLE `Lesson`
  ADD PRIMARY KEY (`lessonID`);

--
-- Indexes for table `Quiz`
--
ALTER TABLE `Quiz`
  ADD PRIMARY KEY (`quizID`);


ALTER TABLE `Course`
  ADD CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`classesID`) REFERENCES `Classes` (`classesID`);
  

--
-- Constraints for table `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `Classes_ibfk_1` FOREIGN KEY (`lessonID`) REFERENCES `Lesson`(`lessonID`);

--
-- Constraints for table `Quiz`
--
ALTER TABLE `Lesson`
  ADD CONSTRAINT `Lesson_ibfk_1` FOREIGN KEY (`quizID`) REFERENCES `Quiz` (`quizID`);
