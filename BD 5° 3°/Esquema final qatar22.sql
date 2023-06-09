-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mundialqatar
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `IDarbitro` int NOT NULL AUTO_INCREMENT,
  `ApellidoNombreArbitro` varchar(100) NOT NULL,
  `NacionalidadArbitro` varchar(45) NOT NULL,
  `FechaNacimientoArbitro` date NOT NULL,
  PRIMARY KEY (`IDarbitro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (1,'Mukansanga Salima','africana','1988-06-25'),(2,'Rapallini Fernando','argentino','1978-04-28'),(3,'Vigliano Mauro','argentino','1975-08-05'),(4,'Frappart Stephanie','Francesa','1983-12-14');
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbitro_partido`
--

DROP TABLE IF EXISTS `arbitro_partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro_partido` (
  `ARBITRO_IDarbitro` int NOT NULL,
  `PARTIDO_IDpartido` int NOT NULL,
  PRIMARY KEY (`ARBITRO_IDarbitro`,`PARTIDO_IDpartido`),
  KEY `fk_ARBITRO_has_PARTIDO_PARTIDO1_idx` (`PARTIDO_IDpartido`),
  KEY `fk_ARBITRO_has_PARTIDO_ARBITRO_idx` (`ARBITRO_IDarbitro`),
  CONSTRAINT `fk_ARBITRO_has_PARTIDO_ARBITRO` FOREIGN KEY (`ARBITRO_IDarbitro`) REFERENCES `arbitro` (`IDarbitro`),
  CONSTRAINT `fk_ARBITRO_has_PARTIDO_PARTIDO1` FOREIGN KEY (`PARTIDO_IDpartido`) REFERENCES `partido` (`IDpartido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro_partido`
--

LOCK TABLES `arbitro_partido` WRITE;
/*!40000 ALTER TABLE `arbitro_partido` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbitro_partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directortecnico`
--

DROP TABLE IF EXISTS `directortecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directortecnico` (
  `IDDirector` int NOT NULL AUTO_INCREMENT,
  `Nacionalidad` varchar(45) NOT NULL,
  `ApellidoNombre` varchar(45) NOT NULL,
  `FechaNacimiento` varchar(45) NOT NULL,
  PRIMARY KEY (`IDDirector`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directortecnico`
--

LOCK TABLES `directortecnico` WRITE;
/*!40000 ALTER TABLE `directortecnico` DISABLE KEYS */;
INSERT INTO `directortecnico` VALUES (1,'Argentino','Lionel Scaloni','1978-05-16'),(2,'francés','Hervé Renard','1968-09-30'),(3,'argentino','Gerardo Daniel Martino','1962-11-20'),(4,'ruso','Czestaw Michniewicz','1970-02-12');
/*!40000 ALTER TABLE `directortecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `NombreEstadio` varchar(150) NOT NULL,
  `CiudadEstadio` varchar(100) NOT NULL,
  PRIMARY KEY (`NombreEstadio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadio`
--

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES ('Estadio 974','Doha'),('Estadio Al Thumama','Doha'),('Estadio Al-Bayt','Jor'),('Estadio Al-Janoub','Al Wakrah'),('Estadio Internacional Khalifa','Doha'),('Estadio Nacional de Lusail','Lusail');
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `IDJugador` int NOT NULL AUTO_INCREMENT,
  `NombreApellidoJugador` varchar(100) NOT NULL,
  `NacionalidadJugador` varchar(50) NOT NULL,
  `FechaNacimientoJugador` date NOT NULL,
  `NroCamisetaJugador` int NOT NULL,
  `pais_NombrePais` varchar(50) NOT NULL,
  PRIMARY KEY (`IDJugador`),
  KEY `fk_jugador_pais1_idx` (`pais_NombrePais`),
  CONSTRAINT `fk_jugador_pais1` FOREIGN KEY (`pais_NombrePais`) REFERENCES `pais` (`NombrePais`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (8,'Damiián Emiliano Martínez','argentino','1992-09-02',23,'Argentina'),(9,'Paulo Dybala','argentino','1993-11-15',21,'Argentina'),(10,'Julián Álvarez','argentino','2000-01-31',9,'Argentina'),(11,'Ángel Di María','argentino','1988-02-14',11,'Argentina'),(12,'Lisandro Martínez','argentino','1998-01-18',8,'Argentina'),(13,'Lautaro Martínez','argentino','1997-08-22',22,'Argentina'),(14,'Rodrigo De Paul','argentino','1994-05-24',7,'Argentina'),(15,'Alexis Mac Allister','argentino','1998-12-24',6,'Argentina'),(16,'Cristian Gabriel Romero','argentino','1998-04-27',2,'Argentina'),(17,'Nahuel Molina','argentino','1998-04-06',4,'Argentina'),(18,'Giovani Lo Celso','argentino','1996-04-09',20,'Argentina'),(19,'Guillermo Ochoa','mexicano','1985-07-13',13,'México'),(20,'Jesús Angulo','mexicano','1998-01-30',27,'México'),(21,'César Montes','mexicano','1997-02-24',3,'México'),(22,'Mohammed Al Owais','árabe','1991-10-10',21,'Arabia Saudita'),(23,'Yasser Al Shahrani','árabe','1992-05-25',13,'Arabia Saudita'),(24,'Mohammed Al Burayk','árabe','1992-09-15',2,'Arabia Saudita'),(25,'Jakub Kiwior','polaco','2000-02-15',14,'Polonia'),(26,'Nicola Zalewski','polaco','2002-01-23',21,'Polonia'),(27,'Bartosz Bereszynski','polaco','1992-07-12',18,'Polonia');
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `NombrePais` varchar(50) NOT NULL,
  `directortecnico_IDDirector` int NOT NULL,
  PRIMARY KEY (`NombrePais`),
  KEY `fk_pais_directortecnico1_idx` (`directortecnico_IDDirector`),
  CONSTRAINT `fk_pais_directortecnico1` FOREIGN KEY (`directortecnico_IDDirector`) REFERENCES `directortecnico` (`IDDirector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('Argentina',1),('Arabia Saudita',2),('México',3),('Polonia',4);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `IDpartido` int NOT NULL AUTO_INCREMENT,
  `Resultado` varchar(5) NOT NULL,
  `FechaPartido` date NOT NULL,
  `estadio_NombreEstadio` varchar(150) NOT NULL,
  PRIMARY KEY (`IDpartido`),
  KEY `fk_partido_estadio1_idx` (`estadio_NombreEstadio`),
  CONSTRAINT `fk_partido_estadio1` FOREIGN KEY (`estadio_NombreEstadio`) REFERENCES `estadio` (`NombreEstadio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (4,'3-0','2022-11-22','Estadio Nacional de Lusail'),(5,'7-1','2022-11-26','Estadio Nacional de Lusail'),(6,'1-1','2022-11-30','Estadio 974');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido_has_pais`
--

DROP TABLE IF EXISTS `partido_has_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido_has_pais` (
  `partido_IDpartido` int NOT NULL,
  `pais_NombrePais` varchar(50) NOT NULL,
  PRIMARY KEY (`partido_IDpartido`,`pais_NombrePais`),
  KEY `fk_partido_has_pais_pais1_idx` (`pais_NombrePais`),
  KEY `fk_partido_has_pais_partido1_idx` (`partido_IDpartido`),
  CONSTRAINT `fk_partido_has_pais_pais1` FOREIGN KEY (`pais_NombrePais`) REFERENCES `pais` (`NombrePais`),
  CONSTRAINT `fk_partido_has_pais_partido1` FOREIGN KEY (`partido_IDpartido`) REFERENCES `partido` (`IDpartido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido_has_pais`
--

LOCK TABLES `partido_has_pais` WRITE;
/*!40000 ALTER TABLE `partido_has_pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `partido_has_pais` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-11 15:40:36
