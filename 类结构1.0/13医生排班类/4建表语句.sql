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

 Date: 06/05/2024 14:04:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for roster
-- ----------------------------
DROP TABLE IF EXISTS `roster`;
CREATE TABLE `roster`  (
  `rono` int NOT NULL,
  `dono` int NULL DEFAULT NULL,
  `workday` int NULL DEFAULT NULL,
  `start` time NULL DEFAULT NULL,
  `end` time NULL DEFAULT NULL,
  PRIMARY KEY (`rono`) USING BTREE,
  UNIQUE INDEX `roster_PK`(`rono` ASC) USING BTREE,
  INDEX `Relationship_13_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_ROSTER_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roster
-- ----------------------------
INSERT INTO `roster` VALUES (1, 1, 2, '13:00:00', '17:00:00');
INSERT INTO `roster` VALUES (2, 1, 4, '08:00:00', '12:00:00');
INSERT INTO `roster` VALUES (3, 2, 5, '08:00:00', '12:00:00');

SET FOREIGN_KEY_CHECKS = 1;
