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

 Date: 07/05/2024 15:42:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for personnel
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel`  (
  `peno` int NOT NULL,
  `dono` int NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `betime` date NULL DEFAULT NULL,
  `letime` date NULL DEFAULT NULL,
  `describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`peno`) USING BTREE,
  UNIQUE INDEX `personnel_PK`(`peno` ASC) USING BTREE,
  INDEX `Relationship_14_FK`(`dono` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES (1, 3, '离职', '2023-11-24', '2024-04-29', '被调到北京XXX医院去了');

SET FOREIGN_KEY_CHECKS = 1;
