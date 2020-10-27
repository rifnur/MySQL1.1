-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: country
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id_city` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_region` int unsigned NOT NULL,
  `id_oblast` int unsigned NOT NULL,
  PRIMARY KEY (`id_city`),
  UNIQUE KEY `idcity_UNIQUE` (`id_city`),
  KEY `fk_country_region_id_idx` (`id_region`),
  KEY `fk_country_region_city_id_idx` (`id_region`),
  KEY `fk_country_oblast_id_idx` (`id_oblast`),
  CONSTRAINT `fk_country_oblast_id` FOREIGN KEY (`id_oblast`) REFERENCES `oblast` (`id_oblast`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_country_region_id` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oblast`
--

DROP TABLE IF EXISTS `oblast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oblast` (
  `id_oblast` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_short` varchar(45) NOT NULL,
  PRIMARY KEY (`id_oblast`),
  UNIQUE KEY `idcountry_UNIQUE` (`id_oblast`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oblast`
--

LOCK TABLES `oblast` WRITE;
/*!40000 ALTER TABLE `oblast` DISABLE KEYS */;
/*!40000 ALTER TABLE `oblast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id_region` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_country` int unsigned NOT NULL,
  PRIMARY KEY (`id_region`),
  UNIQUE KEY `idregion_UNIQUE` (`id_region`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_country_country_id_idx` (`id_country`),
  CONSTRAINT `fk_country_country_id` FOREIGN KEY (`id_country`) REFERENCES `oblast` (`id_oblast`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `street`
--

DROP TABLE IF EXISTS `street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `street` (
  `id_street` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_city` int unsigned NOT NULL,
  UNIQUE KEY `iddistrict_UNIQUE` (`id_street`),
  UNIQUE KEY `namel_UNIQUE` (`name`),
  KEY `fk_country_city_id_idx` (`id_city`),
  CONSTRAINT `fk_country_city_id` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street`
--

LOCK TABLES `street` WRITE;
/*!40000 ALTER TABLE `street` DISABLE KEYS */;
/*!40000 ALTER TABLE `street` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-27 21:40:00
