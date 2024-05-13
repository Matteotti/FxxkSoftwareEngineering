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

 Date: 06/05/2024 12:19:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clockin
-- ----------------------------
DROP TABLE IF EXISTS `clockin`;
CREATE TABLE `clockin`  (
  `clno` int NOT NULL,
  `dono` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clno`) USING BTREE,
  UNIQUE INDEX `clockin_PK`(`clno` ASC) USING BTREE,
  INDEX `Relationship_9_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_CLOCKIN_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clockin
-- ----------------------------
INSERT INTO `clockin` VALUES (1, 2, '2024-05-03 08:01:32', '上班', '迟到', '路上堵车');
INSERT INTO `clockin` VALUES (2, 1, '2024-05-04 12:56:49', '上班', '按时', '无');

SET FOREIGN_KEY_CHECKS = 1;
