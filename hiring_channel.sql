-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hiring_channel
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('03140b21-31a7-456b-98f9-add0ab65baf4','Gojek',NULL,'logo-1577324620086.png','Jakarta','perusahaan di bidangnya'),('0b6b529a-bd19-4445-921d-c4051cf86d0f','OVO',NULL,'logo-1577324677763.jpg','Jakarta','perusahaan di bidangnya'),('537de986-1851-4af5-9c4d-96f5228150ba','Link Aja!',NULL,'logo-1577324655061.png','Purwokerto','perusahaan di bidangnya'),('7521e146-003e-4a03-8ae3-2c64d0c25207','Jenius',NULL,'logo-1577324631763.png','Jakarta','perusahaan di bidangnya'),('7f564736-ee01-4a6d-a220-5dca0cd383bf','Facebook',NULL,'logo-1577324598112.png','Surabaya','perusahaan di bidangnya'),('ab06221b-99fa-44c5-9721-6f9ccbd4917f','instagram','instagram@gmail.com','','',''),('c7d177ed-d3e4-43b0-a175-42678be49b0f','Google','google@gmail.com','logo-1577279406769.jpg','ponorogo','adalah perusahaan disana');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engineer` (
  `id` varchar(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `expectsalary` varchar(50) DEFAULT NULL,
  `skill` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `dateofbirth` date NOT NULL,
  `showcase` varchar(255) NOT NULL,
  `datecreate` timestamp NULL DEFAULT NULL,
  `dateupdated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES ('302820b6-2ebc-4ec0-9f10-5a502142adec','Budi setiawan','photo-1577162860569.jpg','budikuy@gmail.com','Backend Developer','6000000','golang','malang','1998-08-10','portofolio.com','2019-12-24 04:47:40','2019-12-24 04:47:40'),('3269dcf2-46c7-4ecd-a81f-045968502f2e','Rahmawati','photo-1577167958582.jpg','watikuy@gmail.com','Backend Developer','6000000','Codeigniter','malang','1998-08-10','portofolio.com','2019-12-24 06:12:38','2019-12-24 06:12:38'),('38c62367-5e3c-4d1c-b8c9-37f0e9325ece','Rahayu','photo-1577162542922.jpg','rahayu@gmail.com','Frontend Developer','5000000','HTML, CSS','surabaya','1998-08-10','portofolio.com','2019-12-24 04:42:23','2019-12-24 04:42:23'),('3fd5c2bf-bf38-46bb-a5ca-37839b0d6f3c','Siska emilia','photo-1577162694860.jpg','siska@gmail.com','Fullstack Developer','9000000','react native','malang','1998-08-10','portofolio.com','2019-12-24 04:44:54','2019-12-24 04:44:54'),('4008e87f-aafd-4607-89af-ab9b7debe11b','Tiara subagyo','photo-1577168204306.jpg','Tiarakuy@gmail.com','Fullstack Developer','5000000','Kotlin, Swift','malang','1998-08-10','portofolio.com','2019-12-24 06:16:44','2019-12-24 06:16:44'),('7f0e1724-d6fa-4b9f-adea-4a39cf7be714','Amanda Riza','photo-1577326004504.jpg','amankuy@gmail.com','Fullstack Developer','10000000','golang, react native','malang','1998-08-10','portofolio.com','2019-12-26 02:06:44','2019-12-26 02:06:44'),('8589b6f5-136b-43bc-8874-f2596ce0e7c2','Nadia kurohige','photo-1577245960427.jpg','kurokuy@gmail.com','Fullstack Developer','5000000','laravel, bootstrap','malang','1998-08-10','portofolio.com','2019-12-25 03:52:40','2019-12-25 03:52:40'),('891c8031-cbf4-4eb6-9c59-afd29e29d39d','zoro','','zoro@gmail.com','',NULL,'','','0000-00-00','','2019-12-26 03:46:36','2019-12-26 03:46:36'),('8a1ebd3a-8924-4fc0-8b8e-beb1a2c595db','Joko Susilo','photo-1577168038112.jpg','Jokokuy@gmail.com','Fullstack Developer','10000000','Javascript','malang','1998-08-10','portofolio.com','2019-12-24 06:13:58','2019-12-24 06:13:58'),('93fb4b87-4435-4bff-9c48-3c512bbb91aa','deny','photo-1577253806149.jpg','deny@gmail.com','pekerja lepas','5000000','angular, php, laravel','malang','1998-08-10','link gan','2019-12-24 06:21:46','2019-12-25 06:03:26'),('97a49e4f-c17f-49ef-82b6-e819e9e57a08','Nikmatul Khoiri','photo-1577163084072.jpg','khoiri@gmail.com','Backend Developer','6000000','ASP.NET','malang','1998-08-10','portofolio.com','2019-12-24 04:51:24','2019-12-24 04:51:24'),('996d14dd-70ea-44cd-a961-cc6869c56739','Nurhayati','photo-1577325913042.jpg','nurkuy@gmail.com','Fullstack Developer','5000000','php','malang','1998-08-10','portofolio.com','2019-12-26 02:05:13','2019-12-26 02:05:13'),('d3e49d51-c9b1-4098-b5f0-d0a6f156848d','Nadia Kuncoro','photo-1577168144512.jpg','Nadiakuy@gmail.com','Fullstack Developer','5000000','Kotlin, Swift','malang','1998-08-10','portofolio.com','2019-12-24 06:15:44','2019-12-24 06:15:44'),('d44fe989-b283-44fc-85cd-4771ba70c255','Sulastri','photo-1577162642361.jpg','sulastri@gmail.com','Fullstack Developer','6000000','java','surabaya','1998-08-10','portofolio.com','2019-12-24 04:44:02','2019-12-24 04:44:02'),('fe57597c-b38b-4b23-8d19-adb83ab24e02','Cece','photo-1577326087716.jpg','cecekuy@gmail.com','Fullstack Developer','9000000','Laravel','malang','1998-08-10','portofolio.com','2019-12-26 02:08:07','2019-12-26 02:08:07');
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('891c8031-cbf4-4eb6-9c59-afd29e29d39d','zoro@gmail.com','$2a$08$BofmmvB/fgloiDkRGkcIbODUN0JajVL6tqE4.E8Z4yDlY5qZCPkym','engineer'),('89c3094e-1709-4d04-953c-573501bcab4e','gojek@gmail.com','$2a$08$TAkkGvFpqW4SOLsddGP9HODbxeuQwEpXoFGtOLF430kPpVbYVnPE6',''),('ab06221b-99fa-44c5-9721-6f9ccbd4917f','instagram@gmail.com','$2a$08$UPZoKZzns2RzV0MvsHZ24OrEbx13a083.SdnL34pb8aV6vioUZK.u','');
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

-- Dump completed on 2019-12-29 18:06:21
