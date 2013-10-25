-- MySQL dump 10.13  Distrib 5.5.33, for Linux (x86_64)
--
-- Host: localhost    Database: tf_framework
-- ------------------------------------------------------
-- Server version	5.5.33-cll-lve

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
-- Table structure for table `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl` (
  `aclID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aclGroupID` int(11) unsigned NOT NULL,
  `aclPermissionID` int(11) unsigned NOT NULL,
  `aclRoleID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`aclID`),
  UNIQUE KEY `acl` (`aclGroupID`,`aclPermissionID`,`aclRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
INSERT INTO `acl` (`aclID`, `aclGroupID`, `aclPermissionID`, `aclRoleID`) VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3),(4,1,1,4);
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aclGroups`
--

DROP TABLE IF EXISTS `aclGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclGroups` (
  `aclGroupID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aclGroupID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aclGroups`
--

LOCK TABLES `aclGroups` WRITE;
/*!40000 ALTER TABLE `aclGroups` DISABLE KEYS */;
INSERT INTO `aclGroups` (`aclGroupID`, `name`, `description`) VALUES (1,'Admin','ToyFoundry administrators'),(2,'Customer Support','Customer Support staff'),(3,'Client','Default Client permissions');
/*!40000 ALTER TABLE `aclGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aclPermissions`
--

DROP TABLE IF EXISTS `aclPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclPermissions` (
  `aclPermissionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aclPermissionID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aclPermissions`
--

LOCK TABLES `aclPermissions` WRITE;
/*!40000 ALTER TABLE `aclPermissions` DISABLE KEYS */;
INSERT INTO `aclPermissions` (`aclPermissionID`, `name`, `description`) VALUES (1,'create','Create/Add'),(2,'read','Read and view data'),(3,'update','Update and edit'),(4,'delete','Delete and remove'),(5,'view','View analytics and statistics');
/*!40000 ALTER TABLE `aclPermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aclRoles`
--

DROP TABLE IF EXISTS `aclRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aclRoles` (
  `aclRoleID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aclRoleID`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aclRoles`
--

LOCK TABLES `aclRoles` WRITE;
/*!40000 ALTER TABLE `aclRoles` DISABLE KEYS */;
INSERT INTO `aclRoles` (`aclRoleID`, `role`, `description`) VALUES (1,'agencies',NULL),(2,'alerts',NULL),(3,'clients',NULL),(6,'acl',NULL),(7,'customerAddresses',NULL),(10,'customers',NULL),(11,'emailQueue',NULL),(12,'invoices',NULL),(13,'orderAddresses',NULL),(14,'orderItems',NULL),(17,'orders',NULL),(19,'productRanges',NULL),(21,'products',NULL),(22,'refunds',NULL),(23,'roles',NULL),(24,'tagLocations',NULL),(25,'tagScans',NULL),(26,'tags',NULL),(27,'tmp',NULL),(28,'transactionLogs',NULL),(29,'users',NULL),(30,'dashboard',NULL),(31,'promotions',NULL),(32,'promotionRules',NULL),(33,'promotionRulesMeta',NULL),(34,'admin','All Administrator level operatons'),(35,'tagManufacturing',NULL);
/*!40000 ALTER TABLE `aclRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencies` (
  `agencyID` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(80) NOT NULL,
  `contactName` varchar(80) NOT NULL,
  `contactPhone` varchar(80) DEFAULT NULL,
  `contactEmail` varchar(80) NOT NULL,
  `notes` text,
  `status` enum('pending','active','disabled') NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`agencyID`),
  UNIQUE KEY `companyName_2` (`companyName`),
  KEY `companyName` (`companyName`,`contactEmail`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` (`agencyID`, `companyName`, `contactName`, `contactPhone`, `contactEmail`, `notes`, `status`, `created`, `modified`) VALUES (1,'ToyFoundry Pty Ltd ','Mark Verstege',NULL,'mark.verstege@gmail.com',NULL,'active','2011-07-16 09:58:39','2011-07-16 09:58:39');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertID` int(11) NOT NULL AUTO_INCREMENT,
  `level` enum('notice','warning','error') NOT NULL,
  `subject` varchar(255) NOT NULL,
  `details` mediumtext,
  `reference` mediumtext,
  `timestamp` int(15) NOT NULL,
  PRIMARY KEY (`alertID`),
  KEY `level` (`level`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=150715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;

INSERT INTO `alerts` (`alertID`, `level`, `subject`, `details`, `reference`, `timestamp`) VALUES (18455,'notice','Incoming API Request','POST Vars: array (\n  \'t\' => \'getShippingRates\',\n  \'clientID\' => \'2\',\n  \'apiKey\' => \'4E49503E23D4A2.31115183\',\n  \'confirmationHash\' => \'true\',\n  \'customer\' => \n  array (\n    \'email\' => \'simon.yorkston@gmail.com\',\n  ),\n  \'items\' => \n  array (\n    0 => \n    array (\n      \'productID\' => \'1\',\n      \'quantity\' => \'1\',\n    ),\n  ),\n  \'currency\' => \'EUR\',\n)GET Vars: array (\n)','173.246.35.214',1380781741),( 18456,'notice','Incoming API Request','POST Vars: array (\n  \'t\' => \'getShippingRates\',\n  \'clientID\' => \'2\',\n  \'apiKey\' => \'4E49503E23D4A2.31115183\',\n  \'confirmationHash\' => \'true\',\n  \'customer\' => \n  array (\n    \'email\' => \'simon.yorkston@gmail.com\',\n  ),\n  \'items\' => \n  array (\n    0 => \n    array (\n      \'productID\' => \'1\',\n      \'quantity\' => \'1\',\n    ),\n  ),\n  \'currency\' => \'EUR\',\n)GET Vars: array (\n)','173.246.35.211',1380789901),( 20456,'notice','Incoming API Request','POST Vars: array (\n  \'t\' => \'getShippingRates\',\n  \'clientID\' => \'2\',\n  \'apiKey\' => \'4E49503E23D4A2.31115183\',\n  \'confirmationHash\' => \'true\',\n  \'customer\' => \n  array (\n    \'email\' => \'simon.yorkston@gmail.com\',\n  ),\n  \'items\' => \n  array (\n    0 => \n    array (\n      \'productID\' => \'1\',\n      \'quantity\' => \'1\',\n    ),\n  ),\n  \'currency\' => \'EUR\',\n)GET Vars: array (\n)','173.246.35.214',1380805261);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerActiveCurrencies`
--

DROP TABLE IF EXISTS `billerActiveCurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerActiveCurrencies` (
  `billerActiveCurrencyID` int(11) NOT NULL AUTO_INCREMENT,
  `billerID` int(11) NOT NULL,
  `currencyID` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billerActiveCurrencyID`),
  UNIQUE KEY `billerID` (`billerID`,`currencyID`),
  KEY `default` (`default`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerActiveCurrencies`
--

LOCK TABLES `billerActiveCurrencies` WRITE;
/*!40000 ALTER TABLE `billerActiveCurrencies` DISABLE KEYS */;
INSERT INTO `billerActiveCurrencies` (`billerActiveCurrencyID`, `billerID`, `currencyID`, `default`) VALUES (1,1,1,1),(6,3,1,0),(7,3,2,1),(8,3,3,0),(9,3,5,0),(10,3,6,0),(11,4,7,1),(12,3,7,0),(13,5,1,0),(14,5,2,1),(15,5,3,0),(16,5,5,0),(17,5,6,0);
/*!40000 ALTER TABLE `billerActiveCurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerCardTypes`
--

DROP TABLE IF EXISTS `billerCardTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerCardTypes` (
  `billerCardTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `cardType` varchar(5) NOT NULL,
  PRIMARY KEY (`billerCardTypeID`),
  UNIQUE KEY `cardType` (`cardType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerCardTypes`
--

LOCK TABLES `billerCardTypes` WRITE;
/*!40000 ALTER TABLE `billerCardTypes` DISABLE KEYS */;
INSERT INTO `billerCardTypes` (`billerCardTypeID`, `cardType`) VALUES (2,'MC'),(1,'VISA');
/*!40000 ALTER TABLE `billerCardTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerCards`
--

DROP TABLE IF EXISTS `billerCards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerCards` (
  `billerCardID` int(11) NOT NULL AUTO_INCREMENT,
  `billerID` int(11) NOT NULL,
  `billerCardTypeID` int(11) NOT NULL,
  PRIMARY KEY (`billerCardID`),
  UNIQUE KEY `billerID` (`billerID`,`billerCardTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerCards`
--

LOCK TABLES `billerCards` WRITE;
/*!40000 ALTER TABLE `billerCards` DISABLE KEYS */;
/*!40000 ALTER TABLE `billerCards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerCosts`
--

DROP TABLE IF EXISTS `billerCosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerCosts` (
  `billerCostID` int(11) NOT NULL AUTO_INCREMENT,
  `billerID` int(11) NOT NULL,
  `costPerTransaction` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percentagePerTransaction` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`billerCostID`),
  UNIQUE KEY `billerID` (`billerID`),
  KEY `costPerTransaction` (`costPerTransaction`,`percentagePerTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerCosts`
--

LOCK TABLES `billerCosts` WRITE;
/*!40000 ALTER TABLE `billerCosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `billerCosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerCurrencies`
--

DROP TABLE IF EXISTS `billerCurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerCurrencies` (
  `billerCurrencyID` int(11) NOT NULL AUTO_INCREMENT,
  `currency` char(3) NOT NULL,
  `symbol` char(5) DEFAULT NULL,
  PRIMARY KEY (`billerCurrencyID`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerCurrencies`
--

LOCK TABLES `billerCurrencies` WRITE;
/*!40000 ALTER TABLE `billerCurrencies` DISABLE KEYS */;
INSERT INTO `billerCurrencies` (`billerCurrencyID`, `currency`, `symbol`) VALUES (1,'AUD','$'),(2,'USD','$'),(3,'EUR','€'),(5,'GBP','£'),(6,'HKD','$HKD'),(7,'CNY','CN¥');
/*!40000 ALTER TABLE `billerCurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerCurrencyRates`
--

DROP TABLE IF EXISTS `billerCurrencyRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerCurrencyRates` (
  `billerCurrencyRateID` int(11) NOT NULL AUTO_INCREMENT,
  `billerCurrencyID` int(11) NOT NULL,
  `rate` decimal(8,3) NOT NULL,
  PRIMARY KEY (`billerCurrencyRateID`),
  KEY `currencyID` (`billerCurrencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerCurrencyRates`
--

LOCK TABLES `billerCurrencyRates` WRITE;
/*!40000 ALTER TABLE `billerCurrencyRates` DISABLE KEYS */;
INSERT INTO `billerCurrencyRates` (`billerCurrencyRateID`, `billerCurrencyID`, `rate`) VALUES (1,1,1.032),(2,2,1.000),(3,3,1.307),(4,6,0.128),(5,5,1.570),(6,7,0.159);
/*!40000 ALTER TABLE `billerCurrencyRates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerPaymentDetails`
--

DROP TABLE IF EXISTS `billerPaymentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerPaymentDetails` (
  `billerPaymentDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) DEFAULT NULL,
  `cardNumber` bigint(20) NOT NULL,
  `cardExpiryMonth` int(2) NOT NULL,
  `cardExpiryYear` int(2) NOT NULL,
  `cardCVV` int(4) DEFAULT NULL,
  `cardType` int(11) NOT NULL,
  `storedBillerID` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`billerPaymentDetailID`),
  KEY `cardNumber` (`cardNumber`,`cardExpiryMonth`,`cardType`,`active`),
  KEY `cardExpiryYear` (`cardExpiryYear`),
  KEY `storedBillerID` (`storedBillerID`)
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerPaymentDetails`
--

LOCK TABLES `billerPaymentDetails` WRITE;
/*!40000 ALTER TABLE `billerPaymentDetails` DISABLE KEYS */;
INSERT INTO `billerPaymentDetails` (`billerPaymentDetailID`, `customerID`, `cardNumber`, `cardExpiryMonth`, `cardExpiryYear`, `cardCVV`, `cardType`, `storedBillerID`, `active`) VALUES ( 1,6,4111111111111111,7,15,0,1,0,0),( 2,1186,4111111111111111,12,15,0,1,0,1),( 3,1219,4111111111111111,1,13,0,1,0,1),( 8,1387,4495015002093229,5,13,0,1,0,1),( 9,6,4111111111111111,5,15,0,1,0,0),( 10,1447,5411210163923003,2,13,0,2,0,1),( 878,44098,5537131315198824,9,16,0,2,0,0),( 879,32555,5291151840260218,2,17,0,2,0,1),( 880,5408,4388540031565095,7,15,0,1,0,1);
/*!40000 ALTER TABLE `billerPaymentDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerStoredDetails`
--

DROP TABLE IF EXISTS `billerStoredDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerStoredDetails` (
  `billerStoredDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `billerID` int(11) NOT NULL,
  `billerPaymentDetailID` int(11) NOT NULL,
  `referenceID` varchar(255) NOT NULL,
  `failCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billerStoredDetailID`),
  UNIQUE KEY `billerPaymentDetailID` (`billerPaymentDetailID`),
  KEY `referenceID` (`referenceID`),
  KEY `failCount` (`failCount`),
  KEY `billerID` (`billerID`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerStoredDetails`
--

LOCK TABLES `billerStoredDetails` WRITE;
/*!40000 ALTER TABLE `billerStoredDetails` DISABLE KEYS */;
INSERT INTO `billerStoredDetails` (`billerStoredDetailID`, `billerID`, `billerPaymentDetailID`, `referenceID`, `failCount`) VALUES (1,3,5,'3537867086600176056694',0),( 2,3,6,'3538103542540176056452',0),( 3,3,7,'3538515378360176056694',0),( 4,3,10,'3539974470900176056440',0),( 5,3,11,'3541145973350176056693',0),( 6,3,12,'3541669662240176056452',0),( 7,3,13,'3542320896540176056425',0),( 8,3,14,'3542496990270176056694',0),( 10,3,16,'3543231968900176056438',0),( 11,3,17,'3543642013310176056696',0),( 12,3,20,'3544651737700176056454',0),( 13,3,22,'3545151999250176056424',0),(493,3,879,'3820507242810176056439',0),( 494,3,880,'3820729137870176056697',0);
/*!40000 ALTER TABLE `billerStoredDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerTransactionRequests`
--

DROP TABLE IF EXISTS `billerTransactionRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerTransactionRequests` (
  `billerTransactionRequestID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `requestID` varchar(50) NOT NULL,
  `customerAddressID` int(11) NOT NULL,
  `billerPaymentDetailID` int(11) DEFAULT NULL,
  `clientReferenceID` varchar(60) DEFAULT NULL,
  `type` set('AUTH','CAPTURE','PURCHASE','REFUND','CHARGEBACK') NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `billerCurrencyID` int(11) NOT NULL,
  `orderID` int(11) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`billerTransactionRequestID`),
  UNIQUE KEY `billerTransactionRequestID` (`billerTransactionRequestID`,`requestID`),
  KEY `clientID` (`clientID`,`customerID`,`customerAddressID`,`billerPaymentDetailID`,`clientReferenceID`,`type`),
  KEY `timestamp` (`timestamp`),
  KEY `amount` (`amount`,`billerCurrencyID`),
  KEY `orderID` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=246582 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerTransactionRequests`
--

LOCK TABLES `billerTransactionRequests` WRITE;
/*!40000 ALTER TABLE `billerTransactionRequests` DISABLE KEYS */;
INSERT INTO `billerTransactionRequests` (`billerTransactionRequestID`, `clientID`, `customerID`, `requestID`, `customerAddressID`, `billerPaymentDetailID`, `clientReferenceID`, `type`, `amount`, `billerCurrencyID`, `orderID`, `timestamp`) VALUES (1,2,2,'2rU9a26g',2,0,'','AUTH',0.10,2,0,1353783805),( 2,2,3,'2B59a26P',3,0,'','AUTH',65.47,2,0,1353783806),( 3,2,6,'2Wo9a26Q',6,0,'','PURCHASE',50.03,2,0,1353783807),( 4,2,7,'3k69a261',7,0,'','PURCHASE',20.87,2,0,1353783807),( 5,2,8,'3Gh9a26S',8,0,'','PURCHASE',36.16,2,0,1353783808),( 6,2,9,'46H9a26r',9,0,'','PURCHASE',20.87,2,0,1353783809),( 72661,2,9811,'h60y9dE9L',5550,0,'','PURCHASE',9999.99,2,0,1362396542),( 72662,2,9811,'fThm9dEkd',5550,0,'','PURCHASE',3175.43,2,0,1362403382);
/*!40000 ALTER TABLE `billerTransactionRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billerTransactions`
--

DROP TABLE IF EXISTS `billerTransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billerTransactions` (
  `billerTransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `requestID` int(11) NOT NULL,
  `billerID` int(11) NOT NULL,
  `uniqueID` varchar(50) NOT NULL,
  `billerReferenceID` varchar(255) DEFAULT NULL,
  `billerCurrencyID` int(11) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `status` enum('PENDING','PROCESSING','APPROVED','DECLINED','FAILED') NOT NULL,
  `details` text,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`billerTransactionID`),
  KEY `billerID` (`billerID`,`billerCurrencyID`,`amount`,`status`,`timestamp`),
  KEY `billerReferenceID` (`billerReferenceID`),
  KEY `internalReference` (`uniqueID`),
  KEY `requestID` (`requestID`)
) ENGINE=InnoDB AUTO_INCREMENT=247137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billerTransactions`
--

LOCK TABLES `billerTransactions` WRITE;
/*!40000 ALTER TABLE `billerTransactions` DISABLE KEYS */;
INSERT INTO `billerTransactions` (`billerTransactionID`, `requestID`, `billerID`, `uniqueID`, `billerReferenceID`, `billerCurrencyID`, `amount`, `status`, `details`, `timestamp`) VALUES (1,1,5,'2lp9a26R','13M94615U9544530U',2,0.10,'APPROVED','',1353783805),( 2,2,3,'2Vy9a26G','3206249525140176056428',2,65.47,'APPROVED','',1353783806),( 3,3,1,'2WX9a26h','',2,50.03,'APPROVED','',1353783807),( 4,4,1,'3Bv9a26G','',2,20.87,'APPROVED','',1353783808),( 5,5,5,'3oR9a26F','6U42140321690345H',2,36.16,'APPROVED','',1353783808),( 6,6,5,'44m9a26A','28379997FM323051F',2,20.87,'APPROVED','',1353783809),( 72597,72334,5,'j0K09dEcs','',2,9999.99,'PROCESSING','',1362398462);
/*!40000 ALTER TABLE `billerTransactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billers`
--

DROP TABLE IF EXISTS `billers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billers` (
  `billerID` int(11) NOT NULL AUTO_INCREMENT,
  `billerName` varchar(50) NOT NULL,
  `billerDescription` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `priority` tinyint(4) NOT NULL,
  `canConvert` tinyint(1) NOT NULL DEFAULT '1',
  `gateway` tinyint(1) NOT NULL,
  `canStore` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billerID`),
  UNIQUE KEY `billerName` (`billerName`,`priority`),
  KEY `active` (`active`,`canConvert`),
  KEY `gateway` (`gateway`),
  KEY `canStore` (`canStore`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billers`
--

LOCK TABLES `billers` WRITE;
/*!40000 ALTER TABLE `billers` DISABLE KEYS */;
INSERT INTO `billers` (`billerID`, `billerName`, `billerDescription`, `active`, `priority`, `canConvert`, `gateway`, `canStore`) VALUES (1,'Westpac','Westpac AUD Merchant Account',1,2,1,1,0),(3,'Cybersource','Multicurrency account',1,1,1,1,1),(4,'PayEase','Payease (Chinese bank)',1,3,0,0,0),(5,'PayPal','Pay with PayPal',1,4,1,0,0);
/*!40000 ALTER TABLE `billers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `clientID` int(11) NOT NULL AUTO_INCREMENT,
  `agencyID` int(11) NOT NULL,
  `companyName` varchar(80) NOT NULL,
  `shortName` varchar(3) NOT NULL,
  `contactName` varchar(80) NOT NULL,
  `contactPhone` varchar(80) DEFAULT NULL,
  `contactEmail` varchar(80) NOT NULL,
  `APIKey` varchar(80) NOT NULL,
  `perItemCost` decimal(5,2) NOT NULL,
  `perItemPercentage` decimal(5,2) NOT NULL,
  `perMonthCost` decimal(5,2) NOT NULL,
  `status` enum('pending','active','disabled') NOT NULL,
  `timezone` varchar(80) NOT NULL DEFAULT 'Australia/Brisbane',
  `bitmap` int(11) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`clientID`),
  UNIQUE KEY `companyName` (`companyName`),
  KEY `agencyID` (`agencyID`,`contactEmail`,`APIKey`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`clientID`, `agencyID`, `companyName`, `shortName`, `contactName`, `contactPhone`, `contactEmail`, `APIKey`, `perItemCost`, `perItemPercentage`, `perMonthCost`, `status`, `timezone`, `bitmap`, `created`, `modified`) VALUES (1,1,'ToyFoundry Pty Ltd','TF','Mark Verstege',NULL,'mark.verstege@gmail.com','APIKey',0.00,0.00,0.00,'active','America/New_York',0,'2011-07-16 10:05:24','2011-08-23 16:47:58'),(2,1,'Halfbrick Studios Pty Ltd','HB','Shainiel Deo',NULL,'simon.yorkston@gmail.com','4E49503E23D4A2.31115183',0.00,0.00,0.00,'active','America/New_York',0,'2011-07-16 10:04:22','2012-09-24 21:47:48'),(4,1,'Halfbrick Pty Ltd (SANDBOX)','HBS','Shainiel Deo',NULL,'simon.yorkston@gmail.com','4E49503E23D4A2.31115183',0.00,0.00,0.00,'active','America/New_York',1,'2011-07-20 09:28:35','2011-08-23 16:47:58'),(5,1,'Rovio','RV','Rovio','Account','rovio@rovio.com','a360f22c9598f77a017c553fb01e2125',0.00,0.00,0.00,'active','Australia/Brisbane',0,'2012-10-05 06:27:06','2012-10-05 06:27:06');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customFieldBindings`
--

DROP TABLE IF EXISTS `customFieldBindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customFieldBindings` (
  `translationBindingID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customFieldID` int(11) NOT NULL,
  `table` varchar(80) NOT NULL DEFAULT '',
  `tableID` int(11) DEFAULT NULL,
  PRIMARY KEY (`translationBindingID`),
  KEY `type` (`customFieldID`,`table`,`tableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customFieldBindings`
--

LOCK TABLES `customFieldBindings` WRITE;
/*!40000 ALTER TABLE `customFieldBindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `customFieldBindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customFields`
--

DROP TABLE IF EXISTS `customFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customFields` (
  `customFieldID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(80) DEFAULT '',
  `clientID` int(11) NOT NULL,
  `table` varchar(64) DEFAULT NULL,
  `tableID` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customFieldID`),
  UNIQUE KEY `key` (`key`,`clientID`,`table`,`tableID`)
) ENGINE=InnoDB AUTO_INCREMENT=709 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customFields`
--

LOCK TABLES `customFields` WRITE;
/*!40000 ALTER TABLE `customFields` DISABLE KEYS */;
INSERT INTO `customFields` (`customFieldID`, `key`, `clientID`, `table`, `tableID`) VALUES (562,'about_order',2,NULL,0),( 533,'accept_terms',2,NULL,0),( 115,'use_saved_card',2,NULL,0),( 509,'zip_code',2,NULL,0);
/*!40000 ALTER TABLE `customFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerAddresses`
--

DROP TABLE IF EXISTS `customerAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerAddresses` (
  `customerAddressID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `firstName` varchar(80) NOT NULL,
  `lastName` varchar(80) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) DEFAULT NULL,
  `country` char(2) NOT NULL,
  `zip` varchar(15) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerAddressID`),
  KEY `customer` (`customerID`,`lastName`,`city`,`country`,`zip`)
) ENGINE=InnoDB AUTO_INCREMENT=13128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAddresses`
--

LOCK TABLES `customerAddresses` WRITE;
/*!40000 ALTER TABLE `customerAddresses` DISABLE KEYS */;
INSERT INTO `customerAddresses` (`customerAddressID`, `customerID`, `firstName`, `lastName`, `address1`, `address2`, `city`, `state`, `country`, `zip`, `phone`, `status`, `created`, `modified`) VALUES (1,1,'fic','salsa','melbourne','','victoria','salsa','AU','3000','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),( 2,2,'safii','salsa','Melbourne\nMelbourne','','Melbourne','Victoria','AU','3000','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),( 3,3,'Mark','Verstege','PO BOX 882','','Noosa Heads','Queensland','AU','4567','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),( 7090,15145,'pablo','blue','Trabuco Canyon, CA','g54⁵22555','Trabuco Canyon','CA','US','-54455778','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),( 7091,15158,'尐建','乂','FFF','ffcx1','c-fff','dccc','CN','52013','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `customerAddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerAuthentication`
--

DROP TABLE IF EXISTS `customerAuthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerAuthentication` (
  `customerAuthenticationID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`customerAuthenticationID`),
  UNIQUE KEY `customerID` (`customerID`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=7076 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAuthentication`
--

LOCK TABLES `customerAuthentication` WRITE;
/*!40000 ALTER TABLE `customerAuthentication` DISABLE KEYS */;
INSERT INTO `customerAuthentication` (`customerAuthenticationID`, `customerID`, `hash`) VALUES (1,1,'LEGACY'),( 2,2,'LEGACY'),( 3,3,'_9B..v21pbQ8WOuKzn8M'),( 4,4,'LEGACY'),( 5,5,'LEGACY'),( 6,6,'_9B..TB9cGAzC/HYEIkM'),( 7,7,'LEGACY'),( 7074,44257,'_9B..48liHrH7T.ADmbI'),( 7075,44270,'_9B..hPhDNxiLJCdy1jY');
/*!40000 ALTER TABLE `customerAuthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerBlacklists`
--

DROP TABLE IF EXISTS `customerBlacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerBlacklists` (
  `customerBlacklistID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `reason` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timedate` int(11) NOT NULL,
  PRIMARY KEY (`customerBlacklistID`),
  UNIQUE KEY `customerID` (`customerID`),
  KEY `timedate` (`timedate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerBlacklists`
--

LOCK TABLES `customerBlacklists` WRITE;
/*!40000 ALTER TABLE `customerBlacklists` DISABLE KEYS */;
INSERT INTO `customerBlacklists` (`customerBlacklistID`, `customerID`, `reason`, `timedate`) VALUES (1,2534,'Spamming of service',1355923902),(2,2642,'Fraudster (Indonesia)',1360131137);
/*!40000 ALTER TABLE `customerBlacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `firstName` varchar(80) DEFAULT NULL,
  `lastName` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `deviceID` varchar(150) DEFAULT NULL,
  `lang` char(2) NOT NULL DEFAULT 'en',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `clientID_2` (`clientID`,`email`),
  KEY `lastName` (`lastName`,`email`),
  KEY `deviceID` (`deviceID`),
  KEY `clientID` (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=44328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`customerID`, `clientID`, `firstName`, `lastName`, `email`, `deviceID`, `lang`, `created`, `modified`) VALUES (10197,2,'我妻','永望','k-poplove.song@i.softbank.jp','BRICKLET_CC7B22C95A75','en','2013-02-22 01:52:01','2013-02-22 02:10:54'),( 20349,2,'pedro ','lol','pipr_millos_muro@hotmail.com','','es','2013-05-10 00:59:47','2013-05-10 00:59:47');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailQueue`
--

DROP TABLE IF EXISTS `emailQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailQueue` (
  `emailQueueID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) DEFAULT NULL,
  `recipientName` varchar(255) NOT NULL,
  `recipientEmail` varchar(255) NOT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `subject` varchar(150) NOT NULL,
  `bodyHTML` mediumtext,
  `bodyText` mediumtext,
  `status` enum('pending','sent','failed') NOT NULL COMMENT 'pending',
  `timedate` int(15) NOT NULL,
  PRIMARY KEY (`emailQueueID`),
  KEY `recipientEmail` (`recipientEmail`,`status`),
  KEY `clientID` (`clientID`),
  KEY `replyTo` (`replyTo`)
) ENGINE=InnoDB AUTO_INCREMENT=5938 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailQueue`
--

LOCK TABLES `emailQueue` WRITE;
/*!40000 ALTER TABLE `emailQueue` DISABLE KEYS */;
INSERT INTO `emailQueue` (`emailQueueID`, `clientID`, `recipientName`, `recipientEmail`, `replyTo`, `subject`, `bodyHTML`, `bodyText`, `status`, `timedate`) VALUES (16,2,'Louboutin Outlet','support@toyfoundry.com','uxrvjdgcvkuisrekvuhxnrpggpvvwrhfjlnfsmnmxczeuyauihczjhcbzyssijipgti@gmail.com','[Halfbrick Studios Pty Ltd] Incoming support request','\n	Dear Support, <br />\n	A user on the site has made a support request. The information we have about them is as follows: <br />\n	<br />\n	Name: Louboutin Outlet<br />\n	Email: uxrvjdgcvkuisrekvuhxnrpggpvvwrhfjlnfsmnmxczeuyauihczjhcbzyssijipgti@gmail.com<br />\n	Question: as i know there are lots of Luboutin Outlet online, and i will buy it from there.\r\nLouboutin Outlet http://sepamujer.org/<br />\n	Existing Customer? No (or not logged in)<br />\n	<br />','\n	Dear Support,\n	A user on the site has made a support request. The information we have about them is as follows:\n	\n	Name: Louboutin Outlet\n	Email: uxrvjdgcvkuisrekvuhxnrpggpvvwrhfjlnfsmnmxczeuyauihczjhcbzyssijipgti@gmail.com\n	Question: as i know there are lots of Luboutin Outlet online, and i will buy it from there.\r\nLouboutin Outlet http://sepamujer.org/\n	Existing Customer? No (or not logged in)\n	\n	ToyFoundry for Halfbrick Studios Pty Ltd','pending',1380564714),( 2666,2,' ','lucas.felipe321@hotmail.com-','','Finalizar agora!','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" 			 \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n                                    <html lang=\"en\">\n                                    <head>\n                                    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n                                    <title>Order Payment Reminder</title>\n                                    <style type=\"text/css\">\n                                    body {\n                                        background: #211409;\n                                        color:#f4cb98;\n                                    }\n                                    body, td, p {\n                                        font:14px/1.35em Arial, Helvetica, sans-serif;\n                                    }\n                                    td {\n                                        padding: 0;\n                                        border: 0;\n                                        margin: 0;\n                                    }\n                                    h1, h2, p, td {\n                                        color: #5b2d1a;\n                                    }\n                                    a {\n                                        text-decoration:underline;\n                                        color: #bd0000;\n                                    }\n                                    a:hover {\n                                        text-decoration: none;\n                                    }\n                                    .btnStyle {\n                                        -moz-box-shadow:inset 0px -21px 0px -2px #b82a1e;\n                                        -webkit-box-shadow:inset 0px -21px 0px -2px #b82a1e;\n                                        box-shadow:inset 0px -21px 0px -2px #b82a1e;\n                                        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f06358), color-stop(1, #c62d1f) );\n                                        background:-moz-linear-gradient( center top, #f06358 5%, #c62d1f 100% );\n                                     filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=\"#f06358\", endColorstr=\"#c62d1f\");\n                                        background-color:#f06358;\n                                        -moz-border-radius:7px;\n                                        -webkit-border-radius:7px;\n                                        border-radius:7px;\n                                        border:2px solid #d02718;\n                                        display:inline-block;\n                                        color:#ffffff;\n                                        font-family:arial;\n                                        font-size:24px;\n                                        font-weight:bold;\n                                        padding:6px 24px;\n                                        text-decoration:none;\n                                        text-shadow:1px 1px 0px #fa473a;\n                                    }\n                                    .btnStyle:hover {\n                                        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f06358) );\n                                        background:-moz-linear-gradient( center top, #c62d1f 5%, #f06358 100% );\n                                     filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=\"#c62d1f\", endColorstr=\"#f06358\");\n                                        background-color:#c62d1f;\n                                    }\n                                    .btnStyle:active {\n                                        position:relative;\n                                        top:1px;\n                                    }\n                                    </style>\n                                    </head>\n                                    <body style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;color:#5b2d1a;font-style:normal;font-variant:normal;font-weight:normal;font-size:12px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;\">\n                                    <div style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;color:#5b2d1a;font-style:normal;font-variant:normal;font-weight:normal;font-size:12px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;width:100%;\" >\n                                      <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\" style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;\" >\n                                        <tr>\n                                          <td valign=\"top\" align=\"center\" style=\"width:650px;margin-top:0;margin-bottom:0;margin-right:auto;margin-left:auto;text-align:center;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;color:#5b2d1a;\" ><center>\n                                              \n                                              <!-- [ header starts here] -->\n                                              \n                                              <table bgcolor=\"#f4cb98\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"650\" style=\"border-collapse:collapse;background-color:#f4cb98;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;color:#5b2d1a;text-shadow:0 1px 1px #fee8cb;margin-top:15px;margin-bottom:15px;margin-right:8px;margin-left:8px;text-align:left;\" >\n                                                <tr>\n                                                  <td valign=\"top\" style=\"border-top-width:1px;border-top-style:solid;border-top-color:#0f0701;border-right-width:1px;border-right-style:solid;border-right-color:#0f0701;border-left-width:1px;border-left-style:solid;border-left-color:#0f0701;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><a href=\"http://store.fruitninja.com/?utm_source=br.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:none;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;color:#bd0000;\"><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_01_0.jpg\" alt=\"\" width=\"650\" height=\"176\" border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0; display:block\"/></a></td>\n                                                </tr>\n                                                <tr>\n                                                  <td style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><table cellspacing=\"0\" cellpadding=\"0\">\n                                                      <tr>\n                                                        <td valign=\"top\" width=\"278\" style=\"width:278px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_02_1.jpg\"  border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;border-width:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;text-decoration:none;display:block\" /></td>\n                                                        <td valign=\"top\" width=\"372\" style=\"width:372px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><a href=\"http://store.fruitninja.com/?utm_source=br.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:none;border-width:0;color:#bd0000;\" ><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_03_2.jpg\"  border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;border-width:0;display:block\" /></a></td>\n                                                      </tr>\n                                                    </table></td>\n                                                </tr>\n                                                <tr>\n                                                  <td style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><table cellspacing=\"0\" cellpadding=\"0\">\n                                                      <tr>\n                                                        <td valign=\"bottom\" width=\"474\" style=\"width:474px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><h1 style=\"color:#5b2d1a;font-size:16px;font-weight:bold;line-height:22px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:25px;font-family:Arial, Helvetica, sans-serif;\" >Olá, </h1></td>\n                                                        <td valign=\"top\" width=\"176\" style=\"width:176px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><a href=\"http://store.fruitninja.com/?utm_source=br.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:none;border-width:0;color:#bd0000;\" ><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_04_3.jpg\"  border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;border-width:0;display:block\" /></a></td>\n                                                      </tr>\n                                                    </table></td>\n                                                </tr>\n                                                \n                                                <!-- [ middle starts here] -->\n                                                \n                                                <tr>\n                                                  <td valign=\"top\" style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;padding-top:10px;padding-bottom:0;padding-right:25px;padding-left:25px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><p style=\"font-size:12px;line-height:16px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;color:#5b2d1a;\" >A respeito do seu recente pedido (número: 44588) de Halfbrick Studios Pty Ltd, ele está pronto para ser enviado assim que o pagamento for realizado.</p></td>\n                                                </tr>\n                                                <tr>\n                                                  <td valign=\"top\" style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;padding-top:10px;padding-bottom:0;padding-right:25px;padding-left:25px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;border-width:0;margin-top:0;margin-bottom:0;margin-right:auto;margin-left:auto;color:#5b2d1a;\" align=\"center\"><p style=\"font-size:12px;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;color:#5b2d1a;\" >Você pode realizar o pagamento clicando no URL a seguir (ou copie e cole no navegador).<br />\n                                                      <br />\n                                                      <a href=\"http://store.fruitninja.com/order/purchase/44588/a58cb4684b99db6163af0f12760fa974/?utm_source=br.legacy&utm_medium=email&utm_campaign=OrderDeferred\" class=\"btnStyle\" style=\"font-size: 20px; font-weight: bold\">Finalizar agora!</a> </p></td>\n                                                </tr>\n                                                <tr>\n                                                  <td valign=\"top\" style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;padding-top:10px;padding-bottom:0;padding-right:25px;padding-left:25px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><p style=\"font-size:12px;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;color:#5b2d1a;\" > <br />\n                                                      Caso não consiga clicar no link acima, você pode copiá-lo e colá-lo no navegador.<br /> <a href=\"http://store.fruitninja.com/order/purchase/44588/a58cb4684b99db6163af0f12760fa974/?utm_source=br.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:underline;color:#bd0000;\" >http://store.fruitninja.com/order/purchase/44588/a58cb4684b99db6163af0f12760fa974/</a>. </p>\n                                                    <p style=\"font-size:12px;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;color:#5b2d1a;\" >Caso tenha alguma dúvida, responda este e-mail. </p>\n                                                    <h2 style=\"font-size:14px;font-weight:bold;margin-top:15px;margin-bottom:0;margin-right:0;margin-left:0;font-family:Arial, Helvetica, sans-serif;color:#5b2d1a;\" > Halfbrick Studios Pty Ltd </h2></td>\n                                                </tr>\n                                                <tr>\n                                                  <td align=\"center\" valign=\"top\" style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;width:650px;padding-top:10px;padding-bottom:0;padding-right:0;padding-left:0;color:#f4cb98;text-align:center;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;\" ><center>\n                                                      <p style=\"font-size:12px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;font-family:Arial, Helvetica, sans-serif;color:#f4cb98;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;text-shadow: 0 1px 0 #000\" >Thank you again, <strong><a href=\"http://store.fruitninja.com/?utm_source=br.legacy&utm_medium=email&utm_campaign=OrderDeferred\" title=\"\" style=\"text-decoration:none !important;color:#f4cb98 !important;font-weight:bold;font-family:Arial, Helvetica, sans-serif;\"></a></strong></p>\n                                                    </center></td>\n                                                </tr>\n                                              </table>\n                                            </center></td>\n                                        </tr>\n                                      </table>\n                                    </div>\n                                    </body>\n                                    </html>','\n	Olá ,, \n	A respeito do seu recente pedido (número: 44588) de Halfbrick Studios Pty Ltd, ele está pronto para ser enviado assim que o pagamento for realizado.\n	\n	Você pode realizar o pagamento clicando no URL a seguir (ou copie e cole no navegador).\n	http://store.fruitninja.com/order/purchase/44588/a58cb4684b99db6163af0f12760fa974/?utm_source=br.legacy&utm_medium=email&utm_campaign=OrderDeferred\n	\n	Caso tenha alguma dúvida, responda este e-mail.\n	Atenciosamente\n	ToyFoundry for Halfbrick Studios Pty Ltd','pending',1381266961),( 4878,2,' ','bhgtj@fhk.690','','立即結賬！','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" 			 \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n                                    <html lang=\"en\">\r\n                                    <head>\r\n                                    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n                                    <title>Order Payment Reminder</title>\r\n                                    <style type=\"text/css\">\r\n                                    body {\r\n                                        background: #211409;\r\n                                        color:#f4cb98;\r\n                                    }\r\n                                    body, td, p {\r\n                                        font:14px/1.35em Arial, Helvetica, sans-serif;\r\n                                    }\r\n                                    td {\r\n                                        padding: 0;\r\n                                        border: 0;\r\n                                        margin: 0;\r\n                                    }\r\n                                    h1, h2, p, td {\r\n                                        color: #5b2d1a;\r\n                                    }\r\n                                    a {\r\n                                        text-decoration:underline;\r\n                                        color: #bd0000;\r\n                                    }\r\n                                    a:hover {\r\n                                        text-decoration: none;\r\n                                    }\r\n                                    .btnStyle {\r\n                                        -moz-box-shadow:inset 0px -21px 0px -2px #b82a1e;\r\n                                        -webkit-box-shadow:inset 0px -21px 0px -2px #b82a1e;\r\n                                        box-shadow:inset 0px -21px 0px -2px #b82a1e;\r\n                                        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f06358), color-stop(1, #c62d1f) );\r\n                                        background:-moz-linear-gradient( center top, #f06358 5%, #c62d1f 100% );\r\n                                     filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=\"#f06358\", endColorstr=\"#c62d1f\");\r\n                                        background-color:#f06358;\r\n                                        -moz-border-radius:7px;\r\n                                        -webkit-border-radius:7px;\r\n                                        border-radius:7px;\r\n                                        border:2px solid #d02718;\r\n                                        display:inline-block;\r\n                                        color:#ffffff;\r\n                                        font-family:arial;\r\n                                        font-size:24px;\r\n                                        font-weight:bold;\r\n                                        padding:6px 24px;\r\n                                        text-decoration:none;\r\n                                        text-shadow:1px 1px 0px #fa473a;\r\n                                    }\r\n                                    .btnStyle:hover {\r\n                                        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f06358) );\r\n                                        background:-moz-linear-gradient( center top, #c62d1f 5%, #f06358 100% );\r\n                                     filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=\"#c62d1f\", endColorstr=\"#f06358\");\r\n                                        background-color:#c62d1f;\r\n                                    }\r\n                                    .btnStyle:active {\r\n                                        position:relative;\r\n                                        top:1px;\r\n                                    }\r\n                                    </style>\r\n                                    </head>\r\n                                    <body style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;color:#5b2d1a;font-style:normal;font-variant:normal;font-weight:normal;font-size:12px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;\">\r\n                                    <div style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;color:#5b2d1a;font-style:normal;font-variant:normal;font-weight:normal;font-size:12px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;width:100%;\" >\r\n                                      <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\" style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;\" >\r\n                                        <tr>\r\n                                          <td valign=\"top\" align=\"center\" style=\"width:650px;margin-top:0;margin-bottom:0;margin-right:auto;margin-left:auto;text-align:center;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;color:#5b2d1a;\" ><center>\r\n                                              \r\n                                              <!-- [ header starts here] -->\r\n                                              \r\n                                              <table bgcolor=\"#f4cb98\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"650\" style=\"border-collapse:collapse;background-color:#f4cb98;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;color:#5b2d1a;text-shadow:0 1px 1px #fee8cb;margin-top:15px;margin-bottom:15px;margin-right:8px;margin-left:8px;text-align:left;\" >\r\n                                                <tr>\r\n                                                  <td valign=\"top\" style=\"border-top-width:1px;border-top-style:solid;border-top-color:#0f0701;border-right-width:1px;border-right-style:solid;border-right-color:#0f0701;border-left-width:1px;border-left-style:solid;border-left-color:#0f0701;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><a href=\"http://store.fruitninja.com/?utm_source=hk.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:none;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;color:#bd0000;\"><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_01_0.jpg\" alt=\"\" width=\"650\" height=\"176\" border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0; display:block\"/></a></td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                  <td style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><table cellspacing=\"0\" cellpadding=\"0\">\r\n                                                      <tr>\r\n                                                        <td valign=\"top\" width=\"278\" style=\"width:278px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_02_1.jpg\"  border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;border-width:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;text-decoration:none;display:block\" /></td>\r\n                                                        <td valign=\"top\" width=\"372\" style=\"width:372px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;color:#5b2d1a;\" ><a href=\"http://store.fruitninja.com/?utm_source=hk.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:none;border-width:0;color:#bd0000;\" ><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_03_2.jpg\"  border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;border-width:0;display:block\" /></a></td>\r\n                                                      </tr>\r\n                                                    </table></td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                  <td style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><table cellspacing=\"0\" cellpadding=\"0\">\r\n                                                      <tr>\r\n                                                        <td valign=\"bottom\" width=\"474\" style=\"width:474px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><h1 style=\"color:#5b2d1a;font-size:16px;font-weight:bold;line-height:22px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:25px;font-family:Arial, Helvetica, sans-serif;\" >你好, </h1></td>\r\n                                                        <td valign=\"top\" width=\"176\" style=\"width:176px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><a href=\"http://store.fruitninja.com/?utm_source=hk.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:none;border-width:0;color:#bd0000;\" ><img src=\"http://store.fruitninja.com/media/img/email/fruit_ninja_store_04_3.jpg\"  border=\"0\" style=\"margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;border-width:0;display:block\" /></a></td>\r\n                                                      </tr>\r\n                                                    </table></td>\r\n                                                </tr>\r\n                                                \r\n                                                <!-- [ middle starts here] -->\r\n                                                \r\n                                                <tr>\r\n                                                  <td valign=\"top\" style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;padding-top:10px;padding-bottom:0;padding-right:25px;padding-left:25px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><p style=\"font-size:12px;line-height:16px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;color:#5b2d1a;\" >關於你最近在 Halfbrick Studios Pty Ltd 所下訂單（訂單號：45655）- 你完成支付後即可發貨。</p></td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                  <td valign=\"top\" style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;padding-top:10px;padding-bottom:0;padding-right:25px;padding-left:25px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;border-width:0;margin-top:0;margin-bottom:0;margin-right:auto;margin-left:auto;color:#5b2d1a;\" align=\"center\"><p style=\"font-size:12px;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;color:#5b2d1a;\" >你可以按下下方 URL（或複製並將其粘貼至你的瀏覽器即可），完成支付<br />\r\n                                                      <br />\r\n                                                      <a href=\"http://store.fruitninja.com/order/purchase/45655/93962e1968e136835a2e930f11517623/?utm_source=hk.legacy&utm_medium=email&utm_campaign=OrderDeferred\" class=\"btnStyle\" style=\"font-size: 20px; font-weight: bold\">立即結賬！</a> </p></td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                  <td valign=\"top\" style=\"border-left-width:1px;border-left-style:solid;border-left-color:#d99f66;border-right-width:1px;border-right-style:solid;border-right-color:#d99f66;padding-top:10px;padding-bottom:0;padding-right:25px;padding-left:25px;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;color:#5b2d1a;\" ><p style=\"font-size:12px;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;color:#5b2d1a;\" > <br />\r\n                                                      如果無法按下上述連結，則還可複製該連結並粘貼至你的瀏覽器。<br /> <a href=\"http://store.fruitninja.com/order/purchase/45655/93962e1968e136835a2e930f11517623/?utm_source=hk.legacy&utm_medium=email&utm_campaign=OrderDeferred\" style=\"text-decoration:underline;color:#bd0000;\" >http://store.fruitninja.com/order/purchase/45655/93962e1968e136835a2e930f11517623/</a>. </p>\r\n                                                    <p style=\"font-size:12px;font-family:Arial, Helvetica, sans-serif;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;color:#5b2d1a;\" >如有任何疑問或顧慮，則請回覆此電子郵件。 </p>\r\n                                                    <h2 style=\"font-size:14px;font-weight:bold;margin-top:15px;margin-bottom:0;margin-right:0;margin-left:0;font-family:Arial, Helvetica, sans-serif;color:#5b2d1a;\" > Halfbrick Studios Pty Ltd </h2></td>\r\n                                                </tr>\r\n                                                <tr>\r\n                                                  <td align=\"center\" valign=\"top\" style=\"background-color:#211409;background-image:none;background-repeat:repeat;background-position:top left;background-attachment:scroll;width:650px;padding-top:10px;padding-bottom:0;padding-right:0;padding-left:0;color:#f4cb98;text-align:center;font-style:normal;font-variant:normal;font-weight:normal;font-size:14px;font-family:Arial, Helvetica, sans-serif;line-height:1.35em;border-width:0;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;\" ><center>\r\n                                                      <p style=\"font-size:12px;margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;font-family:Arial, Helvetica, sans-serif;color:#f4cb98;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.35em;text-shadow: 0 1px 0 #000\" >Thank you again, <strong><a href=\"http://store.fruitninja.com/?utm_source=hk.legacy&utm_medium=email&utm_campaign=OrderDeferred\" title=\"\" style=\"text-decoration:none !important;color:#f4cb98 !important;font-weight:bold;font-family:Arial, Helvetica, sans-serif;\"></a></strong></p>\r\n                                                    </center></td>\r\n                                                </tr>\r\n                                              </table>\r\n                                            </center></td>\r\n                                        </tr>\r\n                                      </table>\r\n                                    </div>\r\n                                    </body>\r\n                                    </html>','\r\n	你好 ,, \r\n	關於你最近在 Halfbrick Studios Pty Ltd 所下訂單（訂單號：45655）- 你完成支付後即可發貨。\r\n	\r\n	你可以按下下方 URL（或複製並將其粘貼至你的瀏覽器即可），完成支付\r\n	http://store.fruitninja.com/order/purchase/45655/93962e1968e136835a2e930f11517623/?utm_source=hk.legacy&utm_medium=email&utm_campaign=OrderDeferred\r\n	\r\n	如有任何疑問或顧慮，則請回覆此電子郵件。\r\n	此致\r\n	ToyFoundry for Halfbrick Studios Pty Ltd','pending',1381840621);
/*!40000 ALTER TABLE `emailQueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handsetProviderDevices`
--

DROP TABLE IF EXISTS `handsetProviderDevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handsetProviderDevices` (
  `handsetProviderDeviceID` int(11) NOT NULL AUTO_INCREMENT,
  `handsetProviderID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rule` varchar(255) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`handsetProviderDeviceID`),
  UNIQUE KEY `handsetProviderID_2` (`handsetProviderID`,`name`),
  KEY `handsetProviderID` (`handsetProviderID`,`rule`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handsetProviderDevices`
--

LOCK TABLES `handsetProviderDevices` WRITE;
/*!40000 ALTER TABLE `handsetProviderDevices` DISABLE KEYS */;
INSERT INTO `handsetProviderDevices` (`handsetProviderDeviceID`, `handsetProviderID`, `name`, `description`, `rule`, `order`) VALUES (1,1,'iPhone',NULL,'(iPhone|iPod)',2),(2,1,'iPad',NULL,'iPad',3),(3,2,'All Android',NULL,'Android',1),(5,1,'All Apple','Global for all apple devices','(iPad|iPhone|iPod)',1);
/*!40000 ALTER TABLE `handsetProviderDevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handsetProviders`
--

DROP TABLE IF EXISTS `handsetProviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handsetProviders` (
  `handsetProviderID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`handsetProviderID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handsetProviders`
--

LOCK TABLES `handsetProviders` WRITE;
/*!40000 ALTER TABLE `handsetProviders` DISABLE KEYS */;
INSERT INTO `handsetProviders` (`handsetProviderID`, `name`, `description`) VALUES (1,'Apple',NULL),(2,'Android',NULL);
/*!40000 ALTER TABLE `handsetProviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `invoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `type` enum('web','shipping','other') NOT NULL,
  `status` enum('pending','settled') NOT NULL,
  `timestamp` int(15) NOT NULL,
  PRIMARY KEY (`invoiceID`),
  KEY `clientID` (`clientID`,`value`,`status`,`timestamp`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipRanges`
--

DROP TABLE IF EXISTS `ipRanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipRanges` (
  `ipRangeID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `ipRange` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ipRangeID`),
  KEY `clientID` (`clientID`,`ipRange`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipRanges`
--

LOCK TABLES `ipRanges` WRITE;
/*!40000 ALTER TABLE `ipRanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipRanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languageID` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(20) NOT NULL,
  `code` char(2) NOT NULL,
  `locale` varchar(5) NOT NULL,
  PRIMARY KEY (`languageID`),
  KEY `language` (`language`,`locale`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`languageID`, `language`, `code`, `locale`) VALUES (1,'English','en','en_US'),(2,'French','fr','fr_FR'),(3,'Chinese (Simplified)','zh','cn_ZH'),(4,'Italian','it','it_IT'),(5,'German','de','de_DE'),(6,'Spanish','es','es_ES'),(7,'Korean','ko','ko_KR'),(8,'Japanese','ja','ja_JP'),(9,'Latin Spanish','ls','es_AR'),(11,'Polish','pl','pl_PL'),(13,'Russian','ru','ru_RU'),(14,'Chinese (Trad.)','hk','cn_HK'),(15,'Arabic','ar','ar_AR'),(16,'English (GB)','gb','en_GB');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderAddresses`
--

DROP TABLE IF EXISTS `orderAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderAddresses` (
  `orderAddressID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `customerAddressID` int(11) NOT NULL,
  PRIMARY KEY (`orderAddressID`),
  KEY `orderID` (`orderID`,`customerAddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=2105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderAddresses`
--

LOCK TABLES `orderAddresses` WRITE;
/*!40000 ALTER TABLE `orderAddresses` DISABLE KEYS */;
INSERT INTO `orderAddresses` (`orderAddressID`, `orderID`, `customerAddressID`) VALUES (1,1,2),( 2,2,3),( 3,3,6),( 2103,46091,10912),( 2104,46119,4112);
/*!40000 ALTER TABLE `orderAddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderItems`
--

DROP TABLE IF EXISTS `orderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderItems` (
  `orderItemID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `value` decimal(5,2) DEFAULT NULL,
  `cost` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`orderItemID`),
  KEY `orderID` (`orderID`,`productID`,`quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=109373 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItems`
--

LOCK TABLES `orderItems` WRITE;
/*!40000 ALTER TABLE `orderItems` DISABLE KEYS */;
INSERT INTO `orderItems` (`orderItemID`, `orderID`, `productID`, `quantity`, `value`, `cost`) VALUES (1,1,2,1,0.00,0.00),( 2,2,1,2,0.00,0.00),( 36493,15733,12,1,0.00,0.00),( 36494,15733,9,1,0.00,0.00);
/*!40000 ALTER TABLE `orderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderQuotes`
--

DROP TABLE IF EXISTS `orderQuotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderQuotes` (
  `orderQuoteID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `currencyID` tinyint(4) NOT NULL,
  `shippingMethod` varchar(15) DEFAULT NULL,
  `shippingCost` decimal(8,2) DEFAULT NULL,
  `status` enum('pending','closed') NOT NULL,
  `timedate` int(11) NOT NULL,
  PRIMARY KEY (`orderQuoteID`),
  KEY `orderID` (`orderID`,`currencyID`,`shippingMethod`,`status`,`timedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderQuotes`
--

LOCK TABLES `orderQuotes` WRITE;
/*!40000 ALTER TABLE `orderQuotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderQuotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `transactionID` varchar(80) DEFAULT NULL,
  `warehouseID` varchar(80) DEFAULT NULL,
  `shipwireID` varchar(50) DEFAULT NULL,
  `shipwireReferenceID` varchar(25) NOT NULL,
  `trackingID` varchar(80) DEFAULT NULL,
  `trackingUrl` varchar(255) DEFAULT NULL,
  `timestamp` int(15) NOT NULL,
  `status` enum('deferred','pending','processing','ordered','dispatched','delivered','manual','held','returned','abandoned') NOT NULL,
  `details` text,
  `shipper` varchar(80) DEFAULT NULL,
  `shippingDate` int(15) DEFAULT NULL,
  `deliveryDate` int(15) DEFAULT NULL,
  `handlingCost` decimal(5,2) NOT NULL,
  `shippingCost` decimal(5,2) NOT NULL,
  `packingCost` decimal(5,2) NOT NULL,
  `insuranceCost` decimal(5,2) NOT NULL,
  `source` varchar(10) NOT NULL DEFAULT 'api',
  `storeID` int(11) DEFAULT NULL,
  `themeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `clientID` (`clientID`,`customerID`,`transactionID`,`warehouseID`,`trackingID`,`timestamp`,`status`,`shipper`),
  KEY `storeID` (`storeID`),
  KEY `themeID` (`themeID`),
  KEY `shipwireReferenceID` (`shipwireReferenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=46145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderID`, `clientID`, `customerID`, `transactionID`, `warehouseID`, `shipwireID`, `shipwireReferenceID`, `trackingID`, `trackingUrl`, `timestamp`, `status`, `details`, `shipper`, `shippingDate`, `deliveryDate`, `handlingCost`, `shippingCost`, `packingCost`, `insuranceCost`, `source`, `storeID`, `themeID`) VALUES (42618,2,15731,'','','','HB:42618:7Ssbbc:API','','',1380240224,'abandoned','a:3:{i:0;s:43:\"2013-09-26 17:55:02 - Deferred Order Loaded\";i:1;s:58:\"2013-09-29 20:05:02 - Order Reminder sent after three days\";i:2;s:64:\"2013-10-02 20:05:02 - Order Abandoned after 6 days of inactivity\";}','',0,0,0.00,0.00,0.00,0.00,'API',1,0),( 42619,2,41147,'','','','HB:42619:MVsbbc:API','','',1380240340,'abandoned','a:2:{i:0;s:58:\"2013-09-29 20:07:03 - Order Reminder sent after three days\";i:1;s:64:\"2013-10-02 20:07:03 - Order Abandoned after 6 days of inactivity\";}','',0,0,0.00,0.00,0.00,0.00,'API',1,0),( 43105,2,41672,'','','','HB:43105:Jzybbc:API','','',1380452453,'abandoned','a:2:{i:0;s:58:\"2013-10-02 07:03:01 - Order Reminder sent after three days\";i:1;s:64:\"2013-10-05 07:03:02 - Order Abandoned after 6 days of inactivity\";}','',0,0,0.00,0.00,0.00,0.00,'API',1,0),( 43106,2,41673,'','','','HB:43106:TBvbbc:API','','',1380444922,'abandoned','a:2:{i:0;s:58:\"2013-10-02 07:14:02 - Order Reminder sent after three days\";i:1;s:64:\"2013-10-05 07:14:02 - Order Abandoned after 6 days of inactivity\";}','',0,0,0.00,0.00,0.00,0.00,'API',1,0),( 45169,2,43524,'','','','HB:45169:sjfbbc:API','','',1381608438,'deferred','a:1:{i:0;s:58:\"2013-10-15 16:08:02 - Order Reminder sent after three days\";}','',0,0,0.00,0.00,0.00,0.00,'API',1,0),( 46144,2,44327,'','','','HB:46144:Bx6bbc:API','','',1382073975,'deferred','','',0,0,0.00,0.00,0.00,0.00,'API',1,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productCategories`
--

DROP TABLE IF EXISTS `productCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productCategories` (
  `productCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` tinyint(4) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`productCategoryID`),
  UNIQUE KEY `clientID_2` (`clientID`,`name`),
  KEY `clientID` (`clientID`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productCategories`
--

LOCK TABLES `productCategories` WRITE;
/*!40000 ALTER TABLE `productCategories` DISABLE KEYS */;
INSERT INTO `productCategories` (`productCategoryID`, `clientID`, `name`) VALUES (4,2,'Clip-on'),( 8,2,'Device Android'),( 3,2,'Plush');
/*!40000 ALTER TABLE `productCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productCategoryValues`
--

DROP TABLE IF EXISTS `productCategoryValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productCategoryValues` (
  `productCategoryValueID` int(11) NOT NULL AUTO_INCREMENT,
  `productCategoryID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`productCategoryValueID`),
  UNIQUE KEY `productCategoryID_2` (`productCategoryID`,`productID`),
  KEY `productCategoryID` (`productCategoryID`,`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productCategoryValues`
--

LOCK TABLES `productCategoryValues` WRITE;
/*!40000 ALTER TABLE `productCategoryValues` DISABLE KEYS */;
INSERT INTO `productCategoryValues` (`productCategoryValueID`, `productCategoryID`, `productID`) VALUES (1,1,1),( 78,2,16),( 75,10,19),( 74,10,20);
/*!40000 ALTER TABLE `productCategoryValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productDefaultFields`
--

DROP TABLE IF EXISTS `productDefaultFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productDefaultFields` (
  `productDefaultFieldID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`productDefaultFieldID`),
  UNIQUE KEY `field` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productDefaultFields`
--

LOCK TABLES `productDefaultFields` WRITE;
/*!40000 ALTER TABLE `productDefaultFields` DISABLE KEYS */;
INSERT INTO `productDefaultFields` (`productDefaultFieldID`, `name`) VALUES (2,'description_long'),(1,'description_short'),(5,'info_list'),(3,'info_materials'),(4,'info_shipping'),(6,'product_name');
/*!40000 ALTER TABLE `productDefaultFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productFieldValues`
--

DROP TABLE IF EXISTS `productFieldValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productFieldValues` (
  `productFieldValueID` int(11) NOT NULL AUTO_INCREMENT,
  `productFieldID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `value` text NOT NULL,
  `languageID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`productFieldValueID`),
  KEY `productFieldID` (`productFieldID`,`languageID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=1998 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productFieldValues`
--

LOCK TABLES `productFieldValues` WRITE;
/*!40000 ALTER TABLE `productFieldValues` DISABLE KEYS */;
INSERT INTO `productFieldValues` (`productFieldValueID`, `productFieldID`, `productID`, `value`, `languageID`) VALUES (2,1,16,'Gutsu and Truffles have got your back!',1),( 3,2,16,'Gutsu & Truffles need a third amigo! Partner up and gain mad ninja cred while you\'re at it! High quality gloss print\n- Total access to all controls\n- Designed for iPhone 4 & 4S',1),( 5,1,20,'What\'s not to love about a handsome fellow like Barry?',1),( 1996,5,17,'1x Soft Watermelon iPhone Case. \n Fast worldwide delivery',1),( 1997,5,16,'1x Gutsu & Truffles iPhone Case. \n Fast worldwide delivery',1);
/*!40000 ALTER TABLE `productFieldValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productFieldValues_Feb2013`
--

DROP TABLE IF EXISTS `productFieldValues_Feb2013`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productFieldValues_Feb2013` (
  `productFieldValueID` int(11) NOT NULL AUTO_INCREMENT,
  `productFieldID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `value` text NOT NULL,
  `languageID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`productFieldValueID`),
  KEY `productFieldID` (`productFieldID`,`languageID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=1998 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productFieldValues_Feb2013`
--

LOCK TABLES `productFieldValues_Feb2013` WRITE;
/*!40000 ALTER TABLE `productFieldValues_Feb2013` DISABLE KEYS */;
INSERT INTO `productFieldValues_Feb2013` (`productFieldValueID`, `productFieldID`, `productID`, `value`, `languageID`) VALUES (2,1,16,'Gutsu and Truffles have got your back!',1),( 3,2,16,'Gutsu & Truffles need a third amigo! Partner up and gain mad ninja cred while you\'re at it! High quality gloss print\n- Total access to all controls\n- Designed for iPhone 4 & 4S',1),( 1997,5,16,'1x Gutsu & Truffles iPhone Case. \n Fast worldwide delivery',1);
/*!40000 ALTER TABLE `productFieldValues_Feb2013` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productFieldValues_copy`
--

DROP TABLE IF EXISTS `productFieldValues_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productFieldValues_copy` (
  `productFieldValueID` int(11) NOT NULL AUTO_INCREMENT,
  `productFieldID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `value` text NOT NULL,
  `languageID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`productFieldValueID`),
  KEY `productFieldID` (`productFieldID`,`languageID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=1993 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productFieldValues_copy`
--

LOCK TABLES `productFieldValues_copy` WRITE;
/*!40000 ALTER TABLE `productFieldValues_copy` DISABLE KEYS */;
INSERT INTO `productFieldValues_copy` (`productFieldValueID`, `productFieldID`, `productID`, `value`, `languageID`) VALUES (2,1,16,'Gutsu and Truffles have got your back!',1),( 3,2,16,'Gutsu & Truffles need a third amigo! Partner up and gain mad ninja cred while you\'re at it! High quality gloss print\r\n Total access to all controls\r\n Designed for iPhone 4/4S',1),( 1991,8,21,'Pack',14),(1992,6,21,'Training Pack',14);
/*!40000 ALTER TABLE `productFieldValues_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productFields`
--

DROP TABLE IF EXISTS `productFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productFields` (
  `productFieldID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`productFieldID`),
  UNIQUE KEY `clientID_2` (`clientID`,`name`),
  KEY `clientID` (`clientID`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productFields`
--

LOCK TABLES `productFields` WRITE;
/*!40000 ALTER TABLE `productFields` DISABLE KEYS */;
INSERT INTO `productFields` (`productFieldID`, `clientID`, `name`) VALUES (2,2,'description_long'),(1,2,'description_short'),(5,2,'info_list'),(3,2,'info_materials'),(4,2,'info_shipping'),(6,2,'product_name'),(7,2,'product_name_0'),(8,2,'product_name_1');
/*!40000 ALTER TABLE `productFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productImageGroups`
--

DROP TABLE IF EXISTS `productImageGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productImageGroups` (
  `productImageGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imageX` int(11) DEFAULT NULL,
  `imageY` int(11) DEFAULT NULL,
  PRIMARY KEY (`productImageGroupID`),
  UNIQUE KEY `clientID_2` (`clientID`,`name`),
  KEY `name` (`name`,`imageX`,`imageY`),
  KEY `clientID` (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productImageGroups`
--

LOCK TABLES `productImageGroups` WRITE;
/*!40000 ALTER TABLE `productImageGroups` DISABLE KEYS */;
INSERT INTO `productImageGroups` (`productImageGroupID`, `clientID`, `name`, `imageX`, `imageY`) VALUES (1,2,'profile',261,324),(2,2,'product_images',NULL,NULL),(3,5,'profile',261,324),(4,2,'ipad',261,324),(5,2,'iphone4_plus',261,324),(6,2,'sd_ios',261,324);
/*!40000 ALTER TABLE `productImageGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productImages`
--

DROP TABLE IF EXISTS `productImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productImages` (
  `productImageID` int(11) NOT NULL AUTO_INCREMENT,
  `productImageGroupID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`productImageID`),
  UNIQUE KEY `productImageGroupID_2` (`productImageGroupID`,`productID`,`filename`),
  KEY `productImageGroupID` (`productImageGroupID`,`productID`,`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productImages`
--

LOCK TABLES `productImages` WRITE;
/*!40000 ALTER TABLE `productImages` DISABLE KEYS */;
INSERT INTO `productImages` (`productImageID`, `productImageGroupID`, `productID`, `filename`) VALUES (1,1,1,'profile.png'),( 2,1,2,'profile.png'),( 418,6,21,'MediumTrainingPack-crate-SD.png'),( 419,6,21,'MediumTrainingPack-description-SD.png');
/*!40000 ALTER TABLE `productImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productImages_old`
--

DROP TABLE IF EXISTS `productImages_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productImages_old` (
  `productImageID` int(11) NOT NULL AUTO_INCREMENT,
  `productImageGroupID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`productImageID`),
  UNIQUE KEY `productImageGroupID_2` (`productImageGroupID`,`productID`,`filename`),
  KEY `productImageGroupID` (`productImageGroupID`,`productID`,`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productImages_old`
--

LOCK TABLES `productImages_old` WRITE;
/*!40000 ALTER TABLE `productImages_old` DISABLE KEYS */;
INSERT INTO `productImages_old` (`productImageID`, `productImageGroupID`, `productID`, `filename`) VALUES (1,1,1,'sensei.png'),( 2,1,2,'watermelon.png'),( 286,6,21,'training-pack-final-2.jpg'),( 276,6,21,'training.jpg');
/*!40000 ALTER TABLE `productImages_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productRanges`
--

DROP TABLE IF EXISTS `productRanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productRanges` (
  `productRangeID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL DEFAULT '0',
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`productRangeID`),
  UNIQUE KEY `productRange` (`clientID`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productRanges`
--

LOCK TABLES `productRanges` WRITE;
/*!40000 ALTER TABLE `productRanges` DISABLE KEYS */;
INSERT INTO `productRanges` (`productRangeID`, `clientID`, `name`) VALUES (1,2,'Fruit Ninja'),(2,2,'Jetpack Joyride'),(3,5,'Angry Birds');
/*!40000 ALTER TABLE `productRanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productReviews`
--

DROP TABLE IF EXISTS `productReviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productReviews` (
  `productReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `review` text NOT NULL,
  `languageID` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` int(15) NOT NULL,
  PRIMARY KEY (`productReviewID`),
  KEY `approved` (`approved`),
  KEY `productID` (`productID`,`customerID`),
  KEY `timestamp` (`timestamp`),
  KEY `languageID` (`languageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productReviews`
--

LOCK TABLES `productReviews` WRITE;
/*!40000 ALTER TABLE `productReviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `productReviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `productRangeID` int(11) DEFAULT NULL,
  `SKU` varchar(15) NOT NULL,
  `name` varchar(80) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `weight` decimal(5,2) NOT NULL,
  `length` decimal(5,2) NOT NULL,
  `width` decimal(5,2) NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `cost` decimal(5,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`productID`),
  KEY `clientID` (`clientID`,`name`,`value`,`cost`,`quantity`),
  KEY `SKU` (`SKU`),
  KEY `slug` (`slug`),
  KEY `description` (`description`),
  KEY `name` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`productID`, `clientID`, `productRangeID`, `SKU`, `name`, `slug`, `description`, `weight`, `length`, `width`, `height`, `value`, `cost`, `quantity`, `created`, `modified`) VALUES (1,2,1,'9345781000001','Sensei Plush','sensei','Sensei is the wise man who ruthlessly cuts through fruit',0.20,6.00,10.00,15.00,15.99,11.00,64029,'2012-08-30 10:03:44','2013-10-08 05:05:15'),( 27,1,1,'9345781000209','Truffles Figurine','truffles-figurine',NULL,0.10,0.10,0.10,0.10,5.00,5.00,5,'0000-00-00 00:00:00','2013-08-06 11:27:04');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotionRewardPriceDiscounts`
--

DROP TABLE IF EXISTS `promotionRewardPriceDiscounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotionRewardPriceDiscounts` (
  `promotionRewardPriceDiscountID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `promotionRewardID` int(11) NOT NULL,
  `type` enum('%','AS$','LESS$') NOT NULL DEFAULT '%',
  `value` decimal(5,2) NOT NULL,
  PRIMARY KEY (`promotionRewardPriceDiscountID`),
  KEY `promotionRewardID` (`promotionRewardID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotionRewardPriceDiscounts`
--

LOCK TABLES `promotionRewardPriceDiscounts` WRITE;
/*!40000 ALTER TABLE `promotionRewardPriceDiscounts` DISABLE KEYS */;
INSERT INTO `promotionRewardPriceDiscounts` (`promotionRewardPriceDiscountID`, `promotionRewardID`, `type`, `value`) VALUES (1,1,'%',20.00);
/*!40000 ALTER TABLE `promotionRewardPriceDiscounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotionRewards`
--

DROP TABLE IF EXISTS `promotionRewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotionRewards` (
  `promotionRewardID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('price') DEFAULT NULL,
  `promotionID` int(11) NOT NULL,
  PRIMARY KEY (`promotionRewardID`),
  KEY `type` (`type`,`promotionRewardID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotionRewards`
--

LOCK TABLES `promotionRewards` WRITE;
/*!40000 ALTER TABLE `promotionRewards` DISABLE KEYS */;
INSERT INTO `promotionRewards` (`promotionRewardID`, `type`, `promotionID`) VALUES (1,'price',2);
/*!40000 ALTER TABLE `promotionRewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotionRuleMeta`
--

DROP TABLE IF EXISTS `promotionRuleMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotionRuleMeta` (
  `promotionRuleMetaID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `promotionRuleID` int(11) NOT NULL,
  `key` varchar(80) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`promotionRuleMetaID`),
  KEY `promotionRule` (`promotionRuleID`,`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotionRuleMeta`
--

LOCK TABLES `promotionRuleMeta` WRITE;
/*!40000 ALTER TABLE `promotionRuleMeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotionRuleMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotionRules`
--

DROP TABLE IF EXISTS `promotionRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotionRules` (
  `promotionRuleID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `promotionID` int(11) NOT NULL,
  `ruleType` enum('product','category','date.start','date.end') NOT NULL DEFAULT 'product',
  `rule` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`promotionRuleID`),
  UNIQUE KEY `promotionID` (`promotionID`,`ruleType`,`rule`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotionRules`
--

LOCK TABLES `promotionRules` WRITE;
/*!40000 ALTER TABLE `promotionRules` DISABLE KEYS */;
INSERT INTO `promotionRules` (`promotionRuleID`, `promotionID`, `ruleType`, `rule`) VALUES (2,2,'product','1'),(3,2,'product','2'),(1,2,'product','21'),(4,2,'product','3'),(5,2,'product','4'),(6,2,'product','5'),(7,2,'product','6'),(8,2,'product','7'),(18,2,'category','10'),(19,2,'category','11'),(15,2,'category','5'),(16,2,'category','6'),(17,2,'category','7'),(20,2,'category','8');
/*!40000 ALTER TABLE `promotionRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `promotionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `isCurrentOffer` tinyint(1) NOT NULL DEFAULT '0',
  `isGlobal` tinyint(1) NOT NULL DEFAULT '0',
  `clientID` int(11) NOT NULL,
  PRIMARY KEY (`promotionID`),
  KEY `isActive` (`clientID`,`isActive`),
  KEY `isCurrentOffer` (`clientID`,`isCurrentOffer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunds` (
  `refundID` int(11) NOT NULL AUTO_INCREMENT,
  `customerID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `details` mediumtext,
  `timestamp` int(15) NOT NULL,
  PRIMARY KEY (`refundID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeCategories`
--

DROP TABLE IF EXISTS `storeCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeCategories` (
  `storeCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `parentStoreCategoryID` int(11) DEFAULT '0',
  `storeID` int(11) NOT NULL,
  `clientID` tinyint(4) NOT NULL,
  `name` varchar(80) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`storeCategoryID`),
  UNIQUE KEY `clientID_2` (`clientID`,`name`),
  KEY `clientID` (`clientID`,`name`),
  KEY `storeID` (`storeID`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeCategories`
--

LOCK TABLES `storeCategories` WRITE;
/*!40000 ALTER TABLE `storeCategories` DISABLE KEYS */;
INSERT INTO `storeCategories` (`storeCategoryID`, `parentStoreCategoryID`, `storeID`, `clientID`, `name`, `slug`) VALUES (1,0,1,2,'Featured','featured'),(2,0,1,2,'Phone Cases','phone-cases'),(3,2,1,2,'iPhone Cases','iphone'),(4,0,1,2,'Plush','plush'),(5,4,1,2,'Clip-on','clip-on'),(6,4,1,2,'Jumbo Plush','jumbo'),(7,4,1,2,'Regular Plush','regular');
/*!40000 ALTER TABLE `storeCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeCategoryValues`
--

DROP TABLE IF EXISTS `storeCategoryValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeCategoryValues` (
  `storeCategoryValueID` int(11) NOT NULL AUTO_INCREMENT,
  `storeCategoryID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`storeCategoryValueID`),
  UNIQUE KEY `storeCategoryID_2` (`storeCategoryID`,`productID`),
  KEY `storeCategoryID` (`storeCategoryID`,`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeCategoryValues`
--

LOCK TABLES `storeCategoryValues` WRITE;
/*!40000 ALTER TABLE `storeCategoryValues` DISABLE KEYS */;
INSERT INTO `storeCategoryValues` (`storeCategoryValueID`, `storeCategoryID`, `productID`) VALUES (21,1,5),(23,1,6),(22,1,7),(12,3,16),(13,3,17),(14,3,18),(15,3,19),(16,3,20),(6,5,8),(7,5,9),(8,5,10),(9,6,11),(10,6,12),(11,6,13),(1,7,1),(2,7,2),(3,7,5),(4,7,6),(5,7,7),(20,7,21);
/*!40000 ALTER TABLE `storeCategoryValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeCountryBlacklists`
--

DROP TABLE IF EXISTS `storeCountryBlacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeCountryBlacklists` (
  `storeCountryBlacklistID` int(11) NOT NULL AUTO_INCREMENT,
  `countryCode` char(2) NOT NULL,
  `reason` text,
  PRIMARY KEY (`storeCountryBlacklistID`),
  UNIQUE KEY `countryCode` (`countryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeCountryBlacklists`
--

LOCK TABLES `storeCountryBlacklists` WRITE;
/*!40000 ALTER TABLE `storeCountryBlacklists` DISABLE KEYS */;
INSERT INTO `storeCountryBlacklists` (`storeCountryBlacklistID`, `countryCode`, `reason`) VALUES (1,'ID','Scamming'),(2,'VN','Scamming'),(3,'KH','Scamming'),(4,'UA','Scamming');
/*!40000 ALTER TABLE `storeCountryBlacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeCouponUses`
--

DROP TABLE IF EXISTS `storeCouponUses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeCouponUses` (
  `storeCouponUseID` int(11) NOT NULL AUTO_INCREMENT,
  `storeCouponID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `storeID` int(11) NOT NULL,
  `transactionRequestID` int(11) NOT NULL,
  `timedate` int(10) NOT NULL,
  PRIMARY KEY (`storeCouponUseID`),
  KEY `storeCouponID` (`storeCouponID`,`customerID`,`storeID`),
  KEY `transactionRequestID` (`transactionRequestID`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeCouponUses`
--

LOCK TABLES `storeCouponUses` WRITE;
/*!40000 ALTER TABLE `storeCouponUses` DISABLE KEYS */;
INSERT INTO `storeCouponUses` (`storeCouponUseID`, `storeCouponID`, `customerID`, `storeID`, `transactionRequestID`, `timedate`) VALUES (1,2,2239,1,1281,0),( 2,1,6,1,1282,0),( 307,4,44062,1,246570,0),( 308,4,44152,1,246573,0);
/*!40000 ALTER TABLE `storeCouponUses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeCoupons`
--

DROP TABLE IF EXISTS `storeCoupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeCoupons` (
  `storeCouponID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) DEFAULT NULL,
  `storeID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `coupon` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startDate` int(10) DEFAULT NULL,
  `expiryDate` int(10) DEFAULT NULL,
  `discountShipping` varchar(8) DEFAULT NULL,
  `discountItems` varchar(8) DEFAULT NULL,
  `minValue` decimal(5,2) NOT NULL DEFAULT '0.00',
  `minProducts` int(11) NOT NULL DEFAULT '0',
  `requiredProducts` text,
  `couponLimit` int(11) DEFAULT NULL,
  `customerLimit` int(11) DEFAULT NULL,
  `autoEnable` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('enabled','disabled','expired') NOT NULL DEFAULT 'enabled',
  PRIMARY KEY (`storeCouponID`),
  UNIQUE KEY `coupon` (`coupon`),
  KEY `clientID` (`clientID`,`storeID`,`customerID`,`startDate`,`expiryDate`,`couponLimit`,`customerLimit`,`status`),
  KEY `minValue` (`minValue`,`minProducts`),
  KEY `autoEnable` (`autoEnable`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeCoupons`
--

LOCK TABLES `storeCoupons` WRITE;
/*!40000 ALTER TABLE `storeCoupons` DISABLE KEYS */;
INSERT INTO `storeCoupons` (`storeCouponID`, `clientID`, `storeID`, `customerID`, `coupon`, `description`, `startDate`, `expiryDate`, `discountShipping`, `discountItems`, `minValue`, `minProducts`, `requiredProducts`, `couponLimit`, `customerLimit`, `autoEnable`, `status`) VALUES (1,2,1,NULL,'CHEAPSTUFF','CheapStuff',NULL,NULL,'100%','99%',0.00,0,NULL,NULL,NULL,0,'enabled'),( 2,2,1,NULL,'FRUITSALAD','Fruit Salad Discount',NULL,NULL,NULL,'20%',20.00,0,NULL,NULL,NULL,0,'disabled'),( 15,2,1,NULL,'NINJACOMBO',NULL,NULL,NULL,'100%','20%',0.00,0,'a:3:{i:2;i:1;i:13;i:1;i:17;i:1;}',NULL,NULL,1,'enabled');
/*!40000 ALTER TABLE `storeCoupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeErrorStrings`
--

DROP TABLE IF EXISTS `storeErrorStrings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeErrorStrings` (
  `storeErrorStringID` int(11) NOT NULL AUTO_INCREMENT,
  `stringName` varchar(255) NOT NULL,
  `stringValue` text NOT NULL,
  PRIMARY KEY (`storeErrorStringID`),
  KEY `stringName` (`stringName`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeErrorStrings`
--

LOCK TABLES `storeErrorStrings` WRITE;
/*!40000 ALTER TABLE `storeErrorStrings` DISABLE KEYS */;
INSERT INTO `storeErrorStrings` (`storeErrorStringID`, `stringName`, `stringValue`) VALUES (1,'error_required_field','Required Field'),( 2,'error_minimum_length','Minimum field length is (\\d+)'),( 39,'error_default_address','Could not make address default');
/*!40000 ALTER TABLE `storeErrorStrings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeImageGroups`
--

DROP TABLE IF EXISTS `storeImageGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeImageGroups` (
  `storeImageGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imageX` int(11) DEFAULT NULL,
  `imageY` int(11) DEFAULT NULL,
  `storeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`storeImageGroupID`),
  UNIQUE KEY `clientID_2` (`clientID`,`name`),
  KEY `name` (`name`,`imageX`,`imageY`),
  KEY `clientID` (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeImageGroups`
--

LOCK TABLES `storeImageGroups` WRITE;
/*!40000 ALTER TABLE `storeImageGroups` DISABLE KEYS */;
INSERT INTO `storeImageGroups` (`storeImageGroupID`, `clientID`, `name`, `imageX`, `imageY`, `storeID`) VALUES (1,2,'profile',261,324,0),(2,2,'product_images',NULL,NULL,0),(3,5,'profile',261,324,0),(4,2,'ipad',261,324,0),(5,2,'iphone4_plus',261,324,0),(6,2,'sd_ios',261,324,0);
/*!40000 ALTER TABLE `storeImageGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeImages`
--

DROP TABLE IF EXISTS `storeImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeImages` (
  `storeImageID` int(11) NOT NULL AUTO_INCREMENT,
  `storeImageGroupID` int(11) NOT NULL,
  `type` varchar(80) NOT NULL DEFAULT 'products',
  `typeID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `clientID` int(11) NOT NULL,
  PRIMARY KEY (`storeImageID`),
  UNIQUE KEY `productImageGroupID_2` (`storeImageGroupID`,`typeID`,`filename`),
  KEY `productImageGroupID` (`storeImageGroupID`,`typeID`,`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeImages`
--

LOCK TABLES `storeImages` WRITE;
/*!40000 ALTER TABLE `storeImages` DISABLE KEYS */;
INSERT INTO `storeImages` (`storeImageID`, `storeImageGroupID`, `type`, `typeID`, `filename`, `clientID`) VALUES (1,1,'products',1,'profile.png',2),( 2,1,'products',2,'profile.png',2),( 466,4,'current_offers',3,'JumboStrawberry-crate-HD.png',2),( 467,6,'current_offers',3,'JumboPeach-crate-SD.png',2);
/*!40000 ALTER TABLE `storeImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeProducts`
--

DROP TABLE IF EXISTS `storeProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeProducts` (
  `storeProductID` int(11) NOT NULL AUTO_INCREMENT,
  `storeID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`storeProductID`),
  UNIQUE KEY `storeID` (`storeID`,`productID`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeProducts`
--

LOCK TABLES `storeProducts` WRITE;
/*!40000 ALTER TABLE `storeProducts` DISABLE KEYS */;
INSERT INTO `storeProducts` (`storeProductID`, `storeID`, `productID`, `enabled`) VALUES (1,1,1,1),(2,1,2,1),(3,1,21,1),(7,1,5,1),(8,1,6,1),(9,1,7,1),(10,1,8,1),(11,1,9,1),(12,1,10,1),(13,1,11,1),(14,1,12,1),(15,1,13,1),(16,1,16,1),(17,1,17,1),(18,1,18,1),(19,1,19,1),(20,1,20,1);
/*!40000 ALTER TABLE `storeProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeRegionCurrencies`
--

DROP TABLE IF EXISTS `storeRegionCurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeRegionCurrencies` (
  `storeRegionCurrencyID` int(11) NOT NULL AUTO_INCREMENT,
  `storeRegionID` int(11) NOT NULL,
  `billerCurrencyID` int(11) NOT NULL,
  `priority` tinyint(1) NOT NULL,
  PRIMARY KEY (`storeRegionCurrencyID`),
  KEY `storeRegionID` (`storeRegionID`,`billerCurrencyID`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeRegionCurrencies`
--

LOCK TABLES `storeRegionCurrencies` WRITE;
/*!40000 ALTER TABLE `storeRegionCurrencies` DISABLE KEYS */;
INSERT INTO `storeRegionCurrencies` (`storeRegionCurrencyID`, `storeRegionID`, `billerCurrencyID`, `priority`) VALUES (1,1,2,1),(2,2,3,1),(3,4,2,1),(4,5,1,1),(5,6,5,1),(6,7,7,1),(7,7,6,2),(9,8,7,2),(11,8,6,1);
/*!40000 ALTER TABLE `storeRegionCurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeRegions`
--

DROP TABLE IF EXISTS `storeRegions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeRegions` (
  `storeRegionID` int(11) NOT NULL AUTO_INCREMENT,
  `storeID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `countryCodes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`storeRegionID`),
  KEY `storeID` (`storeID`,`name`,`countryCodes`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeRegions`
--

LOCK TABLES `storeRegions` WRITE;
/*!40000 ALTER TABLE `storeRegions` DISABLE KEYS */;
INSERT INTO `storeRegions` (`storeRegionID`, `storeID`, `name`, `code`, `countryCodes`) VALUES (1,1,'International','intl',NULL),(2,1,'Europe','eu','AD,AT,BE,BG,CY,CZ,DK,EE,FI,FR,DE,GR,HU,IE,IT,LV,LT,LU,MT,NL,PL,PT,RO,SK,SI,ES,CH,VA'),(4,1,'USA','us','US'),(5,1,'Australia','au','AU'),(6,1,'UK','uk','GI,IM,GB'),(7,1,'China','cn','CN'),(8,1,'Hong Kong','hk','HK');
/*!40000 ALTER TABLE `storeRegions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeStrings`
--

DROP TABLE IF EXISTS `storeStrings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeStrings` (
  `storeStringID` int(11) NOT NULL AUTO_INCREMENT,
  `stringName` varchar(255) NOT NULL,
  `stringValue` text NOT NULL,
  `languageID` int(11) NOT NULL,
  `themeID` int(11) DEFAULT NULL,
  `storeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`storeStringID`),
  UNIQUE KEY `stringName` (`stringName`,`languageID`,`themeID`,`storeID`),
  KEY `themeID` (`themeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeStrings`
--

LOCK TABLES `storeStrings` WRITE;
/*!40000 ALTER TABLE `storeStrings` DISABLE KEYS */;
INSERT INTO `storeStrings` (`storeStringID`, `stringName`, `stringValue`, `languageID`, `themeID`, `storeID`) VALUES (1,'store_welcome','Welcome to the Fruit Ninja Store!',1,1,1),( 2,'store_welcome','Bienvenue dans la boutique Fruit Ninja!',2,1,1),( 7257,'please_wait','請稍候...',14,1,1);
/*!40000 ALTER TABLE `storeStrings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeThemes`
--

DROP TABLE IF EXISTS `storeThemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeThemes` (
  `storeThemeID` int(11) NOT NULL AUTO_INCREMENT,
  `themeName` varchar(255) NOT NULL,
  `clientID` int(11) DEFAULT NULL,
  `isMobile` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`storeThemeID`),
  UNIQUE KEY `themeName` (`themeName`),
  KEY `isMobile` (`isMobile`),
  KEY `clientID` (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeThemes`
--

LOCK TABLES `storeThemes` WRITE;
/*!40000 ALTER TABLE `storeThemes` DISABLE KEYS */;
INSERT INTO `storeThemes` (`storeThemeID`, `themeName`, `clientID`, `isMobile`) VALUES (1,'HB Fruit Ninja',2,0),(2,'HB Fruit Ninja Mobile',2,1);
/*!40000 ALTER TABLE `storeThemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `storeID` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` varchar(150) NOT NULL,
  `clientID` int(11) NOT NULL,
  `themeID` int(11) NOT NULL,
  `mobileThemeID` int(11) DEFAULT NULL,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`storeID`),
  UNIQUE KEY `domain` (`domain`),
  KEY `storeName` (`storeName`,`themeID`,`mobileThemeID`),
  KEY `clientID` (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`storeID`, `storeName`, `clientID`, `themeID`, `mobileThemeID`, `domain`) VALUES (1,'Fruit Ninja Store',2,1,2,'store.fruitninja.com');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagDomains`
--

DROP TABLE IF EXISTS `tagDomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagDomains` (
  `tagDomainID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `defaultURL` varchar(255) NOT NULL,
  PRIMARY KEY (`tagDomainID`),
  UNIQUE KEY `domain` (`domain`),
  KEY `clientID` (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagDomains`
--

LOCK TABLES `tagDomains` WRITE;
/*!40000 ALTER TABLE `tagDomains` DISABLE KEYS */;
INSERT INTO `tagDomains` (`tagDomainID`, `clientID`, `domain`, `defaultURL`) VALUES (1,2,'j.bn.tl','http://www.halfbrick.com'),(2,2,'f.bn.tl','http://www.halfbrick.com');
/*!40000 ALTER TABLE `tagDomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagLocations`
--

DROP TABLE IF EXISTS `tagLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagLocations` (
  `tagLocationID` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `tagScanID` int(11) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `altitude` int(4) DEFAULT NULL,
  PRIMARY KEY (`tagLocationID`),
  KEY `tagID` (`tagID`,`tagScanID`,`longitude`,`latitude`,`altitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagLocations`
--

LOCK TABLES `tagLocations` WRITE;
/*!40000 ALTER TABLE `tagLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagRedirectRules`
--

DROP TABLE IF EXISTS `tagRedirectRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagRedirectRules` (
  `tagRedirectRuleID` int(11) NOT NULL AUTO_INCREMENT,
  `tagDomainID` int(11) NOT NULL,
  `handsetProviderDeviceID` int(11) NOT NULL,
  `targetURL` varchar(255) DEFAULT NULL,
  `fallbackURL` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`tagRedirectRuleID`),
  KEY `order` (`order`),
  KEY `handsetProviderDeviceID` (`handsetProviderDeviceID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagRedirectRules`
--

LOCK TABLES `tagRedirectRules` WRITE;
/*!40000 ALTER TABLE `tagRedirectRules` DISABLE KEYS */;
INSERT INTO `tagRedirectRules` (`tagRedirectRuleID`, `tagDomainID`, `handsetProviderDeviceID`, `targetURL`, `fallbackURL`, `description`, `order`) VALUES (1,2,2,'fruitninja://','http://download.halfbrick.com/?id=fruit-ninja-hd-paid','iPad Redirect',1),(2,2,1,'fruitninja://','http://download.halfbrick.com/?id=fruit-ninja-sd-paid','iDevice (iPhone, iPod) redirect',2),(3,2,3,NULL,'https://play.google.com/store/apps/details?id=com.halfbrick.fruitninjafree','Global Android Redirect',1),(4,1,5,'jetpack://','http://download.halfbrick.com/?id=jetpack-joyride','Apple Universal Build JetPack Termination',1);
/*!40000 ALTER TABLE `tagRedirectRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagRedirects`
--

DROP TABLE IF EXISTS `tagRedirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagRedirects` (
  `tagRedirectID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  `result` enum('app','fallback','default') NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`tagRedirectID`),
  KEY `clientID` (`clientID`,`tagID`,`result`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagRedirects`
--

LOCK TABLES `tagRedirects` WRITE;
/*!40000 ALTER TABLE `tagRedirects` DISABLE KEYS */;
INSERT INTO `tagRedirects` (`tagRedirectID`, `clientID`, `tagID`, `result`, `timestamp`) VALUES (123,0,0,'',0),( 124,0,0,'',0),( 658,2,432393,'fallback',1380092288),( 657,2,432492,'fallback',1380092158);
/*!40000 ALTER TABLE `tagRedirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagScans`
--

DROP TABLE IF EXISTS `tagScans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagScans` (
  `tagScanID` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `deviceID` varchar(150) NOT NULL,
  `timestamp` int(15) NOT NULL,
  PRIMARY KEY (`tagScanID`),
  KEY `tagID` (`tagID`,`deviceID`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagScans`
--

LOCK TABLES `tagScans` WRITE;
/*!40000 ALTER TABLE `tagScans` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagScans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(64) NOT NULL,
  `type` enum('NFC','QR') NOT NULL,
  `clientID` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tagID`),
  UNIQUE KEY `hash` (`hash`),
  KEY `clientID` (`clientID`,`productID`,`customerID`,`orderID`),
  KEY `batch` (`batch`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=433292 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`tagID`, `hash`, `type`, `clientID`, `productID`, `customerID`, `orderID`, `batch`) VALUES (1,'TF:1ab0616ae454d828571a975cbc604cd3135d762e','NFC',4,2,NULL,NULL,NULL),( 2,'TF:b07a234b544c87ec76abd855841eab4f4fd2edce','NFC',4,2,NULL,NULL,NULL),( 11515,'HB:001:e7d272b2ef60e7ef493422963d96f75af4401388','NFC',2,1,NULL,NULL,'2011-08-23'),( 11516,'HB:001:741bf25720786de64751d6ed229370f1f5d4dfd3','NFC',2,1,NULL,NULL,'2011-08-23');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionLogs`
--

DROP TABLE IF EXISTS `transactionLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactionLogs` (
  `transactionLogID` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(120) NOT NULL,
  `field` varchar(80) DEFAULT NULL,
  `response` text,
  `status` varchar(120) DEFAULT NULL,
  `timestamp` int(15) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactionLogID`),
  KEY `action` (`action`,`status`,`timestamp`),
  KEY `field` (`field`)
) ENGINE=InnoDB AUTO_INCREMENT=79720 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionLogs`
--

LOCK TABLES `transactionLogs` WRITE;
/*!40000 ALTER TABLE `transactionLogs` DISABLE KEYS */;
INSERT INTO `transactionLogs` (`transactionLogID`, `action`, `field`, `response`, `status`, `timestamp`, `created`) VALUES (23035,'dispatchDeferred','18268','Initial Email Sent','1',1367079541,'2013-04-27 16:17:34'),( 79718,'dispatchDeferred','46143','Initial Email Sent','1',1382081581,'2013-10-18 07:37:34'),( 79719,'dispatchDeferred','46144','Initial Email Sent','1',1382082122,'2013-10-18 07:46:35');
/*!40000 ALTER TABLE `transactionLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `translationID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `languageID` int(11) NOT NULL,
  `string` text NOT NULL COMMENT 'The string translation',
  `customFieldID` int(11) DEFAULT NULL,
  `clientID` int(11) NOT NULL,
  PRIMARY KEY (`translationID`),
  UNIQUE KEY `customFieldID` (`customFieldID`,`languageID`,`clientID`),
  KEY `clientID` (`clientID`,`languageID`,`string`(200)),
  KEY `clientID_2` (`clientID`,`customFieldID`)
) ENGINE=InnoDB AUTO_INCREMENT=55794 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`translationID`, `languageID`, `string`, `customFieldID`, `clientID`) VALUES (76,1,'iPhone Case',1,2),( 77,16,'iPhone Case',1,2),( 78,2,'Coque iPhone',1,2),( 79,4,'Custodia per iPhone',1,2),( 9589,8,'入荷しました！',630,2),( 9590,3,'到达！',630,2),( 9591,9,'DE LLEGAR!',630,2);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `contactEmail` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `contactName` varchar(80) NOT NULL,
  `contactPhone` varchar(80) DEFAULT NULL,
  `status` enum('pending','active','disabled') NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `aclGroupID` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `uniqueEmail` (`contactEmail`),
  KEY `clientID` (`clientID`,`contactEmail`,`password`,`level`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userID`, `clientID`, `contactEmail`, `password`, `level`, `contactName`, `contactPhone`, `status`, `created`, `modified`, `aclGroupID`) VALUES (1,1,'simon.yorkston@gmail.com','1fdd687a57fd74c2838e6980abfacf42ea6899d9',63,'Simon Yorkston','+33618315722','active','2011-07-16 10:58:14','2012-05-23 05:52:33',1),(2,1,'mark.verstege@gmail.com','7f90bf3f3bf5f93a6037d6598790909cd1ab9a9f',63,'Mark Verstege','+61 403 804 218','active','2011-07-20 09:26:26','2012-05-23 05:52:36',1);
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

-- Dump completed on 2013-10-18  3:51:53
