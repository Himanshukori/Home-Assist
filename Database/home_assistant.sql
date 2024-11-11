-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2019 at 07:30 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `home assistant`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--
CREATE DATABASE Home_Assist;
USE Home_Assist;
CREATE TABLE `booking` (
  `Booker_Username` text NOT NULL,
  `Service_Username` text NOT NULL,
  `Shopname` text NOT NULL,
  `Date` date NOT NULL,
  `Come_After` text NOT NULL,
  `Come_Before` text NOT NULL,
  `Address` text NOT NULL,
  `Description` text NOT NULL,
  `Booking_Status` varchar(15) NOT NULL DEFAULT 'Not_Confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booker_Username`, `Service_Username`, `Shopname`, `Date`, `Come_After`, `Come_Before`, `Address`, `Description`, `Booking_Status`) VALUES
('xyz@gmail.com', 'mus@gmail.com', 'abc', '2019-09-09', '12', '4', 'abx', 'aqwed', 'Confirm'),
('asvg@gmail.com', 'mus@gmail.com', 'abc', '2019-04-15', '12', '2', '58 annapurna road', 'tap fitting', 'Confirm'),
('xyz@gmail.com', 'mus@gmail.com', 'abc', '2019-04-16', '10', '2', '58 annapurna road', 'tap fitting', 'Confirm'),
('temp@mail.com', 'mus@gmail.com', 'abc', '2019-01-01', '12', '18', '58 annapurna road', 'tap fitting', 'Confirm');

-- --------------------------------------------------------

--
-- Table structure for table `serviceprovider_regs`
--

CREATE TABLE `serviceprovider_regs` (
  `Firstname` text NOT NULL,
  `Lastname` text NOT NULL,
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Confirm Password` text NOT NULL,
  `D.O.B` date NOT NULL,
  `Gender` text NOT NULL,
  `Contact` bigint(10) NOT NULL,
  `AadharNumber` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serviceprovider_regs`
--

INSERT INTO `serviceprovider_regs` (`Firstname`, `Lastname`, `Username`, `Password`, `Confirm Password`, `D.O.B`, `Gender`, `Contact`, `AadharNumber`) VALUES
('mustafa', 'tin', 'mus@gmail.com', '123', '123', '2019-04-15', 'Male', 1234567890, 1234567890),
('Mayank', 'Jeevtani', 'mj@gmail.com', '123', '123', '1998-09-07', 'Male', 1234567890, 123456),
('Mohini', 'Arya', 'ma@gmail.com', 'xswcdevfr', 'xswcdevfr', '2019-01-01', 'Female', 9575517157, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `Shop_Name` text NOT NULL,
  `Shop_Service` text NOT NULL,
  `Shop_Area` text NOT NULL,
  `Shop_Opening_Time` text NOT NULL,
  `Shop_Closing_Time` text NOT NULL,
  `Shop_Address` text NOT NULL,
  `Shop_Contact` bigint(10) NOT NULL,
  `Username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`Shop_Name`, `Shop_Service`, `Shop_Area`, `Shop_Opening_Time`, `Shop_Closing_Time`, `Shop_Address`, `Shop_Contact`, `Username`) VALUES
('abc', 'Plumber', 'Aanpurna', '11', '10', 'xyz,indore', 1234567890, 'mus@gmail.com'),
('abc', 'Plumber', 'Naulakha', '10', '18', 'abcd,indore', 1234567890, 'mus@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_regs`
--

CREATE TABLE `user_regs` (
  `First_name` text NOT NULL,
  `Last_name` text NOT NULL,
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `CPassword` text NOT NULL,
  `D.O.B` date NOT NULL,
  `Gender` text NOT NULL,
  `Contact` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_regs`
--

INSERT INTO `user_regs` (`First_name`, `Last_name`, `Username`, `Password`, `CPassword`, `D.O.B`, `Gender`, `Contact`) VALUES
('murtaza', 'anis', 'xyz@gmail.com', '12345', '12345', '2019-04-15', 'Male', 1234567890),
('geet', 'kori', 'asvg@gmail.com', '123', '123', '1997-10-12', 'Female', 9008776789),
('Aayush', 'Patniya', 'aayush@123', 'a123', 'a123', '2009-03-12', 'Male', 3666778767),
('temp', 'temp', 'temp@mail.com', 'temp', 'temp', '1000-01-01', 'Male', 1234567899);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;