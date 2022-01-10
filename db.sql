-- Setup Database
CREATE DATABASE 293N5;
USE 293N5;

CREATE TABLE Postcode (
    postcode VARCHAR(6),
    adres VARCHAR(255),
    woonplaats VARCHAR(255),
	PRIMARY KEY (postcode)
);

CREATE TABLE Lid (
    lidnummer INT AUTO_INCREMENT,
    naam VARCHAR(255),
    voornaam VARCHAR(255),
    postcode VARCHAR(6),
    huisnummer VARCHAR(16),
	PRIMARY KEY(lidnummer),
	FOREIGN KEY (postcode) REFERENCES Postcode(postcode)
);

CREATE TABLE Telefoonnummer (
    telefoonnummer INT,
    lidnummer INT,
	PRIMARY KEY (telefoonnummer),
	FOREIGN KEY (lidnummer) REFERENCES Lid(lidnummer)
);

CREATE TABLE Email (
    email VARCHAR(255),
    lidnummer INT,
	PRIMARY KEY (email),
	FOREIGN KEY (lidnummer) REFERENCES Lid(lidnummer)
);

CREATE USER 'webuser'@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON 293N5 TO 'webuser'@localhost;
FLUSH PRIVILEGES;