-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2014 at 08:36 PM
-- Server version: 5.5.35
-- PHP Version: 5.4.4-14+deb7u7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sr26`
--

-- --------------------------------------------------------

--
-- Table structure for table `ABBREV`
--

CREATE TABLE IF NOT EXISTS `ABBREV` (
  `NDB_No` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Shrt_Desc` varchar(60) CHARACTER SET utf8 NOT NULL,
  `Water_(g)` float NOT NULL,
  `Energ_Kcal` int(11) NOT NULL,
  `Protein_(g)` float NOT NULL,
  `Lipid_Tot_(g)` float NOT NULL,
  `Ash_(g)` float NOT NULL,
  `Carbohydrt_(g)` float NOT NULL,
  `Fiber_TD_(g)` float NOT NULL,
  `Sugar_Tot_(g)` float NOT NULL,
  `Calcium_(mg)` int(11) NOT NULL,
  `Iron_(mg)` float NOT NULL,
  `Magnesium_(mg)` float NOT NULL,
  `Phosphorus_(mg)` int(11) NOT NULL,
  `Potassium_(mg)` int(11) NOT NULL,
  `Sodium_(mg)` int(11) NOT NULL,
  `Zinc_(mg)` float NOT NULL,
  `Copper_mg)` float NOT NULL,
  `Manganese_(mg)` float NOT NULL,
  `Selenium_(µg)` float NOT NULL,
  `Vit_C_(mg)` float NOT NULL,
  `Thiamin_(mg)` float NOT NULL,
  `Riboflavin_(mg)` float NOT NULL,
  `Niacin_(mg)` float NOT NULL,
  `Panto_Acid_mg)` float NOT NULL,
  `Vit_B6_(mg)` float NOT NULL,
  `Folate_Tot_(µg)` float NOT NULL,
  `Folic_Acid_(µg)` float NOT NULL,
  `Food_Folate_(µg)` float NOT NULL,
  `Folate_DFE_(µg)` float NOT NULL,
  `Choline_Tot_ (mg)` float NOT NULL,
  `Vit_B12_(µg)` float NOT NULL,
  `Vit_A_IU` int(11) NOT NULL,
  `Vit_A_RAE` float NOT NULL,
  `Retinol_(µg)` float NOT NULL,
  `Alpha_Carot_(µg)` float NOT NULL,
  `Beta_Carot_(µg)` float NOT NULL,
  `Beta_Crypt_(µg)` float NOT NULL,
  `Lycopene_(µg)` float NOT NULL,
  `Lut+Zea_ (µg)` float NOT NULL,
  `Vit_E_(mg)` float NOT NULL,
  `Vit_D_µg` float NOT NULL,
  `Vit_D_IU` float NOT NULL,
  `Vit_K_(µg)` float NOT NULL,
  `FA_Sat_(g)` float NOT NULL,
  `FA_Mono_(g)` float NOT NULL,
  `FA_Poly_(g)` float NOT NULL,
  `Cholestrl_(mg)` int(11) NOT NULL,
  `GmWt_1` float NOT NULL,
  `GmWt_Desc1` varchar(120) CHARACTER SET utf8 NOT NULL,
  `GmWt_2` float NOT NULL,
  `GmWt_Desc2` varchar(120) CHARACTER SET utf8 NOT NULL,
  `Refuse_Pct` int(11) NOT NULL,
  PRIMARY KEY (`NDB_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ADD_FTNT`
--

CREATE TABLE IF NOT EXISTS `ADD_FTNT` (
  `NDB_NO` varchar(510) DEFAULT NULL,
  `Footnt_No` varchar(510) DEFAULT NULL,
  `Footnot_Typ` varchar(510) DEFAULT NULL,
  `Nutr_No` varchar(510) DEFAULT NULL,
  `Footnot_Txt` varchar(510) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DATA_SRC`
--

CREATE TABLE IF NOT EXISTS `DATA_SRC` (
  `DataSrc_ID` varchar(6) CHARACTER SET utf8 NOT NULL,
  `Authors` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Year` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `Journal` varchar(135) CHARACTER SET utf8 DEFAULT NULL,
  `Vol_City` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `Issue_State` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Start_Page` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `End_Page` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`DataSrc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DATSRCLN`
--

CREATE TABLE IF NOT EXISTS `DATSRCLN` (
  `NDB_No` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Nutr_No` varchar(3) CHARACTER SET utf8 NOT NULL,
  `DataSrc_ID` varchar(6) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`NDB_No`,`Nutr_No`,`DataSrc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DERIV_CD`
--

CREATE TABLE IF NOT EXISTS `DERIV_CD` (
  `Deriv_CD` varchar(4) CHARACTER SET utf8 NOT NULL,
  `Deriv_Desc` varchar(120) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Deriv_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FD_GROUP`
--

CREATE TABLE IF NOT EXISTS `FD_GROUP` (
  `FdGrp_CD` varchar(4) CHARACTER SET utf8 NOT NULL,
  `FdGrp_Desc` varchar(60) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`FdGrp_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FOOD_DES`
--

CREATE TABLE IF NOT EXISTS `FOOD_DES` (
  `NDB_No` varchar(5) CHARACTER SET utf8 NOT NULL,
  `FdGrp_Cd` varchar(4) CHARACTER SET utf8 NOT NULL,
  `Long_Desc` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Shrt_Desc` varchar(60) CHARACTER SET utf8 NOT NULL,
  `ComName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ManufacName` varchar(65) CHARACTER SET utf8 DEFAULT NULL,
  `Survey` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `Ref_Desc` varchar(135) CHARACTER SET utf8 DEFAULT NULL,
  `Refuse` int(2) DEFAULT NULL,
  `SciName` varchar(65) CHARACTER SET utf8 DEFAULT NULL,
  `N_Factor` float DEFAULT NULL,
  `Pro_Factor` float DEFAULT NULL,
  `Fat_Factor` float DEFAULT NULL,
  `CHO_Factor` float DEFAULT NULL,
  PRIMARY KEY (`NDB_No`),
  KEY `FdGrp_Cd` (`FdGrp_Cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FOOTNOTE`
--

CREATE TABLE IF NOT EXISTS `FOOTNOTE` (
  `NDB_No` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Footnt_No` varchar(4) CHARACTER SET utf8 NOT NULL,
  `Footnot_Typ` varchar(1) CHARACTER SET utf8 NOT NULL,
  `Nutr_No` varchar(3) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Footnot_Txt` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`NDB_No`,`Footnt_No`,`Nutr_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LANGDESC`
--

CREATE TABLE IF NOT EXISTS `LANGDESC` (
  `Factor` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(140) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Factor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LANGUAL`
--

CREATE TABLE IF NOT EXISTS `LANGUAL` (
  `NDB_No` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Factor` varchar(5) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`NDB_No`,`Factor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `NUTR_DEF`
--

CREATE TABLE IF NOT EXISTS `NUTR_DEF` (
  `Nutr_No` varchar(3) CHARACTER SET utf8 NOT NULL,
  `Units` varchar(7) CHARACTER SET utf8 NOT NULL,
  `Tagname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `NutrDesc` varchar(60) CHARACTER SET utf8 NOT NULL,
  `Num_Dec` varchar(1) CHARACTER SET utf8 NOT NULL,
  `SR_Order` float NOT NULL,
  PRIMARY KEY (`Nutr_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `NUT_DATA`
--

CREATE TABLE IF NOT EXISTS `NUT_DATA` (
  `NDB_No` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Nutr_No` varchar(3) CHARACTER SET utf8 NOT NULL,
  `Nutr_Val` float NOT NULL,
  `Num_Data_Pts` int(5) NOT NULL,
  `Std_Error` float DEFAULT NULL,
  `Src_Cd` varchar(2) CHARACTER SET utf8 NOT NULL,
  `Deriv_Cd` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `Ref_NDB_No` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `Add_Nutr_Mark` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `Num_Studies` int(2) DEFAULT NULL,
  `Min` float DEFAULT NULL,
  `Max` float DEFAULT NULL,
  `DF` int(4) DEFAULT NULL,
  `Low_EB` float DEFAULT NULL,
  `Up_EB` float DEFAULT NULL,
  `Stat_Cmt` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `AddMod_Date` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `CC` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`NDB_No`,`Nutr_No`),
  KEY `Src_Cd` (`Src_Cd`),
  KEY `Deriv_Cd` (`Deriv_Cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SRC_CD`
--

CREATE TABLE IF NOT EXISTS `SRC_CD` (
  `Src_Cd` varchar(2) CHARACTER SET utf8 NOT NULL,
  `SrcCd_Desc` varchar(60) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Src_Cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WEIGHT`
--

CREATE TABLE IF NOT EXISTS `WEIGHT` (
  `NDB_No` varchar(5) CHARACTER SET utf8 NOT NULL,
  `Seq` varchar(2) CHARACTER SET utf8 NOT NULL,
  `Amount` float NOT NULL,
  `Msre_Desc` varchar(84) CHARACTER SET utf8 NOT NULL,
  `Gm_Wgt` float NOT NULL,
  `Num_Data_Pts` int(3) DEFAULT NULL,
  `Std_Dev` float DEFAULT NULL,
  PRIMARY KEY (`NDB_No`,`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
