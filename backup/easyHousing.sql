-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2017 at 05:40 PM
-- Server version: 5.5.55-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `easyHousing`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administrator`
--

CREATE TABLE IF NOT EXISTS `Administrator` (
  `administratorDepartment` varchar(20) DEFAULT NULL,
  `administratorId` int(11) NOT NULL,
  `administratorName` varchar(15) NOT NULL,
  `administratorPassword` varchar(20) NOT NULL,
  `administratorSex` varchar(5) NOT NULL,
  PRIMARY KEY (`administratorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Agent`
--

CREATE TABLE IF NOT EXISTS `Agent` (
  `agentId` int(11) NOT NULL AUTO_INCREMENT,
  `picUrl` varchar(200) NOT NULL,
  `agentName` varchar(20) NOT NULL,
  `agentEmail` varchar(20) DEFAULT NULL,
  `agentPhoneNumber` varchar(20) NOT NULL,
  `agentSex` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`agentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20141793 ;

--
-- Dumping data for table `Agent`
--

INSERT INTO `Agent` (`agentId`, `picUrl`, `agentName`, `agentEmail`, `agentPhoneNumber`, `agentSex`) VALUES
(1, '1421', 'sbgzy', '1231231@qq.com', '123124214', '男'),
(20141792, 'http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png', '梁先锋', NULL, '18059739987', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BuildingDeal`
--

CREATE TABLE IF NOT EXISTS `BuildingDeal` (
  `agentId` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `buildingDealPerPrice` int(11) NOT NULL,
  `buildingDealTotalPrice` int(11) NOT NULL,
  `buildingDealId` int(11) NOT NULL AUTO_INCREMENT,
  `buildingDealTime` datetime NOT NULL,
  `buildingLayout` varchar(20) NOT NULL,
  PRIMARY KEY (`buildingDealId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `BuildingInfo`
--

CREATE TABLE IF NOT EXISTS `BuildingInfo` (
  `buildingAddress` varchar(200) NOT NULL,
  `buildingId` int(11) NOT NULL AUTO_INCREMENT,
  `buildingName` varchar(200) NOT NULL,
  `buildingDecoration` varchar(20) DEFAULT NULL,
  `buildingMaxArea` int(11) DEFAULT NULL,
  `buildingMinArea` int(11) DEFAULT NULL,
  `buildingNeighbourhood` varchar(50) DEFAULT NULL,
  `buildingReferencePrice` int(11) DEFAULT NULL,
  `buildingSaleState` varchar(50) DEFAULT NULL,
  `buildingTimeHanded` date DEFAULT NULL,
  PRIMARY KEY (`buildingId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `BuildingInfo`
--

INSERT INTO `BuildingInfo` (`buildingAddress`, `buildingId`, `buildingName`, `buildingDecoration`, `buildingMaxArea`, `buildingMinArea`, `buildingNeighbourhood`, `buildingReferencePrice`, `buildingSaleState`, `buildingTimeHanded`) VALUES
('CQU', 2, '梅园', '精修', 111, 110, 'huxi', 10000, 'you', '2017-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `BuildingLayout`
--

CREATE TABLE IF NOT EXISTS `BuildingLayout` (
  `buildingId` int(11) NOT NULL,
  `buildingLayoutPicUrl` varchar(200) DEFAULT NULL,
  `buildingLayoutReferencePrice` int(11) DEFAULT NULL,
  `buildingLayout` varchar(20) NOT NULL,
  `buildingLayoutSoldOut` tinyint(1) NOT NULL,
  `buildingLayoutPerPrice` int(11) NOT NULL,
  PRIMARY KEY (`buildingId`,`buildingLayout`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BuildingPic`
--

CREATE TABLE IF NOT EXISTS `BuildingPic` (
  `buildingId` int(11) DEFAULT NULL,
  `buildingPicInsertTime` datetime DEFAULT NULL,
  `buildingPicUrl` varchar(200) NOT NULL DEFAULT '',
  `buildingPicType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`buildingPicUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BuyHouseComment`
--

CREATE TABLE IF NOT EXISTS `BuyHouseComment` (
  `buildingId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `buyHouseCommentId` int(11) NOT NULL AUTO_INCREMENT,
  `userComment` varchar(300) NOT NULL,
  `userCommentDate` datetime NOT NULL,
  PRIMARY KEY (`buyHouseCommentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `Characteristics`
--

CREATE TABLE IF NOT EXISTS `Characteristics` (
  `characteristicsId` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Community`
--

CREATE TABLE IF NOT EXISTS `Community` (
  `communityId` int(11) NOT NULL AUTO_INCREMENT,
  `communityBuildingNum` int(11) DEFAULT NULL,
  `communityBuildTime` date DEFAULT NULL,
  `communityDeveloper` varchar(100) DEFAULT NULL,
  `communityHouseNum` int(11) DEFAULT NULL,
  `communityPrice` float NOT NULL,
  `communityPropertyCompany` varchar(100) DEFAULT NULL,
  `communityPropertyFee` float DEFAULT NULL,
  `communityName` varchar(50) DEFAULT NULL,
  `communityAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`communityId`),
  KEY `communityId` (`communityId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Community`
--

INSERT INTO `Community` (`communityId`, `communityBuildingNum`, `communityBuildTime`, `communityDeveloper`, `communityHouseNum`, `communityPrice`, `communityPropertyCompany`, `communityPropertyFee`, `communityName`, `communityAddress`) VALUES
(2, 0, NULL, NULL, 0, 0, NULL, 0, '66666小区', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `OrderBuilding`
--

CREATE TABLE IF NOT EXISTS `OrderBuilding` (
  `buildingId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderTime` varchar(50) NOT NULL,
  `agentId` int(11) NOT NULL,
  `orderStatus` varchar(20) NOT NULL,
  `userPhoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `OrderBuilding`
--

INSERT INTO `OrderBuilding` (`buildingId`, `userId`, `orderId`, `orderTime`, `agentId`, `orderStatus`, `userPhoneNumber`) VALUES
(1, 1, 2, '2017-06-26 17:11:39', 1, '未处理', '18059xxxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `OrderRentHouse`
--

CREATE TABLE IF NOT EXISTS `OrderRentHouse` (
  `agentId` int(11) DEFAULT NULL,
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderTime` varchar(50) DEFAULT NULL,
  `rentHouseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderStatus` varchar(20) DEFAULT NULL,
  `userPhoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `OrderRentHouse`
--

INSERT INTO `OrderRentHouse` (`agentId`, `orderId`, `orderTime`, `rentHouseId`, `userId`, `orderStatus`, `userPhoneNumber`) VALUES
(20141792, 2, '2017-06-26 17:30:18', 6, 6, '未处理', '18059739987');

-- --------------------------------------------------------

--
-- Table structure for table `RentHouse`
--

CREATE TABLE IF NOT EXISTS `RentHouse` (
  `rentHouseId` int(11) NOT NULL AUTO_INCREMENT,
  `communityId` int(11) DEFAULT NULL,
  `rentHouseAddress` varchar(100) DEFAULT NULL,
  `rentHouseArea` float DEFAULT NULL,
  `rentHouseBuildTime` date DEFAULT NULL,
  `rentHouseFloor` int(11) DEFAULT NULL,
  `rentHouseFloorAttribute` varchar(20) DEFAULT NULL,
  `rentHouseHall` int(11) DEFAULT NULL,
  `rentHouseRoom` int(11) DEFAULT NULL,
  `rentHouseSubway` varchar(100) DEFAULT NULL,
  `rentHouseToilet` int(11) DEFAULT NULL,
  `rentHouseToward` varchar(10) DEFAULT NULL,
  `rentHousePrice` int(11) DEFAULT NULL,
  `rentHouseProvince` varchar(20) DEFAULT NULL,
  `rentHouseRegion` varchar(20) DEFAULT NULL,
  `rentHouseAllFloor` int(11) DEFAULT NULL,
  `communityName` varchar(50) DEFAULT NULL,
  `rentHouseUnitNumber` varchar(20) DEFAULT NULL,
  `rentHousePublishTime` date DEFAULT NULL,
  PRIMARY KEY (`rentHouseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `RentHouse`
--

INSERT INTO `RentHouse` (`rentHouseId`, `communityId`, `rentHouseAddress`, `rentHouseArea`, `rentHouseBuildTime`, `rentHouseFloor`, `rentHouseFloorAttribute`, `rentHouseHall`, `rentHouseRoom`, `rentHouseSubway`, `rentHouseToilet`, `rentHouseToward`, `rentHousePrice`, `rentHouseProvince`, `rentHouseRegion`, `rentHouseAllFloor`, `communityName`, `rentHouseUnitNumber`, `rentHousePublishTime`) VALUES
(5, 0, '重庆市渝北区加州城市花园', 182, '2016-01-04', 1, '低楼层', 2, 4, NULL, 2, NULL, 4000, '', '', 0, '', '', '2017-07-06'),
(6, 0, '重庆市江北区华立天地豪园', 171, '2017-03-13', 21, '高楼层', 2, 4, NULL, 2, NULL, 2400, '', '', 0, '', '', '2017-07-11'),
(7, 0, '重庆市渝北区北城国际中心', 83, '2017-02-28', 5, '低楼层', 1, 2, NULL, 1, NULL, 2500, '', '', 0, '', '', '2017-07-03'),
(8, NULL, '重庆市南岸国际社区官邸三组团', 83, '2017-03-20', 15, '中楼层', 2, 2, NULL, 1, '东南', 2200, '重庆市', '南岸', 30, '', '', '2017-07-02'),
(9, NULL, '重庆市江津朗苑', 41, '2017-03-28', 14, '中楼层', 1, 1, NULL, 1, '北', 900, '重庆市', '江津', 31, '', '', '2017-07-18'),
(10, NULL, '重庆市巴南典雅龙海港湾', 58, '2017-01-24', 10, '中楼层', 1, 1, NULL, 1, '西', 1400, '重庆市', '巴南', 20, '', '', '2017-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `RentHouseComment`
--

CREATE TABLE IF NOT EXISTS `RentHouseComment` (
  `rentHouseId` int(11) NOT NULL,
  `userComment` varchar(300) NOT NULL,
  `userId` int(11) NOT NULL,
  `userCommentDate` date NOT NULL,
  `rentHouseCommentId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rentHouseCommentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `RentHouseComment`
--

INSERT INTO `RentHouseComment` (`rentHouseId`, `userComment`, `userId`, `userCommentDate`, `rentHouseCommentId`) VALUES
(6, '5星好评', 6, '2017-06-26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `RentHouseDeal`
--

CREATE TABLE IF NOT EXISTS `RentHouseDeal` (
  `agentId` int(11) NOT NULL,
  `rentHouseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `rentTime` datetime NOT NULL,
  `rentId` int(11) NOT NULL AUTO_INCREMENT,
  `rentPrice` float NOT NULL,
  PRIMARY KEY (`rentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `RentHouseDeal`
--

INSERT INTO `RentHouseDeal` (`agentId`, `rentHouseId`, `userId`, `rentTime`, `rentId`, `rentPrice`) VALUES
(0, 0, 0, '2017-06-26 00:00:00', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `RentHousePic`
--

CREATE TABLE IF NOT EXISTS `RentHousePic` (
  `insertTime` datetime DEFAULT NULL,
  `picUrl` varchar(200) NOT NULL,
  `rentHouseId` int(11) NOT NULL,
  `rentHousePicId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rentHousePicId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `RentHousePic`
--

INSERT INTO `RentHousePic` (`insertTime`, `picUrl`, `rentHouseId`, `rentHousePicId`) VALUES
('2017-07-08 00:00:00', 'http://os8z6i0zb.bkt.clouddn.com/Pic1', 5, 1),
(NULL, 'http://os8z6i0zb.bkt.clouddn.com/Pic2', 5, 2),
(NULL, 'http://os8z6i0zb.bkt.clouddn.com/Pic3', 5, 3),
(NULL, 'http://os8z6i0zb.bkt.clouddn.com/Pic4', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `RentHouse_Characteristics`
--

CREATE TABLE IF NOT EXISTS `RentHouse_Characteristics` (
  `rentHouseId` int(11) NOT NULL,
  `characteristicsId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RentHouse_Community`
--

CREATE TABLE IF NOT EXISTS `RentHouse_Community` (
  `communityId` int(11) NOT NULL,
  `rentHouseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `name` varchar(30) DEFAULT '',
  `userPassword` varchar(15) NOT NULL,
  `userSex` varchar(8) DEFAULT NULL,
  `userEmail` varchar(30) DEFAULT '',
  `userPhoneNumber` varchar(30) DEFAULT '',
  `userPhoto` varchar(200) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `userEmail` (`userEmail`),
  UNIQUE KEY `userPhoneNumber` (`userPhoneNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userId`, `username`, `name`, `userPassword`, `userSex`, `userEmail`, `userPhoneNumber`, `userPhoto`) VALUES
(2, 'gzy', 'null', '632', 'null', 'null', 'null', 'http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png'),
(3, 'SBgzy', NULL, '123456', NULL, NULL, NULL, 'http://os8z6i0zb.bkt.clouddn.com/2017-07-01T07:39:26.326Z'),
(6, 'guoziyao', '买不起房的郭先生', 'guoziyao', '男', '751744014@qq.com', '18059739987', 'http://os8z6i0zb.bkt.clouddn.com/2017-06-30T18:57:27.071Z'),
(8, 'guoguoguo', NULL, '666', NULL, NULL, NULL, 'http://os8z6i0zb.bkt.clouddn.com/defaultPhoto.png'),
(9, 'ThomasDrTang', '思博唐博士', '666666', NULL, NULL, NULL, 'http://os8z6i0zb.bkt.clouddn.com/2017-07-01T06:17:55.548Z'),
(10, 'zzzzz', NULL, '123456', NULL, NULL, NULL, 'http://os8z6i0zb.bkt.clouddn.com/2017-07-01T06:19:51.087Z'),
(11, 'liangxianfeng', NULL, 'liangxianfeng', NULL, NULL, NULL, 'http://os8z6i0zb.bkt.clouddn.com/2017-07-01T06:28:38.629Z'),
(12, 'wangFLY', NULL, '1996511', NULL, NULL, NULL, 'http://os8z6i0zb.bkt.clouddn.com/2017-07-01T06:47:43.459Z');

-- --------------------------------------------------------

--
-- Table structure for table `UserCollectBuilding`
--

CREATE TABLE IF NOT EXISTS `UserCollectBuilding` (
  `userId` int(11) NOT NULL,
  `buildingId` int(11) NOT NULL,
  `collectTime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserCollectBuilding`
--

INSERT INTO `UserCollectBuilding` (`userId`, `buildingId`, `collectTime`) VALUES
(6, 2, '2017-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `UserCollectRentHouse`
--

CREATE TABLE IF NOT EXISTS `UserCollectRentHouse` (
  `userId` int(11) NOT NULL,
  `rentHouseId` int(11) NOT NULL,
  `collectTime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserCollectRentHouse`
--

INSERT INTO `UserCollectRentHouse` (`userId`, `rentHouseId`, `collectTime`) VALUES
(6, 6, '2017-07-01'),
(6, 8, '2017-07-01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
