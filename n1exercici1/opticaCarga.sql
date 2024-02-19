-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Teléfono` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `idRecomienda` int NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idCliente_idx` (`idRecomienda`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idRecomienda`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `idGafas` int NOT NULL,
  `MARCA` varchar(45) NOT NULL,
  `GraduacionIzq` float NOT NULL,
  `GraduacionDrch` float NOT NULL,
  `TipoMontura` varchar(45) DEFAULT NULL,
  `ColorMontura` varchar(45) DEFAULT NULL,
  `ColorCristal` varchar(45) DEFAULT NULL,
  `Precio` float NOT NULL,
  `idPROVEEDOR` int NOT NULL,
  PRIMARY KEY (`idGafas`),
  KEY `idPROVEEDOR_idx` (`idPROVEEDOR`),
  CONSTRAINT `idPROVEEDOR` FOREIGN KEY (`idPROVEEDOR`) REFERENCES `proveedor` (`idPROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,'Rayban',3.5,3.5,'Flotante','Lila','Azul',87,5),(2,'Prada',5,4.6,'Metálica','Oro','Blanco',100,1),(3,'Carolina Herrera',0.75,1.2,'Pasta','Verde','Blanco',78.35,3),(4,'Etnia',2,4.5,'Metálica','Gris','Blanco',102.36,2),(5,'Vogue',1.5,8,'Flotandte','Transparente','Blanco',89.36,4),(6,'Rayban',4,4,'Pasta','Negra','Blanco',145.45,6),(7,'Prada',7,5.2,'Pasta','Blanca','Naranja',245.65,6),(8,'Carolina Herrera',2,3,'Metálica','Azul','Blanco',125,6),(9,'Etnia',1.25,2.5,'Flotante','Gris','Blanco',150.45,6),(10,'Vogue',2,3.25,'Metálica','Roja','Blanco',125.78,6),(11,'Rayban',5,4.2,'Pasta','Leopardo','Sepia',345.78,5),(12,'Prada',2.5,3,'Pasta','Verde','Sepia',357,1),(13,'Carolina Herrera',5.2,3,'Metálica','Granate','Blanco',125.45,3),(14,'Etnia',3.75,4.25,'Metálica','Negro','Blanco',223.54,2),(15,'Vovue',2.75,2.25,'Pasta','Amarillo','Blanco',358.74,4);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idPROVEEDOR` int NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `DIRECCION` varchar(45) DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `FAX` int DEFAULT NULL,
  `NIF` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idPROVEEDOR`),
  UNIQUE KEY `NIF` (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Juan','Plz Mayor, 15 08016 Barcelona',676558895,963587410,'32165498T'),(2,'Maria','C/Vista, 8, 1º2ª, 48556 Madrid, España',658985465,987452541,'47895236G'),(3,'Pedro','C/Aragó 125, entlo 1ª 08004, Bcn, Spain',658978452,936587412,'74875489F'),(4,'Jaime','C/Luz, 8, 2º1ª, 28457 Murcia, Spain',658974521,958647412,'74521896D'),(5,'Charles','Maison Street, 4, 4º6ºB, London',687596412,0,'Y4589652F'),(6,'Cintia','Avenida España, 16, 9º1ª, Sevilla, Spain',658745896,986547123,'45698712Z');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL,
  `Empleado` varchar(45) NOT NULL,
  `Fecha` datetime NOT NULL,
  `idGafas` int NOT NULL,
  `fk1_idCliente` int NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idGafas_idx` (`idGafas`),
  KEY `idCliente_idx` (`fk1_idCliente`),
  CONSTRAINT `fk1_idCliente` FOREIGN KEY (`fk1_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `idGafas` FOREIGN KEY (`idGafas`) REFERENCES `gafas` (`idGafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 12:00:14
