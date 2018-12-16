-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: starwar
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `name` varchar(100) DEFAULT NULL,
  `race` varchar(10) DEFAULT NULL,
  `homeworld` varchar(20) DEFAULT NULL,
  `affiliation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES ('Han Solo','Human','Corellia','rebels'),('Princess Leia','Human','Alderaan','rebels'),('Luke Skywalker','Human','Tatooine','rebels'),('Darth Vader','Human','Unknown','empire'),('Chewbacca','Wookie','Kashyyyk','rebels'),('C-3 PO','Droid','Unknown','rebels'),('R2-D2','Droid','Unknown','rebels'),('Obi-Wan Kanobi','Human','Tatooine','rebels'),('Lando Calrissian','Human','Unknown','rebels'),('Yoda','Unknown','Unknown','neutral'),('Jabba the Hutt','Hutt','Unknown','neutral'),('Owen Lars','Human','Tatooine','neutral'),('Rancor','Rancor','Unknown','neutral');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planets` (
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `affiliation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planets`
--

LOCK TABLES `planets` WRITE;
/*!40000 ALTER TABLE `planets` DISABLE KEYS */;
INSERT INTO `planets` VALUES ('Tatooine','desert','neutral'),('Hoth','ice','rebels'),('Dagobah','swamp','neutral'),('Death Star','artificial','empire'),('Endor','forest','neutral'),('Bespin','gas','neutral'),('Star Destroyer','artificial','empire'),('Kashyyyk','forest','rebels'),('Corellia','temperate','rebels'),('Alderaan','temperate','rebels');
/*!40000 ALTER TABLE `planets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_table`
--

DROP TABLE IF EXISTS `time_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_table` (
  `character_name` varchar(100) DEFAULT NULL,
  `planet_name` varchar(100) DEFAULT NULL,
  `movie` int(11) DEFAULT NULL,
  `time_of_arrival` int(11) DEFAULT NULL,
  `time_of_departure` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_table`
--

LOCK TABLES `time_table` WRITE;
/*!40000 ALTER TABLE `time_table` DISABLE KEYS */;
INSERT INTO `time_table` VALUES ('Yoda','Dagobah',1,0,10),('Yoda','Dagobah',2,0,10),('Yoda','Dagobah',3,0,5),('Rancor','Tatooine',1,0,10),('Rancor','Tatooine',2,0,10),('Rancor','Tatooine',3,0,3),('Owen Lars','Tatooine',1,0,1),('Obi-Wan Kanobi','Tatooine',1,0,2),('Obi-Wan Kanobi','Star Destroyer',1,3,5),('Darth Vader','Star Destroyer',1,0,9),('Darth Vader','Death Star',1,9,10),('Darth Vader','Hoth',2,3,4),('Darth Vader','Bespin',2,5,10),('Darth Vader','Death Star',3,1,9),('Han Solo','Tatooine',1,0,2),('Han Solo','Star Destroyer',1,3,5),('Han Solo','Bespin',2,5,9),('Han Solo','Tatooine',3,0,2),('Han Solo','Endor',3,5,10),('Jabba the Hutt','Tatooine',1,0,10),('Jabba the Hutt','Tatooine',2,0,10),('Jabba the Hutt','Tatooine',3,0,2),('Lando Calrissian','Bespin',2,0,9),('Lando Calrissian','Endor',3,9,10),('Lando Calrissian','Tatooine',3,0,2),('Princess Leia','Star Destroyer',1,1,5),('Princess Leia','Hoth',2,0,4),('Han Solo','Hoth',2,0,4),('Princess Leia','Bespin',2,5,9),('Princess Leia','Tatooine',3,0,2),('Princess Leia','Endor',3,5,10),('Luke Skywalker','Tatooine',1,0,2),('Luke Skywalker','Star Destroyer',1,3,5),('Luke Skywalker','Death Star',1,9,10),('Luke Skywalker','Hoth',2,0,2),('Luke Skywalker','Dagobah',2,4,8),('Luke Skywalker','Bespin',2,8,10),('Luke Skywalker','Tatooine',3,1,2),('Luke Skywalker','Endor',3,5,8),('Luke Skywalker','Death Star',3,8,10),('Luke Skywalker','Dagobah',3,4,5),('R2-D2','Dagobah',3,4,5),('R2-D2','Dagobah',2,4,8),('R2-D2','Bespin',2,8,10),('R2-D2','Endor',3,5,8),('R2-D2','Hoth',2,0,2),('C-3 PO','Tatooine',1,0,2),('C-3 PO','Tatooine',3,0,2),('C-3 PO','Hoth',2,0,2),('Chewbacca','Tatooine',1,0,2);
/*!40000 ALTER TABLE `time_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-15 17:23:31
