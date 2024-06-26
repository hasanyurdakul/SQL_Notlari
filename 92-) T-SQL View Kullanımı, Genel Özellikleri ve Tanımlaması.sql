﻿--T-SQL View Kullanımı, Genel Özellikleri ve Tanımlaması

--VIEW YAPISI
--#####################
--KULLANIM AMACI
--GENELLIKLE KARMASIK SORGULARIN TEK BIR SORGU UZERINDEN CALISTIRMAK ICIN KULLANILIR.
--BU AMACLA RAPORLAMA ISLEMLERINDE KULLANILIRLAR.
--AYNI ZAMANDA GUVENLIK IHTIYACI OLDUGU DURUMLARDA, HERHANGI BIR SORGUNUN 2. VEYA 3. SAHISLARDAN GIZLENMESI ICIN KULLANILIR.
--#####################

--#####################
--GENEL OZELLIKLERI
--HERHANGI BIR SORGUNUN SONUCUNU TABLO OLARAK ELE ALIR, ORDAN SORGU CEKILEBILMESINI SAGLAR.
--INSERT, UPDATE, DELETE ISLEMLERINI YAPABILIRLER. 
--!! BU ISLEMLERI FIZIKSEL TABLOLARA YANSITIRLAR.
--VIEW YAPILARI FIZIKSEL OLARAK OLUSTURULAN YAPILARDIR.
--VIEW YAPILARI NORMAL SORGULARDAN DAHA YAVAS CALISIRLAR.
--#####################

--!!DIKKAT!!
--DATABASE ELEMANLARINI ''CREATE'' KOMUTU ILE OLUSTURUYORDUK. VIEW YAPISI DA BIR DATABASE ELEMANI OLDUGU ICIN YINE ''CREATE'' KOMUTUNU KULLANARAK OLUSTURACAGIZ.

CREATE VIEW VW_GOTUR
AS
SELECT P.Adi+' '+P.SoyAdi [ADI SOYADI],K.KategoriAdi [KATEGORI ADI], COUNT(S.SatisID) [TOPLAM SATIS] FROM Personeller P 
INNER JOIN Satislar S ON P.PersonelID=S.PersonelID 
INNER JOIN [Satis Detaylari] SD ON S.SatisID=SD.SatisID 
INNER JOIN Urunler U ON SD.UrunID=U.UrunID
INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID
GROUP BY P.Adi+' '+P.SoyAdi, K.KategoriAdi

SELECT * FROM VW_GOTUR
SELECT * FROM VW_GOTUR WHERE [ADI SOYADI] LIKE '%ROBERT%'

--VIEW OLUSTURULURKEN KOLONLARA VERILEN ALIASLAR, VIEW'DAN SORGU CEKILIRKEN KULLANILIR.
--BIR YANDAN DA VIEW'IN KULLANDIGI GERCEK TABLOLARIN KOLON ISIMLERI, VIEW ICINDEKI ALIAS'LARIN ICINE GIZLENMIS OLUR.
--VIEW ICERISINDE ''ORDER BY'' KULLANILMAZ.
--''ORDER BY'' VIEW ICERISINDE DEGIL, VIEW'DAN SORGU YAPILIRKEN KULLANILIR.

SELECT * FROM VW_GOTUR ORDER BY [TOPLAM SATIS]


--ANCAK	ZORLAYARAK DA OLSA ''ORDER BY'' VIEW ICINDE KULLANILABILIR.
--BUNU ''TOP'' KOMUTUYLA SAGLARIZ.
--BU DURUM HEM PERFORMANS, HEM DE KULLANIM ESNEKLIGI ACISINDAN COK DA TAVSIYE EDILEN BIR DURUM DEGILDIR.
CREATE VIEW VW_GOTUR
AS
SELECT TOP 100 P.Adi+' '+P.SoyAdi [ADI SOYADI],K.KategoriAdi [KATEGORI ADI], COUNT(S.SatisID) [TOPLAM SATIS] FROM Personeller P 
INNER JOIN Satislar S ON P.PersonelID=S.PersonelID 
INNER JOIN [Satis Detaylari] SD ON S.SatisID=SD.SatisID 
INNER JOIN Urunler U ON SD.UrunID=U.UrunID
INNER JOIN Kategoriler K ON U.KategoriID=K.KategoriID
GROUP BY P.Adi+' '+P.SoyAdi, K.KategoriAdi
ORDER BY [TOPLAM SATIS]

--VIEW UZERINDE INSERT, DELETE VE UPDATE YAPILABILIR. 
--BU ISLEMLER FIZIKSEL TABLOLARA DA YANSIMAKTADIR.
CREATE VIEW ORNEKPERSONELVIEW
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

INSERT ORNEKPERSONELVIEW VALUES ('HASAN','YURDAKUL','MUHENDIS')
UPDATE ORNEKPERSONELVIEW SET Adi = 'TAHA', Unvan = 'AVUKAT' WHERE Adi = 'HASAN'
DELETE FROM ORNEKPERSONELVIEW WHERE Adi = 'TAHA'

