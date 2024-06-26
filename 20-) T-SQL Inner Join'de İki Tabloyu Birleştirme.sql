﻿USE Northwind

--INNER JOIN 
--GENEL MANTIK 
--SELECT * FROM TABLO1 INNER JOIN TABLO2 ON TABLO1.ILISKILIKOLON=TABLO2.ILISKILIKOLON
SELECT * FROM Personeller INNER JOIN Satislar ON Personeller.PersonelID=Satislar.PersonelID

--TABLOLARA ALIAS ATANABILIR
--SELECT * FROM TABLO1 T1 INNER JOIN TABLO2 T2 ON T1.ILISKILIKOLON=T2.ILISKILIKOLON
--HANGI PERSONELIN HANGI SATISI YAPTIGINI GOSTEREN SORGU
SELECT * FROM Personeller P INNER JOIN Satislar S ON P.PersonelID=S.PersonelID

--HANGI URUNUN HANGI KATEGORIDE BULUNMAKTA OLDUGUNU GOSTEREN SORGU
SELECT * FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID
SELECT UrunAdi,U.KategoriID,KategoriAdi,Tanimi, BirimFiyati FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID

--SORGUDA WHERE KOMUTUNUN KULLANIMI
SELECT UrunAdi,U.KategoriID,KategoriAdi,Tanimi, BirimFiyati FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID WHERE U.KategoriID=1 --BEVERAGES KATEGORİSİ
SELECT UrunAdi,U.KategoriID,KategoriAdi,Tanimi, BirimFiyati FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID WHERE K.KategoriAdi='SEAFOOD'

--BEVERAGES KATEGORISINDEKI URUNLERIN SAYISINI GOSTEREN SORGU
SELECT COUNT(K.KategoriAdi) FROM Urunler U INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID WHERE K.KategoriAdi='BEVERAGES' GROUP BY K.KategoriAdi

--HANGI SATISI HANGI PERSONELIN YAPTIGINI GOSTEREN SORGU
SELECT * FROM Satislar,Personeller
SELECT	S.SatisID,P.Adi+' '+P.SoyAdi [Personel İsmi] FROM Satislar S INNER JOIN Personeller P ON S.PersonelID=P.PersonelID ORDER BY SatisID

--FAKS NUMARASI NULL OLMAYAN TEDARIKCILERDEN ALINMIS URUNLERI GOSTEREN SORGU(URUNLER,TEDARIKCILER)
SELECT * FROM Urunler,Tedarikciler
SELECT UrunID,UrunAdi,U.TedarikciID,SirketAdi,Faks FROM Urunler U INNER JOIN Tedarikciler T ON U.TedarikciID=T.TedarikciID WHERE T.Faks IS NOT NULL ORDER BY UrunID
SELECT UrunID,UrunAdi,U.TedarikciID,SirketAdi,Faks FROM Urunler U INNER JOIN Tedarikciler T ON U.TedarikciID=T.TedarikciID WHERE T.Faks <> 'NULL' ORDER BY UrunID
SELECT UrunID,UrunAdi,U.TedarikciID,SirketAdi,Faks FROM Urunler U INNER JOIN Tedarikciler T ON U.TedarikciID=T.TedarikciID WHERE T.Faks != 'NULL' ORDER BY UrunID

