-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: BookShop
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authinfo`
--

DROP TABLE IF EXISTS `authinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authinfo` (
  `auth_email` varchar(200) NOT NULL,
  `auth_code` varchar(200) NOT NULL,
  PRIMARY KEY (`auth_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authinfo`
--

LOCK TABLES `authinfo` WRITE;
/*!40000 ALTER TABLE `authinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `authinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_user_num` int NOT NULL,
  `cart_pd_num` int NOT NULL,
  `cart_pd_quan` int NOT NULL,
  KEY `user_num_fk` (`cart_user_num`),
  KEY `pd_num_fk` (`cart_pd_num`),
  CONSTRAINT `pd_num_fk` FOREIGN KEY (`cart_pd_num`) REFERENCES `product` (`pd_num`),
  CONSTRAINT `user_num_fk` FOREIGN KEY (`cart_user_num`) REFERENCES `user` (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (3,53,1),(3,56,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_ad`
--

DROP TABLE IF EXISTS `center_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `center_ad` (
  `ad_index` int NOT NULL,
  `ad_pd_num` int NOT NULL,
  `ad_content` varchar(100) NOT NULL,
  PRIMARY KEY (`ad_index`),
  KEY `center_pd_fk` (`ad_pd_num`),
  CONSTRAINT `center_pd_fk` FOREIGN KEY (`ad_pd_num`) REFERENCES `product` (`pd_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_ad`
--

LOCK TABLES `center_ad` WRITE;
/*!40000 ALTER TABLE `center_ad` DISABLE KEYS */;
INSERT INTO `center_ad` VALUES (2,53,'해외에서 인기많은 유대인 랍비씨가 집필한 책');
/*!40000 ALTER TABLE `center_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest` (
  `inter_user_num` int NOT NULL,
  `inter_pd_num` int NOT NULL,
  KEY `int_user_num_fk` (`inter_user_num`),
  KEY `int_pd_num_fk` (`inter_pd_num`),
  CONSTRAINT `int_pd_num_fk` FOREIGN KEY (`inter_pd_num`) REFERENCES `product` (`pd_num`),
  CONSTRAINT `int_user_num_fk` FOREIGN KEY (`inter_user_num`) REFERENCES `user` (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (1,58),(1,6);
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_ad`
--

DROP TABLE IF EXISTS `main_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_ad` (
  `ad_index` int NOT NULL,
  `ad_file` varchar(50) NOT NULL,
  `ad_subject` varchar(10) NOT NULL,
  PRIMARY KEY (`ad_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_ad`
--

LOCK TABLES `main_ad` WRITE;
/*!40000 ALTER TABLE `main_ad` DISABLE KEYS */;
INSERT INTO `main_ad` VALUES (1,'이벤트_9월의 사은품.jpg','9월의 사은품'),(3,'필수 그래픽.png','sadas');
/*!40000 ALTER TABLE `main_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord`
--

DROP TABLE IF EXISTS `ord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ord` (
  `order_num` int NOT NULL,
  `order_user_email` varchar(50) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(20) DEFAULT '결제완료',
  `order_price` int NOT NULL,
  `order_mileage` int DEFAULT '0',
  PRIMARY KEY (`order_num`),
  KEY `ord_email_fk` (`order_user_email`),
  CONSTRAINT `ord_email_fk` FOREIGN KEY (`order_user_email`) REFERENCES `user` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord`
--

LOCK TABLES `ord` WRITE;
/*!40000 ALTER TABLE `ord` DISABLE KEYS */;
INSERT INTO `ord` VALUES (1,'hhun6840@naver.com','2022-07-01','결제취소',65000,0),(2,'hhun6840@naver.com','2022-09-06','결제취소',30800,30000),(3,'hhun6840@naver.com','2022-09-06','결제취소',30800,30000),(4,'hhun6840@naver.com','2022-09-06','배송완료',28000,30000),(5,'tree6316@naver.com','2022-09-06','배송완료',32000,10000),(6,'test4@naver.com','2022-09-03','배송완료',40000,0),(7,'test9@gmial.com','2022-09-03','배송완료',40000,0),(8,'test9@gmial.com','2022-09-03','배송완료',40000,0),(9,'test12@naver.com','2022-09-03','배송완료',40000,0),(10,'test11@naver.com','2022-09-03','배송완료',40000,0),(11,'test3@naver.com','2022-09-03','배송완료',40000,0),(12,'test9@gmial.com','2022-09-03','배송완료',40000,0),(13,'test12@naver.com','2022-09-03','배송완료',40000,0),(14,'test16@naver.com','2022-09-03','배송완료',40000,0),(15,'test12@naver.com','2022-09-03','배송완료',40000,0),(16,'test16@naver.com','2022-09-03','배송완료',40000,0),(17,'test3@naver.com','2022-09-03','배송완료',40000,0),(18,'test12@naver.com','2022-09-03','배송완료',40000,0),(19,'test12@naver.com','2022-09-04','배송완료',40000,0),(20,'test3@naver.com','2022-09-04','배송완료',40000,0),(21,'test8@naver.com','2022-09-04','배송완료',40000,0),(22,'test11@naver.com','2022-09-04','배송완료',40000,0),(23,'test12@naver.com','2022-09-04','배송완료',40000,0),(24,'test8@naver.com','2022-09-04','배송완료',40000,0),(25,'test12@naver.com','2022-09-04','배송완료',40000,0),(26,'test4@naver.com','2022-09-04','배송완료',40000,0),(27,'test12@naver.com','2022-09-04','배송완료',40000,0),(28,'test16@naver.com','2022-09-04','배송완료',40000,0),(29,'test12@naver.com','2022-09-04','배송완료',40000,0),(30,'test11@naver.com','2022-09-04','배송완료',40000,0),(31,'test8@naver.com','2022-09-04','배송완료',50000,0),(32,'test12@naver.com','2022-09-02','배송완료',50000,0),(33,'test10@naver.com','2022-09-02','배송완료',50000,0),(34,'test10@naver.com','2022-09-02','배송완료',50000,0),(35,'test7@gmail.com','2022-09-02','배송완료',50000,0),(36,'test3@naver.com','2022-09-02','배송완료',50000,0),(37,'test4@naver.com','2022-09-02','배송완료',50000,0),(38,'test4@naver.com','2022-09-07','배송완료',50000,0),(39,'test4@naver.com','2022-09-07','배송완료',50000,0),(40,'test4@naver.com','2022-09-07','배송완료',50000,0);
/*!40000 ALTER TABLE `ord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orddetail`
--

DROP TABLE IF EXISTS `orddetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orddetail` (
  `order_num` int NOT NULL,
  `order_pd_num` int NOT NULL,
  `order_quan` int NOT NULL,
  `order_pd_price` int NOT NULL,
  KEY `ord_num_fk` (`order_num`),
  KEY `ord_pdn_fk` (`order_pd_num`),
  CONSTRAINT `ord_num_fk` FOREIGN KEY (`order_num`) REFERENCES `ord` (`order_num`),
  CONSTRAINT `ord_pdn_fk` FOREIGN KEY (`order_pd_num`) REFERENCES `product` (`pd_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orddetail`
--

LOCK TABLES `orddetail` WRITE;
/*!40000 ALTER TABLE `orddetail` DISABLE KEYS */;
INSERT INTO `orddetail` VALUES (2,55,1,17000),(2,54,1,13800),(4,56,1,16500),(4,39,1,11500),(5,17,1,18000),(5,14,1,14000),(1,48,2,25000),(2,48,2,25000),(3,48,2,25000),(4,48,2,25000),(5,48,2,25000),(6,48,2,25000),(7,48,2,25000),(8,48,2,25000),(9,48,2,25000),(10,48,2,25000),(11,48,2,25000),(12,48,2,25000),(13,48,2,25000),(14,48,2,25000),(15,48,2,25000),(16,48,2,25000),(17,48,2,25000),(18,48,2,25000),(19,48,2,25000),(20,48,2,25000),(21,48,2,25000),(22,48,2,25000),(23,48,2,25000),(24,48,2,25000),(25,48,2,25000),(26,48,2,25000),(27,48,2,25000),(28,48,2,25000),(29,48,2,25000),(30,48,2,25000),(31,48,2,25000),(32,48,2,25000),(33,48,2,25000),(34,48,2,25000),(35,48,2,25000),(36,48,2,25000),(37,48,2,25000),(38,48,2,25000),(39,48,2,25000),(40,48,2,25000);
/*!40000 ALTER TABLE `orddetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popup`
--

DROP TABLE IF EXISTS `popup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `popup` (
  `popup_pd_num` int DEFAULT NULL,
  `popup_file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popup`
--

LOCK TABLES `popup` WRITE;
/*!40000 ALTER TABLE `popup` DISABLE KEYS */;
/*!40000 ALTER TABLE `popup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pd_num` int NOT NULL,
  `pd_type` varchar(10) NOT NULL,
  `pd_name` varchar(25) NOT NULL,
  `pd_price` int NOT NULL,
  `pd_quan` int NOT NULL,
  `pd_file` varchar(100) NOT NULL,
  `pd_subject` varchar(100) NOT NULL,
  `pd_content` varchar(100) NOT NULL,
  `pd_count` int NOT NULL,
  `pd_date` date NOT NULL,
  PRIMARY KEY (`pd_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'국내도서','안윤',12000,64,'방어가 제철_표지.jpg','방어가 제철','방어가 제철_소개.jpg',0,'2022-07-01'),(2,'국내도서','정서경, 박찬욱',15000,80,'헤어질 결심_표지.jpg','헤어질 결심','헤어질 결심_소개.jpg',0,'2022-07-01'),(3,'국내도서','유시민',17500,58,'유럽도시기행_표지.jpg','유럽도시기행','유럽도시기행_소개.jpg',0,'2022-07-01'),(4,'국내도서','김민수',17000,37,'품격 있는 아내들의 남편 다루는 법_표지.jpg','품격 있는 아내들의 남편 다루는 법','품격 있는 아내들의 남편 다루는 법.jpg',0,'2022-07-01'),(5,'국내도서','박현숙',18000,61,'프렌즈 스페인·포르투갈_표지.jpg','프렌즈 스페인·포르투갈','프렌즈 스페인·포르투갈_소개.jpg',0,'2022-07-04'),(6,'국내도서','김유진',14000,0,'거북이자리_표지.jpg','거북이자리','거북이자리_소개.jpg',0,'2022-07-05'),(7,'국내도서','나동빈',34000,24,'이것이 취업을 위한 코딩 테스트다 with 파이썬_표지.jpg','이것이 취업을 위한 코딩 테스트다 with 파이썬','이것이 취업을 위한 코딩 테스트다 with 파이썬.jpg',0,'2022-07-08'),(8,'국내도서','김승호',17800,39,'돈의 속성 200쇄 리커버에디션_표지.jpg','돈의 속성 200쇄 리커버에디션','돈의 속성 200쇄 리커버에디션_소개.jpg',0,'2022-07-01'),(9,'국내도서','김자령',12000,23,'건담 싸부_표지.jpg','건담 싸부','건담 싸부_소개.jpg',0,'2022-07-08'),(10,'국내도서','허태연',15500,19,'하쿠다 사진관_표지.jpg','하쿠다 사진관','하쿠다 사진관_소개.jpg',0,'2022-07-11'),(11,'국내도서','김지혜',14500,0,'책들의 부엌_표지.jpg','책들의 부엌','책들의 부엌_소개.jpg',0,'2022-07-15'),(12,'국내도서','김다슬',17600,78,'기분을 관리하면 인생이 관리된다_표지.jpg','기분을 관리하면 인생이 관리된다','기분을 관리하면 인생이 관리된다_소개.jpg',0,'2022-07-20'),(13,'국내도서','김다슬',15000,16,'이제는 오해하면 그대로 둔다_표지.jpg','이제는 오해하면 그대로 둔다','이제는 오해하면 그대로 둔다_소개.jpg',0,'2022-07-29'),(14,'국내도서','손힘찬, 이다영',14000,4,'오늘은 이만 좀 쉴게요_표지.jpg','오늘은 이만 좀 쉴게요','오늘은 이만 좀 쉴게요_소개.jpg',1,'2022-07-30'),(15,'국내도서','민혜영',15000,54,'내 아이를 바꾸는 위대한 질문 하브루타_표지.jpg','내 아이를 바꾸는 위대한 질문 하브루타','내 아이를 바꾸는 위대한 질문 하브루타_소개.jpg',0,'2022-07-31'),(16,'국내도서','조홍식',18500,47,'22개 나라로 읽는 부의 세계사_표지.jpg','22개 나라로 읽는 부의 세계사','22개 나라로 읽는 부의 세계사_소개.jpg',0,'2022-07-31'),(17,'국내도서','장재기',18000,29,'따라하는 기도 구약편_표지.jpg','따라하는 기도 구약편','따라하는 기도 구약편_소개.jpg',1,'2022-07-31'),(18,'국내도서','장재기',15000,0,'따라 하는 기도_표지.jpg','따라 하는 기도','따라 하는 기도_소개.jpg',0,'2022-08-02'),(19,'국내도서','장재기',12000,64,'따라 하는 기도2_표지.jpg','따라 하는 기도2','따라 하는 기도2_소개.jpg',0,'2022-08-03'),(20,'국내도서','김은진',20000,73,'대출의 마법_표지.jpg','대출의 마법','대출의 마법_소개.jpg',0,'2022-08-03'),(21,'국내도서','우문식',22000,40,'마음 근육 키우기_표지.jpg','마음 근육 키우기','마음 근육 키우기_소개.jpg',0,'2022-08-04'),(22,'국내도서','오수현',16500,4,'스토리 클래식_표지.jpg','스토리 클래식','스토리 클래식_소개.jpg',0,'2022-08-06'),(23,'국내도서','나종호',15800,25,'뉴욕 정신과 의사의 사람 도서관_표지.jpg','뉴욕 정신과 의사의 사람 도서관','뉴욕 정신과 의사의 사람 도서관_소개.jpg',0,'2022-08-06'),(24,'국내도서','홍성수',12000,9,'말이 칼이 될 때_표지.jpg','말이 칼이 될 때','말이 칼이 될 때_소개.jpg',1,'2022-08-07'),(25,'국내도서','정혜신',15800,0,'당신이 옳다_표지.jpg','당신이 옳다','당신이 옳다_소개.jpg',0,'2022-08-08'),(26,'국내도서','김웅',15000,61,'검사내전_표지.jpg','검사내전','검사내전_소개.jpg',0,'2022-08-08'),(27,'국내도서','박병창',18000,85,'매매의 심리_표지.jpg','매매의 심리','매매의 심리_소개.jpg',0,'2022-08-09'),(28,'국내도서','안성은',18800,18,'믹스_표지.jpg','믹스','믹스_소개.jpg',0,'2022-08-09'),(29,'국내도서','심태승',17000,104,'경매대마왕 반드시 부자 되는 투자의 소신_표지.jpg','경매대마왕 반드시 부자 되는 투자의 소신','경매대마왕 반드시 부자 되는 투자의 소신_소개.jpg',0,'2022-08-10'),(30,'국내도서','오건영',18800,3,'인플레이션에서 살아남기_표지.jpg','인플레이션에서 살아남기','인플레이션에서 살아남기_소개.jpg',1,'2022-08-11'),(31,'해외도서','케이티 엥겔하트',18000,0,'죽음의 격_표지.jpg','죽음의 격','죽음의 격_소개.jpg',0,'2022-08-11'),(32,'해외도서','에디 러들로',23400,20,'위스키 테이스팅 코스_표지.jpg','위스키 테이스팅 코스','위스키 테이스팅 코스_소개.jpg',0,'2022-08-12'),(33,'해외도서','바비 더피',16200,50,'세대 감각 Generations_표지.jpg','세대 감각 Generations','세대 감각 Generations_소개.jpg',0,'2022-08-13'),(34,'해외도서','비비언 고닉',16000,100,'아무도 지켜보지 않지만 모두가 공연을 한다_표지.jpg','아무도 지켜보지 않지만 모두가 공연을 한다','아무도 지켜보지 않지만 모두가 공연을 한다_소개.jpg',0,'2022-08-13'),(35,'해외도서','메트 헤이그',16000,0,'위로의 책_표지.jpg','위로의 책','위로의 책_소개.jpg',0,'2022-08-15'),(37,'해외도서','에리히 프롬',12000,195,'사랑의 기술_표지.jpg','사랑의 기술','사랑의 기술_소개.jpg',0,'2022-08-18'),(38,'해외도서','히로나카 헤이스케',12800,95,'학문의 즐거움_표지.jpg','학문의 즐거움','학문의 즐거움_소개.jpg',0,'2022-08-19'),(39,'해외도서','랄프 왈도 에머슨',11500,96,'자기 신뢰_표지.jpg','자기 신뢰','자기 신뢰_소개.jpg',1,'2022-08-19'),(40,'해외도서','리사 아이사토',38000,4,'삶의 모든 색_표지.jpg','삶의 모든 색','삶의 모든 색_소개.jpg',0,'2022-08-19'),(41,'해외도서','후이',16800,23,'나라면 나와 결혼할까_표지.jpg','나라면 나와 결혼할까?','나라면 나와 결혼할까_소개.jpg',0,'2022-08-21'),(42,'해외도서','워리 라인스',18000,222,'기분 좋아지는 책_표지.jpg','기분 좋아지는 책','기분 좋아지는 책_소개.jpg',0,'2022-08-22'),(43,'해외도서','캐롤라인 냅',16000,154,'명랑한 은둔자_표지.jpg','명랑한 은둔자','명랑한 은둔자_소개.jpg',0,'2022-08-26'),(44,'해외도서','타라 웨스트오버',18000,86,'배움의 발견_표지.jpg','배움의 발견','배움의 발견_소개.jpg',0,'2022-08-30'),(45,'해외도서','크리스티앙 보뱅',13000,174,'환희의 인간_표지.jpg','환희의 인간','환희의 인간_소개.jpg',0,'2022-08-30'),(46,'해외도서','후지사키 사오리',14500,52,'독서 간주문_표지.jpg','독서 간주문','독서 간주문_소개.jpg',0,'2022-09-01'),(47,'해외도서','스기우라 사야카',16500,26,'여행자의 식사_표지.jpg','여행자의 식사','여행자의 식사_소개.jpg',0,'2022-09-01'),(48,'해외도서','무라카미 하루키',25000,81,'오래되고 멋진 클래식 레코드_표지.jpg','오래되고 멋진 클래식 레코드','오래되고 멋진 클래식 레코드_소개.jpg',0,'2022-09-01'),(49,'해외도서','사사 료코',16000,186,'엔드 오브 라이프_표지.jpg','엔드 오브 라이프','엔드 오브 라이프_소개.jpg',0,'2022-09-04'),(50,'해외도서','크리스티앙 보뱅',12500,0,'작은 파티 드레스_표지.jpg','작은 파티 드레스','작은 파티 드레스_소개.jpg',0,'2022-09-04'),(51,'해외도서','메리케이 윌머스',17000,50,'서평의 언어_표지.jpg','서평의 언어','서평의 언어_소개.jpg',0,'2022-09-04'),(52,'해외도서','신시아 L 코플랜드',15500,0,'고양이가 내게 가르쳐준 것들_표지.jpg','고양이가 내게 가르쳐준 것들','고양이가 내게 가르쳐준 것들_소개.jpg',0,'2022-09-04'),(53,'해외도서','유대인 랍비',10800,54,'탈무드_표지.jpg','탈무드','탈무드_소개.jpg',0,'2022-09-06'),(54,'해외도서','숀 비텔',13800,156,'귀한 서점에 누추하신 분이_표지.jpg','귀한 서점에 누추하신 분이','귀한 서점에 누추하신 분이_소개.jpg',0,'2022-09-06'),(55,'해외도서','코트니 카버',17000,263,'프로젝트 333_표지.jpg','프로젝트 333','프로젝트 333_소개.jpg',0,'2022-09-06'),(56,'해외도서','샐리 티스데일',16500,134,'인생의 마지막 순간에서_표지.jpg','인생의 마지막 순간에서','인생의 마지막 순간에서_소개.jpg',1,'2022-09-06'),(57,'해외도서','오프라 윈프리',15800,45,'내가 확실히 아는 것들_표지.jpg','내가 확실히 아는 것들','내가 확실히 아는 것들_소개.jpg',0,'2022-09-07'),(58,'해외도서','사샤 세이건',16000,18,'우리, 이토록 작은 존재들을 위하여_표지.jpg','우리, 이토록 작은 존재들을 위하여','우리, 이토록 작은 존재들을 위하여_소개.jpg',0,'2022-09-07'),(59,'해외도서','헤르만 헤세',14000,220,'헤르만 헤세의 나무들_표지.jpg','헤르만 헤세의 나무들','헤르만 헤세의 나무들_소개.jpg',0,'2022-09-07'),(60,'해외도서','러셀 셔먼',15000,111,'피아노 이야기_표지.jpg','피아노 이야기','피아노 이야기_소개.jpg',0,'2022-09-07');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qna_num` int NOT NULL,
  `qna_user` varchar(10) NOT NULL,
  `qna_subject` varchar(50) NOT NULL,
  `qna_content` varchar(100) NOT NULL,
  `qna_date` date NOT NULL,
  `qna_pd_num` int DEFAULT NULL,
  `qna_user_email` varchar(50) NOT NULL,
  `qna_type` varchar(15) NOT NULL,
  `qna_rep` varchar(200) DEFAULT NULL,
  `qna_accesspermission` varchar(10) DEFAULT 'public',
  PRIMARY KEY (`qna_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'황정민','책이 얼마나 뚜껍나요?','제곧내','2022-09-06',45,'hhun6840@naver.com','상품','감사합니다^^','public');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_num` int NOT NULL,
  `review_user_num` int DEFAULT NULL,
  `review_pd_num` int DEFAULT NULL,
  `review_subject` varchar(20) DEFAULT NULL,
  `review_content` varchar(500) DEFAULT NULL,
  `review_score` float DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_num`),
  KEY `review_user_num` (`review_user_num`),
  KEY `review_pd_num` (`review_pd_num`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`review_user_num`) REFERENCES `user` (`user_num`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`review_pd_num`) REFERENCES `product` (`pd_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,56,'정말 유익한 책이에요','제곧내',3.5,'2022-09-06'),(2,1,39,'정말 유익한 책이에요!!','제곧내',4.5,'2022-09-06'),(3,3,17,'아이우에오','카키쿠케코',4.5,'2022-09-18');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_num` int NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_passwd` varchar(100) NOT NULL,
  `user_gender` varchar(1) NOT NULL,
  `user_jumin` varchar(30) NOT NULL,
  `user_address_code` int NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_phone` varchar(40) NOT NULL,
  `user_date` date NOT NULL,
  `user_points` int DEFAULT NULL,
  `user_purchased` int DEFAULT NULL,
  `user_auth` varchar(1) NOT NULL,
  PRIMARY KEY (`user_num`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'관리자','admin','1234','남','990417-1234567',12345,'BookShop','010-1234-5678','2022-07-01',0,0,'Y'),(1,'황정민','hhun6840@naver.com','4840','남','990605-1******',49509,'부산 사하구 두송로 16 11111','01012341234','2022-07-20',70000,1028000,'Y'),(2,'이지철','dlwlcjf558@naver.com','7529','남','990417-1******',46967,'부산 사상구 광장로103번길 31 보성오페라','010-5066-7529','2022-08-01',0,0,'Y'),(3,'박진우','tree6316@naver.com','7672','남','961211-1******',49516,'부산 사하구 다대로381번길 105 202동','01020867672','2022-08-04',0,132000,'Y'),(4,'유상훈','dbtkdgns123@naver.com','575757','남','961005-1234567',45555,'부산 해운대구','01000000000','2022-08-24',99999,555366,'Y'),(5,'최지윤','cwd0217@naver.com','49393','남','960217-1******',49393,'부산 사하구 다대로137번길 28-1동','010-4945-4072','2022-09-05',0,0,'Y'),(6,'실험용1','test1@gmail.com','12341234','여','860211-2******',4766,'서울 성동구 서울숲길 17','01012121212','2022-09-06',0,0,'Y'),(7,'실험용2','test2@nate.com','12341234','남','030515-3******',18413,'경기 화성시 경기대로 990','01023232323','2022-09-06',0,0,'Y'),(8,'실험용3','test3@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-03',0,0,'Y'),(9,'실험용4','test4@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-03',0,0,'Y'),(10,'실험용5','test5@nate.com','49393','여','960217-1******',49393,'부산','010-4945-4072','2022-09-03',0,0,'Y'),(11,'실험용6','test6@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-04',0,0,'Y'),(12,'실험용7','test7@gmail.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-04',0,0,'Y'),(13,'실험용8','test8@naver.com','49393','여','960217-1******',49393,'부산','010-4945-4072','2022-09-04',0,0,'Y'),(14,'실험용9','test9@gmial.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-05',0,0,'Y'),(15,'실험용10','test10@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-05',0,0,'Y'),(16,'실험용11','test11@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-07',0,0,'Y'),(17,'실험용12','test12@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-07',0,0,'Y'),(18,'실험용13','test13@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-07',0,0,'Y'),(19,'실험용14','test14@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-07',0,0,'Y'),(20,'실험용15','test15@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-07',0,0,'Y'),(21,'실험용16','test16@naver.com','49393','남','960217-1******',49393,'부산','010-4945-4072','2022-09-07',0,0,'Y'),(22,'삭제용','hhun684011@naver.com','56875687','남','123412-1234123',47214,'부산 부산진구 거제대로 14 123','56875687567','2022-09-06',0,0,'Y');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-20 21:17:13
