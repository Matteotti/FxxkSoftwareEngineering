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

 Date: 08/05/2024 10:25:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case`  (
  `cano` int NOT NULL,
  `pano` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `dino` int NULL DEFAULT NULL,
  `binos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cano`) USING BTREE,
  UNIQUE INDEX `case_PK`(`cano` ASC) USING BTREE,
  INDEX `Relationship_19_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_20_FK`(`dono` ASC) USING BTREE,
  INDEX `Relationship_21_FK`(`dino` ASC) USING BTREE,
  CONSTRAINT `FK_CASE_RELATIONS_DIALOGUE` FOREIGN KEY (`dino`) REFERENCES `dialogue` (`dino`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CASE_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CASE_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES (1, 3, 1, '2024-04-28 08:47:58', 1, '1,2,3', '上呼吸道感染', '急性支气管炎');
INSERT INTO `case` VALUES (2, 1, 2, '2024-05-28 11:54:16', 2, '4,5,6,7', '股沟真菌感染', '股藓');

SET FOREIGN_KEY_CHECKS = 1;
