-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for base
CREATE DATABASE IF NOT EXISTS `base` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `base`;

-- Dumping structure for table base.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.addon_account: ~30 rows (approximately)
DELETE FROM `addon_account`;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_ballas', 'Ballas', 1),
	('society_banker', 'Bank', 1),
	('society_bennys', 'Benny\'s', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_cartel', 'Cartel', 1),
	('society_cpx', 'Cpx', 1),
	('society_cv', 'Comando Vermelho', 1),
	('society_families', 'Groove', 1),
	('society_fisherman', 'Fisherman', 1),
	('society_franca', 'Tropa Da Escocia', 1),
	('society_fueler', 'Fueler', 1),
	('society_grota', 'Grota', 1),
	('society_italia', 'Tropa da Itália', 1),
	('society_japao', 'Tropa Do Japao', 1),
	('society_lumberjack', 'Lumberjack', 1),
	('society_miner', 'Miner', 1),
	('society_police', 'Police', 1),
	('society_redline', 'Mechanic', 1),
	('society_reporter', 'Reporter', 1),
	('society_shisha', 'Hookah Lounge', 1),
	('society_slaughterer', 'Butcher', 1),
	('society_tailor', 'Tailor', 1),
	('society_taxi', 'Taxi', 1),
	('society_unemployed', 'Unemployed', 1),
	('society_vagos', 'Vagos', 1),
	('society_vanilla', 'Vanilla', 1);

-- Dumping structure for table base.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.addon_account_data: ~78 rows (approximately)
DELETE FROM `addon_account_data`;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(60, 'society_bahamas', 0, 'BAHAMAS'),
	(61, 'society_ballas', 0, 'BALLAS'),
	(62, 'society_banker', 0, NULL),
	(63, 'society_bennys', 1000000, 'BENNY\'S'),
	(64, 'society_cardealer', 0, NULL),
	(65, 'society_cartel', 0, 'CARTEL'),
	(66, 'society_cv', 0, 'COMANDOVERMELHO'),
	(67, 'society_cpx', 0, 'COMPLEXODOALEMãO'),
	(68, 'society_families', 0, 'THEFAMILIES'),
	(69, 'society_fisherman', 0, NULL),
	(70, 'society_fueler', 0, NULL),
	(71, 'society_grota', 0, 'GROTA'),
	(72, 'society_shisha', 0, 'BARDESHISHA'),
	(73, 'society_ambulance', 15000, 'INEM'),
	(74, 'society_italia', 0, 'TROPADAITáLIA'),
	(75, 'society_lumberjack', 0, NULL),
	(76, 'society_miner', 0, NULL),
	(77, 'society_police', 0, 'PSP'),
	(78, 'society_redline', 0, 'REDLINE'),
	(79, 'society_reporter', 0, NULL),
	(80, 'society_slaughterer', 0, NULL),
	(81, 'society_tailor', 0, NULL),
	(82, 'society_taxi', 0, NULL),
	(83, 'society_franca', 0, 'FRANçA'),
	(84, 'society_japao', 0, 'TROPADOJAPãO'),
	(85, 'society_unemployed', 0, 'DESEMPREGADO'),
	(86, 'society_vagos', 0, 'VAGOS'),
	(87, 'society_vanilla', 0, 'VANILLA'),
	(88, 'bank_savings', 0, '391a38f06c95f8e488ff79e788562896d8ce5cb7'),
	(89, 'caution', 0, '391a38f06c95f8e488ff79e788562896d8ce5cb7'),
	(90, 'bank_savings', 0, '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f'),
	(91, 'caution', 0, '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f'),
	(92, 'bank_savings', 0, '2058d72d70846658b7ed44f62c7b23e25408a9af'),
	(93, 'caution', 0, '2058d72d70846658b7ed44f62c7b23e25408a9af'),
	(94, 'bank_savings', 0, '60b15438266ee12985638e2993b1a411a27d7bf6'),
	(95, 'caution', 0, '60b15438266ee12985638e2993b1a411a27d7bf6'),
	(96, 'bank_savings', 0, 'a44768e7c2844d454438a39c903fa80c9892f0bc'),
	(97, 'caution', 0, 'a44768e7c2844d454438a39c903fa80c9892f0bc'),
	(98, 'bank_savings', 0, '29f9bf803077d2cd85b04f13265436df61aeab0e'),
	(99, 'caution', 0, '29f9bf803077d2cd85b04f13265436df61aeab0e'),
	(100, 'bank_savings', 0, '1bec8b76886b0931af9af4d86eb6926e003a2565'),
	(101, 'caution', 0, '1bec8b76886b0931af9af4d86eb6926e003a2565'),
	(102, 'bank_savings', 0, '18b945285e905717960da4f6402a7b92651942a6'),
	(103, 'caution', 0, '18b945285e905717960da4f6402a7b92651942a6'),
	(104, 'bank_savings', 0, 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa'),
	(105, 'caution', 0, 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa'),
	(106, 'bank_savings', 0, 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c'),
	(107, 'caution', 0, 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c'),
	(108, 'bank_savings', 0, '9d013dc670d84c861761f7b07a38056ca62f2c04'),
	(109, 'caution', 0, '9d013dc670d84c861761f7b07a38056ca62f2c04'),
	(110, 'bank_savings', 0, '7fd41199089be211da9c71096825616aa8a35e69'),
	(111, 'caution', 0, '7fd41199089be211da9c71096825616aa8a35e69'),
	(112, 'bank_savings', 0, '8553d1ea789b6f1d2a07321f9fad040827a04c3f'),
	(113, 'caution', 0, '8553d1ea789b6f1d2a07321f9fad040827a04c3f'),
	(114, 'bank_savings', 0, 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e'),
	(115, 'caution', 0, 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e'),
	(116, 'bank_savings', 0, '7599c0508035ab64a1bfb7fa200781eb32d743e6'),
	(117, 'caution', 0, '7599c0508035ab64a1bfb7fa200781eb32d743e6'),
	(118, 'bank_savings', 0, '9ba090eaed1210f5a612e97969cd55d1e04cdf60'),
	(119, 'caution', 0, '9ba090eaed1210f5a612e97969cd55d1e04cdf60'),
	(120, 'bank_savings', 0, 'e2f03940ab607184e837ad4c010e3d77b8129d94'),
	(121, 'caution', 0, 'e2f03940ab607184e837ad4c010e3d77b8129d94'),
	(122, 'bank_savings', 0, '4e38c3566056b55dedf08b081e83b1deee1dff21'),
	(123, 'caution', 0, '4e38c3566056b55dedf08b081e83b1deee1dff21'),
	(124, 'bank_savings', 0, '756b2151597ea0207d9e5931a3a87549709761b0'),
	(125, 'caution', 0, '756b2151597ea0207d9e5931a3a87549709761b0'),
	(126, 'bank_savings', 0, 'bd713ca9147f0b49e3eb9ab2790498274296ee0a'),
	(127, 'caution', 0, 'bd713ca9147f0b49e3eb9ab2790498274296ee0a'),
	(128, 'bank_savings', 0, '89b3d3c771632455ac9afded546881905fd03dcd'),
	(129, 'caution', 0, '89b3d3c771632455ac9afded546881905fd03dcd'),
	(130, 'bank_savings', 0, 'bc2e7d866706f7d795a7c8fa272acaa9c4392924'),
	(131, 'caution', 0, 'bc2e7d866706f7d795a7c8fa272acaa9c4392924'),
	(132, 'bank_savings', 0, 'f0e25920e358e159aca570be43551355cd3abe01'),
	(133, 'caution', 0, 'f0e25920e358e159aca570be43551355cd3abe01'),
	(134, 'bank_savings', 0, 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509'),
	(135, 'caution', 0, 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509'),
	(136, 'bank_savings', 0, 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac'),
	(137, 'caution', 0, 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac'),
	(138, 'bank_savings', 0, '267657e2ebf25e299aa963f279935a4af9d06e48'),
	(139, 'caution', 0, '267657e2ebf25e299aa963f279935a4af9d06e48'),
	(140, 'caution', 0, '6b7f3b6f5ac498856582f34618e48cde8c0ce84a'),
	(141, 'bank_savings', 0, '6b7f3b6f5ac498856582f34618e48cde8c0ce84a');

-- Dumping structure for table base.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.addon_inventory: ~29 rows (approximately)
DELETE FROM `addon_inventory`;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('loaf_motel', 'Motel', 0),
	('society_ambulance', 'EMS', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_ballas', 'Ballas', 1),
	('society_banker', 'Banker', 1),
	('society_bennys', 'Benny\'s', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_cartel', 'Cartel', 1),
	('society_cpx', 'Cpx', 1),
	('society_cv', 'Comando Vermelho', 1),
	('society_families', 'Groove', 1),
	('society_fisherman', 'Fisherman', 1),
	('society_franca', 'Tropa Da Escocia', 1),
	('society_fueler', 'Fueler', 1),
	('society_grota', 'Grota', 1),
	('society_italia', 'Tropa da Itália', 1),
	('society_japao', 'Tropa Do Japao', 1),
	('society_lumberjack', 'Lumberjack', 1),
	('society_miner', 'Miner', 1),
	('society_police', 'Police', 1),
	('society_redline', 'Mechanic', 1),
	('society_reporter', 'Reporter', 1),
	('society_shisha', 'Hookah Lounge', 1),
	('society_slaughterer', 'Butcher', 1),
	('society_tailor', 'Tailor', 1),
	('society_taxi', 'Taxi', 1),
	('society_unemployed', 'Unemployed', 1),
	('society_vagos', 'Vagos', 1),
	('society_vanilla', 'Vanilla', 1);

-- Dumping structure for table base.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.addon_inventory_items: ~0 rows (approximately)
DELETE FROM `addon_inventory_items`;

-- Dumping structure for table base.ak47_hookahlounge
CREATE TABLE IF NOT EXISTS `ak47_hookahlounge` (
  `id` int(11) NOT NULL,
  `water` int(11) DEFAULT 100,
  `hose` int(11) DEFAULT 100,
  `foil` int(11) DEFAULT 100,
  `coals` int(11) DEFAULT 100,
  `t_level` int(11) DEFAULT 100,
  `tobaco` longtext DEFAULT 'Social Smoke Absolute Zero',
  `price` int(11) DEFAULT 100,
  `usable` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.ak47_hookahlounge: ~13 rows (approximately)
DELETE FROM `ak47_hookahlounge`;
INSERT INTO `ak47_hookahlounge` (`id`, `water`, `hose`, `foil`, `coals`, `t_level`, `tobaco`, `price`, `usable`) VALUES
	(1, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(2, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(3, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(4, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(5, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(6, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(7, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(8, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(9, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(10, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(11, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(12, 100, 100, 0, 0, 0, 'Empty', 100, 0),
	(13, 100, 100, 0, 0, 0, 'Empty', 100, 0);

-- Dumping structure for table base.communityservice
CREATE TABLE IF NOT EXISTS `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.communityservice: ~0 rows (approximately)
DELETE FROM `communityservice`;

-- Dumping structure for table base.darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.darkchat_messages: ~0 rows (approximately)
DELETE FROM `darkchat_messages`;

-- Dumping structure for table base.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.datastore: ~34 rows (approximately)
DELETE FROM `datastore`;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('loaf_motel', 'Motel', 0),
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_ballas', 'Ballas', 1),
	('society_banker', 'Banker', 1),
	('society_bennys', 'Benny\'s', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_cartel', 'Cartel', 1),
	('society_cpx', 'Cpx', 1),
	('society_cv', 'Comando Vermelho', 1),
	('society_families', 'Groove', 1),
	('society_fisherman', 'Fisherman', 1),
	('society_franca', 'Tropa Da Escocia', 1),
	('society_fueler', 'Fueler', 1),
	('society_grota', 'Grota', 1),
	('society_italia', 'Tropa da Itália', 1),
	('society_japao', 'Tropa Do Japao', 1),
	('society_lumberjack', 'Lumberjack', 1),
	('society_miner', 'Miner', 1),
	('society_police', 'Police', 1),
	('society_redline', 'Mechanic', 1),
	('society_reporter', 'Reporter', 1),
	('society_shisha', 'Hookah Lounge', 1),
	('society_slaughterer', 'Butcher', 1),
	('society_tailor', 'Tailor', 1),
	('society_taxi', 'Taxi', 1),
	('society_unemployed', 'Unemployed', 1),
	('society_vagos', 'Vagos', 1),
	('society_vanilla', 'Vanilla', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Dumping structure for table base.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.datastore_data: ~246 rows (approximately)
DELETE FROM `datastore_data`;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_redline', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}'),
	(6, 'property', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{}'),
	(7, 'user_ears', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{}'),
	(8, 'user_glasses', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{}'),
	(9, 'user_helmet', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{}'),
	(10, 'user_mask', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{}'),
	(11, 'society_tailor', NULL, '{}'),
	(12, 'society_banker', NULL, '{}'),
	(13, 'society_slaughterer', NULL, '{}'),
	(14, 'society_unemployed', NULL, '{}'),
	(15, 'society_cardealer', NULL, '{}'),
	(16, 'society_fueler', NULL, '{}'),
	(17, 'society_reporter', NULL, '{}'),
	(18, 'society_miner', NULL, '{}'),
	(19, 'society_lumberjack', NULL, '{}'),
	(20, 'society_fisherman', NULL, '{}'),
	(21, 'property', '60b15438266ee12985638e2993b1a411a27d7bf6', '{}'),
	(22, 'user_glasses', '60b15438266ee12985638e2993b1a411a27d7bf6', '{}'),
	(23, 'user_ears', '60b15438266ee12985638e2993b1a411a27d7bf6', '{}'),
	(24, 'user_helmet', '60b15438266ee12985638e2993b1a411a27d7bf6', '{}'),
	(25, 'user_mask', '60b15438266ee12985638e2993b1a411a27d7bf6', '{}'),
	(26, 'property', 'e441df93739257b857c91587fdc1086ba7b86489', '{}'),
	(27, 'user_ears', 'e441df93739257b857c91587fdc1086ba7b86489', '{}'),
	(28, 'user_glasses', 'e441df93739257b857c91587fdc1086ba7b86489', '{}'),
	(29, 'user_helmet', 'e441df93739257b857c91587fdc1086ba7b86489', '{}'),
	(30, 'user_mask', 'e441df93739257b857c91587fdc1086ba7b86489', '{}'),
	(31, 'property', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{"dressing":[{"label":"1","skin":{"chest_1":0,"decals_2":0,"glasses_2":0,"chest_2":0,"sun_2":0,"blemishes_1":0,"ears_1":-1,"bracelets_1":-1,"helmet_2":0,"blush_2":0,"torso_1":413,"mask_1":209,"chain_1":0,"shoes_1":109,"bproof_1":0,"eye_color":0,"lipstick_2":0,"watches_1":-1,"tshirt_2":0,"blemishes_2":0,"bags_1":0,"eyebrows_4":0,"hair_color_1":0,"moles_1":0,"decals_1":0,"age_2":0,"lipstick_1":0,"watches_2":0,"arms":0,"bodyb_1":0,"lipstick_4":0,"bags_2":0,"face":0,"hair_color_2":0,"eyebrows_1":0,"sun_1":0,"age_1":0,"eyebrows_3":0,"bodyb_2":0,"lipstick_3":0,"makeup_2":0,"moles_2":0,"complexion_1":0,"makeup_3":0,"complexion_2":0,"tshirt_1":15,"glasses_1":0,"beard_3":0,"blush_1":0,"bproof_2":0,"arms_2":0,"mask_2":0,"ears_2":0,"pants_1":148,"makeup_1":0,"helmet_1":173,"beard_1":0,"beard_2":0,"beard_4":0,"bracelets_2":0,"eyebrows_2":0,"sex":0,"blush_3":0,"shoes_2":0,"torso_2":0,"chest_3":0,"chain_2":0,"makeup_4":0,"pants_2":0}},{"label":"benfica","skin":{"chest_1":0,"decals_2":0,"glasses_2":0,"chest_2":0,"sun_2":0,"blemishes_1":0,"ears_1":-1,"bracelets_1":-1,"helmet_2":0,"blush_2":0,"torso_1":22,"mask_1":209,"chain_1":0,"shoes_1":109,"bproof_1":0,"eye_color":0,"lipstick_2":0,"watches_1":-1,"tshirt_2":0,"blemishes_2":0,"bags_1":0,"eyebrows_4":0,"hair_color_1":0,"moles_1":0,"decals_1":0,"age_2":0,"lipstick_1":0,"watches_2":0,"arms":0,"bodyb_1":0,"lipstick_4":0,"bags_2":0,"face":0,"hair_color_2":0,"eyebrows_1":0,"sun_1":0,"age_1":0,"eyebrows_3":0,"bodyb_2":0,"lipstick_3":0,"makeup_2":0,"moles_2":0,"complexion_1":0,"makeup_3":0,"complexion_2":0,"tshirt_1":15,"glasses_1":0,"beard_3":0,"blush_1":0,"bproof_2":0,"arms_2":0,"mask_2":0,"ears_2":0,"pants_1":136,"chest_3":0,"helmet_1":173,"torso_2":8,"beard_2":0,"beard_1":0,"bracelets_2":0,"beard_4":0,"eyebrows_2":0,"sex":0,"blush_3":0,"makeup_1":0,"shoes_2":0,"chain_2":0,"makeup_4":0,"pants_2":0}},{"label":"gaja","skin":{"chest_1":0,"decals_2":0,"glasses_2":0,"chest_2":0,"sun_2":0,"blemishes_1":0,"ears_1":-1,"bracelets_1":-1,"helmet_2":0,"blush_2":0,"torso_1":413,"mask_1":209,"chain_1":0,"shoes_1":109,"bproof_1":0,"eye_color":0,"lipstick_2":0,"watches_1":-1,"tshirt_2":0,"blemishes_2":0,"bags_1":0,"eyebrows_4":0,"hair_color_1":0,"moles_1":0,"decals_1":0,"age_2":0,"lipstick_1":0,"watches_2":0,"arms":0,"bodyb_1":0,"lipstick_4":0,"bags_2":0,"face":0,"hair_color_2":0,"eyebrows_1":0,"sun_1":0,"age_1":0,"eyebrows_3":0,"bodyb_2":0,"lipstick_3":0,"makeup_2":0,"moles_2":0,"complexion_1":0,"makeup_3":0,"complexion_2":0,"tshirt_1":15,"glasses_1":0,"beard_3":0,"blush_1":0,"bproof_2":0,"arms_2":0,"mask_2":0,"ears_2":0,"pants_1":8,"chest_3":0,"helmet_1":-1,"makeup_1":0,"beard_2":0,"beard_1":0,"bracelets_2":0,"beard_4":0,"eyebrows_2":0,"sex":1,"blush_3":0,"torso_2":0,"shoes_2":0,"chain_2":0,"makeup_4":0,"pants_2":0}},{"label":"s","skin":{"chest_1":0,"decals_2":0,"glasses_2":0,"chest_2":0,"sun_2":0,"blemishes_1":0,"ears_1":-1,"bracelets_1":-1,"helmet_2":0,"blush_2":0,"torso_1":127,"mask_1":119,"chain_1":0,"shoes_1":52,"bproof_1":5,"eye_color":0,"lipstick_2":0,"watches_1":-1,"tshirt_2":0,"blemishes_2":0,"bags_1":0,"eyebrows_4":0,"hair_color_1":0,"moles_1":0,"decals_1":0,"age_2":0,"lipstick_1":0,"watches_2":0,"arms":0,"bodyb_1":0,"lipstick_4":0,"bags_2":0,"face":0,"hair_color_2":0,"eyebrows_1":0,"sun_1":0,"age_1":0,"pants_2":0,"bodyb_2":0,"lipstick_3":0,"makeup_2":0,"chest_3":0,"complexion_1":0,"makeup_3":0,"complexion_2":0,"tshirt_1":15,"glasses_1":0,"chain_2":0,"blush_1":0,"bproof_2":0,"eyebrows_3":0,"arms_2":0,"blush_3":0,"ears_2":0,"mask_2":6,"moles_2":0,"helmet_1":159,"beard_1":0,"label":"Homem","beard_4":0,"bracelets_2":0,"eyebrows_2":0,"beard_2":0,"sex":0,"shoes_2":0,"torso_2":1,"makeup_1":0,"beard_3":0,"makeup_4":0,"pants_1":135}},{"label":"italia","skin":{"chest_1":0,"decals_2":0,"glasses_2":0,"chest_2":0,"sun_2":0,"blemishes_1":0,"ears_1":-1,"bracelets_1":-1,"helmet_2":0,"blush_2":0,"torso_1":128,"mask_1":119,"chain_1":0,"shoes_1":61,"bproof_1":0,"eye_color":0,"lipstick_2":0,"watches_1":-1,"tshirt_2":0,"blemishes_2":0,"bags_1":0,"eyebrows_4":0,"hair_color_1":0,"moles_1":0,"decals_1":0,"age_2":0,"lipstick_1":0,"watches_2":0,"arms":4,"bodyb_1":0,"lipstick_4":0,"bags_2":0,"face":0,"hair_color_2":0,"eyebrows_1":0,"sun_1":0,"age_1":0,"pants_2":0,"bodyb_2":0,"lipstick_3":0,"makeup_2":0,"moles_2":0,"complexion_1":0,"makeup_3":0,"complexion_2":0,"tshirt_1":15,"glasses_1":5,"beard_3":0,"blush_1":0,"bproof_2":0,"eyebrows_3":0,"arms_2":0,"mask_2":5,"ears_2":0,"chain_2":0,"makeup_1":0,"helmet_1":-1,"beard_1":0,"label":"Homem 2","beard_4":0,"bracelets_2":0,"eyebrows_2":0,"beard_2":0,"sex":0,"blush_3":0,"torso_2":1,"shoes_2":0,"chest_3":0,"makeup_4":0,"pants_1":107}}]}'),
	(32, 'user_ears', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{}'),
	(33, 'user_glasses', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{}'),
	(34, 'user_helmet', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{}'),
	(35, 'user_mask', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{}'),
	(36, 'society_shisha', NULL, '{}'),
	(37, 'property', '817d00e84b149de2de5ee05e42e87bd5e5af4601', '{}'),
	(38, 'user_ears', '817d00e84b149de2de5ee05e42e87bd5e5af4601', '{}'),
	(39, 'user_glasses', '817d00e84b149de2de5ee05e42e87bd5e5af4601', '{}'),
	(40, 'user_helmet', '817d00e84b149de2de5ee05e42e87bd5e5af4601', '{}'),
	(41, 'user_mask', '817d00e84b149de2de5ee05e42e87bd5e5af4601', '{}'),
	(42, 'property', 'b4ac8be9b3190464e67b559cbcf2a032c0bff045', '{}'),
	(43, 'user_ears', 'b4ac8be9b3190464e67b559cbcf2a032c0bff045', '{}'),
	(44, 'user_glasses', 'b4ac8be9b3190464e67b559cbcf2a032c0bff045', '{}'),
	(45, 'user_helmet', 'b4ac8be9b3190464e67b559cbcf2a032c0bff045', '{}'),
	(46, 'user_mask', 'b4ac8be9b3190464e67b559cbcf2a032c0bff045', '{}'),
	(47, 'society_bennys', NULL, '{}'),
	(48, 'property', 'dcc2ab7afa0c7a743162eb325a405fe456adb89e', '{}'),
	(49, 'user_glasses', 'dcc2ab7afa0c7a743162eb325a405fe456adb89e', '{}'),
	(50, 'user_ears', 'dcc2ab7afa0c7a743162eb325a405fe456adb89e', '{}'),
	(51, 'user_mask', 'dcc2ab7afa0c7a743162eb325a405fe456adb89e', '{}'),
	(52, 'user_helmet', 'dcc2ab7afa0c7a743162eb325a405fe456adb89e', '{}'),
	(53, 'property', '1ad43e801627c5d5c403374205c154912d898059', '{}'),
	(54, 'user_ears', '1ad43e801627c5d5c403374205c154912d898059', '{}'),
	(55, 'user_glasses', '1ad43e801627c5d5c403374205c154912d898059', '{}'),
	(56, 'user_helmet', '1ad43e801627c5d5c403374205c154912d898059', '{}'),
	(57, 'user_mask', '1ad43e801627c5d5c403374205c154912d898059', '{}'),
	(58, 'property', '4c4bbf001cde96fe6f100f5377c900ce121f854f', '{}'),
	(59, 'user_ears', '4c4bbf001cde96fe6f100f5377c900ce121f854f', '{}'),
	(60, 'user_glasses', '4c4bbf001cde96fe6f100f5377c900ce121f854f', '{}'),
	(61, 'user_helmet', '4c4bbf001cde96fe6f100f5377c900ce121f854f', '{}'),
	(62, 'user_mask', '4c4bbf001cde96fe6f100f5377c900ce121f854f', '{}'),
	(63, 'property', 'afce7b20de0664afe4ee05fbdf14b71d2a135c25', '{}'),
	(64, 'user_ears', 'afce7b20de0664afe4ee05fbdf14b71d2a135c25', '{}'),
	(65, 'user_glasses', 'afce7b20de0664afe4ee05fbdf14b71d2a135c25', '{}'),
	(66, 'user_helmet', 'afce7b20de0664afe4ee05fbdf14b71d2a135c25', '{}'),
	(67, 'user_mask', 'afce7b20de0664afe4ee05fbdf14b71d2a135c25', '{}'),
	(68, 'property', '7c3cf722c10fb612fd6ff8f7c0f4d12da841c361', '{}'),
	(69, 'user_ears', '7c3cf722c10fb612fd6ff8f7c0f4d12da841c361', '{}'),
	(70, 'user_glasses', '7c3cf722c10fb612fd6ff8f7c0f4d12da841c361', '{}'),
	(71, 'user_helmet', '7c3cf722c10fb612fd6ff8f7c0f4d12da841c361', '{}'),
	(72, 'user_mask', '7c3cf722c10fb612fd6ff8f7c0f4d12da841c361', '{}'),
	(73, 'user_ears', 'a0229611f141229f702aad3e96537e12a8a7d09b', '{}'),
	(74, 'user_helmet', 'a0229611f141229f702aad3e96537e12a8a7d09b', '{}'),
	(75, 'property', 'a0229611f141229f702aad3e96537e12a8a7d09b', '{}'),
	(76, 'user_glasses', 'a0229611f141229f702aad3e96537e12a8a7d09b', '{}'),
	(77, 'user_mask', 'a0229611f141229f702aad3e96537e12a8a7d09b', '{}'),
	(78, 'property', '9ce9c12176f08b6a169713094c4b260ad08004be', '{}'),
	(79, 'user_glasses', '9ce9c12176f08b6a169713094c4b260ad08004be', '{}'),
	(80, 'user_ears', '9ce9c12176f08b6a169713094c4b260ad08004be', '{}'),
	(81, 'user_helmet', '9ce9c12176f08b6a169713094c4b260ad08004be', '{}'),
	(82, 'user_mask', '9ce9c12176f08b6a169713094c4b260ad08004be', '{}'),
	(83, 'property', 'c4290b28f04b2eea03c9c3046c8d9d6603abb2a9', '{}'),
	(84, 'user_ears', 'c4290b28f04b2eea03c9c3046c8d9d6603abb2a9', '{}'),
	(85, 'user_glasses', 'c4290b28f04b2eea03c9c3046c8d9d6603abb2a9', '{}'),
	(86, 'user_helmet', 'c4290b28f04b2eea03c9c3046c8d9d6603abb2a9', '{}'),
	(87, 'user_mask', 'c4290b28f04b2eea03c9c3046c8d9d6603abb2a9', '{}'),
	(88, 'society_italia', NULL, '{}'),
	(89, 'society_vagos', NULL, '{}'),
	(90, 'society_ballas', NULL, '{}'),
	(91, 'society_families', NULL, '{}'),
	(92, 'society_vanilla', NULL, '{}'),
	(93, 'society_bahamas', NULL, '{}'),
	(94, 'society_cartel', NULL, '{}'),
	(95, 'society_grota', NULL, '{}'),
	(96, 'society_cv', NULL, '{}'),
	(97, 'society_franca', NULL, '{}'),
	(98, 'society_japao', NULL, '{}'),
	(99, 'society_cpx', NULL, '{}'),
	(100, 'loaf_motel', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{}'),
	(101, 'loaf_motel', '60b15438266ee12985638e2993b1a411a27d7bf6', '{}'),
	(102, 'loaf_motel', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{}'),
	(103, 'property', '2058d72d70846658b7ed44f62c7b23e25408a9af', '{}'),
	(104, 'user_ears', '2058d72d70846658b7ed44f62c7b23e25408a9af', '{}'),
	(105, 'user_helmet', '2058d72d70846658b7ed44f62c7b23e25408a9af', '{}'),
	(106, 'user_glasses', '2058d72d70846658b7ed44f62c7b23e25408a9af', '{}'),
	(107, 'loaf_motel', '2058d72d70846658b7ed44f62c7b23e25408a9af', '{}'),
	(108, 'user_mask', '2058d72d70846658b7ed44f62c7b23e25408a9af', '{}'),
	(109, 'property', 'a44768e7c2844d454438a39c903fa80c9892f0bc', '{}'),
	(110, 'user_ears', 'a44768e7c2844d454438a39c903fa80c9892f0bc', '{}'),
	(111, 'user_glasses', 'a44768e7c2844d454438a39c903fa80c9892f0bc', '{}'),
	(112, 'user_helmet', 'a44768e7c2844d454438a39c903fa80c9892f0bc', '{}'),
	(113, 'user_mask', 'a44768e7c2844d454438a39c903fa80c9892f0bc', '{}'),
	(114, 'loaf_motel', 'a44768e7c2844d454438a39c903fa80c9892f0bc', '{}'),
	(115, 'property', '29f9bf803077d2cd85b04f13265436df61aeab0e', '{}'),
	(116, 'user_ears', '29f9bf803077d2cd85b04f13265436df61aeab0e', '{}'),
	(117, 'user_glasses', '29f9bf803077d2cd85b04f13265436df61aeab0e', '{}'),
	(118, 'user_helmet', '29f9bf803077d2cd85b04f13265436df61aeab0e', '{}'),
	(119, 'user_mask', '29f9bf803077d2cd85b04f13265436df61aeab0e', '{}'),
	(120, 'loaf_motel', '29f9bf803077d2cd85b04f13265436df61aeab0e', '{}'),
	(121, 'user_ears', '1bec8b76886b0931af9af4d86eb6926e003a2565', '{}'),
	(122, 'user_glasses', '1bec8b76886b0931af9af4d86eb6926e003a2565', '{}'),
	(123, 'property', '1bec8b76886b0931af9af4d86eb6926e003a2565', '{}'),
	(124, 'user_mask', '1bec8b76886b0931af9af4d86eb6926e003a2565', '{}'),
	(125, 'user_helmet', '1bec8b76886b0931af9af4d86eb6926e003a2565', '{}'),
	(126, 'loaf_motel', '1bec8b76886b0931af9af4d86eb6926e003a2565', '{}'),
	(127, 'user_ears', '18b945285e905717960da4f6402a7b92651942a6', '{}'),
	(128, 'property', '18b945285e905717960da4f6402a7b92651942a6', '{}'),
	(129, 'user_mask', '18b945285e905717960da4f6402a7b92651942a6', '{}'),
	(130, 'user_helmet', '18b945285e905717960da4f6402a7b92651942a6', '{}'),
	(131, 'user_glasses', '18b945285e905717960da4f6402a7b92651942a6', '{}'),
	(132, 'loaf_motel', '18b945285e905717960da4f6402a7b92651942a6', '{}'),
	(133, 'property', 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa', '{}'),
	(134, 'user_glasses', 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa', '{}'),
	(135, 'user_mask', 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa', '{}'),
	(136, 'user_ears', 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa', '{}'),
	(137, 'user_helmet', 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa', '{}'),
	(138, 'loaf_motel', 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa', '{}'),
	(139, 'property', 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c', '{}'),
	(140, 'user_ears', 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c', '{}'),
	(141, 'user_glasses', 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c', '{}'),
	(142, 'user_helmet', 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c', '{}'),
	(143, 'user_mask', 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c', '{}'),
	(144, 'loaf_motel', 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c', '{}'),
	(145, 'property', '9d013dc670d84c861761f7b07a38056ca62f2c04', '{}'),
	(146, 'user_ears', '9d013dc670d84c861761f7b07a38056ca62f2c04', '{}'),
	(147, 'user_glasses', '9d013dc670d84c861761f7b07a38056ca62f2c04', '{}'),
	(148, 'user_helmet', '9d013dc670d84c861761f7b07a38056ca62f2c04', '{}'),
	(149, 'user_mask', '9d013dc670d84c861761f7b07a38056ca62f2c04', '{}'),
	(150, 'loaf_motel', '9d013dc670d84c861761f7b07a38056ca62f2c04', '{}'),
	(151, 'property', '7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	(152, 'user_ears', '7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	(153, 'user_glasses', '7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	(154, 'user_helmet', '7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	(155, 'user_mask', '7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	(156, 'loaf_motel', '7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	(157, 'property', '8553d1ea789b6f1d2a07321f9fad040827a04c3f', '{}'),
	(158, 'user_glasses', '8553d1ea789b6f1d2a07321f9fad040827a04c3f', '{}'),
	(159, 'loaf_motel', '8553d1ea789b6f1d2a07321f9fad040827a04c3f', '{}'),
	(160, 'user_ears', '8553d1ea789b6f1d2a07321f9fad040827a04c3f', '{}'),
	(161, 'user_helmet', '8553d1ea789b6f1d2a07321f9fad040827a04c3f', '{}'),
	(162, 'user_mask', '8553d1ea789b6f1d2a07321f9fad040827a04c3f', '{}'),
	(163, 'property', 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e', '{}'),
	(164, 'user_glasses', 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e', '{}'),
	(165, 'user_ears', 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e', '{}'),
	(166, 'user_helmet', 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e', '{}'),
	(167, 'user_mask', 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e', '{}'),
	(168, 'loaf_motel', 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e', '{}'),
	(169, 'property', '7599c0508035ab64a1bfb7fa200781eb32d743e6', '{}'),
	(170, 'user_ears', '7599c0508035ab64a1bfb7fa200781eb32d743e6', '{}'),
	(171, 'user_glasses', '7599c0508035ab64a1bfb7fa200781eb32d743e6', '{}'),
	(172, 'user_helmet', '7599c0508035ab64a1bfb7fa200781eb32d743e6', '{}'),
	(173, 'user_mask', '7599c0508035ab64a1bfb7fa200781eb32d743e6', '{}'),
	(174, 'loaf_motel', '7599c0508035ab64a1bfb7fa200781eb32d743e6', '{}'),
	(175, 'property', '9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	(176, 'user_glasses', '9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	(177, 'user_ears', '9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	(178, 'loaf_motel', '9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	(179, 'user_helmet', '9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	(180, 'user_mask', '9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	(181, 'property', 'e2f03940ab607184e837ad4c010e3d77b8129d94', '{}'),
	(182, 'user_ears', 'e2f03940ab607184e837ad4c010e3d77b8129d94', '{}'),
	(183, 'loaf_motel', 'e2f03940ab607184e837ad4c010e3d77b8129d94', '{}'),
	(184, 'user_helmet', 'e2f03940ab607184e837ad4c010e3d77b8129d94', '{}'),
	(185, 'user_glasses', 'e2f03940ab607184e837ad4c010e3d77b8129d94', '{}'),
	(186, 'user_mask', 'e2f03940ab607184e837ad4c010e3d77b8129d94', '{}'),
	(187, 'property', '4e38c3566056b55dedf08b081e83b1deee1dff21', '{}'),
	(188, 'user_ears', '4e38c3566056b55dedf08b081e83b1deee1dff21', '{}'),
	(189, 'user_glasses', '4e38c3566056b55dedf08b081e83b1deee1dff21', '{}'),
	(190, 'user_helmet', '4e38c3566056b55dedf08b081e83b1deee1dff21', '{}'),
	(191, 'loaf_motel', '4e38c3566056b55dedf08b081e83b1deee1dff21', '{}'),
	(192, 'user_mask', '4e38c3566056b55dedf08b081e83b1deee1dff21', '{}'),
	(193, 'property', '756b2151597ea0207d9e5931a3a87549709761b0', '{}'),
	(194, 'user_ears', '756b2151597ea0207d9e5931a3a87549709761b0', '{}'),
	(195, 'user_glasses', '756b2151597ea0207d9e5931a3a87549709761b0', '{}'),
	(196, 'user_helmet', '756b2151597ea0207d9e5931a3a87549709761b0', '{}'),
	(197, 'user_mask', '756b2151597ea0207d9e5931a3a87549709761b0', '{}'),
	(198, 'loaf_motel', '756b2151597ea0207d9e5931a3a87549709761b0', '{}'),
	(199, 'property', 'bd713ca9147f0b49e3eb9ab2790498274296ee0a', '{}'),
	(200, 'user_ears', 'bd713ca9147f0b49e3eb9ab2790498274296ee0a', '{}'),
	(201, 'user_glasses', 'bd713ca9147f0b49e3eb9ab2790498274296ee0a', '{}'),
	(202, 'user_helmet', 'bd713ca9147f0b49e3eb9ab2790498274296ee0a', '{}'),
	(203, 'user_mask', 'bd713ca9147f0b49e3eb9ab2790498274296ee0a', '{}'),
	(204, 'loaf_motel', 'bd713ca9147f0b49e3eb9ab2790498274296ee0a', '{}'),
	(205, 'property', '89b3d3c771632455ac9afded546881905fd03dcd', '{}'),
	(206, 'user_ears', '89b3d3c771632455ac9afded546881905fd03dcd', '{}'),
	(207, 'user_glasses', '89b3d3c771632455ac9afded546881905fd03dcd', '{}'),
	(208, 'user_helmet', '89b3d3c771632455ac9afded546881905fd03dcd', '{}'),
	(209, 'user_mask', '89b3d3c771632455ac9afded546881905fd03dcd', '{}'),
	(210, 'loaf_motel', '89b3d3c771632455ac9afded546881905fd03dcd', '{}'),
	(211, 'property', 'bc2e7d866706f7d795a7c8fa272acaa9c4392924', '{}'),
	(212, 'user_ears', 'bc2e7d866706f7d795a7c8fa272acaa9c4392924', '{}'),
	(213, 'user_glasses', 'bc2e7d866706f7d795a7c8fa272acaa9c4392924', '{}'),
	(214, 'user_helmet', 'bc2e7d866706f7d795a7c8fa272acaa9c4392924', '{}'),
	(215, 'user_mask', 'bc2e7d866706f7d795a7c8fa272acaa9c4392924', '{}'),
	(216, 'loaf_motel', 'bc2e7d866706f7d795a7c8fa272acaa9c4392924', '{}'),
	(217, 'property', 'f0e25920e358e159aca570be43551355cd3abe01', '{}'),
	(218, 'user_ears', 'f0e25920e358e159aca570be43551355cd3abe01', '{}'),
	(219, 'user_glasses', 'f0e25920e358e159aca570be43551355cd3abe01', '{}'),
	(220, 'user_helmet', 'f0e25920e358e159aca570be43551355cd3abe01', '{}'),
	(221, 'user_mask', 'f0e25920e358e159aca570be43551355cd3abe01', '{}'),
	(222, 'loaf_motel', 'f0e25920e358e159aca570be43551355cd3abe01', '{}'),
	(223, 'property', 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '{}'),
	(224, 'user_ears', 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '{}'),
	(225, 'user_glasses', 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '{}'),
	(226, 'user_helmet', 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '{}'),
	(227, 'user_mask', 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '{}'),
	(228, 'loaf_motel', 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '{}'),
	(229, 'property', 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	(230, 'user_glasses', 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	(231, 'user_mask', 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	(232, 'user_ears', 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	(233, 'user_helmet', 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	(234, 'loaf_motel', 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	(235, 'user_ears', '267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	(236, 'property', '267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	(237, 'loaf_motel', '267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	(238, 'user_glasses', '267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	(239, 'user_helmet', '267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	(240, 'user_mask', '267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	(241, 'property', '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}'),
	(242, 'user_ears', '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}'),
	(243, 'user_helmet', '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}'),
	(244, 'user_glasses', '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}'),
	(245, 'loaf_motel', '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}'),
	(246, 'user_mask', '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}');

-- Dumping structure for table base.doorscreator_buildings
CREATE TABLE IF NOT EXISTS `doorscreator_buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `default_state` tinyint(4) NOT NULL DEFAULT 0,
  `allowed_jobs` longtext DEFAULT NULL,
  `allowed_gangs` longtext DEFAULT NULL,
  `required_item` varchar(50) DEFAULT NULL,
  `requires_job_and_item` int(11) NOT NULL DEFAULT 0,
  `required_code` varchar(50) DEFAULT NULL,
  `auto_closure_seconds` int(11) DEFAULT NULL,
  `requires_identifier` int(11) NOT NULL DEFAULT 0,
  `allowed_identifiers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.doorscreator_buildings: ~9 rows (approximately)
DELETE FROM `doorscreator_buildings`;
INSERT INTO `doorscreator_buildings` (`id`, `label`, `default_state`, `allowed_jobs`, `allowed_gangs`, `required_item`, `requires_job_and_item`, `required_code`, `auto_closure_seconds`, `requires_identifier`, `allowed_identifiers`) VALUES
	(1, 'Polícia', 0, '{"police":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(2, 'Vagos', 0, '{"police":true,"vagos":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(3, 'Ballas', 0, '{"police":true,"ballas":true,"vagos":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(4, 'Families', 0, '{"groove":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(5, 'Vanilla', 0, '{"vanilla":true,"groove":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(6, 'Bahamas', 0, '{"bahamas":true,"groove":true,"vanilla":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(7, 'Hospital', 0, NULL, NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(8, 'Bennys', 0, '{"bennys":true}', NULL, NULL, 0, NULL, NULL, 0, '[]'),
	(9, 'Italia', 0, '{"italia":true}', NULL, NULL, 0, NULL, NULL, 0, '[]');

-- Dumping structure for table base.doorscreator_doors
CREATE TABLE IF NOT EXISTS `doorscreator_doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `doors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `default_state` tinyint(4) NOT NULL DEFAULT 0,
  `icon_coords` longtext NOT NULL,
  `max_distance` int(11) NOT NULL,
  `allowed_jobs` longtext DEFAULT NULL,
  `allowed_gangs` longtext DEFAULT NULL,
  `required_item` varchar(50) DEFAULT NULL,
  `requires_job_and_item` int(11) NOT NULL DEFAULT 0,
  `required_code` varchar(50) DEFAULT NULL,
  `auto_closure_seconds` int(11) DEFAULT NULL,
  `parent_building` int(11) DEFAULT NULL,
  `is_sliding` int(11) NOT NULL DEFAULT 0,
  `requires_identifier` int(11) NOT NULL DEFAULT 0,
  `allowed_identifiers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `vault` longtext DEFAULT NULL,
  `can_be_lockpicked` int(11) NOT NULL DEFAULT 1,
  `alert_police_on_lockpick` int(11) NOT NULL DEFAULT 0,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.doorscreator_doors: ~55 rows (approximately)
DELETE FROM `doorscreator_doors`;
INSERT INTO `doorscreator_doors` (`id`, `label`, `doors`, `default_state`, `icon_coords`, `max_distance`, `allowed_jobs`, `allowed_gangs`, `required_item`, `requires_job_and_item`, `required_code`, `auto_closure_seconds`, `parent_building`, `is_sliding`, `requires_identifier`, `allowed_identifiers`, `vault`, `can_be_lockpicked`, `alert_police_on_lockpick`, `shop_id`) VALUES
	(1, 'Polícia Entrada Esq', '{"910594":{"coords":{"x":440.52,"y":-977.6,"z":30.82},"model":-1406685646}}', 0, '{"x":441.12,"y":-977.59,"z":30.83}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(2, 'Polícia Entrada Dir', '{"845570":{"coords":{"x":440.52,"y":-986.23,"z":30.82},"model":-96679321}}', 0, '{"x":441.12,"y":-986.23,"z":30.83}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(3, 'Porta Direita Exterior', '{"779266":{"coords":{"x":440.74,"y":-998.75,"z":30.82},"model":-1547307588},"776706":{"coords":{"x":443.06,"y":-998.75,"z":30.82},"model":-1547307588}}', 0, '{"x":441.9,"y":-998.75,"z":30.82}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(4, 'Porta Esquerda Exterior', '{"815874":{"coords":{"x":455.89,"y":-972.25,"z":30.82},"model":-1547307588},"571138":{"coords":{"x":458.21,"y":-972.25,"z":30.82},"model":-1547307588}}', 0, '{"x":457.05,"y":-972.25,"z":30.82}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(5, 'Garagem Fora ', '{"786178":{"coords":{"x":410.03,"y":-1020.16,"z":28.4},"model":-1868050792},"783874":{"coords":{"x":410.03,"y":-1028.32,"z":28.42},"model":-1635161509}}', 0, '{"x":410.01,"y":-1024.18,"z":28.83}', 8, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(6, 'Garagem Dir', '{"2300930":{"coords":{"x":464.16,"y":-997.51,"z":26.37},"model":1830360419}}', 0, '{"x":464.16,"y":-996.91,"z":26.42}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(7, 'Garagem Esq', '{"2200322":{"coords":{"x":464.16,"y":-974.67,"z":26.37},"model":1830360419}}', 0, '{"x":464.16,"y":-975.27,"z":26.42}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(8, 'Cela 1', '{"2214658":{"coords":{"x":477.91,"y":-1012.19,"z":26.48},"model":-53345114}}', 0, '{"x":477.32,"y":-1012.16,"z":26.44}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(9, 'Cela 2', '{"2111746":{"coords":{"x":480.91,"y":-1012.19,"z":26.48},"model":-53345114}}', 0, '{"x":480.32,"y":-1012.16,"z":26.44}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(10, 'Cela 3', '{"2238978":{"coords":{"x":483.91,"y":-1012.19,"z":26.48},"model":-53345114}}', 0, '{"x":483.32,"y":-1012.16,"z":26.44}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(11, 'Cela 4', '{"2157314":{"coords":{"x":486.91,"y":-1012.19,"z":26.48},"model":-53345114}}', 0, '{"x":486.32,"y":-1012.16,"z":26.44}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(12, 'Cela 5', '{"2156546":{"coords":{"x":484.18,"y":-1007.73,"z":26.48},"model":-53345114}}', 0, '{"x":484.77,"y":-1007.76,"z":26.44}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(13, 'Porta Traseiras', '{"2333442":{"coords":{"x":469.77,"y":-1014.41,"z":26.48},"model":-692649124},"2057218":{"coords":{"x":467.37,"y":-1014.41,"z":26.48},"model":-692649124}}', 0, '{"x":468.57,"y":-1014.41,"z":26.53}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(14, 'Porta Telhado', '{"2835458":{"coords":{"x":464.31,"y":-984.53,"z":43.77},"model":-692649124}}', 0, '{"x":464.31,"y":-983.93,"z":43.82}', 2, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, 0, '[]', NULL, 0, 0, NULL),
	(15, 'Porta Frente', '{"4373762":{"coords":{"x":324.72,"y":-1991.09,"z":24.36},"model":2118614536}}', 0, '{"x":325.14,"y":-1990.59,"z":24.36}', 3, NULL, NULL, NULL, 0, NULL, NULL, 2, 0, 0, '[]', NULL, 0, 0, NULL),
	(16, 'Porta Trás', '{"4371970":{"coords":{"x":336.74,"y":-1991.84,"z":24.36},"model":2118614536}}', 0, '{"x":336.32,"y":-1992.34,"z":24.36}', 3, NULL, NULL, NULL, 0, NULL, NULL, 2, 0, 0, '[]', NULL, 0, 0, NULL),
	(17, 'Entrada', '{"4830210":{"coords":{"x":-1.87,"y":-1808.83,"z":25.54},"model":-1351120742}}', 0, '{"x":-2.28,"y":-1809.32,"z":25.52}', 3, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0, NULL),
	(18, 'Traseira', '{"4802050":{"coords":{"x":0.21,"y":-1823.3,"z":29.74},"model":-1052955611}}', 0, '{"x":-0.2,"y":-1823.79,"z":29.72}', 3, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, 0, '[]', NULL, 0, 0, NULL),
	(20, 'Entrada', '{"5618690":{"coords":{"x":127.95,"y":-1298.51,"z":29.42},"model":-1116041313}}', 0, '{"x":128.52,"y":-1298.2,"z":29.42}', 3, NULL, NULL, NULL, 0, NULL, NULL, 5, 0, 0, '[]', NULL, 0, 0, NULL),
	(21, 'Traseira', '{"5622530":{"coords":{"x":96.09,"y":-1284.85,"z":29.44},"model":1695461688}}', 0, '{"x":95.53,"y":-1285.19,"z":29.42}', 3, NULL, NULL, NULL, 0, NULL, NULL, 5, 0, 0, '[]', NULL, 0, 0, NULL),
	(22, 'Entrada', '{"6125058":{"coords":{"x":-1387.04,"y":-586.69,"z":30.45},"model":-224738884},"5950210":{"coords":{"x":-1389.14,"y":-588.06,"z":30.45},"model":666905606}}', 0, '{"x":-1388.09,"y":-587.38,"z":30.45}', 3, NULL, NULL, NULL, 0, NULL, NULL, 6, 0, 0, '[]', NULL, 0, 0, NULL),
	(23, 'Private', '{"5990658":{"coords":{"x":-1378.59,"y":-621.32,"z":30.45},"model":-2102541881}}', 0, '{"x":-1378.23,"y":-621.87,"z":30.45}', 2, NULL, NULL, NULL, 0, NULL, NULL, 6, 1, 0, '[]', NULL, 1, 0, NULL),
	(24, 'Private 2', '{"6131970":{"coords":{"x":-1377.68,"y":-624.88,"z":30.45},"model":-2102541881}}', 0, '{"x":-1378.23,"y":-625.24,"z":30.45}', 2, NULL, NULL, NULL, 0, NULL, NULL, 6, 0, 0, '[]', NULL, 0, 0, NULL),
	(25, 'Entrada Balcão', '{"2561538":{"coords":{"y":-595.46,"z":43.43,"x":313.48},"model":854291622}}', 0, '{"y":-596.07,"z":43.43,"x":313.26}', 2, NULL, NULL, NULL, 0, NULL, NULL, 7, 0, 0, '[]', NULL, 0, 0, NULL),
	(26, 'Entrada', '{"2576642":{"coords":{"y":-597.75,"z":43.43,"x":309.13},"model":854291622}}', 0, '{"y":-597.53,"z":43.43,"x":308.52}', 2, NULL, NULL, NULL, 0, NULL, NULL, 7, 0, 0, '[]', NULL, 0, 0, NULL),
	(30, 'Itália portao principal', '{"3470850":{"model":1286535678,"coords":{"x":-3137.57,"y":798.93,"z":16.36}}}', 0, '{"x":-3135.51,"y":795.81,"z":17.68}', 8, NULL, NULL, NULL, 0, NULL, NULL, 9, 0, 0, '[]', NULL, 0, 0, NULL),
	(31, 'Porta Mansao1', '{"4306434":{"model":1077118233,"coords":{"z":141.31,"y":2051.39,"x":-1887.9}},"4168194":{"model":1077118233,"coords":{"z":141.31,"y":2052.24,"x":-1890.23}}}', 0, '{"z":141.29,"y":2051.28,"x":-1889.33}', 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '[]', NULL, 0, 0, NULL),
	(32, 'Default', '{"4165890":{"model":1077118233,"coords":{"z":141.31,"y":2050.38,"x":-1885.21}},"4247298":{"model":1077118233,"coords":{"z":141.31,"y":2051.23,"x":-1887.53}}}', 0, '{"z":141.31,"y":2050.81,"x":-1886.37}', 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '[]', NULL, 0, 0, NULL),
	(33, 'PortasMansao2', '{"4261122":{"model":1843224684,"coords":{"z":140.92,"y":2073.47,"x":-1909.62}},"4246530":{"model":1843224684,"coords":{"z":140.91,"y":2071.88,"x":-1907.73}}}', 0, '{"z":140.91,"y":2072.68,"x":-1908.68}', 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '[]', NULL, 1, 0, NULL),
	(34, 'bahamas passagem 3', '{"2600706":{"model":645774080,"coords":{"z":30.31,"y":-633.86,"x":-1375.92}}}', 1, '{"z":30.31,"y":-633.75,"x":-1375.71}', 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '[]', NULL, 0, 0, NULL),
	(35, 'BahamasSemiEntradas', '{"4335362":{"model":134859901,"coords":{"z":30.45,"y":-592.62,"x":-1391.87}},"4336130":{"model":134859901,"coords":{"z":30.45,"y":-594.8,"x":-1390.45}}}', 0, '{"z":30.45,"y":-593.71,"x":-1391.16}', 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '[]', NULL, 1, 0, NULL),
	(36, 'bahamas passagem 1', '{"2768642":{"model":134859901,"coords":{"z":30.45,"y":-628.75,"x":-1373.76}}}', 0, '{"z":30.45,"y":-628.38,"x":-1374.3}', 4, NULL, NULL, NULL, 0, NULL, NULL, 6, 1, 0, '[]', NULL, 0, 0, NULL),
	(37, 'vanilla semi entrada', '{"3111170":{"model":390840000,"coords":{"z":29.44,"y":-1294.59,"x":116.23}}}', 0, '{"z":29.42,"y":-1295.15,"x":116.56}', 4, NULL, NULL, NULL, 0, NULL, NULL, 5, 1, 0, '[]', NULL, 0, 0, NULL),
	(38, 'vanilla semi entrada 3', '{"2983938":{"model":390840000,"coords":{"z":29.44,"y":-1296.26,"x":113.41}}}', 0, '{"z":29.42,"y":-1296.82,"x":113.74}', 4, NULL, NULL, NULL, 0, NULL, NULL, 5, 1, 0, '[]', NULL, 0, 0, NULL),
	(39, 'vanilla escritorio', '{"3078658":{"model":390840000,"coords":{"z":29.44,"y":-1293.69,"x":99.08}}}', 0, '{"z":29.43,"y":-1293.36,"x":99.64}', 4, NULL, NULL, NULL, 0, NULL, NULL, 5, 1, 0, '[]', NULL, 1, 0, NULL),
	(40, 'BallasPlaneamento', '{"4855042":{"model":373216819,"coords":{"z":29.34,"y":-1816.76,"x":0.04}}}', 0, '{"z":29.32,"y":-1816.27,"x":0.46}', 4, NULL, NULL, NULL, 0, NULL, NULL, 3, 1, 0, '[]', NULL, 0, 0, NULL),
	(41, 'BallasEscritorio', '{"4853506":{"model":373216819,"coords":{"z":29.34,"y":-1814.73,"x":0.7}}}', 0, '{"z":29.32,"y":-1814.32,"x":0.21}', 4, NULL, NULL, NULL, 0, NULL, NULL, 3, 1, 0, '[]', NULL, 0, 0, NULL),
	(42, 'BallasBasement', '{"4850434":{"model":373216819,"coords":{"z":29.34,"y":-1819.73,"x":-6.95}}}', 0, '{"z":29.32,"y":-1819.24,"x":-6.54}', 4, NULL, NULL, NULL, 0, NULL, NULL, 3, 1, 0, '[]', NULL, 0, 0, NULL),
	(43, 'entrada families', '{"3191554":{"model":1381046002,"coords":{"z":33.84,"y":-1622.65,"x":-152.02}}}', 0, '{"z":33.82,"y":-1622.14,"x":-151.64}', 4, NULL, NULL, NULL, 0, NULL, NULL, 4, 1, 0, '[]', NULL, 0, 0, NULL),
	(46, 'ItaliaPrincipalCasa', '{"5657346":{"model":308207762,"coords":{"z":9.08,"y":816.33,"x":-3217.28}}}', 0, '{"z":9.33,"y":815.78,"x":-3216.93}', 4, NULL, NULL, NULL, 0, NULL, NULL, 9, 1, 0, '[]', NULL, 0, 0, NULL),
	(48, 'PSPCHEFE', '{"6050818":{"model":-96679321,"coords":{"z":30.82,"y":-990.65,"x":458.65}}}', 0, '{"z":30.83,"y":-990.05,"x":458.65}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(49, 'PSP ROUPEIRO', '{"6100482":{"model":149284793,"coords":{"z":30.82,"y":-995.52,"x":458.09}}}', 0, '{"z":30.83,"y":-995.95,"x":457.66}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(50, 'ARQUIVOS PSP', '{"6064642":{"model":-96679321,"coords":{"z":30.82,"y":-995.53,"x":452.27}}}', 0, '{"z":30.83,"y":-995.95,"x":452.69}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(51, 'PSP PAUSA', '{"6026754":{"model":-1406685646,"coords":{"z":30.82,"y":-976.89,"x":458.65}}}', 0, '{"z":30.83,"y":-977.49,"x":458.65}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(52, 'PSP PRINCIPAL', '{"5853186":{"model":-1547307588,"coords":{"z":30.82,"y":-983.08,"x":434.74}},"5853442":{"model":-1547307588,"coords":{"z":30.82,"y":-980.76,"x":434.74}}}', 0, '{"z":30.82,"y":-981.92,"x":434.75}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(53, 'PSP CONFERENCIA', '{"6157058":{"model":-288803980,"coords":{"z":30.82,"y":-996.32,"x":438.2}},"6161666":{"model":-288803980,"coords":{"z":30.82,"y":-993.91,"x":438.2}}}', 0, '{"z":30.83,"y":-995.11,"x":438.18}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(54, 'PSPGARAGEM1', '{"5852674":{"model":2130672747,"coords":{"z":26.7,"y":-1000.77,"x":431.41}}}', 0, '{"z":26.7,"y":-1000.77,"x":431.41}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(55, 'PSPGARAGEM2', '{"5852418":{"model":2130672747,"coords":{"z":26.7,"y":-1000.77,"x":452.3}}}', 0, '{"z":26.7,"y":-1000.77,"x":452.3}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(56, 'PSPGARAGEMSAIDA', '{"5952258":{"model":-288803980,"coords":{"z":26.41,"y":-1000.54,"x":467.52}},"5951746":{"model":-288803980,"coords":{"z":26.41,"y":-1000.54,"x":469.93}}}', 0, '{"z":26.42,"y":-1000.54,"x":468.72}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(57, 'PSPGARAGEMTRASEIRA', '{"6326786":{"model":-1603817716,"coords":{"z":27.15,"y":-1017.21,"x":488.89}}}', 0, '{"z":28.7,"y":-1019.96,"x":488.92}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(58, 'PSPENTRADACELAS', '{"5947650":{"model":149284793,"coords":{"z":26.41,"y":-1010.2,"x":471.38}},"5937666":{"model":149284793,"coords":{"z":26.41,"y":-1007.79,"x":471.37}}}', 0, '{"z":26.42,"y":-1009,"x":471.37}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(59, 'PSPCELASAIDA1', '{"6198018":{"model":-53345114,"coords":{"z":26.48,"y":-1008.88,"x":476.62}}}', 0, '{"z":26.44,"y":-1008.28,"x":476.64}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(60, 'PSPCELASAIDA2', '{"6241282":{"model":-53345114,"coords":{"z":26.48,"y":-1004.12,"x":481.01}}}', 0, '{"z":26.44,"y":-1004.15,"x":481.6}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(61, 'PSPBASEMENT1', '{"6197762":{"model":149284793,"coords":{"z":26.41,"y":-997.91,"x":482.07}},"6160898":{"model":149284793,"coords":{"z":26.41,"y":-997.91,"x":479.66}}}', 0, '{"z":26.42,"y":-997.91,"x":480.87}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(62, 'SaidaBasementPSP', '{"5931010":{"model":149284793,"coords":{"z":26.41,"y":-985.03,"x":479.06}},"5928194":{"model":149284793,"coords":{"z":26.41,"y":-987.44,"x":479.06}}}', 0, '{"z":26.42,"y":-986.23,"x":479.06}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(63, 'PSPPROVAS', '{"6124546":{"model":-692649124,"coords":{"z":26.41,"y":-990.48,"x":475.83}}}', 0, '{"z":26.45,"y":-990.06,"x":475.41}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(64, 'PSPFILA', '{"5934338":{"model":149284793,"coords":{"z":26.41,"y":-997.91,"x":478.29}}}', 0, '{"z":26.42,"y":-997.91,"x":477.69}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(65, 'PSPSAIDAGARAGEM3', '{"6074626":{"model":-96679321,"coords":{"z":26.41,"y":-987.44,"x":471.38}},"6061826":{"model":-1406685646,"coords":{"z":26.41,"y":-985.03,"x":471.38}}}', 0, '{"z":26.42,"y":-986.23,"x":471.39}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(66, 'PSPCONTROLO', '{"5969410":{"model":-96679321,"coords":{"z":35.1,"y":-995.53,"x":448.98}}}', 0, '{"z":35.11,"y":-995.95,"x":449.41}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(67, 'PSPTREINAMENTO', '{"5971714":{"model":-96679321,"coords":{"z":35.1,"y":-981.58,"x":448.99}}}', 0, '{"z":35.11,"y":-982.03,"x":449.39}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(68, 'PSPTREINAMENTO2', '{"5971202":{"model":-1406685646,"coords":{"z":35.1,"y":-990.2,"x":448.99}}}', 0, '{"z":35.11,"y":-989.77,"x":449.41}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL),
	(69, 'PSPENCONTROS', '{"5956354":{"model":-96679321,"coords":{"z":35.1,"y":-990.71,"x":459.95}},"5963522":{"model":-1406685646,"coords":{"z":35.1,"y":-981.07,"x":459.95}}}', 0, '{"z":35.27,"y":-981.48,"x":459.19}', 4, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 0, '[]', NULL, 0, 0, NULL);

-- Dumping structure for table base.instagram_account
CREATE TABLE IF NOT EXISTS `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.instagram_account: ~0 rows (approximately)
DELETE FROM `instagram_account`;

-- Dumping structure for table base.instagram_followers
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.instagram_followers: ~0 rows (approximately)
DELETE FROM `instagram_followers`;

-- Dumping structure for table base.instagram_posts
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL DEFAULT 'Los Santos',
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.instagram_posts: ~0 rows (approximately)
DELETE FROM `instagram_posts`;

-- Dumping structure for table base.instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_general_ci;

-- Dumping data for table base.instagram_stories: ~0 rows (approximately)
DELETE FROM `instagram_stories`;

-- Dumping structure for table base.insta_stories
CREATE TABLE IF NOT EXISTS `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.insta_stories: ~0 rows (approximately)
DELETE FROM `insta_stories`;

-- Dumping structure for table base.inventory_clothes
CREATE TABLE IF NOT EXISTS `inventory_clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `items` text DEFAULT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.inventory_clothes: ~0 rows (approximately)
DELETE FROM `inventory_clothes`;

-- Dumping structure for table base.inventory_glovebox
CREATE TABLE IF NOT EXISTS `inventory_glovebox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table base.inventory_glovebox: ~0 rows (approximately)
DELETE FROM `inventory_glovebox`;

-- Dumping structure for table base.inventory_metadata
CREATE TABLE IF NOT EXISTS `inventory_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table base.inventory_metadata: ~0 rows (approximately)
DELETE FROM `inventory_metadata`;

-- Dumping structure for table base.inventory_stash
CREATE TABLE IF NOT EXISTS `inventory_stash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table base.inventory_stash: ~0 rows (approximately)
DELETE FROM `inventory_stash`;

-- Dumping structure for table base.inventory_trunk
CREATE TABLE IF NOT EXISTS `inventory_trunk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table base.inventory_trunk: ~0 rows (approximately)
DELETE FROM `inventory_trunk`;

-- Dumping structure for table base.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.items: ~38 rows (approximately)
DELETE FROM `items`;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('2005_blueberry', '2005 Blueberry Tangiers', 1, 0, 1),
	('4play', '4Play Fantasia', 1, 0, 1),
	('50_below', '50 Below Nirvana Dokha', 1, 0, 1),
	('adalya_love', 'Adalya Love 66', 1, 0, 1),
	('al_fakher', 'Al Fakher Two Apples', 1, 0, 1),
	('bandage', 'Bandage', 2, 0, 1),
	('black_phone', 'Black Phone', 10, 0, 1),
	('blue_mist', 'Starbuzz Blue Mist', 1, 0, 1),
	('blue_phone', 'Blue Phone', 10, 0, 1),
	('cane_mint', 'Tangiers Cane Mint', 1, 0, 1),
	('classic_phone', 'Classic Phone', 10, 0, 1),
	('coals', 'Shisha Coals', 1, 0, 1),
	('double_apple', 'Nakhla Double Apple', 1, 0, 1),
	('el_patron', 'Chaos El Patron', 1, 0, 1),
	('foil', 'Foil Paper', 1, 0, 1),
	('foil_poked', 'Foil Poked', 1, 0, 1),
	('foil_poker', 'Foil Poker', 1, 0, 1),
	('gold_phone', 'Gold Phone', 10, 0, 1),
	('greenlight_phone', 'Green Light Phone', 10, 0, 1),
	('green_phone', 'Green Phone', 10, 0, 1),
	('gummi_bear', 'Fumari White Gummi Bear', 1, 0, 1),
	('hose', 'Shisha Hose', 1, 0, 1),
	('hot_coals', 'Hot Coals', 1, 0, 1),
	('medikit', 'Medikit', 2, 0, 1),
	('mofo_fantasia', 'Adios Mofo Fantasia', 1, 0, 1),
	('peppermint_shake', 'Trifecta Blonde Peppermint Shake', 1, 0, 1),
	('phone_hack', 'Phone Hack', 10, 0, 1),
	('phone_module', 'Phone Module', 10, 0, 1),
	('pink_phone', 'Pink Phone', 10, 0, 1),
	('powerbank', 'Power Bank', 10, 0, 1),
	('radio', 'Radio', 1, 0, 1),
	('red_phone', 'Red Phone', 10, 0, 1),
	('social_smoke', 'Social Smoke Absolute Zero', 1, 0, 1),
	('spades_fantasia', 'Ace of Spades Fantasia', 1, 0, 1),
	('water', 'Water', 1, 0, 1),
	('white_phone', 'White Phone', 10, 0, 1),
	('zomo_cream', 'Acai Cream Zomo', 1, 0, 1),
	('zomo_lemon', 'Zomo Lemon Mint', 1, 0, 1);

-- Dumping structure for table base.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `enable_billing` int(1) DEFAULT 0,
  `can_rob` int(1) DEFAULT 0,
  `can_handcuff` int(1) DEFAULT 0,
  `can_lockpick_cars` int(1) DEFAULT 0,
  `can_wash_vehicles` int(1) DEFAULT 0,
  `can_repair_vehicles` int(1) DEFAULT 0,
  `can_impound_vehicles` int(1) DEFAULT 0,
  `can_check_identity` int(1) DEFAULT 0,
  `can_check_vehicle_owner` int(1) DEFAULT 0,
  `can_check_driving_license` int(1) DEFAULT 0,
  `can_check_weapon_license` int(1) DEFAULT 0,
  `can_heal` int(1) DEFAULT 0,
  `can_revive` int(1) DEFAULT 0,
  `actions_menu_enabled` int(1) DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.jobs: ~18 rows (approximately)
DELETE FROM `jobs`;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `enable_billing`, `can_rob`, `can_handcuff`, `can_lockpick_cars`, `can_wash_vehicles`, `can_repair_vehicles`, `can_impound_vehicles`, `can_check_identity`, `can_check_vehicle_owner`, `can_check_driving_license`, `can_check_weapon_license`, `can_heal`, `can_revive`, `actions_menu_enabled`) VALUES
	('ambulance', 'INEM', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0),
	('bahamas', 'Bahamas', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('ballas', 'Ballas', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('bennys', 'Benny\'s', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
	('cartel', 'Cartel', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('cpx', 'Complexo do alemão', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('cv', 'Comando Vermelho', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('families', 'The Families', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('franca', 'França', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('grota', 'Grota', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('italia', 'Tropa da Itália', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('japao', 'Tropa do Japão', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('police', 'PSP', 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
	('redline', 'Redline', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
	('shisha', 'Bar de Shisha', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('unemployed', 'Desempregado', 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
	('vagos', 'Vagos', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),
	('vanilla', 'Vanilla', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1);

-- Dumping structure for table base.jobs_armories
CREATE TABLE IF NOT EXISTS `jobs_armories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weapon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `components` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ammo` int(10) unsigned NOT NULL,
  `tint` int(11) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `identifier` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`marker_id`,`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.jobs_armories: ~0 rows (approximately)
DELETE FROM `jobs_armories`;

-- Dumping structure for table base.jobs_data
CREATE TABLE IF NOT EXISTS `jobs_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coords` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `grades_type` varchar(20) DEFAULT NULL,
  `specific_grades` varchar(255) DEFAULT NULL,
  `min_grade` smallint(6) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blip_id` int(11) DEFAULT NULL,
  `blip_color` int(11) DEFAULT 0,
  `blip_scale` float DEFAULT 1,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marker_type` int(11) DEFAULT 1,
  `marker_scale_x` float DEFAULT 1.5,
  `marker_scale_y` float DEFAULT 1.5,
  `marker_scale_z` float DEFAULT 0.5,
  `marker_color_red` int(3) DEFAULT 150,
  `marker_color_green` int(3) DEFAULT 150,
  `marker_color_blue` int(3) DEFAULT 0,
  `marker_color_alpha` int(3) DEFAULT 50,
  `ped` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ped_heading` float DEFAULT NULL,
  `object` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `object_pitch` float DEFAULT NULL,
  `object_roll` float DEFAULT NULL,
  `object_yaw` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.jobs_data: ~67 rows (approximately)
DELETE FROM `jobs_data`;
INSERT INTO `jobs_data` (`id`, `job_name`, `type`, `coords`, `grades_type`, `specific_grades`, `min_grade`, `data`, `blip_id`, `blip_color`, `blip_scale`, `label`, `marker_type`, `marker_scale_x`, `marker_scale_y`, `marker_scale_z`, `marker_color_red`, `marker_color_green`, `marker_color_blue`, `marker_color_alpha`, `ped`, `ped_heading`, `object`, `object_pitch`, `object_roll`, `object_yaw`) VALUES
	(4, 'police', 'duty', '{"x":"451.87","y":"-999.03","z":"30.70"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Entrar/Sair de Serviço', 27, 0.7, 0.7, 1, 0, 123, 255, 126, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'police', 'job_outfit', '{"y":"-999.04","x":"462.95","z":"30.69"}', 'minimumGrade', NULL, 0, '{"outfits":[{"torso_1":12,"mask_1":0,"label":"Policia de transito","bags_2":0,"pants_1":97,"helmet_1":-1,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":65,"glasses_1":0,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":15,"arms":18,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0},{"torso_1":184,"mask_1":64,"label":"Epri","bags_2":0,"pants_1":94,"helmet_1":56,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":65,"glasses_1":0,"helmet_2":1,"bags_1":0,"tshirt_2":0,"tshirt_1":15,"arms":18,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0},{"torso_1":204,"mask_1":0,"label":"Recruta","bags_2":0,"pants_1":83,"helmet_1":-1,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":65,"glasses_1":0,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":92,"arms":27,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0},{"torso_1":311,"mask_1":0,"label":"Agentes inverno","bags_2":0,"pants_1":83,"helmet_1":-1,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":65,"glasses_1":0,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":92,"arms":27,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0},{"torso_1":319,"mask_1":0,"label":"Agentes","bags_2":0,"pants_1":83,"helmet_1":100,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":65,"glasses_1":0,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":92,"arms":27,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0},{"torso_1":330,"mask_1":0,"label":"Direcao inverno","bags_2":0,"pants_1":83,"helmet_1":100,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":65,"glasses_1":0,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":92,"arms":27,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0}]}', NULL, NULL, NULL, 'Roupeiro', 27, 0.7, 0.7, 0.5, 0, 123, 245, 125, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'police', 'boss', '{"x":"459.95","y":"-984.78","z":"30.69"}', 'minimumGrade', NULL, 14, '{"canDeposit":true,"canEmployees":true,"canWithdraw":true,"canWashMoney":false,"canGrades":false}', NULL, NULL, NULL, 'Menu Chefe', 20, 0.5, 0.5, 0.5, 255, 255, 255, 166, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'police', 'stash', '{"x":"463.20","y":"-988.73","z":"30.70"}', 'minimumGrade', NULL, 14, NULL, NULL, NULL, NULL, 'Armário Chefe', 27, 0.7, 0.7, 0.7, 0, 123, 255, 125, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'police', 'stash', '{"x":"482.54","y":"-995.61","z":"30.71"}', 'minimumGrade', NULL, 2, NULL, NULL, NULL, NULL, 'Armário', 27, 0.7, 0.7, 0.5, 0, 123, 255, 125, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'police', 'garage_owned', '{"x":"441.44","y":"-988.11","z":"25.70"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"coords":{"x":437.3,"y":-988.87,"z":24.03},"radius":5,"heading":92.08},{"coords":{"x":437.3,"y":-991.64,"z":24.03},"radius":5,"heading":92.08}]}', NULL, NULL, NULL, 'Garagem', 36, 0.7, 0.7, 1, 0, 123, 255, 123, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 'ambulance', 'job_outfit', '{"y":"-598.33","x":"299.19","z":"43.22"}', 'minimumGrade', NULL, 0, '{"outfits":[{"torso_1":205,"torso_2":0,"bproof_1":0,"bproof_2":0,"glasses_2":0,"bags_2":0,"label":"Medico ","helmet_1":-1,"glasses_1":0,"tshirt_2":0,"mask_1":0,"tshirt_1":15,"bags_1":0,"chain_1":0,"pants_1":67,"pants_2":0,"arms":0,"mask_2":0,"chain_2":0,"shoes_1":48,"arms_2":0,"helmet_2":0,"decals_1":0,"decals_2":0,"shoes_2":0},{"torso_1":282,"torso_2":0,"bproof_1":0,"bproof_2":0,"glasses_2":0,"bags_2":0,"label":"Medico 2","helmet_1":-1,"glasses_1":0,"tshirt_2":0,"mask_1":0,"tshirt_1":15,"bags_1":0,"chain_1":0,"pants_1":67,"pants_2":0,"arms":0,"mask_2":0,"chain_2":0,"shoes_1":48,"arms_2":0,"helmet_2":0,"decals_1":0,"decals_2":0,"shoes_2":0}]}', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(50, 'ambulance', 'teleport', '{"z":"43.24","y":"-601.05","x":"330.14"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":73.16,"y":-583.97,"x":338.98}}', NULL, NULL, NULL, 'Telhado', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(51, 'ambulance', 'duty', '{"z":"43.28","y":"-595.06","x":"306.94"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Entrar/Sair de Serviço', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(52, 'ambulance', 'teleport', '{"z":"74.16","y":"-583.99","x":"339.09"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":42.28,"y":-601.01,"x":330.36}}', NULL, NULL, NULL, 'Piso 0', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(53, 'ambulance', 'teleport', '{"z":"43.28","y":"-595.61","x":"332.01"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":27.8,"y":-585.54,"x":342.2}}', NULL, NULL, NULL, 'Piso -1', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(54, 'ambulance', 'teleport', '{"z":"28.80","y":"-585.49","x":"342.17"}', 'minimumGrade', NULL, 0, '{"teleportCoords":{"z":42.28,"y":-595.62,"x":331.97}}', NULL, NULL, NULL, 'Piso 0', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(55, 'ambulance', 'garage', '{"z":"28.80","y":"-579.95","x":"337.10"}', 'minimumGrade', NULL, 0, '{"vehicles":{"panto":{"primaryColor":"#111111","secondaryColor":"#111111"}},"spawnPoints":[{"heading":342.51,"coords":{"z":27.12,"y":-585.62,"x":323.28},"radius":5},{"heading":339.88,"coords":{"z":27.12,"y":-587.54,"x":330.25},"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(62, 'grota', 'wardrobe', '{"y":"-255.77","z":"102.01","x":"1314.33"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 0, 112, 13, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(63, 'grota', 'boss', '{"y":"-187.55","z":"105.61","x":"1274.04"}', 'minimumGrade', NULL, 3, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 18, 81, 1, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(65, 'grota', 'garage_owned', '{"z":"99.95","y":"-204.83","x":"1271.86"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"heading":172.73,"radius":5,"coords":{"z":99.5,"y":-206.9,"x":1280.12}}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, 'cpx', 'boss', '{"y":"1691.47","z":"32.58","x":"-3093.15"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canWithdraw":true,"canGrades":true,"maxSalary":3000,"canEmployees":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(68, 'cpx', 'wardrobe', '{"y":"1744.80","z":"37.58","x":"-3077.78"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 0, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, 'ballas', 'boss', '{"y":"-1810.20","z":"28.15","x":"-1.34"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 'ballas', 'wardrobe', '{"y":"-1818.44","z":"28.15","x":"-8.37"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(71, 'ballas', 'garage_owned', '{"y":"-1836.08","z":"23.76","x":"8.48"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"heading":49.18,"coords":{"y":-1847.16,"z":23.51,"x":-0.65},"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(72, 'families', 'wardrobe', '{"y":"-1613.06","z":"32.65","x":"-162.77"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(73, 'families', 'boss', '{"y":"-1618.22","z":"32.65","x":"-164.30"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(74, 'families', 'garage_owned', '{"y":"-1632.46","z":"31.86","x":"-141.96"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"heading":147.21,"coords":{"y":-1635.22,"z":31.39,"x":-139.71},"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, 'vagos', 'wardrobe', '{"y":"-2000.61","z":"23.21","x":"326.75"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(76, 'vagos', 'boss', '{"y":"-1979.80","z":"23.21","x":"338.39"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(77, 'vagos', 'garage_owned', '{"y":"-2019.19","z":"19.74","x":"318.64"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"heading":48.35,"coords":{"y":-2019.28,"z":19.33,"x":309.75},"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(78, 'cartel', 'boss', '{"y":"2060.84","z":"144.57","x":"-1876.04"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(79, 'cartel', 'wardrobe', '{"y":"2063.91","z":"134.92","x":"-1881.08"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(80, 'cartel', 'garage_owned', '{"y":"2033.74","z":"139.74","x":"-1891.77"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"heading":258.1,"coords":{"y":2008.27,"z":140.65,"x":-1890.5},"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(81, 'japao', 'wardrobe', '{"y":"-2081.13","z":"51.61","x":"1390.41"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(82, 'japao', 'boss', '{"y":"-2090.81","z":"51.61","x":"1378.59"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(83, 'japao', 'garage_owned', '{"y":"-2079.96","z":"51.00","x":"1376.94"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"heading":38.25,"coords":{"y":-2065.16,"z":51,"x":1388.68},"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(84, 'franca', 'boss', '{"y":"1744.88","z":"211.13","x":"-2364.93"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(85, 'franca', 'wardrobe', '{"y":"1733.83","z":"211.13","x":"-2364.03"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(86, 'franca', 'garage_owned', '{"y":"1760.82","z":"186.97","x":"-2419.55"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"heading":40.9,"coords":{"y":1768.62,"z":186.43,"x":-2417.29},"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(87, 'bahamas', 'wardrobe', '{"y":"-635.60","z":"29.32","x":"-1379.94"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(88, 'bahamas', 'boss', '{"y":"-626.27","z":"29.36","x":"-1369.21"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(89, 'bahamas', 'garage_owned', '{"y":"-635.97","z":"27.67","x":"-1409.58"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"coords":{"y":-640.72,"z":27.67,"x":-1403.35},"heading":125.51,"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(90, 'vanilla', 'boss', '{"y":"-1292.83","z":"28.26","x":"94.81"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(91, 'vanilla', 'wardrobe', '{"y":"-1303.11","z":"27.79","x":"105.29"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(92, 'vanilla', 'garage_owned', '{"y":"-1310.00","z":"28.20","x":"153.42"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"coords":{"y":-1302.87,"z":27.99,"x":145.39},"heading":120.51,"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(93, 'shisha', 'boss', '{"y":"-37.43","z":"39.88","x":"-442.21"}', 'minimumGrade', NULL, 2, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(94, 'shisha', 'shop', '{"y":"-36.20","z":"39.88","x":"-434.79"}', 'minimumGrade', NULL, 0, '{"itemsOnSale":[]}', NULL, NULL, NULL, 'Loja', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(95, 'shisha', 'wardrobe', '{"y":"-25.55","z":"39.88","x":"-440.44"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(97, 'shisha', 'garage_owned', '{"y":"-27.74","z":"45.23","x":"-419.87"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"coords":{"y":-34.36,"z":45.25,"x":-417.51},"heading":234.65,"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(98, 'cv', 'boss', '{"y":"4992.17","z":"146.86","x":"-481.59"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(99, 'cv', 'wardrobe', '{"y":"4814.94","z":"218.06","x":"-344.15"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(100, 'italia', 'wardrobe', '{"y":"811.08","z":"7.95","x":"-3218.96"}', 'minimumGrade', NULL, 0, '[]', NULL, NULL, NULL, 'Roupeiro', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(101, 'italia', 'boss', '{"y":"813.60","z":"13.08","x":"-3233.65"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canGrades":false,"canEmployees":true,"maxSalary":3000,"canWithdraw":true}', NULL, NULL, NULL, 'Menu Chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(102, 'italia', 'garage_owned', '{"y":"839.92","z":"7.93","x":"-3202.43"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"coords":{"y":833.03,"z":7.93,"x":-3214.65},"heading":211.09,"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(103, 'cv', 'garage_owned', '{"y":"4991.96","z":"146.50","x":"-491.91"}', 'minimumGrade', NULL, 0, '{"spawnPoints":[{"coords":{"y":4993.13,"z":141.35,"x":-497.77},"heading":34.16,"radius":5}]}', NULL, NULL, NULL, 'Garagem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(104, 'grota', 'job_outfit', '{"y":"-209.73","x":"1284.59","z":"100.05"}', 'minimumGrade', NULL, 0, '{"outfits":[{"mask_2":0,"shoes_1":139,"bproof_1":0,"decals_1":0,"torso_2":0,"tshirt_2":0,"glasses_1":5,"mask_1":223,"bproof_2":0,"torso_1":552,"glasses_2":0,"helmet_1":183,"tshirt_1":15,"shoes_2":0,"bags_1":123,"decals_2":0,"label":"Gaja ","arms_2":0,"pants_2":0,"arms":249,"bags_2":0,"chain_2":0,"pants_1":215,"chain_1":0,"helmet_2":0},{"mask_2":0,"shoes_1":149,"bproof_1":0,"decals_1":0,"torso_2":0,"tshirt_2":0,"glasses_1":5,"mask_1":238,"bproof_2":0,"torso_1":524,"glasses_2":0,"helmet_1":190,"tshirt_1":15,"shoes_2":0,"bags_1":122,"decals_2":0,"label":"Homem","arms_2":0,"pants_2":0,"arms":206,"bags_2":0,"chain_2":0,"pants_1":196,"chain_1":0,"helmet_2":0}]}', NULL, NULL, NULL, 'roupa org', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(105, 'cpx', 'job_outfit', '{"y":"1723.36","x":"-3108.71","z":"35.40"}', 'minimumGrade', NULL, 0, '{"outfits":[{"mask_2":4,"shoes_1":6,"bproof_1":0,"decals_1":0,"torso_2":0,"tshirt_2":0,"glasses_1":5,"mask_1":119,"bproof_2":0,"torso_1":164,"glasses_2":0,"helmet_1":-1,"tshirt_1":15,"shoes_2":4,"bags_1":0,"decals_2":0,"label":"Homem","arms_2":0,"pants_2":0,"arms":1,"bags_2":0,"chain_2":0,"pants_1":45,"chain_1":0,"helmet_2":0},{"mask_2":4,"shoes_1":6,"bproof_1":0,"decals_1":0,"torso_2":2,"tshirt_2":0,"glasses_1":5,"mask_1":119,"bproof_2":0,"torso_1":127,"glasses_2":0,"helmet_1":-1,"tshirt_1":15,"shoes_2":4,"bags_1":0,"decals_2":0,"label":"Homem 2","arms_2":0,"pants_2":0,"arms":0,"bags_2":0,"chain_2":0,"pants_1":47,"chain_1":0,"helmet_2":0},{"mask_2":4,"shoes_1":1,"bproof_1":0,"decals_1":0,"torso_2":0,"tshirt_2":0,"glasses_1":5,"mask_1":103,"bproof_2":0,"torso_1":100,"glasses_2":0,"helmet_1":-1,"tshirt_1":15,"shoes_2":4,"bags_1":0,"decals_2":0,"label":"Mulher","arms_2":0,"pants_2":0,"arms":15,"bags_2":0,"chain_2":0,"pants_1":73,"chain_1":0,"helmet_2":0},{"mask_2":4,"shoes_1":1,"bproof_1":0,"decals_1":0,"torso_2":0,"tshirt_2":0,"glasses_1":5,"mask_1":103,"bproof_2":0,"torso_1":101,"glasses_2":0,"helmet_1":-1,"tshirt_1":15,"shoes_2":4,"bags_1":0,"decals_2":0,"label":"Mulher 2","arms_2":0,"pants_2":0,"arms":14,"bags_2":0,"chain_2":0,"pants_1":74,"chain_1":0,"helmet_2":0}]}', NULL, NULL, NULL, 'roupas trabalho', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(106, 'cartel', 'job_outfit', '{"y":"2055.03","x":"-1880.73","z":"139.98"}', 'minimumGrade', NULL, 0, '{"outfits":[{"torso_1":95,"mask_1":103,"label":"Mulher","bags_2":0,"pants_1":65,"helmet_1":-1,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":98,"glasses_1":5,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":15,"arms":17,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0},{"torso_1":142,"mask_1":119,"label":"Homem 1","bags_2":0,"pants_1":72,"helmet_1":-1,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":109,"glasses_1":0,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":85,"arms":1,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0},{"torso_1":143,"mask_1":119,"label":"Homem 2","bags_2":0,"pants_1":72,"helmet_1":-1,"bproof_1":0,"chain_1":0,"decals_1":0,"mask_2":0,"torso_2":0,"shoes_1":109,"glasses_1":0,"helmet_2":0,"bags_1":0,"tshirt_2":0,"tshirt_1":85,"arms":1,"glasses_2":0,"arms_2":0,"pants_2":0,"chain_2":0,"decals_2":0,"bproof_2":0,"shoes_2":0}]}', NULL, NULL, NULL, 'Roupa trabalho', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(107, 'japao', 'job_outfit', '{"y":"-2086.33","x":"1389.64","z":"51.61"}', 'minimumGrade', NULL, 0, '{"outfits":[{"mask_2":2,"shoes_1":1,"bproof_1":0,"decals_1":0,"torso_2":12,"tshirt_2":0,"glasses_1":5,"mask_1":124,"bproof_2":0,"torso_1":392,"glasses_2":0,"helmet_1":-1,"tshirt_1":15,"shoes_2":2,"bags_1":0,"decals_2":0,"label":"Mulher","arms_2":0,"pants_2":0,"arms":15,"bags_2":0,"chain_2":0,"pants_1":66,"chain_1":0,"helmet_2":0},{"mask_2":2,"shoes_1":6,"bproof_1":0,"decals_1":0,"torso_2":0,"tshirt_2":0,"glasses_1":5,"mask_1":140,"bproof_2":0,"torso_1":141,"glasses_2":0,"helmet_1":-1,"tshirt_1":15,"shoes_2":2,"bags_1":0,"decals_2":0,"label":"Homem","arms_2":0,"pants_2":0,"arms":0,"bags_2":0,"chain_2":0,"pants_1":49,"chain_1":0,"helmet_2":0}]}', NULL, NULL, NULL, 'Roupa trabalho', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(108, 'franca', 'job_outfit', '{"y":"1736.08","x":"-2383.29","z":"211.13"}', 'minimumGrade', NULL, 0, '{"outfits":[{"helmet_1":-1,"pants_1":135,"tshirt_2":0,"arms":0,"pants_2":0,"torso_2":1,"label":"Homem","chain_2":0,"glasses_1":0,"torso_1":127,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":119,"helmet_2":0,"bproof_1":0,"mask_2":6,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":74},{"helmet_1":-1,"pants_1":149,"tshirt_2":0,"arms":0,"pants_2":0,"torso_2":0,"label":"Mulher","chain_2":0,"glasses_1":5,"torso_1":97,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":182,"helmet_2":0,"bproof_1":0,"mask_2":13,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":61}]}', NULL, NULL, NULL, 'Roupa trabalho', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(109, 'bahamas', 'job_outfit', '{"y":"-633.16","x":"-1377.32","z":"29.32"}', 'minimumGrade', NULL, 0, '{"outfits":[{"helmet_1":-1,"pants_1":72,"tshirt_2":0,"arms":15,"pants_2":0,"torso_2":0,"label":"Mulher","chain_2":0,"glasses_1":5,"torso_1":99,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":118,"helmet_2":0,"bproof_1":0,"mask_2":0,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":1},{"helmet_1":-1,"pants_1":48,"tshirt_2":0,"arms":1,"pants_2":0,"torso_2":0,"label":"Homem","chain_2":0,"glasses_1":0,"torso_1":128,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":134,"helmet_2":0,"bproof_1":44,"mask_2":0,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":6}]}', NULL, NULL, NULL, 'Roupa trabalho', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(110, 'vanilla', 'job_outfit', '{"y":"-1305.56","x":"106.52","z":"27.79"}', 'minimumGrade', NULL, 0, '{"outfits":[{"helmet_1":-1,"pants_1":53,"tshirt_2":0,"arms":27,"pants_2":0,"torso_2":0,"label":"Homem","chain_2":0,"glasses_1":0,"torso_1":135,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":119,"helmet_2":0,"bproof_1":0,"mask_2":6,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":74},{"helmet_1":-1,"pants_1":53,"tshirt_2":0,"arms":27,"pants_2":0,"torso_2":0,"label":"Homem 2","chain_2":0,"glasses_1":0,"torso_1":136,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":119,"helmet_2":0,"bproof_1":0,"mask_2":6,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":74},{"helmet_1":-1,"pants_1":68,"tshirt_2":0,"arms":38,"pants_2":0,"torso_2":0,"label":"Mulher","chain_2":0,"glasses_1":5,"torso_1":90,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":182,"helmet_2":0,"bproof_1":0,"mask_2":0,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":61},{"helmet_1":-1,"pants_1":67,"tshirt_2":0,"arms":38,"pants_2":0,"torso_2":0,"label":"Mulher 2","chain_2":0,"glasses_1":5,"torso_1":90,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":182,"helmet_2":0,"bproof_1":0,"mask_2":0,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":61}]}', NULL, NULL, NULL, 'Vanilla', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(111, 'cv', 'job_outfit', '{"y":"4818.64","z":"217.38","x":"-336.86"}', 'minimumGrade', NULL, 0, '{"outfits":[{"bags_1":0,"torso_1":127,"shoes_2":0,"tshirt_1":15,"arms":0,"glasses_2":0,"chain_2":0,"bproof_2":0,"torso_2":0,"glasses_1":0,"decals_1":0,"helmet_1":-1,"shoes_1":74,"arms_2":0,"mask_1":140,"bags_2":0,"decals_2":0,"helmet_2":0,"bproof_1":0,"chain_1":0,"pants_1":135,"pants_2":0,"label":"Homem","mask_2":0,"tshirt_2":0},{"bags_1":0,"torso_1":98,"shoes_2":0,"tshirt_1":15,"arms":4,"glasses_2":0,"chain_2":0,"bproof_2":0,"torso_2":0,"glasses_1":5,"decals_1":0,"helmet_1":-1,"shoes_1":61,"arms_2":0,"mask_1":124,"bags_2":0,"decals_2":0,"helmet_2":0,"bproof_1":0,"chain_1":0,"pants_1":149,"pants_2":0,"label":"Mulher","mask_2":0,"tshirt_2":0}]}', NULL, NULL, NULL, 'Trabalho', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(112, 'italia', 'job_outfit', '{"y":"802.00","x":"-3225.26","z":"7.93"}', 'minimumGrade', NULL, 0, '{"outfits":[{"helmet_1":-1,"pants_1":107,"tshirt_2":0,"arms":4,"pants_2":0,"torso_2":1,"label":"Homem","chain_2":0,"glasses_1":5,"torso_1":128,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":119,"helmet_2":0,"bproof_1":0,"mask_2":5,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":74},{"helmet_1":-1,"pants_1":56,"tshirt_2":0,"arms":4,"pants_2":0,"torso_2":0,"label":"Mulher","chain_2":0,"glasses_1":5,"torso_1":96,"glasses_2":0,"bags_2":0,"chain_1":0,"tshirt_1":15,"bproof_2":0,"arms_2":0,"bags_1":0,"mask_1":103,"helmet_2":0,"bproof_1":0,"mask_2":5,"shoes_2":0,"decals_2":0,"decals_1":0,"shoes_1":61}]}', NULL, NULL, NULL, 'Trabalho', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(113, 'redline', 'job_outfit', '{"x":"-4.75","y":"6519.86","z":"30.30"}', 'minimumGrade', NULL, 4, '{"outfits":[{"pants_1":169,"bags_1":0,"helmet_2":0,"mask_2":0,"mask_1":0,"decals_2":0,"shoes_2":0,"bproof_2":0,"glasses_1":0,"bags_2":0,"arms":0,"shoes_1":65,"helmet_1":-1,"tshirt_2":0,"glasses_2":0,"pants_2":0,"torso_1":140,"arms_2":0,"bproof_1":0,"label":"Redline","decals_1":0,"chain_1":0,"chain_2":0,"tshirt_1":15,"torso_2":0},{"pants_1":87,"bags_1":0,"helmet_2":0,"mask_2":0,"mask_1":0,"decals_2":0,"shoes_2":0,"bproof_2":0,"glasses_1":0,"bags_2":0,"arms":0,"shoes_1":65,"helmet_1":-1,"tshirt_2":0,"glasses_2":0,"pants_2":0,"torso_1":139,"arms_2":0,"bproof_1":0,"label":"Redline 2 Homem","decals_1":0,"chain_1":0,"chain_2":0,"tshirt_1":15,"torso_2":0},{"pants_1":71,"bags_1":0,"helmet_2":0,"mask_2":0,"mask_1":0,"decals_2":0,"shoes_2":0,"bproof_2":0,"glasses_1":0,"bags_2":0,"arms":0,"shoes_1":65,"helmet_1":-1,"tshirt_2":0,"glasses_2":0,"pants_2":0,"torso_1":93,"arms_2":0,"bproof_1":0,"label":"Redline mulher","decals_1":0,"chain_1":0,"chain_2":0,"tshirt_1":15,"torso_2":0},{"pants_1":70,"bags_1":0,"helmet_2":0,"mask_2":0,"mask_1":0,"decals_2":0,"shoes_2":0,"bproof_2":0,"glasses_1":0,"bags_2":0,"arms":222,"shoes_1":88,"helmet_1":-1,"tshirt_2":0,"glasses_2":0,"pants_2":0,"torso_1":94,"arms_2":0,"bproof_1":0,"label":"Redline mulher","decals_1":0,"chain_1":0,"chain_2":0,"tshirt_1":15,"torso_2":0}]}', NULL, NULL, NULL, 'Redline', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(114, 'redline', 'garage', '{"z":"22.89","y":"-921.29","x":"-558.19"}', 'minimumGrade', NULL, 4, '{"spawnPoints":[{"radius":5,"heading":249.21,"coords":{"z":22.86,"y":-920.95,"x":-554.01}}],"vehicles":{"f150":{"secondaryColor":"#111111","primaryColor":"#111111","plate":"REDLINE"}}}', NULL, NULL, NULL, 'Redlinegaragem', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(115, 'redline', 'shop', '{"z":"6.04","y":"-3024.75","x":"121.87"}', 'minimumGrade', NULL, 0, '{"itemsOnSale":{"repairkit":{"blackMoney":false,"price":500}}}', NULL, NULL, NULL, 'Redlinecomprar', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(116, 'redline', 'boss', '{"z":"22.89","y":"-920.12","x":"-605.75"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canWithdraw":false,"canEmployees":true,"canGrades":false}', NULL, NULL, NULL, 'Chefe menu', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(117, 'bennys', 'shop', '{"z":"30.30","y":"-1317.29","x":"-198.82"}', 'minimumGrade', NULL, 0, '{"itemsOnSale":{"repairkit":{"blackMoney":false,"price":500}}}', NULL, NULL, NULL, 'bennys compra', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL),
	(118, 'bennys', 'boss', '{"z":"30.30","y":"-1319.17","x":"-227.40"}', 'minimumGrade', NULL, 4, '{"canWashMoney":false,"canDeposit":true,"canWithdraw":false,"canEmployees":true,"canGrades":false}', NULL, NULL, NULL, 'chefe', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table base.jobs_garages
CREATE TABLE IF NOT EXISTS `jobs_garages` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `marker_id` int(11) NOT NULL,
  `vehicle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `vehicle_props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`) USING BTREE,
  KEY `identifier` (`identifier`,`marker_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.jobs_garages: ~0 rows (approximately)
DELETE FROM `jobs_garages`;

-- Dumping structure for table base.jobs_shops
CREATE TABLE IF NOT EXISTS `jobs_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marker_id` int(11) NOT NULL,
  `item_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `marker_id` (`marker_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.jobs_shops: ~0 rows (approximately)
DELETE FROM `jobs_shops`;

-- Dumping structure for table base.jobs_wardrobes
CREATE TABLE IF NOT EXISTS `jobs_wardrobes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `label` varchar(50) NOT NULL,
  `outfit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.jobs_wardrobes: ~0 rows (approximately)
DELETE FROM `jobs_wardrobes`;

-- Dumping structure for table base.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.job_grades: ~74 rows (approximately)
DELETE FROM `job_grades`;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Desempregado', 0, '{}', '{}'),
	(3, 'police', 1, 'recruta', 'Recruta', 0, '{}', '{}'),
	(4, 'police', 2, 'agente', 'Agente', 0, '{}', '{}'),
	(5, 'police', 3, 'agente_principal', 'Agente Principal', 0, '{}', '{}'),
	(6, 'police', 4, 'agente_coordenador', 'Agente Coordenador', 0, '{}', '{}'),
	(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(27, 'redline', 1, 'novato', 'Novato', 0, '{}', '{}'),
	(28, 'redline', 2, 'mec_nico', 'Mecânico', 0, '{}', '{}'),
	(29, 'redline', 3, 'chefe_de_equipa', 'Chefe de Equipa', 0, '{}', '{}'),
	(30, 'redline', 4, 'boss', 'Patrão', 0, '{}', '{}'),
	(41, 'shisha', 1, 'empregado', 'empregado', 0, '{}', '{}'),
	(44, 'shisha', 2, 'boss', 'Patrão', 0, '{}', '{}'),
	(45, 'police', 5, 'chefe', 'Chefe', 0, '{}', '{}'),
	(46, 'police', 6, 'chefe_principal', 'Chefe Principal', 0, '{}', '{}'),
	(47, 'police', 7, 'chefe_coordenador', 'Chefe Coordenador', 0, '{}', '{}'),
	(48, 'police', 8, 'sub_comiss_rio', 'Sub-Comissário', 0, '{}', '{}'),
	(49, 'police', 9, 'comiss_rio', 'Comissário', 0, '{}', '{}'),
	(50, 'police', 10, 'sub_intendente', 'Sub-Intendente', 0, '{}', '{}'),
	(51, 'police', 11, 'intendente', 'Intendente', 0, '{}', '{}'),
	(52, 'police', 12, 'super_intendente', 'Super-Intendente', 0, '{}', '{}'),
	(53, 'police', 13, 'diretor_nacional_adjunto', 'Diretor Nacional Adjunto', 0, '{}', '{}'),
	(54, 'police', 14, 'boss', 'Diretor Nacional', 0, '{}', '{}'),
	(55, 'bennys', 1, 'novato', 'Novato', 0, '{}', '{}'),
	(56, 'bennys', 2, 'mec_nico', 'Mecânico', 0, '{}', '{}'),
	(57, 'bennys', 3, 'chefe_de_equipa', 'Chefe de Equipa', 0, '{}', '{}'),
	(58, 'bennys', 4, 'boss', 'Patrão', 0, '{}', '{}'),
	(59, 'italia', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(60, 'italia', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(61, 'italia', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(62, 'italia', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(63, 'vagos', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(64, 'vagos', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(65, 'vagos', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(66, 'vagos', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(67, 'ballas', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(68, 'ballas', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(69, 'ballas', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(70, 'ballas', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(71, 'families', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(72, 'families', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(73, 'families', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(74, 'families', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(75, 'vanilla', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(76, 'vanilla', 2, 'seguranca', 'Segurança', 0, '{}', '{}'),
	(77, 'vanilla', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(78, 'vanilla', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(79, 'bahamas', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(80, 'bahamas', 2, 'seguranca', 'Segurança', 0, '{}', '{}'),
	(81, 'bahamas', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(82, 'bahamas', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(84, 'cartel', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(85, 'cartel', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(86, 'cartel', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(87, 'cartel', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(88, 'cv', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(89, 'cv', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(90, 'cv', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(91, 'cv', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(92, 'grota', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(93, 'grota', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(94, 'grota', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(95, 'grota', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(96, 'cpx', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(97, 'cpx', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(98, 'cpx', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(99, 'cpx', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(100, 'japao', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(101, 'japao', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(102, 'japao', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(103, 'japao', 4, 'boss', 'Chefe', 0, '{}', '{}'),
	(104, 'franca', 1, 'membro', 'Membro', 0, '{}', '{}'),
	(105, 'franca', 2, 'assassino', 'Assassino', 0, '{}', '{}'),
	(106, 'franca', 3, 'sub_chefe', 'Sub-Chefe', 0, '{}', '{}'),
	(107, 'franca', 4, 'boss', 'Chefe', 0, '{}', '{}');

-- Dumping structure for table base.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.licenses: ~4 rows (approximately)
DELETE FROM `licenses`;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Código da estrada'),
	('drive', 'Carta de Condução B'),
	('drive_bike', 'Carta de Condução A'),
	('drive_truck', 'Carta de Condução C');

-- Dumping structure for table base.loaf_keys
CREATE TABLE IF NOT EXISTS `loaf_keys` (
  `unique_id` varchar(15) NOT NULL,
  `key_id` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `key_data` longtext DEFAULT NULL,
  PRIMARY KEY (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.loaf_keys: ~8 rows (approximately)
DELETE FROM `loaf_keys`;
INSERT INTO `loaf_keys` (`unique_id`, `key_id`, `identifier`, `key_data`) VALUES
	('2nKv9Z4', 'motel_1:room_1:id_6166', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{"unique_id":"2nKv9Z4","name":"Motel #1 (6166)","eventtype":"server","eventname":"loaf_motel:toggle_lock","key_id":"motel_1:room_1:id_6166"}'),
	('486T9gX', 'motel_3:room_1:id_1564', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{"eventname":"loaf_motel:toggle_lock","key_id":"motel_3:room_1:id_1564","name":"Motel #1 (1564)","unique_id":"486T9gX","eventtype":"server"}'),
	('49SBVH3', 'motel_1:room_5:id_4193', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{"key_id":"motel_1:room_5:id_4193","unique_id":"49SBVH3","name":"Motel #5 (4193)","eventname":"loaf_motel:toggle_lock","eventtype":"server"}'),
	('c27035P', 'motel_1:room_1:id_6224', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{"name":"Motel #1 (6224)","unique_id":"c27035P","eventname":"loaf_motel:toggle_lock","eventtype":"server","key_id":"motel_1:room_1:id_6224"}'),
	('kML10z5', 'motel_1:room_21:id_8001', '60b15438266ee12985638e2993b1a411a27d7bf6', '{"key_id":"motel_1:room_21:id_8001","eventname":"loaf_motel:toggle_lock","eventtype":"server","unique_id":"kML10z5","name":"Motel #21 (8001)"}'),
	('Kt90G7n', 'motel_1:room_21:id_9481', '60b15438266ee12985638e2993b1a411a27d7bf6', '{"key_id":"motel_1:room_21:id_9481","eventname":"loaf_motel:toggle_lock","eventtype":"server","name":"Motel #21 (9481)","unique_id":"Kt90G7n"}'),
	('T2Tt228', 'motel_1:room_1:id_9077', '391a38f06c95f8e488ff79e788562896d8ce5cb7', '{"unique_id":"T2Tt228","name":"Motel #1 (9077)","eventtype":"server","eventname":"loaf_motel:toggle_lock","key_id":"motel_1:room_1:id_9077"}'),
	('Tx42835', 'motel_1:room_21:id_8001', '60b15438266ee12985638e2993b1a411a27d7bf6', '{"key_id":"motel_1:room_21:id_8001","eventname":"loaf_motel:toggle_lock","eventtype":"server","unique_id":"Tx42835","name":"Motel #21 (8001)"}');

-- Dumping structure for table base.loaf_motel
CREATE TABLE IF NOT EXISTS `loaf_motel` (
  `identifier` varchar(255) NOT NULL,
  `id` int(4) DEFAULT NULL,
  `motel` int(5) DEFAULT NULL,
  `room` int(5) DEFAULT NULL,
  `interior` int(5) NOT NULL DEFAULT 1,
  `rentmoney` int(9) NOT NULL DEFAULT 0,
  `next_rent` int(9) NOT NULL DEFAULT 0,
  `registered_inventory` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.loaf_motel: ~1 rows (approximately)
DELETE FROM `loaf_motel`;
INSERT INTO `loaf_motel` (`identifier`, `id`, `motel`, `room`, `interior`, `rentmoney`, `next_rent`, `registered_inventory`) VALUES
	('6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', 1564, 3, 1, 1, 0, 1685026897, 0);

-- Dumping structure for table base.naturalcrypto
CREATE TABLE IF NOT EXISTS `naturalcrypto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(50) NOT NULL,
  `accounts` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.naturalcrypto: ~12 rows (approximately)
DELETE FROM `naturalcrypto`;
INSERT INTO `naturalcrypto` (`ID`, `identifier`, `name`, `accounts`) VALUES
	(3, '391a38f06c95f8e488ff79e788562896d8ce5cb7', 'SrD4rkOficial', '{"monero":0,"solana":0,"bitcoin":0,"ethereum":0,"apecoin":0,"dogecoin":0,"stellar":0,"cardano":0,"litecoin":0,"tether":0}'),
	(4, '60b15438266ee12985638e2993b1a411a27d7bf6', 'ʂρнєҳҳƦҳ', '{"bitcoin":0,"stellar":0,"ethereum":0,"cardano":0,"solana":0,"apecoin":0,"litecoin":0,"tether":0,"dogecoin":0,"monero":0}'),
	(5, '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', 'Mycry_1337', '{"tether":0,"litecoin":0,"apecoin":0,"dogecoin":0,"ethereum":0,"bitcoin":0,"solana":0,"cardano":0,"stellar":0,"monero":0}'),
	(6, 'f0e25920e358e159aca570be43551355cd3abe01', 'NG | Destin', '{"dogecoin":0,"tether":0,"cardano":0,"apecoin":0,"bitcoin":0,"litecoin":0,"ethereum":0,"solana":0,"stellar":0,"monero":0}'),
	(7, 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '.GhostBoyᴹˢ', '{"tether":0,"solana":0,"cardano":0,"dogecoin":0,"litecoin":0,"apecoin":0,"bitcoin":0,"ethereum":0,"monero":0,"stellar":0}'),
	(8, '29f9bf803077d2cd85b04f13265436df61aeab0e', 'BLD - Roxo', '{"bitcoin":0,"solana":0,"stellar":0,"cardano":0,"litecoin":0,"monero":0,"apecoin":0,"tether":0,"dogecoin":0,"ethereum":0}'),
	(9, 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', 'xicobranco5', '{"tether":0,"apecoin":0,"stellar":0,"litecoin":0,"bitcoin":0,"ethereum":0,"dogecoin":0,"solana":0,"monero":0,"cardano":0}'),
	(10, '267657e2ebf25e299aa963f279935a4af9d06e48', '	JL', '{"tether":0,"litecoin":0,"solana":0,"monero":0,"stellar":0,"apecoin":0,"dogecoin":0,"cardano":0,"bitcoin":0,"ethereum":0}'),
	(11, '7fd41199089be211da9c71096825616aa8a35e69', 'NG-micrasfan né vida', '{"dogecoin":0,"tether":0,"cardano":0,"bitcoin":0,"apecoin":0,"litecoin":0,"ethereum":0,"solana":0,"stellar":0,"monero":0}'),
	(12, '9d013dc670d84c861761f7b07a38056ca62f2c04', 'NG | KINDER OVO??', '{"bitcoin":0,"apecoin":0,"solana":0,"monero":0,"stellar":0,"litecoin":0,"dogecoin":0,"cardano":0,"ethereum":0,"tether":0}'),
	(13, '9ba090eaed1210f5a612e97969cd55d1e04cdf60', 'Top G', '{"bitcoin":0,"apecoin":0,"solana":0,"monero":0,"stellar":0,"tether":0,"cardano":0,"ethereum":0,"litecoin":0,"dogecoin":0}'),
	(14, '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', 'silba', '{"bitcoin":0,"apecoin":0,"solana":0,"monero":0,"stellar":0,"tether":0,"cardano":0,"ethereum":0,"litecoin":0,"dogecoin":0}');

-- Dumping structure for table base.okokbanking_societies
CREATE TABLE IF NOT EXISTS `okokbanking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokbanking_societies: ~0 rows (approximately)
DELETE FROM `okokbanking_societies`;

-- Dumping structure for table base.okokbanking_transactions
CREATE TABLE IF NOT EXISTS `okokbanking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokbanking_transactions: ~10 rows (approximately)
DELETE FROM `okokbanking_transactions`;
INSERT INTO `okokbanking_transactions` (`id`, `receiver_identifier`, `receiver_name`, `sender_identifier`, `sender_name`, `date`, `value`, `type`) VALUES
	(1, 'bank', 'Bank (Change PIN)', '7599c0508035ab64a1bfb7fa200781eb32d743e6', 'Manolo Capone', '2023-04-24 15:13:15', 0, 'transfer'),
	(2, '391a38f06c95f8e488ff79e788562896d8ce5cb7', 'Joao Almeida', 'bank', 'Bank Account', '2023-04-29 17:15:25', 10, 'withdraw'),
	(3, 'bank', 'Bank Account', '391a38f06c95f8e488ff79e788562896d8ce5cb7', 'Joao Almeida', '2023-04-29 17:15:29', 10, 'deposit'),
	(4, '60b15438266ee12985638e2993b1a411a27d7bf6', 'Goncalo Costa', 'bank', 'Bank Account', '2023-05-02 19:28:19', 100, 'withdraw'),
	(5, '60b15438266ee12985638e2993b1a411a27d7bf6', 'Goncalo Costa', 'bank', 'Bank Account', '2023-05-02 19:28:23', 10000, 'withdraw'),
	(6, 'bank', 'Bank Account', '60b15438266ee12985638e2993b1a411a27d7bf6', 'Goncalo Costa', '2023-05-10 01:30:19', 9000000, 'deposit'),
	(7, 'bank', 'Bank (Change PIN)', 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', 'Elias Malaquias', '2023-05-10 19:32:34', 0, 'transfer'),
	(8, 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', 'Elias Malaquias', 'bank', 'Bank Account', '2023-05-10 19:32:42', 10000, 'withdraw'),
	(9, '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', 'Tiago Lima', 'bank', 'Bank Account', '2023-05-11 16:50:28', 500, 'withdraw'),
	(10, 'bank', 'Bank Account', '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', 'Tiago Lima', '2023-05-11 16:50:32', 500, 'deposit'),
	(11, '60b15438266ee12985638e2993b1a411a27d7bf6', 'Goncalo Costa', 'bank', 'Bank Account', '2023-05-19 11:52:21', 100, 'withdraw');

-- Dumping structure for table base.okokbilling
CREATE TABLE IF NOT EXISTS `okokbilling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(10) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `society` varchar(255) NOT NULL,
  `society_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `invoice_value` int(11) NOT NULL,
  `fees_amount` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` varchar(255) DEFAULT ' ',
  `sent_date` varchar(255) NOT NULL,
  `limit_pay_date` varchar(255) NOT NULL,
  `paid_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokbilling: ~0 rows (approximately)
DELETE FROM `okokbilling`;

-- Dumping structure for table base.okokgarage_companies
CREATE TABLE IF NOT EXISTS `okokgarage_companies` (
  `company_name` varchar(50) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `owner_name` varchar(50) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `employees` longtext DEFAULT NULL,
  `total_sales` int(11) DEFAULT NULL,
  `sales_history` longtext DEFAULT NULL,
  CONSTRAINT `employees` CHECK (json_valid(`employees`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokgarage_companies: ~0 rows (approximately)
DELETE FROM `okokgarage_companies`;

-- Dumping structure for table base.okokgarage_pgarages
CREATE TABLE IF NOT EXISTS `okokgarage_pgarages` (
  `garagename` varchar(250) DEFAULT NULL,
  `coords` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `owners` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokgarage_pgarages: ~0 rows (approximately)
DELETE FROM `okokgarage_pgarages`;

-- Dumping structure for table base.okokgarage_sharedgarages
CREATE TABLE IF NOT EXISTS `okokgarage_sharedgarages` (
  `owner` varchar(255) DEFAULT NULL,
  `ownername` varchar(50) DEFAULT NULL,
  `sharedwith` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokgarage_sharedgarages: ~0 rows (approximately)
DELETE FROM `okokgarage_sharedgarages`;

-- Dumping structure for table base.okokvehicleshop_orders
CREATE TABLE IF NOT EXISTS `okokvehicleshop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) NOT NULL,
  `shop_type` varchar(255) NOT NULL,
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `reward` varchar(255) NOT NULL,
  `in_progress` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokvehicleshop_orders: ~0 rows (approximately)
DELETE FROM `okokvehicleshop_orders`;

-- Dumping structure for table base.okokvehicleshop_saleshistory
CREATE TABLE IF NOT EXISTS `okokvehicleshop_saleshistory` (
  `shop_id` varchar(255) NOT NULL,
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_id` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokvehicleshop_saleshistory: ~0 rows (approximately)
DELETE FROM `okokvehicleshop_saleshistory`;

-- Dumping structure for table base.okokvehicleshop_shops
CREATE TABLE IF NOT EXISTS `okokvehicleshop_shops` (
  `shop_name` varchar(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `money` varchar(255) NOT NULL,
  `employees` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokvehicleshop_shops: ~3 rows (approximately)
DELETE FROM `okokvehicleshop_shops`;
INSERT INTO `okokvehicleshop_shops` (`shop_name`, `shop_id`, `owner`, `owner_name`, `money`, `employees`) VALUES
	('Vehicle Shop', 'vehicles1', NULL, NULL, '0', NULL),
	('Air Shop', 'air1', NULL, NULL, '0', NULL),
	('Water Shop', 'water1', NULL, NULL, '0', NULL);

-- Dumping structure for table base.okokvehicleshop_vehicles
CREATE TABLE IF NOT EXISTS `okokvehicleshop_vehicles` (
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `stock` longtext DEFAULT NULL,
  `unlisted` longtext DEFAULT NULL,
  `min_price` varchar(255) NOT NULL,
  `max_price` varchar(255) NOT NULL,
  `owner_buy_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.okokvehicleshop_vehicles: ~163 rows (approximately)
DELETE FROM `okokvehicleshop_vehicles`;
INSERT INTO `okokvehicleshop_vehicles` (`vehicle_name`, `vehicle_id`, `category`, `type`, `stock`, `unlisted`, `min_price`, `max_price`, `owner_buy_price`) VALUES
	('BMW I8', 'i8', 'bmw', 'vehicles', '200', '0', '', '100', ''),
	('ALFA ROMEO MILANO', 'alf75', 'alfaromeo', 'vehicles', '200', NULL, '', '100', ''),
	('ALFA ROMEO 4C', '4c', 'alfaromeo', 'vehicles', '200', NULL, '', '100', ''),
	('ASTON MARTIM VULCAN', 'vulcan', 'astonmartin', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI RS3', 'rs3', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI RS5', 'rs5', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI RS7', 'rs7', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI SQ7', 'sq72016', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI ETRON', 'ocnetrongt', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI R8', 'r8ppi', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI Q8', 'q8prior', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 1', 'r8prior', 'vip', 'vehicles', '0', NULL, '', '0', ''),
	('AUDI RS6', 'rs6avant20', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('AUDI TTRS', 'ttrs', 'audi', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 2', 'rmodskyline34', 'vip', 'vehicles', '0', NULL, '', '0', ''),
	('VIP 3', 'hycade', 'vip', 'vehicles', '0', NULL, '', '0', ''),
	('BMW M8', 'mansm8', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BENTLEY MULSANNE', 'bmm', 'bentley', 'vehicles', '200', NULL, '', '100', ''),
	('BENTLEY SUPERSPORT', 'ben17', 'bentley', 'vehicles', '200', NULL, '', '100', ''),
	('BENTLEY B', 'rmodbacalar', 'bentley ', 'vehicles', '200', NULL, '', '100', ''),
	('BMW ALPINA', 'alpinab7', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BMW M3 E30', 'm3e30', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BMW M4', 'f82', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BMW M5', 'bmci', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BMW M8', 'bmwm8', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BMW Z4', 'z4bmw', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BMW X6', 'rmodx6', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BMW M6', 'm6f13', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('BRABUS B63S', 'b63s', 'brabus', 'vehicles', '200', NULL, '', '100', ''),
	('BRABUS 700', 'brabus700', 'brabus', 'vehicles', '200', NULL, '', '100', ''),
	('BUGATTI CENTODIECI', 'bugatticentodieci', 'bugatti', 'vehicles', '200', NULL, '', '100', ''),
	('CITROEN DS7', 'ds7', 'citroen', 'vehicles', '200', NULL, '', '100', ''),
	('CITROEN SURVOLT', 'survolt', 'citroen', 'vehicles', '200', NULL, '', '100', ''),
	('DODGE 2019', '19ramoffroad', 'dodge', 'vehicles', '200', NULL, '', '100', ''),
	('DODGE CHALLANGER', '16challenger', 'dodge', 'vehicles', '200', NULL, '', '100', ''),
	('DODGE RAM', 'ram2500', 'dodge', 'vehicles', '200', NULL, '', '100', ''),
	('DODGE TRX', 'trx', 'dodge', 'vehicles', '200', NULL, '', '100', ''),
	('FERRARI F12', 'rmodf12tdf', 'ferrari', 'vehicles', '200', NULL, '', '100', ''),
	('FERRARI F430', 'f430s', 'ferrari', 'vehicles', '200', NULL, '', '100', ''),
	('FERRARU FXXK ', 'fxxk', 'ferrari', 'vehicles', '200', NULL, '', '100', ''),
	('PORSCHE MACAN', 'ursa', 'porsche', 'vehicles', '200', NULL, '', '100', ''),
	('PORSCHE 911R', '911R', 'porsche', 'vehicles', '200', NULL, '', '100', ''),
	('PORSCHE 911 CABRIOLET', '911tbs', 'porsche', 'vehicles', '200', NULL, '', '100', ''),
	('PORSCHE GT3', 'pgt3', 'porsche', 'vehicles', '200', NULL, '', '100', ''),
	('PORSCHE 911 TURBO S', '911turbos', 'porsche', 'vehicles', '200', NULL, '', '100', ''),
	('PORSCHE CAYMAN', 'cayman16', 'porsche', 'vehicles', '200', NULL, '', '100', ''),
	('PORSCHE PANAMERA TURBO', 'pturismo', 'porsche', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 4', 'rmodf40', 'vip', 'vehicles', '0', NULL, '', '0', ''),
	('MUSTANG 2015 GT', 'rmodmustang', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('FORD BRONCO', 'wildtrak', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('FORD RAPTOR 2017', 'raptor2017', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('FORD GT 2005', 'FGT', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('FORD GT 2017', 'gt17', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('MUSTANG ', 'MGT', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('MUSTANG 302', '13fmb302', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('MUSTANG MACH', 'mach1', 'ford', 'vehicles', '200', NULL, '', '100', ''),
	('HONDA CIVIC', 'crxds', 'honda', 'vehicles', '200', NULL, '', '100', ''),
	('HONDA CIVIC EF9', 'EF9', 'honda', 'vehicles', '200', NULL, '', '100', ''),
	('HONDA Z10', 'cfmotoz10', 'honda', 'vehicles', '200', NULL, '', '100', ''),
	('HONDA EG6', 'eg6', 'honda', 'vehicles', '200', NULL, '', '100', ''),
	('HONDA CRX', 'honcrx91', 'honda', 'vehicles', '200', NULL, '', '100', ''),
	('HONDA EK9', 'EK9', 'honda', 'vehicles', '200', NULL, '', '100', ''),
	('HONDA S2000', 'ap2', 'honda', 'vehicles', '200', NULL, '', '100', ''),
	('JAGUAR FTYPE', 'ftype', 'jaguar', 'vehicles', '200', NULL, '', '100', ''),
	('JAGUAR XKRS', 'xkgt', 'jaguar', 'vehicles', '200', NULL, '', '100', ''),
	('JEEP', '92jeepcherokee', 'jeep', 'vehicles', '200', NULL, '', '100', ''),
	('JEEP DEMONHAWK', 'trhawk', 'jeep', 'vehicles', '200', NULL, '', '100', ''),
	('JEEP 6X6', 'jeep6x6', 'jeep', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI AVENTADOR', 'aventadors', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI HURACAN', 'lhgt3', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI URUS', 'urus', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI 670', 'rmodlp670', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI SIAN', 'rmodsianr', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI VENENO', 'veneno', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('MASERATI GHIBLI', 'ghis2', 'maserati', 'vehicles', '200', NULL, '', '100', ''),
	('MASERATI MC12', 'mc12', 'maserati', 'vehicles', '200', NULL, '', '100', ''),
	('MAZDA MX5', 'miata2', 'mazda', 'vehicles', '200', NULL, '', '100', ''),
	('MAZDA RX7', 'rx7tunable', 'mazda', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN 650', '650slw', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN 570S', '570s2', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN 650S', '650s', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN 675LT', '675lt', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN 720S', '720s', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN SENNA', 'senna', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN P1', 'p1', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES 300SL', 'mb300sl', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES BENZ ', 'clkgtr', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES CLS2015', 'cls2015', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES GLE 2020', 'gle63c', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES 6X6', 'g63amg6x6', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES AMG45', 'a45amg', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES AMGGT', 'amggtr', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES AMGC63', 'c63w205', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES AMG CABRIOLET', 'mers63c', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES G65', 'rmodg65', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES W210', 'w210', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('MITSUBISHI 2008 STI', 'subisti08', 'mitsubishi', 'vehicles', '200', NULL, '', '100', ''),
	('MITSUBISHI EVOX', 'cz4a', 'mitsubishi', 'vehicles', '200', NULL, '', '100', ''),
	('MITSUBISHI ECLIPSE', 'eclipse', 'mitsubishi', 'vehicles', '200', NULL, '', '100', ''),
	('S1000', 's1000rr', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('AFRICATWIN', 'africat', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('DIAVEL', 'diavel', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('DM1200', 'dm1200', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 5', 'nh2r', 'vip', 'vehicles', '200', NULL, '', '100', ''),
	('HCBR 17', 'hcbr17', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('KX450F', 'kx450f', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('KRUSTDATA', 'krust', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('KTM450SX', 'ktm450sx', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('MT03', 'mt03', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('NINJA250', 'ninja250fi', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('YZ450F', 'yzfsm', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('YZFR6', 'yzfr6', 'motas', 'vehicles', '200', NULL, '', '100', ''),
	('GTR R32', 'r32', 'nissan', 'vehicles', '200', NULL, '', '100', ''),
	('NISSAN 350Z', '350z', 'nissan', 'vehicles', '200', NULL, '', '100', ''),
	('NISSAN 370Z', '370z', 'nissan', 'vehicles', '200', NULL, '', '100', ''),
	('NISSAN GTR', 'gtr', 'nissan', 'vehicles', '200', NULL, '', '100', ''),
	('NISSAN QASHQAI16', 'qashqai16', 'nissan', 'vehicles', '200', NULL, '', '100', ''),
	('NISSAN TITAN ', 'nissantitan17', 'nissan', 'vehicles', '200', NULL, '', '100', ''),
	('OPEL CALIBRA', 'calgt', 'opel', 'vehicles', '200', NULL, '', '100', ''),
	('PAGANI CCX', 'ccx', 'pagani', 'vehicles', '200', NULL, '', '100', ''),
	('PAGANI IMOLA', 'Imola', 'pagani', 'vehicles', '200', NULL, '', '100', ''),
	('PAGANI BC', 'bc', 'pagani', 'vehicles', '200', NULL, '', '100', ''),
	('PAGANI RMOD', 'rmodpagani', 'pagani', 'vehicles', '200', NULL, '', '100', ''),
	('PAGANI TRICOLORE', 'tricolore', 'pagani', 'vehicles', '200', NULL, '', '100', ''),
	('PEUGEOT 205', 'yPG205t16B', 'peugeot', 'vehicles', '200', NULL, '', '100', ''),
	('LANDROVER 2021', 'defenderoffp', 'landrover', 'vehicles', '200', NULL, '', '100', ''),
	('BENTLEY CALAR', 'rmodbacalar', 'bentley', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 6', 'gtr50', 'vip', 'vehicles', '200', NULL, '', '100', ''),
	('BUGATTI LA NOIRE', 'rmodbugatti', 'bugatti', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES RG65', 'rmodg65', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI 670', 'rmodlp670', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('MK7', 'rmodmk7', 'volkswagen', 'vehicles', '200', NULL, '', '100', ''),
	('LAMBORGHINI SIAN', 'rmodsianr', 'lamborghini', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 7', 'rmodcharger69', 'vip', 'vehicles', '200', NULL, '', '100', ''),
	('RENAULT TWIZY', 'twizy', 'renault', 'vehicles', '200', NULL, '', '100', ''),
	('RENAULT 5TB', 'yRenault5TB', 'renault', 'vehicles', '200', NULL, '', '100', ''),
	('RENAULT CLIO', 'clio', 'renault', 'vehicles', '200', NULL, '', '100', ''),
	('RENAULT KANGOO', 'kangoo', 'renault', 'vehicles', '200', NULL, '', '100', ''),
	('ROLL ROYCE MANSORY', 'dawn', 'rollroyce', 'vehicles', '200', NULL, '', '100', ''),
	('SEAT SL', 'seatl', 'seat', 'vehicles', '200', NULL, '', '100', ''),
	('TESLA MODELS', 'teslax', 'tesla', 'vehicles', '200', NULL, '', '100', ''),
	('TOYOTA SUPRA ', 'tsgr20', 'toyota', 'vehicles', '200', NULL, '', '100', ''),
	('TOYOTA CAMRY', 'camry18', 'toyota ', 'vehicles', '200', NULL, '', '100', ''),
	('TOYOTA SUPRA', 'supra2', 'toyota ', 'vehicles', '200', NULL, '', '100', ''),
	('VOLKSWAGEN GTI', 'golfgti', 'volkswagen', 'vehicles', '200', NULL, '', '100', ''),
	('VOLKSWAGEN 4', 'golf4', 'volkswagen', 'vehicles', '200', NULL, '', '100', ''),
	('VOLKSWAGEN MK1', 'mk1rabbit', 'volkswagen', 'vehicles', '200', NULL, '', '100', ''),
	('VOLKSWAGEN SIROCO 81', 'sciroccos81', 'volkswagen', 'vehicles', '200', NULL, '', '100', ''),
	('VOLKSWAGEN 75R', 'golf75r', 'volkswagen', 'vehicles', '200', NULL, '', '100', ''),
	('OPEL ASTRA', 'astraj', 'opel', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 8', 'gtr50', 'vip', 'vehicles', '0', NULL, '', '100', ''),
	('BENTLEY RMOD', 'rmodbentley1', 'bentley', 'vehicles', '200', NULL, '', '100', ''),
	('BENTLEY RMOD2', 'rmodbentleygt', 'bentley', 'vehicles', '200', NULL, '', '100', ''),
	('BMW M8 RMOD', 'rmodbmwm8', 'bmw', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES AMG63', 'rmodc63amg', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('BUGATTI CHIRON', 'rmodchiron300', 'bugatti', 'vehicles', '200', NULL, '', '100', ''),
	('MERCEDES', 'rmode63s', 'mercedes', 'vehicles', '200', NULL, '', '100', ''),
	('JEEP RMOD', 'rmodjeep', 'jeep', 'vehicles', '200', NULL, '', '100', ''),
	('VIP 9', 'rmodm8gte', 'vip', 'vehicles', '200', NULL, '', '100', ''),
	('MARTIN RMOD', 'rmodmartin', 'astonmartin', 'vehicles', '200', NULL, '', '100', ''),
	('MCLAREN SPEED', 'rmodspeed', 'mclaren', 'vehicles', '200', NULL, '', '100', ''),
	('VOLITO2', 'supervolito2', 'helicopteros', 'air', '200', NULL, '', '100', ''),
	('HAVOK', 'havok', 'helicopteros', 'air', '200', NULL, '', '100', ''),
	('CARGBOBO', 'cargobob', 'helicopteros', 'air', '200', NULL, '', '100', '');

-- Dumping structure for table base.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(60) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `doorcondition` varchar(255) DEFAULT NULL,
  `windowcondition` varchar(255) DEFAULT NULL,
  `tyrecondition` varchar(255) DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT 0,
  `impoundTime` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `sharedwith` longtext DEFAULT '[]',
  `vehiclename` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.owned_vehicles: ~13 rows (approximately)
DELETE FROM `owned_vehicles`;
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`, `parking`, `pound`, `doorcondition`, `windowcondition`, `tyrecondition`, `favourite`, `impoundTime`, `location`, `reason`, `sharedwith`, `vehiclename`) VALUES
	('60b15438266ee12985638e2993b1a411a27d7bf6', 'CD82TF', '{"windowTint":-1,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"mainRGB":[255,255,255],"modEngine":-1,"modHood":-1,"modDoorR":-1,"modTransmission":-1,"modOrnaments":-1,"modBrakes":-1,"modTrimA":-1,"modSeats":-1,"modAirFilter":-1,"modDashboard":-1,"bodyHealth":999.5,"windowsBroken":{"3":true,"2":true,"5":true,"4":true,"7":true,"6":false,"1":false,"0":false},"pearlescentColor":120,"modFrontWheels":-1,"secondaryRGB":[255,255,255],"engineHealth":903.9,"fuelLevel":60.3,"modLivery":-1,"modHorns":-1,"interiorColor":0,"modLightbar":-1,"modVanityPlate":-1,"dirtLevel":0.0,"model":-1273288675,"modSpoilers":-1,"modHydrolic":-1,"modXenon":false,"modGrille":-1,"modFrame":-1,"modArmor":-1,"modRoof":-1,"tankHealth":1000.0,"wheels":7,"modSuspension":-1,"modFrontBumper":-1,"doorsBroken":{"3":false,"2":false,"4":false,"1":false,"0":false},"plateIndex":0,"color2":138,"modPlateHolder":-1,"modDoorSpeaker":-1,"modExhaust":-1,"xenonColor":255,"modSteeringWheel":-1,"modRightFender":-1,"modSpeakers":-1,"modStruts":-1,"modTank":-1,"extras":{"1":1,"2":1},"plate":"CD82TF","neonEnabled":[false,false,false,false],"neonColor":[255,0,255],"customPrimaryColor":[255,255,255],"modDial":-1,"modEngineBlock":-1,"modArchCover":-1,"color1":138,"modFender":-1,"modBackWheels":-1,"modTurbo":false,"modSmokeEnabled":1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modTrunk":-1,"modAerials":-1,"dashboardColor":0,"wheelColor":88,"modSideSkirt":-1,"modRearBumper":-1,"modShifterLeavers":-1,"customSecondaryColor":[255,255,255],"modAPlate":-1}', 'car', NULL, 1, 'rancho', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":true,"5":true,"6":false,"7":true,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 0, '', '', '', '[]', NULL),
	('60b15438266ee12985638e2993b1a411a27d7bf6', 'IT62RQ', '{"color1":3,"dashboardColor":0,"tankHealth":1000.0,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"modRightFender":-1,"modTrimA":-1,"extras":{"7":1,"2":1,"1":1},"modEngine":-1,"modArmor":-1,"modLivery":-1,"customPrimaryColor":[255,255,255],"dirtLevel":2.0,"windowTint":-1,"modRoof":-1,"plateIndex":4,"modDoorR":-1,"modSmokeEnabled":false,"plate":"IT62RQ","doorsBroken":{"0":false,"4":false,"3":false,"2":false,"1":false},"modEngineBlock":-1,"modHydrolic":-1,"wheels":0,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modXenon":false,"interiorColor":0,"modSuspension":-1,"modArchCover":-1,"model":-1671539132,"modSeats":-1,"modAPlate":-1,"modTank":-1,"modShifterLeavers":-1,"modStruts":-1,"modDial":-1,"engineHealth":1000.0,"modFrontWheels":-1,"modFrame":-1,"modTrimB":-1,"customSecondaryColor":[255,255,255],"pearlescentColor":5,"fuelLevel":100.0,"modFender":-1,"xenonColor":255,"modHorns":-1,"windowsBroken":{"0":false,"7":false,"6":false,"5":true,"4":true,"3":false,"2":false,"1":false},"color2":1,"modSpeakers":-1,"modTrunk":-1,"bodyHealth":1000.0,"modAerials":-1,"modVanityPlate":-1,"modBrakes":-1,"modRearBumper":-1,"modDashboard":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modAirFilter":-1,"modBackWheels":-1,"modFrontBumper":-1,"modOrnaments":-1,"modTurbo":false,"wheelColor":156,"neonColor":[255,0,255],"modTransmission":-1,"modLightbar":-1,"modHood":-1,"modSpoilers":-1,"modExhaust":-1,"modPlateHolder":-1,"modGrille":-1,"modSideSkirt":-1}', 'car', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, '1684508489', 'LS Impound', NULL, '[]', NULL),
	('60b15438266ee12985638e2993b1a411a27d7bf6', 'IT89CT', '{"color1":88,"dashboardColor":0,"tankHealth":1000.0,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"modRightFender":-1,"modTrimA":-1,"extras":{"7":1,"2":1,"1":1},"modEngine":-1,"modArmor":-1,"modLivery":-1,"customPrimaryColor":[255,255,255],"dirtLevel":6.0,"windowTint":-1,"modRoof":-1,"plateIndex":0,"modDoorR":-1,"modSmokeEnabled":false,"plate":"IT89CT","doorsBroken":{"0":false,"1":false},"modEngineBlock":-1,"modHydrolic":-1,"wheels":0,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modXenon":false,"interiorColor":111,"modSuspension":-1,"modArchCover":-1,"model":-1984275979,"modSeats":-1,"modAPlate":-1,"modTank":-1,"modShifterLeavers":-1,"modStruts":-1,"modDial":-1,"engineHealth":1000.0,"modFrontWheels":-1,"modFrame":-1,"modTrimB":-1,"customSecondaryColor":[255,255,255],"pearlescentColor":88,"fuelLevel":100.0,"modFender":-1,"xenonColor":255,"modHorns":-1,"windowsBroken":{"0":true,"7":true,"6":false,"5":true,"4":true,"3":true,"2":true,"1":true},"color2":5,"modSpeakers":-1,"modTrunk":-1,"bodyHealth":1000.0,"modAerials":-1,"modVanityPlate":-1,"modBrakes":-1,"modRearBumper":-1,"modDashboard":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modAirFilter":-1,"modBackWheels":-1,"modFrontBumper":-1,"modOrnaments":-1,"modTurbo":false,"wheelColor":111,"neonColor":[255,0,255],"modTransmission":-1,"modLightbar":-1,"modHood":-1,"modSpoilers":-1,"modExhaust":-1,"modPlateHolder":-1,"modGrille":-1,"modSideSkirt":-1}', 'car', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, '1684508489', 'LS Impound', NULL, '[]', NULL),
	('7fd41199089be211da9c71096825616aa8a35e69', 'JL64ZT', '{"modHood":-1,"modAPlate":-1,"modHorns":-1,"customPrimaryColor":[255,150,0],"modAerials":-1,"modDoorR":-1,"tankHealth":1000.0,"modDial":-1,"modRightFender":-1,"modFrontBumper":-1,"modOrnaments":-1,"modFrontWheels":-1,"customSecondaryColor":[255,150,0],"modVanityPlate":-1,"wheelColor":156,"modRearBumper":-1,"modSteeringWheel":-1,"modBackWheels":-1,"model":242156012,"modTrimB":-1,"modSideSkirt":-1,"modDashboard":-1,"modLivery":-1,"engineHealth":1000.0,"dirtLevel":0.4,"modStruts":-1,"modSuspension":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":1,"modArmor":-1,"windowsBroken":{"3":false,"2":false,"1":false,"0":false,"7":false,"6":false,"5":true,"4":true},"modRoof":-1,"modTransmission":-1,"modSeats":-1,"modSpeakers":-1,"modExhaust":-1,"mainRGB":[255,150,0],"secondaryRGB":[255,150,0],"neonColor":[255,0,255],"modLightbar":-1,"modShifterLeavers":-1,"modXenon":false,"modFrame":-1,"tyreSmokeColor":[255,255,255],"wheels":7,"modEngineBlock":-1,"tyreBurst":{"1":false,"4":false,"5":false,"0":false},"color1":64,"modTurbo":false,"modBrakes":-1,"extras":{"1":false},"pearlescentColor":87,"modFender":-1,"modHydrolic":-1,"interiorColor":0,"dashboardColor":0,"doorsBroken":{"3":false,"2":false,"1":false,"0":false,"4":false},"modArchCover":-1,"modTank":-1,"fuelLevel":63.3,"windowTint":-1,"xenonColor":255,"modDoorSpeaker":-1,"modPlateHolder":-1,"modEngine":-1,"modAirFilter":-1,"modSpoilers":-1,"modTrunk":-1,"modGrille":-1,"bodyHealth":1000.0,"modTrimA":-1,"plateIndex":0,"plate":"JL64ZT","color2":64}', 'car', NULL, 1, 'legion', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":true,"5":true,"6":false,"7":false,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 0, '', '', '', '[]', NULL),
	('60b15438266ee12985638e2993b1a411a27d7bf6', 'JO14SH', '{"plateIndex":0,"modBrakes":-1,"modRightFender":-1,"customPrimaryColor":[76,0,255],"modDial":-1,"modLightbar":-1,"modHorns":-1,"modArchCover":-1,"modRoof":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"modShifterLeavers":-1,"secondaryRGB":[76,0,255],"tankHealth":1000.0,"modTank":-1,"modHood":-1,"engineHealth":1000.0,"bodyHealth":1000.0,"interiorColor":0,"modTrimA":-1,"fuelLevel":80.0,"modFender":-1,"color2":0,"modFrame":-1,"modOrnaments":-1,"xenonColor":255,"tyreSmokeColor":[255,255,255],"modDoorR":-1,"windowsBroken":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"pearlescentColor":0,"modBackWheels":-1,"neonColor":[255,0,255],"modHydrolic":-1,"modTurbo":false,"modSteeringWheel":-1,"modRearBumper":-1,"windowTint":-1,"model":571788523,"modSmokeEnabled":1,"dirtLevel":0.0,"plate":"JO14SH","modGrille":-1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"modXenon":false,"wheelColor":4,"modDashboard":-1,"modTrimB":-1,"modSuspension":-1,"modPlateHolder":-1,"modAirFilter":-1,"modLivery":-1,"modStruts":-1,"extras":[],"modSideSkirt":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modVanityPlate":-1,"modFrontBumper":-1,"modSeats":-1,"mainRGB":[76,0,255],"modSpoilers":-1,"wheels":3,"modExhaust":-1,"doorsBroken":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"0":false},"dashboardColor":27,"modArmor":-1,"customSecondaryColor":[76,0,255],"modAPlate":-1,"color1":12,"modAerials":-1,"modSpeakers":-1,"modEngine":-1,"modTransmission":-1,"modFrontWheels":-1}', 'car', NULL, 1, 'legion', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 0, '', '', '', '[]', NULL),
	('6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', 'RK14BA', '{"modFrame":-1,"modShifterLeavers":-1,"modRightFender":-1,"modSideSkirt":-1,"modAerials":-1,"modLightbar":-1,"modSteeringWheel":-1,"modRearBumper":-1,"doorsBroken":{"6":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"interiorColor":0,"modStruts":-1,"color2":2,"modTrunk":-1,"modArmor":-1,"pearlescentColor":7,"modLivery":-1,"modSeats":-1,"modSpoilers":-1,"tyreSmokeColor":[255,255,255],"customSecondaryColor":[255,255,255],"modXenon":false,"modSpeakers":-1,"modTrimB":-1,"modDashboard":-1,"modFrontWheels":-1,"modAPlate":-1,"modFender":-1,"wheelColor":156,"modVanityPlate":-1,"modArchCover":-1,"modRoof":-1,"color1":2,"wheels":7,"modTank":-1,"modDoorSpeaker":-1,"modExhaust":-1,"secondaryRGB":[255,255,255],"dashboardColor":0,"neonEnabled":[false,false,false,false],"model":1813965170,"modTrimA":-1,"modHorns":-1,"neonColor":[0,0,0],"modOrnaments":-1,"modEngineBlock":-1,"tankHealth":1000.0,"fuelLevel":64.9,"modTurbo":false,"modDial":-1,"plate":"RK14BA","tyreBurst":{"0":false,"1":false,"4":false,"5":false},"modPlateHolder":-1,"mainRGB":[255,255,255],"plateIndex":0,"modAirFilter":-1,"windowsBroken":{"6":false,"7":false,"4":true,"5":true,"2":false,"3":false,"0":false,"1":false},"modBackWheels":-1,"modSuspension":-1,"modHood":-1,"engineHealth":1000.0,"bodyHealth":1000.0,"customPrimaryColor":[255,255,255],"modBrakes":-1,"extras":[],"windowTint":-1,"modTransmission":-1,"modFrontBumper":-1,"modGrille":-1,"modDoorR":-1,"modSmokeEnabled":1,"modHydrolic":-1,"dirtLevel":0.0,"xenonColor":255,"modEngine":-1}', 'car', NULL, 1, 'legion', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":true,"5":true,"6":false,"7":false,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 1, '', '', '', '[]', NULL),
	('391a38f06c95f8e488ff79e788562896d8ce5cb7', 'SN87DS', '{"modDashboard":-1,"modTrimB":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"customSecondaryColor":[255,255,255],"modVanityPlate":-1,"modGrille":-1,"fuelLevel":65.0,"modStruts":-1,"modLightbar":-1,"modBrakes":-1,"tyreSmokeColor":[255,255,255],"xenonColor":255,"modDoorSpeaker":-1,"dirtLevel":7.0,"modFender":-1,"modAirFilter":-1,"modEngineBlock":-1,"bodyHealth":1000.0,"modPlateHolder":-1,"modDoorR":-1,"windowTint":-1,"modSmokeEnabled":false,"modSuspension":-1,"modSideSkirt":-1,"extras":{"1":false},"interiorColor":1,"modHorns":-1,"customPrimaryColor":[255,255,255],"modRightFender":-1,"modSteeringWheel":-1,"dashboardColor":27,"modExhaust":-1,"plateIndex":0,"modSpeakers":-1,"modRoof":-1,"windowsBroken":{"0":false,"1":false,"6":false,"7":false,"4":false,"5":false,"2":false,"3":false},"modTransmission":-1,"model":1311755301,"modTurbo":false,"modShifterLeavers":-1,"modTrunk":-1,"modSeats":-1,"modHood":-1,"engineHealth":1000.0,"plate":"SN87DS","modDial":-1,"modFrontBumper":-1,"modFrame":-1,"modTrimA":-1,"color1":52,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"modAerials":-1,"modBackWheels":-1,"modArmor":-1,"modArchCover":-1,"neonColor":[255,0,255],"modEngine":-1,"wheelColor":156,"color2":53,"wheels":0,"tankHealth":1000.0,"pearlescentColor":52,"modSpoilers":-1,"modTank":-1,"modFrontWheels":-1,"modAPlate":-1,"modXenon":false,"modLivery":0,"modOrnaments":-1,"doorsBroken":{"0":false,"1":false,"6":false,"4":false,"5":false,"2":false,"3":false},"modRearBumper":-1}', 'car', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, '1683938373', 'LS Impound', NULL, '[]', NULL),
	('60b15438266ee12985638e2993b1a411a27d7bf6', 'SY42FQ', '{"windowTint":-1,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"mainRGB":[255,255,255],"modEngine":-1,"modHood":-1,"modDoorR":-1,"modTransmission":-1,"modOrnaments":-1,"modBrakes":-1,"modTrimA":-1,"modSeats":-1,"modAirFilter":-1,"modDashboard":-1,"bodyHealth":1000.0,"windowsBroken":{"3":true,"2":true,"5":true,"4":true,"7":false,"6":false,"1":false,"0":false},"pearlescentColor":2,"modFrontWheels":-1,"secondaryRGB":[255,255,255],"engineHealth":1000.0,"fuelLevel":41.4,"modLivery":1,"modHorns":-1,"interiorColor":0,"modLightbar":-1,"modVanityPlate":-1,"dirtLevel":0.0,"model":1191498149,"modSpoilers":-1,"modHydrolic":-1,"modXenon":false,"modGrille":-1,"modFrame":-1,"modArmor":-1,"modRoof":-1,"tankHealth":1000.0,"wheels":7,"modSuspension":-1,"modFrontBumper":-1,"doorsBroken":{"3":false,"2":false,"1":false,"0":false},"plateIndex":0,"color2":36,"modPlateHolder":-1,"modDoorSpeaker":-1,"modExhaust":-1,"xenonColor":255,"modSteeringWheel":-1,"modRightFender":-1,"modSpeakers":-1,"modStruts":-1,"modTank":-1,"extras":{"1":false,"2":1},"plate":"SY42FQ","neonEnabled":[false,false,false,false],"neonColor":[255,0,255],"customPrimaryColor":[255,255,255],"modDial":-1,"modEngineBlock":-1,"modArchCover":-1,"color1":2,"modFender":-1,"modBackWheels":-1,"modTurbo":false,"modSmokeEnabled":1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modTrunk":-1,"modAerials":-1,"dashboardColor":0,"wheelColor":156,"modSideSkirt":-1,"modRearBumper":-1,"modShifterLeavers":-1,"customSecondaryColor":[255,255,255],"modAPlate":-1}', 'car', NULL, 1, 'rancho', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":true,"5":true,"6":false,"7":false,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 0, '', '', '', '[]', NULL),
	('391a38f06c95f8e488ff79e788562896d8ce5cb7', 'VG37IM', '{"dashboardColor":0,"modSpeakers":-1,"modLightbar":-1,"tyreSmokeColor":[255,255,255],"dirtLevel":7.0,"modSmokeEnabled":false,"modTurbo":false,"modSpoilers":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":false,"2":false,"5":true,"4":true},"modEngineBlock":-1,"modFrontWheels":-1,"windowTint":-1,"modDoorSpeaker":-1,"modRearBumper":-1,"modPlateHolder":-1,"modHydrolic":-1,"modTrimB":-1,"modHood":-1,"modRightFender":-1,"modTransmission":-1,"modBackWheels":-1,"modLivery":0,"color2":63,"modFrontBumper":-1,"modVanityPlate":-1,"modTrimA":-1,"modSteeringWheel":-1,"pearlescentColor":5,"wheels":7,"modArchCover":-1,"bodyHealth":1000.0,"modDial":-1,"modGrille":-1,"modFender":-1,"modEngine":-1,"tankHealth":1000.0,"plateIndex":0,"modExhaust":-1,"modHorns":-1,"modShifterLeavers":-1,"modDoorR":-1,"extras":{"1":1},"modAirFilter":-1,"modDashboard":-1,"neonColor":[255,0,255],"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modArmor":-1,"modXenon":false,"modBrakes":-1,"modTank":-1,"modTrunk":-1,"modSeats":-1,"modOrnaments":-1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"modSideSkirt":-1,"wheelColor":156,"modRoof":-1,"engineHealth":1000.0,"fuelLevel":65.0,"modStruts":-1,"color1":63,"modAerials":-1,"customPrimaryColor":[255,255,255],"customSecondaryColor":[255,255,255],"xenonColor":255,"modFrame":-1,"neonEnabled":[false,false,false,false],"modSuspension":-1,"model":-1935322924,"modAPlate":-1,"plate":"VG37IM","interiorColor":0}', 'car', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, '1683844766', 'LS Impound', NULL, '[]', NULL),
	('7fd41199089be211da9c71096825616aa8a35e69', 'WI27ZQ', '{"modFrame":-1,"modShifterLeavers":-1,"modRightFender":-1,"modOrnaments":-1,"modFrontBumper":-1,"modLightbar":-1,"modEngineBlock":-1,"modPlateHolder":-1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false},"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"modStruts":-1,"modSmokeEnabled":1,"windowsBroken":{"6":false,"7":false,"4":true,"5":true,"2":true,"3":true,"0":false,"1":false},"modArmor":-1,"pearlescentColor":2,"modLivery":0,"modSeats":-1,"modSpoilers":-1,"tyreSmokeColor":[255,255,255],"customSecondaryColor":[255,255,255],"modXenon":false,"modSpeakers":-1,"mainRGB":[255,255,255],"modDashboard":-1,"modFrontWheels":-1,"modAPlate":-1,"modFender":-1,"wheelColor":156,"modVanityPlate":-1,"modArchCover":-1,"modRoof":-1,"modSuspension":-1,"wheels":7,"modTank":-1,"modDoorSpeaker":-1,"modExhaust":-1,"modHydrolic":-1,"dashboardColor":0,"windowTint":-1,"model":1191498149,"modTrimA":-1,"color2":36,"neonColor":[0,0,0],"neonEnabled":[false,false,false,false],"modAirFilter":-1,"customPrimaryColor":[255,255,255],"modTurbo":false,"plate":"WI27ZQ","modDial":-1,"modDoorR":-1,"color1":2,"modRearBumper":-1,"modSteeringWheel":-1,"plateIndex":0,"modTrimB":-1,"fuelLevel":64.9,"modBackWheels":-1,"bodyHealth":1000.0,"modBrakes":-1,"engineHealth":1000.0,"modAerials":-1,"modSideSkirt":-1,"tankHealth":1000.0,"extras":{"2":false,"1":false},"interiorColor":0,"modTransmission":-1,"secondaryRGB":[255,255,255],"modGrille":-1,"modHood":-1,"modTrunk":-1,"modHorns":-1,"dirtLevel":0.0,"xenonColor":255,"modEngine":-1}', 'car', NULL, 2, 'legion', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":true,"5":true,"6":false,"7":false,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 0, '1684099840', 'LS Impound', '', '[]', NULL),
	('60b15438266ee12985638e2993b1a411a27d7bf6', 'XR22NB', '{"plateIndex":0,"modBrakes":-1,"modRightFender":-1,"customPrimaryColor":[255,0,0],"modDial":-1,"modLightbar":-1,"modHorns":-1,"modArchCover":-1,"modRoof":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"modShifterLeavers":-1,"secondaryRGB":[255,0,0],"tankHealth":1000.0,"modTank":-1,"modHood":-1,"engineHealth":1000.0,"bodyHealth":1000.0,"interiorColor":0,"modTrimA":-1,"fuelLevel":74.8,"modFender":-1,"color2":36,"modFrame":-1,"modOrnaments":-1,"xenonColor":255,"tyreSmokeColor":[255,255,255],"modDoorR":-1,"windowsBroken":{"1":false,"2":true,"3":true,"4":true,"5":true,"6":false,"7":false,"0":false},"pearlescentColor":88,"modBackWheels":-1,"neonColor":[255,0,255],"modHydrolic":-1,"modTurbo":false,"modSteeringWheel":-1,"modRearBumper":-1,"windowTint":-1,"model":-189438188,"modSmokeEnabled":1,"dirtLevel":0.0,"plate":"XR22NB","modGrille":-1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"modXenon":false,"wheelColor":12,"modDashboard":-1,"modTrimB":-1,"modSuspension":-1,"modPlateHolder":-1,"modAirFilter":-1,"modLivery":-1,"modStruts":-1,"extras":[],"modSideSkirt":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modVanityPlate":-1,"modFrontBumper":-1,"modSeats":-1,"mainRGB":[255,0,0],"modSpoilers":-1,"wheels":7,"modExhaust":-1,"doorsBroken":{"1":false,"2":false,"3":false,"0":false},"dashboardColor":0,"modArmor":-1,"customSecondaryColor":[255,0,0],"modAPlate":-1,"color1":36,"modAerials":-1,"modSpeakers":-1,"modEngine":-1,"modTransmission":-1,"modFrontWheels":-1}', 'car', NULL, 1, 'sandyshoresmc', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":true,"5":true,"6":false,"7":false,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 0, '', '', '', '[]', NULL),
	('60b15438266ee12985638e2993b1a411a27d7bf6', 'YI71RF', '{"windowTint":-1,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"mainRGB":[255,255,255],"modEngine":-1,"modHood":-1,"modDoorR":-1,"modTransmission":-1,"modOrnaments":-1,"modBrakes":-1,"modTrimA":-1,"modSeats":-1,"modAirFilter":-1,"modDashboard":-1,"bodyHealth":1000.0,"windowsBroken":{"3":true,"2":true,"5":true,"4":true,"7":true,"6":true,"1":true,"0":true},"pearlescentColor":1,"modFrontWheels":-1,"secondaryRGB":[255,255,255],"engineHealth":1000.0,"fuelLevel":65.0,"modLivery":-1,"modHorns":-1,"interiorColor":0,"modLightbar":-1,"modVanityPlate":-1,"dirtLevel":0.0,"model":1565234284,"modSpoilers":-1,"modHydrolic":-1,"modXenon":false,"modGrille":-1,"modFrame":-1,"modArmor":-1,"modRoof":-1,"tankHealth":1000.0,"wheels":0,"modSuspension":-1,"modFrontBumper":-1,"doorsBroken":{"2":false,"1":false,"0":false},"plateIndex":4,"color2":135,"modPlateHolder":-1,"modDoorSpeaker":-1,"modExhaust":-1,"xenonColor":255,"modSteeringWheel":-1,"modRightFender":-1,"modSpeakers":-1,"modStruts":-1,"modTank":-1,"extras":{"3":1,"2":1,"1":1},"plate":"YI71RF","neonEnabled":[false,false,false,false],"neonColor":[255,0,255],"customPrimaryColor":[255,255,255],"modDial":-1,"modEngineBlock":-1,"modArchCover":-1,"color1":1,"modFender":-1,"modBackWheels":-1,"modTurbo":false,"modSmokeEnabled":false,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modTrunk":-1,"modAerials":-1,"dashboardColor":0,"wheelColor":0,"modSideSkirt":-1,"modRearBumper":-1,"modShifterLeavers":-1,"customSecondaryColor":[255,255,255],"modAPlate":-1}', 'car', NULL, 1, 'legion', NULL, '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true,"0":true}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}', 0, NULL, NULL, NULL, '[]', NULL),
	('391a38f06c95f8e488ff79e788562896d8ce5cb7', 'ZH87IT', '{"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"windowTint":-1,"modOrnaments":-1,"plateIndex":3,"model":1813965170,"modBrakes":-1,"engineHealth":1000.0,"modTrimB":-1,"modAerials":-1,"neonEnabled":[false,false,false,false],"windowsBroken":{"4":true,"3":false,"6":false,"5":true,"0":false,"7":false,"2":false,"1":false},"modVanityPlate":-1,"modSuspension":-1,"color1":3,"modPlateHolder":-1,"customSecondaryColor":[255,255,255],"tyreSmokeColor":[255,255,255],"modEngine":-1,"modAPlate":-1,"modSeats":-1,"modHydrolic":-1,"modSpeakers":-1,"dirtLevel":4.0,"modSmokeEnabled":false,"modTrunk":-1,"modLivery":-1,"modArmor":-1,"neonColor":[255,0,255],"modLightbar":-1,"customPrimaryColor":[255,255,255],"modFrame":-1,"wheels":7,"wheelColor":156,"interiorColor":0,"modRearBumper":-1,"modStruts":-1,"modBackWheels":-1,"modDashboard":-1,"modAirFilter":-1,"modFender":-1,"modHorns":-1,"modDoorSpeaker":-1,"pearlescentColor":23,"extras":[],"modDoorR":-1,"color2":3,"modDial":-1,"dashboardColor":0,"modSideSkirt":-1,"modSteeringWheel":-1,"modHood":-1,"modArchCover":-1,"modGrille":-1,"bodyHealth":1000.0,"modTank":-1,"modRoof":-1,"modTrimA":-1,"modRightFender":-1,"tankHealth":1000.0,"modSpoilers":-1,"modShifterLeavers":-1,"doorsBroken":{"4":false,"3":false,"6":false,"5":false,"0":false,"2":false,"1":false},"modFrontBumper":-1,"xenonColor":255,"modTurbo":false,"plate":"ZH87IT","modTransmission":-1,"modXenon":false,"fuelLevel":65.0,"modFrontWheels":-1,"modEngineBlock":-1,"modExhaust":-1}', 'car', NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, '1683845361', 'LS Impound', '', '[]', NULL);

-- Dumping structure for table base.pedmanager
CREATE TABLE IF NOT EXISTS `pedmanager` (
  `identifier` varchar(100) NOT NULL,
  `peds` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.pedmanager: ~18 rows (approximately)
DELETE FROM `pedmanager`;
INSERT INTO `pedmanager` (`identifier`, `peds`) VALUES
	('6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{}'),
	('391a38f06c95f8e488ff79e788562896d8ce5cb7', '{}'),
	('9d013dc670d84c861761f7b07a38056ca62f2c04', '{}'),
	('bd713ca9147f0b49e3eb9ab2790498274296ee0a', '{}'),
	('89b3d3c771632455ac9afded546881905fd03dcd', '{}'),
	('bc2e7d866706f7d795a7c8fa272acaa9c4392924', '{}'),
	('60b15438266ee12985638e2993b1a411a27d7bf6', '{}'),
	('f0e25920e358e159aca570be43551355cd3abe01', '{}'),
	('fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '{}'),
	('29f9bf803077d2cd85b04f13265436df61aeab0e', '{}'),
	('aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	('aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{}'),
	('267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	('267657e2ebf25e299aa963f279935a4af9d06e48', '{}'),
	('7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	('7fd41199089be211da9c71096825616aa8a35e69', '{}'),
	('9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	('9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{}'),
	('6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}'),
	('6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{}');

-- Dumping structure for table base.phone_accounts
CREATE TABLE IF NOT EXISTS `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.phone_accounts: ~0 rows (approximately)
DELETE FROM `phone_accounts`;

-- Dumping structure for table base.phone_alertjobs
CREATE TABLE IF NOT EXISTS `phone_alertjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `alerts` longtext DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.phone_alertjobs: ~0 rows (approximately)
DELETE FROM `phone_alertjobs`;

-- Dumping structure for table base.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(50) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT NULL,
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_masked` tinyint(1) DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.phone_chatrooms: ~3 rows (approximately)
DELETE FROM `phone_chatrooms`;
INSERT INTO `phone_chatrooms` (`id`, `room_code`, `room_name`, `room_owner_id`, `room_owner_name`, `room_members`, `room_pin`, `unpaid_balance`, `is_masked`, `is_pinned`, `created`) VALUES
	(1, 'social', 'Social', 'official', 'Government', NULL, NULL, 0.00, 0, 1, '2023-04-05 16:18:26'),
	(2, 'lounge', 'The Lounge', 'official', 'Government', NULL, NULL, 0.00, 0, 1, '2023-04-05 16:18:26'),
	(3, 'events', 'Events', 'official', 'Government', NULL, NULL, 0.00, 0, 1, '2023-04-05 16:18:26');

-- Dumping structure for table base.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.phone_chatroom_messages: ~0 rows (approximately)
DELETE FROM `phone_chatroom_messages`;

-- Dumping structure for table base.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.phone_chats: ~0 rows (approximately)
DELETE FROM `phone_chats`;

-- Dumping structure for table base.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.phone_invoices: ~0 rows (approximately)
DELETE FROM `phone_invoices`;

-- Dumping structure for table base.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `messages` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.phone_messages: ~0 rows (approximately)
DELETE FROM `phone_messages`;

-- Dumping structure for table base.phone_news
CREATE TABLE IF NOT EXISTS `phone_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.phone_news: ~0 rows (approximately)
DELETE FROM `phone_news`;

-- Dumping structure for table base.phone_notifies
CREATE TABLE IF NOT EXISTS `phone_notifies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.phone_notifies: ~0 rows (approximately)
DELETE FROM `phone_notifies`;

-- Dumping structure for table base.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL,
  `isBlocked` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.player_contacts: ~0 rows (approximately)
DELETE FROM `player_contacts`;
INSERT INTO `player_contacts` (`id`, `identifier`, `name`, `number`, `iban`, `display`, `note`, `pp`, `isBlocked`) VALUES
	(38, '553227466', 'Tiago Lima', '553730653', '0', NULL, '', '', NULL);

-- Dumping structure for table base.player_gallery
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.player_gallery: ~0 rows (approximately)
DELETE FROM `player_gallery`;

-- Dumping structure for table base.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.player_mails: ~0 rows (approximately)
DELETE FROM `player_mails`;

-- Dumping structure for table base.player_notes
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.player_notes: ~0 rows (approximately)
DELETE FROM `player_notes`;

-- Dumping structure for table base.playlists
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.playlists: ~5 rows (approximately)
DELETE FROM `playlists`;
INSERT INTO `playlists` (`id`, `label`) VALUES
	(50, '80s'),
	(51, '90s'),
	(53, 'Metal'),
	(54, 'Random music'),
	(55, 'example');

-- Dumping structure for table base.playlist_songs
CREATE TABLE IF NOT EXISTS `playlist_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist` int(11) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.playlist_songs: ~6 rows (approximately)
DELETE FROM `playlist_songs`;
INSERT INTO `playlist_songs` (`id`, `playlist`, `link`) VALUES
	(26, 0, 'https://www.youtube.com/watch?v=EYAjqqWuBxg'),
	(28, 0, 'https://www.youtube.com/watch?v=yXeJ8ZRActM'),
	(29, 54, 'https://www.youtube.com/watch?v=yXeJ8ZRActM'),
	(30, 54, 'https://www.youtube.com/watch?v=CYgDUBH2Zro'),
	(32, 50, 'https://www.youtube.com/watch?v=CYgDUBH2Zro'),
	(33, 54, 'https://www.youtube.com/watch?v=L3wKzyIN1yk');

-- Dumping structure for table base.props_spawn
CREATE TABLE IF NOT EXISTS `props_spawn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prop` varchar(200) DEFAULT NULL,
  `pos_x` varchar(10) DEFAULT NULL,
  `pos_y` varchar(10) DEFAULT NULL,
  `pos_z` varchar(10) DEFAULT NULL,
  `heading` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `folder` varchar(50) DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.props_spawn: ~112 rows (approximately)
DELETE FROM `props_spawn`;
INSERT INTO `props_spawn` (`id`, `prop`, `pos_x`, `pos_y`, `pos_z`, `heading`, `status`, `folder`) VALUES
	(1, 'lts_prop_lts_elecbox_24', '5122.90', '-4647.80', '-2.80', '-15.80', 1, 'none'),
	(2, 'lts_prop_lts_elecbox_24', '5120.30', '-4657.00', '-2.80', '-15.50', 1, 'none'),
	(3, 'prop_fnccorgm_03a', '5121.60', '-4645.00', '0.40', '74.20', 1, 'none'),
	(4, 'prop_fnccorgm_03a', '5120.40', '-4649.00', '0.40', '75.10', 1, 'none'),
	(7, 'prop_fnccorgm_02d', '5122.10', '-4654.20', '0.20', '253.70', 1, 'none'),
	(13, 'prop_devin_box_01', '-365.80', '4863.10', '209.10', '336.70', 1, 'BASE DOS CV'),
	(14, 'prop_cs_rub_box_01', '-362.10', '4857.50', '209.10', '155.86', 1, 'none'),
	(37, 'hei_prop_hei_cash_trolly_02', '2360.60', '3120.80', '47.70', '259.30', 1, 'none'),
	(38, 'hei_prop_hei_cash_trolly_02', '2360.40', '3119.80', '47.70', '259.30', 1, 'none'),
	(39, 'hei_prop_hei_cash_trolly_02', '2360.20', '3118.80', '47.70', '259.30', 1, 'none'),
	(40, 'prop_washer_01', '2359.20', '3118.50', '47.20', '168.50', 1, 'none'),
	(41, 'prop_washer_01', '2358.20', '3118.70', '47.20', '169.40', 1, 'none'),
	(42, 'prop_fnccorgm_04c', '5119.00', '-4653.80', '0.20', '74.70', 1, 'none'),
	(43, 'prop_fnccorgm_04c', '5118.40', '-4656.20', '0.20', '74.70', 1, 'none'),
	(44, 'prop_conc_sacks_02a', '5119.70', '-4657.80', '0.10', '165.20', 1, 'none'),
	(45, 'prop_conc_sacks_02a', '5119.70', '-4657.80', '1.00', '165.20', 1, 'none'),
	(46, 'prop_portaloo_01a', '5119.10', '-4656.50', '0.20', '164.50', 1, 'none'),
	(47, 'p_pallet_02a_s', '5119.30', '-4660.10', '0.20', '345.80', 1, 'none'),
	(48, 'p_pallet_02a_s', '5119.30', '-4660.10', '0.40', '345.80', 1, 'none'),
	(49, 'p_pallet_02a_s', '5119.30', '-4660.10', '0.60', '345.80', 1, 'none'),
	(50, 'p_pallet_02a_s', '5119.30', '-4660.10', '0.80', '345.80', 1, 'none'),
	(51, 'p_pallet_02a_s', '5119.30', '-4660.10', '1.00', '345.80', 1, 'none'),
	(52, 'p_pallet_02a_s', '5119.30', '-4660.10', '1.00', '345.80', 1, 'none'),
	(53, 'p_pallet_02a_s', '5119.30', '-4660.10', '1.20', '345.80', 1, 'none'),
	(54, 'p_pallet_02a_s', '5119.30', '-4660.10', '1.40', '345.80', 1, 'none'),
	(56, 'prop_barrier_work01a', '5118.10', '-4658.57', '-0.10', '81.56', 1, 'none'),
	(59, 'prop_helipad_02', '5179.90', '-4694.30', '1.20', '161.90', 1, 'none'),
	(61, 'prop_plant_group_05b', '5116.50', '-4658.00', '-0.50', '261.00', 1, 'none'),
	(63, 'prop_plant_group_05b', '5118.20', '-4653.30', '-0.20', '261.00', 1, 'none'),
	(64, 'prop_plant_group_02', '5118.20', '-4653.30', '-2.60', '261.00', 1, 'none'),
	(65, 'prop_plant_group_05b', '5119.10', '-4649.70', '-1.10', '261.00', 1, 'none'),
	(69, 'prop_bush_ivy_02_pot', '5119.70', '-4651.50', '-1.00', '250.14', 1, 'none'),
	(73, 'prop_bush_ivy_01_r', '5120.40', '-4648.02', '1.00', '259.90', 1, 'none'),
	(74, 'prop_bush_ivy_01_r', '5120.80', '-4646.90', '1.00', '256.90', 1, 'none'),
	(75, 'prop_bush_ivy_01_r', '5121.10', '-4645.20', '1.00', '254.90', 1, 'none'),
	(76, 'prop_plant_group_05b', '5119.60', '-4646.60', '-0.60', '243.89', 1, 'none'),
	(77, 'prop_plant_group_05b', '5119.60', '-4644.60', '-1.20', '243.89', 1, 'none'),
	(78, 'prop_bush_med_03_cr', '5117.10', '-4661.70', '-1.40', '211.51', 1, 'none'),
	(79, 'prop_bush_med_03_cr', '5118.40', '-4662.10', '-1.40', '211.51', 1, 'none'),
	(80, 'prop_bush_med_03_cr', '5119.30', '-4662.10', '-1.20', '211.51', 1, 'none'),
	(81, 'prop_bush_med_02', '5115.80', '-4665.20', '-0.20', '321.70', 1, ''),
	(82, 'prop_bush_med_02', '5116.80', '-4665.00', '-0.30', '321.70', 1, ''),
	(83, 'prop_bush_med_02', '5117.60', '-4665.20', '-0.30', '321.70', 1, ''),
	(84, 'prop_plant_group_04', '5125.10', '-4646.70', '-2.20', '255.10', 1, 'none'),
	(85, 'prop_plant_group_04', '5124.30', '-4654.70', '-2.37', '59.90', 1, 'none'),
	(86, 'prop_bush_ivy_01_r', '5124.10', '-4648.03', '1.20', '71.58', 1, 'none'),
	(87, 'prop_bush_ivy_01_r', '5124.40', '-4646.90', '1.00', '71.58', 1, 'none'),
	(88, 'prop_bush_ivy_01_r', '5124.90', '-4644.90', '1.00', '71.58', 1, 'none'),
	(89, 'prop_plant_group_04_cr', '5122.50', '-4636.70', '-2.30', '270.00', 1, 'none'),
	(90, 'prop_plant_group_04_cr', '5124.00', '-4638.60', '-2.40', '61.20', 1, 'none'),
	(91, 'prop_plant_group_04_cr', '5122.80', '-4641.10', '-2.40', '61.20', 1, 'none'),
	(92, 'prop_plant_group_04_cr', '5127.40', '-4637.40', '-2.33', '270.00', 1, 'none'),
	(93, 'prop_plant_group_04_cr', '5125.90', '-4641.20', '-2.50', '270.00', 1, 'none'),
	(94, 'prop_plant_group_04_cr', '5124.70', '-4644.20', '-2.50', '270.00', 1, 'none'),
	(95, 'prop_plant_group_04_cr', '5125.40', '-4650.10', '-2.44', '75.58', 1, 'none'),
	(96, 'prop_tree_log_02', '5114.26', '-4658.55', '-1.34', '279.45', 1, 'none'),
	(97, 'prop_tree_log_02', '5128.84', '-4655.64', '-2.41', '15.55', 1, 'none'),
	(99, 'prop_drop_crate_01', '5122.40', '-4651.20', '0.20', '73.20', 1, 'none'),
	(101, 'prop_crate_02a', '5122.10', '-4651.90', '0.40', '252.20', 1, 'none'),
	(102, 'prop_bucket_01a', '5119.94', '-4657.02', '0.18', '41.10', 1, 'none'),
	(105, 'prop_pallet_pile_04', '5121.50', '-4646.64', '1.10', '79.00', 1, 'none'),
	(107, 'prop_bush_ivy_01_1m', '5118.30', '-4655.80', '1.20', '254.60', 1, 'none'),
	(108, 'prop_bush_ivy_01_1m', '5121.40', '-4657.10', '1.20', '73.90', 1, 'none'),
	(109, 'prop_bush_ivy_02_2m', '5122.70', '-4652.40', '1.20', '76.10', 1, 'none'),
	(110, 'prop_plant_group_04_cr', '5123.00', '-4659.00', '-1.90', '66.20', 1, 'none'),
	(111, 'prop_plant_group_04_cr', '5118.90', '-4648.30', '-2.70', '90.00', 1, 'none'),
	(112, 'prop_bush_med_05', '5118.12', '-4663.70', '-1.22', '20.00', 1, 'none'),
	(113, 'prop_bush_med_05', '5113.98', '-4655.69', '-1.95', '351.33', 1, 'none'),
	(114, 'prop_bush_med_05', '5113.98', '-4656.90', '-1.95', '351.33', 1, 'none'),
	(115, 'prop_bush_med_05', '5112.90', '-4657.20', '-1.95', '351.33', 1, 'none'),
	(116, 'prop_bush_med_05', '5117.45', '-4652.71', '-2.55', '271.81', 1, 'none'),
	(117, 'prop_bush_med_05', '5117.05', '-4645.38', '-2.60', '269.18', 1, 'none'),
	(118, 'prop_bush_med_05', '5116.04', '-4651.73', '-2.66', '247.31', 1, 'none'),
	(120, 'prop_bush_med_05', '5131.32', '-4654.40', '-2.54', '147.28', 1, 'none'),
	(121, 'prop_bush_med_05', '5126.40', '-4648.70', '-2.44', '62.51', 1, 'none'),
	(122, 'prop_bush_med_05', '5127.49', '-4647.13', '-2.44', '91.92', 1, 'none'),
	(123, 'prop_bush_med_05', '5126.70', '-4652.19', '-2.56', '94.09', 1, 'none'),
	(124, 'prop_bush_med_05', '5126.99', '-4656.49', '-2.60', '70.35', 1, 'none'),
	(125, 'prop_bush_med_05', '5126.82', '-4647.69', '-2.44', '59.40', 1, 'none'),
	(126, 'prop_bush_med_05', '5132.58', '-4655.90', '-2.45', '56.96', 1, 'none'),
	(127, 'prop_bush_med_05', '5119.60', '-4663.32', '-1.15', '91.69', 1, 'none'),
	(128, 'prop_bush_med_05', '5121.23', '-4664.65', '-1.09', '95.35', 1, 'none'),
	(129, 'prop_bush_med_05', '5120.25', '-4663.73', '-1.05', '117.08', 1, 'none'),
	(130, 'prop_bush_med_05', '5122.28', '-4662.74', '-1.47', '84.13', 1, 'none'),
	(131, 'prop_bush_med_05', '5120.78', '-4663.32', '-1.18', '101.61', 1, 'none'),
	(132, 'prop_bush_med_05', '5127.63', '-4648.26', '-2.44', '61.67', 1, 'none'),
	(133, 'prop_bush_med_05', '5133.88', '-4650.41', '-2.55', '71.12', 1, 'none'),
	(134, 'prop_bush_med_05', '5135.13', '-4650.80', '-2.52', '65.37', 1, 'none'),
	(135, 'prop_bush_med_05', '5134.08', '-4651.49', '-20.65', '21.67', 1, 'none'),
	(136, 'prop_bush_med_05', '5132.17', '-4654.35', '-2.43', '23.99', 1, 'none'),
	(137, 'prop_bush_med_05', '5106.59', '-4656.39', '-1.92', '272.22', 1, 'none'),
	(140, 'bkr_prop_coke_table01a', '1336.80', '4361.30', '43.30', '133.20', 1, 'none'),
	(141, 'bkr_prop_coke_table01a', '1340.18', '4358.00', '43.36', '135.00', 1, 'none'),
	(142, 'bkr_prop_coke_table01a', '1342.00', '4356.10', '43.40', '134.40', 1, 'none'),
	(143, 'bkr_prop_meth_table01a', '-504.30', '-2702.40', '7.80', '314.40', 1, 'none'),
	(144, 'bkr_prop_meth_table01a', '-502.50', '-2704.20', '7.80', '314.60', 1, 'none'),
	(145, 'bkr_prop_meth_table01a', '-500.90', '-2705.80', '7.80', '314.90', 1, 'none'),
	(148, 'bkr_prop_meth_table01a', '1247.40', '-3014.00', '8.30', '89.70', 1, 'none'),
	(149, 'bkr_prop_meth_table01a', '1247.40', '-3016.60', '8.30', '89.90', 1, 'none'),
	(150, 'bkr_prop_meth_table01a', '1247.40', '-3019.20', '8.30', '90.34', 1, 'none'),
	(151, 'bkr_prop_meth_table01a', '1247.40', '-3021.86', '8.40', '90.60', 1, 'none'),
	(153, 'bkr_prop_weed_table_01a', '944.91', '-1522.00', '30.00', '179.20', 1, 'none'),
	(154, 'bkr_prop_weed_table_01a', '942.60', '-1522.00', '30.00', '180.50', 1, 'none'),
	(156, 'bkr_prop_weed_table_01a', '938.70', '-1522.00', '30.00', '180.10', 1, 'none'),
	(157, 'bkr_prop_weed_table_01a', '936.40', '-1522.00', '30.00', '180.10', 1, 'none'),
	(158, 'bkr_prop_weed_table_01a', '1745.70', '-1636.60', '111.50', '189.10', 1, 'none'),
	(159, 'bkr_prop_weed_table_01a', '1743.30', '-1637.00', '111.50', '189.10', 1, 'none'),
	(160, 'bkr_prop_weed_table_01a', '1743.30', '-1637.00', '111.50', '189.10', 1, 'none'),
	(161, 'bkr_prop_weed_table_01a', '1738.50', '-1637.80', '111.50', '189.80', 1, 'none'),
	(162, 'prop_tool_bench02', '3605.50', '3728.60', '28.70', '55.10', 1, 'none'),
	(163, 'prop_tool_bench02', '-176.30', '6151.80', '41.70', '225.20', 1, 'none'),
	(164, 'prop_tool_bench02', '2849.92', '1493.80', '23.70', '75.00', 1, 'none');

-- Dumping structure for table base.rd_animations_favourites
CREATE TABLE IF NOT EXISTS `rd_animations_favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `animation` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.rd_animations_favourites: ~0 rows (approximately)
DELETE FROM `rd_animations_favourites`;

-- Dumping structure for table base.rd_animations_profiles
CREATE TABLE IF NOT EXISTS `rd_animations_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `sets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `walkstyle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `face` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.rd_animations_profiles: ~31 rows (approximately)
DELETE FROM `rd_animations_profiles`;
INSERT INTO `rd_animations_profiles` (`id`, `identifier`, `sets`, `walkstyle`, `face`) VALUES
	(1, '60b15438266ee12985638e2993b1a411a27d7bf6', '[[],[],[],[],[],[]]', '"move_m@casual@f"', NULL),
	(2, '391a38f06c95f8e488ff79e788562896d8ce5cb7', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(3, '6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '[[],[],[],[],[],[]]', '"anim@move_m@grooving@"', NULL),
	(4, '2058d72d70846658b7ed44f62c7b23e25408a9af', '[[],[],[],[],[],[]]', NULL, NULL),
	(5, 'a44768e7c2844d454438a39c903fa80c9892f0bc', '[[],[],[],[],[],[]]', '"move_m@injured"', NULL),
	(6, '29f9bf803077d2cd85b04f13265436df61aeab0e', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(7, '29f9bf803077d2cd85b04f13265436df61aeab0e', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(8, '1bec8b76886b0931af9af4d86eb6926e003a2565', '[[],[],[],[],[],[]]', NULL, NULL),
	(9, '18b945285e905717960da4f6402a7b92651942a6', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(10, 'ce23bd9e469dfa1fa2bc9395325f25bd8a7099aa', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(11, 'd99bcce0c00cb59cb63a4f27e57a8f16724ed06c', '[[],[],[],[],[],[]]', NULL, NULL),
	(12, '9d013dc670d84c861761f7b07a38056ca62f2c04', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(13, '7fd41199089be211da9c71096825616aa8a35e69', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(14, '8553d1ea789b6f1d2a07321f9fad040827a04c3f', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(15, 'f18f41d8acb4a5ad272e7ebd5a4a186eef625d2e', '[[],[],[],[],[],[]]', NULL, NULL),
	(16, '7599c0508035ab64a1bfb7fa200781eb32d743e6', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(17, '9ba090eaed1210f5a612e97969cd55d1e04cdf60', '[[],[],[],[],[],[]]', '"move_m@injured"', NULL),
	(18, 'e2f03940ab607184e837ad4c010e3d77b8129d94', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(19, '4e38c3566056b55dedf08b081e83b1deee1dff21', '[[],[],[],[],[],[]]', NULL, NULL),
	(20, '756b2151597ea0207d9e5931a3a87549709761b0', '[[],[],[],[],[],[]]', NULL, NULL),
	(21, 'bd713ca9147f0b49e3eb9ab2790498274296ee0a', '[[],[],[],[],[],[]]', NULL, NULL),
	(22, '89b3d3c771632455ac9afded546881905fd03dcd', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(23, '89b3d3c771632455ac9afded546881905fd03dcd', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(24, 'bc2e7d866706f7d795a7c8fa272acaa9c4392924', '[[],[],[],[],[],[]]', NULL, NULL),
	(25, 'f0e25920e358e159aca570be43551355cd3abe01', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(26, 'f0e25920e358e159aca570be43551355cd3abe01', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(27, 'fb82e8faaddd9e6856dc59aa3f721a9688ea9509', '[[],[],[],[],[],[]]', '"move_m@generic"', NULL),
	(28, 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '[[],[],[],[],[],[]]', NULL, NULL),
	(29, 'aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '[[],[],[],[],[],[]]', NULL, NULL),
	(30, '267657e2ebf25e299aa963f279935a4af9d06e48', '[[],[],[],[],[],[]]', '"move_f@multiplayer"', NULL),
	(31, '6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '[[],[],[],[],[],[]]', NULL, NULL);

-- Dumping structure for table base.tiktok_users
CREATE TABLE IF NOT EXISTS `tiktok_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `bio` text NOT NULL DEFAULT '',
  `birthday` varchar(50) NOT NULL DEFAULT '0',
  `videos` text NOT NULL DEFAULT '{}',
  `followers` text NOT NULL,
  `following` text NOT NULL,
  `liked` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.tiktok_users: ~0 rows (approximately)
DELETE FROM `tiktok_users`;

-- Dumping structure for table base.tiktok_videos
CREATE TABLE IF NOT EXISTS `tiktok_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `created` varchar(50) NOT NULL DEFAULT '00:00:00',
  `data` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.tiktok_videos: ~0 rows (approximately)
DELETE FROM `tiktok_videos`;

-- Dumping structure for table base.tinder_accounts
CREATE TABLE IF NOT EXISTS `tinder_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.tinder_accounts: ~0 rows (approximately)
DELETE FROM `tinder_accounts`;

-- Dumping structure for table base.tinder_likes
CREATE TABLE IF NOT EXISTS `tinder_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.tinder_likes: ~0 rows (approximately)
DELETE FROM `tinder_likes`;

-- Dumping structure for table base.tinder_messages
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` longtext NOT NULL,
  `messages` longtext DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.tinder_messages: ~0 rows (approximately)
DELETE FROM `tinder_messages`;

-- Dumping structure for table base.twitter_account
CREATE TABLE IF NOT EXISTS `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.twitter_account: ~0 rows (approximately)
DELETE FROM `twitter_account`;

-- Dumping structure for table base.twitter_hashtags
CREATE TABLE IF NOT EXISTS `twitter_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.twitter_hashtags: ~0 rows (approximately)
DELETE FROM `twitter_hashtags`;

-- Dumping structure for table base.twitter_mentions
CREATE TABLE IF NOT EXISTS `twitter_mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.twitter_mentions: ~0 rows (approximately)
DELETE FROM `twitter_mentions`;

-- Dumping structure for table base.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.twitter_tweets: ~0 rows (approximately)
DELETE FROM `twitter_tweets`;

-- Dumping structure for table base.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `charinfo` text DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `ringtone` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `xp` longtext DEFAULT NULL,
  `okokcrafts` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.users: ~10 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`, `apps`, `widget`, `bt`, `charinfo`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `iban`, `tattoos`, `xp`, `okokcrafts`) VALUES
	('267657e2ebf25e299aa963f279935a4af9d06e48', '{"money":0,"bank":50000,"black_money":0}', 'admin', '[{"type":"weapon","name":"weapon_pistol50","amount":1,"slot":1,"info":{"ammo":10,"serie":"06Aei1IO493biCo","quality":30.24999999999895}},{"type":"weapon","name":"weapon_pistol50","amount":1,"slot":3,"info":{"ammo":0,"serie":"21viv0KC911yLOC","quality":34.74999999999891}},{"type":"item","name":"radio","amount":1,"slot":5,"info":[]}]', 'franca', 4, NULL, '{"walletid":"QS-63670049","cryptoid":"cpt-Ig378","phone":{"InstalledApps":[]},"CryptoCurrency":[]}', '{"heading":36.85039520263672,"z":27.02197265625,"y":-1090.5098876953126,"x":-13.00219345092773}', 'J', 'L', '26/07/2001', 'm', 200, '{"ears_1":-1,"mask_2":0,"helmet_1":-1,"torso_2":0,"shoes_2":0,"decals_1":0,"hair_color_2":0,"watches_1":-1,"beard_3":0,"eye_color":0,"sun_2":0,"eyebrows_2":0,"chest_1":0,"tshirt_1":0,"bracelets_2":0,"eyebrows_4":0,"bodyb_1":0,"watches_2":0,"lipstick_3":0,"makeup_2":0,"blush_2":0,"lipstick_2":0,"blemishes_2":0,"pants_2":0,"bproof_2":0,"moles_2":0,"lipstick_1":0,"blush_3":0,"chain_2":0,"hair_2":0,"beard_2":0,"complexion_1":0,"hair_color_1":26,"bags_2":0,"chest_3":0,"bracelets_1":-1,"ears_2":0,"face":5,"tshirt_2":0,"lipstick_4":0,"arms":0,"age_2":0,"complexion_2":0,"helmet_2":0,"eyebrows_1":0,"glasses_1":0,"blemishes_1":0,"chain_1":0,"arms_2":0,"chest_2":0,"sex":1,"shoes_1":0,"age_1":0,"beard_1":0,"makeup_3":0,"skin":10,"torso_1":0,"beard_4":0,"sun_1":0,"mask_1":0,"bproof_1":0,"bodyb_2":0,"pants_1":0,"decals_2":0,"eyebrows_3":0,"bags_1":0,"blush_1":0,"moles_1":0,"makeup_1":0,"hair_1":89,"glasses_2":0,"makeup_4":0}', '[{"percent":49.94,"val":499400,"name":"hunger"},{"percent":49.955,"val":499550,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"}]', 0, 58, 0, NULL, '2023-05-11 15:02:47', '2023-05-14 21:36:59', NULL, NULL, NULL, NULL, '0', '{"lastname":"L","phone":"553521226","firstname":"J","account":"QS1987321746"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]'),
	('391a38f06c95f8e488ff79e788562896d8ce5cb7', '{"bank":49800,"black_money":0,"money":13498}', 'owner', '[{"info":[],"name":"advancedlockpick","amount":2,"slot":1,"type":"item"},{"info":{"serie":"00mOn8AT833jmIU","ammo":14,"quality":98.49999999999996},"name":"weapon_pistol50","amount":1,"slot":2,"type":"weapon"},{"info":[],"name":"sponge","amount":1,"slot":4,"type":"item"},{"info":[],"name":"contract","amount":1,"slot":5,"type":"item"},{"info":[],"name":"weed_leaf","amount":95,"slot":6,"type":"item"},{"info":[],"name":"weed_pooch","amount":4,"slot":7,"type":"item"},{"info":[],"name":"pooch_bag","amount":102,"slot":9,"type":"item"},{"info":[],"name":"cash","amount":13498,"slot":14,"type":"item"}]', 'unemployed', 0, NULL, '{"armor":0,"walletid":"QS-66035449","dealerrep":0,"cryptoid":"cpt-Nd917","craftingrep":0,"inlaststand":false,"CryptoCurrency":[],"attachmentcraftingrep":0,"isdead":false,"phone":{"InstalledApps":[]}}', '{"z":21.748046875,"heading":272.1259765625,"x":730.4967041015625,"y":-1088.7032470703126}', 'Joao', 'Almeida', '11/01/1999', 'm', 187, '{"bags_2":0,"helmet_2":0,"makeup_3":0,"age_1":0,"shoes_2":0,"decals_2":0,"bags_1":0,"mask_2":0,"pants_2":0,"moles_2":0,"hair_color_1":0,"chest_1":0,"tshirt_2":0,"beard_4":0,"torso_2":0,"blush_3":0,"makeup_2":0,"decals_1":0,"beard_1":0,"makeup_1":0,"blemishes_2":0,"lipstick_2":0,"skin":0,"face":0,"mask_1":0,"blush_2":0,"chain_1":0,"beard_2":0,"complexion_2":0,"hair_2":0,"bodyb_2":0,"chest_3":0,"ears_2":0,"age_2":0,"bproof_2":0,"eyebrows_4":0,"eyebrows_1":0,"tshirt_1":0,"lipstick_1":0,"blemishes_1":0,"glasses_2":0,"bracelets_1":-1,"beard_3":0,"complexion_1":0,"bproof_1":0,"watches_1":-1,"watches_2":0,"eyebrows_2":0,"moles_1":0,"arms_2":0,"helmet_1":-1,"eye_color":0,"chain_2":0,"arms":0,"shoes_1":0,"bracelets_2":0,"hair_1":0,"eyebrows_3":0,"lipstick_3":0,"glasses_1":0,"sex":0,"lipstick_4":0,"sun_1":0,"chest_2":0,"sun_2":0,"torso_1":0,"pants_1":0,"blush_1":0,"hair_color_2":0,"ears_1":-1,"bodyb_1":0,"makeup_4":0}', '[{"val":379900,"percent":37.99,"name":"hunger"},{"val":409925,"percent":40.9925,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"}]', 0, 54, 0, NULL, '2023-05-09 19:40:39', '2023-05-18 19:49:11', NULL, NULL, NULL, NULL, '0', '{"firstname":"Joao","account":"QS4308746779","lastname":"Almeida","phone":"553985983"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('60b15438266ee12985638e2993b1a411a27d7bf6', '{"money":8996001,"black_money":0,"bank":9046950}', 'owner', '[{"name":"cash","slot":1,"type":"item","amount":8996001,"info":[]},{"name":"radio","slot":2,"type":"item","amount":1,"info":[]},{"name":"weapon_snspistol","slot":3,"type":"weapon","amount":1,"info":{"serie":"35wNX0Rv128lvIW"}},{"name":"weapon_knife","slot":4,"type":"weapon","amount":1,"info":{"serie":"60yzr8eI004NgrM"}},{"name":"pooch_bag","slot":5,"type":"item","amount":16,"info":[]},{"name":"metalscrap","slot":6,"type":"item","amount":5,"info":[]},{"name":"iron_metal","slot":7,"type":"item","amount":5,"info":[]},{"name":"gold_metal","slot":8,"type":"item","amount":4,"info":[]},{"name":"rubber","slot":9,"type":"item","amount":5,"info":[]},{"name":"hunter_animal_cloth","slot":10,"type":"item","amount":5,"info":[]}]', 'police', 3, NULL, '{"isdead":false,"cryptoid":"cpt-VM415","attachmentcraftingrep":0,"craftingrep":0,"inlaststand":false,"CryptoCurrency":[],"armor":0,"phone":{"InstalledApps":[]},"walletid":"QS-45706817","dealerrep":0}', '{"y":2790.43505859375,"x":2959.476806640625,"heading":303.3070983886719,"z":40.5692138671875}', 'Goncalo', 'Costa', '08/03/1998', 'm', 175, '{"tshirt_2":0,"arms":4,"makeup_2":0,"age_1":0,"makeup_4":0,"bags_2":0,"pants_1":20,"watches_1":-1,"moles_1":0,"sex":0,"skin":3,"lipstick_4":0,"face":21,"torso_2":0,"moles_2":10,"mask_1":0,"ears_1":26,"glasses_2":0,"torso_1":20,"helmet_2":0,"pants_2":0,"sun_2":0,"bags_1":0,"bodyb_2":0,"bodyb_1":0,"bproof_1":0,"decals_1":0,"lipstick_2":0,"hair_2":0,"eyebrows_2":0,"bracelets_2":0,"eyebrows_3":0,"lipstick_3":0,"shoes_2":1,"eye_color":2,"chain_2":0,"beard_1":1,"blush_2":0,"decals_2":0,"complexion_2":0,"blush_1":0,"arms_2":0,"shoes_1":25,"ears_2":1,"makeup_1":0,"eyebrows_4":0,"sun_1":0,"beard_4":0,"chain_1":0,"beard_3":0,"tshirt_1":15,"lipstick_1":0,"chest_3":0,"blemishes_1":0,"helmet_1":-1,"complexion_1":0,"mask_2":0,"hair_1":40,"age_2":0,"eyebrows_1":0,"makeup_3":0,"watches_2":0,"bproof_2":0,"chest_2":0,"hair_color_1":0,"glasses_1":31,"beard_2":10,"hair_color_2":0,"bracelets_1":-1,"blush_3":0,"blemishes_2":0,"chest_1":0}', '[{"val":271600,"percent":27.16,"name":"hunger"},{"val":328700,"percent":32.87,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"}]', 0, 53, 0, NULL, '2023-05-08 23:02:07', '2023-05-19 12:23:31', NULL, NULL, NULL, NULL, '0', '{"account":"QS7185549441","phone":"553663864","lastname":"Costa","firstname":"Goncalo"}', NULL, NULL, NULL, NULL, NULL, NULL, 'NPT335712', NULL, NULL, NULL),
	('6b7f3b6f5ac498856582f34618e48cde8c0ce84a', '{"money":0,"bank":50000,"black_money":0}', 'user', '[]', 'unemployed', 0, NULL, '{"walletid":"QS-58817861","cryptoid":"cpt-bI359","phone":{"InstalledApps":[]},"CryptoCurrency":[]}', '{"heading":68.031494140625,"z":30.1728515625,"y":-1110.962646484375,"x":16.89230918884277}', 'Antero', 'Antero', '11/11/1990', 'm', 167, '{"tshirt_1":0,"helmet_2":0,"chest_1":0,"shoes_1":0,"bproof_2":0,"complexion_2":0,"makeup_4":0,"beard_4":0,"chest_3":0,"torso_2":0,"makeup_2":0,"chain_1":0,"blush_2":0,"sex":0,"makeup_3":0,"hair_color_1":0,"blemishes_1":0,"chain_2":0,"bodyb_1":0,"age_1":0,"ears_1":-1,"sun_2":0,"pants_2":0,"hair_color_2":0,"mask_2":0,"ears_2":0,"decals_1":0,"arms_2":0,"bracelets_1":-1,"eye_color":0,"beard_1":0,"blush_3":0,"mask_1":0,"beard_3":0,"lipstick_3":0,"makeup_1":0,"moles_1":0,"skin":0,"pants_1":7,"lipstick_1":0,"hair_2":0,"beard_2":0,"torso_1":10,"tshirt_2":0,"sun_1":0,"eyebrows_1":0,"shoes_2":0,"lipstick_2":0,"watches_2":0,"glasses_1":0,"lipstick_4":0,"glasses_2":0,"decals_2":0,"face":0,"bodyb_2":0,"helmet_1":-1,"chest_2":0,"eyebrows_2":0,"moles_2":0,"bags_2":0,"blemishes_2":0,"bracelets_2":0,"complexion_1":0,"watches_1":-1,"blush_1":0,"arms":0,"age_2":0,"eyebrows_3":0,"hair_1":0,"bags_1":0,"eyebrows_4":0,"bproof_1":0}', '[{"percent":98.81,"val":988100,"name":"hunger"},{"percent":99.1075,"val":991075,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"}]', 0, 62, 0, NULL, '2023-05-14 21:30:25', '2023-05-14 21:34:45', NULL, NULL, NULL, NULL, '0', '{"lastname":"Antero","phone":"553703016","firstname":"Antero","account":"QS3605387840"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('6ed0dfaefd4eb1f3d39e6d437dd64d3c3094181f', '{"black_money":0,"bank":50000,"money":40000}', 'owner', '[{"name":"weed_leaf","info":[],"amount":4,"slot":1,"type":"item"},{"name":"coke_pooch","info":[],"amount":10,"slot":2,"type":"item"},{"name":"cash","info":[],"amount":40000,"slot":3,"type":"item"},{"name":"pistol_ammo","info":[],"amount":5,"slot":4,"type":"item"},{"name":"advancedlockpick","info":[],"amount":1,"slot":5,"type":"item"},{"name":"water","info":[],"amount":1,"slot":6,"type":"item"},{"name":"rubber","info":[],"amount":3,"slot":7,"type":"item"},{"name":"gold_metal","info":[],"amount":8,"slot":8,"type":"item"},{"name":"metalscrap","info":[],"amount":9,"slot":9,"type":"item"},{"name":"iron_metal","info":[],"amount":6,"slot":10,"type":"item"},{"name":"radio","info":[],"amount":1,"slot":11,"type":"item"}]', 'vagos', 4, NULL, '{"walletid":"QS-51094232","CryptoCurrency":[],"phone":{"InstalledApps":[]},"cryptoid":"cpt-pJ363"}', '{"z":31.6051025390625,"y":-783.7450561523438,"x":230.967041015625,"heading":357.16534423828127}', 'Tiago', 'Lima', '23/04/2001', 'm', 189, '{"face":0,"ears_1":-1,"sex":1,"bags_1":0,"lipstick_2":0,"blush_2":0,"lipstick_4":0,"bproof_1":0,"beard_1":0,"beard_3":0,"hair_color_2":0,"hair_1":0,"mask_2":0,"blemishes_1":0,"blush_1":0,"label":"Redline 2 Homem","mask_1":0,"ears_2":0,"bodyb_2":0,"arms":0,"chain_1":0,"beard_2":0,"hair_color_1":0,"moles_1":0,"moles_2":0,"makeup_1":0,"tshirt_2":0,"bracelets_2":0,"glasses_2":0,"tshirt_1":15,"helmet_1":-1,"eyebrows_3":0,"sun_1":0,"blush_3":0,"lipstick_1":0,"makeup_2":0,"age_1":0,"complexion_2":0,"bags_2":0,"sun_2":0,"shoes_2":0,"blemishes_2":0,"chain_2":0,"eyebrows_4":0,"torso_1":139,"decals_2":0,"makeup_4":0,"shoes_1":65,"watches_1":-1,"pants_2":0,"age_2":0,"bproof_2":0,"pants_1":87,"hair_2":0,"eye_color":0,"makeup_3":0,"bracelets_1":-1,"chest_3":0,"arms_2":0,"watches_2":0,"glasses_1":0,"chest_1":0,"skin":0,"torso_2":0,"eyebrows_1":0,"helmet_2":0,"decals_1":0,"beard_4":0,"complexion_1":0,"bodyb_1":0,"lipstick_3":0,"eyebrows_2":0,"chest_2":0}', '[{"percent":88.68,"name":"hunger","val":886800},{"percent":91.51,"name":"thirst","val":915100},{"percent":0.0,"name":"drunk","val":0}]', 0, 63, 0, NULL, '2023-05-17 21:40:32', '2023-05-17 21:59:55', NULL, NULL, NULL, NULL, '0', '{"firstname":"Tiago","account":"QS9146148340","phone":"553931141","lastname":"Lima"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]'),
	('7fd41199089be211da9c71096825616aa8a35e69', '{"black_money":0,"money":0,"bank":47494}', 'admin', '[{"type":"weapon","amount":1,"name":"weapon_pistol_mk2","slot":1,"info":{"serie":"28rgn5fQ475LWnu"}},{"type":"weapon","amount":1,"name":"weapon_assaultrifle","slot":2,"info":{"quality":42.24999999999884,"ammo":154,"serie":"90pbZ4Jn933ajrs"}},{"type":"item","amount":5,"name":"rifle_ammo","slot":3,"info":[]}]', 'franca', 4, NULL, '{"phone":{"InstalledApps":[]},"walletid":"QS-28735857","CryptoCurrency":[],"cryptoid":"cpt-lu237"}', '{"z":30.813232421875,"heading":158.7401580810547,"x":216.75164794921876,"y":-788.00439453125}', 'Pedro', 'Oscuro', '04/02/2000', 'm', 199, '{"tshirt_1":0,"helmet_2":0,"chest_1":0,"shoes_1":0,"bproof_2":0,"complexion_2":0,"makeup_4":0,"beard_4":0,"sun_1":0,"torso_2":0,"makeup_2":0,"hair_2":0,"blush_2":0,"helmet_1":-1,"bproof_1":0,"hair_color_1":0,"decals_2":0,"chain_2":0,"bodyb_1":0,"age_1":0,"ears_1":-1,"tshirt_2":0,"pants_2":0,"hair_color_2":0,"chest_2":0,"ears_2":0,"decals_1":0,"torso_1":4,"bracelets_1":-1,"eye_color":0,"shoes_2":0,"blush_3":0,"mask_1":0,"beard_3":0,"lipstick_3":0,"makeup_1":0,"moles_1":0,"skin":2,"pants_1":0,"lipstick_1":0,"sex":0,"beard_1":0,"bodyb_2":0,"arms_2":0,"sun_2":0,"blemishes_2":0,"makeup_3":0,"lipstick_2":0,"watches_2":0,"blush_1":0,"lipstick_4":0,"glasses_2":0,"face":0,"eyebrows_2":0,"bags_1":0,"blemishes_1":0,"mask_2":0,"glasses_1":0,"moles_2":0,"bags_2":0,"eyebrows_1":0,"bracelets_2":0,"complexion_1":0,"watches_1":-1,"chain_1":0,"arms":0,"beard_2":0,"eyebrows_3":0,"hair_1":1,"age_2":0,"eyebrows_4":0,"chest_3":0}', '[{"val":397700,"percent":39.77,"name":"hunger"},{"val":423275,"percent":42.3275,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"}]', 0, 59, 0, NULL, '2023-05-14 20:56:34', '2023-05-14 22:08:55', NULL, NULL, NULL, NULL, '0', '{"account":"QS4771237422","firstname":"Pedro","phone":"553554012","lastname":"Oscuro"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"armas":[]}'),
	('9ba090eaed1210f5a612e97969cd55d1e04cdf60', '{"money":0,"bank":50000,"black_money":0}', 'admin', '[]', 'unemployed', 0, NULL, '{"walletid":"QS-28007918","cryptoid":"cpt-wD273","phone":{"InstalledApps":[]},"CryptoCurrency":[]}', '{"heading":323.14959716796877,"z":27.02197265625,"y":-1082.2548828125,"x":-26.00439262390136}', 'Toni', 'Biclas', '20/11/1999', 'm', 189, NULL, '[{"percent":49.87,"val":498700,"name":"hunger"},{"percent":49.90249999999999,"val":499025,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"}]', 0, 61, 0, NULL, '2023-05-14 21:18:42', '2023-05-14 21:36:59', NULL, NULL, NULL, NULL, '0', '{"lastname":"Biclas","phone":"553899756","firstname":"Toni","account":"QS8978793390"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('9d013dc670d84c861761f7b07a38056ca62f2c04', '{"money":0,"bank":50000,"black_money":0}', 'admin', '[]', 'unemployed', 0, NULL, '{"walletid":"QS-25291694","cryptoid":"cpt-Hl598","CryptoCurrency":[],"phone":{"InstalledApps":[]}}', '{"heading":116.22047424316406,"z":37.4688720703125,"y":-1113.7054443359376,"x":64.4967041015625}', 'Shin', 'Shan', '12/04/2000', 'm', 185, '{"tshirt_1":15,"helmet_2":0,"chest_1":0,"shoes_1":0,"bproof_2":0,"complexion_2":0,"makeup_4":0,"beard_4":0,"sun_1":0,"torso_2":2,"makeup_2":0,"chain_1":0,"blush_2":0,"helmet_1":-1,"makeup_3":0,"hair_color_1":28,"decals_2":0,"chain_2":0,"bodyb_1":0,"blemishes_2":0,"ears_1":-1,"sun_2":0,"pants_2":0,"hair_color_2":0,"chest_2":0,"blush_1":0,"decals_1":0,"torso_1":6,"bracelets_1":-1,"eye_color":0,"shoes_2":2,"blush_3":0,"mask_1":0,"beard_3":0,"lipstick_3":0,"makeup_1":0,"moles_1":0,"skin":2,"pants_1":20,"lipstick_1":0,"age_1":0,"bodyb_2":0,"bracelets_2":0,"bags_1":0,"beard_2":0,"arms_2":0,"sex":0,"lipstick_2":0,"watches_2":0,"tshirt_2":0,"lipstick_4":0,"glasses_2":0,"chest_3":0,"eyebrows_2":0,"blemishes_1":0,"ears_2":0,"mask_2":0,"glasses_1":0,"moles_2":0,"bags_2":0,"eyebrows_1":0,"face":24,"complexion_1":0,"watches_1":-1,"hair_2":0,"arms":1,"age_2":0,"eyebrows_3":0,"hair_1":9,"bproof_1":0,"eyebrows_4":0,"beard_1":0}', '[{"percent":47.97,"val":479700,"name":"hunger"},{"percent":48.4775,"val":484775,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"}]', 0, 60, 0, NULL, '2023-05-14 21:17:48', '2023-05-14 21:36:59', NULL, NULL, NULL, NULL, '0', '{"lastname":"Shan","phone":"553348862","firstname":"Shin","account":"QS8964759540"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('aafb1ecf1e1fed80faa2dd807f08392132e3f8ac', '{"bank":40000,"black_money":0,"money":10000}', 'user', '[{"info":[],"slot":1,"name":"cash","amount":10000,"type":"item"}]', 'unemployed', 0, NULL, '{"phone":{"InstalledApps":[]},"CryptoCurrency":[],"cryptoid":"cpt-VY797","walletid":"QS-60986439"}', '{"y":-1057.3846435546876,"z":27.4263916015625,"heading":291.968505859375,"x":-84.30329895019531}', 'Elias', 'Malaquias', '06/10/2000', 'm', 190, '{"ears_1":-1,"mask_2":0,"makeup_3":0,"torso_2":0,"shoes_2":0,"decals_1":0,"hair_color_2":0,"watches_1":-1,"beard_3":0,"eye_color":0,"chest_2":0,"eyebrows_2":0,"chest_1":0,"sun_1":0,"bracelets_2":0,"eyebrows_4":0,"bodyb_1":0,"watches_2":0,"lipstick_3":0,"makeup_2":0,"blush_2":0,"lipstick_2":0,"skin":0,"pants_2":0,"bproof_2":0,"moles_2":0,"lipstick_1":0,"makeup_1":0,"chain_2":0,"hair_2":0,"beard_2":0,"complexion_1":0,"hair_color_1":0,"bags_2":0,"chest_3":0,"bracelets_1":-1,"ears_2":0,"face":1,"tshirt_2":0,"lipstick_4":0,"arms":0,"age_2":0,"complexion_2":0,"mask_1":0,"beard_4":0,"torso_1":0,"beard_1":0,"chain_1":0,"pants_1":0,"moles_1":0,"sex":0,"shoes_1":0,"glasses_2":0,"sun_2":0,"helmet_2":0,"age_1":0,"glasses_1":0,"helmet_1":-1,"blemishes_2":0,"eyebrows_1":0,"hair_1":0,"bodyb_2":0,"tshirt_1":0,"decals_2":0,"eyebrows_3":0,"bags_1":0,"blush_1":0,"blush_3":0,"bproof_1":0,"arms_2":0,"blemishes_1":0,"makeup_4":0}', '[{"val":973300,"percent":97.33000000000001,"name":"hunger"},{"val":979975,"percent":97.9975,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"}]', 0, 57, 0, NULL, '2023-05-10 17:28:45', '2023-05-10 17:34:56', NULL, 610, NULL, NULL, '0', '{"phone":"553944751","firstname":"Elias","account":"QS3840628194","lastname":"Malaquias"}', NULL, NULL, NULL, NULL, NULL, NULL, 'NPT502639', NULL, NULL, NULL),
	('f0e25920e358e159aca570be43551355cd3abe01', '{"black_money":0,"money":0,"bank":50000}', 'admin', '[{"type":"item","amount":5,"name":"smg_ammo","slot":1,"info":[]},{"type":"item","amount":1,"name":"advancedlockpick","slot":2,"info":[]},{"type":"weapon","amount":1,"name":"weapon_pistol50","slot":3,"info":{"quality":63.24999999999865,"ammo":0,"serie":"14XGq7ob821uATm"}},{"type":"item","amount":2,"name":"white_phone","slot":4,"info":[]},{"type":"item","amount":1,"name":"classic_phone","slot":5,"info":[]}]', 'police', 14, NULL, '{"phone":{"background":"b2","InstalledApps":[]},"inlaststand":false,"CryptoCurrency":[],"isdead":false,"armor":0,"walletid":"QS-80152798","dealerrep":0,"attachmentcraftingrep":0,"craftingrep":0,"cryptoid":"cpt-vF104"}', '{"z":30.4256591796875,"heading":294.80316162109377,"x":3504.48779296875,"y":3803.77587890625}', 'Jacinto', 'Sousa', '12/18/1994', 'm', 185, '{"chain_2":0,"beard_1":0,"torso_1":2,"bracelets_2":0,"arms":1,"beard_4":0,"arms_2":0,"chest_3":0,"bproof_1":0,"complexion_1":0,"helmet_2":0,"bodyb_1":0,"age_2":0,"hair_color_2":0,"tshirt_2":0,"lipstick_1":0,"sun_1":0,"age_1":0,"watches_2":0,"skin":0,"ears_1":-1,"torso_2":0,"eyebrows_1":0,"lipstick_2":0,"bracelets_1":-1,"hair_1":4,"hair_2":0,"lipstick_3":0,"mask_2":0,"lipstick_4":0,"moles_1":0,"sex":0,"glasses_2":0,"eyebrows_2":0,"chest_2":0,"decals_2":0,"bags_2":0,"ears_2":0,"pants_2":0,"complexion_2":0,"makeup_1":0,"eyebrows_3":0,"chest_1":0,"chain_1":0,"blemishes_1":0,"watches_1":-1,"helmet_1":1,"mask_1":0,"blemishes_2":0,"blush_3":0,"beard_3":0,"face":0,"pants_1":10,"sun_2":0,"bproof_2":0,"shoes_2":0,"bags_1":0,"makeup_4":0,"hair_color_1":0,"tshirt_1":15,"decals_1":0,"makeup_3":0,"makeup_2":0,"eye_color":0,"glasses_1":3,"shoes_1":0,"blush_2":0,"bodyb_2":0,"blush_1":0,"moles_2":0,"beard_2":0,"eyebrows_4":0}', '[{"val":494200,"percent":49.41999999999999,"name":"hunger"},{"val":495650,"percent":49.565,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"}]', 0, 56, 0, NULL, '2023-05-09 21:56:06', '2023-05-14 21:46:59', NULL, NULL, NULL, NULL, '0', '{"account":"QS9573243840","firstname":"Jacinto","phone":"553997113","lastname":"Sousa"}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- Dumping structure for table base.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table base.user_licenses: ~0 rows (approximately)
DELETE FROM `user_licenses`;
INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'dmv', '391a38f06c95f8e488ff79e788562896d8ce5cb7'),
	(2, 'dmv', '7599c0508035ab64a1bfb7fa200781eb32d743e6');

-- Dumping structure for table base.whatsapp_accounts
CREATE TABLE IF NOT EXISTS `whatsapp_accounts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.whatsapp_accounts: ~0 rows (approximately)
DELETE FROM `whatsapp_accounts`;

-- Dumping structure for table base.whatsapp_chats
CREATE TABLE IF NOT EXISTS `whatsapp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.whatsapp_chats: ~0 rows (approximately)
DELETE FROM `whatsapp_chats`;

-- Dumping structure for table base.whatsapp_chats_messages
CREATE TABLE IF NOT EXISTS `whatsapp_chats_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_chat` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  `readed` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.whatsapp_chats_messages: ~0 rows (approximately)
DELETE FROM `whatsapp_chats_messages`;

-- Dumping structure for table base.whatsapp_groups
CREATE TABLE IF NOT EXISTS `whatsapp_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.whatsapp_groups: ~0 rows (approximately)
DELETE FROM `whatsapp_groups`;

-- Dumping structure for table base.whatsapp_groups_messages
CREATE TABLE IF NOT EXISTS `whatsapp_groups_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `read` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.whatsapp_groups_messages: ~0 rows (approximately)
DELETE FROM `whatsapp_groups_messages`;

-- Dumping structure for table base.whatsapp_groups_users
CREATE TABLE IF NOT EXISTS `whatsapp_groups_users` (
  `number_group` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.whatsapp_groups_users: ~0 rows (approximately)
DELETE FROM `whatsapp_groups_users`;

-- Dumping structure for table base.whatsapp_stories
CREATE TABLE IF NOT EXISTS `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table base.whatsapp_stories: ~0 rows (approximately)
DELETE FROM `whatsapp_stories`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
