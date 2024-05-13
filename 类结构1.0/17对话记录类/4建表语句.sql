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

 Date: 07/05/2024 19:18:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dialogue
-- ----------------------------
DROP TABLE IF EXISTS `dialogue`;
CREATE TABLE `dialogue`  (
  `dino` int NOT NULL,
  `pano` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dino`) USING BTREE,
  UNIQUE INDEX `dialogue_PK`(`dino` ASC) USING BTREE,
  INDEX `Relationship_17_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_18_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_DIALOGUE_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DIALOGUE_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dialogue
-- ----------------------------
INSERT INTO `dialogue` VALUES (1, 1, 3, 'classpath:data/dialog/1_林杏_王五.txt');
INSERT INTO `dialogue` VALUES (2, 2, 1, 'classpath:data/dialog/2_吴伦_张三.txt');
INSERT INTO `dialogue` VALUES (3, 1, 1, 'classpath:data/dialog/3_林杏_张三.txt');

SET FOREIGN_KEY_CHECKS = 1;
