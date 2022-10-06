-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2021 at 05:52 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matrimonialdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `basic_detail`
--

CREATE TABLE `basic_detail` (
  `email_id` varchar(252) NOT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `religion` varchar(252) DEFAULT NULL,
  `caste` varchar(252) DEFAULT NULL,
  `height` double(3,2) DEFAULT NULL,
  `mother_tongue` varchar(252) DEFAULT NULL,
  `martial_status` varchar(252) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `annual_income` bigint(20) DEFAULT NULL,
  `address` varchar(252) DEFAULT NULL,
  `about_me` varchar(252) DEFAULT NULL,
  `degree` varchar(90) DEFAULT NULL,
  `occupation` varchar(90) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `basic_detail`
--

INSERT INTO `basic_detail` (`email_id`, `age`, `religion`, `caste`, `height`, `mother_tongue`, `martial_status`, `country`, `annual_income`, `address`, `about_me`, `degree`, `occupation`, `photo`, `name`, `gender`) VALUES
('amit@gmail.com', 34, NULL, '', 1.43, '', 'Awaiting Divorced', NULL, 0, '', '', '', '', '1635783638720.jpg', 'amit', 'Male'),
('kareena@gmail.com', 34, 'Secular', 'rajput', 1.50, 'hindi', 'Divorced', 'Anguilla', 56000, 'fwgsd', 'jhbajshdjasj', 'btech', ' Arts, Design, Entertainment, Sports, and Media Occupations', '1635971231734.png', 'kareena', 'Female'),
('krishna@gmail.com', 0, 'Baha\'i', '', 0.00, '', 'Awaiting Divorced', NULL, 0, '', '', '', '', NULL, 'krishna', 'Male'),
('kushal@gmail.com', 22, 'hindu', 'rajput', 1.33, 'hindi/telugu', 'Never Married', 'United States of America', 10000000, 'chandrapur', 'hi i am kushal a human who loves to travel and love to code .I love to eat and workout basically  i am a fitness freak', 'btech', 'sde', '1635680564786.jpg', 'kushal', 'Male'),
('utkarsh@gmail.com', 45, 'Rastafarianism', 'rajput', 1.44, 'hindi', 'Divorced', 'Bahrain', 9223372036854775807, 'mars', 'i am an idiot', 'mba', 'Chief Executive', '1636623606937.jpg', 'utkarsh', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `desired_partner`
--

CREATE TABLE `desired_partner` (
  `email_id` varchar(252) DEFAULT NULL,
  `gender` varchar(90) DEFAULT NULL,
  `min_age` tinyint(4) DEFAULT NULL,
  `max_age` tinyint(4) DEFAULT NULL,
  `religion` varchar(900) DEFAULT NULL,
  `caste` varchar(900) DEFAULT NULL,
  `min_height` double(3,2) DEFAULT NULL,
  `max_height` double(3,2) DEFAULT NULL,
  `occupation` varchar(252) DEFAULT NULL,
  `mother_tongue` varchar(900) DEFAULT NULL,
  `martial_status` varchar(90) DEFAULT NULL,
  `country` varchar(270) DEFAULT NULL,
  `annual_income` bigint(20) DEFAULT NULL,
  `dp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `desired_partner`
--

INSERT INTO `desired_partner` (`email_id`, `gender`, `min_age`, `max_age`, `religion`, `caste`, `min_height`, `max_height`, `occupation`, `mother_tongue`, `martial_status`, `country`, `annual_income`, `dp_id`) VALUES
('kushal@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
('amit@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
('krishna@gmail.com', NULL, 0, 0, NULL, '', 0.00, 0.00, 'Occupational and Physical Therapist Assistant or Aide', '', NULL, NULL, 0, 14),
('kareena@gmail.com', 'Male', 25, 57, 'Nonreligious', 'hindu', 1.66, 1.78, 'Occupational and Physical Therapist Assistant or Aide', 'hindi', 'Awaiting Divorce', 'Belgium', 9223372036854775807, 15),
('utkarsh@gmail.com', 'Male', 20, 45, 'Rastafarianism', 'rajput', 1.43, 2.13, 'Health Technologist or Technician', '', 'Divorced', 'Bahrain', 199999999999, 16);

-- --------------------------------------------------------

--
-- Table structure for table `registered_user`
--

CREATE TABLE `registered_user` (
  `email_id` varchar(252) NOT NULL,
  `phone_no` char(10) NOT NULL,
  `gender` varchar(90) NOT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(252) DEFAULT NULL,
  `name` varchar(252) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registered_user`
--

INSERT INTO `registered_user` (`email_id`, `phone_no`, `gender`, `date_of_birth`, `password`, `name`) VALUES
('amit@gmail.com', '23457575we', 'Male', '2021-12-03', '$2a$08$GEyoPvIhqx0lTcl2xSZZQ.pmHjlHsgutvJeCh3tBcC9Ykpj8M.UZK', 'amit'),
('kareena@gmail.com', '1234554321', 'Female', '2021-11-14', '$2a$08$kgMmoDQm5wugyNDgPVov7.47gnetZjidNF0vz.2vl7YrD6JTrI9C2', 'kareena'),
('krishna@gmail.com', '1234554321', 'Male', '2021-11-07', '$2a$08$mqfhwr09j29GUR.WI9b81eD/UxxcXmBCymAkd1BsenVlOXc4n0q7C', 'krishna'),
('kushal@gmail.com', '9828294241', 'Male', '2001-10-22', '$2a$08$KOXg3voeaGrJqicAULqJPeb8JjwrOWFSfSKnvTDkpktLpWJ.vUeWS', 'kushal'),
('utkarsh@gmail.com', '1234554321', 'Other', '2021-11-25', '$2a$08$WfK0M2gjWrWkYtA1W41oBu7bfrF.585GprBOon8ojDFodkbde.3VO', 'utkarsh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basic_detail`
--
ALTER TABLE `basic_detail`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `desired_partner`
--
ALTER TABLE `desired_partner`
  ADD PRIMARY KEY (`dp_id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `registered_user`
--
ALTER TABLE `registered_user`
  ADD PRIMARY KEY (`email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `desired_partner`
--
ALTER TABLE `desired_partner`
  MODIFY `dp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basic_detail`
--
ALTER TABLE `basic_detail`
  ADD CONSTRAINT `basic_detail_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `registered_user` (`email_id`);

--
-- Constraints for table `desired_partner`
--
ALTER TABLE `desired_partner`
  ADD CONSTRAINT `desired_partner_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `registered_user` (`email_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
