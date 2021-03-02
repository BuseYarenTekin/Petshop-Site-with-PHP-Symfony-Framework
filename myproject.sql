# Host: localhost  (Version 5.5.5-10.1.36-MariaDB)
# Date: 2019-01-24 16:51:16
# Generator: MySQL-Front 6.1  (Build 1.21)


#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (1,0,'KEDİ🐱','kediler','Kedi açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,0,'KÖPEK🐶','köpek','Köpek açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,0,'KUŞ🐤','kuş','Kuş açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,1,'Kedi Mamaları🐱','kedi maması','mama açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,1,'Kedi Kumları🐱','kedi kumu','kedi kumu açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,1,'Kedi Konserveleri🐱','kedi konservesi','kedi konservesi','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,1,'Kedi Yatakları🐱','kedi yatağı','kedi yatağı açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,2,'Köpek Mamaları🐶','kedi maması','kedi maması açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,2,'Köpek Kafesleri🐶','köpek kafesi','köpek kafesi açıklaması','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,2,'Köpek Yatakları🐶','köpek yatağı','köpek yatağı açıklama','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,3,'Kuş Yemleri🐤','kuş yemi','kuş yemi açıklama','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,3,'Kuş Kafesleri🐤','kuş kafesi','kuş kafesi açıklama','true','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,2,'Profine Kitten Tavuklu Yavru K','mama','mama','True','0000-00-00 00:00:00','0000-00-00 00:00:00');

#
# Structure for table "image"
#

DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "image"
#

INSERT INTO `image` VALUES (2,30,'tasma.jpg'),(3,30,'c3e5d80b95de69171fe6265bda4256a0.jpeg'),(4,30,'fa7b51e9e8065a4b8968e1064eacc900.jpeg'),(5,30,'5dfe9c40414ba4573194f06ddf9347b6.jpeg'),(6,1,'9d484d715de1a01350f3ac67cd311f3f.png'),(7,1,'503b50bd2549f38a8b4b7b0a73d5df20.png'),(8,2,'5d1f36ba95a683213d98b0b91e435c5c.png'),(9,33,'42da3faea2bd44e4a91ef8ca2e66cfca.png');

#
# Structure for table "messages"
#

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "messages"
#

INSERT INTO `messages` VALUES (0,'buse tekin','edve@gmail.com','eegege','gegege',NULL,NULL,'2019-01-23 12:38:31','2019-01-23 12:38:31'),(1,'Berkay Kazandibi','cahitberkaykazangirler@gmail.com','Kedi Tasması','Aciliyet','Yorum düzelt','Okundu','2019-01-18 20:26:47','2019-01-22 21:21:38'),(2,'Buse Tekin','tekinyrnn@gmail.com','test','test mesajı','Yorumum2','Okundu','2019-01-18 19:59:03','2019-01-22 21:21:37');

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

INSERT INTO `migration_versions` VALUES ('20190122142554'),('20190122142731');

#
# Structure for table "order_detail"
#

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "order_detail"
#

INSERT INTO `order_detail` VALUES (1,24,7,31,25,3,75,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(2,24,7,31,25,2,50,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(3,25,6,1,10,2,20,'Kedi Tasması','Ordered'),(4,26,7,31,25,2,50,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(5,26,7,31,25,1,25,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(6,26,7,31,25,2,50,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(7,27,7,2,20,2,40,'Köpek Oyuncağım','Ordered'),(8,27,7,31,25,1,25,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(9,27,7,31,25,1,25,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(10,28,7,31,25,2,50,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(11,28,7,30,5,3,15,'Bir kedinin dostluğu tonlarca ilaçtan çok daha şifalıdır 🐱','Ordered'),(12,28,7,31,25,1,25,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(13,28,7,31,25,1,25,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered'),(14,29,7,31,25,3,75,'Profine Kitten Tavuklu Yavru Kedi Maması','Ordered');

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipinfo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (24,7,50,'Deniz Türe','Karabük Kız KYK','karabuk','12312321312','deneme','accepted','deneme','2019-01-23 12:19:13','2019-01-22 17:43:02'),(25,6,20,'Derya Yılmaz','karabuk','Elazığ','111111111112','fefe','new','fefefe','2019-01-23 06:02:11','2019-01-23 06:02:11'),(26,7,125,'Deniz Töre','Karabük Kız KYK','karabuk','12312321312','grgrg','new','wwew','2019-01-23 07:01:50','2019-01-23 07:01:50'),(27,7,90,'Deniz Töre','Karabük Kız KYK','karabuk','12312321312','vv','new','re','2019-01-23 11:51:29','2019-01-23 11:51:29'),(28,7,115,'Deniz Töre','Karabük Kız KYK','karabuk','12312321312','cscs','new','cscs','2019-01-23 12:14:04','2019-01-23 12:14:04'),(29,7,75,'Deniz Töre','Karabük Kız KYK','karabuk','12312321312','Bilgi','accepted','cdjcsjd','2019-01-23 12:36:56','2019-01-23 12:34:36');

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `pprice` double NOT NULL,
  `sprice` double NOT NULL,
  `min` int(11) DEFAULT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `writer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "product"
#

INSERT INTO `product` VALUES (1,'Kedi Tasması','sdfdsf','tasma ismi',NULL,1,0,0,5,10,5,'<p>sdfdsfs</p>','97f2413687fe87648fd641e0c8fc867d.png',0,1,2,'true'),(2,'Köpek Oyuncağım','sffwfw','oyuncak ismi',NULL,0,0,2,40,20,3,'<p>csvcsvs</p>','6e850e32c15b5777025f3bcc17650558.jpeg',0,1,2,'false'),(3,'Kedi ödülü','ödül','açıklama',NULL,0,2019,5,35,35,0,NULL,'44235d1d9706d8ad0c3c99f9b2cfc43c.jpeg',0,9,2,'true'),(30,'Bir kedinin dostluğu tonlarca ilaçtan çok daha şifalıdır 🐱','kediler','dostluk ',NULL,1,1988,10,5,5,0,NULL,'1ffae05296d8ee30799f52bd4ba61eca.png',0,9,2,'true'),(31,'Profine Kitten Tavuklu Yavru Kedi Maması','mama','mamalar',NULL,1,1877,5,15,25,1,'vsvsvdesvsd','370d611560c54ec877dcad5307ab2b00.png',1,1,3,'true'),(33,'Kedi kumu','kum','kumm',NULL,NULL,NULL,2,10,15,NULL,'Kedi Kumu','a7ec61fe02d934751c7bb939137bcd07.png',NULL,NULL,NULL,'true');

#
# Structure for table "setting"
#

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtpserver` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtpemail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtppass` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtpport` int(11) NOT NULL,
  `aboutus` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `referances` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "setting"
#

INSERT INTO `setting` VALUES (2,'başlık','inş','Kuş Kafesi','dfghjkl','grgrgr','grgrgr','smtp.gmail.com','test@gmail.com','12345cvce',584,'<p><strong>1996 yılından itibaren pet shop sektöründe geçmişi olan firmamız, 2009 yılı itibari ile Pet Shop Zoo adı altında faaliyet göstermeye devam etmektedir.</strong><br>&nbsp;</p><p>Politikamız kalite, güven, dürüstlük ve müşteri memnuniyeti üzerine kurulmuştur.</p><p>Siz hayvanseverlerin en ekonomik şekilde faydalanması için en kaliteli ürünleri en uygun fiyatlara sizlere sunmaktayız. Kesinlikle müşteri memnuniyeti ve prestijimiz bizim için önceliklidir.</p><p>Firmamız Ege Bölgesi’nin en büyük, en lüks ve en modern 2 mağazasına sahiptir. Firmamız siz hayvanseveler sayesinde petshop sektöründe sözü geçen bir firma haline gelmiştir böylece siz müşterilerimize kaliteyi ucuza evcil dostlarımız için temin ettirebilmekteyiz. Bornova ve Güzelyalı şubelerimizde her türlü evcil hayvan ve ürünlerini bulma imkanına sahipsiniz.</p><p>Hepsi konusunda uzman deneyimli personelimizle sizlere en iyi şekilde hizmet etmeye çalışmaktayız. Siz değerli müşterilerimiz alışveriş öncesi veya sonrası (Bornova Mağaza) havuzlu bahçemizde çayınızı yudumlarken dilerseniz bahçemizin diğer bölümünde kapalı alanda evcil hayvanınızı misafir edebiliriz.</p>','<p>05424077835</p><p><strong>Çalışma Saatleri</strong><br>Hafta İçi : 08.00 - 19.00&nbsp;<br>Cumartesi : 08,00 - 19.00<br>Pazar Günleri Çalışmıyoruz.&nbsp;</p><p><br>&nbsp;</p>','<figure class=\"image\"><img src=\"http://www.hedefepsikoloji.com/yonetim/images/referans/ref3_11_.jpg\" alt=\"\"></figure><p><a href=\"http://www.hedefepsikoloji.com/referanslar#\">TÜRK HAVA YOLLARI</a></p>','true');

#
# Structure for table "shopcart"
#

DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "shopcart"
#

INSERT INTO `shopcart` VALUES (2,4,2,4),(3,5,5,5);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (6,'deneme@mynet.com','ROLE_ADMIN','$2y$10$y3b/ySMWmdP6W7Ux5NRya.8GGEKiZeNp5hXe4X40JR80UkFi1t/vC','Derya Yılmaz','true','karabuk','111111111112','Elazığ'),(7,'abc@gmail.com','ROLE_USER','$2y$10$duiFiFuIPlcuW5gC6tWLzep34d/p2rS34I8BEE2FZ82bSgEz6UzYG','Deniz Töre','true','Karabük Kız KYK','12312321312','karabuk');
