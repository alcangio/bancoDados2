-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 11, 2024 at 06:27 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-escola`
--

-- --------------------------------------------------------

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
CREATE TABLE IF NOT EXISTS `emprestimo` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `data_hora` timestamp NOT NULL,
  `matric_aluno` int NOT NULL,
  `data_devolucao` date DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `matric_aluno` (`matric_aluno`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emprestimo`
--

INSERT INTO `emprestimo` (`data_hora`, `nome`, `titulo`) VALUES
('2022-03-12 18:25:00', 'João Carlos', 'Livro 3: Linguagem SQL'),
('2022-03-20 06:51:00', 'José Vitor', 'Modelo Conceitual e Diagramas ER'),
('2022-03-15 17:32:00', 'Paulo André', 'Livro 2: Modelo Relacional e Álgebra Relacional');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
