﻿--SQL Server 2016 Dynamic Data Masking Özelliğini Kolondan Kaldırma

ALTER TABLE OGRENCILER
ALTER COLUMN EKKOLON DROP MASKED
 
EXECUTE AS USER = 'YETKILIUSER'
SELECT * FROM OGRENCILER
REVERT
