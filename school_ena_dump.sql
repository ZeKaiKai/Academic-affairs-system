/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL5.0（No Check constraint inside）
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : school_ena

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 19/12/2022 12:03:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `Class_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Director` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Depar_id` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Monitor` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Class_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Class_number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Class_id`) USING BTREE,
  INDEX `FK_Class_Dept2`(`Depar_id`) USING BTREE,
  INDEX `FK_Director2`(`Director`) USING BTREE,
  INDEX `FK_Monitor`(`Monitor`) USING BTREE,
  CONSTRAINT `FK_Class_Dept2` FOREIGN KEY (`Depar_id`) REFERENCES `department` (`Depar_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Director2` FOREIGN KEY (`Director`) REFERENCES `teacher` (`Teac_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Monitor` FOREIGN KEY (`Monitor`) REFERENCES `student` (`Stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('0101', '0102', '01', '980101006', '计算机98高职', 16);
INSERT INTO `class` VALUES ('0102', '0104', '01', '990102001', '计算机99高职', 22);
INSERT INTO `class` VALUES ('0103', '0107', '01', NULL, '计算机00高职', 0);
INSERT INTO `class` VALUES ('0104', '0103', '01', '980104009', '现管98', 7);
INSERT INTO `class` VALUES ('0105', '0106', '01', '990105014', '现管99', 12);
INSERT INTO `class` VALUES ('0106', '0102', '01', NULL, '计算机99脱产', 0);
INSERT INTO `class` VALUES ('0107', '0103', '01', NULL, '计算机00脱产', 0);
INSERT INTO `class` VALUES ('0201', '0202', '02', '980201002', '中文秘书98', 7);
INSERT INTO `class` VALUES ('0202', '0204', '02', NULL, '中文秘书99', 0);
INSERT INTO `class` VALUES ('0203', '0206', '02', '980203004', '广告设计98', 25);
INSERT INTO `class` VALUES ('0204', '0205', '02', NULL, '广告设计99', 0);
INSERT INTO `class` VALUES ('0501', '0502', '05', '980501005', '经济系会计学98', 12);
INSERT INTO `class` VALUES ('0502', '0503', '05', '990502001', '经济系会计学99', 7);
INSERT INTO `class` VALUES ('0503', '0506', '05', '000503008', '经济系会计学00', 8);
INSERT INTO `class` VALUES ('0504', '0502', '05', NULL, '经济系国际金融99', 0);
INSERT INTO `class` VALUES ('0505', '0503', '05', NULL, '经济系国际金融00', 0);
INSERT INTO `class` VALUES ('0506', '0503', '05', NULL, '经济系国际金融01', 0);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `Course_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Course_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Course_hour` smallint(6) NOT NULL,
  `Introduce` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('0101', '数据库', 85, '介绍关系数据库基础，以MICROSOFT SQL SERVER为例介绍数据库的知识。');
INSERT INTO `course` VALUES ('0102', '网络开发技术', 60, '网络编程，使用ASP开发网络应用程序。');
INSERT INTO `course` VALUES ('0103', 'C语言', 100, NULL);
INSERT INTO `course` VALUES ('0104', '计算机应用基础', 60, NULL);
INSERT INTO `course` VALUES ('0105', '数据结构', 80, NULL);
INSERT INTO `course` VALUES ('0106', '计算机组成原理', 80, NULL);
INSERT INTO `course` VALUES ('0107', '计算机网络', 80, NULL);
INSERT INTO `course` VALUES ('0108', '软件工程', 100, NULL);
INSERT INTO `course` VALUES ('0109', '面向对象程序设计', 60, NULL);
INSERT INTO `course` VALUES ('0110', '汇编语言', 80, NULL);
INSERT INTO `course` VALUES ('0111', '操作系统', 60, NULL);
INSERT INTO `course` VALUES ('0112', '数字逻辑', 90, NULL);
INSERT INTO `course` VALUES ('0118', '网络安全与防火墙', 60, '介绍网络的安全和主要防火墙软件');
INSERT INTO `course` VALUES ('0201', '公共关系学', 80, NULL);
INSERT INTO `course` VALUES ('0202', '古代汉语', 60, NULL);
INSERT INTO `course` VALUES ('0203', '广告学', 30, NULL);
INSERT INTO `course` VALUES ('0204', '基础写作', 80, NULL);
INSERT INTO `course` VALUES ('0205', '现代汉语', 60, NULL);
INSERT INTO `course` VALUES ('0206', '档案学', 40, NULL);
INSERT INTO `course` VALUES ('0207', '电脑设计', 100, NULL);
INSERT INTO `course` VALUES ('0208', '广告策划', 30, NULL);
INSERT INTO `course` VALUES ('0209', '平面设计', 80, NULL);
INSERT INTO `course` VALUES ('0210', '美术史', 60, NULL);
INSERT INTO `course` VALUES ('0211', '素描', 80, NULL);
INSERT INTO `course` VALUES ('0501', '工业会计', 60, NULL);
INSERT INTO `course` VALUES ('0502', '成本会计', 60, NULL);
INSERT INTO `course` VALUES ('0503', '市场营销', 40, NULL);
INSERT INTO `course` VALUES ('0504', '财政与金融', 60, NULL);
INSERT INTO `course` VALUES ('0505', '会计核算', 30, NULL);
INSERT INTO `course` VALUES ('0506', '经济法概论', 60, NULL);
INSERT INTO `course` VALUES ('0507', '会计学基础', 80, NULL);
INSERT INTO `course` VALUES ('0508', '政治经济学', 60, NULL);
INSERT INTO `course` VALUES ('0509', '统计学基础', 60, NULL);
INSERT INTO `course` VALUES ('0510', '商业银行业务', 80, NULL);
INSERT INTO `course` VALUES ('0511', '银行信贷', 60, NULL);
INSERT INTO `course` VALUES ('0512', '货币银行学', 60, NULL);
INSERT INTO `course` VALUES ('0513', '投资项目评估', 50, NULL);

-- ----------------------------
-- Table structure for courseteacher
-- ----------------------------
DROP TABLE IF EXISTS `courseteacher`;
CREATE TABLE `courseteacher`  (
  `Course_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Class_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Teac_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Course_id`, `Class_id`, `Teac_id`) USING BTREE,
  INDEX `FK_CourseTeacher2`(`Class_id`) USING BTREE,
  INDEX `FK_CourseTeacher3`(`Teac_id`) USING BTREE,
  CONSTRAINT `FK_CourseTeacher2` FOREIGN KEY (`Class_id`) REFERENCES `class` (`Class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CourseTeacher3` FOREIGN KEY (`Teac_id`) REFERENCES `teacher` (`Teac_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CourseTeacher_course_id` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courseteacher
-- ----------------------------
INSERT INTO `courseteacher` VALUES ('0103', '0101', '0102');
INSERT INTO `courseteacher` VALUES ('0103', '0104', '0102');
INSERT INTO `courseteacher` VALUES ('0101', '0101', '0103');
INSERT INTO `courseteacher` VALUES ('0101', '0102', '0103');
INSERT INTO `courseteacher` VALUES ('0104', '0101', '0103');
INSERT INTO `courseteacher` VALUES ('0102', '0101', '0104');
INSERT INTO `courseteacher` VALUES ('0102', '0102', '0104');
INSERT INTO `courseteacher` VALUES ('0111', '0102', '0105');
INSERT INTO `courseteacher` VALUES ('0105', '0101', '0106');
INSERT INTO `courseteacher` VALUES ('0105', '0104', '0106');
INSERT INTO `courseteacher` VALUES ('0104', '0102', '0108');
INSERT INTO `courseteacher` VALUES ('0108', '0101', '0108');
INSERT INTO `courseteacher` VALUES ('0108', '0104', '0108');
INSERT INTO `courseteacher` VALUES ('0109', '0104', '0108');
INSERT INTO `courseteacher` VALUES ('0103', '0102', '0109');
INSERT INTO `courseteacher` VALUES ('0112', '0104', '0109');
INSERT INTO `courseteacher` VALUES ('0203', '0201', '0202');
INSERT INTO `courseteacher` VALUES ('0211', '0202', '0202');
INSERT INTO `courseteacher` VALUES ('0110', '0102', '0203');
INSERT INTO `courseteacher` VALUES ('0210', '0201', '0203');
INSERT INTO `courseteacher` VALUES ('0202', '0201', '0204');
INSERT INTO `courseteacher` VALUES ('0202', '0203', '0204');
INSERT INTO `courseteacher` VALUES ('0208', '0201', '0205');
INSERT INTO `courseteacher` VALUES ('0201', '0201', '0206');
INSERT INTO `courseteacher` VALUES ('0201', '0203', '0206');
INSERT INTO `courseteacher` VALUES ('0210', '0203', '0206');
INSERT INTO `courseteacher` VALUES ('0205', '0203', '0207');
INSERT INTO `courseteacher` VALUES ('0501', '0501', '0501');
INSERT INTO `courseteacher` VALUES ('0506', '0503', '0501');
INSERT INTO `courseteacher` VALUES ('0503', '0501', '0502');
INSERT INTO `courseteacher` VALUES ('0511', '0503', '0502');
INSERT INTO `courseteacher` VALUES ('0508', '0503', '0503');
INSERT INTO `courseteacher` VALUES ('0502', '0501', '0504');
INSERT INTO `courseteacher` VALUES ('0503', '0502', '0504');
INSERT INTO `courseteacher` VALUES ('0512', '0503', '0505');
INSERT INTO `courseteacher` VALUES ('0501', '0502', '0506');
INSERT INTO `courseteacher` VALUES ('0502', '0502', '0507');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `Depar_id` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Depar_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Depar_phone` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Depar_number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Depar_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('01', '计算机系', '39351234', 66);
INSERT INTO `department` VALUES ('02', '中文系', '39351235', 38);
INSERT INTO `department` VALUES ('03', '外语系', '39351236', 4);
INSERT INTO `department` VALUES ('04', '物理系', '39351237', 0);
INSERT INTO `department` VALUES ('05', '经济系', '39351238', 34);
INSERT INTO `department` VALUES ('06', '化学系', '39351239', 0);
INSERT INTO `department` VALUES ('07', '生物系', '39351240', 0);
INSERT INTO `department` VALUES ('08', '地理系', '39351241', 0);
INSERT INTO `department` VALUES ('09', '体育系', '39351242', 0);
INSERT INTO `department` VALUES ('10', '美术系', '39351243', 0);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Stu_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Stu_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Stu_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Birthday` date NOT NULL,
  `Phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Class_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Score_avg` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Stu_id`) USING BTREE,
  INDEX `FK_Stu_Class`(`Class_id`) USING BTREE,
  CONSTRAINT `FK_Stu_Class` FOREIGN KEY (`Class_id`) REFERENCES `class` (`Class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('000503001', '陈培军', '男', '1983-03-16', '44488225', '广州市工业大道北', '0503', 90);
INSERT INTO `student` VALUES ('000503002', '艾 添', '女', '1973-04-19', '34470763', '广州市龙口东路', '0503', 77);
INSERT INTO `student` VALUES ('000503003', '陈四雯', '女', '1979-04-22', '43970360', '广州市华景新城', '0503', 69);
INSERT INTO `student` VALUES ('000503004', '沈菊菊', '女', '1976-07-24', '37013688', '广州市方村花地大道', '0503', 77);
INSERT INTO `student` VALUES ('000503005', '佟力何', '女', '1980-01-02', '71001030', '广州市沙园', '0503', 71);
INSERT INTO `student` VALUES ('000503006', '祁宪戎', '男', '1975-05-19', '41678201', '广州市滨江中路', '0503', 78);
INSERT INTO `student` VALUES ('000503007', '谈映城', '女', '1978-04-17', '44623771', '广州市沙园', '0503', 75);
INSERT INTO `student` VALUES ('000503008', '常承朋', '男', '1977-08-22', '48665394', '广州市穗园小区', '0503', 83);
INSERT INTO `student` VALUES ('980101001', '蒋保佳', '女', '1974-11-02', '48543456', '广州市骏景花园', '0101', 88);
INSERT INTO `student` VALUES ('980101002', '吴同强', '女', '1982-06-03', '77245032', '广州市二沙岛聚龙明珠花园', '0101', 77);
INSERT INTO `student` VALUES ('980101003', '涂杰杰', '男', '1972-06-09', '77750891', '广州市珠江新城', '0101', 78);
INSERT INTO `student` VALUES ('980101004', '毛前琛', '女', '1975-11-02', '74798645', '广州市龙口东路', '0101', 73);
INSERT INTO `student` VALUES ('980101005', '利旭勉', '女', '1978-08-16', '64193895', '广州市番禺区祈福新村', '0101', 80);
INSERT INTO `student` VALUES ('980101006', '梅植珠', '女', '1982-03-23', '85126338', '广州市中山七路', '0101', 71);
INSERT INTO `student` VALUES ('980101007', '谈筱财', '女', '1977-10-01', '72727654', '广州市方村花地大道', '0101', 83);
INSERT INTO `student` VALUES ('980101010', '伍治苗', '男', '1974-03-12', '34794631', '广州市沙河大街', '0101', 76);
INSERT INTO `student` VALUES ('980101011', '苏贤兴', '男', '1978-02-07', '71835313', '广州市珠江新城', '0101', 76);
INSERT INTO `student` VALUES ('980101012', '祝梁骧', '女', '1976-05-16', '43026957', '广州市昌岗中路', '0101', 72);
INSERT INTO `student` VALUES ('980101013', '孔菁梁', '男', '1977-03-03', '63009683', '广州市东风中路', '0101', 67);
INSERT INTO `student` VALUES ('980101014', '楼竞悦', '男', '1975-05-06', '65917205', '广州市东风东路', '0101', 70);
INSERT INTO `student` VALUES ('980101015', '衡妮华', '男', '1970-10-05', '44162007', '广州市穗园小区', '0101', 71);
INSERT INTO `student` VALUES ('980101016', '白锡赞', '男', '1973-07-20', '46236781', '广州市天河公园', '0101', 83);
INSERT INTO `student` VALUES ('980101017', '彭灵仪', '男', '1979-11-18', '53158072', '广州市穗园小区', '0101', 80);
INSERT INTO `student` VALUES ('980101018', '钟晋富', '女', '1976-01-11', '37096125', '广州市广源东碧桂圆', '0101', 83);
INSERT INTO `student` VALUES ('980101990', 'aab', '男', '1978-03-01', NULL, NULL, '0102', NULL);
INSERT INTO `student` VALUES ('980101991', 'aac', '男', '1978-03-01', NULL, NULL, '0102', NULL);
INSERT INTO `student` VALUES ('980101992', 'aad', '男', '1978-03-01', NULL, NULL, '0102', NULL);
INSERT INTO `student` VALUES ('980104001', '曹夺姬', '男', '1982-04-06', '63708826', '广州市昌岗中路', '0104', 73);
INSERT INTO `student` VALUES ('980104003', '符梓冬', '女', '1984-04-23', '64329067', '广州市中山大道', '0104', 76);
INSERT INTO `student` VALUES ('980104004', '艾彤荣', '女', '1972-08-07', '33454974', '广州市穗园小区', '0104', 74);
INSERT INTO `student` VALUES ('980104005', '袁运旭', '男', '1972-09-04', '78852027', '广州市共和路', '0104', 69);
INSERT INTO `student` VALUES ('980104006', '佟行婷', '男', '1982-02-06', '63508520', '广州市广源新村', '0104', 60);
INSERT INTO `student` VALUES ('980104008', '温巧丽', '女', '1973-01-07', '62644333', '广州市解放中路', '0104', 72);
INSERT INTO `student` VALUES ('980104009', '甄绮忠', '女', '1980-06-16', '85761365', '广州市滨江东路', '0104', 77);
INSERT INTO `student` VALUES ('980201001', '程武苹', '女', '1971-08-20', '85726513', '广州市体育西路', '0201', 82);
INSERT INTO `student` VALUES ('980201002', '舒权杏', '男', '1971-08-14', '78340695', '广州市东风中路', '0201', 71);
INSERT INTO `student` VALUES ('980201004', '植曼曼', '男', '1981-07-20', '61637516', '广州市天河北路', '0201', 83);
INSERT INTO `student` VALUES ('980201005', '聂多焰', '女', '1984-03-09', '67154589', '广州市仓边路', '0201', 63);
INSERT INTO `student` VALUES ('980201006', '万韶廉', '男', '1975-03-17', '48509975', '广州市滨江东路', '0201', 83);
INSERT INTO `student` VALUES ('980201007', '庞菲彰', '女', '1973-01-10', '71970492', '广州市二沙岛聚龙明珠花园', '0201', 86);
INSERT INTO `student` VALUES ('980201009', '文州鸿', '男', '1984-02-10', '52499271', '广州市中山五路', '0201', 60);
INSERT INTO `student` VALUES ('980203001', '海浪乐', '男', '1982-02-21', '46788658', '广州市天河北路', '0203', 73);
INSERT INTO `student` VALUES ('980203002', '甄少彪', '男', '1978-10-20', '82946458', '广州市石牌', '0203', 81);
INSERT INTO `student` VALUES ('980203003', '贾可琼', '女', '1971-04-22', '45839176', '广州市共和路', '0203', 65);
INSERT INTO `student` VALUES ('980203004', '连伯吉', '男', '1984-08-17', '75355170', '广州市解放中路', '0203', 84);
INSERT INTO `student` VALUES ('980203005', '车博勤', '女', '1981-06-13', '49667931', '广州市工业大道北', '0203', 74);
INSERT INTO `student` VALUES ('980203006', '范已威', '男', '1974-05-25', '83551679', '广州市仓边路', '0203', 80);
INSERT INTO `student` VALUES ('980203008', '陆蝶*', '女', '1983-11-06', '66900630', '广州市广源新村', '0203', 75);
INSERT INTO `student` VALUES ('980203009', '毕长蕾', '女', '1970-01-19', '78858968', '广州市方村花地大道', '0203', 73);
INSERT INTO `student` VALUES ('980203010', '温衍帆', '女', '1978-01-19', '79471942', '广州市沙园', '0203', 71);
INSERT INTO `student` VALUES ('980203012', '贺翔常', '女', '1982-10-15', '70508223', '广州市同福东路', '0203', 81);
INSERT INTO `student` VALUES ('980203013', '邝越影', '女', '1982-02-13', '43554201', '广州市宝岗大道', '0203', 82);
INSERT INTO `student` VALUES ('980203014', '戚徒利', '女', '1974-04-23', '48805968', '广州市体育西路', '0203', 71);
INSERT INTO `student` VALUES ('980203016', '禹俭韶', '男', '1978-05-23', '58850673', '广州市共和路', '0203', 85);
INSERT INTO `student` VALUES ('980203017', '柯鹤涛', '女', '1981-03-12', '86926945', '广州市石牌', '0203', 74);
INSERT INTO `student` VALUES ('980203019', '司竟景', '女', '1973-11-09', '47309695', '广州市中山八路', '0203', 87);
INSERT INTO `student` VALUES ('980203020', '黎阳韵', '女', '1980-11-23', '84676684', '广州市中山三路', '0203', 88);
INSERT INTO `student` VALUES ('980203021', '薜咏微', '男', '1982-04-24', '88226745', '广州市人民南路', '0203', 70);
INSERT INTO `student` VALUES ('980203022', '环茹', '女', '1984-09-13', '78328172', '广州市滨江东路', '0203', 73);
INSERT INTO `student` VALUES ('980203023', '邓常海', '女', '1975-10-07', '38561933', '广州市解放中路', '0203', 65);
INSERT INTO `student` VALUES ('980203024', '谢颜尧', '男', '1973-09-24', '61645913', '广州市解放中路', '0203', 80);
INSERT INTO `student` VALUES ('980203025', '肖震芬', '女', '1983-10-16', '62210028', '广州市骏景花园', '0203', 82);
INSERT INTO `student` VALUES ('980203026', '房马金', '男', '1972-07-07', '54165208', '广州市珠江新城', '0203', 79);
INSERT INTO `student` VALUES ('980203027', '鲍焕伦', '男', '1970-10-07', '83191445', '广州市方村花地大道', '0203', 84);
INSERT INTO `student` VALUES ('980203028', '付娣儿', '女', '1971-11-01', '43820224', '广州市共和路', '0203', 66);
INSERT INTO `student` VALUES ('980203029', '卫创湖', '女', '1980-09-13', '45776049', '广州市广源东碧桂圆', '0203', 70);
INSERT INTO `student` VALUES ('980501001', '孔菁梁', '女', '1976-06-12', '42204907', '广州市昌岗中路', '0501', 77);
INSERT INTO `student` VALUES ('980501002', '李临意', '男', '1977-08-20', '42451973', '广州市骏景花园', '0501', 72);
INSERT INTO `student` VALUES ('980501003', '曹倩洪', '男', '1971-01-20', '44389700', '广州市体育西路', '0501', 73);
INSERT INTO `student` VALUES ('980501004', '南泽均', '男', '1981-10-11', '39210576', '广州市龙口东路', '0501', 81);
INSERT INTO `student` VALUES ('980501005', '施士盛', '男', '1973-06-14', '56699160', '广州市中山七路', '0501', 87);
INSERT INTO `student` VALUES ('980501006', '卢洁炎', '女', '1984-08-09', '50659332', '广州市教育路', '0501', 93);
INSERT INTO `student` VALUES ('980501007', '阳荔藩', '女', '1983-07-02', '35225007', '广州市中山大道', '0501', 82);
INSERT INTO `student` VALUES ('980501008', '胡舒', '男', '1977-07-08', '58305454', '广州市滨江中路', '0501', 85);
INSERT INTO `student` VALUES ('980501009', '袁嵩娥', '男', '1976-04-02', '69711319', '广州市中山七路', '0501', 88);
INSERT INTO `student` VALUES ('980501010', '贺汝港', '男', '1984-05-26', '39817550', '广州市前进路', '0501', 77);
INSERT INTO `student` VALUES ('980501013', '莫媛稷', '男', '1977-08-05', '55200405', '广州市康乐村', '0501', 65);
INSERT INTO `student` VALUES ('980501015', '向玲雷', '男', '1974-04-27', '38384912', '广州市方村花地大道', '0501', 83);
INSERT INTO `student` VALUES ('990102001', '盘赐楷', '男', '1971-11-11', '84843152', '广州市同福东路', '0102', NULL);
INSERT INTO `student` VALUES ('990102002', '汉逊欣', '男', '1972-11-10', '36926929', '广州市五山', '0102', NULL);
INSERT INTO `student` VALUES ('990102003', '南泽均', '男', '1982-04-11', '70609569', '广州市共和路', '0102', NULL);
INSERT INTO `student` VALUES ('990102004', '孔艾森', '男', '1980-11-10', '48203726', '广州市骏景花园', '0102', NULL);
INSERT INTO `student` VALUES ('990102005', '王媚甜', '女', '1975-04-26', '53556900', '广州市同德围', '0102', NULL);
INSERT INTO `student` VALUES ('990102006', '麦跃禧', '男', '1983-09-12', '84040901', '广州市前进路', '0102', NULL);
INSERT INTO `student` VALUES ('990102007', '陶肄略', '女', '1974-10-07', '78288538', '广州市中山大道', '0102', NULL);
INSERT INTO `student` VALUES ('990102008', '龚焯翔', '女', '1983-09-10', '70911509', '广州市解放中路', '0102', NULL);
INSERT INTO `student` VALUES ('990102012', '蚁贺薇', '女', '1975-05-09', '80045686', '广州市昌岗中路', '0102', NULL);
INSERT INTO `student` VALUES ('990102013', '梅英寰', '男', '1976-08-18', '61495020', '广州市五山', '0102', NULL);
INSERT INTO `student` VALUES ('990102014', '喻焰梨', '女', '1973-04-13', '50493909', '广州市广源新村', '0102', NULL);
INSERT INTO `student` VALUES ('990102015', '左永毅', '男', '1979-06-18', '72268585', '广州市滨江东路', '0102', NULL);
INSERT INTO `student` VALUES ('990102016', '吕金鹏', '男', '1975-05-20', '39669065', '广州市广源新村', '0102', NULL);
INSERT INTO `student` VALUES ('990102017', '招茂晟', '女', '1976-02-21', '88590529', '广州市方村花地大道', '0102', NULL);
INSERT INTO `student` VALUES ('990102018', '史捷沪', '女', '1981-09-17', '50148895', '广州市田心花园', '0102', NULL);
INSERT INTO `student` VALUES ('990102019', '招恩焕', '女', '1979-07-23', '70408411', '广州市骏景花园', '0102', NULL);
INSERT INTO `student` VALUES ('990102020', '程鸿池', '女', '1975-10-19', '81692049', '广州市沙太路', '0102', NULL);
INSERT INTO `student` VALUES ('990102021', '袁运旭', '男', '1970-10-09', '75541579', '广州市中山八路', '0102', NULL);
INSERT INTO `student` VALUES ('990102990', 'abe', '男', '1978-03-01', NULL, NULL, '0102', NULL);
INSERT INTO `student` VALUES ('990105001', '茹幸横', '男', '1982-10-24', '42111716', '广州市番禺区祈福新村', '0105', NULL);
INSERT INTO `student` VALUES ('990105002', '洪本羡', '女', '1970-03-19', '75443687', '广州市番禺区祈福新村', '0105', NULL);
INSERT INTO `student` VALUES ('990105003', '熊卓芝', '女', '1982-05-10', '66276095', '广州市天河北路', '0105', NULL);
INSERT INTO `student` VALUES ('990105004', '利蕤琨', '女', '1979-09-11', '84639377', '广州市中山三路', '0105', NULL);
INSERT INTO `student` VALUES ('990105005', '沈柏培', '男', '1974-04-01', '67480931', '广州市沙园', '0105', NULL);
INSERT INTO `student` VALUES ('990105006', '邹利铎', '男', '1971-01-13', '51454243', '广州市中山七路', '0105', NULL);
INSERT INTO `student` VALUES ('990105010', '邝从显', '女', '1982-05-19', '84256061', '广州市田心花园', '0105', NULL);
INSERT INTO `student` VALUES ('990105011', '庞渭男', '女', '1977-06-27', '68780341', '广州市珠江新城', '0105', NULL);
INSERT INTO `student` VALUES ('990105013', '布经蓉', '男', '1970-03-08', '79369611', '广州市昌岗中路', '0105', NULL);
INSERT INTO `student` VALUES ('990105014', '宗琼耀', '男', '1980-10-01', '42579615', '广州市方村花地大道', '0105', NULL);
INSERT INTO `student` VALUES ('990105015', '傅贵成', '男', '1977-10-04', '80650671', '广州市人民南路', '0105', NULL);
INSERT INTO `student` VALUES ('990105018', '李省幸', '男', '1975-03-17', '40060665', '广州市石牌', '0105', NULL);
INSERT INTO `student` VALUES ('990502001', '颜琳捷', '男', '1972-05-09', '88111389', '广州市同福东路', '0502', NULL);
INSERT INTO `student` VALUES ('990502002', '汪就岸', '女', '1979-10-12', '54525294', '广州市昌岗中路', '0502', NULL);
INSERT INTO `student` VALUES ('990502004', '黎苏绍', '女', '1976-09-04', '78563991', '广州市共和大街', '0502', NULL);
INSERT INTO `student` VALUES ('990502006', '邱全全', '男', '1984-09-05', '74487139', '广州市滨江中路', '0502', NULL);
INSERT INTO `student` VALUES ('990502007', '涂杰杰', '男', '1973-09-01', '48321463', '广州市广源东碧桂圆', '0502', NULL);
INSERT INTO `student` VALUES ('990502008', '贺翔常', '男', '1984-06-16', '73238632', '广州市康乐村', '0502', NULL);
INSERT INTO `student` VALUES ('990502009', '易静昶', '男', '1984-11-01', '79285833', '广州市仓边路', '0502', NULL);
INSERT INTO `student` VALUES ('s25328', '武松', '女', '1990-02-21', NULL, NULL, '01', NULL);

-- ----------------------------
-- Table structure for studentgrade
-- ----------------------------
DROP TABLE IF EXISTS `studentgrade`;
CREATE TABLE `studentgrade`  (
  `Stu_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Course_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Grade` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Stu_id`, `Course_id`) USING BTREE,
  INDEX `FK_StudentGrade2`(`Course_id`) USING BTREE,
  CONSTRAINT `FK_StudentGrade2` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_StudentGrade_stu_id` FOREIGN KEY (`Stu_id`) REFERENCES `student` (`Stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentgrade
-- ----------------------------
INSERT INTO `studentgrade` VALUES ('000503001', '0508', 98);
INSERT INTO `studentgrade` VALUES ('000503001', '0511', 94);
INSERT INTO `studentgrade` VALUES ('000503001', '0512', 78);
INSERT INTO `studentgrade` VALUES ('000503002', '0506', 81);
INSERT INTO `studentgrade` VALUES ('000503002', '0508', 60);
INSERT INTO `studentgrade` VALUES ('000503002', '0511', 78);
INSERT INTO `studentgrade` VALUES ('000503002', '0512', 90);
INSERT INTO `studentgrade` VALUES ('000503003', '0506', 81);
INSERT INTO `studentgrade` VALUES ('000503003', '0508', 60);
INSERT INTO `studentgrade` VALUES ('000503003', '0512', 67);
INSERT INTO `studentgrade` VALUES ('000503004', '0506', 66);
INSERT INTO `studentgrade` VALUES ('000503004', '0508', 76);
INSERT INTO `studentgrade` VALUES ('000503004', '0511', 97);
INSERT INTO `studentgrade` VALUES ('000503004', '0512', 67);
INSERT INTO `studentgrade` VALUES ('000503005', '0506', 68);
INSERT INTO `studentgrade` VALUES ('000503005', '0508', 86);
INSERT INTO `studentgrade` VALUES ('000503005', '0511', 60);
INSERT INTO `studentgrade` VALUES ('000503005', '0512', 71);
INSERT INTO `studentgrade` VALUES ('000503006', '0506', 87);
INSERT INTO `studentgrade` VALUES ('000503006', '0508', 61);
INSERT INTO `studentgrade` VALUES ('000503006', '0511', 87);
INSERT INTO `studentgrade` VALUES ('000503006', '0512', 77);
INSERT INTO `studentgrade` VALUES ('000503007', '0506', 64);
INSERT INTO `studentgrade` VALUES ('000503007', '0512', 86);
INSERT INTO `studentgrade` VALUES ('000503008', '0506', 86);
INSERT INTO `studentgrade` VALUES ('000503008', '0508', 86);
INSERT INTO `studentgrade` VALUES ('000503008', '0511', 61);
INSERT INTO `studentgrade` VALUES ('000503008', '0512', 99);
INSERT INTO `studentgrade` VALUES ('980101001', '0101', 88);
INSERT INTO `studentgrade` VALUES ('980101001', '0103', 90);
INSERT INTO `studentgrade` VALUES ('980101001', '0104', 86);
INSERT INTO `studentgrade` VALUES ('980101002', '0101', 72);
INSERT INTO `studentgrade` VALUES ('980101002', '0102', 67);
INSERT INTO `studentgrade` VALUES ('980101002', '0105', 89);
INSERT INTO `studentgrade` VALUES ('980101002', '0108', 78);
INSERT INTO `studentgrade` VALUES ('980101003', '0101', 60);
INSERT INTO `studentgrade` VALUES ('980101003', '0102', 92);
INSERT INTO `studentgrade` VALUES ('980101003', '0103', 94);
INSERT INTO `studentgrade` VALUES ('980101003', '0104', 60);
INSERT INTO `studentgrade` VALUES ('980101003', '0105', 81);
INSERT INTO `studentgrade` VALUES ('980101003', '0108', 79);
INSERT INTO `studentgrade` VALUES ('980101004', '0101', 87);
INSERT INTO `studentgrade` VALUES ('980101004', '0102', 65);
INSERT INTO `studentgrade` VALUES ('980101004', '0103', 72);
INSERT INTO `studentgrade` VALUES ('980101004', '0105', 79);
INSERT INTO `studentgrade` VALUES ('980101004', '0108', 60);
INSERT INTO `studentgrade` VALUES ('980101005', '0101', 80);
INSERT INTO `studentgrade` VALUES ('980101005', '0102', 80);
INSERT INTO `studentgrade` VALUES ('980101005', '0103', 80);
INSERT INTO `studentgrade` VALUES ('980101005', '0104', 80);
INSERT INTO `studentgrade` VALUES ('980101005', '0105', 80);
INSERT INTO `studentgrade` VALUES ('980101005', '0108', 80);
INSERT INTO `studentgrade` VALUES ('980101006', '0101', 73);
INSERT INTO `studentgrade` VALUES ('980101006', '0102', 74);
INSERT INTO `studentgrade` VALUES ('980101006', '0103', 74);
INSERT INTO `studentgrade` VALUES ('980101006', '0104', 63);
INSERT INTO `studentgrade` VALUES ('980101006', '0105', 66);
INSERT INTO `studentgrade` VALUES ('980101006', '0108', 76);
INSERT INTO `studentgrade` VALUES ('980101007', '0101', 68);
INSERT INTO `studentgrade` VALUES ('980101007', '0102', 99);
INSERT INTO `studentgrade` VALUES ('980101007', '0103', 68);
INSERT INTO `studentgrade` VALUES ('980101007', '0104', 94);
INSERT INTO `studentgrade` VALUES ('980101007', '0105', 85);
INSERT INTO `studentgrade` VALUES ('980101010', '0101', 75);
INSERT INTO `studentgrade` VALUES ('980101010', '0102', 84);
INSERT INTO `studentgrade` VALUES ('980101010', '0103', 78);
INSERT INTO `studentgrade` VALUES ('980101010', '0104', 79);
INSERT INTO `studentgrade` VALUES ('980101010', '0105', 65);
INSERT INTO `studentgrade` VALUES ('980101010', '0108', 76);
INSERT INTO `studentgrade` VALUES ('980101011', '0101', 87);
INSERT INTO `studentgrade` VALUES ('980101011', '0102', 63);
INSERT INTO `studentgrade` VALUES ('980101011', '0103', 74);
INSERT INTO `studentgrade` VALUES ('980101011', '0104', 77);
INSERT INTO `studentgrade` VALUES ('980101011', '0105', 68);
INSERT INTO `studentgrade` VALUES ('980101011', '0108', 88);
INSERT INTO `studentgrade` VALUES ('980101012', '0101', 84);
INSERT INTO `studentgrade` VALUES ('980101012', '0102', 78);
INSERT INTO `studentgrade` VALUES ('980101012', '0103', 78);
INSERT INTO `studentgrade` VALUES ('980101012', '0104', 72);
INSERT INTO `studentgrade` VALUES ('980101012', '0105', 60);
INSERT INTO `studentgrade` VALUES ('980101012', '0108', 62);
INSERT INTO `studentgrade` VALUES ('980101013', '0101', 74);
INSERT INTO `studentgrade` VALUES ('980101013', '0103', 60);
INSERT INTO `studentgrade` VALUES ('980101013', '0104', 60);
INSERT INTO `studentgrade` VALUES ('980101013', '0105', 82);
INSERT INTO `studentgrade` VALUES ('980101013', '0108', 60);
INSERT INTO `studentgrade` VALUES ('980101014', '0101', 69);
INSERT INTO `studentgrade` VALUES ('980101014', '0103', 67);
INSERT INTO `studentgrade` VALUES ('980101014', '0104', 67);
INSERT INTO `studentgrade` VALUES ('980101014', '0105', 78);
INSERT INTO `studentgrade` VALUES ('980101014', '0108', 71);
INSERT INTO `studentgrade` VALUES ('980101015', '0101', 60);
INSERT INTO `studentgrade` VALUES ('980101015', '0102', 61);
INSERT INTO `studentgrade` VALUES ('980101015', '0103', 82);
INSERT INTO `studentgrade` VALUES ('980101015', '0104', 79);
INSERT INTO `studentgrade` VALUES ('980101016', '0101', 93);
INSERT INTO `studentgrade` VALUES ('980101016', '0102', 60);
INSERT INTO `studentgrade` VALUES ('980101016', '0103', 87);
INSERT INTO `studentgrade` VALUES ('980101016', '0104', 83);
INSERT INTO `studentgrade` VALUES ('980101016', '0105', 91);
INSERT INTO `studentgrade` VALUES ('980101017', '0101', 91);
INSERT INTO `studentgrade` VALUES ('980101017', '0102', 90);
INSERT INTO `studentgrade` VALUES ('980101017', '0103', 66);
INSERT INTO `studentgrade` VALUES ('980101017', '0105', 93);
INSERT INTO `studentgrade` VALUES ('980101017', '0108', 60);
INSERT INTO `studentgrade` VALUES ('980101018', '0101', 60);
INSERT INTO `studentgrade` VALUES ('980101018', '0103', 99);
INSERT INTO `studentgrade` VALUES ('980101018', '0105', 86);
INSERT INTO `studentgrade` VALUES ('980101018', '0108', 85);
INSERT INTO `studentgrade` VALUES ('980104001', '0103', 60);
INSERT INTO `studentgrade` VALUES ('980104001', '0105', 83);
INSERT INTO `studentgrade` VALUES ('980104001', '0109', 60);
INSERT INTO `studentgrade` VALUES ('980104001', '0112', 88);
INSERT INTO `studentgrade` VALUES ('980104003', '0103', 60);
INSERT INTO `studentgrade` VALUES ('980104003', '0105', 72);
INSERT INTO `studentgrade` VALUES ('980104003', '0108', 83);
INSERT INTO `studentgrade` VALUES ('980104003', '0109', 84);
INSERT INTO `studentgrade` VALUES ('980104003', '0112', 82);
INSERT INTO `studentgrade` VALUES ('980104004', '0103', 74);
INSERT INTO `studentgrade` VALUES ('980104004', '0105', 72);
INSERT INTO `studentgrade` VALUES ('980104004', '0109', 67);
INSERT INTO `studentgrade` VALUES ('980104004', '0112', 81);
INSERT INTO `studentgrade` VALUES ('980104005', '0103', 71);
INSERT INTO `studentgrade` VALUES ('980104005', '0108', 61);
INSERT INTO `studentgrade` VALUES ('980104005', '0112', 76);
INSERT INTO `studentgrade` VALUES ('980104006', '0103', 61);
INSERT INTO `studentgrade` VALUES ('980104006', '0108', 60);
INSERT INTO `studentgrade` VALUES ('980104006', '0109', 60);
INSERT INTO `studentgrade` VALUES ('980104008', '0105', 70);
INSERT INTO `studentgrade` VALUES ('980104008', '0108', 74);
INSERT INTO `studentgrade` VALUES ('980104008', '0109', 70);
INSERT INTO `studentgrade` VALUES ('980104008', '0112', 72);
INSERT INTO `studentgrade` VALUES ('980104009', '0105', 74);
INSERT INTO `studentgrade` VALUES ('980104009', '0108', 93);
INSERT INTO `studentgrade` VALUES ('980104009', '0109', 75);
INSERT INTO `studentgrade` VALUES ('980104009', '0112', 66);
INSERT INTO `studentgrade` VALUES ('980201001', '0201', 68);
INSERT INTO `studentgrade` VALUES ('980201001', '0202', 66);
INSERT INTO `studentgrade` VALUES ('980201001', '0203', 99);
INSERT INTO `studentgrade` VALUES ('980201001', '0210', 94);
INSERT INTO `studentgrade` VALUES ('980201002', '0201', 69);
INSERT INTO `studentgrade` VALUES ('980201002', '0202', 70);
INSERT INTO `studentgrade` VALUES ('980201002', '0203', 92);
INSERT INTO `studentgrade` VALUES ('980201002', '0208', 65);
INSERT INTO `studentgrade` VALUES ('980201002', '0210', 61);
INSERT INTO `studentgrade` VALUES ('980201004', '0201', 96);
INSERT INTO `studentgrade` VALUES ('980201004', '0202', 85);
INSERT INTO `studentgrade` VALUES ('980201004', '0203', 75);
INSERT INTO `studentgrade` VALUES ('980201004', '0208', 97);
INSERT INTO `studentgrade` VALUES ('980201004', '0210', 60);
INSERT INTO `studentgrade` VALUES ('980201005', '0210', 63);
INSERT INTO `studentgrade` VALUES ('980201006', '0201', 95);
INSERT INTO `studentgrade` VALUES ('980201006', '0202', 74);
INSERT INTO `studentgrade` VALUES ('980201006', '0203', 94);
INSERT INTO `studentgrade` VALUES ('980201006', '0208', 69);
INSERT INTO `studentgrade` VALUES ('980201007', '0201', 96);
INSERT INTO `studentgrade` VALUES ('980201007', '0202', 74);
INSERT INTO `studentgrade` VALUES ('980201007', '0203', 90);
INSERT INTO `studentgrade` VALUES ('980201007', '0208', 82);
INSERT INTO `studentgrade` VALUES ('980201009', '0208', 60);
INSERT INTO `studentgrade` VALUES ('980201009', '0210', 60);
INSERT INTO `studentgrade` VALUES ('980203001', '0201', 61);
INSERT INTO `studentgrade` VALUES ('980203001', '0202', 81);
INSERT INTO `studentgrade` VALUES ('980203001', '0205', 78);
INSERT INTO `studentgrade` VALUES ('980203002', '0201', 94);
INSERT INTO `studentgrade` VALUES ('980203002', '0202', 97);
INSERT INTO `studentgrade` VALUES ('980203002', '0205', 72);
INSERT INTO `studentgrade` VALUES ('980203002', '0210', 60);
INSERT INTO `studentgrade` VALUES ('980203003', '0201', 74);
INSERT INTO `studentgrade` VALUES ('980203003', '0205', 60);
INSERT INTO `studentgrade` VALUES ('980203003', '0210', 61);
INSERT INTO `studentgrade` VALUES ('980203004', '0201', 71);
INSERT INTO `studentgrade` VALUES ('980203004', '0202', 90);
INSERT INTO `studentgrade` VALUES ('980203004', '0205', 89);
INSERT INTO `studentgrade` VALUES ('980203004', '0210', 87);
INSERT INTO `studentgrade` VALUES ('980203005', '0201', 60);
INSERT INTO `studentgrade` VALUES ('980203005', '0202', 73);
INSERT INTO `studentgrade` VALUES ('980203005', '0205', 79);
INSERT INTO `studentgrade` VALUES ('980203005', '0210', 83);
INSERT INTO `studentgrade` VALUES ('980203006', '0201', 89);
INSERT INTO `studentgrade` VALUES ('980203006', '0202', 83);
INSERT INTO `studentgrade` VALUES ('980203006', '0205', 76);
INSERT INTO `studentgrade` VALUES ('980203006', '0210', 71);
INSERT INTO `studentgrade` VALUES ('980203008', '0201', 75);
INSERT INTO `studentgrade` VALUES ('980203008', '0202', 60);
INSERT INTO `studentgrade` VALUES ('980203008', '0205', 77);
INSERT INTO `studentgrade` VALUES ('980203008', '0210', 88);
INSERT INTO `studentgrade` VALUES ('980203009', '0202', 74);
INSERT INTO `studentgrade` VALUES ('980203009', '0205', 85);
INSERT INTO `studentgrade` VALUES ('980203009', '0210', 60);
INSERT INTO `studentgrade` VALUES ('980203010', '0201', 60);
INSERT INTO `studentgrade` VALUES ('980203010', '0202', 83);
INSERT INTO `studentgrade` VALUES ('980203010', '0205', 78);
INSERT INTO `studentgrade` VALUES ('980203010', '0210', 62);
INSERT INTO `studentgrade` VALUES ('980203012', '0201', 73);
INSERT INTO `studentgrade` VALUES ('980203012', '0202', 72);
INSERT INTO `studentgrade` VALUES ('980203012', '0205', 81);
INSERT INTO `studentgrade` VALUES ('980203012', '0210', 97);
INSERT INTO `studentgrade` VALUES ('980203013', '0202', 71);
INSERT INTO `studentgrade` VALUES ('980203013', '0205', 82);
INSERT INTO `studentgrade` VALUES ('980203013', '0210', 93);
INSERT INTO `studentgrade` VALUES ('980203014', '0202', 60);
INSERT INTO `studentgrade` VALUES ('980203014', '0205', 61);
INSERT INTO `studentgrade` VALUES ('980203014', '0210', 91);
INSERT INTO `studentgrade` VALUES ('980203016', '0202', 90);
INSERT INTO `studentgrade` VALUES ('980203016', '0205', 90);
INSERT INTO `studentgrade` VALUES ('980203016', '0210', 76);
INSERT INTO `studentgrade` VALUES ('980203017', '0202', 73);
INSERT INTO `studentgrade` VALUES ('980203017', '0205', 77);
INSERT INTO `studentgrade` VALUES ('980203017', '0210', 73);
INSERT INTO `studentgrade` VALUES ('980203019', '0201', 84);
INSERT INTO `studentgrade` VALUES ('980203019', '0202', 94);
INSERT INTO `studentgrade` VALUES ('980203019', '0205', 78);
INSERT INTO `studentgrade` VALUES ('980203019', '0210', 91);
INSERT INTO `studentgrade` VALUES ('980203020', '0201', 83);
INSERT INTO `studentgrade` VALUES ('980203020', '0202', 96);
INSERT INTO `studentgrade` VALUES ('980203020', '0205', 83);
INSERT INTO `studentgrade` VALUES ('980203020', '0210', 88);
INSERT INTO `studentgrade` VALUES ('980203021', '0201', 60);
INSERT INTO `studentgrade` VALUES ('980203021', '0202', 83);
INSERT INTO `studentgrade` VALUES ('980203021', '0210', 68);
INSERT INTO `studentgrade` VALUES ('980203022', '0201', 63);
INSERT INTO `studentgrade` VALUES ('980203022', '0202', 68);
INSERT INTO `studentgrade` VALUES ('980203022', '0205', 68);
INSERT INTO `studentgrade` VALUES ('980203022', '0210', 92);
INSERT INTO `studentgrade` VALUES ('980203023', '0201', 60);
INSERT INTO `studentgrade` VALUES ('980203023', '0202', 61);
INSERT INTO `studentgrade` VALUES ('980203023', '0205', 75);
INSERT INTO `studentgrade` VALUES ('980203024', '0201', 85);
INSERT INTO `studentgrade` VALUES ('980203024', '0202', 72);
INSERT INTO `studentgrade` VALUES ('980203024', '0205', 92);
INSERT INTO `studentgrade` VALUES ('980203024', '0210', 72);
INSERT INTO `studentgrade` VALUES ('980203025', '0201', 90);
INSERT INTO `studentgrade` VALUES ('980203025', '0202', 86);
INSERT INTO `studentgrade` VALUES ('980203025', '0205', 90);
INSERT INTO `studentgrade` VALUES ('980203025', '0210', 60);
INSERT INTO `studentgrade` VALUES ('980203026', '0201', 89);
INSERT INTO `studentgrade` VALUES ('980203026', '0202', 71);
INSERT INTO `studentgrade` VALUES ('980203026', '0205', 75);
INSERT INTO `studentgrade` VALUES ('980203026', '0210', 82);
INSERT INTO `studentgrade` VALUES ('980203027', '0201', 86);
INSERT INTO `studentgrade` VALUES ('980203027', '0202', 60);
INSERT INTO `studentgrade` VALUES ('980203027', '0205', 95);
INSERT INTO `studentgrade` VALUES ('980203027', '0210', 93);
INSERT INTO `studentgrade` VALUES ('980203028', '0201', 70);
INSERT INTO `studentgrade` VALUES ('980203028', '0210', 62);
INSERT INTO `studentgrade` VALUES ('980203029', '0201', 60);
INSERT INTO `studentgrade` VALUES ('980203029', '0202', 60);
INSERT INTO `studentgrade` VALUES ('980203029', '0205', 76);
INSERT INTO `studentgrade` VALUES ('980203029', '0210', 84);
INSERT INTO `studentgrade` VALUES ('980501001', '0501', 72);
INSERT INTO `studentgrade` VALUES ('980501001', '0502', 96);
INSERT INTO `studentgrade` VALUES ('980501001', '0503', 64);
INSERT INTO `studentgrade` VALUES ('980501002', '0501', 64);
INSERT INTO `studentgrade` VALUES ('980501002', '0502', 77);
INSERT INTO `studentgrade` VALUES ('980501002', '0503', 75);
INSERT INTO `studentgrade` VALUES ('980501003', '0501', 68);
INSERT INTO `studentgrade` VALUES ('980501003', '0502', 64);
INSERT INTO `studentgrade` VALUES ('980501003', '0503', 87);
INSERT INTO `studentgrade` VALUES ('980501004', '0501', 83);
INSERT INTO `studentgrade` VALUES ('980501004', '0502', 87);
INSERT INTO `studentgrade` VALUES ('980501004', '0503', 74);
INSERT INTO `studentgrade` VALUES ('980501005', '0502', 90);
INSERT INTO `studentgrade` VALUES ('980501005', '0503', 83);
INSERT INTO `studentgrade` VALUES ('980501006', '0501', 86);
INSERT INTO `studentgrade` VALUES ('980501006', '0503', 99);
INSERT INTO `studentgrade` VALUES ('980501007', '0502', 68);
INSERT INTO `studentgrade` VALUES ('980501007', '0503', 95);
INSERT INTO `studentgrade` VALUES ('980501008', '0501', 83);
INSERT INTO `studentgrade` VALUES ('980501008', '0502', 80);
INSERT INTO `studentgrade` VALUES ('980501008', '0503', 91);
INSERT INTO `studentgrade` VALUES ('980501009', '0501', 95);
INSERT INTO `studentgrade` VALUES ('980501009', '0502', 80);
INSERT INTO `studentgrade` VALUES ('980501009', '0503', 89);
INSERT INTO `studentgrade` VALUES ('980501010', '0501', 96);
INSERT INTO `studentgrade` VALUES ('980501010', '0502', 66);
INSERT INTO `studentgrade` VALUES ('980501010', '0503', 70);
INSERT INTO `studentgrade` VALUES ('980501013', '0501', 65);
INSERT INTO `studentgrade` VALUES ('980501015', '0502', 85);
INSERT INTO `studentgrade` VALUES ('980501015', '0503', 81);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `Teac_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Teac_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Teac_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Birthday` date NULL DEFAULT NULL,
  `TechPost` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Depar_id` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Teac_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Salary` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Teac_id`) USING BTREE,
  INDEX `FK_Teac_Dept`(`Depar_id`) USING BTREE,
  CONSTRAINT `FK_Teac_Dept` FOREIGN KEY (`Depar_id`) REFERENCES `department` (`Depar_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0102', '聂益桂', '女', '1962-04-11', '教授', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0103', '练菲彰', '男', '1975-09-04', '教授', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0104', '钟开滨', '男', '1977-04-24', '讲师', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0105', '汤俊逸', '女', '1973-09-24', '讲师', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0106', '沈军靖', '男', '1976-09-22', '助理教师', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0107', '邝越影', '男', '1977-06-02', '教授', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0108', '艾彤荣', '男', '1971-04-02', '讲师', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0109', '蚁贺薇', '男', '1964-07-24', '教授', '01', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0202', '刘伙鹰', '女', '1966-04-21', '副教授', '02', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0203', '万马金', '男', '1962-10-01', '教授', '02', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0204', '艾彤荣', '男', '1963-06-08', '教授', '02', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0205', '马祥艳', '男', '1976-11-21', '副教授', '02', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0206', '祁铠沁', '男', '1976-11-15', '教授', '02', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0207', '池显敏', '女', '1977-10-06', '助理教师', '02', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0301', '阳辉辉', '男', '1967-07-03', '副教授', '03', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0302', '黄中中', '女', '1964-07-06', '副教授', '03', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0303', '施怀舟', '女', '1970-08-06', '教授', '03', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0304', '苏洪澜', '男', '1962-10-16', '助理教师', '03', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0501', '祁宪戎', '女', '1968-06-21', '教授', '05', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0502', '邓焯翔', '女', '1971-03-02', '助理教师', '05', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0503', '万加尔', '女', '1966-03-27', '副教授', '05', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0504', '左骏俊', '女', '1961-05-18', '讲师', '05', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0505', '蚁钢驹', '男', '1960-10-09', '讲师', '05', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0506', '金贵成', '女', '1975-06-10', '教授', '05', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0507', '秦季基', '男', '1975-11-19', '讲师', '05', '13855551234', 50000);
INSERT INTO `teacher` VALUES ('0508', 'aa', '男', NULL, NULL, '01', '13855551234', 50000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `User_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Power` int(11) NOT NULL,
  PRIMARY KEY (`User_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('000503001', '123456', 2);
INSERT INTO `user` VALUES ('000503002', '123456', 2);
INSERT INTO `user` VALUES ('000503003', '123456', 2);
INSERT INTO `user` VALUES ('000503004', '123456', 2);
INSERT INTO `user` VALUES ('000503005', '123456', 2);
INSERT INTO `user` VALUES ('000503006', '123456', 2);
INSERT INTO `user` VALUES ('000503007', '123456', 2);
INSERT INTO `user` VALUES ('000503008', '123456', 2);
INSERT INTO `user` VALUES ('0102', '123456', 1);
INSERT INTO `user` VALUES ('0103', '123456', 1);
INSERT INTO `user` VALUES ('0104', '123456', 1);
INSERT INTO `user` VALUES ('0105', '123456', 1);
INSERT INTO `user` VALUES ('0106', '123456', 1);
INSERT INTO `user` VALUES ('0107', '123456', 1);
INSERT INTO `user` VALUES ('0108', '123456', 1);
INSERT INTO `user` VALUES ('0109', '123456', 1);
INSERT INTO `user` VALUES ('0202', '123456', 1);
INSERT INTO `user` VALUES ('0203', '123456', 1);
INSERT INTO `user` VALUES ('0204', '123456', 1);
INSERT INTO `user` VALUES ('0205', '123456', 1);
INSERT INTO `user` VALUES ('0206', '123456', 1);
INSERT INTO `user` VALUES ('0207', '123456', 1);
INSERT INTO `user` VALUES ('0301', '123456', 1);
INSERT INTO `user` VALUES ('0302', '123456', 1);
INSERT INTO `user` VALUES ('0303', '123456', 1);
INSERT INTO `user` VALUES ('0304', '123456', 1);
INSERT INTO `user` VALUES ('0501', '123456', 1);
INSERT INTO `user` VALUES ('0502', '123456', 1);
INSERT INTO `user` VALUES ('0503', '123456', 1);
INSERT INTO `user` VALUES ('0504', '123456', 1);
INSERT INTO `user` VALUES ('0505', '123456', 1);
INSERT INTO `user` VALUES ('0506', '123456', 1);
INSERT INTO `user` VALUES ('0507', '123456', 1);
INSERT INTO `user` VALUES ('0508', '123456', 1);
INSERT INTO `user` VALUES ('980101001', '123456', 2);
INSERT INTO `user` VALUES ('980101002', '123456', 2);
INSERT INTO `user` VALUES ('980101003', '123456', 2);
INSERT INTO `user` VALUES ('980101004', '123456', 2);
INSERT INTO `user` VALUES ('980101005', '123456', 2);
INSERT INTO `user` VALUES ('980101006', '123456', 2);
INSERT INTO `user` VALUES ('980101007', '123456', 2);
INSERT INTO `user` VALUES ('980101010', '123456', 2);
INSERT INTO `user` VALUES ('980101011', '123456', 2);
INSERT INTO `user` VALUES ('980101012', '123456', 2);
INSERT INTO `user` VALUES ('980101013', '123456', 2);
INSERT INTO `user` VALUES ('980101014', '123456', 2);
INSERT INTO `user` VALUES ('980101015', '123456', 2);
INSERT INTO `user` VALUES ('980101016', '123456', 2);
INSERT INTO `user` VALUES ('980101017', '123456', 2);
INSERT INTO `user` VALUES ('980101018', '123456', 2);
INSERT INTO `user` VALUES ('980101990', '123456', 2);
INSERT INTO `user` VALUES ('980101991', '123456', 2);
INSERT INTO `user` VALUES ('980101992', '123456', 2);
INSERT INTO `user` VALUES ('980104001', '123456', 2);
INSERT INTO `user` VALUES ('980104003', '123456', 2);
INSERT INTO `user` VALUES ('980104004', '123456', 2);
INSERT INTO `user` VALUES ('980104005', '123456', 2);
INSERT INTO `user` VALUES ('980104006', '123456', 2);
INSERT INTO `user` VALUES ('980104008', '123456', 2);
INSERT INTO `user` VALUES ('980104009', '123456', 2);
INSERT INTO `user` VALUES ('980201001', '123456', 2);
INSERT INTO `user` VALUES ('980201002', '123456', 2);
INSERT INTO `user` VALUES ('980201004', '123456', 2);
INSERT INTO `user` VALUES ('980201005', '123456', 2);
INSERT INTO `user` VALUES ('980201006', '123456', 2);
INSERT INTO `user` VALUES ('980201007', '123456', 2);
INSERT INTO `user` VALUES ('980201009', '123456', 2);
INSERT INTO `user` VALUES ('980203001', '123456', 2);
INSERT INTO `user` VALUES ('980203002', '123456', 2);
INSERT INTO `user` VALUES ('980203003', '123456', 2);
INSERT INTO `user` VALUES ('980203004', '123456', 2);
INSERT INTO `user` VALUES ('980203005', '123456', 2);
INSERT INTO `user` VALUES ('980203006', '123456', 2);
INSERT INTO `user` VALUES ('980203008', '123456', 2);
INSERT INTO `user` VALUES ('980203009', '123456', 2);
INSERT INTO `user` VALUES ('980203010', '123456', 2);
INSERT INTO `user` VALUES ('980203012', '123456', 2);
INSERT INTO `user` VALUES ('980203013', '123456', 2);
INSERT INTO `user` VALUES ('980203014', '123456', 2);
INSERT INTO `user` VALUES ('980203016', '123456', 2);
INSERT INTO `user` VALUES ('980203017', '123456', 2);
INSERT INTO `user` VALUES ('980203019', '123456', 2);
INSERT INTO `user` VALUES ('980203020', '123456', 2);
INSERT INTO `user` VALUES ('980203021', '123456', 2);
INSERT INTO `user` VALUES ('980203022', '123456', 2);
INSERT INTO `user` VALUES ('980203023', '123456', 2);
INSERT INTO `user` VALUES ('980203024', '123456', 2);
INSERT INTO `user` VALUES ('980203025', '123456', 2);
INSERT INTO `user` VALUES ('980203026', '123456', 2);
INSERT INTO `user` VALUES ('980203027', '123456', 2);
INSERT INTO `user` VALUES ('980203028', '123456', 2);
INSERT INTO `user` VALUES ('980203029', '123456', 2);
INSERT INTO `user` VALUES ('980501001', '123456', 2);
INSERT INTO `user` VALUES ('980501002', '123456', 2);
INSERT INTO `user` VALUES ('980501003', '123456', 2);
INSERT INTO `user` VALUES ('980501004', '123456', 2);
INSERT INTO `user` VALUES ('980501005', '123456', 2);
INSERT INTO `user` VALUES ('980501006', '123456', 2);
INSERT INTO `user` VALUES ('980501007', '123456', 2);
INSERT INTO `user` VALUES ('980501008', '123456', 2);
INSERT INTO `user` VALUES ('980501009', '123456', 2);
INSERT INTO `user` VALUES ('980501010', '123456', 2);
INSERT INTO `user` VALUES ('980501013', '123456', 2);
INSERT INTO `user` VALUES ('980501015', '123456', 2);
INSERT INTO `user` VALUES ('990102001', '123456', 2);
INSERT INTO `user` VALUES ('990102002', '123456', 2);
INSERT INTO `user` VALUES ('990102003', '123456', 2);
INSERT INTO `user` VALUES ('990102004', '123456', 2);
INSERT INTO `user` VALUES ('990102005', '123456', 2);
INSERT INTO `user` VALUES ('990102006', '123456', 2);
INSERT INTO `user` VALUES ('990102007', '123456', 2);
INSERT INTO `user` VALUES ('990102008', '123456', 2);
INSERT INTO `user` VALUES ('990102012', '123456', 2);
INSERT INTO `user` VALUES ('990102013', '123456', 2);
INSERT INTO `user` VALUES ('990102014', '123456', 2);
INSERT INTO `user` VALUES ('990102015', '123456', 2);
INSERT INTO `user` VALUES ('990102016', '123456', 2);
INSERT INTO `user` VALUES ('990102017', '123456', 2);
INSERT INTO `user` VALUES ('990102018', '123456', 2);
INSERT INTO `user` VALUES ('990102019', '123456', 2);
INSERT INTO `user` VALUES ('990102020', '123456', 2);
INSERT INTO `user` VALUES ('990102021', '123456', 2);
INSERT INTO `user` VALUES ('990102990', '123456', 2);
INSERT INTO `user` VALUES ('990105001', '123456', 2);
INSERT INTO `user` VALUES ('990105002', '123456', 2);
INSERT INTO `user` VALUES ('990105003', '123456', 2);
INSERT INTO `user` VALUES ('990105004', '123456', 2);
INSERT INTO `user` VALUES ('990105005', '123456', 2);
INSERT INTO `user` VALUES ('990105006', '123456', 2);
INSERT INTO `user` VALUES ('990105010', '123456', 2);
INSERT INTO `user` VALUES ('990105011', '123456', 2);
INSERT INTO `user` VALUES ('990105013', '123456', 2);
INSERT INTO `user` VALUES ('990105014', '123456', 2);
INSERT INTO `user` VALUES ('990105015', '123456', 2);
INSERT INTO `user` VALUES ('990105018', '123456', 2);
INSERT INTO `user` VALUES ('990502001', '123456', 2);
INSERT INTO `user` VALUES ('990502002', '123456', 2);
INSERT INTO `user` VALUES ('990502004', '123456', 2);
INSERT INTO `user` VALUES ('990502006', '123456', 2);
INSERT INTO `user` VALUES ('990502007', '123456', 2);
INSERT INTO `user` VALUES ('990502008', '123456', 2);
INSERT INTO `user` VALUES ('990502009', '123456', 2);
INSERT INTO `user` VALUES ('s25328', '123456', 2);

-- ----------------------------
-- View structure for class_select_num2
-- ----------------------------
DROP VIEW IF EXISTS `class_select_num2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `class_select_num2` AS select `student`.`Class_id` AS `Class_id`,`class`.`Class_name` AS `Class_name`,count(`student`.`Stu_id`) AS `Stu_num` from (`student` join `class`) where (`student`.`Class_id` = `class`.`Class_id`) group by `student`.`Class_id`,`class`.`Class_name`;

-- ----------------------------
-- View structure for class_top1
-- ----------------------------
DROP VIEW IF EXISTS `class_top1`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `class_top1` AS select `school_ena`.`class`.`Class_id` AS `Class_id`,`school_ena`.`class`.`Class_name` AS `Class_name`,max(`avg_grade`.`avg_grade`) AS `max_avg_grade` from (((`school_ena`.`studentgrade` join `school_ena`.`class`) join `school_ena`.`student`) join (select `school_ena`.`student`.`Stu_id` AS `Stu_id`,avg(`school_ena`.`studentgrade`.`Grade`) AS `avg_grade` from (`school_ena`.`student` join `school_ena`.`studentgrade`) where (`school_ena`.`studentgrade`.`Stu_id` = `school_ena`.`student`.`Stu_id`) group by `school_ena`.`student`.`Stu_id`) `avg_grade`) where ((`school_ena`.`studentgrade`.`Stu_id` = `school_ena`.`student`.`Stu_id`) and (`school_ena`.`student`.`Stu_id` = `avg_grade`.`Stu_id`) and (`school_ena`.`class`.`Class_id` = `school_ena`.`student`.`Class_id`)) group by `school_ena`.`class`.`Class_id`,`school_ena`.`class`.`Class_name`;

-- ----------------------------
-- View structure for course_select_num
-- ----------------------------
DROP VIEW IF EXISTS `course_select_num`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_select_num` AS select `studentgrade`.`Course_id` AS `Course_id`,`course`.`Course_name` AS `Course_name`,count(`student`.`Stu_id`) AS `Stu_num` from ((`student` join `studentgrade`) join `course`) where ((`studentgrade`.`Course_id` = `course`.`Course_id`) and (`student`.`Stu_id` = `studentgrade`.`Stu_id`)) group by `studentgrade`.`Course_id`,`course`.`Course_name`;

-- ----------------------------
-- View structure for course_top1
-- ----------------------------
DROP VIEW IF EXISTS `course_top1`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_top1` AS select `course`.`Course_id` AS `Course_id`,`course`.`Course_name` AS `Course_name`,max(`studentgrade`.`Grade`) AS `max_grade` from (`studentgrade` join `course`) group by `course`.`Course_id`,`course`.`Course_name`;

-- ----------------------------
-- View structure for student_full_info
-- ----------------------------
DROP VIEW IF EXISTS `student_full_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_full_info` AS select `student`.`Stu_id` AS `Stu_id`,`student`.`Stu_name` AS `Stu_name`,avg(`studentgrade`.`Grade`) AS `Score_avg`,`class`.`Class_name` AS `Class_name`,`teacher`.`Teac_name` AS `Director_name`,`department`.`Depar_name` AS `Depar_name` from ((((`student` join `class`) join `teacher`) join `department`) join `studentgrade`) where ((`student`.`Class_id` = `class`.`Class_id`) and (`class`.`Director` = `teacher`.`Teac_id`) and (`student`.`Stu_id` = `studentgrade`.`Stu_id`) and (`class`.`Depar_id` = `department`.`Depar_id`)) group by `student`.`Stu_id`,`student`.`Stu_name`,`class`.`Class_name`,`teacher`.`Teac_name`,`department`.`Depar_name`;

-- ----------------------------
-- View structure for teacher_full_info
-- ----------------------------
DROP VIEW IF EXISTS `teacher_full_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teacher_full_info` AS select `teacher`.`Teac_id` AS `Teac_id`,`teacher`.`Teac_name` AS `Teac_name`,`teacher`.`Salary` AS `Salary`,`teacher`.`Teac_sex` AS `Teac_sex`,`teacher`.`Birthday` AS `Birthday`,`teacher`.`TechPost` AS `TechPost`,`department`.`Depar_name` AS `Depar_name` from (`teacher` join `department`) where (`teacher`.`Depar_id` = `department`.`Depar_id`);

-- ----------------------------
-- Procedure structure for getFailStuByCourseId
-- ----------------------------
DROP PROCEDURE IF EXISTS `getFailStuByCourseId`;
delimiter ;;
CREATE PROCEDURE `getFailStuByCourseId`(IN cid varchar(4))
BEGIN
    Select Stu_id, Grade
    From StudentGrade
    Where Course_id = cid and Grade < 60;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `Auto_change_num`;
delimiter ;;
CREATE TRIGGER `Auto_change_num` AFTER INSERT ON `student` FOR EACH ROW begin
    update Department set Depar_number = 
    (select count(*)
    from Student, Class
    where Student.Class_id = Class.Class_id
    and Depar_id = Department.Depar_id)
    +
    (select count(*)
    from Teacher
    where Depar_id = Department.Depar_id);

    update class set Class_number = 
    (select count(*)
    from Student
    where Student.Class_id = Class.Class_id);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `Auto_create_Student_user`;
delimiter ;;
CREATE TRIGGER `Auto_create_Student_user` AFTER INSERT ON `student` FOR EACH ROW begin
    insert into User
    (User_id, Password, Power)
    VALUES
    (new.Stu_id, '123456', 2);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table studentgrade
-- ----------------------------
DROP TRIGGER IF EXISTS `Auto_score_avg`;
delimiter ;;
CREATE TRIGGER `Auto_score_avg` AFTER INSERT ON `studentgrade` FOR EACH ROW begin
    update Student set Score_avg = 
    (select avg(Grade)
    from StudentGrade
    where StudentGrade.Stu_id = new.Stu_id)
    where Stu_id = new.Stu_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table teacher
-- ----------------------------
DROP TRIGGER IF EXISTS `Auto_create_Teacher_user`;
delimiter ;;
CREATE TRIGGER `Auto_create_Teacher_user` AFTER INSERT ON `teacher` FOR EACH ROW begin
    insert into User
    (User_id, Password, Power)
    VALUES
    (new.Teac_id, '123456', 1);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table teacher
-- ----------------------------
DROP TRIGGER IF EXISTS `Set_salary_min`;
delimiter ;;
CREATE TRIGGER `Set_salary_min` BEFORE UPDATE ON `teacher` FOR EACH ROW begin
    DECLARE Total_course_hour INT;
    
    Select SUM(Course_hour) INTO Total_course_hour 
    from Course, CourseTeacher
    where Course.Course_id = CourseTeacher.Course_id and Teac_id = new.Teac_id;
    
    IF new.Salary < 5000 + Total_course_hour*30/12 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: Unreasonable Salary!';
    END IF;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
