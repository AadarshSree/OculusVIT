-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2020 at 08:38 PM
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
(6, '5f6b87a445cbf', '5f6b87a449ff4'),
(7, '5f6b87a4573a1', '5f6b87a45c9b0'),
(8, '5f6b87a466cdd', '5f6b87a46fa75');

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
(3, 'vitvit', '123', 'vit@vit.com', 'vitvit');

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
(4, 'roger', '5f6b8784b14f8', 6, 3, 3, 0, '2020-09-23 17:40:49', 1600882674, 'finished', 'true');

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
(21, '5f6b87a445cbf', '1', '5f6b87a449ff4'),
(22, '5f6b87a445cbf', '2', '5f6b87a44d73f'),
(23, '5f6b87a445cbf', '3', '5f6b87a4515d5'),
(24, '5f6b87a445cbf', '4', '5f6b87a455067'),
(25, '5f6b87a4573a1', '2', '5f6b87a459770'),
(26, '5f6b87a4573a1', '3', '5f6b87a45c9b0'),
(27, '5f6b87a4573a1', '4', '5f6b87a46083c'),
(28, '5f6b87a4573a1', '5', '5f6b87a4646fb'),
(29, '5f6b87a466cdd', '1', '5f6b87a468d22'),
(30, '5f6b87a466cdd', '2', '5f6b87a46bf92'),
(31, '5f6b87a466cdd', '3', '5f6b87a46fa75'),
(32, '5f6b87a466cdd', '4', '5f6b87a4734dc');

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
(6, '5f6b8784b14f8', '5f6b87a445cbf', 'no', 4, 1),
(7, '5f6b8784b14f8', '5f6b87a4573a1', '2', 4, 2),
(8, '5f6b8784b14f8', '5f6b87a466cdd', 'ok', 4, 3);

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
(4, '5f6b708c33a70', 'Qt22', 1, 0, 2, 500, '2020-09-23 18:03:08', 'disabled'),
(5, '5f6b8784b14f8', 'Real', 2, 1, 3, 5, '2020-09-23 17:37:19', 'enabled');

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
(1, 'master', 0, '2020-09-23 18:03:08'),
(2, 'roger', 6, '2020-09-23 17:40:49');

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
(2, 'roger', '123', '18pce', 'roger@rmli.cc', 'roger');

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
(4, '5f6b87a466cdd', '5f6b87a46fa75', '5f6b87a46fa75', '5f6b8784b14f8', 'roger');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rank`
--
ALTER TABLE `rank`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_answer`
--
ALTER TABLE `user_answer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
