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

 Date: 06/05/2024 09:28:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `apno` int NOT NULL,
  `pano` int NULL DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `deno` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `serial` int NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apno`) USING BTREE,
  UNIQUE INDEX `appointment_PK`(`apno` ASC) USING BTREE,
  INDEX `Relationship_6_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_7_FK`(`dono` ASC) USING BTREE,
  INDEX `Relationship_8_FK`(`deno` ASC) USING BTREE,
  CONSTRAINT `FK_APPOINTM_RELATIONS_DEPARTME` FOREIGN KEY (`deno`) REFERENCES `department` (`deno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_APPOINTM_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_APPOINTM_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (1, 2, '2024-05-06 13:00:00', '2024-05-06 17:00:00', 2, 1, 15, '已使用');
INSERT INTO `appointment` VALUES (2, 1, '2024-05-07 08:00:00', '2024-05-07 12:00:00', 5, 2, 10, '未使用');

SET FOREIGN_KEY_CHECKS = 1;
