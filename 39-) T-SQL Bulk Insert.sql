USE Northwind
GO

--T-SQL Bulk Insert

BULK INSERT KISILER
FROM 'D:\KISILER.TXT'
WITH
(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n'
)	