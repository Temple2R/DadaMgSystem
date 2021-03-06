/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : dadamgsystem

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-10-24 00:02:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for trainingcamp
-- ----------------------------
DROP TABLE IF EXISTS `trainingcamp`;
CREATE TABLE `trainingcamp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT NULL,
  `classroomNumber` int(11) DEFAULT NULL,
  `teacherName` varchar(255) DEFAULT NULL,
  `teacherPhone` varchar(255) DEFAULT NULL,
  `productLine` varchar(255) DEFAULT NULL,
  `classType` varchar(255) DEFAULT NULL,
  `cadetNumber` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP ON update CURRENT_TIMESTAMP,
  `createdUser` varchar(255) DEFAULT NULL,
  `modifyUser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trainingcamp
-- ----------------------------
