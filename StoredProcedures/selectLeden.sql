-- START STORED PROCEDURE: Select Lid
DELIMITER //

CREATE PROCEDURE SelectLeden()
BEGIN
SELECT Lid.naam, Lid.voornaam, Lid.postcode, Lid.huisnummer, Postcode.adres, 
Postcode.woonplaats, Email FROM Lid 
LEFT OUTER JOIN Postcode ON Lid.postcode = Postcode.postcode
LEFT OUTER JOIN Email on Lid.lidnummer = Email.lidnummer
LEFT OUTER JOIN Telefoonnummer on Lid.lidnummer = Telefoonnummer.lidnummer;
END //

DELIMITER ;