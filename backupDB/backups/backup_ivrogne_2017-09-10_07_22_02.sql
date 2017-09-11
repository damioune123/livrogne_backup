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
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
INSERT INTO `auth_tokens` VALUES (1,1,'8NII9pWUg7O5tFltcFTcBxpqXSlCZo0IHGhMCoZRCrNq0DE/U3hVXDgRG5nSqDIuZGk=','2017-09-08 15:19:05',0),(2,3,'ZbiFYq4/YQ5uxpWV0UqSz4doexaecQYPz/o+ZKtmCwu+frFhEoJ808gngamXEh6EjKc=','2017-09-08 15:24:59',0),(3,2,'L0f6CibyVDCDficKaU0oTJ56qyorqvZKcVVEBU4qTG+cTHOuf/E4DwoUQl8zeTcMy8s=','2017-09-08 15:26:56',0),(4,4,'yy/BnwBZJEeXbPB4Juvvh+zbS6/wi530AFiR8IYerd38VuLAj4PEYn5chSwlhm0f2XM=','2017-09-08 15:27:29',0),(5,1,'B50n3JdNvM+eWpRoPg/CXMQiyw014Pwv7oyd5X9loVp14DAuJovTwM1AyEYcDfqfRNw=','2017-09-08 15:28:57',0),(6,1,'faQqqfo1Mog28dt7UM2mbY/U0TX+FiSQdTdQvX1ecJhVYSJWS6BnhZEMZEGUokPP5C4=','2017-09-08 15:29:15',1),(7,1,'1nC7jnXThwZoNe81+e5iWpBSmYm7IHy/UiMz26VvfvvbXAuSuEgEfZAPvohLzN/zD0g=','2017-09-08 15:30:35',1),(8,1,'L7YiCJ14Muuut14S2rqrfaz6sMZGs53BEgECkpxpURoL0FHSPPCdEcFeoQxE1PAXB5E=','2017-09-08 15:30:41',1),(9,1,'DylQdc0Rs+CQDe0A9wQEzv90G/9uzEp/pbAipqUKan9svLv6BeWE3d3yaOL2x5mNrQ8=','2017-09-08 15:31:10',1),(10,1,'XMhwuO8CrNlPIU8TadoPsDdFthnNGF3GnpYJPWvgBp1cg7SuqhgKbXqezBi0ypYXodA=','2017-09-08 15:33:41',1),(11,3,'2Z5P7R0n4MHa6lz04PoCFmAuPt6igy/a00YPSZMTp99P7A6ZLbFMV3u9/HPLNrLOGQs=','2017-09-08 15:39:28',1),(12,3,'q0hrA47azhxE4Wh7m3WpT4O2bTXd40qdEuXzZ7Z+iXCSqtRn47Yo+kG0CzKXXLCIsRI=','2017-09-08 15:39:57',1),(13,3,'8/3MeoETPDqDFwZbJCpDWrEdb7yRyxC79j5ElJe1QIbZjjI8uPxlb8U7mZHTKNoOOSA=','2017-09-08 15:41:11',1),(14,1,'2MAzZCj2gl6vMRYew9GFh00PhALQLWbdEGqp/QWnbFjL0LBf6B5fMaExchYxqU3eVN8=','2017-09-08 15:41:53',1),(15,3,'Zc1apVCDLEYuRCmlwy7kEPt7JyWoemwhKfJLPXWSZAQ4jo9NEls5dW+qI/kFkDsOxtI=','2017-09-08 15:42:43',1),(16,3,'GQ6EZKBp4tn5Wfv94uA0ZsxtiYewk4ZLyChW8jC9GA37ujyrzGg05oSUcAy9LUNMwYE=','2017-09-08 15:44:20',1),(17,3,'D4zNHWhLTyo/zCnAPlJEyFH/1ol+seiCHt6cy13EvYGahf48asiowsxa2a/SDjBCHJI=','2017-09-08 15:44:47',1),(18,2,'IiN31klEYWvEeYz34BDgtpFmLC5AbMa1ohlImkcFGh02A5QPghCSMTH1wYqDrxZDPzE=','2017-09-08 15:45:37',1),(19,3,'GoEkuo558wO0nMIXJVtsCINJhf8C0oKx/sWeLdzAyCBxtxP9wISSiPdEu/RB0HGc8p4=','2017-09-08 15:46:20',1),(20,3,'kwP3lu1uXVClmcn2HbTZdSZWub+8ryFtxRTthesj0YYElQn4abNofeJavUgWICEVSFs=','2017-09-08 15:46:54',1),(21,3,'+K7kLspxptFFo4WVI7WcmcHq/JMzQQYU2BR9OyWFXh6pmkefJ2iYUoaMvyACd/P2U10=','2017-09-08 15:49:55',1),(22,2,'1uegytZ/yey+fJATDqmuc9NXfxFJDYakd9KCmRLu7DTuKHN4tSsizFtB6lkEibyaKlk=','2017-09-08 15:50:39',1),(23,3,'bu20n2ojRn9LRGEuncTq9cdFWF9Q881NXoLLg5wlfVKKmPfJKSb+wZ1+8uJblSQY+go=','2017-09-08 15:51:21',1),(24,1,'te3ow9xeW9/KUgYDw5ue3PCWj+Zl0F03/GYhoeIT284eBYFr5pfC5YQq0uc7PKEAhIE=','2017-09-08 15:54:09',1),(25,1,'81TeQtue4GOQue3mgn+PmRnyTMpg7xnprGd9Ahg7qDPN/XaSk0EwP0oDx5D4++2SnJw=','2017-09-08 15:56:03',1),(26,1,'CS0sMcTK72zRYXMPZxnld/xDo3tdEdOepEd/FL+NCUMzO8Xg1PdMXYqoat/7hf/tNT4=','2017-09-08 16:05:23',1),(27,3,'JDjKo93w3/vDVtaBN1H6m35IEMbODk6yk1AYz5Z2YPEWUCb/0UvJN5Hz35QhYs4wGBg=','2017-09-08 16:06:08',1),(28,4,'juYW6JqxsusAUdOBmTM7xe+DkV8CbLpLqr3RpVJeCbu0Y8L2w7yZ/kDPsLoysjJGnL0=','2017-09-08 16:25:56',1),(29,1,'fe9+TXU9RiGArwntwIzvotnTec7UKI+EKQXrzv28CKP4JwM0SGql/pA1lhU2F73qkNU=','2017-09-08 16:29:06',1),(30,3,'rHq8TdNhD46IKkjhqenZUeafrTRG3ruJKZ0E6n9PfTPiN/oGkFNON1/lnx7deGWKLVE=','2017-09-08 16:30:53',1),(31,3,'pnFFfZYsDOkDsiggSluDn9QkeA2QCW11XRIBgyUyk2PmrGLqxP62fGbVYphgYIgjpDE=','2017-09-08 16:41:26',1),(32,3,'Ks9lk70nqAY4vv+lByuvoR3jodJgExNddW76+yjlo8KmTOp0dLMQiSgHV+fproBSJCo=','2017-09-08 16:57:59',1),(33,3,'AsIUrmIU8Ova+wVmE+X35MkmK6e0HMQtYee11eiEQPvAb23ceQC8any4h5CXTmvqxjw=','2017-09-08 17:03:38',1),(34,3,'Q4el/HmINXepHUo/YO4W1Sf5Uj13TS6FzhDSdwzYojPaxRZABbiU0ISIE1PdXJ/nUQ4=','2017-09-08 17:04:45',1),(35,3,'eSZ7zhX7+7/gFrCR6+lGs5fNztPWZ3MhmUseNJnHJPA4HVAoUnwVM+HBxOgmDg8W//Q=','2017-09-08 17:05:20',1),(36,3,'z9mgR2cctuoPXoKbLnC8xe9yB/7FfR8x7lm953UXcsfKkmmEX+mtflRLa2uuudNSg58=','2017-09-08 17:05:35',1),(37,4,'50k2HojmOkUnrUBYdYZ9ilZNIUnnp8XxVOCeW4j4X8sr2pwOtyaX9lXrzbLACj0qJeQ=','2017-09-08 18:36:03',1),(38,4,'3n8VyBJWZURTNuHkhKoBcI+SPz0/I/moKIXXbH1mH2hpozGnFz1I7Gyk2BtsBQNVt0Q=','2017-09-08 18:45:14',1),(39,3,'LBug0pn+4pCrUR6P7031xpVucER1fLrRDUNM7qONlXXYn8W8t9kvnfUiPxfQz3mY85o=','2017-09-08 18:46:09',1),(40,3,'xW2D8SAqMGDa80jqNYqYKpVqaDA0g/F2AcFgsdEuh4zY04PkdUczVwHhUehYJAmjqmE=','2017-09-08 18:58:44',1),(41,3,'qwWJL1Z4r+Kut14jdSuK539nBXYeySjI5p1I7QMd9jguPvqGeg2WD8CywgMgUfZeDao=','2017-09-08 19:02:05',1),(42,3,'YUcD/u42+pyEQBpDHemMB9NxW0ua9N1CUgzGF4E3REfCSSu89TY6A7ze//W0tDFgfoI=','2017-09-08 19:25:45',1),(43,3,'PJ9xrsqnK5k4qc7ZHArIdQA9Chvj7xSxiuVnSIB0CbcZeG/Ncv/tw++MLA4YC5gftxs=','2017-09-08 19:47:09',1),(44,3,'CQd8KhAiUHGYJrlpAA+QAiSh2o9Ot6pWORec1WNwIAz8anXAxarzSHOfqGRbNoQwpSw=','2017-09-08 20:15:21',1),(45,3,'DeiLK+V2OjUfUxyVU5KY723gWLcbhbc3HTd0OD5CydGRlGqaKxGQHvvbhcqmqHmgLBs=','2017-09-08 20:35:37',1),(46,3,'n33E5OclL3dkmGx1UOqR4hkB/FvpZK4h/TXq7LDtNeiS18Rjivi119h7ubC4PNSwa5k=','2017-09-08 21:06:31',1),(47,3,'B7JRCmd9SRKHqVg3Ep/PgoDGeXA1KnttQx3gyXORQUsVW5TY8eMoVa0M7iIwK0grJA8=','2017-09-08 21:07:34',1),(48,3,'sc1N27E9GmPbyWW+HWlDLLtQ2ud39lOaXw7AkyO+bhktkrWLF8WdS7PqqFkclHgG4Pw=','2017-09-08 22:06:32',1),(49,3,'aSqqZOFTXH7IolabWGVbXz8mHmvz2iJ4upUR1BTjPhqYG+FiayV6qJgx4k36kiRmZ9M=','2017-09-08 22:07:06',1),(50,3,'3FjEP+NZgrcouV8M9xd6thIPrkU2lVGsUbdOuMG8la0HBkuDjMLOXPbY36cTfP8QTt8=','2017-09-08 22:07:39',1),(51,3,'yBAUZsIiKp8p7jS7+lTuS4dwYL4Gdix8vX+dyDEwsONPcGeKnemV69WtbzlfuEtvooM=','2017-09-08 22:15:26',1),(52,3,'5Nqb0Km8ZRdmiABQ4A+wx8dH/o1YiZbc6EBdC1/VP6G6/uifft0HOG6Q6VBoGkdUh6w=','2017-09-08 22:31:05',1),(53,3,'iT3Q5dnLtWu4cqeeLCPJeNf1frHbhK/QH7D9CHkS17LW37LPok0bNkYsesNLgZ5Ykss=','2017-09-08 22:46:00',1),(54,3,'TiRcKeYs5JykfWlK0BZXxQggS3CSpSbwD+IbIuJG1uCSs7lwRftz9YRNO/RG4uaTtI4=','2017-09-08 23:23:50',1),(55,3,'B73VA7/LmpIpNeRKMgJ/V57x/4Sr9ihX15Du/nQ0TuCNMSPOo0ejvHEvt+MGeWko5v0=','2017-09-08 23:46:19',1),(56,3,'VkledY5776KKE9HVipqb66qAposHXkSQdHpXwQx5BESe+no1sQSWr9nNAa4AnLSOu2A=','2017-09-08 23:55:26',1),(57,3,'NsKkZF5U0/7vjIasB8lnPZ0aBMnZoo8JyUJD0T4MrkgqDiuW6Xf+Z3RlAV9v7EqUdoc=','2017-09-09 00:26:00',1),(58,3,'rsSXW69dbVXllWksV7ToAvGkd1sqkJOrSP7ou7raYoqvHMGMvl2PcC0tMMSdY8nnNhg=','2017-09-09 00:58:56',1),(59,3,'hqLqZaqq4j0RfP2AjYbES5e+9Bva3TlwFluWxABVbYH2zkMZ76afC1RF3S0lBwvT5NI=','2017-09-09 01:10:36',1),(60,3,'gspT8N/shKQ7WxKbaDOWhlExKkJrz+NqsnJkWAj14rOefQZOW+9Ycu5+ooX+fpTQpyo=','2017-09-09 02:13:52',1),(61,3,'hOD974I+8YWJfyzUcmEL3a9XeTwBS+Ebfst3pgIm+sYayRTHPR9wqLG4kn5JLrdd7aM=','2017-09-09 02:24:45',1),(62,3,'WJjUltiOXoGj/J8g3avPn4aUCh7Lst5cqkap871xLRbyo0GlIuCPUAEY09buubO9TFs=','2017-09-09 12:21:05',1),(63,3,'ePG0TDagr0QMCYhXEDRLuhjRBeQBNQpo3nnnczJj3wOJwkGCSVrsyMOkjK1ebnc1PQQ=','2017-09-09 12:21:15',1),(64,3,'vEQ88wnz81qvhGVYh2py2mS8EQ6eOQsNbDlo9ymq7SZ791+JeQsjIvmVUEsekBGfcnI=','2017-09-09 12:21:37',1),(65,3,'Lz2RkI9BIaMJvxp7jAvzbfH4hVhdXdI6IKkMVblH2ixtos4OmMTgYRtQXJqPdaunyBc=','2017-09-09 12:22:25',1),(66,3,'U8xyaQ2vujueCPorwX91z1z6ZCex9K5BFODMapZsIFRXo2aerZi06iUd1EUko7ZME0s=','2017-09-09 12:22:48',1),(67,3,'nig3/thFaZRw9taCo3xdWIbIveKa1+rCwMUz45Doxf7/1CRZupUMnYoKHUoQkznbGjI=','2017-09-09 12:23:49',1),(68,3,'FZKpL4DID04z5SNYQlhr0AZ5TlRxrjUe20z1DicvSpJd5f8I+tNuNvJXSYozTqTyfI8=','2017-09-09 13:16:10',1),(69,3,'4wKZv4oIVgaXph1VtyaQSWRTedes927EeiwoVwyQehx+pmwputaoau8HM/Jo7Wlg4mg=','2017-09-09 13:16:18',1),(70,3,'YRJ8gS9S6Q6hQ1BO5yS+P0z8IUpGd3nYwzm//SVzqsnJjvyVRaBKzQEobTqXy/9VZ2Y=','2017-09-09 13:16:45',1),(71,3,'zB5/+hBlWUIcVUt6YZAo5pSgvikWAvVM3xt6SgrmLzTqmGT5DyhG86y7xfK05rqkCBE=','2017-09-09 13:17:41',1),(72,3,'5HCQvmKrhZcTNLI+L7jiQkhZIggOGAtu7gYrAhXy7fYGGcqPDTwWACIUMGICuSSVeYg=','2017-09-09 13:18:30',1),(73,3,'tX+MnPQBIa9S6U1Xpz6Wa57wE64X4uo8fPF2Y7Vls9UbS3J/dphfvsJ1NA6GBJ/nGPQ=','2017-09-09 13:21:04',1),(74,3,'9FRw/S6Jr99AcwOioKncxK1hZfZhXDUcygrBnqFmp59uweELsLI9OtxrVt3GDvY8dL8=','2017-09-09 13:21:42',1),(75,3,'xUVc5hfqIOlnS42xz4A3exfnXmlT611Fera2NVNx9zrGRf6wH23hTmv7PNHFkptwKUM=','2017-09-09 13:22:53',1),(76,3,'C/rcoJIEtZRmclSkC26Vy0cBhJZJUrmXm1GQexteIXDfFv2lFGAbZzi7UC1BSCr2FsU=','2017-09-09 13:24:25',1),(77,3,'5ob+rl0RHbLBXDzRow3yZ4MXDnXOYSXw+9qBKr49MjvM1IZXVn0uJl1kgA1lQL50840=','2017-09-09 13:24:44',1),(78,3,'PnOoBCkFDtgodJ/uXGAZNVzLdfJQbO85JhJpVnUcAEck9WbK5/ZwDQQXdUIjVC/5mN4=','2017-09-09 13:28:30',1),(79,3,'YY8xRFqLmDHiObGJszTDw0DDNEjBgYYkNcvQnb/gXixuOH+GOBJc7Dp4szq+WRwhSwY=','2017-09-09 13:28:45',1),(80,3,'hje7/pTi5HYOT4R081LSuk6KVl+1rKfIIRnEk+OvRne1YANqfgwbfeB5whUbP/kH6Rw=','2017-09-09 13:29:03',1),(81,3,'YI3EydS+WxzCYMdSDPw8aXq65sBpK2b8doy+XnwTIfIbPUNWwQcJeIrFNat4hxd3VRI=','2017-09-09 13:29:15',1),(82,3,'0Xq2h/67myNnt/MH75x28xv7aVGZowi8Z/JzKg1Ec5G8oIjf1aXYrybY8jGkHz+9X2o=','2017-09-09 13:34:37',1),(83,3,'djGk2qNkgAPutSd00smmoYq8lEIB+8N/6pSV3ghpebzD+WJZ+F4WWRje4FBIFyk++2s=','2017-09-09 13:34:53',1),(84,3,'mVzMcnGzu3oZz/qZxHQNe18qytWBAyarxBNdTTgcDUMaJujgYHN8+Wjw+e1PO41mhec=','2017-09-09 13:35:41',1),(85,3,'e7aZBcz0GZRl/S4UfYhZSEOlVNvJFF7Ho9uKfm5CsRd2WWnqdKQm/RwMxJHW7x4AhPU=','2017-09-09 13:36:27',1),(86,3,'ffhZnp8V2D62tI27W70/3g6PFoi70wsU+bmK9gLw6zP7Eom8+UgEkbwKyiVTNh077sA=','2017-09-09 13:37:03',1),(87,3,'UNxW2ja73/t/hO6jefcJlj+ZyHB5RU4KG+kB3cFA6MBQbcHcVGDnSClGHu0re7zQWy0=','2017-09-09 13:37:16',1),(88,3,'Nb3QBhBjNNIR82O0YqPeIRVMReSs6vW/BQ231zGnhx3BIp9TdcH1Bdey8MsAC1ubtyo=','2017-09-09 13:39:21',1),(89,3,'tBJOBaSRvC8lSfnnDnwGaLUjYGh46PyqFKBX/ZaVPf5kGejN562M7b8+jQcC7vaLfhI=','2017-09-09 13:41:18',1),(90,3,'3scp8FFMC0gscoS++1Xskh6Iw6BDuzLSVXWGLfz3XC6uUM8SuVyQgL+yzy+67QQVrKs=','2017-09-09 13:41:32',1),(91,3,'URuTuvRQxqE0CPJ7HTHr02trJbUajQH88CyluIXuSJLn/Z9GTRDZFf2nnn8Cvw40Rwo=','2017-09-09 13:43:26',1),(92,3,'zfPvTqChCRDVaM+aRE9JWYMgvNficK+FxXSNw9lKdl8P6vncpv7xzuWb7klyV0sm+1g=','2017-09-09 13:45:52',1),(93,3,'kLQp+cHCC+Bw5tl909Sj/u15YPclfeEn0wuRjnvA0rCwd/o9Q1T3C7t3TZf7QAxBbcQ=','2017-09-09 13:46:55',1),(94,3,'7xdA+vRC2t/SYEBlCuhtKy+6vO8jayspEV0u5hTDsFEroHTRBFBoaMeJUE9dhm8E1O0=','2017-09-09 13:48:23',1),(95,3,'SFiS8Y+7dpQ6LSyj7FrZhrHfRZG2ZIGkYUZ0bvWp1H2XA0Zmlgnb6fId/wi9bnyzmIg=','2017-09-09 13:48:40',1),(96,3,'H9ahsCarCR1PR0ZfkX9/9L4KaccOKi1tNJZeyXHULm0GnUyMMCvhcZ9iE6MOcWNWFFA=','2017-09-09 13:49:02',1),(97,3,'SVASW4Ga8BAJHjQgpVt2NV5QmNCqVlAgXH66UZOxXxE3cj+eMsL+4jIhA56uXYLZG+c=','2017-09-09 13:50:14',1),(98,3,'2y3AMbp0B9ohsU0DmcgtPmkVlfO2kXryHE0mwFvQz2c5F/AZeROHvsFxZOmSfMInvb4=','2017-09-09 13:50:27',1),(99,3,'ox/wfhgVYNtu+jCmnkaBsDOdnkIAKa7ANIFHd5vz1KHzq3i/zHMI7rdfAeQi4tm0qzM=','2017-09-09 13:51:01',1),(100,3,'wg/Rqd1IRCH55k/ZWCECDjZr6KVlDKmkoYSnuyYEKGf67os/BoJVi48I6Nt5JXolbg4=','2017-09-09 13:51:49',1),(101,3,'cyKsGProBROCCSfcK9PhsVacoGtJz87IfYTWcMBlLXnjWxv/SgP3C9NwW2LCL9IQccE=','2017-09-09 13:53:54',1),(102,3,'DvrYgIjUsDuJCKzUp90oIbDOSsbTQ0POypSf7lnXSkcpuHzB/GyErZLcRGowQB10xGs=','2017-09-09 13:55:18',1),(103,3,'H+AIjdUI5gKEM3Bi4HKniFA5k/acd1IqEsMAh8qswEJi3HZ56Ijjg4K6+MiyNR9iNHs=','2017-09-09 13:55:34',1),(104,3,'Ak1Tdmuof/EfVT93Rj63EuRSxmZlhEHgKv2Lao1BAIPPSpKIHITjibeJO2deuw0x68I=','2017-09-09 13:56:32',1),(105,3,'r1QDd1ZXk3BtQ6V/oRybup5bvRPP5k/DEI7mlPV5VJHReC+cn8dhLa6RFhyH52wvugg=','2017-09-09 13:56:48',1),(106,3,'mLdwjkSKtPdRBFejG3t1/GcKgYhFXWGTXEMq7nwU2T00geerB6LPJtcr3XB4kwKjqJM=','2017-09-09 13:57:06',1),(107,3,'EopIrVg8kIfR5/QbKk1v5cKzQvP4d4fgtiPpagpbWjq4zLFZSaHVKD+JZhGkTQdwT8c=','2017-09-09 13:58:19',1),(108,3,'+iKIy/QFYFCbv0/lReyr+SvawNa3SyOaYuiTpYlAZW8pnVYhYiPKnrFNvfzq5ZBzu58=','2017-09-09 13:58:38',1),(109,3,'T4FaWzmrWVAGXyQkDhnIT+vgFfI6zCSdV5Ml6OR5kz0psjAj+GBrymba0tMuS8Ym2Qs=','2017-09-09 14:00:59',1),(110,3,'D4JzxowhEr9ZevijqpuE9qE1Gp55C0s/lPhyugrMFZp1F83FwoSpYjanGHlzB4p6mB8=','2017-09-09 14:02:27',1),(111,3,'ik8lOx51GZplckZVaDb6Gw8Gsf0N9Awgwv97ipyP94RNy+kzsHQHsTqbWhto+huB9b0=','2017-09-09 14:05:52',1),(112,3,'8TBvjYcCvQshfuBxdsRd+XebAyvkOx3voUoYSu9+iuACx8WzZqQ22mgducQmowthD/I=','2017-09-09 14:06:32',1),(113,3,'JzaTtifpV84gry0uEMCRPLwqA3q5Mhj0FAjr/akeQDblfL6vZ7JJsST90YPREI63olo=','2017-09-09 14:51:23',1),(114,3,'5bO8Ui9ET3lv1WFdXEgC0L5hxm5GrT1sSCmOaBADbBhX/fUwZF24DxoSjiL6n/D0Or8=','2017-09-09 14:54:20',1),(115,3,'5EG1ZUMnpiafFFo5OqTW1JH79Il2KgL+JaDCbPRtTsf+RYc0p/76UbQ3ZmWxJJoOkyU=','2017-09-09 15:02:17',1),(116,3,'JErtIWbXlFeOt98yxTjs2t+Yk4TloDbdwB2EvKKsP5u93zRd8VhA1lfHDQULsUymkcQ=','2017-09-09 15:03:02',1),(117,3,'WFMNXKUVke14KxdizPIzd6H2/h70HZrVco9uG074IDc4dfzX0A4xdJaXohJ8CXLWieQ=','2017-09-09 15:03:18',1),(118,3,'kRhp7Yh0zoex9Z8ZvyBA+I54TKcV7kZGwqSXrjVCX0PwNgFGFAkGvRFWb+wCgRLxpn4=','2017-09-09 15:03:57',1),(119,3,'OFg+Jl2GnCM8xUIiergKzCEykp4zQccW9qkYPdVg1UfOZ3ROCNBTJA59QyMZqhK2nho=','2017-09-09 15:04:13',1),(120,3,'vQ1JvxoJTTXnW3hUQ62bYxHLdno1XGwvIz61tJP1poyTOVJvEFxtXhZBrssfVMyTWfo=','2017-09-09 15:05:23',1),(121,3,'Gsw8JK/Z5xrcLqF+TVhRwDc5a89SnFy+9C8QIbJd4tAFY4RJFbYD3KnzlBzZPglBGUg=','2017-09-09 15:05:43',1),(122,3,'sKcJMhUpCyj+CRjb6E2wWAWZqg7/oRr9fN2Yvn/IJx42j1lKv0vVBibhOrqJHN8K5Ts=','2017-09-09 19:32:32',1),(123,3,'8RVMCWYuxSJaFJRW3oVSjOVrMAwcv0PznZvk8Ze9XNsDwRo6DSGPoJddcphgIS1FZ0w=','2017-09-09 20:32:53',1),(124,3,'NP7iUABNayaWhqWazKVMMugTnnByNO5btuqACbFQF/KaB6utqad4GpejxEfawqon8MY=','2017-09-09 21:43:03',1),(125,3,'65WQJ/mkFiG3yZpFI9LJh5d2sZESWjM6vzXzjqlhf9U/Y+Xct9Sba+WTQrvYsiXHL60=','2017-09-09 21:43:21',1),(126,3,'kdEqof37ybvxm+087acFAkJPxQ6Ik5y+T3MVqXSHB4eLVjrzRfzylhwXIz5zfCahnew=','2017-09-09 21:44:14',1),(127,3,'GDi7+xqpOtF/1M1H+o5vUE5pVfYZUOoGF5jCZ9dfz6c7hKQaVPoz35ZOe6YQ4RpFSo4=','2017-09-09 21:44:20',1),(128,3,'qYn+n/wosdV3PQFFRUnyDsVyVjhiigdDRmo2kBv22NfWz8aX9cv2fVSuarBdzS5kajE=','2017-09-09 21:47:15',1),(129,3,'944B0W/0opNpaBz4Xy1BZXz6+ipxZgjm2hgWl0InCVIWPuZOX4YBNoc1HOzEIZPf4hU=','2017-09-09 21:48:32',1),(130,3,'am2mV4xYvLUh5Bx04fbpRmQ9oLnmcaN1EEK+ndcCjKi0WRjp8NYCWp2d0qJrpKb7UV4=','2017-09-09 21:49:07',1),(131,3,'o1ws1E/InG0qznAY++8yPvgfvNia/1NTbF3BoMjc1ytm4Gtt2bHQBbWT82oTFcwnJ9E=','2017-09-09 21:49:28',1),(132,3,'8n9SR8vM/kPsF2/fatecmrzr5m5FVRSs85VNeomMvQURD15q0RAD+kS8PLsy5taSkOk=','2017-09-10 00:33:42',1),(133,3,'WBbXB7XbBAGxe8zTKx/4alCf9I9F45McyVowWEYTTHRuSp3wgJ55RwruqGVXnHzSlKc=','2017-09-10 00:36:53',1),(134,3,'byz8/JuIhEZ1MRJPYYp29zaD3P9ZtwqzJRwnpmlFCEexW9L2bkcGXaeu3A5OtSHmigQ=','2017-09-10 00:38:27',1),(135,3,'za+Q2WDMxzrpVSkxDc5jpp+e9xTYfnRhEXS9aoRSbiiZorQhOqXRx7FKJ5x7oxHzxe4=','2017-09-10 00:41:25',1),(136,3,'uAf/ImjPPs6ow2c1XNAvOsrV2x04hDqRUCxIUSF0bk82b7SjnF5TcexIOdnRNRSisi8=','2017-09-10 00:41:33',1),(137,3,'kr7hnQivJWWPd22jDzTdF6AtrNCyivysDEgAU2NQNHnnrvQjiR/zE4GO15EZ+5spZGo=','2017-09-10 00:41:42',1),(138,3,'7jozSfxR9ZiwvjbP4DtEV1f0VzT8CaN464SaRhB70yZq8L4gjaZztxtvEbUriYUAcNs=','2017-09-10 00:44:01',1),(139,3,'iNhybDjouZIe+F5Jp8sl5r1lAyhRZIOh8AHDHuteBr4iI+0oQpE4tRiZUULhksdV0M4=','2017-09-10 00:44:07',1),(140,3,'Z4NXxP5ATg/cMeLmay+/RhYeZ2/uqRioB0NVyl37t+eZakSHYzi5nimsXObdTgL3MDY=','2017-09-10 00:48:16',1),(141,3,'oq866SC+kHAsSUo2XzR+NZu5OqAkQXwCLnvDCvEZ59Hs3rc49GwPP9ai7zAayUX1dyQ=','2017-09-10 00:48:35',1),(142,3,'v6WXdMGr6/zo5cZrpEPP5L2wJxeBH37b/Rj87/ng3igXJ1uFHck+R8dy9c+VK7u8td4=','2017-09-10 00:50:58',1),(143,3,'i2VKMmMMWdQJeQenkX2NANF4j1f6J65dydFMaE/vTe+Dl3PVj/nU01UDYYqikrS+ZcI=','2017-09-10 00:51:37',1),(144,3,'uO5Png/IwYh8blM19RyHRQf133zpg2X6KecEdEwjHBSwyp4rP7rtmH1xNnVEnQRXYLQ=','2017-09-10 00:52:31',1),(145,3,'ZCnYsYMRGW44WJcgVrys6cySpLMosfTSYnsPFhVj1NwcbKL4JscitMZ+pvkdc5TvvQQ=','2017-09-10 00:52:59',1),(146,3,'Vk+1MwlnWAN5zAZmQCCDYh2TzfJoDE5Yd7n+2VH9SWgMLg0K7d9Z17zG3GHQiMqoAHM=','2017-09-10 00:58:33',1),(147,3,'ymMpkQ6ZLXR+9Y5yDioWHPF5yHb3j2SaK398GMB9aX+jDf8eQhtDmkTb2bPk/6ylDvE=','2017-09-10 00:58:59',1),(148,3,'nHTpvEh2dyu3sGi0MXtEbVB6eIkDrMbMtDEKbLrW1l5EGX0pwHWmdAIF7y/aR1SU3hw=','2017-09-10 01:00:28',1),(149,3,'WNUJPpcq17bhA7/jwxFKBqV0S83M7a2BoIDK6h4RSv7rxKULLVobQK95YbJ9AwK18xA=','2017-09-10 01:00:59',1),(150,3,'mjGMm3CBDAxBh6Q3g+kk1Q8y0aqKZf/ePhN0erwK81pk0cljoBT+usC9sIaE57f7y4w=','2017-09-10 01:01:24',1),(151,3,'XPgOJk8yxvUelaKTiEoNe+LCYm0YJSh9f9TfSBc6JcUIoC2YKP5CHedKbcsBfViqCao=','2017-09-10 01:05:42',1),(152,3,'wsdLuX95h8DhbKjQfeYBKV3RLP/Y7McIdqke/jF+LND3m9EKp5aLLZ9gMkichs+9Q0I=','2017-09-10 01:07:24',1),(153,3,'COj6f4MFVWwLpPyGzwcG+Ials3SNtH8An0ddKOIIhn3Q6yDFHvS+FJOkunNWeXY/5U8=','2017-09-10 01:43:33',0),(154,3,'hC2DVza3nZIVQcToPAAfLSsEdONpqihDXC+uvqIGK8H4rwo95ah1lfLponx0lIY5KvU=','2017-09-10 01:45:50',0),(155,3,'wKbDOEGqV1u/M4+LwHEjRrd+GzUGkkp1/ooD3TtETkimIGmHafKwCwcblblSmQ4UCVg=','2017-09-10 01:47:13',0),(156,5,'cwHxj8XWUEQ4b9g+4ZQXMJ5K9GzR6zY39S2DnKstX2k5MJ78LHsqa3FOH0WsYTLVuI4=','2017-09-10 01:49:55',1),(157,5,'E504bV2FOrlFrBZVL2Y9mRSXBQ3BEG1cEchkfwwAKxlxamdNC1kySSgkmSPk4B0GKvY=','2017-09-10 01:50:26',1),(158,5,'VzUjKRY/eLhr0dZuICq4VUMdEX74H2RMbV0N+gxTLqhY1ylXwjvrZbfQVY/bWurNaPA=','2017-09-10 01:50:37',1),(159,5,'qQyjOL/FfAJatX4euwp2wMl5ESdAJWD4sBUdTpvyF3VUqAtXwimRNGRvREhV/kct0nw=','2017-09-10 01:52:59',1),(160,5,'3kNrWSrlBmKN1i0MVmHgM2WgL5ZAGNiXjesATIobKuBR9pI/hbNtoxc4M7uHRINa2Zk=','2017-09-10 01:54:07',1),(161,5,'Jbwh6qmYnOo7LY6pCwUohwO3u6TnO0n6sNHapL28wbc7jxrNCbafokvWYsoIOLnS7HU=','2017-09-10 01:55:15',1),(162,5,'ovL0CwgedBr6M92HKBeuEQVGLdoc/epbBLwxD066Fbw/esB8FZ+fP1M3iNqFE8E57bY=','2017-09-10 01:56:34',1),(163,5,'S60aieTHL7BZd29MhDTRjBNOaE/F8WWp7chqsrddFb8mtzO2O6VSp6tdlpOMKrNgr9c=','2017-09-10 01:57:24',1),(164,5,'NJEolRDozaOHbGTPCq0rN7ARZKvXIlJEpKJVKFH/Z4vikcbVhHdlUSX7+AqfrpgzFnY=','2017-09-10 01:58:00',1),(165,5,'KRSeRktTB+IkFuEewndolt2CRY4JT0XfW5WzvkVBff3WnuuqLcdAltMO0IfX0v/g6u0=','2017-09-10 01:58:45',1),(166,5,'ZmrzbYqlZvnl0pF8mqTkjogW2rImi6xuf/qF76ut6dGLsW6ZS/4BDNtC0U6adTnJcA8=','2017-09-10 01:58:55',1),(167,5,'2GpSNtVWdbs7awI3JDKEnj50NcG5TQWVCL08PJKCr95s4XHHG5vmQkE/FNJBeE6zthE=','2017-09-10 01:59:12',1),(168,5,'wZKb2YqMCPxYuJgZJSbGg3kxXl5F+g8yoqeMKIcVzeulYPTntf1GypSH7nfa8oUmLpU=','2017-09-10 01:59:58',1),(169,5,'K8dt4/OVCwNF8d0Y+7280eR6C3gSiESn31v+R+YXkqZT2YzkVtdFk63rjuSvEc2WMJs=','2017-09-10 02:00:12',1),(170,5,'l450+nFphKmr6EMmxQiyH9hCCqrCxC5Ej7uxjmdwQ9/QMkQhaVvHTfC4y355mpGRN/U=','2017-09-10 02:00:59',1),(171,5,'1PaAX/itzmTZmkxgD3iSqFBpj+6K4nxrBk2la/N7Luo1KPp2aHeDF2DuIseHLbrxLto=','2017-09-10 02:01:09',1),(172,5,'AcmVUOhl1bRsiOM9ff6EtlypSHtxQqrRnh8IDMwigInUT9hmQY/E/mTKViUgvtpZ5Ss=','2017-09-10 02:01:19',1),(173,5,'WgPvhC9LXz1busEhhoeMCWIDZCfMxPkjrHBhHRB1ADwK6mR17iMYoUZIecVYRVtaUrU=','2017-09-10 02:02:29',1),(174,5,'npdDsV2lQcUI1Jxfca2rwTQuwZgGOp/xg04nrz1+MRo+OScEVlqFMmXQMiSdxffnQHs=','2017-09-10 02:02:35',1),(175,5,'6tTu1pwO7va9UYKg1YhIGBMj1r/7jT31QvBHy1ggc7yir8sQ3OMateNlFlavxSPQ2fg=','2017-09-10 02:02:41',1),(176,5,'B3uDr5zqyChfUSF2XzawswnXr1N975o2h36VMk19ap16M1EIl+4pG8JcLWvJafniyW4=','2017-09-10 02:02:46',1),(177,5,'C7zACAXxgqrj4XewslVvOM37RVF5jjBqP3X1S5iR5Y5q2t2UPjuWaf/z8Faz23z/jgk=','2017-09-10 02:03:08',1),(178,5,'qaWARqgbPJ983O42YnlMt0yDFCYt6WzdAptJwEowIQNEBOHTVGkdXWTTo40kyAZa3ts=','2017-09-10 02:04:01',1),(179,5,'KZENGzi1rZtAjwgHEzK1eo3ac/Z0tikegdkzkBoCGl1Pd3jDVOggCuG/K5fzBqXhXs4=','2017-09-10 02:05:52',1),(180,5,'Ku8MHBx71XKGDh/SB5KmvXHYz7w8/iU1tJgUi2H+odCia0eqEbS+eUiiFYHqVUa+i1Y=','2017-09-10 02:06:27',1),(181,5,'vCriHvTC6y94CBkzPoD7ZjSflBKMYm6N8F3FWBf8Zg/QfUR+mW/P/V2siGPxr9fhpg8=','2017-09-10 02:08:52',1),(182,5,'SGN1v1iNBiiz8JG4AzyUxISpezj5TcEiSj8dTpgGNAdUzZmnzlCJHUzPDhEhWAZPHlU=','2017-09-10 02:09:03',1),(183,5,'Tzv+uIFcrlH8HCK/4XZDQbsc2bZkpunfcuO/j7Hngi6e/S9/0/1hQlZhDmxLQvi63lw=','2017-09-10 02:09:13',1),(184,5,'G2cXpOlfon4z4gQFO6nfFIvLZHCozrWqjFP+KpT4YtwMpcCmHgGRY6Eav7PZwI4cDzM=','2017-09-10 02:09:19',1),(185,5,'y+9xR2oEaFreJH9X/SrMENqSyWWGQY8vNp/ybau5homwZ11xHVGVausULPya5iPKk7k=','2017-09-10 02:09:28',1),(186,5,'DNmX/onumh4EAjmG/Xa0i0/bf4E0H8zjWgAWQfceoWbFbNy8Nt3o3OlFytuiW1WIWDM=','2017-09-10 02:09:44',1),(187,5,'fn3RjAZ6jrcEWTXM7cahLPgEAXwaIRkJv5XNO/2NHLaqv7RDzZRHa2CgI/seKgd1usI=','2017-09-10 02:10:26',1),(188,5,'ggz5IoAc98/uRStVUPJsyO2Fc+joWVwfcKFVs6eCNJ8jOm9QqaKj9KhrJrIigEbMUio=','2017-09-10 02:11:50',1),(189,5,'KvnO5tja99DYdNoyA9Z+siTQqu4TH4j5gPNoeaQtfwKPXNSJ1rFzbcDfFzoihPZQh3w=','2017-09-10 02:12:00',1),(190,5,'vzilQmTZ69X6+ib9fCWochU8rcp28UNJ46iTbAC/YKCmVQ8X25Fdo1FJoNAYxL5fyWA=','2017-09-10 02:12:58',1),(191,5,'t3AEWMwkR0wySkdZSkOz/RPZNBJWRrecJzG75CDcc3kQ/eyenfPs/sQY8XB43ZhbcWo=','2017-09-10 02:13:04',1),(192,5,'flh/PThOpEqNtU/T5y6k807wreKF4rjAZxJ2noAaKn0XZwtf3AuLInV9dybOhQSAArw=','2017-09-10 02:13:35',1),(193,5,'EYH8zQaGrcSly4SEx8PDjxL7jbY27KsumIiea24e+w+HpCl3xjP7DjCK6F9Uzgbm6Rk=','2017-09-10 02:13:49',1),(194,5,'QM3XuUW5WUZkiKm3WQmskShVjG1L973+JugQY+33zHsjzG3w2q/FHyLkVdoS6c3mwqE=','2017-09-10 02:19:05',1),(195,5,'tWlNPGxaTwbyy4V1FJ40Q0NdjNybHodiuaaBirQvYtcolemOq8s5kLEOBfw6BIfF1O4=','2017-09-10 02:19:11',1),(196,5,'JnGKRZqLOgusamS0+dbL18zyN3uSJzmdRNKmzJxPhy5hZQZIEy/XO7EPrRKGgx6F4xc=','2017-09-10 02:19:49',1),(197,5,'Lg9r4OenJJhvL/TSSviL+zRvLczxBW62WiOgjKmGgI5qKX9eBz6tW1BtEfE2MK3zAos=','2017-09-10 02:21:06',1),(198,5,'CgYOAUEI5mff5oZEanQCi0IsnCiByIg/T/yXOzyyerS2TnFkeMFN3Qzwk5dYI0tZJjg=','2017-09-10 02:25:30',1),(199,5,'b94kaIQ6CC9VFFJ2bQFjNfUmkwpUW05psmXgIRp5YTSPW7AZ89fmPIkcRJ7W/RmrlJc=','2017-09-10 02:26:33',1),(200,3,'r/Ul6KguX934/AUvlCJrLxNwxxW/dBdapARJvCKrxlyk4x9vpvP7DIL8Bi32mfNUUsE=','2017-09-10 02:29:49',1),(201,3,'1/UR4+mjEFKIKD/uT6xksuaSuhigs0BS5PVkrtYGyqmS0V4BzgWq++kn8u/ARMzijUs=','2017-09-10 02:32:27',1),(202,3,'UTTbaWy4mJzoNXEd6vfHHa+IuAxPSuwueyVafHGKrFPlms7nuz0fRnouEi5ktFeTe5k=','2017-09-10 02:47:56',1),(203,3,'5SEWQ6qYLjMFJ5Xaxe+zfWYaNnZtXFX8ly+3O+VbVYGb+sN34MJBlJtZHN6wU6btuBU=','2017-09-10 02:58:28',1),(204,3,'7nJJ2wWhuBuHlGO0iKPrWWh1G9hHQ1kBA46Js5DscHLIq7zAE9Z5o6d6oPLp19ziscU=','2017-09-10 03:10:29',1),(205,3,'MRkF5WgHfeMpGy/nkfj/QfyspH+bvpoa+lBHBLdEYZ8UeqY+1lW3UcddQybX5HQHl6o=','2017-09-10 04:11:21',1),(206,3,'FhHPTpGPKL6RfgIWr4Gb34aBKos7e4jMMYaFKd4a17jpfRr0lTeaWX08YlzU/6HNgsc=','2017-09-10 04:23:10',1),(207,3,'PEK/u+eHyKqFds8tjEU6f4Idxe2k9cgjkNvKX2UwUNMb1ZQmIjCjkh6EWzdczF4pk10=','2017-09-10 04:29:06',1),(208,3,'06wr9fk+xjBsufHI92BnoOH12QJYT7cqKH1f7UhZXGpiBpTxKS+UK4ruClAwm2sm7VE=','2017-09-10 04:32:41',1),(209,3,'l2rCAYZGVtBp7vHomIq0lLcTozqgbQpct4GVqA6vPGXlri8WAOClI9cWdeQtLr7Il/Y=','2017-09-10 04:42:40',1),(210,3,'qeb9PGuM+tJTlP8h/oQxCDZbGNN1rYD+PTZ3muDsDzdi3fbJcgpzbuKPR3WdKUgkIuk=','2017-09-10 04:42:56',1),(211,3,'kQEspwm2vaT/VQK13g4CD1HEecCxcu46WWY1ZFmn76txDy5edK7MXPZM2UWD31PEUTs=','2017-09-10 04:43:03',1),(212,3,'gbsndyu0DSC8jIuagL/6u8BKI4cz2algKW+Z7YyoSDjAjaMWFkGj4zplGl5nNEyAsMw=','2017-09-10 04:45:38',1),(213,3,'Ze3PbJbthIi7+OvgozkULsabrtaYQJwfAKDi9xC3sJKHXlIervNZ7QoR1xC6uxnTJbo=','2017-09-10 04:49:43',1),(214,3,'0zHYVDy9uvh8XxV12TT+n1j8+zNpnI8S801iCdFupN19me7rksIg7xsSWooed0afrKs=','2017-09-10 04:51:38',1),(215,3,'s46PKN4H1vYi4D5jKzOcSLtPZLOsujioIgi30lb10ZC1i7GtS+rGVTVoquZEC0u+0tI=','2017-09-10 04:52:07',1),(216,3,'1a2ExS0nnhvZhjVlnmTKpBF7X81lVE0P7st5PyrclxIkS6WvenWxkF6WGrdw0ug6OWg=','2017-09-10 04:54:39',1),(217,3,'99hrHxVCSC3syp7Blhqitk2FSm0WdhD0UVyj+LipLoy88XgqVU8W7MEnNk5G3x336nQ=','2017-09-10 04:56:24',1),(218,3,'U0lt/BGQqQXS7iu/PGvASqz3MvfMuYgIK7f1yWAauPUhqjiZSyqfqsaqU8TnHj/peX4=','2017-09-10 04:57:05',1),(219,3,'/++zIYrD6446dgJG1vR0bWHiOIlbD+sA0Z2QFsbOwN/R5L/HpWB4lyM/IrMd8OnE4PQ=','2017-09-10 05:04:34',1),(220,3,'NdUnMX9sllwbsHPBdddu8ILnzigRMAr4rF3oWTcANauoBf8Yt/amJKb0lvfQK7lOhis=','2017-09-10 05:04:53',1),(221,3,'HuiyPKIhN1l7WG51yu1xTKP7qL9MJYMnZSOq+Q+UvK5Kg9+FTSwaqQ+sbZpZqdsM+B4=','2017-09-10 05:05:17',1),(222,3,'0KSY7LvwAFNSkWHG0DlXExMypKHbEdnEYubZG8L42m+npAw38Ub/Gr7OBzHC1pkWrJM=','2017-09-10 05:06:42',1),(223,3,'t1tDG+6/0AViskpc9Ah/q1Gi7HP7/7dH4mEi781Z+WiMk8JzzUWAc+qbJhKMB+I2f0Y=','2017-09-10 05:07:50',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_flow`
--

LOCK TABLES `money_flow` WRITE;
/*!40000 ALTER TABLE `money_flow` DISABLE KEYS */;
INSERT INTO `money_flow` VALUES (1,5,1,3,3.6,'Annulation de la commande n°2','2017-09-08 17:05:21',1),(2,5,1,3,3.6,'Annulation de la commande n°1','2017-09-08 17:05:36',1),(3,5,1,3,1.8,'Annulation de la commande n°4','2017-09-09 12:22:48',1),(4,5,1,3,1.8,'Annulation de la commande n°3','2017-09-09 12:23:50',1),(5,2,5,3,2,'Remboursement du compte personnel par soi-meme','2017-09-10 00:58:33',1),(6,5,2,3,2,'Annulation du transfert d\'argent n°5','2017-09-10 00:58:59',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lines`
--

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;
INSERT INTO `order_lines` VALUES (1,1,'5410218005868',2,4,2,2,0),(2,2,'5411681035000',2,4,2,2,0),(3,3,'5411858100067',1,2,2,2,0),(4,4,'5411858100067',1,2,2,2,0),(5,5,'54017016',3,3,1,1,0),(6,6,'54017016',4,4,1,1,0),(7,7,'54017016',4,4,1,1,0),(8,8,'54017016',2,2,1,1,0),(9,9,'54017016',4,4,1,1,0),(10,10,'54017016',1,1,1,1,0),(11,11,'54017016',2,2,1,1,0),(12,12,'5412858000081',3,6,2,2,0),(13,13,'54490000',4,4,1,1,0),(14,14,'5411551141091',1,1.5,1.5,1.5,0),(15,15,'5411858100067',3,6,2,2,0),(16,16,'5410263015669',1,2,2,2,0),(17,17,'5411858100067',2,4,2,2,0),(18,18,'5740600200541',1,1.5,1.5,1.5,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,1,0,'2017-09-08 15:39:45',1,1,3.6,10),(2,5,1,0,'2017-09-08 15:44:38',1,1,3.6,10),(3,5,1,0,'2017-09-09 12:22:09',1,1,1.8,10),(4,5,1,0,'2017-09-09 12:22:09',1,1,1.8,10),(5,5,1,0,'2017-09-09 13:29:37',0,1,2.7,10),(6,5,1,0,'2017-09-09 13:49:25',0,1,3.6,10),(7,5,1,0,'2017-09-09 13:50:41',0,1,3.6,10),(8,5,1,0,'2017-09-09 13:52:11',0,1,1.8,10),(9,5,1,0,'2017-09-09 13:57:31',0,1,3.6,10),(10,5,1,0,'2017-09-09 13:58:58',0,1,0.9,10),(11,5,1,0,'2017-09-09 14:01:20',0,1,1.8,10),(12,5,1,0,'2017-09-09 14:02:47',0,1,5.4,10),(13,5,1,0,'2017-09-09 14:54:59',0,1,3.6,10),(14,5,1,0,'2017-09-09 19:33:01',0,1,1.35,10),(15,5,1,0,'2017-09-09 21:43:57',0,1,5.4,10),(16,5,1,0,'2017-09-10 00:50:58',0,1,1.8,10),(17,5,1,0,'2017-09-10 00:52:48',0,1,3.6,10),(18,5,1,0,'2017-09-10 02:49:45',0,1,1.35,10);
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
INSERT INTO `products` VALUES ('3119780250110',4,'Desperados',0,0,0,0,0),('5400141079784',2,'Boni agrumes',0,0,0,0,0),('5400141079913',2,'boni Ice Tea Citron',0,0,0,0,0),('5400141123081',1,'Cara',0,0,0,0,0),('5400141353303',2,'Boni Ice Tea Green',0,0,0,0,0),('54004207',4,'Guiness Special Export',0,0,0,0,0),('54017016',2,'Maes',-20,0,0,0,0),('54050051',4,'Kwak',0,30,0,0,0),('54050082',4,'Triple Karmeliet',0,0,0,0,0),('54055438',3,'Brugs blanche',0,0,0,0,0),('54085190',4,'Tongerlo',0,0,0,0,0),('5410218005868',4,'Waterloo',-2,0,0,0,0),('5410228205937',3,'Radler Agrumes',0,0,0,0,0),('5410228208358',4,'Leffe',0,0,0,0,0),('5410228217459',3,'Radler Citron',0,0,0,0,0),('5410263015669',4,'Grimbergen Blonde',-1,0,0,0,0),('5410263918434',4,'Grimbergen Caractere Houblon',0,0,0,0,0),('5410702000539',4,'Moinette',0,0,0,0,0),('5410769100081',4,'Chouffe Classique',0,0,0,0,0),('5410908000029',4,'Chimay Blanche',0,0,0,0,0),('5411098700034',4,'Postel',0,0,0,0,0),('5411551141091',3,'Cuvee des Trolls',-1,0,0,0,0),('5411676100812',4,'Barbare',0,0,0,0,0),('5411681014005',4,'Duvel',0,0,0,0,0),('5411681035000',4,'Maredsous Blonde',-2,0,0,0,0),('5411681038001',4,'Maredsous Trple',0,0,0,0,0),('5411858000145',4,'Omer',0,0,0,0,0),('5411858100067',4,'Le Fort Triple',-6,0,0,0,0),('5412138103310',4,'St Feuillien Blonde',0,0,0,0,0),('5412343201337',4,'Leffe Blonde',0,0,0,0,0),('5412583240837',4,'ENAME Blonde',0,0,0,0,0),('5412858000081',4,'Rochefort 8 degre',-3,0,0,0,0),('5425027970016',4,'Vicaris Triple',0,0,0,0,0),('54490000',2,'Coca Normal',-4,0,0,0,0),('55555',5,'Autre',0,0,0,0,0),('5740600200541',3,'Carlsberg',-1,0,0,0,0),('8711900013992',1,'Rodeo',0,0,0,0,0),('8712100878923',2,'Ice Tea Agrumes',0,0,0,0,0),('8714100615614',2,'Ice Tea Original',0,0,0,0,0),('8722700696599',2,'Ice Tea Zero',0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_to_match`
--

LOCK TABLES `rfid_to_match` WRITE;
/*!40000 ALTER TABLE `rfid_to_match` DISABLE KEYS */;
INSERT INTO `rfid_to_match` VALUES (1,'5381206120','2017-09-08 15:25:07'),(2,'5381206120','2017-09-08 15:25:15'),(3,'149211212120','2017-09-08 15:27:04'),(4,'11748193120','2017-09-08 15:27:39'),(5,'245114106120','2017-09-08 15:27:48'),(6,'245114106120','2017-09-08 15:27:56'),(7,'245114106120','2017-09-08 15:29:05'),(8,'','2017-09-08 18:35:52'),(9,'','2017-09-09 00:58:52'),(10,'','2017-09-09 02:24:40'),(11,'','2017-09-09 13:24:20'),(12,'','2017-09-09 13:34:31'),(13,'','2017-09-09 13:35:35'),(14,'','2017-09-10 00:43:54'),(15,'3','2017-09-10 01:57:19'),(16,'','2017-09-10 04:32:36'),(17,'','2017-09-10 05:05:11');
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
INSERT INTO `user_accounts` VALUES (1,2,'register',38.7,0,200,0),(2,2,'bank',0,0,200,0),(3,NULL,'lost',0,0,200,0),(4,NULL,'spending',0,0,200,0),(5,3,'somebody',-38.7,0,200,0),(6,4,'somebody',0,0,200,0),(7,5,'somebody',0,0,200,0),(8,6,'somebody',0,0,200,0);
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

-- Dump completed on 2017-09-10  7:22:02
