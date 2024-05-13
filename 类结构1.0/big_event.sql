/*
 Navicat Premium Data Transfer

 Source Server         : 大作业
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : 206.237.10.247:3306
 Source Schema         : big_event

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 08/05/2024 10:45:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `acno` int NOT NULL AUTO_INCREMENT,
  `pano` int NULL DEFAULT NULL,
  `insurance` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `balance` double NULL DEFAULT NULL,
  PRIMARY KEY (`acno`) USING BTREE,
  UNIQUE INDEX `account_PK`(`acno` ASC) USING BTREE,
  INDEX `Relationship_15_FK`(`pano` ASC) USING BTREE,
  CONSTRAINT `FK_ACCOUNT_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 1, '有', 165.2);
INSERT INTO `account` VALUES (2, 2, '无', 0);
INSERT INTO `account` VALUES (3, 3, '有', 1020.3);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adno` int NOT NULL AUTO_INCREMENT,
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `post` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`adno`) USING BTREE,
  UNIQUE INDEX `admin_PK`(`adno` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'chengang', '987654', '陈刚', '293578@qq.com', '院长', '2024-05-02 19:30:36');

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `apno` int NOT NULL AUTO_INCREMENT,
  `pano` int NULL DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `deno` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `serial` int NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apno`) USING BTREE,
  UNIQUE INDEX `appointment_PK`(`apno` ASC) USING BTREE,
  INDEX `Relationship_6_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_7_FK`(`dono` ASC) USING BTREE,
  INDEX `Relationship_8_FK`(`deno` ASC) USING BTREE,
  CONSTRAINT `FK_APPOINTM_RELATIONS_DEPARTME` FOREIGN KEY (`deno`) REFERENCES `department` (`deno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_APPOINTM_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_APPOINTM_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (1, 2, '2024-05-06 13:00:00', '2024-05-06 17:00:00', 2, 1, 15, '已使用');
INSERT INTO `appointment` VALUES (2, 1, '2024-05-07 08:00:00', '2024-05-07 12:00:00', 5, 2, 10, '未使用');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `bino` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `cost` double NULL DEFAULT NULL,
  `describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `flag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bino`) USING BTREE,
  UNIQUE INDEX `bill_PK`(`bino` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1, '挂号', '专家挂号', 1, 45, '无', '是', '2024-04-30 09:48:34');
INSERT INTO `bill` VALUES (2, '检测', '血常规A项目', 1, 20.8, '无', '否', '2024-05-03 16:54:27');
INSERT INTO `bill` VALUES (3, '买药', '布洛芬缓释胶囊', 1, 15, '一盒里面开一片的剂量', '是', '2024-05-04 13:58:09');

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case`  (
  `cano` int NOT NULL AUTO_INCREMENT,
  `pano` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `dino` int NULL DEFAULT NULL,
  `binos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cano`) USING BTREE,
  UNIQUE INDEX `case_PK`(`cano` ASC) USING BTREE,
  INDEX `Relationship_19_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_20_FK`(`dono` ASC) USING BTREE,
  INDEX `Relationship_21_FK`(`dino` ASC) USING BTREE,
  CONSTRAINT `FK_CASE_RELATIONS_DIALOGUE` FOREIGN KEY (`dino`) REFERENCES `dialogue` (`dino`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CASE_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CASE_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES (1, 3, 1, '2024-04-28 08:47:58', 1, '1,2,3', '上呼吸道感染', '急性支气管炎');
INSERT INTO `case` VALUES (2, 1, 2, '2024-05-28 11:54:16', 2, '4,5,6,7', '股沟真菌感染', '股藓');

-- ----------------------------
-- Table structure for clockin
-- ----------------------------
DROP TABLE IF EXISTS `clockin`;
CREATE TABLE `clockin`  (
  `clno` int NOT NULL AUTO_INCREMENT,
  `dono` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clno`) USING BTREE,
  UNIQUE INDEX `clockin_PK`(`clno` ASC) USING BTREE,
  INDEX `Relationship_9_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_CLOCKIN_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clockin
-- ----------------------------
INSERT INTO `clockin` VALUES (1, 2, '2024-05-03 08:01:32', '上班', '迟到', '路上堵车');
INSERT INTO `clockin` VALUES (2, 1, '2024-05-04 12:56:49', '上班', '按时', '无');

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint`  (
  `cono` int NOT NULL AUTO_INCREMENT,
  `pano` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `text` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cono`) USING BTREE,
  UNIQUE INDEX `complaint_PK`(`cono` ASC) USING BTREE,
  INDEX `Relationship_11_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_12_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_COMPLAIN_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COMPLAIN_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of complaint
-- ----------------------------
INSERT INTO `complaint` VALUES (1, 3, 2, '态度很差！', '已处理', '已了解相关情况，并对其进行批评教育。', '2024-05-06 16:48:13');
INSERT INTO `complaint` VALUES (2, 2, 1, '态度很轻浮！', '未处理', '无', '2024-05-07 09:54:57');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `deno` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deno`) USING BTREE,
  UNIQUE INDEX `department_PK`(`deno` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '内科', '呼吸内科');
INSERT INTO `department` VALUES (2, '内科', '消化内科');
INSERT INTO `department` VALUES (3, '外科', '普通外科');
INSERT INTO `department` VALUES (4, '外科', '神经外科');
INSERT INTO `department` VALUES (5, '妇产科', '妇科');

-- ----------------------------
-- Table structure for dialogue
-- ----------------------------
DROP TABLE IF EXISTS `dialogue`;
CREATE TABLE `dialogue`  (
  `dino` int NOT NULL AUTO_INCREMENT,
  `pano` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dino`) USING BTREE,
  UNIQUE INDEX `dialogue_PK`(`dino` ASC) USING BTREE,
  INDEX `Relationship_17_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_18_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_DIALOGUE_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DIALOGUE_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dialogue
-- ----------------------------
INSERT INTO `dialogue` VALUES (1, 1, 3, 'classpath:data/dialog/1_林杏_王五.txt');
INSERT INTO `dialogue` VALUES (2, 2, 1, 'classpath:data/dialog/2_吴伦_张三.txt');
INSERT INTO `dialogue` VALUES (3, 1, 1, 'classpath:data/dialog/3_林杏_张三.txt');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `dono` int NOT NULL AUTO_INCREMENT,
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, 'linxing', 'e80b5017098950fc58aad83c8c14978e', '林杏', 39, '13641601576', '254896@qq.com', 2, '专家');
INSERT INTO `doctor` VALUES (2, 'wulun', '3c086f596b4aee58e1d71b3626fefc87', '吴伦', 45, '17632378404', '386912@163.com', 5, '普通');
INSERT INTO `doctor` VALUES (3, 'chenliu', 'da5283a77f874e4646ce6f449f515420', '陈六', NULL, NULL, '2329467195@qq.com', NULL, NULL);

-- ----------------------------
-- Table structure for dopaqueue
-- ----------------------------
DROP TABLE IF EXISTS `dopaqueue`;
CREATE TABLE `dopaqueue`  (
  `dpno` int NOT NULL AUTO_INCREMENT,
  `dono` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `inday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dpno`) USING BTREE,
  UNIQUE INDEX `dopaqueue_PK`(`dpno` ASC) USING BTREE,
  INDEX `Relationship_16_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_DOPAQUEU_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dopaqueue
-- ----------------------------
INSERT INTO `dopaqueue` VALUES (1, 2, '2024-05-03', '下午', 'classpath:data/queue/1_2024-05-03_下午_吴伦.txt');
INSERT INTO `dopaqueue` VALUES (2, 1, '2024-05-05', '上午', 'classpath:data/queue/2_2024-05-05_上午_林杏.txt');

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug`  (
  `drno` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `specificate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `usage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `produce` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  PRIMARY KEY (`drno`) USING BTREE,
  UNIQUE INDEX `drug_PK`(`drno` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES (1, '86902968001931', '布洛芬缓释胶囊', '非处方药', 15, '0.3g', '胶囊剂', '云鹏医药集团有限公司', '布洛芬，是一种非类固醇消炎药，常用来止痛、退烧、消炎。可用于治疗经痛、偏头痛，和类风湿性关节炎。', 100);
INSERT INTO `drug` VALUES (2, '86903662002538', '甲硝唑氯化钠注射液', '处方药', 4, '100ml:甲硝唑0.5g与氯化钠0.8g', '注射剂', '哈尔滨三联药业股份有限公司', '甲硝唑氯化钠注射液是一种抗菌药物，主要用于治疗各种厌氧菌感染，包括腹腔感染、盆腔感染、肺脓肿、脑脓肿等。', 50);
INSERT INTO `drug` VALUES (3, '86900812000017', '诺氟沙星胶囊', '处方药', 6, '0.1g', '胶囊剂', '上海延安药业有限公司', '诺氟沙星属于氟喹诺酮类抗生素，适用于敏感菌所致的成人尿路感染、淋病、前列腺炎、肠道感染和伤寒及其他沙门菌感染。', 80);

-- ----------------------------
-- Table structure for drugaction
-- ----------------------------
DROP TABLE IF EXISTS `drugaction`;
CREATE TABLE `drugaction`  (
  `dano` int NOT NULL AUTO_INCREMENT,
  `drno` int NULL DEFAULT NULL,
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dano`) USING BTREE,
  UNIQUE INDEX `drugaction_PK`(`dano` ASC) USING BTREE,
  INDEX `Relationship_2_FK`(`drno` ASC) USING BTREE,
  CONSTRAINT `FK_DRUGACTI_RELATIONS_DRUG` FOREIGN KEY (`drno`) REFERENCES `drug` (`drno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of drugaction
-- ----------------------------
INSERT INTO `drugaction` VALUES (1, 2, '药品上架', '陈刚', '2024-05-03 17:26:17');
INSERT INTO `drugaction` VALUES (2, 3, '开方', '林杏', '2024-05-05 14:47:03');
INSERT INTO `drugaction` VALUES (3, 1, '购买：1', '张三', '2024-05-05 15:01:54');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave`  (
  `leno` int NOT NULL AUTO_INCREMENT,
  `dono` int NULL DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`leno`) USING BTREE,
  UNIQUE INDEX `leave_PK`(`leno` ASC) USING BTREE,
  INDEX `Relationship_10_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_LEAVE_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES (1, 2, '2024-04-28 13:00:00', '2024-04-28 17:00:00', '事假', '家中急事', '批准');
INSERT INTO `leave` VALUES (2, 1, '2024-04-29 08:00:00', '2024-04-29 12:00:00', '病假', '感冒发烧', '未批');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `pano` int NOT NULL AUTO_INCREMENT,
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (1, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', '650105196304081352', '男', 61, '18844685799', '623asd@sina.com');
INSERT INTO `patient` VALUES (2, 'lisi', '84109e98c1294406c993c27af1eb4ba7', '李四', '350304198609133507', '女', 37, '13543126306', '214782@163.com');
INSERT INTO `patient` VALUES (3, 'wangwu', 'b6af3f19458ec8e6faff8ee1e0440ecb', '王五', '330105200211303758', '男', 21, '15186344479', 'adwdhu@qq.com');
INSERT INTO `patient` VALUES (4, 'chenliu', '3c086f596b4aee58e1d71b3626fefc87', '陈六', NULL, NULL, NULL, NULL, '2329467195@qq.com');

-- ----------------------------
-- Table structure for personnel
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel`  (
  `peno` int NOT NULL AUTO_INCREMENT,
  `dono` int NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `betime` date NULL DEFAULT NULL,
  `letime` date NULL DEFAULT NULL,
  `describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`peno`) USING BTREE,
  UNIQUE INDEX `personnel_PK`(`peno` ASC) USING BTREE,
  INDEX `Relationship_14_FK`(`dono` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES (1, 3, '离职', '2023-11-24', '2024-04-29', '被调到北京XXX医院去了');

-- ----------------------------
-- Table structure for registration
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration`  (
  `reno` int NOT NULL AUTO_INCREMENT,
  `pano` int NULL DEFAULT NULL,
  `deno` int NULL DEFAULT NULL,
  `dono` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `serial` int NULL DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reno`) USING BTREE,
  UNIQUE INDEX `registration_PK`(`reno` ASC) USING BTREE,
  INDEX `Relationship_3_FK`(`pano` ASC) USING BTREE,
  INDEX `Relationship_4_FK`(`dono` ASC) USING BTREE,
  INDEX `Relationship_5_FK`(`deno` ASC) USING BTREE,
  CONSTRAINT `FK_REGISTRA_RELATIONS_DEPARTME` FOREIGN KEY (`deno`) REFERENCES `department` (`deno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REGISTRA_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REGISTRA_RELATIONS_PATIENT` FOREIGN KEY (`pano`) REFERENCES `patient` (`pano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES (1, 3, 5, 2, '2024-05-06 08:12:01', 8, '待诊');
INSERT INTO `registration` VALUES (2, 1, 2, 1, '2024-05-06 08:37:46', 5, '就诊');

-- ----------------------------
-- Table structure for roster
-- ----------------------------
DROP TABLE IF EXISTS `roster`;
CREATE TABLE `roster`  (
  `rono` int NOT NULL AUTO_INCREMENT,
  `dono` int NULL DEFAULT NULL,
  `workday` int NULL DEFAULT NULL,
  `start` time NULL DEFAULT NULL,
  `end` time NULL DEFAULT NULL,
  PRIMARY KEY (`rono`) USING BTREE,
  UNIQUE INDEX `roster_PK`(`rono` ASC) USING BTREE,
  INDEX `Relationship_13_FK`(`dono` ASC) USING BTREE,
  CONSTRAINT `FK_ROSTER_RELATIONS_DOCTOR` FOREIGN KEY (`dono`) REFERENCES `doctor` (`dono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roster
-- ----------------------------
INSERT INTO `roster` VALUES (1, 1, 2, '13:00:00', '17:00:00');
INSERT INTO `roster` VALUES (2, 1, 4, '08:00:00', '12:00:00');
INSERT INTO `roster` VALUES (3, 2, 5, '08:00:00', '12:00:00');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `teno` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `spend` time NULL DEFAULT NULL,
  PRIMARY KEY (`teno`) USING BTREE,
  UNIQUE INDEX `test_PK`(`teno` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '血常规', '血常规A检测项目', 20.8, '00:40:00');
INSERT INTO `test` VALUES (2, '血常规', '血常规B检测项目', 40.6, '01:05:00');
INSERT INTO `test` VALUES (3, '尿常规', '尿常规A检测项目', 30.4, '00:35:00');

SET FOREIGN_KEY_CHECKS = 1;
