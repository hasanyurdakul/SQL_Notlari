--T-SQL Instead Of Triggerlar


--SU ANA KADAR INSERT, UPDATE VE DELETE ISLEMLERI YAPILIRKEN, YANINDA SU SU ISLEMLERI YAP MANTIGIYLA CALISTIK. 
--INSTEAD OF TRIGGERLAR ISE INSERT, UPDATE VE DELETE ISLEMLERI YERINE SU SU ISLEMLERI YAP MANTIGIYLA CALISIR. YANI YAPILAN ISLEMIN YERINE YAPTIRMAK ISTEDIGIMIZ YERLERDE KULLANIRIZ.


--PROTOTIP

--CREATE TRIGGER [TRIGGER_ADI]
--ON [ISLEM_YAPILACAK_TABLO_ADI]
--INSTEAD OF DELETE/UPDATE/INSERT
--AS
--KODLAR



--ORNEK
--PERSONELLER TABLOSUNDA UPDATE GERCEKLESTIGI ANDA YAPILACAK GUNCELLEME YERINE BIR LOG TABLOSUNA ''ADI ... OLAN PERSONEL ... YENI ADIYLA DEGISTIRILEREK ... KULLANICISI TARAFINDAN ... TARIHINDE GUNCELLENMEK ISTENDI.'' DIYE YAZDIRACAK BIR TRIGGER YAZINIZ.

CREATE TABLE PERSONELLOG
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	RAPOR NVARCHAR(MAX)
)
CREATE TRIGGER tg_PERSONELLOGER
ON Personeller
INSTEAD OF UPDATE
AS
DECLARE @ESKIAD NVARCHAR(MAX), @ESKISOYAD NVARCHAR(MAX)
SELECT @ESKIAD=Adi, @ESKISOYAD=SoyAdi FROM DELETED
DECLARE @YENIAD NVARCHAR(MAX), @YENISOYAD NVARCHAR(MAX)
SELECT @YENIAD=Adi, @YENISOYAD=SoyAdi FROM INSERTED

INSERT PERSONELLOG VALUES ('ADI ' + @ESKIAD + ' ' + @ESKISOYAD + ' OLAN PERSONEL, ' + @YENIAD + ' ' + @YENISOYAD + ' YENI ADI ILE DEGISTIRILEREK ' + SUSER_SNAME() + ' KULLANICISI TARAFINDAN ' + CAST(GETDATE() AS NVARCHAR(MAX)) + ' TARIHINDE GUNCELLENMEK ISTENDI.')

UPDATE Personeller SET Adi = 'HASAN' WHERE PersonelID = 1



--ORNEK
--PERSONELLER TABLOSUNDA ADI ''ANDREW'' OLAN KAYDIN SILINMESINI ENGELLEYEN ANCAK DIGERLERININ SILINMESINE IZIN VEREN BIR TRIGGER YAZALIM.
CREATE TRIGGER DELETE_DENIED
ON Personeller	
INSTEAD OF DELETE 
AS
DECLARE @AD NVARCHAR(MAX)
SELECT @AD=Adi FROM DELETED
IF @AD = 'ANDREW'
	BEGIN
		PRINT 'BU KAYIT SILINEMEZ'
		ROLLBACK --YAPILAN TUM ISLEMI GERI ALIR. TRANSACTION KONUSUNDA DETAYLI ANLATILACAK!!
	END
