-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 01:46 PM
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
-- Table structure for table `certification`
--

CREATE TABLE `certification` (
  `CertificationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Datarange` varchar(255) DEFAULT NULL,
  `Company` varchar(255) DEFAULT NULL,
  `Certlink` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certification`
--

INSERT INTO `certification` (`CertificationID`, `UserID`, `Title`, `Datarange`, `Company`, `Certlink`) VALUES
(1, 6, 'Certification A', '2021-2022', 'TechCorp', 'https://certlink1.com'),
(2, 4, 'Certification B', '2022-2023', 'InnoTech', 'https://certlink2.com'),
(3, 9, 'Certification C', '2020-2021', 'DataSolutions', 'https://certlink3.com');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `EducationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `datarange` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`EducationID`, `UserID`, `Title`, `datarange`, `school`) VALUES
(6, 1, 'Bachelor of Science in Computer Science', '2017-2021', 'University A'),
(7, 2, 'Master of Business Administration', '2018-2020', 'University B'),
(8, 3, 'Bachelor of Arts in Economics', '2016-2020', 'University C');

-- --------------------------------------------------------

--
-- Table structure for table `educationtask`
--

CREATE TABLE `educationtask` (
  `EducationTaskID` int(11) NOT NULL,
  `EducationID` int(11) NOT NULL,
  `EducationTask` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `educationtask`
--

INSERT INTO `educationtask` (`EducationTaskID`, `EducationID`, `EducationTask`) VALUES
(2, 6, 'Complete coursework assignments'),
(3, 7, 'Research and write a thesis'),
(4, 8, 'Participate in extracurricular activities');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `ExperienceID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Datarange` varchar(255) DEFAULT NULL,
  `Company` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`ExperienceID`, `UserID`, `Title`, `Datarange`, `Company`) VALUES
(1, 1, 'Software Engineer', '2018-2022', 'Tech Solutions Inc.'),
(2, 2, 'Data Analyst', '2019-2021', 'Data Insights Co.'),
(3, 3, 'Product Manager', '2020-2023', 'Innovate Tech Ltd.');

-- --------------------------------------------------------

--
-- Table structure for table `experiencetask`
--

CREATE TABLE `experiencetask` (
  `ExperienceTaskID` int(11) NOT NULL,
  `ExperienceID` int(11) NOT NULL,
  `Experiencetask` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `experiencetask`
--

INSERT INTO `experiencetask` (`ExperienceTaskID`, `ExperienceID`, `Experiencetask`) VALUES
(1, 1, 'Lead a team in developing a new software product.'),
(2, 2, 'Conducted data analysis to derive meaningful insights for business decisions.'),
(3, 3, 'Managed the end-to-end product lifecycle, from concept to delivery.');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackID`, `Email`, `Subject`, `Comments`) VALUES
(1, 'Carlos_Reinger@gmail.com', 'Subject 1', 'Comments 1'),
(2, 'Myrtie30@hotmail.com', 'Subject 2', 'Comments 2'),
(3, 'Mervin.Walter@gmail.com', 'Subject 3', 'Comments 3');

-- --------------------------------------------------------

--
-- Table structure for table `likedproject`
--

CREATE TABLE `likedproject` (
  `LikeID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likedproject`
--

INSERT INTO `likedproject` (`LikeID`, `UserID`, `ProjectID`) VALUES
(1, 3, 8),
(2, 6, 4),
(3, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `PortfolioID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `ImageLink` varchar(255) DEFAULT NULL,
  `PortfolioLink` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`PortfolioID`, `UserID`, `Title`, `ImageLink`, `PortfolioLink`) VALUES
(1, 1, 'Web Development Projects', 'https://example.com/image1.jpg', 'https://portfolio.example.com/user1'),
(2, 2, 'Graphic Design Portfolio', 'https://example.com/image2.jpg', 'https://portfolio.example.com/user2'),
(3, 3, 'Data Science Showcase', 'https://example.com/image3.jpg', 'https://portfolio.example.com/user3');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ProjectID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Phase` enum('Onboarding','Initiation','Execution','Closed') NOT NULL,
  `Recruiting` tinyint(1) NOT NULL,
  `Details` text NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `RolesAvailable` varchar(255) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `LastActive` datetime NOT NULL,
  `Views` int(11) NOT NULL,
  `Likes` int(11) NOT NULL,
  `ProjectPrivateMode` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectID`, `UserID`, `Title`, `Phase`, `Recruiting`, `Details`, `Category`, `Image`, `RolesAvailable`, `CreationDate`, `LastActive`, `Views`, `Likes`, `ProjectPrivateMode`) VALUES
(1, 1, 'facere dignissimos aliquam', 'Onboarding', 1, 'Fuga sed cumque sed et molestiae delectus quos.', 'nihil', 'http://placeimg.com/640/480', 'et tenetur quam', '2023-10-24 11:26:56', '2024-02-28 22:02:55', 65280, 91666, 0),
(2, 2, 'ipsam omnis sunt', 'Execution', 1, 'Repellendus magnam in voluptate optio a dolorem.', 'consequuntur', 'http://placeimg.com/640/480', 'doloribus dolor beatae', '2024-01-10 18:56:19', '2024-02-29 12:34:03', 30633, 53143, 1),
(3, 3, 'sint ut hic', 'Onboarding', 0, 'Ut aut ut excepturi.', 'quod', 'http://placeimg.com/640/480', 'velit est consequatur', '2024-02-21 23:01:29', '2024-02-28 21:28:09', 13695, 85755, 0),
(4, 4, 'qui laboriosam fuga', 'Execution', 1, 'Quia excepturi cumque numquam tempore magnam ut.', 'numquam', 'http://placeimg.com/640/480', 'quia aut adipisci', '2023-11-30 18:48:27', '2024-02-29 16:38:01', 5532, 25016, 0),
(5, 5, 'adipisci nulla dolorem', 'Onboarding', 1, 'Ad quibusdam itaque et est et suscipit illum fuga.', 'fugit', 'http://placeimg.com/640/480', 'expedita consequatur officiis', '2023-03-18 04:02:32', '2024-02-29 09:06:44', 35300, 85357, 0),
(6, 6, 'dolores modi et', 'Onboarding', 1, 'Occaecati quam eveniet vitae illo eaque.', 'iste', 'http://placeimg.com/640/480', 'reiciendis nihil maiores', '2023-09-24 00:11:55', '2024-02-28 23:26:13', 97363, 35361, 0),
(7, 7, 'nisi commodi assumenda', 'Execution', 0, 'Dolorem nostrum nesciunt libero in amet autem sed.', 'facere', 'http://placeimg.com/640/480', 'velit natus tenetur', '2024-02-14 16:19:35', '2024-02-29 05:52:08', 30430, 89855, 1),
(8, 8, 'odit odio nesciunt', 'Initiation', 1, 'Natus cumque id vitae natus eum odit est.', 'rerum', 'http://placeimg.com/640/480', 'quo natus eaque', '2023-06-20 19:04:14', '2024-02-29 15:00:34', 17011, 72035, 1),
(9, 9, 'velit qui consequuntur', 'Closed', 0, 'Suscipit dolores deserunt sed atque est inventore nostrum.', 'et', 'http://placeimg.com/640/480', 'dolor sunt quidem', '2024-02-10 09:21:17', '2024-02-29 15:33:03', 37352, 9454, 0),
(10, 10, 'animi saepe accusantium', 'Initiation', 0, 'Odio molestiae harum autem quae quia reiciendis unde reprehenderit nobis.', 'voluptatibus', 'http://placeimg.com/640/480', 'est nobis voluptas', '2023-06-21 13:56:03', '2024-02-29 02:01:51', 45080, 22723, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projectmember`
--

CREATE TABLE `projectmember` (
  `ProjectMemberID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `JoinDate` datetime NOT NULL,
  `LeaveDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectmember`
--

INSERT INTO `projectmember` (`ProjectMemberID`, `UserID`, `ProjectID`, `Role`, `JoinDate`, `LeaveDate`) VALUES
(1, 5, 3, 'Developer', '2023-05-15 00:00:00', '2024-01-20 00:00:00'),
(2, 8, 3, 'Designer', '2023-08-02 00:00:00', '2023-12-10 00:00:00'),
(3, 2, 3, 'Manager', '2022-11-18 00:00:00', '2023-09-25 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `projectroles`
--

CREATE TABLE `projectroles` (
  `RoleID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `Skilldesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectroles`
--

INSERT INTO `projectroles` (`RoleID`, `ProjectID`, `Skilldesc`) VALUES
(1, 1, 'Frontend Development'),
(2, 2, 'Backend Development'),
(3, 3, 'UI/UX Design');

-- --------------------------------------------------------

--
-- Table structure for table `projectrolesskill`
--

CREATE TABLE `projectrolesskill` (
  `RoleSkillID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `Skilldesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectrolesskill`
--

INSERT INTO `projectrolesskill` (`RoleSkillID`, `RoleID`, `Skilldesc`) VALUES
(1, 1, 'JavaScript'),
(2, 2, 'React.js'),
(3, 3, 'Node.js');

-- --------------------------------------------------------

--
-- Table structure for table `projecttages`
--

CREATE TABLE `projecttages` (
  `TagID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `Tagname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projecttages`
--

INSERT INTO `projecttages` (`TagID`, `ProjectID`, `Tagname`) VALUES
(1, 1, 'Web Development'),
(2, 2, 'Mobile App'),
(3, 3, 'Data Science');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `UserType` enum('stud','staff','prof') DEFAULT NULL,
  `ProfilePic` varchar(255) DEFAULT NULL,
  `Userprivatemode` tinyint(1) DEFAULT NULL,
  `CVlink` varchar(255) DEFAULT NULL,
  `regdate` datetime NOT NULL,
  `lastlogindate` datetime NOT NULL,
  `Course` varchar(255) DEFAULT NULL,
  `Matyear` int(11) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `portfolio` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `certifications` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `FirstName`, `LastName`, `UserType`, `ProfilePic`, `Userprivatemode`, `CVlink`, `regdate`, `lastlogindate`, `Course`, `Matyear`, `Tagline`, `desc`, `portfolio`, `experience`, `education`, `certifications`) VALUES
(1, 'Dejon12', 'Mbld8r02XSwcs60', 'Carlos_Reinger@gmail.com', 'Demetrius', 'Waelchi', 'staff', 'programming', 0, 'http://danyka.name', '2023-11-18 21:00:12', '2024-02-29 15:05:45', 'Account', 1, 'eaque mollitia repellendus', 'Ut est id nobis architecto ut eaque et ut.', 'sunt rerum voluptas', 'consequatur debitis omnis', 'unde totam expedita', 'reprehenderit repudiandae eos'),
(2, 'Isabelle52', '954ULe83ZjFExdA', 'Myrtie30@hotmail.com', 'Marilou', 'Parisian', 'prof', 'Movies', 1, 'https://don.net', '2023-10-30 21:59:03', '2024-02-29 03:52:35', 'online', 3, 'sit dignissimos eveniet', 'Est tenetur eius quos est quis repellendus.', 'sapiente veritatis aut', 'sed modi modi', 'velit fuga velit', 'hic dolor accusamus'),
(3, 'Chaz8', 'CQpVKdd_et0f1Y3', 'Jamar.Pacocha@hotmail.com', 'Stevie', 'Jast', 'stud', 'monitor', 1, 'https://julia.biz', '2023-05-11 23:32:18', '2024-02-29 11:35:00', 'Table', 2, 'voluptas velit sed', 'Cum pariatur quae doloremque qui ab est non rerum.', 'illum aliquid porro', 'quis sunt qui', 'ipsum qui hic', 'vero quibusdam tenetur'),
(4, 'Alena.Cummerata', 'glsOX9Ve0iZQc2M', 'Marlen_Witting14@yahoo.com', 'Lyla', 'Kling', 'staff', 'Implemented', 1, 'http://julien.net', '2023-09-05 18:57:09', '2024-02-29 07:26:07', 'Engineer', 3, 'est est animi', 'Reprehenderit magni rem consequatur.', 'enim similique vero', 'fugiat et facere', 'beatae autem fugit', 'nobis itaque nihil'),
(5, 'Brice.Sporer', 'W_IYDBDWjkTrwKK', 'Jace.Heller@gmail.com', 'Justine', 'Franecki', 'staff', 'Future', 0, 'https://austen.net', '2023-10-21 16:20:25', '2024-02-29 15:58:12', 'bleeding-edge', 4, 'et est ullam', 'Distinctio possimus omnis delectus.', 'amet cum dolores', 'delectus et id', 'rerum aliquid sunt', 'minima nobis beatae'),
(6, 'Royal70', 'mTCd_osujtTcRPl', 'Amina_Upton@yahoo.com', 'Amalia', 'Dicki', 'stud', 'solutions', 1, 'http://libby.biz', '2023-03-30 17:42:54', '2024-02-29 10:27:50', 'ADP', 4, 'et deleniti provident', 'Et accusamus ex sed atque dignissimos a.', 'dolor facilis odio', 'quam dolorem nobis', 'dicta expedita qui', 'natus magnam vel'),
(7, 'Jessika_Schuppe64', '3tGpB_vhGLaPsJs', 'Javonte.Ortiz28@yahoo.com', 'Abraham', 'Cartwright', 'prof', 'Granite', 1, 'https://jed.com', '2023-11-21 02:36:01', '2024-02-29 06:00:33', 'calculate', 1, 'quis omnis autem', 'Ut aut cumque maiores voluptate.', 'veritatis praesentium voluptatem', 'quia modi inventore', 'quam temporibus earum', 'quas corrupti numquam'),
(8, 'Kristy53', '0OlQIE4GUHDnggb', 'Mervin.Walter@gmail.com', 'Dora', 'Bauch', 'staff', 'bricks-and-clicks', 1, 'http://gwen.net', '2024-02-06 00:07:26', '2024-02-29 10:08:30', 'Awesome', 4, 'laborum deleniti quia', 'Ut praesentium aut ab.', 'voluptate sunt aliquam', 'numquam aut dolorem', 'eum voluptatum harum', 'consequatur odio magnam'),
(9, 'Moses.Champlin', 'yvH9CgZcviCMaPI', 'Elliott_Conn@yahoo.com', 'Willy', 'Stamm', 'staff', 'Investor', 0, 'http://maggie.com', '2024-01-24 16:23:06', '2024-02-29 15:18:58', 'transmitting', 2, 'nobis ut alias', 'Quia quibusdam quia sapiente iste aperiam voluptatem maxime molestiae esse.', 'corporis laboriosam in', 'voluptatem est accusamus', 'non quos natus', 'excepturi asperiores hic'),
(10, 'Merritt.Schmeler19', 'ggi8sHTefEp5y4E', 'Jayda71@yahoo.com', 'Naomie', 'Breitenberg', 'stud', 'Gourde', 1, 'https://chloe.net', '2023-07-27 01:55:07', '2024-02-29 04:26:59', 'FTP', 4, 'nemo maiores nam', 'Fugit at alias.', 'quis nostrum sint', 'placeat debitis quibusdam', 'recusandae fugiat reiciendis', 'doloribus sequi atque');

-- --------------------------------------------------------

--
-- Table structure for table `userskillset`
--

CREATE TABLE `userskillset` (
  `UserSkillSetID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `SkillName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userskillset`
--

INSERT INTO `userskillset` (`UserSkillSetID`, `UserID`, `SkillName`) VALUES
(1, 2, 'Skill 1'),
(2, 7, 'Skill 2'),
(3, 5, 'Skill 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certification`
--
ALTER TABLE `certification`
  ADD PRIMARY KEY (`CertificationID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`EducationID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `educationtask`
--
ALTER TABLE `educationtask`
  ADD PRIMARY KEY (`EducationTaskID`),
  ADD KEY `EducationID` (`EducationID`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`ExperienceID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `experiencetask`
--
ALTER TABLE `experiencetask`
  ADD PRIMARY KEY (`ExperienceTaskID`),
  ADD KEY `ExperienceID` (`ExperienceID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `Email` (`Email`);

--
-- Indexes for table `likedproject`
--
ALTER TABLE `likedproject`
  ADD PRIMARY KEY (`LikeID`),
  ADD UNIQUE KEY `unique_user_project_pair` (`UserID`,`ProjectID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`PortfolioID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `projectmember`
--
ALTER TABLE `projectmember`
  ADD PRIMARY KEY (`ProjectMemberID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `projectroles`
--
ALTER TABLE `projectroles`
  ADD PRIMARY KEY (`RoleID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `projectrolesskill`
--
ALTER TABLE `projectrolesskill`
  ADD PRIMARY KEY (`RoleSkillID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `projecttages`
--
ALTER TABLE `projecttages`
  ADD PRIMARY KEY (`TagID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `userskillset`
--
ALTER TABLE `userskillset`
  ADD PRIMARY KEY (`UserSkillSetID`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certification`
--
ALTER TABLE `certification`
  MODIFY `CertificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `EducationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `educationtask`
--
ALTER TABLE `educationtask`
  MODIFY `EducationTaskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ExperienceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `experiencetask`
--
ALTER TABLE `experiencetask`
  MODIFY `ExperienceTaskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likedproject`
--
ALTER TABLE `likedproject`
  MODIFY `LikeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `PortfolioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projectmember`
--
ALTER TABLE `projectmember`
  MODIFY `ProjectMemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projectroles`
--
ALTER TABLE `projectroles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projectrolesskill`
--
ALTER TABLE `projectrolesskill`
  MODIFY `RoleSkillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projecttages`
--
ALTER TABLE `projecttages`
  MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `userskillset`
--
ALTER TABLE `userskillset`
  MODIFY `UserSkillSetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certification`
--
ALTER TABLE `certification`
  ADD CONSTRAINT `certification_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `experience` (`UserID`);

--
-- Constraints for table `educationtask`
--
ALTER TABLE `educationtask`
  ADD CONSTRAINT `educationtask_ibfk_1` FOREIGN KEY (`EducationID`) REFERENCES `education` (`EducationID`);

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `experiencetask`
--
ALTER TABLE `experiencetask`
  ADD CONSTRAINT `experiencetask_ibfk_1` FOREIGN KEY (`ExperienceID`) REFERENCES `experience` (`ExperienceID`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `user` (`Email`);

--
-- Constraints for table `likedproject`
--
ALTER TABLE `likedproject`
  ADD CONSTRAINT `likedproject_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `likedproject_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`);

--
-- Constraints for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `portfolio_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `projectmember`
--
ALTER TABLE `projectmember`
  ADD CONSTRAINT `projectmember_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `projectmember_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`);

--
-- Constraints for table `projectroles`
--
ALTER TABLE `projectroles`
  ADD CONSTRAINT `projectroles_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`);

--
-- Constraints for table `projectrolesskill`
--
ALTER TABLE `projectrolesskill`
  ADD CONSTRAINT `projectrolesskill_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `projectroles` (`RoleID`);

--
-- Constraints for table `projecttages`
--
ALTER TABLE `projecttages`
  ADD CONSTRAINT `projecttages_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`);

--
-- Constraints for table `userskillset`
--
ALTER TABLE `userskillset`
  ADD CONSTRAINT `userskillset_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
