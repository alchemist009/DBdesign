-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:8888
-- Generation Time: Apr 20, 2017 at 07:12 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airport_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `atc`
--

CREATE TABLE IF NOT EXISTS `atc` (
  `Tower_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `controls`
--

CREATE TABLE IF NOT EXISTS `controls` (
  `F_Code` varchar(20) NOT NULL,
  `Tow_ID_num` int(11) NOT NULL,
  `Actual_Departure_Time` time NOT NULL,
  `Actual_Arrival_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `Flight_no` int(11) NOT NULL,
  `Seat_capacity` int(11) NOT NULL,
  `Aircraft_type` varchar(20) NOT NULL,
  `Origin` varchar(20) NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `C_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flight_instance`
--

CREATE TABLE IF NOT EXISTS `flight_instance` (
  `Flight_code` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Check_in_time` time NOT NULL,
  `Seat_Availability` int(11) NOT NULL,
  `Estimated_Departure_Time` time NOT NULL,
  `Estimated_Arrival_Time` int(11) NOT NULL,
  `Fl_no` int(11) NOT NULL,
  `T_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fl_generates`
--

CREATE TABLE IF NOT EXISTS `fl_generates` (
  `F_Code` varchar(20) NOT NULL,
  `I_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `Invoice_no` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `V_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `operational_days`
--

CREATE TABLE IF NOT EXISTS `operational_days` (
  `Flight_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource1`
--

CREATE TABLE IF NOT EXISTS `resource1` (
  `Fl_code` varchar(20) NOT NULL,
  `Check_in_Desk_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource2`
--

CREATE TABLE IF NOT EXISTS `resource2` (
  `Fl_code` varchar(20) NOT NULL,
  `Baggage_claim_no` int(11) NOT NULL,
  `Departure_gate_no` int(11) NOT NULL,
  `Air_Bridge_no` int(11) NOT NULL,
  `Runway_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `Staff_ID` int(11) NOT NULL,
  `Department` varchar(20) NOT NULL,
  `Working_hours` varchar(20) NOT NULL,
  `T_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uses`
--

CREATE TABLE IF NOT EXISTS `uses` (
  `S_ID_num` int(11) NOT NULL,
  `V_ID_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `VID` int(11) NOT NULL,
  `Vehicle_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE IF NOT EXISTS `vendor` (
  `Shop_no` int(11) NOT NULL,
  `Hours_open` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Company` varchar(20) NOT NULL,
  `Vendor_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `v_generates`
--

CREATE TABLE IF NOT EXISTS `v_generates` (
  `S_Num` int(11) NOT NULL,
  `I_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atc`
--
ALTER TABLE `atc`
  ADD PRIMARY KEY (`Tower_ID`),
  ADD KEY `Tower_ID` (`Tower_ID`);

--
-- Indexes for table `controls`
--
ALTER TABLE `controls`
  ADD PRIMARY KEY (`F_Code`,`Tow_ID_num`),
  ADD KEY `F_Code` (`F_Code`),
  ADD KEY `Tow_ID_num` (`Tow_ID_num`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`Flight_no`),
  ADD UNIQUE KEY `Flight#` (`Flight_no`),
  ADD KEY `Flight_no` (`Flight_no`);

--
-- Indexes for table `flight_instance`
--
ALTER TABLE `flight_instance`
  ADD PRIMARY KEY (`Flight_code`),
  ADD KEY `Fl_no` (`Fl_no`);

--
-- Indexes for table `fl_generates`
--
ALTER TABLE `fl_generates`
  ADD PRIMARY KEY (`F_Code`,`I_Num`),
  ADD KEY `F_Code` (`F_Code`),
  ADD KEY `I_Num` (`I_Num`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_no`),
  ADD KEY `Invoice_no` (`Invoice_no`),
  ADD KEY `S_no` (`V_ID`);

--
-- Indexes for table `operational_days`
--
ALTER TABLE `operational_days`
  ADD PRIMARY KEY (`Flight_num`),
  ADD KEY `Flight_num` (`Flight_num`);

--
-- Indexes for table `resource1`
--
ALTER TABLE `resource1`
  ADD PRIMARY KEY (`Fl_code`,`Check_in_Desk_no`),
  ADD KEY `Fl_code` (`Fl_code`);

--
-- Indexes for table `resource2`
--
ALTER TABLE `resource2`
  ADD PRIMARY KEY (`Fl_code`),
  ADD KEY `Fl_code` (`Fl_code`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`),
  ADD KEY `T_ID` (`T_ID`);

--
-- Indexes for table `uses`
--
ALTER TABLE `uses`
  ADD PRIMARY KEY (`S_ID_num`,`V_ID_num`),
  ADD KEY `S_ID_num` (`S_ID_num`),
  ADD KEY `V_ID_num` (`V_ID_num`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VID`),
  ADD KEY `VID` (`VID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`Vendor_ID`),
  ADD KEY `Shop_no` (`Shop_no`);

--
-- Indexes for table `v_generates`
--
ALTER TABLE `v_generates`
  ADD PRIMARY KEY (`S_Num`,`I_Number`),
  ADD KEY `S_Num` (`S_Num`),
  ADD KEY `I_Number` (`I_Number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `controls`
--
ALTER TABLE `controls`
  ADD CONSTRAINT `F_code_FK` FOREIGN KEY (`F_Code`) REFERENCES `flight_instance` (`Flight_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Tow_id_num_FK` FOREIGN KEY (`Tow_ID_num`) REFERENCES `atc` (`Tower_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `flight_instance`
--
ALTER TABLE `flight_instance`
  ADD CONSTRAINT `Fl_no_FK` FOREIGN KEY (`Fl_no`) REFERENCES `flight` (`Flight_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fl_generates`
--
ALTER TABLE `fl_generates`
  ADD CONSTRAINT `F_code_FK2` FOREIGN KEY (`F_Code`) REFERENCES `flight_instance` (`Flight_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `I_num_FK` FOREIGN KEY (`I_Num`) REFERENCES `invoice` (`Invoice_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `S_no_FK` FOREIGN KEY (`V_ID`) REFERENCES `vendor` (`Shop_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `operational_days`
--
ALTER TABLE `operational_days`
  ADD CONSTRAINT `Flight_num_PK` FOREIGN KEY (`Flight_num`) REFERENCES `flight` (`Flight_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `resource1`
--
ALTER TABLE `resource1`
  ADD CONSTRAINT `Fl_Code_FK` FOREIGN KEY (`Fl_code`) REFERENCES `flight_instance` (`Flight_code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `resource2`
--
ALTER TABLE `resource2`
  ADD CONSTRAINT `Fl_Code_FK2` FOREIGN KEY (`Fl_code`) REFERENCES `flight_instance` (`Flight_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `T_id_FK` FOREIGN KEY (`T_ID`) REFERENCES `atc` (`Tower_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `uses`
--
ALTER TABLE `uses`
  ADD CONSTRAINT `S_id_FK` FOREIGN KEY (`S_ID_num`) REFERENCES `vendor` (`Shop_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `V_id_FK` FOREIGN KEY (`V_ID_num`) REFERENCES `vehicle` (`VID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `v_generates`
--
ALTER TABLE `v_generates`
  ADD CONSTRAINT `I_num_FK2` FOREIGN KEY (`I_Number`) REFERENCES `invoice` (`Invoice_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `S_num_FK` FOREIGN KEY (`S_Num`) REFERENCES `vendor` (`Shop_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
