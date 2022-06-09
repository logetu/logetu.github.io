-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 09 juin 2022 à 10:24
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `aeroport`
--
CREATE DATABASE IF NOT EXISTS `aeroport` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aeroport`;

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `immatriculation` varchar(11) NOT NULL,
  `nombre_de_siege` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`immatriculation`, `nombre_de_siege`) VALUES
('ZPT135', 150),
('0000', 50),
('ABDE', 50),
('12365', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mecanicien`
--

CREATE TABLE `mecanicien` (
  `num_mecanicien` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `numero_telephone` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mecanicien`
--

INSERT INTO `mecanicien` (`num_mecanicien`, `nom`, `numero_telephone`) VALUES
(1, 'Muller', 612896574),
(3, 'Petit', 656511628),
(4, 'Grandjean', 698496649);

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

CREATE TABLE `possede` (
  `num_type` int(11) NOT NULL,
  `immatriculation` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `possede`
--

INSERT INTO `possede` (`num_type`, `immatriculation`) VALUES
(1, '0'),
(3, 'ZPT135');

-- --------------------------------------------------------

--
-- Structure de la table `repare`
--

CREATE TABLE `repare` (
  `num_mecanicien` varchar(11) NOT NULL,
  `immatriculation` int(11) NOT NULL,
  `objet` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `duree` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `repare`
--

INSERT INTO `repare` (`num_mecanicien`, `immatriculation`, `objet`, `date`, `duree`) VALUES
('0', 0, 'RAS', '2004-05-14', 25),
('1', 1, 'RAS', '1981-11-21', 25),
(' Muller', 0, 'RAS', '2004-05-14', 500);

-- --------------------------------------------------------

--
-- Structure de la table `type_avion`
--

CREATE TABLE `type_avion` (
  `num_type` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `constructeur` varchar(20) NOT NULL,
  `puissance` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_avion`
--

INSERT INTO `type_avion` (`num_type`, `nom`, `constructeur`, `puissance`) VALUES
(1, 'A380', 'Airbus', '1360N'),
(2, 'A380', 'Airbus', '1360KN'),
(3, 'A340', 'Airbus', '996KN'),
(4, 'A320', 'Airbus', '236KN'),
(5, 'B777', 'Boeing', '1030KN'),
(6, 'B747', 'Boeing', '1144KN');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`immatriculation`);

--
-- Index pour la table `mecanicien`
--
ALTER TABLE `mecanicien`
  ADD PRIMARY KEY (`num_mecanicien`);

--
-- Index pour la table `possede`
--
ALTER TABLE `possede`
  ADD PRIMARY KEY (`num_type`,`immatriculation`);

--
-- Index pour la table `repare`
--
ALTER TABLE `repare`
  ADD PRIMARY KEY (`num_mecanicien`,`immatriculation`);

--
-- Index pour la table `type_avion`
--
ALTER TABLE `type_avion`
  ADD PRIMARY KEY (`num_type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mecanicien`
--
ALTER TABLE `mecanicien`
  MODIFY `num_mecanicien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `type_avion`
--
ALTER TABLE `type_avion`
  MODIFY `num_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;--
-- Base de données :  `foot`
--
CREATE DATABASE IF NOT EXISTS `foot` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `foot`;

-- --------------------------------------------------------

--
-- Structure de la table `buts`
--

CREATE TABLE `buts` (
  `num_but` int(11) NOT NULL,
  `rencontre` varchar(10) NOT NULL,
  `equipe` varchar(10) NOT NULL,
  `minute` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE `joueurs` (
  `num_joueur` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `date_naissance` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`num_joueur`, `nom`, `prenom`, `date_naissance`) VALUES
(1, 'boucher', 'alicia', '2022-01-02');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `num_joueur` int(11) NOT NULL,
  `num_but` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `buts`
--
ALTER TABLE `buts`
  ADD PRIMARY KEY (`num_but`);

--
-- Index pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD PRIMARY KEY (`num_joueur`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`num_joueur`,`num_but`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `buts`
--
ALTER TABLE `buts`
  MODIFY `num_but` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `joueurs`
--
ALTER TABLE `joueurs`
  MODIFY `num_joueur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Base de données :  `gestion`
--
CREATE DATABASE IF NOT EXISTS `gestion` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestion`;

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `immatriculation` int(10) NOT NULL,
  `nb_sieges` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `id_avion` int(11) NOT NULL,
  `date` date NOT NULL,
  `duree` int(11) NOT NULL,
  `objet` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`immatriculation`, `nb_sieges`, `type`, `id_avion`, `date`, `duree`, `objet`) VALUES
(5000, 50, '', 1, '0000-00-00', 0, ''),
(6000, 60, '', 2, '2022-01-02', 10, '');

-- --------------------------------------------------------

--
-- Structure de la table `mecanicien`
--

CREATE TABLE `mecanicien` (
  `nom` varchar(11) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `num_meca` int(11) NOT NULL,
  `type_habilite` varchar(10) NOT NULL,
  `id_mecanicien` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mecanicien`
--

INSERT INTO `mecanicien` (`nom`, `prenom`, `num_meca`, `type_habilite`, `id_mecanicien`) VALUES
('boucher', 'anais', 769218956, '', 1),
('bellair', 'anais', 769218957, '', 2),
('boucher', 'Mira', 769218955, ' A380 ', 3);

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

CREATE TABLE `possede` (
  `id_avion` int(11) NOT NULL,
  `id_mecanicien` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `possede`
--

INSERT INTO `possede` (`id_avion`, `id_mecanicien`) VALUES
(0, 0),
(1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`id_avion`);

--
-- Index pour la table `mecanicien`
--
ALTER TABLE `mecanicien`
  ADD PRIMARY KEY (`id_mecanicien`);

--
-- Index pour la table `possede`
--
ALTER TABLE `possede`
  ADD PRIMARY KEY (`id_avion`,`id_mecanicien`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avion`
--
ALTER TABLE `avion`
  MODIFY `id_avion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `mecanicien`
--
ALTER TABLE `mecanicien`
  MODIFY `id_mecanicien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;--
-- Base de données :  `logetu`
--
CREATE DATABASE IF NOT EXISTS `logetu` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `logetu`;

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

CREATE TABLE `possede` (
  `id` int(11) NOT NULL,
  `id_reservation` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `possede`
--

INSERT INTO `possede` (`id`, `id_reservation`) VALUES
(6, 24),
(8, 21),
(8, 22),
(8, 23);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `residence` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `residence`, `ville`) VALUES
(24, ' LES ESTUDINES', 'paris'),
(23, ' STUDELITES ', 'paris'),
(22, ' STUDEA ', 'paris'),
(21, ' STUDEA ', 'paris');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(3, 'aliciaboucher@orange.fr', '$2y$12$M5Ycciwz4z8DYGFYb9ihAumwPHUNzg5MlW4XnAeqg0AKf9Rly62He'),
(4, 'anais.boucher@orange.fr', '$2y$12$4i7YT0bBXDUnyqlJ7mgTn.DKZEPgpjcAty95TFyXmJ3hC/IUfT0Kq'),
(6, 'thibaut.chaumoitre@gmail.com', '$2y$12$vSAx4HAZrZub6RmioDRGVuOB7nROo79P6KyZ7AsQ4WiI9er7P0BFC'),
(8, 'alicia@gmail.com', '$2y$12$PkRV9IEcT3cnzpuIyc5Bf.UdERMhequ0E4RdxsEZG0cQtkdJ.Cllu');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `possede`
--
ALTER TABLE `possede`
  ADD PRIMARY KEY (`id`,`id_reservation`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`);

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
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;--
-- Base de données :  `prog_avancee`
--
CREATE DATABASE IF NOT EXISTS `prog_avancee` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prog_avancee`;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `num_eleve` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`num_eleve`, `nom`, `prenom`) VALUES
(1, 'Dupont', 'Marc'),
(2, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `num_evaluation` int(11) NOT NULL,
  `nom_partie` varchar(20) NOT NULL,
  `coefficient` int(11) NOT NULL,
  `date_evaluation` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`num_evaluation`, `nom_partie`, `coefficient`, `date_evaluation`) VALUES
(1, 'C++', 1, '2021-10-14'),
(2, 'C# winform 1', 1, '2021-11-09'),
(3, 'C# winform 2', 1, '2021-12-02'),
(4, 'HTML-PHP', 1, '2021-12-14'),
(5, 'Base de données', 1, '2022-01-14');

-- --------------------------------------------------------

--
-- Structure de la table `passe`
--

CREATE TABLE `passe` (
  `num_eleve` int(11) NOT NULL,
  `num_evaluation` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`num_eleve`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`num_evaluation`);

--
-- Index pour la table `passe`
--
ALTER TABLE `passe`
  ADD PRIMARY KEY (`num_eleve`,`num_evaluation`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `num_eleve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `num_evaluation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;--
-- Base de données :  `repertoire`
--
CREATE DATABASE IF NOT EXISTS `repertoire` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `repertoire`;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `num_personne` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`num_personne`, `nom`, `prenom`, `date_naissance`) VALUES
(1, 'boucher', 'alicia', NULL),
(8, 'chaumoitre', 'thibaut', '2004-05-14'),
(3, 'boucher', 'anais', NULL),
(4, 'boucher', 'sarah', '1981-11-21'),
(5, 'boucher', 'xavier', NULL),
(10, 'bellair', 'anais', '2002-12-30'),
(7, 'gaschet', 'jean-pierre', NULL),
(11, 'chaumoitre', 'mathis', '2008-12-30');

-- --------------------------------------------------------

--
-- Structure de la table `personne2`
--

CREATE TABLE `personne2` (
  `num_personne` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personne_a_telephone`
--

CREATE TABLE `personne_a_telephone` (
  `num_personne` int(11) NOT NULL,
  `num_telephone` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne_a_telephone`
--

INSERT INTO `personne_a_telephone` (`num_personne`, `num_telephone`) VALUES
(4, 5),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(11, 6),
(11, 7);

-- --------------------------------------------------------

--
-- Structure de la table `personne_a_telephone2`
--

CREATE TABLE `personne_a_telephone2` (
  `num_personne` int(11) NOT NULL,
  `num_telephone` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `telephone`
--

CREATE TABLE `telephone` (
  `num_telephone` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `type` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `telephone`
--

INSERT INTO `telephone` (`num_telephone`, `numero`, `type`) VALUES
(1, '0769218955', 'fixe_prof'),
(2, '0769218950', 'fixe_prof'),
(3, '', ''),
(4, '0769218956', 'fixe_perso'),
(5, '0781411548', 'mobile_prof'),
(6, '0238152056', 'fixe_perso'),
(7, '0241154856', 'fixe_prof');

-- --------------------------------------------------------

--
-- Structure de la table `telephone2`
--

CREATE TABLE `telephone2` (
  `num_personne` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `type` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`num_personne`);

--
-- Index pour la table `personne2`
--
ALTER TABLE `personne2`
  ADD PRIMARY KEY (`num_personne`);

--
-- Index pour la table `personne_a_telephone`
--
ALTER TABLE `personne_a_telephone`
  ADD PRIMARY KEY (`num_personne`,`num_telephone`);

--
-- Index pour la table `personne_a_telephone2`
--
ALTER TABLE `personne_a_telephone2`
  ADD PRIMARY KEY (`num_personne`,`num_telephone`);

--
-- Index pour la table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`num_telephone`);

--
-- Index pour la table `telephone2`
--
ALTER TABLE `telephone2`
  ADD PRIMARY KEY (`num_personne`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `num_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `personne2`
--
ALTER TABLE `personne2`
  MODIFY `num_personne` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `telephone`
--
ALTER TABLE `telephone`
  MODIFY `num_telephone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `telephone2`
--
ALTER TABLE `telephone2`
  MODIFY `num_personne` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
