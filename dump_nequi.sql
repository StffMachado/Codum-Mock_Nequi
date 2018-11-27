-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: nequi
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `num_accounts` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `available_balance` decimal(17,2) DEFAULT '0.00',
  `total_balance` decimal(17,2) DEFAULT '0.00',
  PRIMARY KEY (`num_accounts`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal` (
  `num_goal` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `total` decimal(17,2) NOT NULL,
  `save_money` decimal(17,2) DEFAULT NULL,
  `diff_total` decimal(17,2) DEFAULT NULL,
  `status` enum('CUMPLIDA','VENCIDA') DEFAULT NULL,
  `date_limit` datetime NOT NULL,
  PRIMARY KEY (`num_goal`),
  KEY `dk_user_goal_idx` (`id_user`),
  CONSTRAINT `dk_user_goal` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mattress`
--

DROP TABLE IF EXISTS `mattress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mattress` (
  `num_mattress` int(11) NOT NULL AUTO_INCREMENT,
  `total_balance` decimal(17,2) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_mattress`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  CONSTRAINT `fk_user_mattres` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mattress`
--

LOCK TABLES `mattress` WRITE;
/*!40000 ALTER TABLE `mattress` DISABLE KEYS */;
/*!40000 ALTER TABLE `mattress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pocket`
--

DROP TABLE IF EXISTS `pocket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pocket` (
  `num_pocket` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT '0',
  PRIMARY KEY (`num_pocket`),
  KEY `fk_user_pocket_idx` (`id_user`),
  CONSTRAINT `fk_user_pocket` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pocket`
--

LOCK TABLES `pocket` WRITE;
/*!40000 ALTER TABLE `pocket` DISABLE KEYS */;
/*!40000 ALTER TABLE `pocket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_account`
--

DROP TABLE IF EXISTS `send_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send_account` (
  `id_send_account` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_destination` int(11) DEFAULT NULL,
  `id_user_send` int(11) DEFAULT NULL,
  `num_account_send` int(11) DEFAULT NULL,
  `num_account_destination` int(11) DEFAULT NULL,
  `value` decimal(17,2) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_send_account`),
  KEY `fk_user_destination_idx` (`id_user_destination`),
  KEY `fk_user_send_idx` (`id_user_send`),
  KEY `num_account_idx` (`num_account_send`),
  KEY `num_account_destination_idx` (`num_account_destination`),
  CONSTRAINT `fk_user_destination` FOREIGN KEY (`id_user_destination`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_send` FOREIGN KEY (`id_user_send`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `num_account_destination` FOREIGN KEY (`num_account_destination`) REFERENCES `accounts` (`num_accounts`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `num_account_send` FOREIGN KEY (`num_account_send`) REFERENCES `accounts` (`num_accounts`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_account`
--

LOCK TABLES `send_account` WRITE;
/*!40000 ALTER TABLE `send_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_pocket`
--

DROP TABLE IF EXISTS `send_pocket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send_pocket` (
  `id_send_pocket` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_destination` int(11) DEFAULT NULL,
  `id_user_send` int(11) DEFAULT NULL,
  `num_pocket_send` int(11) DEFAULT NULL,
  `num_pocket_destination` int(11) DEFAULT NULL,
  `value` decimal(17,2) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_send_pocket`),
  KEY `fk_user_destination_idx` (`id_user_destination`),
  KEY `fk_user_send_idx` (`id_user_send`),
  KEY `num_pocket_idx` (`num_pocket_send`),
  KEY `num_pocket_destination_idx` (`num_pocket_destination`),
  CONSTRAINT `fk_user_destination_p` FOREIGN KEY (`id_user_destination`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_send_p` FOREIGN KEY (`id_user_send`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `num_pocket_destination` FOREIGN KEY (`num_pocket_destination`) REFERENCES `pocket` (`num_pocket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `num_pocket_send` FOREIGN KEY (`num_pocket_send`) REFERENCES `pocket` (`num_pocket`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_pocket`
--

LOCK TABLES `send_pocket` WRITE;
/*!40000 ALTER TABLE `send_pocket` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_pocket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_accounts`
--

DROP TABLE IF EXISTS `transactions_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions_accounts` (
  `id_transacions_accounts` int(11) NOT NULL AUTO_INCREMENT,
  `num_account` int(11) NOT NULL,
  `type` enum('Ingresar','Retirar') NOT NULL,
  `value` decimal(17,2) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_transacions_accounts`),
  KEY `fk_num_accounts_idx` (`num_account`),
  CONSTRAINT `fk_num_accounts` FOREIGN KEY (`num_account`) REFERENCES `accounts` (`num_accounts`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_accounts`
--

LOCK TABLES `transactions_accounts` WRITE;
/*!40000 ALTER TABLE `transactions_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_goals`
--

DROP TABLE IF EXISTS `transactions_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions_goals` (
  `id_transacions_goals` int(11) NOT NULL AUTO_INCREMENT,
  `num_goal` int(11) NOT NULL,
  `type` enum('Ingresar','Cerrar') NOT NULL,
  `value` decimal(17,2) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_transacions_goals`),
  KEY `fk_num_goals_idx` (`num_goal`),
  CONSTRAINT `fk_num_goals_t` FOREIGN KEY (`num_goal`) REFERENCES `goal` (`num_goal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_goals`
--

LOCK TABLES `transactions_goals` WRITE;
/*!40000 ALTER TABLE `transactions_goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_mattress`
--

DROP TABLE IF EXISTS `transactions_mattress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions_mattress` (
  `id_transacions_mattress` int(11) NOT NULL AUTO_INCREMENT,
  `num_mattre` int(11) NOT NULL,
  `type` enum('Ingresar','Retirar') NOT NULL,
  `value` decimal(17,2) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_transacions_mattress`),
  KEY `fk_num_mattress_idx` (`num_mattre`),
  CONSTRAINT `fk_num_num_mattress` FOREIGN KEY (`num_mattre`) REFERENCES `mattress` (`num_mattress`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_mattress`
--

LOCK TABLES `transactions_mattress` WRITE;
/*!40000 ALTER TABLE `transactions_mattress` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_mattress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_pockets`
--

DROP TABLE IF EXISTS `transactions_pockets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions_pockets` (
  `id_transacions_pockets` int(11) NOT NULL AUTO_INCREMENT,
  `num_pocket` int(11) NOT NULL,
  `type` enum('Ingresar','Retirar','Eliminar_Bolsillo') NOT NULL,
  `value` decimal(17,2) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_transacions_pockets`),
  KEY `fk_num_pockets_idx` (`num_pocket`),
  CONSTRAINT `fk_num_pockets_t` FOREIGN KEY (`num_pocket`) REFERENCES `pocket` (`num_pocket`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_pockets`
--

LOCK TABLES `transactions_pockets` WRITE;
/*!40000 ALTER TABLE `transactions_pockets` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_pockets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `name` varchar(65) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `method` enum('SHA224') DEFAULT 'SHA224',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nequi'
--

--
-- Dumping routines for database 'nequi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-27  0:37:37
