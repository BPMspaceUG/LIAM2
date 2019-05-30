
# Test if Mailhog is Up
Check if 3 Mails have arrived (LiamServer,LiamClient and AcceptanceTest) at [BPMSpace Mailhog Web](http://HOSTNAME:EXT_PORT_MAILHOG_HTTP)
# LIAM2 Enviroment
check if DB is up an something in the tables & use any DB client you like or CLI on an EXTERNAL SERVER!
-mysql -u root -p -h HOSTNAME -P EXT_PORT_MARIADB_SQL use password DB_ROOT_PASSWD
 EXPECT - login to Maria DBServer
- show databases;
  EXPECT at least the follwoing DB
  bpmspace_coms_v1
  bpmspace_liam2_v2
  information_schema
  mysql
  performance_schema
- SELECT * FROM bpmspace_liam2_v2.liam2_Role;
EXPECT  
|          9991 | Adminstrators   |        2 |
|          9992 | Users           |        2 |

SELECT * FROM bpmspace_liam2_v2.liam2_User;


+---------------+----------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------+-----------------+----------+
| liam2_User_id | liam2_User_firstname | liam2_User_lastname | liam2_User_password                                                                                                              | liam2_User_salt | state_id |
+---------------+----------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------+-----------------+----------+
|     999999999 | admin                | admin               | 4A711A36ECD079CBC88A1654A9DFD73730C3B131EA1E14BF692A6F97517F445353838750074FC9CF92DE78CE21C65DFB7C8B57653AA7DB1A228077F7B6E088CD | 999999          |        8 |
+---------------+----------------------+---------------------+----------------------------------------------------------------------------------------------------------------------------------+-----------------+----------+


# LIAM2 Enviroment
## LIAM2 Server UP
[LIAM2 Server](http://HOSTNAME:EXT_PORT_LIAM2_HTTP)
## LAIM2 Client UP
[LIAM2 Server](http://HOSTNAME:EXT_PORT_LIAM2_CLIENT_HTTP)
