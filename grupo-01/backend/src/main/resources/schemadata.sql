CREATE DATABASE  IF NOT EXISTS `digital_booking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `digital_booking`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: digital_booking
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(512) NOT NULL,
  `title` varchar(64) NOT NULL,
  `url_image` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Hoteles de diversas categorías con la mejor relación precio-calidad, servicios de restaurante, gimnasio, spa, actividades, etc.','Hoteles','https://images.unsplash.com/photo-1578898886225-c7c894047899?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387'),(2,'Alojamientos con cocina, baño y comedor compartidos, el mejor lugar para conocer viajeros de todo el mundo.','Hostels','https://images.unsplash.com/photo-1644031995392-5a07babd176c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170'),(3,'Departamentos de una o más habitaciones, usados y a estrenar.','Departamentos','https://images.unsplash.com/photo-1591079381491-cb2c19ce7f15?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735'),(4,'Alquiler de habitaciones en casas familiares privadas donde viven sus propios dueños. ','Bed and breakfast','https://images.unsplash.com/photo-1602774895754-2772f8a08f6b?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristics`
--

DROP TABLE IF EXISTS `characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `icon` varchar(64) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristics`
--

LOCK TABLES `characteristics` WRITE;
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
INSERT INTO `characteristics` VALUES (1,'faSink','Cocina'),(2,'faCar','Estacionamiento gratuito'),(3,'faTvRetro','Televisor'),(4,'faPersonSwimming','Pileta'),(5,'faSnowflake','Aire acondicionado'),(6,'faWifi','Wifi'),(7,'faPaw','Apto mascotas'),(8,'faTrees','Jardín'),(9,'faMugHot','Desayuno'),(10,'faHeat','Calefacción');
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `country` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `province` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Argentina','Rosario','Santa Fe'),(2,'Argentina','Villa Carlos Paz','Córdoba'),(3,'Argentina','San Carlos de Bariloche','Río Negro'),(4,'Argentina','Ushuaia','Tierra del Fuego'),(5,'Brasil','Búzios','Río de Janeiro'),(6,'Argentina','Villa General Belgrano','Córdoba'),(7,'Argentina','Villa La Angostura','Neuquén'),(8,'Argentina','San Rafael','Mendoza'),(9,'Argentina','San Martín de Los Andes','Neuquén'),(10,'Brasil','Río de Janeiro','Río de Janeiro');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `url_image` varchar(512) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_images_products1_idx` (`product_id`),
  CONSTRAINT `fk_images_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'main','https://cf.bstatic.com/xdata/images/hotel/max1024x768/2406583.jpg?k=c9af9ca11c0faf3afcf7e22cb6b91a5cbb9a16228ee7583284f95305428fbc38&o=&hp=1',1),(2,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/52068359.jpg?k=46bfe5cfa9c3dce067b57e5a2fe6cbc71c0246981171881e79ebaa2b00a83979&o=&hp=1',1),(3,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/46006293.jpg?k=c150f8ac79a3e3c44644208c926899b88f60dc6228cc344f3cec5d89366e4db6&o=&hp=1',1),(4,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/7223668.jpg?k=1035ca6e0fef46f80027466203935553739815f3b2d783368a734890d6221d05&o=&hp=1',1),(5,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/46006291.jpg?k=fedbb091d6141c9568e9a311f4f5fe9694cd562262e82bcb688cf5586b4ff2ea&o=&hp=1',1),(6,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/46006294.jpg?k=71603e4fafc5d6560139ab6389ecf13a37983e8ad1bc4addffb9f157fbe0a29c&o=&hp=1',1),(7,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/46006298.jpg?k=3fc8ecd4590d9cf4d61aea5c423a6acb82fbca358bb2fdac22bfd2dafd569bff&o=&hp=1',1),(8,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/52069572.jpg?k=2c0a831cc4dbc98dce14f9ef8064fa0f1eab18452f034631208f01e14aa7671a&o=&hp=1',1),(9,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/52070211.jpg?k=04eeb78a4c8dfda6bc86ae5bce8faca9ddeb6a120a8af035682ea2028097cd8d&o=&hp=1',1),(10,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/52070275.jpg?k=61ae386ecac896a9b37a2b65b67246af9d7bf2fe859044d2dae180f141856403&o=&hp=1',1),(11,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/330746627.jpg?k=947e2c7be88f624922c87bfcbab37ecfbdccef002575f5c9e1f86cf619725a4e&o=&hp=1',1),(12,'main','https://cf.bstatic.com/xdata/images/hotel/max1024x768/166442884.jpg?k=f038e53f71b03089fec79040cc5504bbc2ddf1d5769325d855baf665fc8fa67e&o=&hp=1',2),(13,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112547.jpg?k=80764bd4114fc8916c439c341bf0c44f5c67060daad07f37284a323100f2de7d&o=&hp=1',2),(14,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/142104783.jpg?k=9478cf6c77bad9cef04b1a4948a5c485470f9e3116156c7d440c47e941faf6ce&o=&hp=1',2),(15,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112598.jpg?k=5a199703aff45682be3d5a4aa8b2da2a166118f0d8405a327c5ac365332a07ed&o=&hp=1',2),(16,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/192332775.jpg?k=76d1784f258f78dac5b25e2b252dad14d9f443e1a633e75a7ca359c7fed9b4a1&o=&hp=1',2),(17,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112601.jpg?k=dda51784ee7d19f206c6ae4714fc04eadba83f884ef9be1c849a1aaf84896b1c&o=&hp=1',2),(18,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112586.jpg?k=ba918bd636004efa46b1e57e9c6d8cfec18d8493bcf5618dcbbd57a617f5f675&o=&hp=1',2),(19,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/192332789.jpg?k=39e76ecf3bc5a8fd84698fada6aa198e505bb1d8a75aadb0ed885099033304fc&o=&hp=1',2),(20,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/192332797.jpg?k=4fa39c38e5e4a913ea219ec238b5467d13fe6c74660db250b5e6776d2276e005&o=&hp=1',2),(21,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/192332651.jpg?k=f03eb3c9325778b4d056414f72dd714c77384643a637560479220629fc2f2197&o=&hp=1',2),(22,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/192332581.jpg?k=be27f4900b9399949fa62af2a26081b57094fffef24704da6cc02abf374a1ae0&o=&hp=1',2),(23,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112580.jpg?k=2290f42928d9e2a82d5c00684be81f33bd7133ff9c4fab3a42b030f184018f88&o=&hp=1',2),(24,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112576.jpg?k=461460ed43ecbb71050bc121edb46e7298a5836bd4256244b7b74e0f28ee3c74&o=&hp=1',2),(25,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112545.jpg?k=2c39199691eaba90c6ad7ec24f06416b31ec2ee4111bcb251c11712e2e091d19&o=&hp=1',2),(26,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112549.jpg?k=77e27dd5d0ce5b6b42e7cb7e44256b5db4952c84123a5f13c6411fd3744d87fa&o=&hp=1',2),(27,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112511.jpg?k=61a6da09e93e7e93e2cd02a203554741f706231ebd0c49d130abf5f4e92557e1&o=&hp=1',2),(28,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112518.jpg?k=c6ae764531f21202a633b99e8839dd606358c7d403f51a2329ece0e4ff3cdcfd&o=&hp=1',2),(29,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112520.jpg?k=ea452b167ee9f45a7310013a95e9073cd0e7f15582524e3795435e7c2ada6f77&o=&hp=1',2),(30,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112522.jpg?k=5cc7dcec95ff67af557eda160d725b06d790a020ed15750902d78d327f26908b&o=&hp=1',2),(31,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/192332784.jpg?k=64aa6b56a0fc8ab651f8410796e7999714469c77868e6b0385aa584911b81f1d&o=&hp=1',2),(32,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112523.jpg?k=123d0fc49facd0afa87c812751c47a5d53c269f6cebf70ff1eb7b9c4631f4db0&o=&hp=1',2),(33,'main','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371727.jpg?k=5a7de815d60c4cb9e6e7f1987503ac128fc5cc5433b2978a0e5fcb75cae453fb&o=&hp=1',3),(34,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371698.jpg?k=12ded7e72db487e4a9d44d2abc738cd079e7b1812622b93682bfb27718d0d0e9&o=&hp=1',3),(35,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/176073699.jpg?k=ea4416674cc9cb3f4e21d3a83a0d60c58a67eaa624e3279bdbccefb72c106fdf&o=&hp=1',3),(36,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/139112598.jpg?k=5a199703aff45682be3d5a4aa8b2da2a166118f0d8405a327c5ac365332a07ed&o=&hp=1',3),(37,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371479.jpg?k=48adf9e9db3ff9b68c13e08d456841b64f5a54684df3834bcba95b2d4161669a&o=&hp=1',3),(38,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/253077804.jpg?k=7e097037e3ff0dbb51d1b76028d39059f202a067ecbac8be5c205e241b8ffdca&o=&hp=1',3),(39,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/13234271.jpg?k=a64554d3ce21936ead126b8c4650e3ca03200ade2d7f6989dedfe9c03da82685&o=&hp=1',3),(40,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/176073545.jpg?k=db0585e6baa68a7e0d23683333c7d7f2a7ec18cf94e6584583f572dccc3fea3f&o=&hp=1',3),(41,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371270.jpg?k=2f17a2b15e0d7a184ffd43064de5b42e152d8f869d0cfa442f348c4280f746f1&o=&hp=1',3),(42,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53372216.jpg?k=4b8a570a7a461910b42acb86a52cfc1838fa03f8d831b8f369db84274d622589&o=&hp=1',3),(43,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371445.jpg?k=e857b7759ab2604ae7f981adbae2db0e87bfabc77edac788ba4a7ddb4ad9ea7c&o=&hp=1',3),(44,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371866.jpg?k=97ca1d1fd641aa79e0e1c9a2234b796823fdbed7ba8113845ddd44103db1e4de&o=&hp=1',3),(45,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371607.jpg?k=15cb28e371deba982f91a072d65e4f89964e1cafdf18a7e99a5f196a7eb99f8d&o=&hp=1',3),(46,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371593.jpg?k=4ead376e0c52a3fb9bd4a60ea06fe4d43099c19410ad2388d9141b029b17c72d&o=&hp=1',3),(47,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371170.jpg?k=22e917720040a3dc4d85787bdaa7ac15cb81efd9bc744be2d82f7b6b324fe0a7&o=&hp=1',3),(48,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371728.jpg?k=f81cf44b35971bdf589d1f4bf69d60554fe3f4fbc6850b8a0687f66ca589dedb&o=&hp=1',3),(49,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371828.jpg?k=fe628e50cb73b4272a6c8e9912fb64a2001966f087f8e20dceb2910d96522245&o=&hp=1',3),(50,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371916.jpg?k=1a4802050712c7163d0d60484eb637ca9e26e42a541a15b13d7ffec938e7c414&o=&hp=1',3),(51,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/176073667.jpg?k=b0b1b3da5879109c7c93a88f7ccec8d4cbb89549189eb640ba8f6d63f0a0e84d&o=&hp=1',3),(52,'other','https://cf.bstatic.com/xdata/images/hotel/max1024x768/53371941.jpg?k=df2402f56bb217d4dc31b2bf57305f186c43c4d25daab529b21c2dbd989fb995&o=&hp=1',3);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(128) NOT NULL,
  `cancellation_policy` varchar(1024) NOT NULL,
  `description` varchar(2056) NOT NULL,
  `health_and_safety` varchar(1024) NOT NULL,
  `house_rules` varchar(1024) NOT NULL,
  `name` varchar(64) NOT NULL,
  `category_id` bigint NOT NULL,
  `city_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_categories_idx` (`category_id`),
  KEY `fk_products_cities1_idx` (`city_id`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_cities1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Av. San Martín 536','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía.','Esta propiedad está a 6 minutos caminando de la playa. El Hotel Nevada ofrece alojamiento de 3 estrellas con decoración característica alpina a 200 metros del lago Nahuel Huapi. Cuenta con WiFi gratis. /Todas las habitaciones del Nevada están insonorizadas y disponen de TV vía satélite, radio, artículos de aseo exclusivos y secador de pelo. /El restaurante del alojamiento sirve típica carne argentina y platos internacionales. Además, hay bar, biblioteca y sala de juegos con máquinas recreativas. /El Hotel Nevada está a 13 km del aeropuerto de San Carlos de Bariloche y a 19 km del cerro Catedral. /Nuestros clientes dicen que esta parte de San Carlos de Bariloche es su favorita, según los comentarios independientes.','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus /Detector de humo /Depósito de seguridad','Check-out: 10:00 /No se permiten fiestas /No fumar','Hotel Nevada',1,3),(2,'Rolando 250','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía.','Esta propiedad está a 5 minutos caminando de la playa. El Hotel Panamericano Bariloche de 4 estrellas, situado al lado del majestuoso lago Nahuel Huapi, ofrece habitaciones con vistas al lago y a las montañas y baño privado. El hotel alberga un spa, gimnasio y bañera de hidromasaje. /Las habitaciones y las suites ocupan un edificio amplio y elegante y ofrecen vistas al lago o a la ciudad. Además, el hotel cuenta con una amplia variedad de actividades de ocio para toda la familia. /El restaurante La Cave sirve fondues de queso a pedido. El piano bar del vestíbulo propone cócteles, bebidas, carnes ahumadas de la Patagonia y una amplia selección de vinos de la bodega Zuccardi. /El spa del hotel incluye pileta climatizada, gimnasio, sauna y bañera de hidromasaje. Entre las instalaciones del Panamericano Bariloche destacan el casino, la sala de juegos y el actividades para niños. /El personal del hotel organiza una amplia variedad de actividades de ocio en plena naturaleza, como ciclismo de montaña, equitación, pesca con mosca y paseos en kayak. /Nuestros clientes dicen que esta parte de San Carlos de Bariloche es su favorita, según los comentarios independientes.','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus /Detector de humo /Depósito de seguridad','Check-out: 10:00 /No se permiten fiestas /No fumar','Hotel Panamericano Bariloche',1,3),(3,'Av. Bustillo Km 11,5','Agregá las fechas de tu viaje para obtener los detalles de cancelación de esta estadía.','Este hotel de 5 estrellas se encuentra a orillas del lago Nahuel Huapi y presenta una arquitectura elegante. El Casco Art Hotel exhibe 500 obras de arte exclusivas de escultores y pintores argentinos. Ofrece wifi gratis. La estación de esquí de Cerro Catedral y el centro de Bariloche están a 15 minutos en auto. /Las habitaciones del alojamiento El Casco Art Hotel están decoradas con cuadros exclusivos. Algunas tienen zona de estar amplia, bañera de hidromasaje y balcón con vistas al lago. /El restaurante gourmet, que ha sido galardonado, prepara platos exquisitos elaborados con productos locales. Todos los días se sirve un desayuno americano. El alojamiento cuenta con servicio de conserjería, room service, ducha escocesa, bañera de hidromasaje, gimnasio y sauna. Los tratamientos de belleza comportan un adicional. /Gracias a su ubicación, el hotel es un punto de partida idóneo para recorrer la provincia de Río Negro, a los pies de las montañas. El aeropuerto local se halla a 25 km.','Se aplican las pautas de distanciamiento social y otras normas relacionadas con el coronavirus /Detector de humo /Depósito de seguridad','Check-out: 10:00 /No se permiten fiestas /No fumar','El Casco Art Hotel ',1,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_characteristics`
--

DROP TABLE IF EXISTS `products_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_characteristics` (
  `product_id` bigint NOT NULL,
  `characteristic_id` bigint NOT NULL,
  KEY `fk_products_characteristics_characteristics1_idx` (`characteristic_id`),
  KEY `fk_products_characteristics_products1_idx` (`product_id`),
  CONSTRAINT `fk_products_characteristics_characteristics1` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_products_characteristics_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_characteristics`
--

LOCK TABLES `products_characteristics` WRITE;
/*!40000 ALTER TABLE `products_characteristics` DISABLE KEYS */;
INSERT INTO `products_characteristics` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,9),(2,10),(3,2),(3,3),(3,4),(3,6),(3,7),(3,8),(3,9),(3,10);
/*!40000 ALTER TABLE `products_characteristics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
