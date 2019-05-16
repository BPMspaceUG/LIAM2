CREATE DATABASE  IF NOT EXISTS `bpmspace_liam2_v2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bpmspace_liam2_v2`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bpmspace_liam2_v2
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.11-MariaDB-1:10.3.11+maria~jessie-log

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
-- Table structure for table `liam2_LoginAttempts`
--

DROP TABLE IF EXISTS `liam2_LoginAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `liam2_LoginAttempts` (
  `liam2_LoginAttempts_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_LoginAttempts_time` datetime DEFAULT NULL,
  `liam2_LoginAttempts_info` mediumtext DEFAULT NULL,
  PRIMARY KEY (`liam2_LoginAttempts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100262 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liam2_LoginAttempts`
--

LOCK TABLES `liam2_LoginAttempts` WRITE;
/*!40000 ALTER TABLE `liam2_LoginAttempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `liam2_LoginAttempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liam2_Role`
--

DROP TABLE IF EXISTS `liam2_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `liam2_Role` (
  `liam2_Role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `liam2_Role_name` varchar(45) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT 1,
  PRIMARY KEY (`liam2_Role_id`),
  KEY `state_id_5f6bbe5e` (`state_id`),
  CONSTRAINT `state_id_5f6bbe5e` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=343344 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liam2_Role`
--

LOCK TABLES `liam2_Role` WRITE;
/*!40000 ALTER TABLE `liam2_Role` DISABLE KEYS */;
INSERT INTO `liam2_Role` VALUES (9991,'Adminstrators',2),(9992,'Users',2);
