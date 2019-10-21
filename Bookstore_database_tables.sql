CREATE TABLE Author
(
  AuthorID INT AUTO_INCREMENT,
  AuthorFName VARCHAR(45) NOT NULL,
  AuthorLName VARCHAR(45) NOT NULL,
  CONSTRAINT PK_Author_AuthorID PRIMARY KEY (AuthorID)
);

CREATE TABLE Book_Author
(
  BookID INT NOT NULL,
  AuthorID INT NOT NULL,
  CONSTRAINT FK_BookAuthor_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
  CONSTRAINT FK_BookAuthor_AuthorID FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
  CONSTRAINT U_BookAuthor UNIQUE (BookID, AuthorID)
);

CREATE TABLE Publisher
(
  PubID INT AUTO_INCREMENT,
  PubName VARCHAR(75) NOT NULL,
  AddressID INT,
  CONSTRAINT PK_Publisher_PubID PRIMARY KEY (PubID),
  CONSTRAINT FK_Publisher_AddressID FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
  CONSTRAINT U_Publisher UNIQUE (addressID,PubName)
);

CREATE TABLE Book_Publisher
(
  BookID INT NOT NULL,
  PubID INT NOT NULL,
  CONSTRAINT FK_BookPublisher_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
  CONSTRAINT FK_BookAuthor_PubID FOREIGN KEY (PubID) REFERENCES Publisher(PubID),
  CONSTRAINT U_BookPublisher UNIQUE (BookID, PubID)
);

INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Mark', 'Twain');
INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Dan', 'Brown');
INSERT INTO Author (AuthorFName, AuthorLName) VALUES ('Jerome', 'Salinger');
INSERT INTO Publisher (PubName) VALUES ('Penguin Random House');
INSERT INTO Publisher (PubName) VALUES ('Del Ray');
INSERT INTO Publisher (PubName) VALUES ('Simon & Schuster');

CREATE TABLE State
(
  StateID INT NOT NULL AUTO_INCREMENT,
  State varchar(45) NOT NULL,
  PRIMARY KEY (StateID)
);

CREATE TABLE City
(
  CityID INT NOT NULL AUTO_INCREMENT,
  City varchar(45) NOT NULL,
  PRIMARY KEY (CityID)
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

CREATE TABLE AddressType
(
  AdressTypeID INT NOT NULL AUTO_INCREMENT,
  AddressTypeName varchar(30) NOT NULL,
  PRIMARY KEY (AdressTypeID)
);

CREATE TABLE Address_AddressType
(
  AddressFK INT NOT NULL,
  AddressTypeFK INT NOT NULL,
  FOREIGN KEY (AddressFK) REFERENCES Address(AddressID),
  FOREIGN KEY (AddressTypeFK) REFERENCES AddressType(AdressTypeID)
);


CREATE TABLE Address
(
  AddressID INT NOT NULL AUTO_INCREMENT,
  Street varchar(60) NOT NULL,
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

INSERT INTO State (State) VALUES ('NY'), ('NJ');

INSERT INTO City (City) VALUES ('Alfred'), ('Hornell');

INSERT INTO Zip (ZipID) VALUES (14820), (14843);

INSERT INTO City_Zip (CityFK, ZipFK) VALUES (1, 1), (2, 2);

INSERT INTO AddressType (AddressTypeName) VALUES ('Shipping'), ('Billing');

INSERT INTO Address_AddressType (AddressFK, AddressTypeFK) VALUES (1, 1), (1, 2);

INSERT INTO Address (Street, CityFK, StateFK) VALUES ('2382 Main St.', 1, 1), ('2392 The Rd.', 2, 1);

INSERT INTO Customer_Address (CustomerFK, AddressFK) VALUES (1, 1), (2, 2);
