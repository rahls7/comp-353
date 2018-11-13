-- MySQL dump 10.13  Distrib 5.6.42, for Linux (x86_64)
--
-- Host: kec353.encs.concordia.ca    Database: kec353_2
-- ------------------------------------------------------
-- Server version	5.6.42

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
CREATE SCHEMA IF NOT EXISTS `kec353_2` DEFAULT CHARACTER SET latin1 ;
USE `kec353_2` ;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `account_number` int(11) NOT NULL AUTO_INCREMENT,
  `balance` decimal(10,2) NOT NULL,
  `interest_rate_id` int(11) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`account_number`),
  KEY `savings_account_client_client_id_fk` (`client_id`),
  KEY `savings_account_interest_interest_rate_id_fk` (`interest_rate_id`),
  CONSTRAINT `savings_account_client_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`) ON UPDATE CASCADE,
  CONSTRAINT `savings_account_interest_interest_rate_id_fk` FOREIGN KEY (`interest_rate_id`) REFERENCES `Interest` (`interest_rate_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,4301.55,NULL,'chequing',1),(2,35906.09,NULL,'chequing',2),(3,40183.21,NULL,'chequing',3),(4,15733.93,NULL,'chequing',4),(5,1980.39,NULL,'chequing',5),(6,9201.71,NULL,'chequing',6),(7,38899.68,NULL,'chequing',7),(8,2788.90,NULL,'chequing',8),(9,6457.68,NULL,'chequing',9),(10,633.03,NULL,'chequing',10),(11,14397.14,1,'savings',1),(12,7566.03,1,'savings',2),(13,5412.96,1,'savings',3),(14,91756.09,1,'savings',4),(15,36673.54,1,'savings',5),(16,4588.53,1,'savings',6),(17,74.54,1,'savings',7),(18,382.94,1,'savings',8),(19,1000000.19,1,'savings',9),(20,46883.02,1,'savings',10);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
-- -----------------------------------------------------
-- Table `kec353_2`.`branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kec353_2`.`branch` (
  `branch_id` INT(11) NOT NULL AUTO_INCREMENT,
  `location` INT(11) NOT NULL,
  `phone` BIGINT(255) NOT NULL,
  `fax` BIGINT(255) NOT NULL,
  `opening_date` DATE NOT NULL,
  `manager_id` INT(11) NOT NULL,
  `is_head_office` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_id`),
  CONSTRAINT `branch_id_location`
    FOREIGN KEY (`location`)
    REFERENCES `kec353_2`.`location` (`location_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES (1,2,3067369455,2049649903,'2009-03-23',5,0),(2,4,902528301,7059408820,'2012-10-19',4,0),(3,6,7788270286,7059757036,'2005-09-17',3,0),(4,8,7781746635,7054132835,'2014-03-25',2,0),(5,9,4389129100,6042936296,'2007-12-31',6,0),(6,9,5147671234,5147582814,'2015-03-12',7,1),(7,10,3433437896,8079805758,'2018-06-23',8,0),(8,1,2899479507,5814909189,'2001-04-20',9,0),(9,2,2059113287,5061936812,'2004-03-17',10,0),(10,1,8078773854,7804300184,'2009-11-17',11,0);
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChargePlan`
--

DROP TABLE IF EXISTS `ChargePlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChargePlan` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_limit` varchar(45) NOT NULL,
  `charge` varchar(45) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChargePlan`
--

LOCK TABLES `ChargePlan` WRITE;
/*!40000 ALTER TABLE `ChargePlan` DISABLE KEYS */;
INSERT INTO `ChargePlan` VALUES (1,'5213.62','40381.89'),(2,'4588.10','12333.61'),(3,'2252.37','31804.08'),(4,'7982.57','51523.08'),(5,'6854.69','36424.16'),(6,'6917.64','20949.65'),(7,'5653.65','2094.51'),(8,'7546.87','1011.06'),(9,'3959.83','55367.78'),(10,'2390.32','96981.31'),(11,'5213.62','40381.89'),(12,'4588.10','12333.61'),(13,'2252.37','31804.08'),(14,'7982.57','51523.08'),(15,'6854.69','36424.16'),(16,'6917.64','20949.65'),(17,'5653.65','2094.51'),(18,'7546.87','1011.06'),(19,'3959.83','55367.78'),(20,'2390.32','96981.31');
/*!40000 ALTER TABLE `ChargePlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
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
  PRIMARY KEY (`client_id`),
  KEY `client_branch_branch_id_fk` (`branch_id`),
  CONSTRAINT `client_branch_branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `Branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'John','Doe','1988-03-14','2010-12-28','1410 First St.','john.doe@myemail.ca',6049173416,'personal',9,3088232759541699,'HSUF5KuY'),(2,'Roberto','Martinez','1999-01-21','2015-10-28','5358 Curabitur St.','roberto.martinez@hotmail.com',6049173416,'personal',4,3158327165548703,'UnYFhaNr'),(3,'Steel','Dodson','1974-01-21','2018-12-28','5358 Curabitur St.','posuere.cubilia.Curae@Integermollis.ca',6049173416,'business',4,3158143778648560,'9Yntkb5b'),(4,'Ingrid','Ramsey','1998-06-16','2017-11-18','1448 Id Av.','lectus.rutrum@lacusMauris.net',2895034697,'personal',5,3112993260722488,'bn0vBDbU'),(5,'Yvonne','Medina','1956-04-24','2018-09-09','1742 Aliquet Av. Ap #468','nibh@Quisquepurus.org',6471292698,'corporate',8,3096977593570821,'X3jRxpq7'),(6,'Cedric','Downs','1993-03-02','2018-03-02','6887 In St.','ligula.Aliquam.erat@ridiculusmusProin.org',571193,'personal',3,3112549547776901,'CVjivIXr'),(7,'Oscar','Collins','1957-01-18','2017-10-12','929 Fringilla Av.','dolor.sit@ipsum.edu',5066766020,'personal',2,3528000456096913,'bDXoSUU9'),(8,'Scott','Washington','1989-01-20','2018-08-06','4358 Nulla St.','Pellentesque@senectuset.net',5199605918,'personal',9,3158919489446950,'X3qcW2q3'),(9,'Vance','Knapp','1981-04-04','2017-12-06','1793 Sed Rd.','Pellentesque@auctorveliteget.edu',9027169325,'business',2,3337581958558147,'XATbwYHm'),(10,'Garrison','Hutchinson','1977-05-08','2018-05-13','5933 Eu Ave','convallis@velvulputateeu.ca',7781159114,'corporate',7,3088732316695151,'W1tP3kAV');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientChargePlan`
--

DROP TABLE IF EXISTS `clientchargeplan`;

CREATE TABLE `kec353_2`.`clientchargeplan` (
  `account_id` INT(11) NOT NULL,
  `charge_plan_option_id` INT(11) NOT NULL,
  PRIMARY KEY (`account_id`, `charge_plan_option_id`),
  CONSTRAINT `account_charge_plan_charge_plan_option_id_fk`
    FOREIGN KEY (`charge_plan_option_id`)
    REFERENCES `kec353_2`.`chargeplan` (`option_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `account_charge_plan_client_client_id_fk`
    FOREIGN KEY (`account_id`)
    REFERENCES `kec353_2`.`account` (`account_number`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARACTER SET = latin1;

--
-- Dumping data for table `ClientChargePlan`
--

LOCK TABLES `clientchargeplan` WRITE;
/*!40000 ALTER TABLE `ClientChargePlan` DISABLE KEYS */;
INSERT INTO `clientchargeplan` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
INSERT INTO `clientchargeplan` VALUES (11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `ClientChargePlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
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
  CONSTRAINT `employee_branch_branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `Branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Ms.','Odysseus','Riddle','5485 Malesuada St.','2010-08-29',79601.69,'nulla@iaculis.co.uk',7781181412,10),(2,'Mrs.','Dean','Key','6603 Erat Ave','2007-05-14',3247.76,'eu.euismod@ametrisus.edu',5878973327,3),(3,'Dr.','Thomas','Contreras','3467 Dictum Avenue','2002-07-18',49346.89,'erat.semper@tellus.ca',5196986386,3),(4,'Mr.','Amber','Casey','6908 Aliquam Rd.','2018-06-26',80115.29,'netus@tempor.edu',5795737997,7),(5,'Mrs.','Bruno','Flores','1158 Pede. Ave','2013-10-14',68282.13,'eu.elit.Nulla@Quisque.com',3657191432,9),(6,'Ms.','Colt','Byers','P.O. Box 753, 5548 Dui. Avenue','2003-03-07',74547.17,'odio.auctor@vitaepurusgravida.net',6473688390,8),(7,'Ms.','Cara','Barrett','580-8657 Maecenas St.','2002-12-12',94699.33,'morbi@nonvestibulumnec.net',3066386791,10),(8,'Ms.','Quentin','Weber','5288 Integer Ave','2018-09-17',31402.82,'Integer@maurissapien.ca',7803230233,10),(9,'Mrs.','Bradley','Knox','8775 A Street','2009-07-20',52574.32,'semper.tellus.id@quisdiam.co.uk',8674043306,2),(10,'Mr.','Jada','Cook','9118 Vivamus St.','2011-08-20',61176.04,'Maecenas.ornare@Aliquamnec.co.uk',9051281800,3);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interest`
--

DROP TABLE IF EXISTS `Interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Interest` (
  `interest_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_account` varchar(45) NOT NULL,
  `percentage` decimal(3,2) NOT NULL,
  PRIMARY KEY (`interest_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interest`
--

LOCK TABLES `Interest` WRITE;
/*!40000 ALTER TABLE `Interest` DISABLE KEYS */;
INSERT INTO `Interest` VALUES (1,'Savings',0.02),(2,'Loans',0.12),(3,'Credit Card',0.10),(4,'Credit Card',0.06),(5,'Credit Card',0.40);
/*!40000 ALTER TABLE `Interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Liability`
--

DROP TABLE IF EXISTS `Liability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Liability` (
  `liability_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `credit_limit` decimal(10,2) NOT NULL DEFAULT '1500.00',
  `client_id` int(11) NOT NULL,
  `interest_rate_id` int(11) NOT NULL,
  PRIMARY KEY (`liability_id`),
  KEY `credit_card_client_client_id_fk` (`client_id`),
  KEY `credit_card_interest_rate_interest_rate_id_fk` (`interest_rate_id`),
  CONSTRAINT `credit_card_client_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_card_interest_rate_interest_rate_id_fk` FOREIGN KEY (`interest_rate_id`) REFERENCES `Interest` (`interest_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Liability`
--

LOCK TABLES `Liability` WRITE;
/*!40000 ALTER TABLE `Liability` DISABLE KEYS */;
INSERT INTO `Liability` VALUES (1,'Credit Card',2073.06,1,3),(2,'Line Of Credit',1801.40,2,3),(3,'Credit Card',5506.07,3,4),(4,'Credit Card',9875.09,4,2),(5,'Line Of Credit',2690.98,5,4),(6,'Credit Card',2413.53,6,1),(7,'Line Of Credit',8233.05,7,5),(8,'Line Of Credit',25000.00,8,1),(9,'Credit Card',3427.43,9,1),(10,'Line Of Credit',5232.90,10,4);
/*!40000 ALTER TABLE `Liability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `web_access` varchar(512) DEFAULT NULL,
  `phone_access` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `service_employee_employee_id_fk` (`manager_id`),
  CONSTRAINT `service_employee_employee_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `Employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (1,'Banking',2,'comp353bank.com/banking',NULL),(2,'Insurance',3,'comp353bank.com/insurance',NULL),(3,'Investment',4,'comp353bank.com/investment',NULL);
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

CREATE SCHEMA IF NOT EXISTS `kec353_2` DEFAULT CHARACTER SET latin1 ;
USE `kec353_2` ;


DROP TABLE IF EXISTS `kec353_2`.`transaction`;
-- -----------------------------------------------------
-- Table `kec353_2`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kec353_2`.`transaction` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `transaction_client_id_fk`
    FOREIGN KEY (`client_id`)
    REFERENCES `kec353_2`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `kec353_2`.`transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `kec353_2`;
INSERT INTO `kec353_2`.`transaction` (`transaction_id`, `client_id`, `type`, `amount`) VALUES (1, 1, 'deposit', 100.2);
INSERT INTO `kec353_2`.`transaction` (`transaction_id`, `client_id`, `type`, `amount`) VALUES (2, 3, 'transfer', 87.9);
INSERT INTO `kec353_2`.`transaction` (`transaction_id`, `client_id`, `type`, `amount`) VALUES (3, 4, 'bill payment', 89.99);
INSERT INTO `kec353_2`.`transaction` (`transaction_id`, `client_id`, `type`, `amount`) VALUES (4, 9, 'withdraw', 60);

COMMIT;


DROP TABLE IF EXISTS `kec353_2`.`location`;
-- -----------------------------------------------------
-- Table `kec353_2`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kec353_2`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `provence` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `kec353_2`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `kec353_2`;
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (1, 'Quebec', 'Montreal');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (2, 'Ontario', 'Toronto');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (3, 'British Columbia', 'Vancouver');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (4, 'Ontario', 'Niagara Falls');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (5, 'British Columbia', 'Victoria');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (6, 'Nova Scotia', 'Halifax');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (7, 'Quebec', 'Quebec City');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (8, 'Alberta', 'Calgary');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (9, 'Ontario', 'Ottawa');
INSERT INTO `kec353_2`.`location` (`location_id`, `provence`, `city`) VALUES (10, 'Alberta', 'Edmonton');

COMMIT;



DROP TABLE IF EXISTS `kec353_2`.`personnel_off_duty`;
-- -----------------------------------------------------
-- Table `kec353_2`.`personnel_off_duty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kec353_2`.`personnel_off_duty` (
  `off_duty_id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `reason` VARCHAR(45) NULL,
  PRIMARY KEY (`off_duty_id`),
  CONSTRAINT `personnel_off_duty_employee_id_fk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `kec353_2`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `kec353_2`.`personnel_off_duty`
-- -----------------------------------------------------
START TRANSACTION;
USE `kec353_2`;
INSERT INTO `kec353_2`.`personnel_off_duty` (`employee_id`, `start_date`, `end_date`, `reason`) VALUES (1, '2018-11-12', '2018-11-12', 'sick');
INSERT INTO `kec353_2`.`personnel_off_duty` (`employee_id`, `start_date`, `end_date`, `reason`) VALUES (3, '2018-10-12', '2018-10-26', 'vacation');
INSERT INTO `kec353_2`.`personnel_off_duty` (`employee_id`, `start_date`, `end_date`, `reason`) VALUES (5, '2018-11-12', '2018-11-12', 'sick');
INSERT INTO `kec353_2`.`personnel_off_duty` (`employee_id`, `start_date`, `end_date`, `reason`) VALUES (2, '2018-08-08', '2018-09-09', 'emergency');
INSERT INTO `kec353_2`.`personnel_off_duty` (`employee_id`, `start_date`, `end_date`, `reason`) VALUES (4, '2018-01-02', '2018-01-02', 'sick');

COMMIT;



DROP TABLE IF EXISTS `kec353_2`.`payroll`;
-- -----------------------------------------------------
-- Table `kec353_2`.`payroll`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kec353_2`.`payroll` (
  `payroll_payment_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`payroll_payment_id`),
  CONSTRAINT `payroll_employee_id_fk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `kec353_2`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `kec353_2`.`payroll`
-- -----------------------------------------------------
START TRANSACTION;
USE `kec353_2`;
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (1, 1, '2018-11-01', 89.98);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (2, 2, '2018-11-01', 350.89);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (3, 3, '2018-11-01', 1078.9);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (4, 4, '2018-11-01', 789.9);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (5, 5, '2018-11-01', 123.9);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (6, 6, '2018-11-01', 658.2);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (7, 7, '2018-11-01', 89.99);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (8, 8, '2018-11-01', 78.98);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (9, 9, '2018-11-01', 123.9);
INSERT INTO `kec353_2`.`payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES (10, 10, '2018-11-01', 234.9);

COMMIT;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-09 15:40:39
