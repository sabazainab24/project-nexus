-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 06:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rcee`
--

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `sid` int(11) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`sid`, `sname`, `email`, `password`) VALUES
(13, 'aaaa', 'Akhila', 'a'),
(14, 'sadasd', 'asdasd', 'sdasd'),
(15, 'sdfdsfs', 'aadsfaf', 'dfdsfs'),
(17, 'aaaaaaaaaaaaa', 'aaaaaaaaaa', 'zzzzzzzzzzz'),
(18, 'sdasds', 'asdasd', 'sdsad'),
(19, 'vijay', 'v', 'v1'),
(20, 'sdsdsdsdsdsdsds', 'sdasdasdaasdas', 'asdasdasdas'),
(21, 'vijay', 'v', 'v1'),
(22, 'dgdfgdfg', 'sdfsdfs', 'dfsdfds'),
(23, 'v', 'v', 'v'),
(24, 'saniya', 'saniya', 'snaiya'),
(25, 'k2', 'k2', 'k2'),
(26, 'k2', 'k2', 'k2asasa'),
(27, 'k2', 'k2', 'k2asasas'),
(28, 'Akhila', 'Akhila', '123'),
(34, 'Akhila', 'Akhila', '1234'),
(35, 'A', 'A@gmail.com', '123'),
(36, 'Anusha', 'Anusha@gmail.com', '123'),
(37, 'Anu', 'anu@gmail.com', '1234'),
(38, 'Sai', 'Sai@gmail.com', '987');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
