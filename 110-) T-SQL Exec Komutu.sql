--T-SQL Exec Komutu
USE Northwind
SELECT * FROM Personeller
EXEC(' SELECT * FROM Personeller ')


--YANLIS KULLANIM
EXEC('DECLARE @SAYAC INT = 0')
EXEC('PRINT @SAYAC')

--DOGRU KULLANIM
EXEC('DECLARE @SAYAC INT = 0  PRINT @SAYAC')