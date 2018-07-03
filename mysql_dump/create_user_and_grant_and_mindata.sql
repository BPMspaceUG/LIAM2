#--- IMPORT 20180702_dump_liam2_structure.sql first
CREATE USER IF NOT EXISTS 'bpmspace_liam2'@'localhost' IDENTIFIED BY 'PASSWORT-01-inLASTPASS';
CREATE USER IF NOT EXISTS 'bpmspace_liam2_RO'@'localhost' IDENTIFIED BY 'PASSWORT-02-inLASTPASS';
GRANT SELECT, INSERT, UPDATE ON `bpmspace_liam2_v1`.* TO 'bpmspace_liam2'@'localhost';
GRANT SELECT ON `bpmspace_liam2_v1`.* TO 'bpmspace_liam2_RO'@'localhost';

#--- Create Minimum Data
USE bpmspace_liam2_v1;

#-- Create Random Salt
SELECT CONCAT(LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0),
        LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0),
        LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0),
        LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0),
        LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0),
        LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0),
        LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0),
        LPAD(CONV(FLOOR(RAND() * POW(36, 8)), 10, 36), 8, 0)) INTO @SALTSTRING;

#-- Create Admin
INSERT INTO `liam_user` (`liam_user_firstname`, `liam_user_lastname`, `liam_user_email`, `liam_user_password`, `liam_user_salt`)
VALUES ('Administrator', 'Administrator', 'admin@localhost', '', @SALTSTRING);
SET @ADMINID = LAST_INSERT_ID();
UPDATE `liam_user` SET liam_user_password = SHA2(concat('PASSWORT-03-inLASTPASS', liam_user_salt), 512) where liam_user_id = @ADMINID;

#-- Create Role
INSERT INTO `liam_role` (`liam_role_name`) VALUES ('Administrator');
SET @ADMINROLEID = LAST_INSERT_ID();
INSERT INTO `liam_user_role` (`liam_role_id`, `liam_user_id`) VALUES (@ADMINROLEID, @ADMINID);

#--- User Role
INSERT INTO `liam_role` (`liam_role_name`) VALUES ('User');