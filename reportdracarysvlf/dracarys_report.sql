-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `s3370_Serveur`
--

-- --------------------------------------------------------

--
-- Structure de la table `dracarys_report`
--

CREATE TABLE `dracarys_report` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `reporteur` varchar(255) DEFAULT NULL,
  `nomreporter` varchar(255) DEFAULT NULL,
  `raison` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `dracarys_report`
--

INSERT INTO `dracarys_report` (`id`, `type`, `reporteur`, `nomreporter`, `raison`) VALUES
(21, 'Report', 'TEST', NULL, NULL),
(22, 'Report', 'TEST', NULL, NULL),
(23, 'Report', 'TEST', NULL, NULL),
(24, 'Report', 'TEST', NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `dracarys_report`
--
ALTER TABLE `dracarys_report`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `dracarys_report`
--
ALTER TABLE `dracarys_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
