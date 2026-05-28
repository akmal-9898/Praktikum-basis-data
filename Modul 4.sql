-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2026 at 04:04 AM
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
-- Database: `mglcom`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `category`, `price`) VALUES
(12150501, 'Nvidia GeForce RTX 5050', 'GPU', 249.000),
(12150601, 'Nvidia GeForce RTX 5060 Ti', 'GPU', 379.000),
(12150602, 'Nvidia GeForce RTX 5060', 'GPU', 299.000),
(12150701, 'Nvidia GeForce RTX 5070 Ti', 'GPU', 749.000),
(12150702, 'Nvidia GeForce RTX 5070', 'GPU', 549.000),
(12150801, 'Nvidia GeForce RTX 5080', 'GPU', 999.000),
(12150901, 'Nvidia GeForce RTX 5090', 'GPU', 1999.000),
(12276001, 'AMD RX 7600', 'GPU', 419.000),
(12278001, 'AMD RX 7800XT', 'GPU', 688.000),
(12279001, 'AMD RX 7900XTX', 'GPU', 1329.000),
(12290601, 'AMD RX 9060XT', 'GPU', 669.000),
(12290701, 'AMD RX 9070XT', 'GPU', 959.000),
(12290702, 'AMD RX 9070', 'GPU', 860.000),
(1117147001, 'Intel® Core™ i7 processor 14700', 'CPU', 394.000),
(1117147002, 'Intel® Core™ i7 processor 14700F', 'CPU', 369.000),
(1117147003, 'Intel® Core™ i7 processor 14700T', 'CPU', 384.000),
(1117147004, 'Intel® Core™ i7 processor 14700K', 'CPU', 419.000),
(1117147005, 'Intel® Core™ i7 processor 14700KF', 'CPU', 394.000),
(1119149001, 'Intel® Core™ i9 processor 14900KS', 'CPU', 699.000),
(1119149002, 'Intel® Core™ i9 processor 14901E', 'CPU', 557.000),
(1119149003, 'Intel® Core™ i9 processor 14901TE', 'CPU', 557.000),
(1119149004, 'Intel® Core™ i9 processor 14900', 'CPU', 579.000),
(1119149005, 'Intel® Core™ i9 processor 14900F', 'CPU', 554.000),
(1119149006, 'Intel® Core™ i9 processor 14900T', 'CPU', 549.000),
(1119149007, 'Intel® Core™ i9 processor 14900KF', 'CPU', 574.000),
(1119149008, 'Intel® Core™ i9 processor 14900K', 'CPU', 599.000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1119149015;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
