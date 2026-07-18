-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 04 juil. 2026 à 10:03
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TELEPHONE` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`ID`, `NOM`, `TELEPHONE`, `EMAIL`) VALUES
(1, 'MATY Mamane', '077350575', 'msiradjig@gmail.com'),
(2, 'MENEMBE Rodrigue', '066258596', 'manembe@gmail.com'),
(3, 'Jean-Pierre Mba', '065123456', 'jp.mba@gabonmail.ga'),
(4, 'Marie-Thérèse Ondo', '074987654', 'mt.ondo@gmail.com'),
(5, 'Christian Bongo', '062334455', 'c.bongo@live.com'),
(6, 'Sylvie Moukouma', '076677889', 'sylvie.m@yahoo.fr'),
(7, 'Thierry Nziengui', '060102030', 'nziengui.t@icloud.com'),
(8, 'Clarisse Pambou', '079988776', 'cpambou@hotmail.com'),
(9, 'Arnaud Eyeghe', '065544332', 'a.eyeghe@gabon.ga');

-- --------------------------------------------------------

--
-- Structure de la table `listedescatégories`
--

DROP TABLE IF EXISTS `listedescatégories`;
CREATE TABLE IF NOT EXISTS `listedescatégories` (
  `Nom` int NOT NULL AUTO_INCREMENT,
  `ID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Nom`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `listedescatégories`
--

INSERT INTO `listedescatégories` (`Nom`, `ID`, `DESCRIPTION`) VALUES
(1, '', 'Produit informatiques'),
(2, '', 'cartes virtuelles'),
(3, '', 'nos portables'),
(4, '', 'nos meubles'),
(5, '', 'Casques et enceintes'),
(6, '', 'Accessoires de travail'),
(7, '', 'Câbles et adaptateurs'),
(8, '', 'Licences et applications'),
(9, '', 'Matériel d impression');

-- --------------------------------------------------------

--
-- Structure de la table `listedesmouvementsdestock`
--

DROP TABLE IF EXISTS `listedesmouvementsdestock`;
CREATE TABLE IF NOT EXISTS `listedesmouvementsdestock` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE_MOUVEMENT` datetime NOT NULL,
  `PRODUIT_REF` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYPE_MOUVEMENT` enum('ENTREE','SORTIE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `QUANTITE` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUIT_REF` (`PRODUIT_REF`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `listedesmouvementsdestock`
--

INSERT INTO `listedesmouvementsdestock` (`ID`, `DATE_MOUVEMENT`, `PRODUIT_REF`, `TYPE_MOUVEMENT`, `QUANTITE`) VALUES
(1, '2026-01-25 13:19:34', 'Ordi001', 'ENTREE', 20),
(2, '2026-01-26 23:31:01', 'imp01', 'SORTIE', 12),
(3, '2026-01-26 23:31:25', 'imp01', 'ENTREE', 25),
(4, '2026-07-04 09:00:00', 'CAS01', 'ENTREE', 50),
(5, '2026-07-04 09:05:00', 'CHA01', 'ENTREE', 15),
(6, '2026-07-04 09:10:00', 'CAB01', 'ENTREE', 100),
(7, '2026-07-04 09:15:00', 'LIC01', 'ENTREE', 200),
(8, '2026-07-04 09:20:00', 'TON01', 'ENTREE', 80);

--
-- Déclencheurs `listedesmouvementsdestock`
--
DROP TRIGGER IF EXISTS `maj_stock_apres_mouvement`;
DELIMITER $$
CREATE TRIGGER `maj_stock_apres_mouvement` AFTER INSERT ON `listedesmouvementsdestock` FOR EACH ROW BEGIN
    IF NEW.type_mouvement = 'ENTREE' THEN
        UPDATE Produit SET stock = stock + NEW.quantite WHERE ref = NEW.produit_ref;
    ELSE
        UPDATE Produit SET stock = stock - NEW.quantite WHERE ref = NEW.produit_ref;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `REF` int NOT NULL AUTO_INCREMENT,
  `LIBELLE` int NOT NULL,
  `STOCK` int NOT NULL,
  `CATEGORIE_ID` int NOT NULL,
  PRIMARY KEY (`REF`),
  UNIQUE KEY `REF` (`REF`),
  KEY `CATEGORIE_ID` (`CATEGORIE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`REF`, `LIBELLE`, `STOCK`, `CATEGORIE_ID`) VALUES
(1, 0, 30, 1),
(2, 0, 30, 1),
(3, 0, 33, 1),
(4, 0, 40, 3),
(5, 0, 50, 5),
(6, 0, 15, 4),
(7, 0, 100, 7),
(8, 0, 200, 8),
(9, 0, 80, 9);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
