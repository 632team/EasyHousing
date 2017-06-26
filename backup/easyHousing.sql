-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2017 at 09:36 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Agent`
--

INSERT INTO `Agent` (`agentId`, `picUrl`, `agentName`, `agentEmail`, `agentPhoneNumber`, `agentSex`) VALUES
(2, '1421', 'sbgzy', '1231231@qq.com', '123124214', '男');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `buildingPicUrl` varchar(200) DEFAULT NULL,
  `buildingPicType` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BuyHouseComment`
--

CREATE TABLE IF NOT EXISTS `BuyHouseComment` (
  `buildingId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `buyHouseId` int(11) NOT NULL AUTO_INCREMENT,
  `userComment` varchar(300) NOT NULL,
  `userCommentDate` datetime NOT NULL,
  PRIMARY KEY (`buyHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
(1, 2, '2017-06-26 17:30:18', 1, 1, '未处理', '18059xxxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `RentHouse`
--

CREATE TABLE IF NOT EXISTS `RentHouse` (
  `rentHouseId` int(11) NOT NULL AUTO_INCREMENT,
  `communityId` int(11) DEFAULT NULL,
  `rentHouseAddress` varchar(100) NOT NULL,
  `rentHouseArea` float DEFAULT NULL,
  `rentHouseBuildTime` date DEFAULT NULL,
  `rentHouseFloor` int(11) DEFAULT NULL,
  `rentHouseFloorAttribute` varchar(20) DEFAULT NULL,
  `rentHouseHall` int(11) DEFAULT NULL,
  `rentHouseRoom` int(11) NOT NULL,
  `rentHouseSubway` varchar(100) DEFAULT NULL,
  `rentHouseToilet` int(11) DEFAULT NULL,
  `rentHouseToward` varchar(10) DEFAULT NULL,
  `rentHousePrice` int(11) NOT NULL,
  PRIMARY KEY (`rentHouseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `RentHouse`
--

INSERT INTO `RentHouse` (`rentHouseId`, `communityId`, `rentHouseAddress`, `rentHouseArea`, `rentHouseBuildTime`, `rentHouseFloor`, `rentHouseFloorAttribute`, `rentHouseHall`, `rentHouseRoom`, `rentHouseSubway`, `rentHouseToilet`, `rentHouseToward`, `rentHousePrice`) VALUES
(1, 0, '632', 0, NULL, 0, NULL, 0, 12, NULL, 0, NULL, 123),
(2, 0, '632技术小组', 0, NULL, 0, NULL, 0, 12, NULL, 0, NULL, 123);

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
(1, '5星好评', 1, '2017-06-26', 2);

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
  `insertTime` datetime NOT NULL,
  `picUrl` varchar(200) NOT NULL,
  `rentHouseId` int(11) NOT NULL,
  `rentHousePicId` int(11) NOT NULL,
  PRIMARY KEY (`rentHousePicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RentHousePic`
--

INSERT INTO `RentHousePic` (`insertTime`, `picUrl`, `rentHouseId`, `rentHousePicId`) VALUES
('2017-06-26 21:09:59', 'www.baidu。com', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `userPassword` varchar(15) NOT NULL,
  `userSex` varchar(8) DEFAULT NULL,
  `userEmail` varchar(30) DEFAULT NULL,
  `userPhoneNumber` varchar(30) DEFAULT NULL,
  `userPhoto` varchar(200) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userId`, `username`, `name`, `userPassword`, `userSex`, `userEmail`, `userPhoneNumber`, `userPhoto`) VALUES
(2, 'gzy', NULL, '632', NULL, NULL, NULL, 'www.baidu.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
