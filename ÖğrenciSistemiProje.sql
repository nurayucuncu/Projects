-- ��renci tablosunu olu�turur
create table ogrenci (
    OgrAd� VARCHAR(50) NOT NULL,
    OgrSoyad� VARCHAR(50) NOT NULL,
	OgrYas� INT,
	Cinsiyet VARCHAR(5), 
	OgrNo INT PRIMARY KEY,
    BolumID INT,
	FOREIGN KEY (BolumID) REFERENCES Bolum(BolumID)
);

-- Ders tablosunu olu�turur
create table Ders (
    DersKodu INT PRIMARY KEY,
    DersAd� VARCHAR(100) NOT NULL,
	DersSay�s� INT
);

-- B�l�m tablosunu olu�turur
CREATE TABLE Bolum (
    BolumID INT PRIMARY KEY,
    BolumAd� VARCHAR(100) NOT NULL
);

-- Notlar tablosunu olu�turur
create table Notlar (
    OgrNo INT,
    DersKodu INT,
    VizeNotu TINYINT,
    FinalNotu TINYINT,
	Ortalamas� AS ((VizeNotu+FinalNotu)/2),
    PRIMARY KEY (OgrNo, DersKodu),
    FOREIGN KEY (OgrNo) REFERENCES ogrenci(OgrNo),
    FOREIGN KEY (DersKodu) REFERENCES Ders(DersKodu)
);

-- ��retim �yeleri tablosunu olu�turur
CREATE TABLE OgretimUyeleri (
    OgretimUyesiID INT IDENTITY(1,1) PRIMARY KEY,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Unvan VARCHAR(50)
);

-- Ders programlar� tablosunu olu�turur
CREATE TABLE DersProgramlari (
    ProgramID INT IDENTITY PRIMARY KEY,
    DersKodu INT,
    OgretimUyesiID INT,
    Gun VARCHAR(10),
    Saat VARCHAR(10),
    FOREIGN KEY (DersKodu) REFERENCES Ders(DersKodu),
    FOREIGN KEY (OgretimUyesiID) REFERENCES OgretimUyeleri(OgretimUyesiID)
);


-- ��renci verilerini ekler
INSERT INTO ogrenci (OgrNo, OgrAd�, OgrSoyad�, OgrYas�, Cinsiyet, BolumID)
VALUES
(201, 'Zeynep', 'Yurt', 20, 'Kad�n', 2),
(202, 'Mehmet', '�zkan', 23, 'Erkek', 3),
(203, 'Elif', 'Demir', 22, 'Kad�n', 1),
(204, 'Ege', '�elik', 21, 'Erkek', 2),
(205, 'Aylin', 'Kara', 24, 'Kad�n', 3),
(206, 'Can', 'Y�lmaz', 22, 'Erkek', 1);

-- Ders verilerini ekler
INSERT INTO Ders (DersKodu, DersAd�, DersSay�s�)
VALUES
(101, 'Kimya I',4),
(102, '�statistik',3),
(103, 'Yapay Zeka',5),
(104, 'Veritaban� Y�netim Sistemleri',4),
(105, 'Makine ��renmesi',3),
(106, 'A� Temelleri',3),
(107, '��letim Sistemleri',4);

-- B�l�m verilerini ekler
INSERT INTO Bolum (BolumID, BolumAd�)
VALUES
(1, 'Bilgisayar M�hendisli�i'),
(2, 'Elektrik Elektronik M�hendisli�i'),
(3, 'Fizik'),
(4, 'Matematik');

-- Ders verilerini ekler
INSERT INTO Notlar (OgrNo, DersKodu, VizeNotu, FinalNotu)
VALUES
(202, 104, 75, 85),
(204, 102, 65, 70),
(206, 103, 90, 92),
(203, 101, 55, 78),
(205, 105, 80, 85),
(201, 107, 88, 91);

-- ��retim �yelerinin verilerini ekler
INSERT INTO OgretimUyeleri (Ad, Soyad, Unvan)
VALUES
('Ahmet', 'Kara', 'Matematik Hocas�'),
('Ay�e', 'Y�lmaz', 'Fizik Hocas�'),
('Ali', 'Kaya', 'Programlama Hocas�');

-- ��renci numaras� 201 olan ��rencinin notlar�n� siler
-- ��renci numaras� 206 olan ��rencinin Yapay Zeka dersini siler
DELETE FROM Notlar WHERE OgrNo = 201;
DELETE FROM Notlar WHERE OgrNo = 206 AND DersKodu = 103;

-- Ders ad� '��letim Sistemleri' olan dersi 'Lineer Cebir' olarak g�nceller
-- B�l�m ad� 'Elektrik Elektronik M�hendisli�i' olan b�l�m� 'Yaz�l�m M�hendisli�i' olarak g�nceller
-- 'Kimya I' dersinin ders say�s�n� bir azalt�r
UPDATE Ders SET DersAd� = 'Lineer Cebir' WHERE DersKodu = 107;
UPDATE Bolum SET BolumAd� = 'Yaz�l�m M�hendisli�i' WHERE BolumID  = 2;
UPDATE Ders SET DersSay�s�=DersSay�s�-1 WHERE DersKodu=101;

-- Yeni bir ders ekler
INSERT INTO Ders (DersKodu, DersAd�,DersSay�s�) VALUES (108, 'Kimya II',4);

-- Sorgular
-- Ders kodu 1 ile 7 aras�nda olan dersleri se�er
-- Notlar� vize notuna g�re artan s�rada listeler
-- Notlar� final notuna g�re azalan s�rada listeler
SELECT * FROM Ders WHERE DersKodu BETWEEN 1 AND 7;
SELECT * FROM Notlar ORDER BY VizeNotu ASC;
SELECT * FROM Notlar ORDER BY FinalNotu DESC;

-- Belirli b�l�mlere ait ��rencileri listeler
SELECT * FROM ogrenci 
JOIN Bolum ON Bolum.BolumID = ogrenci.BolumID
WHERE Bolum.BolumAd� IN ('Bilgisayar M�hendisli�i', 'Matematik');

--Her dersin ka� ��rencisi oldu�unu hesaplar
SELECT Ders.DersAd�, COUNT(Notlar.OgrNo) AS OgrenciSay�s�
FROM Ders
LEFT JOIN Notlar ON Ders.DersKodu = Notlar.DersKodu
GROUP BY Ders.DersAd�;

-- Derslerin toplam say�s�n� hesaplar
SELECT COUNT(*) AS ToplamDersSay�s� FROM Ders;

-- T�m ��renci,ders, not,b�l�m,��retim �yeleri ve ders program� verilerini listeler
SELECT * FROM ogrenci;
SELECT * FROM Ders;
SELECT * FROM Notlar;
SELECT * FROM Bolum;
SELECT * FROM OgretimUyeleri;
SELECT * FROM DersProgramlari;
