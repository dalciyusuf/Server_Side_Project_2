# 📍 Real-Time Coordinate Tracker & Shape Drawer

Bu proje; web tabanlı bir arayüz üzerinden gerçek zamanlı koordinat toplama, dinamik geometrik şekil oluşturma ve bu verilerin kalıcı bir veritabanında saklanması amacıyla geliştirilmiştir.

---

### 🌟 Öne Çıkan Özellikler

**Gerçek Zamanlı Takip**
HTML5 Canvas üzerinde anlık X ve Y koordinat takibi sağlanır.

**Etkileşimli Çizim**
Tıklanan her nokta veritabanına kaydedilir ve noktalar otomatik birleştirilir.

**Veri Sürekliliği**
Sayfa yenilense dahi geçmiş veriler veritabanından çekilerek şekil yeniden çizilir.

**Hassas İşaretleme**
"Crosshair" ve takip dairesi ile piksel hassasiyetinde veri girişi sunulur.

---

### 🛠️ Kullanılan Teknolojiler

| Katman | Teknoloji | Kullanım Amacı |
| --- | --- | --- |
| **Backend** | Classic ASP | Sunucu mantığı ve DB iletişimi |
| **Frontend** | HTML5 Canvas | Yüksek performanslı grafik çizimi |
| **Veritabanı** | MS Access (MDB) | İlişkisel veri saklama |
| **İletişim** | AJAX | Sayfa yenilenmeden veri aktarımı |

---

### 🚀 Çalışma Mantığı

1. **İstemci:** JS ile Canvas üzerindeki hareketler yakalanır.
2. **Transfer:** Tıklama anında veriler AJAX ile sunucuya iletilir.
3. **İşleme:** Classic ASP veriyi MDB veritabanına kalıcı olarak yazar.
4. **Görsel:** Kayıtlı noktalar asenkron çağrılarak poligon oluşturulur.

---

### ⚙️ Kurulum

* Projeyi **IIS** yüklü bir Windows sunucusuna yerleştirin.
* `database/` klasöründeki `.mdb` dosyasına **yazma izinlerini** (IUSER) tanımlayın.

---
