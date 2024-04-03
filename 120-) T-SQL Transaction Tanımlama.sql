﻿--T-SQL Transaction Tanımlama

--PROTOTIP

--BEGIN TRAN [TRANSACTION ADI ?OPTIONAL]
--ISLEMLER


--VARSAYILAN OLARAK TRANSACTION KONTROLUNDE BIR ISLEMDIR. YINE VARSAYILAN OLARAK COMMIT TRAN ILE BITMEKTEDIR.
INSERT Bolge VALUES(5,'CORUM') 



--ISIM VERILMIS BIR TRANSACTION YAZALIM.
BEGIN TRAN KONTROL
INSERT Bolge VALUES(5,'CORUM') 
COMMIT TRAN


--TRANSACTIONLARA ISIM VERMEK ZORUNDA DEGILIZ.
BEGIN TRAN 
INSERT Bolge VALUES(5,'CORUM') 
COMMIT TRAN


--ASAGIDAKI ORNEGI INCELEYELIM.
BEGIN TRAN KONTROL
DECLARE @I INT 
DELETE FROM Personeller WHERE PersonelID > 20
SET @I=@@ROWCOUNT
IF @I = 1
	BEGIN
		PRINT 'KAYIT SILINDI'
		COMMIT --YA DA COMMIT TRANSACTION YA DA COMMIT TRAN
	END
ELSE
	BEGIN
		PRINT 'ISLEMLER GERI ALINDI'
		ROLLBACK --YA DA ROLLBACK TRANSACTION YA DA ROLLBACK TRAN
	END