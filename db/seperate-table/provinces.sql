/*
 Navicat Premium Data Transfer

 Source Server         : MySQL Local
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : excel

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 25/12/2019 11:33:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `khmer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of provinces
-- ----------------------------
BEGIN;
INSERT INTO `provinces` VALUES (1, 'ខេត្ត​', '1', 'បន្ទាយមានជ័យ', 'Banteay Meanchey', NULL, NULL);
INSERT INTO `provinces` VALUES (2, 'ខេត្ត​', '2', 'បាត់ដំបង', 'Battambang', NULL, NULL);
INSERT INTO `provinces` VALUES (3, 'ខេត្ត​', '3', 'កំពង់ចាម', 'Kampong Cham', NULL, NULL);
INSERT INTO `provinces` VALUES (4, 'ខេត្ត​', '4', 'កំពង់ឆ្នាំង', 'Kampong Chhnang', NULL, NULL);
INSERT INTO `provinces` VALUES (5, 'ខេត្ត​', '5', 'កំពង់ស្ពឺ', 'Kampong Speu', NULL, NULL);
INSERT INTO `provinces` VALUES (6, 'ខេត្ត​', '6', 'កំពង់ធំ', 'Kampong Thom', NULL, NULL);
INSERT INTO `provinces` VALUES (7, 'ខេត្ត​', '7', 'កំពត', 'Kampot', NULL, NULL);
INSERT INTO `provinces` VALUES (8, 'ខេត្ត​', '8', 'កណ្ដាល', 'Kandal', NULL, NULL);
INSERT INTO `provinces` VALUES (9, 'ខេត្ត​', '9', 'កោះកុង', 'Koh Kong', NULL, NULL);
INSERT INTO `provinces` VALUES (10, 'ខេត្ត​', '10', 'ក្រចេះ', 'Kratie', NULL, NULL);
INSERT INTO `provinces` VALUES (11, 'ខេត្ត​', '11', 'មណ្ឌលគិរី', 'Mondul Kiri', NULL, NULL);
INSERT INTO `provinces` VALUES (12, 'ខេត្ត​', '12', 'រាជធានីភ្នំពេញ', 'Phnom Penh', NULL, NULL);
INSERT INTO `provinces` VALUES (13, 'ខេត្ត​', '13', 'ព្រះវិហារ', 'Preah Vihear', NULL, NULL);
INSERT INTO `provinces` VALUES (14, 'ខេត្ត​', '14', 'ព្រៃវែង	', 'Prey Veng', NULL, NULL);
INSERT INTO `provinces` VALUES (15, 'ខេត្ត​', '15', 'ពោធិ៍សាត់	', 'Pursat', NULL, NULL);
INSERT INTO `provinces` VALUES (16, 'ខេត្ត​', '16', 'រតនគិរី	', 'Ratanak Kiri', NULL, NULL);
INSERT INTO `provinces` VALUES (17, 'ខេត្ត​', '17', 'សៀមរាប	', 'Siemreap', NULL, NULL);
INSERT INTO `provinces` VALUES (18, 'ខេត្ត​', '18', 'ព្រះសីហនុ	', 'Preah Sihanouk', NULL, NULL);
INSERT INTO `provinces` VALUES (19, 'ខេត្ត​', '19', 'ស្ទឹងត្រែង	', 'Stung Treng', NULL, NULL);
INSERT INTO `provinces` VALUES (20, 'ខេត្ត​', '20', 'ស្វាយរៀង	', 'Svay Rieng', NULL, NULL);
INSERT INTO `provinces` VALUES (21, 'ខេត្ត​', '21', 'តាកែវ	', 'Takeo', NULL, NULL);
INSERT INTO `provinces` VALUES (22, 'ខេត្ត​', '22', 'ឧត្ដរមានជ័យ	', 'Oddar Meanchey', NULL, NULL);
INSERT INTO `provinces` VALUES (23, 'ខេត្ត​', '23', 'កែប	', 'Kep', NULL, NULL);
INSERT INTO `provinces` VALUES (24, 'ខេត្ត​', '24', 'ប៉ៃលិន	', 'Pailin', NULL, NULL);
INSERT INTO `provinces` VALUES (25, 'ខេត្ត​', '25', 'ត្បូងឃ្មុំ	', 'Tboung Khmum', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
