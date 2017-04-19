-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 19, 2017 at 10:28 PM
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
  `Airline` varchar(20) NOT NULL,
  `Seat_capacity` int(11) NOT NULL,
  `Aircraft_type` varchar(20) NOT NULL,
  `Origin` varchar(20) NOT NULL,
  `Destination` varchar(20) NOT NULL
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
  `Fl_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fl_generates`
--

CREATE TABLE IF NOT EXISTS `fl_generates` (
  `F_Code` varchar(20) NOT NULL,
  `I_Num` int(11) NOT NULL,
  `Carrier_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `Invoice_no` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `S_no` int(11) NOT NULL
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
  `Company` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `v_generates`
--

CREATE TABLE IF NOT EXISTS `v_generates` (
  `S_Num` int(11) NOT NULL,
  `I_Number` int(11) NOT NULL,
  `Vendor_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`Flight_no`),
  ADD UNIQUE KEY `Flight#` (`Flight_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
