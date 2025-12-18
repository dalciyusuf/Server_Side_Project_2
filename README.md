# 📍 Real-Time Coordinate Tracker & Shape Drawer

Bu proje; web tabanlı bir arayüz üzerinden gerçek zamanlı koordinat toplama, dinamik geometrik şekil oluşturma ve bu verilerin kalıcı bir 
veritabanında saklanması amacıyla geliştirilmiştir.

---

### 🌟 Öne Çıkan Özellikler

* **Gerçek Zamanlı Takip:** HTML5 Canvas üzerinde anlık X ve Y koordinat takibi.
* **Etkileşimli Çizim:** Tıklanan her noktanın veritabanına kaydedilmesi ve noktaların otomatik birleştirilerek şekil oluşturulması.
* **Veri Sürekliliği (Persistence):** Sayfa yenilense dahi geçmiş koordinatların veritabanından çekilerek şeklin yeniden çizilmesi.
* **Hassas İşaretleme:** "Crosshair" (artı imleç) ve takip dairesi ile piksel hassasiyetinde veri girişi.

### 🛠️ Kullanılan Teknolojiler

Proje, modern frontend teknikleri ile klasik backend yapılarını bir araya getirir:

| Katman | Teknoloji | Kullanım Amacı |
| --- | --- | --- |
| **Backend** | Classic ASP (VBScript) | Sunucu mantığı ve DB iletişimi. |
| **Frontend** | HTML5 Canvas & JS | Yüksek performanslı grafik ve çizim. |
| **Veritabanı** | Microsoft Access (MDB) | İlişkisel veri saklama. |
| **İletişim** | AJAX (Asenkron) | Sayfa yenilenmeden veri aktarımı. |

---

### 🚀 Çalışma Mantığı

1. **İstemci Tarafı:** Kullanıcı Canvas üzerinde hareket ederken JS ile koordinatlar yakalanır.
2. **Veri Transferi:** Tıklama anında koordinat verisi `XMLHttpRequest` (AJAX) ile sunucuya gönderilir.
3. **Sunucu İşleme:** Classic ASP, gelen veriyi alarak MDB veritabanına kalıcı olarak kaydeder.
4. **Görselleştirme:** Kayıtlı tüm noktalar asenkron olarak geri çağrılır ve Canvas üzerinde birleştirilerek kapalı/açık poligonlar oluşturulur.

---

### ⚙️ Kurulum

1. Projeyi IIS (Internet Information Services) yüklü bir Windows sunucusuna yerleştirin.
2. `database/` klasöründeki `.mdb` dosyasının yazma izinlerinin (IUSER) verildiğinden emin olun.
3. Tarayıcı üzerinden uygulamayı çalıştırın; veritabanı bağlantısı otomatik olarak kurulacaktır.

---
