CREATE DATABASE  IF NOT EXISTS `Restaurant_Delivery_Database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Restaurant_Delivery_Database`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Restaurant_Delivery_Database
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Chef`
--

DROP TABLE IF EXISTS `Chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chef` (
  `employeeID` varchar(10) NOT NULL,
  `chefStation` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeID`),
  CONSTRAINT `fk_chef` FOREIGN KEY (`employeeID`) REFERENCES `Staff` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chef`
--

LOCK TABLES `Chef` WRITE;
/*!40000 ALTER TABLE `Chef` DISABLE KEYS */;
INSERT INTO `Chef` VALUES ('1234567893','Head Chef'),('1234567894','Sous Chef'),('1234567895','Pastry Chef');
/*!40000 ALTER TABLE `Chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composedOf`
--

DROP TABLE IF EXISTS `composedOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composedOf` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `ingredientsCode` varchar(7) NOT NULL,
  `quantity` varchar(2) NOT NULL,
  PRIMARY KEY (`orderNumber`,`ingredientsCode`),
  KEY `fk_ingcode` (`ingredientsCode`),
  CONSTRAINT `fk_ingcode` FOREIGN KEY (`ingredientsCode`) REFERENCES `Ingredients` (`ingredientsCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ord` FOREIGN KEY (`orderNumber`) REFERENCES `Order` (`orderNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composedOf`
--

LOCK TABLES `composedOf` WRITE;
/*!40000 ALTER TABLE `composedOf` DISABLE KEYS */;
INSERT INTO `composedOf` VALUES (1,'ABCD','1'),(1,'BCDE','1'),(2,'AZYX','2'),(2,'CDEF','5'),(3,'AFGH','3'),(3,'BAZY','2'),(3,'DEFG','2'),(4,'CHIJ','4'),(5,'BCDE','3'),(5,'DEFG','2'),(6,'CDEF','8'),(7,'AFGH','1'),(7,'BCDE','2'),(7,'DEFG','3'),(8,'CDEF','2'),(9,'BEFG','4'),(10,'AFGH','1'),(10,'BCDE','2'),(10,'CDEF','1'),(11,'BEFG','2'),(11,'CBAZ','2'),(12,'BEFG','2'),(12,'CDEF','4'),(13,'DEFG','3'),(14,'CHIJ','8'),(15,'AZYX','1'),(15,'BCDE','3'),(15,'DEFG','2'),(16,'BEFG','2'),(16,'CHIJ','3'),(17,'AFGH','2'),(18,'CDEF','4'),(19,'BEFG','2'),(19,'CBAZ','3'),(19,'DEFG','1'),(20,'ABCD','8'),(20,'BCDE','4');
/*!40000 ALTER TABLE `composedOf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates`
--

DROP TABLE IF EXISTS `creates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creates` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `employeeID` varchar(10) NOT NULL,
  `time` int NOT NULL,
  PRIMARY KEY (`orderNumber`,`employeeID`),
  KEY `fk_empid` (`employeeID`),
  CONSTRAINT `fk_empid` FOREIGN KEY (`employeeID`) REFERENCES `Staff` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ordnum` FOREIGN KEY (`orderNumber`) REFERENCES `Order` (`orderNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates`
--

LOCK TABLES `creates` WRITE;
/*!40000 ALTER TABLE `creates` DISABLE KEYS */;
INSERT INTO `creates` VALUES (1,'1234567890',3),(1,'1234567893',12),(1,'1234567896',15),(2,'1234567891',2),(2,'1234567894',16),(2,'1234567897',10),(3,'1234567892',3),(3,'1234567895',11),(3,'1234567898',18),(4,'1234567890',4),(4,'1234567894',10),(4,'1234567898',16),(5,'1234567892',3),(5,'1234567894',13),(5,'1234567897',12),(6,'1234567891',3),(6,'1234567895',11),(6,'1234567898',9),(7,'1234567890',4),(7,'1234567893',14),(7,'1234567896',13),(8,'1234567891',4),(8,'1234567894',16),(8,'1234567897',12),(9,'1234567892',3),(9,'1234567895',10),(9,'1234567898',12),(10,'1234567890',3),(10,'1234567894',14),(10,'1234567898',12),(11,'1234567892',5),(11,'1234567894',14),(11,'1234567897',12),(12,'1234567891',3),(12,'1234567895',11),(12,'1234567898',12),(13,'1234567890',4),(13,'1234567893',16),(13,'1234567896',14),(14,'1234567891',3),(14,'1234567894',12),(14,'1234567897',18),(15,'1234567892',4),(15,'1234567895',16),(15,'1234567898',11),(16,'1234567890',3),(16,'1234567894',12),(16,'1234567898',15),(17,'1234567892',2),(17,'1234567894',14),(17,'1234567897',12),(18,'1234567891',4),(18,'1234567895',11),(18,'1234567898',16),(19,'1234567890',5),(19,'1234567893',15),(19,'1234567896',15),(20,'1234567891',4),(20,'1234567894',12),(20,'1234567897',16);
/*!40000 ALTER TABLE `creates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivers`
--

DROP TABLE IF EXISTS `delivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivers` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `employeeID` varchar(10) NOT NULL,
  `distance` int NOT NULL,
  PRIMARY KEY (`orderNumber`,`employeeID`),
  KEY `fk_employId` (`employeeID`),
  CONSTRAINT `fk_employId` FOREIGN KEY (`employeeID`) REFERENCES `Staff` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oNum` FOREIGN KEY (`orderNumber`) REFERENCES `Order` (`orderNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivers`
--

LOCK TABLES `delivers` WRITE;
/*!40000 ALTER TABLE `delivers` DISABLE KEYS */;
INSERT INTO `delivers` VALUES (1,'1234567896',7),(2,'1234567897',12),(3,'1234567898',9),(4,'1234567898',11),(5,'1234567897',12),(6,'1234567898',8),(7,'1234567896',16),(8,'1234567897',12),(9,'1234567898',9),(10,'1234567898',16),(11,'1234567897',4),(12,'1234567898',11),(13,'1234567896',9),(14,'1234567897',10),(15,'1234567898',13),(16,'1234567898',14),(17,'1234567897',8),(18,'1234567898',10),(19,'1234567896',12),(20,'1234567897',15);
/*!40000 ALTER TABLE `delivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Driver` (
  `employeeID` varchar(10) NOT NULL,
  `vehicle` varchar(75) NOT NULL,
  `vehicleRegNo` varchar(15) NOT NULL,
  PRIMARY KEY (`employeeID`),
  CONSTRAINT `fk_driver` FOREIGN KEY (`employeeID`) REFERENCES `Staff` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
INSERT INTO `Driver` VALUES ('1234567896','Opal Corsa','151-D-23456'),('1234567897','Ford Fiesta','182-WX-12345'),('1234567898','Nissan Micra','162-W-34567');
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Household`
--

DROP TABLE IF EXISTS `Household`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Household` (
  `houseIDNumber` varchar(7) NOT NULL,
  `numInhabitants` varchar(3) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `county` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(12) NOT NULL,
  PRIMARY KEY (`houseIDNumber`),
  KEY `HousePhoneIndex` (`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Household`
--

LOCK TABLES `Household` WRITE;
/*!40000 ALTER TABLE `Household` DISABLE KEYS */;
INSERT INTO `Household` VALUES ('0012726','4','125 Hill Garden','Milltown','Dublin','0876234621'),('0018922','2','10 High Grove','Kilmacud','Dublin','0832653784'),('0024637','5','4 Plum Drive','Sandyford','Dublin','0898685375'),('0082782','3','12 Sherlock Road','Windy Arbour','Dublin','0851234567'),('0082783','1','21 Dark Drive','Dun Laoghaire','Dublin','0862345678'),('0082784','4','15 Red Road','Monkstown','Dublin','0873456789'),('0082785','2','8 Blue Bloom','Dundrum','Dublin','0894567890'),('0082786','6','4 Green Grove','Salthill','Dublin','0830123456'),('0082787','3','30 Purple Place','Cherrywood','Dublin','0855678901'),('0082788','2','12 Short Street','Carrickmines','Dublin','0866789012');
/*!40000 ALTER TABLE `Household` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `beforeHouseholdUpdate` BEFORE UPDATE ON `household` FOR EACH ROW BEGIN
	INSERT INTO HouseholdDetailsUpdate
	SET action = 'update',
		houseIDNumber = OLD.houseIDNumber,
		street = OLD.street,
		town = OLD.town,
		phoneNumber = OLD.phoneNumber,
		date = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `HouseholdDetailsUpdate`
--

DROP TABLE IF EXISTS `HouseholdDetailsUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HouseholdDetailsUpdate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `houseIDNumber` varchar(7) NOT NULL,
  `street` varchar(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `phoneNumber` varchar(12) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HouseholdDetailsUpdate`
--

LOCK TABLES `HouseholdDetailsUpdate` WRITE;
/*!40000 ALTER TABLE `HouseholdDetailsUpdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `HouseholdDetailsUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredients` (
  `ingredientsCode` varchar(7) NOT NULL,
  `ingredientType` varchar(15) DEFAULT NULL,
  `useByDate` varchar(10) NOT NULL,
  PRIMARY KEY (`ingredientsCode`),
  KEY `UseByIndex` (`useByDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES ('ABCD','Spice','1991'),('AFGH','Spice','2009'),('AZYX','Spice','2010'),('BAZY','Meat','1983'),('BCDE','Meat','1996'),('BEFG','Meat','1986'),('CBAZ','Vegetable','1979'),('CDEF','Vegetable','1991'),('CHIJ','Vegetable','2006'),('DEFG','Dairy','1978');
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `timeOrderPlaced` datetime NOT NULL,
  `houseIDNumber` varchar(7) NOT NULL,
  PRIMARY KEY (`orderNumber`,`houseIDNumber`),
  KEY `fk_order` (`houseIDNumber`),
  KEY `OrderTimeIndex` (`timeOrderPlaced`),
  CONSTRAINT `fk_order` FOREIGN KEY (`houseIDNumber`) REFERENCES `Household` (`houseIDNumber`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,'2020-11-10 20:10:08','0012726'),(2,'2020-11-10 21:22:17','0018922'),(3,'2020-11-10 21:47:22','0024637'),(4,'2020-11-10 22:29:54','0082782'),(5,'2020-11-10 23:45:21','0082783'),(6,'2020-11-11 18:16:12','0082784'),(7,'2020-11-11 18:44:32','0082785'),(8,'2020-11-11 19:10:08','0082786'),(9,'2020-11-11 20:02:04','0082787'),(10,'2020-11-11 20:25:12','0082788'),(11,'2020-11-11 21:01:24','0082784'),(12,'2020-11-11 21:34:36','0082783'),(13,'2020-11-12 21:57:58','0024637'),(14,'2020-11-12 22:09:46','0012726'),(15,'2020-11-12 22:45:12','0024637'),(16,'2020-11-12 22:59:36','0082788'),(17,'2020-11-12 23:32:33','0012726'),(18,'2020-11-13 19:12:13','0082784'),(19,'2020-11-13 20:01:02','0082786'),(20,'2020-11-13 21:12:22','0018922');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderCourse`
--

DROP TABLE IF EXISTS `OrderCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderCourse` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `course` int NOT NULL,
  PRIMARY KEY (`orderNumber`,`course`),
  CONSTRAINT `fk_course` FOREIGN KEY (`orderNumber`) REFERENCES `Order` (`orderNumber`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderCourse`
--

LOCK TABLES `OrderCourse` WRITE;
/*!40000 ALTER TABLE `OrderCourse` DISABLE KEYS */;
INSERT INTO `OrderCourse` VALUES (1,1),(2,1),(3,3),(4,2),(5,3),(6,1),(7,3),(8,2),(9,2),(10,3),(11,1),(12,1),(13,2),(14,3),(15,2),(16,3),(17,3),(18,1),(19,2),(20,1);
/*!40000 ALTER TABLE `OrderCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItem` (
  `orderNumber` int NOT NULL AUTO_INCREMENT,
  `itemNumber` varchar(10) NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `calorieAmount` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`orderNumber`,`itemNumber`),
  CONSTRAINT `fk_item` FOREIGN KEY (`orderNumber`) REFERENCES `Order` (`orderNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1,'12',0.79,340.94),(1,'14',1.22,250.05),(2,'22',1.17,123.45),(3,'04',1.08,123.98),(3,'09',0.56,150.01),(3,'27',0.98,98.98),(4,'01',1.01,253.56),(5,'12',0.42,259.05),(5,'25',0.67,241.04),(6,'02',1.99,303.33),(7,'03',2.94,201.12),(7,'05',2.22,201.22),(7,'11',2.56,501.41),(8,'22',1.17,123.45),(9,'14',1.22,250.05),(10,'01',1.01,253.56),(10,'02',1.99,303.33),(10,'27',0.98,98.98),(11,'08',1.23,111.11),(11,'13',2.34,123.45),(12,'24',1.25,201.12),(12,'25',0.67,241.04),(13,'13',0.90,150.00),(14,'01',1.01,253.56),(15,'09',0.56,150.01),(15,'12',0.79,340.94),(15,'22',1.17,123.45),(16,'02',1.99,303.33),(16,'12',0.42,259.05),(17,'20',0.75,101.01),(18,'21',1.99,505.25),(19,'11',2.56,501.41),(19,'12',0.79,340.94),(19,'14',1.22,250.05),(20,'13',0.90,150.00),(20,'27',0.98,98.98);
/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersonthe12th`
--

DROP TABLE IF EXISTS `ordersonthe12th`;
/*!50001 DROP VIEW IF EXISTS `ordersonthe12th`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersonthe12th` AS SELECT 
 1 AS `orderNumber`,
 1 AS `timeOrderPlaced`,
 1 AS `houseIDNumber`,
 1 AS `itemNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `employeeID` varchar(10) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `salaryGrade` char(1) NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `SalaryGradeIndex` (`salaryGrade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('1234567890','Rebecca','Bunch','A'),('1234567891','Josh','Chan','C'),('1234567892','Paula','Proctor','B'),('1234567893','Nathan','Plimpton','B'),('1234567894','Valencia','Perez','C'),('1234567895','Heather','Davis','C'),('1234567896','Darryl','Whitefeather','A'),('1234567897','Greg','Serrano','A'),('1234567898','John','Wilson','B');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stafforderinteraction`
--

DROP TABLE IF EXISTS `stafforderinteraction`;
/*!50001 DROP VIEW IF EXISTS `stafforderinteraction`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stafforderinteraction` AS SELECT 
 1 AS `orderNumber`,
 1 AS `timeOrderPlaced`,
 1 AS `employeeID`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `waitStaff`
--

DROP TABLE IF EXISTS `waitStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitStaff` (
  `employeeID` varchar(10) NOT NULL,
  `position` varchar(20) NOT NULL,
  PRIMARY KEY (`employeeID`),
  CONSTRAINT `fk_wait` FOREIGN KEY (`employeeID`) REFERENCES `Staff` (`employeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitStaff`
--

LOCK TABLES `waitStaff` WRITE;
/*!40000 ALTER TABLE `waitStaff` DISABLE KEYS */;
INSERT INTO `waitStaff` VALUES ('1234567890','Dining Room Manager'),('1234567891','Waiter'),('1234567892','Bartender');
/*!40000 ALTER TABLE `waitStaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ordersonthe12th`
--

/*!50001 DROP VIEW IF EXISTS `ordersonthe12th`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersonthe12th` AS select `order`.`orderNumber` AS `orderNumber`,`order`.`timeOrderPlaced` AS `timeOrderPlaced`,`order`.`houseIDNumber` AS `houseIDNumber`,`orderitem`.`itemNumber` AS `itemNumber` from (`order` join `orderitem` on((`order`.`orderNumber` = `orderitem`.`orderNumber`))) where (`order`.`timeOrderPlaced` like '2020-11-12%') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stafforderinteraction`
--

/*!50001 DROP VIEW IF EXISTS `stafforderinteraction`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stafforderinteraction` AS select `order`.`orderNumber` AS `orderNumber`,`order`.`timeOrderPlaced` AS `timeOrderPlaced`,`creates`.`employeeID` AS `employeeID`,`creates`.`time` AS `time` from (`order` join `creates` on((`order`.`orderNumber` = `creates`.`orderNumber`))) where (`order`.`orderNumber` = 1) */
/*!50002 WITH CASCADED CHECK OPTION */;
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

-- Dump completed on 2020-11-24 17:45:47
