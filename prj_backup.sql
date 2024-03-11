-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: prj_tan
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `salesreportview`
--

DROP TABLE IF EXISTS `salesreportview`;
/*!50001 DROP VIEW IF EXISTS `salesreportview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `salesreportview` AS SELECT
 1 AS `OrderID`,
  1 AS `orderDate`,
  1 AS `CustomerName`,
  1 AS `EmployeeName`,
  1 AS `TotalAmount` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `salesreportviewwithbal`
--

DROP TABLE IF EXISTS `salesreportviewwithbal`;
/*!50001 DROP VIEW IF EXISTS `salesreportviewwithbal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `salesreportviewwithbal` AS SELECT
 1 AS `OrderID`,
  1 AS `orderDate`,
  1 AS `CustomerName`,
  1 AS `EmployeeName`,
  1 AS `TotalAmount`,
  1 AS `TotalSales` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `seemoredetails`
--

DROP TABLE IF EXISTS `seemoredetails`;
/*!50001 DROP VIEW IF EXISTS `seemoredetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `seemoredetails` AS SELECT
 1 AS `OrderID`,
  1 AS `EmployeeFullName`,
  1 AS `CustomerFullName`,
  1 AS `CustomerContact` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_FirstName` varchar(16) NOT NULL,
  `Customer_LastName` varchar(16) NOT NULL,
  `Customer_ContactNum` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES (4001,'John','Doe',9209002197),(4002,'James','Tan',9209002197),(4003,'Gabriel','Sumilang',9111111111);
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `employee_FirstName` varchar(16) NOT NULL,
  `employee_LastName` varchar(16) NOT NULL,
  `Employee_ContactNum` bigint(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `tbl_employee_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `tbl_manager` (`Manager_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employee`
--

LOCK TABLES `tbl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` VALUES (1111,2001,'James','Tan',9209002197),(3001,2001,'Kenneth','Ismael',1000000001),(3002,2001,'Ryan','Manuel',1000000001),(3003,2001,'Bianca','Fernandez',1000000001),(3004,2001,'Romy','Masunag',1000000001),(3005,2001,'Raymart','Magsayo',1000000001),(3006,2001,'Helen','Mones',1000000001),(3007,2001,'Romelyn','Daya',1000000001);
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_item` (
  `Item_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Item_Quantity` int(11) DEFAULT NULL,
  `Item_Price` float DEFAULT NULL,
  `Item_Subtotal` float DEFAULT NULL,
  PRIMARY KEY (`Item_ID`,`Order_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `tbl_item_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `tbl_product_size` (`item_ID`),
  CONSTRAINT `tbl_item_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `tbl_order` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_item`
--

LOCK TABLES `tbl_item` WRITE;
/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
INSERT INTO `tbl_item` VALUES (7023,8008,23,1.47,33.81),(7043,8008,20,12.5,250),(7222,8009,23,7,161);
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_manager`
--

DROP TABLE IF EXISTS `tbl_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_manager` (
  `Manager_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_ID` int(11) NOT NULL,
  `Manager_FirstName` varchar(16) NOT NULL,
  `Manager_LastName` varchar(16) NOT NULL,
  PRIMARY KEY (`Manager_ID`),
  KEY `Owner_ID` (`Owner_ID`),
  CONSTRAINT `tbl_manager_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `tbl_owner` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_manager`
--

LOCK TABLES `tbl_manager` WRITE;
/*!40000 ALTER TABLE `tbl_manager` DISABLE KEYS */;
INSERT INTO `tbl_manager` VALUES (2001,1001,'Natalie','Fernandez');
/*!40000 ALTER TABLE `tbl_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_order` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Order_Date` datetime NOT NULL,
  `Order_Status` enum('paid','paying later','complete') NOT NULL,
  `Order_TotalPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `tbl_employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT INTO `tbl_order` VALUES (8001,1111,4001,'2024-03-10 09:35:17','paying later',0.00),(8004,1111,4001,'2024-03-10 10:10:19','paid',6510.00),(8005,1111,4001,'2024-03-10 10:15:25','complete',5000.00),(8008,1111,4002,'2024-03-10 18:55:41','complete',283.81),(8009,1111,4003,'2024-03-10 19:37:47','complete',161.00);
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_owner`
--

DROP TABLE IF EXISTS `tbl_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_owner` (
  `owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_FirstName` varchar(16) NOT NULL,
  `owner_LastName` varchar(16) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_owner`
--

LOCK TABLES `tbl_owner` WRITE;
/*!40000 ALTER TABLE `tbl_owner` DISABLE KEYS */;
INSERT INTO `tbl_owner` VALUES (1001,'Mariano','Fernandez');
/*!40000 ALTER TABLE `tbl_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(32) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (11,'Gypsum Wood'),(12,'Gypsum Steel'),(13,'Expansion Shield'),(14,'BH Nut'),(15,'HT Standard'),(16,'Tek Screw Wood'),(17,'Tek Screw Metal'),(18,'LW Nut'),(19,'HT Nut'),(20,'Hardiflex Screw'),(21,'Grip Anchor'),(22,'Blind Rivet'),(23,'Dyna Bolt'),(24,'ORD Nut'),(25,'Hexagonal Capscrew');
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_size`
--

DROP TABLE IF EXISTS `tbl_product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product_size` (
  `item_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Product_ID` int(11) DEFAULT NULL,
  `Size_ID` int(11) DEFAULT NULL,
  `Item_Name` varchar(255) DEFAULT NULL,
  `Item_Price` float(10,2) NOT NULL,
  PRIMARY KEY (`item_ID`),
  KEY `Product_ID` (`Product_ID`),
  KEY `Size_ID` (`Size_ID`),
  CONSTRAINT `tbl_product_size_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `tbl_product` (`product_id`),
  CONSTRAINT `tbl_product_size_ibfk_2` FOREIGN KEY (`Size_ID`) REFERENCES `tbl_size` (`size_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_size`
--

LOCK TABLES `tbl_product_size` WRITE;
/*!40000 ALTER TABLE `tbl_product_size` DISABLE KEYS */;
INSERT INTO `tbl_product_size` VALUES (7013,11,178,'Gypsum Wood 6 x 20',0.30),(7014,11,179,'Gypsum Wood 6 x 25',0.35),(7015,11,180,'Gypsum Wood 6 x 32',0.42),(7016,11,181,'Gypsum Wood 6 x 38',0.45),(7017,11,182,'Gypsum Wood 6 x 50',0.71),(7018,11,211,'Gypsum Wood 8 x 25',0.58),(7019,11,212,'Gypsum Wood 8 x 32',0.68),(7020,11,213,'Gypsum Wood 8 x 38',0.79),(7021,11,213,'Gypsum Wood 8 x 50',1.26),(7022,11,214,'Gypsum Wood 8 x 65',1.42),(7023,11,215,'Gypsum Wood 8 x 75',1.47),(7024,11,209,'Gypsum Wood 8 x 100',2.10),(7025,12,178,'Gypsum Steel 6 x 20 mm',0.36),(7026,12,179,'Gypsum Steel 6 x 25 mm',0.42),(7027,12,180,'Gypsum Steel 6 x 32 mm',0.50),(7028,12,181,'Gypsum Steel 6 x 38 mm',0.59),(7029,12,182,'Gypsum Steel 6 x 50 mm',0.76),(7030,12,210,'Gypsum Steel 8 x 25 mm',0.74),(7031,12,211,'Gypsum Steel 8 x 32 mm',0.84),(7032,12,212,'Gypsum Steel 8 x 38 mm',0.95),(7033,12,213,'Gypsum Steel 8 x 50 mm',1.42),(7034,12,214,'Gypsum Steel 8 x 65 mm',1.58),(7035,12,215,'Gypsum Steel 8 x 75 mm',1.63),(7036,12,209,'Gypsum Steel 8 x 100 mm',2.15),(7037,13,42,'Expansion Shield 1/4 x 25 mm',10.00),(7038,13,141,'Expansion Shield 5/16 x 30 mm',12.50),(7039,13,118,'Expansion Shield 3/8 x 45 mm',16.00),(7040,13,29,'Expansion Shield 1/2 x 50 mm',24.00),(7041,13,174,'Expansion Shield 5/8 x 50 mm',44.50),(7042,13,97,'Expansion Shield 3/4 x 50 mm',72.50),(7043,13,51,'Expansion Shield 1/4 x 40 mm',12.50),(7044,13,145,'Expansion Shield 5/16 x 45 mm',15.00),(7045,13,123,'Expansion Shield 3/8 x 60 mm',24.00),(7046,13,31,'Expansion Shield 1/2 x 75 mm',33.00),(7047,13,176,'Expansion Shield 5/8 x 85 mm',53.00),(7048,13,99,'Expansion Shield 3/4 x 85 mm',109.00),(7049,14,86,'BH Nut 3 mm',0.40),(7050,14,124,'BH Nut 4 mm',0.40),(7051,14,125,'BH Nut 5 mm',0.45),(7052,14,177,'BH Nut 6 mm',0.50),(7053,14,208,'BH Nut 8 mm',0.80),(7054,14,66,'BH Nut 10 mm',1.20),(7055,14,67,'BH Nut 12 mm',2.60),(7056,14,80,'BH Nut 14 mm',5.15),(7057,14,81,'BH Nut 16 mm',6.25),(7058,16,70,'Tek Screw Wood 12 x 20 mm',1.12),(7059,16,71,'Tek Screw Wood 12 x 25 mm',1.16),(7060,16,72,'Tek Screw Wood 12 x 35 mm',1.25),(7061,16,75,'Tek Screw Wood 12 x 50 mm',1.43),(7062,16,77,'Tek Screw Wood 12 x 65 mm',1.70),(7063,16,78,'Tek Screw Wood 12 x 80 mm',2.69),(7064,16,79,'Tek Screw Wood 12 x 90 mm',5.38),(7065,16,68,'Tek Screw Wood 12 x 100 mm',6.05),(7066,16,69,'Tek Screw Wood 12 x 125 mm',8.29),(7067,17,70,'Tek Screw Metal 12 x 20 mm',1.12),(7068,17,71,'Tek Screw Metal 12 x 25 mm',1.16),(7069,17,73,'Tek Screw Metal 12 x 40 mm',1.30),(7070,17,74,'Tek Screw Metal 12 x 45 mm',1.34),(7071,17,75,'Tek Screw Metal 12 x 50 mm',1.43),(7072,17,76,'Tek Screw Metal 12 x 55 mm',1.52),(7073,17,77,'Tek Screw Metal 12 x 65 mm',1.70),(7074,17,31,'Tek Screw Metal 12 x 75 mm',2.69),(7075,17,79,'Tek Screw Metal 12 x 90 mm',5.38),(7076,17,68,'Tek Screw Metal 12 x 100 mm',6.05),(7077,17,69,'Tek Screw Metal 12 x 125 mm',8.29),(7078,17,232,'Tek Screw Metal 12 x 150 mm',19.04),(7079,18,86,'LW Nut 3 mm',0.25),(7080,18,124,'LW Nut 4 mm',0.25),(7081,18,125,'LW Nut 5 mm',0.25),(7082,18,177,'LW Nut 6 mm',0.25),(7083,18,208,'LW Nut 8 mm',0.35),(7084,18,66,'LW Nut 10 mm',0.65),(7085,18,67,'LW Nut 12 mm',1.25),(7086,18,80,'LW Nut 14 mm',1.60),(7087,18,81,'LW Nut 16 mm',2.20),(7088,18,82,'LW Nut 18 mm',3.50),(7089,18,83,'LW Nut 20 mm',3.75),(7090,18,84,'LW Nut 22 mm',5.70),(7091,18,85,'LW Nut 24 mm',7.55),(7092,18,32,'LW Nut 1/4 inch',0.20),(7093,18,126,'LW Nut 5/16 inch',0.25),(7094,18,100,'LW Nut 3/8 inch',0.50),(7095,18,188,'LW Nut 7/16 inch',0.71),(7096,18,233,'LW Nut 1/2 inch',1.05),(7097,18,216,'LW Nut 9/16 inch',1.35),(7098,18,159,'LW Nut 5/8 inch',1.80),(7099,18,96,'LW Nut 3/4 inch',3.15),(7100,19,177,'HT Nut 6 mm',0.50),(7101,19,208,'HT Nut 8 mm',0.85),(7102,19,66,'HT Nut 10 mm',1.95),(7103,19,67,'HT Nut 12 mm',2.90),(7104,19,80,'HT Nut 14 mm',4.80),(7105,19,81,'HT Nut 16 mm',5.25),(7106,19,82,'HT Nut 18 mm',8.60),(7107,19,83,'HT Nut 20 mm',10.45),(7108,19,84,'HT Nut 22 mm',12.90),(7109,19,32,'HT Nut 1/4 inch',0.55),(7110,19,126,'HT Nut 5/16 inch',0.90),(7111,19,100,'HT Nut 3/8 inch',1.40),(7112,19,18,'HT Nut 1/2 x 2 1/4 inch',2.35),(7113,19,233,'HT Nut 1/2 inch',3.10),(7114,19,216,'HT Nut 9/16 inch',5.05),(7115,19,159,'HT Nut 5/8 inch',5.45),(7116,19,96,'HT Nut 3/4 inch',9.55),(7117,19,206,'HT Nut 7/8 inch',16.15),(7118,19,11,'HT Nut 1 inch',23.60),(7119,20,187,'Hardiflex Screw 7 x 3/4 inch',0.50),(7120,20,185,'Hardiflex Screw 7 x 1/4 inch',0.55),(7121,20,184,'Hardiflex Screw 7 x 1 1/4 inch',0.74),(7122,20,183,'Hardiflex Screw 7 x 1 1/2 inch',0.84),(7123,20,186,'Hardiflex Screw 7 x 2 inch',1.00),(7124,21,32,'Grip Anchor 1/4 inch',6.00),(7125,21,126,'Grip Anchor 5/16 inch',7.00),(7126,21,100,'Grip Anchor 3/8 inch',8.00),(7127,21,233,'Grip Anchor 1/2 inch',15.00),(7128,21,159,'Grip Anchor 5/8 inch',39.00),(7129,22,59,'Blind Rivet 1/8 x 3/16 inch',204.00),(7130,22,58,'Blind Rivet 1/8 x 1/4 inch',216.00),(7131,22,62,'Blind Rivet 1/8 x 5/16 inch',222.00),(7132,22,61,'Blind Rivet 1/8 x 3/8 inch',228.00),(7133,22,64,'Blind Rivet 1/8 x 7/16 inch',258.00),(7134,22,57,'Blind Rivet 1/8 x 1/2 inch',263.00),(7135,22,65,'Blind Rivet 1/8 x 9/16 inch',280.00),(7136,22,63,'Blind Rivet 1/8 x 5/8 inch',306.00),(7137,22,60,'Blind Rivet 1/8 x 3/4 inch',360.00),(7138,22,56,'Blind Rivet 1/8 x 1 inch',538.00),(7139,22,152,'Blind Rivet 5/32 x 1/4 inch',240.00),(7140,22,155,'Blind Rivet 5/32 x 5/16 inch',257.00),(7141,22,154,'Blind Rivet 5/32 x 3/8 inch',281.00),(7142,22,157,'Blind Rivet 5/32 x 7/16 inch',293.00),(7143,22,151,'Blind Rivet 5/32 x 1/2 inch',311.00),(7144,22,158,'Blind Rivet 5/32 x 9/16 inch',329.00),(7145,22,156,'Blind Rivet 5/32 x 5/8 inch',377.00),(7146,22,153,'Blind Rivet 5/32 x 3/4 inch',209.00),(7147,22,150,'Blind Rivet 5/32 x 1 inch',259.00),(7148,22,89,'Blind Rivet 3/16 x 1/4 inch',180.00),(7149,22,92,'Blind Rivet 3/16 x 5/16 inch',182.00),(7150,22,91,'Blind Rivet 3/16 x 3/8 inch',186.00),(7151,22,94,'Blind Rivet 3/16 x 7/16 inch',200.00),(7152,22,88,'Blind Rivet 3/16 x 1/2 inch',210.00),(7153,22,95,'Blind Rivet 3/16 x 9/16 inch',215.00),(7154,22,93,'Blind Rivet 3/16 x 5/8 inch',240.00),(7155,22,90,'Blind Rivet 3/16 x 3/4 inch',281.00),(7156,22,87,'Blind Rivet 3/16 x 1 inch',360.00),(7157,23,32,'Dyna Bolt 1/4 inch',8.50),(7158,23,126,'Dyna Bolt 5/16 inch',10.50),(7159,23,100,'Dyna Bolt 3/8 inch',14.00),(7160,23,233,'Dyna Bolt 1/2 inch',27.50),(7161,23,171,'Dyna Bolt 5/8 x 4 inch',61.00),(7162,23,173,'Dyna Bolt 5/8 x 5 inch',73.50),(7163,23,98,'Dyna Bolt 3/4 x 6 inch',136.50),(7164,24,32,'ORD Nut 1/4 inch',0.36),(7165,24,126,'ORD Nut 5/16 inch',0.55),(7166,24,100,'ORD Nut 3/8 inch',0.85),(7167,24,188,'ORD Nut 7/16 inch',1.75),(7168,24,233,'ORD Nut 1/2 inch',2.45),(7169,24,216,'ORD Nut 9/16 inch',3.05),(7170,24,159,'ORD Nut 5/8 inch',3.65),(7171,24,96,'ORD Nut 3/4 inch',6.05),(7172,24,206,'ORD Nut 7/8 inch',16.15),(7173,24,11,'ORD Nut 1 inch',23.60),(7174,15,37,'HT Standard 1/4 x 1/2 inch',1.05),(7175,15,54,'HT Standard 1/4 x 5/8 inch',1.10),(7176,15,47,'HT Standard 1/4 x 3/4 inch',1.35),(7177,15,36,'HT Standard 1/4 x 1 inch',1.55),(7178,15,34,'HT Standard 1/4 x 1 1/4 inch',1.90),(7179,15,33,'HT Standard 1/4 x 1 1/2 inch',2.20),(7180,15,234,'HT Standard 1/4 x 1 5/8 inch',2.60),(7181,15,35,'HT Standard 1/4 x 1 3/4 inch',2.60),(7182,15,41,'HT Standard 1/4 x 2 inch',2.75),(7183,15,39,'HT Standard 1/4 x 2 1/4 inch',3.25),(7184,15,38,'HT Standard 1/4 x 2 1/2 inch',3.40),(7185,15,40,'HT Standard 1/4 x 2 3/4 inch',3.85),(7186,15,46,'HT Standard 1/4 x 3 inch',4.00),(7187,15,44,'HT Standard 1/4 x 3 1/4 inch',5.50),(7188,15,43,'HT Standard 1/4 x 3 1/2 inch',5.90),(7189,15,45,'HT Standard 1/4 x 3 3/4 inch',7.85),(7190,15,50,'HT Standard 1/4 x 4 inch',8.15),(7191,15,48,'HT Standard 1/4 x 4 1/2 inch',9.45),(7192,15,53,'HT Standard 1/4 x 5 inch',11.35),(7193,15,52,'HT Standard 1/4 x 5 1/2 inch',13.25),(7194,15,55,'HT Standard 1/4 x 6 inch',15.10),(7195,15,131,'HT Standard 5/16 x 1/2 inch',1.80),(7196,15,148,'HT Standard 5/16 x 5/8 inch',2.00),(7197,15,140,'HT Standard 5/16 x 3/4 inch',2.10),(7198,15,130,'HT Standard 5/16 x 1 inch',2.50),(7199,15,128,'HT Standard 5/16 x 1 1/4 inch',2.95),(7200,15,127,'HT Standard 5/16 x 1 1/2 inch',3.40),(7201,15,129,'HT Standard 5/16 x 1 3/4 inch',4.00),(7202,15,135,'HT Standard 5/16 x 2 inch',4.30),(7203,15,133,'HT Standard 5/16 x 2 1/4 inch',5.15),(7204,15,132,'HT Standard 5/16 x 2 1/2 inch',5.25),(7205,15,134,'HT Standard 5/16 x 2 3/4 inch',6.00),(7206,15,139,'HT Standard 5/16 x 3 inch',6.15),(7207,15,137,'HT Standard 5/16 x 3 1/4 inch',8.20),(7208,15,136,'HT Standard 5/16 x 3 1/2 inch',8.45),(7209,15,138,'HT Standard 5/16 x 3 3/4 inch',11.00),(7210,15,144,'HT Standard 5/16 x 4 inch',11.35),(7211,15,142,'HT Standard 5/16 x 4 1/2 inch',14.05),(7212,15,147,'HT Standard 5/16 x 5 inch',17.20),(7213,15,146,'HT Standard 5/16 x 5 1/2 inch',19.65),(7214,15,149,'HT Standard 5/16 x 6 inch',22.65),(7215,15,105,'HT Standard 3/8 x 1/2 inch',2.85),(7216,15,121,'HT Standard 3/8 x 5/8 inch',2.95),(7217,15,114,'HT Standard 3/8 x 3/4 inch',2.95),(7218,15,104,'HT Standard 3/8 x 1 inch',3.60),(7219,15,102,'HT Standard 3/8 x 1 1/4 inch',4.10),(7220,15,101,'HT Standard 3/8 x 1 1/2 inch',4.80),(7221,15,103,'HT Standard 3/8 x 1 3/4 inch',5.40),(7222,15,109,'HT Standard 3/8 x 2 inch',6.25),(7223,15,107,'HT Standard 3/8 x 2 1/4 inch',7.24),(7224,15,106,'HT Standard 3/8 x 2 1/2 inch',7.40),(7225,15,108,'HT Standard 3/8 x 2 3/4 inch',8.35),(7226,15,113,'HT Standard 3/8 x 3 inch',8.65),(7227,15,111,'HT Standard 3/8 x 3 1/4 inch',10.40),(7228,15,110,'HT Standard 3/8 x 3 1/2 inch',10.55),(7229,15,117,'HT Standard 3/8 x 4 inch',11.80),(7230,15,115,'HT Standard 3/8 x 4 1/2 inch',14.65),(7231,15,120,'HT Standard 3/8 x 5 inch',14.95),(7232,15,119,'HT Standard 3/8 x 5 1/2 inch',16.70),(7233,15,122,'HT Standard 3/8 x 6 inch',17.30),(7234,15,235,'HT Standard 3/8 x 6 1/2 inch',47.15),(7235,15,236,'HT Standard 3/8 x 7 inch',49.75),(7236,15,237,'HT Standard 3/8 x 7 1/2 inch',52.40),(7237,15,238,'HT Standard 3/8 x 8 inch',55.00),(7238,15,200,'HT Standard 7/16 x 3/4 inch',5.05),(7239,15,192,'HT Standard 7/16 x 1 inch',5.30),(7240,15,190,'HT Standard 7/16 x 1 1/4 inch',6.05),(7241,15,189,'HT Standard 7/16 x 1 1/2 inch',7.00),(7242,15,191,'HT Standard 7/16 x 1 3/4 inch',8.00),(7243,15,196,'HT Standard 7/16 x 2 inch',8.90),(7244,15,194,'HT Standard 7/16 x 2 1/4 inch',10.50),(7245,15,193,'HT Standard 7/16 x 2 1/2 inch',10.80),(7246,15,195,'HT Standard 7/16 x 2 3/4 inch',12.30),(7247,15,199,'HT Standard 7/16 x 3 inch',12.70),(7248,15,198,'HT Standard 7/16 x 3 1/4 inch',17.00),(7249,15,197,'HT Standard 7/16 x 3 1/2 inch',17.00),(7250,15,202,'HT Standard 7/16 x 4 inch',18.55),(7251,15,201,'HT Standard 7/16 x 4 1/2 inch',23.55),(7252,15,204,'HT Standard 7/16 x 5 inch',25.00),(7253,15,203,'HT Standard 7/16 x 5 1/2 inch',29.45),(7254,15,205,'HT Standard 7/16 x 6 inch',33.20),(7255,15,239,'HT Standard 7/16 x 6 1/2 inch',48.45),(7256,15,240,'HT Standard 7/16 x 7 inch',51.05),(7257,15,241,'HT Standard 7/16 x 7 1/2 inch',53.70),(7258,15,242,'HT Standard 7/16 x 8 inch',56.30),(7259,15,24,'HT Standard 1/2 x 3/4 inch',6.60),(7260,15,16,'HT Standard 1/2 x 1 inch',6.90),(7261,15,14,'HT Standard 1/2 x 1 1/4 inch',7.85),(7262,15,13,'HT Standard 1/2 x 1 1/2 inch',8.85),(7263,15,15,'HT Standard 1/2 x 1 3/4 inch',10.05),(7264,15,20,'HT Standard 1/2 x 2 inch',11.10),(7265,15,18,'HT Standard 1/2 x 2 1/4 inch',12.10),(7266,15,17,'HT Standard 1/2 x 2 1/2 inch',13.20),(7267,15,19,'HT Standard 1/2 x 2 3/4 inch',15.10),(7268,15,23,'HT Standard 1/2 x 3 inch',15.55),(7269,15,243,'HT Standard 1/2 x 3 1/4 inch',18.10),(7270,15,21,'HT Standard 1/2 x 3 1/2 inch',18.55),(7271,15,22,'HT Standard 1/2 x 3 3/4 inch',20.15),(7272,15,26,'HT Standard 1/2 x 4 inch',20.45),(7273,15,25,'HT Standard 1/2 x 4 1/2 inch',28.30),(7274,15,28,'HT Standard 1/2 x 5 inch',29.10),(7275,15,27,'HT Standard 1/2 x 5 1/2 inch',33.00),(7276,15,30,'HT Standard 1/2 x 6 inch',33.80),(7277,15,244,'HT Standard 1/2 x 6 1/2 inch',50.00),(7278,15,245,'HT Standard 1/2 x 7 inch',51.30),(7279,15,246,'HT Standard 1/2 x 7 1/2 inch',53.95),(7280,15,247,'HT Standard 1/2 x 8 inch',55.40),(7281,15,220,'HT Standard 9/16 x 1 inch',11.00),(7282,15,218,'HT Standard 9/16 x 1 1/4 inch',11.35),(7283,15,217,'HT Standard 9/16 x 1 1/2 inch',12.65),(7284,15,219,'HT Standard 9/16 x 1 3/4 inch',14.20),(7285,15,224,'HT Standard 9/16 x 2 inch',15.75),(7286,15,222,'HT Standard 9/16 x 2 1/4 inch',18.55),(7287,15,221,'HT Standard 9/16 x 2 1/2 inch',18.90),(7288,15,223,'HT Standard 9/16 x 2 3/4 inch',21.70),(7289,15,226,'HT Standard 9/16 x 3 inch',22.00),(7290,15,248,'HT Standard 9/16 x 3 1/4 inch',32.20),(7291,15,225,'HT Standard 9/16 x 3 1/2 inch',32.45),(7292,15,249,'HT Standard 9/16 x 3 3/4 inch',35.10),(7293,15,228,'HT Standard 9/16 x 4 inch',37.70),(7294,15,227,'HT Standard 9/16 x 4 1/2 inch',41.50),(7295,15,230,'HT Standard 9/16 x 5 inch',45.25),(7296,15,229,'HT Standard 9/16 x 5 1/2 inch',49.05),(7297,15,231,'HT Standard 9/16 x 6 inch',52.80),(7298,15,250,'HT Standard 9/16 x 6 1/2 inch',68.10),(7299,15,251,'HT Standard 9/16 x 7 inch',70.70),(7300,15,252,'HT Standard 9/16 x 7 1/2 inch',73.30),(7301,15,253,'HT Standard 9/16 x 8 inch',77.25),(7302,15,163,'HT Standard 5/8 x 1 inch',13.45),(7303,15,161,'HT Standard 5/8 x 1 1/4 inch',13.75),(7304,15,160,'HT Standard 5/8 x 1 1/2 inch',15.00),(7305,15,162,'HT Standard 5/8 x 1 3/4 inch',16.60),(7306,15,167,'HT Standard 5/8 x 2 inch',18.40),(7307,15,165,'HT Standard 5/8 x 2 1/4 inch',20.15),(7308,15,164,'HT Standard 5/8 x 2 1/2 inch',21.90),(7309,15,166,'HT Standard 5/8 x 2 3/4 inch',24.35),(7310,15,169,'HT Standard 5/8 x 3 inch',25.20),(7311,15,254,'HT Standard 5/8 x 3 1/4 inch',30.80),(7312,15,168,'HT Standard 5/8 x 3 1/2 inch',31.45),(7313,15,255,'HT Standard 5/8 x 3 3/4 inch',33.80),(7314,15,171,'HT Standard 5/8 x 4 inch',36.15),(7315,15,170,'HT Standard 5/8 x 4 1/2 inch',39.30),(7316,15,173,'HT Standard 5/8 x 5 inch',42.40),(7317,15,172,'HT Standard 5/8 x 5 1/2 inch',47.15),(7318,15,175,'HT Standard 5/8 x 6 inch',48.40),(7319,15,256,'HT Standard 5/8 x 6 1/2 inch',69.40),(7320,15,257,'HT Standard 5/8 x 7 inch',72.00),(7321,15,258,'HT Standard 5/8 x 7 1/2 inch',75.95),(7322,15,259,'HT Standard 5/8 x 8 inch',78.55),(7323,15,260,'HT Standard 3/4 x 1 inch',24.50),(7324,15,261,'HT Standard 3/4 x 1 1/4 inch',24.85),(7325,15,262,'HT Standard 3/4 x 1 1/2 inch',25.15),(7326,15,263,'HT Standard 3/4 x 1 3/4 inch',28.60),(7327,15,264,'HT Standard 3/4 x 2 inch',29.10),(7328,15,265,'HT Standard 3/4 x 2 1/4 inch',34.25),(7329,15,266,'HT Standard 3/4 x 2 1/2 inch',34.70),(7330,15,267,'HT Standard 3/4 x 2 3/4 inch',39.00),(7331,15,268,'HT Standard 3/4 x 3 inch',39.30),(7332,15,269,'HT Standard 3/4 x 3 1/4 inch',48.70),(7333,15,270,'HT Standard 3/4 x 3 1/2 inch',48.70),(7334,15,271,'HT Standard 3/4 x 3 3/4 inch',50.30),(7335,15,272,'HT Standard 3/4 x 4 inch',50.30),(7336,15,273,'HT Standard 3/4 x 4 1/2 inch',59.55),(7337,15,274,'HT Standard 3/4 x 5 inch',64.40),(7338,15,275,'HT Standard 3/4 x 5 1/2 inch',77.00),(7339,15,98,'HT Standard 3/4 x 6 inch',77.75),(7340,15,276,'HT Standard 3/4 x 6 1/2 inch',100.80),(7341,15,277,'HT Standard 3/4 x 7 inch',103.45),(7342,15,278,'HT Standard 3/4 x 7 1/2 inch',112.60),(7343,15,279,'HT Standard 3/4 x 8 inch',130.90),(7344,15,280,'HT Standard 7/8 x 1 1/2 inch',42.00),(7345,15,281,'HT Standard 7/8 x 1 3/4 inch',42.40),(7346,15,282,'HT Standard 7/8 x 2 inch',42.40),(7347,15,283,'HT Standard 7/8 x 2 1/4 inch',48.40),(7348,15,284,'HT Standard 7/8 x 2 1/2 inch',48.70),(7349,15,285,'HT Standard 7/8 x 2 3/4 inch',56.00),(7350,15,286,'HT Standard 7/8 x 3 inch',56.25),(7351,15,287,'HT Standard 7/8 x 3 1/4 inch',66.00),(7352,15,288,'HT Standard 7/8 x 3 1/2 inch',66.00),(7353,15,289,'HT Standard 7/8 x 3 3/4 inch',73.30),(7354,15,290,'HT Standard 7/8 x 4 inch',73.30),(7355,15,291,'HT Standard 7/8 x 4 1/2 inch',78.55),(7356,15,292,'HT Standard 7/8 x 5 inch',85.65),(7357,15,293,'HT Standard 7/8 x 5 1/2 inch',103.70),(7358,15,294,'HT Standard 7/8 x 6 inch',105.25),(7359,15,295,'HT Standard 7/8 x 6 1/2 inch',157.00),(7360,15,296,'HT Standard 7/8 x 7 inch',170.00),(7361,15,297,'HT Standard 7/8 x 7 1/2 inch',183.00),(7362,15,298,'HT Standard 7/8 x 8 inch',196.00),(7363,15,299,'HT Standard 1 x 1 1/2 inch',63.00),(7364,15,300,'HT Standard 1 x 2 inch',65.45),(7365,15,301,'HT Standard 1 x 2 1/4 inch',73.00),(7366,15,302,'HT Standard 1 x 2 1/2 inch',74.00),(7367,15,303,'HT Standard 1 x 2 3/4 inch',82.40),(7368,15,304,'HT Standard 1 x 3 inch',84.25),(7369,15,305,'HT Standard 1 x 3 1/2 inch',94.00),(7370,15,306,'HT Standard 1 x 4 inch',102.00),(7371,15,307,'HT Standard 1 x 4 1/2 inch',115.00),(7372,15,308,'HT Standard 1 x 5 inch',125.00),(7373,15,309,'HT Standard 1 x 5 1/2 inch',136.00),(7374,15,310,'HT Standard 1 x 6 inch',146.00),(7375,15,311,'HT Standard 1 x 6 1/2 inch',196.00),(7376,15,312,'HT Standard 1 x 7 inch',236.00),(7377,15,313,'HT Standard 1 x 7 1/2 inch',249.00),(7378,15,314,'HT Standard 1 x 8 inch',262.00),(7379,25,163,'Hexagonal Capscrew 5/8 x 1 inch',10.40),(7380,25,161,'Hexagonal Capscrew 5/8 x 1 1/4 inch',12.80),(7381,25,160,'Hexagonal Capscrew 5/8 x 1 1/2 inch',12.90),(7382,25,162,'Hexagonal Capscrew 5/8 x 1 3/4 inch',14.20),(7383,25,167,'Hexagonal Capscrew 5/8 x 2 inch',15.70),(7384,25,165,'Hexagonal Capscrew 5/8 x 2 1/4 inch',17.20),(7385,25,164,'Hexagonal Capscrew 5/8 x 2 1/2 inch',18.65),(7386,25,166,'Hexagonal Capscrew 5/8 x 2 3/4 inch',20.15),(7387,25,169,'Hexagonal Capscrew 5/8 x 3 inch',21.60),(7388,25,168,'Hexagonal Capscrew 5/8 x 3 1/2 inch',24.60),(7389,25,171,'Hexagonal Capscrew 5/8 x 4 inch',27.50),(7390,25,170,'Hexagonal Capscrew 5/8 x 4 1/2 inch',30.50),(7391,25,173,'Hexagonal Capscrew 5/8 x 5 inch',33.50),(7392,25,172,'Hexagonal Capscrew 5/8 x 5 1/2 inch',36.50),(7393,25,175,'Hexagonal Capscrew 5/8 x 6 inch',40.50),(7394,25,220,'Hexagonal Capscrew 9/16 x 1 inch',7.75),(7395,25,218,'Hexagonal Capscrew 9/16 x 1 1/4 inch',8.75),(7396,25,217,'Hexagonal Capscrew 9/16 x 1 1/2 inch',9.70),(7397,25,219,'Hexagonal Capscrew 9/16 x 1 3/4 inch',11.00),(7398,25,224,'Hexagonal Capscrew 9/16 x 2 inch',12.10),(7399,25,222,'Hexagonal Capscrew 9/16 x 2 1/4 inch',13.30),(7400,25,221,'Hexagonal Capscrew 9/16 x 2 1/2 inch',14.50),(7401,25,223,'Hexagonal Capscrew 9/16 x 2 3/4 inch',15.75),(7402,25,226,'Hexagonal Capscrew 9/16 x 3 inch',17.00),(7403,25,225,'Hexagonal Capscrew 9/16 x 3 1/2 inch',19.35),(7404,25,228,'Hexagonal Capscrew 9/16 x 4 inch',16.75),(7405,25,227,'Hexagonal Capscrew 9/16 x 4 1/2 inch',24.20),(7406,25,230,'Hexagonal Capscrew 9/16 x 5 inch',26.60),(7407,25,229,'Hexagonal Capscrew 9/16 x 5 1/2 inch',29.00),(7408,25,231,'Hexagonal Capscrew 9/16 x 6 inch',31.40),(7409,25,24,'Hexagonal Capscrew 1/2 x 3/4 inch',5.60),(7410,25,16,'Hexagonal Capscrew 1/2 x 1 inch',6.35),(7411,25,14,'Hexagonal Capscrew 1/2 x 1 1/4 inch',7.10),(7412,25,13,'Hexagonal Capscrew 1/2 x 1 1/2 inch',8.00),(7413,25,15,'Hexagonal Capscrew 1/2 x 1 3/4 inch',8.90),(7414,25,20,'Hexagonal Capscrew 1/2 x 2 inch',9.85),(7415,25,18,'Hexagonal Capscrew 1/2 x 2 1/4 inch',10.50),(7416,25,17,'Hexagonal Capscrew 1/2 x 2 1/2 inch',11.75),(7417,25,19,'Hexagonal Capscrew 1/2 x 2 3/4 inch',12.70),(7418,25,23,'Hexagonal Capscrew 1/2 x 3 inch',13.70),(7419,25,21,'Hexagonal Capscrew 1/2 x 3 1/2 inch',15.55),(7420,25,26,'Hexagonal Capscrew 1/2 x 4 inch',17.45),(7421,25,25,'Hexagonal Capscrew 1/2 x 4 1/2 inch',19.35),(7422,25,28,'Hexagonal Capscrew 1/2 x 5 inch',21.25),(7423,25,27,'Hexagonal Capscrew 1/2 x 5 1/2 inch',23.15),(7424,25,30,'Hexagonal Capscrew 1/2 x 6 inch',25.00),(7425,25,200,'Hexagonal Capscrew 7/16 x 3/4 inch',3.50),(7426,25,192,'Hexagonal Capscrew 7/16 x 1 inch',4.10),(7427,25,190,'Hexagonal Capscrew 7/16 x 1 1/4 inch',4.65),(7428,25,189,'Hexagonal Capscrew 7/16 x 1 1/2 inch',5.40),(7429,25,191,'Hexagonal Capscrew 7/16 x 1 3/4 inch',6.10),(7430,25,196,'Hexagonal Capscrew 7/16 x 2 inch',6.85),(7431,25,194,'Hexagonal Capscrew 7/16 x 2 1/4 inch',7.55),(7432,25,193,'Hexagonal Capscrew 7/16 x 2 1/2 inch',8.30),(7433,25,195,'Hexagonal Capscrew 7/16 x 2 3/4 inch',9.00),(7434,25,199,'Hexagonal Capscrew 7/16 x 3 inch',9.75),(7435,25,197,'Hexagonal Capscrew 7/16 x 3 1/2 inch',11.20),(7436,25,202,'Hexagonal Capscrew 7/16 x 4 inch',12.65),(7437,25,201,'Hexagonal Capscrew 7/16 x 4 1/2 inch',14.10),(7438,25,204,'Hexagonal Capscrew 7/16 x 5 inch',15.60),(7439,25,203,'Hexagonal Capscrew 7/16 x 5 1/2 inch',17.00),(7440,25,205,'Hexagonal Capscrew 7/16 x 6 inch',18.50),(7441,25,105,'Hexagonal Capscrew 3/8 x 1/2 inch',2.00),(7442,25,315,'Hexagonal Capscrew 3/8 x 5/8 inch',2.25),(7443,25,114,'Hexagonal Capscrew 3/8 x 3/4 inch',2.45),(7444,25,104,'Hexagonal Capscrew 3/8 x 1 inch',2.90),(7445,25,102,'Hexagonal Capscrew 3/8 x 1 1/4 inch',3.35),(7446,25,101,'Hexagonal Capscrew 3/8 x 1 1/2 inch',3.90),(7447,25,103,'Hexagonal Capscrew 3/8 x 1 3/4 inch',4.40),(7448,25,109,'Hexagonal Capscrew 3/8 x 2 inch',4.95),(7449,25,107,'Hexagonal Capscrew 3/8 x 2 1/4 inch',5.50),(7450,25,106,'Hexagonal Capscrew 3/8 x 2 1/2 inch',6.00),(7451,25,108,'Hexagonal Capscrew 3/8 x 2 3/4 inch',6.65),(7452,25,113,'Hexagonal Capscrew 3/8 x 3 inch',7.10),(7453,25,110,'Hexagonal Capscrew 3/8 x 3 1/2 inch',8.15),(7454,25,117,'Hexagonal Capscrew 3/8 x 4 inch',9.20),(7455,25,115,'Hexagonal Capscrew 3/8 x 4 1/2 inch',10.30),(7456,25,120,'Hexagonal Capscrew 3/8 x 5 inch',11.35),(7457,25,119,'Hexagonal Capscrew 3/8 x 5 1/2 inch',12.40),(7458,25,122,'Hexagonal Capscrew 3/8 x 6 inch',13.50),(7459,25,131,'Hexagonal Capscrew 5/16 x 1/2 inch',1.40),(7460,25,316,'Hexagonal Capscrew 5/16 x 5/8 inch',1.50),(7461,25,140,'Hexagonal Capscrew 5/16 x 3/4 inch',1.65),(7462,25,130,'Hexagonal Capscrew 5/16 x 1 inch',1.95),(7463,25,128,'Hexagonal Capscrew 5/16 x 1 1/4 inch',2.35),(7464,25,127,'Hexagonal Capscrew 5/16 x 1 1/2 inch',2.70),(7465,25,129,'Hexagonal Capscrew 5/16 x 1 3/4 inch',3.05),(7466,25,135,'Hexagonal Capscrew 5/16 x 2 inch',3.45),(7467,25,133,'Hexagonal Capscrew 5/16 x 2 1/4 inch',3.50),(7468,25,132,'Hexagonal Capscrew 5/16 x 2 1/2 inch',4.20),(7469,25,134,'Hexagonal Capscrew 5/16 x 2 3/4 inch',4.55),(7470,25,139,'Hexagonal Capscrew 5/16 x 3 inch',4.90),(7471,25,136,'Hexagonal Capscrew 5/16 x 3 1/2 inch',5.65),(7472,25,144,'Hexagonal Capscrew 5/16 x 4 inch',6.40),(7473,25,142,'Hexagonal Capscrew 5/16 x 4 1/2 inch',7.15),(7474,25,147,'Hexagonal Capscrew 5/16 x 5 inch',7.90),(7475,25,146,'Hexagonal Capscrew 5/16 x 5 1/2 inch',8.60),(7476,25,149,'Hexagonal Capscrew 5/16 x 6 inch',9.35),(7477,25,37,'Hexagonal Capscrew 1/4 x 1/2 inch',0.82),(7478,25,317,'Hexagonal Capscrew 1/4 x 5/8 inch',0.90),(7479,25,47,'Hexagonal Capscrew 1/4 x 3/4 inch',1.00),(7480,25,36,'Hexagonal Capscrew 1/4 x 1 inch',1.20),(7481,25,34,'Hexagonal Capscrew 1/4 x 1 1/4 inch',1.45),(7482,25,33,'Hexagonal Capscrew 1/4 x 1 1/2 inch',1.70),(7483,25,35,'Hexagonal Capscrew 1/4 x 1 3/4 inch',1.90),(7484,25,41,'Hexagonal Capscrew 1/4 x 2 inch',2.15),(7485,25,39,'Hexagonal Capscrew 1/4 x 2 1/4 inch',2.40),(7486,25,38,'Hexagonal Capscrew 1/4 x 2 1/2 inch',2.65),(7487,25,40,'Hexagonal Capscrew 1/4 x 2 3/4 inch',2.85),(7488,25,46,'Hexagonal Capscrew 1/4 x 3 inch',3.10),(7489,25,43,'Hexagonal Capscrew 1/4 x 3 1/2 inch',3.60),(7490,25,50,'Hexagonal Capscrew 1/4 x 4 inch',4.05),(7491,25,48,'Hexagonal Capscrew 1/4 x 4 1/2 inch',4.50),(7492,25,53,'Hexagonal Capscrew 1/4 x 5 inch',5.00),(7493,25,52,'Hexagonal Capscrew 1/4 x 5 1/2 inch',5.00),(7494,25,55,'Hexagonal Capscrew 1/4 x 6 inch',5.95);
/*!40000 ALTER TABLE `tbl_product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_size`
--

DROP TABLE IF EXISTS `tbl_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_size` (
  `size_ID` int(11) NOT NULL AUTO_INCREMENT,
  `size_length` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`size_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_size`
--

LOCK TABLES `tbl_size` WRITE;
/*!40000 ALTER TABLE `tbl_size` DISABLE KEYS */;
INSERT INTO `tbl_size` VALUES (11,'1 inch'),(12,'1 x 8 inch'),(13,'1/2 x 1 1/2 inch'),(14,'1/2 x 1 1/4 inch'),(15,'1/2 x 1 3/4 inch'),(16,'1/2 x 1 inch'),(17,'1/2 x 2 1/2 inch'),(18,'1/2 x 2 1/4 inch'),(19,'1/2 x 2 3/4 inch'),(20,'1/2 x 2 inch'),(21,'1/2 x 3 1/2 inch'),(22,'1/2 x 3 3/4 inch'),(23,'1/2 x 3 inch'),(24,'1/2 x 3/4 inch'),(25,'1/2 x 4 1/2 inch'),(26,'1/2 x 4 inch'),(27,'1/2 x 5 1/2 inch'),(28,'1/2 x 5 inch'),(29,'1/2 x 50 mm'),(30,'1/2 x 6 inch'),(31,'12 x 75 mm'),(32,'1/4 inch'),(33,'1/4 x 1 1/2 inch'),(34,'1/4 x 1 1/4 inch'),(35,'1/4 x 1 3/4 inch'),(36,'1/4 x 1 inch'),(37,'1/4 x 1/2 inch'),(38,'1/4 x 2 1/2 inch'),(39,'1/4 x 2 1/4 inch'),(40,'1/4 x 2 3/4 inch'),(41,'1/4 x 2 inch'),(42,'1/4 x 25 mm'),(43,'1/4 x 3 1/2 inch'),(44,'1/4 x 3 1/4 inch'),(45,'1/4 x 3 3/4 inch'),(46,'1/4 x 3 inch'),(47,'1/4 x 3/4 inch'),(48,'1/4 x 4 1/2 inch'),(49,'1/4 x 4 1/4 inch'),(50,'1/4 x 4 inch'),(51,'1/4 x 40 mm'),(52,'1/4 x 5 1/2 inch'),(53,'1/4 x 5 inch'),(54,'1/4 x 5/8 inch'),(55,'1/4 x 6 inch'),(56,'1/8 x 1 inch'),(57,'1/8 x 1/2 inch'),(58,'1/8 x 1/4 inch'),(59,'1/8 x 3/16 inch'),(60,'1/8 x 3/4 inch'),(61,'1/8 x 3/8 inch'),(62,'1/8 x 5/16 inch'),(63,'1/8 x 5/8 inch'),(64,'1/8 x 7/16 inch'),(65,'1/8 x 9/16 inch'),(66,'10 mm'),(67,'12 mm'),(68,'12 x 100 mm'),(69,'12 x 125 mm'),(70,'12 x 20 mm'),(71,'12 x 25 mm'),(72,'12 x 35 mm'),(73,'12 x 40 mm'),(74,'12 x 45 mm'),(75,'12 x 50 mm'),(76,'12 x 55 mm'),(77,'12 x 65 mm'),(78,'12 x 80 mm'),(79,'12 x 90 mm'),(80,'14 mm'),(81,'16 mm'),(82,'18 mm'),(83,'20 mm'),(84,'22 mm'),(85,'24 mm'),(86,'3 mm'),(87,'3/16 x 1 inch'),(88,'3/16 x 1/2 inch'),(89,'3/16 x 1/4 inch'),(90,'3/16 x 3/4 inch'),(91,'3/16 x 3/8 inch'),(92,'3/16 x 5/16 inch'),(93,'3/16 x 5/8 inch'),(94,'3/16 x 7/16 inch'),(95,'3/16 x 9/16 inch'),(96,'3/4 inch'),(97,'3/4 x 50 mm'),(98,'3/4 x 6 inch'),(99,'3/4 x 85 mm'),(100,'3/8 inch'),(101,'3/8 x 1 1/2 inch'),(102,'3/8 x 1 1/4 inch'),(103,'3/8 x 1 3/4 inch'),(104,'3/8 x 1 inch'),(105,'3/8 x 1/2 inch'),(106,'3/8 x 2 1/2 inch'),(107,'3/8 x 2 1/4 inch'),(108,'3/8 x 2 3/4 inch'),(109,'3/8 x 2 inch'),(110,'3/8 x 3 1/2 inch'),(111,'3/8 x 3 1/4 inch'),(112,'3/8 x 3 3/4 inch'),(113,'3/8 x 3 inch'),(114,'3/8 x 3/4 inch'),(115,'3/8 x 4 1/2 inch'),(116,'3/8 x 4 1/4 inch'),(117,'3/8 x 4 inch'),(118,'3/8 x 45 mm'),(119,'3/8 x 5 1/2 inch'),(120,'3/8 x 5 inch'),(121,'3/8 x 5/8 inch'),(122,'3/8 x 6 inch'),(123,'3/8 x 60 mm'),(124,'4 mm'),(125,'5 mm'),(126,'5/16 inch'),(127,'5/16 x 1 1/2 inch'),(128,'5/16 x 1 1/4 inch'),(129,'5/16 x 1 3/4 inch'),(130,'5/16 x 1 inch'),(131,'5/16 x 1/2 inch'),(132,'5/16 x 2 1/2 inch'),(133,'5/16 x 2 1/4 inch'),(134,'5/16 x 2 3/4 inch'),(135,'5/16 x 2 inch'),(136,'5/16 x 3 1/2 inch'),(137,'5/16 x 3 1/4 inch'),(138,'5/16 x 3 3/4 inch'),(139,'5/16 x 3 inch'),(140,'5/16 x 3/4 inch'),(141,'5/16 x 30 mm'),(142,'5/16 x 4 1/2 inch'),(143,'5/16 x 4 1/4 inch'),(144,'5/16 x 4 inch'),(145,'5/16 x 45 mm'),(146,'5/16 x 5 1/2 inch'),(147,'5/16 x 5 inch'),(148,'5/16 x 5/8 inch'),(149,'5/16 x 6 inch'),(150,'5/32 x 1 inch'),(151,'5/32 x 1/2 inch'),(152,'5/32 x 1/4 inch'),(153,'5/32 x 3/4 inch'),(154,'5/32 x 3/8 inch'),(155,'5/32 x 5/16 inch'),(156,'5/32 x 5/8 inch'),(157,'5/32 x 7/16 inch'),(158,'5/32 x 9/16 inch'),(159,'5/8 inch'),(160,'5/8 x 1 1/2 inch'),(161,'5/8 x 1 1/4 inch'),(162,'5/8 x 1 3/4 inch'),(163,'5/8 x 1 inch'),(164,'5/8 x 2 1/2 inch'),(165,'5/8 x 2 1/4 inch'),(166,'5/8 x 2 3/4 inch'),(167,'5/8 x 2 inch'),(168,'5/8 x 3 1/2 inch'),(169,'5/8 x 3 inch'),(170,'5/8 x 4 1/2 inch'),(171,'5/8 x 4 inch'),(172,'5/8 x 5 1/2 inch'),(173,'5/8 x 5 inch'),(174,'5/8 x 50 mm'),(175,'5/8 x 6 inch'),(176,'5/8 x 85 mm'),(177,'6 mm'),(178,'6 x 20 mm'),(179,'6 x 25 mm'),(180,'6 x 32 mm'),(181,'6 x 38 mm'),(182,'6 x 50 mm'),(183,'7 x 1 1/2 inch'),(184,'7 x 1 1/4 inch'),(185,'7 x 1/4 inch'),(186,'7 x 2 inch'),(187,'7 x 3/4 inch'),(188,'7/16 inch'),(189,'7/16 x 1 1/2 inch'),(190,'7/16 x 1 1/4 inch'),(191,'7/16 x 1 3/4 inch'),(192,'7/16 x 1 inch'),(193,'7/16 x 2 1/2 inch'),(194,'7/16 x 2 1/4 inch'),(195,'7/16 x 2 3/4 inch'),(196,'7/16 x 2 inch'),(197,'7/16 x 3 1/2 inch'),(198,'7/16 x 3 1/4 inch'),(199,'7/16 x 3 inch'),(200,'7/16 x 3/4 inch'),(201,'7/16 x 4 1/2 inch'),(202,'7/16 x 4 inch'),(203,'7/16 x 5 1/2 inch'),(204,'7/16 x 5 inch'),(205,'7/16 x 6 inch'),(206,'7/8 inch'),(207,'7/8 x 8 inch'),(208,'8 mm'),(209,'8 x 100 mm'),(210,'8 x 25 mm'),(211,'8 x 32 mm'),(212,'8 x 38 mm'),(213,'8 x 50 mm'),(214,'8 x 65 mm'),(215,'8 x 75 mm'),(216,'9/16 inch'),(217,'9/16 x 1 1/2 inch'),(218,'9/16 x 1 1/4 inch'),(219,'9/16 x 1 3/4 inch'),(220,'9/16 x 1 inch'),(221,'9/16 x 2 1/2 inch'),(222,'9/16 x 2 1/4 inch'),(223,'9/16 x 2 3/4 inch'),(224,'9/16 x 2 inch'),(225,'9/16 x 3 1/2 inch'),(226,'9/16 x 3 inch'),(227,'9/16 x 4 1/2 inch'),(228,'9/16 x 4 inch'),(229,'9/16 x 5 1/2 inch'),(230,'9/16 x 5 inch'),(231,'9/16 x 6 inch'),(232,'12 x 150 mm'),(233,'1/2 inch'),(234,'1/4 x 1 5/8 inch'),(235,'3/8 x 6 1/2 inch'),(236,'3/8 x 7 inch'),(237,'3/8 x 7 1/2 inch'),(238,'3/8 x 8 inch'),(239,'7/16 x 6 1/2 inch'),(240,'7/16 x 7 inch'),(241,'7/16 x 7 1/2 inch'),(242,'7/16 x 8 inch'),(243,'1/2 x 3 1/4 inch'),(244,'1/2 x 6 1/2 inch'),(245,'1/2 x 7 inch'),(246,'1/2 x 7 1/2 inch'),(247,'1/2 x 8 inch'),(248,'9/16 x 3 1/4 inch'),(249,'9/16 x 3 3/4 inch'),(250,'9/16 x 6 1/2 inch'),(251,'9/16 x 7 inch'),(252,'9/16 x 7 1/2 inch'),(253,'9/16 x 8 inch'),(254,'5/8 x 3 1/4 inch'),(255,'5/8 x 3 3/4 inch'),(256,'5/8 x 6 1/2 inch'),(257,'5/8 x 7 inch'),(258,'5/8 x 7 1/2 inch'),(259,'5/8 x 8 inch'),(260,'3/4 x 1 inch'),(261,'3/4 x 1 1/4 inch'),(262,'3/4 x 1 1/2 inch'),(263,'3/4 x 1 3/4 inch'),(264,'3/4 x 2 inch'),(265,'3/4 x 2 1/4 inch'),(266,'3/4 x 2 1/2 inch'),(267,'3/4 x 2 3/4 inch'),(268,'3/4 x 3 inch'),(269,'3/4 x 3 1/4 inch'),(270,'3/4 x 3 1/2 inch'),(271,'3/4 x 3 3/4 inch'),(272,'3/4 x 4 inch'),(273,'3/4 x 4 1/2 inch'),(274,'3/4 x 5 inch'),(275,'3/4 x 5 1/2 inch'),(276,'3/4 x 6 1/2 inch'),(277,'3/4 x 7 inch'),(278,'3/4 x 7 1/2 inch'),(279,'3/4 x 8 inch'),(280,'7/8 x 1 1/2 inch'),(281,'7/8 x 1 3/4 inch'),(282,'7/8 x 2 inch'),(283,'7/8 x 2 1/4 inch'),(284,'7/8 x 2 1/2 inch'),(285,'7/8 x 2 3/4 inch'),(286,'7/8 x 3 inch'),(287,'7/8 x 3 1/4 inch'),(288,'7/8 x 3 1/2 inch'),(289,'7/8 x 3 3/4 inch'),(290,'7/8 x 4 inch'),(291,'7/8 x 4 1/2 inch'),(292,'7/8 x 5 inch'),(293,'7/8 x 5 1/2 inch'),(294,'7/8 x 6 inch'),(295,'7/8 x 6 1/2 inch'),(296,'7/8 x 7 inch'),(297,'7/8 x 7 1/2 inch'),(298,'7/8 x 8 inch'),(299,'1 x 1 1/2 inch'),(300,'1 x 2 inch'),(301,'1 x 2 1/4 inch'),(302,'1 x 2 1/2 inch'),(303,'1 x 2 3/4 inch'),(304,'1 x 3 inch'),(305,'1 x 3 1/2 inch'),(306,'1 x 4 inch'),(307,'1 x 4 1/2 inch'),(308,'1 x 5 inch'),(309,'1 x 5 1/2 inch'),(310,'1 x 6 inch'),(311,'1 x 6 1/2 inch'),(312,'1 x 7 inch'),(313,'1 x 7 1/2 inch'),(314,'1 x 8 inch'),(315,'3/8 x 5/8 inch'),(316,'5/16 x 5/8 inch'),(317,'1/4 x 5/8 inch');
/*!40000 ALTER TABLE `tbl_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `salesreportview`
--

/*!50001 DROP VIEW IF EXISTS `salesreportview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesreportview` AS select `o`.`Order_ID` AS `OrderID`,`o`.`Order_Date` AS `orderDate`,concat(`c`.`Customer_FirstName`,' ',`c`.`Customer_LastName`) AS `CustomerName`,concat(`e`.`employee_FirstName`,' ',`e`.`employee_LastName`) AS `EmployeeName`,`o`.`Order_TotalPrice` AS `TotalAmount` from ((`tbl_order` `o` join `tbl_customer` `c` on(`o`.`Customer_ID` = `c`.`Customer_ID`)) join `tbl_employee` `e` on(`o`.`Employee_ID` = `e`.`employee_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesreportviewwithbal`
--

/*!50001 DROP VIEW IF EXISTS `salesreportviewwithbal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesreportviewwithbal` AS select `salesreportview`.`OrderID` AS `OrderID`,`salesreportview`.`orderDate` AS `orderDate`,`salesreportview`.`CustomerName` AS `CustomerName`,`salesreportview`.`EmployeeName` AS `EmployeeName`,`salesreportview`.`TotalAmount` AS `TotalAmount`,(select sum(`tbl_order`.`Order_TotalPrice`) from `tbl_order`) AS `TotalSales` from `salesreportview` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seemoredetails`
--

/*!50001 DROP VIEW IF EXISTS `seemoredetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `seemoredetails` AS select `o`.`Order_ID` AS `OrderID`,concat(`e`.`employee_FirstName`,' ',`e`.`employee_LastName`) AS `EmployeeFullName`,concat(`c`.`Customer_FirstName`,' ',`c`.`Customer_LastName`) AS `CustomerFullName`,`c`.`Customer_ContactNum` AS `CustomerContact` from ((`tbl_order` `o` join `tbl_employee` `e` on(`o`.`Employee_ID` = `e`.`employee_id`)) join `tbl_customer` `c` on(`o`.`Customer_ID` = `c`.`Customer_ID`)) */;
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

-- Dump completed on 2024-03-11  8:59:27
