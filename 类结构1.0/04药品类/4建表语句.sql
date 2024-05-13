/*
 Navicat Premium Data Transfer

 Source Server         : JavaProject
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : big_event

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 05/05/2024 15:40:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug`  (
  `drno` int NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `specificate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `usage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `produce` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  PRIMARY KEY (`drno`) USING BTREE,
  UNIQUE INDEX `drug_PK`(`drno` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES (1, '86902968001931', '布洛芬缓释胶囊', '非处方药', 15, '0.3g', '胶囊剂', '云鹏医药集团有限公司', '布洛芬，是一种非类固醇消炎药，常用来止痛、退烧、消炎。可用于治疗经痛、偏头痛，和类风湿性关节炎。', 100);
INSERT INTO `drug` VALUES (2, '86903662002538', '甲硝唑氯化钠注射液', '处方药', 4, '100ml:甲硝唑0.5g与氯化钠0.8g', '注射剂', '哈尔滨三联药业股份有限公司', '甲硝唑氯化钠注射液是一种抗菌药物，主要用于治疗各种厌氧菌感染，包括腹腔感染、盆腔感染、肺脓肿、脑脓肿等。', 50);
INSERT INTO `drug` VALUES (3, '86900812000017', '诺氟沙星胶囊', '处方药', 6, '0.1g', '胶囊剂', '上海延安药业有限公司', '诺氟沙星属于氟喹诺酮类抗生素，适用于敏感菌所致的成人尿路感染、淋病、前列腺炎、肠道感染和伤寒及其他沙门菌感染。', 80);

SET FOREIGN_KEY_CHECKS = 1;
