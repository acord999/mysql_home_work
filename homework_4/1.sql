-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--
use vk;

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'omnis',38),(2,'qui',29),(3,'enim',38),(4,'quis',22),(5,'dolorum',30),(6,'mollitia',21),(7,'et',31),(8,'sit',23),(9,'omnis',25),(10,'laudantium',24),(11,'a',38),(12,'fugit',22),(13,'quam',40),(14,'officia',40),(15,'modi',29),(16,'fugit',38),(17,'ut',38),(18,'corporis',28),(19,'at',22),(20,'ea',23);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (21,28,'requested','2013-08-04 05:13:00','1981-04-20 18:49:48'),(25,21,'unfriended','1992-12-24 07:06:16','1984-03-20 16:01:23'),(28,29,'declined','1992-08-16 05:53:40','1986-10-05 01:18:34'),(28,38,'declined','2014-05-31 07:38:59','1986-11-10 04:34:53'),(31,25,'requested','1998-07-22 00:48:01','2011-09-08 06:34:40'),(36,31,'unfriended','1987-03-01 23:41:37','2009-10-07 02:12:44'),(40,23,'approved','2011-01-30 10:05:44','2005-05-06 14:42:37');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,36,16,'1996-10-07 17:14:19'),(2,25,1,'1975-09-09 21:45:15'),(3,28,18,'1985-04-08 07:07:29'),(4,28,6,'2005-11-24 19:53:35'),(5,29,13,'2004-12-26 06:29:37'),(6,30,18,'1981-06-27 07:26:30'),(7,36,11,'2008-11-05 01:45:44'),(8,29,1,'2004-05-27 00:49:08'),(9,36,6,'2004-05-05 18:42:27'),(10,36,15,'2015-02-23 12:25:45'),(11,24,15,'1996-10-17 09:22:23'),(12,36,5,'1991-02-26 04:50:08'),(13,24,19,'2012-11-18 20:23:37'),(14,22,13,'2015-01-04 08:10:56'),(15,25,5,'2017-06-07 04:43:11'),(16,23,5,'2010-08-04 05:19:57'),(17,40,13,'1989-09-24 23:54:08'),(18,24,9,'1992-08-23 02:16:08'),(19,28,15,'1977-07-05 16:04:14'),(20,31,1,'1990-03-29 02:18:57');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,21,'Sint dolor et magnam aut modi nihil et voluptatem. Itaque voluptas dolorem consequuntur voluptatem. Odio ad optio et consequatur harum.','aut',0,NULL,'2022-02-09 11:54:47','1997-12-20 14:29:50'),(2,2,22,'Et voluptas accusamus autem aperiam quibusdam. Laudantium odit reiciendis voluptatem ab nemo voluptas. Et illo saepe nobis voluptatem nam. Explicabo possimus distinctio nulla ex fugit sint. Illum quia commodi voluptatem non doloremque veritatis.','alias',4,NULL,'1977-10-28 18:03:20','2016-08-05 20:34:37'),(3,3,23,'Repellendus similique iste repellendus quaerat fugit ab. Omnis temporibus suscipit provident accusamus. Culpa et maxime magnam maxime.','dolores',938,NULL,'1976-02-24 13:19:09','1989-09-27 16:36:27'),(4,4,24,'Veniam dolorem mollitia autem nulla commodi qui. Aut assumenda enim qui perspiciatis. Qui cumque debitis corporis fugit et.','earum',38,NULL,'1998-09-02 05:22:46','1971-03-10 02:21:20'),(5,5,25,'Vel minus et nesciunt repudiandae. Corrupti itaque et aut autem corrupti quia. Fuga voluptate eum nisi nostrum eum.','rem',0,NULL,'1990-04-16 00:00:38','1984-01-30 23:00:51'),(6,6,28,'Excepturi quas sapiente est ab aut id tenetur. Est deleniti cupiditate enim enim ab.','ipsum',24,NULL,'2019-07-23 15:37:13','2008-02-17 15:46:19'),(7,7,29,'Ullam eligendi delectus consectetur quo sapiente voluptas sit. Cupiditate repudiandae dicta autem ex ut et laborum. Ad esse ab in vel. Reprehenderit reiciendis sapiente cupiditate suscipit laborum.','corporis',51,NULL,'2004-12-06 12:42:31','2005-06-24 07:01:39'),(8,8,30,'Voluptas dicta repellat molestiae saepe. Qui necessitatibus voluptatem soluta cupiditate. Possimus eum eum exercitationem recusandae officiis.','suscipit',1520756,NULL,'1998-09-07 08:42:15','1994-01-14 08:37:00'),(9,9,31,'Quas perspiciatis similique rem cumque enim suscipit. Omnis sequi repudiandae sapiente commodi occaecati. Porro sit est atque quas.','minima',0,NULL,'1991-08-27 15:46:34','1999-11-27 05:49:44'),(10,10,36,'Expedita qui id inventore corrupti. Itaque vel delectus a molestiae cupiditate. Modi autem cum atque esse rerum consectetur sed. At debitis nisi consequatur.','sequi',1497,NULL,'1971-02-02 23:55:09','1991-02-16 20:33:41'),(11,1,38,'Quae porro consequatur nihil recusandae voluptas aut. Ex rem error rerum consequatur minima iure dolorum quos. Error dolores natus amet saepe aut aperiam laborum. Hic dicta atque corrupti molestiae.','vel',29829,NULL,'2003-04-12 05:31:21','2015-08-20 11:23:25'),(12,2,40,'Dolorem voluptas sequi nisi iure ullam. Qui sed aperiam consequatur sit perspiciatis. Aspernatur voluptas quae dolor possimus occaecati. Delectus hic optio exercitationem consequatur ea.','debitis',98,NULL,'1980-06-14 22:33:59','1987-03-16 23:27:23'),(13,3,21,'Consequatur laudantium autem excepturi sunt hic doloribus sapiente. Aliquam unde impedit perspiciatis officia ea nobis quibusdam dignissimos. Laborum libero ipsa eaque nihil doloremque culpa eius.','ea',732725,NULL,'2002-12-20 02:05:59','2006-04-13 17:23:53'),(14,4,22,'Cumque omnis ut ut dolores eos. Sed dolorem corporis sint ut porro dignissimos facere sit. Aut libero provident et. Asperiores itaque laborum magni corporis sed odit.','qui',335,NULL,'1991-10-07 22:10:15','1993-05-12 16:04:04'),(15,5,23,'Illo voluptate facere vel tenetur reiciendis optio. Dolore incidunt velit ad id ut. Facilis dolores iusto sunt saepe.','quia',399686,NULL,'2022-05-24 11:31:53','1993-03-10 19:03:51'),(16,6,24,'Quibusdam nostrum blanditiis deserunt quae. Quia a repellendus sint ducimus. Laudantium veritatis mollitia nesciunt quas eos.','deserunt',0,NULL,'1996-12-08 11:18:09','2011-01-08 14:32:49'),(17,7,25,'Non debitis vero eligendi nulla nemo. Esse sit voluptatem odio rerum vel iusto quia. Quam velit aut et et quam dolores. Ex harum et voluptatum natus rerum laboriosam.','eos',1234,NULL,'2009-10-08 13:54:29','1973-06-20 18:44:54'),(18,8,28,'Unde amet expedita animi totam molestias. Eum sed sit eius accusantium. Quod voluptatem eligendi tempora quas corporis ex.','voluptas',0,NULL,'1995-12-31 12:17:22','1984-03-10 07:34:20'),(19,9,29,'Eligendi ad omnis nobis. Rerum aut optio sed. Perferendis veniam aut consequuntur. Omnis ducimus quod libero quibusdam.','omnis',21356,NULL,'1977-11-07 15:32:25','1996-03-02 09:07:34'),(20,10,30,'Ipsam voluptatem ut quia rerum. Cum optio rerum et. Est aspernatur repellendus fuga culpa vel.','nobis',4547788,NULL,'1979-07-10 01:34:50','2016-03-22 17:59:03');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'fuga','1988-08-19 03:27:35','1975-08-27 23:19:58'),(2,'incidunt','2002-10-13 19:46:48','2010-04-03 06:43:23'),(3,'molestiae','2014-11-03 06:11:59','1990-05-07 07:12:14'),(4,'dignissimos','2003-01-23 14:02:08','2009-07-06 14:21:56'),(5,'voluptas','2017-03-30 13:11:49','2006-01-23 03:30:34'),(6,'corrupti','1997-02-04 20:46:50','2009-03-18 19:49:04'),(7,'occaecati','2007-04-14 17:06:55','1998-08-15 15:55:50'),(8,'eum','1983-11-09 15:54:23','1977-01-22 16:48:36'),(9,'rerum','1985-11-25 02:11:38','2014-12-19 18:17:52'),(10,'eius','1979-02-01 12:12:43','2018-07-29 11:33:43');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,25,30,'Reiciendis et sequi officia non. Maxime ut soluta atque nulla est et blanditiis. Odio sit distinctio explicabo officia qui. Consectetur eaque alias et repudiandae amet culpa.','1972-10-10 15:48:12'),(2,40,24,'Eaque aliquam et praesentium et similique sit. Est sunt quas facere fugiat voluptatem veniam. Eum dolores veritatis voluptatem recusandae id esse voluptas. Aut rerum et consequatur voluptatibus.','1998-09-17 21:50:09'),(3,38,28,'Iste et tempore a quis autem placeat. Atque quia reprehenderit aut minus corrupti et. Natus laudantium cupiditate eum ex.','1988-09-30 20:58:20'),(4,29,31,'Quos voluptate qui quia nihil voluptatem sed. Explicabo atque voluptatem dolorum blanditiis quod harum. Et dolor enim quia reprehenderit dolorem. Dolores quis aperiam neque eligendi id veniam nihil.','2005-06-11 11:03:16'),(5,36,25,'Ea harum dolorem omnis sit enim ipsa. Dolorem veniam sed enim. Et eos aut odit iusto. Excepturi nisi atque quis sunt impedit dolorum.','1979-11-28 23:19:23'),(6,23,25,'Inventore et architecto quod eos consectetur. Aliquam dolore labore tempora voluptas.','2015-06-22 19:03:52'),(7,24,22,'Culpa est enim sed suscipit quia aperiam sed in. Corrupti aut enim corrupti et blanditiis. Sed ad omnis aut perspiciatis qui.','1990-04-20 16:26:32'),(8,28,31,'Sint at dolorum tempora culpa. Molestiae eos enim dolorem et mollitia accusamus. Veritatis asperiores distinctio harum praesentium consectetur aut consequatur.','1983-09-24 23:59:31'),(9,24,29,'Consectetur ducimus et est aut laboriosam aut aliquid. Voluptatibus cum delectus corporis omnis maiores quia.','2003-06-16 12:21:27'),(10,28,38,'Voluptate minima dignissimos provident quos. Blanditiis nihil et et ut eius quis. Delectus quia cupiditate facere vitae provident ut. Veniam ipsum natus et.','2005-02-12 08:51:23'),(11,21,24,'Eaque soluta illum incidunt ut omnis magni facere enim. Ut aut et nisi maiores voluptas iusto illum officia. Ducimus fugiat facere recusandae odit et.','2021-07-06 00:41:46'),(12,31,21,'Corporis neque ad magnam porro. Sunt libero eos doloribus iusto aliquam enim occaecati eos. Cupiditate autem qui voluptas reprehenderit atque necessitatibus pariatur. Tempore dignissimos accusamus consequatur dicta eum. Magnam provident in non delectus.','1993-03-18 21:27:34'),(13,22,38,'Rerum voluptatem in impedit rerum qui. Alias praesentium quo dolorum ut odit. Facere officiis est explicabo et voluptas. Tempora iste ut ea eos voluptate.','2004-08-23 06:27:11'),(14,38,24,'Temporibus quis facilis quae deleniti. Voluptatum similique et officiis aspernatur. Dolores placeat ut sunt. Reiciendis sint et accusamus dolores non amet.','2012-06-20 21:56:45'),(15,30,29,'Molestiae impedit perspiciatis labore illum et tempore sequi. In explicabo modi ipsum architecto quis quia. Quia cupiditate aliquid vel.','2017-11-25 10:51:03'),(16,38,40,'Eveniet ipsa dolorem tenetur magni ut. Deleniti facilis nostrum fugiat placeat. Iste totam qui veniam nostrum repellat quam quasi similique.','2006-06-20 11:28:33'),(17,22,38,'Id quibusdam ullam ut. Reprehenderit perspiciatis rerum dolores nostrum voluptas. Quo accusamus provident perferendis nostrum dolores sit provident.','1993-08-28 01:12:23'),(18,24,21,'Consequuntur facilis incidunt sit. Aspernatur velit laudantium itaque sed magni. Odio deleniti sed tempora iusto. Officia deleniti ut culpa. Aliquid et laboriosam optio repellat qui repellat.','1994-05-30 06:19:41'),(19,24,36,'Deleniti quis sint maiores. Dolorum placeat tempore sapiente dolores in. Temporibus et autem saepe amet nihil.','2007-12-30 13:13:15'),(20,36,21,'Quos voluptatem in non blanditiis. Laudantium nisi delectus quis consequatur aperiam impedit sunt. Saepe quos voluptates ducimus.','1988-07-08 05:21:48');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'consequatur',23),(2,'et',40),(3,'labore',21),(4,'deserunt',25),(5,'fugiat',22),(6,'delectus',21),(7,'aspernatur',40),(8,'ullam',40),(9,'ut',38),(10,'nostrum',36),(11,'commodi',22),(12,'non',31),(13,'dolor',30),(14,'ducimus',31),(15,'aliquid',36),(16,'rerum',24),(17,'quia',25),(18,'reprehenderit',23),(19,'doloribus',40),(20,'eum',21);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,10,2),(2,7,16),(3,11,6),(4,1,15),(5,19,4),(6,20,12),(7,9,16),(8,15,19),(9,1,14),(10,13,15),(11,15,16),(12,14,20),(13,5,11),(14,4,4),(15,10,7),(16,20,20),(17,8,6),(18,15,18),(19,11,15),(20,13,9);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (21,'M','2001-04-24',13,'1984-12-04 05:00:44','Port Edwinabury'),(22,'M','2016-04-27',14,'1993-10-01 08:55:41','Wunschmouth'),(23,'M','1986-03-23',16,'1992-09-30 16:00:17','Port Allisontown'),(24,'M','1993-09-02',13,'1998-09-23 01:18:46','Judeport'),(25,'M','1987-11-27',1,'2020-10-09 02:56:51','Lake Prudenceton'),(28,'M','1992-04-29',11,'1993-09-04 12:40:15','New Dallasland'),(29,'M','1980-05-05',16,'1992-07-30 05:30:12','Shaniebury'),(30,'D','2021-02-23',2,'1994-09-11 21:49:44','North Augustus'),(31,'M','2000-04-05',2,'2015-08-27 09:44:35','Virgieshire'),(36,'D','1974-08-16',16,'2005-10-11 14:47:03','West Kristoferland'),(38,'P','1999-12-19',20,'2001-10-08 04:59:55','South Amelieshire'),(40,'M','2009-07-30',18,'2015-07-22 18:47:31','Kemmerland');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (21,'Alvah','Wiza','adah17@example.org','83adc9c6972bc583eee3e71b21879c906176618d',25),(22,'Jacques','Bogan','wkertzmann@example.net','85df9db81970967ea54086a7d346cd2669f25a49',9587003056),(23,'Reagan','Buckridge','sylvia.roberts@example.com','14c0470baa24d8156c22add3a420fd7a95bc8e4d',863),(24,'Lenna','O\'Kon','viviane11@example.org','0e658f31d9e9d1f78e784d285d834bbf3ba6207e',655),(25,'Zelma','Dietrich','thoppe@example.net','13f02e5bf5eb87ed7af77866f12f30cc2747153a',1),(28,'Roxane','Nolan','fisher.stewart@example.com','38af9939b68c7a18e66eb8518ced4382bd77ac1a',466118),(29,'Jeff','Langworth','deontae.bahringer@example.net','b0dc43a1d2f723c6270660f0eca76be1b7f653a6',0),(30,'Jude','Zulauf','kfunk@example.net','fe10ece1460263d6ace16fa5e3fe3595706e8dbb',78),(31,'Liliane','Zemlak','paul22@example.net','2237dd5c681f6b47b8d0713a518dce6d58b4d4b0',91),(36,'Kristoffer','Schneider','trevor.ankunding@example.com','54de981f7c037c5cdd14cd665e121fffd17b513e',382367),(38,'Ed','Thiel','sporer.kaylah@example.org','d969c2d221ff83a9276fa93664c9037b1b930047',1542374540),(40,'Aida','Thompson','bechtelar.antwon@example.net','9fad827fd0fb4fc143c57c86a947a629f288c167',778354);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (21,1),(21,17),(22,8),(22,13),(23,6),(23,8),(24,13),(24,15),(25,5),(25,16),(28,15),(28,19),(29,4),(29,5),(30,11),(30,16),(31,3),(36,20),(38,2),(40,1);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18 10:52:40
