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

 Date: 03/05/2024 23:14:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `pano` int NOT NULL,
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pano`) USING BTREE,
  UNIQUE INDEX `patient_PK`(`pano` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (1, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', '650105196304081352', '男', 61, '18844685799', '623asd@sina.com');
INSERT INTO `patient` VALUES (2, 'lisi', '84109e98c1294406c993c27af1eb4ba7', '李四', '350304198609133507', '女', 37, '13543126306', '214782@163.com');
INSERT INTO `patient` VALUES (3, 'wangwu', 'b6af3f19458ec8e6faff8ee1e0440ecb', '王五', '330105200211303758', '男', 21, '15186344479', 'adwdhu@qq.com');
INSERT INTO `patient` VALUES (4, 'chenliu', '3c086f596b4aee58e1d71b3626fefc87', '陈六', NULL, NULL, NULL, NULL, '2329467195@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
