/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.2.0 : Database - coop-voting-system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`coop-voting-system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `coop-voting-system`;

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

/*Table structure for table `cache_locks` */

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache_locks` */

/*Table structure for table `candidates` */

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `candidateName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidates_departmentid_index` (`departmentId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `candidates` */

insert  into `candidates`(`id`,`candidateName`,`departmentId`,`created_at`,`updated_at`,`photo`) values 
(1,'Jeney Empleosss',1,'2026-02-02 07:45:43','2026-02-05 10:54:02','storage/candidates/698476c9cb9ce_04001 - Empleo.jpg'),
(2,'Gloria Villegas',1,'2026-02-02 07:47:31','2026-02-02 07:47:31','storage/candidates/69805691e2ced_93028 - Villegas.jpg'),
(3,'Lary Dacer',3,'2026-02-02 07:47:42','2026-02-02 07:47:42','storage/candidates/6980569ce072c_94013 - Dacer.jpg'),
(4,'Judy Delima',2,'2026-02-02 07:48:00','2026-02-02 07:48:00','storage/candidates/698056aee2884_95004 - Delima.jpg'),
(5,'Reyvic Gallarita',2,'2026-02-02 07:48:14','2026-02-02 07:48:14','storage/candidates/698056bc5697a_97009 - Galarrita.jpg'),
(6,'Arnold Sandoval',2,'2026-02-02 07:48:27','2026-02-02 07:48:27','storage/candidates/698056ca0502e_99018 - Sandoval.jpg'),
(7,'Christian Fajardo',7,'2026-02-02 07:48:47','2026-02-02 07:48:47','storage/candidates/698056ddeff61_110525 - Fajardo.jpg'),
(8,'Richard Bagay',4,'2026-02-02 07:49:02','2026-02-02 07:49:02','storage/candidates/698056ec6583d_120680 - Bagay.jpg'),
(9,'Lyndon Estano',1,'2026-02-02 07:49:20','2026-02-02 07:49:20','storage/candidates/698056fe6ec8f_130707 - Estano.jpg'),
(10,'Rey Secor',5,'2026-02-02 07:49:41','2026-02-02 07:49:41','storage/candidates/69805713821e4_150730 -  Secor.jpg'),
(11,'Karen Django',2,'2026-02-02 07:49:53','2026-02-02 07:49:53','storage/candidates/6980571f6cc07_180614 - Diango.jpg'),
(12,'Remientos',6,'2026-02-02 07:50:07','2026-02-02 07:50:07','storage/candidates/6980572e23522_190202 - Ramientos.jpg'),
(13,'Dy',6,'2026-02-02 07:50:19','2026-02-02 07:50:19','storage/candidates/69805739a2d3b_151284 - Dy.jpg'),
(17,'Jeney Empleo',1,'2026-02-02 08:07:26','2026-02-02 08:07:26','storage/candidates/69805b3d08979_04001 - Empleo.jpg');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `departments` */

insert  into `departments`(`id`,`departmentName`,`created_at`,`updated_at`) values 
(1,'Engineering Department','2026-02-02 05:56:55','2026-02-02 06:17:00'),
(2,'Management Services Department','2026-02-02 05:57:16','2026-02-02 05:57:16'),
(3,'Commercial Department','2026-02-02 05:58:14','2026-02-02 05:58:14'),
(4,'Finance Department','2026-02-02 05:58:36','2026-02-02 05:58:36'),
(5,'Maintenance Department','2026-02-02 06:17:06','2026-02-02 06:17:06'),
(6,'Production Department','2026-02-02 06:17:15','2026-02-02 06:17:15'),
(7,'Administrative Department','2026-02-02 06:17:27','2026-02-02 06:17:27');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `job_batches` */

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `job_batches` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

insert  into `jobs`(`id`,`queue`,`payload`,`attempts`,`reserved_at`,`available_at`,`created_at`) values 
(1,'default','{\"uuid\":\"f4dbdbab-3560-4544-af35-13cbe56f02a6\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770163978,\"delay\":null}',0,NULL,1770163978,1770163978),
(2,'default','{\"uuid\":\"1a4e90a0-4b1d-457e-8907-83af6c7d3b2d\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164343,\"delay\":null}',0,NULL,1770164343,1770164343),
(3,'default','{\"uuid\":\"910c1fae-8f98-4d00-8a2c-8368e579bb48\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164343,\"delay\":null}',0,NULL,1770164343,1770164343),
(4,'default','{\"uuid\":\"9bd5350a-448d-4195-ad4d-606767c321b8\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164343,\"delay\":null}',0,NULL,1770164343,1770164343),
(5,'default','{\"uuid\":\"8f9ba9f7-a4f6-4d2d-aeec-ad0501417888\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164343,\"delay\":null}',0,NULL,1770164343,1770164343),
(6,'default','{\"uuid\":\"68973d5a-6080-4655-8565-070cc164c355\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164343,\"delay\":null}',0,NULL,1770164343,1770164343),
(7,'default','{\"uuid\":\"02746a63-c6f9-4184-a268-da294b5c87c4\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164343,\"delay\":null}',0,NULL,1770164343,1770164343),
(8,'default','{\"uuid\":\"14971635-fa5f-4784-b0d3-55c5d3060d7c\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164343,\"delay\":null}',0,NULL,1770164343,1770164343),
(9,'default','{\"uuid\":\"bf75c8ae-1ead-4c26-ae58-f46fbcfac8e5\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164503,\"delay\":null}',0,NULL,1770164503,1770164503),
(10,'default','{\"uuid\":\"6f8e181b-ff73-450a-a5e1-2282b286d130\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164503,\"delay\":null}',0,NULL,1770164503,1770164503),
(11,'default','{\"uuid\":\"06bfb34b-e82d-4626-82b0-bb43d86908a8\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164503,\"delay\":null}',0,NULL,1770164503,1770164503),
(12,'default','{\"uuid\":\"21926dbe-c324-4d63-a516-3f0d8e6ac73a\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164503,\"delay\":null}',0,NULL,1770164503,1770164503),
(13,'default','{\"uuid\":\"a94dfaa0-8b3d-48f5-a415-980fc600c9fa\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164503,\"delay\":null}',0,NULL,1770164503,1770164503),
(14,'default','{\"uuid\":\"93845ffa-131e-4238-be7c-3a60cf07c8c4\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164503,\"delay\":null}',0,NULL,1770164503,1770164503),
(15,'default','{\"uuid\":\"1d86025c-b207-42e1-abb6-39fd1357b39b\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":0:{}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164503,\"delay\":null}',0,NULL,1770164503,1770164503),
(16,'default','{\"uuid\":\"c6bb54b0-db6a-4b93-adb6-1c1e4ff0aba9\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"1\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164646,\"delay\":null}',0,NULL,1770164646,1770164646),
(17,'default','{\"uuid\":\"a17202a5-a370-41a9-a1a6-280e1dbea1d0\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"4\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164646,\"delay\":null}',0,NULL,1770164646,1770164646),
(18,'default','{\"uuid\":\"9fe0f732-26a7-47c0-81e0-6f2a070a8442\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"3\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164646,\"delay\":null}',0,NULL,1770164646,1770164646),
(19,'default','{\"uuid\":\"c6633326-76a9-426f-ad34-7253faa5e444\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"8\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164646,\"delay\":null}',0,NULL,1770164646,1770164646),
(20,'default','{\"uuid\":\"a14eff93-e86c-4b49-b5f6-bf68596bf563\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"10\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164646,\"delay\":null}',0,NULL,1770164646,1770164646),
(21,'default','{\"uuid\":\"619ff96d-eeb0-4c76-91ac-540b12d02934\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"12\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164646,\"delay\":null}',0,NULL,1770164646,1770164646),
(22,'default','{\"uuid\":\"4500b225-6c01-4122-8d0d-4d2649b72d2b\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"7\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164646,\"delay\":null}',0,NULL,1770164646,1770164646),
(23,'default','{\"uuid\":\"c792bcd2-c081-4425-ae26-66df32bbe7d5\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"2\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164729,\"delay\":null}',0,NULL,1770164729,1770164729),
(24,'default','{\"uuid\":\"4d7bdbac-306c-4e9d-9454-6f2d663834b0\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"5\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164729,\"delay\":null}',0,NULL,1770164729,1770164729),
(25,'default','{\"uuid\":\"9776ab9b-f443-49d8-b2b2-3eb1f4f7c843\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"3\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164729,\"delay\":null}',0,NULL,1770164729,1770164729),
(26,'default','{\"uuid\":\"2aa86159-a590-4278-b322-ee0f6163a62c\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"8\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164729,\"delay\":null}',0,NULL,1770164729,1770164729),
(27,'default','{\"uuid\":\"c2516b58-843e-4c99-8fac-096925cd08f7\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"10\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164729,\"delay\":null}',0,NULL,1770164729,1770164729),
(28,'default','{\"uuid\":\"1b4b6ab2-411e-4280-8da4-e5e26f643f59\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"12\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164729,\"delay\":null}',0,NULL,1770164729,1770164729),
(29,'default','{\"uuid\":\"ae7a5976-2e7e-4ccd-9124-a3cd3f652b40\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"7\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770164729,\"delay\":null}',0,NULL,1770164729,1770164729),
(30,'default','{\"uuid\":\"50beea19-d22f-4312-8787-35d9a4d077bb\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"1\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165129,\"delay\":null}',0,NULL,1770165129,1770165129),
(31,'default','{\"uuid\":\"ad0819cb-8533-4d4f-8165-a1343b2120dd\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"4\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165129,\"delay\":null}',0,NULL,1770165129,1770165129),
(32,'default','{\"uuid\":\"604a5cde-50c1-4b4d-8ee6-b0853a4d9420\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"3\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165129,\"delay\":null}',0,NULL,1770165129,1770165129),
(33,'default','{\"uuid\":\"9ff32b26-7a08-48e8-87a2-62705aa11c42\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"8\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165129,\"delay\":null}',0,NULL,1770165129,1770165129),
(34,'default','{\"uuid\":\"7c1bc69d-6565-4264-883c-3e8a3f19adec\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"10\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165129,\"delay\":null}',0,NULL,1770165129,1770165129),
(35,'default','{\"uuid\":\"d408f82f-1c9c-42c0-bf18-c3e1385ec10a\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"12\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165129,\"delay\":null}',0,NULL,1770165129,1770165129),
(36,'default','{\"uuid\":\"ec5c7b4b-0d92-4843-a161-e5aeae1a36b0\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"7\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165129,\"delay\":null}',0,NULL,1770165129,1770165129),
(37,'default','{\"uuid\":\"55f95701-a2d5-497d-9ba7-146480897ad8\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"2\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165182,\"delay\":null}',0,NULL,1770165182,1770165182),
(38,'default','{\"uuid\":\"8e173d4c-493d-4885-b0a1-c3948e41fdfc\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"5\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165182,\"delay\":null}',0,NULL,1770165182,1770165182),
(39,'default','{\"uuid\":\"f401a1f3-8dcd-4238-b860-672374857d68\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"3\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165182,\"delay\":null}',0,NULL,1770165182,1770165182),
(40,'default','{\"uuid\":\"7264aea2-d8bf-4d04-bf21-ef84bf2c51fc\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"8\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165182,\"delay\":null}',0,NULL,1770165182,1770165182),
(41,'default','{\"uuid\":\"8887ab89-682f-40a9-b222-1efaec942e97\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"10\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165182,\"delay\":null}',0,NULL,1770165182,1770165182),
(42,'default','{\"uuid\":\"f4642880-e796-4006-baa4-4e654285595d\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"12\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165182,\"delay\":null}',0,NULL,1770165182,1770165182),
(43,'default','{\"uuid\":\"37ae1c6e-a0c7-44a7-aad0-b28bf735aa75\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"7\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165182,\"delay\":null}',0,NULL,1770165182,1770165182),
(44,'default','{\"uuid\":\"d58567af-6458-4146-a48f-1a061146af93\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"1\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165323,\"delay\":null}',0,NULL,1770165323,1770165323),
(45,'default','{\"uuid\":\"9259ff1b-fa5f-47fd-8402-013f3944dea3\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"4\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165323,\"delay\":null}',0,NULL,1770165323,1770165323),
(46,'default','{\"uuid\":\"43759a17-59a0-4659-a8d7-65374a08247e\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"3\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165323,\"delay\":null}',0,NULL,1770165323,1770165323),
(47,'default','{\"uuid\":\"bd307126-0af1-4bbb-884f-3941cacbfd53\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"8\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165323,\"delay\":null}',0,NULL,1770165323,1770165323),
(48,'default','{\"uuid\":\"f9f289cd-7fd5-4d74-91a6-beb79cc12148\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"10\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165323,\"delay\":null}',0,NULL,1770165323,1770165323),
(49,'default','{\"uuid\":\"7899a127-65ae-4213-b97f-049fa7b0378a\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:2:\\\"12\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165323,\"delay\":null}',0,NULL,1770165323,1770165323),
(50,'default','{\"uuid\":\"21c0520f-bcb0-4b00-9540-6480a019834d\",\"displayName\":\"App\\\\Events\\\\VoteSubmitted\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:24:\\\"App\\\\Events\\\\VoteSubmitted\\\":1:{s:11:\\\"candidateId\\\";s:1:\\\"7\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770165323,\"delay\":null}',0,NULL,1770165323,1770165323);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2026_02_02_035627_add_access_to_users',2),
(5,'2026_02_02_055424_create_departments_table',3),
(6,'2026_02_02_062226_add_department_id_to_users',4),
(7,'2026_02_02_072226_create_candidates_table',5),
(8,'2026_02_02_072618_add_candidate_photo_to_candidates',6),
(9,'2026_02_02_080324_make_photo_nullable_on_candidates_table',7),
(10,'2026_02_03_053431_create_votes_table',8);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('3a9QMD4o1HzLHay05ZXOZCIiYb2oSytBW8WLl2cZ',NULL,'192.168.137.198','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicE1URGYzckZMdmROMEhRZVBEUVNiOFRjWjV3OFF2MHNETllxVDNCdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xOTIuMTY4LjEzNy4xOjgwMDAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1771375558),
('hq7zfIvktJz1UVxJw81aHQZ8vuwW4WoJwIf28RVx',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkNyOEVwZzVPbFhWZmJtNlVPSGtZWXBIUlBFZGM2QmtBUWtTVHVDQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZXN1bHRzIjtzOjU6InJvdXRlIjtzOjc6InJlc3VsdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1771374146),
('2QcTy9RwI5BQk3mdrJ0PU50Kz3aTQCb5LZjNSkCJ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXIyYnE4YkdyZnM1dTJiNXlyeDZRRzZIdDRwTnF4Rk44ZGxNRUZWNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fX0=',1771374122),
('487VxPgPgbnYsjKuQmJdk9rcZpIwrodQ4nk48H7e',NULL,'172.16.38.13','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUxZZ2VqNVJ1ZkZ2VHNzcEZGSlJVMWtFa0RDcWVvTlk0OEtOMHFYUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNzIuMTYuMzguMTM6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1771375299);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `access` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_usernumber_unique` (`userNumber`),
  KEY `users_departmentid_index` (`departmentId`)
) ENGINE=MyISAM AUTO_INCREMENT=655 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`firstName`,`lastName`,`userNumber`,`password`,`remember_token`,`created_at`,`updated_at`,`access`,`departmentId`) values 
(1,'John Sidney','Salazar','12345','$2y$12$09HtdDfi86Z89jXIfz/ThucPqb1CTXcNSbt7fO7VENVQT22f7Jx4S',NULL,NULL,'2026-02-02 08:38:11','admin',0),
(601,'TENIO',' MARIO D.','1274','$2y$12$tOF8D.MXt.GWk35Iy5SxxuTV.99NTg4hyW/ziHSzLJjZ7ld31zNXO',NULL,'2026-02-02 07:18:56','2026-02-02 07:18:56','user',4),
(600,'TENESTRANTE',' DANILO JR. L.','1273','$2y$12$zzlSdCSx9bI8lROgf9A0BegIhnR11h/980.EMp65fS07PqeTkSxua',NULL,'2026-02-02 07:18:56','2026-02-02 07:18:56','user',4),
(599,'TAYLARAN',' MICHAEL D.','1272','$2y$12$SFDcWDzQc5dr6BZIdDJZIeOeaz.6i0FVlQuNejsPDzPOkdxwOiXpC',NULL,'2026-02-02 07:18:55','2026-02-02 07:18:55','user',4),
(598,'TANA',' RONNIE O.','1271','$2y$12$..9ttYk3mZQfEawurHpume/288KcANg5.Sx.87IhlCxwxNI9xf7h2',NULL,'2026-02-02 07:18:55','2026-02-02 07:18:55','user',4),
(597,'TAAL',' WARREN JAY L.','1270','$2y$12$vABcL08Qp4k4i2BgiKmZ7eMgn83md3i1Y9to/At7JZ0bG18aSjAJi',NULL,'2026-02-02 07:18:55','2026-02-02 07:18:55','user',4),
(596,'TAALA',' RICARDO B.','1269','$2y$12$VIV8dni1wXVPvojVbPrVpuq56UL2X49nRocO1D96MfR/fnR/HomfO',NULL,'2026-02-02 07:18:55','2026-02-02 07:18:55','user',4),
(595,'RATUNIL',' MARK J.','1268','$2y$12$IMTfa88sHHUS1zrdn/JBFeqSfg7KLXk.YkwkL4lwRgSZGcVly3K3C',NULL,'2026-02-02 07:18:54','2026-02-02 07:18:54','user',4),
(594,'RANA',' VINCENT ALFIE B.','1267','$2y$12$tNZRheT4v2vaf7FAFe/52ez8irVbXzuQa5kA6cMw.kHt25ESE9yEy',NULL,'2026-02-02 07:18:54','2026-02-02 07:18:54','user',4),
(593,'RAMONAL',' BERNIE C.','1266','$2y$12$pRFp2SnJSk9PHtP5URdXG.F3Fqh9TIC4myha/WaBJTp/h9fDOrg/K',NULL,'2026-02-02 07:18:54','2026-02-02 07:18:54','user',4),
(592,'PLATITAS',' TITO E.','1265','$2y$12$gzNXVTv1d.H6PDw4GYFy.usChkjwGOjuyCP/w/0doKoibLlcB2I6.',NULL,'2026-02-02 07:18:54','2026-02-02 07:18:54','user',4),
(591,'INFANTE',' CHRISTINE JOY O.','1264','$2y$12$TDM.w/Aq8CKlOY/h0yRKMOIR3bkGFG81Fl6oyW348c0S0/TvVehue',NULL,'2026-02-02 07:18:53','2026-02-02 07:18:53','user',4),
(590,'OCCENA',' DARRYL FRANCIS J.','1263','$2y$12$neFfQpKXMZysCQbOboymK.Ol89MzMCKHhXhtJKAg6WSCFkA5dBifG',NULL,'2026-02-02 07:18:53','2026-02-02 07:18:53','user',4),
(589,'METUDA',' RICKY B.','1262','$2y$12$Y6ZJeDK.Q6ybe9lwQHyOiebEAcFfB3BOWQUVnwVelc5sqKMGAj77a',NULL,'2026-02-02 07:18:53','2026-02-02 07:18:53','user',4),
(588,'MAGNA',' GERMAN C.','1261','$2y$12$dUZKBpSyJ.WUu3ss7kV4Mu.p4GGDRaCoftfCT2LD6B0g/Un0jczN.',NULL,'2026-02-02 07:18:53','2026-02-02 07:18:53','user',4),
(587,'MABAO',' KHEMMIE V.','1260','$2y$12$tAV8eBmtPwtNXQ80BFWmmeegDebCdEcLl0uhLwv99zJ/EEtwHjOx6',NULL,'2026-02-02 07:18:53','2026-02-02 07:18:53','user',4),
(586,'LACAYA',' VIVENCIO JR. C.','1259','$2y$12$xzPFIZUfrPxGY5sZyeWKD.ZemLUczqbmZkZD8r.gxbuWTnheTN7Nq',NULL,'2026-02-02 07:18:52','2026-02-02 07:18:52','user',4),
(585,'IBARRA',' ALADIN B.','1258','$2y$12$5ezG1Aq9gkNBOF5aeHm9vurBQOkoSCWmjTj9zVkNNUT2d8qTPoDIy',NULL,'2026-02-02 07:18:52','2026-02-02 07:18:52','user',4),
(584,'HAOS',' AILEEN B.','1257','$2y$12$jyz520H/rXguTQGMmrdeXuD2vI/UnisC3WGA4SkjVmz28D8UJDi.m',NULL,'2026-02-02 07:18:52','2026-02-02 07:18:52','user',4),
(583,'HANGINAN',' WEBSTER GERALD B.','1256','$2y$12$0qt6fl59Ecd3C05QE/wOZOPJXuxwm1.hnAM3hT3Hs9VZhoUDhYz1K',NULL,'2026-02-02 07:18:52','2026-02-02 07:18:52','user',4),
(582,'GEMOTO',' JIGGER E.','1255','$2y$12$QlFLYYz/iUvGCXmBhSO2eOoKGi3cMBBfWmCM7m9MvQgYqTqMXQBYy',NULL,'2026-02-02 07:18:51','2026-02-02 07:18:51','user',4),
(581,'GAZO',' JOVITO A.','1254','$2y$12$oN5zw9SpfKPJbhY08PJBLu6GTY8Ob2/g27YbOyZphIVmbTDrRO86a',NULL,'2026-02-02 07:18:51','2026-02-02 07:18:51','user',4),
(580,'GAMOLO',' VICENTE D.','1253','$2y$12$bFmlcedhoeOZD6scK3NuU.WZkeKcN4kWw3U60HYhXq4D3p/gJYD06',NULL,'2026-02-02 07:18:51','2026-02-02 07:18:51','user',4),
(579,'DY',' ELIEZER L. JR','1252','$2y$12$bnTqtMU2jP9xstcNXKczU.qQU47C8C0rA/TC4IYnXYZ/XabV0D.ym',NULL,'2026-02-02 07:18:51','2026-02-02 07:18:51','user',4),
(578,'DEL SOCORA',' JONLY P.','1251','$2y$12$25EUXtiMdPd4RfcAH7boJOvTmgGD0LV3bTnpmcBfvRUmwOQt4Tl/u',NULL,'2026-02-02 07:18:50','2026-02-02 07:18:50','user',4),
(577,'DAGUIMOL',' GEORGE D.','1250','$2y$12$v7gV1wWeA5F4U3a5VXTNdec6Mp/SUOdZJ/tnc4h8Y8/aw6f9mXeFC',NULL,'2026-02-02 07:18:50','2026-02-02 07:18:50','user',4),
(576,'DABA',' BRYAN M.','1249','$2y$12$YtT5lclL41mp7S4zLKJ0Zuig9E9nSXGiWXL3nN27WDD/.HacA2Hui',NULL,'2026-02-02 07:18:50','2026-02-02 07:18:50','user',4),
(575,'CINCO',' JOSE LEONARD K.','1248','$2y$12$.njqUeb7iIqEfGzf7RTIp.BFbuBRToCR.JYvNqI1jxQZ3bj60sd5K',NULL,'2026-02-02 07:18:50','2026-02-02 07:18:50','user',4),
(574,'CUYNO',' JUVIRA KRIS C.','1247','$2y$12$gvXIOS4RmRMlfvl8xyJSBuGLbN8XWKB8n6K8yu/.pniXHc1mKDWeS',NULL,'2026-02-02 07:18:49','2026-02-02 07:18:49','user',4),
(573,'CASTRO',' ANTHONY V.','1246','$2y$12$MUDSi1lFnrrVNzry16453.WlNVNAsbTdCiK5I9VhacR9FF2ce4Du2',NULL,'2026-02-02 07:18:49','2026-02-02 07:18:49','user',4),
(572,'CASTIGON',' ANNILYN G.','1245','$2y$12$VMTB5dk7bG3ebAv1Y7qxbuws8yrJNT65MUqKO9BlP1LLVm7Cmzn5K',NULL,'2026-02-02 07:18:49','2026-02-02 07:18:49','user',4),
(571,'CAGUISA',' RAFAEL A.','1244','$2y$12$m45CKlndg8WiC2SqKg32Se8.1krHcSkH9dUSzcKkwTnXIGKLK7vqO',NULL,'2026-02-02 07:18:49','2026-02-02 07:18:49','user',4),
(570,'CABARABAN',' SIGMUND H.','1243','$2y$12$tLZqTCADKhnxhp384U6pxeL612h7t4hrx4qfkl6LUhhW3Kr92K4lK',NULL,'2026-02-02 07:18:49','2026-02-02 07:18:49','user',4),
(569,'CABANAZ',' CAMILO V.','1242','$2y$12$lGCVtuGF.x55m9o5MLQV6OTe85XJsct1qPKlxKiD.pPSCxDj5hs1u',NULL,'2026-02-02 07:18:48','2026-02-02 07:18:48','user',4),
(568,'BONSILAO',' RUBEN B.','1241','$2y$12$Cfl0dz03sYp.Oi3euT4LT.LGJQ.kgas.WPEXW9gky34nLsuz.lsg.',NULL,'2026-02-02 07:18:48','2026-02-02 07:18:48','user',4),
(567,'BONAYOG',' DONY P.','1240','$2y$12$keEa2NNLDpO9TOK0sWhCsOuvTdBFaIeCYXUCbfaGR2rOgkvSFEdTi',NULL,'2026-02-02 07:18:48','2026-02-02 07:18:48','user',4),
(566,'BERNARDO',' MANUEL R.','1239','$2y$12$6RaHsSRHDyvlvVbQX3wZR.4cO3bfQ2UXOQ4HmoGLLNXQ.S8WGBTDS',NULL,'2026-02-02 07:18:48','2026-02-02 07:18:48','user',4),
(565,'BALIBAGON',' ALEX B.','1238','$2y$12$FFDu5GIJcMC2UFohZi2mXuLatr2AztWWGf/JV8Wp9Le2kPzdKJlOS',NULL,'2026-02-02 07:18:47','2026-02-02 07:18:47','user',4),
(564,'ARANETA',' JONATHAN REY N.','1237','$2y$12$7YMj9mQNArvkbi9kMYsM9.i6bj4HJ.Zhplf9vONNm0LsCQUKuC./m',NULL,'2026-02-02 07:18:47','2026-02-02 07:18:47','user',4),
(563,'AGAWIN',' JAY CLARK A.','1236','$2y$12$qTNpoY/Q33x39OtM5esVquLVQvceGWmzrnVfhFhoyAnnvvBT1RgBG',NULL,'2026-02-02 07:18:47','2026-02-02 07:18:47','user',4),
(562,'ABESAMIS',' ROMARICO JR. T.','1235','$2y$12$Gu6ZhLneOghk0u07KnXYGeg7RcXo.krHeMZsH7ohJkmflpP6Jpvvi',NULL,'2026-02-02 07:18:47','2026-02-02 07:18:47','user',4),
(561,'ABANGAN',' ALEX S.','1234','$2y$12$JEpEcVq4d/9Zl23vpgm2peKO1SGi4ItkoOtpW0HBvC0HVveYOEA9e',NULL,'2026-02-02 07:18:46','2026-02-02 07:18:46','user',4),
(560,'WAO',' LARRYVELLE D.','1233','$2y$12$nf2S0h8UYKWgArOOr9aSHeNMAqV6P0QBYSHp7Ld1IRGSDdW0VLt86',NULL,'2026-02-02 07:18:46','2026-02-02 07:18:46','user',5),
(559,'UA-O',' WILKARH D.','1232','$2y$12$/QMZkcrVs9x5zHzBOn.XaOUel0AlzPIlr2trhQeHyL7WAhEXcpufa',NULL,'2026-02-02 07:18:46','2026-02-02 07:18:46','user',5),
(558,'TUVILLA',' YOSEF EDGAR V.','1231','$2y$12$8BjKSYyfu7NHI7R1AViYeucW/fKvb3ZGGWa3VroMdGMI7rfX20ik6',NULL,'2026-02-02 07:18:46','2026-02-02 07:18:46','user',5),
(557,'TOLENTINO',' BRYAN Y.','1230','$2y$12$./2426Pzid9naeCr/65eyuZsGc0O/wSy0F51zLMfIm2w7WuU4i8.e',NULL,'2026-02-02 07:18:45','2026-02-02 07:18:45','user',5),
(556,'TEJADA',' EUGENIO B.','1229','$2y$12$pgYT8z3STdlp7FrC046sFOl2PFQsZd9a7Hq3.5Kq93YN2jeEbdO8S',NULL,'2026-02-02 07:18:45','2026-02-02 07:18:45','user',5),
(555,'TEJADA',' JULITO B.','1228','$2y$12$KiTsV8PmUcBqbReX9QPJZ.GUaiFDCxJimWn.W5MXmUxV1alhP.1tK',NULL,'2026-02-02 07:18:45','2026-02-02 07:18:45','user',5),
(554,'TAGOCON',' DANTE D.','1227','$2y$12$Jr7K8SnuuV1NTG1g0./RFOH2Q5XYD2MBoty5WjQsifT0Gmt2lFMfW',NULL,'2026-02-02 07:18:45','2026-02-02 07:18:45','user',5),
(553,'TABIAN',' ROGER B.','1226','$2y$12$SDW2vO79oRDFNrQfLwi6leE0DS8HaU5VRUthyBql..A4NCbgB6B4O',NULL,'2026-02-02 07:18:45','2026-02-02 07:18:45','user',5),
(552,'SURALTA',' RAPHAEL F.','1225','$2y$12$S4.qSAacFGo0UWAlWTVp/uvHkDMM8bdvhRvjE5dhkAlahwmXWHzZW',NULL,'2026-02-02 07:18:44','2026-02-02 07:18:44','user',5),
(551,'SECOR JR.',' REYNALDO A.','1224','$2y$12$wE7zDO9mccCYr5lGSvCb/egxqD5ZiOZQqOwXcYEoMB7Ok0c66KJZK',NULL,'2026-02-02 07:18:44','2026-02-02 07:18:44','user',5),
(550,'SALARDA',' EULJUN B.','1223','$2y$12$LOwJtjG5mao2KuSZnzCzXeojcOYnktwzASdqpiXN96vHQwlUQoD9i',NULL,'2026-02-02 07:18:44','2026-02-02 07:18:44','user',5),
(549,'SABIT',' AGNES MARIE U.','1222','$2y$12$n4BoM/wNHu7ocky7O27WMe4qwg6H38pouZ3xMGpBJyAkZGuZd7msC',NULL,'2026-02-02 07:18:44','2026-02-02 07:18:44','user',5),
(548,'REYES',' KHYRYLL MAE  A.','1221','$2y$12$G0t8785bDkzlBQbWisqTWO9LgjbyJ96/CxPljFulgHpOzD9hSeDQa',NULL,'2026-02-02 07:18:43','2026-02-02 07:18:43','user',5),
(547,'RAGASAJO',' RYAN L.','1220','$2y$12$jvKbsV9/YHeaCxkKpwHCl.8eEXTwGvPFwDRbkoZ7RuOk.elvgDGa2',NULL,'2026-02-02 07:18:43','2026-02-02 07:18:43','user',5),
(546,'PADILLA',' CONSILITO M.','1219','$2y$12$dJ6tWDKDnyqD97vmJB.QT.tH6JZc0FMKk2pkffAHobt6/ZgkTF/qu',NULL,'2026-02-02 07:18:43','2026-02-02 07:18:43','user',5),
(545,'PACUBAS',' MICHAEL M.','1218','$2y$12$I.FhpH9PVTupBwxcxu96KuFRvxySRttoY/hHDLl1zUeJbXtiQp/JW',NULL,'2026-02-02 07:18:43','2026-02-02 07:18:43','user',5),
(544,'PACTOLERIN',' LORETO JR. J.','1217','$2y$12$E7/vfZQ2yVUVbO4QnHIUWeujDVfciPrXJUm0A4r.OpiYF7tK443ty',NULL,'2026-02-02 07:18:42','2026-02-02 07:18:42','user',5),
(543,'ORLANDA',' EMMANUEL M.','1216','$2y$12$2K1kfMz42rPPbDpHnPaXoe/3GP0r16SV0dYVvzMJkGbz5MI8vjBHq',NULL,'2026-02-02 07:18:42','2026-02-02 07:18:42','user',5),
(542,'ORCAJO',' RONALD REY B.','1215','$2y$12$HtvimKnCHKBDFIKZB4hANeLXqknDDBsVcJL65h.8EDMzdAMfRbLdS',NULL,'2026-02-02 07:18:42','2026-02-02 07:18:42','user',5),
(541,'OGATES',' DANILO A.','1214','$2y$12$qwZWC9NX4Q/OY86DaDtsj.WiR6oBwimqn212Gh7Ex1Ap8/NXNgJN6',NULL,'2026-02-02 07:18:42','2026-02-02 07:18:42','user',5),
(540,'NG',' WILFREDO JR. G.','1213','$2y$12$PWcg.l.jNaD4KWogYzUuxe0dLIsAkAl/nsf0ACH8jvK5uvL6UE7q.',NULL,'2026-02-02 07:18:41','2026-02-02 07:18:41','user',5),
(539,'NADALA',' SHEILA P.','1212','$2y$12$VsJcpgZlOEvxWBNTeMlcRuMuckXcYN0GU3B2XwQoYrcrP1Kiq0HCa',NULL,'2026-02-02 07:18:41','2026-02-02 07:18:41','user',5),
(538,'MINDAJAO',' VINCENT M.','1211','$2y$12$PGxObEYh/Mc7EemsteYL9OOBzxB8h8Km6h.z5RZwezdpy2GHBYRxK',NULL,'2026-02-02 07:18:41','2026-02-02 07:18:41','user',5),
(537,'MADJOS',' ALMAR JOHN B.','1210','$2y$12$skgPqtFD9IJ8G6zkU90NG.ss15mpw.EgpszgoLozJ/ydHxEwHyZT.',NULL,'2026-02-02 07:18:41','2026-02-02 07:18:41','user',5),
(536,'JUNTONG',' ANA JANE B.','1209','$2y$12$vszhimUd5uqkqEP8c.6tFeVeJ7vEJMI7DGuVcwwuTRmfIDxaplXt.',NULL,'2026-02-02 07:18:41','2026-02-02 07:18:41','user',5),
(535,'JOAQUIN',' CRIS REY G.','1208','$2y$12$VXfNLNWQIT1qwejqUQ0UrO91YkhoeN4ceMZV8nER7GKWXf8OzdBpO',NULL,'2026-02-02 07:18:40','2026-02-02 07:18:40','user',5),
(534,'JAMERO',' JOEL B.','1207','$2y$12$nDlgTr8xBwvxgKM8RJKbyuNs6eaUE4vp8.MfsLbuPvFY0rOEz5Hxy',NULL,'2026-02-02 07:18:40','2026-02-02 07:18:40','user',5),
(533,'JACOB',' JAMES PAUL','1206','$2y$12$DKl0JeKnee.JluclVS.nR.njmbEyM9jRjMeYWVVdTZ53XZqV8eccy',NULL,'2026-02-02 07:18:40','2026-02-02 07:18:40','user',5),
(532,'FERIDO',' RHONA KIM U.','1205','$2y$12$JCdNKCcutjGOZVKnwgZHwe3xWToRzl5SL1vmw5eZOoIViYDC3x/F.',NULL,'2026-02-02 07:18:40','2026-02-02 07:18:40','user',5),
(531,'EVANGELISTA',' ALLAN S.','1204','$2y$12$zj0tyi6rOnT3ncXBZGn/nefBtiIZnO1lZheFiTxni1B9h.aGEu726',NULL,'2026-02-02 07:18:39','2026-02-02 07:18:39','user',5),
(530,'ESTONILO',' DANILO G.','1203','$2y$12$/d4bA0zpc5BqL6Nh50OUWe/lrcLy6spM8LnTSxzPX0RyeyzPUfeOS',NULL,'2026-02-02 07:18:39','2026-02-02 07:18:39','user',5),
(529,'ESTANO',' LENDON D.','1202','$2y$12$MtUPdxpB/K8rS3zml6LfSe./DReIVXdYCEf0Upv727HJhdw/c1kgS',NULL,'2026-02-02 07:18:39','2026-02-02 07:18:39','user',5),
(528,'ESPERAS',' ELMER A.','1201','$2y$12$ANVvSbpaEzy3M30PPU9GA.2p9eoB7AW7VbbmLtdlaTa9MvXZP4vRC',NULL,'2026-02-02 07:18:39','2026-02-02 07:18:39','user',5),
(527,'EMPLEO',' JENNIE L.','1200','$2y$12$m9ZDQXWSwIJ/r7GbXR35QuDMuklKGNhuqWr/jqBniX7vYpg8vOLwS',NULL,'2026-02-02 07:18:38','2026-02-02 07:18:38','user',5),
(526,'DESEO',' MARIA VIANNEY U.','1199','$2y$12$H5LhIx2D0MHTDAHdC/0ose7PUl0oSnp7fK5b.L2fdof4A7eMl1wbS',NULL,'2026-02-02 07:18:38','2026-02-02 07:18:38','user',5),
(525,'DELFINO',' ARTEMIO R.','1198','$2y$12$frdINAY2icl9SQnN11fwhujrGBrTLzvlb/1GE8c3TackMI0OCBX6m',NULL,'2026-02-02 07:18:38','2026-02-02 07:18:38','user',5),
(524,'CUERQUIS',' EDSEL D.','1197','$2y$12$zHp6zaYRtT1.vApme27FMu4gBbI7Sd/wuvM/nsVDHV.C5eWr6QIC.',NULL,'2026-02-02 07:18:38','2026-02-02 07:18:38','user',5),
(523,'CHIONG',' ALLAN D.','1196','$2y$12$SWyzBXuLlqnTAGiYKGSn7el9rhrne5RjjlrRbedhoUr5r1yVySNOG',NULL,'2026-02-02 07:18:37','2026-02-02 07:18:37','user',5),
(522,'CARILLO',' AGUSTIN B.','1195','$2y$12$QCczWOpASkM1jfqxdFqM0uNr9qaoTSsPNZ4uliuuCzWEqRpiIOXS.',NULL,'2026-02-02 07:18:37','2026-02-02 07:18:37','user',5),
(521,'CAJELLA',' ALEXANDER S.','1194','$2y$12$nGZCW2D3XmTZOA1Ry6Z7oeW5jZnXAkegf/Xu9EiWeO1GpgszjGeEC',NULL,'2026-02-02 07:18:37','2026-02-02 07:18:37','user',5),
(520,'CAINGLES',' ARNOLD CHRISTOPHER G.','1193','$2y$12$XiE0n5exf7.V4Gmu3hLex..XUgYMYVE7VMXgEW39VoYPgfDugyVyq',NULL,'2026-02-02 07:18:37','2026-02-02 07:18:37','user',5),
(519,'CABILOGAN',' JEROME L.','1192','$2y$12$iFEwDO4JCjcvD9YGswLTi.ixBZrsKWsrMPof.JIwzsCzQZWhGCAti',NULL,'2026-02-02 07:18:37','2026-02-02 07:18:37','user',5),
(518,'CABATUAN',' JAN CARLO P.','1191','$2y$12$nH4Ojp3NQFnW1piDyzvj..pturBRVrIgVZCwjuZj9fJResgtqMIVC',NULL,'2026-02-02 07:18:36','2026-02-02 07:18:36','user',5),
(517,'CABANES',' JUDY P.','1190','$2y$12$0V0HQ9fMkrDnDaL4MM40XObUMO/33HEWh5Z5EoAYv1fmhJRd4kuli',NULL,'2026-02-02 07:18:36','2026-02-02 07:18:36','user',5),
(516,'BARANGOT',' CHRISTOPHER L.','1189','$2y$12$iuu27Di76uwWLDH4/MpVKOlnbiqkpYKv06X0flzgTEzqouc57uz3a',NULL,'2026-02-02 07:18:36','2026-02-02 07:18:36','user',5),
(515,'BAJAO',' NELSON G.','1188','$2y$12$72noMjAqQ8gMQmdbEImGZ.MsFEsnKB8kQMKTlbC2fEIoU63SLJVLC',NULL,'2026-02-02 07:18:36','2026-02-02 07:18:36','user',5),
(514,'BAGUHIN',' AZENETH C.','1187','$2y$12$onweD0OiD1q6km8XD3/c.uJ5PbwuHkyddXhypx9UKZOx.eu1y4UNy',NULL,'2026-02-02 07:18:35','2026-02-02 07:18:35','user',5),
(513,'BAGARES',' NIC ZENON V.','1186','$2y$12$Ztx5lD8eEnGel.CLOzozyeMLqhLO8bBGb6Rgx6ie7TJbvfvnqFBui',NULL,'2026-02-02 07:18:35','2026-02-02 07:18:35','user',5),
(512,'BAGARES',' FARAH C.','1185','$2y$12$Ira1bY1PEv5vLsUupQltUuwCJbxsXQbwX/syi/V6HiZrY2XEMEVva',NULL,'2026-02-02 07:18:35','2026-02-02 07:18:35','user',5),
(511,'ARABEJO',' JIMMALYN P.','1184','$2y$12$hvC7/CiXYpYbRTqJLSlWDOEi.GkjCVex98GMQyLb2LyLstPsLzpVm',NULL,'2026-02-02 07:18:35','2026-02-02 07:18:35','user',5),
(510,'AMPIT',' RAIZZA JANESSA G.','1183','$2y$12$8SAzv0DU6/dZ4hKZtArabecW35kte7XuS2.IYz5bPsM4MAMpyBMNe',NULL,'2026-02-02 07:18:34','2026-02-02 07:18:34','user',5),
(509,'ABAO',' ALLAN B.','1182','$2y$12$NzMlhcXX2jbSS8ZaGv/Hy.ww0S6onR0zSc0M.J6JXBr7blOWpMDKi',NULL,'2026-02-02 07:18:34','2026-02-02 07:18:34','user',5),
(508,'YANEZ',' ROLDAN R.','1181','$2y$12$kJ.5tAgMqlFDUzuKUb5NDexC3lm5DRhDIiJX7L7fEVEQ2zNJJrcOW',NULL,'2026-02-02 07:18:34','2026-02-02 07:18:34','user',3),
(507,'YANEZ',' GRACE JOY  C.','1180','$2y$12$YeW5jZVlMqa.Tqx4FRBkzuT0Cum7uxK/xaZugrUtukCLZGDzoMNbq',NULL,'2026-02-02 07:18:34','2026-02-02 07:18:34','user',3),
(506,'YAMUT',' STEVE JERIC N.','1179','$2y$12$MN1l.ipIB7Oif9orJDR4t.bAn1t03AImRloQJnBZK2sZKoVe3QFUW',NULL,'2026-02-02 07:18:33','2026-02-02 07:18:33','user',3),
(505,'WAO',' SHIRDY E.','1178','$2y$12$aJO6MwrKUPUHHu.78LUVJunabi.0t8V9ou9.KpDhsaFYk2zTwj3Yu',NULL,'2026-02-02 07:18:33','2026-02-02 07:18:33','user',3),
(504,'VILLOCILLO',' WILMAR JAY J.','1177','$2y$12$fBBRDMJIL42YUDQs.0.tUuDeKRiJ8mPAs8FXQ.qhZuelrJcvkadH.',NULL,'2026-02-02 07:18:33','2026-02-02 07:18:33','user',3),
(503,'UBAY-UBAY',' IAN J.','1176','$2y$12$aVdTOTz0avUa81ps54DTwu/4VASsF7fg.YMyBlNfjHW6NuOrn60kO',NULL,'2026-02-02 07:18:33','2026-02-02 07:18:33','user',3),
(502,'TORREJOS',' JOHN CAESAR A.','1175','$2y$12$2GzTXPPa2Sh4MR6WFir0MOvjIw6J6nJ49i7XtoZV82/BPt6HUlcPS',NULL,'2026-02-02 07:18:33','2026-02-02 07:18:33','user',3),
(501,'TOLENTINO',' NOREEN LAURENCE N.','1174','$2y$12$PDE/r8rsXZIJyb4t8lC2J.Wio75ANlJP/cBKzPwRq2T45nOxmcQ7O',NULL,'2026-02-02 07:18:32','2026-02-02 07:18:32','user',3),
(500,'TOLENTINO',' JOHNEL D.','1173','$2y$12$AaFNPgLXCIuuEpWtO9ySL.51RFp./BzxXc8RmnlhtI0VOW9.YwFTq',NULL,'2026-02-02 07:18:32','2026-02-02 07:18:32','user',3),
(499,'TAMALA',' LEONILYN B.','1172','$2y$12$iJ3pGXotrqsQw3PlZTkH.u.wK5e4HKWihqwRqQxu0ccg8Tm8E3XAC',NULL,'2026-02-02 07:18:32','2026-02-02 07:18:32','user',3),
(498,'SUSMIRAN',' DIANA ROSE C.','1171','$2y$12$DPnmGMoRpbSKTWcS.cVJX.JFe9cMsb7aWxjNR1sgTLtT65NOFfYw.',NULL,'2026-02-02 07:18:32','2026-02-02 07:18:32','user',3),
(497,'SIMENE',' JOHN ARIEL Y.','1170','$2y$12$EmmDOIAgP7vVG3aqNesMAefnNUmMxa9TVd97LTnT9A3E5OXOU2vb6',NULL,'2026-02-02 07:18:31','2026-02-02 07:18:31','user',3),
(496,'SILMA',' JOVITO M.','1169','$2y$12$z5j6NRI3iJjzzuJyBWI5e.FDaf4SXccbocFrtKfPBfqSfaw4f6h7S',NULL,'2026-02-02 07:18:31','2026-02-02 07:18:31','user',3),
(495,'SERINA',' JOHN MICHAEL P.','1168','$2y$12$6Kyh6DtUbWwQodE2o3Bzbuo5fHxRSOIau1UCi/KhME7KDqGG4H7XS',NULL,'2026-02-02 07:18:31','2026-02-02 07:18:31','user',3),
(494,'SANDOVAL',' ARNOLD A.','1167','$2y$12$ewm197uIKoJPd.fbZMMq8eBfLZYeFJC8yo2IljiEUjH60vv.4whC2',NULL,'2026-02-02 07:18:31','2026-02-02 07:18:31','user',3),
(493,'SALVADOR',' CHARMYN L.','1166','$2y$12$eg.9L9OTCsqf2tMuYjl2cuwhmQXQXr1noS8geNDmHnmkP8Qw5pXnS',NULL,'2026-02-02 07:18:30','2026-02-02 07:18:30','user',3),
(492,'SALAZAR',' THOMAS S.','1165','$2y$12$4q9.iU2iIeHUf0.weJeIaOHRft8yE2MoMFFQmiRPrAME9DpkFCdgy',NULL,'2026-02-02 07:18:30','2026-02-02 07:18:30','user',3),
(491,'SAJONIA',' EDIBERT Q.','1164','$2y$12$9hS/lKOu4gB.q5mAaAsQCOprTiOfdb9cyiDnTTgLDKNcQiEEPeSiS',NULL,'2026-02-02 07:18:30','2026-02-02 07:18:30','user',3),
(490,'RAPIRAP',' RUEL A.','1163','$2y$12$tLtfI28.uP9awdezqZk4KO92viKMhP0buyroMo6V3m/nmM34YMwmq',NULL,'2026-02-02 07:18:30','2026-02-02 07:18:30','user',3),
(489,'PEPITO',' ATANCIO G.','1162','$2y$12$sQopePQNSmeYzSOiIPnStesI2iZjscYpdtI/F7Y32VouYTpCOkHdK',NULL,'2026-02-02 07:18:29','2026-02-02 07:18:29','user',3),
(488,'PAYLA',' ERWIN O.','1161','$2y$12$Ru7EX9rZOF.0cV5bZn2bvu6aj8g5EUX5jEvIXpbFfXjWN.l5lgQcC',NULL,'2026-02-02 07:18:29','2026-02-02 07:18:29','user',3),
(487,'PARREL',' MICHAEL ROBERT Y.','1160','$2y$12$Ss3Y8U45SMdGKu9L6empFONBW9qSrwe0J16PJh8E/tpoF2pl4vwfy',NULL,'2026-02-02 07:18:29','2026-02-02 07:18:29','user',3),
(486,'PADUA',' ELVIS B.','1159','$2y$12$SSRYR.59Ou4oERRbNHcfy.NXHOr3ApOgzBKipIHkPeDkqNQMrkAoS',NULL,'2026-02-02 07:18:29','2026-02-02 07:18:29','user',3),
(485,'PACURSA',' REO G.','1158','$2y$12$kEe6BHyZOd3xrS9kfqCGdeqk3.Y/ULPHpVr3aBYCchPKlZkVRW362',NULL,'2026-02-02 07:18:29','2026-02-02 07:18:29','user',3),
(484,'PACLAR',' ERIC H.','1157','$2y$12$SIaIyRS5KJyCBXyfKj/CJu7EcyVQDST1vnTQYYKqPzkpQGfHJzjdW',NULL,'2026-02-02 07:18:28','2026-02-02 07:18:28','user',3),
(483,'ORTEGA',' HEATHCLIFF B.','1156','$2y$12$dLLXWQVh.8zG/73uDlJZ8OHTYZfqBxjEkd3uFbyxyHNUygE1ra8HC',NULL,'2026-02-02 07:18:28','2026-02-02 07:18:28','user',3),
(482,'ONDAP',' MICHELLE ANNE G.','1155','$2y$12$EWrGq23mG8844dRrxgUNneVsxuOUOaXLozbDqtqdv/g2DF3LjXNNO',NULL,'2026-02-02 07:18:28','2026-02-02 07:18:28','user',3),
(481,'OLVIDA',' JUDY L.','1154','$2y$12$y3jeU.815HzfNhdcc2QNdeCXLQv8wYfM7c4Q/W0DtxaTYrOrGQA26',NULL,'2026-02-02 07:18:28','2026-02-02 07:18:28','user',3),
(480,'OBSIOMA',' HEZIR Y.','1153','$2y$12$iGDvP2SSQhSlK4DfkdAgruUAbvFaxzFnc5GjK.VrG1BwUnqE9ZYyu',NULL,'2026-02-02 07:18:27','2026-02-02 07:18:27','user',3),
(479,'NOBLE',' SANDRA D.','1152','$2y$12$4IkuqUv1G4hyTNjBmzvX4eO2eRwHDfmEIZy9JPwszXGyMeYwTUUZi',NULL,'2026-02-02 07:18:27','2026-02-02 07:18:27','user',3),
(478,'NAGAC',' KENNETH ROBERT E.','1151','$2y$12$uQSHQfpgyY5x528kvUkoz.wLxMWwQwmb1b.i4VlI1Rz.yFfUm3mkW',NULL,'2026-02-02 07:18:27','2026-02-02 07:18:27','user',3),
(477,'MUTIA',' LILIBETH A.','1150','$2y$12$gwsyfflEN7.sl9EFG3gx9eJ62ygobPpYslFIVh455fM.EawuNEawq',NULL,'2026-02-02 07:18:27','2026-02-02 07:18:27','user',3),
(476,'MISO',' ANTHONY EZEKIEL E.','1149','$2y$12$edu25l1DqHCeb8jpZqn2j.a8BVfv/rO6B2lPr8I/bDVXFWvI8zFH.',NULL,'2026-02-02 07:18:26','2026-02-02 07:18:26','user',3),
(475,'MENDEZ',' REX GLENN O.','1148','$2y$12$qWemVc3sP8/etAAbIa6Z.u3DY3qpa/wb7LBH6BD9JjEbpjS0qqUTe',NULL,'2026-02-02 07:18:26','2026-02-02 07:18:26','user',3),
(474,'MADRIGAL',' BRYAN IAN C.','1147','$2y$12$UKRU7Zp5K/cBPsxf/bT0peZw6UZg2.7ze7JQar7pJBnn0QANy51me',NULL,'2026-02-02 07:18:26','2026-02-02 07:18:26','user',3),
(473,'MACAMAY',' RENATO A.','1146','$2y$12$iX6pvfrVspISjcYFgV6K0etpA6y3vPfhSXhbrUiqDEUkVXxdcqXJK',NULL,'2026-02-02 07:18:26','2026-02-02 07:18:26','user',3),
(472,'LOMOLJO',' DIOVIR ADRIAN C.','1145','$2y$12$6TySm6F/.TnTJK.c8ZNdTuwsL6NKeJT3wCDfka4xNLvqA9M0Ekn/K',NULL,'2026-02-02 07:18:25','2026-02-02 07:18:25','user',3),
(471,'LAGO',' STEVE T.','1144','$2y$12$BkogV0A0/AJKTJ1afNfeTuLFfEa5.3NIo7HPJ1xWX7gvBD/kot0SC',NULL,'2026-02-02 07:18:25','2026-02-02 07:18:25','user',3),
(470,'GENTILES',' DORIS B.','1143','$2y$12$WU6tYSvEi.GdB2k.72OVkeAasYgicbIlg3NxVKpC46hnNPzyi/QFO',NULL,'2026-02-02 07:18:25','2026-02-02 07:18:25','user',3),
(469,'GALLEGO',' FERDINAND S.','1142','$2y$12$1i0umze/PnwCRzK22EqpjuzTxVy4QZGUDwm15TzBJ98vRQyl1t88G',NULL,'2026-02-02 07:18:25','2026-02-02 07:18:25','user',3),
(468,'GALINDO',' RODNE S.','1141','$2y$12$xL8d3ByJph3hDbSk6sWk3uSLlaf9TwGa2eE9Zv88fc.D8DJyNNZci',NULL,'2026-02-02 07:18:25','2026-02-02 07:18:25','user',3),
(467,'ESTRADA',' PETER JR. P.','1140','$2y$12$tLIwxTFn6ieLjAdV7iqPv.13kDWzaVxc27n4Do7IL9w8l/FBSEpuK',NULL,'2026-02-02 07:18:24','2026-02-02 07:18:24','user',3),
(466,'EBDALIN',' ALFRED C.','1139','$2y$12$AHToonJeS78Pa.hB.D2If.6TMoXQjUXFq4ngsK45A/IxlqxjpKM6C',NULL,'2026-02-02 07:18:24','2026-02-02 07:18:24','user',3),
(465,'EBARAT',' MA. ROWENA V.','1138','$2y$12$YN/gHxLkkyto5Tbywn5KKusZFaFvFevwl0j035MRM9a5B49mEBXMi',NULL,'2026-02-02 07:18:24','2026-02-02 07:18:24','user',3),
(464,'DUMALE',' RAUL B.','1137','$2y$12$QAMHaGIMQbWckWogwB6.wuqq42t.xWe/o9wRQB8V4jjhly7.2dEKW',NULL,'2026-02-02 07:18:24','2026-02-02 07:18:24','user',3),
(463,'DOROMAL',' JOFRAN P.','1136','$2y$12$t0eV3UrNxTFxDPO6cxHWJObFp5ngFV0AaWwwOkbuHPtZ3Abtl8FTi',NULL,'2026-02-02 07:18:23','2026-02-02 07:18:23','user',3),
(462,'DEDICATORIA',' BERNARDO JR. T.','1135','$2y$12$1DGQb7F1RR4sfEEV2nGl6O416AhQvxwcTVwlN.k.0Oad7OtyzmPam',NULL,'2026-02-02 07:18:23','2026-02-02 07:18:23','user',3),
(461,'DAGUIMOL',' MARRIAN E.','1134','$2y$12$IW/IZ230i66dIG9ErKRPiOoDqfAizA0MEARHEtfML3v7dX6oRxsP2',NULL,'2026-02-02 07:18:23','2026-02-02 07:18:23','user',3),
(460,'DACER',' LARRY R.','1133','$2y$12$RX1ibcmd2XW1PGoQ5kbyUO/ldwiS/ZlCfrz2qovkUKBvHNh1Fz0Yy',NULL,'2026-02-02 07:18:23','2026-02-02 07:18:23','user',3),
(459,'CASENAS',' REUBEN E.','1132','$2y$12$qIItr1M7KdsB7H0K3Y6SF.JzgTTaUGWkHMeve2mzZHcX0w/tR1asq',NULL,'2026-02-02 07:18:22','2026-02-02 07:18:22','user',3),
(458,'CAYLO',' RAYMOND JAY T.','1131','$2y$12$A02QIvifcKofZtcEa8iRyeKZqTJy07hid7Nz92mMgH03oYGNKIF4S',NULL,'2026-02-02 07:18:22','2026-02-02 07:18:22','user',3),
(457,'CALALIN',' RAMON A.','1130','$2y$12$8VWLBI1GKF8RXIKacioWmuZL.xDMdnKPGksYKM54StVSpuxxXzrhS',NULL,'2026-02-02 07:18:22','2026-02-02 07:18:22','user',3),
(456,'CABUNOC',' LIOVIR J.','1129','$2y$12$H8EJ9J.YCybY4als.BhWtOOcCjCW3Aj1DUbbUKejgf2fPQVFVTOO2',NULL,'2026-02-02 07:18:22','2026-02-02 07:18:22','user',3),
(455,'CABREZOS',' JOSE MARI C.','1128','$2y$12$X1FRlQ3ZzyQTwD7MQpL1tOudp9i259YuzRtVtyiTRiHQ4zXQZCYBi',NULL,'2026-02-02 07:18:21','2026-02-02 07:18:21','user',3),
(454,'CABAHUG',' JOJIE MAY B.','1127','$2y$12$uo.XEUDMrvXeqa6T.0jLe.IcZfgV4d88OMDzc37R4Bmc/g8JKvXTS',NULL,'2026-02-02 07:18:21','2026-02-02 07:18:21','user',3),
(453,'BRUCE',' ROMMEL JIM O.','1126','$2y$12$r91y/6QgJPeDKxKwbhyY/u2Br5sRZCIKbx5Togn27I8Ptmr9GV5qu',NULL,'2026-02-02 07:18:21','2026-02-02 07:18:21','user',3),
(452,'BONGBONG',' CRESTE JOY S.','1125','$2y$12$.N0lS3qBUfgfoey7r2pukuBhwrnJ2gp7V2CAf9ElZ51Bi8b42CFoG',NULL,'2026-02-02 07:18:21','2026-02-02 07:18:21','user',3),
(451,'BERNARDO',' SHEIRA M.','1124','$2y$12$HU1dusCSp1wLwJiwxXREHOK8yq.sHYLTAzJZa0fR80rgqafcBA.Ji',NULL,'2026-02-02 07:18:20','2026-02-02 07:18:20','user',3),
(450,'BARON',' ERNESTO D.','1123','$2y$12$.XYTHP/VAfTFht6Smr5JT.aJch/TBZga8DLxbo3.FY3TdFCO/j4K2',NULL,'2026-02-02 07:18:20','2026-02-02 07:18:20','user',3),
(449,'GRANADA',' TAHITA RENZA B.','1122','$2y$12$n8HtpFRzxWXug8rwkndMte9pQ0zXFcAx1kpIz1Uow8ZpY4eV5DCcG',NULL,'2026-02-02 07:18:20','2026-02-02 07:18:20','user',3),
(448,'AYUBAN',' BAYANI B.','1121','$2y$12$qS8OYXZWLrdZMVYDP.FxSevQi0sOdrWU2bN9nRNqusv8Z6yL7tFeW',NULL,'2026-02-02 07:18:20','2026-02-02 07:18:20','user',3),
(447,'ALMOJUELA',' DANILO Y.','1120','$2y$12$fjyUItI8tBQgCwMZbTKJN.O6Ep429d1JcRTH3xfN4m8LxWIEzm4Su',NULL,'2026-02-02 07:18:20','2026-02-02 07:18:20','user',3),
(446,'ALFABETO',' GASPAR N.','1119','$2y$12$nn1fil0o9I30NDrhtCJpn.DGNFslab8jFtzWbcqKVB5uHbscxz/Ze',NULL,'2026-02-02 07:18:19','2026-02-02 07:18:19','user',3),
(445,'SUSMIRAN',' KATHERINE C.','1118','$2y$12$8YlgHNGluKGh1EN373iT9Obpk1KkTirDOhheGl3w9u31mlNEo9SxK',NULL,'2026-02-02 07:18:19','2026-02-02 07:18:19','user',1),
(444,'FAJARDO',' CHRISTIAN NICO D.','1117','$2y$12$PEigTpg7PfKcfB7dLulDy.zch391wsYNdYrU0ZoNGwzN80TXfhWoW',NULL,'2026-02-02 07:18:19','2026-02-02 07:18:19','user',1),
(443,'BELEN',' JUSTINE NICOLE C.','1116','$2y$12$CRVxGw2ZridTSuR15ODgwurbQuInJYLEcoDCNkyqN9HMaSqVxQGwi',NULL,'2026-02-02 07:18:19','2026-02-02 07:18:19','user',1),
(442,'AVENIDO',' ANGELI D.','1115','$2y$12$HIjvnYLaLSxgSef.q04ZteT6QVB5a665k7V2YKijyY12fwycC9tRy',NULL,'2026-02-02 07:18:18','2026-02-02 07:18:18','user',1),
(441,'ABRAGAN',' ARMIE B.','1114','$2y$12$Kra5UTk3TOJfQ0OL7V2W4elOzrB47kjAH4GBXgdXZ2bJOkR1cBX2K',NULL,'2026-02-02 07:18:18','2026-02-02 07:18:18','user',1),
(440,'SEVILLANO',' KAREEN R.','1113','$2y$12$hoQIujRYlvyHalGJxGaBKOg9yF2M376VRfKfpz4ZuDFRsrjrZvAlq',NULL,'2026-02-02 07:18:18','2026-02-02 07:18:18','user',1),
(439,'BATAR',' MARIA MERCEDES M.','1112','$2y$12$EhmzC1RdDYYwRskFtlvsZudFDlECC.JFxgkvgHA5GDZsrHK150yQC',NULL,'2026-02-02 07:18:18','2026-02-02 07:18:18','user',1),
(438,'YEBRON',' PAUL GJHON N.','1111','$2y$12$/HCqbJ8wVWZgrsq3vbSx1OAsCfi7FUguiUi6mfTimTzvgltSy4ZVC',NULL,'2026-02-02 07:18:17','2026-02-02 07:18:17','admin',1),
(437,'YANCHA',' BERNARDO B.','1110','$2y$12$kOrZfDiDWim/gmlcY.EzuuMuKQdgnnGWdfeNQ6AYSqDqGaTU.ZIoq',NULL,'2026-02-02 07:18:17','2026-02-02 07:18:17','user',1),
(436,'TEOPIZ',' EARL JOHN Q.','1109','$2y$12$jqXAY/Iz6dmwN/NOChbUXO2K4AO7x0oP24Yf83Ilt8uAjXHrEboB.',NULL,'2026-02-02 07:18:17','2026-02-02 07:18:17','user',1),
(435,'SALTIGA',' RAE ANNE M.','1108','$2y$12$HLPxdRIvVSvjJn..oMWEH.sl9oVi87PqkyV5jOoJN0rsh5dYtbrH2',NULL,'2026-02-02 07:18:17','2026-02-02 07:18:17','user',1),
(434,'SALAZAR',' JOHN SIDNEY','1107','$2y$12$4YHpCcPnGcWT83gGw5PlkOiaUtEI4hFwoNnnbTauQ9PzKhzkPeZ8q',NULL,'2026-02-02 07:18:17','2026-02-02 07:18:17','admin',1),
(433,'RUITA',' LYRRALYN A.','1106','$2y$12$D9acrLc.tyQx1BCslrvjpOqPEt2ybXxZOvRxGeqB0a5zcQVyJ7ka.',NULL,'2026-02-02 07:18:16','2026-02-02 07:18:16','user',1),
(432,'RODA',' GEEMARIE GRACE A.','1105','$2y$12$4IXNZykHnxuduDW.OfW.S.7yMxbvWzaxY2i0DVfKNFxfH9ep.FIoy',NULL,'2026-02-02 07:18:16','2026-02-02 07:18:16','user',1),
(431,'NERI',' SHARON C.','1104','$2y$12$XJeN2vTFDqeJNssWGgqIoOIq2zWz7qBcA5MlKoVXkzaMwt8Bujl9a',NULL,'2026-02-02 07:18:16','2026-02-02 07:18:16','user',1),
(430,'NAVARRO',' ANALE C.','1103','$2y$12$bIBBFZ2Z5rlJhRGGsZarOe9efdEUAdXx0SD91SuSaKVbnWQab2QzW',NULL,'2026-02-02 07:18:16','2026-02-02 07:18:16','user',1),
(429,'MACALOLOT',' ANNALYN F.','1102','$2y$12$iDKntCs8mh9hLsHZW2e.s.ZbhlDKKCVftlp5eCfkABEaoUCy2CGcO',NULL,'2026-02-02 07:18:16','2026-02-02 07:18:16','user',1),
(428,'LONOY',' GRACE ANGELI G.','1101','$2y$12$xKhEcmn3GgQPn5RtuLIxR.dXD5O1LmMFiu34o4zdHU1jqiGsdUn/e',NULL,'2026-02-02 07:18:15','2026-02-02 07:18:15','user',1),
(427,'LABITAD',' MARIAN C.','1100','$2y$12$iNR3YT9/l02WPjpBBSUU1uhiMvPMgV8c1YnMNpDk13PJ4aZfH6pkS',NULL,'2026-02-02 07:18:15','2026-02-02 07:18:15','user',1),
(426,'JUDITH',' MA. NANETH F.','1099','$2y$12$xuZaYQFBm6Vfu7nifvCLle.OTKnKCN.sbT7hhNMuE64ywqr3KLeHC',NULL,'2026-02-02 07:18:15','2026-02-02 07:18:15','user',1),
(425,'GALARRITA',' REYVIC P.','1098','$2y$12$3AwVcn96O.rMdVVTeQKvHeuvDXWVOJ61xsQwj/NhtvCxQQulc4ZSi',NULL,'2026-02-02 07:18:15','2026-02-02 07:18:15','user',1),
(424,'ENCARNACION',' ANGELO H.','1097','$2y$12$JJttVumjtNbw6pruxDROvOUzYIqFL7KAVfuF9OaqzsAmawuxk6zna',NULL,'2026-02-02 07:18:14','2026-02-02 07:18:14','user',1),
(423,'DIANGO',' KAREN S.','1096','$2y$12$gAZSlfKlZWKmIfzKHEyrLOHNNSDYj7Fs8pHswUmJqFRtYBNdvhkyW',NULL,'2026-02-02 07:18:14','2026-02-02 07:18:14','user',1),
(422,'DELOSO',' SWEETSELL T.','1095','$2y$12$jDBa/z0nvk2X0NTmKKNz4.l16GlDV64jKWqTgCI4PPa1ov5cA1Ho6',NULL,'2026-02-02 07:18:14','2026-02-02 07:18:14','user',1),
(421,'DELIMA',' JUDEE P.','1094','$2y$12$KHPDLPLGgnMEZ.DOtgd/9eO7VC6rtnAoBmlMeDpk5Xm9qacPQkZby',NULL,'2026-02-02 07:18:14','2026-02-02 07:18:14','user',1),
(420,'CHIONG',' FRANCES C.','1093','$2y$12$IlkQ0L6LVPeeQeagXytD2uuPBphr7/3J2ev4q.48i/z/5HvXuGJ7O',NULL,'2026-02-02 07:18:14','2026-02-02 07:18:14','user',1),
(419,'CHAN',' GARY NICHOLO G.','1092','$2y$12$Zi3aZoXK7rPym04KELPe5OW7rkTX57a1nh8pq4LIH23wqAHNfJlMy',NULL,'2026-02-02 07:18:13','2026-02-02 07:18:13','user',1),
(418,'CERIALES',' CHARLYN B.','1091','$2y$12$oU9zvsZTtk9XNn.4Z3STeeUGjuPMDJMNnyVBzkUFSHjIiu91KlBCW',NULL,'2026-02-02 07:18:13','2026-02-02 07:18:13','user',1),
(417,'AMPER',' MARK AUGUSTINE C.','1090','$2y$12$D5HfUA9R5RMvAej6v5ztCuU4M4xA.mH1z3xkHHFVIUUVVlxJV00VG',NULL,'2026-02-02 07:18:13','2026-02-02 07:18:13','user',1),
(416,'ABRAGAN',' JOSE JISELO P.','1089','$2y$12$aomKuwZOexEh5V8f8pRgwez63.ryCVUw72GTTEWrh9vD2I6bTWy.K',NULL,'2026-02-02 07:18:13','2026-02-02 07:18:13','admin',1),
(415,'WE',' GISELLE G.','1088','$2y$12$WiwR4IqtD8SFhvUINo.jJ.PEsZJy9DWUeFMTsvxtOW8wp3mJfuXO6',NULL,'2026-02-02 07:18:13','2026-02-02 07:18:13','user',2),
(414,'VILLEGAS',' GLORIA H.','1087','$2y$12$iuQK1.WCmiqEEgxCpb3JsOK0JApmWi1/fpEd.qZWvPnptu2eavCda',NULL,'2026-02-02 07:18:12','2026-02-02 07:18:12','user',2),
(413,'VASALLO',' MA. EVELYN O.','1086','$2y$12$O/8K7vhz94dyWDUPWjUVWu1n/LfwSBXtNO2Iujo8M9JAQMeZuRykO',NULL,'2026-02-02 07:18:12','2026-02-02 07:18:12','user',2),
(412,'UMARAN',' LILIAN A.','1085','$2y$12$D35snlHJQmALBx7mExxJVuFouPA8THgbQDEPn/QRPF5kMSPitvCF2',NULL,'2026-02-02 07:18:12','2026-02-02 07:18:12','user',2),
(411,'TOLENTINO',' ROSELYN L.','1084','$2y$12$j9dfcYAb.E8TToIJ53Ig8uOIHvkJ5qjcLUZZllFEEu8.2sjxM373a',NULL,'2026-02-02 07:18:12','2026-02-02 07:18:12','user',2),
(410,'TERRADO',' ANGELA S.','1083','$2y$12$HohlIwmDpxrcqGsbxqZlPekzRVcUnJrqcsI7Zcz5we/XUrld0zJvS',NULL,'2026-02-02 07:18:11','2026-02-02 07:18:11','user',2),
(409,'RAMOSO',' CHARLYN J.','1082','$2y$12$DstrcxhWCFJ5LtDizmnf3.0A.ft4ALvf1pC9SH3s6EKXwg3HPtIgK',NULL,'2026-02-02 07:18:11','2026-02-02 07:18:11','user',2),
(408,'RAMIRO',' MARISA MAY L.','1081','$2y$12$J/.kWfyjnFYTndoOSM5FfOwJKjIb0PQx.NmrAbMM/JDeGbrNd.r9.',NULL,'2026-02-02 07:18:11','2026-02-02 07:18:11','user',2),
(407,'PATANA',' RHOVIN B.','1080','$2y$12$OL3zSqarwlWDO1pMM3u0Gu.kkPFYXuRdQxOvZaxWUeY6yCkfciHFC',NULL,'2026-02-02 07:18:11','2026-02-02 07:18:11','user',2),
(406,'PABILLARAN',' KENNY JEAN A.','1079','$2y$12$IdGaMCQ3FtPOzPsuQdL4eOWq1bRILp7k6P1A8k7dUsK8pvSTGaTO2',NULL,'2026-02-02 07:18:11','2026-02-02 07:18:11','user',2),
(405,'OLEGARIO',' ELISA N.','1078','$2y$12$RjkmjqFvsj1wuB47NKWmhurWlYvUtxqjOweudmDNhKxH.lkfsxS/e',NULL,'2026-02-02 07:18:10','2026-02-02 07:18:10','user',2),
(404,'NAMOCOT',' NORIAN C.','1077','$2y$12$J4PL7.M.toFj.gd26Zd2beaIB2IIXawKx6i2HmHicaDuK3mkBH5ye',NULL,'2026-02-02 07:18:10','2026-02-02 07:18:10','user',2),
(403,'MINGUITO',' MARIA THERESA D.','1076','$2y$12$wYuLP2TUR0Gl9aAD8Ssm.e2Z2VpIpG/zjVUI9bgd5BkaK7556eE8u',NULL,'2026-02-02 07:18:10','2026-02-02 07:18:10','user',2),
(402,'MATALUM',' IAN PAUL B.','1075','$2y$12$gBW9B8oaGLYohODZHdaeC.ni3YLa5.C1eFrdxR8xSdiLbGBXLS6uC',NULL,'2026-02-02 07:18:10','2026-02-02 07:18:10','user',2),
(401,'LAYON',' JOSEPH L.','1074','$2y$12$aDNBql4DrTLra6oGoGU5guwU.6WIE4ozq257tlmYYsPGryVWIBC1W',NULL,'2026-02-02 07:18:09','2026-02-02 07:18:09','user',2),
(400,'ALLADO',' JOCHING L.','1073','$2y$12$26CFrKib0/y.JwmvFvt8ruQRpSfyTOh.e1OfTB1ThSUqTbnzs0Zaa',NULL,'2026-02-02 07:18:09','2026-02-02 07:18:09','user',2),
(399,'KIUNISALA',' MARY ROSE A.','1072','$2y$12$IsXv8oNClhKB/KFP/sCEVO8RSWdu0DW3.PsQr8LQmdqu2vKwZoPYC',NULL,'2026-02-02 07:18:09','2026-02-02 07:18:09','user',2),
(398,'GALOLO',' JANEL DIONNE Y.','1071','$2y$12$lgJnDpSuab37X5xzRZqcXefazHZYSFMpBJCuUwkUpqQRKq4dFIB8q',NULL,'2026-02-02 07:18:09','2026-02-02 07:18:09','user',2),
(397,'FINNEMORE',' EUJELYN L.','1070','$2y$12$Jt2jLWsWwPp.lDzfHcfREeawaSI0xNGkv4OobAW6xPCNefI3MmwlO',NULL,'2026-02-02 07:18:09','2026-02-02 07:18:09','user',2),
(396,'FERNANDES',' MARC DANIEL L.','1069','$2y$12$YMgHtOtTGjWCJHzFFcPlEepJ1kPn5gq3kaHOzVujLskfXwHjVglZa',NULL,'2026-02-02 07:18:08','2026-02-02 07:18:08','user',2),
(395,'DIAZ',' VIRGINIA J.','1068','$2y$12$/kwXMUK39PYTwAMYa8m8buF.Vzuaz3/6GMawaguZii.bjuf69eaaK',NULL,'2026-02-02 07:18:08','2026-02-02 07:18:08','user',2),
(394,'DIAZ',' QUENNY EARL J.','1067','$2y$12$Geh5RCSwtQLMifU.Q0CR5uOcxsR9.J1SBxKAF.qZuZEDyvZbYV0se',NULL,'2026-02-02 07:18:08','2026-02-02 07:18:08','user',2),
(393,'CAPARIDA',' CHERIEL C.','1066','$2y$12$Y/SaWB1kmLI6kdhE4c8TwupjbIggBbX95/r/LHmVWDb2x0i01hfQq',NULL,'2026-02-02 07:18:08','2026-02-02 07:18:08','user',2),
(392,'CASINILLO',' LEOZIL S.','1065','$2y$12$t1j5KdnCt6s3ohG7fY6hSeuaEaGgCfxtEhFdhh0VMs5gVyXyYJj3W',NULL,'2026-02-02 07:18:08','2026-02-02 07:18:08','user',2),
(391,'CAPISTRANO',' KAREN O.','1064','$2y$12$Bh1Om5xcAxCcOro18ibEpOMRMgEdIDbfDnNYpZ9fO7z3AfXP6Dug2',NULL,'2026-02-02 07:18:07','2026-02-02 07:18:07','user',2),
(390,'BONDAL',' MARITEL D.','1063','$2y$12$kf2v/164vVoRI/Ji9mSqTupjyEKCw0Yir0/hodkw/caI9lNwJRbAa',NULL,'2026-02-02 07:18:07','2026-02-02 07:18:07','user',2),
(389,'BELLO',' LIBERTINE R.','1062','$2y$12$yB2nTfne7n3EpbHGGFq06OiMjJ4BU7JB68x95uNN20y27xlnTUN5e',NULL,'2026-02-02 07:18:07','2026-02-02 07:18:07','user',2),
(388,'BEJA',' DEWEY FRANCE E.','1061','$2y$12$QzRoRy2ZIC7OvbEJGtxeOuk1jA08/xO7GW/soLYgfgRQOcobBXLbi',NULL,'2026-02-02 07:18:07','2026-02-02 07:18:07','user',2),
(387,'BAHIAN',' PAUL WISMAN T.','1060','$2y$12$jG.05yCO31CA26ZkkEUSbu92jQlpcERQrGdyQgxDirtP1vKQUETnG',NULL,'2026-02-02 07:18:06','2026-02-02 07:18:06','user',2),
(386,'BAHIAN',' JOVELYN S.','1059','$2y$12$FkIZT8XpGVfKNVQyRRqSVe2cw7CHUmWr2CbZw0iU7/QhPoVUlH.Gy',NULL,'2026-02-02 07:18:06','2026-02-02 07:18:06','user',2),
(385,'BAGUIO',' KEN B.','1058','$2y$12$Kcz4uF86HRyOxRAi4MFsrO18i0EEUa.kpgZaQRozrYWZEKzaOan2y',NULL,'2026-02-02 07:18:06','2026-02-02 07:18:06','user',2),
(384,'BAGAY',' JESSA B.','1057','$2y$12$3drKx8SHJ0lQrkownyQIy./b/FQbRV6oRVC9whGxbDAFdcEOb8nWW',NULL,'2026-02-02 07:18:06','2026-02-02 07:18:06','user',2),
(383,'BAGAY',' JAY-AR  B.','1056','$2y$12$cgPX/PRrtNI7kkz5x8Q7jOlY1LZcuwPIoHweakYWDE0WG8t2opWNS',NULL,'2026-02-02 07:18:06','2026-02-02 07:18:06','user',2),
(382,'ARCILLAS',' HELEN C.','1055','$2y$12$ZnyEnJZHFYeAYKwmAt71F.AnN7NppS/LdiXjRWGWLCsQYnOYDUrCq',NULL,'2026-02-02 07:18:05','2026-02-02 07:18:05','user',2),
(381,'YANEZ',' REY ASTER A.','1054','$2y$12$4kcmMJ24hq1jCu0R6e7SG.9M6yTD0xL1otsQE/GycpNN9l1LYLIwi',NULL,'2026-02-02 07:18:05','2026-02-02 07:18:05','user',7),
(380,'VILLAREAL',' NOEL N.','1053','$2y$12$G49WnI0oAYHfYmBlXztMD.BZwcefNYKqWCLQ/CPXmeEKVAGTYq0fS',NULL,'2026-02-02 07:18:05','2026-02-02 07:18:05','user',7),
(379,'VALENZUELA',' MERLE CORAZON R.','1052','$2y$12$OtoyCmW301MdyayFuMasReSjizJk5ewpySIG9138oweEvzilNrnT.',NULL,'2026-02-02 07:18:05','2026-02-02 07:18:05','user',7),
(378,'UBAY-UBAY',' ED A.','1051','$2y$12$Nepu3oRD2sSF/wkRt7cyS.LlyN..kp.ieBW08y4k8A2kB1g8sp1t2',NULL,'2026-02-02 07:18:05','2026-02-02 07:18:05','user',7),
(377,'TUMAMPOS',' ROLANDO J.','1050','$2y$12$pKCDZAhJN1Xrd0HEt7Pd9eFVMSjymf4H1D2fiQ8WeKJu0gUeaRnnS',NULL,'2026-02-02 07:18:04','2026-02-02 07:18:04','user',7),
(376,'TORILLO',' RUDY U.','1049','$2y$12$OEQR/AVPtCJZJFKZSKiagufldRJFPy8ZTttGjtrqNDTMhoby6Qd6K',NULL,'2026-02-02 07:18:04','2026-02-02 07:18:04','user',7),
(375,'TAGLUCOP',' JOHN D\'EMEER E.','1048','$2y$12$5m5gsNB27AURmwIu2kIoc.iDI4NKAwNv7EMge3/6A7f9bgyh5XTJK',NULL,'2026-02-02 07:18:04','2026-02-02 07:18:04','user',7),
(374,'SOLIS',' ROLANDO V.','1047','$2y$12$4kMXAmaz7xaG8Yi3v7XeS.Eq6kBnDog70zoRZ4csrMbf8RXfHZVNu',NULL,'2026-02-02 07:18:04','2026-02-02 07:18:04','user',7),
(373,'SIMBA',' ROLAND N.','1046','$2y$12$pl/mHMHegAx.C0mAe1xr8.TBR3EvsfQLy7LpW3syWWfhL90cVgke6',NULL,'2026-02-02 07:18:03','2026-02-02 07:18:03','user',7),
(372,'SAROL',' FERNANDO JR. L.','1045','$2y$12$pKdMkzMlC/F23MdUfCH0c.fq4Gu5Lgx8xJPT4JiOuFAV11iZkMRCu',NULL,'2026-02-02 07:18:03','2026-02-02 07:18:03','user',7),
(371,'SALIRING',' NICO DELFIN S.','1044','$2y$12$msl5raCJh24z/S273ilOVOtZhGP.anHUpbKli3hbAML6tRhaJnbUG',NULL,'2026-02-02 07:18:03','2026-02-02 07:18:03','user',7),
(370,'SALIRING',' NICOLIN S.','1043','$2y$12$zJ81XoKrT6zimScDYa6icuQKiS.l7KlTYgPdhNGWjQ/A7NYcW4Oei',NULL,'2026-02-02 07:18:03','2026-02-02 07:18:03','user',7),
(369,'SABURAO',' ARVIN N.','1042','$2y$12$XiTlnt15RzT1N9GZ..vK.e51uQXut/4thnwag9pvZUXxmfG7PuF8q',NULL,'2026-02-02 07:18:03','2026-02-02 07:18:03','user',7),
(368,'RUITA',' LEO N.','1041','$2y$12$RN85iGJw8.MFPUPoyaTdG.THyykwaJRtpYnKzbqGd6ibzYsvGPmBS',NULL,'2026-02-02 07:18:02','2026-02-02 07:18:02','user',7),
(367,'RUFINO',' KRISTA AIZEL M.','1040','$2y$12$UeceleSrErftGZoSx2JpMuWi4AgYXx08qpVi7CA6.wkWdbSVYK7.a',NULL,'2026-02-02 07:18:02','2026-02-02 07:18:02','user',7),
(366,'RODRIGUEZ',' ROLLY E.','1039','$2y$12$phHt/qUda5fW5AcV4oIpZOeoQVxtTWWoZok0k/xXjATwG5jwiqPMG',NULL,'2026-02-02 07:18:02','2026-02-02 07:18:02','user',7),
(365,'ROCAMORA',' RYAN C.','1038','$2y$12$7B4xHUD6V.hxKnpolLWMNOWvQsHraBZXRase3UCyIDtse/ARjU6C6',NULL,'2026-02-02 07:18:02','2026-02-02 07:18:02','user',7),
(364,'REQUINO',' JOSE JR. P.','1037','$2y$12$CYS5TVNtOkvSDLBXfpIXFejV9W7F5XQL8YS/WoKNECJVCt5r8dgta',NULL,'2026-02-02 07:18:02','2026-02-02 07:18:02','user',7),
(363,'REQUINO',' CORLEONE L.','1036','$2y$12$ZUiF6rI6oc4sSE.hNuUtAeBQmr/ACo0ffjvI66YpKszNo46raUw.O',NULL,'2026-02-02 07:18:01','2026-02-02 07:18:01','user',7),
(362,'RAMIENTOS',' CHARMAINE MAE  T.','1035','$2y$12$TaMA83FbMkbec7H2/VIF/uItlxjYkyQbecFYYsCXUk6OiwU72oH.6',NULL,'2026-02-02 07:18:01','2026-02-02 07:18:01','user',7),
(361,'OREDINA',' JOSEPH LOU C.','1034','$2y$12$KB4kQ/rbHNfHkZvgyph3ROXZDVw0ZbxdackXNJu1ozhWsqJaqc/Fa',NULL,'2026-02-02 07:18:01','2026-02-02 07:18:01','user',7),
(360,'NERI',' IVES DEXTER C.','1033','$2y$12$hcUXFxfdlEKmwpvYSLIXzuKpSirJELZuiTSV9LwVd69w6c51n0pVa',NULL,'2026-02-02 07:18:01','2026-02-02 07:18:01','user',7),
(359,'NAINGUE',' HAROLD JR. T.','1032','$2y$12$cP0f6PYYiKaDmCRY/6.Hd.0HIUShxvdyXOfrRyDQoPXHy5suFr4l2',NULL,'2026-02-02 07:18:00','2026-02-02 07:18:00','user',7),
(358,'MAGRINA',' JOSEPH A.','1031','$2y$12$ts8aQ.EdOm1dBwBBZTHot.i1W6w.cxNIYG6bI/DXbfPQejDSbjl7u',NULL,'2026-02-02 07:18:00','2026-02-02 07:18:00','user',7),
(357,'LLENAS',' MARIBETH M.','1030','$2y$12$vQAbXM5mzrYBofJWWHIZau5G2z/VjzVUmc1U7vkqq9fpZm9tn3kka',NULL,'2026-02-02 07:18:00','2026-02-02 07:18:00','user',7),
(356,'LEGASPI',' OLIVER M.','1029','$2y$12$Y6RKRPHT65zr2H3f0VejR.UM68K4KXuD4ZGUFtJVUs1SkYi9isMLq',NULL,'2026-02-02 07:18:00','2026-02-02 07:18:00','user',7),
(355,'LAREDE',' ROMEO R.','1028','$2y$12$39xhMW/OFUztNtX0Z3sbKudryDzbnkBPnKzKNBDVlBMTE0PW1docG',NULL,'2026-02-02 07:18:00','2026-02-02 07:18:00','user',7),
(354,'LABIS',' ALEJANDRITO O.','1027','$2y$12$0euIfq1NKhuuozA/6/v81.bJEGHmNGygnNN7G64tlyLfNWl4fVgvm',NULL,'2026-02-02 07:17:59','2026-02-02 07:17:59','user',7),
(353,'JUDITH',' JEFFERSON K.','1026','$2y$12$ffWRucYW6M4M8sJ09SsBoufwXzsc8ZKKQ38KFiJFiDeDSasrl5vLK',NULL,'2026-02-02 07:17:59','2026-02-02 07:17:59','user',7),
(352,'GUINITARAN',' ERWIN J.','1025','$2y$12$HyjYxMAEuKfju/CwNT8bO.PbdAw4rOSuHBVJDBLQoX4RAEcodsUHC',NULL,'2026-02-02 07:17:59','2026-02-02 07:17:59','user',7),
(351,'GOYLAN',' EDGARDO P.','1024','$2y$12$9kSwkOWVii2.Ea17GdFvDOc68F/mZ6.LOfh4G9N7oTHbYEaIR8loq',NULL,'2026-02-02 07:17:59','2026-02-02 07:17:59','user',7),
(350,'GARCIA',' CHRISTIAN D.','1023','$2y$12$KK6gKNN2iyMucacWbVxp8./fFkCbY5Ry4fiYm8jU/cNWAvonscede',NULL,'2026-02-02 07:17:58','2026-02-02 07:17:58','user',7),
(349,'GAMBOA',' MA ALVIE LOURENE','1022','$2y$12$Z0gszmHRaHF4nY.o/2ZmfemvTTK6RV1BbyHaNqtnqjp.PRlhYUr1C',NULL,'2026-02-02 07:17:58','2026-02-02 07:17:58','user',7),
(348,'GABUTAN',' JASON A.','1021','$2y$12$Fb3GThKJgaxjvGeosdlqH.Y/8cPGhngFAZzzqxL/Hd8qlxrjmv42i',NULL,'2026-02-02 07:17:58','2026-02-02 07:17:58','user',7),
(347,'GABATO',' RONALD T.','1020','$2y$12$0fm6bARHMT7WliCfpCtS1.TiKP4ab2lWaghDBUJDPtpUJ7hSP23wC',NULL,'2026-02-02 07:17:58','2026-02-02 07:17:58','user',7),
(346,'FLOIRENDO',' CECILE A.','1019','$2y$12$r/Uc.5huA5pAKM51AKuGIOWy5zZIIyXIUMFFZfoCHc2dmLNag4jza',NULL,'2026-02-02 07:17:58','2026-02-02 07:17:58','user',7),
(345,'FERNANDO',' ROEL A.','1018','$2y$12$AAQZM.mHEj0D/7VaR8VutOOLPW4CjB4J3eevBpyz4rhD4V92nyGKm',NULL,'2026-02-02 07:17:57','2026-02-02 07:17:57','user',7),
(344,'FELICILDA',' CHARLITO M.','1017','$2y$12$eIeHiZaP1ZFQb8/c2QhA6eX/sWe61fvX6AXecMzIBEn.CzCsk50lu',NULL,'2026-02-02 07:17:57','2026-02-02 07:17:57','user',7),
(343,'DADULAS',' MARITES U.','1016','$2y$12$5CwleXkshj91EeKrdMUglu.FadWNqkWfzPbdp7SbNs8.Ol0TvQ2qi',NULL,'2026-02-02 07:17:57','2026-02-02 07:17:57','user',7),
(342,'DAANG',' TIRSO U.','1015','$2y$12$JoblMh02LEC1r7VXHZkqpO5TWREPW5BkG0oNpJ2cd0Z1D9UTtZNOK',NULL,'2026-02-02 07:17:57','2026-02-02 07:17:57','user',7),
(341,'COMING',' NINO J.','1014','$2y$12$INWknCfqN.dhiNHkPQra8eiO0iRlG0jrhESdC7AIkHFy.bxf47vTS',NULL,'2026-02-02 07:17:57','2026-02-02 07:17:57','user',7),
(340,'CHAN',' JEANNIE E.','1013','$2y$12$h46WY/wQBDyoAHOG85zb8u3VcwnbtkHT6K9IUBiY6IPXgJ1Ne23tO',NULL,'2026-02-02 07:17:56','2026-02-02 07:17:56','user',7),
(339,'CENA',' JOSEPH S.','1012','$2y$12$jtCqLxbd9llL00NvJ/Jwh.TI0TgNNseyc7/Y5NbFfnnj6L65oYk3a',NULL,'2026-02-02 07:17:56','2026-02-02 07:17:56','user',7),
(338,'CAYLO',' BARRY','1011','$2y$12$ISM7uVUTTeAlAgc39rrO7e92q5f2sNr5Vn7jvUfYdHMaAhyzEvZce',NULL,'2026-02-02 07:17:56','2026-02-02 07:17:56','user',7),
(337,'CASENAS',' LUREMER D.','1010','$2y$12$wdC15igxmQDB.JVPWYX6OOU4WAVMTveV34huCoOlug2E4r05Eq8Ca',NULL,'2026-02-02 07:17:56','2026-02-02 07:17:56','user',7),
(336,'CASENAS',' JOSEPH D.','1009','$2y$12$Ldwlwv3Z9FMNS42fGGjrC.H22TB8wG.maPuZstt6OEOMWJ1.ntx1e',NULL,'2026-02-02 07:17:55','2026-02-02 07:17:55','user',7),
(335,'CAINGIN',' GEORGE D.','1008','$2y$12$/mUFvdaJv3tWWcFrRZBU7OJhANLLR6NKruMKxjGxQDC6e.Voa5Jrm',NULL,'2026-02-02 07:17:55','2026-02-02 07:17:55','user',7),
(334,'BORJA',' SALLY G.','1007','$2y$12$0/Agy.h5bFGuteKB8xPln.aNviPptJ3IFOfKhTsnkbe7GBblrLQde',NULL,'2026-02-02 07:17:55','2026-02-02 07:17:55','user',7),
(333,'BAGAS',' ROGER B.','1006','$2y$12$ZT6b2NssCKkiwFjZmjHGyOX2zYy9mr3pQxHWirbPYLE2w2/lyGSUu',NULL,'2026-02-02 07:17:55','2026-02-02 07:17:55','user',7),
(332,'BACTONG',' CHRISTIAN M.','1005','$2y$12$AwaVstODoRdr0RBht0iBXuIMb1M.MJqIG/2ZQ5UTYsuaxaXO7cWEy',NULL,'2026-02-02 07:17:55','2026-02-02 07:17:55','user',7),
(331,'AVENIDO',' DANILO T.','1004','$2y$12$Gabrpj7ga4tM9y/9puAUx.es7AuDWs8/izOrki6IBOHR07Fgqo7VO',NULL,'2026-02-02 07:17:54','2026-02-02 07:17:54','user',7),
(330,'APAL',' MARVIN C.','1003','$2y$12$Gv4JJGPqqdidfFEBkSkKkOhqcEtSTU78pqZx/bCy.1TzoCxJKbKD.',NULL,'2026-02-02 07:17:54','2026-02-02 07:17:54','user',7),
(329,'ABSIN',' ROSALINA V.','1002','$2y$12$HaYC8Fe/SuJe7Gxlsd711.ID3AuW4X3bALX0D05JTLWqd7TevWBt2',NULL,'2026-02-02 07:17:54','2026-02-02 07:17:54','user',7),
(328,'ABALLE',' JESSIE C.','1001','$2y$12$mS89i6BDG1jKu.SbvPjvHeMc4HR3aSWM95Gz7Gi0wcPvmFVIT13Ky',NULL,'2026-02-02 07:17:54','2026-02-02 07:17:54','user',7),
(602,'TOCLE',' NIKKO M.','1275','$2y$12$1It2bblyUGrDuWNJRW5.POlfGhJtcdVv4a3F0kPR21qARMo7vrzfa',NULL,'2026-02-02 07:18:56','2026-02-02 07:18:56','user',4),
(603,'UY',' NOEL R.','1276','$2y$12$2vlc8Si.rJ7R.1kCcmLCHu9OeNvnblPWFqd4BUDXBe7tmjg2IBFS.',NULL,'2026-02-02 07:18:56','2026-02-02 07:18:56','user',4),
(604,'YANEZ',' ANTHONY B.','1277','$2y$12$syq0bTKZrsEwNK73oKqihOMTMW9TuEX2lkUmEsCO12M1Z8/BL9iKG',NULL,'2026-02-02 07:18:57','2026-02-02 07:18:57','user',4),
(605,'ABELLA',' ROSALITO N.','1278','$2y$12$FJYoYc4lYgRpLVQRjWG2D.zQvVEcoV7NnlpSUTBl/ABDJ6JT6WBgC',NULL,'2026-02-02 07:18:57','2026-02-02 07:18:57','user',6),
(606,'ABROGAR',' REY T.','1279','$2y$12$BNUrmME1Wxnv.6pYePa8Qer1yETlUt5Xa62VjPn2vmd5pf0KP7MD6',NULL,'2026-02-02 07:18:57','2026-02-02 07:18:57','user',6),
(607,'ALVAREZ',' ARTHUR P.','1280','$2y$12$x1XbZo2FSlFn2G/VDEdJD.v8u.JjDQQdl/YBGdIyz0S5vflTsxEg2',NULL,'2026-02-02 07:18:57','2026-02-02 07:18:57','user',6),
(608,'APOLE',' ALFREDO JR. E.','1281','$2y$12$z36qijaOpb0mJNEHQVUn4.nl2IMWjPapPjRZrLWXv3YvHXaMDk9fG',NULL,'2026-02-02 07:18:58','2026-02-02 07:18:58','user',6),
(609,'ARBOIS',' PETER M.','1282','$2y$12$teN58wJwNFashG3A6zZ91eG6Ri9XsSfykmIktuB4A6RCz3G4ayyVK',NULL,'2026-02-02 07:18:58','2026-02-02 07:18:58','user',6),
(610,'BARATAS',' EDUARDO D.','1283','$2y$12$phB.J5n6xnuPC8Q1saE5xOGRzS3SGvFIYf2JUCgSJ5OMQRVeX7Yvu',NULL,'2026-02-02 07:18:58','2026-02-02 07:18:58','user',6),
(611,'BAYRON',' CIRILE T.','1284','$2y$12$M4XESUkPtoz4Z8zhoqxMv.6hHs6PVWSZQknJJYSF0wv3hLaU1wiEq',NULL,'2026-02-02 07:18:58','2026-02-02 07:18:58','user',6),
(612,'DAGASDAS',' BERNARDO A.','1285','$2y$12$vi/wdyCeB.SD1i9cy3oc1u9.yiU/I7aN0CYyBk5l8/.0vRgv/xnHO',NULL,'2026-02-02 07:18:59','2026-02-02 07:18:59','user',6),
(613,'DAGONDON',' GIL EVAN O.','1286','$2y$12$86TC.8gIaFEToLoEe0I3d.rDwVBy0whtUo1w6T3c7GVxoEYirdZsm',NULL,'2026-02-02 07:18:59','2026-02-02 07:18:59','user',6),
(614,'DAIGDIGAN',' ALAN B.','1287','$2y$12$QFY1Pk6MUKijPW/mgLbo4ubdlwAjCs8iPhAIthNYpPxf6OVkBCFYC',NULL,'2026-02-02 07:18:59','2026-02-02 07:18:59','user',6),
(615,'DAISOG',' RICHARD B.','1288','$2y$12$hu48F/9c0aoZ.E2kS4ZYTu3H0m40CaDE0kcu7QkANpmtErbRBtsvm',NULL,'2026-02-02 07:18:59','2026-02-02 07:18:59','user',6),
(616,'DULDOCO',' BERDEN D.','1289','$2y$12$pgJlmyWXObyvcH5D9OtLneHpmJDCyt1Cpk12mIZLCjFHxbZOm36Qq',NULL,'2026-02-02 07:18:59','2026-02-02 07:18:59','user',6),
(617,'EBARAT',' DOMINGO C.','1290','$2y$12$RG.wrAl64kg3NK7l/c7ZwuX4aAKElaVFj8Jjep32z0oUY5ZVMnfNK',NULL,'2026-02-02 07:19:00','2026-02-02 07:19:00','user',6),
(618,'ENGBINO',' NOLAN R.','1291','$2y$12$YGEZ73DzwhDjtwOtdmMXAOT3pG8NBTbZe.CJ234aUdMGTW7InkX7.',NULL,'2026-02-02 07:19:00','2026-02-02 07:19:00','user',6),
(619,'ESPINOSA',' ABNER P.','1292','$2y$12$uqB4AAEp7vpFh2TCT1ikG.SemmIGxKRt/FNQ.doXdC80kcdOcxpiy',NULL,'2026-02-02 07:19:00','2026-02-02 07:19:00','user',6),
(620,'FRIAS',' JILDRETH  P.','1293','$2y$12$FRv937JhVsoPeRkecPJ//.4THqg7FU2Y5tIaoYZ8TJd2r32kfo1my',NULL,'2026-02-02 07:19:00','2026-02-02 07:19:00','user',6),
(621,'GAID',' RUEL B.','1294','$2y$12$/8ckHhaHi59Ll/n82kdBreQ.XCmlNPPJGYBDmPCMOX3377YHIYxq.',NULL,'2026-02-02 07:19:01','2026-02-02 07:19:01','user',6),
(622,'GALARIO',' NILO O.','1295','$2y$12$yO1t.DDztJZl8sQfBmiILebtXts3dzgrW.VgtirL5Nd1IVkzM8njG',NULL,'2026-02-02 07:19:01','2026-02-02 07:19:01','user',6),
(623,'GALBO',' PRIMO R.','1296','$2y$12$e/s.ZobtogboLSwIj3XgoON8Rv1SzZvqDB.k2MiwxSfUxjjMtuoeS',NULL,'2026-02-02 07:19:01','2026-02-02 07:19:01','user',6),
(624,'GALLARDO',' DESIDERIO I.','1297','$2y$12$.9Hvly5uROjIKVkFnAEdmOYqpH8m5jWFPE7lQnoGa5bzfPZZEAOa.',NULL,'2026-02-02 07:19:01','2026-02-02 07:19:01','user',6),
(625,'GO',' PABLO JR. R.','1298','$2y$12$3lZhwaapHklmr3Y9hIM8F.R.SmVKDlbbcyPJw5gjCXjB3IATmotty',NULL,'2026-02-02 07:19:02','2026-02-02 07:19:02','user',6),
(626,'GODORNES',' DIXTON G.','1299','$2y$12$wn1hCWLEMucz9qgps6sEgOL10umw9lqrEviO5Dr.RjGhKzWtGfThO',NULL,'2026-02-02 07:19:02','2026-02-02 07:19:02','user',6),
(627,'GULIGADO',' FERDINAND G.','1300','$2y$12$Z8fWdA/D9Ptgw54u9IWX/OiNWgtrSPBViBaMrdZBCH3lJH98iDTcu',NULL,'2026-02-02 07:19:02','2026-02-02 07:19:02','user',6),
(628,'JAMES',' ALCRIS P.','1301','$2y$12$mjcyPbWbu6AgJmZxm/mq7OeLsONZybIPgsu5pAEC9jqSWGCYWjRAO',NULL,'2026-02-02 07:19:02','2026-02-02 07:19:02','user',6),
(629,'JAMIAS',' ALBERT M.','1302','$2y$12$5w3PbMxfrh6wYM2WowRqyOGpVX/RqfDSCjsK/dBaPjZLSG7ffRUgi',NULL,'2026-02-02 07:19:03','2026-02-02 07:19:03','user',6),
(630,'LADERA',' NIEVA A.','1303','$2y$12$TUut85KhBp8XwbD1ez189O5Kx8vpZOj2TWD0uwg0APP8kQ18FXyoy',NULL,'2026-02-02 07:19:03','2026-02-02 07:19:03','user',6),
(631,'LOBIDO',' ERWIN L.','1304','$2y$12$Fwt5dv.ROVmlOd.Gb11v.ei33mDuuAuATfCPndAwgUW1tYBd.ERzG',NULL,'2026-02-02 07:19:03','2026-02-02 07:19:03','user',6),
(632,'MADRIGAL',' ISIDRO JR. Y.','1305','$2y$12$Iowd5dxOPdcQgkSPqjwFHe4JL9dGjo87DeNon55ikaTKXtLVx3b9q',NULL,'2026-02-02 07:19:03','2026-02-02 07:19:03','user',6),
(633,'MIRAMONTE',' RUSSELL O.','1306','$2y$12$jqdh0YvaNU9M/B4q7k.BfOMh5CBcbbmyM9S1zzbXEEQDVWuHC8.yW',NULL,'2026-02-02 07:19:04','2026-02-02 07:19:04','user',6),
(634,'MIRASOL',' NEPTALIE R.','1307','$2y$12$wiute0V7C9KqKjcw47Xu/.T67cRvQsTDE9aob4UVi6ytyGzlY0sJq',NULL,'2026-02-02 07:19:04','2026-02-02 07:19:04','user',6),
(635,'NAGAC',' WELGARY A.','1308','$2y$12$xZCIglGtVnn.kVH./Ok4cunnJ4syX.OJHiUhpbLn/bOt.hJ.JytEe',NULL,'2026-02-02 07:19:04','2026-02-02 07:19:04','user',6),
(636,'NAVARRO',' JESUS C.','1309','$2y$12$Q7QE.fP5nIrJdAlX5x13C.C5sjTnFG2ghBbcJ0lmXLw4E9/lWHxK6',NULL,'2026-02-02 07:19:04','2026-02-02 07:19:04','user',6),
(637,'NERI',' JOEL A.','1310','$2y$12$w9925Z1Y/kVsC6szR943VeRIefqrTPZ0bWtCtsSxxtc.ZNscgKzH2',NULL,'2026-02-02 07:19:04','2026-02-02 07:19:04','user',6),
(638,'OBSIOMA',' JASON B.','1311','$2y$12$ptM8uHbxnLZepvBmiq4Ow.jQ4rpTEvk6WGRNUAHLCl3wGrZykQ7Ji',NULL,'2026-02-02 07:19:05','2026-02-02 07:19:05','user',6),
(639,'PABORALINAN',' RENE B.','1312','$2y$12$DGVUK92.aExb/sgJngfBMOg.y/k2Ed5dHXptrz/ftY4DeDy/HVSWm',NULL,'2026-02-02 07:19:05','2026-02-02 07:19:05','user',6),
(640,'PACUBAS',' GLENN D.','1313','$2y$12$BZuwaTFLxypP37N1OP5IS.d3brcM0G50PPamdjZqeVj3tKaQR/Xy6',NULL,'2026-02-02 07:19:05','2026-02-02 07:19:05','user',6),
(641,'RANA',' FEB CLEP B.','1314','$2y$12$GLm/ZRhiFClb3zlupEkfvuaqsdc6MmCIuzY1hgCEyp9qSbeXD1D5K',NULL,'2026-02-02 07:19:05','2026-02-02 07:19:05','user',6),
(642,'REYES',' REYGEN S.','1315','$2y$12$HrCvI0gkoY26zFPYgWg8d.QfSU598RQVZ/0gtN7wi/9Xpn1/tiwcq',NULL,'2026-02-02 07:19:06','2026-02-02 07:19:06','user',6),
(643,'ROA',' JEROME E.','1316','$2y$12$YusE4/Jb1zGvtfCkSYymkeDJNLopccqJj8lLnLwNHO.Vk1QCMM9Ja',NULL,'2026-02-02 07:19:06','2026-02-02 07:19:06','user',6),
(644,'ROSETE',' GROMICO S.','1317','$2y$12$Fq7WHSzxB7F/y/sg68FTHOeVE0zmWnj/tpIWiQrHQlvgc8KxIlZWa',NULL,'2026-02-02 07:19:06','2026-02-02 07:19:06','user',6),
(645,'SALAZAR',' JHON REY A.','1318','$2y$12$o4aH90p1zd5QvmpcjNe49ukmxVfrX4vVSwkOnajWFzxR0GdPliuDe',NULL,'2026-02-02 07:19:06','2026-02-02 07:19:06','user',6),
(646,'SAYSON',' ALEJANDRO SR.','1319','$2y$12$j5UnxRSxVZ8uUG2Av3Br4OdnRo3zLM6VzZvM4anwkL1aIRzCty4gO',NULL,'2026-02-02 07:19:07','2026-02-02 07:19:07','user',6),
(647,'SENARA',' RODOLFO B.','1320','$2y$12$/SDxPAsDq2Qqo/pKAEFCsO/iCfxorL2YerR3X8BKRCSVqiTRbrU1O',NULL,'2026-02-02 07:19:07','2026-02-02 07:19:07','user',6),
(648,'SIO',' EPIFANIO C.','1321','$2y$12$OWajMMFKTa8P0GL4BTkrz.NZyeBsO8viroOc3WgTqgaabTFQeHymO',NULL,'2026-02-02 07:19:07','2026-02-02 07:19:07','user',6),
(649,'TONGCO',' ALEX T.','1322','$2y$12$lgsQol/baeNSDERtRaP.l.vzHQBORh0n0MwP2ZbFJQ1AEnaEg3Vem',NULL,'2026-02-02 07:19:07','2026-02-02 07:19:07','user',6),
(650,'TORRES',' FLORO SR. C.','1323','$2y$12$Ap.552k/KeKOlxHYPcrfYONMKKXeb4zLlPC2AEXMZ8pIj6bq6cVCS',NULL,'2026-02-02 07:19:08','2026-02-02 07:19:08','user',6),
(651,'UY',' SANDY T.','1324','$2y$12$FekpYM/93pDykZiilortve41rxkC3QV0cDY0TXldkMOa9VkpGH2mG',NULL,'2026-02-02 07:19:08','2026-02-02 07:19:08','user',6),
(652,'VILLOCILLO',' MANUEL J.','1325','$2y$12$3gBCItnyqjckjuNfLJnG0.7gLpkeBSwUjYDbAWyBstALpkSiu50Ja',NULL,'2026-02-02 07:19:08','2026-02-02 07:19:08','user',6),
(653,'YAMBING',' JOSEPH S.','1326','$2y$12$uyP.GY1RlB3YyBczKFj3oeYUgVJgvsDhCSkpfqrMhsVSDetDGx60S',NULL,'2026-02-02 07:19:08','2026-02-02 07:19:08','user',6),
(654,'sample','sample','098765','$2y$12$HyfPkXQBfDAvx9B8OzVNbutPfkY08MQxNJJ5Ex0lGHSjLAa.K6t4u',NULL,'2026-02-03 01:17:04','2026-02-03 01:17:04','member',1);

/*Table structure for table `votes` */

DROP TABLE IF EXISTS `votes`;

CREATE TABLE `votes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `departmentId` int NOT NULL,
  `candidateId` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `votes_userid_index` (`userId`),
  KEY `votes_departmentid_index` (`departmentId`),
  KEY `votes_candidateid_index` (`candidateId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `votes` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
