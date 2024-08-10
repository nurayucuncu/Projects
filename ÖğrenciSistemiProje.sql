-- Öðrenci tablosunu oluþturur
create table ogrenci (
    OgrAdý VARCHAR(50) NOT NULL,
    OgrSoyadý VARCHAR(50) NOT NULL,
	OgrYasý INT,
	Cinsiyet VARCHAR(5), 
	OgrNo INT PRIMARY KEY,
    BolumID INT,
	FOREIGN KEY (BolumID) REFERENCES Bolum(BolumID)
);

-- Ders tablosunu oluþturur
create table Ders (
    DersKodu INT PRIMARY KEY,
    DersAdý VARCHAR(100) NOT NULL,
	DersSayýsý INT
);

-- Bölüm tablosunu oluþturur
CREATE TABLE Bolum (
    BolumID INT PRIMARY KEY,
    BolumAdý VARCHAR(100) NOT NULL
);

-- Notlar tablosunu oluþturur
create table Notlar (
    OgrNo INT,
    DersKodu INT,
    VizeNotu TINYINT,
    FinalNotu TINYINT,
	Ortalamasý AS ((VizeNotu+FinalNotu)/2),
    PRIMARY KEY (OgrNo, DersKodu),
    FOREIGN KEY (OgrNo) REFERENCES ogrenci(OgrNo),
    FOREIGN KEY (DersKodu) REFERENCES Ders(DersKodu)
);

-- Öðretim Üyeleri tablosunu oluþturur
CREATE TABLE OgretimUyeleri (
    OgretimUyesiID INT IDENTITY(1,1) PRIMARY KEY,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Unvan VARCHAR(50)
);

-- Ders programlarý tablosunu oluþturur
CREATE TABLE DersProgramlari (
    ProgramID INT IDENTITY PRIMARY KEY,
    DersKodu INT,
    OgretimUyesiID INT,
    Gun VARCHAR(10),
    Saat VARCHAR(10),
    FOREIGN KEY (DersKodu) REFERENCES Ders(DersKodu),
    FOREIGN KEY (OgretimUyesiID) REFERENCES OgretimUyeleri(OgretimUyesiID)
);


-- Öðrenci verilerini ekler
INSERT INTO ogrenci (OgrNo, OgrAdý, OgrSoyadý, OgrYasý, Cinsiyet, BolumID)
VALUES
(201, 'Zeynep', 'Yurt', 20, 'Kadýn', 2),
(202, 'Mehmet', 'Özkan', 23, 'Erkek', 3),
(203, 'Elif', 'Demir', 22, 'Kadýn', 1),
(204, 'Ege', 'Çelik', 21, 'Erkek', 2),
(205, 'Aylin', 'Kara', 24, 'Kadýn', 3),
(206, 'Can', 'Yýlmaz', 22, 'Erkek', 1);

-- Ders verilerini ekler
INSERT INTO Ders (DersKodu, DersAdý, DersSayýsý)
VALUES
(101, 'Kimya I',4),
(102, 'Ýstatistik',3),
(103, 'Yapay Zeka',5),
(104, 'Veritabaný Yönetim Sistemleri',4),
(105, 'Makine Öðrenmesi',3),
(106, 'Að Temelleri',3),
(107, 'Ýþletim Sistemleri',4);

-- Bölüm verilerini ekler
INSERT INTO Bolum (BolumID, BolumAdý)
VALUES
(1, 'Bilgisayar Mühendisliði'),
(2, 'Elektrik Elektronik Mühendisliði'),
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

-- Öðretim Üyelerinin verilerini ekler
INSERT INTO OgretimUyeleri (Ad, Soyad, Unvan)
VALUES
('Ahmet', 'Kara', 'Matematik Hocasý'),
('Ayþe', 'Yýlmaz', 'Fizik Hocasý'),
('Ali', 'Kaya', 'Programlama Hocasý');

-- Öðrenci numarasý 201 olan öðrencinin notlarýný siler
-- Öðrenci numarasý 206 olan öðrencinin Yapay Zeka dersini siler
DELETE FROM Notlar WHERE OgrNo = 201;
DELETE FROM Notlar WHERE OgrNo = 206 AND DersKodu = 103;

-- Ders adý 'Ýþletim Sistemleri' olan dersi 'Lineer Cebir' olarak günceller
-- Bölüm adý 'Elektrik Elektronik Mühendisliði' olan bölümü 'Yazýlým Mühendisliði' olarak günceller
-- 'Kimya I' dersinin ders sayýsýný bir azaltýr
UPDATE Ders SET DersAdý = 'Lineer Cebir' WHERE DersKodu = 107;
UPDATE Bolum SET BolumAdý = 'Yazýlým Mühendisliði' WHERE BolumID  = 2;
UPDATE Ders SET DersSayýsý=DersSayýsý-1 WHERE DersKodu=101;

-- Yeni bir ders ekler
INSERT INTO Ders (DersKodu, DersAdý,DersSayýsý) VALUES (108, 'Kimya II',4);

-- Sorgular
-- Ders kodu 1 ile 7 arasýnda olan dersleri seçer
-- Notlarý vize notuna göre artan sýrada listeler
-- Notlarý final notuna göre azalan sýrada listeler
SELECT * FROM Ders WHERE DersKodu BETWEEN 1 AND 7;
SELECT * FROM Notlar ORDER BY VizeNotu ASC;
SELECT * FROM Notlar ORDER BY FinalNotu DESC;

-- Belirli bölümlere ait öðrencileri listeler
SELECT * FROM ogrenci 
JOIN Bolum ON Bolum.BolumID = ogrenci.BolumID
WHERE Bolum.BolumAdý IN ('Bilgisayar Mühendisliði', 'Matematik');

--Her dersin kaç öðrencisi olduðunu hesaplar
SELECT Ders.DersAdý, COUNT(Notlar.OgrNo) AS OgrenciSayýsý
FROM Ders
LEFT JOIN Notlar ON Ders.DersKodu = Notlar.DersKodu
GROUP BY Ders.DersAdý;

-- Derslerin toplam sayýsýný hesaplar
SELECT COUNT(*) AS ToplamDersSayýsý FROM Ders;

-- Tüm öðrenci,ders, not,bölüm,öðretim üyeleri ve ders programý verilerini listeler
SELECT * FROM ogrenci;
SELECT * FROM Ders;
SELECT * FROM Notlar;
SELECT * FROM Bolum;
SELECT * FROM OgretimUyeleri;
SELECT * FROM DersProgramlari;
