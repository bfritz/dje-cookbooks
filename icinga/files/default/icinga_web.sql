-- MySQL dump 10.13  Distrib 5.1.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: icinga_web
-- ------------------------------------------------------
-- Server version	5.1.55-rel12.6

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

--
-- Table structure for table `cronk`
--

DROP TABLE IF EXISTS `cronk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronk` (
  `cronk_id` int(11) NOT NULL AUTO_INCREMENT,
  `cronk_uid` varchar(45) DEFAULT NULL,
  `cronk_name` varchar(45) DEFAULT NULL,
  `cronk_description` varchar(100) DEFAULT NULL,
  `cronk_xml` text,
  `cronk_user_id` int(11) DEFAULT NULL,
  `cronk_created` datetime NOT NULL,
  `cronk_modified` datetime NOT NULL,
  PRIMARY KEY (`cronk_id`),
  UNIQUE KEY `cronk_uid_UNIQUE_idx` (`cronk_uid`),
  KEY `cronk_user_id_idx` (`cronk_user_id`),
  CONSTRAINT `cronk_cronk_user_id_nsm_user_user_id` FOREIGN KEY (`cronk_user_id`) REFERENCES `nsm_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronk`
--

LOCK TABLES `cronk` WRITE;
/*!40000 ALTER TABLE `cronk` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronk_category`
--

DROP TABLE IF EXISTS `cronk_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronk_category` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT,
  `cc_uid` varchar(45) NOT NULL,
  `cc_name` varchar(45) DEFAULT NULL,
  `cc_visible` tinyint(4) DEFAULT '0',
  `cc_position` int(11) DEFAULT '0',
  `cc_created` datetime NOT NULL,
  `cc_modified` datetime NOT NULL,
  PRIMARY KEY (`cc_id`),
  UNIQUE KEY `cc_uid_UNIQUE_idx` (`cc_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronk_category`
--

LOCK TABLES `cronk_category` WRITE;
/*!40000 ALTER TABLE `cronk_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronk_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronk_category_cronk`
--

DROP TABLE IF EXISTS `cronk_category_cronk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronk_category_cronk` (
  `ccc_cc_id` int(11) NOT NULL DEFAULT '0',
  `ccc_cronk_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ccc_cc_id`,`ccc_cronk_id`),
  KEY `cronk_category_cronk_ccc_cronk_id_cronk_cronk_id` (`ccc_cronk_id`),
  CONSTRAINT `cronk_category_cronk_ccc_cc_id_cronk_category_cc_id` FOREIGN KEY (`ccc_cc_id`) REFERENCES `cronk_category` (`cc_id`),
  CONSTRAINT `cronk_category_cronk_ccc_cronk_id_cronk_cronk_id` FOREIGN KEY (`ccc_cronk_id`) REFERENCES `cronk` (`cronk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronk_category_cronk`
--

LOCK TABLES `cronk_category_cronk` WRITE;
/*!40000 ALTER TABLE `cronk_category_cronk` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronk_category_cronk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronk_principal_cronk`
--

DROP TABLE IF EXISTS `cronk_principal_cronk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronk_principal_cronk` (
  `cpc_principal_id` int(11) NOT NULL DEFAULT '0',
  `cpc_cronk_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cpc_principal_id`,`cpc_cronk_id`),
  KEY `cronk_principal_cronk_cpc_cronk_id_cronk_cronk_id` (`cpc_cronk_id`),
  CONSTRAINT `ccnp` FOREIGN KEY (`cpc_principal_id`) REFERENCES `nsm_principal` (`principal_id`),
  CONSTRAINT `cronk_principal_cronk_cpc_cronk_id_cronk_cronk_id` FOREIGN KEY (`cpc_cronk_id`) REFERENCES `cronk` (`cronk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronk_principal_cronk`
--

LOCK TABLES `cronk_principal_cronk` WRITE;
/*!40000 ALTER TABLE `cronk_principal_cronk` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronk_principal_cronk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_db_version`
--

DROP TABLE IF EXISTS `nsm_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_db_version` (
  `vers_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`vers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_db_version`
--

LOCK TABLES `nsm_db_version` WRITE;
/*!40000 ALTER TABLE `nsm_db_version` DISABLE KEYS */;
INSERT INTO `nsm_db_version` VALUES (1,2);
/*!40000 ALTER TABLE `nsm_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_log`
--

DROP TABLE IF EXISTS `nsm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_level` int(11) NOT NULL,
  `log_message` text NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_log`
--

LOCK TABLES `nsm_log` WRITE;
/*!40000 ALTER TABLE `nsm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_principal`
--

DROP TABLE IF EXISTS `nsm_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_principal` (
  `principal_id` int(11) NOT NULL AUTO_INCREMENT,
  `principal_user_id` int(11) DEFAULT NULL,
  `principal_role_id` int(11) DEFAULT NULL,
  `principal_type` varchar(4) NOT NULL,
  `principal_disabled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`principal_id`),
  KEY `principal_user_id_idx` (`principal_user_id`),
  KEY `principal_role_id_idx` (`principal_role_id`),
  CONSTRAINT `nsm_principal_principal_role_id_nsm_role_role_id` FOREIGN KEY (`principal_role_id`) REFERENCES `nsm_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nsm_principal_principal_user_id_nsm_user_user_id` FOREIGN KEY (`principal_user_id`) REFERENCES `nsm_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_principal`
--

LOCK TABLES `nsm_principal` WRITE;
/*!40000 ALTER TABLE `nsm_principal` DISABLE KEYS */;
INSERT INTO `nsm_principal` VALUES (1,1,NULL,'user',0),(2,NULL,2,'role',0),(3,NULL,3,'role',0),(4,NULL,1,'role',0),(5,NULL,4,'role',0);
/*!40000 ALTER TABLE `nsm_principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_principal_target`
--

DROP TABLE IF EXISTS `nsm_principal_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_principal_target` (
  `pt_id` int(11) NOT NULL AUTO_INCREMENT,
  `pt_principal_id` int(11) NOT NULL,
  `pt_target_id` int(11) NOT NULL,
  PRIMARY KEY (`pt_id`),
  KEY `pt_target_id_ix_idx` (`pt_target_id`),
  KEY `pt_principal_id_ix_idx` (`pt_principal_id`),
  CONSTRAINT `nsm_principal_target_pt_principal_id_nsm_principal_principal_id` FOREIGN KEY (`pt_principal_id`) REFERENCES `nsm_principal` (`principal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nsm_principal_target_pt_target_id_nsm_target_target_id` FOREIGN KEY (`pt_target_id`) REFERENCES `nsm_target` (`target_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_principal_target`
--

LOCK TABLES `nsm_principal_target` WRITE;
/*!40000 ALTER TABLE `nsm_principal_target` DISABLE KEYS */;
INSERT INTO `nsm_principal_target` VALUES (1,2,8),(2,2,13),(3,3,9),(4,3,10),(5,3,11),(6,4,8),(7,5,7),(8,3,15);
/*!40000 ALTER TABLE `nsm_principal_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_role`
--

DROP TABLE IF EXISTS `nsm_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(40) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  `role_disabled` tinyint(4) NOT NULL DEFAULT '0',
  `role_created` datetime NOT NULL,
  `role_modified` datetime NOT NULL,
  `role_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `role_parent_idx` (`role_parent`),
  CONSTRAINT `nsm_role_role_parent_nsm_role_role_id` FOREIGN KEY (`role_parent`) REFERENCES `nsm_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_role`
--

LOCK TABLES `nsm_role` WRITE;
/*!40000 ALTER TABLE `nsm_role` DISABLE KEYS */;
INSERT INTO `nsm_role` VALUES (1,'icinga_user','The default representation of a ICINGA user',0,'2011-04-18 19:02:04','2011-04-18 19:02:04',NULL),(2,'appkit_user','Appkit user test',0,'2011-04-18 19:02:04','2011-04-18 19:02:04',NULL),(3,'appkit_admin','AppKit admin',0,'2011-04-18 19:02:04','2011-04-18 19:02:04',2),(4,'guest','Unauthorized Guest',0,'2011-04-18 19:02:04','2011-04-18 19:02:04',NULL);
/*!40000 ALTER TABLE `nsm_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_session`
--

DROP TABLE IF EXISTS `nsm_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_session` (
  `session_entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `session_name` varchar(255) NOT NULL,
  `session_data` longtext NOT NULL,
  `session_checksum` varchar(255) NOT NULL,
  `session_created` datetime NOT NULL,
  `session_modified` datetime NOT NULL,
  PRIMARY KEY (`session_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_session`
--

LOCK TABLES `nsm_session` WRITE;
/*!40000 ALTER TABLE `nsm_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsm_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_target`
--

DROP TABLE IF EXISTS `nsm_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_target` (
  `target_id` int(11) NOT NULL AUTO_INCREMENT,
  `target_name` varchar(45) NOT NULL,
  `target_description` varchar(100) DEFAULT NULL,
  `target_class` varchar(80) DEFAULT NULL,
  `target_type` varchar(45) NOT NULL,
  PRIMARY KEY (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_target`
--

LOCK TABLES `nsm_target` WRITE;
/*!40000 ALTER TABLE `nsm_target` DISABLE KEYS */;
INSERT INTO `nsm_target` VALUES (1,'IcingaHostgroup','Limit data access to specific hostgroups','IcingaDataHostgroupPrincipalTarget','icinga'),(2,'IcingaServicegroup','Limit data access to specific servicegroups','IcingaDataServicegroupPrincipalTarget','icinga'),(3,'IcingaHostCustomVariablePair','Limit data access to specific custom variables','IcingaDataHostCustomVariablePrincipalTarget','icinga'),(4,'IcingaServiceCustomVariablePair','Limit data access to specific custom variables','IcingaDataServiceCustomVariablePrincipalTarget','icinga'),(5,'IcingaContactgroup','Limit data access to users contact group membership','IcingaDataContactgroupPrincipalTarget','icinga'),(6,'IcingaCommandRo','Limit access to commands','IcingaDataCommandRoPrincipalTarget','icinga'),(7,'appkit.access','Access to login-page (which, actually, means no access)','','credential'),(8,'icinga.user','Access to icinga','','credential'),(9,'appkit.admin.groups','Access to group editor','','credential'),(10,'appkit.admin.users','Access to user editor','','credential'),(11,'appkit.admin','Access to admin panel ','','credential'),(12,'appkit.user.dummy','Basic right for users','','credential'),(13,'appkit.api.access','Access to web-based api adapter','','credential'),(14,'icinga.demoMode','Hide features like password reset which are not wanted in demo systems','','credential'),(15,'icinga.cronk.category.admin','Enables category admin features','','credential');
/*!40000 ALTER TABLE `nsm_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_target_value`
--

DROP TABLE IF EXISTS `nsm_target_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_target_value` (
  `tv_pt_id` int(11) NOT NULL DEFAULT '0',
  `tv_key` varchar(45) NOT NULL DEFAULT '',
  `tv_val` varchar(45) NOT NULL,
  PRIMARY KEY (`tv_pt_id`,`tv_key`),
  CONSTRAINT `nsm_target_value_tv_pt_id_nsm_principal_target_pt_id` FOREIGN KEY (`tv_pt_id`) REFERENCES `nsm_principal_target` (`pt_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_target_value`
--

LOCK TABLES `nsm_target_value` WRITE;
/*!40000 ALTER TABLE `nsm_target_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsm_target_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_user`
--

DROP TABLE IF EXISTS `nsm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(127) NOT NULL,
  `user_lastname` varchar(40) NOT NULL,
  `user_firstname` varchar(40) NOT NULL,
  `user_password` varchar(64) NOT NULL,
  `user_salt` varchar(64) NOT NULL,
  `user_authsrc` varchar(45) NOT NULL DEFAULT 'internal',
  `user_authid` varchar(127) DEFAULT NULL,
  `user_authkey` varchar(64) DEFAULT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_disabled` tinyint(4) NOT NULL DEFAULT '1',
  `user_created` datetime NOT NULL,
  `user_modified` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_unique_idx` (`user_name`),
  KEY `user_search_idx_idx` (`user_authsrc`,`user_authid`,`user_disabled`),
  KEY `user_search_idx` (`user_name`,`user_authsrc`,`user_authid`,`user_disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_user`
--

LOCK TABLES `nsm_user` WRITE;
/*!40000 ALTER TABLE `nsm_user` DISABLE KEYS */;
INSERT INTO `nsm_user` VALUES (1,0,'root','Root','Enoch','42bc5093863dce8c150387a5bb7e3061cf3ea67d2cf1779671e1b0f435e953a1','0c099ae4627b144f3a7eaa763ba43b10fd5d1caa8738a98f11bb973bebc52ccd','internal',NULL,NULL,'root@localhost.local',0,'2011-04-18 19:02:04','2011-04-18 19:02:04');
/*!40000 ALTER TABLE `nsm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_user_preference`
--

DROP TABLE IF EXISTS `nsm_user_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_user_preference` (
  `upref_id` int(11) NOT NULL AUTO_INCREMENT,
  `upref_user_id` int(11) NOT NULL,
  `upref_val` varchar(100) DEFAULT NULL,
  `upref_longval` longtext,
  `upref_key` varchar(50) NOT NULL,
  `upref_created` datetime NOT NULL,
  `upref_modified` datetime NOT NULL,
  PRIMARY KEY (`upref_id`),
  KEY `upref_search_key_idx_idx` (`upref_key`),
  KEY `principal_role_id_ix_idx` (`upref_user_id`),
  CONSTRAINT `nsm_user_preference_upref_user_id_nsm_user_user_id` FOREIGN KEY (`upref_user_id`) REFERENCES `nsm_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_user_preference`
--

LOCK TABLES `nsm_user_preference` WRITE;
/*!40000 ALTER TABLE `nsm_user_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `nsm_user_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nsm_user_role`
--

DROP TABLE IF EXISTS `nsm_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nsm_user_role` (
  `usro_user_id` int(11) NOT NULL DEFAULT '0',
  `usro_role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usro_user_id`,`usro_role_id`),
  KEY `nsm_user_role_ix_idx` (`usro_role_id`),
  CONSTRAINT `nsm_user_role_usro_role_id_nsm_role_role_id` FOREIGN KEY (`usro_role_id`) REFERENCES `nsm_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nsm_user_role_usro_user_id_nsm_user_user_id` FOREIGN KEY (`usro_user_id`) REFERENCES `nsm_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nsm_user_role`
--

LOCK TABLES `nsm_user_role` WRITE;
/*!40000 ALTER TABLE `nsm_user_role` DISABLE KEYS */;
INSERT INTO `nsm_user_role` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `nsm_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-18 19:02:58
