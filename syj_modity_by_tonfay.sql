/*
Navicat MySQL Data Transfer

Source Server         : syj_modity_by_tonfay
Source Server Version : 50173
Source Host           : 101.200.141.102:3306
Source Database       : syj_modity_by_tonfay

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2019-11-09 21:35:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `codeId` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `codeName` varchar(255) NOT NULL,
  `codeTxt` longtext,
  `codeDate` datetime DEFAULT NULL,
  `userId` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`codeId`),
  KEY `user-code` (`userId`),
  CONSTRAINT `user-code` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of code
-- ----------------------------
INSERT INTO `code` VALUES ('1', 'code1', 'public class A{ public static void main(String[] args){ System.out.print(\"java\");}}', '2019-04-10 16:54:31', '1');
INSERT INTO `code` VALUES ('2', 'code1', 'public class A{ public static void main(String[] args){ System.out.print(\"java\");}}', '2019-04-15 19:47:18', '2');
INSERT INTO `code` VALUES ('3', 'codew', 'public class A{ public static void main(String[] args){ System.out.print(\"qeqwewq\");}}', '2019-04-24 19:48:39', '2');
INSERT INTO `code` VALUES ('4', 'code4396', '				public class A{\n					public static void main(String[] args){\n						System.out.print(\"Hello world!\");\n					}\n				}\n			', '2019-04-22 18:08:28', '2');
INSERT INTO `code` VALUES ('5', '11', '				public class A{\n					public static void main(String[] args){\n						System.out.print(\"???\");\n					}\n				}\n			', '2019-04-22 18:10:56', '2');
INSERT INTO `code` VALUES ('6', 'wdwadew', '				public class A{\n					public static void main(String[] args){\n					ewqerqw\n					}\n				}\n			', '2019-04-22 18:47:22', '2');
INSERT INTO `code` VALUES ('7', '23', '				public class A{\n					public static void main(String[] args){\n						System.out.print(\"Hello world!\");\n					}\n				}\n			', '2019-05-05 15:41:14', '2');
INSERT INTO `code` VALUES ('8', '邵玉健1', '				public  A{\n					public static void main(String[] args){\n						System.out.print(\"我爱学习\")；\n					}\n				}\n			', '2019-05-19 12:12:30', '7');
INSERT INTO `code` VALUES ('9', 'ii', '				public class A{\n					public static void main(String[] args){\n						System.out.print(\"Hello world!\");\n					}\n				}\n			', '2019-05-25 10:47:20', '10');
INSERT INTO `code` VALUES ('10', '我的第一段代码', '				public class A{\n					public static void main(String[] args){\n						System.out.print(\"Hello world!\");\n					}\n				}\n			', '2019-05-31 23:02:41', '11');
INSERT INTO `code` VALUES ('11', '我的第一段代码', '				public class A{\n					public static void main(String[] args){\n						System.out.print(\"佛挡杀佛!\");\n					}\n				}\n			', '2019-06-21 13:50:12', '12');
INSERT INTO `code` VALUES ('12', '我', '				public class A{\n					public static void main(String[] args){\n						System.out.print(\"Hello world!\");\n					}\n				}\n			', '2019-06-21 13:50:32', '12');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `q_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `q_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `question` varchar(255) COLLATE utf8_bin DEFAULT '',
  `answer` longtext COLLATE utf8_bin,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('0', '*******输出质数*******', '请编写代码输出1~100之间所有的质数', 0x7075626C696320636C6173732054657374207B0A090909097075626C69632073746174696320766F6964206D61696E28537472696E675B5D206172677329207B0A0909090909696E74206A3B0A0909090909666F722028696E742069203D20323B2069203C3D203130303B20692B2B29202F2F2031E4B88DE698AFE7B4A0E695B0EFBC8CE68980E4BBA5E79BB4E68EA5E4BB8E32E5BC80E5A78BE5BEAAE78EAF0A09090909097B0A0909090909096A203D20323B0A0909090909097768696C652028692025206A20213D2030297B0A090909090909096A2B2B3B202F2F20E6B58BE8AF9532E887B369E79A84E695B0E5AD97E698AFE590A6E883BDE8A2AB69E695B4E999A4EFBC8CE5A682E4B88DE883BDE5B0B1E887AAE58AA00A09090909090909696620286A203D3D2069297B202F2F20E5BD93E69C89E8A2ABE695B4E999A4E79A84E695B0E5AD97E697B6EFBC8CE588A4E696ADE5AE83E698AFE4B88DE698AFE887AAE8BAAB0A090909090909090953797374656D2E6F75742E7072696E746C6E2869293B202F2F20E5A682E69E9CE698AFE5B0B1E68993E58DB0E587BAE695B0E5AD970A090909090909097D0A0909090909097D0A09090909097D0A0909097D);
INSERT INTO `exam` VALUES ('1', '排序问题', '将数组\r\r\n34,5,6,23,77,4,66按从小到大顺序输出', 0x696E745B5D206172726179203D207B352C332C392C362C31302C312C32332C3330207D3B0AC2A020C2A020C2A020C2A020666F722028696E742069203D20303B2069203C2061727261792E4C656E677468202D20313B20692B2B290AC2A020C2A020C2A020C2A0207B0AC2A020C2A020C2A020C2A020C2A020C2A020666F722028696E74206A203D20303B206A203C2061727261792E4C656E677468202D2069202D20313B206A2B2B290AC2A020C2A020C2A020C2A020C2A020C2A0207B0AC2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A020696E742074656D70203D2061727261795B6A5D3B20C2A020C2A020C2A020C2A020C2A020C2A00AC2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A0206966202861727261795B6A5D203E2061727261795B6A202B20315D2920C2A020C2A00AC2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A0207B0AC2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A02061727261795B6A5D203D2061727261795B6A202B20315D3B20C2A0C2A00AC2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A02061727261795B6A202B20315D203D2074656D703B20C2A020C2A0C2A00AC2A020C2A020C2A020C2A020C2A020C2A020C2A020C2A0207D0AC2A020C2A020C2A020C2A020C2A020C2A0207D0AC2A020C2A020C2A020C2A0207D0AC2A020C2A020C2A020C2A020666F722028696E742069203D20303B2069203C2061727261792E4C656E6774683B20692B2B290AC2A020C2A020C2A020C2A0207B0AC2A020C2A020C2A020C2A020C2A020C2A020436F6E736F6C652E57726974654C696E652861727261795B695D293B0AC2A020C2A020C2A020C2A0207D);
INSERT INTO `exam` VALUES ('2', '求总和', '求1~100所有数的总和', 0x7075626C69632020636C617373202054657374337B0D0A0D0A7075626C696320207374617469632020766F696420206D61696E2028537472696E67205B5D2061726773297B0D0A0D0A09696E74202073756D3D303B0D0A0D0A09666F7228696E74693D313B693C3D3130303B692B2B297B0D0A0D0A0973756D2B3D693B0D0A0D0A7D0D0A0D0A53797374656D2E6F75742E7072696E746C6E2822E4B880E588B0E4B880E799BEE4B98BE997B4E79A84E695B4E695B0E5928CE4B8BA3A222B73756D293B0D0A0D0A7D0D0A0D0A7D);
INSERT INTO `exam` VALUES ('3', '公因数与公倍数', '输入两个正整数 m 和 n，求其最大公约数和最小公倍数', 0x2F2AE59CA8E5BEAAE78EAFE4B8ADEFBC8CE58FAAE8A681E999A4E695B0E4B88DE7AD89E4BA8E2030EFBC8CE794A8E8BE83E5A4A7E695B0E999A4E4BBA5E8BE83E5B08FE79A84E695B0EFBC8CE5B086E5B08FE79A84E4B880E4B8AAE695B0E4BD9CE4B8BAE4B88BE4B880E8BDAEE5BEAAE78EAFE79A840D0A2020E5A4A7E695B0EFBC8CE58F96E5BE97E79A84E4BD99E695B0E4BD9CE4B8BAE4B88BE4B880E8BDAEE5BEAAE78EAFE79A84E8BE83E5B08FE79A84E695B0EFBC8CE5A682E6ADA4E5BEAAE78EAFE79BB4E588B0E8BE83E5B08FE79A84E695B0E79A84E580BCE4B8BA2030EFBC8CE8BF94E59B9EE8BE83E5A4A70D0A2020E79A84E695B0EFBC8CE6ADA4E695B0E58DB3E4B8BAE69C80E5A4A7E585ACE7BAA6E695B0EFBC8CE69C80E5B08FE585ACE5808DE695B0E4B8BAE4B8A4E695B0E4B98BE7A7AFE999A4E4BBA5E69C80E5A4A7E585ACE7BAA6E695B0E380822A202F0D0A20207061636B61676520636F6D2E646179323B0D0A09696D706F7274206A6176612E7574696C2E2A3B0D0A097075626C696320636C617373205465737434207B0D0A20202020207075626C696320737461746963205363616E6E657220696E707574203D206E6577205363616E6E65722853797374656D2E696E293B0D0A0909097075626C69632073746174696320766F6964206D61696E28537472696E675B5D206172677329207B0D0A20202020202020202053797374656D2E6F75742E7072696E746C6E2822E8AFB7E8BE93E585A5E4B8A4E4B8AAE695B0E69DA5E6B182E69C80E5A4A7E585ACE7BAA6E695B0E5928CE69C80E5B08FE585ACE5808DE695B0EFBC9A22293B0D0A20202020202020202053797374656D2E6F75742E7072696E746C6E2822E7ACACE4B880E4B8AAE695B0EFBC9A22293B0D0A202020202020202020696E742061203D20696E7075742E6E657874496E7428293B0D0A20202020202020202053797374656D2E6F75742E7072696E746C6E2822E7ACACE4BA8CE4B8AAE695B0EFBC9A22293B0D0A202020202020202020696E742062203D20696E7075742E6E657874496E7428293B0D0A20202020202020202044656666206364203D206E6577204465666628293B0D0A202020202020202020696E742078203D2063642E6465666628612C2062293B2F2FE8B083E794A8E587BDE695B0E689BEE588B0E69C80E5A4A7E585ACE7BAA6E695B00D0A202020202020202020696E742079203D2061202A2062202F20783B2F2FE4B8A4E4B8AAE695B0E79A84E7A7AFE999A4E4BBA5E69C80E5A4A7E585ACE7BAA6E695B0E5B0B1E698AFE69C80E5B08FE585ACE5808DE695B00D0A20202020202020202053797374656D2E6F75742E7072696E746C6E2822E69C80E5A4A7E585ACE7BAA6E695B0E4B8BAEFBC9A222B78293B0D0A20202020202020202053797374656D2E6F75742E7072696E746C6E2822E69C80E5B08FE585ACE5808DE695B0E4B8BAEFBC9A222B79293B0D0A20202020207D0D0A200D0A207D0D0A20636C61737320446566667B0D0A20202020207075626C696320696E74206465666628696E7420612C20696E742062290D0A20202020207B0D0A20202020202020202069662861203C2062290D0A2020202020202020207B0D0A2020202020202020202020202061203D2061205E20623B0D0A09090909090962203D2061205E20623B0D0A2020202020202020202020202061203D2061205E20623B0D0A2020202020202020207D0D0A2020202020202020207768696C65286220213D2030290D0A2020202020202020207B0D0A2020202020202020202020202069662861203D3D2062290D0A202020202020202020202020202020202072657475726E20613B0D0A20202020202020202020202020656C73650D0A202020202020202020202020207B0D0A2020202020202020202020202020202020696E74206B203D2061202520623B0D0A202020202020202020202020202020202061203D2062203B0D0A202020202020202020202020202020202062203D206B3B0D0A202020202020202020202020207D0D0A2020202020202020207D0D0A20202020202020202072657475726E20613B0D0A20202020207D0D0A207D);
INSERT INTO `exam` VALUES ('14', '小可爱', '手打萨达所', 0x7075626C696320636C61737320417B0A202020207075626C69632073746174696320766F6964206D61696E28297B0A202020202020202020202053797374656D2E6F75742E7072696E742831313131293B0A7D0A7D);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `testId` int(2) NOT NULL AUTO_INCREMENT,
  `testTxt` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `a` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `b` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `c` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `d` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  `a_choose` int(11) DEFAULT '0',
  `b_choose` int(11) DEFAULT '0',
  `c_choose` int(11) DEFAULT '0',
  `d_choose` int(11) DEFAULT '0',
  `isTrue` int(11) DEFAULT '0',
  PRIMARY KEY (`testId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'Java整形的字节序是( )。', 'Little-Endian(小端)', 'Little-Endian(大端)', '由运行程序的CPU决定', '由编译程序的CPU决定', 'B', '1', '3', '4', '1', '6', '5');
INSERT INTO `test` VALUES ('2', '下面关于Java语言的描述中，不正确的是( )。', '可以使用goto跳出循环', '关键字final修饰的类无法被继承', 'String对象的内容是无法修改的', 'Java类可以实现多个接口', 'A', '1', '4', '2', '5', '5', '5');
INSERT INTO `test` VALUES ('3', '以下关于类的描述中，正确的是( )。', '只要没有定义不带参数的构造方法，JVM都会为类生成一个默认的构造方法', '局部变量的作用范围仅仅在定义它的方法内，或者是在定义它的控制流块中', '使用其他类的方法仅仅需要引用方法的名字即可', '在类中定义的变量称为类的成员变量，在其他类中可以直接使用', 'B', '2', '2', '5', '4', '1', '5');
INSERT INTO `test` VALUES ('4', '以下不是Object类的方法是( )。', 'hashCode()', 'finalize()', 'notify()', 'hashNext()', 'D', '1', '4', '4', '2', '4', '2');
INSERT INTO `test` VALUES ('5', 'Math.round(12.5)的返回值是( )。', '12', '13', '12.5', '0', 'B', '1', '3', '3', '4', '3', '4');
INSERT INTO `test` VALUES ('6', 'Math.round(-12.5)的返回值是( )。', '-12', '-13', '-12.5', '0', 'A', '1', '6', '2', '3', '6', '5');
INSERT INTO `test` VALUES ('7', '下列关于Java语言基础知识的描述中，正确的是( )。', '类是方法和变量的结合体', '抽象类或接口可以被实例化', '数组是无需数据的集合', '类成员数据必须是公有的', 'A', '1', '2', '3', '4', '2', '3');
INSERT INTO `test` VALUES ('8', '下列描述中，正确的是( )。', 'Java程序经编译后会产生Machine Code(机器码)', 'Java程序经编译后会产生Byte Code(字节码)', 'Java程序经编译后会产生DLL(动态链接库)', '以上描述都不正确', 'B', '1', '6', '3', '1', '6', '5');
INSERT INTO `test` VALUES ('9', 'Java语言使从( )语言改进重新设计的。\n*****修改一下******', 'BASIC', 'C++', 'Pascal', 'Ada', 'B', '1', '4', '4', '4', '1', '3');
INSERT INTO `test` VALUES ('10', '下列关于Java语言的描述中，正确的使( )。', 'Java语言容许单独的过程与函数存在', 'Java语言容许单独的方法存在', 'Java语言中的方法属于类中的成员', 'Java语言中的方法必定隶属于某一类(对象)', 'D', '1', '3', '1', '4', '3', '3');
INSERT INTO `test` VALUES ('11', '下列关于按值传递与按引用传递的描述中，不正确的是( )。', '按值传递不会改变实际参数的数值', '按引用传递能改变实际参数的参考地址', '按引用传递能改变实际参数的内容', '按引用传递不能改变实际参数的参考地址。', 'B', '1', '4', '4', '3', '1', '3');
INSERT INTO `test` VALUES ('17', '下列关于实例方法正确的是', '实例方法可直接调用超类的类方法', '实例方法可直接调用超类的实例方法', '实例方法可直接调用其他类的实例方法', '实例方法可直接调用本类的类方法', 'D', '2', '1', '8', '4', '2', '6');
INSERT INTO `test` VALUES ('18', '修改的内容', '添加的a', '添加的b', '添加的c', '添加的d', 'D', '3', '0', '2', '0', '0', '0');
INSERT INTO `test` VALUES ('19', '下面的类不能被继承的是', 'Number', 'Thread', 'Double', 'ClassLoader', 'C', '3', '0', '1', '0', '0', '0');
INSERT INTO `test` VALUES ('20', '下面的类不能被继承的是', '萨达', '大萨达', '大萨达', '大萨达', 'D', '4', '0', '0', '0', '0', '0');
INSERT INTO `test` VALUES ('21', '萨达', '第三方', '32', '大', '热热', 'B', '4', '0', '0', '0', '0', '0');
INSERT INTO `test` VALUES ('22', '是的撒', '是的撒', '223', '33', '23', 'A', '5', '0', '0', '0', '0', '0');
INSERT INTO `test` VALUES ('23', '达到', '大', '23', '11', '43', 'A', '5', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for testPaper
-- ----------------------------
DROP TABLE IF EXISTS `testPaper`;
CREATE TABLE `testPaper` (
  `paperId` int(11) NOT NULL AUTO_INCREMENT,
  `paperName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`paperId`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of testPaper
-- ----------------------------
INSERT INTO `testPaper` VALUES ('1', 'Java语言基础知识');
INSERT INTO `testPaper` VALUES ('2', '面向对象技术');
INSERT INTO `testPaper` VALUES ('3', '关键字');
INSERT INTO `testPaper` VALUES ('4', '基本类型和运算符');
INSERT INTO `testPaper` VALUES ('5', '数组');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `power` int(1) DEFAULT '1',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '王文杰', 'root', '1');
INSERT INTO `user` VALUES ('2', '徐东明', '1111', '1');
INSERT INTO `user` VALUES ('3', '王晓东', '1234', '1');
INSERT INTO `user` VALUES ('4', '肖杰', '1111', '2');
INSERT INTO `user` VALUES ('7', '邵玉健', '1111', '1');
INSERT INTO `user` VALUES ('8', '李印', '123456city', '1');
INSERT INTO `user` VALUES ('9', '海鸣', '1111', '1');
INSERT INTO `user` VALUES ('10', '马伟杰', '1234city', '1');
INSERT INTO `user` VALUES ('11', '徐凝慧', '111111q', '1');
INSERT INTO `user` VALUES ('12', '孙晓丽', '1234city', '1');
INSERT INTO `user` VALUES ('13', '张闫鹏', '12345678q', '1');

-- ----------------------------
-- Table structure for user_paper
-- ----------------------------
DROP TABLE IF EXISTS `user_paper`;
CREATE TABLE `user_paper` (
  `userId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_paper
-- ----------------------------
INSERT INTO `user_paper` VALUES ('1', '1');
INSERT INTO `user_paper` VALUES ('2', '1');
INSERT INTO `user_paper` VALUES ('3', '1');
INSERT INTO `user_paper` VALUES ('3', '2');
INSERT INTO `user_paper` VALUES ('7', '1');
INSERT INTO `user_paper` VALUES ('8', '1');
INSERT INTO `user_paper` VALUES ('9', '1');
INSERT INTO `user_paper` VALUES ('10', '1');
INSERT INTO `user_paper` VALUES ('11', '1');
INSERT INTO `user_paper` VALUES ('12', '1');
INSERT INTO `user_paper` VALUES ('7', '2');
INSERT INTO `user_paper` VALUES ('1', '2');
INSERT INTO `user_paper` VALUES ('1', '3');

-- ----------------------------
-- Table structure for userResult
-- ----------------------------
DROP TABLE IF EXISTS `userResult`;
CREATE TABLE `userResult` (
  `resultId` int(11) NOT NULL AUTO_INCREMENT,
  `result` int(255) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `useTime` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`resultId`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userResult
-- ----------------------------
INSERT INTO `userResult` VALUES ('11', '0', '1', '1', '4分32秒');
INSERT INTO `userResult` VALUES ('14', '20', '1', '3', '6分5秒');
INSERT INTO `userResult` VALUES ('15', '0', '2', '3', '4分7秒');
INSERT INTO `userResult` VALUES ('17', '40', '1', '7', '2分3秒');
INSERT INTO `userResult` VALUES ('20', '40', '1', '8', '23秒');
INSERT INTO `userResult` VALUES ('21', '20', '1', '2', '10秒');
INSERT INTO `userResult` VALUES ('24', '50', '1', '9', '9秒');
INSERT INTO `userResult` VALUES ('27', '30', '1', '10', '11秒');
INSERT INTO `userResult` VALUES ('28', '10', '1', '11', '7分36秒');
INSERT INTO `userResult` VALUES ('29', '30', '1', '12', '22秒');
INSERT INTO `userResult` VALUES ('30', '10', '2', '7', '8秒');
INSERT INTO `userResult` VALUES ('31', '10', '2', '1', '3秒');
INSERT INTO `userResult` VALUES ('32', '0', '3', '1', '22秒');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `videoId` int(11) NOT NULL AUTO_INCREMENT,
  `videoName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `videoTime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `videoSrc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`videoId`)
) ENGINE=MyISAM AUTO_INCREMENT=1425 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('11', 'Java基础视频_01_java概述_第一个Java代码HelloWorld', '6分26秒', 'video\\Java基础视频_01_java概述_第一个Java代码HelloWorld.mp4');
INSERT INTO `video` VALUES ('12', 'Java基础视频_01_java概述_配置Java环境变量', '10分05秒', 'video\\Java基础视频_01_java概述_配置Java环境变量.mp4');
INSERT INTO `video` VALUES ('13', 'Java基础视频_01_java概述_注释', '5分16秒', 'video\\Java基础视频_01_java概述_注释.mp4');
INSERT INTO `video` VALUES ('1421', 'io流', '11分钟00秒', 'video\\Java基础视频_08_IO流_IO流概述和分类.mp4');
INSERT INTO `video` VALUES ('2', 'Java基础视频_01_java概述_HelloWorld的解释和编写程序的一些规范', '5分56秒', 'video\\Java基础视频_01_java概述_HelloWorld的解释和编写程序的一些规范.mp4');
INSERT INTO `video` VALUES ('3', 'Java基础视频_01_java概述_Java开发工具简介', '2分23秒', 'video\\Java基础视频_01_java概述_Java开发工具简介.mp4');
INSERT INTO `video` VALUES ('4', 'Java基础视频_01_java概述_Java实现跨平台的原理', '2分00秒', 'video\\Java基础视频_01_java概述_Java实现跨平台的原理.mp4');
INSERT INTO `video` VALUES ('5', 'Java基础视频_01_java概述_JDK安装文件简介', '2分02秒', 'video\\Java基础视频_01_java概述_JDK安装文件简介.mp4');
INSERT INTO `video` VALUES ('6', 'Java基础视频_01_java概述_JDK和JRE', '4分49秒', 'video\\Java基础视频_01_java概述_JDK和JRE.mp4');
INSERT INTO `video` VALUES ('7', 'Java基础视频_01_java概述_public class和class', '6分34秒', 'video\\Java基础视频_01_java概述_public class和class.mp4');
INSERT INTO `video` VALUES ('8', 'Java基础视频_09_多线程_多线程简介', '9分03秒', 'video\\Java基础视频_09_多线程_多线程简介.mp4');
INSERT INTO `video` VALUES ('9', 'Java基础视频_06_常用类_String类常用方法', '28分45秒', 'video\\Java基础视频_06_常用类_String类常用方法.mp4');
INSERT INTO `video` VALUES ('1424', '意义', '4分10秒', 'video\\Java基础视频_08_IO流_IO流概述和分类.mp4');
INSERT INTO `video` VALUES ('1423', '视频1', '44分', 'video\\2015-11-05-1316-44.mp4');
