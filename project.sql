-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 27, 2024 at 12:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodemysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ProjectID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Phase` enum('Onboarding','Initiation','Execution','Closed') NOT NULL,
  `Recruiting` varchar(256) DEFAULT NULL,
  `Details` text NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `RolesAvailable` varchar(255) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastActive` datetime NOT NULL DEFAULT current_timestamp(),
  `Views` int(11) DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  `ProjectPrivateMode` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectID`, `UserID`, `Title`, `Phase`, `Recruiting`, `Details`, `Category`, `Image`, `RolesAvailable`, `CreationDate`, `LastActive`, `Views`, `Likes`, `ProjectPrivateMode`) VALUES
(41, 1, 'Mobile App', 'Onboarding', 'Open', 'This is a Mobile Application', 'Software Engineering', '/test.jpg', 'Developer', '2024-02-26 19:11:48', '2024-02-26 19:11:48', NULL, NULL, NULL),
(42, 2, 'Web Dev Project', 'Onboarding', 'Closed', 'A web development project', 'Web Development', '/web_project.jpg', 'Frontend, Backend', '2024-02-26 19:14:33', '2024-02-26 19:14:33', NULL, NULL, NULL),
(43, 3, 'Data Tool Project', 'Initiation', 'Open', 'Tool for data analysis', 'Data Science', '/data_tool.png', 'Data Scientist, UI/UX', '2024-02-26 19:14:33', '2024-02-26 19:14:33', NULL, NULL, NULL),
(44, 4, 'E-commerce App', 'Execution', 'Open', 'E-commerce application', 'E-commerce', '/ecommerce_app.jpg', 'UI/UX, Mobile Dev', '2024-02-26 19:14:33', '2024-02-26 19:14:33', NULL, NULL, NULL),
(45, 5, 'AI Chatbot', 'Closed', 'Open', 'AI-powered chatbot', 'AI', '/ai_chatbot.png', 'ML Engineer, Chatbot Dev', '2024-02-26 19:14:33', '2024-02-26 19:14:33', NULL, NULL, NULL),
(46, 6, 'Mobile Game Project', 'Onboarding', 'Open', 'Developing a mobile game', 'Game Development', '/mobile_game.jpg', 'Game Designer, Mobile Dev', '2024-02-26 19:48:34', '2024-02-26 19:48:34', NULL, NULL, NULL),
(47, 7, 'Social Media Analytics', 'Onboarding', 'Closed', 'Analytics tool for social media', 'Data Science', '/social_media_analytics.png', 'Data Scientist, Backend Dev', '2024-02-26 19:48:34', '2024-02-26 19:48:34', NULL, NULL, NULL),
(48, 8, 'Health and Fitness App', 'Onboarding', 'Open', 'App for health monitoring', 'Health & Fitness', '/health_app.jpg', 'Mobile Dev, UI/UX', '2024-02-26 19:48:34', '2024-02-26 19:48:34', NULL, NULL, NULL),
(49, 9, 'Blockchain Project', 'Onboarding', 'Open', 'Implementing blockchain technology', 'Blockchain', '/blockchain_project.png', 'Blockchain Developer, Frontend Dev', '2024-02-26 19:48:34', '2024-02-26 19:48:34', NULL, NULL, NULL),
(50, 10, 'Machine Learning Research', 'Onboarding', 'Closed', 'Research in machine learning', 'Research', '/ml_research.jpg', 'Researcher, ML Engineer', '2024-02-26 19:48:34', '2024-02-26 19:48:34', NULL, NULL, NULL),
(51, 11, 'E-learning Platform', 'Onboarding', 'Open', 'Platform for online learning', 'Education', '/elearning_platform.png', 'Full Stack Dev, UI/UX', '2024-02-26 19:48:34', '2024-02-26 19:48:34', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
