# Çevrimiçi Eğitim Platformu Veritabanı Tasarımı

Bu proje, SQL Server kullanılarak bir çevrimiçi eğitim platformu için veritabanı tasarımı içerir. Platform, üyelik, eğitim, sertifika ve blog gönderileri gibi işlevleri destekler.

## 📋 Proje Açıklaması

Bu proje, bir çevrimiçi eğitim platformu için veritabanı tasarlamayı amaçlar. Platformun desteklediği temel işlevler şunlardır:

- Kullanıcıların platforma kayıt olması ve profil yönetimi.
- Eğitimlerin oluşturulması, kategorilere ayrılması ve kullanıcıların bu eğitimlere katılması.
- Eğitim tamamlandığında sertifika verilmesi ve kullanıcı-sertifika ilişkilerinin yönetimi.
- Kullanıcıların blog gönderileri paylaşması.

## 📁 Dosyalar

- **OnlineEgitimPlatformu.sql**: SQL Server için veritabanı şemasını oluşturan SQL dosyası. Tüm tablolar, birincil anahtarlar, yabancı anahtarlar ve benzersiz kısıtlamaları içerir.
- **schema_diagram.png**: Tablolar ve aralarındaki ilişkileri gösteren veritabanı şema diyagramı (dbdiagram.io ile oluşturulmuştur).

### Şema Diyagramı

Aşağıda veritabanı şema diyagramını görebilirsiniz:

## 🚀 Kurulum ve Kullanım

### 1. SQL Server Kurulumu

- SQL Server Management Studio (SSMS) veya başka bir SQL Server istemcisini kullanın.

### 2. Veritabanını Oluşturma

- `OnlineEgitimPlatformu.sql` dosyasını SQL Server'da çalıştırın:

  ```sql
  sqlcmd -S <sunucu_adı> -i OnlineEgitimPlatformu.sql
  ```

  Alternatif olarak, SSMS'de dosyayı açıp **Execute** butonuna tıklayın.

### 3. Şema Diyagramını Görüntüleme

- Diyagramı görmek için `schema_diagram.png` dosyasını açın.
- Diyagramı yeniden oluşturmak için dbdiagram.io adresine gidin ve `OnlineEgitimPlatformu.sql` dosyasını DBML formatına çevirerek yükleyin.

## 🗄️ Veritabanı Şeması

Veritabanı aşağıdaki tablolardan oluşur:

- **Categories**: Eğitim kategorilerini saklar (örneğin, yapay zeka, blok zincir).
- **Members**: Kullanıcı bilgilerini saklar (kullanıcı adı, e-posta, şifre, vb.).
- **Courses**: Eğitim detaylarını saklar (başlık, açıklama, tarihler, eğitmen, kategori).
- **Enrollments**: Kullanıcıların eğitimlere katılımını takip eder.
- **Certificates**: Eğitim sertifikalarını saklar.
- **CertificateAssignments**: Kullanıcı-sertifika ilişkilerini yönetir.
- **BlogPosts**: Kullanıcıların blog gönderilerini saklar.

### İlişkiler

- `Courses` tablosu, `Categories` ile `category_id` üzerinden ilişkilidir.
- `Enrollments`, `Members` ve `Courses` arasında çok-çok ilişki kurar.
- `Certificates` tablosu, `Courses` ile ilişkilidir.
- `CertificateAssignments`, `Members` ve `Certificates` arasında ilişki kurar.
- `BlogPosts`, `Members` ile `author_id` üzerinden ilişkilidir.

## ✅ Değerlendirme Kriterleri

- Veritabanı tasarımı, tüm işlevselliği destekler ve tutarlıdır.
- Birincil anahtarlar (PK), yabancı anahtarlar (FK) ve benzersiz anahtarlar (UK) doğru tanımlanmıştır.
- Sütunlar için uygun veri tipleri seçilmiştir (`NVARCHAR`, `BIGINT`, `DATETIME2`, vb.).
- SQL dosyası hatasız çalışır.
- Şema diyagramı, tabloları ve ilişkileri açıkça gösterir.