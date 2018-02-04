-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: insurance_engine
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `tbl_attributes`
--

DROP TABLE IF EXISTS `tbl_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `deductable` varchar(200) DEFAULT NULL,
  `treatment_outside` varchar(200) DEFAULT NULL,
  `existing_conditions` varchar(300) DEFAULT NULL,
  `ambulance` varchar(300) DEFAULT NULL,
  `prescription_drugs` varchar(45) DEFAULT NULL,
  `dental` varchar(45) DEFAULT NULL,
  `cash_benefit` varchar(100) DEFAULT NULL,
  `excluded_hospitals` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_id_idx` (`plan_id`),
  CONSTRAINT `plan_id_attributes` FOREIGN KEY (`plan_id`) REFERENCES `tbl_plans` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attributes`
--

LOCK TABLES `tbl_attributes` WRITE;
/*!40000 ALTER TABLE `tbl_attributes` DISABLE KEYS */;
INSERT INTO `tbl_attributes` VALUES (1,4,'10% co-payment on all out-patient services','Elective cost not covered','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Yes','Fully Covered','Not Covered','200 Per Day','None'),(2,5,'10% co-payment on all out-patient services','Elective cost not covered','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Yes','Fully Covered','Not Covered','200 Per Day','None'),(3,6,'20% co-payment on all out-patient services','Elective cost not covered','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Yes','Fully Covered','Not Covered','200 Per Day','None'),(4,7,'20% co-payment on all out-patient services','Elective cost not covered','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Fully Covered','Fully Covered','Emergency Only','200 Per Day','None'),(5,8,'20% co-payment on all out-patient services','Covered subject to network rates with direct billing where possible','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Fully Covered','Fully Covered','Emergency Only','200 Per Day','None'),(6,9,'20% co-payment on all out-patient services','Covered subject to network rates with direct billing where possible','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Fully Covered','Fully Covered','Emergency Only','500 Per Night','None'),(7,10,'20% co-payment on all out-patient services','Covered subject to network rates with direct billing where possible','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Fully Covered','Fully Covered','Emergency Only','500 Per Night','None'),(8,11,'10% co-payment on all out-patient services','Covered subject to network rates with direct billing where possible','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','Fully Covered','Fully Covered','Fully Covered','500 Per Night','None'),(9,12,'10% co-payment on all out-patient services','Covered subject to network rates with direct billing where possible','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','No','Fully Covered','Fully Covered','500 Per Night','None'),(10,13,'10% co-payment on all out-patient services','Covered subject to network rates with direct billing where possible','Covered after 6 month waiting period up to AED 150,000 (with chronic conditions)','No','Fully Covered','Fully Covered','500 Per Night','None');
/*!40000 ALTER TABLE `tbl_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_plans`
--

DROP TABLE IF EXISTS `tbl_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `plan_name` varchar(45) NOT NULL,
  `regions` varchar(45) NOT NULL,
  `hospitals` int(11) NOT NULL,
  `clinics` int(11) NOT NULL,
  `annual_coverage` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_id_idx` (`provider_id`),
  CONSTRAINT `provider_id` FOREIGN KEY (`provider_id`) REFERENCES `tbl_provider` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_plans`
--

LOCK TABLES `tbl_plans` WRITE;
/*!40000 ALTER TABLE `tbl_plans` DISABLE KEYS */;
INSERT INTO `tbl_plans` VALUES (4,2,'Plan A','All Regions',200,15,900),(5,2,'Plan B','All regions',200,15,15000),(6,2,'Plan C','All regions',200,15,25000),(7,2,'Plan D','All regions',200,15,70000),(8,3,'Plan A','USA',600,100,25000),(9,3,'Plan B','USA',600,100,15000),(10,3,'Plan C','USA',600,100,10000),(11,3,'Plan D','USA & Asia',600,100,80000),(12,3,'Plan E','USA & Asia',600,100,150000),(13,3,'Plan F','USA',600,100,200000);
/*!40000 ALTER TABLE `tbl_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_price`
--

DROP TABLE IF EXISTS `tbl_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_rule` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_id_idx` (`plan_id`),
  KEY `price_rule_idx` (`price_rule`),
  CONSTRAINT `plan_id` FOREIGN KEY (`plan_id`) REFERENCES `tbl_plans` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `price_rule` FOREIGN KEY (`price_rule`) REFERENCES `tbl_price_rules` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_price`
--

LOCK TABLES `tbl_price` WRITE;
/*!40000 ALTER TABLE `tbl_price` DISABLE KEYS */;
INSERT INTO `tbl_price` VALUES (1,4,1,200,1),(2,4,1,300,2),(3,4,1,350,3),(4,4,1,400,4),(5,4,1,500,5),(6,4,2,250,1),(7,4,2,350,2),(8,4,2,450,3),(9,4,2,550,4),(10,4,2,650,5),(11,5,1,350,1),(12,5,1,450,2),(13,5,1,500,3),(14,5,1,600,4),(15,5,1,700,5),(16,5,2,450,1),(17,5,2,550,2),(18,5,2,750,3),(19,5,2,850,4),(20,5,2,900,5),(104,6,1,750,2),(105,6,1,852,3),(106,6,1,982,4),(107,6,1,1000,5),(108,6,2,715,1),(109,6,2,825,2),(110,6,2,937.2,3),(111,6,2,1080.2,4),(112,6,2,1100,5),(113,7,1,786.5,1),(114,7,1,907.5,2),(115,7,1,1030.92,3),(116,7,1,1188.22,4),(117,7,1,1210,5),(118,7,2,865.15,1),(119,7,2,998.25,2),(120,7,2,1134.01,3),(121,7,2,1307.04,4),(122,7,2,1331,5),(123,8,1,951.665,1),(124,8,1,1098.07,2),(125,8,1,1247.41,3),(126,8,1,1437.75,4),(127,8,1,1464.1,5),(128,8,2,1046.83,1),(129,8,2,1207.88,2),(130,8,2,1372.15,3),(131,8,2,1581.52,4),(132,8,2,1610.51,5),(133,9,1,1151.51,1),(134,9,1,1328.67,2),(135,9,1,1509.37,3),(136,9,1,1739.67,4),(137,9,1,1771.56,5),(138,9,2,1266.67,1),(139,9,2,1461.54,2),(140,9,2,1660.31,3),(141,9,2,1913.64,4),(142,9,2,1948.72,5),(143,10,1,1393.33,1),(144,10,1,1607.69,2),(145,10,1,1826.34,3),(146,10,1,2105,4),(147,10,1,2143.59,5),(148,10,2,1532.67,1),(149,10,2,1768.46,2),(150,10,2,2008.97,3),(151,10,2,2315.5,4),(152,10,2,2357.95,5),(153,11,1,1685.93,1),(154,11,1,1945.31,2),(155,11,1,2209.87,3),(156,11,1,2547.06,4),(157,11,1,2593.74,5),(158,11,2,1854.53,1),(159,11,2,2139.84,2),(160,11,2,2430.86,3),(161,11,2,2801.76,4),(162,11,2,2853.12,5),(163,12,1,2039.98,1),(164,12,1,2353.82,2),(165,12,1,2673.94,3),(166,12,1,3081.94,4),(167,12,1,3138.43,5),(168,12,2,2243.98,1),(169,12,2,2589.2,2),(170,12,2,2941.33,3),(171,12,2,3390.13,4),(172,12,2,3452.27,5),(173,13,1,2468.37,1),(174,13,1,2848.12,2),(175,13,1,3235.47,3),(176,13,1,3729.14,4),(177,13,1,3797.5,5),(178,13,2,2715.21,1),(179,13,2,3132.94,2),(180,13,2,3559.02,3),(181,13,2,4102.06,4),(182,13,2,4177.25,5);
/*!40000 ALTER TABLE `tbl_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_price_rules`
--

DROP TABLE IF EXISTS `tbl_price_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_price_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age_start` int(11) NOT NULL,
  `age_end` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_price_rules`
--

LOCK TABLES `tbl_price_rules` WRITE;
/*!40000 ALTER TABLE `tbl_price_rules` DISABLE KEYS */;
INSERT INTO `tbl_price_rules` VALUES (1,1,12),(2,13,18),(3,19,50),(4,51,60),(5,61,100);
/*!40000 ALTER TABLE `tbl_price_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_provider`
--

DROP TABLE IF EXISTS `tbl_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_provider`
--

LOCK TABLES `tbl_provider` WRITE;
/*!40000 ALTER TABLE `tbl_provider` DISABLE KEYS */;
INSERT INTO `tbl_provider` VALUES (2,'Provider 1','+971 50 9819437','contact@provider.com','United Arab Emirates','Dubai'),(3,'Provider 2','+971 50 9819437','contact@provider2.com','United Arab Emirates','Sharjah'),(4,'Provider 3','+971 55 9996663','contact@proivder3.com','United Arab Emirates','Ajman');
/*!40000 ALTER TABLE `tbl_provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-04 13:12:48
