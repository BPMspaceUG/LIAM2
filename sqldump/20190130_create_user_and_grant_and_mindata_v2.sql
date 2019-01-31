#--- IMPORT 20180702_dump_liam2_structure.sql first
CREATE USER IF NOT EXISTS 'bpmspace_liam2'@'localhost' IDENTIFIED BY 'PASSWORT-01-inLASTPASS';
CREATE USER IF NOT EXISTS 'bpmspace_liam2_RO'@'localhost' IDENTIFIED BY 'PASSWORT-02-inLASTPASS';
GRANT SELECT, INSERT, UPDATE ON `bpmspace_liam2_v2`.* TO 'bpmspace_liam2'@'localhost';
GRANT SELECT ON `bpmspace_liam2_v2`.* TO 'bpmspace_liam2_RO'@'localhost';

#--- Create Minimum Data
USE bpmspace_liam2_v2;

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
INSERT INTO `bpmspace_liam2_v2`.`liam2_User` (`liam2_User_id`, `liam2_User_firstname`, `liam2_User_lastname`, `liam2_User_password`, `liam2_User_salt`, `state_id`) VALUES ('999999999', 'admin', 'admin', '4A711A36ECD079CBC88A1654A9DFD73730C3B131EA1E14BF692A6F97517F445353838750074FC9CF92DE78CE21C65DFB7C8B57653AA7DB1A228077F7B6E088CD', '999999', '8');
SET @ADMINID = LAST_INSERT_ID();

INSERT INTO `bpmspace_liam2_v2`.`liam2_email` (`liam2_email_id`, `liam2_email_text`, `state_id`) VALUES ('999', 'something@localhost', '14');


SET @EMAILID = LAST_INSERT_ID();


INSERT INTO `bpmspace_liam2_v2`.`liam2_User_email` (`liam2_User_email_id`, `liam2_User_id_fk_164887`, `liam2_email_id_fk_396224`, `state_id`) VALUES ('9999', '999999999', '999', '11');


#-- Create Role

INSERT INTO `bpmspace_liam2_v2`.`liam2_Role` (`liam2_Role_id`, `liam2_Role_name`, `state_id`) VALUES ('9991', 'Adminstrators', '2');

INSERT INTO `bpmspace_liam2_v2`.`liam2_Role_LIAMUSER` ( `liam2_User_id_fk_134386`, `liam2_Role_id_fk_345654`, `state_id`) VALUES ( '999999999', '9991', '5');


#--- User Role
INSERT INTO `bpmspace_liam2_v2`.`liam2_Role` ( `liam2_Role_name`, `state_id`) VALUES ('Users', '2');
