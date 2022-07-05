-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2022 at 08:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orang`
--

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `id_parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keluarga`
--

INSERT INTO `keluarga` (`id`, `nama`, `jenis_kelamin`, `id_parent`) VALUES
(1, 'Budi', 'laki-laki', NULL),
(2, 'Dedi', 'laki-laki', 1),
(3, 'Dodi', 'laki-laki', 1),
(4, 'Dede', 'laki-laki', 1),
(5, 'Dewi', 'perempuan', 1),
(6, 'Feri', 'laki-laki', 2),
(7, 'Farah', 'perempuan', 2),
(8, 'Gugus', 'laki-laki', 3),
(9, 'Gandi', 'laki-laki', 3),
(10, 'Hani', 'perempuan', 4),
(11, 'Hana', 'perempuan', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_parent_id` (`id_parent`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keluarga`
--
ALTER TABLE `keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD CONSTRAINT `fk_id_parent_id` FOREIGN KEY (`id_parent`) REFERENCES `keluarga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
