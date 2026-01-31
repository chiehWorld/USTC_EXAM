/*
 Navicat Premium Dump SQL

 Source Server         : aliyun-vps-mysql
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44-0ubuntu0.24.04.2)
 Source Host           : 106.14.143.165:3306
 Source Schema         : exam_system

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44-0ubuntu0.24.04.2)
 File Encoding         : 65001

 Date: 25/12/2025 14:55:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam_history
-- ----------------------------
DROP TABLE IF EXISTS `exam_history`;
CREATE TABLE `exam_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `hid` bigint NOT NULL,
  `pid` int NOT NULL COMMENT '做题人',
  `sid` int NOT NULL COMMENT '学科',
  `size` int NOT NULL COMMENT '题目数量',
  `score` int NOT NULL COMMENT '百分制',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for question_collection
-- ----------------------------
DROP TABLE IF EXISTS `question_collection`;
CREATE TABLE `question_collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `qid` int NOT NULL,
  `type` int NOT NULL COMMENT '0=select，1=fill',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for question_fill
-- ----------------------------
DROP TABLE IF EXISTS `question_fill`;
CREATE TABLE `question_fill`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `qid` int NOT NULL,
  `sid` int NOT NULL COMMENT '科目',
  `text` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题干',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '答案',
  PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 302 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for question_history
-- ----------------------------
DROP TABLE IF EXISTS `question_history`;
CREATE TABLE `question_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `hid` bigint NOT NULL COMMENT '所属history',
  `qid` int NOT NULL,
  `type` int NOT NULL COMMENT '0=select，1=fill',
  `correct` int NOT NULL COMMENT '0=false，1=true',
  `ans_fill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ans_select` int NULL DEFAULT NULL COMMENT '答案A=1，B=2，C=3，D=4',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for question_select
-- ----------------------------
DROP TABLE IF EXISTS `question_select`;
CREATE TABLE `question_select`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `qid` int NOT NULL,
  `sid` int NOT NULL COMMENT '科目',
  `text` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题干',
  `select_a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项A',
  `select_b` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项B',
  `select_c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项C',
  `select_d` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '选项D',
  `answer` int NULL DEFAULT NULL COMMENT '答案A=1，B=2，C=3，D=4',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '科目中文名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emailaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
