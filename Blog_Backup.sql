CREATE DATABASE  IF NOT EXISTS `blog_website` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog_website`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog_website
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varbinary(75) DEFAULT NULL,
  `profile_photo_id` int DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `FK_person` (`profile_photo_id`),
  CONSTRAINT `FK_person` FOREIGN KEY (`profile_photo_id`) REFERENCES `photo` (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Barbara','Hodge','b.hodge@company.com',_binary '$2a$12$t8RXltW1.6h/N/AN2cfb6OJRokyD93mVfV.DU/OiOQmKtta52vq8O',1),(2,'James','Buckles','j.buckles@company.com',_binary '$2a$12$z2kxr0YG0Rl4kyPHv392VOygP.3B4R9QRWzfVykxJ4uQHBQBko78S',2),(3,'Natalie','Wilhite','bestest.forever@example.com',_binary '$2a$12$u6UeDFpFgnBlcg2rLJN6a.v95JU.MPCm/1RAWO1e5bV7QwbVvKB6i',NULL),(4,'Mary','Barnett','lifeisahighway@example.com',_binary '$2a$12$x.vc6It47K4ZktZLonV1iewq5qvXf6/ZLM0RJJVH/Jviy862XB/3W',3),(5,'Richard','Tipton','tippertapper266602@gmail.com',_binary '$2a$12$WLec1vMhA2UsRvsXozlU.uSGmlEqFpwzuqE8zVOPKtWR0BkZc4FAy',5);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `photo_id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(250) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caption` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'barbara_profile.jpg','2025-03-24 01:22:11','barbara\'s profile'),(2,'img_9203710.jpg','2025-03-24 01:22:11','James\'s Profile'),(3,'dcim_38118385.jpg','2025-03-24 01:22:11','Mary'),(4,'knitting.jpg','2025-03-24 01:22:11','Knitted Touques'),(5,'img_28391910488.jpg','2025-03-24 01:22:11','Richard'),(6,'img_21838392835.jpg','2025-03-24 01:22:11','Mickey Mouse Cookies'),(7,'img_38201884043.jpg','2025-03-24 01:22:11','So Cute!'),(8,'img_28320384855.jpg','2025-03-24 01:22:11','Smiling Already'),(9,'Rainbow.jpg','2025-03-24 01:22:11','Rainbow Quilty'),(10,'Stereo1.jpg','2025-03-24 01:22:11','Front Panel'),(11,'Stereo2.jpg','2025-03-24 01:22:11','Bass Speakers Installed'),(12,'new_shed.jpg','2025-03-24 01:22:11','Shed inside empty'),(13,'Rose.jpg','2025-03-24 01:22:11','Rose'),(14,'Putter.jpg','2025-03-24 01:22:11','Putter'),(15,'nine-iron.jpg','2025-03-24 01:22:11','9 Iron'),(16,'Driver.jpg','2025-03-24 01:22:11','Driver');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` longtext,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `person_id` int NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK_post` (`person_id`),
  CONSTRAINT `FK_post` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Mickey Mouse Cookies','I found this great recipe for sugar cookies and a new Mickey Mouse cookie butter.','2019-04-14 00:00:00','2019-04-15 00:00:00',1),(2,'Touques for infants','I\'m knitting touques for our grandchild that should be born soon!','2019-02-15 00:00:00','2019-02-16 00:00:00',3),(3,'Our newest family member!','Congratulations to our daughter on their new bundle of joy! Theresa May- Born March 3. 2019.','2019-03-04 00:00:00','2019-03-04 00:00:00',3),(4,'Rainbow Quilt','Beautiful new rainbow quilt for our newest granddaughter','2019-03-29 00:00:00','2019-04-01 00:00:00',3),(5,'New Car Stereo and Speakers','Best Bass Ever! You can hear me from 5 blocks away!','2019-05-09 00:00:00','2019-05-09 00:00:00',2),(6,'Garden Shed','New garden shed has room for the lawn mowers and all our garden tools.','2019-05-22 00:00:00','2019-05-22 00:00:00',2),(7,'Great way to hang pictures','It\'s simple and cost effective!','2019-04-27 00:00:00','2019-04-27 00:00:00',4),(8,'Beautiful color, beautiful smell','Found a great place to buy the best roses!','2019-04-14 00:00:00','2019-04-16 00:00:00',4),(9,'Set of golf clubs for sale','A friend of mine is selling his set of clubs before he moves to Sasketchewan','2019-05-12 00:00:00','2019-05-15 00:00:00',2),(10,'Change your own oil, save hundreds!','Mechanics are too expensive, and it\'s not that hard to do it yourself.','2019-02-22 00:00:00','2019-02-22 00:00:00',2),(11,'Awesome Floor Mats','Keep your car clean with this awesome car mats!','2019-03-03 00:00:00','2019-03-03 00:00:00',2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comment` (
  `post_comment_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `person_id` int DEFAULT NULL,
  `comment` longtext,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`post_comment_id`),
  UNIQUE KEY `UQ_post_comment` (`post_id`,`person_id`),
  KEY `FK2_post_comment` (`person_id`),
  CONSTRAINT `FK2_post_comment` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `FK_post_comment` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
INSERT INTO `post_comment` VALUES (43,1,3,'I\'m going to try those myself!','2025-03-25 10:55:25'),(44,3,1,'Congratulations!','2025-03-25 10:55:25'),(45,3,2,'How does it feel to be a grandma?','2025-03-25 10:55:25'),(46,4,1,'Can you make me one next?','2025-03-25 10:55:25'),(47,6,1,'What colour are you going to paint your shed?','2025-03-25 10:55:25'),(48,9,5,'I need a good set of clubs; I\'ll take them!','2025-03-25 10:55:25');
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_like` (
  `post_like_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `person_id` int DEFAULT NULL,
  PRIMARY KEY (`post_like_id`),
  UNIQUE KEY `UQ_post_like` (`post_id`,`person_id`),
  KEY `FK2_post_like` (`person_id`),
  CONSTRAINT `FK2_post_like` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `FK_post_like` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_like`
--

LOCK TABLES `post_like` WRITE;
/*!40000 ALTER TABLE `post_like` DISABLE KEYS */;
INSERT INTO `post_like` VALUES (1,1,3),(2,2,4),(3,3,1),(4,3,2),(5,3,4),(6,3,5),(8,5,5),(12,9,5);
/*!40000 ALTER TABLE `post_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_photo`
--

DROP TABLE IF EXISTS `post_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_photo` (
  `post_photo_id` int NOT NULL AUTO_INCREMENT,
  `photo_id` int DEFAULT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`post_photo_id`),
  UNIQUE KEY `UQ_post_photo` (`photo_id`,`post_id`),
  KEY `FK2_post_photo` (`post_id`),
  CONSTRAINT `FK2_post_photo` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `FK_post_photo` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_photo`
--

LOCK TABLES `post_photo` WRITE;
/*!40000 ALTER TABLE `post_photo` DISABLE KEYS */;
INSERT INTO `post_photo` VALUES (39,NULL,7),(44,NULL,10),(45,NULL,11),(32,4,2),(31,6,1),(34,7,3),(33,8,3),(35,9,4),(37,10,5),(36,11,5),(38,12,6),(40,13,8),(41,14,9),(43,15,9),(42,16,9);
/*!40000 ALTER TABLE `post_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `post_tag_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `tag_id` int DEFAULT NULL,
  PRIMARY KEY (`post_tag_id`),
  UNIQUE KEY `UQ_post_tag` (`post_id`,`tag_id`),
  KEY `FK2_post_tag` (`tag_id`),
  CONSTRAINT `FK2_post_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`),
  CONSTRAINT `FK_post_tag` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (19,1,1),(20,1,2),(21,1,3),(40,2,3),(37,2,4),(24,3,NULL),(25,4,3),(26,4,4),(28,5,4),(27,5,5),(29,6,4),(30,6,6),(31,7,6),(32,8,NULL),(33,9,7),(35,10,4),(34,10,5),(36,11,5);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_post`
--

DROP TABLE IF EXISTS `read_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_post` (
  `read_post_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `person_id` int DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`read_post_id`),
  UNIQUE KEY `UQ_read_post` (`post_id`,`person_id`),
  KEY `FK2_read_post` (`person_id`),
  CONSTRAINT `FK2_read_post` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `FK_read_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_post`
--

LOCK TABLES `read_post` WRITE;
/*!40000 ALTER TABLE `read_post` DISABLE KEYS */;
INSERT INTO `read_post` VALUES (17,1,4,'2025-03-24 03:40:49'),(18,1,3,'2025-03-24 03:40:49'),(19,2,4,'2025-03-24 03:40:49'),(20,3,1,'2025-03-24 03:40:49'),(21,3,2,'2025-03-24 03:40:49'),(22,3,4,'2025-03-24 03:40:49'),(23,3,5,'2025-03-24 03:40:49'),(24,4,1,'2025-03-24 03:40:49'),(25,5,5,'2025-03-24 03:40:49'),(26,6,1,'2025-03-24 03:40:49'),(27,6,5,'2025-03-24 03:40:49'),(28,7,1,'2025-03-24 03:40:49'),(30,9,5,'2025-03-24 03:40:49'),(31,10,5,'2025-03-24 03:40:49'),(32,11,1,'2025-03-24 03:40:49');
/*!40000 ALTER TABLE `read_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'baking'),(2,'cooking'),(3,'crafts'),(4,'DIY'),(5,'cars'),(6,'home repair'),(7,'sports'),(8,'music'),(9,'shopping');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'blog_website'
--

--
-- Dumping routines for database 'blog_website'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25 12:03:49
