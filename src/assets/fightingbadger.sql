-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table burrow.aah_badge
CREATE TABLE IF NOT EXISTS `aah_badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `background_id` int(11) DEFAULT NULL,
  `skin_id` int(11) DEFAULT NULL,
  `hair_id` int(11) DEFAULT NULL,
  `outfit_id` int(11) DEFAULT NULL,
  `bling_id` int(11) DEFAULT NULL,
  `use_image` tinyint(1) DEFAULT NULL,
  `pronouns` varchar(2555) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` varchar(2555) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CC0326CC7E3C61F9` (`owner_id`),
  KEY `IDX_CC0326CCC93D69EA` (`background_id`),
  KEY `IDX_CC0326CCF404637F` (`skin_id`),
  KEY `IDX_CC0326CC2A89600A` (`hair_id`),
  KEY `IDX_CC0326CCAE96E385` (`outfit_id`),
  KEY `IDX_CC0326CC8DF21A18` (`bling_id`),
  CONSTRAINT `FK_CC0326CC2A89600A` FOREIGN KEY (`hair_id`) REFERENCES `lost_mini` (`id`),
  CONSTRAINT `FK_CC0326CC7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_CC0326CC8DF21A18` FOREIGN KEY (`bling_id`) REFERENCES `lost_mini` (`id`),
  CONSTRAINT `FK_CC0326CCAE96E385` FOREIGN KEY (`outfit_id`) REFERENCES `lost_mini` (`id`),
  CONSTRAINT `FK_CC0326CCC93D69EA` FOREIGN KEY (`background_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_CC0326CCF404637F` FOREIGN KEY (`skin_id`) REFERENCES `lost_mini` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.aah_badge: ~0 rows (approximately)
/*!40000 ALTER TABLE `aah_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `aah_badge` ENABLE KEYS */;

-- Dumping structure for table burrow.aah_creature
CREATE TABLE IF NOT EXISTS `aah_creature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `species` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base` tinyint(1) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `r` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.aah_creature: ~14 rows (approximately)
/*!40000 ALTER TABLE `aah_creature` DISABLE KEYS */;
INSERT INTO `aah_creature` (`id`, `size`, `species`, `base`, `cost`, `m`, `s`, `b`, `r`, `n`, `c`, `a`, `f`, `p`, `skills`) VALUES
	(1, 'Small', 'Mouse', 30, 24, '6', 'd6', 'd6', 'd6', '6', 'd6', 'd6', 'd6', 'd6', NULL),
	(2, 'Small', 'Shrew', 30, 29, '6', 'd6', 'd6', 'd6', '6', 'd6', 'd6', 'd6', 'd6', NULL),
	(3, 'Small', 'Bird (small)', 30, 26, '6', 'd6', 'd6', 'd6', '6', 'd6', 'd6', 'd4', 'd4', '["Flight", "Unarmed Fighter", "Delicate (-2)", "Gifted", "Natural Hunter"]'),
	(4, 'Small', 'Bat', 30, 27, '4', 'd6', 'd4', 'd4', '6', 'd6', 'd6', 'd6', 'd6', '["Flight", "Unarmed Fighter", "Delicate (-2)", "Gifted", "Natural Hunter"]'),
	(21, 'Space Marine', 'Outrider Sergeant', NULL, NULL, '14', '3', '3', '4', '5', '4', '3', '8', '3', '["Angels of Death", "Devastating Charge", "Turbo-boost"]'),
	(22, 'Space Marine', 'Outrider', 6, NULL, '14', '3', '3', '4', '5', '4', '2', '7', '3', '["Angels of Death", "Devastating Charge", "Turbo-boost"]'),
	(23, 'Space Marine', 'Assault Intercessor', 5, NULL, '6', '3', '3', '4', '4', '2', '2', '7', '3', '["Angels of Death", "Combat Squads"]'),
	(24, 'Space Marine', 'Assautl Intercessor Sergeant', NULL, NULL, '6', '3', '3', '4', '4', '2', '3', '8', '3', '["Angels of Death", "Combat Squads"]'),
	(25, 'Space Marine', 'Primaris Captain', 5, NULL, '6', '2', '2', '4', '4', '5', '4', '8', '3', '["Angels of Death", "Tactical Precison (Aura)"]'),
	(31, 'Necrons', 'Overlord', 5, NULL, '5', '2', '2', '5', '5', '5', '3', '10', '3', '["Living Metal", "Phase Shifter", "My Will Be Done", "Relentless March (Aura)"]'),
	(32, 'Necrons', 'Necron Warrior', 5, NULL, '5', '3', '3', '4', '4', '1', '1', '10', '4', '["Reanimation Protocals", "Their number is legion"]'),
	(33, 'Necrons', 'Scarab Swarm', 2, NULL, '10', '4', '0', '3', '3', '4', '4', '10', '6', '[]'),
	(34, 'Necrons', 'Skorpekh Destroyer', 6, NULL, '8', '3', '3', '5', '5', '3', '3', '10', '3', '["Reanimation Protocals", "Infused Madness", "Hardwired for Destruction"]'),
	(35, 'Necrons', 'Canoptek Plasmacyte', NULL, NULL, '8', '4', '4', '4', '5', '1', '1', '10', '4', '["Reanimation Protocals", "Infused Madness", "Hardwired for Destruction"]');
/*!40000 ALTER TABLE `aah_creature` ENABLE KEYS */;

-- Dumping structure for table burrow.aah_game
CREATE TABLE IF NOT EXISTS `aah_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruleset_id` int(11) DEFAULT NULL,
  `player1_id` int(11) NOT NULL,
  `army1_id` int(11) NOT NULL,
  `player2_id` int(11) NOT NULL,
  `army2_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `design_notes` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_82903A054F1C144` (`ruleset_id`),
  KEY `IDX_82903A0C0990423` (`player1_id`),
  KEY `IDX_82903A093ABA392` (`army1_id`),
  KEY `IDX_82903A0D22CABCD` (`player2_id`),
  KEY `IDX_82903A0811E0C7C` (`army2_id`),
  CONSTRAINT `FK_82903A054F1C144` FOREIGN KEY (`ruleset_id`) REFERENCES `lost_mini` (`id`),
  CONSTRAINT `FK_82903A0811E0C7C` FOREIGN KEY (`army2_id`) REFERENCES `aah_warband` (`id`),
  CONSTRAINT `FK_82903A093ABA392` FOREIGN KEY (`army1_id`) REFERENCES `aah_warband` (`id`),
  CONSTRAINT `FK_82903A0C0990423` FOREIGN KEY (`player1_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_82903A0D22CABCD` FOREIGN KEY (`player2_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.aah_game: ~0 rows (approximately)
/*!40000 ALTER TABLE `aah_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `aah_game` ENABLE KEYS */;

-- Dumping structure for table burrow.aah_item
CREATE TABLE IF NOT EXISTS `aah_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `description` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flex_data` json DEFAULT NULL,
  `super_slug` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `action` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modifier` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allegiance` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restricted` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_34191732727ACA70` (`parent_id`),
  KEY `IDX_34191732115F0EE5` (`domain_id`),
  CONSTRAINT `FK_34191732115F0EE5` FOREIGN KEY (`domain_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_34191732727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `aah_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.aah_item: ~55 rows (approximately)
/*!40000 ALTER TABLE `aah_item` DISABLE KEYS */;
INSERT INTO `aah_item` (`id`, `parent_id`, `domain_id`, `description`, `flex_data`, `super_slug`, `display_order`, `cost`, `action`, `modifier`, `allegiance`, `used`, `restricted`) VALUES
	(34001, NULL, NULL, 'The Open Trading Table', NULL, 'open_trading', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34002, NULL, 34001, 'Armour', NULL, 'armour', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34003, NULL, 34005, 'One-Handed Weapon', NULL, 'one-handed', NULL, 8, 'Strike', NULL, NULL, NULL, NULL),
	(34004, NULL, 34002, 'Light Armour', NULL, NULL, NULL, 15, 'Strike', NULL, NULL, NULL, NULL),
	(34005, NULL, 34001, 'Weapons', NULL, 'weapon', NULL, NULL, '', NULL, NULL, NULL, NULL),
	(34006, NULL, 34002, 'Heavy Armour', NULL, NULL, NULL, 25, '', NULL, NULL, NULL, NULL),
	(34007, NULL, 34005, 'Double-Handed Weapon', NULL, 'double-handed', NULL, 13, 'Strike', NULL, NULL, NULL, NULL),
	(34008, NULL, NULL, 'The Den Table', NULL, 'den', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34009, NULL, 34008, 'Abandoned Burrow', '{"Effect": "A vast burrow that has been abandoned for generations.", "allegience": ["rogues_allegience", "wildbeasts_allegience", "freebeasts_allegience"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34010, NULL, 34008, 'Ruined Farmstead', '{"Effect": "A ruined farm, beneath the farmhouse, barns and outbuildings.", "allegience": ["royalists_allegience", "rogues_allegience", "wildbeasts_allegience"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34011, NULL, 34008, 'Town Building', '{"Effect": "Large warehouses, guildhalls and military bases are gathered round most towns and cities in Northhymbria.", "allegience": ["royalists_allegience", "freebeasts_allegience"]}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34012, NULL, NULL, 'The Allegience Table', NULL, 'allegiance', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34013, NULL, 34012, 'Rogues', NULL, 'rogues_allegience', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34014, NULL, 34012, 'Freebeasts', NULL, 'freebeasts_allegience', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34015, NULL, 34012, 'Wildbeasts', NULL, 'wildbeasts_allegience', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34016, NULL, 34012, 'Royalists', NULL, 'royalists_allegience', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34111, NULL, 34001, 'Items', NULL, 'item', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34112, NULL, 34111, 'Camouflage Cloak', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL),
	(34113, NULL, 34111, 'Rope & Hook', NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
	(34114, NULL, 34111, 'Lucky Charm', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL),
	(34115, NULL, 34111, 'Mages Focus', NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL),
	(34116, NULL, 34111, 'Healing Potion', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
	(34117, NULL, 34111, 'Mages Pouch', NULL, 'mages_pouch', NULL, 10, NULL, NULL, NULL, NULL, NULL),
	(34118, NULL, 34111, 'Scent Masker', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
	(34119, NULL, 34111, 'Talisman', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
	(34120, NULL, 34111, 'Broadhead Arrows', '{"Equipped": "bow"}', 'special_ammunition', NULL, 1, 'Shoot', NULL, NULL, NULL, NULL),
	(34121, NULL, 34111, 'Bodkin Arrows', '{"Equipped": "bow"}', 'special_ammunition', NULL, 1, 'Shoot', NULL, NULL, NULL, NULL),
	(34122, NULL, 34111, 'Lead Slingshot', '{"Equipped": "sling"}', 'special_ammunition', NULL, 1, 'Shoot', NULL, NULL, NULL, NULL),
	(34123, NULL, 34111, 'Superior Black Powder', '{"Equipped": "black_powder"}', 'special_ammunition', NULL, 1, 'Shoot', NULL, NULL, NULL, NULL),
	(34124, NULL, 34002, 'Very Heavy Armour', NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL),
	(34125, NULL, 34002, 'Buckler', NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
	(34126, NULL, 34002, 'Light Shield', NULL, 'shield', NULL, 12, NULL, NULL, NULL, NULL, NULL),
	(34127, NULL, 34002, 'Heavy Shield', NULL, 'shield', NULL, 20, NULL, NULL, NULL, NULL, NULL),
	(34128, NULL, 34005, 'Polearm', NULL, 'polearm', NULL, 15, 'Strike', NULL, NULL, NULL, NULL),
	(34129, NULL, 34005, 'Spear', NULL, 'spear', NULL, 15, 'Strike', NULL, NULL, NULL, NULL),
	(34130, NULL, 34005, 'Bow', NULL, 'bow', NULL, 15, 'Shoot', NULL, NULL, NULL, NULL),
	(34131, NULL, 34005, 'Crossbow', NULL, NULL, NULL, 20, 'Shoot', NULL, NULL, NULL, NULL),
	(34132, NULL, 34015, 'Sling', NULL, 'sling', NULL, 5, 'Shoot', NULL, NULL, NULL, NULL),
	(34133, NULL, 34015, 'Throwing Knives', NULL, NULL, NULL, 8, 'Shoot', NULL, NULL, NULL, NULL),
	(34134, NULL, 34015, 'Pistols', NULL, 'black_powder', NULL, 15, 'Shoot', NULL, NULL, NULL, NULL),
	(34135, NULL, 34015, 'Caliver', NULL, 'black_powder', NULL, 20, 'Shoot', NULL, NULL, NULL, NULL),
	(34136, NULL, 34015, 'Blunderbuss', NULL, 'black_powder', NULL, 20, 'Shoot', NULL, NULL, NULL, NULL),
	(34999, NULL, NULL, 'Assets', NULL, 'lost_asset', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35000, NULL, 34999, 'Badge Assets', NULL, 'badge_assets', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35001, NULL, 35000, 'Top Left', NULL, 'top_left', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35002, NULL, 35000, 'Top Right', NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35003, NULL, 35000, 'Bottom Left', NULL, 'bottom_left', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35004, NULL, 35000, 'Bottom Right', NULL, 'bottom_right', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36000, NULL, NULL, 'Skills', NULL, 'skill', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36001, NULL, 36000, 'Killing Blow', '{"Rule": "This character has patience and knows exactly when to put all their energy into one devastinag strike. Once per game this character may add +7 to a strike Roll-Off."}', '', NULL, NULL, 'Strike', '+7', NULL, '1', NULL),
	(36002, NULL, 36000, 'Parry', '{"Rule": "Timing a response to enemy strikes perfectly, this Skill allows the character to block and misdirect their attacks easily. The character may add +2 to any block Roll-Offs."}', '', NULL, NULL, 'Block', '+2', NULL, NULL, NULL),
	(36003, NULL, 36000, 'Flight', '{"Rule": "The character may move by flying, and can Move 12 rather than using their Move statistic when they do. They ignore all difficult terrain, and may pass directly over any models or terrain in their path. They may not use Weapons or Shields or Strike or Block for the rest of the turn if they choose to fly by may attack unarmed. The charaecer cannot fly while carrying any scenario specific items, such as treasure counters or a pay-chest. A character may not Fly if wearining Very Heavy Armour, or carrying a heavy sheild"}', '', NULL, NULL, 'Move', '12"', NULL, NULL, NULL),
	(36004, NULL, 36000, 'Delicate (-2)', '{"Rule": "Timing a response to enemy strikes perfectly, this Skill allows the character to block and misdirect their attacks easily. The character may add +2 to any block Roll-Offs."}', '', NULL, NULL, 'Block', '+2', NULL, NULL, NULL),
	(36005, NULL, 36000, 'Unarmed Fighter', '{"Rule": "Timing a response to enemy strikes perfectly, this Skill allows the character to block and misdirect their attacks easily. The character may add +2 to any block Roll-Offs."}', '', NULL, NULL, 'Block', '+2', NULL, NULL, NULL),
	(36006, NULL, 36000, 'Gifted', '{"Rule": "Timing a response to enemy strikes perfectly, this Skill allows the character to block and misdirect their attacks easily. The character may add +2 to any block Roll-Offs."}', '', NULL, NULL, 'Block', '+2', NULL, NULL, NULL);
/*!40000 ALTER TABLE `aah_item` ENABLE KEYS */;

-- Dumping structure for table burrow.aah_roster
CREATE TABLE IF NOT EXISTS `aah_roster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mini_id` int(11) DEFAULT NULL,
  `aah_creature_id` int(11) DEFAULT NULL,
  `aah_warband_id` int(11) DEFAULT NULL,
  `weapon_one_id` int(11) DEFAULT NULL,
  `weapon_two_id` int(11) DEFAULT NULL,
  `armour_one_id` int(11) DEFAULT NULL,
  `armour_two_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `special_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `leader` tinyint(1) DEFAULT NULL,
  `second` tinyint(1) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `mage` tinyint(1) DEFAULT NULL,
  `spells` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `ingredients` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_915FBCD5A1DAC14E` (`mini_id`),
  KEY `IDX_915FBCD543C63E59` (`aah_creature_id`),
  KEY `IDX_915FBCD5B32B8ED5` (`aah_warband_id`),
  KEY `IDX_915FBCD5C66FE134` (`weapon_one_id`),
  KEY `IDX_915FBCD5AD3306FB` (`weapon_two_id`),
  KEY `IDX_915FBCD564483869` (`armour_one_id`),
  KEY `IDX_915FBCD5F14DFA6` (`armour_two_id`),
  KEY `IDX_915FBCD5126F525E` (`item_id`),
  KEY `IDX_915FBCD54F5B3969` (`special_id`),
  CONSTRAINT `FK_915FBCD5126F525E` FOREIGN KEY (`item_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_915FBCD543C63E59` FOREIGN KEY (`aah_creature_id`) REFERENCES `aah_creature` (`id`),
  CONSTRAINT `FK_915FBCD54F5B3969` FOREIGN KEY (`special_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_915FBCD564483869` FOREIGN KEY (`armour_one_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_915FBCD5A1DAC14E` FOREIGN KEY (`mini_id`) REFERENCES `lost_mini` (`id`),
  CONSTRAINT `FK_915FBCD5AD3306FB` FOREIGN KEY (`weapon_two_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_915FBCD5B32B8ED5` FOREIGN KEY (`aah_warband_id`) REFERENCES `aah_warband` (`id`),
  CONSTRAINT `FK_915FBCD5C66FE134` FOREIGN KEY (`weapon_one_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_915FBCD5F14DFA6` FOREIGN KEY (`armour_two_id`) REFERENCES `aah_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.aah_roster: ~6 rows (approximately)
/*!40000 ALTER TABLE `aah_roster` DISABLE KEYS */;
INSERT INTO `aah_roster` (`id`, `mini_id`, `aah_creature_id`, `aah_warband_id`, `weapon_one_id`, `weapon_two_id`, `armour_one_id`, `armour_two_id`, `item_id`, `special_id`, `name`, `skills`, `leader`, `second`, `rating`, `mage`, `spells`, `ingredients`) VALUES
	(12, 8, 1, 1, 34007, 34130, 34125, 34006, 34114, 34112, 'Gromley The Mouse Burgler', '[36001, 36002]', NULL, NULL, 1, NULL, NULL, NULL),
	(18, 6, 4, 1, 34130, 34130, 34125, 34006, 34112, 34121, 'Batty BigBeat', NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(32, 9, 1, 2, 34003, 34003, 34125, 34006, 34114, 34112, 'Mouseketeer', '[36001, 36002]', NULL, NULL, 1, NULL, NULL, NULL),
	(38, 14, 4, 2, 34130, 34130, 34125, 34006, 34112, 34121, 'Shrew Shopper', NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(39, 5, 4, 2, 34130, 34130, 34125, 34006, 34112, 34121, 'Kingfisher', NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(40, 4, 4, 2, 34130, 34130, 34125, 34006, 34112, 34121, 'Sparrow', NULL, NULL, NULL, 1, NULL, NULL, NULL);
/*!40000 ALTER TABLE `aah_roster` ENABLE KEYS */;

-- Dumping structure for table burrow.aah_warband
CREATE TABLE IF NOT EXISTS `aah_warband` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allegiance_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pennies` int(11) DEFAULT NULL,
  `den_id` int(11) DEFAULT NULL,
  `labour_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `notes` varchar(6255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stylesheet` varchar(6255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AFABA98E3FBAC713` (`allegiance_id`),
  KEY `IDX_AFABA98E318C88C0` (`den_id`),
  KEY `IDX_AFABA98ECC903DF2` (`labour_id`),
  CONSTRAINT `FK_AFABA98E318C88C0` FOREIGN KEY (`den_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_AFABA98E3FBAC713` FOREIGN KEY (`allegiance_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_AFABA98ECC903DF2` FOREIGN KEY (`labour_id`) REFERENCES `aah_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.aah_warband: ~3 rows (approximately)
/*!40000 ALTER TABLE `aah_warband` DISABLE KEYS */;
INSERT INTO `aah_warband` (`id`, `allegiance_id`, `name`, `pennies`, `den_id`, `labour_id`, `rating`, `notes`, `stylesheet`) VALUES
	(1, 34008, 'Brambly Bodgers', 222, 34016, NULL, 456, 'The fastest in all Northumbrya', '#2a6da7'),
	(2, 34013, 'Zaks Troupe', 898, 34010, NULL, 4, NULL, '#9e4646'),
	(3, 34014, 'spae marines', 1000, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `aah_warband` ENABLE KEYS */;

-- Dumping structure for table burrow.battle_round
CREATE TABLE IF NOT EXISTS `battle_round` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `turn` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` int(11) DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `actions` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `design_notes` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_DCD5BB86E48FD905` (`game_id`),
  KEY `IDX_DCD5BB86F8BD700D` (`unit_id`),
  CONSTRAINT `FK_DCD5BB86E48FD905` FOREIGN KEY (`game_id`) REFERENCES `aah_game` (`id`),
  CONSTRAINT `FK_DCD5BB86F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `aah_roster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.battle_round: ~0 rows (approximately)
/*!40000 ALTER TABLE `battle_round` DISABLE KEYS */;
/*!40000 ALTER TABLE `battle_round` ENABLE KEYS */;

-- Dumping structure for table burrow.dashboard
CREATE TABLE IF NOT EXISTS `dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5C94FFF87E3C61F9` (`owner_id`),
  CONSTRAINT `FK_5C94FFF87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.dashboard: ~0 rows (approximately)
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;

-- Dumping structure for table burrow.dashboard_item
CREATE TABLE IF NOT EXISTS `dashboard_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_id` int(11) DEFAULT NULL,
  `dashboard_widget_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_by_default` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `no_panel_style` tinyint(1) DEFAULT NULL,
  `ordered` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_86B4A1CB9D04D2B` (`dashboard_id`),
  KEY `IDX_86B4A1CB31FDD11` (`dashboard_widget_id`),
  CONSTRAINT `FK_86B4A1CB31FDD11` FOREIGN KEY (`dashboard_widget_id`) REFERENCES `dashboard_widget` (`id`),
  CONSTRAINT `FK_86B4A1CB9D04D2B` FOREIGN KEY (`dashboard_id`) REFERENCES `dashboard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.dashboard_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `dashboard_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_item` ENABLE KEYS */;

-- Dumping structure for table burrow.dashboard_widget
CREATE TABLE IF NOT EXISTS `dashboard_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directive` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utility` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grouping` int(11) DEFAULT NULL,
  `thumbnail_url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.dashboard_widget: ~0 rows (approximately)
/*!40000 ALTER TABLE `dashboard_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget` ENABLE KEYS */;

-- Dumping structure for table burrow.doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table burrow.doctrine_migration_versions: ~25 rows (approximately)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20221025115655', '2022-10-25 11:57:04', 3799),
	('DoctrineMigrations\\Version20221025122041', '2022-10-25 12:20:52', 96),
	('DoctrineMigrations\\Version20221103180146', '2022-11-03 18:01:54', 260),
	('DoctrineMigrations\\Version20221103230319', '2022-11-03 23:03:26', 144),
	('DoctrineMigrations\\Version20221104001316', '2022-11-04 00:13:44', 365),
	('DoctrineMigrations\\Version20221104123950', '2022-11-04 12:40:45', 130),
	('DoctrineMigrations\\Version20221104133859', '2022-11-04 13:39:13', 374),
	('DoctrineMigrations\\Version20221107194349', '2022-11-07 19:44:30', 150),
	('DoctrineMigrations\\Version20221107195126', '2022-11-07 19:51:31', 209),
	('DoctrineMigrations\\Version20221108155844', '2022-11-08 16:00:17', 342),
	('DoctrineMigrations\\Version20221108161236', '2022-11-08 16:12:43', 91),
	('DoctrineMigrations\\Version20221108162934', '2022-11-08 16:29:38', 236),
	('DoctrineMigrations\\Version20221108165045', '2022-11-08 16:50:59', 82),
	('DoctrineMigrations\\Version20221108185126', '2022-11-08 18:51:33', 123),
	('DoctrineMigrations\\Version20221108202842', '2022-11-08 20:28:50', 163),
	('DoctrineMigrations\\Version20221115171902', '2022-11-15 17:19:13', 507),
	('DoctrineMigrations\\Version20221116003607', '2022-11-16 00:36:14', 373),
	('DoctrineMigrations\\Version20221116004919', '2022-11-16 00:49:28', 78),
	('DoctrineMigrations\\Version20221116205827', '2022-11-16 20:58:34', 121),
	('DoctrineMigrations\\Version20230212035640', '2023-02-12 03:57:02', 125),
	('DoctrineMigrations\\Version20230212044957', '2023-02-12 04:53:33', 86),
	('DoctrineMigrations\\Version20230212045336', '2023-02-12 04:53:40', 84),
	('DoctrineMigrations\\Version20230212051914', '2023-02-12 05:19:19', 93),
	('DoctrineMigrations\\Version20230212191255', '2023-02-12 19:13:02', 165),
	('DoctrineMigrations\\Version20230301211812', '2023-03-01 21:18:30', 263);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_asset
CREATE TABLE IF NOT EXISTS `lost_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `design_tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `mini_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `design_notes` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `grouping_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A826B7D593CB796C` (`file_id`),
  KEY `IDX_A826B7D57E3C61F9` (`owner_id`),
  KEY `IDX_A826B7D5A1DAC14E` (`mini_id`),
  KEY `IDX_A826B7D55DDE227E` (`grouping_id`),
  KEY `IDX_A826B7D5126F525E` (`item_id`),
  CONSTRAINT `FK_A826B7D5126F525E` FOREIGN KEY (`item_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_A826B7D55DDE227E` FOREIGN KEY (`grouping_id`) REFERENCES `aah_item` (`id`),
  CONSTRAINT `FK_A826B7D57E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_A826B7D593CB796C` FOREIGN KEY (`file_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_A826B7D5A1DAC14E` FOREIGN KEY (`mini_id`) REFERENCES `lost_mini` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_asset: ~2 rows (approximately)
/*!40000 ALTER TABLE `lost_asset` DISABLE KEYS */;
INSERT INTO `lost_asset` (`id`, `design_tag`, `description`, `tags`, `file_id`, `owner_id`, `item_id`, `mini_id`, `name`, `design_notes`, `grouping_id`) VALUES
	(1, NULL, NULL, NULL, 16, 3, NULL, NULL, 'a', NULL, NULL),
	(2, NULL, NULL, NULL, 17, 321, NULL, NULL, 'b', NULL, NULL);
/*!40000 ALTER TABLE `lost_asset` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_avatar
CREATE TABLE IF NOT EXISTS `lost_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `background_id` int(11) DEFAULT NULL,
  `skin_id` int(11) DEFAULT NULL,
  `hair_id` int(11) DEFAULT NULL,
  `outfit_id` int(11) DEFAULT NULL,
  `bling_id` int(11) DEFAULT NULL,
  `use_image` tinyint(1) DEFAULT NULL,
  `pronouns` varchar(2555) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` varchar(2555) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_82B9C0467E3C61F9` (`owner_id`),
  KEY `IDX_82B9C046C93D69EA` (`background_id`),
  KEY `IDX_82B9C046F404637F` (`skin_id`),
  KEY `IDX_82B9C0462A89600A` (`hair_id`),
  KEY `IDX_82B9C046AE96E385` (`outfit_id`),
  KEY `IDX_82B9C0468DF21A18` (`bling_id`),
  CONSTRAINT `FK_82B9C0462A89600A` FOREIGN KEY (`hair_id`) REFERENCES `lost_asset` (`id`),
  CONSTRAINT `FK_82B9C0467E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_82B9C0468DF21A18` FOREIGN KEY (`bling_id`) REFERENCES `lost_asset` (`id`),
  CONSTRAINT `FK_82B9C046AE96E385` FOREIGN KEY (`outfit_id`) REFERENCES `lost_asset` (`id`),
  CONSTRAINT `FK_82B9C046C93D69EA` FOREIGN KEY (`background_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_82B9C046F404637F` FOREIGN KEY (`skin_id`) REFERENCES `lost_asset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_avatar: ~1 rows (approximately)
/*!40000 ALTER TABLE `lost_avatar` DISABLE KEYS */;
INSERT INTO `lost_avatar` (`id`, `owner_id`, `background_id`, `skin_id`, `hair_id`, `outfit_id`, `bling_id`, `use_image`, `pronouns`, `meta`) VALUES
	(1, 3, 17, NULL, NULL, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `lost_avatar` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_company
CREATE TABLE IF NOT EXISTS `lost_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `big_logo_id` int(11) DEFAULT NULL,
  `small_logo_id` int(11) DEFAULT NULL,
  `background_image_id` int(11) DEFAULT NULL,
  `button_color_id` int(11) DEFAULT NULL,
  `brochure_id` int(11) DEFAULT NULL,
  `companyname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `header_bg` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_alt_bg` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_alt_color` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_hover_bg` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_hover_color` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf_path` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_toggle` tinyint(1) DEFAULT NULL,
  `test_checkbox` tinyint(1) DEFAULT NULL,
  `active_theme` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7B451E017E3C61F9` (`owner_id`),
  KEY `IDX_7B451E019E2A779C` (`big_logo_id`),
  KEY `IDX_7B451E01B684CEC6` (`small_logo_id`),
  KEY `IDX_7B451E01E6DA28AA` (`background_image_id`),
  KEY `IDX_7B451E01B0B79E62` (`button_color_id`),
  KEY `IDX_7B451E01B96114D1` (`brochure_id`),
  CONSTRAINT `FK_7B451E017E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_7B451E019E2A779C` FOREIGN KEY (`big_logo_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_7B451E01B0B79E62` FOREIGN KEY (`button_color_id`) REFERENCES `lost_mini` (`id`),
  CONSTRAINT `FK_7B451E01B684CEC6` FOREIGN KEY (`small_logo_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_7B451E01B96114D1` FOREIGN KEY (`brochure_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_7B451E01E6DA28AA` FOREIGN KEY (`background_image_id`) REFERENCES `lost_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_company: ~0 rows (approximately)
/*!40000 ALTER TABLE `lost_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `lost_company` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_company_lost_file
CREATE TABLE IF NOT EXISTS `lost_company_lost_file` (
  `lost_company_id` int(11) NOT NULL,
  `lost_file_id` int(11) NOT NULL,
  PRIMARY KEY (`lost_company_id`,`lost_file_id`),
  KEY `IDX_4670FBE6B57425BC` (`lost_company_id`),
  KEY `IDX_4670FBE6A7316E22` (`lost_file_id`),
  CONSTRAINT `FK_4670FBE6A7316E22` FOREIGN KEY (`lost_file_id`) REFERENCES `lost_file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4670FBE6B57425BC` FOREIGN KEY (`lost_company_id`) REFERENCES `lost_company` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_company_lost_file: ~0 rows (approximately)
/*!40000 ALTER TABLE `lost_company_lost_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `lost_company_lost_file` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_file
CREATE TABLE IF NOT EXISTS `lost_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F3EE07E7E3C61F9` (`owner_id`),
  CONSTRAINT `FK_F3EE07E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_file: ~31 rows (approximately)
/*!40000 ALTER TABLE `lost_file` DISABLE KEYS */;
INSERT INTO `lost_file` (`id`, `owner_id`, `name`, `original_name`, `url`, `folder`, `alt`, `type`, `access`) VALUES
	(1, 321, '6364040405a53.png', 'logo.png', NULL, 'filestore/', '6364040405a53.png', 'png', '["lostMini"]'),
	(2, 321, '6364308ce3cc3.png', 'sparrow-warrior.png', NULL, 'filestore/', '6364308ce3cc3.png', 'png', '["lostMini"]'),
	(3, 321, '636430ab76a2f.png', 'kingfisher-warrior.png', NULL, 'filestore/', '636430ab76a2f.png', 'png', '["lostMini"]'),
	(4, 321, '636430c97bf54.png', 'noctual-bat-necromancer.png', NULL, 'filestore/', '636430c97bf54.png', 'png', '["lostMini"]'),
	(5, 321, '636430e188c85.png', 'notual-bat-sassin.png', NULL, 'filestore/', '636430e188c85.png', 'png', '["lostMini"]'),
	(6, 321, '636431058759b.png', 'gromley-the-mouse-burgler.png', NULL, 'filestore/', '636431058759b.png', 'png', '["lostMini"]'),
	(7, 321, '6364311b52ae1.png', 'mouseketeer.png', NULL, 'filestore/', '6364311b52ae1.png', 'png', '["lostMini"]'),
	(8, 321, '636431322c31d.png', 'mouse-knight.png', NULL, 'filestore/', '636431322c31d.png', 'png', '["lostMini"]'),
	(9, 321, '6364314a36d6e.png', 'mouse-witch-hunter.png', NULL, 'filestore/', '6364314a36d6e.png', 'png', '["lostMini"]'),
	(10, 321, '63643164551dc.png', 'shrew-baker.png', NULL, 'filestore/', '63643164551dc.png', 'png', '["lostMini"]'),
	(11, 321, '6364317a72c07.png', 'shrew-heroine.png', NULL, 'filestore/', '6364317a72c07.png', 'png', '["lostMini"]'),
	(12, 321, '6364318fe3ec7.png', 'shrew-matron.png', NULL, 'filestore/', '6364318fe3ec7.png', 'png', '["lostMini"]'),
	(13, 321, '636431ac9c30a.png', 'shrew-pirate.png', NULL, 'filestore/', '636431ac9c30a.png', 'png', '["lostMini"]'),
	(14, 321, '636431b9e669d.png', 'shrew-watchbeast.png', NULL, 'filestore/', '636431b9e669d.png', 'png', '["lostMini"]'),
	(15, 321, '636431ca39752.png', 'shrew-zerker.png', NULL, 'filestore/', '636431ca39752.png', 'png', '["lostMini"]'),
	(16, 321, '63752f53e3265.PNG', 'slot.PNG', NULL, 'filestore/', '63752f53e3265.PNG', 'PNG', '["activityAsset"]'),
	(17, 321, '637543b678a4e.png', 'slot.png', NULL, 'filestore/', '637543b678a4e.png', 'png', '["activityAsset"]'),
	(18, 3, '6399c63d81b92.png', 'slot (3).PNG', NULL, 'filestore/', '6399c63d81b92.png', 'png', '["lostMini"]'),
	(19, 3, '6399c69da71ff.png', '2021-06-15_22-48-31.png', NULL, 'filestore/', '6399c69da71ff.png', 'png', '["lostMini"]'),
	(20, 321, '646810917bf61.png', '2023-05-20_00-34-11.png', NULL, 'filestore/', '646810917bf61.png', 'png', '["lostMini"]'),
	(21, 321, '646810dd7fdab.png', '2023-05-20_00-33-58.png', NULL, 'filestore/', '646810dd7fdab.png', 'png', '["lostMini"]'),
	(22, 321, '646810ef38fac.png', '2023-05-20_00-33-00.png', NULL, 'filestore/', '646810ef38fac.png', 'png', '["lostMini"]'),
	(23, 321, '6468110c1b500.png', '2023-05-20_00-32-19.png', NULL, 'filestore/', '6468110c1b500.png', 'png', '["lostMini"]'),
	(24, 321, '64681144e5728.png', '2023-05-20_00-32-33.png', NULL, 'filestore/', '64681144e5728.png', 'png', '["lostMini"]'),
	(25, 321, '64681153dd9e8.png', '2023-05-20_00-33-16.png', NULL, 'filestore/', '64681153dd9e8.png', 'png', '["lostMini"]'),
	(26, 321, '6468116e45991.png', '2023-05-20_00-31-47.png', NULL, 'filestore/', '6468116e45991.png', 'png', '["lostMini"]'),
	(27, 321, '64681178e6b2a.png', '2023-05-20_00-32-46.png', NULL, 'filestore/', '64681178e6b2a.png', 'png', '["lostMini"]'),
	(28, 321, '646811b42d373.png', '2023-05-20_00-33-28.png', NULL, 'filestore/', '646811b42d373.png', 'png', '["lostMini"]'),
	(29, 321, '646811c995749.png', '2023-05-20_00-33-41.png', NULL, 'filestore/', '646811c995749.png', 'png', '["lostMini"]'),
	(30, 321, '646811e51ff7a.png', '2023-05-20_00-34-23.png', NULL, 'filestore/', '646811e51ff7a.png', 'png', '["lostMini"]'),
	(31, 321, '646811f06fe2f.png', '2023-05-20_00-35-08.png', NULL, 'filestore/', '646811f06fe2f.png', 'png', '["lostMini"]');
/*!40000 ALTER TABLE `lost_file` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_invite
CREATE TABLE IF NOT EXISTS `lost_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invitee_email` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invite_code` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invited_by` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invited_on` datetime DEFAULT NULL,
  `claimed` tinyint(1) DEFAULT NULL,
  `claimed_on` datetime DEFAULT NULL,
  `design_utility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_532CA2BE4CB6F027` (`invitee_email`),
  UNIQUE KEY `UNIQ_532CA2BE6F21F112` (`invite_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_invite: ~0 rows (approximately)
/*!40000 ALTER TABLE `lost_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `lost_invite` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_mini
CREATE TABLE IF NOT EXISTS `lost_mini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mini_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `design_tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `design_notes` json DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `aah_creature_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3BF49D6A1DAC14E` (`mini_id`),
  KEY `IDX_E3BF49D63DA5256D` (`image_id`),
  KEY `IDX_E3BF49D693CB796C` (`file_id`),
  KEY `IDX_E3BF49D67E3C61F9` (`owner_id`),
  KEY `IDX_E3BF49D643C63E59` (`aah_creature_id`),
  CONSTRAINT `FK_E3BF49D63DA5256D` FOREIGN KEY (`image_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_E3BF49D643C63E59` FOREIGN KEY (`aah_creature_id`) REFERENCES `aah_creature` (`id`),
  CONSTRAINT `FK_E3BF49D67E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_E3BF49D693CB796C` FOREIGN KEY (`file_id`) REFERENCES `lost_file` (`id`),
  CONSTRAINT `FK_E3BF49D6A1DAC14E` FOREIGN KEY (`mini_id`) REFERENCES `lost_mini` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_mini: ~28 rows (approximately)
/*!40000 ALTER TABLE `lost_mini` DISABLE KEYS */;
INSERT INTO `lost_mini` (`id`, `mini_id`, `image_id`, `file_id`, `owner_id`, `name`, `tax`, `design_tag`, `design_notes`, `aah_creature_id`) VALUES
	(4, NULL, NULL, 2, 321, 'Sparrow Warrior', 'outfit', NULL, NULL, 3),
	(5, NULL, NULL, 3, 321, 'Kingfisher Warrior', 'burrows', NULL, NULL, 3),
	(6, NULL, NULL, 4, 321, 'Noctual Bat Necromancer', 'burrows', NULL, NULL, 4),
	(7, NULL, NULL, 5, 321, 'Noctual Bat-sassin', 'burrows', NULL, NULL, 4),
	(8, NULL, NULL, 6, 321, 'Gromley the Mouse Burgler', 'burrows', NULL, NULL, 1),
	(9, NULL, NULL, 7, 321, 'Mouseketeer', 'burrows', NULL, NULL, 1),
	(10, NULL, NULL, 8, 321, 'Mouse Knight', 'burrows', NULL, NULL, 1),
	(11, NULL, NULL, 9, 321, 'Mouse Witch Hunter', 'burrows', NULL, NULL, 1),
	(12, NULL, NULL, 10, 321, 'Shrew Baker', 'burrows', NULL, NULL, 2),
	(13, NULL, NULL, 11, 321, 'Shrew Heroine', 'burrows', NULL, NULL, 2),
	(14, NULL, NULL, 12, 321, 'Shrew Matron', 'burrows', NULL, NULL, 2),
	(15, NULL, NULL, 13, 321, 'Shrew Pirate', 'burrows', NULL, NULL, 2),
	(16, NULL, NULL, 14, 321, 'Shrew Watchbeast', 'burrows', NULL, NULL, 2),
	(17, NULL, NULL, 15, 321, 'Shrew-Zerker', 'burrows', NULL, NULL, 2),
	(18, NULL, NULL, 18, 3, 'Sheild', 'burrows', NULL, NULL, 3),
	(19, NULL, NULL, 19, 3, 'anything', 'burrows', NULL, NULL, 1),
	(20, NULL, NULL, 20, 321, 'Assualt Intercessor Sergeant', 'burrows', NULL, NULL, 24),
	(21, NULL, NULL, 21, 321, 'Assualt Intercessor', 'burrows', NULL, NULL, 23),
	(22, NULL, NULL, 22, 321, 'plasmacyte', 'burrows', NULL, NULL, 35),
	(23, NULL, NULL, 23, 321, 'Necron warrior Gauss Flayer', 'burrows', NULL, NULL, 32),
	(24, NULL, NULL, 24, 321, 'Necron Warrior Gauss Reaper', 'burrows', NULL, NULL, 32),
	(25, NULL, NULL, 25, 321, 'overlord', 'burrows', NULL, NULL, 31),
	(26, NULL, NULL, 26, 321, 'scarab swarm', 'burrows', NULL, NULL, 33),
	(27, NULL, NULL, 27, 321, 'skorpeckh', 'burrows', NULL, NULL, 34),
	(28, NULL, NULL, 28, 321, 'outrider 1', 'burrows', NULL, NULL, 22),
	(29, NULL, NULL, 29, 321, 'outrider 2', 'burrows', NULL, NULL, 22),
	(30, NULL, NULL, 30, 321, 'outrider sergeant', 'burrows', NULL, NULL, 21),
	(31, NULL, NULL, 31, 321, 'primaris captain', 'burrows', NULL, NULL, 25);
/*!40000 ALTER TABLE `lost_mini` ENABLE KEYS */;

-- Dumping structure for table burrow.lost_mini_lost_mini
CREATE TABLE IF NOT EXISTS `lost_mini_lost_mini` (
  `lost_mini_source` int(11) NOT NULL,
  `lost_mini_target` int(11) NOT NULL,
  PRIMARY KEY (`lost_mini_source`,`lost_mini_target`),
  KEY `IDX_B383DA1810A08438` (`lost_mini_source`),
  KEY `IDX_B383DA18945D4B7` (`lost_mini_target`),
  CONSTRAINT `FK_B383DA1810A08438` FOREIGN KEY (`lost_mini_source`) REFERENCES `lost_mini` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B383DA18945D4B7` FOREIGN KEY (`lost_mini_target`) REFERENCES `lost_mini` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.lost_mini_lost_mini: ~0 rows (approximately)
/*!40000 ALTER TABLE `lost_mini_lost_mini` DISABLE KEYS */;
/*!40000 ALTER TABLE `lost_mini_lost_mini` ENABLE KEYS */;

-- Dumping structure for table burrow.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles` json DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nicename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gdpr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table burrow.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `roles`, `password`, `email`, `nicename`, `gdpr`, `name`) VALUES
	(3, '["ROLE_SYSTEM_ADMIN", "ROLE_DASHBOARD", "ROLE_ADMIN", "ROLE_BUDGET", "ROLE_BUDGET_EDIT", "ROLE_ACTIVATION", "ROLE_ACTIVATION_EDIT", "ROLE_ACTIVITY", "ROLE_ACTIVITY_EDIT", "ROLE_REPORT", "ROLE_REPORT_RR", "ROLE_REPORT_RR_STATUS", "ROLE_REPORT_RR_TARGET", "ROLE_REPORT_SPEND"]', '$2y$13$Swi1lt.m/iIIeXl8XeCk..X8lb24cgYexlWF4aW5mb2R0R2WepARm', 'manager@binarygeometry.co.uk', 'Player 1', '1', NULL),
	(4, '["ROLE_SYSTEM_ADMIN", "ROLE_DASHBOARD", "ROLE_ADMIN", "ROLE_BUDGET", "ROLE_BUDGET_EDIT", "ROLE_ACTIVATION", "ROLE_ACTIVATION_EDIT", "ROLE_ACTIVITY", "ROLE_ACTIVITY_EDIT", "ROLE_REPORT", "ROLE_REPORT_RR", "ROLE_REPORT_RR_STATUS", "ROLE_REPORT_RR_TARGET", "ROLE_REPORT_SPEND"]', '$2y$13$Swi1lt.m/iIIeXl8XeCk..X8lb24cgYexlWF4aW5mb2R0R2WepARm', 'guest@binarygeometry.co.uk', 'Player Stu', '1', NULL),
	(321, '["ROLE_SYSTEM_ADMIN", "ROLE_DASHBOARD", "ROLE_ADMIN", "ROLE_BUDGET", "ROLE_BUDGET_EDIT", "ROLE_ACTIVATION", "ROLE_ACTIVATION_EDIT", "ROLE_ACTIVITY", "ROLE_ACTIVITY_EDIT", "ROLE_REPORT", "ROLE_REPORT_RR", "ROLE_REPORT_RR_STATUS", "ROLE_REPORT_RR_TARGET", "ROLE_REPORT_SPEND"]', '$2y$13$Swi1lt.m/iIIeXl8XeCk..X8lb24cgYexlWF4aW5mb2R0R2WepARm', 'logichaiku@gmail.com', 'System.Admin', '1', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
