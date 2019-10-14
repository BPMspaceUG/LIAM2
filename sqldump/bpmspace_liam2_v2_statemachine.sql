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
-- Dumping routines for database 'bpmspace_liam2_v2'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_liam2_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_email`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.liam2_email_id, a.liam2_email_text, a.state_id, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_email_id LIKE \'%', filter ,'%\' OR a.liam2_email_text LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_email AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_liam2_LoginAttempts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_LoginAttempts`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.liam2_LoginAttempts_id, a.liam2_LoginAttempts_time, a.liam2_LoginAttempts_info';
  SET @joins =  '';
  SET @where = CONCAT(' WHERE (a.liam2_LoginAttempts_id LIKE \'%', filter ,'%\' OR a.liam2_LoginAttempts_time LIKE \'%', filter ,'%\' OR a.liam2_LoginAttempts_info LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_LoginAttempts AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_liam2_Role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_Role`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.liam2_Role_id, a.liam2_Role_name, a.state_id, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_Role_id LIKE \'%', filter ,'%\' OR a.liam2_Role_name LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_Role AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_liam2_Role_LIAMUSER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_Role_LIAMUSER`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.liam2_user_role_id, a.liam2_User_id_fk_134386, a.liam2_Role_id_fk_345654, a.state_id, a_____liam2_User_id_fk_134386.liam2_User_id, a_____liam2_User_id_fk_134386.liam2_User_firstname, a_____liam2_User_id_fk_134386.liam2_User_lastname, a_____liam2_Role_id_fk_345654.liam2_Role_id, a_____liam2_Role_id_fk_345654.liam2_Role_name, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN liam2_User AS a_____liam2_User_id_fk_134386 ON a.liam2_User_id_fk_134386 = a_____liam2_User_id_fk_134386.liam2_User_id LEFT JOIN liam2_Role AS a_____liam2_Role_id_fk_345654 ON a.liam2_Role_id_fk_345654 = a_____liam2_Role_id_fk_345654.liam2_Role_id LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_user_role_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_firstname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_lastname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_id_fk_134386 LIKE \'%', filter ,'%\' OR a_____liam2_Role_id_fk_345654.liam2_Role_id LIKE \'%', filter ,'%\' OR a_____liam2_Role_id_fk_345654.liam2_Role_name LIKE \'%', filter ,'%\' OR a.liam2_Role_id_fk_345654 LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_Role_LIAMUSER AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_liam2_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_User`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.liam2_User_id, a.liam2_User_firstname, a.liam2_User_lastname, a.liam2_User_password, a.liam2_User_salt, a.state_id, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_User_id LIKE \'%', filter ,'%\' OR a.liam2_User_firstname LIKE \'%', filter ,'%\' OR a.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_password LIKE \'%', filter ,'%\' OR a.liam2_User_salt LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_User AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_liam2_User_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_User_email`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.liam2_User_email_id, a.liam2_User_id_fk_164887, a.liam2_email_id_fk_396224, a.state_id, a_____liam2_User_id_fk_164887.liam2_User_id, a_____liam2_User_id_fk_164887.liam2_User_firstname, a_____liam2_User_id_fk_164887.liam2_User_lastname, a_____liam2_email_id_fk_396224.liam2_email_id, a_____liam2_email_id_fk_396224.liam2_email_text, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN liam2_User AS a_____liam2_User_id_fk_164887 ON a.liam2_User_id_fk_164887 = a_____liam2_User_id_fk_164887.liam2_User_id LEFT JOIN liam2_email AS a_____liam2_email_id_fk_396224 ON a.liam2_email_id_fk_396224 = a_____liam2_email_id_fk_396224.liam2_email_id LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_User_email_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_firstname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_lastname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_id_fk_164887 LIKE \'%', filter ,'%\' OR a_____liam2_email_id_fk_396224.liam2_email_id LIKE \'%', filter ,'%\' OR a_____liam2_email_id_fk_396224.liam2_email_text LIKE \'%', filter ,'%\' OR a.liam2_email_id_fk_396224 LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_User_email AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_liam2_User_LoginAttempt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_User_LoginAttempt`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.liam2_User_LoginAttempt_id, a.liam2_User_id_fk_955788, a.liam2_LoginAttempts_id_fk_234561, a_____liam2_User_id_fk_955788.liam2_User_id, a_____liam2_User_id_fk_955788.liam2_User_firstname, a_____liam2_User_id_fk_955788.liam2_User_lastname, a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_id, a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_time, a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_info';
  SET @joins =  ' LEFT JOIN liam2_User AS a_____liam2_User_id_fk_955788 ON a.liam2_User_id_fk_955788 = a_____liam2_User_id_fk_955788.liam2_User_id LEFT JOIN liam2_LoginAttempts AS a_____liam2_LoginAttempts_id_fk_234561 ON a.liam2_LoginAttempts_id_fk_234561 = a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_id';
  SET @where = CONCAT(' WHERE (a.liam2_User_LoginAttempt_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_firstname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_lastname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_id_fk_955788 LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_id LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_time LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_info LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_info LIKE \'%', filter ,'%\' OR a.liam2_LoginAttempts_id_fk_234561 LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_User_LoginAttempt AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.state_id, a.name, a.form_data, a.entrypoint, a.statemachine_id, a.script_IN, a.script_OUT, a_____statemachine_id.id, a_____statemachine_id.tablename';
  SET @joins =  ' LEFT JOIN state_machines AS a_____statemachine_id ON a.statemachine_id = a_____statemachine_id.id';
  SET @where = CONCAT(' WHERE (a.state_id LIKE \'%', filter ,'%\' OR a.name LIKE \'%', filter ,'%\' OR a.form_data LIKE \'%', filter ,'%\' OR a.entrypoint LIKE \'%', filter ,'%\' OR a_____statemachine_id.id LIKE \'%', filter ,'%\' OR a_____statemachine_id.tablename LIKE \'%', filter ,'%\' OR a_____statemachine_id.tablename LIKE \'%', filter ,'%\' OR a.statemachine_id LIKE \'%', filter ,'%\' OR a.script_IN LIKE \'%', filter ,'%\' OR a.script_OUT LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM state AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_machines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state_machines`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.id, a.tablename, a.transition_script, a.form_data_default, a.form_data';
  SET @joins =  '';
  SET @where = CONCAT(' WHERE (a.id LIKE \'%', filter ,'%\' OR a.tablename LIKE \'%', filter ,'%\' OR a.transition_script LIKE \'%', filter ,'%\' OR a.form_data_default LIKE \'%', filter ,'%\' OR a.form_data LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM state_machines AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_rules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state_rules`(IN token_uid INT, IN filter VARCHAR(256), IN whereParam VARCHAR(256), IN orderCol VARCHAR(100), IN ascDesc VARCHAR(4), IN LimitStart INT, IN LimitSize INT)
BEGIN
  SET @select = 'a.state_rules_id, a.state_id_FROM, a.state_id_TO, a.transition_script, a_____state_id_FROM.state_id, a_____state_id_FROM.name, a_____state_id_TO.state_id, a_____state_id_TO.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id_FROM ON a.state_id_FROM = a_____state_id_FROM.state_id LEFT JOIN state AS a_____state_id_TO ON a.state_id_TO = a_____state_id_TO.state_id';
  SET @where = CONCAT(' WHERE (a.state_rules_id LIKE \'%', filter ,'%\' OR a_____state_id_FROM.state_id LIKE \'%', filter ,'%\' OR a_____state_id_FROM.name LIKE \'%', filter ,'%\' OR a_____state_id_FROM.name LIKE \'%', filter ,'%\' OR a.state_id_FROM LIKE \'%', filter ,'%\' OR a_____state_id_TO.state_id LIKE \'%', filter ,'%\' OR a_____state_id_TO.name LIKE \'%', filter ,'%\' OR a_____state_id_TO.name LIKE \'%', filter ,'%\' OR a.state_id_TO LIKE \'%', filter ,'%\' OR a.transition_script LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM state_rules AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'new','',1,1,NULL,NULL),(2,'active','',0,1,NULL,NULL),(3,'update','',0,1,NULL,NULL),(4,'inactive','',0,1,NULL,NULL),(5,'selected','',1,2,NULL,NULL),(6,'unselected','',0,2,NULL,'// TODO (N:M)\r\n$seSt=5;\r\n$unSt=6;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_1st.\' = \'.$myID1\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);'),(7,'incomplete','',1,3,'$data = $param[\'row\'];\n\n// Successfully created the Mail\n$result = api(array(\n  \"cmd\" => \"create\",\n  \"paramJS\" => array(\n    \"table\" => \"liam2_User_email\",\n    \"row\" => [\n      \"liam2_User_id_fk_164887\" => $data[\'liam2_User_id\'],\n      \"liam2_email_id_fk_396224\" => $data[\'created_email_id\']]\n  )\n));\n\n$result = api(array(\n    \"cmd\" => \"create\",\n    \"paramJS\" => array(\n        \"table\" => \"liam2_Role_LIAMUSER\",\n        \"row\" => [\n            \"liam2_User_id_fk_134386\" => $data[\'liam2_User_id\'],\n            \"liam2_Role_id_fk_345654\" => 9992\n        ]\n    )\n));',''),(8,'complete','',0,3,'// [BasicScript]\n $data = var_export($param[\'row\'], true);\n \n $script_result = array(\n     \"allow_transition\" => true, // Has no influence @ IN-Script!\n     \"show_message\" => true,\n     \"message\" => \"IN Active reached\"\n );',''),(9,'update','<form>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_firstname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_lastname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Old password</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password_old\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">New password</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password_new\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Confirm new password</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password_new_confirm\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">has Roles</label>\n 	<div class=\"col-sm-9\">\n 		<div class=\"extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\"></div>\n 	</div>\n </div>\n \n   <script>\n     // Wait for element to exist.\n     function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n \n     (function(){\n       elLoaded(\'input[name=liam2_User_id]\', function(el) {\n         let PrimID = $(\'input[name=liam2_User_id]\').val();\n         let x = new Table(\'liam2_Role_LIAMUSER\', \'.extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\', 0, function(){\n           x.Columns[\'liam2_User_id_fk_134386\'].is_in_menu = false;\n           x.loadRows(function(){\n             x.renderHTML();\n           })\n         }, \'a.liam2_User_id_fk_134386 = \'+PrimID, {liam2_User_id_fk_134386: [PrimID, \'Already selected\']});\n       });\n     })();\n   </script><div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">has Login Attempts</label>\n 	<div class=\"col-sm-9\">\n 		<div class=\"extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\"></div>\n 	</div>\n </div>\n \n   <script>\n     // Wait for element to exist.\n     function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n \n     (function(){\n       elLoaded(\'input[name=liam2_User_id]\', function(el) {\n         let PrimID = $(\'input[name=liam2_User_id]\').val();\n         let x = new Table(\'liam2_User_LoginAttempt\', \'.extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\', 0, function(){\n           x.Columns[\'liam2_User_id_fk_955788\'].is_in_menu = false;\n           x.loadRows(function(){\n             x.renderHTML();\n           })\n         }, \'a.liam2_User_id_fk_955788 = \'+PrimID, {liam2_User_id_fk_955788: [PrimID, \'Already selected\']});\n       });\n     })();\n   </script></form>',0,3,'/*$data = $param[\'row\'];\n\n$allow = false;\n$msg = \'\';\n\nif (isset($data[\'liam2_client_passwd_reset\']) && $data[\'liam2_client_passwd_reset\']) {\n$to = $data[\'liam2_User_email\'];\n$subject = \"Password Reset\";\n$message = \"<a href=\'//\" . $_SERVER[\'SERVER_NAME\'] . \"LIAM2_Client_reset_password.php?token=\" . $data[\'jwt\'] . \"\'>Link</a>\";\nmail($to, $subject, $message);\n$allow = true;\n$msg = \'Password reset link sent to email.\';\n}\n\n$script_result = array(\n\"allow_transition\" => $allow,\n\"show_message\" => true,\n\"message\" => $msg\n);*/','// [Write hashed Password]\n$data = $param[\'row\'];\n$allow = true;\n$msg = \'Please fill all the fields\';\n$show_message = false;\n\n\nif (isset($data[\'liam2_client_passwd_reset_form\'])) {\n    $show_message = true;\n    if (!isset($data[\'liam2_User_password_new\']) || !isset($data[\'liam2_User_password_new_confirm\'])) {\n        $allow = false;\n    } else {\n        // Check if password is more than 10 characters\n        if (strlen($data[\'liam2_User_password_new\']) < 10) {\n            $msg = \'The password must have at least 10 characters.\';\n            $allow = false;\n        } else {\n            if ($data[\'liam2_User_password_new\'] !== $data[\'liam2_User_password_new_confirm\']) {\n                $msg = \'The new password and the confirmed password do not match\';\n                $allow = false;\n            } else {\n                $salt = bin2hex(openssl_random_pseudo_bytes(64));\n                $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password_new\'] . $salt);\n                $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n                $param[\'row\'][\'liam2_User_salt\'] = $salt;\n                $msg = \"Password changed succesfully\";\n            }\n        }\n    }\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => $show_message,\n    \"message\" => $msg\n);\n}'),(10,'inactive','<form>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_firstname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\" readonly>\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_lastname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\" readonly>\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_email</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_email\" value=\"\" readonly>\n 	</div>\n </div>\n </form>',0,3,'',''),(11,'use','',1,4,'$UserID = $param[\"row\"][\"liam2_User_id_fk_164887\"];\n\n$result = api([\n  \"cmd\" => \"makeTransition\",\n  \"paramJS\" => [\n    \"table\" => \"liam2_User\",\n    \"row\" => [\"liam2_User_id\" => $UserID, \"state_id\" => 8]\n  ]\n]);\n\nvar_dump($result);',''),(12,'do not use','',0,4,'','// (1:N)\r\n$seSt=11;\r\n$unSt=12;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_2nd.\' = \'.$myID2\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// Unselect all Transitions\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Set Row to unselected\r\n    api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n        \'table\' => $tablename,\r\n        \'row\' => [$primaryColname => $ID, \'state_id\' => $unSt]\r\n    ]]);\r\n}\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);'),(13,'not verified','',1,5,'',''),(14,'verified','',0,5,'','$data = $param[\'row\'];\n$allow = true;\n$msg = \'Email successfully deleted.\';\n$param[\'row\'][\'liam2_email_text\'] = hash(\'sha256\', $param[\'row\'][\'liam2_email_text\']);\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg\n);'),(16,'deleted','',0,5,'','');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `state_machines`
--

LOCK TABLES `state_machines` WRITE;
/*!40000 ALTER TABLE `state_machines` DISABLE KEYS */;
INSERT INTO `state_machines` VALUES (1,'liam2_Role',NULL,'<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Name</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_Role_name\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">has Users</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Roleliam2_Role_idliam2_Role_LIAMUSERliam2_Role_id_fk_345654\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_Role_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_Role_id]\').val();\n        let x = new Table(\'liam2_Role_LIAMUSER\', \'.extern_tableliam2_Roleliam2_Role_idliam2_Role_LIAMUSERliam2_Role_id_fk_345654\', 0, function(){\n          x.Columns[\'liam2_Role_id_fk_345654\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_Role_id_fk_345654 = \'+PrimID, {liam2_Role_id_fk_345654: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script></form>',NULL),(2,'liam2_Role_LIAMUSER','// TODO (N:M)\r\n$seSt=5;\r\n$unSt=6;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_1st.\' = \'.$myID1\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);','<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">User</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_User_liam2_User_id_fk_134386\"></div>\n<input type=\"hidden\" name=\"liam2_User_id_fk_134386\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_User\", \".tbl_fk_liam2_User_liam2_User_id_fk_134386\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_User_id_fk_134386]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_User_id_fk_134386]\").val(selRow);\n      else\n      $(\"input[name=liam2_User_id_fk_134386]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Role</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_Role_liam2_Role_id_fk_345654\"></div>\n<input type=\"hidden\" name=\"liam2_Role_id_fk_345654\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_Role\", \".tbl_fk_liam2_Role_liam2_Role_id_fk_345654\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_Role_id_fk_345654]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_Role_id_fk_345654]\").val(selRow);\n      else\n      $(\"input[name=liam2_Role_id_fk_345654]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n</form>',NULL),(3,'liam2_User','// [Hash Password]\n$param[\'row\'][\'liam2_User_firstname\'] = trim($param[\'row\'][\'liam2_User_firstname\']);\n$param[\'row\'][\'liam2_User_lastname\'] = trim($param[\'row\'][\'liam2_User_lastname\']);\n$data = $param[\'row\'];\n$allow = false;\n//$msg = \'Please enter all the fields\';\n$msg = \'\';\n\n// Check if required fields are not empty\nif ($data[\'liam2_User_firstname\'] && $data[\'liam2_User_lastname\'] && $data[\'liam2_User_password\']) {\n    // Check if password is more than 10 characters\n    if (strlen($data[\'liam2_User_password\']) < 10) {\n        $msg = \'The password must have at least 10 characters.\';\n    } else {\n        $allow = true;\n        $salt = bin2hex(openssl_random_pseudo_bytes(64));\n        $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password\'] . $salt);\n        $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n        $param[\'row\'][\'liam2_User_salt\'] = $salt;\n        $msg = \"OK\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_firstname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct First Name\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_lastname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct Last Name\";\n    }\n}\n\n// Create E-Mail\nif (isset($data[\'new_email\']) && $data[\'new_email\'] && $allow) {\n    $result = api(array(\n        \"cmd\" => \"create\",\n        \"paramJS\" => array(\n            \"table\" => \"liam2_email\",\n            \"row\" => [\n                \"liam2_email_text\" => $data[\'new_email\'],\n                \"only_verify_mail\" => true\n            ]\n        )\n    ));\n    $result = json_decode($result, true);\n    $allow = (count($result) == 2);\n    if ($allow) {\n        $param[\'row\'][\'created_email_id\'] = $result[1][\"element_id\"];\n    } else {\n        $msg = $result[0][\'message\'];\n    }\n} elseif (isset($data[\'liam2_User_email_id\']) && $data[\'liam2_User_email_id\'] && $allow) {\n    $param[\'row\'][\'created_email_id\'] = $data[\'liam2_User_email_id\'];\n} else {\n    $allow = false;\n    if (!$msg || $msg == \'OK\') $msg = \'Please enter all the fields\';\n}\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg\n);','<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Firstname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Lastname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Password</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Salt</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_salt\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">has Roles</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_User_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_User_id]\').val();\n        let x = new Table(\'liam2_Role_LIAMUSER\', \'.extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\', 0, function(){\n          x.Columns[\'liam2_User_id_fk_134386\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_User_id_fk_134386 = \'+PrimID, {liam2_User_id_fk_134386: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script><div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Login Attempts</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_User_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_User_id]\').val();\n        let x = new Table(\'liam2_User_LoginAttempt\', \'.extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\', 0, function(){\n          x.Columns[\'liam2_User_id_fk_955788\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_User_id_fk_955788 = \'+PrimID, {liam2_User_id_fk_955788: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script><div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">has E-Mails</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Userliam2_User_idliam2_User_emailliam2_User_id_fk_164887\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_User_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_User_id]\').val();\n        let x = new Table(\'liam2_User_email\', \'.extern_tableliam2_Userliam2_User_idliam2_User_emailliam2_User_id_fk_164887\', 0, function(){\n          x.Columns[\'liam2_User_id_fk_164887\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_User_id_fk_164887 = \'+PrimID, {liam2_User_id_fk_164887: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script></form>','<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Firstname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Lastname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Password</label>\n	<div class=\"col-sm-9\">\n		<input type=\"password\" class=\"form-control\" name=\"liam2_User_password\" minlength=\"10\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">E-Mail</label>\n	<div class=\"col-sm-9\">\n		<input type=\"email\" class=\"form-control\" name=\"new_email\" value=\"\">\n	</div>\n</div>\n</form>'),(4,'liam2_User_email','// (1:N)\r\n$seSt=11;\r\n$unSt=12;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_2nd.\' = \'.$myID2\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// Unselect all Transitions\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Set Row to unselected\r\n    api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n        \'table\' => $tablename,\r\n        \'row\' => [$primaryColname => $ID, \'state_id\' => $unSt]\r\n    ]]);\r\n}\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);','<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">User</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_User_liam2_User_id_fk_164887\"></div>\n<input type=\"hidden\" name=\"liam2_User_id_fk_164887\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_User\", \".tbl_fk_liam2_User_liam2_User_id_fk_164887\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_User_id_fk_164887]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_User_id_fk_164887]\").val(selRow);\n      else\n      $(\"input[name=liam2_User_id_fk_164887]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">E-Mail</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_email_liam2_email_id_fk_396224\"></div>\n<input type=\"hidden\" name=\"liam2_email_id_fk_396224\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_email\", \".tbl_fk_liam2_email_liam2_email_id_fk_396224\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_email_id_fk_396224]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_email_id_fk_396224]\").val(selRow);\n      else\n      $(\"input[name=liam2_email_id_fk_396224]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n</form>',''),(5,'liam2_email','// Validate Mail\n\n$msg = \'\';\n$allow = false;\n\n$email = $param[\'row\'][\'liam2_email_text\'];\nif (filter_var($email, FILTER_VALIDATE_EMAIL)) {\n  $allow = true;\n} else {\n  $msg = \'This Mail is incorrect!\';\n}\n\nif ($allow) {\n  // Check if it already exists in the table\n  $result = api(array(\n    \"cmd\" => \"read\",\n    \"paramJS\" => array(\n      \"table\" => \"liam2_email\",\n      \"where\" => \"liam2_email_text = \'$email\'\"\n     )\n  ));\n  $result = json_decode($result, true);\n  if (count($result) == 0) {\n    $msg = \"Email created.\";\n    $allow = true;\n  } else {\n    $msg = \"The Mail already exists!\";\n    $allow = false;\n  }\n}\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg\n);','<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Text</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_email_text\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">belongs to User</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_emailliam2_email_idliam2_User_emailliam2_email_id_fk_396224\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_email_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_email_id]\').val();\n        let x = new Table(\'liam2_User_email\', \'.extern_tableliam2_emailliam2_email_idliam2_User_emailliam2_email_id_fk_396224\', 0, function(){\n          x.Columns[\'liam2_email_id_fk_396224\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_email_id_fk_396224 = \'+PrimID, {liam2_email_id_fk_396224: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script></form>','');
/*!40000 ALTER TABLE `state_machines` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `state_rules`
--

LOCK TABLES `state_rules` WRITE;
/*!40000 ALTER TABLE `state_rules` DISABLE KEYS */;
INSERT INTO `state_rules` VALUES (1,1,1,NULL),(2,2,2,NULL),(3,3,3,NULL),(4,1,2,NULL),(5,2,3,NULL),(6,3,2,NULL),(7,2,4,NULL),(8,5,6,NULL),(9,6,5,NULL),(10,7,7,NULL),(11,8,8,NULL),(12,9,9,'// [Write hashed Password]\n$param[\'row\'][\'liam2_User_firstname\'] = trim($param[\'row\'][\'liam2_User_firstname\']);\n$param[\'row\'][\'liam2_User_lastname\'] = trim($param[\'row\'][\'liam2_User_lastname\']);\n$data = $param[\'row\'];\n$allow = true;\n$msg = \'Please fill all the fields\';\n$change_password = false;\n\n// Check if pwd and salt is not empty\n    if (!$data[\'liam2_User_firstname\'] || !$data[\'liam2_User_lastname\']) {\n        $allow = false;\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_firstname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct First Name\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_lastname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct Last Name\";\n    }\n    if ($allow) {\n        if (!isset($data[\'liam2_User_password_old\']) || !isset($data[\'liam2_User_password_new\']) || !isset($data[\'liam2_User_password_new_confirm\'])) {\n            $msg = \'OK\';\n        } elseif ($data[\'liam2_User_password_old\'] && $data[\'liam2_User_password_new\'] && $data[\'liam2_User_password_new_confirm\']) {\n            // Check if password is more than 10 characters\n            if (strlen($data[\'liam2_User_password_new\']) < 10) {\n                $allow = false;\n                $msg = \'The password must have at least 10 characters.\';\n            } else {\n                if ($data[\'liam2_User_password_new\'] !== $data[\'liam2_User_password_new_confirm\']) {\n                    $allow = false;\n                    $msg = \'The new password and the confirmed password do not match\';\n                } else {\n                    if (hash(\'sha512\', $data[\'liam2_User_password_old\'] . $data[\'liam2_User_salt\']) !== $data[\'liam2_User_password\']) {\n                        $allow = false;\n                        $msg = \'The old password is incorrect\';\n                    } else {\n                        $allow = true;\n                        $salt = bin2hex(openssl_random_pseudo_bytes(64));\n                        $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password_new\'] . $salt);\n                        $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n                        $param[\'row\'][\'liam2_User_salt\'] = $salt;\n                        $msg = \"OK\";\n                        $change_password = true;\n                    }\n                }\n            }\n        } else {\n            $msg = \"OK\";\n        }\n    }\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg,\n    \"change_password\" => $change_password\n);'),(13,7,8,NULL),(14,8,9,NULL),(15,9,8,'// [Write hashed Password]\n$param[\'row\'][\'liam2_User_firstname\'] = trim($param[\'row\'][\'liam2_User_firstname\']);\n$param[\'row\'][\'liam2_User_lastname\'] = trim($param[\'row\'][\'liam2_User_lastname\']);\n$data = $param[\'row\'];\n$allow = true;\n$msg = \'Please fill all the fields\';\n$change_password = false;\n\nif (!isset($data[\'liam2_client_passwd_reset_form\'])) {\n// Check if pwd and salt is not empty\n    if (!$data[\'liam2_User_firstname\'] || !$data[\'liam2_User_lastname\']) {\n        $allow = false;\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_firstname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct First Name\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_lastname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct Last Name\";\n    }\n    if ($allow) {\n        if (!isset($data[\'liam2_User_password_old\']) || !isset($data[\'liam2_User_password_new\']) || !isset($data[\'liam2_User_password_new_confirm\'])) {\n            $msg = \'OK\';\n        } elseif ($data[\'liam2_User_password_old\'] && $data[\'liam2_User_password_new\'] && $data[\'liam2_User_password_new_confirm\']) {\n            // Check if password is more than 10 characters\n            if (strlen($data[\'liam2_User_password_new\']) < 10) {\n                $allow = false;\n                $msg = \'The password must have at least 10 characters.\';\n            } else {\n                if ($data[\'liam2_User_password_new\'] !== $data[\'liam2_User_password_new_confirm\']) {\n                    $allow = false;\n                    $msg = \'The new password and the confirmed password do not match\';\n                } else {\n                    if (hash(\'sha512\', $data[\'liam2_User_password_old\'] . $data[\'liam2_User_salt\']) !== $data[\'liam2_User_password\']) {\n                        $allow = false;\n                        $msg = \'The old password is incorrect\';\n                    } else {\n                        $allow = true;\n                        $salt = bin2hex(openssl_random_pseudo_bytes(64));\n                        $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password_new\'] . $salt);\n                        $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n                        $param[\'row\'][\'liam2_User_salt\'] = $salt;\n                        $msg = \"OK\";\n                        $change_password = true;\n                    }\n                }\n            }\n        } else {\n            $msg = \"OK\";\n        }\n    }\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg,\n    \"change_password\" => $change_password\n);\n}'),(16,8,10,NULL),(17,11,12,NULL),(18,12,11,NULL),(19,13,13,NULL),(22,13,14,NULL),(25,14,16,NULL);
/*!40000 ALTER TABLE `state_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 11:13:21
