CREATE DATABASE app;
USE app;

-- -----------------------------------------------------
-- Table CLIENT
-- -----------------------------------------------------
CREATE TABLE CLIENT (
  userId VARCHAR(80) NOT NULL,
  userType VARCHAR(1) NOT NULL,
  name VARCHAR(80) NOT NULL,
  mobile VARCHAR(80) NOT NULL,
  address VARCHAR(80),
  birthday DATE,
  keyCode VARCHAR(80) NOT NULL,
  active BOOLEAN NOT NULL,
  PRIMARY KEY (userId)
);

-- -----------------------------------------------------
-- Table SERVICETYPE
-- -----------------------------------------------------
CREATE TABLE SERVICETYPE (
  serviceType INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(80) NOT NULL,
  PRIMARY KEY (serviceType) 
);

-- -----------------------------------------------------
-- Table SERVICE
-- -----------------------------------------------------
CREATE TABLE SERVICE (
  serviceId INT NOT NULL AUTO_INCREMENT,
  serviceType INT NOT NULL,
  adminId VARCHAR(80) NOT NULL,
  name VARCHAR(80) NOT NULL,
  description VARCHAR(80) NOT NULL,
  address VARCHAR(80) NOT NULL,
  mobile VARCHAR(80) NOT NULL,
  active BOOLEAN NOT NULL,
  PRIMARY KEY (serviceId),
  FOREIGN KEY (serviceType) REFERENCES SERVICETYPE (serviceType),
  FOREIGN KEY (adminId) REFERENCES CLIENT (userId)
);


-- -----------------------------------------------------
-- Table SERVICEITEM
-- -----------------------------------------------------
CREATE TABLE SERVICEITEM (
   serviceType INT NOT NULL AUTO_INCREMENT,
  itemId INT NOT NULL ,
  description VARCHAR(80) NOT NULL,
  itemValue VARCHAR(80) NOT NULL,
  PRIMARY KEY (serviceType, itemId),
  FOREIGN KEY (serviceType) REFERENCES SERVICETYPE (serviceType)
);


-- -----------------------------------------------------
-- Table SERVICEDETAIL
-- -----------------------------------------------------
CREATE TABLE SERVICEDETAIL (
  serviceId INT NOT NULL,
  serviceType INT NOT NULL,
  itemId INT NOT NULL,
  PRIMARY KEY (serviceId,itemId),
  FOREIGN KEY (serviceId) REFERENCES SERVICE (serviceId),
  FOREIGN KEY (serviceType,itemId) REFERENCES SERVICEITEM (serviceType,itemId)
);


-- -----------------------------------------------------
-- Table RESERVE
-- -----------------------------------------------------
CREATE TABLE RESERVE (
  reserveId INT NOT NULL AUTO_INCREMENT,
  userId VARCHAR(80) NOT NULL,
  serviceId INT NOT NULL,
  reserveDate date NOT NULL,
  reserveHour time NOT NULL,
  reserveDuration VARCHAR(80) NOT NULL,
  PRIMARY KEY (reserveId),
  FOREIGN KEY (userId) REFERENCES CLIENT (userId) ,
  FOREIGN KEY (serviceId) REFERENCES SERVICE (serviceId)
);

