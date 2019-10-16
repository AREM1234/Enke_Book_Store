CREATE TABLE State
(
  StateID INT NOT NULL,
  State INT NOT NULL,
  PRIMARY KEY (StateID)
);

CREATE TABLE City
(
  CityID INT NOT NULL,
  City INT NOT NULL,
  PRIMARY KEY (CityID)
);

CREATE TABLE AddressType
(
  AdressTypeID INT NOT NULL,
  AddressTypeName INT NOT NULL,
  PRIMARY KEY (AdressTypeID)
);


CREATE TABLE Zip
(
  ZipID INT NOT NULL,
  PRIMARY KEY (ZipID)
);

CREATE TABLE City_Zip
(
  CityFK INT NOT NULL,
  ZipFK INT NOT NULL,
  FOREIGN KEY (CityFK) REFERENCES City(CityID),
  FOREIGN KEY (ZipFK) REFERENCES Zip(ZipID)
);

CREATE TABLE Address
(
  AddressID INT NOT NULL,
  Street INT NOT NULL,
  CityFK INT NOT NULL,
  StateFK INT NOT NULL,
  PRIMARY KEY (AddressID),
  FOREIGN KEY (StateFK) REFERENCES State(StateID),
  FOREIGN KEY (CityFK) REFERENCES City(CityID)
);

CREATE TABLE Customer_Address
(
  CustomerFK INT NOT NULL,
  AddressFK INT NOT NULL,
  FOREIGN KEY (CustomerFK) REFERENCES Customer(CustomerID),
  FOREIGN KEY (AddressFK) REFERENCES Address(AddressID)
);

CREATE TABLE Address_AddressType
(
  AddressFK INT NOT NULL,
  AddressTypeFK INT NOT NULL,
  FOREIGN KEY (AddressFK) REFERENCES Address(AddressID),
  FOREIGN KEY (AddressTypeFK) REFERENCES AddressType(AdressTypeID)
);
