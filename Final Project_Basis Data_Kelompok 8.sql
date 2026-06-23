-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2026 at 02:32 AM
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
-- Database: `final_project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PeminjamanAktif` (IN `p_id_anggota` VARCHAR(5))   BEGIN SELECT
p.ID_Pinjam, p.Tgl_Pinjam, p.Tgl_Kembali,
b.Judul, b.Pengarang
FROM Peminjaman p
JOIN Detail_Peminjaman dp ON p.ID_Pinjam = dp.ID_Pinjam
JOIN Buku b ON dp.ID_Buku  = b.ID_Buku
WHERE p.ID_Anggota = p_id_anggota
AND p.Status = 'Dipinjam';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_Anggota` varchar(5) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Alamat` varchar(200) NOT NULL,
  `No_Telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_Anggota`, `Nama`, `Alamat`, `No_Telp`) VALUES
('A01', 'Azizi', 'Magelang', '085678901234'),
('A02', 'Adnan', 'Klaten', '086789012345'),
('A03', 'Akmal', 'Secang', '087890123456'),
('A04', 'Dimas', 'Secang', '088901234567');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `ID_Buku` varchar(5) NOT NULL,
  `Judul` varchar(200) NOT NULL,
  `Pengarang` varchar(100) NOT NULL,
  `Stok` int(11) NOT NULL DEFAULT 1 CHECK (`Stok` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`ID_Buku`, `Judul`, `Pengarang`, `Stok`) VALUES
('B01', 'Laskar Pelangi', 'Andrea Hirata', 3),
('B02', 'Bumi', 'Tere Liye', 2),
('B03', 'Pulang', 'Tere Liye', 3),
('B04', 'Negeri 5 Menara', 'A. Fuadi', 2),
('B05', 'Kisah Tanah Jawa', 'Bonaventura D Genta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `ID_Pinjam` varchar(5) NOT NULL,
  `ID_Buku` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`ID_Pinjam`, `ID_Buku`) VALUES
('P001', 'B01'),
('P001', 'B02'),
('P002', 'B03'),
('P003', 'B04'),
('P004', 'B01'),
('P004', 'B05'),
('P005', 'B02');

-- --------------------------------------------------------

--
-- Table structure for table `log_peminjaman`
--

CREATE TABLE `log_peminjaman` (
  `ID_Log` int(11) NOT NULL,
  `ID_Pinjam` varchar(5) NOT NULL,
  `Aksi` varchar(50) NOT NULL,
  `Waktu` datetime NOT NULL DEFAULT current_timestamp(),
  `Keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_peminjaman`
--

INSERT INTO `log_peminjaman` (`ID_Log`, `ID_Pinjam`, `Aksi`, `Waktu`, `Keterangan`) VALUES
(1, 'P003', 'UPDATE STATUS', '2026-06-10 07:29:24', 'Status berubah dari [Dipinjam] menjadi [Terlambat]');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_Pinjam` varchar(5) NOT NULL,
  `Tgl_Pinjam` date NOT NULL,
  `Tgl_Kembali` date NOT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'Dipinjam',
  `ID_Anggota` varchar(5) NOT NULL,
  `ID_Petugas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`ID_Pinjam`, `Tgl_Pinjam`, `Tgl_Kembali`, `Status`, `ID_Anggota`, `ID_Petugas`) VALUES
('P001', '2026-05-10', '2026-05-17', 'Dikembalikan', 'A01', 'PT02'),
('P002', '2026-05-11', '2026-05-18', 'Dikembalikan', 'A02', 'PT02'),
('P003', '2026-05-12', '2026-05-19', 'Terlambat', 'A01', 'PT03'),
('P004', '2026-05-13', '2026-05-20', 'Dipinjam', 'A03', 'PT02'),
('P005', '2026-05-14', '2026-05-21', 'Dikembalikan', 'A04', 'PT03');

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `TRG_StatusPeminjaman` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN IF OLD.Status <> NEW.Status THEN
INSERT INTO Log_Peminjaman (ID_Pinjam, Aksi, Keterangan)
VALUES (
NEW.ID_Pinjam,
'UPDATE STATUS',
CONCAT('Status berubah dari [', OLD.Status, '] menjadi [', NEW.Status, ']')
);
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `ID_Petugas` varchar(5) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Jabatan` varchar(50) NOT NULL,
  `No_Telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`ID_Petugas`, `Nama`, `Jabatan`, `No_Telp`) VALUES
('PT01', 'Windah', 'Kepala Perpustakaan', '081234567890'),
('PT02', 'Dean', 'Staf Pelayanan', '082345678901'),
('PT03', 'Reza', 'Staf Pelayanan', '083456789012');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_peminjaman`
-- (See below for the actual view)
--
CREATE TABLE `v_detail_peminjaman` (
`ID_Pinjam` varchar(5)
,`Tgl_Pinjam` date
,`Tgl_Kembali` date
,`Status` varchar(20)
,`Nama_Anggota` varchar(100)
,`Alamat` varchar(200)
,`Nama_Petugas` varchar(100)
,`Judul_Buku` varchar(200)
,`Pengarang` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `v_detail_peminjaman`
--
DROP TABLE IF EXISTS `v_detail_peminjaman`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_peminjaman`  AS SELECT `p`.`ID_Pinjam` AS `ID_Pinjam`, `p`.`Tgl_Pinjam` AS `Tgl_Pinjam`, `p`.`Tgl_Kembali` AS `Tgl_Kembali`, `p`.`Status` AS `Status`, `a`.`Nama` AS `Nama_Anggota`, `a`.`Alamat` AS `Alamat`, `pt`.`Nama` AS `Nama_Petugas`, `b`.`Judul` AS `Judul_Buku`, `b`.`Pengarang` AS `Pengarang` FROM ((((`peminjaman` `p` join `anggota` `a` on(`p`.`ID_Anggota` = `a`.`ID_Anggota`)) join `petugas` `pt` on(`p`.`ID_Petugas` = `pt`.`ID_Petugas`)) join `detail_peminjaman` `dp` on(`p`.`ID_Pinjam` = `dp`.`ID_Pinjam`)) join `buku` `b` on(`dp`.`ID_Buku` = `b`.`ID_Buku`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_Anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_Buku`),
  ADD KEY `IDX_Buku_Judul` (`Judul`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`ID_Pinjam`,`ID_Buku`),
  ADD KEY `FK_Det_Buku` (`ID_Buku`);

--
-- Indexes for table `log_peminjaman`
--
ALTER TABLE `log_peminjaman`
  ADD PRIMARY KEY (`ID_Log`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_Pinjam`),
  ADD KEY `FK_Pmj_Petugas` (`ID_Petugas`),
  ADD KEY `IDX_Pmj_Anggota` (`ID_Anggota`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`ID_Petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_peminjaman`
--
ALTER TABLE `log_peminjaman`
  MODIFY `ID_Log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `FK_Det_Buku` FOREIGN KEY (`ID_Buku`) REFERENCES `buku` (`ID_Buku`),
  ADD CONSTRAINT `FK_Det_Pinjam` FOREIGN KEY (`ID_Pinjam`) REFERENCES `peminjaman` (`ID_Pinjam`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `FK_Pmj_Anggota` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`),
  ADD CONSTRAINT `FK_Pmj_Petugas` FOREIGN KEY (`ID_Petugas`) REFERENCES `petugas` (`ID_Petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
