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
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
INSERT INTO `auth_tokens` VALUES (1,3,'pcbBOK9p7J0jGwwAVuYCtZBZJK48VHbzp1GQFTv7evtsRCIhBlgGhUzSwFnlo6r39bw=','2017-09-04 18:57:55',0),(2,3,'OgbpvrQ4YSK688U6bcFogOPBF9lLyUPLXey9F4w0JgNaHwkjTWyUEoa3HNU8I/Ss4Ng=','2017-09-04 19:00:14',0),(3,3,'LSSX5UGBA0oc3uadNHOhbTt2Zo7MhjAVmG87r8i+2dlWFNIp9sk0aEuXVZNR3sRZKuU=','2017-09-04 19:04:55',0),(4,3,'sOhmT7cszpdpTFgDJioHWQ3WL1m57glIlYTYP8AW3c0r08/O31Zc3hVpJLeoioTRN1k=','2017-09-04 19:23:43',1),(5,3,'YoWYcWu1FM7L2CvMtfPmicFUHH5ydmwQ0ZmBRjE1kTpCSknemlObwVdhKOMuikbH1W4=','2017-09-04 19:24:12',1),(6,3,'PNrME+HN+yTLMxCIe25JNEAO2Pq3+O4ClRLR6oUGYFEnhFKpCVUvb6yOXV3BUQbsA2M=','2017-09-04 19:26:16',1),(7,3,'zFYsvJZdkNOL/fQQH+tX9hui3JtPdd31/5loMX6Kmu+6B4xrs8lMqTzlxYmzjttGB7c=','2017-09-04 19:28:44',1),(8,3,'Y/wnrGoQCpErxKF/2HzQaYzp4T+zRXTM568qRBHhfqtXWnR4I37O45SRxV7GhVOKaHU=','2017-09-04 19:30:24',1),(9,3,'q2/x22FDfNX29pZ3Gn2H84MfPvMvjIq+NKyM0tE+6v7b4f10BbUCtAY3iPJ20WwKZLY=','2017-09-04 19:31:32',1),(10,3,'oJoQiKvccl2CrqggDk5wkAjCxIeqjnkFX9WqJJflltbZwQdRZgWV1l78M6yRDoMSAyg=','2017-09-04 19:31:57',1),(11,3,'sQ9sfBt9ErX/BgovKDO829m0eNCP9c2hb+m1X/QkqrdpNj/J506w1xdFGJS2aJRZqYA=','2017-09-04 19:32:29',1),(12,3,'Fv1J/jO9V5gv8vfd/UdqLotX6x7WwEkU20Ed/xcOk2iiNJ8jcm2e8RdOIQsHck8zZCQ=','2017-09-04 19:32:50',1),(13,3,'1pRSxit3TrjRDgDJYEFt8wVZEnfdcf0i+tJuk7V0MdRAIjCS6ZQXx2Auua8YoPEmb3s=','2017-09-04 19:34:39',1),(14,3,'+tEQATFRbxuokpPoS/BZdSfa+E81Q2TNW5VQB+MYqPwxbTyG4MeHSyLl5UoU+HsHrRU=','2017-09-04 19:34:59',1),(15,3,'NmQ4/Bkcga0dy9sOhvRVao/xRe2R6bJe8pytyPDaHk0mufCD7/8aFwljOKQNafylVfQ=','2017-09-04 19:35:21',1),(16,3,'hD52e9ITIdPFXWu9EZ/nbbUTXYrmdFHmX2BzZv0W7lzHevYtDMgz2eWSRpMJBQYWg18=','2017-09-04 20:01:16',1),(17,3,'KRc2zcOHP63pilrfwV/XAONC4ddtM8Kh4vM1N4dDWUd/dgnp3if9s+3TJZaCFmmVXL0=','2017-09-04 20:01:47',1),(18,3,'w2X3CGj1SDMb4e18srkWTil/vfU1y/pCm5kYG/yTFKysp7gF2965efpsbNkg7ng+a4A=','2017-09-04 20:02:24',1),(19,3,'ZXGhlky+hN+XfGMdQ4MnAGwIMkc1vfOyJcA78R1pKGY4AJbk4JuJt3KxQ6xUu43eeb0=','2017-09-04 20:02:51',1),(20,3,'zvPAxEK/BTWqXrBYUojMk77hPmOA4nUPTNezoZ7vPK0ALeKLVFzlyDYPiiDxOsezusw=','2017-09-04 20:03:10',1),(21,3,'eQd2281iMIKl7WeVbRz6VD6WfXiqGk+9aqwPzIU82gzwDf63mRk5tOg1I60QgymnH5o=','2017-09-04 20:04:20',1),(22,3,'oNvSBgctZ9mCCvlE0Si1wkfN1Rlrgl+kw4A4IzAuV2juVOSn6TN4IqqTUImdryNGUWM=','2017-09-04 20:05:40',1),(23,3,'fatMtgsHMGncg7YpQHM1n6fsKCGeF+sVuV3+EmirsUBJFYY/Kb2jWCP9a+lXQVuEGTY=','2017-09-04 20:06:14',1),(24,3,'cxJ67xFxjpESMEgH8rQfYxbA+9O7Vc/KOXgQu9iNAdcd9u19KWYeBVeckQsRkyKzGQI=','2017-09-04 20:06:35',1),(25,3,'GnAbhanIrgy6p8ZG2uM5C4DSk6g+Ex3BLEgYRnS8BlMZzbQzys2z77gO4CzDI4wvC3M=','2017-09-04 20:08:49',1),(26,4,'CU8FaD8hKXrbPEn3imvpa0JkEzJjwu2rPLYLuUsXdlj9a38ynjmKDpTS1HVktftZyqs=','2017-09-04 20:11:37',1),(27,4,'GWAh3SfVustr9ZyWQhWrUDoO8jRykhrcqo78DJr7mq5CeuLMUmWo095z8XRlyehmUlE=','2017-09-04 20:11:58',1),(28,4,'NK8DkMJdAMtP8NOOXbWIwPzfjgsr2wCdsr5LLrWgLWoRoJjcbsc4oKnuXe6fxrMG7/c=','2017-09-04 20:16:34',1),(29,4,'eqz1xFGEPxv/TS1g++fW8Bt2SQIjxCGjTk+f26nXPs/Wf7Y/LM7HkPqmI1vs2swBGZw=','2017-09-04 20:28:15',1),(30,4,'xvvmprZXda06o04LVsTHTkbu61YTSkSGLMPofK53JgvkKfTBdaTCvF8s6ipD2EesyjQ=','2017-09-04 20:28:30',1),(31,4,'yn3yOLo9Pm9EcUDVli9jcugcHwF6PpuGaMUKrmY8NYS9FiVaoFdfi6Su4OxHKuvl6uQ=','2017-09-04 20:29:36',1),(32,3,'huOe0QdSKxb7yJDnW6IISyZJ822k5V6Ocb8MEWUTlNu9vEacfnIP5/8Rr6bEi7gKYJ0=','2017-09-04 21:59:55',1),(33,3,'Z418EVjTIfrCM/az4dP9/rPOp+x1R8lyYU6eHoFKl6SBw3F9ShUYk8LjfaUXfAZk6MU=','2017-09-04 22:00:26',1),(34,3,'DjGkkylE9kSNWDASEc6OPZmhhWhlQysybXk3HwKZ3BDMm7kgVKwpngWMr2+qsJoQhns=','2017-09-04 22:01:43',1),(35,3,'GBXoM5hEEYMy9xNC74r/899cAMU6VCEejsM/jRBP1bml1Hjbir8qjgi0PHEuQ6WDOfE=','2017-09-04 22:02:10',1),(36,3,'w3psvX/FvbuxhzfQWwE/zMZdhulG3Sioed4XeBE+z9IX3FmVAUEOexAn03yS0eAb5d4=','2017-09-04 22:02:29',1),(37,3,'Km/1/+LVn4ywhNhSuK4xtifsZ3QAo0DM2KfeZLTWaSaGBqcF/mhbVYepmuYat+MPtE0=','2017-09-04 22:04:31',1),(38,4,'UMfis9wS/cy7dTLF5H0tVE9vZZ4sBlb/64Pp66PzLAkVEx2ECUIqrui6YPWgKj+nfrE=','2017-09-04 22:26:24',1),(39,4,'/RYrjnO7Cqg01ClTUczfvsU6Oo/6zjZ6Niyj7EQnHTpOgVxc5JhGUEgTLpNe96IHIrs=','2017-09-04 22:28:40',1),(40,4,'F+04eyn31+j4BhdrGklgeEC7ygarEK20KYPckmM2bHwsyus+BRJO6hBLiOoYyJ88WPI=','2017-09-04 22:28:59',1),(41,4,'k5kH9bjDnhSVgT5g2U0uxGoDu/7+UdIgrCNJecEOppVKJsZO1NgRfjzAeMB7xqzHcVY=','2017-09-04 22:29:13',1),(42,4,'kU7O9qUCrRmFQazvNIE0Ky/tgr8WX35iS0KbSEPqUjcIJokpBS1mH9LLAOuM4oX/+jg=','2017-09-04 22:29:24',1),(43,4,'OEgVxE05V4hGG89mdMVUx7ssFT1avUXj7Sg88BNe/WkPlOqoayDqKk4mZNkPSV0CVT8=','2017-09-04 22:29:39',1),(44,4,'b56GLhWZFbJXdJVkgS2cUzx+eSdhaf955UN5QS87vQJfxKk7cTXg9Q3KS97YXpZk5sk=','2017-09-04 22:29:56',1),(45,4,'NSb6XdICs9j5nlo4eWazQvP1laibHyJgwxKV851/2LTSbuHK63gzxSaNaJkrPrID8X4=','2017-09-04 22:30:32',1),(46,4,'Yc8cgDLnfUJrpYY6TD0tOSCbyU5fy9b1eR45NFj+0U/chqWWHDCMwFvs7FyoZ0xFiPQ=','2017-09-04 22:31:41',1),(47,3,'WsxfQHTGdGEVrJkY+MDJnjq2smDEPMybblA1FZhNLfvRrctvPXxcJIUpIBFL9gftc+U=','2017-09-04 22:39:20',0),(48,4,'rQKFbBpTrIUL6MFy1RLHK52f40motv/IHUFO7LveodcFWniFli0Ap0cB6HOY2c31u2o=','2017-09-04 22:48:17',1),(49,4,'fK9Gh0zsZGxyMefsBT/IEIdD9OuHrKTzKAilfuN+PoXn+/XwErmJbeSb1mguNxJHnSk=','2017-09-04 22:48:27',1),(50,4,'7qzEWIWjRXTFNNAgwLHjmZdRtxW5wVP8GSdQWSafyml6laR7FKKKCop9DqP63NQ7UjU=','2017-09-04 22:48:36',1),(51,4,'MAphgVM7TMv3OvkkmrxHt8+GHF6LiH7vtgqofXmGlIGFkr6h/XD6d8TCFTpu0nYfzqw=','2017-09-04 22:48:53',1),(52,3,'cmSjPetLQ0263A12wnxxZLLtMNgenTEDwyp7s3s4nmDieYlUNBGypI/2BXGQ/V6s1qM=','2017-09-04 23:22:07',1),(53,3,'GIx/vuAkPqHSYjFTo7QOOq/qJouIQ4AWTIwFIiJrk4I/sajzJjmNCh+xrIEJfbNGrLY=','2017-09-04 23:23:03',1),(54,3,'pZ0d3I+33/TJhl8WogtovVXoxKl9atjBYb1jSdKVFABuDY+98IbisCfwEtMr4JIkj4E=','2017-09-04 23:23:33',1),(55,3,'sVD2Rp3cpO3oGBjy8ppvSliAMIgRD1Pj8U1OJ/1wGxrHLwhEUDU1+y9KBRfxKh+f4cY=','2017-09-04 23:24:16',1),(56,3,'oSaaEIJug+yjHyRyimzDokfnBA4FqUpfmX+QrU/yxZqeSRhpgIR4AWsuhLPcJE+VaPg=','2017-09-04 23:25:48',1),(57,3,'TaLD2IqX0PU0lSHaRQLwWGJkFY6LzoLtwuPl1+o/Mj3wB0SI/vn7OWLJxPYtWaEjmdc=','2017-09-04 23:26:10',1),(58,3,'D5h1UkphlV3HjtHLD9BOFCsnQ1AAGQPyXwVRz1cUUiJcf91Xf7asNliyU3H8NP2LisY=','2017-09-04 23:29:31',1),(59,3,'LykbAhzPCDc4VY5tpDP2SwkOqRADEhfJHNrcXYD47A5sgRDIqcKwZXF0AOHCaPfdeiY=','2017-09-04 23:29:48',1),(60,4,'lfAAkDXph8O74uzan8Z6npxsC2jflGfb4ftsMcUeKhUTf+46IxGEBP3bN2Bzxcs1d80=','2017-09-04 23:37:49',1),(61,4,'cVdGmEGMMxdoXyEtaVL8NQcUPZYiRmYlVFdAhzZykS9LRyjQI+XuRJhYidxUprGAvmA=','2017-09-04 23:38:17',1),(62,4,'Ut9mHI4ah1yzlCURdO0kLDRRPsjKltN01EgsNNFERFiL/YtwCNf7z6omw0HwN55X+tM=','2017-09-04 23:38:28',1),(63,4,'BOR6rsBkJr7Jav4gpDFQXLJ84rXiJpGY04a1YHZrr72f8Ia//i20Wn3FNstfFLncmtk=','2017-09-04 23:38:43',1),(64,4,'adVjlLlhw8QSSWhWAdSdhfnstJlj6i5YYAga2vHOa7zIU6MamBut4r1iySW/8DJYFVo=','2017-09-04 23:39:54',1),(65,4,'05SRXLoBa0Hn0Dvl3QNCy3DozZttqQoyilMpXKswQYZIuG+S3292Hou0wciKdrdnGmE=','2017-09-04 23:40:31',1),(66,4,'7cheVi//NvyEFltyjt0RvqQp99UEUSqaaXF9gfIy9XWC4cyNllojjIindXYYktHKQuk=','2017-09-04 23:40:42',1),(67,4,'x8+qotekwjy7IgKt1ih5DHZl1G4Y6KwsUFR0W+Lr0prIVTAmOPyuU9/wuQEkYtPI72o=','2017-09-04 23:40:44',1),(68,4,'DsakN2o/N17LOmWZ1Iv/Z/Vbn7EYHWr7Tq6WUezA9Bt/qK9lMgMfXS2EAf2J9JIslzo=','2017-09-04 23:40:57',1),(69,4,'zdt3on9rNzj+7OpIZi5wvWyQjc8ZMlcuEhlgkR4YazAnJpFGICm9Nj9tDudC9uuj/aQ=','2017-09-04 23:41:56',1),(70,4,'pQeZZ1kAdLzMovRq1hWCbMhortKJF8u2pW8PqaKeT9Z/qV6AuWo/RP2GX+SG7aZ/L7I=','2017-09-04 23:41:57',1),(71,4,'X3jxblcKbmIo3X86HYzmytG0CpIBW5T1SsG7tdknd7dhW6FBCustWB8Tr0oC8QacLZs=','2017-09-04 23:41:59',1),(72,4,'2FoEDYzL9rFcd93cdvgCUy+KD3AeKr241wS2ojDfsDGVGmJ6icKVtjQbqhr9oFinbQw=','2017-09-04 23:42:11',1),(73,4,'5xSA5JjSHlF/8dPyU6plbp6wDvMK7B6ZIgJGayFcNZKxGKAwyq0tzu0FxWXifbR9aTo=','2017-09-04 23:42:17',1),(74,4,'LIylX+jm5CZsFPRKWohxeBjiOS63vqBlT82mMrpF9qpzmwQUQ4C2za3hGwC7Uh0H7TQ=','2017-09-04 23:42:29',1),(75,4,'36XEvafkMwI4BfZjInSRGVfqLnmz70iNTrUHHvfBYOWSzLDiYvUgjo1SFLyd2x3aQh8=','2017-09-04 23:42:30',1),(76,4,'J2Fru36qP2o+YwP1lq5GSumlzP/jiopr/H3A40K5X952j+XR0kpekIivvNRK0LVSzpU=','2017-09-04 23:43:00',1),(77,3,'5QKw+i4lQX2B5daJO7g9AOSnfNFT1Q+8UTNnDsExDwSp3Q7Di1YB0GbAqW/mhIaoMUs=','2017-09-04 23:44:17',1),(78,3,'hkoh/t9fI+b4RgIgP5cC4lfG2XONhd64zJGAPOGCJhsL/LGysbSLwviR2d/FXSo2+cc=','2017-09-04 23:44:55',1),(79,3,'roRm5cT1+/oW1+E7MY1J0UTB/ZEcLOSGWDG3KD1+vHoepLON8yRzBxjQVoK0iJDaLuw=','2017-09-04 23:44:56',1),(80,3,'rnY/IXu82QL2ptQ3ywiMLUIovQxCJED3knyZOcmbZu0GSmEOuTtEZgc948NIGPPBJjs=','2017-09-04 23:56:13',1),(81,3,'NhwiBt8YtIZXVJDdICO32xagBW1CE+3qKgGJw34pKsJ1WQeR5ejy95hwGAWyGk/6rrc=','2017-09-05 00:00:04',1),(82,3,'R8gEgrzJJCvksvkxl2FAXE9yC0G3sHNBkmJmF0XRP+avPoMJCM/17xd3+JO87EoUyZs=','2017-09-05 00:04:49',1),(83,3,'XU6oSixn82uo8C+esnw3wWYEG93fimHBB1isnazwKMWI6CUI3JIQiHCjQlw8v0JSf8U=','2017-09-05 00:05:51',1),(84,3,'YDfEmpGg7fd0+GFg/s5gzuYf4bl37XLYsp1nmFWc2zJkBhIpcTotczq1FcjnOr7y0K4=','2017-09-05 00:09:24',1),(85,3,'TABeBZuRoaINvMNV7Gu9OHRMBEgVLRtuCa5yMgL1uGJLfRWiuZGld4YvVsuKqRb//JI=','2017-09-05 00:09:51',1),(86,3,'tcUhKcTNXu/zi/C669tKYIe3rr9oBjJXxovgbHhKVfcukRoagUuja74HFJuWDFc3I+I=','2017-09-05 00:12:33',1),(87,3,'y5CPUQtpfUkFLnZ4zy0govrZGUMt36vMcN4H7AImdlVWBlL/eZMHyXo3KDeWsoRdu4A=','2017-09-05 00:13:14',1),(88,4,'Qkp+1xBIsw4vEqnrY6PN/WkRsk8/vGx3tBGFWSD5t/t7J1YehTjSd2DpQUew9316Nrw=','2017-09-05 00:14:00',1),(89,3,'+gDG5rx76UT1aLc/aNsN/ZaqexmsQcydKYaPsQcQNOQU3gauLPU+RFyQ3lwtZtMVETg=','2017-09-05 00:14:20',1),(90,3,'GMj6T7gFZ4M9Mzdh2KGQ6+QKHrW1q4NwpDafzXXXzsFDX84Ian0kbpS3BgI7/x/uOaQ=','2017-09-05 00:14:46',1),(91,4,'RseEPLXZ0rHR8ZBRWN21wcyfgMO4QqWY4xT+xa9g6jxCww8Gg7HA0zU6NyBwPpslqZI=','2017-09-05 00:16:35',1),(92,3,'BaZcoE80+Ve1ixlNczukRKG010lVuyimypSlMjx01j9fzgSLyKhLF/z2RtQiOyNvo/4=','2017-09-05 00:31:56',1),(93,3,'5FzmD1i28eP0AKu6p+9EE7P50Vr96oqALkHfz0Z4NVVVDQMfAkPGuGZUBZqkZIHT45M=','2017-09-05 00:32:09',1),(94,3,'4TiQVDlkH+Z/Dd6NwlhZCco36cDLnBaLu53UDDQlQso126Ao5/4JifU2Z59N7iMoTLc=','2017-09-05 00:33:22',1),(95,3,'q+QBjnDpctPSvyy4xjINZGtEoCnFuEFGGnwpp22wGtW4JGMBqMz0k6dT3BnQPKdkuaQ=','2017-09-05 00:34:31',1),(96,3,'uIG9RIDSH2O+etNRvakbpuz3RL4sBWaOUEWk5wR4TwxK67aj48A/cTCrwYpp766c8UI=','2017-09-05 00:36:36',1),(97,3,'aSzmbEWFAGfsJ5lNJoTG1PKywUDxOWz5fXNAHmvx+GryZ2cY673+0MaZx/JScgLy/js=','2017-09-05 00:36:57',1),(98,3,'r5pygAIZh9QBovpCC0BoaX6VEQVECQWWF+wYR0xLBypDl473hror3Xhq+mq47xr7b0Y=','2017-09-05 00:37:21',1),(99,3,'SyXjXgjdX2xeE9aeusP5mywuMk/3RHo0iGUqsuvducF4sXGdz7GUA/kwiEPsyrNNukI=','2017-09-05 00:41:44',1),(100,3,'OZwotZWoTMcHFdwiv9SjLO3EO9fimvRscpnSDDMauu6NjV7bK4IAFUmnuPKAj5nFvI4=','2017-09-05 00:42:02',1),(101,3,'LkTmSdS2LGjJ3eRmc5mBxfqpEgALPPx4yU62eV4UMdcvdh6q4sn2cy8a05xwiYsbkOI=','2017-09-05 00:42:17',1),(102,3,'mgz6PTZU4RrCTXvU0RkLect878E/pRK9e9NcBNsZkQTyBb4O53CXcum2iylnXFL40ws=','2017-09-05 00:45:32',1),(103,3,'bZOTmEjnn2WBOUbsYMWH8ZVrGFhizVgcX7Qz+l8FzWxWgDdiJrKYplojl+XjmdNDtOc=','2017-09-05 00:49:42',1),(104,3,'DcP1kUnHbens9T7z5dyxbcQxMbCb63JWiIKWWNgifxnzhqLRoD67S4EFbAQ9fQKF3xQ=','2017-09-05 00:50:14',1),(105,3,'ANxEAS8Wo4t77ezEtdVIYINYOYdRWQRea1ZjGk9qwx3sk6Eb9DGDgZJ6poLtu0Pgqf0=','2017-09-05 00:51:32',1),(106,3,'AIr2KGRvJFBPhZmv2MWdBcp1AlSuP+Jm6SoOk12BObGPSSL7WIYTZP4rOgHL/RRJjNE=','2017-09-05 00:53:26',1),(107,3,'ecrOyVzL0p0DaeB5sstGae5xIfArib9+bcM3DV4k5pnG3LsuGClOYEc1VVBQdx2g2LQ=','2017-09-05 00:53:50',1),(108,3,'7RUeSkqILHGlr5o2YMC/GP1AaC7cWNuQ88lTqz0rtww4+JgGrnhsgcTxOr0XpsbXqpo=','2017-09-05 00:54:38',1),(109,3,'Av9+mVuNnI6zU6GG9ClZj2QwxzIGJAqppd+cMX0Vs+usbtpMvzUXBihWA3P7eRDywfk=','2017-09-05 00:55:41',1),(110,4,'YeG4uIR7O30irQ7lHB1KRyWEXm0zI7P9f399uO3egbrvPGtmPmw4y9VeUqFl+OTp4Bo=','2017-09-05 00:55:52',1),(111,4,'YQqsOINIR4F/wsgp2Tak4gEMxEk/NuIrwPIpCTJnykPxjx+6OjEsjOZOkcMwUz9oVB0=','2017-09-05 00:55:53',1),(112,4,'0Z5OLh8KTQDomf1lLihLT2ezsOJptjpNz0E4MDPNJ4YdVVedxkjNjgsAUTlmRZpcnCM=','2017-09-05 00:56:00',1),(113,3,'KOAdyF5H7HZnzzkSob/NBRAk2PejkF+9WppjQarOWafcRVU2qcO7BG1KJlc8ZPwK1Fk=','2017-09-05 00:56:13',1),(114,4,'38limX+n722j0Tn9wsASuIxZXFjsBTDyTxB5OH1qQUj3GAngbaywhGhwDwNx0RYu5vI=','2017-09-05 00:57:36',1),(115,4,'KoCS12b1Pz+QRMgZ+wT14NCX76f9k9BiHGZqyOi74qhT91CRel/j9SfxQx+mtrBeyFI=','2017-09-05 00:58:16',1),(116,4,'v5EvLYJvxH82gXOnksYQbFFwTJObAjvmOT9BHRdzAFpsNWL7xGnFFNDtSaPKTb0fRo0=','2017-09-05 00:58:17',1),(117,4,'UCq9O0Kjwl8fXO3Oeemci+p40E/lCEzgIzOb3NpwyqsgtnLNwU62Zh1yMjwAs27oKuY=','2017-09-05 00:58:35',1),(118,3,'Pvocn3kJV27aMFNVdzbPEUEh4VwaWdk6jkoz1gjL0gmNx4OwCWD0LDcHdB1Nvfxp4jE=','2017-09-05 00:58:56',1),(119,3,'9VXToJ/FMENJB5LrJxjf8GqxMYl4WTofStIRbewceCrRq7Ydrb0nA9KUKRyoxqGqeZM=','2017-09-05 01:37:38',1),(120,4,'beWyExT7AR6UBKCQT7EFYWrHWnbHSvrPpxUgMokPxEHzLngfHlHBEPwkaEMu88Um7U8=','2017-09-05 03:05:54',1),(121,4,'CYMBHli9+A8buJVh53koNY8qC5LK0Ish2XqIIyTJmci6cpNEwhZDEfAa4/To5+WZQyM=','2017-09-05 03:08:42',1),(122,4,'KQ2uyvATdr9uKZVo4OskZCWdWbLYA8PBQXtdOIgX8pg+c3JvNkgtPgjvA2q1R3/nzA8=','2017-09-05 03:22:37',1),(123,3,'ZjbHHjMkBPJWiYLLwvcdzMcQma9GpUbyl0LpTEl7iQZqukgLvfVm7PGTPG+1A3IkuP8=','2017-09-05 03:29:51',1),(124,3,'vrfJKwGI5D/PyYpD3VuPJWwu4bbobFNi89t2E6gpRdx1gaAGwtcuO/6gSB0tbrbXytA=','2017-09-05 03:32:15',1),(125,3,'S0giYa5kA/nLJOFv2qqzpvmEntB9hVl2kQ0SwCpiTvRr7P3jwo8T8FgdUlziMW9CO7w=','2017-09-05 03:48:23',1),(126,3,'TvJA4znWrJ8j//eJEvhuhKQclLM/ed+x5aBW0yppKu8L9y24Hah+RfmJ3LQD4Riz0P0=','2017-09-05 03:48:41',1),(127,3,'fabrsqVPJPYGEG0bzSzkjw4XUVA+ZtqKepQUK9TuC+xt3YL9z8PJiWSJrDVDehizvfk=','2017-09-05 03:48:43',1),(128,3,'YGe1sAgB5TeaZ7Z3FDDtBGDMorsgFtU8K38lshjFTAD6U3/qIU763h3BVlsbnc3J7AI=','2017-09-05 03:49:07',1),(129,3,'hIqX9I8ax6ebFM8mR6DOYLjTV7QBUzLCKXcqo59WTI8S6WfzL1DnEFmkjDqYPXi+iSM=','2017-09-05 03:49:22',1),(130,3,'+wCw1Eu7mSTAG9okCH/Xe+jCq8NSdFrnnU/e7rqg3W7pCpKvZkN09Vn2xPMmHCRub/M=','2017-09-05 03:53:34',1),(131,3,'/iHrAJt/Fi9Kf5g+EGgrMriO9/PSuSYcVqxUKERwWKcCZUn6CO9C0aPG30JrKUFFMsU=','2017-09-05 03:53:54',1),(132,3,'8eFj+A9E7pc3GroVe/n4iTgDyrrK2dJRCElVmUF2fJvKPoBxFhRcqrtp0BEuPy+h+tk=','2017-09-05 03:58:25',1),(133,3,'nsB/zwzi+WtBWTSB/YX9jRgLmyZK76rHCw838svwqM0dWOvrE7eKC+hGk9NrudSb9MQ=','2017-09-05 03:58:59',1),(134,3,'2IJue9blnT03tU59uXdbDvaRl5kymlw8cgprOpttEmyzJpjEs7KbofsNe8Js6uacIMU=','2017-09-05 03:59:24',1),(135,3,'ZUUFvmZxebCFrwr4cauwKXURas91WGeDeeUDn3CXQf7KICuwxEWkgtOT4gpAoNYvB34=','2017-09-05 04:04:22',1),(136,3,'9Q4KP107jqcRBU7QtyEX5h/HNs/4YXGUkk6FpYyusBrN8uF8iIp9BUJvi9L/vkGd9zE=','2017-09-05 04:04:40',1),(137,3,'ViEy5ZrZNJ30MnR1FIILhiS5XhjkjrJ0xWp08JzgvVLsJgEKE3Qnz9jEhZOV7p/Ll3U=','2017-09-05 04:04:57',1),(138,3,'JL/iXcxHqU7aHzIcIgS0g6Zw+ZJnRK1ASpxE6RtETw+Zn0LtoMtWJNZcy09T0yUoI8E=','2017-09-05 04:06:06',1),(139,3,'5KNVAdxVP9fsARIFv5wWkQTzvQH2J74jsWfeSs8xOyvxRV88i5zoD8Vr+OzWY+EVqvs=','2017-09-05 04:09:56',1),(140,3,'QH5E1kpIhX+GnOtbBgTtZJLWnrsaA1P9efU72VBtyZaoPdMWH0pNcw5OqW7R9yusVy8=','2017-09-05 04:10:25',1),(141,3,'6FaWwvlP//tdK3oK35/M0ZpBzDYtUMQ4v8aKabHPIu4WlDxnYZIwFURouTqYkxC+FB8=','2017-09-05 04:12:06',1),(142,3,'ZD8K5d8GxaofYQTJH23suiC5qjbffumXWCrcSDfirl/b/V8IPmpSMhv2LaSANdA0aRQ=','2017-09-05 04:17:47',1),(143,3,'aof4SLzcMggma7YG6weuQpDeMHvsLaH/cf8YDyz8chbrYAF2PgtO/wSfT2Fa5OdI6jI=','2017-09-05 04:18:05',1),(144,3,'sXsIg3xEg6dtPkoe74T/Vwnqg0vHmOUro/clQBTdYN40GEPxJJeOKSnPWIF2KhmghjQ=','2017-09-05 04:18:29',1),(145,3,'K+wwoydL+i6+/VAGsIb1nktYbC4ALMWVVoR1WJQ6UBOVOJpPILf6bII/MtCsZ4YpYX0=','2017-09-05 04:18:48',1),(146,3,'7x9MUxNhG8m71FyHeFvum8InqXdSYbHTB5eABQkjmo0uXzLPbbG90m6/cRiKamYJsDA=','2017-09-05 04:19:07',1),(147,3,'e1d7D6JGNFc2O4zrtnGiJPYkq4mWNqv9iaSwGcR0DtOBf+sYdngf5i8mAcijDd5q2o8=','2017-09-05 04:19:34',1),(148,3,'isTh+HDX10CojE97Wu9u0kW+lKYc8dbf8CSF/jvudXUwxz8bgeOPC6l76B3kDYDCnVQ=','2017-09-05 04:19:47',1),(149,3,'7lyiLgjm8Blo8Wws+j9QWza3s2bkedt/f8bIsYWM4+1rKX/oP8t67mohvs0IMUP6Ka0=','2017-09-05 04:19:49',1),(150,3,'TbjrbUK5ltgQdLChiZGW6Konnx801wb9W/YKBiHu4dqUee8omjFkZx12iofo1msD+48=','2017-09-05 04:19:55',1),(151,3,'boLR8b04NLhlKuxb3IjnGXgasEFjI99Yac/JnLCRCwW6T0x8LiUPrIwzAFzpuG7wd+U=','2017-09-05 04:20:05',1),(152,3,'LvihjN5+IZqEdp9mVrDdxQS+FC5bXeEmgRT3ZTBY+uLlpScrVjLizjNsBPJmh1UG1sE=','2017-09-05 04:22:16',1),(153,3,'N/BUpxEVJ5ScFXSTsYtlSUJemcafKb55CnQyMU+0i2vlHdpx+iGUarGE8F/lJEyUaDo=','2017-09-05 04:22:40',1),(154,3,'Uxp5CSUqDO8cYWfrMgkX8K1iaOynKAkCaLpVg5N+erIT+rmxqR6+C9Zw2J+mu4pAn9Q=','2017-09-05 04:27:39',1),(155,3,'6txK2zq2kgGdcQwElIBdOUPj6r+ShIzTErXKEOan+tgYuzWJl3H+G0VPrjzawdxX5sA=','2017-09-05 04:32:45',1),(156,3,'I38/wotRG0uWvQHF5FHaJrlIYXTQsYzWg5XvSHZXmMFmKcnYcOrDfx6QMMFxGGh/G1k=','2017-09-05 04:33:02',1),(157,3,'LdgdmHYuTPc1gp5b6X8HVaZJleyi3yVBkDf5Zao83nlaGqVhoPM/V9bWV5O1sX4x3cU=','2017-09-05 04:33:19',1),(158,3,'kGRz70L+GANyn4Ig0QcFTylOMkY4uBmVI/gILkA7y1ja90THAFKVtBNJvAFyIysiK2o=','2017-09-05 04:33:31',1),(159,3,'wdlSSWk+8kr6NvSNEdUVgGnjYe4Xg7zhs5dbY7Bk351Myjla3hd1CqvK/UlvuUY+5Jo=','2017-09-05 04:33:53',1),(160,3,'lCftQpR3hJmQ2nCdOhBmgyfktY3dzN0co50+Ftz4rmEnjw/1y47cjBmN08NhYRNGpdw=','2017-09-05 04:34:10',1),(161,3,'iuoV/XseBL+2I5yT3D6RCS7JZykNIutsIWw8slnAdV2FAdYMfea5I4e7qKZOCeRTxAU=','2017-09-05 04:52:57',1),(162,3,'NmQLvvZ4adtkHwEc7SAOwqUTxv4symDKVZHWdNHpQIRFPC68mOXmCCp2Gun1in6NO/4=','2017-09-05 04:53:29',1),(163,3,'+1yA/VnwxL0YQksSjmBrn6cEh6QSPfJB7AgslOBXdSKM1uvPHSCgkbyoqC3IPVZGBtI=','2017-09-05 04:54:12',1),(164,3,'uDTyiP+M7kpnP3rp6cKI/D9wPA0wgBPi7Oadn6iLNtgkYs67uy2E6smh37k5y4RVo7o=','2017-09-05 04:54:27',1),(165,3,'ScksVFgkMBEitjKOUOfAb6aXZIx2jAimzTVdLHENDFK/L3T9r7kZpCRzQe4kp3htjNo=','2017-09-05 04:55:26',1),(166,3,'9FTvuoDeS7yBkiB4YW+Mi+ZcBSWQUZlPk6/1y3yCJfPqrENg110hCxd5FKrWCoYsZRE=','2017-09-05 04:55:46',1),(167,3,'Iz9g2Opk1FHd/n4I9Vf+GLrNx3+vjmYgpMFZ5x1iUTU6r8NDEtk8GucA9IrFI3vLyMw=','2017-09-05 04:56:29',1),(168,3,'IznfyzHrH9G7XytBX3lAet6UfVT972awZemazmHrtrd2GBbpzJY0JsNZPxyh3x5Ti8M=','2017-09-05 04:56:43',1),(169,3,'myw9oz3HpZfCP2UUZ7BEglkaI70uD7nbv0EwUO3eb1qz84ISVuQIMVfuIdsI9iEcL9w=','2017-09-05 04:59:02',1),(170,3,'9m2jrsGqDaCz8iCTZKcm0FXdstdrkJNiXEESEYl3v5pinv+pwSoUdlbLNL7jd7Fc0X0=','2017-09-05 04:59:11',1),(171,3,'b1eetAOkDwOlFj2s12fAmFmSGBv5xyM0Y9lfskXQ7KjPVuQ07u7ovbiu1iybJZgGXKg=','2017-09-05 04:59:48',1),(172,3,'mTksKA3UGU/Qsv/J4NiDSGW8MDeSEG+0HdJQ3ZF463hckqoPNadlbR23R96zM38p1EA=','2017-09-05 05:00:00',1),(173,3,'iRRG99n5bo9a/Kyn/9FuUPn4PNTvUtRafiyBLQIHngnltgCgVEzc4BKvs0JIpd/IaTk=','2017-09-05 05:01:00',1),(174,3,'8/xTsrTCZwLcWj8DfXDoApreeX45f9X9BvrEiMV++O9NLG8lLEEu46vAoaY9R13Xxs0=','2017-09-05 05:01:37',1),(175,3,'p1QR0WXZZi77UHWEMcfV+0waY8fJaef+b/dn6HbkrMXRTaQP2pfoIUWH+VkpHYnRAmM=','2017-09-05 05:01:48',1),(176,3,'leo5wE5tK6Z142n8laDoYAghOfEhUyxL7uYjf6eMRY8VarSclBa5D4OjdGTsq3toniQ=','2017-09-05 05:04:31',1),(177,3,'jg1Kv4Vcs0pWiGk1YiQfZE25zCM2+FFjWU9yk0Qk9cxWHz5XfdS+kjktI2qvkhKRYh0=','2017-09-05 05:04:59',1),(178,3,'SywwqzEmKb47MIN76ch2R24Fgqu0myLUeQZPJF79Fiv++MvYfLWVMfrTrnmcgrxjAQs=','2017-09-05 05:06:14',1),(179,3,'9XsSv3+pm/WjHBsCLF5Xm9efrV/Gf4VnRrasIrbvPQQ2lOfIWpbIJ2Ucn13ofDtsNwo=','2017-09-05 05:07:21',1),(180,3,'cID08FXgQe9YJmP6GJQiLveJeQVsTaQa+jvjO4eBh63QdU+TTKyackDDUh3FvFMpS64=','2017-09-05 05:10:23',1),(181,3,'eRny0QhYtZpG0GyCUYRN5wY7oseC3qKw3C6F4MCuoNHx+ZHRgRUPgrUZApIkM3iMogU=','2017-09-05 05:13:15',1),(182,3,'ImwGJsUdQ/DyWrwd5uQ747MzbaMdUjx67YKQWHlwiUMqBYGT3x66RHQ7B9jugGEfJhw=','2017-09-05 05:15:06',1),(183,3,'u7DPmNIJpumcZc13pB2dIi+xijA2LSd7O8496pCcd7jO523SSDveFTpKonzqyVXxIRs=','2017-09-05 05:16:19',1),(184,3,'cxbzK6MqKoUn4l7ZVPkb00V/e+IHzYCG9OZBqRns0+ZOK6IW8+3lE1MXvoaUa3E3f/U=','2017-09-05 05:17:11',1),(185,3,'SYsydVukaLNJdjnkjEGT4Zko5485dnxYa+3gG8pJkT36kBxk8Z/qDdcdp2Oc1kHlXBw=','2017-09-05 05:17:27',1),(186,3,'AOhSwsb0ydBU9+I/fdDokoBXS1Jiv4R5MFbOybQAnAaNaZ4VVK78ObYbfs2i2rKRP0U=','2017-09-05 05:17:37',1),(187,3,'6+zt9RmfFKcyXG2pbBvUK9NFoT+/sVyQwHCY7NnuE9KXMS129YYQ/MsSmUY4Y/0l2kI=','2017-09-05 05:19:56',1),(188,3,'J0jEGWRpH8p4thp7IE4uEB7WST4og4JIuWPumsQwvydiUPpdrfj8DYBeZ+eSY7eBo58=','2017-09-05 05:20:47',1),(189,3,'HvwNMi75DNTXNQw+3YITTJAJ6LgcfWebcKzV0N6oznSpfDogV5hKtO/K2B+03qMqpM0=','2017-09-05 05:20:57',1),(190,3,'PG3omDdrgbDcOHKS++j/UDJ5s+XdRfce7HPm56FB+aAVAU/H6HO1jkX3IIsMI73Gss0=','2017-09-05 05:21:13',1),(191,3,'RSn6yU7S8Uqm72C2J83wWtx1hY2nFyCXSqgryJE+pXnv+0v6SG86XbBsE+spB0Mc1Y8=','2017-09-05 05:21:24',1),(192,3,'MZKieQkXEf8bfrG4dIx7BatUq1cJ9NOLQyzIs0dHUniwww0i9+3dywFT4u1568QG5WQ=','2017-09-05 05:22:05',1),(193,3,'4uiIgoR/iYGQk4W0QcpiK4wvvWHrfgggniKtkdzPuKbQkMnPYRJAa2gswif2hBUTbCM=','2017-09-05 05:28:35',1),(194,3,'o8COTzzct+sHBXRrCtHv+fTN/liXZKOjD9RqYKdDws5XM2SSRRd+dDCHcVZ/fP6DtzM=','2017-09-05 05:28:49',1),(195,3,'wJtS5ua9TxteCl32yA8mjjKRZgIwUM9G/5iYR4Zn91S2o7e6QYYrPYrGwr9L8PcHkMI=','2017-09-05 05:31:18',1),(196,3,'dZPiTivyKPc0xQEeX0v17OUUUFrC07KHK1EcAacpczIxvoXy8bc0RhBsFQP6V8WMQfU=','2017-09-05 05:31:29',1),(197,3,'tqRp45kJaUTN9wBS9GOg8jIuL+S1u4GUBT9qBo6eW/H1uVeLvBD2MnznWyVcPoYrh64=','2017-09-05 05:32:30',1),(198,4,'/60ne0e1Lm91L5BVzLUvJ+wxdjNtaHvSiRewUjN51R7ha/cKQc85Ovi6/H0IYtvYTEQ=','2017-09-05 05:34:12',1),(199,4,'3hLrhMufzIVfKSAoPaDSjcsa2rnIw1jchePE7KIzD1DJkyHLUkB0hdmVSlZXhqBz4gU=','2017-09-05 05:34:24',1),(200,4,'z+pcE2vxBs1C+QfuBGt+9atWHNlyAf/7B4noTwLN1sAHsEbuMRIy5WZEBKq7brH+vt8=','2017-09-05 05:34:41',1),(201,4,'KbuQN9FujYIvgnWgP0zhFUn6npBhddLB3PetPmdhPRg5HMTsXQe/jNkdEwyMHluune0=','2017-09-05 05:35:52',1),(202,4,'qc+HBic/l0xeeGl/7mWrwJVXstvN1QO7kesvTnVKFV7xpvVE6w54u5QB0aOTP3aXhSw=','2017-09-05 05:36:03',1),(203,4,'Avm3PL8ei2Vp/dZal/3ZCFjU4MA4MeapLlkluMyIBVaeKHuC0xJQBGbgLIxujBxOZXs=','2017-09-05 05:36:11',1),(204,4,'yNFSECvAUlqoRsuTDrJGSgFlC851DaVjAcjn8O0VUey8+ELTT+y9fzLb5osSTqHqbYU=','2017-09-05 05:36:21',1),(205,3,'NiSYJxEcZBGn36wFyeV5y0CKr7M9/e8TTFivEptAKrj401GtLXv4Ptayy2VsxnpQWv8=','2017-09-05 05:39:55',1),(206,3,'GgE13Eme+iaqnDaaJDdttoZewp8cTKSHEB73QwvEHnzsxhbs5LhjSW7HLVpeaWccJPI=','2017-09-05 05:40:14',1),(207,3,'v88eTXaEOruhl72qA0fmfcumJ2emN3K8sUbrhZV4d4WoDgwkcJ1YvhVsfLI5UG5FtTM=','2017-09-05 05:43:32',1),(208,3,'kyl6ALk+BhT/pGwha57iZwjQa0W8uaE1wMUOD8zPy/d0EITMQ8Tpxi8q9Z/Wc1XNDP0=','2017-09-05 05:43:43',1),(209,3,'3SuVQ1nnsoADlR3mbi37rZtSPvwmvawCyoVoaEQUVqSv3R9Y97aq5DL8bsahSglw+Rs=','2017-09-05 05:43:54',1),(210,3,'C1VrfQ/1kUYq9tP1FMRtFkZXuq3vUVefWnIjqDqgJCYgPiwrxmxLr2D0ctqERqlgZBo=','2017-09-05 05:44:05',1),(211,3,'HMDYhfsrNKiZr5sHI+a0ETuE/EWMxjG57ECIG7FaVcOR5QaikXwKwnKwZjDg1ukKTCc=','2017-09-05 05:44:15',1),(212,3,'P5ohGhF90BjjnvQ0kykSmkH61cttslCp5QtolAtukgzw1Oj8hghE5WPqAGWvd5oKzVQ=','2017-09-05 05:44:25',1),(213,3,'d1h827gkrVZG2Yga0k6egXstqV9DloK6e4onSoHDJwgMvwX59VFbStx06k+MECKoswo=','2017-09-05 05:44:36',1),(214,3,'SpJm9og9YXSxJzg5yjylMVRiAyViSRT88lOrB+b0hql41LnFYlePM5V4WR+Eyrfkywk=','2017-09-05 05:44:48',1),(215,4,'UbD32WK9UdCp5dH+krUgPnF3NhhGUjOlLb8uOmtdyLv8WdCCqtuiBJ3+Cd2mYsLNcnk=','2017-09-05 05:46:55',1),(216,4,'rHCJJot7t6s3PHZEXbGUMr4v5YYt1lsb3mwaYux542jFMHjqUz53ps5k6oYAR2T8pY8=','2017-09-05 05:47:10',1),(217,4,'24CRSv4c0ByqSIkJG1UWmZyzOQeLuGL9afdIL2A0+netYTyhZtGjNqYSa5GbVrNGGsU=','2017-09-05 05:48:12',1),(218,4,'JwCXYNCfhSemz+kKkOc8Ayw70kJ8G5eVqYJDc1Fsr9vmAiY5rKgfQsQxEdG1rcXZ54k=','2017-09-05 05:48:22',1),(219,3,'hHzcMmZLkjpOHBInnYkjAimbeKibSNi6xqDFCZR7japvA2wf5C0HYChkKI/LEfSBvCU=','2017-09-05 05:49:05',1),(220,3,'h3ZAxUxS1ZONUf1psWAGi6JJjIjgOFGyOX4GJDrQU/EiqcnuEmFCRf5MWFBlTTzxWFY=','2017-09-05 05:50:17',1),(221,3,'9IcXb9JAXdRGp9UH9GutIJN6ST2Eo9ndiKkVa5u4EKAHUb6u6d8pZ+JvfNKNcGBMJ9s=','2017-09-05 05:51:04',1),(222,3,'Q/qGKLWY+AWb8dWY1M3VqY4FMdbmNrI6IS3733b6tCbCh1aXTSFpW7RWvf24qfeFLM8=','2017-09-05 05:52:40',1),(223,3,'VpwD3+41NBZ4VaNCi6bXLXMaJNismketEdB1IFu5wPYzHpvYzPMEDRgKWAcxLAd6cFc=','2017-09-05 05:52:49',1),(224,3,'hA00omBvUD3G6+nLFvz4muHFITm8EYIcXHmVOzwR5/iEkx3jKKmfwco/wzKExq9nUzM=','2017-09-05 05:52:49',1),(225,3,'fHVsrG3ejjZsGL+jyQpGwKBTKQLSILVZWdz/W+xbFFKI2Kmftbbkn1Qd5kVVPp3sReg=','2017-09-05 05:52:49',1),(226,3,'t+mQW+Tsp9NrgbbuQVgdi2zYvOs/pbIOWe1PZwYMt2aAPMYzLVdlUO6Z8CVXXgWbuuQ=','2017-09-05 05:53:44',1),(227,3,'nkFgygm9teXThTytNjiYBA+qDyESz8JzAtuIAvlGy9iMG9FdQjdtGXoVXbDS6teSnak=','2017-09-05 06:01:53',1),(228,3,'SucHDqEXBxxwpkZ6SDofz4LRIprLEc3pi6hxc5Iz3y4Wlh3tLZoFR58Ue4lq/rJfaOQ=','2017-09-05 06:02:46',1),(229,3,'Dk6IrPODchQYBB2kCZp3b2MjAU/g8dz8e/4RGAuw4aYQEbbxiCONsyyGSnMW+AIP+QU=','2017-09-05 06:02:46',1),(230,3,'jhYcDWD2FBJCwSACgTuYfADrILfOif9BS2KzPNkkwIZo7iMZAkriB8aLfY2lAuOVir4=','2017-09-05 06:03:45',1),(231,3,'W3G99TTGwrLogzNq2ftZwujMpmkWhzaiLlBJTUwipuQ9RbZDinjq7qwSVAQbbxDNonA=','2017-09-05 06:04:39',1),(232,3,'RKIzd2+PYJNPdRLd7uIU8Nail5ol3hF7v6xV8XT+5FF3YGgp1/ygeE43SvPYa392TF8=','2017-09-05 06:05:48',1),(233,3,'kop6DSnikE0CPwRiBX+PMwWGFzPSioR8VNiqn1WJfhZuGaLrLcj+P9a0QUi14ZFLHnw=','2017-09-05 06:06:48',1),(234,3,'YBTSd27e5SMOQsOfQ7cOGZYIlzsF2/14qij7jY19EDUWhUqefk9+KmeHboPnS3C7QvQ=','2017-09-05 06:08:56',1),(235,4,'7+VeHj73b5VkbmiXCa+qdM1mPgxJ13GxjZC9V+rDu0gqChzZSuMjwTjTqlP7mAxaO/o=','2017-09-05 06:14:10',1),(236,4,'yyiXyQtl+KnZ/1zDlkr9iOfMRO/aTVMZOJGzdxxXinIqYkIFBA9kPUYfF2i1Lu6hJvA=','2017-09-05 06:15:03',1),(237,4,'o5HqR/jwwuOSeCSiC/dD6oGSYPztjIQOqwxho2Zv1rPr2rn/NxF1ItrYCwJVfE1Y51I=','2017-09-05 06:16:32',1),(238,4,'nW/RqyHGn3oqWhItahDGEsMZoQGyz2trhmpyz0MWI1Eq0kWG1lS5+u1G2bIQsjlvsL4=','2017-09-05 06:17:15',1),(239,4,'Lgc1fKHdt5ekrKP56HOvi+M4Jff93aTnfFvpgo9Qcf+xopUlyOM+VCcaOye1OrwgyQQ=','2017-09-05 06:17:35',1),(240,4,'0Tl17q20Cfhxjr1vYeJeMfSae0obg91qzPg1PxM/BbA1uFnpHgwiJzb40hqyUf9pBVc=','2017-09-05 06:17:53',1),(241,4,'ds6KWPKGtJfIBIO4dyn/BQQ8HJU8MjgULQYQZdAUr+TcpA8GpvWWGK9JWJraDxHQld0=','2017-09-05 06:19:40',1),(242,3,'7zycCGKb1P0Lcx9dgP14BvK3YCLburemK6ftcHC10MlPrKttU00AANBqIUZjB+PQbN0=','2017-09-05 06:22:50',1),(243,3,'cv2O024n7dYufCtLLigACFW8oR0nL8311tafCVOdLNq1kc+KAAuab21f9uCMsMSWNmk=','2017-09-05 06:26:17',1),(244,3,'7SUpaIMu1/3cdsiyLQIjgFKuYwqKgSWknxglCLJoVLIcrOpc6yFhQNqZBYbURR69dGU=','2017-09-05 06:27:15',1),(245,3,'iZ+iEUrIW1B4tXm0uCGCrV8saCiCbL7E7g6udwZtZ2HBqWfi5sQ5No4Kf6VQrXyhDcI=','2017-09-05 06:27:54',1),(246,3,'pF35tHRR0vQkhu9P0+2YCxxarhi8eIhJlG9rRSYinT6ybybcYo6bN/0lOAirs5cDLRE=','2017-09-05 06:28:29',1),(247,3,'O/mnJalzV8As90FAglbO0w7WLrccWvHEcScBhB1YnYFCGO7SpOKsgW2c1pF/rhd/2Is=','2017-09-05 06:28:45',1),(248,3,'+yl/L1qmWZcrdl35jaVWKe7k+kR8CI76ta+5UPA8NNfqSDLhQ7ukpPmb5qvPZ3ThGLA=','2017-09-05 06:28:57',1),(249,3,'Uf3+jBxIxlbs++x67ZWihe0uMbM/x31m+Ngeu3Fy5P0qwrZdtWqOiQN9au2tPnHTlso=','2017-09-05 06:31:29',1),(250,4,'A/gPz9n9gEt4+MlPNZaXsYIYITUGmZQFzmp6k3L//eu72suCxi1YqNgxf4zVVDs5YCw=','2017-09-05 06:31:44',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_flow`
--

LOCK TABLES `money_flow` WRITE;
/*!40000 ALTER TABLE `money_flow` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `IDX_CC9FF86B3B1CE6A3` (`customer_order`),
  KEY `IDX_CC9FF86BD34A04AD` (`product`),
  CONSTRAINT `FK_CC9FF86B3B1CE6A3` FOREIGN KEY (`customer_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CC9FF86BD34A04AD` FOREIGN KEY (`product`) REFERENCES `products` (`barcode`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lines`
--

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;
INSERT INTO `order_lines` VALUES (1,1,'00000',1),(2,2,'22222',2),(3,2,'11111',5),(4,3,'22222',2),(5,3,'11111',5),(6,4,'22222',2),(7,4,'11111',5),(8,5,'22222',2),(9,5,'11111',4),(10,6,'22222',2),(11,6,'11111',4),(12,7,'22222',2),(13,7,'11111',4),(14,8,'22222',2),(15,8,'11111',4),(16,9,'22222',2),(17,9,'11111',4),(18,10,'22222',2),(19,10,'11111',4),(20,11,'22222',2),(21,11,'11111',4),(22,12,'22222',2),(23,12,'11111',4),(24,13,'22222',2),(25,13,'11111',4),(26,14,'22222',2),(27,14,'11111',4),(28,15,'22222',2),(29,15,'11111',4),(30,16,'22222',2),(31,16,'11111',4),(32,17,'22222',2),(33,17,'11111',4),(34,18,'22222',0),(35,18,'11111',1),(36,19,'22222',0),(37,19,'11111',1),(38,20,'22222',0),(39,20,'11111',1),(40,21,'22222',0),(41,21,'11111',1),(42,22,'22222',0),(43,22,'11111',1),(44,23,'22222',0),(45,23,'11111',1),(46,24,'22222',0),(47,24,'11111',1),(48,25,'22222',0),(49,25,'11111',1),(50,26,'54490000',3),(51,27,'54490000',3),(52,28,'54490000',3);
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
  PRIMARY KEY (`id`),
  KEY `IDX_E52FFDEE2BE38BB7` (`customer_user_account`),
  KEY `IDX_E52FFDEE6526CC6A` (`cash_register_account`),
  CONSTRAINT `FK_E52FFDEE2BE38BB7` FOREIGN KEY (`customer_user_account`) REFERENCES `user_accounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E52FFDEE6526CC6A` FOREIGN KEY (`cash_register_account`) REFERENCES `user_accounts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,1,1,'2017-09-04 18:58:32',0,0),(2,5,1,0,'2017-09-04 19:02:44',0,1),(3,5,1,0,'2017-09-04 19:02:47',0,1),(4,5,1,0,'2017-09-04 19:02:49',0,1),(5,5,1,0,'2017-09-04 19:02:56',0,1),(6,5,1,0,'2017-09-04 19:03:06',0,1),(7,5,1,0,'2017-09-04 19:03:07',0,1),(8,5,1,0,'2017-09-04 19:03:08',0,1),(9,5,1,0,'2017-09-04 19:03:09',0,1),(10,5,1,0,'2017-09-04 19:03:10',0,1),(11,5,1,0,'2017-09-04 19:03:11',0,1),(12,5,1,0,'2017-09-04 19:03:11',0,1),(13,5,1,0,'2017-09-04 19:03:12',0,1),(14,5,1,0,'2017-09-04 19:05:23',0,1),(15,5,1,0,'2017-09-04 19:05:24',0,1),(16,5,1,0,'2017-09-04 19:05:24',0,1),(17,5,1,0,'2017-09-04 19:05:25',0,1),(18,5,1,0,'2017-09-04 19:05:34',0,1),(19,5,1,0,'2017-09-04 19:05:35',0,1),(20,5,1,0,'2017-09-04 19:05:37',0,1),(21,5,1,0,'2017-09-04 19:05:39',0,1),(22,5,1,0,'2017-09-04 19:05:39',0,1),(23,5,1,0,'2017-09-04 19:05:40',0,1),(24,5,1,0,'2017-09-04 19:05:41',0,1),(25,5,1,0,'2017-09-04 19:05:42',0,1),(26,5,1,0,'2017-09-05 06:27:26',0,1),(27,5,1,0,'2017-09-05 06:28:11',0,1),(28,6,1,0,'2017-09-05 06:31:59',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'rodeo_cara',0.5,0),(2,'pils_25cl',1,0),(3,'spe_25cl',1.5,0),(4,'spe_33cl',2,0),(5,'spe_33cl_plus',2.5,0),(6,'alcool_cl',0.5,0);
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
INSERT INTO `products` VALUES ('00000',1,'Autre',-1,0,0,0),('11111',2,'Autre',-75,0,0,0),('22222',3,'Autre',-32,0,0,0),('33333',4,'Autre',0,0,0,0),('44444',5,'Autre',0,0,0,0),('54490000',2,'coca',-9,0,0,0),('55555',6,'Autre',0,0,0,0),('5740600200541',2,'carlsberg',0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_to_match`
--

LOCK TABLES `rfid_to_match` WRITE;
/*!40000 ALTER TABLE `rfid_to_match` DISABLE KEYS */;
INSERT INTO `rfid_to_match` VALUES (1,'5381206120','2017-09-04 18:59:12'),(2,'5381206120','2017-09-04 19:15:57'),(3,'5381206120','2017-09-04 19:16:20'),(4,'5381206120','2017-09-04 20:09:41'),(5,'117116211120','2017-09-04 20:16:50'),(6,'6997112120','2017-09-04 20:19:57'),(7,'117116211120','2017-09-04 20:22:43'),(8,'117116211120','2017-09-04 20:24:23'),(9,'117116211120','2017-09-04 20:25:29'),(10,'117116211120','2017-09-04 20:26:04'),(11,'6997112120','2017-09-04 20:27:23'),(12,'6997112120','2017-09-04 20:27:59'),(13,'6997112120','2017-09-04 20:29:18'),(14,'6997112120','2017-09-04 20:29:29'),(15,'6997112120','2017-09-04 23:42:52'),(16,'117116211120','2017-09-05 05:47:23'),(17,'117116211120','2017-09-05 05:48:56'),(18,'117116211120','2017-09-05 05:48:57'),(19,'117116211120','2017-09-05 05:48:59'),(20,'117116211120','2017-09-05 05:49:00'),(21,'117116211120','2017-09-05 05:49:01'),(22,'117116211120','2017-09-05 05:49:02');
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
INSERT INTO `user_accounts` VALUES (1,2,'register',119.3,0,200,0),(2,2,'bank',-0.5,0,200,0),(3,NULL,'lost',0,0,200,0),(4,NULL,'spending',0,0,200,0),(5,3,'somebody',-116.1,0,200,0),(6,4,'somebody',-2.7,0,200,0),(7,5,'somebody',0,0,200,0),(8,6,'somebody',0,0,200,0);
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
INSERT INTO `users` VALUES (1,NULL,2,'super','admin','admin','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_SUPER_ADMIN','0','livrognebar@gmail.com',0),(2,NULL,1,'bar','man','barman','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_BARMAN','1','livrognebar@gmail.com',0),(3,NULL,2,'Damien','Meur','dams','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_ADMIN','5381206120','damienmeur@gmail.com',0),(4,NULL,2,'Julien','Daniello','dan','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_ADMIN','6997112120','juliendaniello@gmail.com',0),(5,4,1,'Nora','Fallica','nono','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_USER','4','no.fallica@gmail.com',0),(6,NULL,1,'John','Doe','john_doe','$2a$04$OPbUZDtSA8u5jvNrohpw5ei0CGnkiNcymg/azEgwh1.0X0dh58l8G','ROLE_USER','5','no.fallica@gmail.com',0);
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

-- Dump completed on 2017-09-05  7:12:53
