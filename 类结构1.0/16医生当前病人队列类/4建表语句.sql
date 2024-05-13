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

 Date: 07/05/2024 19:13:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dopaqueue
-- ----------------------------
DROP TABLE IF EXISTS `dopaqueue`;
CREATE TABLE `dopaqueue`  (
  `dpno` int NOT NULL,
  `dono` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `inday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dpno`) USING BTREE,
  UNIQUE INDEX `dopaqueue_PK`(`dpno` ASC) USING BTREE,
  INDEX `Relationship_16_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_DOPAQUEU_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dopaqueue
-- ----------------------------
INSERT INTO `dopaqueue` VALUES (1, 2, '2024-05-03', '下午', 'classpath:data/queue/1_2024-05-03_下午_吴伦.txt');
INSERT INTO `dopaqueue` VALUES (2, 1, '2024-05-05', '上午', 'classpath:data/queue/2_2024-05-05_上午_林杏.txt');

SET FOREIGN_KEY_CHECKS = 1;
