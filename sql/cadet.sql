/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : dadamgsystem

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-10-24 00:02:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cadet
-- ----------------------------
DROP TABLE IF EXISTS `cadet`;
CREATE TABLE `cadet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `seatNumber` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `conTeacher` varchar(255) DEFAULT NULL,
  `educational` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `isbasics` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `learningTime` datetime DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `createdUser` varchar(255) DEFAULT NULL,
  `modifyUser` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP ON update CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cadet
-- ----------------------------
