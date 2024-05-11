-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 11, 2024 at 06:42 PM
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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `id` int DEFAULT NULL,
  `nome` varchar(25) NOT NULL,
  `matricula` int NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `endereco` varchar(25) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `aluno`
--

INSERT INTO `aluno` (`id`, `nome`, `matricula`, `email`, `endereco`, `telefone`) VALUES
(1, 'João Carlos', 1234, 'Jcarlos@gmail.com', 'Rua 13 de maio', '(11)7825-4489'),
(2, 'José Vitor', 2345, 'Jvitor@gmail.com', 'Rua da Saudade', '(11)7825-6589'),
(3, 'Paulo André', 3456, 'Pandr@gmail.com', 'Rua do Sol', '(11)7825-4495');

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

INSERT INTO `emprestimo` (`codigo`, `data_hora`, `matric_aluno`, `data_devolucao`) VALUES
(1, '2022-03-12 18:25:00', 1234, '2022-03-15'),
(2, '2022-03-15 17:32:00', 3456, '2022-03-18'),
(3, '2022-03-20 06:51:00', 2345, '2022-03-23');

-- --------------------------------------------------------

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
CREATE TABLE IF NOT EXISTS `livro` (
  `cod_livro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `cod_sessao` int NOT NULL,
  PRIMARY KEY (`cod_livro`),
  KEY `cod_sessao` (`cod_sessao`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `livro`
--

INSERT INTO `livro` (`cod_livro`, `titulo`, `autor`, `cod_sessao`) VALUES
(1, 'Modelo Conceitual e Diagramas ER', 'Pressman, Roger S.', 3),
(2, 'Livro 2: Modelo Relacional e Álgebra Relacional', 'Heuser, Carlos Alberto', 1),
(3, 'Livro 3: Linguagem SQL', 'Beighley, Lynn', 2);

-- --------------------------------------------------------

--
-- Table structure for table `livro_emprestimo`
--

DROP TABLE IF EXISTS `livro_emprestimo`;
CREATE TABLE IF NOT EXISTS `livro_emprestimo` (
  `cod_livro` int NOT NULL,
  `cod_emprestimo` int NOT NULL,
  KEY `cod_livro` (`cod_livro`),
  KEY `cod_emprestimo` (`cod_emprestimo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `livro_emprestimo`
--

INSERT INTO `livro_emprestimo` (`cod_livro`, `cod_emprestimo`) VALUES
(3, 1),
(1, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessao`
--

DROP TABLE IF EXISTS `sessao`;
CREATE TABLE IF NOT EXISTS `sessao` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(10) NOT NULL,
  `localizacao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessao`
--

INSERT INTO `sessao` (`codigo`, `descricao`, `localizacao`) VALUES
(1, 'Sessao1', 'Partilheira1'),
(2, 'Sessao2', 'Partilheira2'),
(3, 'Sessao3', 'Partilheira3');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
