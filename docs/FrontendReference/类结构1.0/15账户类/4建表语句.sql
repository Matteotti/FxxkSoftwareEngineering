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

 Date: 07/05/2024 15:51:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `acno` int NOT NULL,
  `pano` int NULL DEFAULT NULL,
  `insurance` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `balance` double NULL DEFAULT NULL,
  PRIMARY KEY (`acno`) USING BTREE,
  UNIQUE INDEX `account_PK`(`acno` ASC) USING BTREE,
  INDEX `Relationship_15_FK`(`pano` ASC) USING BTREE,
  CONSTRAINT `FK_ACCOUNT_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 1, '有', 165.2);
INSERT INTO `account` VALUES (2, 2, '无', 0);
INSERT INTO `account` VALUES (3, 3, '有', 1020.3);

SET FOREIGN_KEY_CHECKS = 1;
