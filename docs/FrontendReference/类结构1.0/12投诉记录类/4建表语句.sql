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

 Date: 06/05/2024 13:49:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint`  (
  `cono` int NOT NULL,
  `pano` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `text` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cono`) USING BTREE,
  UNIQUE INDEX `complaint_PK`(`cono` ASC) USING BTREE,
  INDEX `Relationship_11_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_12_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_COMPLAIN_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COMPLAIN_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complaint
-- ----------------------------
INSERT INTO `complaint` VALUES (1, 3, 2, '态度很差！', '已处理', '已了解相关情况，并对其进行批评教育。', '2024-05-06 16:48:13');
INSERT INTO `complaint` VALUES (2, 2, 1, '态度很轻浮！', '未处理', '无', '2024-05-07 09:54:57');

SET FOREIGN_KEY_CHECKS = 1;
