CREATE DATABASE PEGAWAI;

CREATE TABLE MAHASISWA (
	NIM CHAR(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NAMA VARCHAR(35) NOT NULL,
	TTL DATE,
	SEX ENUM('P','W'),
	ALAMAT VARCHAR(35),
	KOTA VARCHAR(15)
);

INSERT INTO MAHASISWA (NIM, NAMA, TTL, SEX, ALAMAT, KOTA)
VALUES (NULL, 'A. Hamzah Sianturi', '1965/12/23','P','Jl Siaga Raya Komp. LAN C13','DKI Jakarta');

UPDATE pribadi
SET TGL = "2000-04-23", SEX = "Pria", ALAMAT = "Jl Hemat Nuryana B20", KOTA = "Bogor"
WHERE NIK = "19108072"

UPDATE pribadi
SET KOTA = "Bojong"
WHERE NIK IN ("19108070","19108071")

ALTER TABLE pribadi
CHANGE SEX JENIS_KELAMIN ENUM('P','W')