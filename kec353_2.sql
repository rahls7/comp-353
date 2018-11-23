-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2018 at 09:33 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kec353_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` int(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `interest_rate_id` int(11) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `account_category` varchar(255) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `num_transactions` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_number`, `balance`, `interest_rate_id`, `account_type`, `account_category`, `client_id`, `num_transactions`) VALUES
(1, '4301.55', NULL, 'chequing', 'personal', 1, '50'),
(2, '35906.09', NULL, 'chequing', 'personal', 2, '50'),
(3, '40183.21', NULL, 'chequing', 'buisiness', 3, '50'),
(4, '15733.93', NULL, 'chequing', 'personal', 4, '50'),
(5, '1980.39', NULL, 'chequing', 'personal', 5, '50'),
(6, '9201.71', NULL, 'chequing', 'buisiness', 6, '90'),
(7, '38899.68', NULL, 'chequing', 'personal', 7, '50'),
(8, '2788.90', NULL, 'chequing', 'buisiness', 8, '56'),
(9, '6457.68', NULL, 'chequing', 'personal', 9, '45'),
(10, '633.03', NULL, 'chequing', 'buisiness', 10, '50'),
(11, '14397.14', 1, 'savings', 'personal', 1, '78'),
(12, '7566.03', 1, 'savings', 'personal', 2, '10'),
(13, '5412.96', 1, 'savings', 'personal', 3, '54'),
(14, '91756.09', 1, 'savings', 'buisiness', 4, '80'),
(15, '36673.54', 1, 'savings', 'personal', 5, '11'),
(16, '4588.53', 1, 'savings', 'personal', 6, '67'),
(17, '74.54', 1, 'savings', 'personal', 7, '32'),
(18, '382.94', 1, 'savings', 'personal', 8, '21'),
(19, '1000000.19', 1, 'savings', 'buisiness', 9, '78'),
(20, '46883.02', 1, 'savings', 'personal', 10, '9');

-- --------------------------------------------------------

--
-- Table structure for table `accountchargeplan`
--

CREATE TABLE `accountchargeplan` (
  `account_id` int(11) NOT NULL,
  `charge_plan_option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accountchargeplan`
--

INSERT INTO `accountchargeplan` (`account_id`, `charge_plan_option_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `phone` bigint(255) NOT NULL,
  `fax` bigint(255) NOT NULL,
  `opening_date` date NOT NULL,
  `manager_id` int(11) NOT NULL,
  `is_head_office` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `location`, `phone`, `fax`, `opening_date`, `manager_id`, `is_head_office`) VALUES
(1, 2, 3067369455, 2049649903, '2009-03-23', 5, 0),
(2, 4, 902528301, 7059408820, '2012-10-19', 4, 0),
(3, 6, 7788270286, 7059757036, '2005-09-17', 3, 0),
(4, 8, 7781746635, 7054132835, '2014-03-25', 2, 0),
(5, 9, 4389129100, 6042936296, '2007-12-31', 6, 0),
(6, 9, 5147671234, 5147582814, '2015-03-12', 7, 1),
(7, 10, 3433437896, 8079805758, '2018-06-23', 8, 0),
(8, 1, 2899479507, 5814909189, '2001-04-20', 9, 0),
(9, 2, 2059113287, 5061936812, '2004-03-17', 10, 0),
(10, 1, 8078773854, 7804300184, '2009-11-17', 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chargeplan`
--

CREATE TABLE `chargeplan` (
  `option_id` int(11) NOT NULL,
  `account_limit` varchar(45) NOT NULL,
  `charge` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chargeplan`
--

INSERT INTO `chargeplan` (`option_id`, `account_limit`, `charge`) VALUES
(1, '5213.62', '40381.89'),
(2, '4588.10', '12333.61'),
(3, '2252.37', '31804.08'),
(4, '7982.57', '51523.08'),
(5, '6854.69', '36424.16'),
(6, '6917.64', '20949.65'),
(7, '5653.65', '2094.51'),
(8, '7546.87', '1011.06'),
(9, '3959.83', '55367.78'),
(10, '2390.32', '96981.31'),
(11, '5213.62', '40381.89'),
(12, '4588.10', '12333.61'),
(13, '2252.37', '31804.08'),
(14, '7982.57', '51523.08'),
(15, '6854.69', '36424.16'),
(16, '6917.64', '20949.65'),
(17, '5653.65', '2094.51'),
(18, '7546.87', '1011.06'),
(19, '3959.83', '55367.78'),
(20, '2390.32', '96981.31');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
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
  `num_transaction` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `first_name`, `last_name`, `date_of_birth`, `join_date`, `address`, `email_address`, `phone_number`, `category`, `branch_id`, `card_number`, `password`, `num_transaction`) VALUES
(1, 'John', 'Doe', '1988-03-14', '2010-12-28', '1410 First St.', 'john.doe@myemail.ca', 6049173416, 'personal', 9, 3088232759541699, 'HSUF5KuY', 0),
(2, 'Roberto', 'Martinez', '1999-01-21', '2015-10-28', '5358 Curabitur St.', 'roberto.martinez@hotmail.com', 6049173416, 'personal', 4, 3158327165548703, 'UnYFhaNr', 0),
(3, 'Steel', 'Dodson', '1974-01-21', '2018-12-28', '5358 Curabitur St.', 'posuere.cubilia.Curae@Integermollis.ca', 6049173416, 'business', 4, 3158143778648560, '9Yntkb5b', 0),
(4, 'Ingrid', 'Ramsey', '1998-06-16', '2017-11-18', '1448 Id Av.', 'lectus.rutrum@lacusMauris.net', 2895034697, 'personal', 5, 3112993260722488, 'bn0vBDbU', 0),
(5, 'Yvonne', 'Medina', '1956-04-24', '2018-09-09', '1742 Aliquet Av. Ap #468', 'nibh@Quisquepurus.org', 6471292698, 'corporate', 8, 3096977593570821, 'X3jRxpq7', 0),
(6, 'Cedric', 'Downs', '1993-03-02', '2018-03-02', '6887 In St.', 'ligula.Aliquam.erat@ridiculusmusProin.org', 571193, 'personal', 3, 3112549547776901, 'CVjivIXr', 0),
(7, 'Oscar', 'Collins', '1957-01-18', '2017-10-12', '929 Fringilla Av.', 'dolor.sit@ipsum.edu', 5066766020, 'personal', 2, 3528000456096913, 'bDXoSUU9', 0),
(8, 'Scott', 'Washington', '1989-01-20', '2018-08-06', '4358 Nulla St.', 'Pellentesque@senectuset.net', 5199605918, 'personal', 9, 3158919489446950, 'X3qcW2q3', 0),
(9, 'Vance', 'Knapp', '1981-04-04', '2017-12-06', '1793 Sed Rd.', 'Pellentesque@auctorveliteget.edu', 9027169325, 'business', 2, 3337581958558147, 'XATbwYHm', 0),
(10, 'Garrison', 'Hutchinson', '1977-05-08', '2018-05-13', '5933 Eu Ave', 'convallis@velvulputateeu.ca', 7781159114, 'corporate', 7, 3088732316695151, 'W1tP3kAV', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT 'associate',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(80) NOT NULL,
  `start_date` date NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `email_address` varchar(45) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `title`, `first_name`, `last_name`, `address`, `start_date`, `salary`, `email_address`, `phone_number`, `branch_id`) VALUES
(1, 'Ms.', 'Odysseus', 'Riddle', '5485 Malesuada St.', '2010-08-29', '79601.69', 'nulla@iaculis.co.uk', 7781181412, 10),
(2, 'Mrs.', 'Dean', 'Key', '6603 Erat Ave', '2007-05-14', '3247.76', 'eu.euismod@ametrisus.edu', 5878973327, 3),
(3, 'Dr.', 'Thomas', 'Contreras', '3467 Dictum Avenue', '2002-07-18', '49346.89', 'erat.semper@tellus.ca', 5196986386, 3),
(4, 'Mr.', 'Amber', 'Casey', '6908 Aliquam Rd.', '2018-06-26', '80115.29', 'netus@tempor.edu', 5795737997, 7),
(5, 'Mrs.', 'Bruno', 'Flores', '1158 Pede. Ave', '2013-10-14', '68282.13', 'eu.elit.Nulla@Quisque.com', 3657191432, 9),
(6, 'Ms.', 'Colt', 'Byers', 'P.O. Box 753, 5548 Dui. Avenue', '2003-03-07', '74547.17', 'odio.auctor@vitaepurusgravida.net', 6473688390, 8),
(7, 'Ms.', 'Cara', 'Barrett', '580-8657 Maecenas St.', '2002-12-12', '94699.33', 'morbi@nonvestibulumnec.net', 3066386791, 10),
(8, 'Ms.', 'Quentin', 'Weber', '5288 Integer Ave', '2018-09-17', '31402.82', 'Integer@maurissapien.ca', 7803230233, 10),
(9, 'Mrs.', 'Bradley', 'Knox', '8775 A Street', '2009-07-20', '52574.32', 'semper.tellus.id@quisdiam.co.uk', 8674043306, 2),
(10, 'Mr.', 'Jada', 'Cook', '9118 Vivamus St.', '2011-08-20', '61176.04', 'Maecenas.ornare@Aliquamnec.co.uk', 9051281800, 3);

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `interest_rate_id` int(11) NOT NULL,
  `type_of_account` varchar(45) NOT NULL,
  `percentage` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`interest_rate_id`, `type_of_account`, `percentage`) VALUES
(1, 'Savings', '0.02'),
(2, 'Loans', '0.12'),
(3, 'Credit Card', '0.10'),
(4, 'Credit Card', '0.06'),
(5, 'Credit Card', '0.40');

-- --------------------------------------------------------

--
-- Table structure for table `liability`
--

CREATE TABLE `liability` (
  `liability_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `credit_limit` decimal(10,2) NOT NULL DEFAULT '1500.00',
  `client_id` int(11) NOT NULL,
  `interest_rate_id` int(11) NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `liability`
--

INSERT INTO `liability` (`liability_id`, `type`, `credit_limit`, `client_id`, `interest_rate_id`, `balance`) VALUES
(1, 'Credit Card', '2073.06', 1, 3, '0.00'),
(2, 'Line Of Credit', '1801.40', 2, 3, '0.00'),
(3, 'Credit Card', '5506.07', 3, 4, '0.00'),
(4, 'Credit Card', '9875.09', 4, 2, '0.00'),
(5, 'Line Of Credit', '2690.98', 5, 4, '0.00'),
(6, 'Credit Card', '2413.53', 6, 1, '0.00'),
(7, 'Line Of Credit', '8233.05', 7, 5, '0.00'),
(8, 'Line Of Credit', '25000.00', 8, 1, '0.00'),
(9, 'Credit Card', '3427.43', 9, 1, '0.00'),
(10, 'Line Of Credit', '5232.90', 10, 4, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `provence` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `provence`, `city`) VALUES
(1, 'Quebec', 'Montreal'),
(2, 'Ontario', 'Toronto'),
(3, 'British Columbia', 'Vancouver'),
(4, 'Ontario', 'Niagara Falls'),
(5, 'British Columbia', 'Victoria'),
(6, 'Nova Scotia', 'Halifax'),
(7, 'Quebec', 'Quebec City'),
(8, 'Alberta', 'Calgary'),
(9, 'Ontario', 'Ottawa'),
(10, 'Alberta', 'Edmonton');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `payroll_payment_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`payroll_payment_id`, `employee_id`, `date`, `amount`) VALUES
(1, 1, '2018-11-01', '89.98'),
(2, 2, '2018-11-01', '350.89'),
(3, 3, '2018-11-01', '1078.90'),
(4, 4, '2018-11-01', '789.90'),
(5, 5, '2018-11-01', '123.90'),
(6, 6, '2018-11-01', '658.20'),
(7, 7, '2018-11-01', '89.99'),
(8, 8, '2018-11-01', '78.98'),
(9, 9, '2018-11-01', '123.90'),
(10, 10, '2018-11-01', '234.90');

-- --------------------------------------------------------

--
-- Table structure for table `personnel_off_duty`
--

CREATE TABLE `personnel_off_duty` (
  `off_duty_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personnel_off_duty`
--

INSERT INTO `personnel_off_duty` (`off_duty_id`, `employee_id`, `start_date`, `end_date`, `reason`) VALUES
(6, 1, '2018-11-12', '2018-11-12', 'sick'),
(7, 3, '2018-10-12', '2018-10-26', 'vacation'),
(8, 5, '2018-11-12', '2018-11-12', 'sick'),
(9, 2, '2018-08-08', '2018-09-09', 'emergency'),
(10, 4, '2018-01-02', '2018-01-02', 'sick');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `web_access` varchar(512) DEFAULT NULL,
  `phone_access` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `type`, `manager_id`, `web_access`, `phone_access`) VALUES
(1, 'Banking', 2, 'comp353bank.com/banking', NULL),
(2, 'Insurance', 3, 'comp353bank.com/insurance', NULL),
(3, 'Investment', 4, 'comp353bank.com/investment', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `account_id`, `type`, `amount`, `date`) VALUES
(1, 1, 'deposit', '100.20', '2018-01-11'),
(2, 3, 'transfer', '87.90', '2018-01-11'),
(3, 4, 'bill payment', '89.99', '2018-01-11'),
(4, 9, 'withdraw', '60.00', '2018-01-11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_number`),
  ADD KEY `savings_account_client_client_id_fk` (`client_id`),
  ADD KEY `savings_account_interest_interest_rate_id_fk` (`interest_rate_id`);

--
-- Indexes for table `accountchargeplan`
--
ALTER TABLE `accountchargeplan`
  ADD PRIMARY KEY (`account_id`,`charge_plan_option_id`),
  ADD KEY `account_charge_plan_charge_plan_option_id_fk` (`charge_plan_option_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `branch_id_location` (`location`);

--
-- Indexes for table `chargeplan`
--
ALTER TABLE `chargeplan`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `client_branch_branch_id_fk` (`branch_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `employee_branch_branch_id_fk` (`branch_id`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`interest_rate_id`);

--
-- Indexes for table `liability`
--
ALTER TABLE `liability`
  ADD PRIMARY KEY (`liability_id`),
  ADD KEY `credit_card_client_client_id_fk` (`client_id`),
  ADD KEY `credit_card_interest_rate_interest_rate_id_fk` (`interest_rate_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`payroll_payment_id`),
  ADD KEY `payroll_employee_id_fk` (`employee_id`);

--
-- Indexes for table `personnel_off_duty`
--
ALTER TABLE `personnel_off_duty`
  ADD PRIMARY KEY (`off_duty_id`),
  ADD KEY `personnel_off_duty_employee_id_fk` (`employee_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `service_employee_employee_id_fk` (`manager_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_client_id_fk_idx` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `chargeplan`
--
ALTER TABLE `chargeplan`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `interest_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `liability`
--
ALTER TABLE `liability`
  MODIFY `liability_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `personnel_off_duty`
--
ALTER TABLE `personnel_off_duty`
  MODIFY `off_duty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `savings_account_client_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `savings_account_interest_interest_rate_id_fk` FOREIGN KEY (`interest_rate_id`) REFERENCES `interest` (`interest_rate_id`) ON UPDATE CASCADE;

--
-- Constraints for table `accountchargeplan`
--
ALTER TABLE `accountchargeplan`
  ADD CONSTRAINT `account_charge_plan_charge_plan_option_id_fk` FOREIGN KEY (`charge_plan_option_id`) REFERENCES `chargeplan` (`option_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `account_charge_plan_client_client_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_number`) ON UPDATE CASCADE;

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_id_location` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_branch_branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_branch_branch_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `liability`
--
ALTER TABLE `liability`
  ADD CONSTRAINT `credit_card_client_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_card_interest_rate_interest_rate_id_fk` FOREIGN KEY (`interest_rate_id`) REFERENCES `interest` (`interest_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personnel_off_duty`
--
ALTER TABLE `personnel_off_duty`
  ADD CONSTRAINT `personnel_off_duty_employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_employee_employee_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_client_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_number`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
