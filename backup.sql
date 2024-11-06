-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

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
-- Table structure for table `automations`
--

DROP TABLE IF EXISTS `automations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `prize_id` bigint(20) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `number_of_winners` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `automations_campaign_id_foreign` (`campaign_id`),
  KEY `automations_prize_id_foreign` (`prize_id`),
  CONSTRAINT `automations_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`),
  CONSTRAINT `automations_prize_id_foreign` FOREIGN KEY (`prize_id`) REFERENCES `prizes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automations`
--

LOCK TABLES `automations` WRITE;
/*!40000 ALTER TABLE `automations` DISABLE KEYS */;
INSERT INTO `automations` VALUES (6,21,27,'En cours','every-30-minutes',7,'2024-10-28 15:04:57','2024-10-28 15:04:57'),(7,21,28,'À venir','every-30-minutes',7,'2024-10-28 15:07:48','2024-10-28 15:07:48');
/*!40000 ALTER TABLE `automations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'MAGAL','fete religieuse','2024-07-03','2024-07-28','2024-07-23 08:24:29','2024-08-14 11:50:48',1,NULL),(2,'FIN D\'ANNEE','FETE musulmane','2024-07-03','2024-07-13','2024-07-23 08:38:10','2024-08-27 16:03:26',1,NULL),(3,'FETE','fête','2024-07-03','2024-07-23','2024-07-23 08:39:29','2024-10-03 12:18:08',1,NULL),(4,'EID','fetemusulmane','2024-07-05','2024-07-25','2024-07-23 09:50:19','2024-09-25 10:39:10',1,NULL),(5,'EID','fetedesmusulmans','2024-08-23','2024-09-25','2024-07-23 10:12:44','2024-10-23 15:03:08',1,NULL),(6,'GAMOU','fetedesmusulmans','2024-07-04','2024-08-15','2024-07-23 11:56:51','2024-10-28 08:44:59',1,NULL),(7,'TAMKHARIT','fetereligieuse','2024-07-04','2024-08-15','2024-07-23 12:15:01','2024-08-07 11:39:01',0,NULL),(8,'NOEL','fetemusulmanes','2024-08-06','2024-08-31','2024-07-25 12:31:31','2024-10-03 12:23:53',0,NULL),(9,'OUMRA','pélérinage à la mecque','2024-07-19','2024-07-21','2024-07-25 14:29:57','2024-07-26 07:28:31',0,NULL),(10,'TABASKI','fete','2024-07-13','2024-07-27','2024-07-26 07:26:37','2024-07-26 07:27:42',0,NULL),(11,'KORITE','Fete','2024-08-09','2024-08-30','2024-08-07 15:19:31','2024-08-07 15:19:31',0,NULL),(12,'FETE','Fete religieuse','2024-08-09','2024-08-30','2024-08-07 21:35:51','2024-08-14 09:47:06',1,NULL),(13,'KOOR','ramandan','2024-08-09','2024-08-25','2024-08-13 09:12:03','2024-08-13 10:25:26',1,NULL),(14,'DECEMBRE','FETE','2024-08-02','2024-08-15','2024-08-13 12:40:24','2024-10-03 12:28:16',0,NULL),(15,'Maouloud','FETE','2024-09-19','2024-10-06','2024-09-29 19:30:41','2024-09-29 19:30:41',0,NULL),(16,'Ouverture','physique','2024-10-07','2024-10-26','2024-10-06 15:21:38','2024-10-15 11:44:50',0,NULL),(17,'Rentrée Scolaire','physique','2024-10-10','2024-10-27','2024-10-06 20:05:52','2024-10-15 11:51:47',0,NULL),(18,'soutenance','physique','2024-10-18','2024-11-30','2024-10-15 11:43:45','2024-10-15 11:44:19',1,NULL),(19,'Voyage','physique','2024-10-18','2024-10-25','2024-10-15 11:50:51','2024-10-28 08:45:09',0,NULL),(21,'YAKO FA AMM','physique','2024-10-29','2024-11-20','2024-10-28 14:56:48','2024-10-28 14:56:48',0,NULL);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (8,'0001_01_01_000000_create_users_table',1),(9,'0001_01_01_000001_create_cache_table',1),(10,'0001_01_01_000002_create_jobs_table',1),(11,'2024_07_09_100747_create_roles_table',1),(12,'2024_07_09_101102_add_role_id_to_users_table',1),(14,'2024_07_09_121444_create_users_table',2),(15,'2024_07_15_090522_update_users_table_make_name_nullable',3),(16,'2024_07_15_142544_update_users_table_make_name_nullable',4),(17,'2024_07_22_083159_create_campaigns_table',5),(18,'2024_07_23_073443_create_campaigns_table',6),(19,'2024_07_23_163022_add_archived_to_campaigns_table',7),(20,'2024_07_30_083316_create_prizes_table',8),(21,'2024_07_30_083317_create_tickets_table',8),(22,'2024_07_30_083317_create_winners_table',8),(24,'2024_08_07_125642_add_archived_to_prizes_table',9),(25,'2024_08_12_092657_add_type_to_prizes_table',9),(27,'2024_08_27_083814_add_phone_to_tickets_table',10),(28,'2024_08_27_085826_create_event_tickets_table',11),(29,'2024_08_27_110616_make_campaign_id_nullable_in_tickets_table',12),(30,'2024_08_27_110753_set_default_value_for_campaign_id_in_tickets_table',13),(31,'2024_09_03_162042_add_attribute_winner_table',14),(33,'2024_10_24_104354_create_automations_table',15),(34,'2024_10_28_103413_add_status_to_automations_table',16),(35,'2024_10_28_125026_add_automation_id_to_winners_table',17);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prizes`
--

DROP TABLE IF EXISTS `prizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `prizes_campaign_id_foreign` (`campaign_id`),
  CONSTRAINT `prizes_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prizes`
--

LOCK TABLES `prizes` WRITE;
/*!40000 ALTER TABLE `prizes` DISABLE KEYS */;
INSERT INTO `prizes` VALUES (1,'Smartphone','Physique',2,'2024-08-07 12:29:28','2024-10-06 15:46:28',0),(2,'MOUTON','matériel',6,'2024-08-07 12:50:52','2024-08-14 17:04:02',1),(3,'Velos','matériel',3,'2024-08-07 14:45:54','2024-08-28 08:34:33',1),(4,'Voiture','Physique',2,'2024-08-07 15:49:29','2024-10-06 15:46:21',0),(5,'Jezner','Physique',10,'2024-08-08 10:06:06','2024-10-06 15:46:13',0),(6,'Sacs Pomme-de-terre','Nourriture',4,'2024-08-08 10:08:11','2024-08-12 09:53:18',1),(7,'Parure en or','Physique',10,'2024-08-08 12:21:11','2024-10-06 15:46:04',0),(8,'Billet Pèlerinage','Physique',9,'2024-08-08 12:23:50','2024-10-06 15:45:57',0),(9,'brodé','Physique',5,'2024-08-08 15:57:04','2024-10-06 15:45:50',0),(10,'Lakhassay','Physique',1,'2024-08-09 11:22:48','2024-10-06 15:45:40',0),(11,'Fruit','Physique',1,'2024-08-09 11:25:36','2024-10-06 15:45:32',0),(12,'Iphone','Physique',2,'2024-08-09 11:32:54','2024-10-06 15:45:17',0),(13,'télévision','Physique',12,'2024-08-09 11:33:51','2024-10-06 15:45:02',0),(14,'Poulet','Nourriture',4,'2024-08-09 12:20:51','2024-08-12 09:53:29',1),(15,'FETE','matériel',5,'2024-08-09 12:36:29','2024-10-01 13:07:04',1),(16,'Cuisinière','Physique',2,'2024-08-12 09:43:33','2024-10-06 15:44:49',0),(17,'Brodé_lafaya','Physique',10,'2024-08-12 12:00:33','2024-10-06 15:44:41',0),(18,'Iphone 15','Physique',14,'2024-09-02 10:13:01','2024-10-06 15:44:31',0),(19,'Climatiseur','Physique',14,'2024-09-02 10:13:54','2024-10-06 15:44:22',0),(20,'Macbook','Physique',1,'2024-10-03 15:50:07','2024-10-06 15:44:13',0),(21,'Souris','Physique',5,'2024-10-03 15:50:35','2024-10-06 15:44:06',0),(22,'clavier','Physique',1,'2024-10-03 15:50:48','2024-10-06 15:43:58',0),(23,'Sacs','Physique',16,'2024-10-06 15:41:19','2024-10-06 15:55:10',0),(24,'cahier','Physique',17,'2024-10-06 20:08:23','2024-10-06 20:08:55',0),(27,'Free Money','Non_Physique',21,'2024-10-28 15:01:17','2024-10-28 15:01:17',0),(28,'Bundle','Non_Physique',21,'2024-10-28 15:02:24','2024-10-28 15:02:24',0);
/*!40000 ALTER TABLE `prizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2024-07-10 08:49:59','2024-07-10 08:49:59'),(2,'user','Regular user','2024-07-10 08:49:59','2024-07-10 08:49:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0RkJpJ4ycqML3bfFtf48UiZEC3JR4TGVYMd04fgK',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUhXY0pydlVEVWFWc0I0dDNqejVKdE9EVkxGMkFpUHQyMkVudU9ObyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202980),('1C0bPRCCwltuTe5MTrKbjTLK8e3M8ekcEfMW4WOn',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1RZQW0zYWdmVE54Mll5czhwZlFrNFJTQmdxbXE3bkc2QmZRb2dvTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203010),('1EerVNsNRoIovFb4lnH8x9Pai9n5rXFL5fI50sou',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHJqbm5vUDAwakl4cVdva2tPMVdlNmg4dmlaMmJFWmF5dWNGVG4wOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202990),('1Kd6DTNbXgy9ae9o2sdf3ctsIXK6yhKijLKQulC4',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMERicG82VmNyd1Nod1JobXNLNm1HSDduM2k2UTdFZDZNSzUzWWo3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203007),('2CMxAU4obJBRv1LNQbTtx0k4WcirVmWhyLkWuvmD',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUJiUTNlclZsejNnZEthTlBnakhqa2pHeGhxTEYwU1BIT3ZSd0R1UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202973),('2gKj0LJA5WkOiwt6FuyHfRWevVknQbY2YqFerZ85',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0duMURncHlVb21mcGRVcDNOUmZrWFoxSWxHSVFuZnRjeklBVmIwdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203013),('2ISixcTjzWCDtduFfgURbt5WiHch1XglL8IUhbaC',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUdJWWVRdDRHd0xvN3ZiczJkQThHT29tWE16cmZIUXhnbERHT3RCRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202989),('30UalhRteDkasU3DJt3SNvFBfXj7PvnEXXE4DNaj',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEhqUG8ycE1mclJEcElMU2tsZFJOYmtCdFNwcDJlRmg0Y3p3b1pzeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202975),('3fOukuOM42fK53LbsHByYL3JtENGOjCemWjismtI',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlBlZ205ckVtelR2ZkRkSnlibVU3U1gwUkN4YWlBWXlJT1JQOXhMTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203008),('3jQ620QOP6fXLt6P6DuXuokHoZZFkiYZdgWqF69z',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWZVb0kxT2FkVFNWU0xhbEVpMHdMdXBmZ2UySThjSURpNlNBalF6eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202985),('4h9UUqZwtnTWVC9QdIS0TlKEZ1zhtv84g58BBFGw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXhQYlhzaFdGdHg1NVMxdnRoRHZsM2VWMTZTeWVZRVVyYjduaWFoNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203001),('5eHVbGa0GOoWNxqsYKEvph0KWd4coHssgwp1LjcX',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGYzZjZlMlRLZ3FjY0N4ZGIwRTlENTNxTVVCdXF2S01jSUQ1bWVKZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202978),('5jDzzCzKMm03GGCuHIlQKg9VGLMNpNYbwcO16o1z',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicmljMFFjaU1YTkJoYXg2WnF5bmxPN3R1ZFJlS0RBMGJmb1JQMXpKUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202994),('5RbmaTeTyPiN7EUF28cXlW0j5uYItdbTI21m2exD',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiblcwVEtNY1NrUlFyb0pvVUFDcDM3bjV1cnI1bXU1ak9YeWZRNWgwayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203008),('5UWrcEJLKS0Kp5C0DM22F8jwNS4b6NQVhMEIyLRG',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0JxQ2lzdkxZMjN5NE9SQ3lBVmVMWjFQQ2xZZFpMQ0hoY0RSUjBIVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202983),('6bKcsfvKR0G8vbSe3h0NfA8yXxiuxswzSTqXB9cH',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3JxMkdOaWh5WVRlNm50TDY1bFFERDQydjV4dDgycGVrQzBrOURFRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202996),('7GHNZbqvYp0aHWTu4Su584qskQWxJiyqkPaDJYOw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkpLa21WTjE3Z0IydERqNGFsbjFpVnNtMHJHRDd1Tng5TU5ZM2NFViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/eD0lMjQlN0JqbmRpJTNBZG5zJTNBJTJGJTJGTURFRGlzY292ZXJ5M2QwZjZkNTc1ZnhQYXJhbS04MDAwJTdEIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1730203010),('8m1qYkKL3E7gSMqSPcpOdLK9o0D9hyagoB6vQ79i',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoianlKeVlhYVlVSWY3eHp0QTl3cnhrSkhqdGtzdDJkaUVHU3JGOWNCMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202999),('A4MJ2Ir0e6bugIG0v8gI2pQZbudd3eH8YEh4Udfd',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoielI5cGNzYmlsYnJJcUJsZmkycHhBRDE4bmJPOWU1OUJaWkNqa1FaMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203014),('Agoj9686SyFxQReSfLn6LDvsHcXUg8rtwl0MQQv6',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieW1oaXhmMnY2ZTNQcFVsSXcyenBXSkJmOFJiSE5XZlN2c2t5UGRURiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202966),('BJFbj5jCnog5lGiYx6aw9kr9hYAQJu4tEMOwuzuA',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoielZubHZSNnluQ24zVGNpVFM5Y0xKSVA5ODRQU1ZPVjRXazRlaWZyMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202975),('CANiUCNYTNQVASMnEUs0gtfmA8BUji5iTOEmKpHN',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ01wcU15UTNDeElHcGJHN2hzQTR0Rnd2MnlVZGI1enE2Y3JaeFpwQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203001),('Cnci5J3t26uGWu2tO9w22k6IIslcJ6pBlKySF0vK',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0k0d0ZMU2psM1FaUHBnZE5QZmc4dmRJN1ZZQldpaVZnS3JhWWdtaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202986),('CtjlGv3P08A9aiupX0KTSvkDSS5C5Lq3eZT5ECwW',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUpHT0RVR09nM1E4aWZ5dzZTWnc2WEpQNW43QklvbDB6amFhUTFndyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203000),('D149mF8MJi5ozLivBqei3nVzxl4jyPhrxPv27dl2',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidTJGbGtUekkyVTRoZmRodEZib1Nmb0xnelh1Y2t4dThDVlVMQVdNbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203014),('D1lE9oCtrwxzPQwZzHxrCLCa9LAnFfT7zKDNgeHw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFU4eFB0QU9WMWhIUjhWdm95ZHU1VTVUbWI0Y29YM3E3SjBveEpnOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203009),('D3eaW2hiIga7LNzj9cFcK33S1J8fmrQtZlpgqKLD',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3d2RFViZGVoazhERlVwQ0VIRTlualhlZW9MSzdKVEd0ZkhsZkVvbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203010),('D9iGQ4Oo5T9vjrGk7QPf5Na5MewNqGXnsWwSE9hA',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDhmRnNFa2JIZ2FJRG5nTkZuRVZQTmpCeUZrMk1CYjJVTmNiMk00MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202981),('DdJTjr6LFrmXMNWDXy1JuNeNckSOEsjQbf8bIPq9',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHU2VlpSM3psMjFjQVRnc2o2VUo1dzBlaW44SXF4eHVmTkxWUXJLZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203002),('DhqarwBKboeng6FyGqJvW53JQbULrZoqoFLYvQdh',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWl4YmQyQ2FoZ1RhbWRKa3BtUGRTOE9OcUF4U0JKWGhySmF5NEFKbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202994),('eHEY2TIWdBmLncydQcvTU5X6TPh7J1IQ0mf1Pk2N',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidDJWaVR1UVJCaHcwMGVXRjZLblR4SFZyclJZa1d2NklybDY5WWhkRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202997),('Ehg1lxWWRbA1y667lB2XOHVWeLrwSRRbRppqvEhx',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVdhUkRpOWdoR2lDN0JmaGoyT2FxVlNoTGpOaEJGbUpoSHVEMFJGdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202982),('ewv6VljOvC4MVLv5KcB2rn9Dx0iqdvj7ntKsT83N',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYm0zcmxCbEEyT3hNT2tBMTM3QjdzaE1XY1ZLd05BQXVMWmUzMWV1TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202980),('FM3N5MhQmfY88TTAP0bzDb89APpDQOmWwqWp7cU2',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidHdva2JPQ0lQWVZ1WGZRRTVpYk40SnhUSlhIc1Fud3VrZlJJTDdxcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202984),('fqvZAZSlmD2Lex38HVh26VXM3LukHs6RtF2B9pEg',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHlLZzZLZXBHZGc2NG1JdE1pVVZPU3pnTnpIRVE2ak9YVkh0U2ZLRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202979),('Ft4gyaH1sN0K0FcZ1AJgD7340AkGZ5meRWbfYQEA',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUnZzdHJWQXpYNzdxblBTOXlNOEhWS2RNRmp6QTI4eE1yZHJmRmQyRiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3RlbXBsYXRlIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730287198),('FUke62BUypKHO7Fw515eUyW2wf0Othzokw0qpvXD',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiVXJRR2xPZzBvaEYyT0Z3bHdDMjlNUkUyYmdwNE5TaHZ0WGp1NjlxaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1730203015),('G5aqAwWqWDtQlF8NsBtdA3c9p7mj0c1BSxurLiiQ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXplYTcwaklURDZTMW1vVXZ4MXNDSlZOOWlBYURUaWppMmFoY3ZqTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203004),('geztoq24EFsTcp04uLYh522cYYhQ3hxSojvkAPLW',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzVxbWdoYmpCMTlnRnBkRHg1ZkVSUmd4c29lUkdmWjlHM0twM0Z0cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202988),('Gjg0MOwLrq3s4KZcpJPYuMPcYmClaYEi1A4AcIDw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoickNabkVCWDBRU3RyYUtMeDVPSUtZN1FCTFFHdVNaV3MxNmZLRmg2VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203012),('GLZ7hOh8gP93kH1C1KmPgsJFNsv5wkh7U2CEvvr9',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiamFVWDBGbkQ2YkFHdUNGUWpzaXdCTlJvMG84NGpXRjZsOFpISzRMUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202985),('HDBUbxaLYS4diGIT9ZdqJcrPll5fXt2j1OxHGd2J',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiazdyODFPSThCZlNKOHZMemVhWGtaa0xTd0NjUlVuSWNkNzNucHhDUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202996),('HGKwXMubrYEgQLyxLCpUhvSt2DLArYGamiNMu4fn',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidDBaWU9Mb1lKRTU2eXFmM1drczdmdVJJeTBwUXZPamxmSVpHeFc4UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202990),('hotnNcMQb83OcFFgrbJBlQWpi05pS9sZQ6WTo96t',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibFRrVjFlQmdITVB0dHZZY1doamNkTU5pV0gzVG9EWjg5cmJ4U1dudyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202992),('i2KF4p9rQ0ZK31iNUyaiIsbxeQOkVdud0czqtsnc',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWsybXU2dG9qQjBjejlFUnB6Q3lmT3pTVko1d1R2UGhScnl4WFRlbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202987),('i31HESCYogZkJfa60Zb4N6fcD5uT5pJB4hpvBJO0',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHE2UFZOd3h5enJiNzBKVldCUHN3MVlmemxrcTN6T0tsdmkzdFZMdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202994),('I7eBBn7Hu1u3PMc52RGOx0ahqDt3HygrvyBTNDzi',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiS3FMZTdMMko4dENmMzVjWEpDODZlY2ZuQXJ4bnpEam9VdEtlNURBRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1730202986),('j9i2VEYYfGxBX170fC03301Pwi8U3ETBIdQNleM9',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm9qa2VRNUVEenIwc2ZHVGd6eFBnYTh4RWJLU3lWU3E4dGN0WXNZZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202988),('jldiPQAkqL0r1wxRSYqnMfuWgLpHJADYqozwSDN5',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV0lESTA5Z2FERlgzaTlvTU1TN200NmNNZ3liNUk5QjVFU0xaaTI4VSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2F1dG9tYXRpb25zIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYW1wYWlnbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1730208245),('JvZD7ObZrHjzL0lIthaCeU9uu5tuY9z6WMHO3dNU',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUZWS3dGOExqS3BUR3o2QnJwckhWRVczVzFuV0lHa1dTSW1DbDNDViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203005),('KaJT1jYKyzvtI4qdDIR5f5fFLPtsqlRgoSY0LAgl',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXh1VEVlNmZjV2VaeVJRRjJiSnBLb3ZRVWloTFpsbUdKck90R2loeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202990),('KLyRwRIp9kgVUE356ZOBHZxRisLwpI4gSyeG32oR',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidWl2cWdmVDV2dWVGeUN6cThGUWR2aURiOGh2VmFkanNCVUFuN0ZHcSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1730285754),('KOge80C9TA014rbvimxXEh1Q2YNbcqKn10PLBcDa',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQTgxN1luN1hlYmYyWk11SXpNejhseXlHR3U3d1pPZVBiM1oxbURuUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1730202989),('KyJYGUgwlCL1dtZmgdoYzYoefMCyb98kmNVTvVC8',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUhXRmFwSWhpaTV2WjlaWjR0QjhUcTNNSXhVMDJHcXoydHdkMWFoVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202972),('Mi621fl4wWX0dTEE4u8bvgu3XmoHkKHRNGP6XrsG',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW1md2poY2RRS28xaUVZWFNZNjlJdHlMeU5TU0RRNnQ1OU9VVnliVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203002),('nfhQsCfFQzRJbSftbh2zvWNHriBDW0b2fpZzvOYq',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFRDY1J2WGRDaGJ3SjRMWGtrQklTZGhNd3E2c21sMGY0aU05RmwyZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202975),('nfMso0FJohCGGdlVxjPmWsRxtkXtiP55nqsR9qyK',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUWc4cEZhOXlib0RMS3Y2MXIyamM0ZHhCTDVOcGhIaE04ME1PT2dycCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3RlbXBsYXRlIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730290538),('NNocmCGycUdh5nvpTnqiETHj3i9yI4YCxmKoUzTn',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoibE5VbnRWTkw3aDhXQzRLaVltVGJNRlJsYzhRM1Y0NENENGFkdmRHWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1730203012),('odTOPCk0DiCvvrEkhEn5zUHZ0ee9ftYZVvDRseaP',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib25CZWJsTmZQbjVuTW45bXNtalpGV0xOTWdQQTNOOWhFUW1QaHFmZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202992),('OwSFQIl48lRgvSkfLxIGxNT3bSOR46DBBXutvUqi',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVBHODlYcTlWWU9tSHdWZDdPa29zQVRLNXNFaGFJcnJpV1ozYXJHaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203006),('pi49SbVjFy7qcdfg9kz44dcsflLu92R4vizlQkWC',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWpzM0xqQ3BpMmFJZkQwR21vM2NtSzhUZUV6M09hV1l4UGFqSnd1OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202979),('q22XkGjm4yJMdQ1DWHGAE0rirIAWcAPyBkiyzYav',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG1MZW5JTFpGMUVKNlNmaXRpTmJmNDZFQ0FmWG9TR091QzhWSE15eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202993),('Q7Pyex4AMen2UCFLjKH3rkwCAIUK7wFKyrkg4KKl',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieEVXbGRlTWF1aHYzejFWZXRQMVJWU290MjBwaDV0bHl1dnpSbnM1byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202984),('QCed7BLUTFfnhTPzj6hNctv46vlefkKvfG6zNwcY',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFpIRzVpbENnZ0c2Snh0U0Q2UHlOeXU4aEdtZ0FjV1Q0azY4SENhbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203002),('QDGHHPNtEOiOotGndr3nGjWx9tCjSMJ6h8mRb6Sv',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWlUa0VWNG0wdEdWbW9NYUhpVDlhcGhyVWdib1VyMkZYZk9lZXFYRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202982),('QGw2j6UjYz50q2i8MXYaqgYHOO7Z7dbQP3hIjrAT',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU9ZbmtpN0V6d3d0N1Y2dGJBVnZ2MFdxWVNiM2Jqb2tWVWIzZkNzdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202991),('qquStpfHNKQML6i7C2q2TSYOltyobk4BGraF7PZ2',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlNuN2doM2I1OVNBT0Q5UDhQTHEyWkFscjdxcnhRaFQ4UXpVenZWNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203004),('QsWdqFua8FBbMAfSCDVfVYA9E1v8oEopsVFAjSnd',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1F1alhoZzJGQ2JsUm80WDhrak02SkNwdzJ5ZjRBODNkVTBDN0VQdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202996),('QtERgpNHlH0bvqsOgMib3vNmZNj5GbzFmiq9dLbM',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVdzS2xSNmUwNjBlU1VhSXJKS1E0cjVua3VRaUdLdTJyQ2RMaVROeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203014),('QvEDx9RovVHLsxwkJO9MD0LJEluYSoKiTfpSuIKE',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQXBQalhRZjF5bEp5TjRVc1YyUnpSNlpidUtUdkdwOUxSVk9BYml6QiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1730203012),('RjJGH6eq10FO2sOGdtphmrxR0dUMdGicNeyC5vOd',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieWppZEEwaDdtNnlwRVpIM3RPTlZ0N0dxNFhsRVl2V2d5bHZURlliRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202976),('RmmhbKeM28ex25F5WNVJlvMKdEBcbGG1VgxhUiui',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0ZQQ3EwdnJBbHBqUmhzR0ViWEs5WDRzZ1RFV1NtT3F4YTZRektUMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203008),('rOoboym6UqM7gb8SrEO1TJGPn461aydxE5g2XIQp',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVdmZk92eGltbWR1NGthYmp0TEdTSHRBbzE1aDJjdFhwNEdGVFd4ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203010),('rOPWhukCm6XeeM6Lp30UXG4eMERZp3OpsqOZswBz',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUE4dk5tbXJYZjBPY25XYzh3MVpTbWtyQnRsMWN2TXA4bm5STjFyMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202971),('rSWzV4eqN4o0jVKJ0pTlgh7EuZAaJiWwDQWkLNSd',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGwwaG1iMVE4ZzNQdGFqT3ZybjREUTlHSmFka3IyUHN2NDlCZEhpUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202990),('S3DYFPWqCMw6U2FubbI5E7NtC22VAwIqm51Moji9',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGxUNHVUZERNbmFnUGxXc3A3YUlrZ3NhNXNwdEFKdlJvckN6Z25KWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202977),('SD62WopenuzMs9CFfp0Qv3tgBUNf98Pfu14GMdHv',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnpCNW93SUtEUGxmekU1V05BY2REQlNwSmFiWkU1aTN2VTlBeVlWMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202973),('Se6WMSCaZqjNQGSUuM54WxBMtUw0b4Dzv4X7OAxN',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFN1cEU2UTNHZDZVc1ZXOHBFeE5tTkoxTHVNV09SWW54UU10eFp6USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203004),('SkCkAGegTm9bB6PB1dZaCrSTFX8ymWDqxZvGfrjX',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3N1NWlaYjBlbUV4SnZNeExpRk4yRnFMajNKcjZGTHJiTTd1VjN0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202999),('sqM6qRQ8oWcGHfaOEC5hFz90bWFy7n8uwb3bih9L',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDh6dUhxMHNvUUdTQVZZb3hvdmhmZlFrN2hGNVl0bzZsYmhsOGZadyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202966),('sy1I75ZLYtNSnajxPsWjXmqiVROW8cPUeW91TMuT',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3FlZVFhYnhwNHo4MFVXWjBlOWZ4OUh3Y2E0eHN1YnoxbXBCb0xSMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203013),('trZLp4xvxX7P1OX3tiuFAy8s98LHynKJRV8hGlPH',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibGlSTkFhazFCWHhaRkZJTU5HQkN6bk1wZFMycUNVbHAyRlJlSXlQRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202986),('uC3NIJdPpJIdSuu33YPLsC2E4FVIBMAezkmIGAuR',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnMyWElnOWNJUlFsd0Z4MGNueWkxSmtEREFjV0dEeUtwUEZXWnlUQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202984),('UpaNVmB0DzJfDE5S8FMmM7IUA4sOD8rNMJJpfLON',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0pYa2VHWlRsbmZtQnNwbzBDWVdSaWRtOXRBeXh1UG1rMlJNZVdvdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202966),('UPm4QJ5cV1iHyTaYt15M9as6l1Ga0lHjMmt5lzeN',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmxWVmdYaGlkUmN5NmRVRGEyZUFVVjlaWU43VlNZTUxuZXNRM3JQayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203006),('UQfPeNtEkiutSieRQZ8ymkiKTIicuwzxjDmjgKtW',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGFiRGVqOEZHZm1aOW9kcE1VWXB6TVl2WXdOMGE1cFdHQk1xdGtNMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202988),('uXY11vUp4BcufPCP5ECE08VqmmFXJff13SUltn4K',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicG9ubW1rTWJ1cjlTY0NjMnMzTXphOHhublFBc1JnUFdzU0Y1MGx3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202985),('VFzeNNeMh9TQrcNtPw7VLDaA2gNbsXyxtLzzSRDP',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0F3dDlub0s1Z0FGQ0dBTUVwSHJrRmVMQkJaaHVlbVdvZVVTVWlxQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202994),('VuNFAaYz9YFxJ1FcCKe2rg9I5wQcGrUBSFoJZesd',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGpROTc5bVJwU1k1SzF3TXlHcEpxYmdMSWluOThQeFZ5QVQ0VGpXNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202992),('w7o7bL1VEzjneBDuD7NRty2beDWnfqOjE5z1dmA2',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGk4dU9ac0R5ZWsyeXRtZlFpNkkwQ1VobmZlQkxqZDJQak11Z3MzcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202977),('WE8OIi0GArW0PvMUBbjO31e1DIi3MHa8eIiD7rIe',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlF1VTVUZTlxMlNmbWtsNGlla1pTVFdhTjVsd0Qwd09mcU5jZW5XWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202978),('WI7U2pqepBVaT5keUa8LhG7YSDMDRVxfMNLqZXCu',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEJWY2FNTzN0eDRIbXJUNmhGS2JJd1lRMzMzbEJRalFKMTlESkpVTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203007),('wLQ9F0VZozEL7CpqwoWwGeUHrXGxMXOOHTjHD2U9',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGhad1V4d1AzZGNMeDNoZjdmNUszbUI2UFdHeU1DMk02Z0lyR1JKTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203004),('wnXidjYwpyWDkaOt28gipyXC00AMduPrAOVlYdF0',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkwxRlhkUE1kbXRpbFBuN05xYlV0STRDcG5rN0R3V0ZOZTVNOWc4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202966),('WwSJSjAYlwlBKm75OvXfwFJ4ocDAxQmC71gtiutj',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnVtcWh1WFd3QXNBdERObmt0dVd4TDU4dTdEYmNocFZ0VDVqUFFQWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202995),('wzaewMkJYSSD0WrkgLp82CHbHJDSMt6xepNOkIxo',10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVkpvajNKblZvV1RaYjZTd3hiVUdwRXcwc2FoRFRDV3paTnF2Q1UyRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTA7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdXRvbWF0aW9ucy82L25vbi1waHlzaWNhbC13aW5uZXJzIjt9fQ==',1730219577),('x1lr0XfrJqEYz6VRD3TmE8oxnoq0YT7CfxbDxCiJ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGJZa2J0SnZZVDlYRTJVYmI0dUk3SkR0OEdPTmdITWFtSktWZ3B6SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203006),('XioyghsljtJOxpyLY8WbxlnNTYs4cw2LvUAp7DOF',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVdzMDFxT3VYYjVhbjdFWnJ6RFlLYXRRNG41SmN4NGlVZ3o3VkJhViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202997),('XNEJYqMFQp3G1VwUbwT6igqAy6vxQQ2DVgZWolw0',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGlZVDJlZGxHallscmhrRTVQanVVRzBPbkFSZzFzWEptN1NkZEtqaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203014),('XRLSTIwF5aWaORYmfLd5e1q1aOtDNCxlIOKH6JGx',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEplNTFjODc3OWZhOFFHR3QycWM2eFBZVjh2WmlRc0NvbUw2U1BuaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202992),('YLrbOsuiFuptRQgA6EZ5PgqmDirb8Oq5hCNu6WkY',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM20yMWZ3UllGVlNpSlM2ZmlsdEVHWXA0d0pYREhHdE5PaXNONjU4NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/dj0lMjQlN0JqbmRpJTNBZG5zJTNBJTJGJTJGTURFRGlzY292ZXJ5M2QwZjZkNTc1ZnZHZXRQYXJhbS04MDAwJTdEIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1730203014),('z2cgNwug0C9pwAWZJARkth36QWshD6uiFt4HDvWk',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG9la0F5bDFuaDMxMVp5a1FLMG1BY0pVazNWSWJWNnlLd1owY2k0SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730203008),('ZCUZ2Qo9Qnb2GatcGUdUBGUpTtJSsD5iz9Rd3TyH',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXNBRjRyT3BpTUgyYWFVUzRoOU9TdGJtQk1hUTU3R01WdGVVVzV2ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202999),('zkE6puKLbDKy0dJEJXANGPniREaHhZwmTSYIDb8N',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0ZFbGx1OFZlSFlPNFFCTjdQc1QzUnRHNkFWaUU1VGNKckUwZElzWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202999),('zNOSvHHVvn7N6VsGkqtABa5tPXLOpj5NNG07g3yS',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmZIYWY2V0I3UWdaRk5zNkVGMEJtY2RuNGpmSXlTYlZrdTBHcWZSQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1730202982);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'2024-08-27 11:10:47','2024-08-27 11:10:47','762549420',2),(2,'2024-08-27 11:11:35','2024-08-27 11:11:35','762549055',2),(3,'2024-08-27 11:12:11','2024-08-27 11:12:11','768531656',2),(4,'2024-08-27 11:13:21','2024-08-27 11:13:21','762551072',2),(5,NULL,NULL,'762551072',5),(6,NULL,NULL,'762551072',5),(7,NULL,NULL,'762551072',5),(8,NULL,NULL,'762551072',5),(9,NULL,NULL,'762551072',5),(10,NULL,NULL,'762551072',5),(11,NULL,NULL,'762551072',5),(12,NULL,NULL,'762549055',5),(13,NULL,NULL,'762549055',5),(14,NULL,NULL,'762549055',5),(15,NULL,NULL,'762549055',5),(16,NULL,NULL,'762549420',5),(17,NULL,NULL,'762549420',5),(18,NULL,NULL,'762549420',5),(19,NULL,NULL,'762549420',5),(20,NULL,NULL,'762549420',5),(21,NULL,NULL,'765554433',5),(22,NULL,NULL,'760006655',1),(23,NULL,NULL,'760006655',1),(24,NULL,NULL,'760006655',1),(25,NULL,NULL,'760006655',1),(26,NULL,NULL,'760006655',1),(27,NULL,NULL,'760006655',1),(28,NULL,NULL,'760006655',1),(29,NULL,NULL,'760006655',1),(30,NULL,NULL,'760006655',1),(31,NULL,NULL,'760006655',1),(32,NULL,NULL,'762549420',1),(33,NULL,NULL,'762549420',1),(34,NULL,NULL,'762549420',1),(35,NULL,NULL,'762549420',1),(36,NULL,NULL,'762549420',3),(37,NULL,NULL,'762549420',3),(38,NULL,NULL,'762549420',3),(39,NULL,NULL,'762549420',3),(40,NULL,NULL,'762549420',3),(41,NULL,NULL,'762549420',3),(42,NULL,NULL,'760006655',3),(43,NULL,NULL,'760006655',3),(44,NULL,NULL,'760006655',3),(45,NULL,NULL,'760006655',3),(46,NULL,NULL,'768531656',4),(47,NULL,NULL,'768531656',4),(48,NULL,NULL,'768531656',4),(49,NULL,NULL,'768531656',4),(50,NULL,NULL,'768531656',4),(51,NULL,NULL,'768531656',4),(52,NULL,NULL,'768531656',4),(53,NULL,NULL,'768531656',4),(54,NULL,NULL,'762549420',4),(55,NULL,NULL,'762549420',4),(56,NULL,NULL,'768531656',6),(57,NULL,NULL,'768531656',6),(58,NULL,NULL,'768531656',6),(59,NULL,NULL,'760006655',6),(60,NULL,NULL,'762549420',7),(61,NULL,NULL,'762549420',7),(62,NULL,NULL,'768531656',7),(63,NULL,NULL,'768531656',7),(64,NULL,NULL,'762551072',8),(65,NULL,NULL,'762551072',8),(66,NULL,NULL,'762551072',8),(67,NULL,NULL,'768531656',8),(68,NULL,NULL,'768531656',9),(69,NULL,NULL,'768531656',9),(70,NULL,NULL,'762549420',9),(71,NULL,NULL,'762549420',10),(72,NULL,NULL,'762549420',10),(73,NULL,NULL,'762549420',10),(74,NULL,NULL,'760006655',10),(75,NULL,NULL,'762549420',11),(76,NULL,NULL,'762549420',11),(77,NULL,NULL,'762549420',11),(78,NULL,NULL,'762551072',11),(79,NULL,NULL,'762551072',11),(80,NULL,NULL,'762549055',12),(81,NULL,NULL,'762549055',12),(82,NULL,NULL,'762549055',12),(83,NULL,NULL,'762549055',12),(84,NULL,NULL,'762551072',12),(85,NULL,NULL,'762551072',12),(86,NULL,NULL,'768531656',13),(87,NULL,NULL,'768531656',13),(88,NULL,NULL,'760006655',13),(89,NULL,NULL,'760006655',13),(90,NULL,NULL,'760006655',13),(91,NULL,NULL,'762549420',14),(92,NULL,NULL,'762549420',14),(93,NULL,NULL,'762549420',14),(94,NULL,'2024-10-06 16:02:41','762549055',14),(95,NULL,NULL,'762549055',16),(96,NULL,NULL,'762551072',16),(97,NULL,NULL,'762551072',16),(98,NULL,NULL,'768531656',16),(99,NULL,NULL,'768531656',16),(100,NULL,NULL,'760006655',16),(101,NULL,NULL,'760006655',16),(102,NULL,NULL,'762549420',17),(103,NULL,NULL,'762549055',17),(104,NULL,NULL,'762549055',17),(105,NULL,NULL,'762551072',17),(106,NULL,NULL,'762551072',17),(107,NULL,NULL,'760006655',17),(108,NULL,NULL,'760006655',17),(109,NULL,NULL,'768531656',21),(110,NULL,NULL,'760006655',21),(111,NULL,NULL,'760006655',21),(112,NULL,NULL,'762549420',21),(113,NULL,NULL,'762549055',21),(114,NULL,NULL,'760006655',21);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'tbasseneg@free.sn','$2y$12$1Ro1KYM1y/HRAvVV3uM0v.mAnd13h/zcSbPPcFflUNy1O6Fb4GAKu',1,NULL,'2024-07-15 09:14:47','2024-07-15 09:14:47'),(2,NULL,'msidibe@free.sn','$2y$12$fxJ56z66R4zwhhVFFOeXdeN8OWGX5CSGeoGvlnY3Ot7evinJTJOIe',1,NULL,'2024-07-15 09:16:10','2024-07-15 09:16:10'),(3,NULL,'ibrahimandiaye@free.sn','$2y$12$CKwrsRt6V8R6NEsfMFNmiOZsKaggjubEzV9g6Kko45h7IlogLgXGu',1,NULL,'2024-07-15 09:17:28','2024-07-15 09:17:28'),(4,NULL,'adjaniang@free.sn','$2y$12$c17KWzho3TCp35k1LO6FsOzKhoAZHHgA0TomYpuDi8bXvwC5DzMoi',1,NULL,'2024-07-15 10:00:28','2024-07-15 10:00:28'),(5,NULL,'abdoufall@free.sn','$2y$12$pcchk.FymUZijNwrgsPvmeHr4oG1.1HfRqHqcaLwm6.wfPUrnvBW2',1,NULL,'2024-07-15 10:01:30','2024-07-15 10:01:30'),(6,NULL,'khadysarr@free.sn','$2y$12$J1f1ur/vDC/1ORiqTXhJcubOLExZFG2INE/K0WLeWeGjea9F5u3xK',2,NULL,'2024-07-15 17:05:57','2024-07-15 17:05:57'),(7,NULL,'awapreira@free.sn','$2y$12$I.atqCo0WC0SNAycunBcu.IyzH0BolXA7jQkdYqZmvGNTgaIPwCnC',1,NULL,'2024-07-18 21:25:39','2024-07-18 21:25:39'),(8,NULL,'awasidibe@free.sn','$2y$12$N3uukMj1g7HZbZBKSXLx6.L.z93XItygaT.HX9Jou98eZ9qslqGfK',1,NULL,'2024-07-19 08:10:59','2024-07-19 08:10:59'),(9,NULL,'morseck@free.sn','$2y$12$BlaXPkES.oIqPxX0xFJkAO5TgYuGTuvt7GT70/k55vrWXfmXe78TO',1,NULL,'2024-07-24 17:32:18','2024-07-24 17:32:18'),(10,NULL,'aliounefree@free.sn','$2y$12$PehsgUzMXdgutJSJOJOeAeXvbrjiKpLHzx3P5r0OlWVe9jRDKuV6.',1,NULL,'2024-10-23 10:37:20','2024-10-23 10:37:20'),(11,NULL,'oumou@free.sn','$2y$12$vIDZQhSTfJv1X23PxUkhOuSCwRzrsLrznYCc4n42iEEnGNmva2/ZC',1,NULL,'2024-10-23 10:38:26','2024-10-23 10:38:26'),(12,NULL,'assy@free.sn','$2y$12$BpTezJLjEc/SMoAJHpMkge0E7vh.RVzqZCvLi.AJi2rUfA.xm.Yue',2,NULL,'2024-10-23 10:39:45','2024-10-23 10:39:45'),(13,NULL,'manesidibe@free.sn','$2y$12$WGuCZYHkRlvWpZxoEuHKq.92dVI.nmKP5mvaz4eSmvblbcLcy4Bjm',1,NULL,'2024-10-30 10:55:53','2024-10-30 10:55:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winners`
--

DROP TABLE IF EXISTS `winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `winners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campaign_id` int(11) NOT NULL,
  `prize_id` int(11) NOT NULL,
  `automation_id` bigint(20) unsigned DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `winners_automation_id_foreign` (`automation_id`),
  CONSTRAINT `winners_automation_id_foreign` FOREIGN KEY (`automation_id`) REFERENCES `automations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winners`
--

LOCK TABLES `winners` WRITE;
/*!40000 ALTER TABLE `winners` DISABLE KEYS */;
INSERT INTO `winners` VALUES (1,'2024-09-03 16:42:22','2024-09-03 16:42:22',1,9,NULL,'762549055'),(2,'2024-09-03 16:49:52','2024-09-03 16:49:52',5,9,NULL,'762549420'),(3,'2024-09-03 16:50:52','2024-09-03 16:50:52',6,2,NULL,'760006655'),(4,'2024-09-03 16:56:17','2024-09-03 16:56:17',3,3,NULL,'760006655'),(5,'2024-09-03 17:00:27','2024-09-03 17:00:27',4,6,NULL,'768531656'),(6,'2024-09-03 17:03:46','2024-09-03 17:03:46',14,19,NULL,'762549420'),(7,'2024-09-03 17:13:03','2024-09-03 17:13:03',14,19,NULL,'762549420'),(8,'2024-09-03 17:39:24','2024-09-03 17:39:24',14,19,NULL,'762549420'),(9,'2024-09-04 08:16:05','2024-09-04 08:16:05',3,3,NULL,'760006655'),(10,'2024-09-04 09:09:40','2024-09-04 09:09:40',10,5,NULL,'762549420'),(11,'2024-09-04 09:21:37','2024-09-04 09:21:37',2,16,NULL,'768531656'),(12,'2024-09-04 09:36:36','2024-09-04 09:36:36',2,12,NULL,'762549055'),(13,'2024-09-04 14:35:50','2024-09-04 14:35:50',10,7,NULL,'760006655'),(14,'2024-09-04 16:09:36','2024-09-04 16:09:36',9,8,NULL,'768531656'),(15,'2024-09-04 16:11:37','2024-09-04 16:11:37',2,4,NULL,'768531656'),(16,'2024-09-04 17:41:39','2024-09-04 17:41:39',2,4,NULL,'762549055'),(17,'2024-09-05 07:51:29','2024-09-05 07:51:29',2,4,NULL,'762549055'),(18,'2024-09-05 07:52:34','2024-09-05 07:52:34',5,15,NULL,'762551072'),(19,'2024-09-05 08:33:52','2024-09-05 08:33:52',2,4,NULL,'768531656'),(20,'2024-09-12 10:20:20','2024-09-12 10:20:20',2,1,NULL,'768531656'),(21,'2024-09-12 11:10:57','2024-09-12 11:10:57',2,4,NULL,'768531656'),(22,'2024-09-12 11:10:58','2024-09-12 11:10:58',2,4,NULL,'768531656'),(23,'2024-09-23 11:25:49','2024-09-23 11:25:49',10,7,NULL,'762549420'),(24,'2024-09-23 11:27:02','2024-09-23 11:27:02',6,2,NULL,'768531656'),(25,'2024-09-23 11:35:11','2024-09-23 11:35:11',2,4,NULL,'762549055'),(26,'2024-09-30 16:43:47','2024-09-30 16:43:47',2,4,NULL,'768531656'),(27,'2024-09-30 16:59:31','2024-09-30 16:59:31',2,4,NULL,'762551072'),(28,'2024-10-01 15:32:12','2024-10-01 15:32:12',2,4,NULL,'762549420'),(29,'2024-10-03 15:54:31','2024-10-03 15:54:31',2,1,NULL,'768531656'),(30,'2024-10-03 15:55:14','2024-10-03 15:55:14',1,10,NULL,'760006655'),(31,'2024-10-03 15:55:52','2024-10-03 15:55:52',1,10,NULL,'762549420'),(32,'2024-08-23 11:27:02','2024-09-23 11:27:02',6,2,NULL,'768531656'),(33,'2024-08-23 11:35:11','2024-09-23 11:35:11',2,4,NULL,'762549055'),(34,'2024-08-30 16:43:47','2024-09-30 16:43:47',2,4,NULL,'768531656'),(35,'2024-07-30 16:59:31','2024-09-30 16:59:31',2,4,NULL,'762551072'),(36,'2024-10-06 16:10:43','2024-10-06 16:10:43',16,23,NULL,'762549055'),(37,'2024-10-06 20:17:53','2024-10-06 20:17:53',6,2,NULL,'768531656'),(38,'2024-10-18 11:43:21','2024-10-18 11:43:21',16,23,NULL,'760006655'),(39,'2024-10-18 11:45:50','2024-10-18 11:45:50',17,24,NULL,'760006655'),(40,'2024-10-18 12:45:49','2024-10-18 12:45:49',2,12,NULL,'762549055');
/*!40000 ALTER TABLE `winners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-03 13:06:00
