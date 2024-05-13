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

 Date: 04/05/2024 00:09:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `dono` int NOT NULL,
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deno` int NULL DEFAULT NULL,
  `expert` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dono`) USING BTREE,
  UNIQUE INDEX `doctor_PK`(`dono` ASC) USING BTREE,
  INDEX `Relationship_1_FK`(`deno` ASC) USING BTREE,
  CONSTRAINT `FK_DOCTOR_RELATIONS_DEPARTME` FOREIGN KEY (`deno`) REFERENCES `department` (`deno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, 'linxing', 'e80b5017098950fc58aad83c8c14978e', '林杏', 39, '13641601576', '254896@qq.com', 2, '专家');
INSERT INTO `doctor` VALUES (2, 'wulun', '3c086f596b4aee58e1d71b3626fefc87', '吴伦', 45, '17632378404', '386912@163.com', 5, '普通');
INSERT INTO `doctor` VALUES (3, 'chenliu', 'da5283a77f874e4646ce6f449f515420', '陈六', NULL, NULL, '2329467195@qq.com', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
