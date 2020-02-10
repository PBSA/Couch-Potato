CREATE DATABASE  IF NOT EXISTS `couch-potato` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `couch-potato`;
-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: couch-potato
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
  `status` varchar(12) NOT NULL,
  `statustext` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `league` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `event` varchar(100) DEFAULT NULL,
  `hometeam` varchar(100) DEFAULT NULL,
  `awayteam` varchar(100) DEFAULT NULL,
  `starttime` varchar(12) DEFAULT NULL,
  `homescore` int(11) DEFAULT NULL,
  `awayscore` int(11) DEFAULT NULL,
  `whistle_start_time` datetime DEFAULT NULL,
  `whistle_end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`user`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(60) NOT NULL,
  `uniquename` varchar(255) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `call` varchar(20) DEFAULT NULL,
  `message` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leagues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sport` int(11) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replays`
--

DROP TABLE IF EXISTS `replays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `replays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  `sport` varchar(45) DEFAULT NULL,
  `league` varchar(64) DEFAULT NULL,
  `start` varchar(50) DEFAULT NULL,
  `end` varchar(50) DEFAULT NULL,
  `done` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `league` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwgameevents` AS select `x`.`league` AS `league`,`x`.`id` AS `eventid`,`x`.`date` AS `date`,concat(`x`.`date`,' ',`y`.`starttime`) AS `datetime`,`y`.`hometeam` AS `hometeam`,`y`.`awayteam` AS `awayteam`,`y`.`starttime` AS `starttime`,`y`.`homescore` AS `homescore`,`y`.`awayscore` AS `awayscore`,`y`.`id` AS `gameid`,`z`.`sport` AS `sportid`,`z`.`id` AS `leagueid`,`a`.`name` AS `sportname`,`a`.`icon` AS `icon`,`a`.`duration` AS `duration`,`p`.`status` AS `status`,`s`.`name` AS `name` from (((((`events` `x` join `games` `y` on((`y`.`event` = `x`.`id`))) join `leagues` `z` on((`x`.`league` = `z`.`name`))) join `sports` `a` on((`z`.`sport` = `a`.`id`))) join `progress` `p` on((`y`.`id` = `p`.`game`))) join `status` `s` on((`p`.`status` = `s`.`id`))) */;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
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

-- Dump completed on 2020-02-08 22:58:58
