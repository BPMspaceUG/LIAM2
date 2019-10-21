-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.28.1.100    Database: bpmspace_liam2_v2
-- ------------------------------------------------------
-- Server version	10.1.40-MariaDB-1~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `liam2_LoginAttempts`
--

DROP TABLE IF EXISTS `liam2_LoginAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam2_LoginAttempts` (
  `liam2_LoginAttempts_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_LoginAttempts_time` datetime DEFAULT NULL,
  `liam2_LoginAttempts_info` mediumtext,
  PRIMARY KEY (`liam2_LoginAttempts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam2_Role`
--

DROP TABLE IF EXISTS `liam2_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam2_Role` (
  `liam2_Role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_Role_name` varchar(45) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '1',
  PRIMARY KEY (`liam2_Role_id`),
  KEY `state_id_5f6bbe5e` (`state_id`),
  CONSTRAINT `state_id_5f6bbe5e` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9993 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam2_Role_LIAMUSER`
--

DROP TABLE IF EXISTS `liam2_Role_LIAMUSER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam2_Role_LIAMUSER` (
  `liam2_user_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_User_id_fk_134386` bigint(20) NOT NULL,
  `liam2_Role_id_fk_345654` bigint(20) NOT NULL,
  `state_id` bigint(20) DEFAULT '5',
  PRIMARY KEY (`liam2_user_role_id`),
  KEY `liam2_User_id_fk_134386` (`liam2_User_id_fk_134386`),
  KEY `liam2_Role_id_fk_345654` (`liam2_Role_id_fk_345654`),
  KEY `state_id_6f138251` (`state_id`),
  CONSTRAINT `liam2_Role_LIAMUSER_ibfk_1` FOREIGN KEY (`liam2_User_id_fk_134386`) REFERENCES `liam2_User` (`liam2_User_id`),
  CONSTRAINT `liam2_Role_LIAMUSER_ibfk_2` FOREIGN KEY (`liam2_Role_id_fk_345654`) REFERENCES `liam2_Role` (`liam2_Role_id`),
  CONSTRAINT `state_id_6f138251` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=765823 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam2_User`
--

DROP TABLE IF EXISTS `liam2_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam2_User` (
  `liam2_User_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_User_firstname` varchar(60) DEFAULT NULL,
  `liam2_User_lastname` varchar(60) DEFAULT NULL,
  `liam2_User_password` mediumtext,
  `liam2_User_salt` mediumtext,
  `state_id` bigint(20) DEFAULT '7',
  PRIMARY KEY (`liam2_User_id`),
  KEY `state_id_2418766e` (`state_id`),
  CONSTRAINT `state_id_2418766e` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1000000090 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam2_User_LoginAttempt`
--

DROP TABLE IF EXISTS `liam2_User_LoginAttempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam2_User_LoginAttempt` (
  `liam2_User_LoginAttempt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_User_id_fk_955788` bigint(20) NOT NULL,
  `liam2_LoginAttempts_id_fk_234561` bigint(20) NOT NULL,
  PRIMARY KEY (`liam2_User_LoginAttempt_id`),
  KEY `liam2_User_id_fk_955788` (`liam2_User_id_fk_955788`),
  KEY `liam2_LoginAttempts_id_fk_234561` (`liam2_LoginAttempts_id_fk_234561`),
  CONSTRAINT `liam2_User_LoginAttempt_ibfk_1` FOREIGN KEY (`liam2_User_id_fk_955788`) REFERENCES `liam2_User` (`liam2_User_id`),
  CONSTRAINT `liam2_User_LoginAttempt_ibfk_2` FOREIGN KEY (`liam2_LoginAttempts_id_fk_234561`) REFERENCES `liam2_LoginAttempts` (`liam2_LoginAttempts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam2_User_email`
--

DROP TABLE IF EXISTS `liam2_User_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam2_User_email` (
  `liam2_User_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_User_id_fk_164887` bigint(20) NOT NULL,
  `liam2_email_id_fk_396224` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '11',
  PRIMARY KEY (`liam2_User_email_id`),
  KEY `liam2_User_id_fk_164887` (`liam2_User_id_fk_164887`),
  KEY `liam2_email_id_fk_396224` (`liam2_email_id_fk_396224`),
  KEY `state_id_26897f94` (`state_id`),
  CONSTRAINT `liam2_User_email_ibfk_1` FOREIGN KEY (`liam2_User_id_fk_164887`) REFERENCES `liam2_User` (`liam2_User_id`),
  CONSTRAINT `liam2_User_email_ibfk_2` FOREIGN KEY (`liam2_email_id_fk_396224`) REFERENCES `liam2_email` (`liam2_email_id`),
  CONSTRAINT `state_id_26897f94` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=956803 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam2_email`
--

DROP TABLE IF EXISTS `liam2_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam2_email` (
  `liam2_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `liam2_email_text` varchar(254) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '13',
  PRIMARY KEY (`liam2_email_id`),
  KEY `state_id_8f478123` (`state_id`),
  CONSTRAINT `state_id_8f478123` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=899270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `form_data` longtext,
  `entrypoint` tinyint(1) NOT NULL DEFAULT '0',
  `statemachine_id` bigint(20) NOT NULL DEFAULT '1',
  `script_IN` longtext,
  `script_OUT` longtext,
  PRIMARY KEY (`state_id`),
  KEY `state_machine_id_fk` (`statemachine_id`),
  CONSTRAINT `state_machine_id_fk` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state_machines`
--

DROP TABLE IF EXISTS `state_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(45) DEFAULT NULL,
  `transition_script` longtext,
  `form_data_default` longtext,
  `form_data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state_rules`
--

DROP TABLE IF EXISTS `state_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_rules` (
  `state_rules_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_id_FROM` bigint(20) NOT NULL,
  `state_id_TO` bigint(20) NOT NULL,
  `transition_script` longtext,
  PRIMARY KEY (`state_rules_id`),
  KEY `state_id_fk1_idx` (`state_id_FROM`),
  KEY `state_id_fk_to_idx` (`state_id_TO`),
  CONSTRAINT `state_id_fk_from` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_to` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-21  7:31:15
