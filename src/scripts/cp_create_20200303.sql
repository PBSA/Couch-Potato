CREATE DATABASE  IF NOT EXISTS `couch_potato` /*!40100 DEFAULT CHARACTER SET utf8mb4  */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `couch_potato`;
-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: couch_potato
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `errorlog`
--

DROP TABLE IF EXISTS `errorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `errorlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(4) NOT NULL,
  `subcode` varchar(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errorlog`
--

LOCK TABLES `errorlog` WRITE;
/*!40000 ALTER TABLE `errorlog` DISABLE KEYS */;
INSERT INTO `errorlog` VALUES (1,'2020-03-03 15:14:49','520','520','BOS server may not be available','\"{\"call\":\"canceled\",\"unique_string\":\"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\",\"timestamp\":\"2020-03-03T19:13:34Z\",\"arguments\":{},\"id\":{\"home\":\"Sacramento Kings\",\"away\":\"Washington Wizards\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00.000Z\",\"event_group_name\":\"NBA Regular Season\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:13:34.000Z\"}}\"','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(2,'2020-03-03 15:14:49','520','520','BOS server may not be available','\"{\"call\":\"canceled\",\"unique_string\":\"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\",\"timestamp\":\"2020-03-03T19:14:49Z\",\"arguments\":{},\"id\":{\"home\":\"Sacramento Kings\",\"away\":\"Washington Wizards\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00.000Z\",\"event_group_name\":\"NBA Regular Season\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:14:49.000Z\"}}\"','http://35.183.41.242:8010/trigger'),(3,'2020-03-03 15:14:49','520','520','BOS server may not be available','\"{\"call\":\"canceled\",\"unique_string\":\"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\",\"timestamp\":\"2020-03-03T19:14:49Z\",\"arguments\":{},\"id\":{\"home\":\"Sacramento Kings\",\"away\":\"Washington Wizards\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00.000Z\",\"event_group_name\":\"NBA Regular Season\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:14:49.000Z\"}}\"','https://bdataproxy.bookie.host/trigger');
/*!40000 ALTER TABLE `errorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `league` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_idx` (`user`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (79,35,'NBA Regular Season','2020-03-04');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `event` int(11) NOT NULL,
  `hometeam` varchar(100) NOT NULL,
  `awayteam` varchar(100) NOT NULL,
  `starttime` varchar(12) NOT NULL,
  `homescore` int(11) DEFAULT NULL,
  `awayscore` int(11) DEFAULT NULL,
  `whistle_start_time` varchar(32) DEFAULT NULL,
  `whistle_end_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`,`user`),
  KEY `user_idx` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (240,35,79,'Charlotte Hornets','San Antonio Spurs','00:00',NULL,NULL,NULL,NULL),(241,35,79,'Boston Celtics','Brooklyn Nets','00:30',NULL,NULL,NULL,NULL),(242,35,79,'New Orleans Pelicans','Minnesota Timberwolves','01:00',NULL,NULL,NULL,NULL),(244,35,79,'Phoenix Suns','Toronto Raptors','02:00',NULL,NULL,NULL,NULL),(245,35,79,'Oklahoma City Thunder','Los Angeles Clippers','01:00',NULL,NULL,NULL,NULL),(246,35,79,'Denver Nuggets','Golden State Warriors','02:00',NULL,NULL,NULL,NULL),(247,35,79,'Los Angeles Lakers','Philadelphia 76ers','03:00',NULL,NULL,NULL,NULL),(250,35,79,'Sacramento Kings','Washington Wizards','03:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httplog`
--

DROP TABLE IF EXISTS `httplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `httplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(12) NOT NULL,
  `url` varchar(255) NOT NULL,
  `uniqueid` varchar(255) NOT NULL,
  `approveid` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httplog`
--

LOCK TABLES `httplog` WRITE;
/*!40000 ALTER TABLE `httplog` DISABLE KEYS */;
INSERT INTO `httplog` VALUES (1,'2020-03-03 14:52:20','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','a58930e1-1bf8-4fde-9d10-1a51e51a3ce9','73a58f66-cb5c-4642-b723-075243ccf802','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"San Antonio Spurs\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Charlotte Hornets\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T00:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T18:52:20.000Z\"},\"timestamp\":\"2020-03-03T18:52:20Z\",\"unique_string\":\"2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020\"}'),(2,'2020-03-03 14:52:20','success','http://35.183.41.242:8010/trigger','0a133b49-637a-4d01-a3e6-8276885a5006','19e9ca64-dc18-43a0-a41b-a680512d04d0','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"San Antonio Spurs\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Charlotte Hornets\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T00:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T18:52:20.000Z\"},\"timestamp\":\"2020-03-03T18:52:20Z\",\"unique_string\":\"2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020\"}'),(3,'2020-03-03 14:52:21','success','https://bdataproxy.bookie.host/trigger','f2b27b8c-9ab0-470d-a748-fe9bce78fcb2','5cebdb6b-c82c-4155-8c99-88056c164d2b','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"San Antonio Spurs\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Charlotte Hornets\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T00:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T18:52:20.000Z\"},\"timestamp\":\"2020-03-03T18:52:20Z\",\"unique_string\":\"2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020\"}'),(4,'2020-03-03 15:05:24','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','a8967399-eeba-43f7-8b52-4a25e5bfd925','064fe9b6-a954-4f01-a05c-8dfba3598288','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Brooklyn Nets\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Boston Celtics\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T00:30:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:05:08.000Z\"},\"timestamp\":\"2020-03-03T19:05:08Z\",\"unique_string\":\"2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020\"}'),(5,'2020-03-03 15:05:24','success','http://35.183.41.242:8010/trigger','0ad66c5a-008f-4d15-b987-ab6ba72cb595','30faef17-4a11-4c50-bcb5-7662866256a9','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Brooklyn Nets\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Boston Celtics\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T00:30:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:05:24.000Z\"},\"timestamp\":\"2020-03-03T19:05:24Z\",\"unique_string\":\"2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020\"}'),(6,'2020-03-03 15:05:24','success','https://bdataproxy.bookie.host/trigger','0f0451e2-003b-46d4-affd-41d4ac6be3e1','a8b06aa2-1383-4f4a-8675-c33e9a251d87','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Brooklyn Nets\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Boston Celtics\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T00:30:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:05:24.000Z\"},\"timestamp\":\"2020-03-03T19:05:24Z\",\"unique_string\":\"2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020\"}'),(7,'2020-03-03 15:07:08','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','ed73516d-54fc-4a63-97ba-30704bedfd3f','c096ecf7-e1cf-481a-abdf-c76f3a6df38c','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:05:49.000Z\"},\"timestamp\":\"2020-03-03T19:05:49Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}'),(8,'2020-03-03 15:07:09','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','0d6bb927-a871-40ef-9f7b-64661acf6d70','50861367-f7dd-4d87-a91d-4074102a7949','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:06:50.000Z\"},\"timestamp\":\"2020-03-03T19:06:50Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}'),(9,'2020-03-03 15:07:09','success','http://35.183.41.242:8010/trigger','9cf11dc0-0d55-4574-a290-d58e4bc6a735','c2f2a171-7077-4047-9aae-852dfb282981','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:07:08.000Z\"},\"timestamp\":\"2020-03-03T19:07:08Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}'),(10,'2020-03-03 15:07:09','success','http://35.183.41.242:8010/trigger','9731f880-28c8-4efb-890d-95090c7c500f','17559827-1eb5-4dc6-9020-4668454b0986','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:07:09.000Z\"},\"timestamp\":\"2020-03-03T19:07:09Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}'),(11,'2020-03-03 15:07:09','success','https://bdataproxy.bookie.host/trigger','b1f281c7-7790-49e2-927e-2b72afe274a4','65bc4cc9-323a-4422-b586-0f69272ca1b4','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:07:09.000Z\"},\"timestamp\":\"2020-03-03T19:07:09Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}'),(12,'2020-03-03 15:07:09','success','https://bdataproxy.bookie.host/trigger','a4ea1cf4-36ae-477c-82cc-19bc5ec2844c','97c356d9-5d8e-439a-9964-71874a1a0579','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:07:09.000Z\"},\"timestamp\":\"2020-03-03T19:07:09Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}'),(13,'2020-03-03 15:08:35','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','229316c1-a651-49d2-b7c4-f924270526c4','21d796d0-2346-4d4c-8c12-b821bee98121','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Toronto Raptors\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Phoenix Suns\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T02:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:08:35.000Z\"},\"timestamp\":\"2020-03-03T19:08:35Z\",\"unique_string\":\"2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020\"}'),(14,'2020-03-03 15:08:36','success','http://35.183.41.242:8010/trigger','41776dfa-2cb3-4ca5-8e59-a1d32765f5b5','3342c576-934d-45a6-9ab8-e1542e2d492a','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Toronto Raptors\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Phoenix Suns\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T02:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:08:35.000Z\"},\"timestamp\":\"2020-03-03T19:08:35Z\",\"unique_string\":\"2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020\"}'),(15,'2020-03-03 15:08:36','success','https://bdataproxy.bookie.host/trigger','42db1826-f59e-40ed-8b4b-9cf6845eaf49','2bad330e-d87b-4a06-acb7-5c9191b43a39','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Toronto Raptors\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Phoenix Suns\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T02:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:08:36.000Z\"},\"timestamp\":\"2020-03-03T19:08:36Z\",\"unique_string\":\"2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020\"}'),(16,'2020-03-03 15:08:46','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','3d68a493-69f9-4ffe-834d-86dc7194e913','4015e817-f43a-438f-b320-aca3aacf7249','{\"arguments\":{},\"call\":\"canceled\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00.000Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:08:45.000Z\"},\"timestamp\":\"2020-03-03T19:08:45Z\",\"unique_string\":\"2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020\"}'),(17,'2020-03-03 15:08:46','success','http://35.183.41.242:8010/trigger','52b05861-08bf-4e45-bee3-21a39513f004','9c106c0b-1497-417b-a968-48184768fac2','{\"arguments\":{},\"call\":\"canceled\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00.000Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:08:46.000Z\"},\"timestamp\":\"2020-03-03T19:08:46Z\",\"unique_string\":\"2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020\"}'),(18,'2020-03-03 15:08:46','success','https://bdataproxy.bookie.host/trigger','2479441d-6a06-43fb-ad6d-bbfd4da30828','06a33968-d86c-478a-9ea0-566d1a185dc2','{\"arguments\":{},\"call\":\"canceled\",\"id\":{\"away\":\"Minnesota Timberwolves\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"New Orleans Pelicans\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00.000Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:08:46.000Z\"},\"timestamp\":\"2020-03-03T19:08:46Z\",\"unique_string\":\"2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020\"}'),(19,'2020-03-03 15:10:09','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','7d01ef27-f0b2-4cdc-9b51-8ad17536b4ea','4d982934-016a-4aaa-a6ea-7c7fbad4befa','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Los Angeles Clippers\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Oklahoma City Thunder\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:09.000Z\"},\"timestamp\":\"2020-03-03T19:10:09Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020\"}'),(20,'2020-03-03 15:10:09','success','http://35.183.41.242:8010/trigger','d7ed9d1f-ca39-4dd3-b356-e6364fe37859','a65b477f-c5e3-454b-a749-29f4074e5765','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Los Angeles Clippers\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Oklahoma City Thunder\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:09.000Z\"},\"timestamp\":\"2020-03-03T19:10:09Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020\"}'),(21,'2020-03-03 15:10:09','success','https://bdataproxy.bookie.host/trigger','3fb079ad-a7ee-44bc-bd9a-7af0c4d510c7','57639c63-5c56-4e81-835b-fee2c36de684','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Los Angeles Clippers\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Oklahoma City Thunder\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T01:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:09.000Z\"},\"timestamp\":\"2020-03-03T19:10:09Z\",\"unique_string\":\"2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020\"}'),(22,'2020-03-03 15:10:25','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','4438bcdd-b401-41fa-a41d-6f0188543b2b','105a178b-4163-4dcd-af17-57e4410231f9','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Golden State Warriors\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Denver Nuggets\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T02:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:25.000Z\"},\"timestamp\":\"2020-03-03T19:10:25Z\",\"unique_string\":\"2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020\"}'),(23,'2020-03-03 15:10:26','success','http://35.183.41.242:8010/trigger','870776ec-0552-43ea-a286-648e8cbe2e4c','6ebade91-72be-41c4-beaf-5dd148af39fb','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Golden State Warriors\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Denver Nuggets\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T02:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:25.000Z\"},\"timestamp\":\"2020-03-03T19:10:25Z\",\"unique_string\":\"2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020\"}'),(24,'2020-03-03 15:10:26','success','https://bdataproxy.bookie.host/trigger','8587dcb7-26f7-4fc8-afa3-a31da946adab','c029be9e-e354-4b6c-b84f-7b5d9f30fd0d','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Golden State Warriors\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Denver Nuggets\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T02:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:26.000Z\"},\"timestamp\":\"2020-03-03T19:10:26Z\",\"unique_string\":\"2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020\"}'),(25,'2020-03-03 15:10:59','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','bdb729f5-921c-4be5-b2be-7335697e1952','288a5c6c-6f4a-4d4e-89d8-90c228b52b6f','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Philadelphia 76ers\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Los Angeles Lakers\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:59.000Z\"},\"timestamp\":\"2020-03-03T19:10:59Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020\"}'),(26,'2020-03-03 15:10:59','success','http://35.183.41.242:8010/trigger','875f5f89-77f8-4845-924e-ccb0bad311e9','01096c34-4200-4785-86e1-f85b0e6521e0','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Philadelphia 76ers\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Los Angeles Lakers\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:59.000Z\"},\"timestamp\":\"2020-03-03T19:10:59Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020\"}'),(27,'2020-03-03 15:10:59','success','https://bdataproxy.bookie.host/trigger','ec53fc84-db33-4f05-8222-323c52f6ef98','5300831b-945b-4457-92b0-41a2f2bcd473','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Philadelphia 76ers\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Los Angeles Lakers\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:10:59.000Z\"},\"timestamp\":\"2020-03-03T19:10:59Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020\"}'),(28,'2020-03-03 15:12:24','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','4dbb2072-3156-4fb4-afba-24ac07ad7d7d','933c75da-a2b5-4d86-b02d-7174cd8fa50b','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:11:41.000Z\"},\"timestamp\":\"2020-03-03T19:11:41Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(29,'2020-03-03 15:12:25','success','http://35.183.41.242:8010/trigger','7d504878-e06f-4b91-99a3-51168883c138','6d21c07e-9511-44fb-b70c-444424272aa5','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:12:24.000Z\"},\"timestamp\":\"2020-03-03T19:12:24Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(30,'2020-03-03 15:12:25','success','https://bdataproxy.bookie.host/trigger','ef9d7cf3-225d-460c-946a-985efd3f6a5d','13fbbca3-8a8c-4036-bb9f-3bb6ed7fd0ad','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:12:25.000Z\"},\"timestamp\":\"2020-03-03T19:12:25Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(31,'2020-03-03 15:15:23','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','6da425e8-61dc-4777-bd15-4a32a4f00b64','0f0f43bf-9b35-41fc-8056-c7db4e0f836b','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:14:11.000Z\"},\"timestamp\":\"2020-03-03T19:14:11Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(32,'2020-03-03 15:15:37','success','http://35.183.41.242:8010/trigger','cbfdb5f2-fba9-4193-b43a-4c7ea74b8690','ac0357ae-94f9-492f-8590-366baed1307f','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:15:23.000Z\"},\"timestamp\":\"2020-03-03T19:15:23Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(33,'2020-03-03 15:15:41','success','https://bdataproxy.bookie.host/trigger','07c54e6d-7503-4ea1-819c-2fc52dac0792','3de1ae63-a49e-4f89-a81f-03075fbdcc8d','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:15:37.000Z\"},\"timestamp\":\"2020-03-03T19:15:37Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(34,'2020-03-03 15:20:18','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','d7a21042-dcef-4be0-8002-3f827d3b1144','e8004b33-7928-4d00-88bc-54d01ab4ffe4','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:20:17.000Z\"},\"timestamp\":\"2020-03-03T19:20:17Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(35,'2020-03-03 15:20:18','success','http://35.183.41.242:8010/trigger','6984c836-1761-4371-a8fa-f3ee1e0be263','acae71bb-e1b1-4936-b857-43169abf547e','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:20:18.000Z\"},\"timestamp\":\"2020-03-03T19:20:18Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(36,'2020-03-03 15:20:21','success','https://bdataproxy.bookie.host/trigger','7493936c-8143-4c09-989b-16fe1f610c3c','13e22528-9938-47a9-acc4-6dfe17ab7f44','{\"arguments\":{\"season\":\"2019/2020\"},\"call\":\"create\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:20:18.000Z\"},\"timestamp\":\"2020-03-03T19:20:18Z\",\"unique_string\":\"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}'),(37,'2020-03-03 15:20:45','success','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger','faa29b05-737d-4fcb-bc8e-94bf1643f81d','02332ece-ed4b-4ae0-9c15-30f4e9fa5255','{\"arguments\":{},\"call\":\"canceled\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00.000Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:20:45.000Z\"},\"timestamp\":\"2020-03-03T19:20:45Z\",\"unique_string\":\"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\"}'),(38,'2020-03-03 15:20:46','success','http://35.183.41.242:8010/trigger','89a77a11-aa16-4c93-b350-d62b33fd6756','cba9fe65-7736-4ce8-b71b-e8b56bf2a893','{\"arguments\":{},\"call\":\"canceled\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00.000Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:20:45.000Z\"},\"timestamp\":\"2020-03-03T19:20:45Z\",\"unique_string\":\"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\"}'),(39,'2020-03-03 15:20:47','success','https://bdataproxy.bookie.host/trigger','43412564-26c7-42c6-bad2-5a06dbf71820','b812b16b-d918-43c6-87a7-67db2574cc31','{\"arguments\":{},\"call\":\"canceled\",\"id\":{\"away\":\"Washington Wizards\",\"event_group_name\":\"NBA Regular Season\",\"home\":\"Sacramento Kings\",\"sport\":\"Basketball\",\"start_time\":\"2020-03-04T03:00:00.000Z\"},\"provider_info\":{\"name\":\"couch_potato\",\"pushed\":\"2020-03-03T19:20:46.000Z\"},\"timestamp\":\"2020-03-03T19:20:46Z\",\"unique_string\":\"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\"}');
/*!40000 ALTER TABLE `httplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(60) NOT NULL,
  `uniquename` varchar(255) NOT NULL,
  `call` varchar(20) NOT NULL,
  `message` json NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,'2020-03-03T18:52:20Z','2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020','create','{\"id\": {\"away\": \"San Antonio Spurs\", \"home\": \"Charlotte Hornets\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T00:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T18:52:20Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T18:52:20.000Z\"}, \"unique_string\": \"2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(2,'2020-03-03T18:52:20Z','2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020','create','{\"id\": {\"away\": \"San Antonio Spurs\", \"home\": \"Charlotte Hornets\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T00:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T18:52:20Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T18:52:20.000Z\"}, \"unique_string\": \"2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020\"}','http://35.183.41.242:8010/trigger'),(3,'2020-03-03T18:52:20Z','2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020','create','{\"id\": {\"away\": \"San Antonio Spurs\", \"home\": \"Charlotte Hornets\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T00:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T18:52:20Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T18:52:20.000Z\"}, \"unique_string\": \"2020-03-04t000000z__basketball__nba-regular-season__charlotte-hornets__san-antonio-spurs__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(4,'2020-03-03T19:05:08Z','2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020','create','{\"id\": {\"away\": \"Brooklyn Nets\", \"home\": \"Boston Celtics\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T00:30:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:05:08Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:05:08.000Z\"}, \"unique_string\": \"2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(5,'2020-03-03T19:05:24Z','2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020','create','{\"id\": {\"away\": \"Brooklyn Nets\", \"home\": \"Boston Celtics\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T00:30:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:05:24Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:05:24.000Z\"}, \"unique_string\": \"2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020\"}','http://35.183.41.242:8010/trigger'),(6,'2020-03-03T19:05:24Z','2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020','create','{\"id\": {\"away\": \"Brooklyn Nets\", \"home\": \"Boston Celtics\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T00:30:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:05:24Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:05:24.000Z\"}, \"unique_string\": \"2020-03-04t003000z__basketball__nba-regular-season__boston-celtics__brooklyn-nets__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(7,'2020-03-03T19:05:49Z','2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020','create','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:05:49Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:05:49.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(8,'2020-03-03T19:06:50Z','2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020','create','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:06:50Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:06:50.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(9,'2020-03-03T19:07:08Z','2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020','create','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:07:08Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:07:08.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}','http://35.183.41.242:8010/trigger'),(10,'2020-03-03T19:07:09Z','2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020','create','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:07:09Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:07:09.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}','http://35.183.41.242:8010/trigger'),(11,'2020-03-03T19:07:09Z','2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020','create','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:07:09Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:07:09.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(12,'2020-03-03T19:07:09Z','2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020','create','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:07:09Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:07:09.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(13,'2020-03-03T19:08:35Z','2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020','create','{\"id\": {\"away\": \"Toronto Raptors\", \"home\": \"Phoenix Suns\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T02:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:08:35Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:08:35.000Z\"}, \"unique_string\": \"2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(14,'2020-03-03T19:08:35Z','2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020','create','{\"id\": {\"away\": \"Toronto Raptors\", \"home\": \"Phoenix Suns\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T02:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:08:35Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:08:35.000Z\"}, \"unique_string\": \"2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020\"}','http://35.183.41.242:8010/trigger'),(15,'2020-03-03T19:08:36Z','2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020','create','{\"id\": {\"away\": \"Toronto Raptors\", \"home\": \"Phoenix Suns\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T02:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:08:36Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:08:36.000Z\"}, \"unique_string\": \"2020-03-04t020000z__basketball__nba-regular-season__phoenix-suns__toronto-raptors__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(16,'2020-03-03T19:08:45Z','2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020','canceled','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00.000Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"canceled\", \"arguments\": {}, \"timestamp\": \"2020-03-03T19:08:45Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:08:45.000Z\"}, \"unique_string\": \"2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(17,'2020-03-03T19:08:46Z','2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020','canceled','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00.000Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"canceled\", \"arguments\": {}, \"timestamp\": \"2020-03-03T19:08:46Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:08:46.000Z\"}, \"unique_string\": \"2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020\"}','http://35.183.41.242:8010/trigger'),(18,'2020-03-03T19:08:46Z','2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020','canceled','{\"id\": {\"away\": \"Minnesota Timberwolves\", \"home\": \"New Orleans Pelicans\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00.000Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"canceled\", \"arguments\": {}, \"timestamp\": \"2020-03-03T19:08:46Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:08:46.000Z\"}, \"unique_string\": \"2020-03-04t010000.000z__basketball__nba-regular-season__new-orleans-pelicans__minnesota-timberwolves__canceled__20192020\"}','https://bdataproxy.bookie.host/trigger'),(19,'2020-03-03T19:10:09Z','2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020','create','{\"id\": {\"away\": \"Los Angeles Clippers\", \"home\": \"Oklahoma City Thunder\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:09Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:09.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(20,'2020-03-03T19:10:09Z','2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020','create','{\"id\": {\"away\": \"Los Angeles Clippers\", \"home\": \"Oklahoma City Thunder\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:09Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:09.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020\"}','http://35.183.41.242:8010/trigger'),(21,'2020-03-03T19:10:09Z','2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020','create','{\"id\": {\"away\": \"Los Angeles Clippers\", \"home\": \"Oklahoma City Thunder\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T01:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:09Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:09.000Z\"}, \"unique_string\": \"2020-03-04t010000z__basketball__nba-regular-season__oklahoma-city-thunder__los-angeles-clippers__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(22,'2020-03-03T19:10:25Z','2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020','create','{\"id\": {\"away\": \"Golden State Warriors\", \"home\": \"Denver Nuggets\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T02:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:25Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:25.000Z\"}, \"unique_string\": \"2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(23,'2020-03-03T19:10:25Z','2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020','create','{\"id\": {\"away\": \"Golden State Warriors\", \"home\": \"Denver Nuggets\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T02:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:25Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:25.000Z\"}, \"unique_string\": \"2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020\"}','http://35.183.41.242:8010/trigger'),(24,'2020-03-03T19:10:26Z','2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020','create','{\"id\": {\"away\": \"Golden State Warriors\", \"home\": \"Denver Nuggets\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T02:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:26Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:26.000Z\"}, \"unique_string\": \"2020-03-04t020000z__basketball__nba-regular-season__denver-nuggets__golden-state-warriors__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(25,'2020-03-03T19:10:59Z','2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020','create','{\"id\": {\"away\": \"Philadelphia 76ers\", \"home\": \"Los Angeles Lakers\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:59Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:59.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(26,'2020-03-03T19:10:59Z','2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020','create','{\"id\": {\"away\": \"Philadelphia 76ers\", \"home\": \"Los Angeles Lakers\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:59Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:59.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020\"}','http://35.183.41.242:8010/trigger'),(27,'2020-03-03T19:10:59Z','2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020','create','{\"id\": {\"away\": \"Philadelphia 76ers\", \"home\": \"Los Angeles Lakers\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:10:59Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:10:59.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__los-angeles-lakers__philadelphia-76ers__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(28,'2020-03-03T19:11:41Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:11:41Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:11:41.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(29,'2020-03-03T19:12:24Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:12:24Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:12:24.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','http://35.183.41.242:8010/trigger'),(30,'2020-03-03T19:12:25Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:12:25Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:12:25.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(31,'2020-03-03T19:14:11Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:14:11Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:14:11.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(32,'2020-03-03T19:15:23Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:15:23Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:15:23.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','http://35.183.41.242:8010/trigger'),(33,'2020-03-03T19:15:37Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:15:37Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:15:37.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(34,'2020-03-03T19:20:17Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:20:17Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:20:17.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(35,'2020-03-03T19:20:18Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:20:18Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:20:18.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','http://35.183.41.242:8010/trigger'),(36,'2020-03-03T19:20:18Z','2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020','create','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"create\", \"arguments\": {\"season\": \"2019/2020\"}, \"timestamp\": \"2020-03-03T19:20:18Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:20:18.000Z\"}, \"unique_string\": \"2020-03-04t030000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__create__20192020\"}','https://bdataproxy.bookie.host/trigger'),(37,'2020-03-03T19:20:45Z','2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020','canceled','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00.000Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"canceled\", \"arguments\": {}, \"timestamp\": \"2020-03-03T19:20:45Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:20:45.000Z\"}, \"unique_string\": \"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\"}','http://ec2-35-183-16-213.ca-central-1.compute.amazonaws.com:8010/trigger'),(38,'2020-03-03T19:20:45Z','2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020','canceled','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00.000Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"canceled\", \"arguments\": {}, \"timestamp\": \"2020-03-03T19:20:45Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:20:45.000Z\"}, \"unique_string\": \"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\"}','http://35.183.41.242:8010/trigger'),(39,'2020-03-03T19:20:46Z','2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020','canceled','{\"id\": {\"away\": \"Washington Wizards\", \"home\": \"Sacramento Kings\", \"sport\": \"Basketball\", \"start_time\": \"2020-03-04T03:00:00.000Z\", \"event_group_name\": \"NBA Regular Season\"}, \"call\": \"canceled\", \"arguments\": {}, \"timestamp\": \"2020-03-03T19:20:46Z\", \"provider_info\": {\"name\": \"couch_potato\", \"pushed\": \"2020-03-03T19:20:46.000Z\"}, \"unique_string\": \"2020-03-04t030000.000z__basketball__nba-regular-season__sacramento-kings__washington-wizards__canceled__20192020\"}','https://bdataproxy.bookie.host/trigger');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leagues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sport` int(11) NOT NULL,
  `icon` varchar(64) NOT NULL,
  PRIMARY KEY (`id`,`name`),
  KEY `idx_name` (`name`),
  KEY `fk_sport_idx` (`sport`),
  CONSTRAINT `fk_sport` FOREIGN KEY (`sport`) REFERENCES `sports` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (3,'EPL',2,'/assets/imgs/leagues/epl.png'),(4,'Serie A',2,'/assets/imgs/leagues/seriea.png'),(5,'LaLiga',2,'/assets/imgs/leagues/lalliga.png'),(6,'NHL',4,'/assets/imgs/leagues/nhl.png'),(8,'NBA Regular Season',5,'/assets/imgs/leagues/nba.png'),(9,'MLB',3,'/assets/imgs/leagues/mlb.png'),(15,'Bundesliga',2,'/assets/imgs/leagues/bundesliga.png');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status_idx` (`status`),
  CONSTRAINT `fk_status` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (1,240,0),(2,241,0),(3,242,0),(4,243,2),(5,244,0),(6,245,0),(7,246,0),(8,247,0),(9,248,2),(10,249,2),(11,250,0);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `icon` varchar(45) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`name`),
  KEY `fk_leagues_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES (2,'Soccer','/assets/imgs/sports/soccer.png',105),(3,'Baseball','/assets/imgs/sports/baseball.png',300),(4,'Hockey','/assets/imgs/sports/hockey.png',120),(5,'Basketball','/assets/imgs/sports/basketball.png',120);
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (0,'Not Started'),(1,'In Progress'),(2,'Cancelled'),(3,'Postponed'),(4,'Finished'),(5,'Sent');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `icon` varchar(45) NOT NULL,
  `league` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teams_leagues_idx` (`league`),
  CONSTRAINT `fk_teams_leagues` FOREIGN KEY (`league`) REFERENCES `leagues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=857 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (50,'Arsenal','aresenal.png',3),(51,'Aston Villa','aston-villa.png',3),(52,'Bournemouth','bournemouth.png',3),(53,'Brighton','brighton.png',3),(54,'Burnley','burnley.png',3),(55,'Chelsea','chelsea.png',3),(56,'Crystal Palace','crystal-palace.png',3),(57,'Everton','everton.png',3),(58,'Leicester City','leicester.png',3),(59,'Liverpool','liverpool.png',3),(60,'Manchester City','man-city.png',3),(61,'Manchester United','man-utd.png',3),(62,'Newcastle United','newcastle.png',3),(63,'Norwich City','norwich.png',3),(64,'Sheffield United','sheffield.png',3),(65,'Southampton','southampton.png',3),(66,'Tottenham Hotspur','tottenham.png',3),(67,'Watford','watford.png',3),(68,'West Ham United','west-ham.png',3),(69,'Wolverhampton Wanderers','wolves.png',3),(70,'Arizona Diamondbacks','diamondbacks.png',9),(71,'Atlanta Braves','braves.png',9),(72,'Baltimore Orioles','orioles.png',9),(73,'Boston Red Sox','red sox.png',9),(74,'Chicago Cubs','cubs.png',9),(75,'Chicago White Sox','white sox.png',9),(76,'Cincinnati Reds','reds.png',9),(77,'Cleveland Indians','indians.png',9),(78,'Colorado Rockies','rockies.png',9),(79,'Detroit Tigers','tigers.png',9),(80,'Houston Astros','astros.png',9),(81,'Kansas City Royals','royals.png',9),(82,'Los Angeles Angels','angels.png',9),(83,'Miami Marlins','marlins.png',9),(84,'Milwaukee Brewers','brewers.png',9),(85,'Minnesota Twins','twins.png',9),(86,'New York Yankees','yankees.png',9),(87,'Oakland Athletics','athletics.png',9),(88,'Philadelphia Phillies','phillies.png',9),(89,'Pittsburgh Pirates','pirates.png',9),(90,'San Diego Padres','padres.png',9),(91,'San Francisco Giants','giants.png',9),(92,'Seattle Mariners','mariners.png',9),(93,'St. Louis Cardinals','cardinals.png',9),(94,'Tampa Bay Rays','rays.png',9),(95,'Texas Rangers','rangers.png',9),(96,'Toronto Blue Jays','blue jays.png',9),(97,'Washington Nationals','nationals.png',9),(98,'Anaheim Ducks','ducks.png',6),(99,'Arizona Coyotes','coyotes.png',6),(100,'Boston Bruins','bruins.png',6),(101,'Buffalo Sabres','sabres.png',6),(102,'Calgary Flames','flames.png',6),(103,'Carolina Hurricanes','hurricanes.png',6),(104,'Chicago Blackhawks','blackhawks.png',6),(105,'Colorado Avalanche','avalanche.png',6),(106,'Columbus Blue Jackets','blue jackets.png',6),(107,'Dallas Stars','stars.png',6),(108,'Detroit Red Wings','red wings.png',6),(109,'Edmonton Oilers','oilers.png',6),(110,'Florida Panthers','panthers.png',6),(111,'Los Angeles Kings','kings.png',6),(112,'Minnesota Wild','wild.png',6),(113,'Montreal Canadiens','canadiens.png',6),(114,'Nashville Predators','predators.png',6),(115,'New Jersey Devils','devils.png',6),(116,'New York Islanders','islanders.png',6),(117,'New York Rangers','rangers.png',6),(118,'Ottawa Senators','senators.png',6),(119,'Philadelphia Flyers','flyers.png',6),(120,'Pittsburgh Penguins','penguins.png',6),(121,'San Jose Sharks','sharks.png',6),(122,'St. Louis Blues','blues.png',6),(123,'Tampa Bay Lightning','lightning.png',6),(124,'Toronto Maple Leafs','maple leafs.png',6),(125,'Vancouver Canucks','canucks.png',6),(126,'Vegas Golden Knights','golden knights.png',6),(127,'Washington Capitals','capitals.png',6),(128,'Winnipeg Jets','jets.png',6),(129,'Atlanta Hawks','hawks.png',8),(130,'Boston Celtics','celtics.png',8),(131,'Brooklyn Nets','nets.png',8),(132,'Charlotte Hornets','hornets.png',8),(133,'Chicago Bulls','bulls.png',8),(134,'Cleveland Cavaliers','cavaliers.png',8),(135,'Dallas Mavericks','mavericks.png',8),(136,'Denver Nuggets','nuggets.png',8),(137,'Detroit Pistons','pistons.png',8),(138,'Golden State Warriors','warriors.png',8),(139,'Houston Rockets','rockets.png',8),(140,'Indiana Pacers','pacers.png',8),(141,'Los Angeles Clippers','clippers.png',8),(142,'Los Angeles Lakers','lakers.png',8),(143,'Memphis Grizzlies','grizzlies.png',8),(144,'Miami Heat','heat.png',8),(145,'Milwaukee Bucks','bucks.png',8),(146,'Minnesota Timberwolves','timberwolves.png',8),(147,'New Orleans Pelicans','pelicans.png',8),(148,'New York Knicks','knicks.png',8),(149,'Oklahoma City Thunder','thunder.png',8),(150,'Orlando Magic','magic.png',8),(151,'Philadelphia 76ers','76.png',8),(152,'Phoenix Suns','suns.png',8),(153,'Portland Trail Blazers','blazers.png',8),(154,'Sacramento Kings','kings.png',8),(155,'San Antonio Spurs','spurs.png',8),(156,'Toronto Raptors','raptors.png',8),(157,'Utah Jazz','jazz.png',8),(158,'Washington Wizards','wizards.png',8),(159,'Barcelona','barcelona.png',5),(160,'Real Madrid','realmadrid.png',5),(161,'Sevilla','sevilla.png',5),(162,'Getafe CF','getafe.png',5),(163,'Atlético Madrid','atleticomadrid.png',5),(164,'Valencia','valencia.png',5),(165,'Real Sociedad','realsociadad.png',5),(166,'Ath. Bilbao','bilbao.png',5),(167,'Granada','granada.png',5),(168,'Osasuna','osasuna.png',5),(169,'Levante','levante.png',5),(170,'Real Betis','realbetis.png',5),(171,'Villareal','villareal.png',5),(172,'Alavés','alaves.png',5),(173,'Valladolid','valladolid.png',5),(174,'Eibar','eibar.png',5),(175,'RCD Mallorca','rcdmallorca.png',5),(176,'Celta Vigo','celtavigo.png',5),(177,'Leganes','leganes.png',5),(178,'Espanyol','espanyol.png',5),(179,'Inter Milan','milan.png',4),(180,'Juventus','juventus.png',4),(181,'Lazio','lazio.png',4),(182,'Roma','roma.png',4),(183,'Cagliri','cagliri.png',4),(184,'Atalanta','atalanta.png',4),(185,'Parma','parma.png',4),(186,'Napoli','napoli.png',4),(187,'Torino','torino.png',4),(188,'Milan','milan.png',4),(189,'Bologna','bologna.png',4),(190,'Verona','verona.png',4),(191,'Fiorentina','fiorentina.png',4),(192,'Sassuolo','sassuolo.png',4),(193,'Lecce','lecce.png',4),(194,'Sampdoria','sampdoria.png',4),(195,'Udinese','udinese.png',4),(196,'Brescia','brescia.png',4),(197,'Genoa','genoa.png',4),(198,'SPAL','spal.png',4),(223,'FC Shalke 04','schalke.png',15),(224,'Borussia Mönchengladbach','monchengladbach.png',15),(225,'FC Augsburg','augsburg.png',15),(226,'Borussia Dortmund','dortmund.png',15),(227,'RB Leipzig','leipzig.png',15),(228,'FC Bayern München','bayern.png',15),(229,'Bayer 04 Leverkusen','bayer.png',15),(230,'TSG 1899 Hoffenheim','hoffenheim.png',15),(231,'Sport-Club Freiburg','freiburg.png',15),(232,'VfL Wolfsburg','wolfsburg.png',15),(233,'FC Union Berlin','berlin.png',15),(234,'Hertha Berlin','hertha.png',15),(235,'Eintracht Frankfurt','eintract.png',15),(236,'1. FSV Mainz 05','mainz.png',15),(237,'1. FC Köln','koln.png',15),(238,'Fortuna Düsseldorf','fortuna.png',15),(239,'SV Werder Bremen','werder.png',15),(240,'SC Paderborn 07','paderborn.png',15);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(45) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `password` char(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (35,'2020-01-28 17:19:23','Test1','c3279447-e378-47fb-9ab7-fca4cfdfa52f','4ee03cd7f71e651fadcb9631be279b732115e498ab577e7bf3accd4ad901f67f','pdcox64@gmail.com'),(36,'2020-01-28 21:43:02','test4','129797dd-628e-48ce-9de1-34298aa55f2d','ef42c7893b53501fa6e2db176cc045afba296f9773bf64a7ca8b6cb6ed33a2c4','pdcox64@gmail.com'),(37,'2020-01-28 21:46:01','test5','3665793b-ebd9-40c6-ad3f-5c2a1455ba57','eb84be59a5fd159f439b35c03451b7385bed71f4233dbc451aee2adec710bd0a','pdcox64@gmail.com'),(38,'2020-02-25 14:59:05','Paul Cox','39ac872b-5c5f-4553-aec8-ec6473c742a0','f64012a6a664fd133a2d0c89311ad634aff1ebda2391e704894daa0a9fd140a3','pdcox64@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwgameevents`
--

DROP TABLE IF EXISTS `vwgameevents`;
/*!50001 DROP VIEW IF EXISTS `vwgameevents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vwgameevents` AS SELECT 
 1 AS `league`,
 1 AS `eventid`,
 1 AS `date`,
 1 AS `datetime`,
 1 AS `hometeam`,
 1 AS `awayteam`,
 1 AS `starttime`,
 1 AS `homescore`,
 1 AS `awayscore`,
 1 AS `gameid`,
 1 AS `sportid`,
 1 AS `leagueid`,
 1 AS `leagueicon`,
 1 AS `sportname`,
 1 AS `icon`,
 1 AS `duration`,
 1 AS `status`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwsports`
--

DROP TABLE IF EXISTS `vwsports`;
/*!50001 DROP VIEW IF EXISTS `vwsports`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vwsports` AS SELECT 
 1 AS `id`,
 1 AS `sportsname`,
 1 AS `sportsicon`,
 1 AS `leaguename`,
 1 AS `leagueicon`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwteams`
--

DROP TABLE IF EXISTS `vwteams`;
/*!50001 DROP VIEW IF EXISTS `vwteams`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vwteams` AS SELECT 
 1 AS `teamname`,
 1 AS `leaguename`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vwgameevents`
--

/*!50001 DROP VIEW IF EXISTS `vwgameevents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwgameevents` AS select `x`.`league` AS `league`,`x`.`id` AS `eventid`,`x`.`date` AS `date`,concat(`x`.`date`,' ',`y`.`starttime`) AS `datetime`,`y`.`hometeam` AS `hometeam`,`y`.`awayteam` AS `awayteam`,`y`.`starttime` AS `starttime`,`y`.`homescore` AS `homescore`,`y`.`awayscore` AS `awayscore`,`y`.`id` AS `gameid`,`z`.`sport` AS `sportid`,`z`.`id` AS `leagueid`,`z`.`icon` AS `leagueicon`,`a`.`name` AS `sportname`,`a`.`icon` AS `icon`,`a`.`duration` AS `duration`,`p`.`status` AS `status`,`s`.`name` AS `name` from (((((`events` `x` join `games` `y` on((`y`.`event` = `x`.`id`))) join `leagues` `z` on((`x`.`league` = `z`.`name`))) join `sports` `a` on((`z`.`sport` = `a`.`id`))) join `progress` `p` on((`y`.`id` = `p`.`game`))) join `status` `s` on((`p`.`status` = `s`.`id`))) order by `x`.`date`,`y`.`starttime` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwsports`
--

/*!50001 DROP VIEW IF EXISTS `vwsports`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwsports` AS select `x`.`id` AS `id`,`x`.`name` AS `sportsname`,`x`.`icon` AS `sportsicon`,`y`.`name` AS `leaguename`,`y`.`icon` AS `leagueicon` from (`sports` `x` join `leagues` `y` on((`x`.`id` = `y`.`sport`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwteams`
--

/*!50001 DROP VIEW IF EXISTS `vwteams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwteams` AS select `x`.`name` AS `teamname`,`y`.`name` AS `leaguename` from (`teams` `x` join `leagues` `y` on((`x`.`league` = `y`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 17:36:03
