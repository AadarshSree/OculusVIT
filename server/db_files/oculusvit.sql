-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2020 at 09:53 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oculusvit`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(100) NOT NULL,
  `qid` text COLLATE utf8_unicode_ci NOT NULL,
  `ansid` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `qid`, `ansid`) VALUES
(4, '5f6b70a3eb77c', '5f6b70a3ec2f8'),
(5, '5f6b70a3eebd8', '5f6b70a3ef499'),
(11, '5f6cb03183a0a', '5f6cb03187e6e'),
(12, '5f6cb03195502', '5f6cb03196f8e'),
(15, '5f97c38421271', '5f97c38428131');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `fid` int(11) NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`fid`, `username`, `password`, `email`, `name`) VALUES
(1, 'master', '123', 'email@email.com', 'godmode'),
(2, 'aadarsh', '123', 'aadarsh.sreekumar2018@vitstudent.ac.in', 'Aadarsh Sreekumar'),
(3, 'vitvit', '123', 'vit@vit.com', 'vitvit'),
(4, 'asswin', '123', 'sucks@mail.com', 'ashwin');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `feedback` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(100) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `eid` text COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timestamp` bigint(50) NOT NULL,
  `status` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `score_updated` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `username`, `eid`, `score`, `level`, `correct`, `wrong`, `date`, `timestamp`, `status`, `score_updated`) VALUES
(2, 'master', '5f6b708c33a70', 0, 0, 0, 0, '2020-09-23 18:03:08', 1600879301, 'finished', 'true'),
(6, 'aada', '5f6cb01764f77', -2, 2, 0, 2, '2020-09-24 14:42:50', 1600958539, 'finished', 'true'),
(8, 'aada', '5f6b708c33a70', 0, 1, 0, 0, '2020-10-27 06:49:42', 1603703549, 'finished', 'true'),
(9, 'aada', '5f97c3363b024', 0, 0, 0, 0, '2020-10-27 07:31:00', 1603783736, 'finished', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(100) NOT NULL,
  `qid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `option` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `optionid` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `qid`, `option`, `optionid`) VALUES
(13, '5f6b70a3eb77c', 'a', '5f6b70a3ec2f4'),
(14, '5f6b70a3eb77c', 'bb', '5f6b70a3ec2f9'),
(15, '5f6b70a3eb77c', 'ccc', '5f6b70a3ec2f8'),
(16, '5f6b70a3eb77c', 'ddd', '5f6b70a3ec2ff'),
(17, '5f6b70a3eebd8', 'r', '5f6b70a3ef497'),
(18, '5f6b70a3eebd8', 'u', '5f6b70a3ef498'),
(19, '5f6b70a3eebd8', 'g', '5f6b70a3ef499'),
(20, '5f6b70a3eebd8', 'e', '5f6b70a3ef49a'),
(41, '5f6cb03183a0a', 'a', '5f6cb03187e6e'),
(42, '5f6cb03183a0a', 'b', '5f6cb0318ac5a'),
(43, '5f6cb03183a0a', 'c', '5f6cb0318eac6'),
(44, '5f6cb03183a0a', 'd', '5f6cb03192595'),
(45, '5f6cb03195502', '2', '5f6cb03196f8e'),
(46, '5f6cb03195502', '3', '5f6cb0319a2e2'),
(47, '5f6cb03195502', '4', '5f6cb0319dcc3'),
(48, '5f6cb03195502', '1', '5f6cb031a1794'),
(57, '5f97c38421271', 'Personal Home Page', '5f97c38424f7c'),
(58, '5f97c38421271', 'Hypertext PreProcessor', '5f97c38428131'),
(59, '5f97c38421271', 'Perl Haskell Programming', '5f97c3842bfef'),
(60, '5f97c38421271', 'None of the Above', '5f97c3842fd5c');

-- --------------------------------------------------------

--
-- Table structure for table `otp_fac`
--

CREATE TABLE `otp_fac` (
  `id` int(11) NOT NULL,
  `otp` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp_fac`
--

INSERT INTO `otp_fac` (`id`, `otp`, `timestamp`) VALUES
(2, '3', '2020-10-20 18:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `otp_student`
--

CREATE TABLE `otp_student` (
  `id` int(11) NOT NULL,
  `otp` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp_student`
--

INSERT INTO `otp_student` (`id`, `otp`, `timestamp`) VALUES
(5, '300544', '2020-10-27 07:11:12'),
(4, '836875', '2020-10-27 07:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(100) NOT NULL,
  `eid` text COLLATE utf8_unicode_ci NOT NULL,
  `qid` text COLLATE utf8_unicode_ci NOT NULL,
  `qns` text COLLATE utf8_unicode_ci NOT NULL,
  `choice` int(10) NOT NULL,
  `sn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `eid`, `qid`, `qns`, `choice`, `sn`) VALUES
(4, '5f6b708c33a70', '5f6b70a3eb77c', 'Who are you', 4, 1),
(5, '5f6b708c33a70', '5f6b70a3eebd8', 'y', 4, 2),
(11, '5f6cb01764f77', '5f6cb03183a0a', 'Hello', 4, 1),
(12, '5f6cb01764f77', '5f6cb03195502', 'H', 4, 2),
(15, '5f97c3363b024', '5f97c38421271', 'What does PHP Stand for ?', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `eid` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(16) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `eid`, `title`, `correct`, `wrong`, `total`, `time`, `date`, `status`) VALUES
(4, '5f6b708c33a70', 'Qt22', 1, 0, 2, 500, '2020-10-27 06:49:42', 'disabled'),
(7, '5f6cb01764f77', 'Java Quiz', 2, 1, 2, 5, '2020-10-27 06:49:46', 'disabled'),
(9, '5f97c3363b024', 'Iwp Review 3', 5, 1, 1, 15, '2020-10-27 07:28:35', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE `rank` (
  `id` int(100) NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`id`, `username`, `score`, `time`) VALUES
(1, 'master', -2, '2020-10-27 06:49:42'),
(2, 'roger', 4, '2020-09-24 10:21:17'),
(3, 'aada', -2, '2020-10-27 07:31:00'),
(4, 'hci', 0, '2020-10-12 04:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `sid` int(11) NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `regNum` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`sid`, `username`, `password`, `regNum`, `email`, `name`) VALUES
(1, 'master', '123', '18bce', 'emass', 'master'),
(2, 'roger', '123', '18pce', 'roger@rmli.cc', 'roger'),
(4, 'aada', '123', '18bbc', 'chichusr@gmail.com', 'Aadarh'),
(5, 'hci', '123', '19bce', 'azrael@walmartnet.com', 'hci'),
(6, 'lookla', '123', '18bce2', 'oola@lol.cc', 'Demon');

-- --------------------------------------------------------

--
-- Table structure for table `user_answer`
--

CREATE TABLE `user_answer` (
  `id` int(100) NOT NULL,
  `qid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ans` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `correctans` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `eid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_answer`
--

INSERT INTO `user_answer` (`id`, `qid`, `ans`, `correctans`, `eid`, `username`) VALUES
(2, '5f6b87a445cbf', '5f6b87a449ff4', '5f6b87a449ff4', '5f6b8784b14f8', 'roger'),
(3, '5f6b87a4573a1', '5f6b87a45c9b0', '5f6b87a45c9b0', '5f6b8784b14f8', 'roger'),
(4, '5f6b87a466cdd', '5f6b87a46fa75', '5f6b87a46fa75', '5f6b8784b14f8', 'roger'),
(5, '5f6c72c78986e', '5f6c72c797340', '5f6c72c78f69e', '5f6c72b279f43', 'roger'),
(6, '5f6c72c799a77', '5f6c72c79b8c2', '5f6c72c7a2a6d', '5f6c72b279f43', 'roger'),
(7, '5f6cb03183a0a', '5f6cb0318ac5a', '5f6cb03187e6e', '5f6cb01764f77', 'aada'),
(8, '5f6cb03195502', '5f6cb0319dcc3', '5f6cb03196f8e', '5f6cb01764f77', 'aada'),
(9, '5f83ddde6fc9c', '5f83ddde725ef', '5f83ddde75b22', '5f83ddba06694', 'hci'),
(10, '5f83ddde80090', '5f83ddde84d28', '5f83ddde81b39', '5f83ddba06694', 'hci');

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `vid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `eid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`vid`, `sid`, `username`, `eid`, `time`) VALUES
(1, 4, 'aada', '42', '2020-10-25 14:09:17'),
(2, 3, 'Rando', '42', '2020-10-25 15:09:20'),
(3, 5, 'HCI', '42', '2020-10-25 15:09:22'),
(4, 4, 'aada', '5f6b708c33a70', '2020-10-25 15:31:13'),
(5, 4, 'aada', '5f6b708c33a70', '2020-10-25 15:31:22'),
(6, 4, 'aada', '5f6b708c33a70', '2020-10-25 15:33:23'),
(7, 4, 'aada', '5f6b708c33a70', '2020-10-25 15:33:32'),
(8, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:16:48'),
(9, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:23:26'),
(10, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:24:08'),
(11, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:24:35'),
(12, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:25:10'),
(13, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:25:19'),
(14, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:25:52'),
(15, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:26:02'),
(16, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:28:59'),
(17, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:29:42'),
(18, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:30:41'),
(19, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:31:44'),
(20, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:33:17'),
(21, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:36:37'),
(22, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:37:25'),
(23, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:38:00'),
(24, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:46:26'),
(25, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:46:53'),
(26, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:47:41'),
(27, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:49:16'),
(28, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:49:51'),
(29, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:52:26'),
(30, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:52:42'),
(31, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:53:03'),
(32, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:53:16'),
(33, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:53:33'),
(34, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:55:57'),
(35, 4, 'aada', '5f6b708c33a70', '2020-10-26 09:56:09'),
(36, 4, 'aada', '5f97c3363b024', '2020-10-27 07:29:23'),
(37, 4, 'aada', '5f97c3363b024', '2020-10-27 07:30:18'),
(38, 4, 'aada', '5f97c3363b024', '2020-10-27 07:30:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`fid`),
  ADD UNIQUE KEY `username_unique` (`username`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `uname_unique` (`username`);

--
-- Indexes for table `user_answer`
--
ALTER TABLE `user_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rank`
--
ALTER TABLE `rank`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_answer`
--
ALTER TABLE `user_answer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
