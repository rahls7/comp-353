-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: kec353_2
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `account`
--


CREATE SCHEMA IF NOT EXISTS `kec353_2` DEFAULT CHARACTER SET latin1 ;
USE `kec353_2` ;



DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_number` int(11) NOT NULL AUTO_INCREMENT,
  `balance` decimal(10,2) NOT NULL,
  `interest_rate_id` int(11) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `account_category` varchar(255) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `transaction_limit` int(45) DEFAULT 25,
  PRIMARY KEY (`account_number`),
  KEY `savings_account_client_client_id_fk` (`client_id`),
  KEY `savings_account_interest_interest_rate_id_fk` (`interest_rate_id`),
  CONSTRAINT `savings_account_client_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON UPDATE CASCADE,
  CONSTRAINT `savings_account_interest_interest_rate_id_fk` FOREIGN KEY (`interest_rate_id`) REFERENCES `interest` (`interest_rate_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,0.00,NULL,'chequing','personal',1,50),(2,35906.09,NULL,'chequing','personal',2,50),(3,40183.21,NULL,'chequing','buisiness',3,50),(4,15733.93,NULL,'chequing','personal',4,50),(5,1980.39,NULL,'chequing','personal',5,50),(6,9201.71,NULL,'chequing','buisiness',6,90),(7,38899.68,NULL,'chequing','personal',7,50),(8,2788.90,NULL,'chequing','buisiness',8,56),(9,6457.68,NULL,'chequing','personal',9,45),(10,633.03,NULL,'chequing','buisiness',10,50),(11,500.00,1,'savings','personal',1,78),(12,7566.03,1,'savings','personal',2,10),(13,5412.96,1,'savings','personal',3,54),(14,91756.09,1,'savings','buisiness',4,80),(15,36673.54,1,'savings','personal',5,11),(16,4588.53,1,'savings','personal',6,67),(17,74.54,1,'savings','personal',7,32),(18,382.94,1,'savings','personal',8,21),(19,1000000.19,1,'savings','buisiness',9,78),(20,46883.02,1,'savings','personal',10,9),(21,0.00,1,'savings','personal',1,25),(22,0.00,1,'chequing','buisiness',1,40),(23,0.00,1,'savings','personal',1,24),(24,0.00,1,'chequing','personal',1,25),(25,0.00,1,'foreign currency','corporate',1,25);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountchargeplan`
--

DROP TABLE IF EXISTS `accountchargeplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountchargeplan` (
  `account_id` int(11) NOT NULL,
  `charge_plan_option_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`charge_plan_option_id`),
  KEY `account_charge_plan_charge_plan_option_id_fk` (`charge_plan_option_id`),
  CONSTRAINT `account_charge_plan_charge_plan_option_id_fk` FOREIGN KEY (`charge_plan_option_id`) REFERENCES `chargeplan` (`option_id`) ON UPDATE CASCADE,
  CONSTRAINT `account_charge_plan_client_client_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_number`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountchargeplan`
--

LOCK TABLES `accountchargeplan` WRITE;
/*!40000 ALTER TABLE `accountchargeplan` DISABLE KEYS */;
INSERT INTO `accountchargeplan` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `accountchargeplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,'kec353_2','data2497'),(3,'admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) NOT NULL,
  `phone` bigint(255) NOT NULL,
  `fax` bigint(255) NOT NULL,
  `opening_date` date NOT NULL,
  `manager_id` int(11) NOT NULL,
  `is_head_office` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_id`),
  KEY `branch_id_location` (`location`),
  CONSTRAINT `branch_id_location` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,2,3067369455,2049649903,'2009-03-23',5,0),(2,4,902528301,7059408820,'2012-10-19',4,0),(3,6,7788270286,7059757036,'2005-09-17',3,0),(4,8,7781746635,7054132835,'2014-03-25',2,0),(5,9,4389129100,6042936296,'2007-12-31',6,0),(6,9,5147671234,5147582814,'2015-03-12',7,1),(7,10,3433437896,8079805758,'2018-06-23',8,0),(8,1,2899479507,5814909189,'2001-04-20',9,0),(9,2,2059113287,5061936812,'2004-03-17',10,0),(10,1,8078773854,7804300184,'2009-11-17',11,0);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chargeplan`
--

DROP TABLE IF EXISTS `chargeplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chargeplan` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_limit` varchar(45) NOT NULL,
  `charge` varchar(45) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chargeplan`
--

LOCK TABLES `chargeplan` WRITE;
/*!40000 ALTER TABLE `chargeplan` DISABLE KEYS */;
INSERT INTO `chargeplan` VALUES (1,'5213.62','40381.89'),(2,'4588.10','12333.61'),(3,'2252.37','31804.08'),(4,'7982.57','51523.08'),(5,'6854.69','36424.16'),(6,'6917.64','20949.65'),(7,'5653.65','2094.51'),(8,'7546.87','1011.06'),(9,'3959.83','55367.78'),(10,'2390.32','96981.31'),(11,'5213.62','40381.89'),(12,'4588.10','12333.61'),(13,'2252.37','31804.08'),(14,'7982.57','51523.08'),(15,'6854.69','36424.16'),(16,'6917.64','20949.65'),(17,'5653.65','2094.51'),(18,'7546.87','1011.06'),(19,'3959.83','55367.78'),(20,'2390.32','96981.31');
/*!40000 ALTER TABLE `chargeplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `join_date` date NOT NULL,
  `address` varchar(45) NOT NULL,
  `email_address` varchar(45) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `category` varchar(45) DEFAULT 'regular',
  `branch_id` int(11) DEFAULT NULL,
  `card_number` bigint(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `num_transaction` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `client_branch_branch_id_fk` (`branch_id`),
  CONSTRAINT `client_branch_branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'John','Doe','1988-03-14','2010-12-28','1410 First St.','john.doe@myemail.ca',6049173416,'personal',9,1,'1',0),(2,'Roberto','Martinez','1999-01-21','2015-10-28','5358 Curabitur St.','roberto.martinez@hotmail.com',6049173416,'personal',4,3158327165548703,'UnYFhaNr',0),(3,'Steel','Dodson','1974-01-21','2018-12-28','5358 Curabitur St.','posuere.cubilia.Curae@Integermollis.ca',6049173416,'business',4,3158143778648560,'9Yntkb5b',0),(4,'Ingrid','Ramsey','1998-06-16','2017-11-18','1448 Id Av.','lectus.rutrum@lacusMauris.net',2895034697,'personal',5,3112993260722488,'bn0vBDbU',0),(5,'Yvonne','Medina','1956-04-24','2018-09-09','1742 Aliquet Av. Ap #468','nibh@Quisquepurus.org',6471292698,'corporate',8,3096977593570821,'X3jRxpq7',0),(6,'Cedric','Downs','1993-03-02','2018-03-02','6887 In St.','ligula.Aliquam.erat@ridiculusmusProin.org',571193,'personal',3,3112549547776901,'CVjivIXr',0),(7,'Oscar','Collins','1957-01-18','2017-10-12','929 Fringilla Av.','dolor.sit@ipsum.edu',5066766020,'personal',2,3528000456096913,'bDXoSUU9',0),(8,'Scott','Washington','1989-01-20','2018-08-06','4358 Nulla St.','Pellentesque@senectuset.net',5199605918,'personal',9,3158919489446950,'X3qcW2q3',0),(9,'Vance','Knapp','1981-04-04','2017-12-06','1793 Sed Rd.','Pellentesque@auctorveliteget.edu',9027169325,'business',2,3337581958558147,'XATbwYHm',0),(10,'Garrison','Hutchinson','1977-05-08','2018-05-13','5933 Eu Ave','convallis@velvulputateeu.ca',7781159114,'corporate',7,3088732316695151,'W1tP3kAV',0),(11,'kfkj','ksjfkljs','2018-10-30','0000-00-00','ffjkfh','jhsdkfh@jkdhfksf.com',1234567890,'3',2,123456789765432,'sffhjksfhksjfh',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT 'associate',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(80) NOT NULL,
  `start_date` date NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `email_address` varchar(45) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `employee_branch_branch_id_fk` (`branch_id`),
  CONSTRAINT `employee_branch_branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ms.','Odysseus','Riddle','5485 Malesuada St.','2010-08-29',79601.69,'nulla@iaculis.co.uk',7781181412,10),(2,'Mrs.','Dean','Key','6603 Erat Ave','2007-05-14',3247.76,'eu.euismod@ametrisus.edu',5878973327,3),(3,'Dr.','Thomas','Contreras','3467 Dictum Avenue','2002-07-18',49346.89,'erat.semper@tellus.ca',5196986386,3),(4,'Mr.','Amber','Casey','6908 Aliquam Rd.','2018-06-26',80115.29,'netus@tempor.edu',5795737997,7),(5,'Mrs.','Bruno','Flores','1158 Pede. Ave','2013-10-14',68282.13,'eu.elit.Nulla@Quisque.com',3657191432,9),(6,'Ms.','Colt','Byers','P.O. Box 753, 5548 Dui. Avenue','2003-03-07',74547.17,'odio.auctor@vitaepurusgravida.net',6473688390,8),(7,'Ms.','Cara','Barrett','580-8657 Maecenas St.','2002-12-12',94699.33,'morbi@nonvestibulumnec.net',3066386791,10),(8,'Ms.','Quentin','Weber','5288 Integer Ave','2018-09-17',31402.82,'Integer@maurissapien.ca',7803230233,10),(9,'Mrs.','Bradley','Knox','8775 A Street','2009-07-20',52574.32,'semper.tellus.id@quisdiam.co.uk',8674043306,2),(10,'Mr.','Jada','Cook','9118 Vivamus St.','2011-08-20',61176.04,'Maecenas.ornare@Aliquamnec.co.uk',9051281800,3),(11,'1','2','1','1','2018-11-24',1.00,'1',1,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest` (
  `interest_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_account` varchar(45) NOT NULL,
  `percentage` decimal(3,2) NOT NULL,
  PRIMARY KEY (`interest_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (1,'Savings',0.02),(2,'Loans',0.12),(3,'Credit Card',0.10),(4,'Credit Card',0.06),(5,'Credit Card',0.40);
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liability`
--

DROP TABLE IF EXISTS `liability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liability` (
  `liability_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `credit_limit` decimal(10,2) NOT NULL DEFAULT '1500.00',
  `client_id` int(11) NOT NULL,
  `interest_rate_id` int(11) NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`liability_id`),
  KEY `credit_card_client_client_id_fk` (`client_id`),
  KEY `credit_card_interest_rate_interest_rate_id_fk` (`interest_rate_id`),
  CONSTRAINT `credit_card_client_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_card_interest_rate_interest_rate_id_fk` FOREIGN KEY (`interest_rate_id`) REFERENCES `interest` (`interest_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liability`
--

LOCK TABLES `liability` WRITE;
/*!40000 ALTER TABLE `liability` DISABLE KEYS */;
INSERT INTO `liability` VALUES (1,'Credit Card',2073.06,1,3,398.45),(2,'Line Of Credit',1801.40,2,3,0.00),(3,'Credit Card',5506.07,3,4,0.00),(4,'Credit Card',9875.09,4,2,0.00),(5,'Line Of Credit',2690.98,5,4,0.00),(6,'Credit Card',2413.53,6,1,0.00),(7,'Line Of Credit',8233.05,7,5,0.00),(8,'Line Of Credit',25000.00,8,1,0.00),(9,'Credit Card',3427.43,9,1,0.00),(10,'Line Of Credit',5232.90,10,4,0.00);
/*!40000 ALTER TABLE `liability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `provence` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Quebec','Montreal'),(2,'Ontario','Toronto'),(3,'British Columbia','Vancouver'),(4,'Ontario','Niagara Falls'),(5,'British Columbia','Victoria'),(6,'Nova Scotia','Halifax'),(7,'Quebec','Quebec City'),(8,'Alberta','Calgary'),(9,'Ontario','Ottawa'),(10,'Alberta','Edmonton');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll` (
  `payroll_payment_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`payroll_payment_id`),
  KEY `payroll_employee_id_fk` (`employee_id`),
  CONSTRAINT `payroll_employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,1,'2018-11-01',89.98),(2,2,'2018-11-01',350.89),(3,3,'2018-11-01',1078.90),(4,4,'2018-11-01',789.90),(5,5,'2018-11-01',123.90),(6,6,'2018-11-01',658.20),(7,7,'2018-11-01',89.99),(8,8,'2018-11-01',78.98),(9,9,'2018-11-01',123.90),(10,10,'2018-11-01',234.90);
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_off_duty`
--

DROP TABLE IF EXISTS `personnel_off_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_off_duty` (
  `off_duty_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`off_duty_id`),
  KEY `personnel_off_duty_employee_id_fk` (`employee_id`),
  CONSTRAINT `personnel_off_duty_employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_off_duty`
--

LOCK TABLES `personnel_off_duty` WRITE;
/*!40000 ALTER TABLE `personnel_off_duty` DISABLE KEYS */;
INSERT INTO `personnel_off_duty` VALUES (6,1,'2018-11-12','2018-11-12','sick'),(7,3,'2018-10-12','2018-10-26','vacation'),(8,5,'2018-11-12','2018-11-12','sick'),(9,2,'2018-08-08','2018-09-09','emergency'),(10,4,'2018-01-02','2018-01-02','sick');
/*!40000 ALTER TABLE `personnel_off_duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `web_access` varchar(512) DEFAULT NULL,
  `phone_access` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `service_employee_employee_id_fk` (`manager_id`),
  CONSTRAINT `service_employee_employee_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Banking',2,'comp353bank.com/banking',NULL),(2,'Insurance',3,'comp353bank.com/insurance',NULL),(3,'Investment',4,'comp353bank.com/investment',NULL);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transaction_client_id_fk_idx` (`account_id`),
  CONSTRAINT `transaction_client_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_number`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,'deposit',100.20,'2018-01-11'),(2,3,'transfer',87.90,'2018-01-11'),(3,4,'bill payment',89.99,'2018-01-11'),(4,9,'withdraw',60.00,'2018-01-11'),(5,11,'bill payment',90.00,'0000-00-00'),(6,1,'bill payment',4000.00,'0000-00-00'),(7,1,'bill payment',200.00,'0000-00-00'),(8,11,'bill payment',4307.14,'0000-00-00'),(9,11,'bill payment',500.00,'0000-00-00'),(10,1,'bill payment',100.00,'0000-00-00'),(11,1,'bill payment',1.55,'0000-00-00'),(12,11,'bill payment',9000.00,'0000-00-00');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-24  1:14:38
