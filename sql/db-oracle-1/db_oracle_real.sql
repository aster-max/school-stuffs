# -------------------------------------------------------------------
CREATE SEQUENCE NIP_INC START WITH 1807422001 INCREMENT BY 1 NOCACHE;


CREATE table "TB_KARYAWAN" (
    "NIP"        NUMBER(10) DEFAULT NIP_INC.nextval NOT NULL,
    "FULL_NAME"  VARCHAR2(35) NOT NULL,
    "SEX"        CHAR(1) NOT NULL,
    "BIRTH"      DATE NOT NULL,
    "PHONE"      VARCHAR2(12) NOT NULL,
    "EMAIL"      VARCHAR2(35) NOT NULL,
    constraint "TB_KARYAWAN_PK" primary key ("NIP")
);
CREATE table "TB_PEKERJAAN" (
	"JOB_ID" 	 VARCHAR2(3) NOT NULL,
    "JOB_TITLE"  VARCHAR2(30) NOT NULL,
    "MIN-SALARY" NUMBER(10,2) NOT NULL,
    "MAX-SALARY" NUMBER(10,2) NOT NULL,
    constraint "TB_PEKERJAAN_PK" primary key ("JOB_ID")
);
CREATE table "TB_HISTORY_PEKERJAAN" (
	"NIP" 	 NUMBER(10) NOT NULL,
    "START-DATE"  DATE NOT NULL,
    "END-DATE" DATE NOT NULL,
    "JOB_ID" VARCHAR2(3) NOT NULL,
    constraint "TB_HISTORY_PEKERJAAN" primary key ("NIP","START-DATE"),
    constraint "FK_NIP" FOREIGN KEY (NIP) REFERENCES TB_KARYAWAN(NIP),
    constraint "FK_JOB" FOREIGN KEY (JOB_ID) REFERENCES TB_PEKERJAAN(JOB_ID)
);
# -------------------------------------------------------------------
ALTER TABLE TB_KARYAWAN ADD CONSTRAINT 
CHECK_SEX CHECK (SEX IN ('F','M'));
ALTER TABLE TB_KARYAWAN ADD CONSTRAINT 
CHECK_EMAIL CHECK (EMAIL LIKE '%@%.%');
# -------------------------------------------------------------------
ALTER TABLE TB_KARYAWAN SET UNUSED (SALARY);
# -------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRG_CHECK_BIRTH
BEFORE INSERT OR UPDATE ON TB_KARYAWAN
FOR EACH ROW
BEGIN
	IF (ADD_MONTHS(:new.BIRTH, 18 * 12) < SYSDATE)
	THEN
		RAISE_APPLICATION_ERROR(-20001,'Karyawan needed to be atleast 18 years old');
	END IF;
END;
# -------------------------------------------------------------------
DELETE FROM TB_KARYAWAN;
DROP TABLE TB_KARYAWAN;
DROP SEQUENCE NIP_INC;
# -------------------------------------------------------------------
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Rajon Rondo','M',DATE'1999-11-19','081318420901','rajon.lakerschmp@gmai.com',5000000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Kyle Kuzma','M',DATE'1995-03-25','082125337746','kykuzz@rocketmail.com',4750000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'DeMarcus Morris','M',DATE'2001-01-25','0215663979','dmmorry@lethal.net',5750000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Alex Caruso','M',DATE'1998-07-07','08213895755','thecarushow@espn.in',5000000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Natasha A. Leggero','F',DATE'1998-12-27','08215832943','nattdagirl@espn.in',4500000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Jennifer Aniston','F',DATE'1999-02-21','083134265843','aniston.jenn@gmail.com',4950000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Dany Green','M',DATE'1994-12-30','082119231923','danythefro@yahoo.com',6050000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'LeBron R. James','M',DATE'1999-02-13','081932834923','legoat@espn.in',6000000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Anthony A. Davis','M',DATE'1994-02-20','08192132192','ad.davis331@rocketmail.com',5600000.00);
INSERT INTO TB_KARYAWAN VALUES (NIP_INC.nextval,'Lienan Stephaniee','F',DATE'2001-05-17','02118231932','lli33nan.stephh@yelp.admin.io',6200000.00);

INSERT INTO TB_PEKERJAAN VALUES ('CSR','Cashier Staff',40000.00,70000.00);
INSERT INTO TB_PEKERJAAN VALUES ('MGR','Head Manager',70000.00,80000.00);
INSERT INTO TB_PEKERJAAN VALUES ('DPT','Head Department',50000.00,65000.00);
INSERT INTO TB_PEKERJAAN VALUES ('CRR','Courier Transportation',30000.00,40000.00);

INSERT INTO TB_HISTORY_PEKERJAAN VALUES (1807422003,SYSDATE,ADD_MONTHS(SYSDATE, 12) ,'MGR');
INSERT INTO TB_HISTORY_PEKERJAAN VALUES (1807422002,SYSDATE,ADD_MONTHS(SYSDATE, 8) ,'CRR');
INSERT INTO TB_HISTORY_PEKERJAAN VALUES (1807422005,SYSDATE,ADD_MONTHS(SYSDATE, 30) ,'DPT');
INSERT INTO TB_HISTORY_PEKERJAAN VALUES (1807422004,SYSDATE,ADD_MONTHS(SYSDATE, 30) ,'DPT');
INSERT INTO TB_HISTORY_PEKERJAAN VALUES (1807422009,SYSDATE,ADD_MONTHS(SYSDATE, 5) ,'CSR');


# -------------------------------------------------------------------
UPDATE TB_KARYAWAN SET EMAIL = 'rajon.lakerschamp@gmail.com' WHERE NIP = 1807422000;
# -------------------------------------------------------------------
SELECT * FROM TB_KARYAWAN;
SELECT * FROM TB_KARYAWAN ORDER BY NIP;
SELECT * 
FROM TB_HISTORY_PEKERJAAN
NATURAL JOIN TB_PEKERJAAN;
SELECT * 
FROM TB_HISTORY_PEKERJAAN
CROSS JOIN TB_PEKERJAAN;
SELECT HP.NIP, KR.FULL_NAME, HP."START-DATE", HP."END-DATE", PK.JOB_TITLE
FROM TB_PEKERJAAN PK
INNER JOIN TB_HISTORY_PEKERJAAN HP ON HP.JOB_ID = PK.JOB_ID
INNER JOIN TB_KARYAWAN KR ON KR.NIP = HP.NIP
ORDER BY NIP;
SELECT HP.NIP, KR.FULL_NAME, HP."START-DATE", HP."END-DATE", PK.JOB_TITLE
FROM TB_PEKERJAAN PK
LEFT OUTER JOIN TB_HISTORY_PEKERJAAN HP ON HP.JOB_ID = PK.JOB_ID
RIGHT OUTER JOIN TB_KARYAWAN KR ON KR.NIP = HP.NIP
ORDER BY NIP;
SELECT HP.NIP, KR.FULL_NAME, HP."START-DATE", HP."END-DATE", PK.JOB_TITLE
FROM TB_PEKERJAAN PK
INNER JOIN TB_HISTORY_PEKERJAAN HP ON HP.JOB_ID = PK.JOB_ID
FULL OUTER JOIN TB_KARYAWAN KR ON KR.NIP = HP.NIP
ORDER BY NIP;
# -------------------------------------------------------------------

