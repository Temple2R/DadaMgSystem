/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : dadamgsystem

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-10-24 00:03:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `enumber` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `skillDirection` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `deptno` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `entryTime` datetime DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `userPhone` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifyTime` datetime DEFAULT CURRENT_TIMESTAMP ON update CURRENT_TIMESTAMP,
  `createdUser` varchar(255) DEFAULT NULL,
  `modifyUser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into user (account,password,name,position) 
		values ('彭山莉','1234','彭山莉','管理员');
-- ----------------------------
-- Records of user
-- ----------------------------
