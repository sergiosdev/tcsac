-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 18, 2019 at 06:17 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tcsac`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `clicpf` char(12) NOT NULL,
  `clinome` varchar(100) NOT NULL,
  `clinascimento` date NOT NULL,
  `clicontato` varchar(11) NOT NULL,
  PRIMARY KEY (`clicpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE IF NOT EXISTS `empresas` (
  `empcnpj` char(14) NOT NULL,
  `empjnomefantasia` varchar(100) NOT NULL,
  `emprazaosocial` varchar(100) NOT NULL,
  `empresponsavel` varchar(100) NOT NULL,
  `empcontato` char(11) NOT NULL,
  PRIMARY KEY (`empcnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ocorrencias`
--

DROP TABLE IF EXISTS `ocorrencias`;
CREATE TABLE IF NOT EXISTS `ocorrencias` (
  `ococod` int(3) NOT NULL AUTO_INCREMENT,
  `ococlicpf` char(12) NOT NULL,
  `ocoempcnpj` char(14) NOT NULL,
  `ocodatahora` datetime NOT NULL,
  `ocoplacaveiculo` varchar(7) NOT NULL,
  `ocodescricao` varchar(100) NOT NULL,
  `ocojustificativa` varchar(100) NOT NULL,
  `ocostatus` char(1) NOT NULL COMMENT 'A-ATIVO | C-CONCLUIDO',
  PRIMARY KEY (`ococod`),
  KEY `ococlicpf` (`ococlicpf`),
  KEY `ocoempcnpj` (`ocoempcnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usucod` int(2) NOT NULL,
  `usunome` varchar(100) NOT NULL,
  `usuuser` varchar(10) NOT NULL,
  `usupwd` varchar(10) NOT NULL,
  PRIMARY KEY (`usucod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ocorrencias`
--
ALTER TABLE `ocorrencias`
  ADD CONSTRAINT `ocorrencias_ibfk_1` FOREIGN KEY (`ococlicpf`) REFERENCES `clientes` (`clicpf`),
  ADD CONSTRAINT `ocorrencias_ibfk_2` FOREIGN KEY (`ocoempcnpj`) REFERENCES `empresas` (`empcnpj`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
