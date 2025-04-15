-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 15 avr. 2025 à 16:24
-- Version du serveur : 10.11.11-MariaDB
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestepi`
--

-- --------------------------------------------------------

--
-- Structure de la table `controles`
--

DROP TABLE IF EXISTS `controles`;
CREATE TABLE IF NOT EXISTS `controles` (
  `id` varchar(255) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `gestionnaire` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `remarques` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `epiId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epiId` (`epiId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `controles`
--

INSERT INTO `controles` (`id`, `date`, `gestionnaire`, `statut`, `remarques`, `createdAt`, `updatedAt`, `epiId`) VALUES
('CTRL001', '2024-03-25', 'Roméo Giorgio', 'OPERATIONNEL', 'RAS, tout est conforme', '2025-03-31 22:24:28', '2025-03-31 22:24:28', 'EPI001');

-- --------------------------------------------------------

--
-- Structure de la table `epis`
--

DROP TABLE IF EXISTS `epis`;
CREATE TABLE IF NOT EXISTS `epis` (
  `id` varchar(255) NOT NULL,
  `marque` varchar(255) DEFAULT NULL,
  `modele` varchar(255) DEFAULT NULL,
  `numeroSerie` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `taille` varchar(255) DEFAULT NULL,
  `couleur` varchar(255) DEFAULT NULL,
  `dateAchat` varchar(255) DEFAULT NULL,
  `dateFabrication` varchar(255) DEFAULT NULL,
  `dateMiseEnService` varchar(255) DEFAULT NULL,
  `periodiciteControle` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `epis`
--

INSERT INTO `epis` (`id`, `marque`, `modele`, `numeroSerie`, `type`, `taille`, `couleur`, `dateAchat`, `dateFabrication`, `dateMiseEnService`, `periodiciteControle`, `createdAt`, `updatedAt`) VALUES
('EPI001', 'reda', 'Falcon', '12345-AB', 'TEXTILE', 'M', 'Rouge', '2023-01-01', '2022-12-15', '2023-01-15', 180, '2025-03-31 20:42:50', '2025-03-31 22:13:26');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','gestionnaire','cordier') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`username`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('admin', 'admin123', 'admin', '2025-04-02 16:37:17', '2025-04-02 16:37:17'),
('cordier', 'cordier123', 'cordier', '2025-04-02 16:37:17', '2025-04-02 16:37:17'),
('gest', 'gest123', 'gestionnaire', '2025-04-02 16:37:17', '2025-04-02 16:37:17');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `controles`
--
ALTER TABLE `controles`
  ADD CONSTRAINT `controles_ibfk_1` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_10` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_11` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_12` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_13` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_14` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_15` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_16` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_17` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_18` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_19` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_2` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_20` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_21` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_22` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_23` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_24` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_25` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_26` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_27` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_28` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_29` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_3` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_30` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_31` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_32` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_33` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_34` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_35` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_36` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_37` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_38` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_39` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_4` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_40` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_41` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_42` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_43` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_44` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_45` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_46` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_47` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_48` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_49` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_5` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_50` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_51` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_52` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_53` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_54` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_55` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_56` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_57` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_58` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_59` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_6` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_60` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_61` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_62` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_63` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_64` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_65` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_66` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_67` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_68` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_69` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_7` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_70` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_71` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_72` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_73` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_74` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_75` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_76` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_77` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_78` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_79` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_8` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_80` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_81` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_82` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_83` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_84` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_85` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_86` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_87` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `controles_ibfk_9` FOREIGN KEY (`epiId`) REFERENCES `epis` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
