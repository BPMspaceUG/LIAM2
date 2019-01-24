-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'liam2_User'
-- 
-- ---

CREATE DATABASE `bpmspace_liam2_v1` /*!40100 DEFAULT CHARACTER SET utf8 */;
Use bpmspace_liam2_v1;

DROP TABLE IF EXISTS `liam2_User`;



		
CREATE TABLE `liam2_User` (
  `liam2_User_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam2_User_firstname` VARCHAR(60) NULL DEFAULT NULL,
  `liam2_User_lastname` VARCHAR(60) NULL DEFAULT NULL,
  `liam2_User_email` VARCHAR(60) NULL DEFAULT NULL,
  `liam2_User_password` MEDIUMTEXT NULL DEFAULT NULL,
  `liam2_User_salt` CHAR(128) NULL DEFAULT NULL,

  PRIMARY KEY (`liam2_User_id`)
);

-- ---
-- Table 'liam2_Role_LIAMUSER'
-- 
-- ---

DROP TABLE IF EXISTS `liam2_Role_LIAMUSER`;
		
CREATE TABLE `liam2_Role_LIAMUSER` (
  `liam2_user_role_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam2_User_id_fk_134386` BIGINT(20) NOT NULL,
  `liam2_Role_id_fk_345654` BIGINT(20) NOT NULL,
  PRIMARY KEY (`liam2_user_role_id`)
);

-- ---
-- Table 'liam2_User_LoginAttempt'
-- 
-- ---

DROP TABLE IF EXISTS `liam2_User_LoginAttempt`;
		
CREATE TABLE `liam2_User_LoginAttempt` (
  `liam2_User_LoginAttempt_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam2_User_id_fk_955788` BIGINT(20) NOT NULL,
  `liam2_LoginAttempts_id_fk_234561` BIGINT(20) NOT NULL,
  PRIMARY KEY (`liam2_User_LoginAttempt_id`)
);

-- ---
-- Table 'liam2_Role'
-- 
-- ---

DROP TABLE IF EXISTS `liam2_Role`;
		
CREATE TABLE `liam2_Role` (
  `liam2_Role_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam2_Role_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`liam2_Role_id`)
);

-- ---
-- Table 'liam2_LoginAttempts'
-- 
-- ---

DROP TABLE IF EXISTS `liam2_LoginAttempts`;
		
CREATE TABLE `liam2_LoginAttempts` (
  `liam2_LoginAttempts_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `liam2_LoginAttempts_time` DATETIME NULL DEFAULT NULL,
  `liam2_LoginAttempts_info` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`liam2_LoginAttempts_id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `liam2_Role_LIAMUSER` ADD FOREIGN KEY (liam2_User_id_fk_134386) REFERENCES `liam2_User` (`liam2_User_id`);
ALTER TABLE `liam2_Role_LIAMUSER` ADD FOREIGN KEY (liam2_Role_id_fk_345654) REFERENCES `liam2_Role` (`liam2_Role_id`);
ALTER TABLE `liam2_User_LoginAttempt` ADD FOREIGN KEY (liam2_User_id_fk_955788) REFERENCES `liam2_User` (`liam2_User_id`);
ALTER TABLE `liam2_User_LoginAttempt` ADD FOREIGN KEY (liam2_LoginAttempts_id_fk_234561) REFERENCES `liam2_LoginAttempts` (`liam2_LoginAttempts_id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `liam2_User` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam2_Role_LIAMUSER` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam2_User_LoginAttempt` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam2_Role` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `liam2_LoginAttempts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `liam2_User` (`liam2_User_id`,`liam2_User_firstname`,`liam2_User_lastname`,`liam2_User_email`,`liam2_User_password`,`liam2_User_salt`) VALUES
-- ('','','','','','');
-- INSERT INTO `liam2_Role_LIAMUSER` (`liam2_user_role_id`,`liam2_User_id_fk_134386`,`liam2_Role_id_fk_345654`) VALUES
-- ('','','');
-- INSERT INTO `liam2_User_LoginAttempt` (`liam2_User_LoginAttempt_id`,`liam2_User_id_fk_955788`,`liam2_LoginAttempts_id_fk_234561`) VALUES
-- ('','','');
-- INSERT INTO `liam2_Role` (`liam2_Role_id`,`liam2_Role_name`) VALUES
-- ('','');
-- INSERT INTO `liam2_LoginAttempts` (`liam2_LoginAttempts_id`,`liam2_LoginAttempts_time`,`liam2_LoginAttempts_info`) VALUES
-- ('','','');
