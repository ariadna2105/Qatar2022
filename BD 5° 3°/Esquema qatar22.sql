CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET latin7 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idcategorias` int NOT NULL AUTO_INCREMENT,
  `categoriascol` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Violencia'),(2,'Sexualidad'),(3,'Discriminacion'),(4,'Acoso escolar');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada`
--

DROP TABLE IF EXISTS `jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornada` (
  `Ref_inst` varchar(145) NOT NULL,
  `Jornadaid` int NOT NULL AUTO_INCREMENT,
  `objetivo` varchar(145) NOT NULL,
  `titulo` varchar(145) NOT NULL,
  PRIMARY KEY (`Jornadaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `idMaterial` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(145) NOT NULL,
  `categoria` varchar(145) NOT NULL,
  `fuente` varchar(145) NOT NULL,
  `enlace` varchar(145) NOT NULL,
  `procedencia` varchar(145) DEFAULT NULL,
  `categorias_idcategorias` int NOT NULL,
  PRIMARY KEY (`idMaterial`,`categorias_idcategorias`),
  KEY `fk_Material_categorias1_idx` (`categorias_idcategorias`),
  CONSTRAINT `fk_Material_categorias1` FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_has_jornada`
--

DROP TABLE IF EXISTS `material_has_jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_has_jornada` (
  `Material_idMaterial` int NOT NULL,
  `Jornada_Jornadaid` int NOT NULL,
  PRIMARY KEY (`Material_idMaterial`,`Jornada_Jornadaid`),
  KEY `fk_Material_has_Jornada_Jornada1_idx` (`Jornada_Jornadaid`),
  KEY `fk_Material_has_Jornada_Material_idx` (`Material_idMaterial`),
  CONSTRAINT `fk_Material_has_Jornada_Jornada1` FOREIGN KEY (`Jornada_Jornadaid`) REFERENCES `jornada` (`Jornadaid`),
  CONSTRAINT `fk_Material_has_Jornada_Material` FOREIGN KEY (`Material_idMaterial`) REFERENCES `material` (`idMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_has_jornada`
--

LOCK TABLES `material_has_jornada` WRITE;
/*!40000 ALTER TABLE `material_has_jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_has_jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propuesta`
--

DROP TABLE IF EXISTS `propuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propuesta` (
  `idPropuesta` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `autor` varchar(45) DEFAULT NULL,
  `descripcion` varchar(145) NOT NULL,
  `motivo_rechazo` varchar(145) DEFAULT NULL,
  `origen` varchar(145) NOT NULL,
  `motivacion` varchar(145) NOT NULL,
  `fecha` date NOT NULL,
  `categorias_idcategorias` int NOT NULL,
  PRIMARY KEY (`idPropuesta`,`categorias_idcategorias`),
  KEY `fk_Propuesta_categorias1_idx` (`categorias_idcategorias`),
  CONSTRAINT `fk_Propuesta_categorias1` FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propuesta`
--

LOCK TABLES `propuesta` WRITE;
/*!40000 ALTER TABLE `propuesta` DISABLE KEYS */;
INSERT INTO `propuesta` VALUES (13,'A','Pendiente','W','A',NULL,'Estudiante','S','2022-11-09',3);
/*!40000 ALTER TABLE `propuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propuesta_has_material`
--

DROP TABLE IF EXISTS `propuesta_has_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propuesta_has_material` (
  `Propuesta_idPropuesta` int NOT NULL,
  `Material_idMaterial` int NOT NULL,
  PRIMARY KEY (`Propuesta_idPropuesta`,`Material_idMaterial`),
  KEY `fk_Propuesta_has_Material_Material1_idx` (`Material_idMaterial`),
  KEY `fk_Propuesta_has_Material_Propuesta1_idx` (`Propuesta_idPropuesta`),
  CONSTRAINT `fk_Propuesta_has_Material_Material1` FOREIGN KEY (`Material_idMaterial`) REFERENCES `material` (`idMaterial`),
  CONSTRAINT `fk_Propuesta_has_Material_Propuesta1` FOREIGN KEY (`Propuesta_idPropuesta`) REFERENCES `propuesta` (`idPropuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propuesta_has_material`
--

LOCK TABLES `propuesta_has_material` WRITE;
/*!40000 ALTER TABLE `propuesta_has_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `propuesta_has_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 21:36:11
