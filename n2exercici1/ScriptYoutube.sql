-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: youtube
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
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal` (
  `idCanal` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `idUsuarioCreacionCanal` int NOT NULL,
  PRIMARY KEY (`idCanal`),
  KEY `fk_idUsuario_idx` (`idUsuarioCreacionCanal`),
  CONSTRAINT `idUsuarioCreacionCanal` FOREIGN KEY (`idUsuarioCreacionCanal`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentariovideo`
--

DROP TABLE IF EXISTS `comentariovideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentariovideo` (
  `idComentarioVideo` int NOT NULL,
  `Texto` mediumtext NOT NULL,
  `Fecha` date NOT NULL,
  `idUsuarioComen` int NOT NULL,
  `idVideoComentado` int NOT NULL,
  PRIMARY KEY (`idComentarioVideo`),
  KEY `fk_idUsuario_idx` (`idUsuarioComen`),
  KEY `fk_idVideo_idx` (`idVideoComentado`),
  CONSTRAINT `idUsuarioComen` FOREIGN KEY (`idUsuarioComen`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `idVideoComentado` FOREIGN KEY (`idVideoComentado`) REFERENCES `video` (`idVideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentariovideo`
--

LOCK TABLES `comentariovideo` WRITE;
/*!40000 ALTER TABLE `comentariovideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentariovideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislikecomentario`
--

DROP TABLE IF EXISTS `dislikecomentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dislikecomentario` (
  `idDislikeComentario` int NOT NULL,
  `fk2_idComentarioVideo` int NOT NULL,
  `idUsuarioDislikeComen` int NOT NULL,
  `Fecha/Hora` datetime NOT NULL,
  PRIMARY KEY (`idDislikeComentario`),
  KEY `fk_idComentarioVideo_idx` (`fk2_idComentarioVideo`),
  KEY `fk_idUsuario_idx` (`idUsuarioDislikeComen`),
  CONSTRAINT `fk2_idComentarioVideo` FOREIGN KEY (`fk2_idComentarioVideo`) REFERENCES `comentariovideo` (`idComentarioVideo`),
  CONSTRAINT `idUsuarioDislikeComen` FOREIGN KEY (`idUsuarioDislikeComen`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikecomentario`
--

LOCK TABLES `dislikecomentario` WRITE;
/*!40000 ALTER TABLE `dislikecomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `dislikecomentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislikevideo`
--

DROP TABLE IF EXISTS `dislikevideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dislikevideo` (
  `idDislikeVideo` int NOT NULL,
  `fk2_idVideo` int NOT NULL,
  `idUsuarioDislike` int NOT NULL,
  `Fecha/Hora` datetime NOT NULL,
  PRIMARY KEY (`idDislikeVideo`),
  KEY `fk_idVideo_idx` (`fk2_idVideo`),
  KEY `fk_idUsuario_idx` (`idUsuarioDislike`),
  CONSTRAINT `fk2_idVideo` FOREIGN KEY (`fk2_idVideo`) REFERENCES `video` (`idVideo`),
  CONSTRAINT `idUsuarioDislike` FOREIGN KEY (`idUsuarioDislike`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikevideo`
--

LOCK TABLES `dislikevideo` WRITE;
/*!40000 ALTER TABLE `dislikevideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dislikevideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta` (
  `idEtiqueta` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `fk_idUsuario` int NOT NULL,
  `Fecha/HoraPublicacion` datetime NOT NULL,
  `Estado` enum('Publico','Privado','Oculto') NOT NULL,
  PRIMARY KEY (`idEtiqueta`),
  KEY `fk_idUsuario_idx` (`fk_idUsuario`),
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`fk_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecomentario`
--

DROP TABLE IF EXISTS `likecomentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likecomentario` (
  `idLikeComentario` int NOT NULL,
  `fk_idComentarioVideo` int NOT NULL,
  `idUsuarioLikeComen` int NOT NULL,
  `Fecha/Hora` datetime NOT NULL,
  PRIMARY KEY (`idLikeComentario`),
  KEY `fk_idComentarioVideo_idx` (`fk_idComentarioVideo`),
  KEY `fk_idUsuario_idx` (`idUsuarioLikeComen`),
  CONSTRAINT `fk_idComentarioVideo` FOREIGN KEY (`fk_idComentarioVideo`) REFERENCES `comentariovideo` (`idComentarioVideo`),
  CONSTRAINT `idUsuarioLikeComen` FOREIGN KEY (`idUsuarioLikeComen`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecomentario`
--

LOCK TABLES `likecomentario` WRITE;
/*!40000 ALTER TABLE `likecomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `likecomentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likevideo`
--

DROP TABLE IF EXISTS `likevideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likevideo` (
  `idLikeVideo` int NOT NULL,
  `fk_idVideo` int NOT NULL,
  `idUsuarioLike` int NOT NULL,
  `Fecha/Hora` datetime NOT NULL,
  PRIMARY KEY (`idLikeVideo`),
  KEY `fk_idVideo_idx` (`fk_idVideo`),
  KEY `fk_idUsuario_idx` (`idUsuarioLike`),
  CONSTRAINT `fk_idVideo` FOREIGN KEY (`fk_idVideo`) REFERENCES `video` (`idVideo`),
  CONSTRAINT `idUsuarioLike` FOREIGN KEY (`idUsuarioLike`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likevideo`
--

LOCK TABLES `likevideo` WRITE;
/*!40000 ALTER TABLE `likevideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `likevideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `idPlayList` int NOT NULL,
  `FechaCreacion` date NOT NULL,
  `Estado` enum('publica','privada') NOT NULL,
  PRIMARY KEY (`idPlayList`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscriptores`
--

DROP TABLE IF EXISTS `suscriptores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscriptores` (
  `idSuscriptores` int NOT NULL,
  `fk_idCanal` int NOT NULL,
  `idUsuarioSuscriptor` int NOT NULL,
  PRIMARY KEY (`idSuscriptores`),
  KEY `fk_idUsuario_idx` (`idUsuarioSuscriptor`),
  KEY `fk_idCanal_idx` (`fk_idCanal`),
  CONSTRAINT `fk_idCanal` FOREIGN KEY (`fk_idCanal`) REFERENCES `canal` (`idCanal`),
  CONSTRAINT `idUsuarioSuscriptor` FOREIGN KEY (`idUsuarioSuscriptor`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscriptores`
--

LOCK TABLES `suscriptores` WRITE;
/*!40000 ALTER TABLE `suscriptores` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscriptores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  `CodigoPostal` int NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `idVideo` int NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Tamaño` int NOT NULL,
  `NombreArchivo` varchar(45) NOT NULL,
  `Duracion` time NOT NULL,
  `Thumbnail` blob,
  `NumeroReproducciones` int NOT NULL,
  `fk_idEtiqueta` int NOT NULL,
  PRIMARY KEY (`idVideo`),
  KEY `fk_idEtiqueta_idx` (`fk_idEtiqueta`),
  CONSTRAINT `fk_idEtiqueta` FOREIGN KEY (`fk_idEtiqueta`) REFERENCES `etiqueta` (`idEtiqueta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videosplaylist`
--

DROP TABLE IF EXISTS `videosplaylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videosplaylist` (
  `idVideosPlayList` int NOT NULL,
  `idUsuarioCreadorPlaylist` int NOT NULL,
  `fk_idPlaylist` int NOT NULL,
  `idVideoPlaylist` int NOT NULL,
  PRIMARY KEY (`idVideosPlayList`),
  KEY `fk_idUsuario_idx` (`idUsuarioCreadorPlaylist`),
  KEY `fk_idPlaylist_idx` (`fk_idPlaylist`),
  KEY `fk_idVideo_idx` (`idVideoPlaylist`),
  CONSTRAINT `fk_idPlaylist` FOREIGN KEY (`fk_idPlaylist`) REFERENCES `playlist` (`idPlayList`),
  CONSTRAINT `idUsuarioCreadorPlaylist` FOREIGN KEY (`idUsuarioCreadorPlaylist`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `idVideoPlaylist` FOREIGN KEY (`idVideoPlaylist`) REFERENCES `video` (`idVideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videosplaylist`
--

LOCK TABLES `videosplaylist` WRITE;
/*!40000 ALTER TABLE `videosplaylist` DISABLE KEYS */;
/*!40000 ALTER TABLE `videosplaylist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07 13:15:12
