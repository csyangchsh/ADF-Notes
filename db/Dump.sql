CREATE DATABASE  IF NOT EXISTS `hr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hr`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: hr
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `biographies`
--

DROP TABLE IF EXISTS `biographies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biographies` (
  `EMPLOYEE_ID` decimal(6,0) DEFAULT NULL,
  `BIO_UPDATED_DATE` datetime DEFAULT NULL,
  `BIOGRAPHY` longtext,
  UNIQUE KEY `BIOGRAPHIES_PK` (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biographies`
--

LOCK TABLES `biographies` WRITE;
/*!40000 ALTER TABLE `biographies` DISABLE KEYS */;
/*!40000 ALTER TABLE `biographies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `COUNTRY_ID` varchar(2) DEFAULT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` bigint(22) DEFAULT NULL,
  UNIQUE KEY `COUNTRY_C_ID_PK` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AR','Argentina',2),('AU','Australia',3),('BE','Belgium',1),('BR','Brazil',2),('CA','Canada',2),('CH','Switzerland',1),('CN','China',3),('DE','Germany',1),('DK','Denmark',1),('EG','Egypt',4),('FR','France',1),('IL','Israel',4),('IN','India',3),('IT','Italy',1),('JP','Japan',3),('KW','Kuwait',4),('ML','Malaysia',3),('MX','Mexico',2),('NG','Nigeria',4),('NL','Netherlands',1),('SG','Singapore',3),('UK','United Kingdom',1),('US','United States of America',2),('ZM','Zambia',4),('ZW','Zimbabwe',4);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(30) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `LOCATION_ID` decimal(4,0) DEFAULT NULL,
  UNIQUE KEY `DEPT_ID_PK` (`DEPARTMENT_ID`),
  KEY `DEPT_LOCATION_IX` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(30,'Purchasing',114,1700),(40,'Human Resources',203,2400),(50,'Shipping',121,1500),(60,'IT',103,1400),(70,'Public Relations',204,2700),(80,'Sales',145,2500),(90,'Executive',100,1700),(100,'Finance',108,1700),(110,'Accounting',205,1700),(120,'Treasury',NULL,1700),(130,'Corporate Tax',NULL,1700),(140,'Control And Credit',NULL,1700),(150,'Shareholder Services',NULL,1700),(160,'Benefits',NULL,1700),(170,'Manufacturing',NULL,1700),(180,'Construction',NULL,1700),(190,'Contracting',NULL,1700),(200,'Operations',NULL,1700),(210,'IT Support',NULL,1700),(220,'NOC',NULL,1700),(230,'IT Helpdesk',NULL,1700),(240,'Government Sales',NULL,1700),(250,'Retail Sales',NULL,1700),(260,'Recruiting',NULL,1700),(270,'Payroll',NULL,1700);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EMPLOYEE_ID` decimal(6,0) DEFAULT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` datetime DEFAULT NULL,
  `JOB_ID` varchar(10) DEFAULT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  `CREATED_BY` varchar(30) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(30) DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  UNIQUE KEY `EMP_EMP_ID_PK` (`EMPLOYEE_ID`),
  KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `EMP_JOB_IX` (`JOB_ID`),
  KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Steven','King','SKING','515.123.4567','2003-06-17 00:00:00','AD_PRES',30000.00,0.20,NULL,90,'HR','1980-01-01 12:12:00',NULL,NULL),(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','2005-09-21 00:00:00','AD_VP',17000.00,NULL,100,90,'HR','1980-01-01 12:12:00',NULL,NULL),(102,'Lex','De Haan','LDEHAAN','515.123.4569','2001-01-13 00:00:00','AD_VP',17000.00,NULL,100,90,'HR','1980-01-01 12:12:00',NULL,NULL),(103,'Alexander','Hunold','AHUNOLD','590.423.4567','2006-01-03 00:00:00','IT_PROG',9000.00,NULL,102,60,'HR','1980-01-01 12:12:00',NULL,NULL),(104,'Bruce','Ernst','BERNST','590.423.4568','2007-05-21 00:00:00','IT_PROG',6000.00,NULL,103,60,'HR','1980-01-01 12:12:00',NULL,NULL),(105,'David','Austin','DAUSTIN','590.423.4569','2005-06-25 00:00:00','IT_PROG',4800.00,NULL,103,60,'HR','1980-01-01 12:12:00',NULL,NULL),(106,'Valli','Pataballa','VPATABAL','590.423.4560','2006-02-05 00:00:00','IT_PROG',4800.00,NULL,103,60,'HR','1980-01-01 12:12:00',NULL,NULL),(107,'Diana','Lorentz','DLORENTZ','590.423.5567','2007-02-07 00:00:00','IT_PROG',4200.00,NULL,103,60,'HR','1980-01-01 12:12:00',NULL,NULL),(108,'Nancy','Greenberg','NGREENBE','515.124.4569','2002-08-17 00:00:00','FI_MGR',12008.00,NULL,101,100,'HR','1980-01-01 12:12:00',NULL,NULL),(109,'Daniel','Faviet','DFAVIET','515.124.4169','2002-08-16 00:00:00','FI_ACCOUNT',9000.00,NULL,108,100,'HR','1980-01-01 12:12:00',NULL,NULL),(110,'John','Chen','JCHEN','515.124.4269','2005-09-28 00:00:00','FI_ACCOUNT',8200.00,NULL,108,100,'HR','1980-01-01 12:12:00',NULL,NULL),(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','2005-09-30 00:00:00','FI_ACCOUNT',7700.00,NULL,108,100,'HR','1980-01-01 12:12:00',NULL,NULL),(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','2006-03-07 00:00:00','FI_ACCOUNT',7800.00,NULL,108,100,'HR','1980-01-01 12:12:00',NULL,NULL),(113,'Luis','Popp','LPOPP','515.124.4567','2007-12-07 00:00:00','FI_ACCOUNT',6900.00,NULL,108,100,'HR','1980-01-01 12:12:00',NULL,NULL),(114,'Den','Raphaely','DRAPHEAL','515.127.4561','2002-12-07 00:00:00','PU_MAN',11000.00,NULL,100,30,'HR','1980-01-01 12:12:00',NULL,NULL),(115,'Alexander','Khoo','AKHOO','515.127.4562','2003-05-18 00:00:00','PU_CLERK',3100.00,NULL,114,30,'HR','1980-01-01 12:12:00',NULL,NULL),(116,'Shelli','Baida','SBAIDA','515.127.4563','2005-12-24 00:00:00','PU_CLERK',2900.00,NULL,114,30,'HR','1980-01-01 12:12:00',NULL,NULL),(117,'Sigal','Tobias','STOBIAS','515.127.4564','2005-07-24 00:00:00','PU_CLERK',2800.00,NULL,114,30,'HR','1980-01-01 12:12:00',NULL,NULL),(118,'Guy','Himuro','GHIMURO','515.127.4565','2006-11-15 00:00:00','PU_CLERK',2600.00,NULL,114,30,'HR','1980-01-01 12:12:00',NULL,NULL),(119,'Karen','Colmenares','KCOLMENA','515.127.4566','2007-08-10 00:00:00','PU_CLERK',2500.00,NULL,114,30,'HR','1980-01-01 12:12:00',NULL,NULL),(120,'Matthew','Weiss','MWEISS','650.123.1234','2004-07-18 00:00:00','ST_MAN',8000.00,NULL,100,50,'HR','1980-01-01 12:12:00',NULL,NULL),(121,'Adam','Fripp','AFRIPP','650.123.2234','2005-04-10 00:00:00','ST_MAN',8200.00,NULL,100,50,'HR','1980-01-01 12:12:00',NULL,NULL),(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','2003-05-01 00:00:00','ST_MAN',7900.00,NULL,100,50,'HR','1980-01-01 12:12:00',NULL,NULL),(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','2005-10-10 00:00:00','ST_MAN',6500.00,NULL,100,50,'HR','1980-01-01 12:12:00',NULL,NULL),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','2007-11-16 00:00:00','ST_MAN',5800.00,NULL,100,50,'HR','1980-01-01 12:12:00',NULL,NULL),(125,'Julia','Nayer','JNAYER','650.124.1214','2005-07-16 00:00:00','ST_CLERK',3200.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','2006-09-28 00:00:00','ST_CLERK',2700.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(127,'James','Landry','JLANDRY','650.124.1334','2007-01-14 00:00:00','ST_CLERK',2400.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(128,'Steven','Markle','SMARKLE','650.124.1434','2008-03-08 00:00:00','ST_CLERK',2200.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(129,'Laura','Bissot','LBISSOT','650.124.5234','2005-08-20 00:00:00','ST_CLERK',3300.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','2005-10-30 00:00:00','ST_CLERK',2800.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(131,'James','Marlow','JAMRLOW','650.124.7234','2005-02-16 00:00:00','ST_CLERK',2500.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(132,'TJ','Olson','TJOLSON','650.124.8234','2007-04-10 00:00:00','ST_CLERK',2100.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(133,'Jason','Mallin','JMALLIN','650.127.1934','2004-06-14 00:00:00','ST_CLERK',3300.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(134,'Michael','Rogers','MROGERS','650.127.1834','2006-08-26 00:00:00','ST_CLERK',2900.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(135,'Ki','Gee','KGEE','650.127.1734','2007-12-12 00:00:00','ST_CLERK',2400.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','2008-02-06 00:00:00','ST_CLERK',2200.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(137,'Renske','Ladwig','RLADWIG','650.121.1234','2003-07-14 00:00:00','ST_CLERK',3600.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL),(138,'Stephen','Stiles','SSTILES','650.121.2034','2005-10-26 00:00:00','ST_CLERK',3200.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL),(139,'John','Seo','JSEO','650.121.2019','2006-02-12 00:00:00','ST_CLERK',2700.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL),(140,'Joshua','Patel','JPATEL','650.121.1834','2006-04-06 00:00:00','ST_CLERK',2500.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL),(141,'Trenna','Rajs','TRAJS','650.121.8009','2003-10-17 00:00:00','ST_CLERK',3500.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(142,'Curtis','Davies','CDAVIES','650.121.2994','2005-01-29 00:00:00','ST_CLERK',3100.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(143,'Randall','Matos','RMATOS','650.121.2874','2006-03-15 00:00:00','ST_CLERK',2600.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(144,'Peter','Vargas','PVARGAS','650.121.2004','2006-07-09 00:00:00','ST_CLERK',2500.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(145,'John','Russell','JRUSSEL','011.44.1344.429268','2004-10-01 00:00:00','SA_MAN',14000.00,0.40,100,80,'HR','1980-01-01 12:12:00',NULL,NULL),(146,'Karen','Partners','KPARTNER','011.44.1344.467268','2005-01-05 00:00:00','SA_MAN',13500.00,0.30,100,80,'HR','1980-01-01 12:12:00',NULL,NULL),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','2005-03-10 00:00:00','SA_MAN',12000.00,0.30,100,80,'HR','1980-01-01 12:12:00',NULL,NULL),(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','2007-10-15 00:00:00','SA_MAN',11000.00,0.30,100,80,'HR','1980-01-01 12:12:00',NULL,NULL),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2008-01-29 00:00:00','SA_MAN',10500.00,0.20,100,80,'HR','1980-01-01 12:12:00',NULL,NULL),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','2005-01-30 00:00:00','SA_REP',10000.00,0.30,145,80,'HR','1980-01-01 12:12:00',NULL,NULL),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','2005-03-24 00:00:00','SA_REP',9500.00,0.25,145,80,'HR','1980-01-01 12:12:00',NULL,NULL),(152,'Peter','Hall','PHALL','011.44.1344.478968','2005-08-20 00:00:00','SA_REP',9000.00,0.25,145,80,'HR','1980-01-01 12:12:00',NULL,NULL),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','2006-03-30 00:00:00','SA_REP',8000.00,0.20,145,80,'HR','1980-01-01 12:12:00',NULL,NULL),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','2006-12-09 00:00:00','SA_REP',7500.00,0.20,145,80,'HR','1980-01-01 12:12:00',NULL,NULL),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','2007-11-23 00:00:00','SA_REP',7000.00,0.15,145,80,'HR','1980-01-01 12:12:00',NULL,NULL),(156,'Janette','King','JKING','011.44.1345.429268','2004-01-30 00:00:00','SA_REP',10000.00,0.35,146,80,'HR','1980-01-01 12:12:00',NULL,NULL),(157,'Patrick','Sully','PSULLY','011.44.1345.929268','2004-03-04 00:00:00','SA_REP',9500.00,0.35,146,80,'HR','1980-01-01 12:12:00',NULL,NULL),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','2004-08-01 00:00:00','SA_REP',9000.00,0.35,146,80,'HR','1980-01-01 12:12:00',NULL,NULL),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','2005-03-10 00:00:00','SA_REP',8000.00,0.30,146,80,'HR','1980-01-01 12:12:00',NULL,NULL),(160,'Louise','Doran','LDORAN','011.44.1345.629268','2005-12-15 00:00:00','SA_REP',7500.00,0.30,146,80,'HR','1980-01-01 12:12:00',NULL,NULL),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','2006-11-03 00:00:00','SA_REP',7000.00,0.25,146,80,'HR','1980-01-01 12:12:00',NULL,NULL),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','2005-11-11 00:00:00','SA_REP',10500.00,0.25,147,80,'HR','1980-01-01 12:12:00',NULL,NULL),(163,'Danielle','Greene','DGREENE','011.44.1346.229268','2007-03-19 00:00:00','SA_REP',9500.00,0.15,147,80,'HR','1980-01-01 12:12:00',NULL,NULL),(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','2008-01-24 00:00:00','SA_REP',7200.00,0.10,147,80,'HR','1980-01-01 12:12:00',NULL,NULL),(165,'David','Lee','DLEE','011.44.1346.529268','2008-02-23 00:00:00','SA_REP',6800.00,0.10,147,80,'HR','1980-01-01 12:12:00',NULL,NULL),(166,'Sundar','Ande','SANDE','011.44.1346.629268','2008-03-24 00:00:00','SA_REP',6400.00,0.10,147,80,'HR','1980-01-01 12:12:00',NULL,NULL),(167,'Amit','Banda','ABANDA','011.44.1346.729268','2008-04-21 00:00:00','SA_REP',6200.00,0.10,147,80,'HR','1980-01-01 12:12:00',NULL,NULL),(168,'Lisa','Ozer','LOZER','011.44.1343.929268','2005-03-11 00:00:00','SA_REP',11500.00,0.25,148,80,'HR','1980-01-01 12:12:00',NULL,NULL),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','2006-03-23 00:00:00','SA_REP',10000.00,0.20,148,80,'HR','1980-01-01 12:12:00',NULL,NULL),(170,'Tayler','Fox','TFOX','011.44.1343.729268','2006-01-24 00:00:00','SA_REP',9600.00,0.20,148,80,'HR','1980-01-01 12:12:00',NULL,NULL),(171,'William','Smith','WSMITH','011.44.1343.629268','2007-02-23 00:00:00','SA_REP',7400.00,0.15,148,80,'HR','1980-01-01 12:12:00',NULL,NULL),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','2007-03-24 00:00:00','SA_REP',7300.00,0.15,148,80,'HR','1980-01-01 12:12:00',NULL,NULL),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','2008-04-21 00:00:00','SA_REP',6100.00,0.10,148,80,'HR','1980-01-01 12:12:00',NULL,NULL),(174,'Ellen','Abel','EABEL','011.44.1644.429267','2004-05-11 00:00:00','SA_REP',11000.00,0.30,149,80,'HR','1980-01-01 12:12:00',NULL,NULL),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','2005-03-19 00:00:00','SA_REP',8800.00,0.25,149,80,'HR','1980-01-01 12:12:00',NULL,NULL),(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','2006-03-24 00:00:00','SA_REP',8600.00,0.20,149,80,'HR','1980-01-01 12:12:00',NULL,NULL),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','2006-04-23 00:00:00','SA_REP',8400.00,0.20,149,80,'HR','1980-01-01 12:12:00',NULL,NULL),(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','2007-05-24 00:00:00','SA_REP',7000.00,0.15,149,NULL,'HR','1980-01-01 12:12:00',NULL,NULL),(180,'Winston','Taylor','WTAYLOR','650.507.9876','2006-01-24 00:00:00','SH_CLERK',3200.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(181,'Jean','Fleaur','JFLEAUR','650.507.9877','2006-02-23 00:00:00','SH_CLERK',3100.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(182,'Martha','Sullivan','MSULLIVA','650.507.9878','2007-06-21 00:00:00','SH_CLERK',2500.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(183,'Girard','Geoni','GGEONI','650.507.9879','2008-02-03 00:00:00','SH_CLERK',2800.00,NULL,120,50,'HR','1980-01-01 12:12:00',NULL,NULL),(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','2004-01-27 00:00:00','SH_CLERK',4200.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(185,'Alexis','Bull','ABULL','650.509.2876','2005-02-20 00:00:00','SH_CLERK',4100.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(187,'Anthony','Cabrio','ACABRIO','650.509.4876','2007-02-07 00:00:00','SH_CLERK',3000.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(188,'Kelly','Chung','KCHUNG','650.505.1876','2005-06-14 00:00:00','SH_CLERK',3800.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(189,'Jennifer','Dilly','JDILLY','650.505.2876','2005-08-13 00:00:00','SH_CLERK',3600.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(190,'Timothy','Gates','TGATES','650.505.3876','2006-07-11 00:00:00','SH_CLERK',2900.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(191,'Randall','Perkins','RPERKINS','650.505.4876','2007-12-19 00:00:00','SH_CLERK',2500.00,NULL,122,50,'HR','1980-01-01 12:12:00',NULL,NULL),(192,'Sarah','Bell','SBELL','650.501.1876','2004-02-04 00:00:00','SH_CLERK',4000.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL),(194,'Samuel','McCain','SMCCAIN','650.501.3876','2006-07-01 00:00:00','SH_CLERK',3200.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL),(195,'Vance','Jones','VJONES','650.501.4876','2007-03-17 00:00:00','SH_CLERK',2800.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL),(196,'Alana','Walsh','AWALSH','650.507.9811','2006-04-24 00:00:00','SH_CLERK',3100.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(197,'Kevin','Feeney','KFEENEY','650.507.9822','2006-05-23 00:00:00','SH_CLERK',3000.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(198,'Donald','OConnell','DOCONNEL','650.507.9833','2007-06-21 00:00:00','SH_CLERK',2600.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(199,'Douglas','Grant','DGRANT','650.507.9844','2008-01-13 00:00:00','SH_CLERK',2600.00,NULL,124,50,'HR','1980-01-01 12:12:00',NULL,NULL),(200,'Jennifer','Whalen','JWHALEN','515.123.4444','2003-09-17 00:00:00','AD_ASST',4400.00,NULL,101,10,'HR','1980-01-01 12:12:00',NULL,NULL),(201,'Michael','Hartstein','MHARTSTE','515.123.5555','2004-02-17 00:00:00','MK_MAN',13000.00,NULL,100,20,'HR','1980-01-01 12:12:00',NULL,NULL),(202,'Pat','Fay','PFAY','603.123.6666','2005-08-17 00:00:00','MK_REP',6000.00,NULL,201,20,'HR','1980-01-01 12:12:00',NULL,NULL),(203,'Susan','Mavris','SMAVRIS','515.123.7777','2002-06-07 00:00:00','HR_REP',6500.00,NULL,101,40,'HR','1980-01-01 12:12:00',NULL,NULL),(204,'Hermann','Baer','HBAER','515.123.8888','2002-06-07 00:00:00','PR_REP',10000.00,NULL,101,70,'HR','1980-01-01 12:12:00',NULL,NULL),(205,'Shelley','Higgins','SHIGGINS','515.123.8080','2002-06-07 00:00:00','AC_MGR',12008.00,NULL,101,110,'HR','1980-01-01 12:12:00',NULL,NULL),(206,'William','Gietz','WGIETZ','515.123.8181','2002-06-07 00:00:00','AC_ACCOUNT',8300.00,NULL,205,110,'HR','1980-01-01 12:12:00',NULL,NULL),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','2008-01-04 00:00:00','SA_REP',6200.00,0.10,149,80,'HR','1980-01-01 12:12:00',NULL,NULL),(186,'Julia','Dellinger','JDELLING','650.509.3876','2006-06-24 00:00:00','SH_CLERK',3400.00,NULL,121,50,'HR','1980-01-01 12:12:00',NULL,NULL),(193,'Britney','Everett','BEVERETT','650.501.2876','2005-03-03 00:00:00','SH_CLERK',3900.00,NULL,123,50,'HR','1980-01-01 12:12:00',NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_usages`
--

DROP TABLE IF EXISTS `image_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_usages` (
  `IMAGE_ID` decimal(6,0) DEFAULT NULL,
  `USAGE_TYPE` varchar(1) DEFAULT NULL,
  `ASSOCIATED_ID` decimal(6,0) DEFAULT NULL,
  `DEFAULT_IMAGE` varchar(1) DEFAULT NULL,
  UNIQUE KEY `IMAGE_USAGES_PK` (`IMAGE_ID`,`USAGE_TYPE`,`ASSOCIATED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_usages`
--

LOCK TABLES `image_usages` WRITE;
/*!40000 ALTER TABLE `image_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `IMAGE_ID` decimal(6,0) DEFAULT NULL,
  `IMAGE` varchar(120) DEFAULT NULL,
  UNIQUE KEY `IMAGES_PK` (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_history` (
  `EMPLOYEE_ID` decimal(6,0) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `JOB_ID` varchar(10) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  UNIQUE KEY `JHIST_EMP_ID_ST_DATE_PK` (`EMPLOYEE_ID`,`START_DATE`),
  KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
  KEY `JHIST_JOB_IX` (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` VALUES (102,'2001-01-13 00:00:00','2006-07-24 00:00:00','IT_PROG',60),(101,'1997-09-21 00:00:00','2001-10-27 00:00:00','AC_ACCOUNT',110),(101,'2001-10-28 00:00:00','2005-03-15 00:00:00','AC_MGR',110),(201,'2004-02-17 00:00:00','2007-12-19 00:00:00','MK_REP',20),(114,'2006-03-24 00:00:00','2007-12-31 00:00:00','ST_CLERK',50),(122,'2007-01-01 00:00:00','2007-12-31 00:00:00','ST_CLERK',50),(200,'1995-09-17 00:00:00','2001-06-17 00:00:00','AD_ASST',90),(176,'2006-03-24 00:00:00','2006-12-31 00:00:00','SA_REP',80),(176,'2007-01-01 00:00:00','2007-12-31 00:00:00','SA_MAN',80),(200,'2002-07-01 00:00:00','2006-12-31 00:00:00','AC_ACCOUNT',90);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) DEFAULT NULL,
  `JOB_TITLE` varchar(35) DEFAULT NULL,
  `MIN_SALARY` decimal(6,0) DEFAULT NULL,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL,
  UNIQUE KEY `JOB_ID_PK` (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('AD_PRES','President',20080,40000),('AD_VP','Administration Vice President',15000,30000),('AD_ASST','Administration Assistant',3000,6000),('FI_MGR','Finance Manager',8200,16000),('FI_ACCOUNT','Accountant',4200,9000),('AC_MGR','Accounting Manager',8200,16000),('AC_ACCOUNT','Public Accountant',4200,9000),('SA_MAN','Sales Manager',10000,20080),('SA_REP','Sales Representative',6000,12008),('PU_MAN','Purchasing Manager',8000,15000),('PU_CLERK','Purchasing Clerk',2500,5500),('ST_MAN','Stock Manager',5500,8500),('ST_CLERK','Stock Clerk',2008,5000),('SH_CLERK','Shipping Clerk',2500,5500),('IT_PROG','Programmer',4000,10000),('MK_MAN','Marketing Manager',9000,15000),('MK_REP','Marketing Representative',4000,9000),('HR_REP','Human Resources Representative',4000,9000),('PR_REP','Public Relations Representative',4500,10500);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `LOCATION_ID` decimal(4,0) DEFAULT NULL,
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) DEFAULT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` varchar(2) DEFAULT NULL,
  UNIQUE KEY `LOC_ID_PK` (`LOCATION_ID`),
  KEY `LOC_CITY_IX` (`CITY`),
  KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
  KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT'),(1100,'93091 Calle della Testa','10934','Venice',NULL,'IT'),(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),(1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP'),(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),(2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN'),(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),(2300,'198 Clementi North','540198','Singapore',NULL,'SG'),(2400,'8204 Arthur St',NULL,'London',NULL,'UK'),(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'),(2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK'),(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),(2800,'Rua Frei Caneca 1360','01307-002','Sao Paulo','Sao Paulo','BR'),(2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),(3000,'Murtenstrasse 921','3095','Bern','BE','CH'),(3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL'),(3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndong_city`
--

DROP TABLE IF EXISTS `ndong_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndong_city` (
  `CITY_ID` decimal(15,0) DEFAULT NULL,
  `COUNTRY_CODE` varchar(2) DEFAULT NULL,
  `CITY_NAME` varchar(250) DEFAULT NULL,
  UNIQUE KEY `SYS_C007714` (`CITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndong_city`
--

LOCK TABLES `ndong_city` WRITE;
/*!40000 ALTER TABLE `ndong_city` DISABLE KEYS */;
INSERT INTO `ndong_city` VALUES (1,'US','New York'),(2,'US','Washinton DC'),(3,'US','Dallas'),(4,'US','San Francisco'),(11,'CN','Beijing'),(12,'CN','Shanghai'),(21,'UK','London'),(31,'FR','Paris'),(41,'JP','Tokyo');
/*!40000 ALTER TABLE `ndong_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndong_country`
--

DROP TABLE IF EXISTS `ndong_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndong_country` (
  `COUNTRY_CODE` varchar(2) DEFAULT NULL,
  `COUNTRY_NAME` varchar(250) DEFAULT NULL,
  UNIQUE KEY `SYS_C007713` (`COUNTRY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndong_country`
--

LOCK TABLES `ndong_country` WRITE;
/*!40000 ALTER TABLE `ndong_country` DISABLE KEYS */;
INSERT INTO `ndong_country` VALUES ('US','United States'),('FR','France'),('CN','China'),('UK','United Kingdom'),('JP','Japan');
/*!40000 ALTER TABLE `ndong_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndong_dept`
--

DROP TABLE IF EXISTS `ndong_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndong_dept` (
  `DEPTNO` decimal(15,0) DEFAULT NULL,
  `DNAME` varchar(30) DEFAULT NULL,
  UNIQUE KEY `SYS_C007716` (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndong_dept`
--

LOCK TABLES `ndong_dept` WRITE;
/*!40000 ALTER TABLE `ndong_dept` DISABLE KEYS */;
INSERT INTO `ndong_dept` VALUES (1,'RESEARCH'),(2,'ACCOUNTING'),(3,'DEVELOPMENT'),(4,'MARKETING');
/*!40000 ALTER TABLE `ndong_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndong_emp`
--

DROP TABLE IF EXISTS `ndong_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndong_emp` (
  `EMPNO` decimal(15,0) DEFAULT NULL,
  `ENAME` varchar(60) DEFAULT NULL,
  `DEPTNO` decimal(15,0) DEFAULT NULL,
  `ORGANIZATION_ID` decimal(15,0) DEFAULT NULL,
  `BIRTH_OF_COUNTRY` varchar(2) DEFAULT NULL,
  `BIRTH_OF_CITY` decimal(15,0) DEFAULT NULL,
  UNIQUE KEY `SYS_C007717` (`EMPNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndong_emp`
--

LOCK TABLES `ndong_emp` WRITE;
/*!40000 ALTER TABLE `ndong_emp` DISABLE KEYS */;
INSERT INTO `ndong_emp` VALUES (1,'Steve Harris',1,10,'US',1),(2,'Tom Gilbert',1,11,'US',2),(3,'Henry Yuan',2,21,'CN',11);
/*!40000 ALTER TABLE `ndong_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndong_organization`
--

DROP TABLE IF EXISTS `ndong_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndong_organization` (
  `ORGANIZATION_ID` decimal(15,0) DEFAULT NULL,
  `ORGANIZATION_NAME` varchar(60) DEFAULT NULL,
  `BUSINESS_GROUP_ID` decimal(15,0) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  UNIQUE KEY `SYS_C007715` (`ORGANIZATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndong_organization`
--

LOCK TABLES `ndong_organization` WRITE;
/*!40000 ALTER TABLE `ndong_organization` DISABLE KEYS */;
INSERT INTO `ndong_organization` VALUES (0,'Setup',0,NULL,NULL,NULL),(10,'Oracle',10,NULL,NULL,NULL),(11,'Oracle US',10,NULL,NULL,NULL),(12,'Oracle JP',10,NULL,NULL,NULL),(20,'Wells Fargo',20,NULL,NULL,NULL),(21,'Wells Fargo ABC',20,NULL,NULL,NULL),(22,'Popular Operation',30,NULL,NULL,NULL),(30,'Citibank',30,NULL,NULL,NULL),(31,'Citibank Operation',30,NULL,NULL,NULL),(32,'Citibank Something',30,NULL,NULL,NULL),(33,'Popular Operation',30,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ndong_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ps_txn`
--

DROP TABLE IF EXISTS `ps_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_txn` (
  `ID` decimal(20,0) DEFAULT NULL,
  `PARENTID` decimal(20,0) DEFAULT NULL,
  `COLLID` decimal(10,0) DEFAULT NULL,
  `CONTENT` longblob,
  `CREATION_DATE` datetime DEFAULT NULL,
  KEY `PS_TXN_IDX` (`COLLID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ps_txn`
--

LOCK TABLES `ps_txn` WRITE;
/*!40000 ALTER TABLE `ps_txn` DISABLE KEYS */;
INSERT INTO `ps_txn` VALUES (1,-1,1,'¬í\0sr\0$oracle.jbo.server.DBSerializer$AMRowæýÅŒ„\0J\0\nmPersistIdL\0this$0t\0 Loracle/jbo/server/DBSerializer;L\0xmlDoct\0\"Loracle/xml/parser/v2/XMLDocument;xpz\0\0ø\0\0\0\0\0\0\0<AM MomVer=\"0\"><cd/><TXN Def=\"1\" New=\"0\" Lok=\"1\" tsi=\"0\" pcid=\"1\"/><CONN/><VO><VO sig=\"1343098425238\" qf=\"0\" ut=\"0\" da=\"1\" cs=\"0\" It=\"1\" Sz=\"25\" im=\"1\" Ex=\"empty\" Def=\"lt.andrejusb.model.views.EmployeesView\" Name=\"EmployeesView1\"><VC n=\"EmployeesViewCriteria\" d=\"true\" c=\"1\" bv=\"true\" m=\"1\" j=\"false\"><vcp><p n=\"allowConjunctionOverride\" v=\"true\"/><p n=\"autoExecute\" v=\"false\"/><p n=\"showInList\" v=\"true\"/><p n=\"displayOperators\" v=\"InAdvancedMode\"/><p n=\"mode\" v=\"Advanced\"/></vcp><Row n=\"vcrow0\" uc=\"1\" cj=\"0\"><a i=\"1\"><i o=\"STARTSWITH\" cj=\"1\" uc=\"1\" r=\"2\" vb=\"false\" g=\"true\" e=\"false\" re=\"false\"><co coi=\"ISBLANK\" cot=\"-1\" cod=\"\" coo=\"IS NULL\" cox=\"0\" con=\"0\" coe=\"\"/><iv i=\"0\" b=\"1\" sf=\"0\"><![CDATA[:firstName]]></iv></i></a><a i=\"2\"><i o=\"STARTSWITH\" cj=\"1\" uc=\"1\" r=\"2\" vb=\"false\" g=\"true\" e=\"false\" re=\"false\"><iv i=\"0\" b=\"1\" sf=\"0\"><![CDATA[:lastName]]></iv></i></a></Row></VC></VO><VO sig=\"1343098425249\" qf=\"1\" RS=\"0\" Def=\"lt.andrejusb.model.views.EmployeesView\" Name=\"EmployeesView2\"/></VO></AM>x','2012-07-24 10:55:45');
/*!40000 ALTER TABLE `ps_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `REGION_ID` bigint(22) DEFAULT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL,
  UNIQUE KEY `REG_ID_PK` (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Middle East and Africa');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-20 18:40:07
