USE baza2;

DROP TABLE IF EXISTS `pogledSoba`;
DROP VIEW IF EXISTS `pogledSoba`;

SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8mb4;

CREATE VIEW `pogledSoba` AS 
SELECT 
  1 AS `brojSobe`,
  1 AS `tipSobeID`,
  1 AS `objekatID`,
  1 AS `nazivObjekta`,
  1 AS `brojKreveta`,
  1 AS `cijena`;

SET character_set_client = @saved_cs_client;

DROP TABLE IF EXISTS `rezervacije`;
CREATE TABLE `rezervacije` (
  `idRezervacije` int NOT NULL AUTO_INCREMENT,
  `sifraKupca` int DEFAULT NULL,
  `brojSobe` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datumDolaska` date DEFAULT NULL,
  `datumOdlaska` date DEFAULT NULL,
  `ukupnaCijena` int DEFAULT NULL,
  `brojGostiju` int DEFAULT NULL,
  PRIMARY KEY (`idRezervacije`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `alotman`;
CREATE TABLE `alotman` (
  `sifraAlotman` int NOT NULL AUTO_INCREMENT,
  `datumPotpisivanja` date DEFAULT NULL,
  `datumIsteka` date DEFAULT NULL,
  `datumPocetkaVazenja` date DEFAULT NULL,
  `sifraAgencije` int DEFAULT NULL,
  PRIMARY KEY (`sifraAlotman`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `agencija`;
CREATE TABLE `agencija` (
  `sifraAgencije` int NOT NULL AUTO_INCREMENT,
  `nazivAgencije` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ulica` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kucniBroj` int DEFAULT NULL,
  `idMjesto` int DEFAULT NULL,
  `postanskiBroj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idDrzava` int DEFAULT NULL,
  PRIMARY KEY (`sifraAgencije`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `benefiti`;
CREATE TABLE `benefiti` (
  `idBenefita` int NOT NULL AUTO_INCREMENT,
  `nazivBenefita` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idBenefita`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `benefitiSobe`;
CREATE TABLE `benefitiSobe` (
  `brojSobe` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idBenefita` int DEFAULT NULL,
  UNIQUE KEY `uk_benefitiSobe` (`brojSobe`, `idBenefita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mjestoBoravka` (
  `idMjestaBoravka` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nazivMjesta` varchar(40)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tipSobe`;
CREATE TABLE `tipSobe` (
  `tipSobeID` int NOT NULL,
  `brojKreveta` tinyint DEFAULT NULL,
  `cijena` int DEFAULT NULL,
  PRIMARY KEY (`tipSobeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `idStatus` int NOT NULL,
  `nazivStatusa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `drzava`;
CREATE TABLE `drzava` (
  `idDrzave` int NOT NULL AUTO_INCREMENT,
  `nazivDrzave` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idDrzave`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `kupci`;
CREATE TABLE `kupci` (
  `sifraKupca` int NOT NULL,
  `ime` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prezime` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresa` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idMjesto` int DEFAULT NULL,
  `postanskiBroj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idDrzava` int DEFAULT NULL,
  `IDbroj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jeLiPDVobveznik` tinyint DEFAULT NULL,
  `PDVbroj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sifraKupca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sobe`;
CREATE TABLE `sobe` (
  `brojSobe` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipSobeID` int DEFAULT NULL,
  `objekatID` int DEFAULT NULL,
  UNIQUE KEY `brojSobe` (`brojSobe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `daNePDV`;
CREATE TABLE `daNePDV` (
  `idOdgovora` tinyint NOT NULL,
  `znacenjeOdgovora` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idOdgovora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `inventar`;
CREATE TABLE `inventar` (
  `sifraInventara` int NOT NULL AUTO_INCREMENT,
  `nazivInventara` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sifraInventara`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vrstaSmjestaja`;
CREATE TABLE `vrstaSmjestaja` (
  `idVrstaSmjestaja` int NOT NULL AUTO_INCREMENT,
  `nazivSmjestaja` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idVrstaSmjestaja`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `najava`;
CREATE TABLE `najava` (
  `idNajave` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `tipSobeID` int,
  `brojGostiju` tinyint,
  `idVrstaSmjestaja` int,
  `sifraAlotmana` int,
  `brojNocenja` tinyint,
  `imePrezimeGosta` varchar(50),
  `napomena` varchar(50),
  `zdravstevniZahtjevi` varchar(50),
  `specijalniZahtjevi` varchar(50),
  `datumDolaska` date,
  `datumOdlaska` date,
  `statusNajave` int
);

DROP TABLE IF EXISTS `inventarSoba`;
CREATE TABLE `inventarSoba` (
  `tipSobeID` int,
  `sifraInventara` int,
  `kolicina` int
);

DROP TABLE IF EXISTS `objekti`;
CREATE TABLE `objekti` (
  `objekatID` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nazivObjekta` varchar(50)
);

DROP TABLE IF EXISTS `stavke`;
CREATE TABLE `stavke` (
  `sifraAlotmana` int,
  `tipSobeID` int,
  `kolicina` int,
  UNIQUE KEY `uk_stavke` (`sifraAlotmana`, `tipSobeID`)
);

-- Dodavanje foreign key-ova

ALTER TABLE `rezervacije`
  ADD CONSTRAINT `fk_sifraKupca` FOREIGN KEY (`sifraKupca`) REFERENCES `kupci` (`sifraKupca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_brojSobe` FOREIGN KEY (`brojSobe`) REFERENCES `sobe` (`brojSobe`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `alotman`
  ADD CONSTRAINT `fk_sifraAgencije` FOREIGN KEY (`sifraAgencije`) REFERENCES `agencija` (`sifraAgencije`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `benefitiSobe`
  ADD CONSTRAINT `fk_benefitiSobe_brojSobe` FOREIGN KEY (`brojSobe`) REFERENCES `sobe` (`brojSobe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_benefitiSobe_idBenefita` FOREIGN KEY (`idBenefita`) REFERENCES `benefiti` (`idBenefita`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `kupci`
  ADD CONSTRAINT `fk_kupci_ref_mjestoBoravka` FOREIGN KEY (`idMjesto`) REFERENCES `mjestoBoravka` (`idMjestaBoravka`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kupci_idDrzava` FOREIGN KEY (`idDrzava`) REFERENCES `drzava` (`idDrzave`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `sobe`
  ADD CONSTRAINT `fk_sobe_tipSobeID` FOREIGN KEY (`tipSobeID`) REFERENCES `tipSobe` (`tipSobeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sobe_objekatID` FOREIGN KEY (`objekatID`) REFERENCES `vrstaSmjestaja` (`idVrstaSmjestaja`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `najava`
  ADD CONSTRAINT `fk_najava_tipSobeID` FOREIGN KEY (`tipSobeID`) REFERENCES `tipSobe` (`tipSobeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_najava_sifraAlotman` FOREIGN KEY (`sifraAlotmana`) REFERENCES `alotman` (`sifraAlotman`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `agencija` 
  ADD CONSTRAINT `fk_agencija_ref_drzava` FOREIGN KEY (`idDrzava`) REFERENCES `drzava` (`idDrzave`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_agencija_ref_mjestoBoravka` FOREIGN KEY (`idMjesto`) REFERENCES `mjestoBoravka` (`idMjestaBoravka`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `sobe` 
  ADD CONSTRAINT `fk_sobe_ref_objekti` FOREIGN KEY (`objekatID`) REFERENCES `objekti` (`objekatID`);

ALTER TABLE `stavke` 
  ADD CONSTRAINT `fk_stavke_ref_alotman` FOREIGN KEY (`sifraAlotmana`) REFERENCES `alotman` (`sifraAlotman`),
  ADD CONSTRAINT `fk_stavke_ref_tipsobe` FOREIGN KEY (`tipSobeID`) REFERENCES `tipSobe` (`tipSobeID`);

use baza2;
LOCK TABLES `objekti` WRITE;
ALTER TABLE `objekti` DISABLE KEYS;
INSERT INTO `objekti` VALUES (1,'Glavna zgrada'),(2,'Sporedna zgrada broj 1'),(4,'Sporedna zgrada broj 2');
ALTER TABLE `objekti` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `mjestoBoravka` WRITE;
ALTER TABLE `mjestoBoravka` DISABLE KEYS;
INSERT INTO `mjestoBoravka` VALUES (1,'Dublin'),(2,'Barcelona'),(3,'Kopenhagen'),(4,'Zürich'),(5,'Moskva'),(6,'Istanbul'),(7,'Budimpešta'),(8,'Sofija'),(9,'Bukurešt'),(10,'Kijev'),(11,'Pariz'),(12,'Stockholm'),(13,'Beč'),(14,'Amsterdam'),(15,'Prag'),(16,'Oslo'),(17,'Atena'),(18,'Lisabon'),(19,'Bruxelles'),(20,'Helsinki'),(21,'Reykjavik'),(22,'Edinburgh'),(23,'Helsinki'),(24,'Bratislava'),(25,'Tallinn'),(26,'Riga'),(27,'Vilnius'),(28,'Luxembourg'),(29,'Valeta'),(30,'Nikozija'),(31,'Düsseldorf'),(32,'Varšava'),(33,'Rim'),(34,'Zagreb'),(35,'Beograd'),(36,'Madrid'),(37,'Brussels'),(38,'Budapest'),(39,'Ljubljana'),(40,'Skopje'),(41,'Varna'),(42,'Cluj-Napoca'),(43,'Lviv'),(44,'Nice'),(45,'Gothenburg'),(46,'Innsbruck'),(47,'Rotterdam'),(48,'České Budějovice'),(49,'Stavanger'),(50,'Thessaloniki'),(51,'Lisieux'),(52,'Malaga'),(53,'Copenhagen'),(54,'Zug'),(55,'Saint Petersburg'),(56,'Izmir'),(57,'Pécs'),(58,'Sofia'),(59,'Timișoara'),(60,'Kharkiv'),(61,'Marseille'),(62,'Gothenburg'),(63,'Graz'),(64,'Utrecht'),(65,'Brno'),(66,'Bergen'),(67,'Thessaloniki'),(68,'Porto'),(69,'Brussels'),(70,'Oulu');
ALTER TABLE `mjestoBoravka` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `daNePDV` WRITE;
ALTER TABLE `daNePDV` DISABLE KEYS;
INSERT INTO `daNePDV` VALUES (0,'NE'),(1,'DA');
ALTER TABLE `daNePDV` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `inventar` WRITE;
ALTER TABLE `inventar` DISABLE KEYS;
INSERT INTO `inventar` VALUES (1,'Stolica'),(2,'Sto'),(3,'TV'),(4,'Sef'),(5,'Ormar');
ALTER TABLE `inventar` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `vrstaSmjestaja` WRITE;
ALTER TABLE `vrstaSmjestaja` DISABLE KEYS;
INSERT INTO `vrstaSmjestaja` VALUES (1,'Noćenje sa doručkom'),(2,'Puni pansion'),(3,'Polupansion'),(4,'All-inclusive'),(5,'Noćenje bez obroka');
ALTER TABLE `vrstaSmjestaja` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `tipSobe` WRITE;
ALTER TABLE `tipSobe` DISABLE KEYS;
INSERT INTO `tipSobe` VALUES (1,1,100),(2,2,150),(3,3,200);
ALTER TABLE `tipSobe` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `status` WRITE;
ALTER TABLE `status` DISABLE KEYS;
INSERT INTO `status` VALUES (0,'otkazano'),(1,'ugovoreno'),(2,'rezervisano');
ALTER TABLE `status` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `drzava` WRITE;
ALTER TABLE `drzava` DISABLE KEYS;
INSERT INTO `drzava` VALUES (1,'Irska'),(2,'Španjolska'),(3,'Danska'),(4,'Švicarska'),(5,'Rusija'),(6,'Turska'),(7,'Mađarska'),(8,'Bugarska'),(9,'Rumunjska'),(10,'Ukrajina'),(11,'Francuska'),(12,'Švedska'),(13,'Austrija'),(14,'Holandija'),(15,'Češka'),(16,'Norveška'),(17,'Grčka'),(18,'Portugal'),(19,'Belgija'),(20,'Finska'),(21,'Iceland'),(22,'Scotland'),(23,'Finland'),(24,'Slovakia'),(25,'Estonia'),(26,'Latvia'),(27,'Lithuania'),(28,'Luxembourg'),(29,'Malta'),(30,'Cyprus');
ALTER TABLE `drzava` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `benefiti` WRITE;
ALTER TABLE `benefiti` DISABLE KEYS;
INSERT INTO `benefiti` VALUES (1,'pogled na more'),(2,'balkon'),(3,'jacuzzi');
ALTER TABLE `benefiti` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `agencija` WRITE;
ALTER TABLE `agencija` DISABLE KEYS;
INSERT INTO `agencija` VALUES (1,'Agencija Irska 1','Connell Street',123,16,'D01 H304',1),(2,'Agencija Irska 2','Temple Bar',456,17,'D02 E389',1),(3,'Agencija Irska 3','Trinity College',789,18,'D02 PN40',1),(4,'Agencija Irska 4','Phoenix Park',101,19,'D08 H304',1),(5,'Agencija Irska 5','Dublin Castle',202,20,'D02 V240',1),(6,'Agencija Španjolska 1','La Rambla',111,21,'08002',2),(7,'Agencija Španjolska 2','Sagrada Familia',222,22,'08013',2),(8,'Agencija Španjolska 3','Park Güell',333,23,'08024',2),(9,'Agencija Španjolska 4','Barri Gòtic',444,24,'08002',2),(10,'Agencija Španjolska 5','Plaza Mayor',555,25,'28012',2),(11,'Agencija Danska 1','Strøget',11,26,'1000',3),(12,'Agencija Danska 2','Nyhavn',22,27,'1051',3),(13,'Agencija Danska 3','Tivoli Gardens',33,28,'1630',3),(14,'Agencija Danska 4','The Little Mermaid',44,29,'2100',3),(15,'Agencija Danska 5','Rosenborg Castle',55,30,'1350',3),(16,'Agencija Švicarska 1','Bahnhofstrasse',111,1,'8001',4),(17,'Agencija Švicarska 2','Lake Geneva',222,2,'1201',4),(18,'Agencija Švicarska 3','Jungfraujoch',333,3,'3823',4),(19,'Agencija Švicarska 4','Lucerne',444,4,'6004',4),(20,'Agencija Švicarska 5','Zermatt',555,5,'3920',4),(21,'Agencija Rusija 1','Red Square',11,6,'109012',5),(22,'Agencija Rusija 2','Hermitage Museum',22,7,'190000',5),(23,'Agencija Rusija 3','Trans-Siberian Railway',33,8,'630004',5),(24,'Agencija Rusija 4','Kazan Cathedral',44,9,'190000',5),(25,'Agencija Rusija 5','Lake Baikal',55,10,'664520',5),(26,'Agencija Turska 1','Hagia Sophia',111,11,'34122',6),(27,'Agencija Turska 2','Blue Mosque',222,12,'34122',6),(28,'Agencija Turska 3','Cappadocia',333,13,'50180',6),(29,'Agencija Turska 4','Pamukkale',444,14,'20160',6),(30,'Agencija Turska 5','Ephesus',555,15,'35920',6),(31,'Agencija Mađarska 1','Buda Castle',111,16,'1014',7),(32,'Agencija Mađarska 2','Parliament Building',222,17,'1051',7),(33,'Agencija Mađarska 3','Fishermans Bastion',333,18,'1014',7),(34,'Agencija Mađarska 4','Heroes Square',444,19,'1146',7),(35,'Agencija Mađarska 5','Széchenyi Thermal Bath',555,20,'1146',7),(36,'Agencija Bugarska 1','Alexander Nevsky Cathedral',111,21,'1000',8),(37,'Agencija Bugarska 2','Rila Monastery',222,22,'2630',8),(38,'Agencija Bugarska 3','Sofia University',333,23,'1000',8),(39,'Agencija Bugarska 4','Vitosha Mountain',444,24,'1000',8),(40,'Agencija Bugarska 5','Plovdiv Old Town',555,25,'4000',8),(41,'Agencija Rumunjska 1','Bran Castle',111,26,'507025',9),(42,'Agencija Rumunjska 2','Palace of the Parliament',222,27,'050063',9),(43,'Agencija Rumunjska 3','Peles Castle',333,28,'106100',9),(44,'Agencija Rumunjska 4','Sibiu Old Town',444,29,'550182',9),(45,'Agencija Rumunjska 5','Cluj-Napoca',555,30,'400009',9),(46,'Agencija Ukrajina 1','Kiev Independence Square',666,1,'01001',10),(47,'Agencija Ukrajina 2','Lviv Old Town',222,2,'79000',10),(48,'Agencija Ukrajina 3','Kharkiv Freedom Square',333,3,'61000',10),(49,'Agencija Ukrajina 4','Odessa Potemkin Stairs',444,4,'65026',10),(50,'Agencija Ukrajina 5','Chernobyl Exclusion Zone',555,5,'07200',10),(51,'Agencija Francuska 1','Eiffel Tower',111,6,'75007',11),(52,'Agencija Francuska 2','Louvre Museum',222,7,'75001',11),(53,'Agencija Francuska 3','Mont Saint-Michel',333,8,'50170',11),(54,'Agencija Francuska 4','Versailles Palace',444,9,'78000',11),(55,'Agencija Francuska 5','Provence Lavender Fields',555,10,'84220',11),(56,'Agencija Švedska 1','Stockholm Old Town',111,11,'111 29',12),(57,'Agencija Švedska 2','Vasa Museum',222,12,'115 21',12),(58,'Agencija Švedska 3','Abisko National Park',333,13,'981 07',12),(59,'Agencija Švedska 4','Liseberg Amusement Park',444,14,'412 51',12),(60,'Agencija Švedska 5','Icehotel Jukkasjärvi',555,15,'981 91',12),(61,'Agencija Austrija 1','Schönbrunn Palace',111,16,'1130',13),(62,'Agencija Austrija 2','St. Stephen\'s Cathedral',222,17,'1010',13),(63,'Agencija Austrija 3','Hofburg Palace',333,18,'1010',13),(64,'Agencija Austrija 4','Mirabell Palace',444,19,'5020',13),(65,'Agencija Austrija 5','Hallstatt',555,20,'4830',13),(66,'Agencija Holandija 1','Amsterdam Central Station',111,1,'1012 AB',14),(67,'Agencija Holandija 2','Keukenhof Gardens',222,2,'2161 AL',14),(68,'Agencija Holandija 3','Van Gogh Museum',333,3,'1071 DJ',14),(69,'Agencija Holandija 4','Zaanse Schans',444,4,'1509 AW',14),(70,'Agencija Holandija 5','Rijksmuseum',555,5,'1071 CX',14),(71,'Agencija Češka 1','Prague Castle',111,6,'119 08',15),(72,'Agencija Češka 2','Charles Bridge',222,7,'110 00',15),(73,'Agencija Češka 3','Old Town Square',333,8,'110 00',15),(74,'Agencija Češka 4','Karlštejn Castle',444,9,'267 18',15),(75,'Agencija Češka 5','Český Krumlov',555,10,'381 01',15),(76,'Agencija Norveška 1','Bryggen Wharf',111,11,'5003',16),(77,'Agencija Norveška 2','Geirangerfjord',222,12,'6216',16),(78,'Agencija Norveška 3','Viking Ship Museum',333,13,'0287',16),(79,'Agencija Norveška 4','Northern Lights Observatory',444,14,'9790',16),(80,'Agencija Norveška 5','Trolltunga',555,15,'5750',16),(81,'Agencija Grčka 1','Acropolis of Athens',111,16,'105 58',17),(82,'Agencija Grčka 2','Santorini',222,17,'847 00',17),(83,'Agencija Grčka 3','Mykonos Town',333,18,'846 00',17),(84,'Agencija Grčka 4','Delphi',444,19,'330 54',17),(85,'Agencija Grčka 5','Meteora',555,20,'422 00',17),(86,'Agencija Portugal 1','Belem Tower',111,21,'1400-206',18),(87,'Agencija Portugal 2','Jerónimos Monastery',222,22,'1400-209',18),(88,'Agencija Portugal 3','Pena Palace',333,23,'2710-609',18),(89,'Agencija Portugal 4','Porto Old Town',444,24,'4050-318',18),(90,'Agencija Portugal 5','Douro Valley',555,25,'5110-424',18),(91,'Agencija Belgija 1','Grand Place',111,26,'1000',19),(92,'Agencija Belgija 2','Atomium',222,27,'1020',19),(93,'Agencija Belgija 3','Manneken Pis',333,28,'1000',19),(94,'Agencija Belgija 4','Antwerp Cathedral',444,29,'2000',19),(95,'Agencija Belgija 5','Bruges Belfry',555,30,'8000',19),(96,'Agencija Holandija 6','Kinderdijk Windmills',666,6,'2961 AS',14),(97,'Agencija Holandija 7','Anne Frank House',777,7,'1016 GZ',14),(98,'Agencija Holandija 8','Canals of Amsterdam',888,8,'1012 AC',14),(99,'Agencija Holandija 9','Utrecht Dom Tower',999,9,'3512 JE',14),(100,'Agencija Holandija 10','Giethoorn Canals',1010,10,'8355 AD',14),(101,'Agencija Češka 6','Wenceslas Square',666,11,'110 00',15),(102,'Agencija Češka 7','Prague Zoo',777,12,'170 00',15),(103,'Agencija Češka 8','Dancing House',888,13,'120 00',15),(104,'Agencija Češka 9','Vyšehrad Fortress',999,14,'128 00',15),(105,'Agencija Češka 10','Prague National Theatre',1010,15,'110 00',15),(106,'Agencija Norveška 6','Jostedalsbreen Glacier',666,16,'6848',16),(107,'Agencija Norveška 7','Preikestolen',777,17,'4100',16),(108,'Agencija Norveška 8','Oslo Opera House',888,18,'0150',16),(109,'Agencija Norveška 9','Nidaros Cathedral',999,19,'7013',16),(110,'Agencija Norveška 10','Lofoten Islands',1010,20,'8370',16),(111,'Agencija Grčka 6','Oia Sunset',666,21,'847 02',17),(112,'Agencija Grčka 7','Olympia',777,22,'270 65',17),(113,'Agencija Grčka 8','Navagio Beach',888,23,'291 00',17),(114,'Agencija Grčka 9','Rhodes Old Town',999,24,'851 00',17),(115,'Agencija Grčka 10','Corfu Old Town',1010,25,'491 00',17),(116,'Agencija Portugal 6','Lisbon Belem District',666,26,'1400-038',18),(117,'Agencija Portugal 7','Livraria Lello',777,27,'4050-365',18),(118,'Agencija Portugal 8','Cabo da Roca',888,28,'2705-001',18),(119,'Agencija Portugal 9','Aveiro Canals',999,29,'3800-294',18),(120,'Agencija Portugal 10','Madeira Funchal',1010,30,'9000-018',18),(121,'Agencija Belgija 6','Cinquantenaire Park',666,1,'1000',19),(122,'Agencija Belgija 7','Ghent Canal Tour',777,2,'9000',19),(123,'Agencija Belgija 8','Dinant Citadel',888,3,'5500',19),(124,'Agencija Belgija 9','Leuven Town Hall',999,4,'3000',19),(125,'Agencija Belgija 10','Battle of Waterloo Site',1010,5,'1420',19),(126,'Agencija Finska 6','Porvoo Old Town',666,6,'06100',20),(127,'Agencija Finska 7','Arktikum Science Museum',777,7,'96100',20),(128,'Agencija Finska 8','Turku Castle',888,8,'20100',20),(129,'Agencija Finska 9','Koli National Park',999,9,'89130',20),(130,'Agencija Finska 10','Ranua Wildlife Park',1010,10,'97700',20),(131,'Agencija Iceland 6','Seljalandsfoss Waterfall',666,11,'861, Iceland',21),(132,'Agencija Iceland 7','Hallgrímskirkja',777,12,'101, Iceland',21),(133,'Agencija Iceland 8','Akureyri Church',888,13,'600, Iceland',21),(134,'Agencija Iceland 9','Landmannalaugar',999,14,'860, Iceland',21),(135,'Agencija Iceland 10','Húsavík Whale Watching',1010,15,'640, Iceland',21),(136,'Agencija Scotland 6','Edinburgh Royal Botanic Garden',666,16,'EH3 5LR',22),(137,'Agencija Scotland 7','Stirling Castle',777,17,'FK8 1EJ',22),(138,'Agencija Scotland 8','Ben Nevis',888,18,'PH33 6SY',22),(139,'Agencija Scotland 9','Scott Monument',999,19,'EH2 2JX',22),(140,'Agencija Scotland 10','Glencoe Valley',1010,20,'PH49 4HX',22),(141,'Agencija Finland 11','Turku Archipelago',111,21,'20100',20),(142,'Agencija Finland 12','Arktikum Science Museum',222,22,'96100',20),(143,'Agencija Finland 13','Santa Claus Village',333,23,'96930',20),(144,'Agencija Finland 14','Koli National Park',444,24,'89130',20),(145,'Agencija Finland 15','Helsinki Design District',555,25,'00101',20),(146,'Agencija Slovačka 11','High Tatras',666,26,'059 60',23),(147,'Agencija Slovačka 12','Bratislava Old Town',777,27,'811 06',23),(148,'Agencija Slovačka 13','Bojnice Zoo',888,28,'972 01',23),(149,'Agencija Slovačka 14','Orava Castle',999,29,'027 41',23),(150,'Agencija Slovačka 15','Spa Piestany',1010,30,'921 29',23),(151,'Agencija Estonija 6','Tallinn Kadriorg Palace',111,1,'10127',24),(152,'Agencija Estonija 7','Parnu Beach',222,2,'80010',24),(153,'Agencija Estonija 8','Soomaa National Park',333,3,'78306',24),(154,'Agencija Estonija 9','Hiiumaa Island',444,4,'92220',24),(155,'Agencija Estonija 10','Tartu University',555,5,'50090',24);
ALTER TABLE `agencija` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `kupci` WRITE;
ALTER TABLE `kupci` DISABLE KEYS;
INSERT INTO `kupci` VALUES (1,'John','Smith','10 Downing St',1,'SW1A 2AA',1,'ID12345',1,'GB123'),(2,'Emma','Johnson','20 Trafford St',2,'M1 4LJ',1,'ID67890',0,NULL),(3,'Michael','Williams','30 Unter den Linden',3,'10117',2,'ID54321',1,'DE456'),(4,'Sophie','Brown','40 Reeperbahn',4,'20359',2,'ID13579',0,NULL),(5,'Alexander','Garcia','50 Main Square',5,'31-061',3,'ID97531',1,'PL246'),(6,'Isabella','Martinez','60 Freedom Square',6,'60-967',3,'ID35791',0,NULL),(7,'Luca','Romano','70 Spanish Steps',7,'00187',4,'ID78901',1,'IT789'),(8,'Sofia','Moretti','80 Grand Canal',8,'30100',4,'ID24680',0,NULL),(9,'Matej','Kovač','90 Ilica Street',9,'10000',5,'ID10101',1,'HR310'),(10,'Ana','Horvat','100 Trg Slobode',10,'31000',5,'ID20202',0,NULL),(11,'David','Wilson','110 Kensington Ave',1,'SW1A 1AA',1,'ID11111',1,'GB456'),(12,'Olivia','Lee','120 Oxford St',2,'M1 5LJ',1,'ID22222',0,NULL),(13,'Lukas','Fischer','130 Friedrichstrasse',3,'10115',2,'ID33333',1,'DE789'),(14,'Elena','Kovac','140 Hafenstrasse',4,'20459',2,'ID44444',0,NULL),(15,'Viktor','Novak','150 Rynek Glowny',5,'31-042',3,'ID55555',1,'PL789'),(16,'Petra','Horvat','160 Trg Kralja Petra',6,'61-701',3,'ID66666',0,NULL),(17,'Antonio','Moreno','170 Piazza Navona',7,'00186',4,'ID77777',1,'IT987'),(18,'Lara','Santos','180 Cannaregio',8,'30121',4,'ID88888',0,NULL),(19,'Filip','Jovanovic','190 Vlaska ulica',9,'10090',5,'ID99999',1,'HR987'),(20,'Mia','Marin','200 Petra Drapsina',10,'31000',5,'ID10102',0,NULL),(21,'Nikola','Petrović','210 Knez Mihailova',11,'11000',6,'ID21111',1,'RS123'),(22,'Eva','Stojanović','220 Terazije',12,'11000',6,'ID22222',0,NULL),(23,'Marco','Garcia','230 Gran Via',13,'28013',7,'ID23333',1,'ES456'),(24,'Elena','Moreno','240 Rambla',14,'08002',7,'ID24444',0,NULL),(25,'Viktor','Kovac','250 Krakowskie Przedmiescie',5,'00-927',6,'ID25555',1,'PL345'),(26,'Mia','Horvat','260 Varšavska ulica',6,'00-019',6,'ID26666',0,NULL),(27,'Antonio','Jovanovic','270 Cetinjska ulica',9,'81000',6,'ID27777',1,'ME789'),(28,'Lara','Marin','280 Nikšićka ulica',10,'81000',6,'ID28888',0,NULL),(29,'Filip','Novak','290 Paseo de la Castellana',13,'28046',7,'ID29999',1,'ES789'),(30,'Mia','Santos','300 Placa de Espana',14,'08010',7,'ID30000',0,NULL),(31,'John','Doe','123 Main St',16,'12345',8,'ABC123456789',1,'HR12345678901'),(32,'Jane','Smith','456 Oak St',17,'23456',9,'XYZ987654321',0,NULL),(33,'Mark','Johnson','789 Pine St',18,'34567',10,'123456789',1,'BG123456789'),(34,'Emily','Williams','101 Elm St',19,'45678',11,'987654321',0,NULL),(35,'Michael','Brown','202 Cedar St',20,'56789',12,'654321987',1,'AT123456789'),(36,'Sophia','Jones','111 Birch St',21,'67890',13,'1122334455',0,NULL),(37,'David','Miller','222 Maple St',22,'78901',14,'9988776655',1,'FI12345678'),(38,'Olivia','Davis','333 Walnut St',23,'89012',15,'5544332211',0,NULL),(39,'Daniel','Garcia','444 Pineapple St',24,'90123',16,'876543210',1,'IS123456'),(40,'Ava','Martinez','555 Orange St',25,'10111',17,'123123123',0,NULL),(41,'Ethan','Rodriguez','666 Banana St',26,'22222',18,'456456456',1,'PT123456789'),(42,'Mia','Lopez','777 Strawberry St',27,'33333',19,'789789789',0,NULL),(43,'Liam','Perez','888 Watermelon St',28,'44444',20,'147258369',1,'BE123456789'),(44,'Isabella','Jackson','999 Grape St',29,'55555',21,'258369147',0,NULL),(45,'James','Baker','000 Cherry St',30,'66666',22,'369147258',1,'FI98765432'),(46,'Emma','Cook','111 Kiwi St',1,'77777',23,'159753468',0,NULL),(47,'Benjamin','Clark','222 Plum St',2,'88888',24,'357159246',1,'SK123456789'),(48,'Avery','Ward','333 Blueberry St',3,'99999',25,'753951456',0,NULL),(49,'Abigail','Fisher','444 Raspberry St',4,'10101',26,'951357753',1,'EE123456789'),(50,'Logan','Fletcher','555 Mango St',5,'20202',27,'654987321',0,NULL),(51,'Harper','Fowler','666 Papaya St',6,'30303',28,'987321654',1,'LV12345678901'),(52,'Sebastian','Houston','777 Passionfruit St',7,'40404',29,'321654987',0,NULL),(53,'Lily','Stewart','888 Avocado St',8,'50505',30,'654321987',1,'LT123456789'),(54,'Jackson','Hudson','999 Guava St',9,'60606',8,'987654321',0,NULL),(55,'Sofia','Miller','101 Dragon Fruit St',10,'70707',9,'123456789',1,'LU12345678'),(56,'Elijah','Lopez','202 Lychee St',11,'81818',10,'987654321',0,NULL),(57,'Scarlett','Clark','303 Star Fruit St',12,'92929',11,'123456789',1,'MT12345678'),(58,'Caleb','Ward','404 Kiwi St',13,'10101',12,'987654321',0,NULL),(59,'Chloe','Fisher','505 Mango St',14,'20202',13,'123456789',1,'NL123456789B01'),(60,'Grayson','Fletcher','606 Orange St',15,'30303',14,'987654321',0,NULL),(61,'Zoe','Fowler','707 Raspberry St',16,'40404',15,'123456789',1,'PT123456789'),(62,'Leo','Houston','818 Banana St',17,'50505',16,'987654321',0,NULL),(63,'Lucy','Stewart','929 Grape St',18,'60606',17,'123456789',1,'RO1234567890'),(64,'Nathan','Hudson','101 Pineapple St',19,'70707',18,'987654321',0,NULL),(65,'Madison','Miller','202 Coconut St',20,'81818',19,'123456789',1,'SK123456789'),(66,'Eli','Lopez','303 Passionfruit St',21,'92929',20,'987654321',0,NULL),(67,'Aria','Clark','404 Lychee St',22,'10101',21,'123456789',1,'SI12345678'),(68,'Ethan','Ward','505 Avocado St',23,'20202',22,'987654321',0,NULL),(69,'Hazel','Fisher','606 Guava St',24,'30303',23,'123456789',1,'ESX1234567X'),(70,'Mason','Fletcher','707 Dragon Fruit St',25,'40404',24,'987654321',0,NULL),(71,'John','Doe','123 Main St',1,'10001',15,'US123456',1,'US123456PDV'),(72,'Jane','Smith','456 Oak St',2,'20002',16,'GB987654',0,NULL),(73,'Michael','Johnson','789 Maple St',3,'30003',17,'FR654321',1,'FR654321PDV'),(74,'Emily','Williams','101 Pine St',4,'40004',18,'DE123789',0,NULL),(75,'Christopher','Anderson','888 Birch St',30,'30030',19,'RU789012',0,NULL),(76,'Emma','Martinez','222 Cedar St',5,'50005',20,'PT456789',1,'PT456789PDV'),(77,'Liam','Robinson','333 Elm St',6,'60006',21,'BE345678',0,NULL),(78,'Olivia','Clark','404 Pine St',7,'70007',22,'FI234567',1,'FI234567PDV'),(79,'Noah','Rodriguez','505 Oak St',8,'80008',23,'SK654321',0,NULL),(80,'Sophia','Lewis','666 Maple St',15,'15015',24,'UA123456',1,'UA123456PDV'),(81,'Jackson','Walker','777 Pine St',10,'10010',25,'ES987654',0,NULL),(82,'Ava','Hall','888 Oak St',11,'11011',26,'SE654321',1,'SE654321PDV'),(83,'Mia','Baker','999 Cedar St',12,'12012',27,'AT123789',0,NULL),(84,'Ethan','Turner','101 Elm St',13,'13013',28,'NL234567',1,'NL234567PDV'),(85,'Isabella','Hill','111 Birch St',29,'29029',29,'GR789012',0,NULL);
ALTER TABLE `kupci` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `sobe` WRITE;
ALTER TABLE `sobe` DISABLE KEYS;
INSERT INTO `sobe` VALUES ('101A',1,1),('102A',2,1),('103A',3,1),('201A',1,1),('202A',2,1),('203A',3,1),('301A',1,1),('302A',2,1),('303A',3,1),('101B',1,2),('102B',2,2),('103B',3,2),('201B',1,2),('202B',2,2),('203B',3,2),('301B',1,2),('302B',2,2),('303B',3,2),('101C',3,4),('102C',3,4),('103C',3,4);
ALTER TABLE `sobe` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `inventarSoba` WRITE;
ALTER TABLE `inventarSoba` DISABLE KEYS;
INSERT INTO `inventarSoba` VALUES (1,1,2),(1,2,1),(1,4,1),(2,1,4),(2,2,2),(2,4,1),(2,3,1),(3,1,4),(3,2,3),(3,4,2),(3,3,2),(3,5,2);
ALTER TABLE `inventarSoba` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `benefitiSobe` WRITE;
ALTER TABLE `benefitiSobe` DISABLE KEYS;
INSERT INTO `benefitiSobe` VALUES ('101A',1),('101A',2),('101B',1),('102A',3),('102B',1),('103A',1),('103A',3),('103B',2),('201A',3),('201B',2),('202A',2),('202B',2),('202B',3),('203A',1),('203A',2),('203A',3),('203B',3),('303A',1);
ALTER TABLE `benefitiSobe` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `rezervacije` WRITE;
ALTER TABLE `rezervacije` DISABLE KEYS;
INSERT INTO `rezervacije` VALUES (1,1,'101A','2023-01-01','2023-01-05',500,1),(2,2,'201A','2023-02-15','2023-02-20',600,1),(3,3,'301A','2023-03-10','2023-03-15',700,1),(4,4,'102A','2023-04-05','2023-04-10',800,2),(5,5,'202A','2023-05-20','2023-05-25',900,2),(6,6,'302A','2023-06-10','2023-06-15',1000,2),(7,7,'103A','2023-07-01','2023-07-07',1200,1),(8,8,'203A','2023-08-15','2023-08-20',1400,2),(9,9,'303A','2023-09-01','2023-09-10',1600,3),(10,10,'101B','2023-10-01','2023-10-05',550,1),(11,11,'201B','2023-11-15','2023-11-20',650,1),(12,12,'301B','2023-12-10','2023-12-15',750,1),(13,13,'102B','2024-01-05','2024-01-10',850,2),(14,14,'202B','2024-02-20','2024-02-25',950,2),(15,15,'302B','2024-03-10','2024-03-15',1050,2),(16,16,'103B','2024-04-05','2024-04-10',1250,1),(17,17,'203B','2024-05-20','2024-05-25',1450,2),(18,18,'303B','2024-06-10','2024-06-15',1650,3),(19,19,'101C','2024-07-01','2024-07-07',700,1),(20,20,'102C','2024-08-15','2024-08-20',800,1),(21,21,'103C','2024-09-01','2024-09-10',900,1),(22,22,'101A','2024-10-01','2024-10-05',500,1),(23,23,'201A','2024-11-15','2024-11-20',600,1),(24,24,'301A','2024-12-10','2024-12-15',700,1),(25,25,'102A','2025-01-05','2025-01-10',800,2),(26,26,'202A','2025-02-20','2025-02-25',900,2),(27,27,'302A','2025-03-10','2025-03-15',1000,2),(28,28,'103A','2025-04-05','2025-04-10',1200,1),(29,29,'203A','2025-05-20','2025-05-25',1400,2),(30,30,'303A','2025-06-10','2025-06-15',1600,3),(31,31,'101B','2025-07-01','2025-07-07',750,1),(32,32,'201B','2025-08-15','2025-08-20',850,1),(33,33,'301B','2025-09-01','2025-09-10',950,1),(34,34,'101C','2026-01-01','2026-01-05',700,1),(35,35,'102C','2026-02-15','2026-02-20',800,1),(36,36,'103C','2026-03-10','2026-03-15',900,1),(37,37,'101A','2026-04-05','2026-04-10',1000,1),(38,38,'102A','2026-05-20','2026-05-25',1100,2),(39,39,'103A','2026-06-10','2026-06-15',1200,2),(40,40,'201A','2026-07-01','2026-07-07',1300,1),(41,41,'202A','2026-08-15','2026-08-20',1400,3),(42,42,'203A','2026-09-01','2026-09-10',1500,3),(43,43,'201B','2027-01-01','2027-01-05',600,1),(44,44,'202B','2027-02-15','2027-02-20',700,1),(45,45,'203B','2027-03-10','2027-03-15',800,1),(46,46,'301A','2027-04-05','2027-04-10',900,1),(47,47,'302A','2027-05-20','2027-05-25',1000,2),(48,48,'303A','2027-06-10','2027-06-15',1100,2),(49,49,'101A','2027-07-01','2027-07-07',1200,1),(50,50,'102A','2027-08-15','2027-08-20',1300,3),(51,51,'103A','2027-09-01','2027-09-10',1400,3),(52,52,'101B','2028-01-01','2028-01-05',650,1),(53,53,'102B','2028-02-15','2028-02-20',750,1),(54,54,'103B','2028-03-10','2028-03-15',850,1),(55,55,'201A','2028-04-05','2028-04-10',950,1),(56,56,'202A','2028-05-20','2028-05-25',1050,2),(57,57,'203A','2028-06-10','2028-06-15',1150,2),(58,58,'301A','2028-07-01','2028-07-07',1250,1),(59,59,'302A','2028-08-15','2028-08-20',1350,3),(60,60,'303A','2028-09-01','2028-09-10',1450,3),(61,61,'101C','2029-01-01','2029-01-05',800,1),(62,62,'102C','2029-02-15','2029-02-20',900,1),(63,63,'103C','2029-03-10','2029-03-15',1000,1),(64,64,'101A','2029-04-05','2029-04-10',1100,1),(65,65,'102A','2029-05-20','2029-05-25',1200,2),(66,66,'103A','2029-06-10','2029-06-15',1300,2),(67,67,'201A','2029-07-01','2029-07-07',1400,1),(68,68,'202A','2029-08-15','2029-08-20',1500,3),(69,69,'203A','2029-09-01','2029-09-10',1600,3),(70,70,'101B','2030-01-01','2030-01-05',700,1),(71,71,'102B','2030-02-15','2030-02-20',800,1),(72,72,'103B','2030-03-10','2030-03-15',900,1),(73,73,'201A','2030-04-05','2030-04-10',1000,1),(74,74,'202A','2030-05-20','2030-05-25',1100,2),(75,75,'203A','2030-06-10','2030-06-15',1200,2),(76,76,'301A','2030-07-01','2030-07-07',1300,1),(77,77,'302A','2030-08-15','2030-08-20',1400,3),(78,78,'303A','2030-09-01','2030-09-10',1500,3),(79,79,'101C','2031-01-01','2031-01-05',800,1),(80,80,'102C','2031-02-15','2031-02-20',900,1),(81,81,'103C','2031-03-10','2031-03-15',1000,1),(82,82,'101A','2031-04-05','2031-04-10',1100,1),(83,83,'102A','2031-05-20','2031-05-25',1200,2),(84,84,'103A','2031-06-10','2031-06-15',1300,2);
ALTER TABLE `rezervacije` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `alotman` WRITE;
ALTER TABLE `alotman` DISABLE KEYS;
INSERT INTO `alotman` VALUES (1,'2023-01-15','2024-01-15','2023-02-01',1),(2,'2023-02-20','2024-02-20','2023-03-01',2),(3,'2023-03-25','2024-03-25','2023-04-01',3),(4,'2023-04-30','2024-04-30','2023-05-01',4),(5,'2023-05-15','2024-05-15','2023-06-01',5),(6,'2023-06-20','2024-06-20','2023-07-01',6),(7,'2023-07-25','2024-07-25','2023-08-01',7),(8,'2023-08-30','2024-08-30','2023-09-01',8),(9,'2023-09-15','2024-09-15','2023-10-01',9),(10,'2023-10-20','2024-10-20','2023-11-01',10),(11,'2023-11-25','2024-11-25','2023-12-01',11),(12,'2023-12-30','2024-12-30','2024-01-01',12),(13,'2024-01-15','2025-01-15','2024-02-01',13),(14,'2024-02-20','2025-02-20','2024-03-01',14),(15,'2024-03-25','2025-03-25','2024-04-01',15),(16,'2024-04-30','2025-04-30','2024-05-01',16),(17,'2024-05-15','2025-05-15','2024-06-01',17),(18,'2024-06-20','2025-06-20','2024-07-01',18),(19,'2024-07-25','2025-07-25','2024-08-01',19),(20,'2024-08-30','2025-08-30','2024-09-01',20),(21,'2024-09-15','2025-09-15','2024-10-01',21),(22,'2024-10-20','2025-10-20','2024-11-01',22),(23,'2024-11-25','2025-11-25','2024-12-01',23),(24,'2024-12-30','2025-12-30','2025-01-01',24),(25,'2025-01-15','2026-01-15','2025-02-01',25),(26,'2025-02-20','2026-02-20','2025-03-01',26),(27,'2025-03-25','2026-03-25','2025-04-01',27),(28,'2025-04-30','2026-04-30','2025-05-01',28),(29,'2025-05-15','2026-05-15','2025-06-01',29),(30,'2025-06-20','2026-06-20','2025-07-01',30),(31,'2025-07-25','2026-07-25','2025-08-01',31),(32,'2025-08-30','2026-08-30','2025-09-01',32),(33,'2025-09-15','2026-09-15','2025-10-01',33),(34,'2025-10-20','2026-10-20','2025-11-01',34),(35,'2025-11-25','2026-11-25','2025-12-01',35),(36,'2025-12-30','2026-12-30','2026-01-01',36),(37,'2026-01-15','2027-01-15','2026-02-01',37),(38,'2026-02-20','2027-02-20','2026-03-01',38),(39,'2026-03-25','2027-03-25','2026-04-01',39),(40,'2026-04-30','2027-04-30','2026-05-01',40),(41,'2023-02-22','2023-08-22','2023-03-05',41),(42,'2023-03-10','2023-09-10','2023-04-12',42),(43,'2023-04-05','2023-10-05','2023-05-20',43),(44,'2023-05-18','2023-11-18','2023-06-03',44),(45,'2023-06-25','2023-12-25','2023-07-14',45),(46,'2023-07-08','2024-01-08','2023-08-08',46),(47,'2023-08-12','2024-02-12','2023-09-30',47),(48,'2023-09-20','2024-03-20','2023-10-10',48),(49,'2023-10-02','2024-04-02','2023-11-22',49),(50,'2023-11-11','2024-05-11','2023-12-01',50),(51,'2023-12-03','2024-06-03','2024-01-18',51),(52,'2024-01-17','2024-07-17','2024-02-28',52),(53,'2024-02-28','2024-08-28','2024-03-15',53),(54,'2024-03-15','2024-09-15','2024-04-05',54),(55,'2024-04-05','2024-10-05','2024-05-10',55),(56,'2024-05-10','2024-11-10','2024-06-20',56),(57,'2024-06-20','2024-12-20','2024-07-02',57),(58,'2024-07-02','2025-01-02','2024-08-15',58),(59,'2024-08-15','2025-02-15','2024-09-25',59),(60,'2024-09-25','2025-03-25','2024-10-12',60),(61,'2024-10-12','2025-04-12','2024-11-03',61),(62,'2024-11-03','2025-05-03','2024-12-18',62),(63,'2024-12-18','2025-06-18','2025-01-30',63),(64,'2025-01-30','2025-07-30','2025-02-10',64),(65,'2025-02-10','2025-08-10','2025-03-22',65),(66,'2025-03-22','2025-09-22','2025-04-07',66),(67,'2025-04-07','2025-10-07','2025-05-15',67),(68,'2025-05-15','2025-11-15','2025-06-25',68),(69,'2025-06-25','2025-12-25','2025-07-10',69),(70,'2025-07-10','2026-01-10','2025-08-20',70),(71,'2025-08-20','2026-02-20','2025-09-01',71),(72,'2025-09-01','2026-03-01','2025-10-12',72),(73,'2025-10-12','2026-04-12','2025-11-05',73),(74,'2025-11-05','2026-05-05','2025-12-15',74),(75,'2025-12-15','2026-06-15','2026-01-28',75),(76,'2026-01-28','2026-07-28','2026-02-10',76),(77,'2026-02-10','2026-08-10','2026-03-22',77),(78,'2026-03-22','2026-09-22','2026-04-07',78),(79,'2026-04-07','2026-10-07','2026-05-15',79),(80,'2026-05-15','2026-11-15','2026-06-25',80),(81,'2026-06-25','2026-12-25','2026-07-10',81),(82,'2026-07-10','2027-01-10','2026-08-20',82),(83,'2026-08-20','2027-02-20','2026-09-01',83),(84,'2026-09-01','2027-03-01','2026-10-12',84),(85,'2026-10-12','2027-04-12','2026-11-05',85),(86,'2026-11-05','2027-05-05','2026-12-15',86),(87,'2026-12-15','2027-06-15','2027-01-28',87),(88,'2027-01-28','2027-07-28','2027-02-10',88),(89,'2027-02-10','2027-08-10','2027-03-22',89),(90,'2027-03-22','2027-09-22','2027-04-07',90),(91,'2027-04-07','2027-10-07','2027-05-15',91),(92,'2027-05-15','2027-11-15','2027-06-25',92),(93,'2027-06-25','2027-12-25','2027-07-10',93),(94,'2027-07-10','2028-01-10','2027-08-20',94),(95,'2027-08-20','2028-02-20','2027-09-01',95),(96,'2027-09-01','2028-03-01','2027-10-12',96),(97,'2027-10-12','2028-04-12','2027-11-05',97),(98,'2027-11-05','2028-05-05','2027-12-15',98),(99,'2027-12-15','2028-06-15','2028-01-28',99),(100,'2028-01-28','2028-07-28','2028-02-10',100),(101,'2028-02-10','2028-08-10','2028-03-22',101),(102,'2028-03-22','2028-09-22','2028-04-07',102),(103,'2028-04-07','2028-10-07','2028-05-15',103),(104,'2028-05-15','2028-11-15','2028-06-25',104),(105,'2028-06-25','2028-12-25','2028-07-10',105),(106,'2028-07-10','2029-01-10','2028-08-20',106),(107,'2028-08-20','2029-02-20','2028-09-01',107),(108,'2028-09-01','2029-03-01','2028-10-12',108),(109,'2028-10-12','2029-04-12','2028-11-05',109),(110,'2028-11-05','2029-05-05','2028-12-15',110),(111,'2028-12-15','2029-06-15','2029-01-28',111),(112,'2029-01-28','2029-07-28','2029-02-10',112),(113,'2029-02-10','2029-08-10','2029-03-22',113),(114,'2029-03-22','2029-09-22','2029-04-07',114),(115,'2029-04-07','2029-10-07','2029-05-15',115),(116,'2029-05-15','2029-11-15','2029-06-25',116),(117,'2029-06-25','2029-12-25','2029-07-10',117),(118,'2029-07-10','2030-01-10','2029-08-20',118),(119,'2029-08-20','2030-02-20','2029-09-01',119),(120,'2029-09-01','2030-03-01','2029-10-12',120),(121,'2027-05-15','2028-05-15','2027-06-01',121),(122,'2027-06-20','2028-06-20','2027-07-01',122),(123,'2027-07-25','2028-07-25','2027-08-01',123),(124,'2027-08-30','2028-08-30','2027-09-01',124),(125,'2027-09-15','2028-09-15','2027-10-01',125),(126,'2027-10-20','2028-10-20','2027-11-01',126),(127,'2027-11-25','2028-11-25','2027-12-01',127),(128,'2027-12-30','2028-12-30','2028-01-01',128),(129,'2028-01-15','2029-01-15','2028-02-01',129),(130,'2028-02-20','2029-02-20','2028-03-01',130),(131,'2028-03-25','2029-03-25','2028-04-01',131),(132,'2028-04-30','2029-04-30','2028-05-01',132),(133,'2028-05-15','2029-05-15','2028-06-01',133),(134,'2028-06-20','2029-06-20','2028-07-01',134),(135,'2028-07-25','2029-07-25','2028-08-01',135),(136,'2028-08-30','2029-08-30','2028-09-01',136),(137,'2028-09-15','2029-09-15','2028-10-01',137),(138,'2028-10-20','2029-10-20','2028-11-01',138),(139,'2028-11-25','2029-11-25','2028-12-01',139),(140,'2028-12-30','2029-12-30','2029-01-01',140),(141,'2029-01-15','2030-01-15','2029-02-01',141),(142,'2029-02-20','2030-02-20','2029-03-01',142),(143,'2029-03-25','2030-03-25','2029-04-01',143),(144,'2029-04-30','2030-04-30','2029-05-01',144),(145,'2029-05-15','2030-05-15','2029-06-01',145),(146,'2029-06-20','2030-06-20','2029-07-01',146),(147,'2029-07-25','2030-07-25','2029-08-01',147),(148,'2029-08-30','2030-08-30','2029-09-01',148),(149,'2029-09-15','2030-09-15','2029-10-01',149),(150,'2029-10-20','2030-10-20','2029-11-01',150),(151,'2029-11-25','2030-11-25','2029-12-01',151),(152,'2029-12-30','2030-12-30','2030-01-01',152),(153,'2030-01-15','2031-01-15','2030-02-01',153),(154,'2030-02-20','2031-02-20','2030-03-01',154),(155,'2030-03-25','2031-03-25','2030-04-01',155),(158,'2025-01-01','2026-01-15','2025-01-10',1);
ALTER TABLE `alotman` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `najava` WRITE;
ALTER TABLE `najava` DISABLE KEYS;
INSERT INTO `najava` VALUES (46,1,3,4,1,4,'IME1 PREZIME1','','','','2023-08-05','2023-08-09',1),(47,2,4,4,1,3,'IME2 PREZIME 2','','','','2023-07-05','2023-07-08',1),(48,3,3,1,2,6,'IME3 PREZIME3','pušač','','','2023-07-15','2023-07-21',1),(49,2,5,3,3,2,'IME4 PREZIME4','','alergija na kikiriki','','2023-01-10','2023-01-12',1),(50,3,3,5,4,1,'IME5 PREZIME5','','','buket na stolu','2023-08-05','2023-08-06',1),(51,2,2,1,5,7,'IME6 PREZIME6','','','','2023-03-05','2023-03-12',1),(52,1,1,2,6,1,'IME7 PREZIME7','buđenje ujutru','','','2023-02-05','2023-02-06',1),(53,2,9,3,7,15,'IME8 PREZIME8','','','veganska hrana','2023-03-05','2023-03-19',1),(54,2,6,1,8,5,'IME9 PREZIME9','','','mesna ishrana','2024-08-05','2024-08-04',1),(55,1,1,3,9,2,'IME3 PREZIME3','','','','2023-01-07','2023-01-09',1),(56,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2023-08-05','2023-08-09',1),(57,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2023-08-05','2023-08-09',1),(58,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2023-08-05','2023-08-09',1),(59,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2023-08-05','2023-08-09',1),(61,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2023-08-05','2023-08-09',2),(62,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2023-08-05','2023-08-09',2),(64,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2025-02-02','2025-03-03',2);
ALTER TABLE `najava` ENABLE KEYS;
UNLOCK TABLES;

LOCK TABLES `stavke` WRITE;
ALTER TABLE `stavke` DISABLE KEYS;
INSERT INTO `stavke` VALUES (1,1,5),(1,2,3),(1,3,2),(2,1,4),(2,3,1),(3,1,2),(3,2,4),(4,1,3),(4,2,5),(4,3,2),(5,1,4),(5,2,2),(6,1,3),(6,3,4),(7,2,5),(7,3,2),(8,1,4),(8,2,3),(9,1,2),(9,3,5),(10,2,3),(10,3,4),(11,1,5),(11,2,2),(11,3,3),(12,1,4),(12,3,1),(13,2,3),(13,3,4),(14,1,5),(15,1,5),(15,2,3),(15,3,2),(16,1,4),(16,3,1),(17,1,2),(17,2,4),(18,1,3),(18,2,5),(18,3,2),(19,1,4),(19,2,2),(20,1,3),(20,3,4),(21,2,5),(21,3,2),(22,1,4),(22,2,3),(23,1,2),(23,3,5),(24,2,3),(24,3,4),(25,1,5),(25,2,2),(25,3,3),(26,1,4),(26,3,1),(27,2,3),(27,3,4),(28,1,5),(28,2,5),(28,3,2),(29,1,4),(29,2,2),(30,1,3),(30,3,4),(31,2,5),(31,3,2),(32,1,4),(32,2,3),(33,1,2),(33,3,5),(34,2,3),(34,3,4),(35,1,5),(35,2,2),(35,3,3),(36,1,4),(36,3,1),(37,2,3),(37,3,4),(38,1,5),(39,1,3),(39,2,5),(39,3,2),(40,1,4),(40,3,1),(41,1,2),(41,2,4),(42,1,3),(42,2,5),(42,3,2),(43,1,4),(43,2,2),(44,1,3),(44,3,4),(45,2,5),(45,3,2),(46,1,4),(46,2,3),(47,1,2),(47,3,5),(48,2,3),(48,3,4),(49,1,5),(49,2,2),(49,3,3),(50,1,4),(50,3,1),(51,2,3),(51,3,4),(52,1,5),(53,1,3),(53,2,5),(53,3,2),(54,1,4),(54,3,1),(55,1,2),(55,2,4),(56,1,3),(56,2,5),(56,3,2),(57,1,4),(57,2,2),(58,1,3),(58,3,4),(59,2,5),(59,3,2),(60,1,4),(60,2,3),(61,1,2),(61,3,5),(62,2,3),(62,3,4),(63,1,4),(63,2,2),(64,1,3),(64,3,4),(65,2,5),(65,3,2),(66,1,4),(66,2,3),(67,1,2),(67,3,5),(68,2,3),(68,3,4),(69,1,5),(69,2,2),(69,3,3),(70,1,4),(70,3,1),(71,2,3),(71,3,4),(72,1,5),(73,1,3),(73,2,5),(73,3,2),(74,1,4),(74,3,1),(75,1,2),(75,2,4),(76,1,3),(76,2,5),(76,3,2),(77,1,4),(77,2,2),(78,1,3),(78,3,4),(79,2,5),(79,3,2),(80,1,4),(80,2,3),(81,1,2),(81,3,5),(82,2,3),(82,3,4),(83,1,4),(83,2,2),(84,1,3),(84,3,4),(85,2,5),(85,3,2),(86,1,4),(86,2,3),(87,1,2),(87,3,5),(88,2,3),(88,3,4),(89,1,5),(89,2,2),(89,3,3),(90,1,4),(90,3,1),(91,2,3),(91,3,4),(92,1,5),(93,1,3),(93,2,5),(93,3,2),(94,1,4),(94,3,1),(95,1,2),(95,2,4),(96,1,3),(96,2,5),(96,3,2),(97,1,4),(97,2,2),(98,1,3),(98,3,4),(99,2,5),(99,3,2),(100,1,4),(100,2,3),(101,1,2),(101,3,5),(102,2,3),(102,3,4),(103,1,5),(103,2,2),(103,3,3),(104,1,4),(104,3,1),(105,2,3),(105,3,4),(106,1,5),(107,1,3),(107,2,5),(107,3,2),(108,1,4),(108,3,1),(109,1,2),(109,2,4),(110,1,3),(110,2,5),(110,3,2),(111,1,4),(111,2,2),(112,1,3),(112,3,4),(113,2,5),(113,3,2),(114,1,4),(114,2,3),(115,1,2),(115,3,5),(116,2,3),(116,3,4),(117,1,5),(117,2,2),(117,3,3),(118,1,4),(118,3,1),(119,2,3),(119,3,4),(120,1,5),(121,1,3),(121,2,5),(121,3,2),(122,1,4),(122,3,1),(123,1,2),(123,2,4),(124,1,3),(124,2,5),(124,3,2),(125,1,4),(125,2,2),(126,1,3),(126,3,4),(127,2,5),(127,3,2),(128,1,4),(128,2,3),(129,1,2),(129,3,5),(130,2,3),(130,3,4),(131,1,5),(131,2,2),(131,3,3),(132,1,4),(132,3,1),(133,2,3),(133,3,4),(134,1,5),(135,1,3),(135,2,5),(135,3,2),(136,1,4),(136,3,1),(137,1,2),(137,2,4),(138,1,3),(138,2,5),(138,3,2),(139,1,4),(139,2,2),(140,1,3),(140,3,4),(141,1,4),(141,2,2),(142,1,3),(142,3,4),(143,2,5),(143,3,2),(144,1,4),(144,2,3),(145,1,2),(145,3,5),(146,2,3),(146,3,4),(147,1,5),(147,2,2),(147,3,3),(148,1,4),(148,3,1),(149,2,3),(149,3,4),(150,1,5),(151,1,3),(151,2,5),(151,3,2),(152,1,4),(152,3,1),(153,1,2),(153,2,4),(154,1,3),(154,2,5),(154,3,2),(155,1,2),(155,2,4),(155,3,3);
ALTER TABLE `stavke` ENABLE KEYS;
UNLOCK TABLES;

use baza2;

/*Broj gostiju po mjescima */
DELIMITER //
CREATE PROCEDURE BrojGostijuPoMjesecima(IN godina INT)
BEGIN
   SELECT 
    MONTH(datumDolaska) AS mjesec,
    YEAR(datumDolaska) AS godina,
    brojGostiju
FROM 
    rezervacije
WHERE 
    YEAR(datumDolaska) = '2023'
GROUP BY 
    mjesec, godina,brojGostiju;
END //

DELIMITER ;

call BrojGostijuPoMjesecima(2031);

/* broj gostiju po drzavama*/
DELIMITER //
CREATE PROCEDURE brojGostijuPoDrzavama(IN pocetniPeriod DATE, IN krajnjiPeriod DATE)
BEGIN
    SELECT d.nazivDrzave, SUM(r.brojGostiju) as brojGostiPeriod
	FROM rezervacije as r
	INNER JOIN 
		kupci as k ON k.sifraKupca = r.sifraKupca
	INNER JOIN 
		drzava as d ON k.idDrzava = d.idDrzave
	WHERE 
	    (r.datumDolaska BETWEEN pocetniPeriod AND krajnjiPeriod)
	    OR (r.datumOdlaska BETWEEN pocetniPeriod and krajnjiPeriod)
	GROUP BY d.nazivDrzave
	ORDER BY brojGostiPeriod DESC;
END //
DELIMITER ;

call brojGostijuPoDrzavama('2023-01-01','2025-05-05');


DELIMITER //
CREATE PROCEDURE brojNocenjaPoDrzavama(IN pocetniPeriod DATE, IN krajnjiPeriod DATE)
BEGIN
    SELECT 
    	d.nazivDrzave, SUM(DATEDIFF(r.datumOdlaska,r.datumDolaska)+1) as brojNocenja
	FROM rezervacije as r
	INNER join
		kupci as k ON k.sifraKupca = r.sifraKupca
	INNER JOIN 
		drzava as d ON k.idDrzava = d.idDrzave
	WHERE 
	    (r.datumDolaska BETWEEN pocetniPeriod and krajnjiPeriod)
	    OR (r.datumOdlaska BETWEEN pocetniPeriod AND krajnjiPeriod)
	GROUP BY d.nazivDrzave
	ORDER BY brojNocenja DESC;
END //
DELIMITER ;

call brojNocenjaPoDrzavama('2023-01-01','2025-05-05');


DELIMITER //
CREATE PROCEDURE brojGostijuPoSmjestaju(IN pocetniPeriod DATE, IN krajnjiPeriod DATE)
BEGIN	
	select 
		vs.nazivSmjestaja, sum(brojGostiju) as brojGostijuPeriod
	from 
		vrstaSmjestaja  as vs
	inner join 
		najava as n	on n.idVrstaSmjestaja = vs.idVrstaSmjestaja
	WHERE 
	    (n.datumDolaska BETWEEN pocetniPeriod AND krajnjiPeriod)
	    OR (n.datumOdlaska BETWEEN pocetniPeriod AND krajnjiPeriod)
	group by vs.nazivSmjestaja;
END //
DELIMITER ;

call brojGostijuPoSmjestaju('2023-01-01','2025-05-05');


DELIMITER //
CREATE PROCEDURE zauzeceSobeDatum(IN datum DATE)
BEGIN
	select 
		o.nazivObjekta,COUNT(o.objekatID) as obj
	from 
		objekti as o
	inner join 
		sobe as s	on s.objekatID  = o.objekatID 
	inner join 
		rezervacije as r on r.brojSobe = s.brojSobe 
	where 
		datum between r.datumDolaska  and r.datumOdlaska 
	group by 
		o.nazivObjekta;
END //
DELIMITER ;	

-- Trenutni pregled zauzeća alotmana neke agencije. Parametri šifra agencije, datum. Prikazati Tip sobe, ugovoreno, rezervisano
DELIMITER //
CREATE PROCEDURE zauzeceAlotmana(IN sifa INT, IN datum DATE)
BEGIN
    SELECT 
        ag.nazivAgencije, 
        ag.sifraAgencije, 
        n.tipSobeID, 
        COUNT(*) AS brojSoba,
        s.nazivStatusa 
    FROM 
        agencija AS ag 
        INNER JOIN alotman AS a ON a.sifraAgencije = ag.sifraAgencije
        INNER JOIN najava AS n ON n.sifraAlotmana = a.sifraAlotman
        INNER JOIN status AS s ON s.idStatus = n.statusNajave 
    WHERE 
        (n.datumDolaska <= datum AND n.datumOdlaska >= datum) 
        AND a.sifraAgencije = sifa
    GROUP BY 
        ag.nazivAgencije, 
        ag.sifraAgencije, 
        n.tipSobeID,
        s.nazivStatusa;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SlobodneSobe (
    IN pocetniPeriod DATE,
    IN krajnjiPeriod DATE,
    IN brojGostiju INT
)
BEGIN
    SELECT 
        s.brojSobe
    FROM 
        sobe AS s
    WHERE 
        s.brojSobe NOT IN (
            SELECT r.brojSobe
            FROM rezervacije AS r
            WHERE 
                (r.datumDolaska BETWEEN pocetniPeriod AND krajnjiPeriod)
                OR (r.datumOdlaska BETWEEN pocetniPeriod AND krajnjiPeriod)
                OR (r.datumDolaska <= pocetniPeriod AND r.datumOdlaska >= krajnjiPeriod)
        )
    AND (
        (brojGostiju = 1 AND s.tipSobeID = 1) OR
        (brojGostiju = 2 AND s.tipSobeID IN (1,2)) OR
        (brojGostiju >= 3)  -- Vraća sve sobe za 3 ili više gostiju
    )
    ORDER BY s.brojSobe;
END //
DELIMITER ;	






	  