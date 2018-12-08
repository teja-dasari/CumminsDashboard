-- client table setup DONE
DROP TABLE IF EXISTS Vendor;
CREATE TABLE Vendor (
  vendorId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  vendorName VARCHAR(255) NOT NULL,
  vendorDescription VARCHAR(65536) NOT NULL,
  vendorLocation VARCHAR(65536) NOT NULL,
  vendorRating INT NOT NULL,
  compliance VARCHAR(65536) NOT NULL
);
INSERT INTO Vendor (vendorId, vendorName, vendorDescription, vendorLocation, vendorRating, compliance)
VALUES (1, 'Cylinder Inc', 'Cylinder Inc supplies Cylinders', 'Bloomington, IN',1, 'fisma, sox, gdpr');
INSERT INTO Vendor (vendorId, vendorName, vendorDescription, vendorLocation, vendorRating, compliance)
VALUES (2, 'Axles Inc', 'Axles Inc supplies Axles', 'Charlotte, NC',2,'fisma, sox, gdpr');
INSERT INTO Vendor (vendorId, vendorName, vendorDescription, vendorLocation, vendorRating, compliance)
VALUES (3, 'Valves Inc', 'Valves Inc supplies different types of Valves', 'Indianapolis, IN',3, 'fisma, sox');

-- sensor table setup DONE
DROP TABLE IF EXISTS Customer ;
CREATE TABLE Customer (
  customerId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  customerName VARCHAR(255) NOT NULL,
  customerDescription VARCHAR(65536) NOT NULL,
  customerLocation VARCHAR(255) NOT NULL,
  customerRating INT NOT NULL
);
INSERT INTO Customer (customerId , customerName, customerDescription, customerLocation,customerRating)
VALUES (1, 'GreenTruck', 'GreenTruck is a high power truck company','Bloomington, IN',1);
INSERT INTO Customer (customerId , customerName, customerDescription, customerLocation,customerRating)
VALUES (2, 'DriveTrains', 'DriveTrains is a train manufacturer','Indianapolis, IN',2);
INSERT INTO Customer (customerId , customerName, customerDescription, customerLocation,customerRating)
VALUES (3, 'Ford Motors', 'Ford Motors is a car manufacturer', 'Charlotte, NC',3);

  -- enter after TURBINE DEPLOYED
  -- sensorDeployed table setup
DROP TABLE IF EXISTS ProductData;
CREATE TABLE ProductData(
  productId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  productName VARCHAR(255) NOT NULL,
  productType VARCHAR(255) NOT NULL,
  customerName VARCHAR(255) NOT NULL,
  customerId INT  NOT NULL,
  LastprOrderId INT NOT NULL
);


INSERT INTO ProductData(productId, productName,  customerId, customerName, LastprOrderId )
VALUES (1, 'Truckproduct1', 1, 'GreenTruck', 1  );
INSERT INTO  ProductData(productId, productName,  customerId, customerName, LastprOrderId )
VALUES (2, 'Trainproduct1', 2, 'DriveTrains', 2);
INSERT INTO ProductData(productId, productName,  customerId, customerName, LastprOrderId )
VALUES (3, 'CarProduct1', 3, 'Ford Motors', 3);

CREATE TABLE PartsData(
  partsId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  partsName VARCHAR(255) NOT NULL,
  vendorId VARCHAR(255) NOT NULL,
  vendorName VARCHAR(255) NOT NULL,
  LastpaOrderId INT NOT NULL
);

INSERT INTO PartsData(partsId, partsName,  vendorId, vendorName, LastpaOrderId )
VALUES (1, 'Cylinderpart1', 1, 'Cylinder Inc', 1  );
INSERT INTO  PartsData(partsId, partsName,  vendorId, vendorName, LastpaOrderId)
VALUES (2, 'Axlepart1', 2, 'Axle Inc', 2);
INSERT INTO PartsData(partsId, partsName,  vendorId, vendorName, LastpaOrderId)
VALUES (3, 'Valvepart1', 3, 'Valves Inc', 3);

CREATE TABLE PartsOrderStatus(
  paOrderId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  partsId INT NOT NULL,
  paOrderStatus VARCHAR(255) NOT NULL,
  vendorId VARCHAR(255) NOT NULL,
  purchaseAmount INT NOT NULL

)

INSERT INTO PartsOrderStatus(paOrderId, partsId, paOrderStatus , vendorId, purchaseAmount)
Values(1,1,'processing',1,100);
INSERT INTO PartsOrderStatus(paOrderId, partsId, paOrderStatus , vendorId, purchaseAmount)
Values(2,2,'shipped',2,200);
INSERT INTO PartsOrderStatus(paOrderId, partsId, paOrderStatus , vendorId, purchaseAmount)
Values(3,3,'delivered',3,300);

CREATE TABLE ProductsOrderStatus(
  prOrderId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  productId INT NOT NULL,
  prOrderStatus VARCHAR(255) NOT NULL,
  customerId VARCHAR(255) NOT NULL,
  purchaseAmount INT  NOT NULL
)

INSERT INTO ProductsOrderStatus(prOrderId, productId, prOrderStatus , customerId, purchaseAmount)
Values(1,1,'processing',1,100);
INSERT INTO ProductsOrderStatus(prOrderId, productId, prOrderStatus , customerId, purchaseAmount)
Values(2,2,'shipped',2,200);
INSERT INTO ProductsOrderStatus(prOrderId, productId, prOrderStatus , customerId, purchaseAmount)
Values(3,3,'delivered',3,300);

CREATE TABLE IOTData(
  productId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  productName VARCHAR(255) NOT NULL,
  fuelConsumption INT NOT NULL,
  oilStatus  VARCHAR(255) NOT NULL,
  batteryStatus VARCHAR(255) NOT NULL,
  engineStatus VARCHAR(255) NOT NULL,
  defectType VARCHAR(255) NOT NULL,
  defectID INT NOT NULL
)

Insert into IOTData(productId, productName, fuelConsumption, oilStatus, batteryStatus, engineStatus, defectType, defectID )
Values(1,'Truckproduct1',80,'change','recharge','good','no-defect',3);
Insert into IOTData(productId, productName, fuelConsumption, oilStatus, batteryStatus, engineStatus, defectType, defectID )
Values(2,'Trainproduct1',40,'good','good','good','Dirty Air Filter',2);
Insert into IOTData(productId, productName, fuelConsumption, oilStatus, batteryStatus, engineStatus, defectType, defectID )
Values(3,'CarProduct1',20,'empty','replace','replace','Faulty Thermostat',1);

CREATE TABLE DefectCatalog(
  defectID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  productId INT NOT NULL,
  defectDate VARCHAR(255) NOT NULL,
  defectType VARCHAR(255) NOT NULL,
  defectDescription VARCHAR(255) NOT NULL,
  actionTaken VARCHAR(255) NOT NULL
)

Insert into DefectCatalog(defectID, productId,  defectDate, defectType, defectDescription, actionTaken)
Values(1,3,'20 Aug 2016', 'Faulty Thermostat', 'Thermostat does not show the readings for all instances', 'Thermostat regulation team was called in to fix it');
Insert into DefectCatalog(defectID, productId, defectDate, defectType, defectDescription, actionTaken)
Values(2,2, '25 Sep 2017','Dirty Air Filter','Air filter halting the process of production', 'Air Filter was replaced by a new Air Filter in 3 hours');
Insert into DefectCatalog(defectID, productId, defectDate, defectType, defectDescription, actionTaken)
Values(3,1, 'NA', 'no-defect', 'No current defect identified for the product', 'Continue with the successful process with making any change');




------------------------------------------------------------------------------------------------------------------------------------------
























INSERT INTO sensorDeployed (sensorDeployedId, sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (1,	1,	12, 'LVDT-IU0001', '2014-03-19');
INSERT INTO sensorDeployed (sensorDeployedId, sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (2,	1,	12, 'LVDT-IU0002', '2014-06-11');
INSERT INTO sensorDeployed (sensorDeployedId, sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (3,	2,	1, '4L60E-IU0001', '2015-01-03');
INSERT INTO sensorDeployed (sensorDeployedId, sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (4,	3,	1, 'BN350300-IU0001', '2016-02-14');

INSERT INTO sensorDeployed (sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (3,	12, 'Test12-IU0001', '2016-02-14');
INSERT INTO sensorDeployed (sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (3,	12, 'test12-IU0001', '2016-02-14');
INSERT INTO sensorDeployed (sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (3,	13, 'test11-IU0001', '2016-02-14');
INSERT INTO sensorDeployed (sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (3,	1, 'test11b-IU0001', '2016-02-14');
INSERT INTO sensorDeployed (sensorId, turbineDeployedId, serialNumber, deployedDate)
VALUES (3,	10, 'test10b-IU0001', '2016-02-14');


-- sensorTimeSeries table setup
-- insert AFTER SENSOR
DROP TABLE IF EXISTS sensorTimeSeries;
CREATE TABLE sensorTimeSeries (
sensorDeployedId INT NOT NULL,
dataCollectedDate DATE NOT NULL ,
output FLOAT NOT NULL,
heartRate FLOAT NOT NULL,
compressorEfficiency FLOAT NOT NULL,
availability FLOAT NOT NULL,
reliability FLOAT NOT NULL,
firedHours FLOAT NOT NULL,
trips INT NOT NULL,
starts INT NOT NULL,
FOREIGN KEY(sensorDeployedId) REFERENCES sensorDeployed(sensorDeployedId)
);
--for insert queries, reference sensorTimeSeriesEntry.sql


--site table DONE
DROP TABLE IF EXISTS site;
CREATE TABLE site (
siteId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
clientId INT NOT NULL,
siteName VARCHAR(255) NOT NULL,
siteDescription VARCHAR(65536) NOT NULL,
primaryContact VARCHAR(255) NOT NULL,
capacity INT NOT NULL,
commercialDate DATE NOT NULL,
addrLine1 VARCHAR(255) NOT NULL,
addrLine2 VARCHAR(255),
addrCity VARCHAR(255) NOT NULL,
addrState VARCHAR(255) NOT NULL,
addrZip VARCHAR(255) NOT NULL,
addrCountry VARCHAR(255) NOT NULL,
FOREIGN KEY(clientId) REFERENCES client(clientId)
);

INSERT INTO site (siteId,clientId,siteName, siteDescription, primaryContact,capacity,commercialDate,addrLine1,addrLine2,addrCity,addrState, addrZip, addrCountry)
VALUES(1, 2, 'Emerald Waters Plant', 'The Emereald Waters Plant is a tidal field located at the mouth of the Columbia River,several miles west of Vancouver,
  Washington. Emerald Waters first unit began commercial service in 1994,and its second unit followed in 1998.', 'John X', 1011, '1974-01-01', '1729 Ocean Bluff Road', NULL, 'Brownsmead', 'OR', '97103', 'US');
INSERT INTO site (siteId,clientId,siteName, siteDescription, primaryContact,capacity,commercialDate,addrLine1,addrLine2,addrCity,addrState, addrZip, addrCountry)
VALUES(2,2,'Smith Energy Complex','The Jingleheimer Smith Jr. Energy Complex ,south of Snowflake,AZ,includes five large solar fields that generate 1,084 MW. The site began commercial operation in 2001,with additions in 2002 and 2011.','Jean X',1084,'2001-01-01','328 Energy Way',NULL, 'Snowflake', 'AZ','85937','US');
INSERT INTO site (siteId,clientId,siteName, siteDescription, primaryContact,capacity,commercialDate,addrLine1,addrLine2,addrCity,addrState, addrZip, addrCountry)
VALUES(3,2,'King County Farm','The 520-megawatt King County Wind Farm consists of five fields of wind turbine units,and is part of the Tesla Energy Complex near Saphire Lake, Iowa. The plant began operation in 2000 with an addition in 2009.','Jean X',863,'2000-01-01','807 Green Field Rd',NULL,'Titonka','IA','50480','US');

INSERT INTO site (siteId,clientId,siteName, siteDescription, primaryContact,capacity,commercialDate,addrLine1,addrLine2,addrCity,addrState, addrZip, addrCountry)
VALUES(4,3,'Test client 3','The 520-megawatt King County Wind Farm consists of five fields of wind turbine units,and is part of the Tesla Energy Complex near Saphire Lake, Iowa. The plant began operation in 2000 with an addition in 2009.','Jean X',863,'2000-01-01','807 Green Field Rd',NULL,'Titonka','IA','50480','US');
INSERT INTO site (siteId,clientId,siteName, siteDescription, primaryContact,capacity,commercialDate,addrLine1,addrLine2,addrCity,addrState, addrZip, addrCountry)
VALUES(5,4,'Test client 4','The 520-megawatt King County Wind Farm consists of five fields of wind turbine units,and is part of the Tesla Energy Complex near Saphire Lake, Iowa. The plant began operation in 2000 with an addition in 2009.','Jean X',863,'2000-01-01','807 Green Field Rd',NULL,'Titonka','IA','50480','US');
INSERT INTO site (siteId,clientId,siteName, siteDescription, primaryContact,capacity,commercialDate,addrLine1,addrLine2,addrCity,addrState, addrZip, addrCountry)
VALUES(6,5,'Test client 5','The 520-megawatt King County Wind Farm consists of five fields of wind turbine units,and is part of the Tesla Energy Complex near Saphire Lake, Iowa. The plant began operation in 2000 with an addition in 2009.','Jean X',863,'2000-01-01','807 Green Field Rd',NULL,'Titonka','IA','50480','US');


--site turbine DONE
DROP TABLE IF EXISTS turbine;
CREATE TABLE turbine (
turbineId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
turbineName VARCHAR(255) NOT NULL,
turbineDescription VARCHAR(65536) NOT NULL,
capacity INT NOT NULL,
rampUpTime INT NOT NULL,
maintenanceInterval INT NOT NULL
);

INSERT INTO turbine (turbineId,turbineName,turbineDescription,capacity,rampUpTime,maintenanceInterval)
VALUES(1,	'3SA.01',	'The 3SA high efficiency, deep-water tidal turbine is an industry leader among S-class offerings.',	429,	12,	32000);
INSERT INTO turbine (turbineId,turbineName,turbineDescription,capacity,rampUpTime,maintenanceInterval)
VALUES(2,	'3SA.02',	'The 3SA high efficiency, deep-water tidal turbine is an industry leader among H-class offerings.',	519,	12,	32000);
INSERT INTO turbine (turbineId,turbineName,turbineDescription,capacity,rampUpTime,maintenanceInterval)
VALUES(3,	'W7B.01',	'This high efficiency wind turbine turbine is an industry leader among wind offerings.',	280,	10,	22000);
INSERT INTO turbine (turbineId,turbineName,turbineDescription,capacity,rampUpTime,maintenanceInterval)
VALUES(4,	'SF9.06',	'An optimum choice for solar power generation, this series of collectors operates at the cutting edge of efficiency.',	82,	29,	42000);

--site turbineDeployed DONE
DROP TABLE IF EXISTS turbineDeployed;
CREATE TABLE turbineDeployed (
turbineDeployedId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
turbineId INT NOT NULL,
siteId INT NOT NULL,
serialNumber VARCHAR(255) NOT NULL,
deployedDate DATE NOT NULL,
totalFiredHours INT NOT NULL,
totalStarts INT NOT NULL,
lastPlannedOutageDate DATE,
lastUnplannedOutageDate DATE,
FOREIGN KEY(turbineId) REFERENCES turbine(turbineId),
FOREIGN KEY(siteId) REFERENCES site(siteId)
);


INSERT INTO turbineDeployed (turbineId,	siteId,	serialNumber,	deployedDate,	totalFiredHours,	totalStarts,	lastPlannedOutageDate,	lastUnplannedOutageDate)
VALUES(	1,	4,	'tst9HA-01-IU0008',	'2016-07-01',	3543,	5,	'2016-06-01',	NULL);
INSERT INTO turbineDeployed (turbineId,	siteId,	serialNumber,	deployedDate,	totalFiredHours,	totalStarts,	lastPlannedOutageDate,	lastUnplannedOutageDate)
VALUES(	3,	4,	'test7HA-07-IU0121',	'2010-10-23',	32543,	21, '2016-06-01', '2013-05-13');
INSERT INTO turbineDeployed (turbineId,	siteId,	serialNumber,	deployedDate,	totalFiredHours,	totalStarts,	lastPlannedOutageDate,	lastUnplannedOutageDate)
VALUES(	4,	4,	'test9F-06-IU0021',	'2000-02-16',	123543,	119,	'2016-06-01', '2015-04-13');


DROP TABLE IF EXISTS emmissions;
CREATE TABLE emmissions (
emmissionId INT PRIMARY KEY NOT NULL,
product VARCHAR(255) NOT NULL,
numRfidTags VARCHAR(255) NOT NULL,
avgEmmission INT NOT NULL,
epa VARCHAR(10)NOT NULL,
nhtsa VARCHAR(10) NOT NULL,
carb VARCHAR(10) NOT NULL
);

INSERT INTO emmissions (emmissionId,product,numRfidTags,avgEmmission,epa,nhtsa,carb)
VALUES(1,	'See requirement doc','5.2M', 23432,	'Y',	'Y',	'N');



DROP TABLE IF EXISTS serviceLog;
CREATE TABLE serviceLog (
rfidId INT PRIMARY KEY NOT NULL,
rfid VARCHAR(255) NOT NULL,
status VARCHAR(255) NOT NULL,
lastServiceDate INT NOT NULL,
lastServiceDescription VARCHAR(10)NOT NULL
);

INSERT INTO serviceLog (rfidId, rfid, status, lastServiceDate, lastServiceDescription)
VALUES(1,	'07DFGS78F98','Breakdown Detected', '7/24/18', 'Greased');
INSERT INTO serviceLog (rfidId, rfid, status, lastServiceDate, lastServiceDescription)
VALUES(2,	'789FG7VVR5','Breakdown Detected', '8/16/18', 'New Part');
INSERT INTO serviceLog (rfidId, rfid, status, lastServiceDate, lastServiceDescription)
VALUES(3,	'JHKFDGFGU4834','Breakdown Detected', '10/27/17', 'Sensor adjustment ');



SELECT td.turbineDeployedId as turbineDeployedId, td.turbineId as turbineId, td.siteId as siteId, td.serialNumber as serialNumber, td.deployedDate as deployedDate, td.totalFiredHours as totalFiredHours, td.totalStarts as totalStarts, td.lastPlannedOutageDate as lastPlannedOutageDate, td.lastUnplannedOutageDate as lastUnplannedOutageDate,
sd.sensorDeployedId as sensorDeployedId, sd.sensorId as sensorId, sd.serialNumber as sensorSerialNumber, sd.deployedDate as sensorDeployedDate,
st.dataCollectedDate as dataCollectedDate, st.output as output, st.heartRate as heartRate, st.compressorEfficiency as compressorEfficiency, st.availability as availability, st.reliability as reliability, st.firedHours as firedHours, st.trips as trips, st.starts as starts
FROM sensorDeployed as sd, turbineDeployed as td, sensorTimeSeries as st
WHERE sd.turbineDeployedId = 9 AND sd.turbineDeployedId = td.turbineDeployedId AND sd.sensorDeployedId = st.sensorDeployedId;
