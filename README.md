# Basit Bir Hesap Makinesi Oluşturma Projesi
## Proje Açıklaması
Bu Python programı, temel dört matematiksel işlemi gerçekleştiren basit bir hesap makinesi işlevi görür. Program kullanıcıya sürekli olarak işlem seçme ve iki sayı ile işlem yapma fırsatı sunar. Kullanıcının geçersiz girişler yapmasını önlemek için hata kontrolü yapılır.
## Kurulum
• Python'ın resmi web sitesine gidin.<br/>
• En son sürümü indirin. Windows için genellikle .exe uzantılı bir dosya olacaktır.<br/>
• Projeyi bilgisayarınıza kurmak ve çalıştırmak için bir de python derleyicisi(örn. PyCharm) indirilmelidir.<br/>
• Derleyiciye giriş yapılıp new project kısmından bir python projesi oluşturulmalıdır.<br/>
• Oluşturulan projeye sağ tık yapılarak da açılabilecek olan bir python file oluşturup programınızı bu dosya içinde çalıştırabilirsiniz.

## Ana Program Akışı
• Program sonsuz bir döngü içinde çalışır ve kullanıcıya dört işlemli bir menü sunar.<br/>
• Kullanıcı menüden bir işlem seçer. Seçim geçerli ise, kullanıcıdan iki sayı girmesi istenir.<br/>
• Kullanıcıdan alınan sayılar float türüne dönüştürülür. Eğer kullanıcı geçersiz bir değer girerse (örn. metin), hata mesajı gösterilir ve kullanıcı menüye döndürülür.<br/>
• Seçilen işleme göre uygun fonksiyon çağrılır ve sonuç ekrana yazdırılır.<br/>
• Geçersiz bir işlem seçilirse, hata mesajı gösterilir ve kullanıcı menüye döndürülür.<br/>
## Kullanım Talimatları
### Programın Kullanımı:<br/>
• Çalıştırdıktan sonra, ekranda bir menü göreceksiniz.<br/>
• Menüdeki işlemlerden birini seçmek için 1, 2, 3 veya 4 tuşlarına basın.<br/>
• İlgili işlemi seçtikten sonra, iki sayı girin.<br/>
• Sonuç ekranda gösterilecektir.<br/>
• Menüyü görüntülemek için ENTER tuşuna basın.<br/>
### Hata Yönetimi:<br/>
• Eğer geçersiz bir sayı girerseniz (örneğin metin), "Lütfen sadece sayı giriniz!",geçersiz bir işlem seçimi yaparsanız, "Geçersiz işlem!" hatası gösterilir ve menüye döndürülür.<br/>
• Bölme işlemi sırasında sıfıra bölme girişiminde bulunursanız, "HATA sıfıra bölme yapılamaz!" mesajı gösterilir<br/>
