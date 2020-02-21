
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
  `title` varchar(45) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errorlog`
--

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
  KEY `fk_league_idx` (`league`),
  KEY `fk_user_idx` (`user`),
  CONSTRAINT `fk_leagues` FOREIGN KEY (`league`) REFERENCES `leagues` (`name`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-
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
  KEY `user_idx` (`user`),
  KEY `event_idx` (`event`),
  CONSTRAINT `fk_event` FOREIGN KEY (`event`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

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
INSERT INTO `leagues` VALUES (1,'NFL',1,'/assets/imgs/leagues/nfl.png'),(2,'CFL',1,'/assets/imgs/leagues/cfl.png'),(3,'EPL',2,'/assets/imgs/leagues/epl.png'),(4,'Serie A',2,'/assets/imgs/leagues/seriea.png'),(5,'La Liga',2,'/assets/imgs/leagues/lalliga.png'),(6,'NHL',4,'/assets/imgs/leagues/nhl.png'),(8,'NBA',5,'/assets/imgs/leagues/nba.png'),(9,'MLB',3,'/assets/imgs/leagues/mlb.png'),(15,'Bundesliga',2,'/assets/imgs/leagues/bundesliga.png'),(16,'NCAA Basketball',5,'/assets/imgs/leagues/ncaa-basketball.png');
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
  KEY `idx_progress_game` (`game`),
  KEY `fk_status_idx` (`status`),
  CONSTRAINT `fk_game` FOREIGN KEY (`game`) REFERENCES `games` (`id`),
  CONSTRAINT `fk_status` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;


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
INSERT INTO `sports` VALUES (1,'American Football','/assets/imgs/sports/football.png',200),(2,'Soccer','/assets/imgs/sports/soccer.png',105),(3,'Baseball','/assets/imgs/sports/baseball.png',300),(4,'Hockey','/assets/imgs/sports/hockey.png',120),(5,'Basketball','/assets/imgs/sports/basketball.png',120);
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
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (2,'Buffalo Bills','bills.png',1),(3,'Miami Dolphins','dolphins.png',1),(4,'New England Patriots','patriots.png',1),(5,'New York Jets','jets.png',1),(6,'Baltimore Ravens','ravens.png',1),(7,'Cincinnati Bengals','bengals.png',1),(8,'Cleveland Browns','browns.png',1),(9,'Pittsburgh Steelers','steelers.png',1),(10,'Houston Texans','texans.png',1),(11,'Indianapolis Colts','colts.png',1),(12,'Jacksonville Jaguars','jaguars.png',1),(13,'Tennessee Titans','titans.png',1),(14,'Denver Broncos','broncos.png',1),(15,'Kansas City Chiefs','chiefs.png',1),(16,'Los Angeles Chargers','chargers.png',1),(17,'Oakland Raiders','raiders.png',1),(18,'Dallas Cowboys','cowboys.png',1),(19,'New York Giants','giants.png',1),(20,'Philadelphia Eagles','eagles.png',1),(21,'Washington Redskins','redskins.png',1),(22,'Chicago Bears','bears.png',1),(23,'Detroit Lions','lions.png',1),(24,'Green Bay Packers','packers.png',1),(25,'Minnesota Vikings','vikings.png',1),(26,'Atlanta Falcons','falcons.png',1),(27,'Carolina Panthers','panthers.png',1),(28,'New Orleans Saints','saints.png',1),(29,'Tampa Bay Buccaneers','buccaneers.png',1),(30,'Arizona Cardinals','cardinals.png',1),(31,'Los Angeles Rams','rams.png',1),(32,'San Francisco 49ers','49ers.png',1),(33,'Seattle Seahawks','seahawks.png',1),(50,'Arsenal','aresenal.png',3),(51,'Aston Villa','aston-villa.png',3),(52,'Bournemouth','bournemouth.png',3),(53,'Brighton','brighton.png',3),(54,'Burnley','burnley.png',3),(55,'Chelsea','chelsea.png',3),(56,'Crystal Palace','crystal-palace.png',3),(57,'Everton','everton.png',3),(58,'Leicester City','leicester.png',3),(59,'Liverpool','liverpool.png',3),(60,'Manchester City','man-city.png',3),(61,'Manchester United','man-utd.png',3),(62,'Newcastle United','newcastle.png',3),(63,'Norwich City','norwich.png',3),(64,'Sheffield United','sheffield.png',3),(65,'Southampton','southampton.png',3),(66,'Tottenham Hotspur','tottenham.png',3),(67,'Watford','watford.png',3),(68,'West Ham United','west-ham.png',3),(69,'Wolverhampton Wanderers','wolves.png',3),(70,'Arizona Diamondbacks','diamondbacks.png',9),(71,'Atlanta Braves','braves.png',9),(72,'Baltimore Orioles','orioles.png',9),(73,'Boston Red Sox','red sox.png',9),(74,'Chicago Cubs','cubs.png',9),(75,'Chicago White Sox','white sox.png',9),(76,'Cincinnati Reds','reds.png',9),(77,'Cleveland Indians','indians.png',9),(78,'Colorado Rockies','rockies.png',9),(79,'Detroit Tigers','tigers.png',9),(80,'Houston Astros','astros.png',9),(81,'Kansas City Royals','royals.png',9),(82,'Los Angeles Angels','angels.png',9),(83,'Miami Marlins','marlins.png',9),(84,'Milwaukee Brewers','brewers.png',9),(85,'Minnesota Twins','twins.png',9),(86,'New York Yankees','yankees.png',9),(87,'Oakland Athletics','athletics.png',9),(88,'Philadelphia Phillies','phillies.png',9),(89,'Pittsburgh Pirates','pirates.png',9),(90,'San Diego Padres','padres.png',9),(91,'San Francisco Giants','giants.png',9),(92,'Seattle Mariners','mariners.png',9),(93,'St. Louis Cardinals','cardinals.png',9),(94,'Tampa Bay Rays','rays.png',9),(95,'Texas Rangers','rangers.png',9),(96,'Toronto Blue Jays','blue jays.png',9),(97,'Washington Nationals','nationals.png',9),(98,'Anaheim Ducks','ducks.png',6),(99,'Arizona Coyotes','coyotes.png',6),(100,'Boston Bruins','bruins.png',6),(101,'Buffalo Sabres','sabres.png',6),(102,'Calgary Flames','flames.png',6),(103,'Carolina Hurricanes','hurricanes.png',6),(104,'Chicago Blackhawks','blackhawks.png',6),(105,'Colorado Avalanche','avalanche.png',6),(106,'Columbus Blue Jackets','blue jackets.png',6),(107,'Dallas Stars','stars.png',6),(108,'Detroit Red Wings','red wings.png',6),(109,'Edmonton Oilers','oilers.png',6),(110,'Florida Panthers','panthers.png',6),(111,'Los Angeles Kings','kings.png',6),(112,'Minnesota Wild','wild.png',6),(113,'Montreal Canadiens','canadiens.png',6),(114,'Nashville Predators','predators.png',6),(115,'New Jersey Devils','devils.png',6),(116,'New York Islanders','islanders.png',6),(117,'New York Rangers','rangers.png',6),(118,'Ottawa Senators','senators.png',6),(119,'Philadelphia Flyers','flyers.png',6),(120,'Pittsburgh Penguins','penguins.png',6),(121,'San Jose Sharks','sharks.png',6),(122,'St. Louis Blues','blues.png',6),(123,'Tampa Bay Lightning','lightning.png',6),(124,'Toronto Maple Leafs','maple leafs.png',6),(125,'Vancouver Canucks','canucks.png',6),(126,'Vegas Golden Knights','golden knights.png',6),(127,'Washington Capitals','capitals.png',6),(128,'Winnipeg Jets','jets.png',6),(129,'Atlanta Hawks','hawks.png',8),(130,'Boston Celtics','celtics.png',8),(131,'Brooklyn Nets','nets.png',8),(132,'Charlotte Hornets','hornets.png',8),(133,'Chicago Bulls','bulls.png',8),(134,'Cleveland Cavaliers','cavaliers.png',8),(135,'Dallas Mavericks','mavericks.png',8),(136,'Denver Nuggets','nuggets.png',8),(137,'Detroit Pistons','pistons.png',8),(138,'Golden State Warriors','warriors.png',8),(139,'Houston Rockets','rockets.png',8),(140,'Indiana Pacers','pacers.png',8),(141,'Los Angeles Clippers','clippers.png',8),(142,'Los Angeles Lakers','lakers.png',8),(143,'Memphis Grizzlies','grizzlies.png',8),(144,'Miami Heat','heat.png',8),(145,'Milwaukee Bucks','bucks.png',8),(146,'Minnesota Timberwolves','timberwolves.png',8),(147,'New Orleans Pelicans','pelicans.png',8),(148,'New York Knicks','knicks.png',8),(149,'Oklahoma City Thunder','thunder.png',8),(150,'Orlando Magic','magic.png',8),(151,'Philadelphia 76ers','76.png',8),(152,'Phoenix Suns','suns.png',8),(153,'Portland Trail Blazers','blazers.png',8),(154,'Sacramento Kings','kings.png',8),(155,'San Antonio Spurs','spurs.png',8),(156,'Toronto Raptors','raptors.png',8),(157,'Utah Jazz','jazz.png',8),(158,'Washington Wizards','wizards.png',8),(159,'Barcelona','barcelona.png',5),(160,'Real Madrid','realmadrid.png',5),(161,'Sevilla','sevilla.png',5),(162,'Getafe CF','getafe.png',5),(163,'Atlético Madrid','atleticomadrid.png',5),(164,'Valencia','valencia.png',5),(165,'Real Sociedad','realsociadad.png',5),(166,'Ath. Bilbao','bilbao.png',5),(167,'Granada','granada.png',5),(168,'Osasuna','osasuna.png',5),(169,'Levante','levante.png',5),(170,'Real Betis','realbetis.png',5),(171,'Villareal','villareal.png',5),(172,'Alavés','alaves.png',5),(173,'Valladolid','valladolid.png',5),(174,'Eibar','eibar.png',5),(175,'RCD Mallorca','rcdmallorca.png',5),(176,'Celta Vigo','celtavigo.png',5),(177,'Leganes','leganes.png',5),(178,'Espanyol','espanyol.png',5),(179,'Inter Milan','milan.png',4),(180,'Juventus','juventus.png',4),(181,'Lazio','lazio.png',4),(182,'Roma','roma.png',4),(183,'Cagliri','cagliri.png',4),(184,'Atalanta','atalanta.png',4),(185,'Parma','parma.png',4),(186,'Napoli','napoli.png',4),(187,'Torino','torino.png',4),(188,'Milan','milan.png',4),(189,'Bologna','bologna.png',4),(190,'Verona','verona.png',4),(191,'Fiorentina','fiorentina.png',4),(192,'Sassuolo','sassuolo.png',4),(193,'Lecce','lecce.png',4),(194,'Sampdoria','sampdoria.png',4),(195,'Udinese','udinese.png',4),(196,'Brescia','brescia.png',4),(197,'Genoa','genoa.png',4),(198,'SPAL','spal.png',4),(210,'Saskatchewan Roughriders','roughriders.png',2),(211,'Montreal Alouettes','alouettes.png',2),(212,'Winnipeg Blue Bombers','bluebombers.png',2),(213,'Hamilton Tiger-Cats','tigercats.png',2),(214,'Calgary Stampeders','stampeders.png',2),(215,'BC Lions','lions.png',2),(216,'Toronto Argonauts','argonauts.png',2),(217,'Edmonton Eskimos','eskimos.png',2),(218,'Ottawa Redblacks','redblacks.png',2),(223,'FC Shalke 04','schalke.png',15),(224,'Borussia Mönchengladbach','monchengladbach.png',15),(225,'FC Augsburg','augsburg.png',15),(226,'Borussia Dortmund','dortmund.png',15),(227,'RB Leipzig','leipzig.png',15),(228,'FC Bayern München','bayern.png',15),(229,'Bayer 04 Leverkusen','bayer.png',15),(230,'TSG 1899 Hoffenheim','hoffenheim.png',15),(231,'Sport-Club Freiburg','freiburg.png',15),(232,'VfL Wolfsburg','wolfsburg.png',15),(233,'FC Union Berlin','berlin.png',15),(234,'Hertha Berlin','hertha.png',15),(235,'Eintracht Frankfurt','eintract.png',15),(236,'1. FSV Mainz 05','mainz.png',15),(237,'1. FC Köln','koln.png',15),(238,'Fortuna Düsseldorf','fortuna.png',15),(239,'SV Werder Bremen','werder.png',15),(240,'SC Paderborn 07','paderborn.png',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (35,'2020-01-28 17:19:23','Test1','5721b2a5-a5de-4c07-a613-e95387813caa','bbd3fb73cfdbd1b84291c69c7703529c1706fffbcdd9d2431e6c1fa548634df6','pdcox64@gmail.com'),(36,'2020-01-28 21:43:02','test4','129797dd-628e-48ce-9de1-34298aa55f2d','ef42c7893b53501fa6e2db176cc045afba296f9773bf64a7ca8b6cb6ed33a2c4','pdcox64@gmail.com'),(37,'2020-01-28 21:46:01','test5','3665793b-ebd9-40c6-ad3f-5c2a1455ba57','eb84be59a5fd159f439b35c03451b7385bed71f4233dbc451aee2adec710bd0a','pdcox64@gmail.com');
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

/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwgameevents` AS select `x`.`league` AS `league`,`x`.`id` AS `eventid`,`x`.`date` AS `date`,concat(`x`.`date`,' ',`y`.`starttime`) AS `datetime`,`y`.`hometeam` AS `hometeam`,`y`.`awayteam` AS `awayteam`,`y`.`starttime` AS `starttime`,`y`.`homescore` AS `homescore`,`y`.`awayscore` AS `awayscore`,`y`.`id` AS `gameid`,`z`.`sport` AS `sportid`,`z`.`id` AS `leagueid`,`a`.`name` AS `sportname`,`a`.`icon` AS `icon`,`a`.`duration` AS `duration`,`p`.`status` AS `status`,`s`.`name` AS `name` from (((((`events` `x` join `games` `y` on((`y`.`event` = `x`.`id`))) join `leagues` `z` on((`x`.`league` = `z`.`name`))) join `sports` `a` on((`z`.`sport` = `a`.`id`))) join `progress` `p` on((`y`.`id` = `p`.`game`))) join `status` `s` on((`p`.`status` = `s`.`id`))) order by `x`.`date`,`y`.`starttime` */;
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

-- Dump completed on 2020-02-19 20:22:13
