-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 06:13 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_examination_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(500) NOT NULL,
  `is_correct` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `is_correct`, `created_at`, `updated_at`) VALUES
(1, 1, 'First answer', 0, '2023-11-28 23:38:01', '2023-11-28 23:38:01'),
(2, 1, 'Second answer', 1, '2023-11-28 23:38:01', '2023-11-28 23:38:01'),
(3, 1, 'third answer', 0, '2023-11-28 23:38:01', '2023-11-28 23:38:01'),
(4, 2, 'option 1', 0, '2023-12-02 10:06:55', '2023-12-02 10:06:55'),
(5, 2, 'option2', 1, '2023-12-02 10:06:55', '2023-12-02 10:06:55'),
(6, 3, 'option 1', 0, '2023-12-04 17:38:04', '2023-12-04 17:38:04'),
(7, 3, 'option 2', 1, '2023-12-04 17:38:04', '2023-12-04 17:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `attempt` int(11) NOT NULL DEFAULT 0,
  `marks` float NOT NULL DEFAULT 0,
  `entrance_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `exam_name`, `subject_id`, `date`, `time`, `attempt`, `marks`, `entrance_id`, `created_at`, `updated_at`) VALUES
(4, 'test_exam_1', 1, '2023-12-08', '00:30', 1, 1.5, 'exid656cbccd2a324', '2023-12-03 17:37:17', '2023-12-07 14:05:01'),
(5, 'test4', 7, '2023-12-08', '00:01', 2, 2, 'exid656e0eb16a310', '2023-12-04 17:38:57', '2023-12-07 18:57:53'),
(6, 'test_exam_2', 2, '2023-12-08', '00:30', 1, 0, 'exid65721ea8b8b85', '2023-12-07 19:36:08', '2023-12-07 18:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `exams_answers`
--

CREATE TABLE `exams_answers` (
  `id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exams_answers`
--

INSERT INTO `exams_answers` (`id`, `attempt_id`, `question_id`, `answer_id`, `created_at`, `updated_at`) VALUES
(6, 6, 1, 1, '2023-12-08 00:59:02', '2023-12-08 00:59:02'),
(7, 6, 3, 6, '2023-12-08 00:59:02', '2023-12-08 00:59:02'),
(8, 6, 2, 5, '2023-12-08 00:59:02', '2023-12-08 00:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `exams_attempt`
--

CREATE TABLE `exams_attempt` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `marks` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exams_attempt`
--

INSERT INTO `exams_attempt` (`id`, `exam_id`, `user_id`, `status`, `marks`, `created_at`, `updated_at`) VALUES
(4, 5, 1, 1, 0, '2023-12-07 20:03:20', '2023-12-09 15:58:22'),
(5, 5, 1, 1, 0, '2023-12-07 20:03:58', '2023-12-09 15:58:30'),
(6, 4, 1, 1, 1.5, '2023-12-08 00:59:01', '2023-12-09 12:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qna_exams`
--

CREATE TABLE `qna_exams` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qna_exams`
--

INSERT INTO `qna_exams` (`id`, `exam_id`, `question_id`, `created_at`, `updated_at`) VALUES
(7, 1, 2, '2023-12-02 22:52:09', '2023-12-02 22:52:09'),
(8, 2, 1, '2023-12-03 07:18:56', '2023-12-03 07:18:56'),
(9, 2, 2, '2023-12-03 07:18:56', '2023-12-03 07:18:56'),
(10, 4, 1, '2023-12-03 23:34:53', '2023-12-03 23:34:53'),
(11, 4, 2, '2023-12-03 23:34:53', '2023-12-03 23:34:53'),
(12, 5, 1, '2023-12-04 17:39:26', '2023-12-04 17:39:26'),
(13, 5, 2, '2023-12-04 17:39:26', '2023-12-04 17:39:26'),
(14, 5, 3, '2023-12-04 17:39:26', '2023-12-04 17:39:26'),
(15, 4, 3, '2023-12-08 00:57:37', '2023-12-08 00:57:37'),
(16, 6, 1, '2023-12-08 00:58:05', '2023-12-08 00:58:05'),
(17, 6, 2, '2023-12-08 00:58:05', '2023-12-08 00:58:05'),
(18, 6, 3, '2023-12-08 00:58:05', '2023-12-08 00:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `created_at`, `updated_at`) VALUES
(1, 'Dummy question', '2023-11-28 23:38:01', '2023-11-28 23:38:01'),
(2, 'Second Dummy Question', '2023-12-02 10:06:55', '2023-12-02 10:06:55'),
(3, 'dummy 3', '2023-12-04 17:38:04', '2023-12-04 17:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject`, `created_at`, `updated_at`) VALUES
(1, 'Math', '2023-10-22 11:54:40', '2023-10-22 11:54:40'),
(2, 'Science', '2023-10-22 11:56:24', '2023-11-23 06:45:54'),
(7, 'Bangla lit', '2023-12-04 17:36:37', '2023-12-04 17:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'asif', 'asif@gmail.com', NULL, '$2y$10$c1jqCdes2Pn9B4rfyD7TG.gNNWMD5G5st.FOiadw/Yrrnpy7Lg6x6', 0, NULL, '2023-10-20 17:15:49', '2023-10-20 17:15:49'),
(2, 'asif1', 'asif1@gmail.com', NULL, '$2y$10$teRFl1udEySiin78G0.oHeo0DZFk3NIgzf0CQleYlDw0pt/alQ.Dq', 1, NULL, '2023-10-20 17:18:24', '2023-10-20 17:18:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams_answers`
--
ALTER TABLE `exams_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams_attempt`
--
ALTER TABLE `exams_attempt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `qna_exams`
--
ALTER TABLE `qna_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exams_answers`
--
ALTER TABLE `exams_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exams_attempt`
--
ALTER TABLE `exams_attempt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qna_exams`
--
ALTER TABLE `qna_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
