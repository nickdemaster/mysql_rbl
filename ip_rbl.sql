-- MySQL dump 10.13  Distrib 5.6.21, for osx10.10 (x86_64)
--
-- Host: localhost    Database: ip_rbl
-- ------------------------------------------------------
-- Server version	5.6.12-enterprise-commercial-advanced

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
-- Current Database: `ip_rbl`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ip_rbl` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ip_rbl`;

--
-- Table structure for table `bl_ipaddr`
--

DROP TABLE IF EXISTS `bl_ipaddr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_ipaddr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr` int(11) unsigned NOT NULL COMMENT 'inet_ntoa',
  `cidr` smallint(6) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '1',
  `reason` varchar(255) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bl_ipaddr_cidr` (`ipaddr`,`cidr`),
  KEY `idx_ipaddr_time` (`ipaddr`,`expiration`,`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_ipaddr`
--

LOCK TABLES `bl_ipaddr` WRITE;
/*!40000 ALTER TABLE `bl_ipaddr` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_ipaddr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_ipaddr_platform_xref`
--

DROP TABLE IF EXISTS `bl_ipaddr_platform_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_ipaddr_platform_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bl_platform_unique` (`ipaddr_id`,`platform_id`),
  KEY `fk_bl_platform_idx` (`platform_id`),
  KEY `fk_bl_ipaddr_idx` (`ipaddr_id`),
  CONSTRAINT `fk_bl_ipaddr` FOREIGN KEY (`ipaddr_id`) REFERENCES `bl_ipaddr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_platform` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_ipaddr_platform_xref`
--

LOCK TABLES `bl_ipaddr_platform_xref` WRITE;
/*!40000 ALTER TABLE `bl_ipaddr_platform_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_ipaddr_platform_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bl_ipaddr_service_xref`
--

DROP TABLE IF EXISTS `bl_ipaddr_service_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bl_ipaddr_service_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bl_service_unique` (`ipaddr_id`,`service_id`),
  KEY `fk_bl_service_idx` (`service_id`),
  KEY `fk_bl_service_ipaddr_idx` (`ipaddr_id`),
  CONSTRAINT `fk_bl_service_ipaddr` FOREIGN KEY (`ipaddr_id`) REFERENCES `bl_ipaddr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bl_ipaddr_service_xref`
--

LOCK TABLES `bl_ipaddr_service_xref` WRITE;
/*!40000 ALTER TABLE `bl_ipaddr_service_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `bl_ipaddr_service_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bl_platform_orphans`
--

DROP TABLE IF EXISTS `bl_platform_orphans`;
/*!50001 DROP VIEW IF EXISTS `bl_platform_orphans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bl_platform_orphans` AS SELECT 
 1 AS `IP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bl_service_orphans`
--

DROP TABLE IF EXISTS `bl_service_orphans`;
/*!50001 DROP VIEW IF EXISTS `bl_service_orphans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bl_service_orphans` AS SELECT 
 1 AS `IP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bl_stats_1octet`
--

DROP TABLE IF EXISTS `bl_stats_1octet`;
/*!50001 DROP VIEW IF EXISTS `bl_stats_1octet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bl_stats_1octet` AS SELECT 
 1 AS `ipblock`,
 1 AS `count`,
 1 AS `totalHits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bl_stats_2octet`
--

DROP TABLE IF EXISTS `bl_stats_2octet`;
/*!50001 DROP VIEW IF EXISTS `bl_stats_2octet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bl_stats_2octet` AS SELECT 
 1 AS `ipblock`,
 1 AS `count`,
 1 AS `totalHits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bl_stats_3octet`
--

DROP TABLE IF EXISTS `bl_stats_3octet`;
/*!50001 DROP VIEW IF EXISTS `bl_stats_3octet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bl_stats_3octet` AS SELECT 
 1 AS `ipblock`,
 1 AS `count`,
 1 AS `totalHits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!50001 DROP VIEW IF EXISTS `blacklist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `blacklist` AS SELECT 
 1 AS `platform`,
 1 AS `service`,
 1 AS `IP`,
 1 AS `ipaddr`,
 1 AS `cidr`,
 1 AS `hits`,
 1 AS `expiration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'all'),(2,'aso'),(3,'bh'),(4,'directi'),(5,'hg'),(6,'vdeck');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'all'),(2,'ftp'),(3,'mail'),(4,'main'),(5,'web');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!50001 DROP VIEW IF EXISTS `whitelist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `whitelist` AS SELECT 
 1 AS `platform`,
 1 AS `service`,
 1 AS `IP`,
 1 AS `ipaddr`,
 1 AS `cidr`,
 1 AS `hits`,
 1 AS `expiration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wl_ipaddr`
--

DROP TABLE IF EXISTS `wl_ipaddr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_ipaddr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr` int(11) unsigned NOT NULL COMMENT 'inet_ntoa',
  `cidr` smallint(6) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '1',
  `reason` varchar(255) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wl_ipaddr_cidr` (`ipaddr`,`cidr`),
  KEY `idx_ipaddr_time` (`ipaddr`,`expiration`,`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_ipaddr`
--

LOCK TABLES `wl_ipaddr` WRITE;
/*!40000 ALTER TABLE `wl_ipaddr` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_ipaddr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_ipaddr_platform_xref`
--

DROP TABLE IF EXISTS `wl_ipaddr_platform_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_ipaddr_platform_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wl_platform_unique` (`ipaddr_id`,`platform_id`),
  KEY `fk_wl_platform_idx` (`platform_id`),
  KEY `fk_wl_platform_ipaddr_idx` (`ipaddr_id`),
  CONSTRAINT `fk_wl_platform_ipaddr` FOREIGN KEY (`ipaddr_id`) REFERENCES `wl_ipaddr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wl_platform` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_ipaddr_platform_xref`
--

LOCK TABLES `wl_ipaddr_platform_xref` WRITE;
/*!40000 ALTER TABLE `wl_ipaddr_platform_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_ipaddr_platform_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_ipaddr_service_xref`
--

DROP TABLE IF EXISTS `wl_ipaddr_service_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wl_ipaddr_service_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddr_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wl_service_unique` (`ipaddr_id`,`service_id`),
  KEY `fk_wl_service_idx` (`service_id`),
  KEY `fk_wl_service_ipaddr_idx` (`ipaddr_id`),
  CONSTRAINT `fk_wl_service_ipaddr` FOREIGN KEY (`ipaddr_id`) REFERENCES `wl_ipaddr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wl_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_ipaddr_service_xref`
--

LOCK TABLES `wl_ipaddr_service_xref` WRITE;
/*!40000 ALTER TABLE `wl_ipaddr_service_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `wl_ipaddr_service_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wl_platform_orphans`
--

DROP TABLE IF EXISTS `wl_platform_orphans`;
/*!50001 DROP VIEW IF EXISTS `wl_platform_orphans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wl_platform_orphans` AS SELECT 
 1 AS `IP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wl_service_orphans`
--

DROP TABLE IF EXISTS `wl_service_orphans`;
/*!50001 DROP VIEW IF EXISTS `wl_service_orphans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wl_service_orphans` AS SELECT 
 1 AS `IP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wl_stats_1octet`
--

DROP TABLE IF EXISTS `wl_stats_1octet`;
/*!50001 DROP VIEW IF EXISTS `wl_stats_1octet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wl_stats_1octet` AS SELECT 
 1 AS `ipblock`,
 1 AS `count`,
 1 AS `totalHits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wl_stats_2octet`
--

DROP TABLE IF EXISTS `wl_stats_2octet`;
/*!50001 DROP VIEW IF EXISTS `wl_stats_2octet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wl_stats_2octet` AS SELECT 
 1 AS `ipblock`,
 1 AS `count`,
 1 AS `totalHits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wl_stats_3octet`
--

DROP TABLE IF EXISTS `wl_stats_3octet`;
/*!50001 DROP VIEW IF EXISTS `wl_stats_3octet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `wl_stats_3octet` AS SELECT 
 1 AS `ipblock`,
 1 AS `count`,
 1 AS `totalHits`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `ip_rbl`
--

USE `ip_rbl`;

--
-- Final view structure for view `bl_platform_orphans`
--

/*!50001 DROP VIEW IF EXISTS `bl_platform_orphans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `bl_platform_orphans` AS select concat(inet_ntoa(`bl`.`ipaddr`),(case when isnull(`bl`.`cidr`) then '/32' else concat('/',`bl`.`cidr`) end)) AS `IP` from `bl_ipaddr` `bl` where (not(`bl`.`id` in (select `bl_ipaddr_platform_xref`.`ipaddr_id` from `bl_ipaddr_platform_xref`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bl_service_orphans`
--

/*!50001 DROP VIEW IF EXISTS `bl_service_orphans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `bl_service_orphans` AS select concat(inet_ntoa(`bl`.`ipaddr`),(case when isnull(`bl`.`cidr`) then '/32' else concat('/',`bl`.`cidr`) end)) AS `IP` from `bl_ipaddr` `bl` where (not(`bl`.`id` in (select `bl_ipaddr_platform_xref`.`ipaddr_id` from `bl_ipaddr_platform_xref`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bl_stats_1octet`
--

/*!50001 DROP VIEW IF EXISTS `bl_stats_1octet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `bl_stats_1octet` AS select substring_index(inet_ntoa(`bl_ipaddr`.`ipaddr`),'.',1) AS `ipblock`,count(`bl_ipaddr`.`id`) AS `count`,sum(`bl_ipaddr`.`hits`) AS `totalHits` from `bl_ipaddr` group by substring_index(inet_ntoa(`bl_ipaddr`.`ipaddr`),'.',1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bl_stats_2octet`
--

/*!50001 DROP VIEW IF EXISTS `bl_stats_2octet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `bl_stats_2octet` AS select substring_index(inet_ntoa(`bl_ipaddr`.`ipaddr`),'.',2) AS `ipblock`,count(`bl_ipaddr`.`id`) AS `count`,sum(`bl_ipaddr`.`hits`) AS `totalHits` from `bl_ipaddr` group by substring_index(inet_ntoa(`bl_ipaddr`.`ipaddr`),'.',2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bl_stats_3octet`
--

/*!50001 DROP VIEW IF EXISTS `bl_stats_3octet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `bl_stats_3octet` AS select substring_index(inet_ntoa(`bl_ipaddr`.`ipaddr`),'.',3) AS `ipblock`,count(`bl_ipaddr`.`id`) AS `count`,sum(`bl_ipaddr`.`hits`) AS `totalHits` from `bl_ipaddr` group by substring_index(inet_ntoa(`bl_ipaddr`.`ipaddr`),'.',3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `blacklist`
--

/*!50001 DROP VIEW IF EXISTS `blacklist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `blacklist` AS select `p`.`name` AS `platform`,`s`.`name` AS `service`,concat(inet_ntoa(`bl`.`ipaddr`),(case when isnull(`bl`.`cidr`) then '/32' else concat('/',`bl`.`cidr`) end)) AS `IP`,inet_ntoa(`bl`.`ipaddr`) AS `ipaddr`,(case when isnull(`bl`.`cidr`) then '/32' else concat('/',`bl`.`cidr`) end) AS `cidr`,`bl`.`hits` AS `hits`,`bl`.`expiration` AS `expiration` from ((((`bl_ipaddr` `bl` join `bl_ipaddr_platform_xref` `px`) join `bl_ipaddr_service_xref` `sx`) join `platform` `p`) join `service` `s`) where ((`bl`.`id` = `px`.`ipaddr_id`) and (`bl`.`id` = `sx`.`ipaddr_id`) and (`px`.`platform_id` = `p`.`id`) and (`sx`.`service_id` = `s`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `whitelist`
--

/*!50001 DROP VIEW IF EXISTS `whitelist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `whitelist` AS select `p`.`name` AS `platform`,`s`.`name` AS `service`,concat(inet_ntoa(`wl`.`ipaddr`),(case when isnull(`wl`.`cidr`) then '/32' else concat('/',`wl`.`cidr`) end)) AS `IP`,inet_ntoa(`wl`.`ipaddr`) AS `ipaddr`,(case when isnull(`wl`.`cidr`) then '/32' else concat('/',`wl`.`cidr`) end) AS `cidr`,`wl`.`hits` AS `hits`,`wl`.`expiration` AS `expiration` from ((((`wl_ipaddr` `wl` join `wl_ipaddr_platform_xref` `px`) join `wl_ipaddr_service_xref` `sx`) join `platform` `p`) join `service` `s`) where ((`wl`.`id` = `px`.`ipaddr_id`) and (`wl`.`id` = `sx`.`ipaddr_id`) and (`px`.`platform_id` = `p`.`id`) and (`sx`.`service_id` = `s`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wl_platform_orphans`
--

/*!50001 DROP VIEW IF EXISTS `wl_platform_orphans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `wl_platform_orphans` AS select concat(inet_ntoa(`wl`.`ipaddr`),(case when isnull(`wl`.`cidr`) then '/32' else concat('/',`wl`.`cidr`) end)) AS `IP` from `wl_ipaddr` `wl` where (not(`wl`.`id` in (select `wl_ipaddr_service_xref`.`ipaddr_id` from `wl_ipaddr_service_xref`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wl_service_orphans`
--

/*!50001 DROP VIEW IF EXISTS `wl_service_orphans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `wl_service_orphans` AS select concat(inet_ntoa(`wl`.`ipaddr`),(case when isnull(`wl`.`cidr`) then '/32' else concat('/',`wl`.`cidr`) end)) AS `IP` from `wl_ipaddr` `wl` where (not(`wl`.`id` in (select `wl_ipaddr_service_xref`.`ipaddr_id` from `wl_ipaddr_service_xref`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wl_stats_1octet`
--

/*!50001 DROP VIEW IF EXISTS `wl_stats_1octet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `wl_stats_1octet` AS select substring_index(inet_ntoa(`wl_ipaddr`.`ipaddr`),'.',1) AS `ipblock`,count(`wl_ipaddr`.`id`) AS `count`,sum(`wl_ipaddr`.`hits`) AS `totalHits` from `wl_ipaddr` group by substring_index(inet_ntoa(`wl_ipaddr`.`ipaddr`),'.',1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wl_stats_2octet`
--

/*!50001 DROP VIEW IF EXISTS `wl_stats_2octet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `wl_stats_2octet` AS select substring_index(inet_ntoa(`wl_ipaddr`.`ipaddr`),'.',2) AS `ipblock`,count(`wl_ipaddr`.`id`) AS `count`,sum(`wl_ipaddr`.`hits`) AS `totalHits` from `wl_ipaddr` group by substring_index(inet_ntoa(`wl_ipaddr`.`ipaddr`),'.',2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wl_stats_3octet`
--

/*!50001 DROP VIEW IF EXISTS `wl_stats_3octet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`view_definer`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `wl_stats_3octet` AS select substring_index(inet_ntoa(`wl_ipaddr`.`ipaddr`),'.',3) AS `ipblock`,count(`wl_ipaddr`.`id`) AS `count`,sum(`wl_ipaddr`.`hits`) AS `totalHits` from `wl_ipaddr` group by substring_index(inet_ntoa(`wl_ipaddr`.`ipaddr`),'.',3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-27 12:40:38
