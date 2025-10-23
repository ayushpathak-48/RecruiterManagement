-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2025 at 03:22 PM
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
-- Database: `recruit_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `experience_years` decimal(2,1) DEFAULT 0.0,
  `current_position` varchar(150) DEFAULT NULL,
  `expected_salary` decimal(10,2) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `user_id`, `phone`, `gender`, `date_of_birth`, `address`, `city`, `state`, `education`, `experience_years`, `current_position`, `expected_salary`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 17, '9876543210', 'Male', '1998-04-22', '123 MG Road', 'Ahmedabad', 'Gujarat', 'B.Tech in Computer Science', 3.5, 'Frontend Developer', 55000.00, 1, '2025-10-22 15:28:52', '2025-10-22 15:51:36'),
(9, 25, '1234567890', 'Male', '2025-10-16', 'Kishan Vintage Kamlapura', 'Rajkot', 'Gujarat', 'MCA', 1.0, 'Frontend Developer', 1000000.00, 1, '2025-10-22 18:36:55', '2025-10-22 18:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_skills`
--

CREATE TABLE `candidate_skills` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidate_skills`
--

INSERT INTO `candidate_skills` (`id`, `candidate_id`, `skill_id`) VALUES
(13, 9, 1),
(14, 9, 2),
(15, 9, 5),
(16, 9, 6),
(17, 9, 8),
(18, 9, 9),
(19, 9, 15),
(20, 9, 17),
(21, 9, 21),
(22, 9, 22),
(23, 9, 24),
(24, 9, 25);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_status`
--

CREATE TABLE `candidate_status` (
  `id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidate_status`
--

INSERT INTO `candidate_status` (`id`, `status`) VALUES
(1, 'Active'),
(2, 'Interviewing'),
(3, 'Hired'),
(4, 'Rejected'),
(5, 'On Hold');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `salary_range_start` varchar(50) NOT NULL,
  `salary_range_end` varchar(50) NOT NULL,
  `stipend` varchar(100) NOT NULL,
  `job_type` enum('JOB','INTERNSHIP','','') NOT NULL,
  `status` enum('OPEN','CLOSED','HOLD','') NOT NULL DEFAULT 'OPEN',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `description`, `salary_range_start`, `salary_range_end`, `stipend`, `job_type`, `status`, `created_at`) VALUES
(1, 'Frontend Developer', '', '', '', '', 'JOB', 'OPEN', '2025-10-17 09:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `job_comments`
--

CREATE TABLE `job_comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_interview_rounds`
--

CREATE TABLE `job_interview_rounds` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_skills`
--

CREATE TABLE `job_skills` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `type` enum('REQUIRED','PREFERRED') NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_skills`
--

INSERT INTO `job_skills` (`id`, `job_id`, `type`, `skill_id`) VALUES
(1, 1, 'REQUIRED', 3),
(2, 1, 'REQUIRED', 2),
(3, 1, 'PREFERRED', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`) VALUES
(1, 'admin', '2025-10-16 18:38:56'),
(2, 'recruiter', '2025-10-16 18:38:56'),
(3, 'hr', '2025-10-16 18:38:56'),
(4, 'interviewer', '2025-10-16 18:38:56'),
(5, 'reviewer', '2025-10-16 18:38:56'),
(6, 'candidate', '2025-10-16 18:38:56'),
(7, 'viewer', '2025-10-16 18:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `created_at`) VALUES
(1, 'Python', '2025-10-16 18:38:19'),
(2, 'Java', '2025-10-16 18:38:19'),
(3, 'DSA', '2025-10-16 18:38:19'),
(5, 'Problem Solving', '2025-10-22 17:54:28'),
(6, 'Data Structures', '2025-10-22 17:54:28'),
(7, 'Algorithms', '2025-10-22 17:54:28'),
(8, 'Object-Oriented Programming', '2025-10-22 17:54:28'),
(9, 'Version Control (Git)', '2025-10-22 17:54:28'),
(10, 'Database Management', '2025-10-22 17:54:28'),
(11, 'System Design', '2025-10-22 17:54:28'),
(12, 'Software Testing', '2025-10-22 17:54:28'),
(13, 'Debugging', '2025-10-22 17:54:28'),
(14, 'Agile Methodology', '2025-10-22 17:54:28'),
(15, 'HTML', '2025-10-22 17:54:28'),
(16, 'CSS', '2025-10-22 17:54:28'),
(17, 'JavaScript', '2025-10-22 17:54:28'),
(18, 'React.js', '2025-10-22 17:54:28'),
(19, 'Next.js', '2025-10-22 17:54:28'),
(20, 'TypeScript', '2025-10-22 17:54:28'),
(21, 'Responsive Design', '2025-10-22 17:54:28'),
(22, 'Tailwind CSS', '2025-10-22 17:54:28'),
(23, 'Redux', '2025-10-22 17:54:28'),
(24, 'UI/UX Design', '2025-10-22 17:54:28'),
(25, 'Node.js', '2025-10-22 17:54:28'),
(26, 'Express.js', '2025-10-22 17:54:28'),
(27, 'RESTful APIs', '2025-10-22 17:54:28'),
(28, 'SQL', '2025-10-22 17:54:28'),
(29, 'MongoDB', '2025-10-22 17:54:28'),
(30, 'Authentication & Authorization', '2025-10-22 17:54:28'),
(31, 'Server Management', '2025-10-22 17:54:28'),
(32, 'Error Handling', '2025-10-22 17:54:28'),
(33, 'Performance Optimization', '2025-10-22 17:54:28'),
(34, 'Microservices', '2025-10-22 17:54:28'),
(35, 'MERN Stack', '2025-10-22 17:54:28'),
(36, 'MEAN Stack', '2025-10-22 17:54:28'),
(37, 'GraphQL', '2025-10-22 17:54:28'),
(38, 'API Integration', '2025-10-22 17:54:28'),
(39, 'Docker', '2025-10-22 17:54:28'),
(40, 'CI/CD', '2025-10-22 17:54:28'),
(41, 'Testing with Jest', '2025-10-22 17:54:28'),
(42, 'Cloud Deployment', '2025-10-22 17:54:28'),
(43, 'Version Control (Git/GitHub)', '2025-10-22 17:54:28'),
(44, 'Team Collaboration', '2025-10-22 17:54:28'),
(45, 'Kotlin', '2025-10-22 17:54:28'),
(46, 'Android Studio', '2025-10-22 17:54:28'),
(47, 'XML Layout Design', '2025-10-22 17:54:28'),
(48, 'Firebase', '2025-10-22 17:54:28'),
(49, 'REST API Integration', '2025-10-22 17:54:28'),
(50, 'MVVM Architecture', '2025-10-22 17:54:28'),
(51, 'Room Database', '2025-10-22 17:54:28'),
(52, 'Push Notifications', '2025-10-22 17:54:28'),
(53, 'Play Store Deployment', '2025-10-22 17:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `created_at`) VALUES
(1, 'Aayush Pathak', 'ayush@gmail.com', '$2a$11$h7/.7d7liiKlEcihpHoUmudVTpLMq3dH9ZZiePkGcuBZMA9uuwKw2', 1, '2025-10-14 19:45:55'),
(11, 'Viewer updated', 'viewer@gmail.com', '$2a$11$2VwHrnZP8tcohCdQdADB2u6E.h5RzW.R4ZJKRzfE9AnQyub0WYCc2', 7, '2025-10-16 17:16:09'),
(12, 'Recruiter', 'recruiter@gmail.com', '$2a$11$5m.bqZhMqP6GuGoAL54IK.Ida9vyuPGPyMBehMm1gQ5TH2t2.kfye', 2, '2025-10-16 17:40:04'),
(13, 'HR', 'hr@gmail.com', '$2a$11$N9FRldza4eeW3XZsOAu2cu9/nvd2SGwjeLtRmbXnAAjRZmdSOAx9e', 3, '2025-10-16 17:40:50'),
(14, 'Interviewer', 'interviewer@gmail.com', '$2a$11$XHTjzkoOIYfovjLd6um7W..x7GzeJ34IYeZRBbK4mPzPqpPVaAcAW', 4, '2025-10-16 17:43:03'),
(15, 'Reviewer', 'reviewer@gmail.com', '$2a$11$n76ju8za9bw94MkYgAA43usuXjCd8ZYQM6bK/MuQ6HXST5QgRh7UC', 5, '2025-10-16 17:43:30'),
(16, 'Candidate', 'candidate@gmail.com', '$2a$11$azWxNfolz3kapysGftsEqekwmIIJYnBHdH68lpPqSP89univbM5t.', 6, '2025-10-16 17:43:47'),
(17, 'Test', 'test@gmail.com', '$2a$11$rUWRPacJANXvndOmgRoI2eY/AHWdR9E2t/ntlWfHqbdE9vWmcUnzO', 7, '2025-10-16 17:44:16'),
(25, 'Test Candidate', 'testcandidate2@gmail.com', '$2a$11$7bILXBfIoQlhnHjn.Rc1IeNIx6qXDBtbUtBKcnhM/sqQ3eM324wo6', 7, '2025-10-22 18:36:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `candidate_skills`
--
ALTER TABLE `candidate_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skill_id` (`skill_id`),
  ADD KEY `candidate_skills_ibfk_1` (`candidate_id`);

--
-- Indexes for table `candidate_status`
--
ALTER TABLE `candidate_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_comments`
--
ALTER TABLE `job_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `job_interview_rounds`
--
ALTER TABLE `job_interview_rounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `candidate_skills`
--
ALTER TABLE `candidate_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `candidate_status`
--
ALTER TABLE `candidate_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_comments`
--
ALTER TABLE `job_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_interview_rounds`
--
ALTER TABLE `job_interview_rounds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_skills`
--
ALTER TABLE `job_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `candidates_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `candidate_status` (`id`);

--
-- Constraints for table `candidate_skills`
--
ALTER TABLE `candidate_skills`
  ADD CONSTRAINT `candidate_skills_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  ADD CONSTRAINT `candidate_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`);

--
-- Constraints for table `job_comments`
--
ALTER TABLE `job_comments`
  ADD CONSTRAINT `job_comments_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`);

--
-- Constraints for table `job_interview_rounds`
--
ALTER TABLE `job_interview_rounds`
  ADD CONSTRAINT `job_interview_rounds_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`);

--
-- Constraints for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD CONSTRAINT `job_skills_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `job_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
