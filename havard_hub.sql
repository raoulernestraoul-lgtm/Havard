-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 30 oct. 2026 à 14:00
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `defaultdb`
--
USE defaultdb;
-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT 'General Training',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`id`, `title`, `category`, `description`) VALUES
(1, 'Front End Development', 'Technology', 'Master HTML, CSS, JavaScript, and modern web interfaces.'),
(2, 'Back End Development', 'Technology', 'Build scalable server-side applications, APIs, and databases.'),
(3, 'AI Prompt Engineering', 'Artificial Intelligence', 'Learn how to construct optimal prompts for generative AI models.'),
(4, 'IoT (Internet Of Things)', 'Engineering', 'Connect hardware, sensors, and smart devices to web platforms.'),
(5, 'Data Analysis', 'Data & AI', 'Extract insights, clean data, and create visual analytical dashboards.'),
(6, 'Cyber Security', 'Technology', 'Protect systems, networks, and applications from cyber threats.'),
(7, 'Full Stack', 'Technology', 'Combine both Front-End and Back-End development expertise.'),
(8, 'Web Design', 'Design', 'Design beautiful, user-friendly layouts for web applications.'),
(9, 'UI/UX Design', 'Design', 'Craft user experiences and visual prototypes with industry design tools.'),
(10, 'AI & Robotics', 'Robotics', 'Combine artificial intelligence algorithms with hardware automation.'),
(11, 'Machine Learning', 'Data & AI', 'Train predictive statistical models with Python and data frameworks.'),
(12, 'Make-Ups', 'Vocational', 'Professional beauty, cosmetology, and modern makeup artistry.'),
(13, 'Solar Installation', 'Vocational', 'Design, wire, install, and maintain solar energy equipment.'),
(14, 'Data Science', 'Data & AI', 'Advance into deep data mining, statistics, and machine learning.'),
(15, 'Graphics Design', 'Design', 'Create visual content, brand identities, and promotional materials.'),
(16, 'Digital Marketing', 'Business', 'Master SEO, social media marketing, PPC, and audience growth.'),
(17, 'Content Creation', 'Media', 'Produce high-converting written, audio, and visual content.'),
(18, 'Photography / Photo Editing', 'Media', 'Learn studio lighting, composition, and digital photo retouching.'),
(19, 'Video Editing / Videography', 'Media', 'Film professional video and edit dynamic motion visual content.'),
(20, 'Project Management', 'Business', 'Lead projects using Agile, Scrum, and classic management tools.'),
(21, 'Business Development', 'Business', 'Scale business operations, sales pipelines, and key partnerships.'),
(22, 'Cloud Computing', 'Technology', 'Deploy and manage infrastructure on AWS, Azure, and Google Cloud.'),
(23, 'Information Technology', 'Technology', 'Core computer networks, enterprise IT maintenance, and support.'),
(24, 'Computer Application', 'Technology', 'Master word processing, spreadsheets, and office applications.'),
(25, 'Catering', 'Vocational', 'Culinary arts, event planning, and commercial food production.'),
(26, 'Fashion Design', 'Vocational', 'Pattern making, garment construction, and modern fashion styling.'),
(27, 'Carpentry', 'Vocational', 'Woodworking, structural timber construction, and furniture design');

-- --------------------------------------------------------

--
-- Structure de la table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','admin') DEFAULT 'student',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Havard Hub Admin', 'admin@havardhub.com', '$2b$10$wT8v0q8/1N3.N20QJk5Mue.60G4w1S88nS6Jc2bO2sE.0u.p3.2S2', 'admin', '2026-10-28 14:54:08'),
(2, 'Raoul Charles', 'raoulernestraoul@gmail.com', '$2b$10$UsOL9wDYifTbOWsPVsnQu.CTThwE1GfRrw/myIcwri24u5fclsJEK', 'admin', '2026-10-30 10:52:48');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
