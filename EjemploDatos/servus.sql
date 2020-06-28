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
insert into app.client values('1','1','esteban','621214914','Olivereta 35','1990-05-04','sancochito69',true);
insert into app.client values('2','1','sebastian','612345677','Olivereta 35','1992-01-21','silversurfer',true);
insert into app.client values('3','1','juanfer','666328282','Albocacer 19','1996-04-12','alibaba',true);

insert into app.servicetype values(1,'Mecanica');
insert into app.servicetype values(2,'Peluqueria');
insert into app.servicetype values(3,'Mercado');

insert into app.service values(1,'1',1,'Alberto','pequeña empresa','Monte Olivo 40','666666666',true);
insert into app.service values(2,'2',1,'Begoña','pequeña empresa','Perez galdos 1','777777777',true);
insert into app.service values(3,'3',1,'Hugo','pequeña empresa','Calle Brazil 42','123456789',true);

insert into app.serviceitem values(1,1,'cambio de aceite','30€');
insert into app.serviceitem values(2,1,'corte','10€');
insert into app.serviceitem values(3,1,'pescado variado','100€');

insert into app.servicedetail values(1,1,1);
insert into app.servicedetail values(2,2,1);
insert into app.servicedetail values(3,3,1);

insert into app.reserve values(1,'1',1,'2020-05-05','20:00','02:00');
insert into app.reserve values(2,'2',2,'2020-01-01','16:00','02:00');
insert into app.reserve values(3,'3',3,'2020-05-05','15:00','02:00');




