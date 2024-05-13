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

 Date: 02/05/2024 19:50:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `deno` int NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deno`) USING BTREE,
  UNIQUE INDEX `department_PK`(`deno` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '内科', '呼吸内科');
INSERT INTO `department` VALUES (2, '内科', '消化内科');
INSERT INTO `department` VALUES (3, '外科', '普通外科');
INSERT INTO `department` VALUES (4, '外科', '神经外科');
INSERT INTO `department` VALUES (5, '妇产科', '妇科');

SET FOREIGN_KEY_CHECKS = 1;
