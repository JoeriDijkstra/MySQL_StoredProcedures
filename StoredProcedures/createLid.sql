-- START STORED PROCEDURE: Create Lid
DELIMITER //

CREATE PROCEDURE CreateLid (
postcode VARCHAR(6),
adres VARCHAR(255),
woonplaats VARCHAR(255),
lastname VARCHAR(255),
firstname VARCHAR(255),
housenumber VARCHAR(16),
phonenumber INT,
email VARCHAR(255))

BEGIN

-- Insert the data set
INSERT IGNORE INTO `Postcode` VALUES (
    postcode,
    adres,
    woonplaats
);

INSERT INTO `Lid` VALUES (
    0, -- Auto Increment
    lastname,
    firstname,
    postcode,
    housenumber
);

-- Get the latest lid number
SELECT @lidnummer:=MAX(lidnummer) FROM Lid;

INSERT INTO `Telefoonnummer` VALUES (
    phonenumber,
    @lidnummer
);

INSERT INTO `Email` VALUES (
    email,
    @lidnummer
);

END //

DELIMITER ;