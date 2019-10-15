--
-- Dumping data for table `liam2_Role`
--

LOCK TABLES `liam2_Role` WRITE;
/*!40000 ALTER TABLE `liam2_Role` DISABLE KEYS */;
INSERT INTO `liam2_Role` VALUES (9991,'Adminstrators',2),(9992,'Users',2);
/*!40000 ALTER TABLE `liam2_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liam2_Role_LIAMUSER`
--

LOCK TABLES `liam2_Role_LIAMUSER` WRITE;
/*!40000 ALTER TABLE `liam2_Role_LIAMUSER` DISABLE KEYS */;
INSERT INTO `liam2_Role_LIAMUSER` VALUES (765765,999999999,9991,5);
/*!40000 ALTER TABLE `liam2_Role_LIAMUSER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `liam2_User`
--

LOCK TABLES `liam2_User` WRITE;
/*!40000 ALTER TABLE `liam2_User` DISABLE KEYS */;
INSERT INTO `liam2_User` VALUES (999999999,'admin','admin','4A711A36ECD079CBC88A1654A9DFD73730C3B131EA1E14BF692A6F97517F445353838750074FC9CF92DE78CE21C65DFB7C8B57653AA7DB1A228077F7B6E088CD','999999',8);
/*!40000 ALTER TABLE `liam2_User` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `liam2_email`
--

LOCK TABLES `liam2_email` WRITE;
/*!40000 ALTER TABLE `liam2_email` DISABLE KEYS */;
INSERT INTO `liam2_email` VALUES (999,'something@localhost',13);
/*!40000 ALTER TABLE `liam2_email` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `liam2_User_email`
--

LOCK TABLES `liam2_User_email` WRITE;
/*!40000 ALTER TABLE `liam2_User_email` DISABLE KEYS */;
INSERT INTO `liam2_User_email` VALUES (956757,999999999,999,11);
/*!40000 ALTER TABLE `liam2_User_email` ENABLE KEYS */;
UNLOCK TABLES;



