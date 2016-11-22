-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2016 at 11:26 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tbr`
--

-- --------------------------------------------------------

--
-- Table structure for table `comp`
--

CREATE TABLE `comp` (
  `id` int(11) NOT NULL,
  `games_id` int(11) NOT NULL,
  `compDate` date NOT NULL,
  `description` text,
  `prize` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comp`
--

INSERT INTO `comp` (`id`, `games_id`, `compDate`, `description`, `prize`) VALUES
(1, 1, '2020-01-21', 'Bob vs the World 2020 championship', 'Bobzor mouse, sorround sound screamo and a cent.');

-- --------------------------------------------------------

--
-- Table structure for table `comp_teams`
--

CREATE TABLE `comp_teams` (
  `id` int(11) NOT NULL,
  `comp_id` int(11) DEFAULT NULL,
  `teams_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `maxPlayer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `maxPlayer`) VALUES
(1, 'Bob : GO', '5');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `teamname` varchar(255) NOT NULL,
  `teamtag` char(3) NOT NULL,
  `description` text,
  `imgLink` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `teamname`, `teamtag`, `description`, `imgLink`) VALUES
(3, 'BobInPajamas', 'BIJ', 'We are bob', 'http://i.imgur.com/DoXLf7v.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `teams_user`
--

CREATE TABLE `teams_user` (
  `id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(14) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `imgLink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `password`, `email`, `isAdmin`, `imgLink`) VALUES
(1, 'Bob', 'Bob Bob', 'password', 'bob@bobmail.com', 1, 'http://i.imgur.com/ZYzQKIR.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comp`
--
ALTER TABLE `comp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_id` (`games_id`);

--
-- Indexes for table `comp_teams`
--
ALTER TABLE `comp_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_id` (`teams_id`),
  ADD KEY `comp_id` (`comp_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teamname` (`teamname`),
  ADD UNIQUE KEY `teamtag` (`teamtag`);

--
-- Indexes for table `teams_user`
--
ALTER TABLE `teams_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comp`
--
ALTER TABLE `comp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comp_teams`
--
ALTER TABLE `comp_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `teams_user`
--
ALTER TABLE `teams_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comp`
--
ALTER TABLE `comp`
  ADD CONSTRAINT `comp_ibfk_1` FOREIGN KEY (`games_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `comp_teams`
--
ALTER TABLE `comp_teams`
  ADD CONSTRAINT `comp_teams_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `comp` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_teams_ibfk_2` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `teams_user`
--
ALTER TABLE `teams_user`
  ADD CONSTRAINT `teams_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `teams_user_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
