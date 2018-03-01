-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 03 月 01 日 16:57
-- 服务器版本: 5.6.21
-- PHP 版本: 5.4.34

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `rh`
--

-- --------------------------------------------------------

--
-- 表的结构 `carousel`
--

CREATE TABLE IF NOT EXISTS `carousel` (
  `cid` int(8) NOT NULL AUTO_INCREMENT COMMENT '轮播图片编号',
  `img_src` varchar(255) NOT NULL DEFAULT '''''' COMMENT '轮播图片路径',
  `img_title1` varchar(32) DEFAULT NULL COMMENT '大标题广告',
  `img_title2` varchar(64) DEFAULT NULL COMMENT '小标题',
  `img_detail` varchar(128) DEFAULT NULL COMMENT '广告细节',
  `is_show` enum('0','1') NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `carousel`
--

INSERT INTO `carousel` (`cid`, `img_src`, `img_title1`, `img_title2`, `img_detail`, `is_show`) VALUES
(1, 'images/2.jpg', '舒心', '明亮慵懒的主卧', '现代设计，随心变换', '1'),
(2, 'images/4.jpg', '现代', '强烈的时尚元素', '小空间，大舒适', '1'),
(3, 'images/5.jpg', '简约', '低调的奢华', '躺着坐着，说变就变', '1');

-- --------------------------------------------------------

--
-- 表的结构 `coustom_suggestion`
--

CREATE TABLE IF NOT EXISTS `coustom_suggestion` (
  `cid` int(8) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `avatar` varchar(255) NOT NULL DEFAULT '''''' COMMENT '头像',
  `cname` varchar(128) NOT NULL DEFAULT '''''' COMMENT '客户名称',
  `messages` varchar(255) NOT NULL DEFAULT '''''' COMMENT '评论信息',
  `sign` varchar(255) DEFAULT '''''' COMMENT '个性签名',
  `is_show` enum('0','1') NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `coustom_suggestion`
--

INSERT INTO `coustom_suggestion` (`cid`, `avatar`, `cname`, `messages`, `sign`, `is_show`) VALUES
(1, 'images/te.jpg', 'Roger V. Coates', '在这里可以选到自己喜欢的设计，非常的开心', '生活不仅有苟且，还有诗和远方', '1'),
(2, 'images/te1.jpg', 'Nancy M. Picker', '创意是这个时代最宝贵的东西，感觉是来对了地方', '21世纪是知识的世纪', '1'),
(3, 'images/te2.jpg', 'Ann K. Perez', '这个网站上面的服务很完善，为我省了很多麻烦', '心若在，梦就在', '1');

-- --------------------------------------------------------

--
-- 表的结构 `hot_city`
--

CREATE TABLE IF NOT EXISTS `hot_city` (
  `hid` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(255) NOT NULL COMMENT '地址',
  `name` varchar(128) NOT NULL COMMENT '城市名',
  `is_show` enum('0','1') NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `hot_city`
--

INSERT INTO `hot_city` (`hid`, `url`, `name`, `is_show`) VALUES
(1, 'images/ce.jpg', '伦敦', '1'),
(2, 'images/ce1.jpg', '悉尼', '1'),
(3, 'images/ce2.jpg', '纽约', '1'),
(4, 'images/ce3.jpg', '罗马', '1'),
(5, 'images/ce.jpg4', '新加坡', '1'),
(6, 'images/ce5.jpg', '巴黎', '1');

-- --------------------------------------------------------

--
-- 表的结构 `parter`
--

CREATE TABLE IF NOT EXISTS `parter` (
  `pid` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `trade_mark` varchar(255) NOT NULL DEFAULT '''''' COMMENT '商标图片',
  `is_show` enum('0','1') NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `parter`
--

INSERT INTO `parter` (`pid`, `trade_mark`, `is_show`) VALUES
(1, 'images/lg.png', '1'),
(2, 'images/lg1.png', '1'),
(3, 'images/lg2.png', '1'),
(4, 'images/lg3.png', '1'),
(5, 'images/lg4.png', '1'),
(6, 'images/lg5.png', '1'),
(7, 'images/lg6.png', '1'),
(8, 'images/lg7.png', '1'),
(9, 'images/lg8.png', '1'),
(10, 'images/lg9.png', '1');

-- --------------------------------------------------------

--
-- 表的结构 `project_detail`
--

CREATE TABLE IF NOT EXISTS `project_detail` (
  `pid` int(8) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `url` varchar(255) NOT NULL COMMENT '首页图片url',
  `price` int(8) NOT NULL COMMENT '每晚价格',
  `location` varchar(255) DEFAULT NULL COMMENT '位置',
  `point` float DEFAULT NULL COMMENT '评分',
  `sdetail` varchar(255) DEFAULT NULL COMMENT '小细节',
  `name` varchar(255) DEFAULT NULL COMMENT '名字',
  `review` int(8) DEFAULT NULL COMMENT '评论',
  `bdetail` varchar(255) DEFAULT NULL COMMENT '大细节',
  `is_pg` enum('0','1') NOT NULL COMMENT '工程艺术馆',
  `is_mp` enum('0','1') NOT NULL COMMENT '最受欢迎',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `project_detail`
--

INSERT INTO `project_detail` (`pid`, `url`, `price`, `location`, `point`, `sdetail`, `name`, `review`, `bdetail`, `is_pg`, `is_mp`) VALUES
(1, 'images/pc4.jpg', 2000, '奥兰多', 4.8, '奥兰多的独栋别墅', '奥兰多', 100, NULL, '0', '1'),
(2, 'images/pc5.jpg', 6800, '旧金山', 4.9, '圣马里奥，独栋别墅2卧一yu', '圣马里奥', 200, NULL, '0', '1'),
(3, 'images/pc3.jpg', 3290, '旧金山', 5, '萨利纳斯 独栋别墅4卧3浴', '萨利纳斯', 300, NULL, '0', '1'),
(4, 'images/ga.jpg', 500, '成都', 4.8, '四川成都 精致小别墅', '东立国际', 100, '东立国际开盘于2000年', '1', '0'),
(5, 'images/ga1.jpg', 2000, '大理', 5, '苍山洱海 独栋小别墅', '绿的天地', 200, '自然 清新 脱俗', '1', '0'),
(6, 'images/ga2.jpg', 1500, '丽江', 5, '毗邻香格里拉的胜地', '田野风光', 180, '舒适的黄色给人自然的感觉', '1', '0'),
(7, 'images/ga3.jpg', 400, '杭州', 4.7, '西湖边上的盛景', '阳光天下', 1000, '闹市中不一样的感觉', '1', '0');

-- --------------------------------------------------------

--
-- 表的结构 `project_picture`
--

CREATE TABLE IF NOT EXISTS `project_picture` (
  `picture_id` int(8) NOT NULL COMMENT '图片id',
  `pid` int(8) NOT NULL COMMENT '项目id 和其他表相关联',
  `sm` varchar(255) DEFAULT '''''' COMMENT '小图',
  `md` varchar(255) DEFAULT '''''' COMMENT '中图',
  `lg` varchar(255) DEFAULT '''''' COMMENT '大图',
  PRIMARY KEY (`picture_id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project_picture`
--

INSERT INTO `project_picture` (`picture_id`, `pid`, `sm`, `md`, `lg`) VALUES
(1, 1, 'images/ss.jpg', 'images/ss.jpg', 'images/ss.jpg'),
(2, 1, 'images/ss1.jpg', 'images/ss1.jpg', 'images/ss1.jpg'),
(3, 1, 'images/ss2.jpg', 'images/ss2.jpg', 'images/ss2.jpg'),
(4, 1, 'images/ss3.jpg', 'images/ss3.jpg', 'images/ss3.jpg'),
(5, 2, 'images/ss.jpg', 'images/ss.jpg', 'images/ss.jpg'),
(6, 2, 'images/ss1.jpg', 'images/ss1.jpg', 'images/ss1.jpg'),
(7, 2, 'images/ss2.jpg', 'images/ss2.jpg', 'images/ss2.jpg'),
(8, 2, 'images/ss3.jpg', 'images/ss3.jpg', 'images/ss3.jpg'),
(9, 3, 'images/ss.jpg', 'images/ss.jpg', 'images/ss.jpg'),
(10, 3, 'images/ss1.jpg', 'images/ss1.jpg', 'images/ss1.jpg'),
(11, 3, 'images/ss2.jpg', 'images/ss2.jpg', 'images/ss2.jpg'),
(12, 3, 'images/ss3.jpg', 'images/ss3.jpg', 'images/ss3.jpg'),
(13, 4, 'images/ss.jpg', 'images/ss.jpg', 'images/ss.jpg'),
(14, 4, 'images/ss1.jpg', 'images/ss1.jpg', 'images/ss1.jpg'),
(15, 4, 'images/ss2.jpg', 'images/ss2.jpg', 'images/ss2.jpg'),
(16, 4, 'images/ss3.jpg', 'images/ss3.jpg', 'images/ss3.jpg'),
(17, 5, 'images/ss.jpg', 'images/ss.jpg', 'images/ss.jpg'),
(18, 5, 'images/ss1.jpg', 'images/ss1.jpg', 'images/ss1.jpg'),
(19, 5, 'images/ss2.jpg', 'images/ss2.jpg', 'images/ss2.jpg'),
(20, 5, 'images/ss3.jpg', 'images/ss3.jpg', 'images/ss3.jpg'),
(21, 6, 'images/ss.jpg', 'images/ss.jpg', 'images/ss1.jpg'),
(22, 6, 'images/ss1.jpg', 'images/ss1.jpg', 'images/ss1.jpg'),
(23, 6, 'images/ss2.jpg', 'images/ss2.jpg', 'images/ss2.jpg'),
(24, 6, 'images/ss3.jpg', 'images/ss3.jpg', 'images/ss3.jpg'),
(25, 7, 'images/ss.jpg', 'images/ss.jpg', 'images/ss.jpg'),
(26, 7, 'images/ss1.jpg', 'images/ss1.jpg', 'images/ss1.jpg'),
(27, 7, 'images/ss2.jpg', 'images/ss2.jpg', 'images/ss2.jpg'),
(28, 7, 'images/ss3.jpg', 'images/ss3.jpg', 'images/ss3.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `project_single`
--

CREATE TABLE IF NOT EXISTS `project_single` (
  `sid` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(8) NOT NULL COMMENT '项目编号，外键约束',
  `description` text NOT NULL COMMENT '描述',
  `bed` int(8) NOT NULL COMMENT '床',
  `bath` int(8) NOT NULL COMMENT '洗浴',
  `maxperson` int(8) NOT NULL COMMENT '最多住几人',
  `bedroom` int(8) NOT NULL COMMENT '几间卧室',
  `least_night` int(8) NOT NULL COMMENT '最少住几天',
  `price` int(11) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `pid` (`pid`),
  KEY `pid_2` (`pid`),
  KEY `pid_3` (`pid`),
  KEY `pid_4` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `project_single`
--

INSERT INTO `project_single` (`sid`, `pid`, `description`, `bed`, `bath`, `maxperson`, `bedroom`, `least_night`, `price`) VALUES
(1, 1, 'Situated on a sea facing canyon this beautiful home has to be seen to be believed.\n\nOver looking the Pacific toward the island of Catalina.\n\nAn idyllic house with ample on site parking.\n\nSurrounded by three acres of mature gardens, oranges, lemons and figs are ready to pick upon your arrival.\n\nThe apartment comprises of bedroom, bathroom, galley kitchen, large sitting room and private sea facing terrace.\n\nThe one bedroom, open concept apartment is perfectly suited for a couple but has a queen size sofa bed and a small pull out bed for a child.\n\nThe bathroom has a curtain rather than a door.\n\nAccess to the Malibu beaches and the Santa Monica Mountains are within minutes of the house.\n\nThere are scuba diving facilities and world class restaurants on the Pacific Coat Highway.\n\nDrive along the Pacific Coast Highway to Zuma Beach, shop at the luxurious Lumber Yard.\n\nThere is a discreet public access to Billionaires Beach at the bottom of the hill.\n\nSanta Monica is only 20 minutes away.\n\nWi-Fi and cable are available.\n\nThis unique home has everything a trip to Malibu promises.\n', 3, 1, 4, 1, 5, 2000),
(2, 2, '"Thea & George were awesome hosts and their place is absolutely amazing. It''s a perfectly appointed private cottage tucked away on a quiet street on the back of their property. We wanted a place close to the beach but far enough away so as to not be in the middle of the action all the time - this place was the perfect medium."\r\n\r\n"Thea and George''s cottage, set off a quiet road, is bright, clean, and cheerful. It''s newly renovated, with great attention to detail, making for a relaxing stay. The location is a short walk to the main drag of Abbot Kinney, where you''ll find lots of shops, cafes, restaurants, and the buzz of Venice. Overall, it''s a beautiful flat and is recommended for anyone who wants a relaxing time in a great neighborhood with friendly, attentive hosts."\r\n\r\nThis is a super-sweet cottage in the back of our property, perfect for a professional looking for a quiet place to come home to after a hard day''s work, for a couple wanting some peace and quiet, or for a family with one or two small children. We''ve just renovated it, and furnished it with lots of love and care.\r\n\r\nWe''re one mile from Venice Beach, half a mile to the Venice Canals, and six blocks from the famous Abbot Kinney shopping street, with LA''s trendiest boutiques and restaurants.\r\n\r\nThe cottage is roomy and very bright, with five skylights and wood floors. It has a full kitchen, with fridge, toaster and 3-burner antique gas stove. The bedroom area can be closed off from the rest of the space by a semi-circular folding door, and it is furnished with a queen bed. The living area is spacious and bright and right now it has a queen size bed that can be used as couch/daybed or sleeping for one or two.\r\nThe cottage has its own outdoor table and chairs with an umbrella, idyllically situated under a big bougainvillea vine.\r\n\r\nWe provide:\r\n- linens, towels and beach towels\r\n- a full kitchen with pots and pans, tableware and some basic cooking staples (ketchup, oil and vinegar, salt and pepper, sugar, coffee, tea, etc.)\r\n- shampoo, conditioner, soap\r\n- two rickety adult bikes (use at no charge, you fix them if they break)\r\n- wifi\r\n- there is ample free parking on the street, you just have to yield the street cleaning signs to avoid getting a ticket on Wednesday and Thursday mornings, 8-10am.\r\n\r\nPlease read our other reviews to see what kind of hosts we are and to get an idea of the service we provide.', 2, 1, 3, 1, 1, 6800),
(3, 3, 'No Parties\r\nNo Filming \r\nNo photography \r\nIf you are looking for a studio to do photography or filming DO NOT CONTACT THIS LISTING, \r\nIT IS NOT ALLOWED. \r\nIf you use the apartment to film or photography with out my knowledge and I find it on the web you will be charged $950.00 per day.\r\nThank you\r\n\r\n\r\nEveryone else is welcome : )\r\n\r\nMY LITTLE PARIS IN LOS ANGELES.\r\nBONJOUR, and welcome to my Parisian accented flat in downtown Los Angeles. A comprehensive art library, original paintings and objet d''arts, decorate this 800 square foot flat in the center of the city.\r\n\r\nIn the heart of downtown you are surrounded on all sides by five star restaurants, clubs, art galleries, and fashion stores. And with the wave of pop-up shops, you''ll never know what to expect from one day to the next! For those of you who want to grab a snack, there are convenience stores across the street and you are just blocks away from the Metro Subway station.\r\n\r\nThis is an Urban location, we have all sort of people in the area from very wealthy to the very poor, it''s a young area and in a busy street in the middle of the city, noise it''s part of the charm.\r\n\r\nBefore I describe the usual rooms and amenities, let me say that this loft was created with YOU in mind. It has been furnished with one of kind pieces, reupholstered chairs and repainted dressers. I have invested a great deal of effort to create a unique experience just for you, the guest.\r\n\r\nBEDROOM: Large windows, with velvet curtains embrace this space. A fully made queen sized bed, and high speed internet, provide comfort and convenience. A large roomy closet, and dressers provide ample space for your clothes and personal belongings.\r\n\r\nBATHROOM: Toilet, tub/shower & sink. Clean linens, towels, as well as complimentary soap and shampoos are provided. \r\n\r\nCLEANING: The apartment is professionally cleaned for each guest. If you would like the loft cleaned during your stay, please let me know.\r\n\r\nLAUNDRY: Complimentary Laundry Service.\r\n\r\n*Please, NO PETS. I cannot accommodate any kind or size animal at this time.\r\n\r\nIf you want to really EXPERIENCE LOS ANGELES, do it from ‘My Little Paris In L.A.''\r\n\r\nThis apartment is in the heart of Gallery Row \r\nIn Downtown LA .\r\n\r\nTwo blocks from Metro station, plenty of public transportation.\r\n\r\nThis apartment is in the heart of Gallery Row \r\nIn Downtown LA .\r\n\r\nTwo blocks from Metro station, plenty of public transportation.', 1, 1, 2, 1, 1, 3260),
(4, 4, 'Brand new listing on Airbnb! Stylish detached rear studio guesthouse with modern design that include one private garage space. Enter from separate gated entrance. Very secluded, light, bright, lofted space with open floor plan. Fully furnished with everything you need including a walk-in closet, 4 stove kitchen area, full bath, and a large fridge. You will also have free high speed Verizon Fios wifi, HBO NOW on a 42in TV, a small dinner/working area, and 2 memory foam queen size beds plus a folded twin bed. 2.8 miles to Santa Monica Piers, 4 miles to Marina del rey and its baby sea lions, 6.6 miles to Culver city and its beautiful dinning streets, and 5 miles to UCLA main campus.', 3, 1, 5, 1, 1, 500),
(5, 5, 'TOP OF THE HILL ACRES will bring you an even more memorable experience this fall and winter. It''s also Our favorite time of year. Beautiful sunsets to enjoy. \r\nWe are still in a dry spell, high hazard fire zone at this time of year. The canyon weather is dry and we need to avoid any sparks of any kind. The morning sunrise warms the world around you and takes you into the twinkling stars at night. You can prepare meals on our outdoor barbecue and choose between outdoor dining or snuggling up amongst the cushions of the Moroccan nook.\r\nTwo trailers are for our guests to enjoy. The smaller trailer provides a small kitchen including a fridge, toaster oven and kettle. The larger trailer awaits for a cozy night sleep.\r\nPlease note: there is no electricity in the large trailer.\r\nCandle light, lantern, flashlight and fairy lights will help guide you.\r\n\r\nPlanets and stars come out by the thousands, and the hoot of owls and the call of the mountain coyotes connects us to the beauty of nature.\r\n\r\nLimited wifi is avail for our guests to connect if needed.', 2, 1, 2, 1, 1, 2000),
(6, 6, 'Newly designed and furnished room, all the furniture are new. 2 bright windows with blackout curtains. Ceiling fan and warm lighting. Comfortable memory form mattress and small desk/chair for laptop. In room TV with Netflix access.', 1, 1, 2, 1, 2, 1300),
(7, 7, 'Wake up and fix a fresh cup of coffee, then walk the few blocks down to the beach from this romantic bungalow. Bright linens and wood accents bring beachy vibes to this cozy home, and bikes are available for exploring the surrounding area.', 2, 1, 2, 1, 2, 400);

-- --------------------------------------------------------

--
-- 表的结构 `related_project`
--

CREATE TABLE IF NOT EXISTS `related_project` (
  `rid` int(8) NOT NULL AUTO_INCREMENT,
  `pid` int(8) NOT NULL,
  `rpid` int(8) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `pid` (`pid`),
  KEY `rpid` (`rpid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `related_project`
--

INSERT INTO `related_project` (`rid`, `pid`, `rpid`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 5),
(4, 1, 4),
(5, 2, 1),
(6, 2, 3),
(7, 2, 4),
(8, 2, 5),
(9, 3, 1),
(10, 3, 2),
(11, 3, 4),
(12, 3, 5),
(13, 4, 1),
(14, 4, 2),
(15, 4, 3),
(16, 4, 5),
(17, 5, 7),
(18, 5, 6),
(19, 5, 4),
(20, 5, 3),
(21, 6, 7),
(22, 6, 5),
(23, 6, 4),
(24, 6, 3),
(25, 7, 6),
(26, 7, 5),
(27, 7, 4),
(28, 7, 3);

-- --------------------------------------------------------

--
-- 表的结构 `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `sid` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ser_title` varchar(128) DEFAULT NULL COMMENT '标题',
  `ser_detail` varchar(255) DEFAULT NULL COMMENT '详细信息',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `services`
--

INSERT INTO `services` (`sid`, `ser_title`, `ser_detail`) VALUES
(1, '用户中心', '查看握感兴趣的房源'),
(2, '好房推荐', '从内到外为你打造属于自己的家'),
(3, '新上房源', '在不断寻找的路上，只为给你更好的体验'),
(4, '历史记录', '记录下你为自己的爱巢留下的每一个脚印');

-- --------------------------------------------------------

--
-- 表的结构 `special_project`
--

CREATE TABLE IF NOT EXISTS `special_project` (
  `sid` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(8) NOT NULL COMMENT '对应项目id',
  `url` varchar(255) NOT NULL COMMENT '展示图片',
  `title` varchar(128) NOT NULL COMMENT '广告',
  `is_show` enum('0','1') NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`sid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `special_project`
--

INSERT INTO `special_project` (`sid`, `pid`, `url`, `title`, `is_show`) VALUES
(1, 1, 'images/sl.jpg', '一行白鹭上青天', '1'),
(2, 2, 'images/sl1.jpg', '床前明月光，疑是地上霜', '1'),
(3, 3, 'images/sl2.jpg', '窗含西岭千秋雪', '1'),
(4, 4, 'images/sl3.jpg', '门泊东吴万里船', '1'),
(5, 5, 'images/sl4.jpg', '鹅鹅鹅，曲项向天歌', '1'),
(6, 6, 'images/sl.jpg', '1111111111111111', '0'),
(7, 7, 'images/sl.jpg', '2222222222222222222222', '0');

--
-- 限制导出的表
--

--
-- 限制表 `project_picture`
--
ALTER TABLE `project_picture`
  ADD CONSTRAINT `project_picture_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `project_detail` (`pid`);

--
-- 限制表 `project_single`
--
ALTER TABLE `project_single`
  ADD CONSTRAINT `project_single_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `project_detail` (`pid`);

--
-- 限制表 `related_project`
--
ALTER TABLE `related_project`
  ADD CONSTRAINT `related_project_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `project_detail` (`pid`),
  ADD CONSTRAINT `related_project_ibfk_2` FOREIGN KEY (`rpid`) REFERENCES `project_detail` (`pid`);

--
-- 限制表 `special_project`
--
ALTER TABLE `special_project`
  ADD CONSTRAINT `special_project_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `project_detail` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
