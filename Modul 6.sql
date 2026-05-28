-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2026 at 10:53 AM
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
-- Database: `pertemuan_10`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `nim` int(3) NOT NULL,
  `kd_mk` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambil_mk`
--

INSERT INTO `ambil_mk` (`nim`, `kd_mk`) VALUES
(101, 'PTI447'),
(103, 'TIK333'),
(104, 'PTI333'),
(104, 'PTI777'),
(105, 'PTI123'),
(107, 'PTI777');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(3) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('laki laki','perempuan') NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jenis_kelamin`, `alamat`) VALUES
(101, 'Arif', 'laki laki', 'Jl. Kenangan'),
(102, 'Budi', 'laki laki', 'Jl. Jombang'),
(103, 'Wati', 'perempuan', 'Jl. Surabaya'),
(104, 'Ika', 'perempuan', 'Jl. Jombang'),
(105, 'Tono', 'laki laki', 'Jl. Jakarta'),
(106, 'Iwan', 'laki laki', 'Jl. Bandung'),
(107, 'Sari', 'perempuan', 'Jl. Malang');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kd_mk` varchar(6) NOT NULL,
  `nama_mk` varchar(255) DEFAULT NULL,
  `sks` int(1) NOT NULL,
  `semester` int(1) NOT NULL,
  `kode_dos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kd_mk`, `nama_mk`, `sks`, `semester`, `kode_dos`) VALUES
('PTI123', 'grafika multimedia', 3, 5, 12),
('PTI333', 'basis data terdistribusi', 3, 5, 10),
('PTI447', 'praktikum basis data', 1, 3, 11),
('PTI777', 'sistem informasi', 2, 3, 99),
('TIK123', 'jaringan komputer', 2, 5, 33),
('TIK333', 'sistem operasi', 3, 5, 10),
('TIK352', 'praktikum basis data', 1, 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_dosen`
--

CREATE TABLE `tabel_dosen` (
  `kode_dos` int(2) NOT NULL,
  `nama_dos` varchar(30) NOT NULL,
  `alamat_dos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_dosen`
--

INSERT INTO `tabel_dosen` (`kode_dos`, `nama_dos`, `alamat_dos`) VALUES
(10, 'Suharto', 'Jl. Jombang'),
(11, 'Martono', 'Jl. Kalpataru'),
(12, 'Rahmawati', 'Jl. Jakarta'),
(13, 'Bambang', 'Jl. Bandung'),
(14, 'Nurul', 'Jl. Raya Tidar');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_jurusan`
--

CREATE TABLE `tabel_jurusan` (
  `kode_jur` varchar(2) NOT NULL,
  `nama_jur` varchar(20) NOT NULL,
  `kode_dos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_jurusan`
--

INSERT INTO `tabel_jurusan` (`kode_jur`, `nama_jur`, `kode_dos`) VALUES
('TE', 'teknik elektro', 10),
('TM', 'teknik mesin', 13),
('TS', 'teknik sipil', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD KEY `nim` (`nim`),
  ADD KEY `kd_mk` (`kd_mk`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kd_mk`),
  ADD KEY `kode_dos` (`kode_dos`);

--
-- Indexes for table `tabel_dosen`
--
ALTER TABLE `tabel_dosen`
  ADD PRIMARY KEY (`kode_dos`);

--
-- Indexes for table `tabel_jurusan`
--
ALTER TABLE `tabel_jurusan`
  ADD PRIMARY KEY (`kode_jur`),
  ADD KEY `kode_dos` (`kode_dos`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD CONSTRAINT `ambil_mk_ibfk_1` FOREIGN KEY (`kd_mk`) REFERENCES `mata_kuliah` (`kd_mk`),
  ADD CONSTRAINT `ambil_mk_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`kode_dos`) REFERENCES `tabel_dosen` (`kode_dos`);

--
-- Constraints for table `tabel_jurusan`
--
ALTER TABLE `tabel_jurusan`
  ADD CONSTRAINT `tabel_jurusan_ibfk_1` FOREIGN KEY (`kode_dos`) REFERENCES `tabel_dosen` (`kode_dos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
