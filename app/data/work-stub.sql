DROP TABLE IF EXISTS Client;

CREATE TABLE Client (
  clientId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  clientName VARCHAR(30) NOT NULL,
  clientDescription VARCHAR(500) NOT NULL,
  gicsSector VARCHAR(30) NOT NULL,
  gicsSubIndustry VARCHAR(30) NOT NULL,
  headquarters VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Site;

CREATE TABLE Site(
    siteId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    clientId INTEGER NOT NULL,
    siteName VARCHAR(50) NOT NULL,
    siteDescription VARCHAR(500),
    primaryContact VARCHAR(50),
    capacity INTEGER,
    commercialDate DATE,
    addrLine1 VARCHAR(100),
    addrLine2 VARCHAR(100),
    addrCity VARCHAR(100),
    addrState VARCHAR(10),
    addrZip INTEGER,
    addrCountry VARCHAR(100),
    CONSTRAINT clientId_fk FOREIGN KEY (clientId) REFERENCES Client (clientId)
);

DROP TABLE IF EXISTS Turbine;

CREATE TABLE Turbine(
    turbineId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    turbineName VARCHAR(50) NOT NULL,
    turbineDescription VARCHAR(500),
    capacity INTEGER,
    rampUpTime INTEGER,
    maintenanceInterval INTEGER
);

DROP TABLE IF EXISTS TurbineDeployed;

CREATE TABLE TurbineDeployed(
    turbineDeployedId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    turbineId INTEGER NOT NULL,
    siteId INTEGER NOT NULL,
    serialNumber VARCHAR(50) NOT NULL,
    deployedDate DATE,
    totalFiredHours INTEGER,
    totalStarts INTEGER,
    lastPlannedOutageDate DATE,
    lastUnplannedOutageDate DATE,
    CONSTRAINT siteId_fk FOREIGN KEY (siteId) REFERENCES Site (siteId),
    CONSTRAINT turbineId_fk FOREIGN KEY (turbineId) REFERENCES Turbine (turbineId)
);

DROP TABLE IF EXISTS Sensor;

CREATE TABLE Sensor(
    sensorId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sensorName VARCHAR(50) NOT NULL,
    sensorDescription VARCHAR(500),
    manufacturer VARCHAR(100),
    totalLifeExpectancyHours INTEGER
);

DROP TABLE IF EXISTS SensorDeployed;

CREATE TABLE SensorDeployed(
    sensorDeployedId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sensorId INTEGER NOT NULL,
    turbineDeployedId INTEGER NOT NULL,
    serialNumber VARCHAR(50) NOT NULL,
    deployedDate DATE,
    CONSTRAINT sensorId_fk FOREIGN KEY (sensorId) REFERENCES Sensor (sensorId),
    CONSTRAINT turbineDeployedId_fk FOREIGN KEY (turbineDeployedId) REFERENCES TurbineDeployed (turbineDeployedId)
);

DROP TABLE IF EXISTS SensorTimeSeries;

CREATE TABLE SensorTimeSeries(
    sensorDeployedId INTEGER NOT NULL,
    dataCollectedDate DATE,
    output VARCHAR(50),
    heatRate VARCHAR(50),
    compressorEfficiency VARCHAR(50),
    availability VARCHAR(50),
    reliability VARCHAR(50),
    firedHours VARCHAR(50),
    trips INTEGER,
    starts INTEGER,
    PRIMARY KEY (sensorDeployedId, dataCollectedDate),
    CONSTRAINT sensorDeployedId_fk FOREIGN KEY (sensorDeployedId) REFERENCES SensorDeployed (sensorDeployedId)
);


CREATE VIEW heatRate AS
SELECT sd.sensorId, s.heatRate, td.turbineId
FROM SensorTimeSeries s, SensorDeployed sd, TurbineDeployed td
WHERE s.sensorDeployedId = sd.sensorDeployedId AND td.turbineDeployedId = sd.TurbineDeployedId;

Drop View If Exists heatRate;

Select * from heatRate;

SELECT * from SensorTimeSeries sts inner join SensorDeployed sd on sts.sensorDeployedId = sd.sensorDeployedId inner join TurbineDeployed td on sd.TurbineDeployedId = td.TurbineDeployedId where sd.sensorDeployedId = ?;

SELECT * from SensorTimeSeries sts inner join SensorDeployed sd on sts.sensorDeployedId = sd.sensorDeployedId inner join TurbineDeployed td on sd.TurbineDeployedId = td.TurbineDeployedId where turbineId = ?;
