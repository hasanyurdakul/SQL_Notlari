﻿--SQL Server 2016 Dynamic Data Masking - Alter İle Maskelenmiş Kolon Ekleme


USE Northwind

CREATE TABLE OGRENCILER
(
	OGRENCIID INT PRIMARY KEY IDENTITY,
	ADI NVARCHAR(10) MASKED WITH (FUNCTION = 'DEFAULT()') NULL,
	SOYADI NVARCHAR(10) MASKED WITH (FUNCTION = 'DEFAULT()') NULL,
	MEMLEKETI NVARCHAR(10) MASKED WITH (FUNCTION = 'DEFAULT()') NULL,
	TCNO INT MASKED WITH (FUNCTION = 'DEFAULT()') NULL,
	SUBE NVARCHAR(1) MASKED WITH (FUNCTION = 'DEFAULT()') NULL,
	EMAIL NVARCHAR(MAX) MASKED WITH (FUNCTION = 'EMAIL()') NULL,
	HAKKINDA NVARCHAR(MAX) MASKED WITH (FUNCTION = 'PARTIAL(3, "H", 2)') NULL,
	DOGUMTARIHI DATETIME MASKED WITH (FUNCTION = 'DEFAULT()') NULL
)

--ALTER ILE MASKELENMIS KOLONU EKLEME

ALTER TABLE OGRENCILER 
ADD EKKOLON NVARCHAR(MAX) MASKED WITH (FUNCTION = 'PARTIAL(3,"XXXXX",0)')

EXECUTE AS USER = 'YETKILIUSER'
SELECT * FROM OGRENCILER
REVERT