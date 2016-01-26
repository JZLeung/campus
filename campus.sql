/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : campus

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-01-26 23:47:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cp_address
-- ----------------------------
DROP TABLE IF EXISTS `cp_address`;
CREATE TABLE `cp_address` (
  `AID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `province` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `postcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`AID`),
  KEY `address_UID` (`UID`),
  CONSTRAINT `address_UID` FOREIGN KEY (`UID`) REFERENCES `cp_user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_address
-- ----------------------------
INSERT INTO `cp_address` VALUES ('8', '2', '北京', '北京市', '五环到六环', '北京化工大学', '15652705896', '蒋允斌', '');
INSERT INTO `cp_address` VALUES ('10', '2', '福建', '莆田', '莆田市', '阿斯顿飞娃儿', '13232323232', '阿斯蒂芬', '');
INSERT INTO `cp_address` VALUES ('12', '2', '广东', '东莞', '东莞市', 'asdfaweqrwer', '13232323299', '阿斯顿飞犬瘟热', '');
INSERT INTO `cp_address` VALUES ('13', '2', '福建', '福州', '连江县', 'DDDDD', '13232323232', '确认', 'SDDDD');
INSERT INTO `cp_address` VALUES ('14', '2', '河南', '安阳', '安阳市', 'asdfasfa', '13232323232', 'asdfasdf', '');
INSERT INTO `cp_address` VALUES ('15', '5', '黑龙江', '大庆', '肇源县', 'fghjkopiuygfhbjnkl;p[oiuyghbjnkl;', '13232323232', 'fgjhbkopiuhjbnm', '');
INSERT INTO `cp_address` VALUES ('16', '7', '江西', '抚州', '乐安县', 'test街道1203号', '13232323232', '托尔斯泰', '100089');
INSERT INTO `cp_address` VALUES ('17', '8', '北京', '北京市', '三环到四环', '北京化工大学', '15652705896', '蒋允斌', '100000');
INSERT INTO `cp_address` VALUES ('18', '8', '广东', '中山', '中山市', '利和广场305A', '13800138000', '测试人员', '');

-- ----------------------------
-- Table structure for cp_books
-- ----------------------------
DROP TABLE IF EXISTS `cp_books`;
CREATE TABLE `cp_books` (
  `BID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `publishtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `price` float(10,2) NOT NULL,
  `summary` varchar(100) DEFAULT NULL COMMENT '该用户很懒，啥也没留下',
  `cover` varchar(100) DEFAULT NULL,
  `detail` varchar(1024) DEFAULT NULL,
  `imgurl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`BID`),
  KEY `books_UID` (`UID`),
  KEY `books_CID` (`CID`),
  CONSTRAINT `books_CID` FOREIGN KEY (`CID`) REFERENCES `cp_catalog` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_UID` FOREIGN KEY (`UID`) REFERENCES `cp_user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_books
-- ----------------------------
INSERT INTO `cp_books` VALUES ('1', '3', '11', '三体', '2016-01-17 16:54:23', '61.20', '', 'common/img/bookCover/11/1.jpg', '', '');
INSERT INTO `cp_books` VALUES ('2', '3', '11', '年少轻狂', '2016-01-17 16:54:27', '44.98', '同名电影热映', 'common/img/bookCover/11/2.jpg', null, null);
INSERT INTO `cp_books` VALUES ('3', '3', '11', '文学的遗珠', '2016-01-17 16:54:29', '55.20', '20世纪真正的《战争与和平》', 'common/img/bookCover/11/3.jpg', null, null);
INSERT INTO `cp_books` VALUES ('4', '3', '11', '我的盖世英雄', '2016-01-17 16:54:31', '66.33', '鲍鲸鲸全新力作', 'common/img/bookCover/11/4.jpg', null, null);
INSERT INTO `cp_books` VALUES ('5', '3', '11', '人类起源三部曲', '2016-01-17 16:54:35', '77.22', '美国畅销逾百万册', 'common/img/bookCover/11/5.jpg', '', null);
INSERT INTO `cp_books` VALUES ('6', '3', '13', '陪安东尼度过漫长岁月 红+橙+黄', '2016-01-17 16:54:37', '59.40', '京东特别附赠安东尼亲笔明信片，套装共3册', 'common/img/bookCover/11/5.jpg', null, null);
INSERT INTO `cp_books` VALUES ('7', '3', '13', '夜伴三庚（京东特别定制韩庚亲笔签名', '2015-12-27 23:09:11', '39.70', '韩庚首次以文字形式坦露心声，倾情告白出道十年心路历程', null, null, null);
INSERT INTO `cp_books` VALUES ('8', '3', '13', '琅琊榜（套装共3册）', '2015-12-16 23:09:14', '48.70', '胡歌、刘涛主演电视剧《琅琊榜》原著小说！随书附赠精美剧照卡册', null, null, null);
INSERT INTO `cp_books` VALUES ('9', '3', '12', '胡歌、刘涛主演电视剧《琅琊榜》原著小说！随书附赠精美剧照卡册', '2015-12-22 23:09:48', '32.80', '《寻找·苏慧廉》出版后，沈迦继续寻访调研，利用未用尽的一手材料，继续叙说与苏慧廉有关的传教士在华的', null, null, null);
INSERT INTO `cp_books` VALUES ('10', '3', '12', '四季小品', '2015-12-12 23:10:15', '33.00', '古人认识一年四季自身与天地万物的关系，有一套完整的哲学。', null, null, null);
INSERT INTO `cp_books` VALUES ('11', '3', '12', '草木缘情：中国古典文学中的植物世界', '2015-12-25 23:10:45', '82.10', '作为一位热爱中国古典文学的科学家，作者在文学与植物世界间纵横穿行。', null, null, null);
INSERT INTO `cp_books` VALUES ('12', '3', '14', '作为一位热爱中国古典文学的科学家，作者在文学与植物世界间纵横穿行。', '2015-12-24 23:11:39', '21.90', '中国历史上第一位太后 七国争雄的战国时代最厉害的女人', null, null, null);
INSERT INTO `cp_books` VALUES ('13', '3', '14', '下一站，总统：希拉里传', '2015-12-27 23:12:55', '25.00', '她总是愿意挑战自己，年逾60岁的她会第二次宣布： “我正式参加总统竞选，我将踏上旅途……”', null, null, null);
INSERT INTO `cp_books` VALUES ('14', '3', '14', '刘晓庆：人生不怕从头再来', '2015-12-27 23:12:59', '27.90', '刘晓庆随机亲笔签名本！刘晓庆从“亿万富姐儿”到锒铛入狱变身“千万负婆”，直至东山再起的奋斗史', null, null, null);
INSERT INTO `cp_books` VALUES ('15', '3', '15', '时间会把我们变成喜欢的样子', '2015-12-18 23:13:29', '27.40', '随书附赠京东定制精美填色卡。自媒体时代原创人气漫画家丁一晨第一部遐想故事集，全书全新创作，纯手绘涂', null, null, null);
INSERT INTO `cp_books` VALUES ('17', '3', '15', '尾文字鱼（京东特别版）', '2015-12-21 23:13:58', '28.90', '冷幽默漫画作者伍肆精心呈献：超过8200万人次阅读过的“心灵鱼汤”！特别附赠伍肆亲绘呆萌鱼形书签两个！', null, null, null);
INSERT INTO `cp_books` VALUES ('39', '7', '47', 'NodeJS权威指南', '2016-01-24 16:47:51', '91.00', 'NodeJS权威指南', 'upload/1453625269640.jpg', 'NodeJS权威指南：国内大神编写', null);

-- ----------------------------
-- Table structure for cp_catalog
-- ----------------------------
DROP TABLE IF EXISTS `cp_catalog`;
CREATE TABLE `cp_catalog` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `CID` (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_catalog
-- ----------------------------
INSERT INTO `cp_catalog` VALUES ('1', '文学馆', '0');
INSERT INTO `cp_catalog` VALUES ('3', '教育', '0');
INSERT INTO `cp_catalog` VALUES ('7', '生活', '0');
INSERT INTO `cp_catalog` VALUES ('8', '艺术', '0');
INSERT INTO `cp_catalog` VALUES ('9', '科技', '0');
INSERT INTO `cp_catalog` VALUES ('10', '计算机与互联网', '0');
INSERT INTO `cp_catalog` VALUES ('11', '小说', '1');
INSERT INTO `cp_catalog` VALUES ('12', '文学', '1');
INSERT INTO `cp_catalog` VALUES ('13', '青春', '1');
INSERT INTO `cp_catalog` VALUES ('14', '传记', '1');
INSERT INTO `cp_catalog` VALUES ('15', '动漫', '1');
INSERT INTO `cp_catalog` VALUES ('23', '中小学教辅', '3');
INSERT INTO `cp_catalog` VALUES ('24', '教材', '3');
INSERT INTO `cp_catalog` VALUES ('25', '外语', '3');
INSERT INTO `cp_catalog` VALUES ('26', '考试', '3');
INSERT INTO `cp_catalog` VALUES ('31', '家教', '7');
INSERT INTO `cp_catalog` VALUES ('32', '健身保健', '7');
INSERT INTO `cp_catalog` VALUES ('33', '旅游', '7');
INSERT INTO `cp_catalog` VALUES ('34', '美食', '7');
INSERT INTO `cp_catalog` VALUES ('35', '家具', '7');
INSERT INTO `cp_catalog` VALUES ('36', '美妆', '7');
INSERT INTO `cp_catalog` VALUES ('37', '两性', '7');
INSERT INTO `cp_catalog` VALUES ('38', '手工IDY', '7');
INSERT INTO `cp_catalog` VALUES ('39', '摄影', '8');
INSERT INTO `cp_catalog` VALUES ('40', '设计', '8');
INSERT INTO `cp_catalog` VALUES ('41', '绘画', '8');
INSERT INTO `cp_catalog` VALUES ('42', '连环画', '8');
INSERT INTO `cp_catalog` VALUES ('43', '科普读物', '9');
INSERT INTO `cp_catalog` VALUES ('44', '工业技术', '9');
INSERT INTO `cp_catalog` VALUES ('45', '医学健康', '9');
INSERT INTO `cp_catalog` VALUES ('46', '建筑设计', '9');
INSERT INTO `cp_catalog` VALUES ('47', '编程语言', '10');
INSERT INTO `cp_catalog` VALUES ('48', '办公软件', '10');
INSERT INTO `cp_catalog` VALUES ('49', '图形图像', '10');
INSERT INTO `cp_catalog` VALUES ('50', '网络通信', '10');
INSERT INTO `cp_catalog` VALUES ('51', '数据库', '10');
INSERT INTO `cp_catalog` VALUES ('52', '操作系统', '10');

-- ----------------------------
-- Table structure for cp_comments
-- ----------------------------
DROP TABLE IF EXISTS `cp_comments`;
CREATE TABLE `cp_comments` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CID`),
  KEY `comment_UID` (`UID`),
  KEY `comment_BID` (`BID`),
  CONSTRAINT `comment_BID` FOREIGN KEY (`BID`) REFERENCES `cp_books` (`BID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_UID` FOREIGN KEY (`UID`) REFERENCES `cp_user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_comments
-- ----------------------------

-- ----------------------------
-- Table structure for cp_hotsell
-- ----------------------------
DROP TABLE IF EXISTS `cp_hotsell`;
CREATE TABLE `cp_hotsell` (
  `BID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`BID`),
  CONSTRAINT `cp_hotsell_ibfk_1` FOREIGN KEY (`BID`) REFERENCES `cp_books` (`BID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_hotsell
-- ----------------------------

-- ----------------------------
-- Table structure for cp_orders
-- ----------------------------
DROP TABLE IF EXISTS `cp_orders`;
CREATE TABLE `cp_orders` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `UID1` int(11) NOT NULL,
  `UID2` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `amount` float NOT NULL,
  `statue` int(11) NOT NULL,
  `AID` int(11) NOT NULL,
  `senderadd` varchar(200) DEFAULT NULL,
  `expressnum` varchar(20) DEFAULT NULL,
  `express` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`OID`),
  KEY `order_BID` (`BID`),
  KEY `order_UID1` (`UID1`),
  KEY `order_UID2` (`UID2`),
  CONSTRAINT `order_BID` FOREIGN KEY (`BID`) REFERENCES `cp_books` (`BID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_UID1` FOREIGN KEY (`UID1`) REFERENCES `cp_user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_UID2` FOREIGN KEY (`UID2`) REFERENCES `cp_user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_orders
-- ----------------------------
INSERT INTO `cp_orders` VALUES ('6', '7', '3', '15', '2016-01-26 23:40:18', null, '27.4', '0', '16', null, null, null);
INSERT INTO `cp_orders` VALUES ('7', '2', '7', '39', '2016-01-26 23:40:18', null, '91', '2', '8', null, null, null);
INSERT INTO `cp_orders` VALUES ('10', '2', '3', '8', '2016-01-26 23:40:18', null, '48.7', '0', '12', null, null, null);
INSERT INTO `cp_orders` VALUES ('11', '2', '3', '1', '2016-01-26 23:40:19', null, '61.2', '0', '8', null, null, null);
INSERT INTO `cp_orders` VALUES ('12', '2', '3', '4', '2016-01-26 23:34:35', null, '66.33', '0', '8', null, null, null);

-- ----------------------------
-- Table structure for cp_user
-- ----------------------------
DROP TABLE IF EXISTS `cp_user`;
CREATE TABLE `cp_user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '0',
  `registtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastlogin` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `collection` varchar(512) DEFAULT '',
  `address` varchar(512) DEFAULT NULL,
  `portrail` varchar(512) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_user
-- ----------------------------
INSERT INTO `cp_user` VALUES ('2', 'test', '111', '375082677@qq.com', '0', '2016-01-24 17:33:55', '2016-01-24 17:33:55', '', '7,8,11,1,1,1', '', '1231231231');
INSERT INTO `cp_user` VALUES ('3', 'admin', 'admin', '', '0', '2016-01-17 15:35:47', '2016-01-17 15:35:47', '3', null, '', null);
INSERT INTO `cp_user` VALUES ('5', 'aaa', 'aaa', 'aaa', '0', '2016-01-24 17:33:59', '2016-01-24 17:33:59', '', null, '', null);
INSERT INTO `cp_user` VALUES ('6', 'test2', '123', null, '0', '2016-01-18 22:47:21', '2016-01-18 22:47:21', '3,13', null, '', null);
INSERT INTO `cp_user` VALUES ('7', 'test123', '123', 'a062930@gmail.com', '0', '2016-01-23 22:20:00', null, '', null, null, null);
INSERT INTO `cp_user` VALUES ('8', 'test1234', '123', 'asdfasdf@123.com', '0', '2016-01-24 23:13:32', '2016-01-24 23:13:32', '39', null, null, null);
