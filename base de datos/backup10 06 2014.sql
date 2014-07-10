CREATE DATABASE  IF NOT EXISTS `alquilerhabitdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `alquilerhabitdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: alquilerhabitdb
-- ------------------------------------------------------
-- Server version	5.5.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arrendatario`
--

DROP TABLE IF EXISTS `arrendatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrendatario` (
  `id_arrendatario` int(11) NOT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `ocupacion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_arrendatario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrendatario`
--

LOCK TABLES `arrendatario` WRITE;
/*!40000 ALTER TABLE `arrendatario` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrendatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `ocupacion` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `dni` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `idhistorial` int(11) NOT NULL,
  `calificacion` varchar(40) NOT NULL,
  `comentarios` varchar(100) NOT NULL,
  `recomendacion` varchar(2) NOT NULL,
  `id_reserva` int(11) DEFAULT NULL,
  PRIMARY KEY (`idhistorial`),
  KEY `FK_RESERVA_idx` (`id_reserva`),
  CONSTRAINT `FK_RESERVA` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`idreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuarto`
--

DROP TABLE IF EXISTS `cuarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuarto` (
  `idcuarto` int(11) NOT NULL,
  `caracteristicas` varchar(50) NOT NULL,
  `banio` varchar(2) NOT NULL,
  `restricciones` varchar(60) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `id_ubicacion` int(11) DEFAULT NULL,
  `id_arrendatario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcuarto`),
  KEY `FK_UBICACION_idx` (`id_ubicacion`),
  KEY `FK_ARRENDATARIO_idx` (`id_arrendatario`),
  CONSTRAINT `FK_ARRENDATARIO` FOREIGN KEY (`id_arrendatario`) REFERENCES `arrendatario` (`id_arrendatario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_UBICACION` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`idubicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuarto`
--

LOCK TABLES `cuarto` WRITE;
/*!40000 ALTER TABLE `cuarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle` (
  `iddetalle` int(11) NOT NULL,
  `objetos` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `idcuarto` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `FK_ID_CUARTO_idx` (`idcuarto`),
  CONSTRAINT `FK_ID_CUARTO` FOREIGN KEY (`idcuarto`) REFERENCES `cuarto` (`idcuarto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `fecha` varchar(25) NOT NULL,
  `tiempo` varchar(30) NOT NULL,
  `monto` varchar(30) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_cuarto` int(11) DEFAULT NULL,
  `id_arrendatario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idreserva`),
  KEY `FK_CLIENTE_idx` (`id_cliente`),
  KEY `FK_CUARTO_idx` (`id_cuarto`),
  CONSTRAINT `FK_CLIENTE` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CUARTO` FOREIGN KEY (`id_cuarto`) REFERENCES `cuarto` (`idcuarto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicacion` (
  `idubicacion` int(11) NOT NULL,
  `departamento` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `distrito` varchar(45) NOT NULL,
  PRIMARY KEY (`idubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-10 23:53:12
