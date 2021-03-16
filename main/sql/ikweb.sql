-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: ikweb
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
-- Table structure for table `a_dmad_social_auth_phinxlog`
--

DROP TABLE IF EXISTS `a_dmad_social_auth_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_dmad_social_auth_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_dmad_social_auth_phinxlog`
--

LOCK TABLES `a_dmad_social_auth_phinxlog` WRITE;
/*!40000 ALTER TABLE `a_dmad_social_auth_phinxlog` DISABLE KEYS */;
INSERT INTO `a_dmad_social_auth_phinxlog` VALUES (20170418000000,'CreateSocialProfiles','2019-11-30 15:20:11','2019-11-30 15:20:11',0);
/*!40000 ALTER TABLE `a_dmad_social_auth_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accepts`
--

DROP TABLE IF EXISTS `accepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accepts` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `article_id` bigint(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `archived` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accepts`
--

LOCK TABLES `accepts` WRITE;
/*!40000 ALTER TABLE `accepts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accepts_comments`
--

DROP TABLE IF EXISTS `accepts_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accepts_comments` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(255) DEFAULT NULL,
  `user_id` bigint(255) NOT NULL,
  `accept_id` bigint(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_deleted` smallint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accepts_comments`
--

LOCK TABLES `accepts_comments` WRITE;
/*!40000 ALTER TABLE `accepts_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `accepts_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acos`
--

DROP TABLE IF EXISTS `acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acos`
--

LOCK TABLES `acos` WRITE;
/*!40000 ALTER TABLE `acos` DISABLE KEYS */;
INSERT INTO `acos` VALUES (1,NULL,NULL,NULL,'controllers',1,724),(2,1,NULL,NULL,'Error',2,3),(3,1,NULL,NULL,'Pages',4,7),(4,3,NULL,NULL,'display',5,6),(5,1,NULL,NULL,'Admin',8,9),(6,1,NULL,NULL,'Acl',10,11),(7,1,NULL,NULL,'BootstrapUI',12,13),(8,1,NULL,NULL,'Croogo\\Acl',14,51),(9,8,NULL,NULL,'Admin',15,50),(10,9,NULL,NULL,'Permissions',16,31),(11,10,NULL,NULL,'index',17,18),(12,10,NULL,NULL,'toggle',19,20),(13,10,NULL,NULL,'view',21,22),(14,10,NULL,NULL,'add',23,24),(15,10,NULL,NULL,'edit',25,26),(16,10,NULL,NULL,'delete',27,28),(17,10,NULL,NULL,'getName',29,30),(18,9,NULL,NULL,'Actions',32,49),(19,18,NULL,NULL,'index',33,34),(20,18,NULL,NULL,'add',35,36),(21,18,NULL,NULL,'edit',37,38),(22,18,NULL,NULL,'delete',39,40),(23,18,NULL,NULL,'move',41,42),(24,18,NULL,NULL,'generate',43,44),(25,18,NULL,NULL,'view',45,46),(26,18,NULL,NULL,'getName',47,48),(27,1,NULL,NULL,'Croogo\\Blocks',52,87),(28,27,NULL,NULL,'Admin',53,86),(29,28,NULL,NULL,'Regions',54,67),(30,29,NULL,NULL,'index',55,56),(31,29,NULL,NULL,'view',57,58),(32,29,NULL,NULL,'add',59,60),(33,29,NULL,NULL,'edit',61,62),(34,29,NULL,NULL,'delete',63,64),(35,29,NULL,NULL,'getName',65,66),(36,28,NULL,NULL,'Blocks',68,85),(37,36,NULL,NULL,'process',69,70),(38,36,NULL,NULL,'toggle',71,72),(39,36,NULL,NULL,'index',73,74),(40,36,NULL,NULL,'view',75,76),(41,36,NULL,NULL,'add',77,78),(42,36,NULL,NULL,'edit',79,80),(43,36,NULL,NULL,'delete',81,82),(44,36,NULL,NULL,'getName',83,84),(45,1,NULL,NULL,'Croogo\\Contacts',88,125),(46,45,NULL,NULL,'Contacts',89,92),(47,46,NULL,NULL,'view',90,91),(48,45,NULL,NULL,'Admin',93,124),(49,48,NULL,NULL,'Contacts',94,107),(50,49,NULL,NULL,'index',95,96),(51,49,NULL,NULL,'view',97,98),(52,49,NULL,NULL,'add',99,100),(53,49,NULL,NULL,'edit',101,102),(54,49,NULL,NULL,'delete',103,104),(55,49,NULL,NULL,'getName',105,106),(56,48,NULL,NULL,'Messages',108,123),(57,56,NULL,NULL,'process',109,110),(58,56,NULL,NULL,'index',111,112),(59,56,NULL,NULL,'view',113,114),(60,56,NULL,NULL,'add',115,116),(61,56,NULL,NULL,'edit',117,118),(62,56,NULL,NULL,'delete',119,120),(63,56,NULL,NULL,'getName',121,122),(64,1,NULL,NULL,'Croogo\\Core',126,147),(65,64,NULL,NULL,'Error',127,128),(66,64,NULL,NULL,'Admin',129,146),(67,66,NULL,NULL,'LinkChooser',130,145),(68,67,NULL,NULL,'linkChooser',131,132),(69,67,NULL,NULL,'index',133,134),(70,67,NULL,NULL,'view',135,136),(71,67,NULL,NULL,'add',137,138),(72,67,NULL,NULL,'edit',139,140),(73,67,NULL,NULL,'delete',141,142),(74,67,NULL,NULL,'getName',143,144),(75,1,NULL,NULL,'Croogo\\Dashboards',148,175),(76,75,NULL,NULL,'Admin',149,174),(77,76,NULL,NULL,'Dashboards',150,173),(78,77,NULL,NULL,'index',151,152),(79,77,NULL,NULL,'dashboard',153,154),(80,77,NULL,NULL,'save',155,156),(81,77,NULL,NULL,'delete',157,158),(82,77,NULL,NULL,'toggle',159,160),(83,77,NULL,NULL,'moveup',161,162),(84,77,NULL,NULL,'movedown',163,164),(85,77,NULL,NULL,'view',165,166),(86,77,NULL,NULL,'add',167,168),(87,77,NULL,NULL,'edit',169,170),(88,77,NULL,NULL,'getName',171,172),(89,1,NULL,NULL,'Croogo\\Extensions',176,239),(90,89,NULL,NULL,'Admin',177,238),(91,90,NULL,NULL,'Themes',178,197),(92,91,NULL,NULL,'index',179,180),(93,91,NULL,NULL,'activate',181,182),(94,91,NULL,NULL,'add',183,184),(95,91,NULL,NULL,'editor',185,186),(96,91,NULL,NULL,'save',187,188),(97,91,NULL,NULL,'delete',189,190),(98,91,NULL,NULL,'view',191,192),(99,91,NULL,NULL,'edit',193,194),(100,91,NULL,NULL,'getName',195,196),(101,90,NULL,NULL,'Plugins',198,219),(102,101,NULL,NULL,'index',199,200),(103,101,NULL,NULL,'add',201,202),(104,101,NULL,NULL,'delete',203,204),(105,101,NULL,NULL,'toggle',205,206),(106,101,NULL,NULL,'migrate',207,208),(107,101,NULL,NULL,'moveup',209,210),(108,101,NULL,NULL,'movedown',211,212),(109,101,NULL,NULL,'view',213,214),(110,101,NULL,NULL,'edit',215,216),(111,101,NULL,NULL,'getName',217,218),(112,90,NULL,NULL,'Locales',220,237),(113,112,NULL,NULL,'index',221,222),(114,112,NULL,NULL,'activate',223,224),(115,112,NULL,NULL,'deactivate',225,226),(116,112,NULL,NULL,'add',227,228),(117,112,NULL,NULL,'edit',229,230),(118,112,NULL,NULL,'delete',231,232),(119,112,NULL,NULL,'view',233,234),(120,112,NULL,NULL,'getName',235,236),(121,1,NULL,NULL,'Croogo\\FileManager',240,293),(122,121,NULL,NULL,'Admin',241,292),(123,122,NULL,NULL,'FileManager',242,273),(124,123,NULL,NULL,'index',243,244),(125,123,NULL,NULL,'browse',245,246),(126,123,NULL,NULL,'editFile',247,248),(127,123,NULL,NULL,'upload',249,250),(128,123,NULL,NULL,'deleteFile',251,252),(129,123,NULL,NULL,'deleteDirectory',253,254),(130,123,NULL,NULL,'rename',255,256),(131,123,NULL,NULL,'createDirectory',257,258),(132,123,NULL,NULL,'createFile',259,260),(133,123,NULL,NULL,'chmod',261,262),(134,123,NULL,NULL,'view',263,264),(135,123,NULL,NULL,'add',265,266),(136,123,NULL,NULL,'edit',267,268),(137,123,NULL,NULL,'delete',269,270),(138,123,NULL,NULL,'getName',271,272),(139,122,NULL,NULL,'Attachments',274,291),(140,139,NULL,NULL,'browse',275,276),(141,139,NULL,NULL,'add',277,278),(142,139,NULL,NULL,'process',279,280),(143,139,NULL,NULL,'index',281,282),(144,139,NULL,NULL,'view',283,284),(145,139,NULL,NULL,'edit',285,286),(146,139,NULL,NULL,'delete',287,288),(147,139,NULL,NULL,'getName',289,290),(157,1,NULL,NULL,'Croogo\\Menus',294,331),(158,157,NULL,NULL,'Admin',295,330),(159,158,NULL,NULL,'Menus',296,309),(160,159,NULL,NULL,'index',297,298),(161,159,NULL,NULL,'view',299,300),(162,159,NULL,NULL,'add',301,302),(163,159,NULL,NULL,'edit',303,304),(164,159,NULL,NULL,'delete',305,306),(165,159,NULL,NULL,'getName',307,308),(166,158,NULL,NULL,'Links',310,329),(167,166,NULL,NULL,'index',311,312),(168,166,NULL,NULL,'delete',313,314),(169,166,NULL,NULL,'moveup',315,316),(170,166,NULL,NULL,'movedown',317,318),(171,166,NULL,NULL,'process',319,320),(172,166,NULL,NULL,'view',321,322),(173,166,NULL,NULL,'add',323,324),(174,166,NULL,NULL,'edit',325,326),(175,166,NULL,NULL,'getName',327,328),(176,1,NULL,NULL,'Croogo\\Meta',332,353),(177,176,NULL,NULL,'Admin',333,352),(178,177,NULL,NULL,'Meta',334,351),(179,178,NULL,NULL,'deleteMeta',335,336),(180,178,NULL,NULL,'addMeta',337,338),(181,178,NULL,NULL,'index',339,340),(182,178,NULL,NULL,'view',341,342),(183,178,NULL,NULL,'add',343,344),(184,178,NULL,NULL,'edit',345,346),(185,178,NULL,NULL,'delete',347,348),(186,178,NULL,NULL,'getName',349,350),(187,1,NULL,NULL,'Croogo\\Nodes',354,405),(188,187,NULL,NULL,'Nodes',355,366),(189,188,NULL,NULL,'index',356,357),(190,188,NULL,NULL,'term',358,359),(191,188,NULL,NULL,'promoted',360,361),(192,188,NULL,NULL,'search',362,363),(193,188,NULL,NULL,'view',364,365),(194,187,NULL,NULL,'Admin',367,396),(195,194,NULL,NULL,'Nodes',368,395),(196,195,NULL,NULL,'create',369,370),(197,195,NULL,NULL,'update_paths',371,372),(198,195,NULL,NULL,'delete_meta',373,374),(199,195,NULL,NULL,'add_meta',375,376),(200,195,NULL,NULL,'process',377,378),(201,195,NULL,NULL,'toggle',379,380),(202,195,NULL,NULL,'move',381,382),(203,195,NULL,NULL,'index',383,384),(204,195,NULL,NULL,'view',385,386),(205,195,NULL,NULL,'add',387,388),(206,195,NULL,NULL,'edit',389,390),(207,195,NULL,NULL,'delete',391,392),(208,195,NULL,NULL,'getName',393,394),(209,187,NULL,NULL,'Api',397,404),(210,209,NULL,NULL,'V10',398,403),(211,210,NULL,NULL,'Nodes',399,402),(212,211,NULL,NULL,'lookup',400,401),(213,1,NULL,NULL,'Croogo\\Settings',406,461),(214,213,NULL,NULL,'Admin',407,460),(215,214,NULL,NULL,'Settings',408,427),(216,215,NULL,NULL,'prefix',409,410),(217,215,NULL,NULL,'moveup',411,412),(218,215,NULL,NULL,'movedown',413,414),(219,215,NULL,NULL,'index',415,416),(220,215,NULL,NULL,'view',417,418),(221,215,NULL,NULL,'add',419,420),(222,215,NULL,NULL,'edit',421,422),(223,215,NULL,NULL,'delete',423,424),(224,215,NULL,NULL,'getName',425,426),(225,214,NULL,NULL,'Caches',428,443),(226,225,NULL,NULL,'index',429,430),(227,225,NULL,NULL,'clear',431,432),(228,225,NULL,NULL,'view',433,434),(229,225,NULL,NULL,'add',435,436),(230,225,NULL,NULL,'edit',437,438),(231,225,NULL,NULL,'delete',439,440),(232,225,NULL,NULL,'getName',441,442),(233,214,NULL,NULL,'Languages',444,459),(234,233,NULL,NULL,'select',445,446),(235,233,NULL,NULL,'index',447,448),(236,233,NULL,NULL,'view',449,450),(237,233,NULL,NULL,'add',451,452),(238,233,NULL,NULL,'edit',453,454),(239,233,NULL,NULL,'delete',455,456),(240,233,NULL,NULL,'getName',457,458),(241,1,NULL,NULL,'Croogo\\Taxonomy',462,511),(242,241,NULL,NULL,'Admin',463,510),(243,242,NULL,NULL,'Terms',464,481),(244,243,NULL,NULL,'index',465,466),(245,243,NULL,NULL,'delete',467,468),(246,243,NULL,NULL,'moveup',469,470),(247,243,NULL,NULL,'movedown',471,472),(248,243,NULL,NULL,'view',473,474),(249,243,NULL,NULL,'add',475,476),(250,243,NULL,NULL,'edit',477,478),(251,243,NULL,NULL,'getName',479,480),(252,242,NULL,NULL,'Types',482,495),(253,252,NULL,NULL,'index',483,484),(254,252,NULL,NULL,'view',485,486),(255,252,NULL,NULL,'add',487,488),(256,252,NULL,NULL,'edit',489,490),(257,252,NULL,NULL,'delete',491,492),(258,252,NULL,NULL,'getName',493,494),(259,242,NULL,NULL,'Vocabularies',496,509),(260,259,NULL,NULL,'index',497,498),(261,259,NULL,NULL,'view',499,500),(262,259,NULL,NULL,'add',501,502),(263,259,NULL,NULL,'edit',503,504),(264,259,NULL,NULL,'delete',505,506),(265,259,NULL,NULL,'getName',507,508),(266,1,NULL,NULL,'Croogo\\Users',512,599),(267,266,NULL,NULL,'Users',513,546),(268,267,NULL,NULL,'index',514,515),(269,267,NULL,NULL,'add',516,517),(270,267,NULL,NULL,'activate',518,519),(271,267,NULL,NULL,'edit',520,521),(272,267,NULL,NULL,'forgot',522,523),(273,267,NULL,NULL,'reset',524,525),(274,267,NULL,NULL,'login',526,527),(275,267,NULL,NULL,'logout',528,529),(276,267,NULL,NULL,'view',530,531),(277,266,NULL,NULL,'Admin',547,588),(278,277,NULL,NULL,'Roles',548,561),(279,278,NULL,NULL,'index',549,550),(280,278,NULL,NULL,'view',551,552),(281,278,NULL,NULL,'add',553,554),(282,278,NULL,NULL,'edit',555,556),(283,278,NULL,NULL,'delete',557,558),(284,278,NULL,NULL,'getName',559,560),(285,277,NULL,NULL,'Users',562,587),(286,285,NULL,NULL,'resetPassword',563,564),(287,285,NULL,NULL,'login',565,566),(288,285,NULL,NULL,'logout',567,568),(289,285,NULL,NULL,'register',569,570),(290,285,NULL,NULL,'forgot',571,572),(291,285,NULL,NULL,'reset',573,574),(292,285,NULL,NULL,'index',575,576),(293,285,NULL,NULL,'view',577,578),(294,285,NULL,NULL,'add',579,580),(295,285,NULL,NULL,'edit',581,582),(296,285,NULL,NULL,'delete',583,584),(297,285,NULL,NULL,'getName',585,586),(298,266,NULL,NULL,'Api',589,598),(299,298,NULL,NULL,'V10',590,597),(300,299,NULL,NULL,'Users',591,596),(301,300,NULL,NULL,'lookup',592,593),(302,300,NULL,NULL,'token',594,595),(303,1,NULL,NULL,'Croogo\\Wysiwyg',600,601),(304,1,NULL,NULL,'Migrations',602,603),(305,1,NULL,NULL,'Search',604,605),(306,267,NULL,NULL,'main',532,533),(308,1,NULL,NULL,'CryptoTheme',606,607),(309,1,NULL,NULL,'DebugKit',608,635),(310,309,NULL,NULL,'Toolbar',609,612),(311,310,NULL,NULL,'clearCache',610,611),(312,309,NULL,NULL,'Requests',613,616),(313,312,NULL,NULL,'view',614,615),(314,309,NULL,NULL,'Composer',617,620),(315,314,NULL,NULL,'checkDependencies',618,619),(316,309,NULL,NULL,'Panels',621,626),(317,316,NULL,NULL,'index',622,623),(318,316,NULL,NULL,'view',624,625),(319,309,NULL,NULL,'MailPreview',627,634),(320,319,NULL,NULL,'index',628,629),(321,319,NULL,NULL,'sent',630,631),(322,319,NULL,NULL,'email',632,633),(323,267,NULL,NULL,'profile',534,535),(324,1,NULL,NULL,'Articles',636,649),(325,324,NULL,NULL,'Articles',637,648),(326,325,NULL,NULL,'articles',638,639),(327,325,NULL,NULL,'add',640,641),(328,325,NULL,NULL,'view',642,643),(329,1,NULL,NULL,'Categories',650,653),(330,329,NULL,NULL,'Categories',651,652),(336,325,NULL,NULL,'edit',644,645),(337,1,NULL,NULL,'Notes',654,675),(338,337,NULL,NULL,'Notes',655,662),(339,338,NULL,NULL,'add',656,657),(340,337,NULL,NULL,'Reviews',663,666),(341,340,NULL,NULL,'add',664,665),(342,337,NULL,NULL,'Accepts',667,670),(343,342,NULL,NULL,'add',668,669),(344,337,NULL,NULL,'Rejects',671,674),(345,344,NULL,NULL,'add',672,673),(346,1,NULL,NULL,'Votes',676,683),(347,346,NULL,NULL,'Votes',677,682),(348,347,NULL,NULL,'up',678,679),(349,347,NULL,NULL,'down',680,681),(350,267,NULL,NULL,'roles',536,537),(351,1,NULL,NULL,'Notices',684,689),(352,351,NULL,NULL,'Notices',685,688),(353,352,NULL,NULL,'index',686,687),(354,338,NULL,NULL,'comment',658,659),(355,1,NULL,NULL,'Banners',690,705),(356,355,NULL,NULL,'Banners',691,704),(357,356,NULL,NULL,'index',692,693),(358,356,NULL,NULL,'view',694,695),(359,356,NULL,NULL,'add',696,697),(360,356,NULL,NULL,'edit',698,699),(361,356,NULL,NULL,'delete',700,701),(364,338,NULL,NULL,'comments',660,661),(365,1,NULL,NULL,'Croogo\\Translate',706,723),(366,365,NULL,NULL,'Admin',707,722),(367,366,NULL,NULL,'Translate',708,721),(368,367,NULL,NULL,'index',709,710),(369,367,NULL,NULL,'edit',711,712),(370,367,NULL,NULL,'delete',713,714),(371,367,NULL,NULL,'view',715,716),(372,367,NULL,NULL,'add',717,718),(373,367,NULL,NULL,'getName',719,720),(379,267,NULL,NULL,'change',538,539),(380,267,NULL,NULL,'general',540,541),(381,267,NULL,NULL,'upload',542,543),(382,267,NULL,NULL,'inbox',544,545),(383,325,NULL,NULL,'index',646,647),(384,356,NULL,NULL,'upload',702,703);
/*!40000 ALTER TABLE `acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros`
--

DROP TABLE IF EXISTS `aros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aros`
--

LOCK TABLES `aros` WRITE;
/*!40000 ALTER TABLE `aros` DISABLE KEYS */;
INSERT INTO `aros` VALUES (1,NULL,'Roles',1,'Role-superadmin',1,4),(2,NULL,'Roles',2,'Role-registered',5,38),(3,NULL,'Roles',3,'Role-public',39,40),(4,2,'Roles',4,'Role-admin',6,7),(6,1,'Users',1,'admin',2,3),(10,2,'Users',5,'jakub@test.com',8,9),(11,2,'Roles',6,'Role-publisher-i',10,11),(12,2,'Roles',7,'Role-publisher-ii',12,13),(13,2,'Roles',8,'Role-accept',14,15),(14,2,'Roles',9,'Role-editor',16,17),(15,2,'Roles',10,'Role-settle-i',18,19),(16,2,'Roles',11,'Role-settle-iv',20,21),(17,2,'Roles',12,'Role-blocked-ii',22,23),(18,2,'Roles',13,'Role-give-permission-ii',24,25),(19,2,'Roles',14,'Role-set-banner',26,27),(21,2,'Roles',16,'Role-newsletter-accept',28,29),(22,2,'Users',6,'jb.szczubelek@gmail.com',30,31),(23,2,'Users',7,'test3@gmail.com',32,33),(24,2,'Users',8,'piotr@test.com',34,35),(25,2,'Users',9,'jakub@test.commm',36,37);
/*!40000 ALTER TABLE `aros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros_acos`
--

DROP TABLE IF EXISTS `aros_acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aros_acos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aros_acos`
--

LOCK TABLES `aros_acos` WRITE;
/*!40000 ALTER TABLE `aros_acos` DISABLE KEYS */;
INSERT INTO `aros_acos` VALUES (1,3,47,'1','1','1','1'),(2,3,189,'1','1','1','1'),(3,3,190,'1','1','1','1'),(4,3,191,'1','1','1','1'),(5,3,192,'1','1','1','1'),(6,3,193,'1','1','1','1'),(7,2,268,'1','1','1','1'),(8,3,269,'1','1','1','1'),(9,3,270,'1','1','1','1'),(10,2,271,'1','1','1','1'),(11,3,272,'1','1','1','1'),(12,3,273,'1','1','1','1'),(13,3,274,'1','1','1','1'),(14,2,275,'1','1','1','1'),(15,2,288,'1','1','1','1'),(16,2,276,'1','1','1','1'),(17,4,77,'1','1','1','1'),(26,4,293,'1','1','1','1'),(27,4,306,'1','1','1','1'),(28,3,306,'1','1','1','1'),(29,3,276,'-1','-1','-1','-1'),(30,3,275,'-1','-1','-1','-1'),(31,2,306,'1','1','1','1'),(33,2,323,'1','1','1','1'),(36,2,326,'1','1','1','1'),(37,2,327,'1','1','1','1'),(38,2,328,'1','1','1','1'),(39,4,326,'-1','-1','-1','-1'),(40,4,327,'-1','-1','-1','-1'),(41,2,336,'1','1','1','1'),(42,2,339,'1','1','1','1'),(43,4,339,'-1','-1','-1','-1'),(45,2,341,'1','1','1','1'),(46,2,343,'1','1','1','1'),(47,2,345,'1','1','1','1'),(48,2,348,'1','1','1','1'),(49,2,349,'1','1','1','1'),(50,2,350,'1','1','1','1'),(51,2,353,'1','1','1','1'),(52,2,354,'1','1','1','1'),(53,2,357,'1','1','1','1'),(54,2,358,'1','1','1','1'),(55,2,359,'1','1','1','1'),(56,2,360,'1','1','1','1'),(57,2,364,'1','1','1','1'),(58,2,375,'1','1','1','1'),(59,2,377,'1','1','1','1'),(60,2,378,'1','1','1','1'),(61,2,379,'1','1','1','1'),(62,2,380,'1','1','1','1'),(63,2,382,'1','1','1','1'),(64,2,383,'1','1','1','1'),(65,2,361,'1','1','1','1'),(66,2,384,'1','1','1','1');
/*!40000 ALTER TABLE `aros_acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `type_id` bigint(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `counter_accepts` bigint(11) NOT NULL DEFAULT '0',
  `counter_rejects` bigint(11) NOT NULL DEFAULT '0',
  `counter_up_vote` bigint(11) NOT NULL DEFAULT '0',
  `counter_down_vote` bigint(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `preview` text NOT NULL,
  `counter_vote_result` bigint(11) NOT NULL DEFAULT '0',
  `is_visible` tinyint(255) NOT NULL DEFAULT '0',
  `published` int(11) DEFAULT NULL,
  `counter_comments` bigint(11) NOT NULL DEFAULT '0',
  `counter_sub_comments` bigint(255) NOT NULL DEFAULT '0',
  `counter_reviews` bigint(11) NOT NULL DEFAULT '0',
  `is_newsletter` tinyint(255) NOT NULL DEFAULT '0',
  `resolve_by` int(11) NOT NULL DEFAULT '0',
  `resolve_status` smallint(2) NOT NULL DEFAULT '0',
  `resolve_time` int(11) NOT NULL DEFAULT '0',
  `resolve_send` tinyint(2) NOT NULL DEFAULT '0',
  `is_visible_by_role` smallint(255) NOT NULL DEFAULT '0',
  `is_deleted` TinyInt( 1 ) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_resolves`
--

DROP TABLE IF EXISTS `articles_resolves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles_resolves` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(255) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `resolve_status` smallint(3) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_resolves`
--

LOCK TABLES `articles_resolves` WRITE;
/*!40000 ALTER TABLE `articles_resolves` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles_resolves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` smallint(255) NOT NULL,
  `position` int(255) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(20) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `body` text NOT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `class` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `element` varchar(255) DEFAULT NULL,
  `visibility_roles` text,
  `visibility_paths` text,
  `visibility_php` text,
  `params` text,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (3,4,'About','about','This is the content of your block. Can be modified in admin panel.',1,'',1,2,'','','','','',NULL,NULL,'2009-12-20 03:07:39',NULL,'2009-07-26 17:13:14',NULL),(5,4,'Meta','meta','[menu:meta]',1,'',1,6,'','','','','',NULL,NULL,'2009-12-22 05:17:39',NULL,'2009-09-12 06:36:22',NULL),(6,4,'Blogroll','blogroll','[menu:blogroll]',1,'',1,4,'','','','','',NULL,NULL,'2009-12-20 03:07:33',NULL,'2009-09-12 23:33:27',NULL),(7,4,'Categories','categories','[vocabulary:categories type=\"blog\"]',1,'',1,3,'','','','','',NULL,NULL,'2009-12-20 03:07:36',NULL,'2009-10-03 16:52:50',NULL),(8,4,'Search','search','',0,'',1,1,'Croogo/Nodes.search','','','','',NULL,NULL,'2009-12-20 03:07:39',NULL,'2009-12-20 03:07:27',NULL),(9,4,'Recent Posts','recent_posts','[node:recent_posts conditions=\"Nodes.type:blog\" order=\"Nodes.id DESC\" limit=\"5\"]',1,'',1,5,'','','','','',NULL,NULL,'2010-04-08 21:09:31',NULL,'2009-12-22 05:17:32',NULL);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `counter_pop` bigint(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_articles`
--

DROP TABLE IF EXISTS `categories_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_articles` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(255) NOT NULL,
  `category_id` bigint(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_articles`
--

LOCK TABLES `categories_articles` WRITE;
/*!40000 ALTER TABLE `categories_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `model` varchar(50) NOT NULL DEFAULT 'Node',
  `foreign_key` int(20) NOT NULL,
  `user_id` int(20) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL,
  `comment_type` varchar(100) NOT NULL DEFAULT 'comment',
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model`,`foreign_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,NULL,'Croogo/Nodes.Nodes',1,0,'Mr Croogo','email@example.com','http://www.croogo.org','127.0.0.1','','Hi, this is the first comment.',NULL,1,0,'blog','comment',1,2,'2009-12-25 12:00:00',NULL,'2009-12-25 12:00:00',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `body` text,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `address` text,
  `address2` text,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message_status` tinyint(1) NOT NULL DEFAULT '1',
  `message_archive` tinyint(1) NOT NULL DEFAULT '1',
  `message_count` int(11) NOT NULL DEFAULT '0',
  `message_spam_protection` tinyint(1) NOT NULL DEFAULT '0',
  `message_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `message_notify` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Contact','contact','','','','','','','','','','','you@your-site.com',1,0,0,0,0,1,1,'2009-10-07 22:07:49',NULL,'2009-09-16 01:45:17',NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_tab`
--

DROP TABLE IF EXISTS `cron_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_tab` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `last_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_tab`
--

LOCK TABLES `cron_tab` WRITE;
/*!40000 ALTER TABLE `cron_tab` DISABLE KEYS */;
INSERT INTO `cron_tab` VALUES (1,'newsletter',0,'2020-01-09 18:38:45','2020-01-09 18:38:45',0);
/*!40000 ALTER TABLE `cron_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_acl_phinxlog`
--

DROP TABLE IF EXISTS `croogo_acl_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_acl_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_acl_phinxlog`
--

LOCK TABLES `croogo_acl_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_acl_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_acl_phinxlog` VALUES (20160807104926,'AclInitialMigration','2019-10-26 14:05:39','2019-10-26 14:05:39',0);
/*!40000 ALTER TABLE `croogo_acl_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_blocks_phinxlog`
--

DROP TABLE IF EXISTS `croogo_blocks_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_blocks_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_blocks_phinxlog`
--

LOCK TABLES `croogo_blocks_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_blocks_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_blocks_phinxlog` VALUES (20160807104952,'BlocksInitialMigration','2019-10-26 14:05:39','2019-10-26 14:05:39',0);
/*!40000 ALTER TABLE `croogo_blocks_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_comments_phinxlog`
--

DROP TABLE IF EXISTS `croogo_comments_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_comments_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_comments_phinxlog`
--

LOCK TABLES `croogo_comments_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_comments_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_comments_phinxlog` VALUES (20160807105013,'CommentsInitialMigration','2019-10-26 14:05:40','2019-10-26 14:05:40',0);
/*!40000 ALTER TABLE `croogo_comments_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_contacts_phinxlog`
--

DROP TABLE IF EXISTS `croogo_contacts_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_contacts_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_contacts_phinxlog`
--

LOCK TABLES `croogo_contacts_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_contacts_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_contacts_phinxlog` VALUES (20160807105032,'ContactsInitialMigration','2019-10-26 14:05:40','2019-10-26 14:05:40',0);
/*!40000 ALTER TABLE `croogo_contacts_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_dashboards_phinxlog`
--

DROP TABLE IF EXISTS `croogo_dashboards_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_dashboards_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_dashboards_phinxlog`
--

LOCK TABLES `croogo_dashboards_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_dashboards_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_dashboards_phinxlog` VALUES (20160807105058,'DashboardsInitialMigration','2019-10-26 14:05:40','2019-10-26 14:05:41',0);
/*!40000 ALTER TABLE `croogo_dashboards_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_extensions_phinxlog`
--

DROP TABLE IF EXISTS `croogo_extensions_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_extensions_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_extensions_phinxlog`
--

LOCK TABLES `croogo_extensions_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_extensions_phinxlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `croogo_extensions_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_file_manager_phinxlog`
--

DROP TABLE IF EXISTS `croogo_file_manager_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_file_manager_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_file_manager_phinxlog`
--

LOCK TABLES `croogo_file_manager_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_file_manager_phinxlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `croogo_file_manager_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_menus_phinxlog`
--

DROP TABLE IF EXISTS `croogo_menus_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_menus_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_menus_phinxlog`
--

LOCK TABLES `croogo_menus_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_menus_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_menus_phinxlog` VALUES (20160807105149,'MenusInitialMigration','2019-10-26 14:05:40','2019-10-26 14:05:40',0),(20160807131950,'UpgradeMenus','2019-10-26 14:05:40','2019-10-26 14:05:40',0);
/*!40000 ALTER TABLE `croogo_menus_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_meta_phinxlog`
--

DROP TABLE IF EXISTS `croogo_meta_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_meta_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_meta_phinxlog`
--

LOCK TABLES `croogo_meta_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_meta_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_meta_phinxlog` VALUES (20160807105202,'MetaInitialMigration','2019-10-26 14:05:40','2019-10-26 14:05:40',0),(20171120095100,'MoveSiteMeta','2019-10-26 14:05:40','2019-10-26 14:05:40',0);
/*!40000 ALTER TABLE `croogo_meta_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_nodes_phinxlog`
--

DROP TABLE IF EXISTS `croogo_nodes_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_nodes_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_nodes_phinxlog`
--

LOCK TABLES `croogo_nodes_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_nodes_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_nodes_phinxlog` VALUES (20160807105214,'NodesInitialMigration','2019-10-26 14:05:40','2019-10-26 14:05:40',0);
/*!40000 ALTER TABLE `croogo_nodes_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_settings_phinxlog`
--

DROP TABLE IF EXISTS `croogo_settings_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_settings_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_settings_phinxlog`
--

LOCK TABLES `croogo_settings_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_settings_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_settings_phinxlog` VALUES (20160807105227,'SettingsInitialMigration','2019-10-26 14:05:41','2019-10-26 14:05:41',0),(20171206045454,'EnlargeLanguagesFields','2019-10-26 14:05:41','2019-10-26 14:05:41',0);
/*!40000 ALTER TABLE `croogo_settings_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_taxonomy_phinxlog`
--

DROP TABLE IF EXISTS `croogo_taxonomy_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_taxonomy_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_taxonomy_phinxlog`
--

LOCK TABLES `croogo_taxonomy_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_taxonomy_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_taxonomy_phinxlog` VALUES (20160807105245,'TaxonomyInitialMigration','2019-10-26 14:05:39','2019-10-26 14:05:39',0);
/*!40000 ALTER TABLE `croogo_taxonomy_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_translate_phinxlog`
--

DROP TABLE IF EXISTS `croogo_translate_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_translate_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_translate_phinxlog`
--

LOCK TABLES `croogo_translate_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_translate_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_translate_phinxlog` VALUES (20160308182244,'TranslateInitialMigration','2019-11-12 19:33:51','2019-11-12 19:33:51',0);
/*!40000 ALTER TABLE `croogo_translate_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_users_phinxlog`
--

DROP TABLE IF EXISTS `croogo_users_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_users_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_users_phinxlog`
--

LOCK TABLES `croogo_users_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_users_phinxlog` DISABLE KEYS */;
INSERT INTO `croogo_users_phinxlog` VALUES (20160807105314,'UsersInitialMigration','2019-10-26 14:05:38','2019-10-26 14:05:38',0);
/*!40000 ALTER TABLE `croogo_users_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `croogo_wysiwyg_phinxlog`
--

DROP TABLE IF EXISTS `croogo_wysiwyg_phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `croogo_wysiwyg_phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `croogo_wysiwyg_phinxlog`
--

LOCK TABLES `croogo_wysiwyg_phinxlog` WRITE;
/*!40000 ALTER TABLE `croogo_wysiwyg_phinxlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `croogo_wysiwyg_phinxlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards`
--

DROP TABLE IF EXISTS `dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(20) NOT NULL DEFAULT '0',
  `column` int(20) NOT NULL DEFAULT '0',
  `weight` int(20) NOT NULL DEFAULT '0',
  `collapsed` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards`
--

LOCK TABLES `dashboards` WRITE;
/*!40000 ALTER TABLE `dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n`
--

DROP TABLE IF EXISTS `i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) NOT NULL,
  `model` varchar(200) NOT NULL,
  `foreign_key` int(11) NOT NULL,
  `field` varchar(255) NOT NULL,
  `content` text,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locale` (`locale`,`model`,`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n`
--

LOCK TABLES `i18n` WRITE;
/*!40000 ALTER TABLE `i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `native` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `locale` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_languages_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'Afrikaans','','af','af',0,1,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(2,'Afrikaans (Namibia)','Namibië','af','af_NA',0,2,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(3,'Afrikaans (South Africa)','Suid-Afrika','af','af_ZA',0,3,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(4,'Aghem','','agq','agq',0,4,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(5,'Aghem (Cameroon)','Kàmàlûŋ','agq','agq_CM',0,5,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(6,'Akan','','ak','ak',0,6,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(7,'Akan (Ghana)','Gaana','ak','ak_GH',0,7,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(8,'Amharic','','am','am',0,8,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(9,'Amharic (Ethiopia)','ኢትዮጵያ','am','am_ET',0,9,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(10,'Arabic','','ar','ar',1,10,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(11,'Arabic (World)','العالم','ar','ar_001',0,11,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(12,'Arabic (United Arab Emirates)','الإمارات العربية المتحدة','ar','ar_AE',0,12,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(13,'Arabic (Bahrain)','البحرين','ar','ar_BH',0,13,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(14,'Arabic (Djibouti)','جيبوتي','ar','ar_DJ',0,14,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(15,'Arabic (Algeria)','الجزائر','ar','ar_DZ',0,15,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(16,'Arabic (Egypt)','مصر','ar','ar_EG',0,16,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(17,'Arabic (Western Sahara)','الصحراء الغربية','ar','ar_EH',0,17,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(18,'Arabic (Eritrea)','إريتريا','ar','ar_ER',0,18,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(19,'Arabic (Israel)','إسرائيل','ar','ar_IL',0,19,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(20,'Arabic (Iraq)','العراق','ar','ar_IQ',0,20,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(21,'Arabic (Jordan)','الأردن','ar','ar_JO',0,21,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(22,'Arabic (Comoros)','جزر القمر','ar','ar_KM',0,22,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(23,'Arabic (Kuwait)','الكويت','ar','ar_KW',0,23,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(24,'Arabic (Lebanon)','لبنان','ar','ar_LB',0,24,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(25,'Arabic (Libya)','ليبيا','ar','ar_LY',0,25,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(26,'Arabic (Morocco)','المغرب','ar','ar_MA',0,26,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(27,'Arabic (Mauritania)','موريتانيا','ar','ar_MR',0,27,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(28,'Arabic (Oman)','عُمان','ar','ar_OM',0,28,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(29,'Arabic (Palestinian Territories)','الأراضي الفلسطينية','ar','ar_PS',0,29,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(30,'Arabic (Qatar)','قطر','ar','ar_QA',0,30,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(31,'Arabic (Saudi Arabia)','المملكة العربية السعودية','ar','ar_SA',0,31,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(32,'Arabic (Sudan)','السودان','ar','ar_SD',0,32,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(33,'Arabic (Somalia)','الصومال','ar','ar_SO',0,33,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(34,'Arabic (South Sudan)','جنوب السودان','ar','ar_SS',0,34,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(35,'Arabic (Syria)','سوريا','ar','ar_SY',0,35,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(36,'Arabic (Chad)','تشاد','ar','ar_TD',0,36,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(37,'Arabic (Tunisia)','تونس','ar','ar_TN',0,37,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(38,'Arabic (Yemen)','اليمن','ar','ar_YE',0,38,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(39,'Assamese','','as','as',0,39,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(40,'Assamese (India)','ভাৰত','as','as_IN',0,40,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(41,'Asu','','asa','asa',0,41,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(42,'Asu (Tanzania)','Tadhania','asa','asa_TZ',0,42,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(43,'Asturian','','ast','ast',0,43,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(44,'Asturian (Spain)','España','ast','ast_ES',0,44,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(45,'Azerbaijani','','az','az',0,45,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(46,'Azerbaijani (Cyrillic)','','az','az_Cyrl',0,46,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(47,'Azerbaijani (Cyrillic, Azerbaijan)','Азәрбајҹан','az','az_Cyrl_AZ',0,47,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(48,'Azerbaijani (Latin)','','az','az_Latn',0,48,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(49,'Azerbaijani (Latin, Azerbaijan)','Azərbaycan','az','az_Latn_AZ',0,49,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(50,'Basaa','','bas','bas',0,50,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(51,'Basaa (Cameroon)','Kàmɛ̀rûn','bas','bas_CM',0,51,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(52,'Belarusian','','be','be',0,52,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(53,'Belarusian (Belarus)','Беларусь','be','be_BY',0,53,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(54,'Bemba','','bem','bem',0,54,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(55,'Bemba (Zambia)','Zambia','bem','bem_ZM',0,55,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(56,'Bena','','bez','bez',0,56,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(57,'Bena (Tanzania)','Hutanzania','bez','bez_TZ',0,57,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(58,'Bulgarian','','bg','bg',1,58,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(59,'Bulgarian (Bulgaria)','България','bg','bg_BG',0,59,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(60,'Bambara','','bm','bm',0,60,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(61,'Bambara (Mali)','Mali','bm','bm_ML',0,61,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(62,'Bangla','','bn','bn',0,62,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(63,'Bangla (Bangladesh)','বাংলাদেশ','bn','bn_BD',0,63,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(64,'Bangla (India)','ভারত','bn','bn_IN',0,64,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(65,'Tibetan','','bo','bo',0,65,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(66,'Tibetan (China)','རྒྱ་ནག','bo','bo_CN',0,66,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(67,'Tibetan (India)','རྒྱ་གར་','bo','bo_IN',0,67,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(68,'Breton','','br','br',0,68,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(69,'Breton (France)','Frañs','br','br_FR',0,69,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(70,'Bodo','','brx','brx',0,70,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(71,'Bodo (India)','भारत','brx','brx_IN',0,71,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(72,'Bosnian','','bs','bs',0,72,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(73,'Bosnian (Cyrillic)','','bs','bs_Cyrl',0,73,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(74,'Bosnian (Cyrillic, Bosnia & Herzegovina)','Босна и Херцеговина','bs','bs_Cyrl_BA',0,74,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(75,'Bosnian (Latin)','','bs','bs_Latn',0,75,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(76,'Bosnian (Latin, Bosnia & Herzegovina)','Bosna i Hercegovina','bs','bs_Latn_BA',0,76,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(77,'Catalan','','ca','ca',0,77,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(78,'Catalan (Andorra)','Andorra','ca','ca_AD',0,78,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(79,'Catalan (Spain)','Espanya','ca','ca_ES',0,79,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(80,'Catalan (France)','França','ca','ca_FR',0,80,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(81,'Catalan (Italy)','Itàlia','ca','ca_IT',0,81,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(82,'Chakma','','ccp','ccp',0,82,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(83,'Chechen','','ce','ce',0,85,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(84,'Chechen (Russia)','Росси','ce','ce_RU',0,86,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(85,'Cebuano','','ceb','ceb',0,87,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(86,'Cebuano (Philippines)','Pilipinas','ceb','ceb_PH',0,88,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(87,'Chiga','','cgg','cgg',0,89,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(88,'Chiga (Uganda)','Uganda','cgg','cgg_UG',0,90,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(89,'Cherokee','','chr','chr',0,91,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(90,'Cherokee (United States)','ᏌᏊ ᎢᏳᎾᎵᏍᏔᏅ ᏍᎦᏚᎩ','chr','chr_US',0,92,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(91,'Central Kurdish','','ckb','ckb',0,93,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(92,'Central Kurdish (Iraq)','عێراق','ckb','ckb_IQ',0,94,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(93,'Central Kurdish (Iran)','ئێران','ckb','ckb_IR',0,95,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(94,'Czech','','cs','cs',1,96,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(95,'Czech (Czechia)','Česko','cs','cs_CZ',0,97,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(96,'Welsh','','cy','cy',0,98,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(97,'Welsh (United Kingdom)','Y Deyrnas Unedig','cy','cy_GB',0,99,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(98,'Danish','','da','da',0,100,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(99,'Danish (Denmark)','Danmark','da','da_DK',0,101,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(100,'Danish (Greenland)','Grønland','da','da_GL',0,102,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(101,'Taita','','dav','dav',0,103,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(102,'Taita (Kenya)','Kenya','dav','dav_KE',0,104,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(103,'German','','de','de',1,105,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(104,'German (Austria)','Österreich','de','de_AT',0,106,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(105,'German (Belgium)','Belgien','de','de_BE',0,107,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(106,'German (Switzerland)','Schweiz','de','de_CH',0,108,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(107,'German (Germany)','Deutschland','de','de_DE',0,109,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(108,'German (Italy)','Italien','de','de_IT',0,110,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(109,'German (Liechtenstein)','Liechtenstein','de','de_LI',0,111,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(110,'German (Luxembourg)','Luxemburg','de','de_LU',0,112,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(111,'Zarma','','dje','dje',0,113,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(112,'Zarma (Niger)','Nižer','dje','dje_NE',0,114,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(113,'Lower Sorbian','','dsb','dsb',0,115,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(114,'Lower Sorbian (Germany)','Nimska','dsb','dsb_DE',0,116,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(115,'Duala','','dua','dua',0,117,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(116,'Duala (Cameroon)','Cameroun','dua','dua_CM',0,118,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(117,'Jola-Fonyi','','dyo','dyo',0,119,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(118,'Jola-Fonyi (Senegal)','Senegal','dyo','dyo_SN',0,120,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(119,'Dzongkha','','dz','dz',0,121,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(120,'Dzongkha (Bhutan)','འབྲུག','dz','dz_BT',0,122,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(121,'Embu','','ebu','ebu',0,123,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(122,'Embu (Kenya)','Kenya','ebu','ebu_KE',0,124,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(123,'Ewe','','ee','ee',0,125,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(124,'Ewe (Ghana)','Ghana nutome','ee','ee_GH',0,126,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(125,'Ewe (Togo)','Togo nutome','ee','ee_TG',0,127,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(126,'Greek','','el','el',1,128,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(127,'Greek (Cyprus)','Κύπρος','el','el_CY',0,129,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(128,'Greek (Greece)','Ελλάδα','el','el_GR',0,130,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(129,'English','','en','en',1,131,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(130,'English (World)','World','en','en_001',0,132,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(131,'English (Europe)','Europe','en','en_150',0,133,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(132,'English (United Arab Emirates)','United Arab Emirates','en','en_AE',0,134,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(133,'English (Antigua & Barbuda)','Antigua & Barbuda','en','en_AG',0,135,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(134,'English (Anguilla)','Anguilla','en','en_AI',0,136,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(135,'English (American Samoa)','American Samoa','en','en_AS',0,137,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(136,'English (Austria)','Austria','en','en_AT',0,138,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(137,'English (Australia)','Australia','en','en_AU',0,139,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(138,'English (Barbados)','Barbados','en','en_BB',0,140,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(139,'English (Belgium)','Belgium','en','en_BE',0,141,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(140,'English (Burundi)','Burundi','en','en_BI',0,142,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(141,'English (Bermuda)','Bermuda','en','en_BM',0,143,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(142,'English (Bahamas)','Bahamas','en','en_BS',0,144,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(143,'English (Botswana)','Botswana','en','en_BW',0,145,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(144,'English (Belize)','Belize','en','en_BZ',0,146,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(145,'English (Canada)','Canada','en','en_CA',0,147,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(146,'English (Cocos [Keeling] Islands)','Cocos (Keeling) Islands','en','en_CC',0,148,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(147,'English (Switzerland)','Switzerland','en','en_CH',0,149,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(148,'English (Cook Islands)','Cook Islands','en','en_CK',0,150,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(149,'English (Cameroon)','Cameroon','en','en_CM',0,151,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(150,'English (Christmas Island)','Christmas Island','en','en_CX',0,152,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(151,'English (Cyprus)','Cyprus','en','en_CY',0,153,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(152,'English (Germany)','Germany','en','en_DE',0,154,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(153,'English (Diego Garcia)','Diego Garcia','en','en_DG',0,155,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(154,'English (Denmark)','Denmark','en','en_DK',0,156,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(155,'English (Dominica)','Dominica','en','en_DM',0,157,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(156,'English (Eritrea)','Eritrea','en','en_ER',0,158,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(157,'English (Finland)','Finland','en','en_FI',0,159,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(158,'English (Fiji)','Fiji','en','en_FJ',0,160,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(159,'English (Falkland Islands)','Falkland Islands','en','en_FK',0,161,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(160,'English (Micronesia)','Micronesia','en','en_FM',0,162,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(161,'English (United Kingdom)','United Kingdom','en','en_GB',0,163,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(162,'English (Grenada)','Grenada','en','en_GD',0,164,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(163,'English (Guernsey)','Guernsey','en','en_GG',0,165,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(164,'English (Ghana)','Ghana','en','en_GH',0,166,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(165,'English (Gibraltar)','Gibraltar','en','en_GI',0,167,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(166,'English (Gambia)','Gambia','en','en_GM',0,168,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(167,'English (Guam)','Guam','en','en_GU',0,169,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(168,'English (Guyana)','Guyana','en','en_GY',0,170,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(169,'English (Hong Kong SAR China)','Hong Kong SAR China','en','en_HK',0,171,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(170,'English (Ireland)','Ireland','en','en_IE',0,172,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(171,'English (Israel)','Israel','en','en_IL',0,173,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(172,'English (Isle of Man)','Isle of Man','en','en_IM',0,174,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(173,'English (India)','India','en','en_IN',0,175,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(174,'English (British Indian Ocean Territory)','British Indian Ocean Territory','en','en_IO',0,176,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(175,'English (Jersey)','Jersey','en','en_JE',0,177,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(176,'English (Jamaica)','Jamaica','en','en_JM',0,178,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(177,'English (Kenya)','Kenya','en','en_KE',0,179,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(178,'English (Kiribati)','Kiribati','en','en_KI',0,180,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(179,'English (St. Kitts & Nevis)','St. Kitts & Nevis','en','en_KN',0,181,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(180,'English (Cayman Islands)','Cayman Islands','en','en_KY',0,182,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(181,'English (St. Lucia)','St. Lucia','en','en_LC',0,183,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(182,'English (Liberia)','Liberia','en','en_LR',0,184,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(183,'English (Lesotho)','Lesotho','en','en_LS',0,185,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(184,'English (Madagascar)','Madagascar','en','en_MG',0,186,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(185,'English (Marshall Islands)','Marshall Islands','en','en_MH',0,187,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(186,'English (Macao SAR China)','Macao SAR China','en','en_MO',0,188,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(187,'English (Northern Mariana Islands)','Northern Mariana Islands','en','en_MP',0,189,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(188,'English (Montserrat)','Montserrat','en','en_MS',0,190,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(189,'English (Malta)','Malta','en','en_MT',0,191,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(190,'English (Mauritius)','Mauritius','en','en_MU',0,192,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(191,'English (Malawi)','Malawi','en','en_MW',0,193,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(192,'English (Malaysia)','Malaysia','en','en_MY',0,194,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(193,'English (Namibia)','Namibia','en','en_NA',0,195,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(194,'English (Norfolk Island)','Norfolk Island','en','en_NF',0,196,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(195,'English (Nigeria)','Nigeria','en','en_NG',0,197,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(196,'English (Netherlands)','Netherlands','en','en_NL',0,198,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(197,'English (Nauru)','Nauru','en','en_NR',0,199,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(198,'English (Niue)','Niue','en','en_NU',0,200,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(199,'English (New Zealand)','New Zealand','en','en_NZ',0,201,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(200,'English (Papua New Guinea)','Papua New Guinea','en','en_PG',0,202,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(201,'English (Philippines)','Philippines','en','en_PH',0,203,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(202,'English (Pakistan)','Pakistan','en','en_PK',0,204,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(203,'English (Pitcairn Islands)','Pitcairn Islands','en','en_PN',0,205,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(204,'English (Puerto Rico)','Puerto Rico','en','en_PR',0,206,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(205,'English (Palau)','Palau','en','en_PW',0,207,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(206,'English (Rwanda)','Rwanda','en','en_RW',0,208,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(207,'English (Solomon Islands)','Solomon Islands','en','en_SB',0,209,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(208,'English (Seychelles)','Seychelles','en','en_SC',0,210,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(209,'English (Sudan)','Sudan','en','en_SD',0,211,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(210,'English (Sweden)','Sweden','en','en_SE',0,212,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(211,'English (Singapore)','Singapore','en','en_SG',0,213,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(212,'English (St. Helena)','St. Helena','en','en_SH',0,214,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(213,'English (Slovenia)','Slovenia','en','en_SI',0,215,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(214,'English (Sierra Leone)','Sierra Leone','en','en_SL',0,216,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(215,'English (South Sudan)','South Sudan','en','en_SS',0,217,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(216,'English (Sint Maarten)','Sint Maarten','en','en_SX',0,218,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(217,'English (Eswatini)','Eswatini','en','en_SZ',0,219,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(218,'English (Turks & Caicos Islands)','Turks & Caicos Islands','en','en_TC',0,220,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(219,'English (Tokelau)','Tokelau','en','en_TK',0,221,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(220,'English (Tonga)','Tonga','en','en_TO',0,222,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(221,'English (Trinidad & Tobago)','Trinidad & Tobago','en','en_TT',0,223,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(222,'English (Tuvalu)','Tuvalu','en','en_TV',0,224,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(223,'English (Tanzania)','Tanzania','en','en_TZ',0,225,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(224,'English (Uganda)','Uganda','en','en_UG',0,226,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(225,'English (U.S. Outlying Islands)','U.S. Outlying Islands','en','en_UM',0,227,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(226,'English (United States)','United States','en','en_US',0,228,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(227,'English (United States, Computer)','United States','en','en_US_POSIX',0,229,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(228,'English (St. Vincent & Grenadines)','St. Vincent & Grenadines','en','en_VC',0,230,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(229,'English (British Virgin Islands)','British Virgin Islands','en','en_VG',0,231,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(230,'English (U.S. Virgin Islands)','U.S. Virgin Islands','en','en_VI',0,232,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(231,'English (Vanuatu)','Vanuatu','en','en_VU',0,233,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(232,'English (Samoa)','Samoa','en','en_WS',0,234,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(233,'English (South Africa)','South Africa','en','en_ZA',0,235,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(234,'English (Zambia)','Zambia','en','en_ZM',0,236,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(235,'English (Zimbabwe)','Zimbabwe','en','en_ZW',0,237,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(236,'Esperanto','','eo','eo',0,238,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(237,'Esperanto (World)','Mondo','eo','eo_001',0,239,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(238,'Spanish','','es','es',1,240,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(239,'Spanish (Latin America)','Latinoamérica','es','es_419',0,241,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(240,'Spanish (Argentina)','Argentina','es','es_AR',0,242,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(241,'Spanish (Bolivia)','Bolivia','es','es_BO',0,243,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(242,'Spanish (Brazil)','Brasil','es','es_BR',0,244,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(243,'Spanish (Belize)','Belice','es','es_BZ',0,245,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(244,'Spanish (Chile)','Chile','es','es_CL',0,246,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(245,'Spanish (Colombia)','Colombia','es','es_CO',0,247,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(246,'Spanish (Costa Rica)','Costa Rica','es','es_CR',0,248,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(247,'Spanish (Cuba)','Cuba','es','es_CU',0,249,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(248,'Spanish (Dominican Republic)','República Dominicana','es','es_DO',0,250,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(249,'Spanish (Ceuta & Melilla)','Ceuta y Melilla','es','es_EA',0,251,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(250,'Spanish (Ecuador)','Ecuador','es','es_EC',0,252,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(251,'Spanish (Spain)','España','es','es_ES',0,253,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(252,'Spanish (Equatorial Guinea)','Guinea Ecuatorial','es','es_GQ',0,254,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(253,'Spanish (Guatemala)','Guatemala','es','es_GT',0,255,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(254,'Spanish (Honduras)','Honduras','es','es_HN',0,256,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(255,'Spanish (Canary Islands)','Canarias','es','es_IC',0,257,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(256,'Spanish (Mexico)','México','es','es_MX',0,258,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(257,'Spanish (Nicaragua)','Nicaragua','es','es_NI',0,259,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(258,'Spanish (Panama)','Panamá','es','es_PA',0,260,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(259,'Spanish (Peru)','Perú','es','es_PE',0,261,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(260,'Spanish (Philippines)','Filipinas','es','es_PH',0,262,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(261,'Spanish (Puerto Rico)','Puerto Rico','es','es_PR',0,263,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(262,'Spanish (Paraguay)','Paraguay','es','es_PY',0,264,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(263,'Spanish (El Salvador)','El Salvador','es','es_SV',0,265,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(264,'Spanish (United States)','Estados Unidos','es','es_US',0,266,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(265,'Spanish (Uruguay)','Uruguay','es','es_UY',0,267,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(266,'Spanish (Venezuela)','Venezuela','es','es_VE',0,268,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(267,'Estonian','','et','et',0,269,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(268,'Estonian (Estonia)','Eesti','et','et_EE',0,270,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(269,'Basque','','eu','eu',0,271,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(270,'Basque (Spain)','Espainia','eu','eu_ES',0,272,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(271,'Ewondo','','ewo','ewo',0,273,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(272,'Ewondo (Cameroon)','Kamərún','ewo','ewo_CM',0,274,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(273,'Persian','','fa','fa',1,275,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(274,'Persian (Afghanistan)','افغانستان','fa','fa_AF',0,276,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(275,'Persian (Iran)','ایران','fa','fa_IR',0,277,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(276,'Fulah','','ff','ff',0,278,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(277,'Fulah (Latin)','','ff','ff_Latn',0,279,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(278,'Fulah (Latin, Burkina Faso)','Burkibaa Faaso','ff','ff_Latn_BF',0,280,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(279,'Fulah (Latin, Cameroon)','Kameruun','ff','ff_Latn_CM',0,281,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(280,'Fulah (Latin, Ghana)','Ganaa','ff','ff_Latn_GH',0,282,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(281,'Fulah (Latin, Gambia)','Gammbi','ff','ff_Latn_GM',0,283,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(282,'Fulah (Latin, Guinea)','Gine','ff','ff_Latn_GN',0,284,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(283,'Fulah (Latin, Guinea-Bissau)','Gine-Bisaawo','ff','ff_Latn_GW',0,285,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(284,'Fulah (Latin, Liberia)','Liberiyaa','ff','ff_Latn_LR',0,286,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(285,'Fulah (Latin, Mauritania)','Muritani','ff','ff_Latn_MR',0,287,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(286,'Fulah (Latin, Niger)','Nijeer','ff','ff_Latn_NE',0,288,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(287,'Fulah (Latin, Nigeria)','Nijeriyaa','ff','ff_Latn_NG',0,289,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(288,'Fulah (Latin, Sierra Leone)','Seraa liyon','ff','ff_Latn_SL',0,290,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(289,'Fulah (Latin, Senegal)','Senegaal','ff','ff_Latn_SN',0,291,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(290,'Finnish','','fi','fi',0,292,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(291,'Finnish (Finland)','Suomi','fi','fi_FI',0,293,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(292,'Filipino','','fil','fil',0,294,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(293,'Filipino (Philippines)','Pilipinas','fil','fil_PH',0,295,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(294,'Faroese','','fo','fo',0,296,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(295,'Faroese (Denmark)','Danmark','fo','fo_DK',0,297,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(296,'Faroese (Faroe Islands)','Føroyar','fo','fo_FO',0,298,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(297,'French','','fr','fr',1,299,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(298,'French (Belgium)','Belgique','fr','fr_BE',0,300,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(299,'French (Burkina Faso)','Burkina Faso','fr','fr_BF',0,301,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(300,'French (Burundi)','Burundi','fr','fr_BI',0,302,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(301,'French (Benin)','Bénin','fr','fr_BJ',0,303,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(302,'French (St. Barthélemy)','Saint-Barthélemy','fr','fr_BL',0,304,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(303,'French (Canada)','Canada','fr','fr_CA',0,305,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(304,'French (Congo - Kinshasa)','Congo-Kinshasa','fr','fr_CD',0,306,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(305,'French (Central African Republic)','République centrafricaine','fr','fr_CF',0,307,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(306,'French (Congo - Brazzaville)','Congo-Brazzaville','fr','fr_CG',0,308,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(307,'French (Switzerland)','Suisse','fr','fr_CH',0,309,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(308,'French (Côte d’Ivoire)','Côte d’Ivoire','fr','fr_CI',0,310,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(309,'French (Cameroon)','Cameroun','fr','fr_CM',0,311,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(310,'French (Djibouti)','Djibouti','fr','fr_DJ',0,312,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(311,'French (Algeria)','Algérie','fr','fr_DZ',0,313,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(312,'French (France)','France','fr','fr_FR',0,314,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(313,'French (Gabon)','Gabon','fr','fr_GA',0,315,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(314,'French (French Guiana)','Guyane française','fr','fr_GF',0,316,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(315,'French (Guinea)','Guinée','fr','fr_GN',0,317,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(316,'French (Guadeloupe)','Guadeloupe','fr','fr_GP',0,318,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(317,'French (Equatorial Guinea)','Guinée équatoriale','fr','fr_GQ',0,319,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(318,'French (Haiti)','Haïti','fr','fr_HT',0,320,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(319,'French (Comoros)','Comores','fr','fr_KM',0,321,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(320,'French (Luxembourg)','Luxembourg','fr','fr_LU',0,322,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(321,'French (Morocco)','Maroc','fr','fr_MA',0,323,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(322,'French (Monaco)','Monaco','fr','fr_MC',0,324,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(323,'French (St. Martin)','Saint-Martin','fr','fr_MF',0,325,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(324,'French (Madagascar)','Madagascar','fr','fr_MG',0,326,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(325,'French (Mali)','Mali','fr','fr_ML',0,327,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(326,'French (Martinique)','Martinique','fr','fr_MQ',0,328,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(327,'French (Mauritania)','Mauritanie','fr','fr_MR',0,329,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(328,'French (Mauritius)','Maurice','fr','fr_MU',0,330,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(329,'French (New Caledonia)','Nouvelle-Calédonie','fr','fr_NC',0,331,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(330,'French (Niger)','Niger','fr','fr_NE',0,332,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(331,'French (French Polynesia)','Polynésie française','fr','fr_PF',0,333,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(332,'French (St. Pierre & Miquelon)','Saint-Pierre-et-Miquelon','fr','fr_PM',0,334,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(333,'French (Réunion)','La Réunion','fr','fr_RE',0,335,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(334,'French (Rwanda)','Rwanda','fr','fr_RW',0,336,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(335,'French (Seychelles)','Seychelles','fr','fr_SC',0,337,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(336,'French (Senegal)','Sénégal','fr','fr_SN',0,338,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(337,'French (Syria)','Syrie','fr','fr_SY',0,339,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(338,'French (Chad)','Tchad','fr','fr_TD',0,340,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(339,'French (Togo)','Togo','fr','fr_TG',0,341,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(340,'French (Tunisia)','Tunisie','fr','fr_TN',0,342,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(341,'French (Vanuatu)','Vanuatu','fr','fr_VU',0,343,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(342,'French (Wallis & Futuna)','Wallis-et-Futuna','fr','fr_WF',0,344,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(343,'French (Mayotte)','Mayotte','fr','fr_YT',0,345,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(344,'Friulian','','fur','fur',0,346,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(345,'Friulian (Italy)','Italie','fur','fur_IT',0,347,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(346,'Western Frisian','','fy','fy',0,348,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(347,'Western Frisian (Netherlands)','Nederlân','fy','fy_NL',0,349,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(348,'Irish','','ga','ga',0,350,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(349,'Irish (Ireland)','Éire','ga','ga_IE',0,351,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(350,'Scottish Gaelic','','gd','gd',0,352,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(351,'Scottish Gaelic (United Kingdom)','An Rìoghachd Aonaichte','gd','gd_GB',0,353,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(352,'Galician','','gl','gl',0,354,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(353,'Galician (Spain)','España','gl','gl_ES',0,355,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(354,'Swiss German','','gsw','gsw',0,356,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(355,'Swiss German (Switzerland)','Schwiiz','gsw','gsw_CH',0,357,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(356,'Swiss German (France)','Frankriich','gsw','gsw_FR',0,358,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(357,'Swiss German (Liechtenstein)','Liächteschtäi','gsw','gsw_LI',0,359,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(358,'Gujarati','','gu','gu',0,360,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(359,'Gujarati (India)','ભારત','gu','gu_IN',0,361,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(360,'Gusii','','guz','guz',0,362,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(361,'Gusii (Kenya)','Kenya','guz','guz_KE',0,363,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(362,'Manx','','gv','gv',0,364,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(363,'Manx (Isle of Man)','Ellan Vannin','gv','gv_IM',0,365,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(364,'Hausa','','ha','ha',0,366,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(365,'Hausa (Ghana)','Gana','ha','ha_GH',0,367,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(366,'Hausa (Niger)','Nijar','ha','ha_NE',0,368,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(367,'Hausa (Nigeria)','Najeriya','ha','ha_NG',0,369,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(368,'Hawaiian','','haw','haw',0,370,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(369,'Hawaiian (United States)','ʻAmelika Hui Pū ʻIa','haw','haw_US',0,371,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(370,'Hebrew','','he','he',0,372,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(371,'Hebrew (Israel)','ישראל','he','he_IL',0,373,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(372,'Hindi','','hi','hi',0,374,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(373,'Hindi (India)','भारत','hi','hi_IN',0,375,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(374,'Croatian','','hr','hr',0,376,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(375,'Croatian (Bosnia & Herzegovina)','Bosna i Hercegovina','hr','hr_BA',0,377,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(376,'Croatian (Croatia)','Hrvatska','hr','hr_HR',0,378,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(377,'Upper Sorbian','','hsb','hsb',0,379,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(378,'Upper Sorbian (Germany)','Němska','hsb','hsb_DE',0,380,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(379,'Hungarian','','hu','hu',1,381,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(380,'Hungarian (Hungary)','Magyarország','hu','hu_HU',0,382,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(381,'Armenian','','hy','hy',0,383,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(382,'Armenian (Armenia)','Հայաստան','hy','hy_AM',0,384,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(383,'Interlingua','','ia','ia',0,385,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(384,'Interlingua (World)','Mundo','ia','ia_001',0,386,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(385,'Indonesian','','id','id',1,387,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(386,'Indonesian (Indonesia)','Indonesia','id','id_ID',0,388,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(387,'Igbo','','ig','ig',0,389,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(388,'Igbo (Nigeria)','Naịjịrịa','ig','ig_NG',0,390,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(389,'Sichuan Yi','','ii','ii',0,391,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(390,'Sichuan Yi (China)','ꍏꇩ','ii','ii_CN',0,392,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(391,'Icelandic','','is','is',0,393,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(392,'Icelandic (Iceland)','Ísland','is','is_IS',0,394,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(393,'Italian','','it','it',1,395,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(394,'Italian (Switzerland)','Svizzera','it','it_CH',0,396,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(395,'Italian (Italy)','Italia','it','it_IT',0,397,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(396,'Italian (San Marino)','San Marino','it','it_SM',0,398,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(397,'Italian (Vatican City)','Città del Vaticano','it','it_VA',0,399,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(398,'Japanese','','ja','ja',1,400,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(399,'Japanese (Japan)','日本','ja','ja_JP',0,401,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(400,'Ngomba','','jgo','jgo',0,402,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(401,'Ngomba (Cameroon)','Kamɛlûn','jgo','jgo_CM',0,403,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(402,'Machame','','jmc','jmc',0,404,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(403,'Machame (Tanzania)','Tanzania','jmc','jmc_TZ',0,405,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(404,'Javanese','','jv','jv',0,406,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(405,'Javanese (Indonesia)','Indonésia','jv','jv_ID',0,407,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(406,'Georgian','','ka','ka',0,408,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(407,'Georgian (Georgia)','საქართველო','ka','ka_GE',0,409,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(408,'Kabyle','','kab','kab',0,410,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(409,'Kabyle (Algeria)','Lezzayer','kab','kab_DZ',0,411,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(410,'Kamba','','kam','kam',0,412,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(411,'Kamba (Kenya)','Kenya','kam','kam_KE',0,413,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(412,'Makonde','','kde','kde',0,414,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(413,'Makonde (Tanzania)','Tanzania','kde','kde_TZ',0,415,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(414,'Kabuverdianu','','kea','kea',0,416,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(415,'Kabuverdianu (Cape Verde)','Kabu Verdi','kea','kea_CV',0,417,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(416,'Koyra Chiini','','khq','khq',0,418,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(417,'Koyra Chiini (Mali)','Maali','khq','khq_ML',0,419,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(418,'Kikuyu','','ki','ki',0,420,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(419,'Kikuyu (Kenya)','Kenya','ki','ki_KE',0,421,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(420,'Kazakh','','kk','kk',0,422,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(421,'Kazakh (Kazakhstan)','Қазақстан','kk','kk_KZ',0,423,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(422,'Kako','','kkj','kkj',0,424,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(423,'Kako (Cameroon)','Kamɛrun','kkj','kkj_CM',0,425,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(424,'Kalaallisut','','kl','kl',0,426,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(425,'Kalaallisut (Greenland)','Kalaallit Nunaat','kl','kl_GL',0,427,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(426,'Kalenjin','','kln','kln',0,428,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(427,'Kalenjin (Kenya)','Emetab Kenya','kln','kln_KE',0,429,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(428,'Khmer','','km','km',0,430,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(429,'Khmer (Cambodia)','កម្ពុជា','km','km_KH',0,431,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(430,'Kannada','','kn','kn',0,432,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(431,'Kannada (India)','ಭಾರತ','kn','kn_IN',0,433,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(432,'Korean','','ko','ko',0,434,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(433,'Korean (North Korea)','조선민주주의인민공화국','ko','ko_KP',0,435,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(434,'Korean (South Korea)','대한민국','ko','ko_KR',0,436,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(435,'Konkani','','kok','kok',0,437,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(436,'Konkani (India)','भारत','kok','kok_IN',0,438,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(437,'Kashmiri','','ks','ks',0,439,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(438,'Kashmiri (India)','ہِندوستان','ks','ks_IN',0,440,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(439,'Shambala','','ksb','ksb',0,441,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(440,'Shambala (Tanzania)','Tanzania','ksb','ksb_TZ',0,442,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(441,'Bafia','','ksf','ksf',0,443,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(442,'Bafia (Cameroon)','kamɛrún','ksf','ksf_CM',0,444,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(443,'Colognian','','ksh','ksh',0,445,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(444,'Colognian (Germany)','Doütschland','ksh','ksh_DE',0,446,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(445,'Kurdish','','ku','ku',0,447,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(446,'Kurdish (Turkey)','Tirkiye','ku','ku_TR',0,448,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(447,'Cornish','','kw','kw',0,449,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(448,'Cornish (United Kingdom)','Rywvaneth Unys','kw','kw_GB',0,450,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(449,'Kyrgyz','','ky','ky',0,451,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(450,'Kyrgyz (Kyrgyzstan)','Кыргызстан','ky','ky_KG',0,452,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(451,'Langi','','lag','lag',0,453,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(452,'Langi (Tanzania)','Taansanía','lag','lag_TZ',0,454,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(453,'Luxembourgish','','lb','lb',0,455,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(454,'Luxembourgish (Luxembourg)','Lëtzebuerg','lb','lb_LU',0,456,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(455,'Ganda','','lg','lg',0,457,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(456,'Ganda (Uganda)','Yuganda','lg','lg_UG',0,458,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(457,'Lakota','','lkt','lkt',0,459,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(458,'Lakota (United States)','Mílahaŋska Tȟamákȟočhe','lkt','lkt_US',0,460,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(459,'Lingala','','ln','ln',0,461,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(460,'Lingala (Angola)','Angóla','ln','ln_AO',0,462,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(461,'Lingala (Congo - Kinshasa)','Republíki ya Kongó Demokratíki','ln','ln_CD',0,463,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(462,'Lingala (Central African Republic)','Repibiki ya Afríka ya Káti','ln','ln_CF',0,464,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(463,'Lingala (Congo - Brazzaville)','Kongo','ln','ln_CG',0,465,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(464,'Lao','','lo','lo',0,466,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(465,'Lao (Laos)','ລາວ','lo','lo_LA',0,467,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(466,'Northern Luri','','lrc','lrc',0,468,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(467,'Northern Luri (Iraq)','IQ','lrc','lrc_IQ',0,469,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(468,'Northern Luri (Iran)','IR','lrc','lrc_IR',0,470,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(469,'Lithuanian','','lt','lt',0,471,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(470,'Lithuanian (Lithuania)','Lietuva','lt','lt_LT',0,472,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(471,'Luba-Katanga','','lu','lu',0,473,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(472,'Luba-Katanga (Congo - Kinshasa)','Ditunga wa Kongu','lu','lu_CD',0,474,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(473,'Luo','','luo','luo',0,475,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(474,'Luo (Kenya)','Kenya','luo','luo_KE',0,476,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(475,'Luyia','','luy','luy',0,477,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(476,'Luyia (Kenya)','Kenya','luy','luy_KE',0,478,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(477,'Latvian','','lv','lv',0,479,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(478,'Latvian (Latvia)','Latvija','lv','lv_LV',0,480,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(479,'Masai','','mas','mas',0,481,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(480,'Masai (Kenya)','Kenya','mas','mas_KE',0,482,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(481,'Masai (Tanzania)','Tansania','mas','mas_TZ',0,483,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(482,'Meru','','mer','mer',0,484,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(483,'Meru (Kenya)','Kenya','mer','mer_KE',0,485,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(484,'Morisyen','','mfe','mfe',0,486,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(485,'Morisyen (Mauritius)','Moris','mfe','mfe_MU',0,487,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(486,'Malagasy','','mg','mg',0,488,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(487,'Malagasy (Madagascar)','Madagasikara','mg','mg_MG',0,489,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(488,'Makhuwa-Meetto','','mgh','mgh',0,490,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(489,'Makhuwa-Meetto (Mozambique)','Umozambiki','mgh','mgh_MZ',0,491,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(490,'Metaʼ','','mgo','mgo',0,492,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(491,'Metaʼ (Cameroon)','Kamalun','mgo','mgo_CM',0,493,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(492,'Maori','','mi','mi',0,494,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(493,'Maori (New Zealand)','Aotearoa','mi','mi_NZ',0,495,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(494,'Macedonian','','mk','mk',0,496,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(495,'Macedonian (North Macedonia)','Северна Македонија','mk','mk_MK',0,497,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(496,'Malayalam','','ml','ml',0,498,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(497,'Malayalam (India)','ഇന്ത്യ','ml','ml_IN',0,499,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(498,'Mongolian','','mn','mn',0,500,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(499,'Mongolian (Mongolia)','Монгол','mn','mn_MN',0,501,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(500,'Marathi','','mr','mr',0,502,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(501,'Marathi (India)','भारत','mr','mr_IN',0,503,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(502,'Malay','','ms','ms',0,504,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(503,'Malay (Brunei)','Brunei','ms','ms_BN',0,505,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(504,'Malay (Malaysia)','Malaysia','ms','ms_MY',0,506,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(505,'Malay (Singapore)','Singapura','ms','ms_SG',0,507,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(506,'Maltese','','mt','mt',0,508,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(507,'Maltese (Malta)','Malta','mt','mt_MT',0,509,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(508,'Mundang','','mua','mua',0,510,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(509,'Mundang (Cameroon)','kameruŋ','mua','mua_CM',0,511,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(510,'Burmese','','my','my',0,512,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(511,'Burmese (Myanmar [Burma])','မြန်မာ','my','my_MM',0,513,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(512,'Mazanderani','','mzn','mzn',0,514,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(513,'Mazanderani (Iran)','ایران','mzn','mzn_IR',0,515,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(514,'Nama','','naq','naq',0,516,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(515,'Nama (Namibia)','Namibiab','naq','naq_NA',0,517,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(516,'Norwegian Bokmål','','nb','nb',0,518,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(517,'Norwegian Bokmål (Norway)','Norge','nb','nb_NO',0,519,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(518,'Norwegian Bokmål (Svalbard & Jan Mayen)','Svalbard og Jan Mayen','nb','nb_SJ',0,520,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(519,'North Ndebele','','nd','nd',0,521,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(520,'North Ndebele (Zimbabwe)','Zimbabwe','nd','nd_ZW',0,522,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(521,'Low German','','nds','nds',0,523,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(522,'Low German (Germany)','DE','nds','nds_DE',0,524,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(523,'Low German (Netherlands)','NL','nds','nds_NL',0,525,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(524,'Nepali','','ne','ne',0,526,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(525,'Nepali (India)','भारत','ne','ne_IN',0,527,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(526,'Nepali (Nepal)','नेपाल','ne','ne_NP',0,528,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(527,'Dutch','','nl','nl',1,529,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(528,'Dutch (Aruba)','Aruba','nl','nl_AW',0,530,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(529,'Dutch (Belgium)','België','nl','nl_BE',0,531,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(530,'Dutch (Caribbean Netherlands)','Caribisch Nederland','nl','nl_BQ',0,532,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(531,'Dutch (Curaçao)','Curaçao','nl','nl_CW',0,533,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(532,'Dutch (Netherlands)','Nederland','nl','nl_NL',0,534,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(533,'Dutch (Suriname)','Suriname','nl','nl_SR',0,535,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(534,'Dutch (Sint Maarten)','Sint-Maarten','nl','nl_SX',0,536,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(535,'Kwasio','','nmg','nmg',0,537,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(536,'Kwasio (Cameroon)','Kamerun','nmg','nmg_CM',0,538,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(537,'Norwegian Nynorsk','','nn','nn',0,539,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(538,'Norwegian Nynorsk (Norway)','Noreg','nn','nn_NO',0,540,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(539,'Ngiemboon','','nnh','nnh',0,541,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(540,'Ngiemboon (Cameroon)','Kàmalûm','nnh','nnh_CM',0,542,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(541,'Nuer','','nus','nus',0,543,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(542,'Nuer (South Sudan)','SS','nus','nus_SS',0,544,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(543,'Nyankole','','nyn','nyn',0,545,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(544,'Nyankole (Uganda)','Uganda','nyn','nyn_UG',0,546,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(545,'Oromo','','om','om',0,547,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(546,'Oromo (Ethiopia)','Itoophiyaa','om','om_ET',0,548,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(547,'Oromo (Kenya)','Keeniyaa','om','om_KE',0,549,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(548,'Odia','','or','or',0,550,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(549,'Odia (India)','ଭାରତ','or','or_IN',0,551,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(550,'Ossetic','','os','os',0,552,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(551,'Ossetic (Georgia)','Гуырдзыстон','os','os_GE',0,553,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(552,'Ossetic (Russia)','Уӕрӕсе','os','os_RU',0,554,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(553,'Punjabi','','pa','pa',0,555,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(554,'Punjabi (Arabic)','','pa','pa_Arab',0,556,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(555,'Punjabi (Arabic, Pakistan)','پاکستان','pa','pa_Arab_PK',0,557,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(556,'Punjabi (Gurmukhi)','','pa','pa_Guru',0,558,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(557,'Punjabi (Gurmukhi, India)','ਭਾਰਤ','pa','pa_Guru_IN',0,559,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(558,'Polish','','pl','pl',1,560,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(559,'Polish (Poland)','Polska','pl','pl_PL',0,561,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(560,'Pashto','','ps','ps',0,562,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(561,'Pashto (Afghanistan)','افغانستان','ps','ps_AF',0,563,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(562,'Pashto (Pakistan)','پاکستان','ps','ps_PK',0,564,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(563,'Portuguese','','pt','pt',1,565,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(564,'Portuguese (Angola)','Angola','pt','pt_AO',0,566,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(565,'Portuguese (Brazil)','Brasil','pt','pt_BR',0,567,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(566,'Portuguese (Switzerland)','Suíça','pt','pt_CH',0,568,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(567,'Portuguese (Cape Verde)','Cabo Verde','pt','pt_CV',0,569,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(568,'Portuguese (Equatorial Guinea)','Guiné Equatorial','pt','pt_GQ',0,570,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(569,'Portuguese (Guinea-Bissau)','Guiné-Bissau','pt','pt_GW',0,571,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(570,'Portuguese (Luxembourg)','Luxemburgo','pt','pt_LU',0,572,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(571,'Portuguese (Macao SAR China)','Macau, RAE da China','pt','pt_MO',0,573,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(572,'Portuguese (Mozambique)','Moçambique','pt','pt_MZ',0,574,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(573,'Portuguese (Portugal)','Portugal','pt','pt_PT',0,575,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(574,'Portuguese (São Tomé & Príncipe)','São Tomé e Príncipe','pt','pt_ST',0,576,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(575,'Portuguese (Timor-Leste)','Timor-Leste','pt','pt_TL',0,577,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(576,'Quechua','','qu','qu',0,578,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(577,'Quechua (Bolivia)','Bolivia','qu','qu_BO',0,579,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(578,'Quechua (Ecuador)','Ecuador','qu','qu_EC',0,580,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(579,'Quechua (Peru)','Perú','qu','qu_PE',0,581,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(580,'Romansh','','rm','rm',0,582,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(581,'Romansh (Switzerland)','Svizra','rm','rm_CH',0,583,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(582,'Rundi','','rn','rn',0,584,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(583,'Rundi (Burundi)','Uburundi','rn','rn_BI',0,585,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(584,'Romanian','','ro','ro',0,586,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(585,'Romanian (Moldova)','Republica Moldova','ro','ro_MD',0,587,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(586,'Romanian (Romania)','România','ro','ro_RO',0,588,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(587,'Rombo','','rof','rof',0,589,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(588,'Rombo (Tanzania)','Tanzania','rof','rof_TZ',0,590,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(589,'Russian','','ru','ru',1,591,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(590,'Russian (Belarus)','Беларусь','ru','ru_BY',0,592,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(591,'Russian (Kyrgyzstan)','Киргизия','ru','ru_KG',0,593,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(592,'Russian (Kazakhstan)','Казахстан','ru','ru_KZ',0,594,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(593,'Russian (Moldova)','Молдова','ru','ru_MD',0,595,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(594,'Russian (Russia)','Россия','ru','ru_RU',0,596,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(595,'Russian (Ukraine)','Украина','ru','ru_UA',0,597,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(596,'Kinyarwanda','','rw','rw',0,598,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(597,'Kinyarwanda (Rwanda)','U Rwanda','rw','rw_RW',0,599,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(598,'Rwa','','rwk','rwk',0,600,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(599,'Rwa (Tanzania)','Tanzania','rwk','rwk_TZ',0,601,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(600,'Sakha','','sah','sah',0,602,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(601,'Sakha (Russia)','Арассыыйа','sah','sah_RU',0,603,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(602,'Samburu','','saq','saq',0,604,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(603,'Samburu (Kenya)','Kenya','saq','saq_KE',0,605,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(604,'Sangu','','sbp','sbp',0,606,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(605,'Sangu (Tanzania)','Tansaniya','sbp','sbp_TZ',0,607,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(606,'Sindhi','','sd','sd',0,608,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(607,'Sindhi (Pakistan)','پاڪستان','sd','sd_PK',0,609,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(608,'Northern Sami','','se','se',0,610,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(609,'Northern Sami (Finland)','Suopma','se','se_FI',0,611,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(610,'Northern Sami (Norway)','Norga','se','se_NO',0,612,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(611,'Northern Sami (Sweden)','Ruoŧŧa','se','se_SE',0,613,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(612,'Sena','','seh','seh',0,614,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(613,'Sena (Mozambique)','Moçambique','seh','seh_MZ',0,615,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(614,'Koyraboro Senni','','ses','ses',0,616,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(615,'Koyraboro Senni (Mali)','Maali','ses','ses_ML',0,617,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(616,'Sango','','sg','sg',0,618,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(617,'Sango (Central African Republic)','Ködörösêse tî Bêafrîka','sg','sg_CF',0,619,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(618,'Tachelhit','','shi','shi',0,620,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(619,'Tachelhit (Latin)','','shi','shi_Latn',0,621,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(620,'Tachelhit (Latin, Morocco)','lmɣrib','shi','shi_Latn_MA',0,622,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(621,'Tachelhit (Tifinagh)','','shi','shi_Tfng',0,623,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(622,'Tachelhit (Tifinagh, Morocco)','ⵍⵎⵖⵔⵉⴱ','shi','shi_Tfng_MA',0,624,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(623,'Sinhala','','si','si',0,625,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(624,'Sinhala (Sri Lanka)','ශ්‍රී ලංකාව','si','si_LK',0,626,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(625,'Slovak','','sk','sk',1,627,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(626,'Slovak (Slovakia)','Slovensko','sk','sk_SK',0,628,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(627,'Slovenian','','sl','sl',0,629,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(628,'Slovenian (Slovenia)','Slovenija','sl','sl_SI',0,630,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(629,'Inari Sami','','smn','smn',0,631,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(630,'Inari Sami (Finland)','Suomâ','smn','smn_FI',0,632,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(631,'Shona','','sn','sn',0,633,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(632,'Shona (Zimbabwe)','Zimbabwe','sn','sn_ZW',0,634,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(633,'Somali','','so','so',0,635,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(634,'Somali (Djibouti)','Jabuuti','so','so_DJ',0,636,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(635,'Somali (Ethiopia)','Itoobiya','so','so_ET',0,637,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(636,'Somali (Kenya)','Kenya','so','so_KE',0,638,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(637,'Somali (Somalia)','Soomaaliya','so','so_SO',0,639,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(638,'Albanian','','sq','sq',0,640,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(639,'Albanian (Albania)','Shqipëri','sq','sq_AL',0,641,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(640,'Albanian (North Macedonia)','Maqedonia e Veriut','sq','sq_MK',0,642,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(641,'Albanian (Kosovo)','Kosovë','sq','sq_XK',0,643,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(642,'Serbian','','sr','sr',0,644,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(643,'Serbian (Cyrillic)','','sr','sr_Cyrl',0,645,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(644,'Serbian (Cyrillic, Bosnia & Herzegovina)','Босна и Херцеговина','sr','sr_Cyrl_BA',0,646,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(645,'Serbian (Cyrillic, Montenegro)','Црна Гора','sr','sr_Cyrl_ME',0,647,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(646,'Serbian (Cyrillic, Serbia)','Србија','sr','sr_Cyrl_RS',0,648,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(647,'Serbian (Cyrillic, Kosovo)','Косово','sr','sr_Cyrl_XK',0,649,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(648,'Serbian (Latin)','','sr','sr_Latn',0,650,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(649,'Serbian (Latin, Bosnia & Herzegovina)','Bosna i Hercegovina','sr','sr_Latn_BA',0,651,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(650,'Serbian (Latin, Montenegro)','Crna Gora','sr','sr_Latn_ME',0,652,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(651,'Serbian (Latin, Serbia)','Srbija','sr','sr_Latn_RS',0,653,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(652,'Serbian (Latin, Kosovo)','Kosovo','sr','sr_Latn_XK',0,654,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(653,'Swedish','','sv','sv',0,655,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(654,'Swedish (Åland Islands)','Åland','sv','sv_AX',0,656,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(655,'Swedish (Finland)','Finland','sv','sv_FI',0,657,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(656,'Swedish (Sweden)','Sverige','sv','sv_SE',0,658,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(657,'Swahili','','sw','sw',0,659,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(658,'Swahili (Congo - Kinshasa)','Jamhuri ya Kidemokrasia ya Kongo','sw','sw_CD',0,660,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(659,'Swahili (Kenya)','Kenya','sw','sw_KE',0,661,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(660,'Swahili (Tanzania)','Tanzania','sw','sw_TZ',0,662,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(661,'Swahili (Uganda)','Uganda','sw','sw_UG',0,663,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(662,'Tamil','','ta','ta',0,664,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(663,'Tamil (India)','இந்தியா','ta','ta_IN',0,665,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(664,'Tamil (Sri Lanka)','இலங்கை','ta','ta_LK',0,666,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(665,'Tamil (Malaysia)','மலேசியா','ta','ta_MY',0,667,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(666,'Tamil (Singapore)','சிங்கப்பூர்','ta','ta_SG',0,668,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(667,'Telugu','','te','te',0,669,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(668,'Telugu (India)','భారతదేశం','te','te_IN',0,670,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(669,'Teso','','teo','teo',0,671,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(670,'Teso (Kenya)','Kenia','teo','teo_KE',0,672,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(671,'Teso (Uganda)','Uganda','teo','teo_UG',0,673,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(672,'Tajik','','tg','tg',0,674,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(673,'Tajik (Tajikistan)','Тоҷикистон','tg','tg_TJ',0,675,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(674,'Thai','','th','th',0,676,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(675,'Thai (Thailand)','ไทย','th','th_TH',0,677,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(676,'Tigrinya','','ti','ti',0,678,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(677,'Tigrinya (Eritrea)','ኤርትራ','ti','ti_ER',0,679,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(678,'Tigrinya (Ethiopia)','ኢትዮጵያ','ti','ti_ET',0,680,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(679,'Turkmen','','tk','tk',0,681,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(680,'Turkmen (Turkmenistan)','Türkmenistan','tk','tk_TM',0,682,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(681,'Tongan','','to','to',0,683,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(682,'Tongan (Tonga)','Tonga','to','to_TO',0,684,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(683,'Turkish','','tr','tr',0,685,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(684,'Turkish (Cyprus)','Kıbrıs','tr','tr_CY',0,686,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(685,'Turkish (Turkey)','Türkiye','tr','tr_TR',0,687,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(686,'Tatar','','tt','tt',0,688,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(687,'Tatar (Russia)','Россия','tt','tt_RU',0,689,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(688,'Tasawaq','','twq','twq',0,690,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(689,'Tasawaq (Niger)','Nižer','twq','twq_NE',0,691,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(690,'Central Atlas Tamazight','','tzm','tzm',0,692,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(691,'Central Atlas Tamazight (Morocco)','Meṛṛuk','tzm','tzm_MA',0,693,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(692,'Uyghur','','ug','ug',0,694,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(693,'Uyghur (China)','جۇڭگو','ug','ug_CN',0,695,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(694,'Ukrainian','','uk','uk',0,696,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(695,'Ukrainian (Ukraine)','Україна','uk','uk_UA',0,697,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(696,'Urdu','','ur','ur',0,698,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(697,'Urdu (India)','بھارت','ur','ur_IN',0,699,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(698,'Urdu (Pakistan)','پاکستان','ur','ur_PK',0,700,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(699,'Uzbek','','uz','uz',0,701,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(700,'Uzbek (Arabic)','','uz','uz_Arab',0,702,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(701,'Uzbek (Arabic, Afghanistan)','افغانستان','uz','uz_Arab_AF',0,703,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(702,'Uzbek (Cyrillic)','','uz','uz_Cyrl',0,704,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(703,'Uzbek (Cyrillic, Uzbekistan)','Ўзбекистон','uz','uz_Cyrl_UZ',0,705,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(704,'Uzbek (Latin)','','uz','uz_Latn',0,706,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(705,'Uzbek (Latin, Uzbekistan)','Oʻzbekiston','uz','uz_Latn_UZ',0,707,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(706,'Vai','','vai','vai',0,708,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(707,'Vai (Latin)','','vai','vai_Latn',0,709,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(708,'Vai (Latin, Liberia)','Laibhiya','vai','vai_Latn_LR',0,710,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(709,'Vai (Vai)','','vai','vai_Vaii',0,711,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(710,'Vai (Vai, Liberia)','ꕞꔤꔫꕩ','vai','vai_Vaii_LR',0,712,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(711,'Vietnamese','','vi','vi',0,713,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(712,'Vietnamese (Vietnam)','Việt Nam','vi','vi_VN',0,714,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(713,'Vunjo','','vun','vun',0,715,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(714,'Vunjo (Tanzania)','Tanzania','vun','vun_TZ',0,716,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(715,'Walser','','wae','wae',0,717,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(716,'Walser (Switzerland)','Schwiz','wae','wae_CH',0,718,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(717,'Wolof','','wo','wo',0,719,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(718,'Wolof (Senegal)','Senegaal','wo','wo_SN',0,720,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(719,'Xhosa','','xh','xh',0,721,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(720,'Xhosa (South Africa)','eMzantsi Afrika','xh','xh_ZA',0,722,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(721,'Soga','','xog','xog',0,723,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(722,'Soga (Uganda)','Yuganda','xog','xog_UG',0,724,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(723,'Yangben','','yav','yav',0,725,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(724,'Yangben (Cameroon)','Kemelún','yav','yav_CM',0,726,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(725,'Yiddish','','yi','yi',0,727,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(726,'Yiddish (World)','וועלט','yi','yi_001',0,728,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(727,'Yoruba','','yo','yo',0,729,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(728,'Yoruba (Benin)','Orílɛ́ède Bɛ̀nɛ̀','yo','yo_BJ',0,730,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(729,'Yoruba (Nigeria)','Orilẹ̀-èdè Nàìjíríà','yo','yo_NG',0,731,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(730,'Cantonese','','yue','yue',0,732,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(731,'Cantonese (Simplified)','','yue','yue_Hans',0,733,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(732,'Cantonese (Simplified, China)','中华人民共和国','yue','yue_Hans_CN',0,734,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(733,'Cantonese (Traditional)','','yue','yue_Hant',0,735,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(734,'Cantonese (Traditional, Hong Kong SAR China)','中華人民共和國香港特別行政區','yue','yue_Hant_HK',0,736,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(735,'Standard Moroccan Tamazight','','zgh','zgh',0,737,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(736,'Standard Moroccan Tamazight (Morocco)','ⵍⵎⵖⵔⵉⴱ','zgh','zgh_MA',0,738,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(737,'Chinese','','zh','zh',1,739,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(738,'Chinese (Simplified)','','zh','zh_Hans',0,740,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(739,'Chinese (Simplified, China)','中国','zh','zh_Hans_CN',0,741,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(740,'Chinese (Simplified, Hong Kong SAR China)','中国香港特别行政区','zh','zh_Hans_HK',0,742,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(741,'Chinese (Simplified, Macao SAR China)','中国澳门特别行政区','zh','zh_Hans_MO',0,743,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(742,'Chinese (Simplified, Singapore)','新加坡','zh','zh_Hans_SG',0,744,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(743,'Chinese (Traditional)','','zh','zh_Hant',0,745,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(744,'Chinese (Traditional, Hong Kong SAR China)','中國香港特別行政區','zh','zh_Hant_HK',0,746,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(745,'Chinese (Traditional, Macao SAR China)','中國澳門特別行政區','zh','zh_Hant_MO',0,747,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(746,'Chinese (Traditional, Taiwan)','台灣','zh','zh_Hant_TW',0,748,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(747,'Zulu','','zu','zu',0,749,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL),(748,'Zulu (South Africa)','iNingizimu Afrika','zu','zu_ZA',0,750,'2019-10-26 16:05:41',NULL,'2019-10-26 16:05:41',NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `menu_id` int(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `description` text,
  `link` varchar(255) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `rel` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `visibility_roles` text,
  `params` text,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (5,NULL,4,'About','about','','plugin:Croogo%2fNodes/controller:Nodes/action:view/type:page/slug:about','','',1,3,4,'','',NULL,NULL,'2009-10-06 23:14:21',NULL,'2009-08-19 12:23:33',NULL),(6,NULL,4,'Contact','contact','','plugin:Croogo%2fContacts/controller:Contacts/action:view/contact','','',1,5,6,'','',NULL,NULL,'2009-10-06 23:14:45',NULL,'2009-08-19 12:34:56',NULL),(7,NULL,3,'Home','home','','plugin:Croogo%2fNodes/controller:Nodes/action:promoted','','',1,5,6,'','',NULL,NULL,'2009-10-06 21:17:06',NULL,'2009-09-06 21:32:54',NULL),(8,NULL,3,'About','about','','plugin:Croogo%2fNodes/controller:Nodes/action:view/type:page/slug:about','','',1,7,10,'','',NULL,NULL,'2009-09-12 03:45:53',NULL,'2009-09-06 21:34:57',NULL),(9,8,3,'Child link','child-link','','#','','',0,8,9,'','',NULL,NULL,'2009-10-06 23:13:06',NULL,'2009-09-12 03:52:23',NULL),(10,NULL,5,'Site Admin','site-admin','','/admin','','',1,1,2,'','',NULL,NULL,'2009-09-12 06:34:09',NULL,'2009-09-12 06:34:09',NULL),(11,NULL,5,'Log out','log-out','','/plugin:Croogo%2fUsers/controller:Users/action:logout','','',1,7,8,'[\"1\",\"2\"]','',NULL,NULL,'2009-09-12 06:35:22',NULL,'2009-09-12 06:34:41',NULL),(12,NULL,6,'Croogo','croogo','','http://www.croogo.org','','',1,3,4,'','',NULL,NULL,'2009-09-12 23:31:59',NULL,'2009-09-12 23:31:59',NULL),(14,NULL,6,'CakePHP','cakephp','','http://www.cakephp.org','','',1,1,2,'','',NULL,NULL,'2009-10-07 03:25:25',NULL,'2009-09-12 23:38:43',NULL),(15,NULL,3,'Contact','contact','','/plugin:Croogo%2fContacts/controller:Contacts/action:view/contact','','',1,11,12,'','',NULL,NULL,'2009-09-16 07:54:13',NULL,'2009-09-16 07:53:33',NULL),(16,NULL,5,'Entries (RSS)','entries-rss','','plugin:Croogo%2fNodes/controller:Nodes/action:promoted/_ext:rss','','',1,3,4,'','',NULL,NULL,'2009-10-27 17:46:22',NULL,'2009-10-27 17:46:22',NULL),(17,NULL,5,'Comments (RSS)','comments-rss','','plugin:Croogo%2fComments/controller:Comments/action:index/_ext:rss','','',0,5,6,'','',NULL,NULL,'2009-10-27 17:46:54',NULL,'2009-10-27 17:46:54',NULL);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `link_count` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`(190))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (3,'Main Menu','main','','',1,NULL,4,'',NULL,NULL,'2009-08-19 12:21:06',NULL,'2009-07-22 01:49:53',NULL),(4,'Footer','footer','','',1,NULL,2,'',NULL,NULL,'2009-08-19 12:22:42',NULL,'2009-08-19 12:22:42',NULL),(5,'Meta','meta','','',1,NULL,4,'',NULL,NULL,'2009-09-12 06:33:29',NULL,'2009-09-12 06:33:29',NULL),(6,'Blogroll','blogroll','','',1,NULL,2,'',NULL,NULL,'2009-09-12 23:30:24',NULL,'2009-09-12 23:30:24',NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `message_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta`
--

DROP TABLE IF EXISTS `meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL DEFAULT 'Node',
  `foreign_key` int(20) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  `weight` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta`
--

LOCK TABLES `meta` WRITE;
/*!40000 ALTER TABLE `meta` DISABLE KEYS */;
INSERT INTO `meta` VALUES (1,'Croogo/Nodes.Nodes',1,'meta_keywords','key1, key2',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_taxonomies`
--

DROP TABLE IF EXISTS `model_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_taxonomies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL,
  `foreign_key` int(20) NOT NULL,
  `taxonomy_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `model` (`model`,`foreign_key`,`taxonomy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_taxonomies`
--

LOCK TABLES `model_taxonomies` WRITE;
/*!40000 ALTER TABLE `model_taxonomies` DISABLE KEYS */;
INSERT INTO `model_taxonomies` VALUES (1,'Croogo/Nodes.Nodes',1,1);
/*!40000 ALTER TABLE `model_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `description` text,
  `status` smallint(2) NOT NULL DEFAULT '0',
  `is_accepted` smallint(2) NOT NULL DEFAULT '0',
  `date_from` int(11) DEFAULT NULL,
  `date_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--


--
-- Table structure for table `newsletters_articles`
--

DROP TABLE IF EXISTS `newsletters_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletter_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters_articles`
--


--
-- Table structure for table `newsletters_messages`
--

DROP TABLE IF EXISTS `newsletters_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletter_id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `status` smallint(2) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters_messages`
--


--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `user_id` int(20) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `excerpt` text,
  `status` int(1) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `comment_status` int(1) NOT NULL DEFAULT '1',
  `comment_count` int(11) DEFAULT '0',
  `promote` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `terms` text,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `visibility_roles` text,
  `type` varchar(100) NOT NULL DEFAULT 'node',
  `publish_start` datetime DEFAULT NULL,
  `publish_end` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,NULL,1,'Hello World','hello-world','<p>Welcome to Croogo. This is your first post. You can edit or delete it from the admin panel.</p>','',1,'',2,1,1,'/blog/hello-world','{\"1\":\"uncategorized\"}',0,1,2,'','blog',NULL,NULL,'2009-12-25 11:00:00',NULL,'2009-12-25 11:00:00',NULL),(2,NULL,1,'About','about','<p>This is an example of a Croogo page, you could edit this to put information about yourself or your site.</p>','',1,'',0,0,0,'/about','',0,1,2,'','page',NULL,NULL,'2009-12-25 22:00:00',NULL,'2009-12-25 22:00:00',NULL);
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `article_id` bigint(255) NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint(255) NOT NULL DEFAULT '0',
  `counter_up_vote` int(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(11) DEFAULT NULL,
  `is_deleted_by` bigint(255) NOT NULL DEFAULT '0',
  `is_edited` smallint(2) NOT NULL DEFAULT '0',
  `is_edited_by` bigint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_comments`
--

DROP TABLE IF EXISTS `notes_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes_comments` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(255) DEFAULT NULL,
  `user_id` bigint(255) NOT NULL,
  `note_id` bigint(255) NOT NULL,
  `description` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `article_id` bigint(255) NOT NULL,
  `is_deleted` tinyint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_comments`
--

LOCK TABLES `notes_comments` WRITE;
/*!40000 ALTER TABLE `notes_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` smallint(255) NOT NULL,
  `content_message` text,
  `content_id` bigint(20) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `content_type_id` bigint(255) NOT NULL,
  `notice_type_id` bigint(255) NOT NULL,
  `is_deleted` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices_emails`
--

DROP TABLE IF EXISTS `notices_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `content_message` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `notice_type_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `time_to_send` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices_emails`
--


--
-- Table structure for table `notices_statuses`
--

DROP TABLE IF EXISTS `notices_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices_statuses` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  `notice_id` bigint(11) NOT NULL,
  `status` smallint(255) NOT NULL,
  `is_deleted` smallint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `description` text,
  `block_count` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (3,'none','none','',0,NULL,NULL,NULL,NULL),(4,'right','right','',6,NULL,NULL,NULL,NULL),(6,'left','left','',0,NULL,NULL,NULL,NULL),(7,'header','header','',0,NULL,NULL,NULL,NULL),(8,'footer','footer','',0,NULL,NULL,NULL,NULL),(9,'region1','region1','',0,NULL,NULL,NULL,NULL),(10,'region2','region2','',0,NULL,NULL,NULL,NULL),(11,'region3','region3','',0,NULL,NULL,NULL,NULL),(12,'region4','region4','',0,NULL,NULL,NULL,NULL),(13,'region5','region5','',0,NULL,NULL,NULL,NULL),(14,'region6','region6','',0,NULL,NULL,NULL,NULL),(15,'region7','region7','',0,NULL,NULL,NULL,NULL),(16,'region8','region8','',0,NULL,NULL,NULL,NULL),(17,'region9','region9','',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejects`
--

DROP TABLE IF EXISTS `rejects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rejects` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `article_id` bigint(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `archived` smallint(3) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejects`
--

LOCK TABLES `rejects` WRITE;
/*!40000 ALTER TABLE `rejects` DISABLE KEYS */;
/*!40000 ALTER TABLE `rejects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejects_comments`
--

DROP TABLE IF EXISTS `rejects_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rejects_comments` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(255) DEFAULT NULL,
  `user_id` bigint(255) NOT NULL,
  `reject_id` bigint(255) NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint(2) NOT NULL DEFAULT '0',
  `article_id` bigint(11) NOT NULL,
  `is_deleted_by` bigint(255) NOT NULL DEFAULT '0',
  `is_edited` smallint(2) NOT NULL DEFAULT '0',
  `is_edited_by` bigint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejects_comments`
--

LOCK TABLES `rejects_comments` WRITE;
/*!40000 ALTER TABLE `rejects_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `rejects_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `report_type_id` smallint(255) NOT NULL,
  `report_content_type_id` bigint(255) NOT NULL,
  `content_id` bigint(255) NOT NULL,
  `message` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` smallint(2) NOT NULL,
  `report_status` smallint(2) NOT NULL DEFAULT '0',
  `report_level` smallint(2) NOT NULL DEFAULT '1',
  `moderated_by` bigint(11) NOT NULL DEFAULT '0',
  `report_contact_time` Int( 11 ) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_history`
--

DROP TABLE IF EXISTS `reports_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_history` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `report_id` bigint(11) NOT NULL,
  `moderated_by` bigint(11) NOT NULL,
  `message` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_history`
--

LOCK TABLES `reports_history` WRITE;
/*!40000 ALTER TABLE `reports_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_statuses`
--

DROP TABLE IF EXISTS `reports_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_statuses` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_statuses`
--

LOCK TABLES `reports_statuses` WRITE;
/*!40000 ALTER TABLE `reports_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `article_id` bigint(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_comments`
--

DROP TABLE IF EXISTS `reviews_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_comments` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(255) DEFAULT NULL,
  `user_id` bigint(255) NOT NULL,
  `review_id` bigint(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_comments`
--

LOCK TABLES `reviews_comments` WRITE;
/*!40000 ALTER TABLE `reviews_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SuperAdmin','superadmin','2009-04-05 00:10:34',NULL,'2009-04-05 00:10:34',NULL),(2,'Registered','registered','2009-04-05 00:10:50',NULL,'2009-04-06 05:20:38',NULL),(3,'Public','public','2009-04-05 00:12:38',NULL,'2009-04-07 01:41:45',NULL),(4,'Admin','admin','2017-01-18 01:39:00',NULL,'2017-01-18 01:39:00',NULL),(6,'Publisher I','publisher-i',NULL,NULL,NULL,NULL),(7,'Publisher II','publisher-ii',NULL,NULL,NULL,NULL),(8,'Accept','accept',NULL,NULL,NULL,NULL),(9,'Editor','editor',NULL,NULL,NULL,NULL),(10,'Settle I','settle-i',NULL,NULL,NULL,NULL),(11,'Settle IV','settle-iv',NULL,NULL,NULL,NULL),(12,'Blocked II','blocked-ii',NULL,NULL,NULL,NULL),(13,'Give permission II','give-permission-ii',NULL,NULL,NULL,NULL),(14,'Set Banner','set-banner',NULL,NULL,NULL,NULL),(16,'Newsletter accept','newsletter-accept',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_blocks`
--

DROP TABLE IF EXISTS `roles_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_blocks` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  `roles` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `report_id` bigint(11) NOT NULL,
  `is_unblocked` tinyint(2) NOT NULL DEFAULT '0',
  `blocked_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `granted_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (5,5,4,NULL,NULL,NULL),(6,5,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `input_type` varchar(255) NOT NULL DEFAULT 'text',
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `weight` int(11) DEFAULT NULL,
  `params` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (6,'Site.title','CryptoResearch','','','',1,1,'',NULL,NULL,NULL,1),(7,'Site.tagline','A CakePHP powered Content Management System.','','','textarea',1,2,'',NULL,NULL,NULL,1),(8,'Site.email','you@your-site.com','','','',1,3,'',NULL,NULL,NULL,1),(9,'Site.status','1','','','checkbox',1,6,'',NULL,NULL,NULL,1),(12,'Meta.robots','index, follow','','','',1,6,'',NULL,NULL,NULL,NULL),(13,'Meta.keywords','croogo, Croogo','','','textarea',1,7,'',NULL,NULL,NULL,NULL),(14,'Meta.description','Croogo - A CakePHP powered Content Management System','','','textarea',1,8,'',NULL,NULL,NULL,NULL),(15,'Meta.generator','Croogo - Content Management System','','','',0,9,'',NULL,NULL,NULL,NULL),(16,'Service.akismet_key','your-key','','','',1,11,'',NULL,NULL,NULL,NULL),(17,'Service.recaptcha_public_key','your-public-key','','','',1,12,'',NULL,NULL,NULL,NULL),(18,'Service.recaptcha_private_key','your-private-key','','','',1,13,'',NULL,NULL,NULL,NULL),(19,'Service.akismet_url','http://your-blog.com','','','',1,10,'',NULL,NULL,NULL,NULL),(20,'Site.theme','CryptoTheme','','','',0,14,'',NULL,NULL,NULL,1),(21,'Site.feed_url','','','','',0,15,'',NULL,NULL,NULL,NULL),(22,'Reading.nodes_per_page','5','','','',1,16,'',NULL,NULL,NULL,NULL),(23,'Writing.wysiwyg','1','Enable WYSIWYG editor','','checkbox',1,17,'',NULL,NULL,NULL,NULL),(24,'Comment.level','1','','levels deep (threaded comments)','',1,18,'',NULL,NULL,NULL,NULL),(25,'Comment.feed_limit','10','','number of comments to show in feed','',1,19,'',NULL,NULL,NULL,NULL),(26,'Site.locale','en_US','','','text',1,20,'',NULL,NULL,NULL,1),(27,'Reading.date_time_format','EEE, MMM dd yyyy HH:mm:ss','','','',1,21,'',NULL,NULL,NULL,NULL),(28,'Comment.date_time_format','MMM dd, yyyy','','','',1,22,'',NULL,NULL,NULL,NULL),(29,'Site.timezone','UTC','','Provide a valid timezone identifier as specified in https://php.net/manual/en/timezones.php','select',1,4,'optionClass=Croogo/Settings.Timezones',NULL,NULL,NULL,1),(32,'Hook.bootstraps','Croogo/Settings,Croogo/Contacts,Croogo/Nodes,Croogo/Meta,Croogo/Menus,Croogo/Users,Croogo/Blocks,Croogo/Taxonomy,Croogo/FileManager,Croogo/Wysiwyg,Croogo/Dashboards,Croogo/Translate','','','',0,23,'',NULL,NULL,NULL,1),(33,'Comment.email_notification','1','Enable email notification','','checkbox',1,24,'',NULL,NULL,NULL,NULL),(34,'Access Control.multiRole','1','Enable Multiple Roles','','checkbox',1,25,'',NULL,NULL,NULL,1),(35,'Access Control.rowLevel','0','Row Level Access Control','','checkbox',1,26,'',NULL,NULL,NULL,1),(36,'Access Control.autoLoginDuration','+1 week','\"Remember Me\" Duration','Eg: +1 day, +1 week. Leave empty to disable.','text',1,27,'',NULL,NULL,NULL,1),(37,'Access Control.models','','Models with Row Level Acl','Select models to activate Row Level Access Control on','multiple',1,26,'multiple=checkbox\noptions={\"Croogo/Nodes.Nodes\": \"Nodes\", \"Croogo/Blocks.Blocks\": \"Blocks\", \"Croogo/Menus.Menus\": \"Menus\", \"Croogo/Menus.Links\": \"Links\"}',NULL,NULL,NULL,1),(38,'Site.ipWhitelist','127.0.0.1','Whitelisted IP Addresses','Separate multiple IP addresses with comma','text',1,27,'',NULL,NULL,NULL,1),(39,'Site.asset_timestamp','force','Asset timestamp','Appends a timestamp which is last modified time of the particular file at the end of asset files URLs (CSS, JavaScript, Image). Useful to prevent visitors to visit the site with an outdated version of these files in their browser cache.','radio',1,28,'options={\"0\": \"Disabled\", \"1\": \"Enabled in debug mode only\", \"force\": \"Always enabled\"}',NULL,NULL,NULL,1),(40,'Site.admin_theme','Croogo/Core','Administration Theme','','text',1,29,'',NULL,NULL,NULL,1),(41,'Site.home_url','','Home Url','Default action for home page in link string format.','text',1,30,'',NULL,NULL,NULL,1),(42,'Croogo.version','','Croogo Version','','text',0,31,'',NULL,NULL,NULL,NULL),(43,'Croogo.appVersion','','App Version','','text',0,31,'',NULL,NULL,NULL,NULL),(44,'Theme.bgImagePath','','Background Image','','file',1,32,'',NULL,NULL,NULL,NULL),(45,'Access Control.splitSession','0','Separate front-end and admin session','','checkbox',1,32,'',NULL,NULL,NULL,1),(46,'Croogo.installed','1','','','',0,0,'',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_profiles`
--

DROP TABLE IF EXISTS `social_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `access_token` blob NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `birth_date` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_profiles`
--


--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `rodo` boolean NOT NULL DEFAULT true,
  `language` varchar(3) NOT NULL DEFAULT 'pl',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--


--
-- Table structure for table `taxonomies`
--

DROP TABLE IF EXISTS `taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `term_id` int(10) NOT NULL,
  `vocabulary_id` int(10) NOT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomies`
--

LOCK TABLES `taxonomies` WRITE;
/*!40000 ALTER TABLE `taxonomies` DISABLE KEYS */;
INSERT INTO `taxonomies` VALUES (1,NULL,1,1,1,2),(2,NULL,2,1,3,4),(3,NULL,3,2,1,2);
/*!40000 ALTER TABLE `taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`(190))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'Uncategorized','uncategorized','','2009-07-22 03:38:43',NULL,'2009-07-22 03:34:56',NULL),(2,'Announcements','announcements','','2010-05-16 23:57:06',NULL,'2009-07-22 03:45:37',NULL),(3,'mytag','mytag','','2009-08-26 14:42:43',NULL,'2009-08-26 14:42:43',NULL);
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text,
  `format_show_author` tinyint(1) NOT NULL DEFAULT '1',
  `format_show_date` tinyint(1) NOT NULL DEFAULT '1',
  `format_use_wysiwyg` tinyint(1) NOT NULL DEFAULT '1',
  `comment_status` int(1) NOT NULL DEFAULT '1',
  `comment_approve` tinyint(1) NOT NULL DEFAULT '1',
  `comment_spam_protection` tinyint(1) NOT NULL DEFAULT '0',
  `comment_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `params` text,
  `plugin` varchar(255) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`(190))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Page','page','A page is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a page entry does not allow visitor comments.',0,0,1,0,1,0,0,'routes=true',NULL,'2009-09-09 00:23:24',NULL,'2009-09-02 18:06:27',NULL),(2,'Blog','blog','A blog entry is a single post to an online journal, or blog.',1,1,1,2,1,0,0,'routes=true',NULL,'2009-09-15 12:15:43',NULL,'2009-09-02 18:20:44',NULL),(3,'Attachment','attachment',NULL,1,1,1,1,1,0,0,NULL,'Croogo/FileManager','2019-10-26 00:00:00',NULL,'2019-10-26 00:00:00',NULL),(4,'Node','node','Default content type.',1,1,1,2,1,0,0,'routes=true',NULL,'2009-10-06 21:53:15',NULL,'2009-09-05 23:51:56',NULL);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_articles`
--

DROP TABLE IF EXISTS `types_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_articles` (
  `id` smallint(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_articles`
--

LOCK TABLES `types_articles` WRITE;
/*!40000 ALTER TABLE `types_articles` DISABLE KEYS */;
INSERT INTO `types_articles` VALUES (1,'Article'),(2,'Question'),(3,'News');
/*!40000 ALTER TABLE `types_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_vocabularies`
--

DROP TABLE IF EXISTS `types_vocabularies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_vocabularies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(20) NOT NULL,
  `vocabulary_id` int(20) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_id` (`type_id`,`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_vocabularies`
--

LOCK TABLES `types_vocabularies` WRITE;
/*!40000 ALTER TABLE `types_vocabularies` DISABLE KEYS */;
INSERT INTO `types_vocabularies` VALUES (24,4,1,NULL),(25,4,2,NULL),(30,2,1,NULL),(31,2,2,NULL);
/*!40000 ALTER TABLE `types_vocabularies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `activation_key` varchar(60) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `bio` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `timezone` varchar(40) NOT NULL DEFAULT 'UTC',
  `created_by` int(20) DEFAULT NULL,
  `attributes` text,
  `is_blocked` tinyint(2) NOT NULL DEFAULT '0',
  `is_blocked_time` int(11) NOT NULL DEFAULT '0',
  `is_blocked_period` int(11) NOT NULL DEFAULT '0',
  `is_blocked_by` int(11) NOT NULL DEFAULT '0',
  `is_blocked_reason` varchar(255) DEFAULT NULL,
  `is_first_login` tinyint(2) NOT NULL DEFAULT '0',
  `ref_link` varchar(255) DEFAULT NULL,
  `ref_link_user_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','$2y$10$XrY1MX1qjfMp36iM5OrOZeUuC1Ok8hvQStFwIp3Olh58aqUMIYVda','admin','',NULL,'da0ace2fd5db7fbe74a87ac6f3920884',NULL,NULL,1,'2019-10-26 16:06:22',NULL,'2019-10-26 16:06:22','UTC',NULL,NULL,0,0,0,0,'',0,NULL,NULL),(5,2,'jakub@test.com','$2y$10$8j3rPxLxtglDWf8MC8gEfe6Z36ENmN41KfnpP2cFY6BJHcrkf2Rmu','Page name','jakub@test.com','',NULL,'cryptocurrency_thinkstock_821299476_100749429_large.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.TEST',1,'2020-02-29 08:50:48',NULL,'2019-10-29 21:11:11','UTC',NULL,'{\"accepts\":{\"inbox\":\"0\",\"mail\":\"1\",\"frequency\":\"1\"},\"rejects\":{\"inbox\":\"0\",\"mail\":\"0\",\"frequency\":\"0\"},\"rejects_comments\":{\"inbox\":\"1\",\"mail\":\"1\",\"frequency\":\"0\"},\"newsletter\":{\"mail\":\"1\",\"frequency\":\"0\"}}',0,0,0,0,'',0,'$2y$10$dRArBrsuxL4v3GRcPWUqUORf1x7Cvv6OoH7j0hNe07cRRYqP0glEK',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabularies`
--

DROP TABLE IF EXISTS `vocabularies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabularies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `tags` tinyint(1) NOT NULL DEFAULT '0',
  `plugin` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`(190))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabularies`
--

LOCK TABLES `vocabularies` WRITE;
/*!40000 ALTER TABLE `vocabularies` DISABLE KEYS */;
INSERT INTO `vocabularies` VALUES (1,'Categories','categories','',0,1,0,NULL,1,'2010-05-17 20:03:11',NULL,'2009-07-22 02:16:21',NULL),(2,'Tags','tags','',0,1,0,NULL,2,'2010-05-17 20:03:11',NULL,'2009-07-22 02:16:34',NULL);
/*!40000 ALTER TABLE `vocabularies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) NOT NULL,
  `article_id` bigint(255) NOT NULL,
  `status` smallint(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes_notes`
--

DROP TABLE IF EXISTS `votes_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes_notes`
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-03 16:42:32
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `articles_admin_edit_history`
--

CREATE TABLE `articles_admin_edit_history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `article_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `articles_admin_edit_history`
--
ALTER TABLE `articles_admin_edit_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `articles_admin_edit_history`
--
ALTER TABLE `articles_admin_edit_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Struktura tabeli dla tabeli `users_subscriptions`
--

CREATE TABLE `users_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `sub_user_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `users_subscriptions`
--
ALTER TABLE `users_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `users_subscriptions`
--
ALTER TABLE `users_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Struktura tabeli dla tabeli `articles_subscriptions`
--

CREATE TABLE `articles_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `article_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `articles_subscriptions`
--
ALTER TABLE `articles_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `articles_subscriptions`
--
ALTER TABLE `articles_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Struktura tabeli dla tabeli `notes_subscriptions`
--

CREATE TABLE `notes_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `note_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `notes_subscriptions`
--
ALTER TABLE `notes_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `notes_subscriptions`
--
ALTER TABLE `notes_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Struktura tabeli dla tabeli `comments_subscriptions`
--

CREATE TABLE `comments_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `comments_subscriptions`
--
ALTER TABLE `comments_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `comments_subscriptions`
--
ALTER TABLE `comments_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Struktura tabeli dla tabeli `categories_subscriptions`
--

CREATE TABLE `categories_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories_subscriptions`
--
ALTER TABLE `categories_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `categories_subscriptions`
--
ALTER TABLE `categories_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

--
-- Struktura tabeli dla tabeli `notices_subscriptions`
--

CREATE TABLE `notices_subscriptions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `notice_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `notices_subscriptions`
--
ALTER TABLE `notices_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `notices_subscriptions`
--
ALTER TABLE `notices_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;


ALTER TABLE `banners` ADD `updated_by2` INT NULL DEFAULT NULL AFTER `created_by`;