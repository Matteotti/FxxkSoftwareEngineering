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

 Date: 06/05/2024 08:59:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for registration
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration`  (
  `reno` int NOT NULL,
  `pano` int NULL DEFAULT NULL,
  `deno` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `serial` int NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reno`) USING BTREE,
  UNIQUE INDEX `registration_PK`(`reno` ASC) USING BTREE,
  INDEX `Relationship_3_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_4_FK`(`dono` ASC) USING BTREE,
  INDEX `Relationship_5_FK`(`deno` ASC) USING BTREE,
  CONSTRAINT `FK_REGISTRA_RELATIONS_DEPARTME` FOREIGN KEY (`deno`) REFERENCES `department` (`deno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REGISTRA_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REGISTRA_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES (1, 3, 5, 2, '2024-05-06 08:12:01', 8, '待诊');
INSERT INTO `registration` VALUES (2, 1, 2, 1, '2024-05-06 08:37:46', 5, '就诊');

SET FOREIGN_KEY_CHECKS = 1;
