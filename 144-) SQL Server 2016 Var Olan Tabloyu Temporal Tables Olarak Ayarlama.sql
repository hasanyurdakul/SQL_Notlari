--SQL Server 2016 Var Olan Tabloyu Temporal Tables Olarak Ayarlama



CREATE TABLE DERSKAYITLARI
(																									  
	DERSID INT PRIMARY KEY IDENTITY(1,1),															  
	DERS NVARCHAR(MAX),																				  
	ONAY BIT
)

INSERT DERSKAYITLARI VALUES ('MATEMATIK',1),
							('FIZIK',1),
							('KIMYA',1),
							('TURKCE',0),
							('COGRAFYA',0),
							('VATANDASLIK',0)

SELECT * FROM DERSKAYITLARI


--EGER BU TABLOYU TEMPORAL YAPMAK ISTIYORSAK DIKKAT !!!
--TABLO ICERISINDE VERI VAR MI? YOK MU? EGER VAR ISE YENI EKLENECEK OLAN ''STARTDATE'' VE ''ENDDATE'' KOLONLARI BOS KALAMAYACAKLARI ICIN VARSAYILAN DEGERLERIN BELIRTILMESI GEREKMEKTEDIR. EGER VERI YOK ISE BU ISLEMLERI DUSUNMEMIZE GEREK YOKTUR.

--EGER VERI YOK ISE -->
ALTER TABLE DERSKAYITLARI
ADD
STARTDATE DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
ENDDATE DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
PERIOD FOR SYSTEM_TIME(STARTDATE, ENDDATE)


--EGER VERI VAR ISE -->
ALTER TABLE DERSKAYITLARI
ADD
STARTDATE DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
DEFAULT CAST('1900-01-01 00:00:00.0000000' AS DATETIME2),
ENDDATE DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
DEFAULT CAST('9999-12-31 23:59:59.9999999' AS DATETIME2),
PERIOD FOR SYSTEM_TIME(STARTDATE, ENDDATE)


--SEKLINDE PERIYODIK KAYIT KOLONLARIMIZI EKLEYEBILIRIZ.
--KOLONLAR EKLENDIKTEN SONRA ILGILI TABLO ASAGIDAKI SEKILDE TEMPORAL TABLE HALINE GETIRILEBILIR.

ALTER TABLE DERSKAYITLARI
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DERSKAYITLARILOG))




