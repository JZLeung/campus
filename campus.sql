/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : campus

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-03-10 17:10:39
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_address
-- ----------------------------
INSERT INTO `cp_address` VALUES ('8', '2', '北京', '北京市', '五环到六环', '北京化工大学', '15652705896', '蒋允斌', '');
INSERT INTO `cp_address` VALUES ('10', '2', '福建', '莆田', '莆田市', '阿斯顿飞娃儿', '13232323232', '阿斯蒂芬', '');
INSERT INTO `cp_address` VALUES ('12', '2', '广东', '东莞', '东莞市', 'asdfaweqrwer', '13232323299', '阿斯顿飞犬瘟热', '');
INSERT INTO `cp_address` VALUES ('13', '2', '福建', '福州', '连江县', 'DDDDD', '13232323232', '确认', 'SDDDD');
INSERT INTO `cp_address` VALUES ('14', '2', '河南', '安阳', '安阳市', 'asdfasfa', '13232323232', 'asdfasdf', '');
INSERT INTO `cp_address` VALUES ('16', '7', '江西', '抚州', '乐安县', 'test街道1203号', '13232323232', '托尔斯泰', '100089');
INSERT INTO `cp_address` VALUES ('17', '8', '北京', '北京市', '三环到四环', '北京化工大学', '15652705896', '蒋允斌', '100000');
INSERT INTO `cp_address` VALUES ('18', '8', '广东', '中山', '中山市', '利和广场305A', '13800138000', '测试人员', '');
INSERT INTO `cp_address` VALUES ('19', '11', '贵州', '安顺', '平坝县', '无名东路15号另收花园15座', '13213213213', '垃圾死到康复路', '');
INSERT INTO `cp_address` VALUES ('20', '3', '广东', '潮州', '潮安县', '阿斯顿飞请问而且温柔', '13232323232', 'asdfasdfasdf', '');
INSERT INTO `cp_address` VALUES ('21', '12', '广西', '百色', '百色市', 'adsfqwerqwerqwr', '13213213213', 'asdfasdfqwer', '');
INSERT INTO `cp_address` VALUES ('22', '13', '江苏', '常州', '常州市', 'wqergthyjukl,mnbvcxz', '13456789021', 'buyer', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_books
-- ----------------------------
INSERT INTO `cp_books` VALUES ('1', '3', '11', '三体', '2016-03-02 22:15:13', '61.20', 'asdfaasdf阿斯顿飞请问而且温柔器', 'common/img/bookCover/11/1.jpg', '', '');
INSERT INTO `cp_books` VALUES ('2', '3', '11', '年少轻狂', '2016-01-17 16:54:27', '44.98', '同名电影热映', 'common/img/bookCover/11/2.jpg', null, null);
INSERT INTO `cp_books` VALUES ('3', '3', '11', '文学的遗珠', '2016-01-17 16:54:29', '55.20', '20世纪真正的《战争与和平》', 'common/img/bookCover/11/3.jpg', null, null);
INSERT INTO `cp_books` VALUES ('4', '3', '11', '我的盖世英雄', '2016-01-17 16:54:31', '66.33', '鲍鲸鲸全新力作', 'common/img/bookCover/11/4.jpg', null, null);
INSERT INTO `cp_books` VALUES ('5', '3', '11', '人类起源三部曲', '2016-01-17 16:54:35', '77.22', '美国畅销逾百万册', 'common/img/bookCover/11/5.jpg', '', null);
INSERT INTO `cp_books` VALUES ('6', '3', '13', '陪安东尼度过漫长岁月 红+橙+黄', '2016-01-19 16:54:37', '59.40', '京东特别附赠安东尼亲笔明信片，套装共3册', 'common/img/bookCover/11/5.jpg', null, null);
INSERT INTO `cp_books` VALUES ('7', '3', '13', '夜伴三庚（京东特别定制韩庚亲笔签名', '2016-02-19 22:07:21', '39.70', '韩庚首次以文字形式坦露心声，倾情告白出道十年心路历程', 'upload/1455890840205.jpg', 'iwjijsiadfjsjdfklajskldjflksjldkflkas', null);
INSERT INTO `cp_books` VALUES ('8', '3', '13', '琅琊榜（套装共3册）', '2016-02-19 22:06:49', '48.70', '胡歌、刘涛主演电视剧《琅琊榜》原著小说！随书附赠精美剧照卡册', 'upload/1455890808869.jpg', '', null);
INSERT INTO `cp_books` VALUES ('9', '3', '12', '胡歌、刘涛主演电视剧《琅琊榜》原著小说！随书附赠精美剧照卡册', '2015-12-22 23:09:48', '32.80', '《寻找·苏慧廉》出版后，沈迦继续寻访调研，利用未用尽的一手材料，继续叙说与苏慧廉有关的传教士在华的', null, null, null);
INSERT INTO `cp_books` VALUES ('10', '3', '12', '四季小品', '2016-02-19 22:07:05', '33.00', '古人认识一年四季自身与天地万物的关系，有一套完整的哲学。', 'upload/1455890824900.jpg', '', null);
INSERT INTO `cp_books` VALUES ('11', '3', '12', '草木缘情：中国古典文学中的植物世界', '2016-02-19 22:07:12', '82.10', '作为一位热爱中国古典文学的科学家，作者在文学与植物世界间纵横穿行。', 'upload/1455890831739.jpg', '随便加的23333333333333333333333.', null);
INSERT INTO `cp_books` VALUES ('12', '3', '11', '作为一位热爱中国古典文学的科学家，作者在文学与植物世界间纵横穿行。', '2016-02-16 16:52:29', '21.90', '中国历史上第一位太后 七国争雄的战国时代最厉害的女人', null, null, null);
INSERT INTO `cp_books` VALUES ('13', '3', '11', '下一站，总统：希拉里传', '2016-02-16 16:52:33', '25.00', '她总是愿意挑战自己，年逾60岁的她会第二次宣布： “我正式参加总统竞选，我将踏上旅途……”', null, null, null);
INSERT INTO `cp_books` VALUES ('14', '3', '14', '刘晓庆：人生不怕从头再来', '2015-12-27 23:12:59', '27.90', '刘晓庆随机亲笔签名本！刘晓庆从“亿万富姐儿”到锒铛入狱变身“千万负婆”，直至东山再起的奋斗史', null, null, null);
INSERT INTO `cp_books` VALUES ('15', '3', '11', '时间会把我们变成喜欢的样子', '2016-02-16 16:52:51', '27.40', '随书附赠京东定制精美填色卡。自媒体时代原创人气漫画家丁一晨第一部遐想故事集，全书全新创作，纯手绘涂', null, null, null);
INSERT INTO `cp_books` VALUES ('17', '3', '11', '尾文字鱼（京东特别版）', '2016-02-16 16:52:56', '28.90', '冷幽默漫画作者伍肆精心呈献：超过8200万人次阅读过的“心灵鱼汤”！特别附赠伍肆亲绘呆萌鱼形书签两个！', null, null, null);
INSERT INTO `cp_books` VALUES ('39', '7', '47', 'NodeJS权威指南', '2016-02-02 01:12:22', '55.98', 'NodeJS权威指南', 'upload/1453625269640.jpg', 'NodeJS权威指南：国内大神编写', null);
INSERT INTO `cp_books` VALUES ('40', '2', '50', '锋利的jQuery', '2016-03-02 22:36:18', '11.50', '锋利的jQuery', 'upload/1455890923033.png', '《锋利的jQuery（第2版）》循序渐进地对jQuery的各种函数和方法调用进行了介绍，读者可以系统地掌握jQuery的选择器、DOM操作、事件和动画、AJAX应用、插件、jQuery Mobile、jQuery各个版本变化、jQuery性能优化和技巧等知识点，并结合每个章节后面的案例演示进行练习，达到掌握核心知识点的目的。\r\n　　为使读者更好地进行开发实践，本书的第8章将前7章讲解的知识点和效果进行了整合，打造出一个非常有个性的网站，并从案例研究、网站材料、网站结构、网站样式和网站脚本等方面指导读者参与到项目建设中来。\r\n《锋利的jQuery（第2版）》适合所有对jQuery技术感兴趣的Web设计者和前端开发人员阅读和参考。', null);
INSERT INTO `cp_books` VALUES ('41', '9', '15', '迪士尼动画美绘典藏书系：冰雪奇缘 [3-6岁]', '2016-03-02 22:36:22', '21.00', '迪士尼漫画，华丽的大幅美图，感人肺腑的好故事，经典安徒生童话《冰雪王后》全新演绎！', 'upload/1455890881893.jpg', '美丽的艾伦戴尔王国坐落在北方的群山之中，宁静而神秘。变幻莫测的北极光笼罩着王国里不为人知的秘密……国王和王后的两个小女儿曾是亲密无间的好姐妹。姐姐爱莎会使用冰雪魔法，但却不知如何控制它。一天，爱莎在玩耍时不小心用冰雪魔法击中了妹妹安娜。为了不再伤害妹妹，爱莎从此封闭自己，不再接近他人。多年后，在众人云集的加冕礼上，整个王国伴随着爱莎失控的情绪化作了一片冰天雪地，而更不幸的事还在后面……爱莎该如何控制自己的魔法？谁来拯救被冰冻的安娜？艾伦戴尔王国的夏天是否还能回来？', null);
INSERT INTO `cp_books` VALUES ('42', '8', '23', '2016曲一线科学备考 5·3题霸 专题集训 高考语文2：现代文阅读', '2016-03-02 22:15:17', '123.00', '请问而且无日期为发烧等方式发送到发送到发送到', 'upload/1455890960625.jpg', '知识能掌握解题有困难，《5·3题霸 专题集训》针对训练；习题天天做成绩提升慢，练经典试题，剖错误原因；小题耗时多，得分效率低，“小题速练”限时限量练方法；题目审不清，解题无思路，“答题指导”一语点醒梦中人；会做题失分，考试发挥差，做仿真训练，练规范答题。', null);
INSERT INTO `cp_books` VALUES ('43', '8', '23', ' 初中知识清单：语文（第3次修订）', '2016-03-02 22:37:07', '26.60', '《曲一线科学', 'upload/1455890953127.jpg', 'if倒萨阿斯顿飞规划局快乐巨化股份第三暗爽更换距已UR饿死大餐v帮你们家航空股份的生产线  ', null);
INSERT INTO `cp_books` VALUES ('44', '2', '11', '', '2016-03-02 22:28:25', '0.00', '', '', '', null);
INSERT INTO `cp_books` VALUES ('45', '2', '51', 'testValidation', '2016-03-02 22:29:41', '123.32', 'asdfqwerqwe', '', 'rqwerqwerasdfasdfasdf', null);
INSERT INTO `cp_books` VALUES ('46', '2', '11', 'adfs ', '2016-03-08 17:50:43', '123.00', 'asdfasf', '', '', null);
INSERT INTO `cp_books` VALUES ('47', '2', '41', '阿斯顿发送到复', '2016-03-08 17:54:19', '143.00', '去玩儿去玩儿玩儿', 'upload/1457430750422.jpg', '', null);
INSERT INTO `cp_books` VALUES ('48', '7', '34', '?', '2016-03-08 17:55:41', '143.00', '?????', '', '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_orders
-- ----------------------------
INSERT INTO `cp_orders` VALUES ('6', '7', '3', '15', '2016-02-03 11:56:35', null, '27.4', '1', '16', '手动阀', '123352325', '顺丰');
INSERT INTO `cp_orders` VALUES ('7', '2', '7', '39', '2016-01-26 23:40:18', null, '91', '2', '8', null, null, null);
INSERT INTO `cp_orders` VALUES ('10', '2', '3', '8', '2016-03-02 22:02:24', '2016-03-02 22:02:24', '48.7', '1', '12', '广东药学院', '123123123123123', '阿斯蒂芬');
INSERT INTO `cp_orders` VALUES ('11', '2', '3', '1', '2016-02-03 01:02:13', null, '61.2', '2', '8', null, null, null);
INSERT INTO `cp_orders` VALUES ('12', '2', '3', '4', '2016-02-03 01:05:02', null, '66.33', '3', '8', null, null, null);
INSERT INTO `cp_orders` VALUES ('13', '7', '2', '40', '2016-02-16 14:52:06', null, '11.5', '0', '16', null, null, null);
INSERT INTO `cp_orders` VALUES ('14', '11', '3', '3', '2016-02-17 12:20:13', null, '55.2', '0', '19', null, null, null);
INSERT INTO `cp_orders` VALUES ('15', '3', '3', '5', '2016-02-22 00:07:11', null, '77.22', '0', '20', null, null, null);
INSERT INTO `cp_orders` VALUES ('16', '12', '3', '11', '2016-03-02 21:59:46', '2016-03-02 21:59:46', '82.1', '3', '21', null, null, null);
INSERT INTO `cp_orders` VALUES ('17', '12', '3', '12', '2016-03-02 22:01:21', null, '21.9', '0', '21', null, null, null);
INSERT INTO `cp_orders` VALUES ('18', '13', '8', '43', '2016-03-02 22:38:46', '2016-03-02 22:38:46', '26.6', '3', '0', null, null, null);
INSERT INTO `cp_orders` VALUES ('19', '13', '3', '7', '2016-03-02 22:41:17', null, '39.7', '0', '22', null, null, null);

-- ----------------------------
-- Table structure for cp_user
-- ----------------------------
DROP TABLE IF EXISTS `cp_user`;
CREATE TABLE `cp_user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `registtime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastlogin` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `collection` varchar(512) DEFAULT '',
  `phone` varchar(11) DEFAULT NULL,
  `usertype` int(2) DEFAULT '0',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_user
-- ----------------------------
INSERT INTO `cp_user` VALUES ('2', 'test', '202cb962ac59075b964b07152d234b70', '12345@qq.com', '2016-03-09 17:08:56', '2016-03-09 17:39:49', '40', '13000000766', '0');
INSERT INTO `cp_user` VALUES ('3', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'a062930@gmail.com', '2016-01-15 10:37:07', '2016-03-09 10:52:34', '3', '15667890123', '1');
INSERT INTO `cp_user` VALUES ('6', 'test2', '202cb962ac59075b964b07152d234b70', null, '2016-02-03 21:54:43', '2016-03-09 10:52:43', '3,13', null, '0');
INSERT INTO `cp_user` VALUES ('7', 'test123', '202cb962ac59075b964b07152d234b70', 'a062930@gmail.com', '2016-02-18 21:54:45', '2016-03-09 10:53:03', '2,10,40', null, '0');
INSERT INTO `cp_user` VALUES ('8', 'test1234', '202cb962ac59075b964b07152d234b70', 'asdfasdf@123.com', '2016-02-18 21:54:47', '2016-03-09 10:53:12', '39,4,7', null, '0');
INSERT INTO `cp_user` VALUES ('9', 'abc', '202cb962ac59075b964b07152d234b70', '123124', '2016-03-02 21:54:48', '2016-03-02 21:54:48', '', null, '0');
INSERT INTO `cp_user` VALUES ('10', 'root', '202cb962ac59075b964b07152d234b70', '123@123.com', '2016-03-02 21:54:50', '2016-03-02 21:54:50', '40', 'asdf', '0');
INSERT INTO `cp_user` VALUES ('11', 'root2', '202cb962ac59075b964b07152d234b70', '375082677@qq.com', '2016-03-02 21:54:49', '2016-03-02 21:54:49', '', '13800128000', '0');
INSERT INTO `cp_user` VALUES ('12', 'md5', '202cb962ac59075b964b07152d234b70', 'asdf@123.com', '2016-03-02 21:57:03', '2016-03-02 22:01:12', '11', '15652525252', '0');
INSERT INTO `cp_user` VALUES ('13', 'buyer', 'e10adc3949ba59abbe56e057f20f883e', '123@456.cn', '2016-03-02 22:35:01', '2016-03-02 22:38:26', '', null, '0');
INSERT INTO `cp_user` VALUES ('14', 'testtt', '202cb962ac59075b964b07152d234b70', 'buct132@163.com', '2016-03-07 21:50:43', '2016-03-07 22:33:09', '', null, '0');
INSERT INTO `cp_user` VALUES ('15', 'admin123', 'e99a18c428cb38d5f260853678922e03', '369@123.cc', '2016-03-08 15:47:14', '2016-03-08 15:47:43', '', null, '0');
