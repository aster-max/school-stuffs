USE DB_PETSHOP;
--#---------------------
CREATE TABLE TB_OWNER (
	ID INT(3) AUTO_INCREMENT,
	NAME VARCHAR(35) NOT NULL,
	ADDRESS VARCHAR(50) NOT NULL,
	PHONE VARCHAR(13) NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE TB_PET (
	ID INT(3) AUTO_INCREMENT,
	ID_OWNER INT(3) NOT NULL,
	NAME VARCHAR(25) NOT NULL,
	BIRTH_FOUND DATE NULL,
	SPECIES VARCHAR(20) NOT NULL,
	RACE VARCHAR(20) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_OWNER) REFERENCES TB_OWNER(ID)		
);

CREATE TABLE TB_STAFF (
	ID INT(3) AUTO_INCREMENT,
	NAME VARCHAR(35) NOT NULL,
	ADDRESS VARCHAR(50) NOT NULL,
	PHONE VARCHAR(13) NOT NULL,
	STATUS VARCHAR(10) NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE TB_MEDIC (
	ID INT(3) AUTO_INCREMENT,
	NAME VARCHAR(35) NOT NULL,
	ADDRESS VARCHAR(50) NOT NULL,
	PHONE VARCHAR(13) NOT NULL,
	STATUS VARCHAR(10) NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE TB_PRODUCT (
	ID INT(3) AUTO_INCREMENT,
	NAME VARCHAR(30) NOT NULL,
	UNIT VARCHAR(10) NOT NULL,
	STOCK INT(3),
	PRICE DECIMAL(8,2) NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE TB_RESERVATION (
	ID INT(3) AUTO_INCREMENT,
	ID_PET INT(3) NOT NULL,
	ID_STAFF INT(3) NOT NULL,
	ISSUED_DATE DATETIME NOT NULL,
	STATUS VARCHAR(20) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_PET) REFERENCES TB_PET(ID),	
	FOREIGN KEY (ID_STAFF) REFERENCES TB_STAFF(ID)		
);

CREATE TABLE TB_COMMIT (
	ID INT(3) AUTO_INCREMENT,
	ID_RESV INT(3) NOT NULL,
	ID_MEDIC INT(3) NOT NULL,
	ISSUED_DATE DATETIME NOT NULL,
	FEE DECIMAL(8,2) NOT NULL,
	PAY_AMOUNT DECIMAL(8,2) NOT NULL,
	CHANGE_AMOUNT DECIMAL(8,2) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_RESV) REFERENCES TB_RESERVATION(ID),
	FOREIGN KEY (ID_MEDIC) REFERENCES TB_MEDIC(ID)
);

CREATE TABLE TB_RECIEPT (
	ID INT(3) AUTO_INCREMENT,
	ID_COMMIT INT(3) NOT NULL,
	ID_PROD INT(3) NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	TYPE VARCHAR(15) NOT NULL,
	QTY INT(3) NOT NULL,
	TOTAL_PRICE DECIMAL(8,2) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_COMMIT) REFERENCES TB_COMMIT(ID),
	FOREIGN KEY (ID_PROD) REFERENCES TB_PRODUCT(ID)
);

CREATE OR REPLACE VIEW WORKERS AS
SELECT * FROM TB_STAFF
UNION
SELECT * FROM TB_MEDIC
ORDER BY STATUS ASC;

--# FLOW : RESERVATION >> COMMIT >> RECEIPT
--#---------------------
INSERT INTO TB_OWNER VALUES
(NULL, 'Muhammad Nur Irsyad', 'JL Siaga Raya Komp.LAN C13, Pejaten Barat', '081318420901'),
(NULL, 'Cole Phelps', 'JL Mampang Prapatan IV B12 , Mampang', '082125337746'),
(NULL, 'Jennifer Dunn', 'JL Penerangan Komp.Rajawali G23A, Grogol', '08281198231'),
(NULL, 'Misashi Kitomoto', 'JL Siaga Baru 3 A12, Pejaten Barat', '08152390384')

INSERT INTO TB_PET VALUES
(NULL, 'Jemblem', 1, '2019-2-01', 'Domicile Cat', 'Half Tuxedo'),
(NULL, 'Gribi', 1, '2019-3-20', 'Domicile Cat', 'Bombay Cat'),
(NULL, 'Diwul', 2, '2019-11-30', 'Exclusive Cat', 'Persian Pignose'),
(NULL, 'Sobi', 3, '2020-2-20', 'Domicile Cat', 'Half Tiger-Bengal'),
(NULL, 'Snowy', 4, '2020-6-15', 'Exclusive Cat', 'Polar Panda'),
(NULL, 'Slinky', 4, '2014-10-2', 'Domicile Dog', 'Doggo Pon Pon'),
(NULL, 'Ulskar', 5, '2010-3-1', 'Exclusive Tortoise', 'Brazil Sun')

INSERT INTO TB_MEDIC VALUES
(NULL, 'Dr. Marisa Huegene', 'Pondok Indah Mall - Apartment B202, Tanggerang', '081312947353', 'ACTIVE'),
(NULL, 'Dr. Thompson H Lars', 'Pondok Indah Mall - Apartment F316, Tanggerang', '082312390033', 'ACTIVE'),
(NULL, 'Dr. Anathan Joheinski', 'JL Kenari Rosada Komp.Barat Dua B13, Bekasi', '081923103945', 'INACTIVE'),
(NULL, 'Dr. Shcandell Owana', 'Aeon Mall - Apartement K-520, Daan Mogot', '081310394852', 'ACTIVE');

INSERT INTO TB_STAFF VALUES
(NULL, 'Bethari Loeny Kurnia', 'JL Jend Sudirman Lt.19 Suite 12, Bendungan Hilir', '0215741442','ACTIVE'),
(NULL, 'Raharjo Putra Sumadi', 'JL Boulevard Artha Gading B32, Kelapa Gading', '0214515828','ACTIVE'),
(NULL, 'Cinta Susanti Gunawan', 'JL Hayam Wuruk 20 Kediri 64121, Kediri', '082142375488','INACTIVE');

INSERT INTO TB_PRODUCT VALUES
(NULL, 'Basic Grooming - Bath, Nails, Ear Cleaning', NULL, NULL, 35000.00),
(NULL, 'Grooming A La Carte - Basic & Feather Extensions', NULL, NULL, 130000.00),
(NULL, 'Cute Waterbath - Nails, Brush, Anal Gland, Meni', NULL, NULL, 130000.00),
(NULL, 'Growssy Kitten', '12 pcs', 30, 45000.00),
(NULL, 'Hash Bloom Litter - Coffee', '20 L', 21, 120000.00),
(NULL, 'Hash Bloom Litter - Lemon', '15 L', 12, 89000.00),
(NULL, 'Royal Canin Baby Pacifier L', '1 pcs', 19, 47500.00);

INSERT INTO TB_RESERVATION VALUES
(NULL, 1, 2, NOW(), 'DONE'),
(NULL, 2, 2, NOW(), 'ONGOING'),
(NULL, 4, 2, NOW(), 'PENDING'),
(NULL, 7, 2, NOW(), 'PENDING'),
(NULL, 6, 2, NOW(), 'PENDING')

INSERT INTO TB_COMMIT VALUES
(NULL, 1, 4, NOW(), 125000.00, 200000.00, 75000.00);

INSERT INTO TB_RECIEPT VALUES
(NULL, 1, 1, NULL, 35000.00),
(NULL, 1, 4, 2, 90000.00);

--#---------------------
DESC TB_PET;
DROP TABLE TB_PET;
DROP VIEW WORKERS;
TRUNCATE TABLE TB_PET;

--#---------------------
SELECT * FROM TB_PET
WHERE FAMILY NOT IN 
(
	SELECT FAMILY FROM TB_PET
	WHERE FAMILY LIKE 'Polar%'
	OR ID_PETS <= 3
);

SELECT ID, CONCAT(NAME,', found in: ',BIRTH) 
AS DETAILS, SPECIES, FAMILY 
FROM TB_PET;

SHOW TABLES;
SELECT * FROM TB_PRODUCT
WHERE PRICE > (
	SELECT AVG(PRICE)
	FROM TB_PRODUCT
)
ORDER BY PRICE ASC;

SELECT * FROM TB_RESERVATION
WHERE ISSUED_DATE < (
	SELECT NOW()
)
ORDER BY ISSUED_DATE;

SELECT * FROM TB_PRODUCT
WHERE PRICE > (
	SELECT DISTINCT AVG(PRICE)
	FROM TB_PRODUCT
)
AND UNIT != 'NULL'
ORDER BY PRICE ASC;

SELECT P.ID, O.NAME AS 'OWNER NAME', P.NAME AS PET
FROM TB_OWNER O INNER JOIN TB_PET P
ON O.ID = P.ID_OWNER
ORDER BY P.ID_OWNER ASC;

SELECT P.ID, O.NAME AS 'OWNER NAME', P.NAME AS PET
FROM TB_OWNER O, TB_PET P
WHERE O.ID = P.ID_OWNER
ORDER BY P.ID_OWNER ASC;




--#---------------------
