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

 Date: 25/12/2019 11:33:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for districts
-- ----------------------------
DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `khmer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` int(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of districts
-- ----------------------------
BEGIN;
INSERT INTO `districts` VALUES (1, 'ស្រុក', '102', 'មង្គលបូរី', 'Mongkol Borei', 1, NULL, NULL);
INSERT INTO `districts` VALUES (2, 'ស្រុក', '103', 'ភ្នំស្រុក', 'Phnum Srok', 1, NULL, NULL);
INSERT INTO `districts` VALUES (3, 'ស្រុក', '104', 'ព្រះនេត្រព្រះ', 'Preah Netr Preah', 1, NULL, NULL);
INSERT INTO `districts` VALUES (4, 'ស្រុក', '105', 'អូរជ្រៅ', 'Ou Chrov', 1, NULL, NULL);
INSERT INTO `districts` VALUES (5, 'ក្រុង', '106', 'សិរីសោភ័ណ', 'Serei Saophoan', 1, NULL, NULL);
INSERT INTO `districts` VALUES (6, 'ស្រុក', '107', 'ថ្មពួក', 'Thma Puok', 1, NULL, NULL);
INSERT INTO `districts` VALUES (7, 'ស្រុក', '108', 'ស្វាយចេក', 'Svay Chek', 1, NULL, NULL);
INSERT INTO `districts` VALUES (8, 'ស្រុក', '109', 'ម៉ាឡៃ', 'Malai', 1, NULL, NULL);
INSERT INTO `districts` VALUES (9, 'ក្រុង', '110', 'ប៉ោយប៉ែត', 'Paoy Paet', 1, NULL, NULL);
INSERT INTO `districts` VALUES (10, 'ស្រុក', '201', 'បាណន់', 'Banan', 2, NULL, NULL);
INSERT INTO `districts` VALUES (11, 'ស្រុក', '202', 'ថ្មគោល', 'Thma Koul', 2, NULL, NULL);
INSERT INTO `districts` VALUES (12, 'ក្រុង', '203', 'បាត់ដំបង', 'Battambang', 2, NULL, NULL);
INSERT INTO `districts` VALUES (13, 'ស្រុក', '204', 'បវេល', 'Bavel', 2, NULL, NULL);
INSERT INTO `districts` VALUES (14, 'ស្រុក', '205', 'ឯកភ្នំ', 'Aek Phnum', 2, NULL, NULL);
INSERT INTO `districts` VALUES (15, 'ស្រុក', '206', 'មោងឫស្សី', 'Moung Ruessei', 2, NULL, NULL);
INSERT INTO `districts` VALUES (16, 'ស្រុក', '207', 'រតនមណ្ឌល', 'Rotonak Mondol', 2, NULL, NULL);
INSERT INTO `districts` VALUES (17, 'ស្រុក', '208', 'សង្កែ', 'Sangkae', 2, NULL, NULL);
INSERT INTO `districts` VALUES (18, 'ស្រុក', '209', 'សំឡូត', 'Samlout', 2, NULL, NULL);
INSERT INTO `districts` VALUES (19, 'ស្រុក', '210', 'សំពៅលូន', 'Sampov Lun', 2, NULL, NULL);
INSERT INTO `districts` VALUES (20, 'ស្រុក', '211', 'ភ្នំព្រឹក', 'Phnum Proek', 2, NULL, NULL);
INSERT INTO `districts` VALUES (21, 'ស្រុក', '212', 'កំរៀង', 'Kamrieng', 2, NULL, NULL);
INSERT INTO `districts` VALUES (22, 'ស្រុក', '213', 'គាស់ក្រឡ', 'Koas Krala', 2, NULL, NULL);
INSERT INTO `districts` VALUES (23, 'ស្រុក', '214', 'រុក្ខគិរី', 'Rukh Kiri', 2, NULL, NULL);
INSERT INTO `districts` VALUES (24, 'ស្រុក', '301', 'បាធាយ', 'Batheay', 3, NULL, NULL);
INSERT INTO `districts` VALUES (25, 'ស្រុក', '302', 'ចំការលើ', 'Chamkar Leu', 3, NULL, NULL);
INSERT INTO `districts` VALUES (26, 'ស្រុក', '303', 'ជើងព្រៃ', 'Cheung Prey', 3, NULL, NULL);
INSERT INTO `districts` VALUES (27, 'ក្រុង', '305', 'កំពង់ចាម', 'Kampong Cham', 3, NULL, NULL);
INSERT INTO `districts` VALUES (28, 'ស្រុក', '306', 'កំពង់សៀម', 'Kampong Siem', 3, NULL, NULL);
INSERT INTO `districts` VALUES (29, 'ស្រុក', '307', 'កងមាស', 'Kang Meas', 3, NULL, NULL);
INSERT INTO `districts` VALUES (30, 'ស្រុក', '308', 'កោះសូទិន', 'Kaoh Soutin', 3, NULL, NULL);
INSERT INTO `districts` VALUES (31, 'ស្រុក', '313', 'ព្រៃឈរ', 'Prey Chhor', 3, NULL, NULL);
INSERT INTO `districts` VALUES (32, 'ស្រុក', '314', 'ស្រីសន្ធរ', 'Srei Santhor', 3, NULL, NULL);
INSERT INTO `districts` VALUES (33, 'ស្រុក', '315', 'ស្ទឹងត្រង់', 'Stueng Trang', 3, NULL, NULL);
INSERT INTO `districts` VALUES (34, 'ស្រុក', '401', 'បរិបូណ៌', 'Baribour', 4, NULL, NULL);
INSERT INTO `districts` VALUES (35, 'ស្រុក', '402', 'ជលគីរី', 'Chol Kiri', 4, NULL, NULL);
INSERT INTO `districts` VALUES (36, 'ក្រុង', '403', 'កំពង់ឆ្នាំង', 'Kampong Chhnang', 4, NULL, NULL);
INSERT INTO `districts` VALUES (37, 'ស្រុក', '404', 'កំពង់លែង', 'Kampong Leaeng', 4, NULL, NULL);
INSERT INTO `districts` VALUES (38, 'ស្រុក', '405', 'កំពង់ត្រឡាច', 'Kampong Tralach', 4, NULL, NULL);
INSERT INTO `districts` VALUES (39, 'ស្រុក', '406', 'រលាប្អៀរ', 'Rolea B\'ier', 4, NULL, NULL);
INSERT INTO `districts` VALUES (40, 'ស្រុក', '407', 'សាមគ្គីមានជ័យ', 'Sameakki Mean Chey', 4, NULL, NULL);
INSERT INTO `districts` VALUES (41, 'ស្រុក', '408', 'ទឹកផុស', 'Tuek Phos', 4, NULL, NULL);
INSERT INTO `districts` VALUES (42, 'ស្រុក', '501', 'បរសេដ្ឋ', 'Basedth', 5, NULL, NULL);
INSERT INTO `districts` VALUES (43, 'ក្រុង', '502', 'ច្បារមន', 'Chbar Mon', 5, NULL, NULL);
INSERT INTO `districts` VALUES (44, 'ស្រុក', '503', 'គងពិសី', 'Kong Pisei', 5, NULL, NULL);
INSERT INTO `districts` VALUES (45, 'ស្រុក', '504', 'ឱរ៉ាល់', 'Aoral', 5, NULL, NULL);
INSERT INTO `districts` VALUES (46, 'ស្រុក', '505', 'ឧដុង្គ', 'Odongk', 5, NULL, NULL);
INSERT INTO `districts` VALUES (47, 'ស្រុក', '506', 'ភ្នំស្រួច', 'Phnum Sruoch', 5, NULL, NULL);
INSERT INTO `districts` VALUES (48, 'ស្រុក', '507', 'សំរោងទង', 'Samraong Tong', 5, NULL, NULL);
INSERT INTO `districts` VALUES (49, 'ស្រុក', '508', 'ថ្ពង', 'Thpong', 5, NULL, NULL);
INSERT INTO `districts` VALUES (50, 'ស្រុក', '601', 'បារាយណ៍', 'Baray', 6, NULL, NULL);
INSERT INTO `districts` VALUES (51, 'ស្រុក', '602', 'កំពង់ស្វាយ', 'Kampong Svay', 6, NULL, NULL);
INSERT INTO `districts` VALUES (52, 'ក្រុង', '603', 'ស្ទឹងសែន', 'Stueng Saen', 6, NULL, NULL);
INSERT INTO `districts` VALUES (53, 'ស្រុក', '604', 'ប្រាសាទបល្ល័ង្គ', 'Prasat Ballangk', 6, NULL, NULL);
INSERT INTO `districts` VALUES (54, 'ស្រុក', '605', 'ប្រាសាទសំបូរ', 'Prasat Sambour', 6, NULL, NULL);
INSERT INTO `districts` VALUES (55, 'ស្រុក', '606', 'សណ្ដាន់', 'Sandan', 6, NULL, NULL);
INSERT INTO `districts` VALUES (56, 'ស្រុក', '607', 'សន្ទុក', 'Santuk', 6, NULL, NULL);
INSERT INTO `districts` VALUES (57, 'ស្រុក', '608', 'ស្ទោង', 'Stoung', 6, NULL, NULL);
INSERT INTO `districts` VALUES (58, 'ស្រុក', '609', 'តាំងគោក', 'Taing Kouk', 6, NULL, NULL);
INSERT INTO `districts` VALUES (59, 'ស្រុក', '701', 'អង្គរជ័យ', 'Angkor Chey', 7, NULL, NULL);
INSERT INTO `districts` VALUES (60, 'ស្រុក', '702', 'បន្ទាយមាស', 'Banteay Meas', 7, NULL, NULL);
INSERT INTO `districts` VALUES (61, 'ស្រុក', '703', 'ឈូក', 'Chhuk', 7, NULL, NULL);
INSERT INTO `districts` VALUES (62, 'ស្រុក', '704', 'ជុំគិរី', 'Chum Kiri', 7, NULL, NULL);
INSERT INTO `districts` VALUES (63, 'ស្រុក', '705', 'ដងទង់', 'Dang Tong', 7, NULL, NULL);
INSERT INTO `districts` VALUES (64, 'ស្រុក', '706', 'កំពង់ត្រាច', 'Kampong Trach', 7, NULL, NULL);
INSERT INTO `districts` VALUES (65, 'ស្រុក', '707', 'ទឹកឈូ', 'Tuek Chhou', 7, NULL, NULL);
INSERT INTO `districts` VALUES (66, 'ក្រុង', '708', 'កំពត', 'Kampot', 7, NULL, NULL);
INSERT INTO `districts` VALUES (67, 'ស្រុក', '801', 'កណ្ដាលស្ទឹង', 'Kandal Stueng', 8, NULL, NULL);
INSERT INTO `districts` VALUES (68, 'ស្រុក', '802', 'កៀនស្វាយ', 'Kien Svay', 8, NULL, NULL);
INSERT INTO `districts` VALUES (69, 'ស្រុក', '803', 'ខ្សាច់កណ្ដាល', 'Khsach Kandal', 8, NULL, NULL);
INSERT INTO `districts` VALUES (70, 'ស្រុក', '804', 'កោះធំ', 'Kaoh Thum', 8, NULL, NULL);
INSERT INTO `districts` VALUES (71, 'ស្រុក', '805', 'លើកដែក', 'Leuk Daek', 8, NULL, NULL);
INSERT INTO `districts` VALUES (72, 'ស្រុក', '806', 'ល្វាឯម', 'Lvea Aem', 8, NULL, NULL);
INSERT INTO `districts` VALUES (73, 'ស្រុក', '807', 'មុខកំពូល', 'Mukh Kampul', 8, NULL, NULL);
INSERT INTO `districts` VALUES (74, 'ស្រុក', '808', 'អង្គស្នួល', 'Angk Snuol', 8, NULL, NULL);
INSERT INTO `districts` VALUES (75, 'ស្រុក', '809', 'ពញាឮ', 'Ponhea Lueu', 8, NULL, NULL);
INSERT INTO `districts` VALUES (76, 'ស្រុក', '810', 'ស្អាង', 'S\'ang', 8, NULL, NULL);
INSERT INTO `districts` VALUES (77, 'ក្រុង', '811', 'តាខ្មៅ', 'Ta Khmau', 8, NULL, NULL);
INSERT INTO `districts` VALUES (78, 'ស្រុក', '901', 'បុទុមសាគរ', 'Botum Sakor', 9, NULL, NULL);
INSERT INTO `districts` VALUES (79, 'ស្រុក', '902', 'គិរីសាគរ', 'Kiri Sakor', 9, NULL, NULL);
INSERT INTO `districts` VALUES (80, 'ស្រុក', '903', 'កោះកុង', 'Kaoh Kong', 9, NULL, NULL);
INSERT INTO `districts` VALUES (81, 'ក្រុង', '904', 'ខេមរភូមិន្ទ', 'Khemara Phoumin', 9, NULL, NULL);
INSERT INTO `districts` VALUES (82, 'ស្រុក', '905', 'មណ្ឌលសីមា', 'Mondol Seima', 9, NULL, NULL);
INSERT INTO `districts` VALUES (83, 'ស្រុក', '906', 'ស្រែ អំបិល', 'Srae Ambel', 9, NULL, NULL);
INSERT INTO `districts` VALUES (84, 'ស្រុក', '907', 'ថ្មបាំង', 'Thma Bang', 9, NULL, NULL);
INSERT INTO `districts` VALUES (85, 'ស្រុក', '1001', 'ឆ្លូង', 'Chhloung', 10, NULL, NULL);
INSERT INTO `districts` VALUES (86, 'ក្រុង', '1002', 'ក្រចេះ', 'Kracheh', 10, NULL, NULL);
INSERT INTO `districts` VALUES (87, 'ស្រុក', '1003', 'ព្រែកប្រសព្វ', 'Prek Prasab', 10, NULL, NULL);
INSERT INTO `districts` VALUES (88, 'ស្រុក', '1004', 'សំបូរ', 'Sambour', 10, NULL, NULL);
INSERT INTO `districts` VALUES (89, 'ស្រុក', '1005', 'ស្នួល', 'Snuol', 10, NULL, NULL);
INSERT INTO `districts` VALUES (90, 'ស្រុក', '1006', 'ចិត្របុរី', 'Chetr Borei', 10, NULL, NULL);
INSERT INTO `districts` VALUES (91, 'ស្រុក', '1101', 'កែវសីមា', 'Kaev Seima', 11, NULL, NULL);
INSERT INTO `districts` VALUES (92, 'ស្រុក', '1102', 'កោះញែក', 'Kaoh Nheaek', 11, NULL, NULL);
INSERT INTO `districts` VALUES (93, 'ស្រុក', '1103', 'អូររាំង', 'Ou Reang', 11, NULL, NULL);
INSERT INTO `districts` VALUES (94, 'ស្រុក', '1104', 'ពេជ្រាដា', 'Pech Chreada', 11, NULL, NULL);
INSERT INTO `districts` VALUES (95, 'ក្រុង', '1105', 'សែនមនោរម្យ', 'Saen Monourom', 11, NULL, NULL);
INSERT INTO `districts` VALUES (96, 'ខណ្ឌ', '1201', 'ចំការមន', 'Chamkar Mon', 12, NULL, NULL);
INSERT INTO `districts` VALUES (97, 'ខណ្ឌ', '1202', 'ដូនពេញ', 'Doun Penh', 12, NULL, NULL);
INSERT INTO `districts` VALUES (98, 'ខណ្ឌ', '1203', '៧មករា', 'Prampir Meakkakra', 12, NULL, NULL);
INSERT INTO `districts` VALUES (99, 'ខណ្ឌ', '1204', 'ទួលគោក', 'Tuol Kouk', 12, NULL, NULL);
INSERT INTO `districts` VALUES (100, 'ខណ្ឌ', '1205', 'ដង្កោ', 'Dangkao', 12, NULL, NULL);
INSERT INTO `districts` VALUES (101, 'ខណ្ឌ', '1206', 'មានជ័យ', 'Mean Chey', 12, NULL, NULL);
INSERT INTO `districts` VALUES (102, 'ខណ្ឌ', '1207', 'ឫស្សីកែវ', 'Russey Keo', 12, NULL, NULL);
INSERT INTO `districts` VALUES (103, 'ខណ្ឌ', '1208', 'សែនសុខ', 'Saensokh', 12, NULL, NULL);
INSERT INTO `districts` VALUES (104, 'ខណ្ឌ', '1209', 'ពោធិ៍សែនជ័យ', 'Pur SenChey', 12, NULL, NULL);
INSERT INTO `districts` VALUES (105, 'ខណ្ឌ', '1210', 'ជ្រោយចង្វារ', 'Chraoy Chongvar', 12, NULL, NULL);
INSERT INTO `districts` VALUES (106, 'ខណ្ឌ', '1211', 'ព្រែកព្នៅ', 'Praek Pnov', 12, NULL, NULL);
INSERT INTO `districts` VALUES (107, 'ខណ្ឌ', '1212', 'ច្បារអំពៅ', 'Chbar Ampov', 12, NULL, NULL);
INSERT INTO `districts` VALUES (108, 'ខណ្ឌ', '1213', 'បឹងកេងកង', 'Boeng Keng Kang', 12, NULL, NULL);
INSERT INTO `districts` VALUES (109, 'ខណ្ឌ', '1214', 'កំបូល', 'Kamboul', 12, NULL, NULL);
INSERT INTO `districts` VALUES (110, 'ស្រុក', '1301', 'ជ័យសែន', 'Chey Saen', 13, NULL, NULL);
INSERT INTO `districts` VALUES (111, 'ស្រុក', '1302', 'ឆែប', 'Chhaeb', 13, NULL, NULL);
INSERT INTO `districts` VALUES (112, 'ស្រុក', '1303', 'ជាំក្សាន្ដ', 'Choam Ksant', 13, NULL, NULL);
INSERT INTO `districts` VALUES (113, 'ស្រុក', '1304', 'គូលែន', 'Kuleaen', 13, NULL, NULL);
INSERT INTO `districts` VALUES (114, 'ស្រុក', '1305', 'រវៀង', 'Rovieng', 13, NULL, NULL);
INSERT INTO `districts` VALUES (115, 'ស្រុក', '1306', 'សង្គមថ្មី', 'Sangkum Thmei', 13, NULL, NULL);
INSERT INTO `districts` VALUES (116, 'ស្រុក', '1307', 'ត្បែងមានជ័យ', 'Tbaeng Mean Chey', 13, NULL, NULL);
INSERT INTO `districts` VALUES (117, 'ក្រុង', '1308', 'ព្រះវិហារ', 'Preah Vihear', 13, NULL, NULL);
INSERT INTO `districts` VALUES (118, 'ស្រុក', '1401', 'បាភ្នំ', 'Ba Phnum', 14, NULL, NULL);
INSERT INTO `districts` VALUES (119, 'ស្រុក', '1402', 'កំចាយមារ', 'Kamchay Mear', 14, NULL, NULL);
INSERT INTO `districts` VALUES (120, 'ស្រុក', '1403', 'កំពង់ត្របែក', 'Kampong Trabaek', 14, NULL, NULL);
INSERT INTO `districts` VALUES (121, 'ស្រុក', '1404', 'កញ្ជ្រៀច', 'Kanhchriech', 14, NULL, NULL);
INSERT INTO `districts` VALUES (122, 'ស្រុក', '1405', 'មេសាង', 'Me Sang', 14, NULL, NULL);
INSERT INTO `districts` VALUES (123, 'ស្រុក', '1406', 'ពាមជរ', 'Peam Chor', 14, NULL, NULL);
INSERT INTO `districts` VALUES (124, 'ស្រុក', '1407', 'ពាមរក៍', 'Peam Ro', 14, NULL, NULL);
INSERT INTO `districts` VALUES (125, 'ស្រុក', '1408', 'ពារាំង', 'Pea Reang', 14, NULL, NULL);
INSERT INTO `districts` VALUES (126, 'ស្រុក', '1409', 'ព្រះស្ដេច', 'Preah Sdach', 14, NULL, NULL);
INSERT INTO `districts` VALUES (127, 'ក្រុង', '1410', 'ព្រៃវែង', 'Prey Veng', 14, NULL, NULL);
INSERT INTO `districts` VALUES (128, 'ស្រុក', '1411', 'ពោធិ៍រៀង', 'Pur Rieng', 14, NULL, NULL);
INSERT INTO `districts` VALUES (129, 'ស្រុក', '1412', 'ស៊ីធរកណ្ដាល', 'Sithor Kandal', 14, NULL, NULL);
INSERT INTO `districts` VALUES (130, 'ស្រុក', '1413', 'ស្វាយអន្ទរ', 'Svay Antor', 14, NULL, NULL);
INSERT INTO `districts` VALUES (131, 'ស្រុក', '1501', 'បាកាន', 'Bakan', 15, NULL, NULL);
INSERT INTO `districts` VALUES (132, 'ស្រុក', '1502', 'កណ្ដៀង', 'Kandieng', 15, NULL, NULL);
INSERT INTO `districts` VALUES (133, 'ស្រុក', '1503', 'ក្រគរ', 'Krakor', 15, NULL, NULL);
INSERT INTO `districts` VALUES (134, 'ស្រុក', '1504', 'ភ្នំក្រវ៉ាញ', 'Phnum Kravanh', 15, NULL, NULL);
INSERT INTO `districts` VALUES (135, 'ក្រុង', '1505', 'ពោធិ៍សាត់', 'Pursat', 15, NULL, NULL);
INSERT INTO `districts` VALUES (136, 'ស្រុក', '1506', 'វាលវែង', 'Veal Veaeng', 15, NULL, NULL);
INSERT INTO `districts` VALUES (137, 'ស្រុក', '1507', 'តាលោសែនជ័យ', 'Ta Lou Senchey', 15, NULL, NULL);
INSERT INTO `districts` VALUES (138, 'ស្រុក', '1601', 'អណ្ដូងមាស', 'Andoung Meas', 16, NULL, NULL);
INSERT INTO `districts` VALUES (139, 'ក្រុង', '1602', 'បានលុង', 'Ban Lung', 16, NULL, NULL);
INSERT INTO `districts` VALUES (140, 'ស្រុក', '1603', 'បរកែវ', 'Bar Kaev', 16, NULL, NULL);
INSERT INTO `districts` VALUES (141, 'ស្រុក', '1604', 'កូនមុំ', 'Koun Mom', 16, NULL, NULL);
INSERT INTO `districts` VALUES (142, 'ស្រុក', '1605', 'លំផាត់', 'Lumphat', 16, NULL, NULL);
INSERT INTO `districts` VALUES (143, 'ស្រុក', '1606', 'អូរជុំ', 'Ou Chum', 16, NULL, NULL);
INSERT INTO `districts` VALUES (144, 'ស្រុក', '1607', 'អូរយ៉ាដាវ', 'Ou Ya Dav', 16, NULL, NULL);
INSERT INTO `districts` VALUES (145, 'ស្រុក', '1608', 'តាវែង', 'Ta Veaeng', 16, NULL, NULL);
INSERT INTO `districts` VALUES (146, 'ស្រុក', '1609', 'វើនសៃ', 'Veun Sai', 16, NULL, NULL);
INSERT INTO `districts` VALUES (147, 'ស្រុក', '1701', 'អង្គរជុំ', 'Angkor Chum', 17, NULL, NULL);
INSERT INTO `districts` VALUES (148, 'ស្រុក', '1702', 'អង្គរធំ', 'Angkor Thum', 17, NULL, NULL);
INSERT INTO `districts` VALUES (149, 'ស្រុក', '1703', 'បន្ទាយស្រី', 'Banteay Srei', 17, NULL, NULL);
INSERT INTO `districts` VALUES (150, 'ស្រុក', '1704', 'ជីក្រែង', 'Chi Kraeng', 17, NULL, NULL);
INSERT INTO `districts` VALUES (151, 'ស្រុក', '1706', 'ក្រឡាញ់', 'Kralanh', 17, NULL, NULL);
INSERT INTO `districts` VALUES (152, 'ស្រុក', '1707', 'ពួក', 'Puok', 17, NULL, NULL);
INSERT INTO `districts` VALUES (153, 'ស្រុក', '1709', 'ប្រាសាទបាគង', 'Prasat Bakong', 17, NULL, NULL);
INSERT INTO `districts` VALUES (154, 'ក្រុង', '1710', 'សៀមរាប', 'Siem Reap', 17, NULL, NULL);
INSERT INTO `districts` VALUES (155, 'ស្រុក', '1711', 'សូទ្រនិគម', 'Soutr Nikom', 17, NULL, NULL);
INSERT INTO `districts` VALUES (156, 'ស្រុក', '1712', 'ស្រីស្នំ', 'Srei Snam', 17, NULL, NULL);
INSERT INTO `districts` VALUES (157, 'ស្រុក', '1713', 'ស្វាយលើ', 'Svay Leu', 17, NULL, NULL);
INSERT INTO `districts` VALUES (158, 'ស្រុក', '1714', 'វ៉ារិន', 'Varin', 17, NULL, NULL);
INSERT INTO `districts` VALUES (159, 'ក្រុង', '1801', 'ព្រះសីហនុ', 'Preah Sihanouk', 18, NULL, NULL);
INSERT INTO `districts` VALUES (160, 'ស្រុក', '1802', 'ព្រៃនប់', 'Prey Nob', 18, NULL, NULL);
INSERT INTO `districts` VALUES (161, 'ស្រុក', '1803', 'ស្ទឹងហាវ', 'Stueng Hav', 18, NULL, NULL);
INSERT INTO `districts` VALUES (162, 'ស្រុក', '1804', 'កំពង់សីលា', 'Kampong Seila', 18, NULL, NULL);
INSERT INTO `districts` VALUES (163, 'ក្រុង', '1805', 'កោះរ៉ុង', 'Kaoh Rung', 18, NULL, NULL);
INSERT INTO `districts` VALUES (164, 'ស្រុក', '1901', 'សេសាន', 'Sesan', 19, NULL, NULL);
INSERT INTO `districts` VALUES (165, 'ស្រុក', '1902', 'សៀមបូក', 'Siem Bouk', 19, NULL, NULL);
INSERT INTO `districts` VALUES (166, 'ស្រុក', '1903', 'សៀមប៉ាង', 'Siem Pang', 19, NULL, NULL);
INSERT INTO `districts` VALUES (167, 'ក្រុង', '1904', 'ស្ទឹងត្រែង', 'Stueng Traeng', 19, NULL, NULL);
INSERT INTO `districts` VALUES (168, 'ស្រុក', '1905', 'ថាឡាបរិវ៉ាត់', 'Thala Barivat', 19, NULL, NULL);
INSERT INTO `districts` VALUES (169, 'ស្រុក', '1906', 'បុរីអូរស្វាយសែនជ័យ', 'Borei Ou Svay Senchey', 19, NULL, NULL);
INSERT INTO `districts` VALUES (170, 'ស្រុក', '2001', 'ចន្ទ្រា', 'Chantrea', 20, NULL, NULL);
INSERT INTO `districts` VALUES (171, 'ស្រុក', '2002', 'កំពង់រោទិ៍', 'Kampong Rou', 20, NULL, NULL);
INSERT INTO `districts` VALUES (172, 'ស្រុក', '2003', 'រំដួល', 'Rumduol', 20, NULL, NULL);
INSERT INTO `districts` VALUES (173, 'ស្រុក', '2004', 'រមាសហែក', 'Romeas Haek', 20, NULL, NULL);
INSERT INTO `districts` VALUES (174, 'ស្រុក', '2005', 'ស្វាយជ្រំ', 'Svay Chrum', 20, NULL, NULL);
INSERT INTO `districts` VALUES (175, 'ក្រុង', '2006', 'ស្វាយរៀង', 'Svay Rieng', 20, NULL, NULL);
INSERT INTO `districts` VALUES (176, 'ស្រុក', '2007', 'ស្វាយទាប', 'Svay Teab', 20, NULL, NULL);
INSERT INTO `districts` VALUES (177, 'ក្រុង', '2008', 'បាវិត', 'Bavet', 20, NULL, NULL);
INSERT INTO `districts` VALUES (178, 'ស្រុក', '2101', 'អង្គរបូរី', 'Angkor Borei', 21, NULL, NULL);
INSERT INTO `districts` VALUES (179, 'ស្រុក', '2102', 'បាទី', 'Bati', 21, NULL, NULL);
INSERT INTO `districts` VALUES (180, 'ស្រុក', '2103', 'បូរីជលសារ', 'Borei Cholsar', 21, NULL, NULL);
INSERT INTO `districts` VALUES (181, 'ស្រុក', '2104', 'គីរីវង់', 'Kiri Vong', 21, NULL, NULL);
INSERT INTO `districts` VALUES (182, 'ស្រុក', '2105', 'កោះអណ្ដែត', 'Kaoh Andaet', 21, NULL, NULL);
INSERT INTO `districts` VALUES (183, 'ស្រុក', '2106', 'ព្រៃកប្បាស', 'Prey Kabbas', 21, NULL, NULL);
INSERT INTO `districts` VALUES (184, 'ស្រុក', '2107', 'សំរោង', 'Samraong', 21, NULL, NULL);
INSERT INTO `districts` VALUES (185, 'ក្រុង', '2108', 'ដូនកែវ', 'Doun Kaev', 21, NULL, NULL);
INSERT INTO `districts` VALUES (186, 'ស្រុក', '2109', 'ត្រាំកក់', 'Tram Kak', 21, NULL, NULL);
INSERT INTO `districts` VALUES (187, 'ស្រុក', '2110', 'ទ្រាំង', 'Treang', 21, NULL, NULL);
INSERT INTO `districts` VALUES (188, 'ស្រុក', '2201', 'អន្លង់វែង', 'Anlong Veaeng', 22, NULL, NULL);
INSERT INTO `districts` VALUES (189, 'ស្រុក', '2202', 'បន្ទាយអំពិល', 'Banteay Ampil', 22, NULL, NULL);
INSERT INTO `districts` VALUES (190, 'ស្រុក', '2203', 'ចុងកាល់', 'Chong Kal', 22, NULL, NULL);
INSERT INTO `districts` VALUES (191, 'ក្រុង', '2204', 'សំរោង', 'Samraong', 22, NULL, NULL);
INSERT INTO `districts` VALUES (192, 'ស្រុក', '2205', 'ត្រពាំងប្រាសាទ', 'Trapeang Prasat', 22, NULL, NULL);
INSERT INTO `districts` VALUES (193, 'ស្រុក', '2301', 'ដំណាក់ចង្អើរ', 'Damnak Chang\'aeur', 23, NULL, NULL);
INSERT INTO `districts` VALUES (194, 'ក្រុង', '2302', 'កែប', 'Kaeb', 23, NULL, NULL);
INSERT INTO `districts` VALUES (195, 'ក្រុង', '2401', 'ប៉ៃលិន', 'Pailin', 24, NULL, NULL);
INSERT INTO `districts` VALUES (196, 'ស្រុក', '2402', 'សាលាក្រៅ', 'Sala Krau', 24, NULL, NULL);
INSERT INTO `districts` VALUES (197, 'ស្រុក', '2501', 'តំបែរ', 'Dambae', 25, NULL, NULL);
INSERT INTO `districts` VALUES (198, 'ស្រុក', '2502', 'ក្រូចឆ្មារ', 'Krouch Chhmar', 25, NULL, NULL);
INSERT INTO `districts` VALUES (199, 'ស្រុក', '2503', 'មេមត់', 'Memot', 25, NULL, NULL);
INSERT INTO `districts` VALUES (200, 'ស្រុក', '2504', 'អូររាំងឪ', 'Ou Reang Ov', 25, NULL, NULL);
INSERT INTO `districts` VALUES (201, 'ស្រុក', '2505', 'ពញាក្រែក', 'Ponhea Kraek', 25, NULL, NULL);
INSERT INTO `districts` VALUES (202, 'ក្រុង', '2506', 'សួង', 'Suong', 25, NULL, NULL);
INSERT INTO `districts` VALUES (203, 'ស្រុក', '2507', 'ត្បូងឃ្មុំ', 'Tboung Khmum', 25, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
