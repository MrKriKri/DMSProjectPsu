-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2017 at 09:20 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID` int(11) NOT NULL,
  `E-mail` varchar(30) NOT NULL,
  `Password` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `E-mail`, `Password`) VALUES
(17, 'mizxcx', '123');

-- --------------------------------------------------------

--
-- Table structure for table `patient_doctor`
--

CREATE TABLE `patient_doctor` (
  `DoctorID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `DocName` varchar(30) NOT NULL,
  `LineID` varchar(30) NOT NULL,
  `Tel` varchar(13) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_doctor`
--

INSERT INTO `patient_doctor` (`DoctorID`, `ID`, `DocName`, `LineID`, `Tel`) VALUES
(1, 17, 'kuy', 'eiei', '0123123');

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `IDcard` varchar(13) NOT NULL,
  `DOB` date NOT NULL,
  `Tel.` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`ID`, `Name`, `Surname`, `IDcard`, `DOB`, `Tel.`) VALUES
(17, 'teeta', 'chit', '12312', '1995-05-02', '01111231');

-- --------------------------------------------------------

--
-- Table structure for table `recorder`
--

CREATE TABLE `recorder` (
  `EventID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `SugarBloodRate` int(11) NOT NULL,
  `DateRec` date NOT NULL,
  `TimeRec` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recorder`
--

INSERT INTO `recorder` (`EventID`, `ID`, `SugarBloodRate`, `DateRec`, `TimeRec`) VALUES
(1, 17, 150, '2017-03-18', '02:21:33'),
(2, 17, 200, '2017-03-18', '02:24:48'),
(3, 17, 180, '2017-03-18', '02:25:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`E-mail`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `recorder`
--
ALTER TABLE `recorder`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient_doctor`
--
ALTER TABLE `patient_doctor`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `patient_info`
--
ALTER TABLE `patient_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `recorder`
--
ALTER TABLE `recorder`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
