-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2017 at 02:18 AM
-- Server version: 5.6.34-log
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airport management system`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE IF NOT EXISTS `airline` (
  `Airline_name` varchar(20) NOT NULL,
  `Carrier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`Airline_name`, `Carrier_ID`) VALUES
('American Airlines', 11),
('United Airlines', 22),
('British Airways', 33),
('Delta Airlines', 44),
('Virgin Atlantic', 55);

-- --------------------------------------------------------

--
-- Table structure for table `atc`
--

CREATE TABLE IF NOT EXISTS `atc` (
  `Tower_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atc`
--

INSERT INTO `atc` (`Tower_ID`) VALUES
(0),
(1),
(2),
(3);

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

--
-- Dumping data for table `controls`
--

INSERT INTO `controls` (`F_Code`, `Tow_ID_num`, `Actual_Departure_Time`, `Actual_Arrival_Time`) VALUES
('101APR26', 2, '00:00:00', '21:30:00'),
('111APR26', 3, '17:15:00', '00:00:00'),
('123APR26', 1, '07:45:00', '00:00:00'),
('221APR26', 3, '02:15:00', '00:00:00'),
('321APR26', 2, '07:45:00', '00:00:00'),
('456APR26', 1, '00:00:00', '16:00:00'),
('654APR26', 2, '00:00:00', '05:15:00'),
('706APR26', 3, '00:00:00', '22:00:00'),
('789APR26', 1, '10:00:00', '00:00:00'),
('987APR26', 1, '00:00:00', '01:00:00');

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

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`Flight_no`, `Seat_capacity`, `Aircraft_type`, `Origin`, `Destination`, `C_ID`) VALUES
(101, 150, 'MD82', 'OKC', 'DFW', 44),
(111, 300, 'A380', 'DFW', 'MIA', 11),
(123, 300, 'A380', 'DFW', 'DEN', 11),
(221, 150, 'MD82', 'DFW', 'ATL', 33),
(321, 500, 'A319', 'DFW', 'LAX', 22),
(456, 525, 'B757', 'DAL', 'DFW', 33),
(654, 525, 'B757', 'ATL', 'DFW', 55),
(706, 510, 'A321', 'DEN', 'DFW', 55),
(789, 150, 'MD82', 'DFW', 'WAS', 44),
(987, 510, 'A321', 'BOS', 'DFW', 22);

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
  `Estimated_Arrival_Time` time NOT NULL,
  `Fl_no` int(11) NOT NULL,
  `T_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_instance`
--

INSERT INTO `flight_instance` (`Flight_code`, `Date`, `Check_in_time`, `Seat_Availability`, `Estimated_Departure_Time`, `Estimated_Arrival_Time`, `Fl_no`, `T_ID`) VALUES
('101APR26', '2017-04-26', '00:00:00', 0, '00:00:00', '20:30:00', 101, 2),
('111APR26', '2017-04-26', '16:15:00', 170, '17:15:00', '00:00:00', 111, 3),
('123APR26', '2017-04-26', '06:30:00', 200, '07:30:00', '00:00:00', 123, 1),
('221APR26', '2017-04-26', '01:00:00', 40, '02:00:00', '00:00:00', 221, 3),
('321APR26', '2017-04-26', '06:30:00', 170, '07:30:00', '00:00:00', 321, 2),
('456APR26', '2017-04-26', '00:00:00', 0, '00:00:00', '15:30:00', 456, 1),
('654APR26', '2017-04-26', '00:00:00', 0, '00:00:00', '04:15:00', 654, 2),
('706APR26', '2017-04-26', '00:00:00', 0, '00:00:00', '21:00:00', 706, 3),
('789APR26', '2017-04-26', '09:00:00', 50, '10:00:00', '00:00:00', 789, 1),
('987APR26', '2017-04-26', '00:00:00', 0, '00:00:00', '00:30:00', 987, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fl_generates`
--

CREATE TABLE IF NOT EXISTS `fl_generates` (
  `F_Code` varchar(20) NOT NULL,
  `I_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fl_generates`
--

INSERT INTO `fl_generates` (`F_Code`, `I_Num`) VALUES
('111APR26', 205),
('987APR26', 210),
('123APR26', 215),
('789APR26', 220),
('101APR26', 225),
('221APR26', 230),
('456APR26', 240),
('321APR26', 245),
('706APR26', 260),
('654APR26', 265);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `Invoice_no` int(11) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Invoice_no`, `Amount`) VALUES
(205, 7500),
(210, 20000),
(215, 7500),
(220, 5000),
(225, 5000),
(230, 5000),
(240, 7500),
(245, 10000),
(260, 7500),
(265, 15000),
(320, 500),
(335, 1200),
(350, 1000),
(355, 1600),
(360, 600);

-- --------------------------------------------------------

--
-- Table structure for table `operational_days`
--

CREATE TABLE IF NOT EXISTS `operational_days` (
  `Flight_num` int(11) NOT NULL,
  `Days` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operational_days`
--

INSERT INTO `operational_days` (`Flight_num`, `Days`) VALUES
(111, 'WeSa'),
(123, 'MoWeFr'),
(221, 'WeSu'),
(321, 'WeFr'),
(789, 'TuWeTh');

-- --------------------------------------------------------

--
-- Table structure for table `resource1`
--

CREATE TABLE IF NOT EXISTS `resource1` (
  `Fl_code` varchar(20) NOT NULL,
  `Check_in_Desk_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resource1`
--

INSERT INTO `resource1` (`Fl_code`, `Check_in_Desk_no`) VALUES
('101APR26', 1),
('111APR26', 7),
('221APR26', 9),
('321APR26', 5),
('789APR26', 3);

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

--
-- Dumping data for table `resource2`
--

INSERT INTO `resource2` (`Fl_code`, `Baggage_claim_no`, `Departure_gate_no`, `Air_Bridge_no`, `Runway_no`) VALUES
('101APR26', 5, 0, 4, 6),
('111APR26', 0, 10, 5, 15),
('123APR26', 0, 7, 3, 11),
('221APR26', 0, 9, 1, 10),
('321APR26', 0, 3, 2, 12),
('456APR26', 1, 0, 3, 9),
('654APR26', 2, 0, 1, 5),
('706APR26', 4, 0, 2, 13),
('789APR26', 0, 6, 4, 7),
('987APR26', 3, 0, 5, 3);

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

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Department`, `Working_hours`, `T_ID`) VALUES
(2965, 'MAINTENANCE', '9AM-5PM', 0),
(3271, 'MANAGERIAL', '9AM-5PM', 0),
(3786, 'FIELD', '9AM-3PM', 0),
(5317, 'SECURITY', '9AM-9PM', 0),
(7717, 'ATC', '9AM-3PM', 2);

-- --------------------------------------------------------

--
-- Table structure for table `uses`
--

CREATE TABLE IF NOT EXISTS `uses` (
  `S_ID_num` int(11) NOT NULL,
  `V_ID_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uses`
--

INSERT INTO `uses` (`S_ID_num`, `V_ID_num`) VALUES
(2965, 27),
(3786, 15),
(3786, 18),
(3786, 20),
(3786, 21);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `VID` int(11) NOT NULL,
  `Vehicle_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`VID`, `Vehicle_type`) VALUES
(15, 'BAGGAGE CART'),
(18, 'BUSES'),
(20, 'PLANE TUG'),
(21, 'CATERING VEHICLE'),
(27, 'REFUELERS');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE IF NOT EXISTS `vendor` (
  `Vendor_ID` int(11) NOT NULL,
  `Shop_no` int(11) NOT NULL,
  `Hours_open` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Company` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`Vendor_ID`, `Shop_no`, `Hours_open`, `Location`, `Type`, `Company`) VALUES
(20, 1, '9AM-12AM', 'AIRPORT CHECKIN', 'FOOD AND DRINKS', 'STARBUCKS'),
(25, 2, '9AM-12AM', 'AIRPORT MALL', 'FOOD AND DRINKS', 'LA MADELEINE'),
(30, 5, '9AM-12AM', 'AIRPORT LOUNGE', 'TECH STORE', 'DAL ELECTRONICS'),
(35, 4, '9AM-12AM', 'AIRPORT MALL', 'TECH STORE', 'APPLE'),
(40, 3, '9AM-12AM', 'AIRPORT LOUNGE', 'BOOK STORE', 'BARNES AND NOBLE');

-- --------------------------------------------------------

--
-- Table structure for table `v_generates`
--

CREATE TABLE IF NOT EXISTS `v_generates` (
  `Vendor_ID` int(11) NOT NULL,
  `I_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `v_generates`
--

INSERT INTO `v_generates` (`Vendor_ID`, `I_Number`) VALUES
(20, 320),
(25, 335),
(30, 350),
(35, 355),
(40, 360);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`Carrier_ID`),
  ADD KEY `Carrier_ID` (`Carrier_ID`);

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
  ADD KEY `Flight_no` (`Flight_no`),
  ADD KEY `C_ID` (`C_ID`);

--
-- Indexes for table `flight_instance`
--
ALTER TABLE `flight_instance`
  ADD PRIMARY KEY (`Flight_code`),
  ADD KEY `Fl_no` (`Fl_no`),
  ADD KEY `T_ID` (`T_ID`);

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
  ADD KEY `Invoice_no` (`Invoice_no`);

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
  ADD KEY `Vendor_ID` (`Vendor_ID`);

--
-- Indexes for table `v_generates`
--
ALTER TABLE `v_generates`
  ADD PRIMARY KEY (`Vendor_ID`,`I_Number`),
  ADD KEY `Vendor_ID` (`Vendor_ID`),
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
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `C_ID_FK` FOREIGN KEY (`C_ID`) REFERENCES `airline` (`Carrier_ID`);

--
-- Constraints for table `flight_instance`
--
ALTER TABLE `flight_instance`
  ADD CONSTRAINT `Fl_no_FK` FOREIGN KEY (`Fl_no`) REFERENCES `flight` (`Flight_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `T_ID_FK2` FOREIGN KEY (`T_ID`) REFERENCES `atc` (`Tower_ID`);

--
-- Constraints for table `fl_generates`
--
ALTER TABLE `fl_generates`
  ADD CONSTRAINT `F_code_FK2` FOREIGN KEY (`F_Code`) REFERENCES `flight_instance` (`Flight_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `I_num_FK` FOREIGN KEY (`I_Num`) REFERENCES `invoice` (`Invoice_no`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `S_id_FK` FOREIGN KEY (`S_ID_num`) REFERENCES `staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `V_id_FK` FOREIGN KEY (`V_ID_num`) REFERENCES `vehicle` (`VID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `v_generates`
--
ALTER TABLE `v_generates`
  ADD CONSTRAINT `I_Number_FK` FOREIGN KEY (`I_Number`) REFERENCES `invoice` (`Invoice_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Vendor_ID_FK2` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
