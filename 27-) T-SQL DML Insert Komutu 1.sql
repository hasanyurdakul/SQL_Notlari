﻿USE Northwind
--DML (DATA MANIPULATION LANGUAGE)

--SELECT, INSERT, UPDATE, DELETE
--INSERT [TABLOADI](KOLONLAR) VALUES(DEĞERLER)
SELECT * FROM Personeller
INSERT Personeller(Adi,SoyAdi) Values('Hasan','Yurdakul')
INSERT Personeller VALUES('Yurdakul','Hasan','Software Developer','Mr.','1998.08.15',GETDATE(),'Beşiktaş','İstanbul','Marmara','34000','Türkiye','(212) 555-2211','3245',null,null,null,null)

--INSERT INTO OLARAK DA KULLANILABILIR
INSERT Personeller(Adi,SoyAdi) Values('Hasan','Yurdakul')
--KOLONUN KABUL ETTIGI VERI TIPI VE KARAKTER UZUNLUGUNDA KAYIT YAPILMALIDIR.
--NOT NULL OLAN KOLONLARA, BOŞ BIRAKILAMAYACAKLARI ICIN MUTLAKA DEGER GONDERILMELIDIR.
--OTOMATIK ARTAN (IDENTITY) KOLONLARA DEGER GONDERILEMEZ.
--TABLODAKI SECILEN KOLONLARA VEYA TUM KOLONLARA VERI GIRILECEGI BELIRTILIP VERI GIRISI YAPILMAZSA HATA VERİR.
INSERT Personeller(Adi,SoyAdi) Values('Hasan')


--PRATIK KULLANIM
INSERT Musteriler(MusteriAdi,Adres) VALUES('HASAN','YURDAKUL')
INSERT Musteriler(MusteriAdi,Adres) VALUES('JOHN','DOE')
INSERT Musteriler(MusteriAdi,Adres) VALUES('JANE','DOE')
--AŞAĞIDAKİ SATIR YUKARIDAKI UC SATIRLA AYNI ISI YAPAR.
INSERT Musteriler(MusteriAdi,Adres) VALUES ('HASAN','YURDAKUL'),('JOHN','DOE'),('JANE','DOE')


