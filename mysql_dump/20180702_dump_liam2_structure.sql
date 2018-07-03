-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bpmspace_liam2_v1
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.7-MariaDB-1:10.3.7+maria~jessie-log

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

CREATE SCHEMA IF NOT EXISTS bpmspace_liam2_v1;
USE bpmspace_liam2_v1;

--
-- Table structure for table `liam_login_attempts`
--

DROP TABLE IF EXISTS `liam_login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam_login_attempts` (
  `liam_loginattempts_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam_loginattempts_time` varchar(30) NOT NULL,
  `liam_loginattempts_info` longtext NOT NULL,
  `liam_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`liam_loginattempts_id`),
  KEY `liam_user_idx` (`liam_user_id`),
  CONSTRAINT `liam_user` FOREIGN KEY (`liam_user_id`) REFERENCES `liam_user` (`liam_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam_role`
--

DROP TABLE IF EXISTS `liam_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam_role` (
  `liam_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam_role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`liam_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=785745 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam_user`
--

DROP TABLE IF EXISTS `liam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam_user` (
  `liam_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam_user_firstname` varchar(60) NOT NULL,
  `liam_user_lastname` varchar(60) NOT NULL,
  `liam_user_email` varchar(60) NOT NULL,
  `liam_user_password` longtext NOT NULL,
  `liam_user_salt` char(128) NOT NULL,
  PRIMARY KEY (`liam_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=656914 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liam_user_role`
--

DROP TABLE IF EXISTS `liam_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liam_user_role` (
  `liam_user_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam_role_id` bigint(20) NOT NULL,
  `liam_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`liam_user_role_id`),
  KEY `liam_user_id_fk_1_idx` (`liam_user_id`),
  KEY `roles_id_fk_1_idx` (`liam_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-02 12:46:54
