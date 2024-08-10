# BASİT BİR HESAP MAKİNESİ
# Toplama işlemini gerçekleştiren fonksiyon
def topla(x, y):
    return x + y


# Çıkarma işlemini gerçekleştiren fonksiyon
def cikar(x, y):
    return x - y


# Çarpma işlemini gerçekleştiren fonksiyon
def carp(x, y):
    return x * y


# Bölme işlemini gerçekleştiren fonksiyon
# Eğer y sıfırsa, hata mesajı döndürür; aksi halde bölme işlemi yapılır
def bol(x, y):
    if y == 0:
        return "HATA:Sıfıra bölme yapılamaz!"
    else:
        return x / y


# Sonsuz döngü ile kullanıcının çeşitli işlemleri yapabilmesi için menü sürekli olarak gösterilir
while True:
    # Menü ekranı
    print("""
    *****  HESAP  MAKİNESİ  *****
    *                           *  
    *    1- TOPLAMA İŞLEMİ      *
    *    2- ÇIKARMA İŞLEMİ      *  
    *    3- ÇARPMA İŞLEMİ       *
    *    4- BÖLME İŞLEMİ        *
    *                           *
    ******  İŞLEM  MENÜSÜ  ******
    """)
    # Kullanıcıdan işlem seçimini alır
    sec = input("İşlem Seçiniz:")
    # Geçerli işlem seçeneği kontrol edilir
    if sec in ["1", "2", "3", "4"]:
        try:
            # Kullanıcıdan iki sayı alır ve float türüne dönüştürür
            sayi1 = float(input("İlk Sayıyı Giriniz: "))
            sayi2 = float(input("İkinci Sayıyı Giriniz: "))
        except ValueError:
            # Eğer kullanıcı geçersiz bir değer girerse (örn. metin), hata mesajı verir
            print("Lütfen sadece sayı giriniz!")
            # Kullanıcıyı menüye döndürmek için ENTER tuşuna basması için bekler
            input("Menüye dönmek için ENTER...")
            # Döngünün başına döner
            continue

    # Seçilen işleme göre hesaplama yapar ve sonucu ekrana yazdırır
    if sec == "1":
        print(sayi1, "+", sayi2, "=", topla(sayi1, sayi2))
    elif sec == "2":
        print(sayi1, "-", sayi2, "=", cikar(sayi1, sayi2))
    elif sec == "3":
        print(sayi1, "*", sayi2, "=", carp(sayi1, sayi2))
    elif sec == "4":
        print(sayi1, "/", sayi2, "=", bol(sayi1, sayi2))
    else:
        # Geçersiz bir işlem seçimi yapılırsa hata mesajı verir
        print("Geçersiz işlem!")
    # Menüye dönmek için ENTER tuşuna basılması gerektiğini belirtir
    input("Menüye dönmek için ENTER...")
