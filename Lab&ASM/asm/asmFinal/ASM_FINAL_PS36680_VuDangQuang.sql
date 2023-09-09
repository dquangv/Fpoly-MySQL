-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: detmayvanthanh_ps36680
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuahang` (
  `mach` varchar(5) NOT NULL,
  `tench` varchar(20) NOT NULL,
  `sdt` varchar(13) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`mach`),
  UNIQUE KEY `sdt` (`sdt`),
  UNIQUE KEY `diachi` (`diachi`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuahang`
--

LOCK TABLES `cuahang` WRITE;
/*!40000 ALTER TABLE `cuahang` DISABLE KEYS */;
INSERT INTO `cuahang` VALUES ('01','uniqlo','01666331161','01 son ki','abc@gmail.com'),('02','coolmate','02666331161','02 son ki','bcd@gmail.com'),('03','levi','03666331161','03 son ki','cde@gmail.com'),('04','muji','04666331161','04 son ki','def@gmail.com'),('05','h&m','05666331161','05 son ki','efg@gmail.com');
/*!40000 ALTER TABLE `cuahang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaihang`
--

DROP TABLE IF EXISTS `loaihang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaihang` (
  `malh` varchar(5) NOT NULL,
  `tenlh` varchar(20) NOT NULL,
  PRIMARY KEY (`malh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaihang`
--

LOCK TABLES `loaihang` WRITE;
/*!40000 ALTER TABLE `loaihang` DISABLE KEYS */;
INSERT INTO `loaihang` VALUES ('01','ao'),('02','quan'),('03','tat'),('04','gang_tay'),('05','khau_trang');
/*!40000 ALTER TABLE `loaihang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mathang`
--

DROP TABLE IF EXISTS `mathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mathang` (
  `mamh` varchar(5) NOT NULL,
  `tenmh` varchar(20) NOT NULL,
  `donvitinh` varchar(10) NOT NULL,
  `dongia` float NOT NULL,
  `malh` varchar(5) NOT NULL,
  PRIMARY KEY (`mamh`),
  KEY `fk_mh_lh` (`malh`),
  CONSTRAINT `fk_mh_lh` FOREIGN KEY (`malh`) REFERENCES `loaihang` (`malh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mathang`
--

LOCK TABLES `mathang` WRITE;
/*!40000 ALTER TABLE `mathang` DISABLE KEYS */;
INSERT INTO `mathang` VALUES ('0101','ao_thun','chiec',300000,'01'),('0102','ao_so_mi','chiec',450000,'01'),('0201','quan_tay','cai',400000,'02'),('0202','quan_jean','cai',500000,'02'),('0301','tat_cao','doi',150000,'03'),('0302','tat_thap','doi',120000,'03'),('0401','gang_tay_y_te','doi',350000,'04'),('0402','gang_tay_chong_rung','doi',378000,'04'),('0501','khau_trang_3_lop','cai',2500,'05'),('0502','khau_trang_4_lop','cai',3500,'05');
/*!40000 ALTER TABLE `mathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuxuat`
--

DROP TABLE IF EXISTS `phieuxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuat` (
  `sopx` varchar(5) NOT NULL,
  `ngaylp` date NOT NULL,
  `ngayxh` date DEFAULT NULL,
  `mach` varchar(5) NOT NULL,
  PRIMARY KEY (`sopx`),
  KEY `fk_px_ch` (`mach`),
  CONSTRAINT `fk_px_ch` FOREIGN KEY (`mach`) REFERENCES `cuahang` (`mach`),
  CONSTRAINT `check_nxh_nlp` CHECK ((`ngayxh` >= `ngaylp`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuxuat`
--

LOCK TABLES `phieuxuat` WRITE;
/*!40000 ALTER TABLE `phieuxuat` DISABLE KEYS */;
INSERT INTO `phieuxuat` VALUES ('01','2021-07-01','2021-07-06','01'),('02','2022-07-20','2022-07-25','02'),('03','2023-07-25','2023-07-30','03'),('04','2022-09-07','2022-09-12','04'),('05','2023-12-07','2023-12-12','02'),('06','2021-01-18','2023-07-22','05');
/*!40000 ALTER TABLE `phieuxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuxuatchitiet`
--

DROP TABLE IF EXISTS `phieuxuatchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuxuatchitiet` (
  `mamh` varchar(5) NOT NULL,
  `sopx` varchar(5) NOT NULL,
  `soluong` int NOT NULL,
  `ghichu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mamh`,`sopx`),
  KEY `fk_pxct_px` (`sopx`),
  CONSTRAINT `fk_pxct_mh` FOREIGN KEY (`mamh`) REFERENCES `mathang` (`mamh`),
  CONSTRAINT `fk_pxct_px` FOREIGN KEY (`sopx`) REFERENCES `phieuxuat` (`sopx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuxuatchitiet`
--

LOCK TABLES `phieuxuatchitiet` WRITE;
/*!40000 ALTER TABLE `phieuxuatchitiet` DISABLE KEYS */;
INSERT INTO `phieuxuatchitiet` VALUES ('0101','01',1,NULL),('0101','03',3,NULL),('0102','03',5,NULL),('0201','04',4,NULL),('0202','01',3,NULL),('0301','02',2,NULL),('0301','05',10,NULL),('0302','04',4,NULL),('0402','01',7,NULL),('0402','04',4,NULL),('0501','01',8,NULL),('0502','05',5,NULL);
/*!40000 ALTER TABLE `phieuxuatchitiet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-01 13:14:53
