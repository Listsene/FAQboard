-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: iousoft_forum
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `content` varchar(300) DEFAULT NULL,
  `author` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_table_UNIQUE` (`question_id`),
  KEY `fk_type` (`type_id`),
  CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (11,1,'Have you used Vue?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(12,1,'How to add Foreign Key?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(13,3,'What is a singleton?','Sample answer','Admin','2022-05-23 12:34:56',1),(14,3,'What is SELECT FOR UPDATE?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(15,1,'How to add Foreign Key?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(16,1,'How long will this go on?','Sample answer','Admin','2022-05-23 12:34:56',1),(17,3,'What is a transaction?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(18,1,'What are constructors?','Sample answer','연구소장','2022-05-23 12:34:56',1),(19,2,'How long will this go on?','Sample answer','Admin','2022-05-23 12:34:56',1),(20,2,'Have you used React?','Sample answer','HR','2022-05-23 12:34:56',1),(21,3,'How to add Foreign Key?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(22,3,'What is a transaction?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(23,2,'What is SELECT FOR UPDATE?','Sample answer','연구소장','2022-05-23 12:34:56',1),(24,3,'How long will this go on?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(25,1,'How to add Foreign Key?','Sample answer','팀원','2022-05-23 12:34:56',1),(26,3,'How long will this go on?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(27,1,'What are constructors?','Sample answer','HR','2022-05-23 12:34:56',1),(28,1,'What is a singleton?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(29,1,'How long will this go on?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(30,1,'What is a jdk?','Sample answer','연구소장','2022-05-23 12:34:56',1),(31,1,'Have you used React?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(32,2,'What is a static method?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(33,1,'What is a jdk?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(34,1,'What is SELECT FOR UPDATE?','Sample answer','Admin','2022-05-23 12:34:56',1),(35,1,'What is a jdk?','Sample answer','Admin','2022-05-23 12:34:56',1),(36,1,'How to add Foreign Key?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(37,1,'Have you used React?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(38,1,'What is a transaction?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(39,1,'How to initialize a var?','Sample answer','팀원','2022-05-23 12:34:56',1),(40,2,'What is a jdk?','Sample answer','Admin','2022-05-23 12:34:56',1),(41,2,'What is a static method?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(42,2,'What are constructors?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(43,2,'What is a static method?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(44,1,'What is SELECT FOR UPDATE?','Sample answer','연구소장','2022-05-23 12:34:56',1),(45,2,'How to add Foreign Key?','Sample answer','Admin','2022-05-23 12:34:56',1),(46,1,'How to initialize a var?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(47,1,'How to initialize a var?','Sample answer','HR','2022-05-23 12:34:56',1),(48,2,'What is a singleton?','Sample answer','HR','2022-05-23 12:34:56',1),(49,1,'What is a singleton?','Sample answer','팀원','2022-05-23 12:34:56',1),(50,2,'What is a static method?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(51,3,'What is a static method?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(52,2,'Have you used React?','Sample answer','Admin','2022-05-23 12:34:56',1),(53,3,'What is a singleton?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(54,1,'What are constructors?','Sample answer','HR','2022-05-23 12:34:56',1),(55,1,'What is SELECT FOR UPDATE?','Sample answer','Admin','2022-05-23 12:34:56',1),(56,3,'What is a singleton?','Sample answer','팀원','2022-05-23 12:34:56',1),(57,3,'How to initialize a var?','Sample answer','연구소장','2022-05-23 12:34:56',1),(58,3,'How to add Foreign Key?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(59,2,'What is a singleton?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(60,3,'How long will this go on?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(61,3,'What is SELECT FOR UPDATE?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(62,3,'What is a jdk?','Sample answer','Admin','2022-05-23 12:34:56',1),(63,2,'What is a jdk?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(64,2,'How to add Foreign Key?','Sample answer','팀원','2022-05-23 12:34:56',1),(65,2,'What are constructors?','Sample answer','Admin','2022-05-23 12:34:56',1),(66,3,'What is a transaction?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(67,2,'How to add Foreign Key?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(68,2,'What is SELECT FOR UPDATE?','Sample answer','팀원','2022-05-23 12:34:56',1),(69,3,'What is SELECT FOR UPDATE?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(70,2,'What are constructors?','Sample answer','Admin','2022-05-23 12:34:56',1),(71,1,'How long will this go on?','Sample answer','팀원','2022-05-23 12:34:56',1),(72,3,'Have you used React?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(73,3,'How long will this go on?','Sample answer','Admin','2022-05-23 12:34:56',1),(74,1,'How to initialize a var?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(75,3,'Have you used React?','Sample answer','Admin','2022-05-23 12:34:56',1),(76,1,'How to initialize a var?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(77,1,'Have you used React?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(78,1,'What is a transaction?','Sample answer','연구소장','2022-05-23 12:34:56',1),(79,3,'What is a singleton?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(80,3,'What is SELECT FOR UPDATE?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(81,2,'How to add Foreign Key?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(82,1,'How long will this go on?','Sample answer','HR','2022-05-23 12:34:56',1),(83,2,'Have you used React?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(84,3,'How long will this go on?','Sample answer','HR','2022-05-23 12:34:56',1),(85,3,'What is a transaction?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(86,1,'How to add Foreign Key?','Sample answer','ê°ë°1íì¥','2022-05-23 12:34:56',2),(87,2,'What is a jdk?','Sample answer','HR','2022-05-23 12:34:56',1),(88,2,'What is SELECT FOR UPDATE?','Sample answer','Admin','2022-05-23 12:34:56',1),(89,2,'How long will this go on?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(90,3,'What is a singleton?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(91,3,'How to add Foreign Key?','Sample answer','Admin','2022-05-23 12:34:56',1),(92,3,'What is a singleton?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(93,3,'How to initialize a var?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(94,1,'What is a jdk?','Sample answer','연구소장','2022-05-23 12:34:56',1),(95,3,'How to initialize a var?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(96,1,'How long will this go on?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(97,1,'Have you used React?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(98,3,'How long will this go on?','Sample answer','팀원','2022-05-23 12:34:56',1),(99,1,'What is a transaction?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(100,1,'How long will this go on?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(101,2,'What is a transaction?','Sample answer','HR','2022-05-23 12:34:56',1),(102,3,'What is SELECT FOR UPDATE?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(103,3,'What are constructors?','Sample answer','HR','2022-05-23 12:34:56',1),(104,2,'How to add Foreign Key?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(105,1,'What is a singleton?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(106,2,'What is a transaction?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(107,1,'Have you used Vue?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(108,1,'How long will this go on?','Sample answer','연구소장','2022-05-23 12:34:56',1),(109,1,'What is a static method?','Sample answer','연구소장','2022-05-23 12:34:56',2),(110,1,'What is a singleton? 11','Sample answer 2222','Ã¬ÂÂ Ã¬ÂÂÃ¬ÂÂ°ÃªÂµÂ¬Ã¬ÂÂ','2022-05-23 12:34:56',8),(111,1,'test','test','test','2022-05-23 12:34:56',1),(112,1,'test','test','test','2022-05-23 12:34:56',2),(113,1,'new','something','tester','2022-05-23 12:34:56',2),(114,1,'','','','2022-05-23 12:34:56',1),(115,3,'type insert','type','리디','2022-05-23 12:34:56',10),(116,2,'type insert','js','js','2022-05-23 12:34:56',1),(117,1,'type insert','type','typer','2022-05-23 12:34:56',1),(118,1,'type insert','type','typer','2022-05-23 12:34:56',1),(119,1,'되나요?','하하','미','2022-05-23 12:34:56',1),(120,2,'Have you used Vue?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(121,3,'What is a jdk?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(122,1,'How to add Foreign Key?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(123,3,'Have you used Vue?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(124,3,'What is a jdk?','Sample answer','Admin','2022-05-23 12:34:56',1),(125,2,'How to initialize a var?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(126,2,'How long will this go on?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(127,3,'How to initialize a var?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(128,1,'What are constructors?','Sample answer','Admin','2022-05-23 12:34:56',1),(129,2,'What are constructors?','Sample answer','연구소장','2022-05-23 12:34:56',1),(130,2,'How long will this go on?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(131,1,'What is a transaction?','Sample answer','연구소장','2022-05-23 12:34:56',1),(132,1,'How to add Foreign Key?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(133,1,'How to initialize a var?','Sample answer','팀원','2022-05-23 12:34:56',1),(134,3,'Have you used Vue?','Sample answer','Admin','2022-05-23 12:34:56',1),(135,2,'How to initialize a var?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(136,3,'What is SELECT FOR UPDATE?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(137,1,'How long will this go on?','Sample answer','Admin','2022-05-23 12:34:56',1),(138,1,'Have you used Vue?','Sample answer','팀원','2022-05-23 12:34:56',1),(139,1,'How long will this go on?','Sample answer','Admin','2022-05-23 12:34:56',1),(140,3,'Have you used Vue?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(141,1,'What is a static method?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(142,3,'Have you used React?','Sample answer','HR','2022-05-23 12:34:56',1),(143,2,'What are constructors?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(144,3,'What is a jdk?','Sample answer','연구소장','2022-05-23 12:34:56',1),(145,3,'Have you used Vue?','Sample answer','HR','2022-05-23 12:34:56',1),(146,3,'What is a singleton?','Sample answer','HR','2022-05-23 12:34:56',1),(147,3,'What is a transaction?','Sample answer','팀원','2022-05-23 12:34:56',1),(148,3,'How long will this go on?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(149,2,'How to add Foreign Key?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(150,2,'Have you used Vue?','Sample answer','HR','2022-05-23 12:34:56',1),(151,2,'What is a transaction?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(152,1,'How to initialize a var?','Sample answer','팀원','2022-05-23 12:34:56',1),(153,3,'How to initialize a var?','Sample answer','Admin','2022-05-23 12:34:56',1),(154,2,'What is SELECT FOR UPDATE?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(155,3,'What is a jdk?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(156,2,'What is a singleton?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(157,3,'Have you used React?','Sample answer','개발1팀장','2022-05-23 12:34:56',1),(158,3,'Have you used React?','Sample answer','팀원','2022-05-23 12:34:56',1),(159,1,'Have you used Vue?','Sample answer','선임연구원','2022-05-23 12:34:56',1),(160,3,'What is SELECT FOR UPDATE?','Sample answer','재발2팀장','2022-05-23 12:34:56',1),(161,3,'Have you used React?','Sample answer','HR','2022-05-23 12:34:56',1),(162,1,'What is a jdk?','Sample answer','책임연구원','2022-05-23 12:34:56',1),(163,1,'What is a singleton?','Sample answer','연구소장','2022-05-23 12:34:56',1),(164,1,'How to add Foreign Key?','Sample answer','연구소장','2022-05-23 12:34:56',1),(165,1,'Have you used Vue?','Sample answer','팀원','2022-05-23 12:34:56',1),(166,1,'What is a transaction?','Sample answer','Admin','2022-05-23 12:34:56',2),(167,2,'What is a jdk?','Sample answer','책임연구원','2022-05-23 12:34:56',4),(168,3,'What is SELECT FOR UPDATE?','Sample answer','선임연구원','2022-05-23 12:34:56',16),(169,1,'How long will this go on?','Sample answer','팀원','2022-05-23 12:34:56',2),(170,1,'나의 제목','없음','나','2022-05-23 12:34:56',4),(171,1,'test','test','test','2022-05-23 12:34:56',1),(172,1,'What is it?','not sure','팀원','2022-05-23 00:00:00',11),(173,2,'Is it working?','it seems so','팀원','2022-05-24 23:27:51',8),(174,1,'What is NoSQL?','A type of database.','팀원','2022-05-25 10:12:59',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id_UNIQUE` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'DB'),(2,'JS'),(3,'Java');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-25 10:20:03
