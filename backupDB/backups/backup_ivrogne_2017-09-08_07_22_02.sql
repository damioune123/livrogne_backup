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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
INSERT INTO `auth_tokens` VALUES (1,3,'9dRaNmVk7j+iGOKvZGSDTG7sUI8mlPBh2z+jVTI0ZWqHXbUttmx683s/ivW+CAkmeAw=','2017-09-07 11:48:03',0),(2,3,'qjSOxttoJcFv22fZJ3Qu6UuwTvS1kq2wK7AtYfJCjcPw/AP8kZjf0LAzZUaVaIHoWYU=','2017-09-07 11:48:20',1),(3,4,'4H66I4NZdpUKG5Ix4QdASN0SCLSvJ/deKkEcNk00+e8SfgbJugt3udVhvsy9Fp2PUQg=','2017-09-07 11:48:53',0),(4,4,'m0kUnN44kFcI9k8Htr2Zvh3UV7MgSjk2PDFOfOLyTvPewaUO9iwVEL+QuHtpNwTpdvc=','2017-09-07 11:49:10',1),(5,4,'Dk+djPQfj0R6NJcLMKtvAr2PK0KWnvQimbbj8cpPPgwXaW+yBSwHQAVnWySj6R6ZNBs=','2017-09-07 11:52:05',1),(6,4,'cUgpf88oVzblNcjZMr37fGVouXW16+mYSemlWDcqVUdiWkOhvNzcXmg3G4nKqn7uxVw=','2017-09-07 11:52:40',1),(7,4,'ILYtC8CWVt6ruJW9b/fs5lX/DcocmgOp52abZkmDQxL9NPc5N+QrOE45VokRMQSESwY=','2017-09-07 11:54:02',1),(8,4,'F36xVPTOV8TucfnPpndaGzkT8T9HKl16syap3qv7L5C4vSwVoTYdRtNybR2iQueihb8=','2017-09-07 11:54:38',1),(9,3,'DCTVn9K10SLgjttS0006caVT73I1ZZkaFN6nxB0bwRuVsumUzVbSCMmGFIN3SY8gODg=','2017-09-07 11:55:45',1),(10,4,'bdCbOC7aphmq1VtPxDHQteHd6Y4uKF9JX6jyAet7vQNUy01uxITZCymQxuW2GNsNCqI=','2017-09-07 11:58:40',1),(11,4,'ZxY47ROkTF+CA/VWzD+p0pZYYIqEN7XV56mtRvS4s4xYB6+Nq86RkOXtHvCMzxadIWw=','2017-09-07 12:05:15',1),(12,3,'0GX4j2LL0UKlP8k8N+q+5SqkCg44T8qHF9o6TnlpBR4mnYASZChQ01Y1m9m5Bz2tCE8=','2017-09-07 12:06:53',1),(13,4,'rF7dv8V7UxEbU4iqTXsFYx84NxUspiCDqGq85A8D1iH7T3hsNNOPnSR9RPhatlKMKbo=','2017-09-07 12:47:19',1),(14,4,'yVOC4WRsD07mLyViXZXo350Cq09KqtJdpeYcN4jY7BQ8MwTn2at6cLx047fN82NRwXw=','2017-09-07 12:55:44',1),(15,4,'66ymV7IqcEEE23fQ+DAUtosmyYUBEQErzBEUfIKJFak62qjqV4lKhgD82pHxLPJrs8o=','2017-09-07 13:12:50',1),(16,3,'kKsz93ItKfem2eFJVO5M7Ri+4ki4enb82p+AYD4jwnMnSzGBPFgVQhSR32J7ccfsRFU=','2017-09-07 13:52:17',0),(17,4,'ZUCUNabCaIIQxPqTcPKO3ZSvvjbJ7/+YXZriDRcpwXLhAfY9ceOEj5mF20gn87WamRg=','2017-09-07 13:54:43',1),(18,4,'2walag9iKpAOyDHpREjEknLxmNouk+TaUiXrOaWH+J/z3xmQrL+EIz//5DqmnVWXJdM=','2017-09-07 13:55:37',1),(19,4,'W0ORK3DXu3dRDlNR55CjL1XzWKdp++BtW3dUQE+TzFHo7FpkVVvW0CZvMxfaQv11rhE=','2017-09-07 13:56:30',1),(20,4,'P24aSMzMEFcddhbwkJkU+bTSGAE2akZ3voaU4NwQGgtWbXQehBWHl74JjXB46rHIsbI=','2017-09-07 13:57:39',1),(21,4,'5IHPLmfT2ZVGs0MeE8o5OfFdSS56rwP/xvl6KiwQZ38mjxWgYv8j5ZWCClyb1dzbUx4=','2017-09-07 16:51:33',1),(22,3,'9RQNCril92q6qORyGZfHFnALU9SmwBSeTCgwtrQlqHRmnpk0803eEmheQ657Z8BtNcw=','2017-09-07 17:28:09',1),(23,3,'FMq9jgV0VEAQ+sMuEgu163bU8KPVVFkNjYsmHPK4tZGzKFu1mrqWqWj9b59kBxgE7vU=','2017-09-07 21:03:31',1),(24,3,'t8iACxqbvvbJPUdWnt+5picZkuDVNh7ImxZiaGXtlRilkq8T76TdQ/w0zUvaC9PITfY=','2017-09-07 21:16:03',1),(25,4,'sJ7rMf2GWEOYKkESjpG9tNZ9fmHRfmQSrt1qg5sJrgJ0mcc04K54y4umkxhTi8GEL+s=','2017-09-07 21:16:19',1),(26,4,'vvdzByucxBuHUszed9ywIkL8IrUvSZ+aZ3MBFS7YNQYDz/8T2Ez3Spy8sPgWvygmzuU=','2017-09-07 21:16:27',1),(27,3,'QvGx8OF6Sc15Y0J7gRohAfGzpa7qLU3BEwKeLsJYY6lmzpgyVM4rZ1IIk9Bg3EMc7q0=','2017-09-07 21:16:51',1),(28,4,'yyl0vX7NjNegjBO2i74RRdsbtL/82qiushGvV765r2bj2kpUgrlYvwxZCf4QIrnUg00=','2017-09-07 21:16:57',1),(29,3,'hSsM1mzORanj9fNG3m28VpJczaac0lphkvJpooAoyjz/rOQFLda3uGgpVzpPlNBYTEk=','2017-09-07 21:18:04',1),(30,3,'PeC1KpICbeQcyIdvopLUzJGqb3p4QzL3SW78yQoyQK0MD63YtjbMFmK2yoM1xwrBRX0=','2017-09-07 21:20:22',1),(31,4,'bBC10RZbenF8mWdTTABV9IldVodY4QP3Umz/yNQp7cvihqkCQvmtsrVEfkFuyADgElw=','2017-09-07 21:22:00',1),(32,3,'yPyNLVI2iI1qY2TTCSnwOeNpFrHAkp6/jnKkjSmxSsaIEyTrUBuj0uSQrlEk4rXI4AQ=','2017-09-07 21:22:09',1),(33,4,'ca9zNfoY3UwbjlKXg4+TQDtwMkDRXoqXac8bBWVo/vZK0WPtazKFsqYYINu1Yd0Ej34=','2017-09-07 21:33:54',1),(34,4,'HvWkI1BQ542VONKL8L+SpNnNuMX7zSd0jeUIB1dILSRLFdwy9hSNRdRgVPNFOfgfidk=','2017-09-07 21:35:37',1),(35,4,'9KW1j/Z0lxvXbFIsv1LmqDY1/SFnINgndz7gEIHizzngDdWbktW2kPQwX9Ini7RfFZY=','2017-09-07 21:54:41',1),(36,4,'qYV/xuPr74tktaj1MTDfLoniQbjQHqEOxSvQUCiF25mcEZBubsFDaQwZ/gOpBwJWFXI=','2017-09-07 22:06:39',1),(37,3,'1eqCU4QDlSNhFW0YjyCouTgsaMnred6slVzgOXSRjR7SiLF/7q3nMRxskwzfc+X3+GE=','2017-09-07 22:31:40',1),(38,3,'PdItU1wEs1BtHwOMYVkmqcIlrD/kEZ6AF6X3PRUlFFHp84ldats5e/nfXSvH8DNkmU8=','2017-09-07 22:47:54',1),(39,3,'Xemgr3TTseyALcbYwHRGdO6Jzg+zG6ISLZF/DYOHf4mO60RLqsGrHiBPoClYPCOo7hM=','2017-09-07 23:11:58',1),(40,3,'LtPJZ+QhhIXFJvEHCBmxqN+zbYBI5Jilw+wq1/F2wC0YCckh4IzCIiwftTutEyO2DoE=','2017-09-07 23:51:13',1),(41,3,'/hBD+wtMkIiyPYrqFwnunEjccEn/Wn0pJOfZydDwzDzaIyiIcT/pCcWpOtaOCZ88GRI=','2017-09-08 00:24:56',1),(42,4,'E2+cGX1D4YLOEfzH1+ZSB9QFxavww1Mx9QY1bdYMHgBrsh5bglKv+XrBUEVAsB3rNJM=','2017-09-08 00:26:05',1),(43,3,'GwgUtSPSREL265ix2HvQcXPRx7dUtet3d3xZYRMkplyripVxWQMBpGBvWbGbpNdC4eU=','2017-09-08 00:27:46',1),(44,3,'E+CZCuyiOgxYi6PkVYYONAT6D5ra37tXY1JMQqsdB08oWems1TnNrOAcf2TsQp6XQfM=','2017-09-08 00:27:52',1),(45,3,'TqwrSmuiCk/iFe5KTJKQy7fpxJVnHB8hjNwlC67JiNfK5SFdtVaIbE2/tQwrhBVhXW4=','2017-09-08 00:29:07',1),(46,3,'fm7WoMK5TXvnWV2G5se5uF3lBWknpboCuyInI5htZMFHf1xgAmCFRUOmijPWhUn76Eo=','2017-09-08 00:29:46',1),(47,4,'k06u+fyVOBQaPcQzdaXXfAKE7ZjMFiTXzGK2Z0p3B5FWCNowxTk7p0FV4aYWzKRODNY=','2017-09-08 00:30:57',1),(48,4,'w45VcfrtGqsw64WEOV5qdiQq4xgZuhl4qtWiAR/uCEk6XOj6AHpFlYyqsrpR+nQVGW4=','2017-09-08 00:31:04',1),(49,4,'CXTf9fQEkCRC6vMhNIdApaJoDqD8g4DLjIFEbDtj4s9BRiPJJkXFLb+Tgl7jzeMqUOw=','2017-09-08 00:31:11',1),(50,7,'9iLs/SfG7PuWgC0eQtJwbq5kj16eJjU+ml+3W/Ip7MHa9K3GGigznAGmm9NhV/brOPo=','2017-09-08 00:33:15',0),(51,4,'woVBQl4t/NT+5sI09aZeyIUNyWWfxJkVMr04B1wisUDKLSxhfrPhMIxpMVJZG3lwjD8=','2017-09-08 00:33:30',1),(52,4,'E9soi3VCkKrc81yuobG5dixExPJt/YksaUVGleJMdP8kEeZphAshPymjP67oNflqLm4=','2017-09-08 00:36:37',1),(53,4,'L3czLPOQiejBsLFKUTPPJ7DYAS0pbSlvJ8Bc4xeAkq/QglcrZYOQ1sWxWujaSOSEkwM=','2017-09-08 00:38:14',1),(54,4,'SrnmBO64f70ykObX6eh4H9cdHHRG+z1luKnZhiHPyO8RzrRCQ+rGNoYUFNk4oiRAab8=','2017-09-08 00:38:35',1),(55,4,'cPQPAZHQt59+zdPVloh8lzQu1SOvO/PnBfvvEDH9yBRKn2v/41yj1+RwoqgxctbTrYg=','2017-09-08 00:40:49',1),(56,4,'To1jyiXe8KWearQVEsvEkXqnoYyS+B1yNxTFNMhIQnWGIjco95AWPeufXfarcCrsQSc=','2017-09-08 00:44:00',1),(57,3,'3zZkK7s4Z5D/otY60jMvAmt/q/PFUOQS5duRHj5nPky0VaEKbE6R0yhwIPnK0wy9HtY=','2017-09-08 00:50:47',1),(58,3,'FvklY+9sNLyG/5p+hCVp1mDcxOwuPhmNyKA5DR6JZ0lv3jwB5OgTIIMSiWf1wuhLlFY=','2017-09-08 01:23:49',1),(59,3,'nVoffjl59RTI3+nJLgEcoGxC2m/tMvy2PczXpGwS4rSABXzGbWXNwh509gfUlUccRAI=','2017-09-08 02:53:59',0),(60,3,'k646n5KszMajVgZ2lcl9uapqgavPZxQECWoRN9ZmKtxcUYF647XmYUS6dsJiYak14cA=','2017-09-08 02:56:19',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_flow`
--

LOCK TABLES `money_flow` WRITE;
/*!40000 ALTER TABLE `money_flow` DISABLE KEYS */;
INSERT INTO `money_flow` VALUES (1,6,1,4,1.35,'Annulation de la commande n°1','2017-09-07 11:52:41',0),(2,6,1,4,1.35,'Annulation de la commande n°4','2017-09-07 13:55:38',0),(3,6,1,3,2.25,'Annulation de la commande n°2','2017-09-08 00:27:51',0),(4,5,2,3,5,'Recharge du compte personnel par soi-meme','2017-09-08 00:29:09',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lines`
--

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;
INSERT INTO `order_lines` VALUES (1,1,'00000',3,1.5,0.5,0.5,0),(2,2,'00000',1,0.5,0.5,0.5,0),(3,2,'11111',2,2,1,1,0),(4,3,'33333',3,6,2,2,0),(5,4,'00000',1,0.5,0.5,0.5,0),(6,4,'11111',1,1,1,1,0),(7,5,'22222',1,1.5,1.5,1.5,0),(8,5,'33333',1,2,2,2,0),(9,6,'00000',3,1.5,0.5,0.5,0),(10,7,'22222',5,7.5,1.5,1.5,0),(11,8,'00000',1,0.5,0.5,0.5,0),(12,8,'22222',1,1.5,1.5,1.5,0),(13,9,'00000',4,2,0.5,0.5,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,6,1,0,'2017-09-07 11:49:53',1,1,1.35,10),(2,6,1,0,'2017-09-07 11:53:28',1,1,2.25,10),(3,5,1,0,'2017-09-07 13:53:03',0,1,5.4,10),(4,6,1,0,'2017-09-07 13:55:14',1,1,1.35,10),(5,2,1,1,'2017-09-07 13:57:24',0,0,3.5,0),(6,7,1,0,'2017-09-08 00:43:25',0,0,1.5,0),(7,5,1,0,'2017-09-08 02:54:58',0,1,6.75,10),(8,7,1,0,'2017-09-08 02:55:13',0,0,2,0),(9,5,1,0,'2017-09-08 03:33:31',0,1,1.8,10);
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
INSERT INTO `products` VALUES ('00000',1,'Autre',-13,0,0,0,0),('11111',2,'Autre',-3,0,0,0,0),('22222',3,'Autre',-7,0,0,0,0),('33333',4,'Autre',-4,0,0,0,0),('55555',5,'Autre',0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_to_match`
--

LOCK TABLES `rfid_to_match` WRITE;
/*!40000 ALTER TABLE `rfid_to_match` DISABLE KEYS */;
INSERT INTO `rfid_to_match` VALUES (1,'5381206120','2017-09-07 11:43:37'),(2,'5381206120','2017-09-07 11:48:13'),(3,'6997112120','2017-09-07 11:49:03'),(4,'197211104120','2017-09-07 11:55:13'),(5,'','2017-09-07 11:58:29'),(6,'6997112120','2017-09-07 11:58:33'),(7,'6997112120','2017-09-07 12:04:57'),(8,'','2017-09-07 12:05:09'),(9,'6997112120','2017-09-07 17:27:57'),(10,'117116211120','2017-09-07 17:28:04'),(11,'6997112120','2017-09-07 21:15:56'),(12,'6997112120','2017-09-07 21:16:10'),(13,'6997112120','2017-09-07 21:16:40'),(14,'','2017-09-07 21:33:49'),(15,'197211104120','2017-09-07 22:31:27'),(16,'197211104120','2017-09-07 22:31:32'),(17,'197211104120','2017-09-08 00:24:51'),(18,'197211104120','2017-09-08 00:46:20'),(19,'6997112120','2017-09-08 00:50:42'),(20,'6997112120','2017-09-08 01:23:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,2,'register',20.95,0,200,0),(2,2,'bank',-8.5,0,200,0),(3,NULL,'lost',0,0,200,0),(4,NULL,'spending',0,0,200,0),(5,3,'somebody',-8.95,0,200,15),(6,4,'somebody',0,0,200,11),(7,5,'somebody',-3.5,15,200,0),(8,6,'somebody',0,6,200,0),(9,7,'somebody',0,5,200,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,2,'super','admin','admin','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_SUPER_ADMIN','0','livrognebar@gmail.com',0),(2,NULL,1,'bar','man','barman','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_BARMAN','1','livrognebar@gmail.com',0),(3,NULL,2,'Damien','Meur','dams','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_ADMIN','5381206120','damienmeur@gmail.com',0),(4,NULL,2,'Julien','Daniello','dan','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_ADMIN','197211104120','juliendaniello@gmail.com',0),(5,3,1,'Nora','Fallica','nono','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_USER','4','no.fallica@gmail.com',0),(6,4,1,'John','Doe','john_doe','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_USER','5','no.fallica@gmail.com',0),(7,4,1,'test','Test','test','$2y$12$QjvC.DhLu6Ram/qXRUPjlOfyqvOF/gqSgob2QYDOU6UN9vua0Q1zK','ROLE_USER',NULL,NULL,0);
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

-- Dump completed on 2017-09-08  7:22:02
