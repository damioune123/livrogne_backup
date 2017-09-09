-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: livrogne_api
-- ------------------------------------------------------
-- Server version	5.5.57-0+deb8u1

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
-- Current Database: `livrogne_api`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `livrogne_api` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `livrogne_api`;

--
-- Table structure for table `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `value` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `is_log_with_rfid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8AF9B66C8D93D649` (`user`),
  CONSTRAINT `FK_8AF9B66C8D93D649` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
INSERT INTO `auth_tokens` VALUES (1,1,'8NII9pWUg7O5tFltcFTcBxpqXSlCZo0IHGhMCoZRCrNq0DE/U3hVXDgRG5nSqDIuZGk=','2017-09-08 15:19:05',0),(2,3,'ZbiFYq4/YQ5uxpWV0UqSz4doexaecQYPz/o+ZKtmCwu+frFhEoJ808gngamXEh6EjKc=','2017-09-08 15:24:59',0),(3,2,'L0f6CibyVDCDficKaU0oTJ56qyorqvZKcVVEBU4qTG+cTHOuf/E4DwoUQl8zeTcMy8s=','2017-09-08 15:26:56',0),(4,4,'yy/BnwBZJEeXbPB4Juvvh+zbS6/wi530AFiR8IYerd38VuLAj4PEYn5chSwlhm0f2XM=','2017-09-08 15:27:29',0),(5,1,'B50n3JdNvM+eWpRoPg/CXMQiyw014Pwv7oyd5X9loVp14DAuJovTwM1AyEYcDfqfRNw=','2017-09-08 15:28:57',0),(6,1,'faQqqfo1Mog28dt7UM2mbY/U0TX+FiSQdTdQvX1ecJhVYSJWS6BnhZEMZEGUokPP5C4=','2017-09-08 15:29:15',1),(7,1,'1nC7jnXThwZoNe81+e5iWpBSmYm7IHy/UiMz26VvfvvbXAuSuEgEfZAPvohLzN/zD0g=','2017-09-08 15:30:35',1),(8,1,'L7YiCJ14Muuut14S2rqrfaz6sMZGs53BEgECkpxpURoL0FHSPPCdEcFeoQxE1PAXB5E=','2017-09-08 15:30:41',1),(9,1,'DylQdc0Rs+CQDe0A9wQEzv90G/9uzEp/pbAipqUKan9svLv6BeWE3d3yaOL2x5mNrQ8=','2017-09-08 15:31:10',1),(10,1,'XMhwuO8CrNlPIU8TadoPsDdFthnNGF3GnpYJPWvgBp1cg7SuqhgKbXqezBi0ypYXodA=','2017-09-08 15:33:41',1),(11,3,'2Z5P7R0n4MHa6lz04PoCFmAuPt6igy/a00YPSZMTp99P7A6ZLbFMV3u9/HPLNrLOGQs=','2017-09-08 15:39:28',1),(12,3,'q0hrA47azhxE4Wh7m3WpT4O2bTXd40qdEuXzZ7Z+iXCSqtRn47Yo+kG0CzKXXLCIsRI=','2017-09-08 15:39:57',1),(13,3,'8/3MeoETPDqDFwZbJCpDWrEdb7yRyxC79j5ElJe1QIbZjjI8uPxlb8U7mZHTKNoOOSA=','2017-09-08 15:41:11',1),(14,1,'2MAzZCj2gl6vMRYew9GFh00PhALQLWbdEGqp/QWnbFjL0LBf6B5fMaExchYxqU3eVN8=','2017-09-08 15:41:53',1),(15,3,'Zc1apVCDLEYuRCmlwy7kEPt7JyWoemwhKfJLPXWSZAQ4jo9NEls5dW+qI/kFkDsOxtI=','2017-09-08 15:42:43',1),(16,3,'GQ6EZKBp4tn5Wfv94uA0ZsxtiYewk4ZLyChW8jC9GA37ujyrzGg05oSUcAy9LUNMwYE=','2017-09-08 15:44:20',1),(17,3,'D4zNHWhLTyo/zCnAPlJEyFH/1ol+seiCHt6cy13EvYGahf48asiowsxa2a/SDjBCHJI=','2017-09-08 15:44:47',1),(18,2,'IiN31klEYWvEeYz34BDgtpFmLC5AbMa1ohlImkcFGh02A5QPghCSMTH1wYqDrxZDPzE=','2017-09-08 15:45:37',1),(19,3,'GoEkuo558wO0nMIXJVtsCINJhf8C0oKx/sWeLdzAyCBxtxP9wISSiPdEu/RB0HGc8p4=','2017-09-08 15:46:20',1),(20,3,'kwP3lu1uXVClmcn2HbTZdSZWub+8ryFtxRTthesj0YYElQn4abNofeJavUgWICEVSFs=','2017-09-08 15:46:54',1),(21,3,'+K7kLspxptFFo4WVI7WcmcHq/JMzQQYU2BR9OyWFXh6pmkefJ2iYUoaMvyACd/P2U10=','2017-09-08 15:49:55',1),(22,2,'1uegytZ/yey+fJATDqmuc9NXfxFJDYakd9KCmRLu7DTuKHN4tSsizFtB6lkEibyaKlk=','2017-09-08 15:50:39',1),(23,3,'bu20n2ojRn9LRGEuncTq9cdFWF9Q881NXoLLg5wlfVKKmPfJKSb+wZ1+8uJblSQY+go=','2017-09-08 15:51:21',1),(24,1,'te3ow9xeW9/KUgYDw5ue3PCWj+Zl0F03/GYhoeIT284eBYFr5pfC5YQq0uc7PKEAhIE=','2017-09-08 15:54:09',1),(25,1,'81TeQtue4GOQue3mgn+PmRnyTMpg7xnprGd9Ahg7qDPN/XaSk0EwP0oDx5D4++2SnJw=','2017-09-08 15:56:03',1),(26,1,'CS0sMcTK72zRYXMPZxnld/xDo3tdEdOepEd/FL+NCUMzO8Xg1PdMXYqoat/7hf/tNT4=','2017-09-08 16:05:23',1),(27,3,'JDjKo93w3/vDVtaBN1H6m35IEMbODk6yk1AYz5Z2YPEWUCb/0UvJN5Hz35QhYs4wGBg=','2017-09-08 16:06:08',1),(28,4,'juYW6JqxsusAUdOBmTM7xe+DkV8CbLpLqr3RpVJeCbu0Y8L2w7yZ/kDPsLoysjJGnL0=','2017-09-08 16:25:56',1),(29,1,'fe9+TXU9RiGArwntwIzvotnTec7UKI+EKQXrzv28CKP4JwM0SGql/pA1lhU2F73qkNU=','2017-09-08 16:29:06',1),(30,3,'rHq8TdNhD46IKkjhqenZUeafrTRG3ruJKZ0E6n9PfTPiN/oGkFNON1/lnx7deGWKLVE=','2017-09-08 16:30:53',1),(31,3,'pnFFfZYsDOkDsiggSluDn9QkeA2QCW11XRIBgyUyk2PmrGLqxP62fGbVYphgYIgjpDE=','2017-09-08 16:41:26',1),(32,3,'Ks9lk70nqAY4vv+lByuvoR3jodJgExNddW76+yjlo8KmTOp0dLMQiSgHV+fproBSJCo=','2017-09-08 16:57:59',1),(33,3,'AsIUrmIU8Ova+wVmE+X35MkmK6e0HMQtYee11eiEQPvAb23ceQC8any4h5CXTmvqxjw=','2017-09-08 17:03:38',1),(34,3,'Q4el/HmINXepHUo/YO4W1Sf5Uj13TS6FzhDSdwzYojPaxRZABbiU0ISIE1PdXJ/nUQ4=','2017-09-08 17:04:45',1),(35,3,'eSZ7zhX7+7/gFrCR6+lGs5fNztPWZ3MhmUseNJnHJPA4HVAoUnwVM+HBxOgmDg8W//Q=','2017-09-08 17:05:20',1),(36,3,'z9mgR2cctuoPXoKbLnC8xe9yB/7FfR8x7lm953UXcsfKkmmEX+mtflRLa2uuudNSg58=','2017-09-08 17:05:35',1);
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money_flow`
--

DROP TABLE IF EXISTS `money_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `money_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debit_user_account` int(11) DEFAULT NULL,
  `credit_user_account` int(11) DEFAULT NULL,
  `admin_authentifier` int(11) DEFAULT NULL,
  `value` double NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `isCancelled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BD4C7577549C12A` (`debit_user_account`),
  KEY `IDX_BD4C75773CE52E4` (`credit_user_account`),
  KEY `IDX_BD4C75779ED6A804` (`admin_authentifier`),
  CONSTRAINT `FK_BD4C75773CE52E4` FOREIGN KEY (`credit_user_account`) REFERENCES `user_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_BD4C7577549C12A` FOREIGN KEY (`debit_user_account`) REFERENCES `user_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_BD4C75779ED6A804` FOREIGN KEY (`admin_authentifier`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_flow`
--

LOCK TABLES `money_flow` WRITE;
/*!40000 ALTER TABLE `money_flow` DISABLE KEYS */;
INSERT INTO `money_flow` VALUES (1,5,1,3,3.6,'Annulation de la commande n°2','2017-09-08 17:05:21',1),(2,5,1,3,3.6,'Annulation de la commande n°1','2017-09-08 17:05:36',1);
/*!40000 ALTER TABLE `money_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lines`
--

DROP TABLE IF EXISTS `order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_order` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `orderline_during_order_price` double NOT NULL,
  `product_during_order_price_user` double NOT NULL,
  `product_during_order_price_admin` double NOT NULL,
  `product_during_order_real_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CC9FF86B3B1CE6A3` (`customer_order`),
  KEY `IDX_CC9FF86BD34A04AD` (`product`),
  CONSTRAINT `FK_CC9FF86B3B1CE6A3` FOREIGN KEY (`customer_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CC9FF86BD34A04AD` FOREIGN KEY (`product`) REFERENCES `products` (`barcode`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lines`
--

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;
INSERT INTO `order_lines` VALUES (1,1,'5410218005868',2,4,2,2,0),(2,2,'5411681035000',2,4,2,2,0);
/*!40000 ALTER TABLE `order_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_user_account` int(11) DEFAULT NULL,
  `cash_register_account` int(11) DEFAULT NULL,
  `is_paid_cash` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `isCancelled` tinyint(1) NOT NULL,
  `isOrderedByCustomer` tinyint(1) NOT NULL,
  `during_order_price` double NOT NULL,
  `during_order_global_promotion` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E52FFDEE2BE38BB7` (`customer_user_account`),
  KEY `IDX_E52FFDEE6526CC6A` (`cash_register_account`),
  CONSTRAINT `FK_E52FFDEE2BE38BB7` FOREIGN KEY (`customer_user_account`) REFERENCES `user_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E52FFDEE6526CC6A` FOREIGN KEY (`cash_register_account`) REFERENCES `user_accounts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,1,0,'2017-09-08 15:39:45',1,1,3.6,10),(2,5,1,0,'2017-09-08 15:44:38',1,1,3.6,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'rodeo_cara',0.5,0),(2,'pils_25cl',1,0),(3,'spe_25cl',1.5,0),(4,'spe_33cl',2,0),(5,'alcool_cl',0.5,0);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `barcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_category` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `product_promotion_admin` double NOT NULL,
  `product_promotion_user` double NOT NULL,
  `product_real_price` double NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`barcode`),
  UNIQUE KEY `UNIQ_B3BA5A5A97AE0266` (`barcode`),
  KEY `IDX_B3BA5A5ACDFC7356` (`product_category`),
  CONSTRAINT `FK_B3BA5A5ACDFC7356` FOREIGN KEY (`product_category`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('00000',1,'Autre',0,0,0,0,0),('11111',2,'Autre',0,0,0,0,0),('22222',3,'Autre',0,0,0,0,0),('3119780250110',4,'Desperados',0,0,0,0,0),('33333',4,'Autre',0,0,0,0,0),('5400141079784',2,'Boni agrumes',0,0,0,0,0),('5400141079913',2,'boni Ice Tea Citron',0,0,0,0,0),('5400141123081',1,'Cara',0,0,0,0,0),('5400141353303',2,'Boni Ice Tea Green',0,0,0,0,0),('54004207',4,'Guiness Special Export',0,0,0,0,0),('54017016',2,'Maes',0,0,0,0,0),('54050051',4,'Kwak',0,30,0,0,0),('54050082',4,'Triple Karmeliet',0,0,0,0,0),('54055438',3,'Brugs blanche',0,0,0,0,0),('54085190',4,'Tongerlo',0,0,0,0,0),('5410218005868',4,'Waterloo',-2,0,0,0,0),('5410228205937',3,'Radler Agrumes',0,0,0,0,0),('5410228208358',4,'Leffe',0,0,0,0,0),('5410228217459',3,'Radler Citron',0,0,0,0,0),('5410263015669',4,'Grimbergen Blonde',0,0,0,0,0),('5410263918434',4,'Grimbergen Caractere Houblon',0,0,0,0,0),('5410702000539',4,'Moinette',0,0,0,0,0),('5410769100081',4,'Chouffe Classique',0,0,0,0,0),('5410908000029',4,'Chimay Blanche',0,0,0,0,0),('5411098700034',4,'Postel',0,0,0,0,0),('5411551141091',3,'Cuvee des Trolls',0,0,0,0,0),('5411676100812',4,'Barbare',0,0,0,0,0),('5411681014005',4,'Duvel',0,0,0,0,0),('5411681035000',4,'Maredsous Blonde',-2,0,0,0,0),('5411681038001',4,'Maredsous Trple',0,0,0,0,0),('5411858000145',4,'Omer',0,0,0,0,0),('5411858100067',4,'Le Fort Triple',0,0,0,0,0),('5412138103310',4,'St Feuillien Blonde',0,0,0,0,0),('5412343201337',4,'Leffe Blonde',0,0,0,0,0),('5412583240837',4,'ENAME Blonde',0,0,0,0,0),('5412858000081',4,'Rochefort 8 degre',0,0,0,0,0),('5425027970016',4,'Vicaris Triple',0,0,0,0,0),('54490000',2,'Coca Normal',0,0,0,0,0),('55555',5,'Autre',0,0,0,0,0),('5740600200541',3,'Carlsberg',0,0,0,0,0),('8711900013992',1,'Rodeo',0,0,0,0,0),('8712100878923',2,'Ice Tea Agrumes',0,0,0,0,0),('8714100615614',2,'Ice Tea Original',0,0,0,0,0),('8722700696599',2,'Ice Tea Zero',0,0,0,0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_promotion` double NOT NULL,
  `promotion_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EA1B3034E8D9F699` (`promotion_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,0,'simple'),(2,10,'admin');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_to_match`
--

DROP TABLE IF EXISTS `rfid_to_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_to_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_to_match`
--

LOCK TABLES `rfid_to_match` WRITE;
/*!40000 ALTER TABLE `rfid_to_match` DISABLE KEYS */;
INSERT INTO `rfid_to_match` VALUES (1,'5381206120','2017-09-08 15:25:07'),(2,'5381206120','2017-09-08 15:25:15'),(3,'149211212120','2017-09-08 15:27:04'),(4,'11748193120','2017-09-08 15:27:39'),(5,'245114106120','2017-09-08 15:27:48'),(6,'245114106120','2017-09-08 15:27:56'),(7,'245114106120','2017-09-08 15:29:05');
/*!40000 ALTER TABLE `rfid_to_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `money_balance` double NOT NULL,
  `money_limit` double NOT NULL,
  `credit_to_allow_max` double NOT NULL,
  `credit_allowed` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A457AAC8D93D649` (`user`),
  CONSTRAINT `FK_2A457AAC8D93D649` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,2,'register',0,0,200,0),(2,2,'bank',0,0,200,0),(3,NULL,'lost',0,0,200,0),(4,NULL,'spending',0,0,200,0),(5,3,'somebody',0,0,200,0),(6,4,'somebody',0,0,200,0),(7,5,'somebody',0,0,200,0),(8,6,'somebody',0,0,200,0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `godfather` int(11) DEFAULT NULL,
  `promotion` int(11) DEFAULT NULL,
  `firstname` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(190) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `rfid_card` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  UNIQUE KEY `UNIQ_1483A5E92E800D6E` (`rfid_card`),
  KEY `IDX_1483A5E9D6DEB239` (`godfather`),
  KEY `IDX_1483A5E9C11D7DD1` (`promotion`),
  CONSTRAINT `FK_1483A5E9C11D7DD1` FOREIGN KEY (`promotion`) REFERENCES `promotions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1483A5E9D6DEB239` FOREIGN KEY (`godfather`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,2,'super','admin','superadmin','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_SUPER_ADMIN','245114106120','livrognebar@gmail.com',0),(2,NULL,1,'bar','man','barman','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_BARMAN','149211212120','livrognebar@gmail.com',0),(3,NULL,2,'Damien','Meur','dams','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_ADMIN','5381206120','damienmeur@gmail.com',0),(4,NULL,2,'Julien','Daniello','dan','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_ADMIN','11748193120','juliendaniello@gmail.com',0),(5,3,1,'Nora','Fallica','nono','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_USER','4','no.fallica@gmail.com',0),(6,NULL,1,'John','Doe','john_doe','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_USER','5','no.fallica@gmail.com',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-08 17:06:12
