-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 172.28.1.100
-- Generation Time: Oct 14, 2019 at 08:50 AM
-- Server version: 10.1.40-MariaDB-1~bionic
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bpmspace_liam2_v2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_email` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.liam2_email_id, a.liam2_email_text, a.state_id, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_email_id LIKE \'%', filter ,'%\' OR a.liam2_email_text LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_email AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_LoginAttempts` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.liam2_LoginAttempts_id, a.liam2_LoginAttempts_time, a.liam2_LoginAttempts_info';
  SET @joins =  '';
  SET @where = CONCAT(' WHERE (a.liam2_LoginAttempts_id LIKE \'%', filter ,'%\' OR a.liam2_LoginAttempts_time LIKE \'%', filter ,'%\' OR a.liam2_LoginAttempts_info LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_LoginAttempts AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_Role` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.liam2_Role_id, a.liam2_Role_name, a.state_id, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_Role_id LIKE \'%', filter ,'%\' OR a.liam2_Role_name LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_Role AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_Role_LIAMUSER` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.liam2_user_role_id, a.liam2_User_id_fk_134386, a.liam2_Role_id_fk_345654, a.state_id, a_____liam2_User_id_fk_134386.liam2_User_id, a_____liam2_User_id_fk_134386.liam2_User_firstname, a_____liam2_User_id_fk_134386.liam2_User_lastname, a_____liam2_Role_id_fk_345654.liam2_Role_id, a_____liam2_Role_id_fk_345654.liam2_Role_name, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN liam2_User AS a_____liam2_User_id_fk_134386 ON a.liam2_User_id_fk_134386 = a_____liam2_User_id_fk_134386.liam2_User_id LEFT JOIN liam2_Role AS a_____liam2_Role_id_fk_345654 ON a.liam2_Role_id_fk_345654 = a_____liam2_Role_id_fk_345654.liam2_Role_id LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_user_role_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_firstname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_lastname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_134386.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_id_fk_134386 LIKE \'%', filter ,'%\' OR a_____liam2_Role_id_fk_345654.liam2_Role_id LIKE \'%', filter ,'%\' OR a_____liam2_Role_id_fk_345654.liam2_Role_name LIKE \'%', filter ,'%\' OR a.liam2_Role_id_fk_345654 LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_Role_LIAMUSER AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_User` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.liam2_User_id, a.liam2_User_firstname, a.liam2_User_lastname, a.liam2_User_password, a.liam2_User_salt, a.state_id, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_User_id LIKE \'%', filter ,'%\' OR a.liam2_User_firstname LIKE \'%', filter ,'%\' OR a.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_password LIKE \'%', filter ,'%\' OR a.liam2_User_salt LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_User AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_User_email` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.liam2_User_email_id, a.liam2_User_id_fk_164887, a.liam2_email_id_fk_396224, a.state_id, a_____liam2_User_id_fk_164887.liam2_User_id, a_____liam2_User_id_fk_164887.liam2_User_firstname, a_____liam2_User_id_fk_164887.liam2_User_lastname, a_____liam2_email_id_fk_396224.liam2_email_id, a_____liam2_email_id_fk_396224.liam2_email_text, a_____state_id.state_id, a_____state_id.name';
  SET @joins =  ' LEFT JOIN liam2_User AS a_____liam2_User_id_fk_164887 ON a.liam2_User_id_fk_164887 = a_____liam2_User_id_fk_164887.liam2_User_id LEFT JOIN liam2_email AS a_____liam2_email_id_fk_396224 ON a.liam2_email_id_fk_396224 = a_____liam2_email_id_fk_396224.liam2_email_id LEFT JOIN state AS a_____state_id ON a.state_id = a_____state_id.state_id';
  SET @where = CONCAT(' WHERE (a.liam2_User_email_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_firstname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_lastname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_164887.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_id_fk_164887 LIKE \'%', filter ,'%\' OR a_____liam2_email_id_fk_396224.liam2_email_id LIKE \'%', filter ,'%\' OR a_____liam2_email_id_fk_396224.liam2_email_text LIKE \'%', filter ,'%\' OR a.liam2_email_id_fk_396224 LIKE \'%', filter ,'%\' OR a_____state_id.state_id LIKE \'%', filter ,'%\' OR a_____state_id.name LIKE \'%', filter ,'%\' OR a.state_id LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_User_email AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_liam2_User_LoginAttempt` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.liam2_User_LoginAttempt_id, a.liam2_User_id_fk_955788, a.liam2_LoginAttempts_id_fk_234561, a_____liam2_User_id_fk_955788.liam2_User_id, a_____liam2_User_id_fk_955788.liam2_User_firstname, a_____liam2_User_id_fk_955788.liam2_User_lastname, a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_id, a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_time, a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_info';
  SET @joins =  ' LEFT JOIN liam2_User AS a_____liam2_User_id_fk_955788 ON a.liam2_User_id_fk_955788 = a_____liam2_User_id_fk_955788.liam2_User_id LEFT JOIN liam2_LoginAttempts AS a_____liam2_LoginAttempts_id_fk_234561 ON a.liam2_LoginAttempts_id_fk_234561 = a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_id';
  SET @where = CONCAT(' WHERE (a.liam2_User_LoginAttempt_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_id LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_firstname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_lastname LIKE \'%', filter ,'%\' OR a_____liam2_User_id_fk_955788.liam2_User_lastname LIKE \'%', filter ,'%\' OR a.liam2_User_id_fk_955788 LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_id LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_time LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_info LIKE \'%', filter ,'%\' OR a_____liam2_LoginAttempts_id_fk_234561.liam2_LoginAttempts_info LIKE \'%', filter ,'%\' OR a.liam2_LoginAttempts_id_fk_234561 LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM liam2_User_LoginAttempt AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.state_id, a.name, a.form_data, a.entrypoint, a.statemachine_id, a.script_IN, a.script_OUT, a_____statemachine_id.id, a_____statemachine_id.tablename';
  SET @joins =  ' LEFT JOIN state_machines AS a_____statemachine_id ON a.statemachine_id = a_____statemachine_id.id';
  SET @where = CONCAT(' WHERE (a.state_id LIKE \'%', filter ,'%\' OR a.name LIKE \'%', filter ,'%\' OR a.form_data LIKE \'%', filter ,'%\' OR a.entrypoint LIKE \'%', filter ,'%\' OR a_____statemachine_id.id LIKE \'%', filter ,'%\' OR a_____statemachine_id.tablename LIKE \'%', filter ,'%\' OR a_____statemachine_id.tablename LIKE \'%', filter ,'%\' OR a.statemachine_id LIKE \'%', filter ,'%\' OR a.script_IN LIKE \'%', filter ,'%\' OR a.script_OUT LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM state AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state_machines` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.id, a.tablename, a.transition_script, a.form_data_default, a.form_data';
  SET @joins =  '';
  SET @where = CONCAT(' WHERE (a.id LIKE \'%', filter ,'%\' OR a.tablename LIKE \'%', filter ,'%\' OR a.transition_script LIKE \'%', filter ,'%\' OR a.form_data_default LIKE \'%', filter ,'%\' OR a.form_data LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM state_machines AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state_rules` (IN `token_uid` INT, IN `filter` VARCHAR(256), IN `whereParam` VARCHAR(256), IN `orderCol` VARCHAR(100), IN `ascDesc` VARCHAR(4), IN `LimitStart` INT, IN `LimitSize` INT)  BEGIN
  SET @select = 'a.state_rules_id, a.state_id_FROM, a.state_id_TO, a.transition_script, a_____state_id_FROM.state_id, a_____state_id_FROM.name, a_____state_id_TO.state_id, a_____state_id_TO.name';
  SET @joins =  ' LEFT JOIN state AS a_____state_id_FROM ON a.state_id_FROM = a_____state_id_FROM.state_id LEFT JOIN state AS a_____state_id_TO ON a.state_id_TO = a_____state_id_TO.state_id';
  SET @where = CONCAT(' WHERE (a.state_rules_id LIKE \'%', filter ,'%\' OR a_____state_id_FROM.state_id LIKE \'%', filter ,'%\' OR a_____state_id_FROM.name LIKE \'%', filter ,'%\' OR a_____state_id_FROM.name LIKE \'%', filter ,'%\' OR a.state_id_FROM LIKE \'%', filter ,'%\' OR a_____state_id_TO.state_id LIKE \'%', filter ,'%\' OR a_____state_id_TO.name LIKE \'%', filter ,'%\' OR a_____state_id_TO.name LIKE \'%', filter ,'%\' OR a.state_id_TO LIKE \'%', filter ,'%\' OR a.transition_script LIKE \'%', filter ,'%\') ', COALESCE(CONCAT('AND ', NULLIF(whereParam, '')), ''));
  SET @order = IFNULL(CONCAT(' ORDER BY ', orderCol, ' ', ascDesc), '');
  SET @limit = IFNULL(CONCAT(' LIMIT ', LimitStart, CONCAT(', ', LimitSize)), '');

  SET @s = CONCAT('SELECT ', @select, ' FROM state_rules AS a', @joins, @where, @order, @limit);
  PREPARE stmt FROM @s;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `liam2_email`
--

CREATE TABLE `liam2_email` (
  `liam2_email_id` int(11) NOT NULL,
  `liam2_email_text` varchar(254) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '13'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `liam2_email`
--

INSERT INTO `liam2_email` (`liam2_email_id`, `liam2_email_text`, `state_id`) VALUES
(999, 'something@localhost', 13),
(899205, 'test2@localhost.com', 13),
(899206, 'test@localhost.com', 14),
(899207, 'bb@local.com', 14),
(899208, 'jues@verne.com', 13),
(899209, 'sdfs@qwww.bb', 13),
(899210, 'sdafds@fdgfdg.bb', 13),
(899211, 'dfg@dffdg.vv', 13),
(899212, 'sdfd@dfdf.bb', 13),
(899213, 'asdsad@sdfdf.vv', 13),
(899214, 'dfgfg@sdgffdg.bb', 13),
(899215, 'adsd@dfgfdg.vv', 13),
(899216, 'rr@m.b', 13),
(899217, 'xcxc@b.b', 13),
(899218, 'asd@m.n', 13),
(899219, 'asdasd@ddd.d', 13),
(899220, 'sdsd@vv.v', 13),
(899221, 'dsadsa@sddfsdf.vv', 13),
(899222, 'adasdas@asdsdf.bbbb', 13),
(899223, 'asdsad@sdfsdf.vv', 13),
(899224, 'q@q.q', 13),
(899225, 'dsfds@vv.vvv', 13),
(899226, 'sdfsdfds@bbb.b', 13),
(899227, 'asdsad@sfdsf.x', 13),
(899228, 'adasdsa@mmm.n', 13),
(899229, 'nbnb@mm.mm', 13),
(899230, 'test@rrr.bb', 13),
(899231, 'sfsfd@fdgdfg.bb', 13),
(899232, 'sfsdf@sdfsdf.bb', 13),
(899233, 'ewre@ssad.ll', 13),
(899234, 'test@localhost.com88', 13),
(899235, 'dfgfdgfdg@www.bb', 14),
(899236, 'dfhggfh@dsfdsfd.vv', 13),
(899237, 'i@p.b', 14),
(899238, 'sdfsdfsd@sddsf.ff', 13),
(899239, 'sdfsdf@sdfsdf.bbb', 13),
(899240, 'sdfsdf@sdfdsf.ddd', 13),
(899241, 'sjkdsd@sdkfhdsf.cvv', 13),
(899242, 'sjdhjdfhdsj@vv.vv', 13),
(899243, 'h', 13),
(899244, 'fhfghf@fghfgh.nn', 13),
(899245, 'll@kk.com', 14);

-- --------------------------------------------------------

--
-- Table structure for table `liam2_LoginAttempts`
--

CREATE TABLE `liam2_LoginAttempts` (
  `liam2_LoginAttempts_id` bigint(20) NOT NULL,
  `liam2_LoginAttempts_time` datetime DEFAULT NULL,
  `liam2_LoginAttempts_info` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `liam2_LoginAttempts`
--

INSERT INTO `liam2_LoginAttempts` (`liam2_LoginAttempts_id`, `liam2_LoginAttempts_time`, `liam2_LoginAttempts_info`) VALUES
(1, '2019-06-27 10:51:00', 'Not Successful - fsdfsd@sdfdsf.vv - Wrong password.'),
(2, '2019-06-27 10:52:00', 'Not Successful - qwe@qw - Wrong email'),
(3, '2019-06-27 10:52:00', 'Not Successful - qwe@qwe.qwe - Email is not verified'),
(4, '2019-06-27 10:53:00', 'Successful - qwe@qwe.qwe'),
(5, '2019-06-27 13:49:00', 'Not Successful - 	fsdfsd@sdfdsf.vv - Wrong email'),
(6, '2019-06-27 13:49:00', 'Not Successful - fsdfsd@sdfdsf.vv - Wrong password.'),
(7, '2019-06-27 13:49:00', 'Successful - qwe@qwe.qwe'),
(8, '2019-07-02 10:14:00', 'Not Successful - test@localhost - Wrong email'),
(9, '2019-07-02 10:15:00', 'Not Successful - something@localhost - Email is not verified'),
(10, '2019-07-02 10:43:00', 'Not Successful - test@localhost.com - Wrong Captcha.'),
(11, '2019-07-02 10:45:00', 'Not Successful - test@localhost.com2 - Email is not verified'),
(12, '2019-07-02 10:47:00', 'Not Successful - fsd - Wrong Captcha.'),
(13, '2019-07-02 10:47:00', 'Not Successful - test@localhost.com - Email is not verified'),
(14, '2019-07-02 10:48:00', 'Not Successful - test123@localhost.com - Wrong email'),
(15, '2019-07-02 10:49:00', 'Not Successful - test@localhost.com - Wrong password.'),
(16, '2019-07-02 10:52:00', 'Successful - test@localhost.com'),
(17, '2019-07-02 10:56:00', 'Successful - test@localhost.com'),
(18, '2019-07-02 12:02:00', 'Not Successful - test@localhost.com - The state of this user is not complete'),
(19, '2019-07-02 12:03:00', 'Not Successful - test@localhost.com - The state of this user is not complete'),
(20, '2019-07-02 12:03:00', 'Successful - test@localhost.com'),
(21, '2019-07-03 12:30:00', 'Not Successful - test@localhost.com - Wrong Captcha.'),
(22, '2019-07-03 12:31:00', 'Not Successful - test123@localhost.com - Wrong email'),
(23, '2019-07-03 12:31:00', 'Not Successful - test@localhost.com - Email is not verified'),
(24, '2019-07-03 12:31:00', 'Not Successful - test@localhost.com - Wrong password.'),
(25, '2019-07-03 12:32:00', 'Successful - test@localhost.com'),
(26, '2019-07-03 12:33:00', 'Successful - test@localhost.com'),
(27, '2019-07-17 12:43:00', 'Successful - test@localhost.com'),
(28, '2019-09-19 08:30:00', 'Successful - test@localhost.com'),
(29, '2019-10-07 06:58:00', 'Successful - test@localhost.com'),
(30, '2019-10-07 11:59:00', 'Successful - bb@local.com'),
(31, '2019-10-09 09:29:00', 'Successful - test@localhost.com'),
(32, '2019-10-09 12:12:00', 'Successful - test@localhost.com'),
(33, '2019-10-09 12:17:00', 'Successful - test@localhost.com'),
(34, '2019-10-09 12:24:00', 'Not Successful - test@localhost.com - The state of this user is not complete'),
(35, '2019-10-09 12:24:00', 'Successful - test@localhost.com'),
(36, '2019-10-09 12:30:00', 'Successful - test@localhost.com'),
(37, '2019-10-09 12:38:00', 'Not Successful - test@localhost.com - The state of this user is not complete'),
(38, '2019-10-09 12:38:00', 'Successful - test@localhost.com'),
(39, '2019-10-09 12:41:00', 'Successful - test@localhost.com'),
(40, '2019-10-09 12:44:00', 'Not Successful - ll@kk.com - Email is not verified'),
(41, '2019-10-09 12:44:00', 'Not Successful - ll@kk.com - The state of this user is not complete'),
(42, '2019-10-09 12:45:00', 'Successful - ll@kk.com'),
(43, '2019-10-09 12:53:00', 'Successful - ll@kk.com'),
(44, '2019-10-09 12:53:00', 'Successful - ll@kk.com'),
(45, '2019-10-10 08:49:00', 'Not Successful - test@localhost.com - The state of this user is not complete'),
(46, '2019-10-10 08:49:00', 'Not Successful - test@localhost.com - Wrong password.'),
(47, '2019-10-10 08:49:00', 'Not Successful - test@localhost.com - Wrong password.');

-- --------------------------------------------------------

--
-- Table structure for table `liam2_Role`
--

CREATE TABLE `liam2_Role` (
  `liam2_Role_id` bigint(20) NOT NULL,
  `liam2_Role_name` varchar(45) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `liam2_Role`
--

INSERT INTO `liam2_Role` (`liam2_Role_id`, `liam2_Role_name`, `state_id`) VALUES
(9991, 'Adminstrators', 2),
(9992, 'Users', 2);

-- --------------------------------------------------------

--
-- Table structure for table `liam2_Role_LIAMUSER`
--

CREATE TABLE `liam2_Role_LIAMUSER` (
  `liam2_user_role_id` bigint(20) NOT NULL,
  `liam2_User_id_fk_134386` bigint(20) NOT NULL,
  `liam2_Role_id_fk_345654` bigint(20) NOT NULL,
  `state_id` bigint(20) DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `liam2_Role_LIAMUSER`
--

INSERT INTO `liam2_Role_LIAMUSER` (`liam2_user_role_id`, `liam2_User_id_fk_134386`, `liam2_Role_id_fk_345654`, `state_id`) VALUES
(765765, 999999999, 9991, 5),
(765797, 1000000064, 9992, 5),
(765798, 1000000065, 9992, 5),
(765799, 1000000066, 9992, 5),
(765800, 1000000067, 9992, 5),
(765801, 1000000068, 9992, 5),
(765802, 1000000069, 9992, 5),
(765803, 1000000070, 9992, 5),
(765804, 1000000071, 9992, 5),
(765805, 1000000072, 9992, 5),
(765806, 1000000073, 9992, 5),
(765807, 1000000074, 9992, 5),
(765808, 1000000075, 9992, 5),
(765809, 1000000076, 9992, 5);

-- --------------------------------------------------------

--
-- Table structure for table `liam2_User`
--

CREATE TABLE `liam2_User` (
  `liam2_User_id` bigint(20) NOT NULL,
  `liam2_User_firstname` varchar(60) DEFAULT NULL,
  `liam2_User_lastname` varchar(60) DEFAULT NULL,
  `liam2_User_password` mediumtext,
  `liam2_User_salt` mediumtext,
  `state_id` bigint(20) DEFAULT '7'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `liam2_User`
--

INSERT INTO `liam2_User` (`liam2_User_id`, `liam2_User_firstname`, `liam2_User_lastname`, `liam2_User_password`, `liam2_User_salt`, `state_id`) VALUES
(999999999, 'admin', 'admin', '4A711A36ECD079CBC88A1654A9DFD73730C3B131EA1E14BF692A6F97517F445353838750074FC9CF92DE78CE21C65DFB7C8B57653AA7DB1A228077F7B6E088CD', '999999', 8),
(1000000064, 'Test', 'Test', 'd451d7d4544b21c96f5ab68371a0c9d7bc9e64ee815278a4ea558f22dec08c14b23e3ee49d2967a5e29be4e8f1f0705b6985a9acf5466ea1392a6cf9e531bad0', '047ca6d543bec8d7aa860f7d6215fd33f6b0300104f717604e4385f58276edb688c09ae4d6f93e668467dac794f13eced3e7c8d62fe079047662acd9bb397b9a', 9),
(1000000065, 'asdg', 'qwe55', 'e6d3e547dd1e558f602edb5bbab895890fd8f305332dc1508017503052dea2a859dcf12509d54603dc093ca432de5edc097408a4d80390395c4bdd34e9083774', '36f434ccfd2b52743048019ae59ad9c4bc53b22610545168b341bf957b613f13d453ac029caa8b21dd1365d50549f5589bd66dbcc2dc07ed2f3ac4d59fd257b9', 9),
(1000000066, 'Julesdd3', 'Verneo', '0548b03bd99989e826157ce2cc0c9a603eaf9bb8ed575a30548cec89c86f7bf70b6ae65b7b85ffb264125219f111da4127bb353900faca8e828f6064fe695193', '5ae99596e1b2893e50d213e9f4751e91c18aeb39ffd25433b86c1c75a32b5eb09654c1a276bc13c7ad1385bac9a370f083c6d7be79b62de1adba855cd323d006', 9),
(1000000067, 'sdfsdfsdfsdf', 'dd33', 'a076babde2dd46342fa180c0a3b9878c90c3d7d1d00615d966157281e61b83f62f415163a7f2701c8d724d54561886fb997cb56e02c73fc273b5940856475e90', '062718f556ba7ce2cea0b101221f21bbe18251daf251ca7b7ba0823cfd15c7ad0a5ea27d9fb2a75acd170c6843b724c352237597d8c698a2d50e67c65f8bc2c3', 8),
(1000000068, 'asdßdd', 'dfsgf7', 'a', '3b25209eff527ff752b2896576cb91f395d5e608498ffd4c5e1a5b7d51b64487b1ec306a78b8c84d504b0cdce5ab00471bd1ebd738cf0bff5f9c03263b2c2ded', 9),
(1000000069, 'adasdsad ', 'sfsdfsd', 'f02acdae9c2a20911f7b269981ba0656981faf23c03c54cc143755177176f7596293c1fbb521b3c30094e4c8edae710bb1988481832453ef06961708b0d0a9d7', '118d62869adada12538740d36dd4d1c28aa38ce06527a24d35ecf55f57082c2d5e2d52041a78e79af6db4e003504cddb3831104326679ebb39973c7ed76db4ad', 8),
(1000000070, 'asd09', 'qwe', '5ec044a6b39ee00ad938ee37ecd3d15316cb594c5898824ca7c1e3a9b6e429b53d19f305091ed2d6683dd6b9b3b39daf8ee70c73753aa147f9a09913fb5dd746', '4a4d974b6d253131a898869b4d28d1f8978fd2e74f3589158483689ab11d05fa0125fd170f6565c10999a47d4dc9f4c4eb08d09aef1f5fdd5ec3c64e94e477e6', 9),
(1000000071, ' asd', 'qwe 2', 'fccbf0dace230f67fce3aca0c687299ff397a768afe2da48972224c13b5641b7ebbece8ca34ceca083a68999fde1c8c1847fe2b0df28a72cec872caedb75f89d', '8206285f3b2aecfb1035a4d36e529bee6bf93e73b0003befbe0d6df404d5c5e414563ee92946578ac43d106bf113bf4b87727938d2310dc61a43a17619299856', 9),
(1000000072, 'asd', NULL, 'e1e581bef1cf546255c7445ea2a64d422a0242637ac1533ce64252f09d8296dda5bc70ad3359b57d57a11c494a173a860df2ca3810b974591e9a6b4d63d7f8ce', 'ff8f512ef57529a385f4e257ea1ed3c7556e17296d44715f234298d365a500f9d6a086789cc778d3a85c8aebb375cdd527fce5a00f9320e735492e56e08176f4', 8),
(1000000073, NULL, 'dfsd', '89255924679a207b41e6c5106df8b2e91b040efa8643fab3bfefffdb66cb4de6729cd3125f71f357ca55b1ca3bbe92cfc1283a3acbf19f598826f98cbf51ab35', 'a4329a50047c16f38a7707dc82efd309be6c06a3a69a9a2c8e07deb32a96bf006b5541d4ba3213879acb193acc0ccdede459e27e1738490dd675f4213d0bbb6f', 9),
(1000000074, 'p', 'sfsdfsdfdssdf', 'c45a044aa1fbcf8fae398c34ed1ffba421dbe35ac27a71387626f19916c6e7d69bf8595626b0b53ccd9c0dee198347220f326d294dc69f93d70d5f2c6814f4f2', 'd59ae76adc890724cc350cefb32702a36692fb124a1ac1d9e21553ca40159693ed7d020a270d5249992fe34f96916c09c219f97894dd32780fcfafec86189a28', 8),
(1000000075, 'bobj', 'asd', 'b5c1a1b6fea82af9f68ac4f671b341562cf60e5ad0243745298210ff32ce28f29108d0864a1c91d0ab0713748727004ffa5430fd4df039a1bf663b02f9aec688', '5423b3245c9139fa27197c71dc72d6f8bfd1bdd0eee9ec4125104d345e339a5ba8625975d05d380fdfef7dcfad75e2f2d7bb66c9a3f70e02d05e6c8d86eaabea', 8),
(1000000076, 'll', 'kk', 'ab5413d1f7917c23e7aac9f868fde56fda37c334685477603b6df3cfcb7bd4a811278003f10b2fc45f1e2a934b345e46b40556b38f37a1c24a798b2fa3f2c83a', 'c689707aa4dac5cd49b79df94b00a988e1307e38958bcd6b5fffee43e48d1c15923c7507389704267d12dcf9132749d4b0070d20d2427f1f9a14810292f45958', 8);

-- --------------------------------------------------------

--
-- Table structure for table `liam2_User_email`
--

CREATE TABLE `liam2_User_email` (
  `liam2_User_email_id` bigint(20) NOT NULL,
  `liam2_User_id_fk_164887` bigint(20) NOT NULL,
  `liam2_email_id_fk_396224` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '11'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `liam2_User_email`
--

INSERT INTO `liam2_User_email` (`liam2_User_email_id`, `liam2_User_id_fk_164887`, `liam2_email_id_fk_396224`, `state_id`) VALUES
(956757, 999999999, 999, 11),
(956774, 1000000064, 899206, 11),
(956775, 1000000065, 899207, 11),
(956776, 1000000066, 899208, 11),
(956777, 1000000067, 899235, 11),
(956778, 1000000068, 899237, 11),
(956779, 1000000069, 899238, 11),
(956780, 1000000070, 899239, 11),
(956781, 1000000071, 899240, 11),
(956782, 1000000072, 899241, 11),
(956783, 1000000073, 899242, 11),
(956784, 1000000074, 899243, 11),
(956785, 1000000075, 899244, 11),
(956786, 1000000076, 899245, 11);

-- --------------------------------------------------------

--
-- Table structure for table `liam2_User_LoginAttempt`
--

CREATE TABLE `liam2_User_LoginAttempt` (
  `liam2_User_LoginAttempt_id` bigint(20) NOT NULL,
  `liam2_User_id_fk_955788` bigint(20) NOT NULL,
  `liam2_LoginAttempts_id_fk_234561` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `form_data` longtext,
  `entrypoint` tinyint(1) NOT NULL DEFAULT '0',
  `statemachine_id` bigint(20) NOT NULL DEFAULT '1',
  `script_IN` longtext,
  `script_OUT` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `name`, `form_data`, `entrypoint`, `statemachine_id`, `script_IN`, `script_OUT`) VALUES
(1, 'new', '', 1, 1, NULL, NULL),
(2, 'active', '', 0, 1, NULL, NULL),
(3, 'update', '', 0, 1, NULL, NULL),
(4, 'inactive', '', 0, 1, NULL, NULL),
(5, 'selected', '', 1, 2, NULL, NULL),
(6, 'unselected', '', 0, 2, NULL, '// TODO (N:M)\r\n$seSt=5;\r\n$unSt=6;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_1st.\' = \'.$myID1\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);'),
(7, 'incomplete', '', 1, 3, '$data = $param[\'row\'];\n\n// Successfully created the Mail\n$result = api(array(\n  \"cmd\" => \"create\",\n  \"paramJS\" => array(\n    \"table\" => \"liam2_User_email\",\n    \"row\" => [\n      \"liam2_User_id_fk_164887\" => $data[\'liam2_User_id\'],\n      \"liam2_email_id_fk_396224\" => $data[\'created_email_id\']]\n  )\n));\n\n$result = api(array(\n    \"cmd\" => \"create\",\n    \"paramJS\" => array(\n        \"table\" => \"liam2_Role_LIAMUSER\",\n        \"row\" => [\n            \"liam2_User_id_fk_134386\" => $data[\'liam2_User_id\'],\n            \"liam2_Role_id_fk_345654\" => 9992\n        ]\n    )\n));', ''),
(8, 'complete', '', 0, 3, '// [BasicScript]\n $data = var_export($param[\'row\'], true);\n \n $script_result = array(\n     \"allow_transition\" => true, // Has no influence @ IN-Script!\n     \"show_message\" => true,\n     \"message\" => \"IN Active reached\"\n );', ''),
(9, 'update', '<form>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_firstname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_lastname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Old password</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password_old\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">New password</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password_new\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Confirm new password</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password_new_confirm\" value=\"\">\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">has Roles</label>\n 	<div class=\"col-sm-9\">\n 		<div class=\"extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\"></div>\n 	</div>\n </div>\n \n   <script>\n     // Wait for element to exist.\n     function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n \n     (function(){\n       elLoaded(\'input[name=liam2_User_id]\', function(el) {\n         let PrimID = $(\'input[name=liam2_User_id]\').val();\n         let x = new Table(\'liam2_Role_LIAMUSER\', \'.extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\', 0, function(){\n           x.Columns[\'liam2_User_id_fk_134386\'].is_in_menu = false;\n           x.loadRows(function(){\n             x.renderHTML();\n           })\n         }, \'a.liam2_User_id_fk_134386 = \'+PrimID, {liam2_User_id_fk_134386: [PrimID, \'Already selected\']});\n       });\n     })();\n   </script><div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">has Login Attempts</label>\n 	<div class=\"col-sm-9\">\n 		<div class=\"extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\"></div>\n 	</div>\n </div>\n \n   <script>\n     // Wait for element to exist.\n     function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n \n     (function(){\n       elLoaded(\'input[name=liam2_User_id]\', function(el) {\n         let PrimID = $(\'input[name=liam2_User_id]\').val();\n         let x = new Table(\'liam2_User_LoginAttempt\', \'.extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\', 0, function(){\n           x.Columns[\'liam2_User_id_fk_955788\'].is_in_menu = false;\n           x.loadRows(function(){\n             x.renderHTML();\n           })\n         }, \'a.liam2_User_id_fk_955788 = \'+PrimID, {liam2_User_id_fk_955788: [PrimID, \'Already selected\']});\n       });\n     })();\n   </script></form>', 0, 3, '/*$data = $param[\'row\'];\n\n$allow = false;\n$msg = \'\';\n\nif (isset($data[\'liam2_client_passwd_reset\']) && $data[\'liam2_client_passwd_reset\']) {\n$to = $data[\'liam2_User_email\'];\n$subject = \"Password Reset\";\n$message = \"<a href=\'//\" . $_SERVER[\'SERVER_NAME\'] . \"LIAM2_Client_reset_password.php?token=\" . $data[\'jwt\'] . \"\'>Link</a>\";\nmail($to, $subject, $message);\n$allow = true;\n$msg = \'Password reset link sent to email.\';\n}\n\n$script_result = array(\n\"allow_transition\" => $allow,\n\"show_message\" => true,\n\"message\" => $msg\n);*/', '// [Write hashed Password]\n$data = $param[\'row\'];\n$allow = true;\n$msg = \'Please fill all the fields\';\n$show_message = false;\n\n\nif (isset($data[\'liam2_client_passwd_reset_form\'])) {\n    $show_message = true;\n    if (!isset($data[\'liam2_User_password_new\']) || !isset($data[\'liam2_User_password_new_confirm\'])) {\n        $allow = false;\n    } else {\n        // Check if password is more than 10 characters\n        if (strlen($data[\'liam2_User_password_new\']) < 10) {\n            $msg = \'The password must have at least 10 characters.\';\n            $allow = false;\n        } else {\n            if ($data[\'liam2_User_password_new\'] !== $data[\'liam2_User_password_new_confirm\']) {\n                $msg = \'The new password and the confirmed password do not match\';\n                $allow = false;\n            } else {\n                $salt = bin2hex(openssl_random_pseudo_bytes(64));\n                $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password_new\'] . $salt);\n                $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n                $param[\'row\'][\'liam2_User_salt\'] = $salt;\n                $msg = \"Password changed succesfully\";\n            }\n        }\n    }\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => $show_message,\n    \"message\" => $msg\n);\n}'),
(10, 'inactive', '<form>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_firstname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\" readonly>\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_lastname</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\" readonly>\n 	</div>\n </div>\n <div class=\"form-group row\">\n 	<label class=\"col-sm-3 col-form-label\">Liam2_User_email</label>\n 	<div class=\"col-sm-9\">\n 		<input type=\"text\" class=\"form-control\" name=\"liam2_User_email\" value=\"\" readonly>\n 	</div>\n </div>\n </form>', 0, 3, '', ''),
(11, 'use', '', 1, 4, '$UserID = $param[\"row\"][\"liam2_User_id_fk_164887\"];\n\n$result = api([\n  \"cmd\" => \"makeTransition\",\n  \"paramJS\" => [\n    \"table\" => \"liam2_User\",\n    \"row\" => [\"liam2_User_id\" => $UserID, \"state_id\" => 8]\n  ]\n]);\n\nvar_dump($result);', ''),
(12, 'do not use', '', 0, 4, '', '// (1:N)\r\n$seSt=11;\r\n$unSt=12;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_2nd.\' = \'.$myID2\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// Unselect all Transitions\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Set Row to unselected\r\n    api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n        \'table\' => $tablename,\r\n        \'row\' => [$primaryColname => $ID, \'state_id\' => $unSt]\r\n    ]]);\r\n}\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);'),
(13, 'not verified', '', 1, 5, '', ''),
(14, 'verified', '', 0, 5, '', '$data = $param[\'row\'];\n$allow = true;\n$msg = \'Email successfully deleted.\';\n$param[\'row\'][\'liam2_email_text\'] = hash(\'sha256\', $param[\'row\'][\'liam2_email_text\']);\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg\n);'),
(16, 'deleted', '', 0, 5, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `state_machines`
--

CREATE TABLE `state_machines` (
  `id` bigint(20) NOT NULL,
  `tablename` varchar(45) DEFAULT NULL,
  `transition_script` longtext,
  `form_data_default` longtext,
  `form_data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_machines`
--

INSERT INTO `state_machines` (`id`, `tablename`, `transition_script`, `form_data_default`, `form_data`) VALUES
(1, 'liam2_Role', NULL, '<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Name</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_Role_name\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">has Users</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Roleliam2_Role_idliam2_Role_LIAMUSERliam2_Role_id_fk_345654\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_Role_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_Role_id]\').val();\n        let x = new Table(\'liam2_Role_LIAMUSER\', \'.extern_tableliam2_Roleliam2_Role_idliam2_Role_LIAMUSERliam2_Role_id_fk_345654\', 0, function(){\n          x.Columns[\'liam2_Role_id_fk_345654\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_Role_id_fk_345654 = \'+PrimID, {liam2_Role_id_fk_345654: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script></form>', NULL),
(2, 'liam2_Role_LIAMUSER', '// TODO (N:M)\r\n$seSt=5;\r\n$unSt=6;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_1st.\' = \'.$myID1\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);', '<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">User</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_User_liam2_User_id_fk_134386\"></div>\n<input type=\"hidden\" name=\"liam2_User_id_fk_134386\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_User\", \".tbl_fk_liam2_User_liam2_User_id_fk_134386\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_User_id_fk_134386]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_User_id_fk_134386]\").val(selRow);\n      else\n      $(\"input[name=liam2_User_id_fk_134386]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Role</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_Role_liam2_Role_id_fk_345654\"></div>\n<input type=\"hidden\" name=\"liam2_Role_id_fk_345654\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_Role\", \".tbl_fk_liam2_Role_liam2_Role_id_fk_345654\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_Role_id_fk_345654]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_Role_id_fk_345654]\").val(selRow);\n      else\n      $(\"input[name=liam2_Role_id_fk_345654]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n</form>', NULL),
(3, 'liam2_User', '// [Hash Password]\n$param[\'row\'][\'liam2_User_firstname\'] = trim($param[\'row\'][\'liam2_User_firstname\']);\n$param[\'row\'][\'liam2_User_lastname\'] = trim($param[\'row\'][\'liam2_User_lastname\']);\n$data = $param[\'row\'];\n$allow = false;\n//$msg = \'Please enter all the fields\';\n$msg = \'\';\n\n// Check if required fields are not empty\nif ($data[\'liam2_User_firstname\'] && $data[\'liam2_User_lastname\'] && $data[\'liam2_User_password\']) {\n    // Check if password is more than 10 characters\n    if (strlen($data[\'liam2_User_password\']) < 10) {\n        $msg = \'The password must have at least 10 characters.\';\n    } else {\n        $allow = true;\n        $salt = bin2hex(openssl_random_pseudo_bytes(64));\n        $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password\'] . $salt);\n        $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n        $param[\'row\'][\'liam2_User_salt\'] = $salt;\n        $msg = \"OK\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_firstname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct First Name\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_lastname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct Last Name\";\n    }\n}\n\n// Create E-Mail\nif (isset($data[\'new_email\']) && $data[\'new_email\'] && $allow) {\n    $result = api(array(\n        \"cmd\" => \"create\",\n        \"paramJS\" => array(\n            \"table\" => \"liam2_email\",\n            \"row\" => [\n                \"liam2_email_text\" => $data[\'new_email\'],\n                \"only_verify_mail\" => true\n            ]\n        )\n    ));\n    $result = json_decode($result, true);\n    $allow = (count($result) == 2);\n    if ($allow) {\n        $param[\'row\'][\'created_email_id\'] = $result[1][\"element_id\"];\n    } else {\n        $msg = $result[0][\'message\'];\n    }\n} elseif (isset($data[\'liam2_User_email_id\']) && $data[\'liam2_User_email_id\'] && $allow) {\n    $param[\'row\'][\'created_email_id\'] = $data[\'liam2_User_email_id\'];\n} else {\n    $allow = false;\n    if (!$msg || $msg == \'OK\') $msg = \'Please enter all the fields\';\n}\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg\n);', '<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Firstname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Lastname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Password</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_password\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Salt</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_salt\" value=\"\" disabled>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">has Roles</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_User_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_User_id]\').val();\n        let x = new Table(\'liam2_Role_LIAMUSER\', \'.extern_tableliam2_Userliam2_User_idliam2_Role_LIAMUSERliam2_User_id_fk_134386\', 0, function(){\n          x.Columns[\'liam2_User_id_fk_134386\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_User_id_fk_134386 = \'+PrimID, {liam2_User_id_fk_134386: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script><div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Login Attempts</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_User_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_User_id]\').val();\n        let x = new Table(\'liam2_User_LoginAttempt\', \'.extern_tableliam2_Userliam2_User_idliam2_User_LoginAttemptliam2_User_id_fk_955788\', 0, function(){\n          x.Columns[\'liam2_User_id_fk_955788\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_User_id_fk_955788 = \'+PrimID, {liam2_User_id_fk_955788: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script><div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">has E-Mails</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_Userliam2_User_idliam2_User_emailliam2_User_id_fk_164887\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_User_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_User_id]\').val();\n        let x = new Table(\'liam2_User_email\', \'.extern_tableliam2_Userliam2_User_idliam2_User_emailliam2_User_id_fk_164887\', 0, function(){\n          x.Columns[\'liam2_User_id_fk_164887\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_User_id_fk_164887 = \'+PrimID, {liam2_User_id_fk_164887: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script></form>', '<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Firstname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_firstname\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Lastname</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_User_lastname\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Password</label>\n	<div class=\"col-sm-9\">\n		<input type=\"password\" class=\"form-control\" name=\"liam2_User_password\" minlength=\"10\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">E-Mail</label>\n	<div class=\"col-sm-9\">\n		<input type=\"email\" class=\"form-control\" name=\"new_email\" value=\"\">\n	</div>\n</div>\n</form>'),
(4, 'liam2_User_email', '// (1:N)\r\n$seSt=11;\r\n$unSt=12;\r\n\r\n$data = $param[\'row\'];\r\n$fks = [];\r\n$allow = true;\r\n$isCreateScript = false;\r\n$keys = array_keys($data);\r\n$primaryColname = Config::getPrimaryColNameByTablename($tablename);\r\n// Collect all FKs\r\nforeach ($keys as $col) {\r\n    if (Config::hasColumnFK($tablename, $col))\r\n        $fks[] = $col;\r\n}\r\n$fkcol_1st = $fks[0];\r\n$fkcol_2nd = $fks[1];\r\n$myID1 = $data[$fkcol_1st];\r\n$myID2 = $data[$fkcol_2nd];\r\n\r\n// Read all Rows\r\n$allRows = api([\'cmd\' => \'read\', \'paramJS\' => [\r\n    \'table\' => $tablename,\r\n    \'where\' => \'a.\'.$fkcol_2nd.\' = \'.$myID2\r\n]]);\r\n// Check if this is a create-script => Primary Column does not exist in row\r\nif (!in_array($primaryColname, $keys))\r\n    $isCreateScript = true;\r\n    \r\n$json = json_decode($allRows, true);\r\n\r\n// Unselect all Transitions\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Set Row to unselected\r\n    api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n        \'table\' => $tablename,\r\n        \'row\' => [$primaryColname => $ID, \'state_id\' => $unSt]\r\n    ]]);\r\n}\r\n// If already exists -> set to selected\r\nforeach ($json as $row) {\r\n    $ID = $row[$primaryColname];\r\n    // Get keys of the foreign keys\r\n    $k1 = array_keys($row[$fkcol_1st])[0];\r\n    $k2 = array_keys($row[$fkcol_2nd])[0];\r\n    // Check if already exists\r\n    if ($isCreateScript && $row[$fkcol_1st][$k1] == $myID1 && $row[$fkcol_2nd][$k2] == $myID2) {\r\n        // Set Row to selected\r\n        api([\'cmd\' => \'makeTransition\', \'paramJS\' => [\r\n            \'table\' => $tablename,\r\n            \'row\' => [$primaryColname => $ID, \'state_id\' => $seSt]\r\n        ]]);\r\n        $allow = false;\r\n        break;\r\n    }\r\n}\r\n$script_result = array(\r\n    \"allow_transition\" => $allow,\r\n    \"show_message\" => false,\r\n    \"message\" => \"RelationActivationCompleteCloseTheModal\"\r\n);', '<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">User</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_User_liam2_User_id_fk_164887\"></div>\n<input type=\"hidden\" name=\"liam2_User_id_fk_164887\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_User\", \".tbl_fk_liam2_User_liam2_User_id_fk_164887\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_User_id_fk_164887]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_User_id_fk_164887]\").val(selRow);\n      else\n      $(\"input[name=liam2_User_id_fk_164887]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">E-Mail</label>\n	<div class=\"col-sm-9\">\n		<div class=\"tbl_fk_liam2_email_liam2_email_id_fk_396224\"></div>\n<input type=\"hidden\" name=\"liam2_email_id_fk_396224\" value=\"\" class=\"inputFK\"/>\n<script>\n  // Wait for element to exist.\n  function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n  (function(){\n    let x = new Table(\"liam2_email\", \".tbl_fk_liam2_email_liam2_email_id_fk_396224\", 1, function(){\n      x.loadRows(function(){\n        const selRow = $(\"input[name=liam2_email_id_fk_396224]\").val();\n        x.setSelectedRows([selRow]);\n        x.renderHTML();\n      });\n    });\n    x.SelectionHasChanged.on(function(){\n      const selRow = x.getSelectedRows()[0];\n      if (selRow)\n        $(\"input[name=liam2_email_id_fk_396224]\").val(selRow);\n      else\n      $(\"input[name=liam2_email_id_fk_396224]\").val(\"\");\n    })\n  })();\n</script>\n	</div>\n</div>\n</form>', ''),
(5, 'liam2_email', '// Validate Mail\n\n$msg = \'\';\n$allow = false;\n\n$email = $param[\'row\'][\'liam2_email_text\'];\nif (filter_var($email, FILTER_VALIDATE_EMAIL)) {\n  $allow = true;\n} else {\n  $msg = \'This Mail is incorrect!\';\n}\n\nif ($allow) {\n  // Check if it already exists in the table\n  $result = api(array(\n    \"cmd\" => \"read\",\n    \"paramJS\" => array(\n      \"table\" => \"liam2_email\",\n      \"where\" => \"liam2_email_text = \'$email\'\"\n     )\n  ));\n  $result = json_decode($result, true);\n  if (count($result) == 0) {\n    $msg = \"Email created.\";\n    $allow = true;\n  } else {\n    $msg = \"The Mail already exists!\";\n    $allow = false;\n  }\n}\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg\n);', '<form>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">Text</label>\n	<div class=\"col-sm-9\">\n		<input type=\"text\" class=\"form-control\" name=\"liam2_email_text\" value=\"\">\n	</div>\n</div>\n<div class=\"form-group row\">\n	<label class=\"col-sm-3 col-form-label\">belongs to User</label>\n	<div class=\"col-sm-9\">\n		<div class=\"extern_tableliam2_emailliam2_email_idliam2_User_emailliam2_email_id_fk_396224\"></div>\n	</div>\n</div>\n\n  <script>\n    // Wait for element to exist.\n    function elLoaded(el, cb) {if ($(el).length) {cb($(el));} else {setTimeout(function(){ elLoaded(el, cb) }, 100);}};\n\n    (function(){\n      elLoaded(\'input[name=liam2_email_id]\', function(el) {\n        let PrimID = $(\'input[name=liam2_email_id]\').val();\n        let x = new Table(\'liam2_User_email\', \'.extern_tableliam2_emailliam2_email_idliam2_User_emailliam2_email_id_fk_396224\', 0, function(){\n          x.Columns[\'liam2_email_id_fk_396224\'].is_in_menu = false;\n          x.loadRows(function(){\n            x.renderHTML();\n          })\n        }, \'a.liam2_email_id_fk_396224 = \'+PrimID, {liam2_email_id_fk_396224: [PrimID, \'Already selected\']});\n      });\n    })();\n  </script></form>', '');

-- --------------------------------------------------------

--
-- Table structure for table `state_rules`
--

CREATE TABLE `state_rules` (
  `state_rules_id` bigint(20) NOT NULL,
  `state_id_FROM` bigint(20) NOT NULL,
  `state_id_TO` bigint(20) NOT NULL,
  `transition_script` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_rules`
--

INSERT INTO `state_rules` (`state_rules_id`, `state_id_FROM`, `state_id_TO`, `transition_script`) VALUES
(1, 1, 1, NULL),
(2, 2, 2, NULL),
(3, 3, 3, NULL),
(4, 1, 2, NULL),
(5, 2, 3, NULL),
(6, 3, 2, NULL),
(7, 2, 4, NULL),
(8, 5, 6, NULL),
(9, 6, 5, NULL),
(10, 7, 7, NULL),
(11, 8, 8, NULL),
(12, 9, 9, '// [Write hashed Password]\n$param[\'row\'][\'liam2_User_firstname\'] = trim($param[\'row\'][\'liam2_User_firstname\']);\n$param[\'row\'][\'liam2_User_lastname\'] = trim($param[\'row\'][\'liam2_User_lastname\']);\n$data = $param[\'row\'];\n$allow = true;\n$msg = \'Please fill all the fields\';\n$change_password = false;\n\n// Check if pwd and salt is not empty\n    if (!$data[\'liam2_User_firstname\'] || !$data[\'liam2_User_lastname\']) {\n        $allow = false;\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_firstname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct First Name\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_lastname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct Last Name\";\n    }\n    if ($allow) {\n        if (!isset($data[\'liam2_User_password_old\']) || !isset($data[\'liam2_User_password_new\']) || !isset($data[\'liam2_User_password_new_confirm\'])) {\n            $msg = \'OK\';\n        } elseif ($data[\'liam2_User_password_old\'] && $data[\'liam2_User_password_new\'] && $data[\'liam2_User_password_new_confirm\']) {\n            // Check if password is more than 10 characters\n            if (strlen($data[\'liam2_User_password_new\']) < 10) {\n                $allow = false;\n                $msg = \'The password must have at least 10 characters.\';\n            } else {\n                if ($data[\'liam2_User_password_new\'] !== $data[\'liam2_User_password_new_confirm\']) {\n                    $allow = false;\n                    $msg = \'The new password and the confirmed password do not match\';\n                } else {\n                    if (hash(\'sha512\', $data[\'liam2_User_password_old\'] . $data[\'liam2_User_salt\']) !== $data[\'liam2_User_password\']) {\n                        $allow = false;\n                        $msg = \'The old password is incorrect\';\n                    } else {\n                        $allow = true;\n                        $salt = bin2hex(openssl_random_pseudo_bytes(64));\n                        $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password_new\'] . $salt);\n                        $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n                        $param[\'row\'][\'liam2_User_salt\'] = $salt;\n                        $msg = \"OK\";\n                        $change_password = true;\n                    }\n                }\n            }\n        } else {\n            $msg = \"OK\";\n        }\n    }\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg,\n    \"change_password\" => $change_password\n);'),
(13, 7, 8, NULL),
(14, 8, 9, NULL),
(15, 9, 8, '// [Write hashed Password]\n$param[\'row\'][\'liam2_User_firstname\'] = trim($param[\'row\'][\'liam2_User_firstname\']);\n$param[\'row\'][\'liam2_User_lastname\'] = trim($param[\'row\'][\'liam2_User_lastname\']);\n$data = $param[\'row\'];\n$allow = true;\n$msg = \'Please fill all the fields\';\n$change_password = false;\n\nif (!isset($data[\'liam2_client_passwd_reset_form\'])) {\n// Check if pwd and salt is not empty\n    if (!$data[\'liam2_User_firstname\'] || !$data[\'liam2_User_lastname\']) {\n        $allow = false;\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_firstname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct First Name\";\n    }\n    if (!preg_match(\"/^[a-zA-Z\\s\\pL]+$/u\", $data[\'liam2_User_lastname\'])) {\n        $allow = false;\n        $msg = \"Please enter correct Last Name\";\n    }\n    if ($allow) {\n        if (!isset($data[\'liam2_User_password_old\']) || !isset($data[\'liam2_User_password_new\']) || !isset($data[\'liam2_User_password_new_confirm\'])) {\n            $msg = \'OK\';\n        } elseif ($data[\'liam2_User_password_old\'] && $data[\'liam2_User_password_new\'] && $data[\'liam2_User_password_new_confirm\']) {\n            // Check if password is more than 10 characters\n            if (strlen($data[\'liam2_User_password_new\']) < 10) {\n                $allow = false;\n                $msg = \'The password must have at least 10 characters.\';\n            } else {\n                if ($data[\'liam2_User_password_new\'] !== $data[\'liam2_User_password_new_confirm\']) {\n                    $allow = false;\n                    $msg = \'The new password and the confirmed password do not match\';\n                } else {\n                    if (hash(\'sha512\', $data[\'liam2_User_password_old\'] . $data[\'liam2_User_salt\']) !== $data[\'liam2_User_password\']) {\n                        $allow = false;\n                        $msg = \'The old password is incorrect\';\n                    } else {\n                        $allow = true;\n                        $salt = bin2hex(openssl_random_pseudo_bytes(64));\n                        $hashedPassword = hash(\'sha512\', $data[\'liam2_User_password_new\'] . $salt);\n                        $param[\'row\'][\'liam2_User_password\'] = $hashedPassword;\n                        $param[\'row\'][\'liam2_User_salt\'] = $salt;\n                        $msg = \"OK\";\n                        $change_password = true;\n                    }\n                }\n            }\n        } else {\n            $msg = \"OK\";\n        }\n    }\n\n$script_result = array(\n    \"allow_transition\" => $allow,\n    \"show_message\" => true,\n    \"message\" => $msg,\n    \"change_password\" => $change_password\n);\n}'),
(16, 8, 10, NULL),
(17, 11, 12, NULL),
(18, 12, 11, NULL),
(19, 13, 13, NULL),
(22, 13, 14, NULL),
(25, 14, 16, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `liam2_email`
--
ALTER TABLE `liam2_email`
  ADD PRIMARY KEY (`liam2_email_id`),
  ADD KEY `state_id_8f478123` (`state_id`);

--
-- Indexes for table `liam2_LoginAttempts`
--
ALTER TABLE `liam2_LoginAttempts`
  ADD PRIMARY KEY (`liam2_LoginAttempts_id`);

--
-- Indexes for table `liam2_Role`
--
ALTER TABLE `liam2_Role`
  ADD PRIMARY KEY (`liam2_Role_id`),
  ADD KEY `state_id_5f6bbe5e` (`state_id`);

--
-- Indexes for table `liam2_Role_LIAMUSER`
--
ALTER TABLE `liam2_Role_LIAMUSER`
  ADD PRIMARY KEY (`liam2_user_role_id`),
  ADD KEY `liam2_User_id_fk_134386` (`liam2_User_id_fk_134386`),
  ADD KEY `liam2_Role_id_fk_345654` (`liam2_Role_id_fk_345654`),
  ADD KEY `state_id_6f138251` (`state_id`);

--
-- Indexes for table `liam2_User`
--
ALTER TABLE `liam2_User`
  ADD PRIMARY KEY (`liam2_User_id`),
  ADD KEY `state_id_2418766e` (`state_id`);

--
-- Indexes for table `liam2_User_email`
--
ALTER TABLE `liam2_User_email`
  ADD PRIMARY KEY (`liam2_User_email_id`),
  ADD KEY `liam2_User_id_fk_164887` (`liam2_User_id_fk_164887`),
  ADD KEY `liam2_email_id_fk_396224` (`liam2_email_id_fk_396224`),
  ADD KEY `state_id_26897f94` (`state_id`);

--
-- Indexes for table `liam2_User_LoginAttempt`
--
ALTER TABLE `liam2_User_LoginAttempt`
  ADD PRIMARY KEY (`liam2_User_LoginAttempt_id`),
  ADD KEY `liam2_User_id_fk_955788` (`liam2_User_id_fk_955788`),
  ADD KEY `liam2_LoginAttempts_id_fk_234561` (`liam2_LoginAttempts_id_fk_234561`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `state_machine_id_fk` (`statemachine_id`);

--
-- Indexes for table `state_machines`
--
ALTER TABLE `state_machines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state_rules`
--
ALTER TABLE `state_rules`
  ADD PRIMARY KEY (`state_rules_id`),
  ADD KEY `state_id_fk1_idx` (`state_id_FROM`),
  ADD KEY `state_id_fk_to_idx` (`state_id_TO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `liam2_email`
--
ALTER TABLE `liam2_email`
  MODIFY `liam2_email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=899246;

--
-- AUTO_INCREMENT for table `liam2_LoginAttempts`
--
ALTER TABLE `liam2_LoginAttempts`
  MODIFY `liam2_LoginAttempts_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `liam2_Role`
--
ALTER TABLE `liam2_Role`
  MODIFY `liam2_Role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9993;

--
-- AUTO_INCREMENT for table `liam2_Role_LIAMUSER`
--
ALTER TABLE `liam2_Role_LIAMUSER`
  MODIFY `liam2_user_role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=765810;

--
-- AUTO_INCREMENT for table `liam2_User`
--
ALTER TABLE `liam2_User`
  MODIFY `liam2_User_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000077;

--
-- AUTO_INCREMENT for table `liam2_User_email`
--
ALTER TABLE `liam2_User_email`
  MODIFY `liam2_User_email_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=956787;

--
-- AUTO_INCREMENT for table `liam2_User_LoginAttempt`
--
ALTER TABLE `liam2_User_LoginAttempt`
  MODIFY `liam2_User_LoginAttempt_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `state_machines`
--
ALTER TABLE `state_machines`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state_rules`
--
ALTER TABLE `state_rules`
  MODIFY `state_rules_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `liam2_email`
--
ALTER TABLE `liam2_email`
  ADD CONSTRAINT `state_id_8f478123` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `liam2_Role`
--
ALTER TABLE `liam2_Role`
  ADD CONSTRAINT `state_id_5f6bbe5e` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `liam2_Role_LIAMUSER`
--
ALTER TABLE `liam2_Role_LIAMUSER`
  ADD CONSTRAINT `liam2_Role_LIAMUSER_ibfk_1` FOREIGN KEY (`liam2_User_id_fk_134386`) REFERENCES `liam2_User` (`liam2_User_id`),
  ADD CONSTRAINT `liam2_Role_LIAMUSER_ibfk_2` FOREIGN KEY (`liam2_Role_id_fk_345654`) REFERENCES `liam2_Role` (`liam2_Role_id`),
  ADD CONSTRAINT `state_id_6f138251` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `liam2_User`
--
ALTER TABLE `liam2_User`
  ADD CONSTRAINT `state_id_2418766e` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `liam2_User_email`
--
ALTER TABLE `liam2_User_email`
  ADD CONSTRAINT `liam2_User_email_ibfk_1` FOREIGN KEY (`liam2_User_id_fk_164887`) REFERENCES `liam2_User` (`liam2_User_id`),
  ADD CONSTRAINT `liam2_User_email_ibfk_2` FOREIGN KEY (`liam2_email_id_fk_396224`) REFERENCES `liam2_email` (`liam2_email_id`),
  ADD CONSTRAINT `state_id_26897f94` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `liam2_User_LoginAttempt`
--
ALTER TABLE `liam2_User_LoginAttempt`
  ADD CONSTRAINT `liam2_User_LoginAttempt_ibfk_1` FOREIGN KEY (`liam2_User_id_fk_955788`) REFERENCES `liam2_User` (`liam2_User_id`),
  ADD CONSTRAINT `liam2_User_LoginAttempt_ibfk_2` FOREIGN KEY (`liam2_LoginAttempts_id_fk_234561`) REFERENCES `liam2_LoginAttempts` (`liam2_LoginAttempts_id`);

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_machine_id_fk` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `state_rules`
--
ALTER TABLE `state_rules`
  ADD CONSTRAINT `state_id_fk_from` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `state_id_fk_to` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
