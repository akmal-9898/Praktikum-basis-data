-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2026 at 04:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_dream_car`
--

-- --------------------------------------------------------

--
-- Table structure for table `bismillah`
--

CREATE TABLE `bismillah` (
  `Brand` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Class` enum('Hatchback','Sedan','SUV','Crossover','Coupe','Convertible','Wagon','Pickup Truck','MPV','Sports Car','Luxury Car','Roadster','Microcar','Supercar','Hyper car','Compact Car',' Subcompact Car','Cabriolet','Muscle Car','Coupé SUV','Targa','Crossover Coupe') NOT NULL,
  `Series` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bismillah`
--

INSERT INTO `bismillah` (`Brand`, `Type`, `Class`, `Series`) VALUES
('Honda', 'NSX', 'Sports Car', 'NA1'),
('Mazda', 'Miata', 'Sports Car', 'NA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bismillah`
--
ALTER TABLE `bismillah`
  ADD PRIMARY KEY (`Brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
