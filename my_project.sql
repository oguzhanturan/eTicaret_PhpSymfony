# Host: localhost  (Version 5.5.5-10.1.37-MariaDB)
# Date: 2019-01-23 20:01:52
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (4,'0','Cep Telefonu','Mobil Telefon,Android Telefonlar,Android Telefonlar','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(5,'4','Android Telefonlar','Mobil Telefon,Android Telefonlar,Android Telefonlar','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(6,'4','İos Telefonlar','Mobil Telefon,Android Telefonlar,Android Telefonlar','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(9,'0','Bilgisayar','Bilgisayar','Bilgisayar Malzemeleri','true'),(10,'9','Dizüstü Bilgisayarlar','Bilgisayar','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(11,'9','Masaüstü Bilgisayar','Masaüstü Bilgisayar','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(12,'0','Kulaklık ','Kulaklık ','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(13,'12','Telefon Kulaklıkları','Cep Telefonu Kulaklıkları','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(14,'12','Oyuncu Kulaklıkları','Oyuncu Kulaklıkları','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(15,'12','Kablosuz Kulaklıklar','Kablosuz Kulaklıklar','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(18,'0','Ses Sistemleri ','TV, Ses ve Görüntü Sistemleri ','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(19,'18','Walkman, MP3 Çalar','Walkman, MP3 Çalar, Ses Kayıt Cihazları (179)','Mobil Telefon,Android Telefonlar,Android Telefonlar','true'),(20,'18','Hoparlör & Ev Müzik Sistemi','Hoparlör','Mobil Telefon,Android Telefonlar,Android Telefonlar','true');

#
# Structure for table "comments"
#

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "comments"
#

INSERT INTO `comments` VALUES (1,1,'oguz',1,'1.Ürüne Yorum','true'),(2,2,'oguz',1,'1.Ürüne Yorum','true'),(3,2,'oguz',2,'2.ürüne yorum','false'),(4,2,'oguz',1,'son test','false'),(13,1,'oguz',1,'1.Ürüne Yorumasdasdasd','true'),(14,1,'oguz',1,'Test Yorumu budur','true'),(15,1,'oguz',1,'1.Ürüne Yorum','false'),(16,1,'oguz',1,'TURAN YORUMU','true'),(17,2,'deniz',2,'Huawei P9 Lite Kategori :Android Akıllı Telefon. Keywords Huawei P9 Lite.','false'),(18,27,'Oğuzhan TURAN',1,'Çok Güzel Telefonmuş SAğolun','true'),(19,27,'Oğuzhan TURAN',20,'dell çok iyi','true'),(20,1,'oguz',2,'hemen yorum yap','false');

#
# Structure for table "image"
#

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "image"
#

INSERT INTO `image` VALUES (1,1,'2eb523367ad422d1d647122feccd8ac5.png'),(2,2,'2eb523367ad422d1d647122feccd8ac5.png'),(3,3,'h4-slide4.png'),(4,1,'8a3e5a52797c8a7fb18d6b964bef29ae.png'),(5,1,'e8688345bf611806f50d4e9dd4cee36c.jpeg'),(6,1,'a70a70074d36578f96a31a1206e753e4.jpeg');

#
# Structure for table "messages"
#

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "messages"
#

INSERT INTO `messages` VALUES (1,'ahmet','çakar@gmail.com','çakar çakmaz çakan çakmak','false'),(2,'asd','asd@gmail.com','asdasd','true'),(3,'Oğuzhan Turan','deneme@mail.com',NULL,'true'),(4,'denememibu','oguzhanturan@yahoo.com',NULL,'true'),(5,'100. yıl mahallesi 1080. sokak no:3 d:5 Karabük me','asd@gmail.com',NULL,'true'),(6,'100. yıl mahallesi 1080. sokak no:3 d:5 Karabük me','oguzhanturan@yahoo.com',NULL,'new'),(7,'asda','asd@mail.com',NULL,'new'),(8,'123123','asd@gmail.com','12312312','new');

#
# Structure for table "migration_versions"
#

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "migration_versions"
#

INSERT INTO `migration_versions` VALUES ('20190116050246'),('20190116233350'),('20190116233628'),('20190117023433'),('20190117025222');

#
# Structure for table "order_details"
#

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "order_details"
#

INSERT INTO `order_details` VALUES (9,11,1,1,1900,1,500,'Xiaomi Mi A2 Lite 32 GB (İthal','Ordered'),(10,11,1,2,1900,1,500,'Samsung A7 Lite','Ordered'),(11,12,1,2,1900,1,500,'Samsung A7 Lite','Ordered'),(12,13,1,3,1900,1,500,'Honor 9','Ordered'),(13,13,1,3,1900,1,500,'Honor 9','Ordered'),(14,13,1,3,1900,1,500,'Honor 9','Ordered'),(15,14,1,3,1900,1,500,'Honor 9','Ordered'),(16,16,1,1,1900,1,500,'Xiaomi Mi A2 Lite 32 GB (İthal','Ordered'),(17,17,1,1,1900,1,500,'Xiaomi Mi A2 Lite 32 GB (İthal','Ordered'),(18,18,27,1,5999,1,500,'Apple iPhone XS Max 256 GB Uza','Ordered'),(19,19,28,2,1900,1,500,'Huawei P9 Lite','Ordered'),(20,19,28,15,15388,1,500,'MSI GS73 8RE-021XTR i7-8750 16','Ordered'),(21,19,28,17,2890,1,500,'DELL INS 3576-FHDB02F41C İ3-70','Ordered'),(22,19,28,22,2259,1,500,'Sony WH-1000XM2 Kablosuz Kulak','Ordered'),(23,19,28,30,412,1,500,'Sony NWZB183B.CEW MP3 Player S','Ordered'),(24,19,28,32,80,1,500,'FRISBY FS-P206BT Taşınabilir, ','Ordered'),(25,20,1,34,1369,1,500,'Samsung HW-N450 2.1 Ch Soundba','Ordered'),(26,20,1,2,1900,1,500,'Huawei P9 Lite','Ordered');

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipinfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (11,1,2540,'Oğuzhan Turan','Ertuğrulgazi Mh. Kıraç Sok. No 87','karabük','05549889427','Kargoya Verildi','Completed','Karabüke Güvencinle Gönderildi.'),(12,1,1270,'Oğuzhan Turan','Eskişehir Tepebaşı','karabük','05549889427','','Canceled',''),(13,2,3810,'03123333','Eskişehir Tepebaşı','Eskişehir',NULL,'asdasd','Accepted','asdasd'),(14,2,1270,'oguz','Eskişehir Tepebaşı','Eskişehir','03123333','123','Accepted','123'),(15,3,1270,'Ahmet Çoşkun','Eskişehir Tepebaşı','Eskişehir','05449838333','deneme kargocu','Completed','kargocuyu kapıda yakaladım cebine 50 lira sıkıştırıp hızlı gönderi olarak gönderdim.'),(16,3,1270,'Ahmet Çoşkun','Eskişehir Tepebaşı','Eskişehir','05449838333',NULL,'New',NULL),(17,4,1270,'Ayşe Hatun','Eskişehir Tepebaşı','Eskişehir','05449894283',NULL,'New',NULL),(18,27,5680,'Oğuzhan TURAN','100. yıl mahallesi 1080. sokak no:3 d:5 Karabük merkez','karabük','02223102587','kargoya verildi','Accepted','kargocu aldı gitti haberim yok'),(19,28,20727,'2301','100. yıl mahallesi 1080. sokak no:3 d:5 Karabük merkez','karabük','5443453452',NULL,'New',NULL),(20,1,2769,'oguz','Eskişehir Tepebaşı','İzmir','02223102587',NULL,'New',NULL);

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `years` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sprice` double DEFAULT NULL,
  `minamount` int(11) DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "product"
#

INSERT INTO `product` VALUES (1,'Apple iPhone XS Max 256 GB Uzay Grisi','Apple iPhone XS Max 256 GB Uzay Grisi','100TL ve üzeri alışverişlerde Papara Kart ile ödemelerde 10TL indirim!','Android Akıllı Telefon',NULL,'2018',500,5999,5680,1,'Bugüne kadarki en büyük iPhone ekranı dahil  iki farklı boyutta Super Retina. Daha da hızlı Face ID.  Bir akıllı telefondaki en akıllı ve en güçlü çip.  Ve Derinlik Denetimi özelliğine sahip, çığır açan  çift kamera sistemi. iPhone’da sevdiğiniz  her şey','a1fe50d42fd4767a25cc1dcb732abf8d.jpeg',NULL,4,'true'),(2,'Huawei P9 Lite','Huawei P9 Lite','100TL ve üzeri alışverişlerde Papara Kart ile ödemelerde 10TL indirim!','Android Akıllı Telefon',NULL,'2018',500,1900,1470,222,'5 MPDahili Hafıza32 GBRAM Kapasitesi3 GB RAMPil Gücü4000 mAhGaranti Tipiİthalatçı GarantiliEkran Boyutu5,84 inçKamera Çözünürlüğü12 MP + 5 MPÇift HatlıVar ( Tek İşlemcili )İşlemci Kapasitesi2,0 GHz Octa Core','90ebf0a0c7f770699455e9abcb7279c4.jpeg',NULL,5,'true'),(3,'Honor 9','Honor 9','100TL ve üzeri alışverişlerde Papara Kart ile ödemelerde 10TL indirim!','Android Akıllı Telefon',NULL,'2018',500,1900,1270,222,'5 MPDahili Hafıza32 GBRAM Kapasitesi3 GB RAMPil Gücü4000 mAhGaranti Tipiİthalatçı GarantiliEkran Boyutu5,84 inçKamera Çözünürlüğü12 MP + 5 MPÇift HatlıVar ( Tek İşlemcili )İşlemci Kapasitesi2,0 GHz Octa Core','4547ceb69adb876b1bd5bc14f5a7e79d.jpeg',NULL,5,'true'),(5,'En Yeni Model Cep Telefonlarında','En Uygun Fiyatlar','En Uygun Fiyatlar','En Yeni Model Cep Telefonların',NULL,'2018',3,1900,1100,NULL,'En Uygun Fiyatlar','f0b1b2a23e62ea4175e714d264fbf910.jpeg',NULL,4,'slider'),(6,'Dizüstü Bilgisayarlarda','En Kaliteli Markalar','En Kaliteli Markalar','Android Akıllı Telefon',NULL,'2018',3,1900,1100,NULL,'En Uygun Fiyatlar','840294c49d6a55d567d025b178fa4122.jpeg',NULL,10,'slider'),(7,'Müzik Çalarlarda ','Büyük Kampanyalar','Büyük Kampanyalar','Android Akıllı Telefon',NULL,'2018',3,1900,1100,NULL,' En Uygun Fiyatlar','58979fa515c4c91e858b85de15fb9fff.png',NULL,1,'slider'),(8,'Sennheiser Kulaklıklarda','İnanılmaz İndirim','İnanılmaz İndirim','Android Akıllı Telefon',NULL,'2018',3,1900,1100,NULL,' En Uygun Fiyatlars','75fb1b1e46a4f015ef7f6abb4f717e70.jpeg',NULL,1,'slider'),(9,'Xiaomi Mi 8 64 GB Pembe','Xiaomi Mi 8 64 GB Pembe','Xiaomi Mi 8 64 GB Pembe','Android Akıllı Telefon',NULL,'2018',500,4199,3399,1,'Mi 8 2018 Xiaomi Amiral Gemisi  Qualcomm® Snapdragon ™ 845 | Optik zoomlu AI çift kamera | Çift frekanslı GPS  IR yüz kilidini | 6.21 ”AMOLED Tam Ekran Görüntüsü','79a207797c214f347596960010305107.jpeg',NULL,4,'slider'),(10,'Apple iPhone 6S 32Gb Altın','Apple iPhone 6S 32Gb Altın','Apple iPhone 6S 32Gb Altın','IOS Akıllı Telefon',NULL,'2014',500,2799,2613,1,'iPhone 6s Değişen tek şey, her şey. iPhone 6s’i kullandığınız anda, onun bambaşka bir şey olduğunu hissedeceksiniz. 3D Touch, tek bir bastırma hareketiyle her zamankinden daha fazlasını yapmanıza imkan sunuyor. Live Photos, anılarınıza son derece canlı bi','961259dec97ce1aac2f3293e1588e6d7.jpeg',NULL,6,'true'),(11,'Apple iPhone 7 32Gb Gold','Apple iPhone 7 32Gb Gold','Apple iPhone 7 32Gb Gold','IOS Akıllı Telefon',NULL,'2015',500,3599,3499,1,'iPhone 7, iPhone deneyiminizi çok daha iyi bir hale getiriyor. En önemli özellikler önemli ölçüde gelişiyor, değişiyor. Gelişmiş yepyeni kamera sistemleri, bir iPhone\'da şimdiye kadar sunulan en iyi performans ve pil ömrü, etkileyici stereo hoparlörler, b','d1ec7eafdcebfe8895676777f33c04a9.png',NULL,6,'true'),(12,'Apple iPhone 8 64 GB Altın','Apple iPhone 8 64 GB Altın','Apple iPhone 8 64 GB Altın','IOS Akıllı Telefon',NULL,'2016',500,5299,4699,1,'iPhone 8 Parlak zeka. Karşınızda yepyeni cam tasarımıyla iPhone 8. Dünyanın en sevilen kamerası, onunla çok daha iyi. Bir akıllı telefonda şimdiye kadar kullanılan en güçlü ve en akıllı çipe sahip. Tam anlamıyla zahmetsiz bir şekilde, kablosuz şarj oluyor','b88219723ddb6b7d6536b63932a5f8e9.jpeg',NULL,6,'true'),(13,'Apple iPhone 6S 32Gb Uzay Grisi','Apple iPhone 6S 32Gb Uzay Grisi','Apple iPhone 6S 32Gb Uzay Grisi','IOS Akıllı Telefon',NULL,'2014',500,2699,2499,222,'iPhone 6s Değişen tek şey, her şey. iPhone 6s’i kullandığınız anda, onun bambaşka bir şey olduğunu hissedeceksiniz. 3D Touch, tek bir bastırma hareketiyle her zamankinden daha fazlasını yapmanıza imkan sunuyor. Live Photos, anılarınıza son derece canlı bi','e2311151d5cad78c1fe82170c926e431.jpeg',NULL,6,'true'),(14,'Acer Aspire ES1-572 i5-7200U 4 Gb 500 Gb 15.6\" Win10 Notebook','Acer Aspire ES1-572 i5-7200U 4 Gb 500 Gb 15.6\" Win10 Notebook','Acer Aspire ES1-572 i5-7200U 4 Gb 500 Gb 15.6\" Win10 Notebook','Dizüstü Bilgisayarlar',NULL,'2019',500,3399,2839,1,'Acer Aspire ES1-572 i5-7200U 4 Gb 500 Gb 15.6\" Win10 Notebook','a6cdf39d3fed20c513cea3a12f6a6bce.png',NULL,4,'true'),(15,'MSI GS73 8RE-021XTR i7-8750 16GB 1TB+256GB 6GB GTX1060 17.3\" FDOS','MSI GS73 8RE-021XTR i7-8750 16GB 1TB+256GB 6GB GTX1060 17.3\" FDOS','MSI GS73 8RE-021XTR i7-8750 16GB 1TB+256GB 6GB GTX1060 17.3\" FDOS','Dizüstü Bilgisayarlar',NULL,'2014',500,15388,14300,222,'Matrix Display    Uç noktada oyun performansı için görüş alanınızı genişletin. MSI’ın yenilikçi Matrix Display teknolojisi, aynı anda 3+1 ekrana (3 harici+laptop ekranı) görüntü verebilir. En rekabetçi oyunlarda bile multi-tasking yeteneklerini kullanabil','578c64a32bc536d7205c2431f868e297.jpeg',NULL,10,'true'),(16,'Casper Excalibur G850.7700-B5G0P i7-7700HQ 16Gb 1Tb + 256Gb SSD 17.3\" Win10 Notebook','Casper Excalibur G850.7700-B5G0P i7-7700HQ 16Gb 1Tb + 256Gb SSD 17.3\" Win10 Notebook','Casper Excalibur G850.7700-B5G0P i7-7700HQ 16Gb 1Tb + 256Gb SSD 17.3\" Win10 Notebook','Dizüstü Bilgisayarlar',NULL,'2018',500,8999,7600,1,'Casper Excalibur G850.7700-B5G0P i7-7700HQ 16Gb 1Tb + 256Gb SSD 17.3\" Win10 Notebook','e613119a685ec558122003ec6d7b6155.jpeg',NULL,4,'true'),(17,'DELL INS 3576-FHDB02F41C İ3-7020 4G 1TB 15.6 2G FD','DELL INS 3576-FHDB02F41C İ3-7020 4G 1TB 15.6 2G FD','DELL INS 3576-FHDB02F41C İ3-7020 4G 1TB 15.6 2G FD','Dizüstü Bilgisayarlar',NULL,'2015',500,2890,2670,222,'Tüm gün size yardımcı olacağına güvenebileceğiniz özellikler.    Üstün işlemci gücü    Intel® Core™ işlemciler daha uzun pil ömrü, olağanüstü yanıt hızı ve sorunsuz ve kolay çoklu görev yürütme olanağı sunar.     Her şeyi hızlandırın    12 GB\'a kadar bell','63359c8bcf15c2c9b4924c9d5d712e7e.png',NULL,10,'true'),(18,'DELL VOSTRO 3670 i3-8100 4GB 1TB UBT 3670BTOEME_U','DELL VOSTRO 3670 i3-8100 4GB 1TB UBT 3670BTOEME_U','DELL VOSTRO 3670 i3-8100 4GB 1TB UBT 3670BTOEME_U','Masaütü Bilgisayar',NULL,'2017',500,2455,2270,222,'DELL VOSTRO 3670 i3-8100 4GB 1TB UBT 3670BTOEME_U','d96b5ea48f67d7e735eba5140534c5cf.jpeg',NULL,11,'true'),(19,'DELL OPT 5060MT İ5-8500 8GB 500GB UBT 5060MT_U','DELL OPT 5060MT İ5-8500 8GB 500GB UBT 5060MT_U','DELL OPT 5060MT İ5-8500 8GB 500GB UBT 5060MT_U','Masaütü Bilgisayar',NULL,'2017',500,4700,4499,1,'DELL OPT 5060MT İ5-8500 8GB 500GB UBT 5060MT_U','e3494e9ee671dcebe41cc8e1a89a48fb.jpeg',NULL,11,'true'),(20,'DELL OPT 5060MT İ5-8500 8GB 500GB W10PRO 5060MT_W','DELL OPT 5060MT İ5-8500 8GB 500GB W10PRO 5060MT_W','DELL OPT 5060MT İ5-8500 8GB 500GB W10PRO 5060MT_W','Masaütü Bilgisayar',NULL,'2017',500,5334,4996,222,'DELL OPT 5060MT İ5-8500 8GB 500GB W10PRO 5060MT_W','02b3665b76b4038e3bb84b2eba13aaf8.jpeg',NULL,11,'true'),(21,'Dell Dell Vostro 3668MT i5-7400 8GB 256GB UBUNTU','Dell Dell Vostro 3668MT i5-7400 8GB 256GB UBUNTU','Dell Dell Vostro 3668MT i5-7400 8GB 256GB UBUNTU','Masaütü Bilgisayar',NULL,'2018',500,3650,3440,222,'Dell Dell Vostro 3668MT i5-7400 8GB 256GB UBUNTU','df97c2d3167e40e508bb096fe6dd6760.jpeg',NULL,11,'true'),(22,'Sony WH-1000XM2 Kablosuz Kulaklık Altın','Sony WH-1000XM2 Kablosuz Kulaklık Altın','Sony WH-1000XM2 Kablosuz Kulaklık Altın','Kulaklık',NULL,'2018',500,2259,1829,222,'Sony WH-1000XM2 Kablosuz Kulaklık Altın','c0867ca17d17cc842d5d07fdf9d28a44.jpeg',NULL,14,'true'),(23,'Sony WH-1000XM2 Kablosuz Kulaklık Siyah','Sony WH-1000XM2 Kablosuz Kulaklık Siyah','Sony WH-1000XM2 Kablosuz Kulaklık Siyah','Kulaklık',NULL,'2018',500,2256,1899,222,'Sony WH-1000XM2 Kablosuz Kulaklık Siyah','99da2d8c6f6d60513f597fa9460c2743.jpeg',NULL,14,'true'),(24,'Trust 22455 Ziva Bleutooth Kablosuz Kulaküstü Kulaklık','Trust 22455 Ziva Bleutooth Kablosuz Kulaküstü Kulaklık','Trust 22455 Ziva Bleutooth Kablosuz Kulaküstü Kulaklık','Kulaklık',NULL,'2018',500,156,125,222,'Trust 22455 Ziva Bleutooth Kablosuz Kulaküstü Kulaklık','96592f1dbe2d628d1a9aa25820b98b8c.jpeg',NULL,14,'true'),(25,'Sony WHCH500B Kablosuz Bluetooth Kulaküstü Kulaklık Mavi','Sony WHCH500B Kablosuz Bluetooth Kulaküstü Kulaklık Mavi','Sony WHCH500B Kablosuz Bluetooth Kulaküstü Kulaklık Mavi','Kulaklık',NULL,'2018',500,323,313,222,'Sony WHCH500B Kablosuz Bluetooth Kulaküstü Kulaklık Mavi','f1e399a44a88d6849429eeef6acf3166.jpeg',NULL,14,'true'),(26,'Frısby 855Bt Bt V4.1 Mıknatıslı Siyah Kulaklık','Frısby 855Bt Bt V4.1 Mıknatıslı Siyah Kulaklık','Telefon Kulaklık','Kulaklık',NULL,'2018',500,101,59,222,'Frısby 855Bt Bt V4.1 Mıknatıslı Siyah Kulaklık','6d301731ca046806c30e1b0c0fef2f55.jpeg',NULL,13,'true'),(27,'Sony NWWS625B.CEW Giyilebilir MP3 Player Siyah','Sony NWWS625B.CEW Giyilebilir MP3 Player Siyah','Sony NWWS625B.CEW Giyilebilir MP3 Player Siyah','Kulaklık',NULL,'2018',500,1037,999,222,'Sony NWWS625B.CEW Giyilebilir MP3 Player Siyah','0fbcc1d1ad7f95dbcc791dfd2e25ff28.jpeg',NULL,13,'true'),(28,'i.am+ Buttons BT Earphones - Space Grey Siyah, Gri','i.am+ Buttons BT Earphones - Space Grey Siyah, Gri','i.am+ Buttons BT Earphones - Space Grey Siyah, Gri','Kulaklık',NULL,'2018',500,679,525,222,'i.am+ Buttons BT Earphones - Space Grey Siyah, Gri','0d01e875f3618c199ff0e73feb16afb9.jpeg',NULL,13,'true'),(29,'i.am+ Buttons BT Earphones - Gold/Black Siyah, Altın','i.am+ Buttons BT Earphones - Gold/Black Siyah, Altın','i.am+ Buttons BT Earphones - Gold/Black Siyah, Altın','Kulaklık',NULL,'2018',500,699,579,222,'i.am+ Buttons BT Earphones - Gold/Black Siyah, Altın','9d5162a4039a451e97c34bd72097d81d.jpeg',NULL,13,'true'),(30,'Sony NWZB183B.CEW MP3 Player Siyah','Sony NWZB183B.CEW MP3 Player Siyah','Sony NWZB183B.CEW MP3 Player Siyah','Mp3 Player',NULL,'2018',500,412,399,222,'Sony NWZB183B.CEW MP3 Player Siyah','114ee7c7c4a6a450161479a986dbf8c3.jpeg',NULL,19,'true'),(31,'FRISBY FS-70NB Taşınabilir, Gri, Bluetooth Hoparlör','FRISBY FS-70NB Taşınabilir, Gri, Bluetooth Hoparlör','FRISBY FS-70NB Taşınabilir, Gri, Bluetooth Hoparlör','Mp3 Player',NULL,'2018',500,98,75,222,'FRISBY FS-70NB Taşınabilir, Gri, Bluetooth Hoparlör','8a7f180369fabda168b14fe580a322dc.jpeg',NULL,19,'true'),(32,'FRISBY FS-P206BT Taşınabilir, Kablosuz, Beyaz Bluetooth Hoparlör','FRISBY FS-P206BT Taşınabilir, Kablosuz, Beyaz Bluetooth Hoparlör','FRISBY FS-P206BT Taşınabilir, Kablosuz, Beyaz Bluetooth Hoparlör','Mp3 Player',NULL,'2018',500,80,59,222,'FRISBY FS-P206BT Taşınabilir, Kablosuz, Beyaz Bluetooth Hoparlör','19d40fc9cae957e222eee6181a553a36.jpeg',NULL,19,'true'),(33,'LG OK99 1800W X BOOM Taşınabilir HI-FI Ses Sistemi','LG OK99 1800W X BOOM Taşınabilir HI-FI Ses Sistemi','LG OK99 1800W X BOOM Taşınabilir HI-FI Ses Sistemi','Mp3 Player',NULL,'2018',500,2499,2229,222,'LG OK99 1800W X BOOM Taşınabilir HI-FI Ses Sistemi','f4f7a27ea322a1df4e13fea3773b5a0d.jpeg',NULL,19,'true'),(34,'Samsung HW-N450 2.1 Ch Soundbar Ev Sinema Sistemi','Samsung HW-N450 2.1 Ch Soundbar Ev Sinema Sistemi','Ev Sinema Sistemleri Samsung HW-N450 2.1 Ch Soundbar Ev Sinema Sistemi','Ev Sinema Sistemi',NULL,'2014',500,1369,1299,1,'Samsung HW-N450 2.1 Ch Soundbar Ev Sinema Sistemi','1653299178f65805bad78246dc348064.jpeg',NULL,20,'true'),(35,'LG SK5R 4.1 Ch Soundbar Ev Sinema Sistemi','LG SK5R 4.1 Ch Soundbar Ev Sinema Sistemi','Ev Sinema Sistemleri LG SK5R 4.1 Ch Soundbar Ev Sinema Sistemi','Ev Sinema Sistemi',NULL,'2018',500,1299,1199,222,'LG SK5R 4.1 Ch Soundbar Ev Sinema Sistemi','b9eb19d2f2c4e5cfcfc1eeb7ff3996ae.png',NULL,20,'true');

#
# Structure for table "setting"
#

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpserver` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtppasw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpport` int(11) DEFAULT NULL,
  `aboutus` longtext COLLATE utf8mb4_unicode_ci,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "setting"
#

INSERT INTO `setting` VALUES (1,'Csrf Mobile','Yüzlerce Marka ve Üründe En Uygun Fiyatlar Hepsiburada\'da! Fırsatları Kaçırmayın. Aradığınız Her Şey Türkiye\'nin En Büyük Online Alışveriş Sitesi Hepsiburada\'da! 24 Saatte Kargo Fırsatı. 50 TL Üzeri Kargo Bedava. 100% Güvenli Alışveriş. Hizmetler: 50 TL Üzeri Kargo Bedava, Güvenli Alışveriş.','Akıllı Telefon fiyatları, en uygun akıllı telefon markaları ve modelleri uygun taksit seçenekleri ile Csrf Mobile De','Csrf Mobile','Silikon Vadisi No :5 Daire 2','0850 544 98 94','csrfmobile@mobile.com','smtp.com','smtp.com','123455',22,'<h2>What is Symfony</h2><p><i>« Symfony is a set of PHP Components, a Web Application framework, a Philosophy, and a Community — all working together in harmony. »</i></p><p>&nbsp;</p><h3>Symfony Framework</h3><p>The leading PHP framework to create websites and web applications. Built on top of the Symfony Components.</p><h3>Symfony Components</h3><p>A set of decoupled and reusable components on which the best PHP applications are built, such as Drupal, phpBB, and eZ Publish.</p><h3>Symfony Community</h3><p>A passionate group of over 600,000 developers from more than 120 countries, all committed to helping PHP surpass the impossible.</p><h3>Symfony Philosophy</h3><p>Embracing and promoting professionalism, best practices, standardization and interoperability of applications.</p><h2>Symfony Project stats</h2><p>+3,000<a href=\"https://symfony.com/contributors\">contributors</a></p><p>+600,000<a href=\"https://symfony.com/community\">Symfony developers</a></p><p>+48,000,000<a href=\"https://symfony.com/stats/downloads\">monthly downloads</a></p><h2>Symfony in 5 minutes</h2><ul><li><a href=\"https://symfony.com/why-use-a-framework\">Why should I use a framework?</a></li><li><a href=\"https://symfony.com/when-use-a-framework\">When should I use a framework?</a></li><li><a href=\"https://symfony.com/six-good-reasons\">6 good reasons to use Symfony</a></li><li><a href=\"https://symfony.com/six-good-technical-reasons\">The technological benefits of Symfony in 6 easy lessons</a></li><li><a href=\"https://symfony.com/ten-criteria\">10 criteria for choosing the correct framework</a></li></ul><h2>Elevator pitches</h2><p>Symfony explained...</p><ul><li><a href=\"https://symfony.com/explained-to-my-boss\">... to my boss</a></li><li><a href=\"https://symfony.com/explained-to-a-developer\">... to a developer</a></li><li><a href=\"https://symfony.com/explained-to-a-system-administrator\">... to a system administrator</a></li><li><a href=\"https://symfony.com/explained-to-a-project-manager\">... to a project manager</a></li><li>&nbsp;</li></ul>','<p><strong>Contact</strong></p><ul><li><strong>+33 (0) 1 86 65 72 00</strong></li><li><a href=\"mailto:contact@sensiolabs.com\"><strong>contact@sensiolabs.com</strong></a></li><li><a href=\"mailto:sales@sensiolabs.com\"><strong>sales@sensiolabs.com</strong>&l');

#
# Structure for table "shopcarts"
#

DROP TABLE IF EXISTS `shopcarts`;
CREATE TABLE `shopcarts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "shopcarts"
#

INSERT INTO `shopcarts` VALUES (1,2,1,1),(2,2,1,1);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'oguz@mail.com','ROLE_ADMIN','$2y$10$uZYaoCD1VQojFKfjgD9/u.xDuMZV8qVC8keQdAVSZ7Y8nTGaGFGUG','oguz','true','Eskişehir Tepebaşı','İzmir','02223102587'),(2,'deno@mail.com','ROLE_USER','$2b$10$P5ytjq8WQ4wpvkv7RWwLKeUgd/Q96XPjECWOQ20GEcUfkkjdq8e1y','deniz','true','Eskişehir Tepebaşı','Eskişehir','05554223'),(3,'mahocan@mail.com','ROLE_ADMIN','$2b$10$P5ytjq8WQ4wpvkv7RWwLKeUgd/Q96XPjECWOQ20GEcUfkkjdq8e1y','MahonunÜyelik','true','Eskişehir Tepebaşı caca',NULL,NULL),(4,'abo@mail.com','ROLE_ADMIN','$2b$10$rsX4/mpgm5VigSYh5RXrkehokJF7UIWrx4HvtiB.4Q4ZgOd5CtSnC\r\n$2b$10$rsX4/mpgm5VigSYh5RXrkehokJF7UIWrx4HvtiB.4Q4ZgOd5CtSnC\r\n$2b$10$rsX4/mpgm5VigSYh5RXrkehokJF7UIWrx4HvtiB.4Q4ZgOd5CtSnC','furkan','kick','Eskişehir Tepebaşı','Eskişehir','05555555'),(6,'email@email.com','ROLE_ADMIN','$2y$13$MU4aLDc3dvHpBufDxEDVruoG79kwPyCv1wKyucGvkD/h.9697GJ7m','Test','kick','Eskişehir Tepebaşı','Eskişehir','05433333'),(7,'oguzhanturan@yahoo.com','ROLE_USER','$2b$10$YPk.T0cAqd95CAeBmzAqb.oEL5yNhdkaSN20D3kP95v44RZZ.4fee','oguzhan','true','100. yıl mahallesi 1080. sokak no:3 d:5 Karabük merkez','5','544544544'),(25,'denizturan@gmail.com','ROLE_USER','$2y$10$.sZpzW2qg4qM3OR3zrZ.R.2d8nHy4C4YkdzrX1cV2q8sdp7CvdC3.','oguzhan','true','100. yıl mahallesi 1080. sokak no:3 d:5 Karabük merkez','Eskişehir','123'),(26,'denememail@mail.com','ROLE_USER','$2y$13$x9Ph0ZJxIm.UHxeo9bFZwOZ26Smys7sf5gGqiurDIckGuCj/qeOO2','oguzhan','true','100. yıl mahallesi 1080. sokak no:3 d:5 Karabük merkez','karabük','5449889427'),(27,'test@mail.com','ROLE_USER','$2y$10$hK7zFWe4d0PWNKiN7F6rweOh6BvkZXYRZ7OvLqIagr3fqOH8RYAne','Oğuzhan TURAN','true','100. yıl mahallesi 1080. sokak no:3 d:5 Karabük merkez','Eskişehir','02223102587'),(28,'2301test@mail.com','ROLE_USER','$2y$10$XpoFZ2zKCU7mtioILWLmy.t532IHlJR8l9mJeljSi9gDn7/dGssWa','2301','true','100. yıl mahallesi 1080. sokak no:3 d:5 Karabük merkez','karabük','5443453452');
