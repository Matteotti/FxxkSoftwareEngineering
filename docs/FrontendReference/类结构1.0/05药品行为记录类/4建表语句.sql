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

 Date: 05/05/2024 16:15:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for drugaction
-- ----------------------------
DROP TABLE IF EXISTS `drugaction`;
CREATE TABLE `drugaction`  (
  `dano` int NOT NULL,
  `drno` int NULL DEFAULT NULL,
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dano`) USING BTREE,
  UNIQUE INDEX `drugaction_PK`(`dano` ASC) USING BTREE,
  INDEX `Relationship_2_FK`(`drno` ASC) USING BTREE,
  CONSTRAINT `FK_DRUGACTI_RELATIONS_DRUG` FOREIGN KEY (`drno`) REFERENCES `drug` (`drno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drugaction
-- ----------------------------
INSERT INTO `drugaction` VALUES (1, 2, '药品上架', '陈刚', '2024-05-03 17:26:17');
INSERT INTO `drugaction` VALUES (2, 3, '开方', '林杏', '2024-05-05 14:47:03');
INSERT INTO `drugaction` VALUES (3, 1, '购买：1', '张三', '2024-05-05 15:01:54');

SET FOREIGN_KEY_CHECKS = 1;
