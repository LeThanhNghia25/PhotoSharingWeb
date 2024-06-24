-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: photosharingweb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `adminCode` int DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL,
  `contennt` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(250) DEFAULT NULL,
  `img` varchar(350) DEFAULT NULL,
  `createdTime` varchar(50) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
INSERT INTO `img` VALUES (1,'Những Đặc Điểm Dễ Thương Của Mèo Làm Tan Chảy Trái Tim Bạn','Mèo, với vẻ ngoài nhỏ nhắn và những hành động tinh nghịch, luôn khiến con người phải mê mẩn. Đôi mắt tròn to, sáng lấp lánh như hai viên ngọc, cùng với bộ lông mềm mại, mượt mà, tạo nên hình ảnh không thể cưỡng lại. ','resources/img/1.jpg','10-10-2001','ok'),(2,'Mèo Con – Niềm Vui Nhỏ Bé Trong Cuộc Sống','Những chú mèo con, với vẻ ngoài ngây thơ và đôi mắt to tròn, luôn mang đến niềm vui và tiếng cười cho mọi gia đình. Chúng chơi đùa không ngừng, chạy nhảy khắp nơi và khám phá mọi ngóc ngách trong nhà.','resources/img/2.jpg','10-10-2001','ok'),(3,'Đôi mắt to tròn long lanh và chiếc mũi hồng xinh xắn của thỏ con','Thỏ con là loài động vật rất hiền lành và thân thiện. Chúng thích được con người vuốt ve và âu yếm. Hình ảnh thỏ con bú sữa mẹ là biểu tượng của tình mẫu tử thiêng liêng và đầy cảm động.','resources/img/3.jpg','10-10-2001','ok'),(4,'Hình ảnh thỏ con bú sữa mẹ ấm áp và đầy tình cảm','Ngoài ra, thỏ con cũng rất tò mò về thế giới xung quanh. Chúng thường xuyên khám phá mọi ngóc ngách trong nhà và khu vườn. Khi ngủ, thỏ con thường cuộn tròn thành một quả bóng nhỏ trông rất đáng yêu.','resources/img/4.jpg','10-10-2001','ok'),(5,'Bộ sưu tập những khoảnh khắc đáng yêu của thỏ con khi ngủ','hỏ con là một trong những loài động vật nhỏ bé và dễ thương nhất trên thế giới. Chúng sở hữu bộ lông mềm mại như bông, đôi mắt to tròn long lanh và chiếc mũi hồng xinh xắn.','resources/img/5.jpg','10-10-2001','ok'),(6,'Thỏ con và những người bạn động vật khác trong trang trại','Nuôi thỏ con không chỉ mang đến niềm vui mà còn giúp chúng ta giải tỏa căng thẳng và giảm bớt stress. Tiếng kêu líu lo của thỏ con như một bản nhạc du dương giúp ta thư giãn tâm hồn.','resources/img/6.jpg','10-10-2001','ok'),(7,'Hành trình khám phá thế giới xung quanh của thỏ con','Với vẻ ngoài dễ thương và tính cách hiền lành, thỏ con đã trở thành một trong những loài thú cưng được yêu thích nhất trên thế giới. Chúng là món quà tuyệt vời dành cho những ai yêu động vật và muốn có một người bạn đồng hành đáng yêu.','resources/img/7.jpg','10-10-2001','ok'),(8,'Chú thỏ con mang đến niềm vui và tiếng cười cho mọi người','Hình ảnh thỏ con tinh nghịch nhảy nhót và nô đùa trong vườn cỏ mang đến niềm vui và sự thư giãn.','resources/img/8.jpg','10-10-2001','ok'),(9,'Thỏ con là một trong những loài động vật nhỏ bé và dễ thương','Thỏ con là loài hiền lành, thân thiện, thích được vuốt ve và âu yếm.','resources/img/9.jpg','10-10-2001','ok');
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL,
  `notification` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'quan','123','quanquan174@yahoo.com','1985-08-15','active');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'photosharingweb'
--

--
-- Dumping routines for database 'photosharingweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-25  0:39:09
