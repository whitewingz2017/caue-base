CREATE DATABASE  IF NOT EXISTS `database-name` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `database-name`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: database-name
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `carshop_display`
--

DROP TABLE IF EXISTS `carshop_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carshop_display` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shop` varchar(60) NOT NULL,
  `index` int NOT NULL,
  `model` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carshop_display`
--

LOCK TABLES `carshop_display` WRITE;
/*!40000 ALTER TABLE `carshop_display` DISABLE KEYS */;
INSERT INTO `carshop_display` VALUES (1,'pdm',1,'faction'),(2,'pdm',2,'buccaneer2'),(3,'pdm',3,'primo'),(4,'pdm',4,'club'),(5,'pdm',5,'emperor'),(6,'pdm',6,'vigeronew');
/*!40000 ALTER TABLE `carshop_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carshop_logs`
--

DROP TABLE IF EXISTS `carshop_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carshop_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vid` int NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `financed` tinyint(1) NOT NULL,
  `commission` int NOT NULL,
  `tax` int NOT NULL,
  `shop` varchar(255) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `seller` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carshop_vehicles`
--

DROP TABLE IF EXISTS `carshop_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carshop_vehicles` (
  `model` varchar(60) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `shop` varchar(60) NOT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carshop_vehicles`
--

LOCK TABLES `carshop_vehicles` WRITE;
/*!40000 ALTER TABLE `carshop_vehicles` DISABLE KEYS */;
INSERT INTO `carshop_vehicles` VALUES ('asea',1990,'sedans',5,'pdm'),('asterope',2490,'sedans',5,'pdm'),('baller',3950,'suvs',5,'pdm'),('banshee',20400,'sports',5,'pdm'),('bison',3150,'vans',5,'pdm'),('bison2',3390,'vans',5,'pdm'),('blade',2150,'muscle',5,'pdm'),('blazer',2650,'offroad',5,'pdm'),('blazer3',2990,'offroad',5,'pdm'),('blazer4',3210,'offroad',5,'pdm'),('blista2',2620,'sports',5,'pdm'),('bobcatxl',2990,'vans',5,'pdm'),('buccaneer',2810,'muscle',5,'pdm'),('buccaneer2',3040,'muscle',5,'pdm'),('buffalo',6650,'sports',5,'pdm'),('buffalo4h',17500,'muscle',5,'pdm'),('burrito3',2860,'vans',5,'pdm'),('carbonizzare',18911,'sports',5,'pdm'),('cavalcade',3500,'suvs',5,'pdm'),('cavalcade2',3800,'suvs',5,'pdm'),('chino',2750,'muscle',5,'pdm'),('chino2',3100,'muscle',5,'pdm'),('club',670,'compacts',5,'pdm'),('cog55',5850,'sedans',5,'pdm'),('comet2',19590,'sports',5,'pdm'),('deviant',4690,'muscle',5,'pdm'),('dilettante',765,'compacts',5,'pdm'),('drafter',13880,'sports',5,'pdm'),('dukes',1880,'muscle',5,'pdm'),('emperor',2050,'sedans',5,'pdm'),('enduro',3050,'motorcycles',5,'pdm'),('faction',3850,'muscle',5,'pdm'),('faction2',4910,'muscle',5,'pdm'),('faction3',5450,'muscle',5,'pdm'),('fagaloa',1790,'sportsclassic',5,'pdm'),('fugitive',3799,'sedans',5,'pdm'),('fusilade',7125,'sports',5,'pdm'),('futo',3139,'sports',5,'pdm'),('glendale',2150,'sedans',5,'pdm'),('glendale2',2490,'sedans',5,'pdm'),('habanero',2350,'suvs',5,'pdm'),('huntley',3390,'suvs',5,'pdm'),('impaler',2230,'muscle',5,'pdm'),('ingot',1750,'sedans',5,'pdm'),('intruder',2980,'sedans',5,'pdm'),('jugular',15399,'sports',5,'pdm'),('kanjo',3990,'compacts',5,'pdm'),('komoda',13250,'sports',5,'pdm'),('landstalker',8850,'suvs',5,'pdm'),('landstalker2',9350,'suvs',5,'pdm'),('manana',2450,'sportsclassic',5,'pdm'),('manana2',2635,'sportsclassic',5,'pdm'),('manchez',2910,'motorcycles',5,'pdm'),('moonbeam',2780,'muscle',5,'pdm'),('moonbeam2',3010,'muscle',5,'pdm'),('peyote',2230,'sportsclassic',5,'pdm'),('phoenix',2310,'muscle',5,'pdm'),('picador',2050,'muscle',5,'pdm'),('prairie',2490,'compacts',5,'pdm'),('premier',2750,'sedans',5,'pdm'),('primo',2910,'sedans',5,'pdm'),('primo2',3220,'sedans',5,'pdm'),('radi',4150,'suvs',5,'pdm'),('rebla',11600,'suvs',5,'pdm'),('regina',1890,'sedans',5,'pdm'),('rhapsody',800,'compacts',5,'pdm'),('rocoto',4110,'suvs',5,'pdm'),('ruiner',3210,'muscle',5,'pdm'),('sabregt',4080,'muscle',5,'pdm'),('sabregt2',4450,'muscle',5,'pdm'),('sanchez2',3500,'motorcycles',5,'pdm'),('sandking',4810,'offroad',5,'pdm'),('sandking2',5150,'offroad',5,'pdm'),('schafter3',9150,'sports',5,'pdm'),('seminole',3660,'suvs',5,'pdm'),('speedo',2850,'vans',5,'pdm'),('stalion',2680,'muscle',5,'pdm'),('stanier',2660,'sedans',5,'pdm'),('stratum',2510,'sedans',5,'pdm'),('stryder',2850,'motorcycles',5,'pdm'),('sugoi',13800,'sports',5,'pdm'),('sultan',4160,'sports',5,'pdm'),('superd',8280,'sedans',5,'pdm'),('tailgater',4490,'sedans',5,'pdm'),('tampa',3220,'muscle',5,'pdm'),('tornado',2870,'sportsclassic',5,'pdm'),('tulip',2660,'muscle',5,'pdm'),('vamos',2990,'muscle',5,'pdm'),('vigero',2555,'muscle',5,'pdm'),('vigeronew',19000,'muscle',5,'pdm'),('virgo',2635,'muscle',5,'pdm'),('virgo2',2905,'muscle',5,'pdm'),('virgo3',3120,'muscle',5,'pdm'),('voodoo',2610,'muscle',5,'pdm'),('washington',2780,'sedans',5,'pdm'),('youga',2950,'vans',5,'pdm'),('youga2',3110,'vans',5,'pdm'),('youga3',3830,'vans',5,'pdm');
/*!40000 ALTER TABLE `carshop_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hex` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int NOT NULL,
  `dob` varchar(255) NOT NULL,
  `cash` int DEFAULT '0',
  `bankid` int DEFAULT '0',
  `paycheck` int DEFAULT '0',
  `health` smallint DEFAULT '100',
  `armour` smallint DEFAULT '0',
  `hunger` smallint DEFAULT '100',
  `thirst` smallint DEFAULT '100',
  `stress` smallint DEFAULT '0',
  `phone` bigint DEFAULT NULL,
  `job` varchar(255) DEFAULT 'unemployed',
  `job2` varchar(255) DEFAULT 'none',
  `jail` int DEFAULT '-1',
  `first_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  `new` tinyint(1) DEFAULT '1',
  `hotel` int DEFAULT '1',
  `licenses` varchar(255) DEFAULT '{}',
  `aliases` varchar(50) DEFAULT NULL,
  `bones` text,
  `dna` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `hex_characters_fk_idx` (`hex`),
  CONSTRAINT `hex_characters_fk` FOREIGN KEY (`hex`) REFERENCES `users` (`hex`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1194 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters_clothes`
--

DROP TABLE IF EXISTS `characters_clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_clothes` (
  `cid` int NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `drawables` text,
  `props` text,
  `drawtextures` text,
  `proptextures` text,
  `hairColor` varchar(255) DEFAULT NULL,
  `fadeStyle` int DEFAULT NULL,
  `headBlend` text,
  `headStructure` text,
  `headOverlay` text,
  `tattoos` text,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid` (`cid`),
  CONSTRAINT `cid_caracters_clothes_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `characters_emotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_emotes` (
  `cid` int NOT NULL,
  `walk` varchar(255) DEFAULT NULL,
  `emotes` text,
  `expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid` (`cid`),
  CONSTRAINT `cid_caracters_emotes_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters_outfits`
--

DROP TABLE IF EXISTS `characters_outfits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_outfits` (
  `cid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `slot` int NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `drawables` text,
  `props` text,
  `drawtextures` text,
  `proptextures` text,
  `hairColor` varchar(255) DEFAULT NULL,
  `fadeStyle` int DEFAULT NULL,
  `headBlend` text,
  `headStructure` text,
  `headOverlay` text,
  KEY `cid_caracters_outfits_fk` (`cid`),
  CONSTRAINT `cid_caracters_outfits_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financials_accounts`
--

DROP TABLE IF EXISTS `financials_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financials_accounts` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `owner` int NOT NULL,
  `balance` int NOT NULL DEFAULT '1000',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  `is_monitored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financials_accounts`
--

LOCK TABLES `financials_accounts` WRITE;
/*!40000 ALTER TABLE `financials_accounts` DISABLE KEYS */;
INSERT INTO `financials_accounts` VALUES (0,0,0,5000,0,0),(1,3,0,10000000,0,0),(2,5,0,10000000,0,0),(6,5,0,5000,0,0),(7,5,0,5006,0,0),(8,5,0,5000,0,0),(9,5,0,5006,0,0),(10,5,0,5000,0,0),(11,5,0,5006,0,0),(12,5,0,5006,0,0),(13,5,0,5006,0,0),(20,5,0,5000,0,0),(21,5,0,5000,0,0),(22,5,0,5000,0,0),(23,5,0,5006,0,0);
/*!40000 ALTER TABLE `financials_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financials_accounts_names`
--

DROP TABLE IF EXISTS `financials_accounts_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financials_accounts_names` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financials_accounts_names`
--

LOCK TABLES `financials_accounts_names` WRITE;
/*!40000 ALTER TABLE `financials_accounts_names` DISABLE KEYS */;
INSERT INTO `financials_accounts_names` VALUES (0,'Unknown Account'),(1,'State Account'),(2,'Chafe Bank'),(6,"Benny\'s Original Motor Works"),(7,'San Andreas Crypto Exchange'),(8,'Los Santos Rental Cars'),(9,'Mr Spoke Bike Rental'),(10,'Los Santos Boat Shop'),(11,'Car Wash'),(12,'Fuel Station'),(13,'Los Santos Clothings'),(20,'24/7 Supermarket'),(21,'Ammunation'),(22,'Tools Shop'),(23,'Trading Card Game');
/*!40000 ALTER TABLE `financials_accounts_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financials_accounts_types`
--

DROP TABLE IF EXISTS `financials_accounts_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financials_accounts_types` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financials_accounts_types`
--

LOCK TABLES `financials_accounts_types` WRITE;
/*!40000 ALTER TABLE `financials_accounts_types` DISABLE KEYS */;
INSERT INTO `financials_accounts_types` VALUES (0,'Unknown'),(1,'Default'),(2,'Savings Account'),(3,'State Entity Account'),(4,'Group Account'),(5,'Business Account');
/*!40000 ALTER TABLE `financials_accounts_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financials_taxes`
--

DROP TABLE IF EXISTS `financials_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financials_taxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tax` varchar(255) NOT NULL,
  `porcentage` int NOT NULL DEFAULT '0',
  `total` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `tax_UNIQUE` (`tax`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financials_taxes`
--

LOCK TABLES `financials_taxes` WRITE;
/*!40000 ALTER TABLE `financials_taxes` DISABLE KEYS */;
INSERT INTO `financials_taxes` VALUES (1,'Services',5,0),(2,'Income',5,0),(3,'Propertys',5,0),(4,'Vehicles',5,0),(5,'Goods',5,0);
/*!40000 ALTER TABLE `financials_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financials_transactions`
--

DROP TABLE IF EXISTS `financials_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financials_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `sender` int NOT NULL,
  `receiver` int NOT NULL,
  `amount` int NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `user` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1731 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financials_transactions_types`
--

DROP TABLE IF EXISTS `financials_transactions_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financials_transactions_types` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financials_transactions_types`
--

LOCK TABLES `financials_transactions_types` WRITE;
/*!40000 ALTER TABLE `financials_transactions_types` DISABLE KEYS */;
INSERT INTO `financials_transactions_types` VALUES (1,'transfer'),(2,'deposit'),(3,'withdraw'),(4,'payslip'),(5,'purchase'),(6,'financing'),(7,'purchase cash'),(8,'ticket');
/*!40000 ALTER TABLE `financials_transactions_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bank` int NOT NULL DEFAULT '0',
  `spawn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_UNIQUE` (`group`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'city_hall','Los Santos City Hall',0,'{\"x\":-579.31,\"y\":-201.91,\"z\":38.22,\"h\":211.12}'),(2,'doc','Department of Corrections',0,'{\"x\":1853.27,\"y\":2582.11,\"z\":45.68,\"h\":273.99}'),(3,'doj','Department of Justice',0,'{\"x\":-496.78,\"y\":-209.91,\"z\":36.77,\"h\":230.21}'),(4,'ems','Emergency Medical Services',0,'{\"x\":323.03,\"y\":-600.46,\"z\":43.29,\"h\":66.65}'),(5,'pdm','Premium Deluxe Motorsport',0,NULL),(6,'police','Los Santos County Sheriff',0,'{\"x\":435.1,\"y\":-974.62,\"z\":30.72,\"h\":90.6}'),(7,'racing','Racing',0,NULL),(8,'state_police','San Andreas State Police',0,'{\"x\":1865.63,\"y\":3688.8,\"z\":34.27,\"h\":211.06}'),(9,'sheriff',"Blaine County Sheriff\'s Office",0,NULL),(10,'park_ranger','San Andreas Park Rangers',0,'{\"x\":390.53,\"y\":799.01,\"z\":187.68,\"h\":271.06}'),(11,'fire_department','Los Santos Fire Deparment',0,'{\"x\":-629.93,\"y\":-135.02,\"z\":39.23,\"h\":11.99}'),(12,'taco_shop','Taco Libre',0,NULL),(13,'vanilla_unicorn','Vanilla Unicorn',0,NULL),(16,'real_estate','Real Estate',0,NULL),(17,'yb14','Young Boys 14',0,NULL),(18,'cid','Divisão de Investigação Criminal',0,'{\"x\":-1098.47,\"y\":-811.3,\"z\":19.32,\"h\":306.17}'),(19,'bennys',"Benny\'s Original Motor Works",0,'{\"x\":-207.65,\"y\":-1338.93,\"z\":34.9,\"h\":42.41}'),(20,'ghettorecords','Out Dat Ghetto Records',0,'{\"x\":-812.8,\"y\":-695.81,\"z\":28.07,\"h\":114.09}');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_logs`
--

DROP TABLE IF EXISTS `groups_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `group_groups_logs_fk_idx` (`group`),
  CONSTRAINT `group_groups_logs_fk` FOREIGN KEY (`group`) REFERENCES `groups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups_members`
--

DROP TABLE IF EXISTS `groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `group` varchar(255) NOT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `giver` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cid_groups_members_fk_idx` (`cid`),
  KEY `pass_groups_members_fk_idx` (`group`),
  KEY `giver_groups_members_fk_idx` (`giver`),
  CONSTRAINT `cid_groups_members_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `giver_groups_members_fk` FOREIGN KEY (`giver`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_groups_members_fk` FOREIGN KEY (`group`) REFERENCES `groups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups_ranks`
--

DROP TABLE IF EXISTS `groups_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_ranks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `paycheck` int DEFAULT NULL,
  `hire` tinyint(1) DEFAULT '0',
  `withdraw` tinyint(1) DEFAULT '0',
  `deposit` tinyint(1) DEFAULT '0',
  `logs` tinyint(1) DEFAULT '0',
  `documents` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `group_groups_ranks_fk_idx` (`group`),
  CONSTRAINT `group_groups_ranks_fk` FOREIGN KEY (`group`) REFERENCES `groups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_ranks`
--

LOCK TABLES `groups_ranks` WRITE;
/*!40000 ALTER TABLE `groups_ranks` DISABLE KEYS */;
INSERT INTO `groups_ranks` VALUES (3,'police',1,'Deputy Sheriff Trainee',200,0,0,1,0,1),(4,'police',2,'Deputy Sheriff',240,0,0,1,0,1),(5,'police',3,'Deputy Sheriff Bonus I',290,0,0,1,0,1),(6,'police',4,'Deputy Sheriff Bonus II',370,0,0,1,0,1),(7,'police',5,'Sergeant',420,0,0,1,0,1),(8,'police',6,'Lieutenant',480,0,0,1,0,1),(9,'police',7,'Captain',500,1,0,1,1,1),(10,'police',8,'Area Commander',560,1,0,1,1,1),(11,'police',9,'Division Chief',600,1,1,1,1,1),(16,'ems',1,'Trainee',NULL,0,0,0,0,0),(17,'ems',2,'Emergency Medical Technician',NULL,0,0,0,0,0),(18,'ems',3,'Paramedic',NULL,0,0,0,0,0),(19,'ems',4,'Paramedic FTO',NULL,0,0,0,0,0),(20,'ems',5,'Lieutenant',NULL,0,0,0,0,0),(21,'pdm',1,'Trainee',NULL,0,0,0,0,0),(22,'pdm',2,'Salesman',NULL,0,0,0,0,0),(23,'pdm',3,'Manager',NULL,1,0,1,1,0),(24,'pdm',4,'Owner',NULL,1,1,1,1,1),(25,'racing',1,'Member',NULL,0,0,0,0,0),(26,'racing',2,'Manager',NULL,1,0,0,1,0),(27,'city_hall',1,'Employee',NULL,0,0,0,0,1),(28,'city_hall',2,'Secretary',NULL,1,0,1,1,1),(29,'city_hall',3,'Mayor',NULL,1,1,1,1,1),(30,'doj',1,'Public Defender',NULL,0,0,0,0,1),(31,'doj',2,'District Attorney',NULL,0,0,0,0,1),(32,'doj',3,'Judge',NULL,1,1,1,1,1),(33,'doc',1,'Officer',NULL,0,0,0,0,1),(34,'doc',2,'Senior Officer',NULL,0,0,0,0,1),(35,'doc',3,'Captain',NULL,1,1,1,1,1),(40,'ems',6,'Assistant Chief of EMS',NULL,0,0,0,0,0),(41,'ems',7,'Chief of EMS',NULL,1,1,1,1,1),(51,'state_police',1,'Trooper',NULL,0,0,0,0,0),(52,'state_police',2,'Chief of SASP',NULL,1,1,1,1,1),(53,'park_ranger',1,'Ranger',NULL,0,0,0,0,0),(54,'park_ranger',2,'Senior Ranger',NULL,0,0,0,0,0),(55,'park_ranger',3,'Lead Ranger',NULL,1,1,1,1,1),(56,'taco_shop',1,'Funcionario',150,0,0,1,0,0),(57,'taco_shop',2,'Gerente',200,1,0,1,1,0),(58,'taco_shop',3,'Dono',250,1,1,1,1,0),(59,'vanilla_unicorn',1,'Barman',NULL,0,0,0,0,0),(60,'vanilla_unicorn',2,'Gerente',NULL,1,0,0,1,0),(61,'vanilla_unicorn',3,'Dono',NULL,1,1,1,1,0),(62,'police',10,'Assistant Sheriff',675,1,1,1,0,1),(63,'police',11,'Undersheriff',720,1,1,1,1,1),(64,'police',12,'Sheriff',820,1,1,1,1,1),(65,'sheriff',1,'Sheriff',NULL,0,0,0,0,0),(66,'fire_department',1,'Fire Cadet',NULL,0,0,1,0,1),(67,'real_estate',1,'Label',NULL,0,0,0,0,0),(68,'yb14',4,'Capitão Orgasmo',NULL,1,1,1,1,1),(69,'yb14',3,'Principe do Sexo',NULL,1,1,1,1,1),(70,'yb14',2,'CEO do Sexo',NULL,1,0,1,0,1),(71,'yb14',1,'Punhetinha',NULL,0,0,1,0,0),(72,'cid',1,'Detective I',675,0,0,1,0,1),(73,'cid',2,'Detective II',700,0,0,1,0,1),(74,'cid',3,'Detective III',725,0,0,1,0,1),(75,'cid',4,'Chief Detective',750,1,1,1,1,1),(76,'cid',5,'Chief Division',775,1,1,1,1,1),(77,'bennys',1,'Mecanico',NULL,0,0,1,0,0),(78,'bennys',2,'Chefe',NULL,1,1,1,1,0),(79,'fire_department',2,'Firefighter I',NULL,0,0,1,0,1),(80,'fire_department',3,'Firefighter II',NULL,0,0,1,0,1),(81,'fire_department',4,'Firefighter III',NULL,0,0,1,0,1),(82,'fire_department',5,'Fire Engineer',NULL,0,0,1,0,1),(83,'fire_department',6,'Fire Apparatus Operator',NULL,0,0,1,0,1),(84,'fire_department',7,'Captain I',NULL,1,0,1,0,1),(85,'fire_department',8,'Captain II',NULL,1,0,1,0,1),(86,'fire_department',9,'Battalion Chief',NULL,1,0,1,0,1),(87,'fire_department',10,'Fire Assistant Chief',NULL,1,1,1,1,1),(88,'fire_department',11,'Fire Deputy Chief',NULL,1,1,1,1,1),(89,'fire_department',12,'Fire Chief',NULL,1,1,1,1,1),(90,'ghettorecords',1,'Artista',NULL,0,0,1,0,0),(91,'ghettorecords',2,'Produtor',NULL,1,0,1,1,0),(92,'ghettorecords',3,'Dono',NULL,1,1,1,1,0);
/*!40000 ALTER TABLE `groups_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing`
--

DROP TABLE IF EXISTS `housing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid` int NOT NULL,
  `information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `objects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_payment` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `hid` (`hid`),
  KEY `cid_housing_fk_idx` (`cid`),
  CONSTRAINT `cid_housing_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `housing_keys`
--

DROP TABLE IF EXISTS `housing_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `hid_housing_keys_fk_idx` (`hid`),
  KEY `cid_housing_keys_fk_idx` (`cid`),
  CONSTRAINT `cid_housing_keys_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hid_housing_keys_fk` FOREIGN KEY (`hid`) REFERENCES `housing` (`hid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `information` text,
  `slot` int NOT NULL,
  `dropped` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8275 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `paycheck` int NOT NULL,
  `is_emergency` tinyint(1) NOT NULL DEFAULT '0',
  `is_police` tinyint(1) NOT NULL DEFAULT '0',
  `is_medic` tinyint(1) NOT NULL DEFAULT '0',
  `is_doj` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `job_UNIQUE` (`job`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (0,'unemployed','Unemployed',75,0,0,0,0),(1,'ems','EMS',200,1,0,1,0),(4,'police','Police Officer',200,1,1,0,0),(5,'doc','Department of Corrections Officer',200,1,0,0,0),(6,'mayor','Mayor',200,0,0,0,0),(7,'judge','Judge',200,0,0,0,1),(8,'defender','Public Defender',200,0,0,0,1),(9,'district attorney','District Attorney',200,0,0,0,1),(10,'doctor','Doctor',200,1,0,1,0),(11,'sheriff','Sheriff Officer',200,1,1,0,0),(12,'state_police','State Trooper',200,1,1,0,0),(13,'park_ranger','Park Ranger',200,1,1,0,0),(14,'taco_shop','Taco Libre',150,0,0,0,0),(15,'real_estate','Real Estate Agent',200,0,0,0,0),(16,'yb14','Young Boys Drip',100,0,0,0,0),(17,'cid','Investigador Criminal',200,1,1,0,0),(18,'bennys',"Benny\'s Original Motor Works",100,0,0,0,0),(19,'fire_department','Los Santos Fire Department',200,1,0,1,0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_callsigns`
--

DROP TABLE IF EXISTS `jobs_callsigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_callsigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `job` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_bolos`
--

DROP TABLE IF EXISTS `mdt_bolos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_bolos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `plate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `owner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `individual` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gallery` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `officers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'police',
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid_mdt_bolos_fk_idx` (`cid`),
  CONSTRAINT `cid_mdt_bolos_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdt_bolos`
--

LOCK TABLES `mdt_bolos` WRITE;
/*!40000 ALTER TABLE `mdt_bolos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_bolos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdt_bulletins`
--

DROP TABLE IF EXISTS `mdt_bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_bulletins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'police',
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_incidents`
--

DROP TABLE IF EXISTS `mdt_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_incidents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `officers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `civilians` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `evidence` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `associated` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'police',
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_logs`
--

DROP TABLE IF EXISTS `mdt_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_messages`
--

DROP TABLE IF EXISTS `mdt_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'police',
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_missing`
--

DROP TABLE IF EXISTS `mdt_missing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_missing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `last_seen` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 ,
  `image` text CHARACTER SET utf8mb4 ,
  `date` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdt_missing`
--

LOCK TABLES `mdt_missing` WRITE;
/*!40000 ALTER TABLE `mdt_missing` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_missing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdt_penalcode`
--

DROP TABLE IF EXISTS `mdt_penalcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_penalcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `category` int NOT NULL DEFAULT '1',
  `label` varchar(255) DEFAULT NULL,
  `sentence` int NOT NULL DEFAULT '0',
  `fine` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdt_penalcode`
--

LOCK TABLES `mdt_penalcode` WRITE;
/*!40000 ALTER TABLE `mdt_penalcode` DISABLE KEYS */;
INSERT INTO `mdt_penalcode` VALUES (69,0,1,'Velocidade Absoluta',0,80),(100,1,1,'Suborno',20,0),(101,1,1,'Corrupção ativa',120,0),(102,1,1,'Corrupção passiva',120,0),(103,1,1,'Corrupção',140,2000),(104,2,1,'Resgate',20,0),(105,2,1,'Fuga de custódia',25,600),(106,2,1,'Auxílio a Fuga de Custódia',25,600),(107,2,1,'Instrumento de Fuga de Custódia',15,0),(108,1,1,'Perjúria',40,0),(109,1,1,'Perjúria Oficial',20,0),(110,1,1,'Subordinação de Perjúria',40,0),(111,1,1,'Falsificação de evidência',30,0),(112,1,1,'Falsificação testemunhal',25,0),(113,1,1,'Falsa identidade',10,0),(114,1,1,'(1) Obstrução de Justiça',15,200),(115,2,1,'(2) Obstrução de Justiça',25,0),(116,1,1,'Trote',5,100),(117,1,1,'Obstrução de Justiça',15,0),(118,2,2,'Homicídio em Primeiro Grau',999999,0),(119,2,2,'Homicídio em Segundo Grau',999999,0),(120,2,2,'Homicídio por Crime de Ódio',999999,0),(121,2,2,'Homicídio Culposo Voluntário',60,0),(122,2,2,'Homicídio Culposo Involuntário',45,0),(123,1,2,'Homicídio Culposo Veicular',40,0),(124,2,2,'Mutilação',180,0),(125,2,2,'Tortura',180,0),(126,2,2,'Sequestro',15,0),(127,2,2,'Extorsão mediante sequestro',15,0),(128,2,2,'Reféns',15,0),(129,2,2,'Roubo em Primeiro Grau',25,0),(130,2,2,'Roubo em Segundo Grau',20,0),(131,2,2,'Roubo em Transporte',20,0),(132,2,2,'Roubo Veicular',10,0),(133,1,2,'Arremesso de Objeto',5,0),(134,1,2,'Falsa prisão',10,150),(135,1,2,'Ataque',5,150),(136,1,2,'Ataque contra Oficiais de Emergência',10,300),(137,1,2,'Ataque contra Oficiais Correcionais',5,0),(138,1,2,'Agressão',15,350),(139,1,2,'Agressão agravada',20,500),(140,1,2,'Agressão corporal grave',15,0),(141,2,2,'Ataque com instrumento',0,0),(142,1,2,'Ataque com Arma Branca',15,600),(143,2,2,'Ataque com Arma de Fogo',25,800),(144,2,2,'Ataque com Arma de Fogo Restrita',30,0),(145,2,2,'Ataque com outros meios',10,0),(146,2,2,'Ataque com Semiautomática',30,0),(147,2,2,'Ataque contra oficiais da paz',30,0),(148,2,2,'Ataque em Transporte',15,0),(149,1,2,'Disparando Arma de Fogo',20,0),(150,1,3,'Relações Sexuais Ilegais',15,0),(151,1,3,'Prostituição',15,200),(152,2,3,'Rufianismo',0,0),(153,1,3,'Culto Religioso',10,200),(154,1,3,'Tabaco para menores',5,100),(155,1,3,'Conteúdo para maiores',15,800),(156,1,3,'Conteúdo Obsceno',10,1200),(157,1,3,'Conduta obscena',25,600),(158,1,3,'Exposição indecente',10,0),(159,1,3,'Loteria',10,0),(160,1,3,'Jogos de azar',5,300),(161,1,3,'Falsa penhora',10,0),(162,2,3,'Veneno',40,0),(163,1,3,'Vendedor Falso e Fraude no Produto',5,100),(164,1,3,'105. Desobediência a Ordem de Soltura',5,350),(165,1,3,'106. Desobediência a Ordem de Soltura',10,500),(166,1,3,'Oclusão a Ordem de Soltura',15,500),(167,2,3,'Lesões corporais contra idosos, deficientes e menores',15,150),(168,1,4,'Despejo de Resíduos',5,100),(169,0,4,'Despejo em Propriedades',0,150),(170,1,4,'Despejo Marítmo',15,150),(171,1,4,'Despejo em Logradouro ou Passeio',10,300),(172,1,4,'Alteração de bens de consumo',5,300),(173,1,4,'Comunicação Emergencial',10,200),(174,1,4,'Caça ilegal',5,200),(175,1,4,'Preço falso',5,150),(176,2,4,'Auxílio a Suicídio',30,0),(177,1,4,'Instigamento ao Suicídio',40,0),(178,1,4,'Local de Emergência',10,150),(179,1,4,'Distúrbio de Assembléia',5,100),(180,1,4,'Tumulto',10,150),(181,1,4,'Aliciação a Tumulto',15,150),(182,1,4,'Participação de Tumulto',5,70),(183,1,4,'Desordenação',10,150),(184,1,4,'Clube de Luta',30,500),(185,1,4,'Combate Mútuo',5,50),(186,1,4,'Perturbação da Paz',10,120),(187,1,4,'Arma Mortal em Público',10,0),(188,1,4,'Arma de Fogo em Público',10,250),(189,2,4,'Brandindo Arma de Fogo',30,0),(190,1,5,'Ameaça',10,0),(191,1,6,'Ódio Autoritário',0,200),(192,1,6,'Ódio Delituoso',15,0),(193,1,6,'Ódio Criminoso',20,0),(194,2,7,'Peculato',30,0),(195,2,8,'Incêndio',30,0),(196,1,8,'Posse de substância inflamável',10,0),(197,1,8,'Furto de Lojas',20,150),(198,2,8,'Arrombamento em Primeiro Grau',25,0),(199,1,8,'Arrombamento em Segundo Grau',20,0),(200,2,8,'Arrombamento Qualificado',25,0),(201,1,8,'Arrombamento com Instrumento',15,150),(202,1,8,'Falsificação',10,0),(203,1,8,'Falsificação de Documento Público',10,0),(204,1,8,'Falsificação de Documento Governamental',25,0),(205,1,8,'Furto de Grande Valor',20,0),(206,1,8,'Furto de Semovente',15,0),(207,1,8,'Furto de Carga',15,300),(208,1,8,'Furto de Pequeno Valor',5,150),(209,0,8,'Furto de Bagatela',0,50),(210,1,8,'Furto Organizado',15,0),(211,1,8,'Receptação',0,300),(212,2,8,'Extorsão',20,0),(213,1,8,'Personificação',10,500),(214,1,8,'Estelionato',0,0),(215,1,8,'Usurpação de Emprego Público',20,500),(216,1,8,'Fraude de Serviços',5,150),(217,1,8,'Fraude contra Seguro',20,0),(218,1,8,'Dano',10,0),(219,1,8,'Dano Qualificado',10,0),(220,1,9,'Vandalismo',10,300),(221,2,9,'Desmazelo a Animais',0,0),(222,1,9,'Compadecimento de Rinha',0,0),(223,1,9,'Invasão',10,200),(224,1,10,'Conduta Desordeira',10,70),(225,1,10,'Posse de Substância Controlada',10,210),(226,2,10,'Tráfico de Entorpecentes',25,0),(227,1,10,'Posse ou porte de arma de fogo permitida',15,200),(228,2,10,'Posse ou porte de arma de fogo restrita',40,0),(229,1,10,'Armas Brancas',10,0),(230,1,11,'Falha Delituosa',10,100),(231,1,11,'Falha Criminosa',20,230),(232,1,11,'Não pagamento de multas',15,0),(233,1,11,'Intimação',10,0),(234,1,11,'Desprezo',15,300),(235,0,1,'Velocidade Básica',0,70),(236,0,1,'Velocidade Básica (2ª incidência)',0,90),(237,0,1,'Velocidade Básica (3ª incidência)',0,120),(239,0,1,'Velocidade Absoluta (2ª incidência)',0,100),(240,0,1,'Velocidade Absoluta (3ª incidência)',0,130),(241,1,1,'Condução Imprudente',10,50),(242,0,1,'Arremesso de Objetos',0,40),(243,1,1,'Transporte Irregular',20,100),(244,0,1,'Uso de Óculos de Grau',0,30),(245,0,1,'Dirigindo Distraído',0,30),(246,1,1,'Lesão Corporal Culposa',30,400),(247,0,1,'Ultrapassagem',0,70),(248,0,1,'Não Respeitar Sinais de Tráfego',0,50),(249,0,1,'Retorno Proibido',0,40),(250,1,1,'Ordem Legal',10,100),(251,1,1,'Evadindo-se de Oficial da Paz',15,200),(252,2,1,'Evasão Imprudente Criminosa',20,400),(253,1,1,'Dirigindo sem Licença',10,100),(254,1,1,'Dirigindo com licença suspensa ou revogada',5,40),(255,1,1,'Dirigindo com licença suspensa ou revogada (2ª incidência)',8,60),(256,1,1,'Dirigindo com licença suspensa ou revogada (3ª incidência)',12,80),(257,0,1,'Parando, Estacionando ou Deixando Veículo (1)',0,20),(258,0,1,'Parando, Estacionando ou Deixando Veículo (2)',0,40),(259,0,1,'Parando, Estacionando ou Deixando Veículo (3)',0,80),(260,0,1,'Equipamentos de Iluminação',0,35),(261,1,1,'Mau estado de conservação',10,40),(262,0,1,'Dirigindo sem faróis',0,25),(263,0,1,'Dirigindo sem capacete de segurança',0,70),(264,0,1,'Parada, Conversão e Sinal',0,40),(265,0,1,'Exibição de placa licenciada',0,100),(266,0,1,'Responsabilidade do Proprietário',0,100);
/*!40000 ALTER TABLE `mdt_penalcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdt_penalcode_categorys`
--

DROP TABLE IF EXISTS `mdt_penalcode_categorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_penalcode_categorys` (
  `cid` int NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `tid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdt_penalcode_categorys`
--

LOCK TABLES `mdt_penalcode_categorys` WRITE;
/*!40000 ALTER TABLE `mdt_penalcode_categorys` DISABLE KEYS */;
INSERT INTO `mdt_penalcode_categorys` VALUES (1,'CRIMES CONTRA A JUSTIÇA PÚBLICA'),(2,'CRIMES CONTRA A PESSOA'),(3,'CRIMES ENVOLVENDO ATAQUES SEXUAIS E CONTRA DECÊNCIA PÚBLICA'),(4,'CRIMES CONTRA A SAÚDE E SEGURANÇA PÚBLICA'),(5,'AMEAÇA CRIMINAL'),(6,'DIREITOS CIVIS'),(7,'CRIMES CONTRA A RECEITA E PROPRIEDADE DO ESTADO'),(8,'CRIMES CONTRA A PROPRIEDADE'),(9,'PREJUÍZO MALICIOSO'),(10,'CRIMES DIVERSOS'),(11,'PROCEDIMENTOS DIVERSOS'),(12,'REGRAS DA ESTRADA');
/*!40000 ALTER TABLE `mdt_penalcode_categorys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdt_profiles`
--

DROP TABLE IF EXISTS `mdt_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `image` text CHARACTER SET utf8mb4 ,
  `description` text CHARACTER SET utf8mb4 ,
  `tags` text CHARACTER SET utf8mb4 ,
  `gallery` text CHARACTER SET utf8mb4 ,
  `dna` varchar(7) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid_mdt_profiles_fk_idx` (`cid`),
  CONSTRAINT `cid_mdt_profiles_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_reports`
--

DROP TABLE IF EXISTS `mdt_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `officers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `civilians` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'police',
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid_mdt_reports_fk_idx` (`cid`),
  CONSTRAINT `cid_mdt_reports_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_vehicles`
--

DROP TABLE IF EXISTS `mdt_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `code5` int DEFAULT '0',
  `stolen` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate_UNIQUE` (`plate`),
  CONSTRAINT `plate_mdt_vehicles_fk` FOREIGN KEY (`plate`) REFERENCES `vehicles` (`plate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdt_weapons`
--

DROP TABLE IF EXISTS `mdt_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdt_weapons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `serial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `musics`
--

DROP TABLE IF EXISTS `musics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone_contacts`
--

DROP TABLE IF EXISTS `phone_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cid_phone_contacts_fk_idx` (`cid`),
  CONSTRAINT `cid_phone_contacts_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone_sms`
--

DROP TABLE IF EXISTS `phone_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_sms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` bigint NOT NULL,
  `receiver` bigint NOT NULL,
  `message` text NOT NULL,
  `date` int NOT NULL,
  `seen` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `racing_races`
--

DROP TABLE IF EXISTS `racing_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racing_races` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `distance` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `fastest_time` int DEFAULT '0',
  `fastest_name` varchar(255) DEFAULT 'N/A',
  `races` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scenes`
--

DROP TABLE IF EXISTS `scenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `color` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `viewdistance` int DEFAULT NULL,
  `expiration` int DEFAULT NULL,
  `fontsize` decimal(10,1) DEFAULT NULL,
  `fontstyle` int DEFAULT NULL,
  `coords` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `date_creation` datetime DEFAULT NULL,
  `date_deletion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprays`
--

DROP TABLE IF EXISTS `sprays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) DEFAULT NULL,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `origX` float(8,4) NOT NULL,
  `origY` float(8,4) NOT NULL,
  `origZ` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  `imageDict` varchar(64) DEFAULT NULL,
  `font` varchar(32) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `interior` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES ('SHUNG','Shungite',0.00,0.00,0.00),('STR711','7/11',762.00,9.33,100.00),('STRAMM','Ammunation',1184.00,7.05,100.00),('STRBOA','Bank of America',1059.00,5.27,100.00),('STRCLS','Clothing LS',594.00,-5.86,99.99),('STRLSC','LS Customs',968.00,-2.71,100.00);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks_characters`
--

DROP TABLE IF EXISTS `stocks_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks_characters` (
  `cid` int NOT NULL,
  `SHUNG` decimal(10,2) NOT NULL DEFAULT '0.00',
  `STRAMM` decimal(10,2) DEFAULT '0.00',
  `STRLSC` decimal(10,2) DEFAULT '0.00',
  `STR711` decimal(10,2) DEFAULT '0.00',
  `STRBOA` decimal(10,2) DEFAULT '0.00',
  `STRCLS` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid` (`cid`),
  CONSTRAINT `cid_stocks_characters_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hex` varchar(255) DEFAULT NULL,
  `steamid` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `discord` varchar(255) DEFAULT NULL,
  `first_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeplayed` int DEFAULT '0',
  `rank` varchar(45) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `hex` (`hex`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_bans`
--

DROP TABLE IF EXISTS `users_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_bans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hex` varchar(255) NOT NULL,
  `time` bigint NOT NULL,
  `reason` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hex` (`hex`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `hex_users_bans_fk` FOREIGN KEY (`hex`) REFERENCES `users` (`hex`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variables` (
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` VALUES ('last_stock_update','1646642927'),('whitelist_tags','{\"924862182187995156\", \"925760894380703825\", \"925237446986301450\"}');
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `plate` varchar(8) CHARACTER SET utf8mb4 NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'none',
  `type` varchar(255) CHARACTER SET utf8mb4 DEFAULT 'car',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `plate_UNIQUE` (`plate`),
  KEY `cid_vehicles_fk_idx` (`cid`),
  CONSTRAINT `cid_vehicles_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles_garage`
--

DROP TABLE IF EXISTS `vehicles_garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles_garage` (
  `vid` int NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'In',
  `garage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Motel',
  `coords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '{}',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `vid` (`vid`),
  CONSTRAINT `vid_vehicles_garage_fk` FOREIGN KEY (`vid`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles_metadata`
--

DROP TABLE IF EXISTS `vehicles_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles_metadata` (
  `vid` int NOT NULL,
  `fuel` int DEFAULT '100',
  `body_damage` int NOT NULL DEFAULT '1000',
  `engine_damage` int NOT NULL DEFAULT '1000',
  `degradation` text CHARACTER SET utf8mb4,
  `mileage` decimal(10,2) DEFAULT '0.00',
  `modifications` text CHARACTER SET utf8mb4,
  `fakePlate` varchar(8) CHARACTER SET utf8mb4 DEFAULT NULL,
  `harness` int DEFAULT '0',
  `2step` tinyint(1) DEFAULT '0',
  `nitrous` int DEFAULT '0',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `vid` (`vid`),
  CONSTRAINT `vid_vehicles_metadata_fk` FOREIGN KEY (`vid`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles_payments`
--

DROP TABLE IF EXISTS `vehicles_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles_payments` (
  `vid` int NOT NULL,
  `price` int DEFAULT '0',
  `left` int NOT NULL DEFAULT '0',
  `last` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `vid` (`vid`),
  CONSTRAINT `vid_vehicles_payments_fk` FOREIGN KEY (`vid`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weed`
--

DROP TABLE IF EXISTS `weed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` int NOT NULL,
  `coords` varchar(255) NOT NULL,
  `strain` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `last_harvest` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whitelist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hex` varchar(255) NOT NULL,
  `priority` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hex` (`hex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'database-name'
--

--
-- Dumping routines for database 'database-name'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-09 12:33:54
