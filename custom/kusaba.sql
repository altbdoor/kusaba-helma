-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2015 at 11:13 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kusaba`
--
CREATE DATABASE IF NOT EXISTS `kusaba` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kusaba`;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE IF NOT EXISTS `ads` (
  `id` smallint(1) unsigned NOT NULL,
  `position` varchar(3) NOT NULL,
  `disp` tinyint(1) NOT NULL,
  `boards` varchar(255) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ads`
--

TRUNCATE TABLE `ads`;
--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `position`, `disp`, `boards`, `code`) VALUES
(1, 'top', 0, '', 'Right Frame Top'),
(2, 'bot', 0, '', 'Right Frame Bottom');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `postedat` int(20) NOT NULL,
  `postedby` varchar(75) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `announcements`
--

TRUNCATE TABLE `announcements`;
--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `parentid`, `subject`, `postedat`, `postedby`, `message`) VALUES
(1, 0, 'Testing 123', 1420782046, 'admin', 'apolcalypse now!'),
(2, 0, 'apple of my eye', 1420782065, 'admin', 'We go here again!');

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE IF NOT EXISTS `banlist` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `allowread` tinyint(1) NOT NULL DEFAULT '1',
  `ip` varchar(50) NOT NULL,
  `ipmd5` char(32) NOT NULL,
  `globalban` tinyint(1) NOT NULL DEFAULT '0',
  `boards` varchar(255) NOT NULL,
  `by` varchar(75) NOT NULL,
  `at` int(20) NOT NULL,
  `until` int(20) NOT NULL,
  `reason` text NOT NULL,
  `staffnote` text NOT NULL,
  `appeal` text,
  `appealat` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `banlist`
--

TRUNCATE TABLE `banlist`;
-- --------------------------------------------------------

--
-- Table structure for table `bannedhashes`
--

CREATE TABLE IF NOT EXISTS `bannedhashes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `md5` varchar(255) NOT NULL,
  `bantime` int(10) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `bannedhashes`
--

TRUNCATE TABLE `bannedhashes`;
-- --------------------------------------------------------

--
-- Table structure for table `blotter`
--

CREATE TABLE IF NOT EXISTS `blotter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `important` tinyint(1) NOT NULL,
  `at` int(20) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `blotter`
--

TRUNCATE TABLE `blotter`;
-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE IF NOT EXISTS `boards` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `order` tinyint(5) NOT NULL DEFAULT '0',
  `name` varchar(75) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `start` int(10) unsigned NOT NULL,
  `uploadtype` tinyint(1) NOT NULL DEFAULT '0',
  `desc` varchar(75) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` tinyint(2) NOT NULL DEFAULT '0',
  `maximagesize` int(20) NOT NULL DEFAULT '1024000',
  `maxpages` int(20) NOT NULL DEFAULT '11',
  `maxage` int(20) NOT NULL DEFAULT '0',
  `markpage` tinyint(4) NOT NULL DEFAULT '9',
  `maxreplies` int(5) NOT NULL DEFAULT '200',
  `messagelength` int(10) NOT NULL DEFAULT '8192',
  `createdon` int(20) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `includeheader` text COLLATE utf8_unicode_ci NOT NULL,
  `redirecttothread` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Anonymous',
  `forcedanon` tinyint(1) NOT NULL DEFAULT '0',
  `embeds_allowed` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `trial` tinyint(1) NOT NULL DEFAULT '0',
  `popular` tinyint(1) NOT NULL DEFAULT '0',
  `defaultstyle` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `locale` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `showid` tinyint(1) NOT NULL DEFAULT '0',
  `compactlist` tinyint(1) NOT NULL DEFAULT '0',
  `enablereporting` tinyint(1) NOT NULL DEFAULT '1',
  `enablecaptcha` tinyint(1) NOT NULL DEFAULT '0',
  `enablenofile` tinyint(1) NOT NULL DEFAULT '0',
  `enablearchiving` tinyint(1) NOT NULL DEFAULT '0',
  `enablecatalog` tinyint(1) NOT NULL DEFAULT '1',
  `loadbalanceurl` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `loadbalancepassword` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Truncate table before insert `boards`
--

TRUNCATE TABLE `boards`;
--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `order`, `name`, `type`, `start`, `uploadtype`, `desc`, `image`, `section`, `maximagesize`, `maxpages`, `maxage`, `markpage`, `maxreplies`, `messagelength`, `createdon`, `locked`, `includeheader`, `redirecttothread`, `anonymous`, `forcedanon`, `embeds_allowed`, `trial`, `popular`, `defaultstyle`, `locale`, `showid`, `compactlist`, `enablereporting`, `enablecaptcha`, `enablenofile`, `enablearchiving`, `enablecatalog`, `loadbalanceurl`, `loadbalancepassword`) VALUES
(1, 0, 'test', 0, 1, 1, 'Testing', '', 1, 1024000, 11, 0, 9, 200, 8192, 1420515735, 0, '', 1, 'Anonymous', 0, 'you,goo', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', ''),
(2, 0, 'apple', 0, 1, 0, 'apple of my eye', '', 0, 1024000, 11, 0, 9, 200, 8192, 1421396880, 0, '', 0, 'Anonymous', 0, '', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', ''),
(3, 0, 'nexttets', 0, 1, 0, 'asdasd', '', 0, 1024000, 11, 0, 9, 200, 8192, 1421397269, 0, '', 0, 'Anonymous', 0, '', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `board_filetypes`
--

CREATE TABLE IF NOT EXISTS `board_filetypes` (
  `boardid` tinyint(5) NOT NULL DEFAULT '0',
  `typeid` mediumint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `board_filetypes`
--

TRUNCATE TABLE `board_filetypes`;
--
-- Dumping data for table `board_filetypes`
--

INSERT INTO `board_filetypes` (`boardid`, `typeid`) VALUES
(1, 3),
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 3),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `embeds`
--

CREATE TABLE IF NOT EXISTS `embeds` (
  `id` tinyint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filetype` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `videourl` varchar(510) NOT NULL,
  `width` tinyint(3) unsigned NOT NULL,
  `height` tinyint(3) unsigned NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `embeds`
--

TRUNCATE TABLE `embeds`;
--
-- Dumping data for table `embeds`
--

INSERT INTO `embeds` (`id`, `filetype`, `name`, `videourl`, `width`, `height`, `code`) VALUES
(1, 'you', 'Youtube', 'http://www.youtube.com/watch?v=', 200, 164, '<object type="application/x-shockwave-flash" width="SET_WIDTH" height="SET_HEIGHT" data="http://www.youtube.com/v/EMBED_ID"> <param name="movie" value="http://www.youtube.com/v/EMBED_ID" /> </object>'),
(2, 'goo', 'Google', 'http://video.google.com/videoplay?docid=', 200, 164, '<embed width="SET_WIDTH" height="SET_HEIGHT" id="VideoPlayback" type="application/x-shockwave-flash" src="http://video.google.com/googleplayer.swf?docId=EMBED_ID"></embed>');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `name` varchar(255) NOT NULL,
  `at` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `events`
--

TRUNCATE TABLE `events`;
--
-- Dumping data for table `events`
--

INSERT INTO `events` (`name`, `at`) VALUES
('pingback', 0),
('sitemap', 1424177093);

-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE IF NOT EXISTS `filetypes` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `filetype` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_w` int(7) NOT NULL DEFAULT '0',
  `image_h` int(7) NOT NULL DEFAULT '0',
  `force_thumb` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Truncate table before insert `filetypes`
--

TRUNCATE TABLE `filetypes`;
--
-- Dumping data for table `filetypes`
--

INSERT INTO `filetypes` (`id`, `filetype`, `mime`, `image`, `image_w`, `image_h`, `force_thumb`) VALUES
(1, 'jpg', '', '', 0, 0, 0),
(2, 'gif', '', '', 0, 0, 0),
(3, 'png', '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `front`
--

CREATE TABLE IF NOT EXISTS `front` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `page` smallint(1) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `poster` varchar(75) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Truncate table before insert `front`
--

TRUNCATE TABLE `front`;
--
-- Dumping data for table `front`
--

INSERT INTO `front` (`id`, `page`, `order`, `subject`, `message`, `timestamp`, `poster`, `email`) VALUES
(1, 0, 0, 'YOU ALL', 'are good people\r\nand my job is pretty tiring\r\nbut i am here ayy <b>lmao</b>\r\n<a>gahnoo plus linux</a>', 1422591878, 'admin', ''),
(2, 1, 0, 'dijanoie', 'asdasdasd', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `loginattempts`
--

CREATE TABLE IF NOT EXISTS `loginattempts` (
  `username` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `loginattempts`
--

TRUNCATE TABLE `loginattempts`;
-- --------------------------------------------------------

--
-- Table structure for table `modlog`
--

CREATE TABLE IF NOT EXISTS `modlog` (
  `entry` text NOT NULL,
  `user` varchar(255) NOT NULL,
  `category` tinyint(2) NOT NULL DEFAULT '0',
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `modlog`
--

TRUNCATE TABLE `modlog`;
--
-- Dumping data for table `modlog`
--

INSERT INTO `modlog` (`entry`, `user`, `category`, `timestamp`) VALUES
('Added board: /apple/', 'admin', 3, 1421396880),
('Logged in', 'admin', 1, 1421395559),
('Rebuilt all boards and threads', 'admin', 2, 1421302770),
('Rebuilt all boards and threads', 'admin', 2, 1421302732),
('Logged in', 'admin', 1, 1421302567),
('Logged in', 'admin', 1, 1421290556),
('Viewed disk space used', 'admin', 0, 1421130940),
('Viewed disk space used', 'admin', 0, 1421126802),
('Logged in', 'admin', 1, 1420696942),
('Logged in', 'admin', 1, 1420765801),
('Logged in', 'admin', 1, 1420772756),
('Logged in', 'admin', 1, 1420775626),
('Logged in', 'admin', 1, 1420781845),
('Logged in', 'admin', 1, 1420781884),
('Added an announcement', 'admin', 9, 1420782046),
('Added an announcement', 'admin', 9, 1420782065),
('Logged in', 'admin', 1, 1420783068),
('Edited an announcement', 'admin', 0, 1420784411),
('Edited an announcement', 'admin', 0, 1420784422),
('Edited an announcement', 'admin', 0, 1420784425),
('Edited an announcement', 'admin', 0, 1420784432),
('Edited an announcement', 'admin', 0, 1420784452),
('Edited an announcement', 'admin', 0, 1420784476),
('Edited an announcement', 'admin', 0, 1420784491),
('Edited an announcement', 'admin', 0, 1420796062),
('Edited an announcement', 'admin', 0, 1420796152),
('Logged in', 'admin', 1, 1420796889),
('Inserted SQL', 'admin', 0, 1421126783),
('Added board: /nexttets/', 'admin', 3, 1421397269),
('Added board: /asdasd/', 'admin', 3, 1421397368),
('Deleted board: /asdasd/', 'admin', 3, 1421397638),
('Updated board configuration - /test/', 'admin', 4, 1422259476),
('Updated board configuration - /nexttets/', 'admin', 4, 1422259642),
('Logged in', 'admin', 1, 1422329771),
('Logged in', 'admin', 1, 1422330494),
('Rebuilt all boards and threads', 'admin', 2, 1422330498),
('Rebuilt all boards and threads', 'admin', 2, 1422330560),
('Rebuilt all boards and threads', 'admin', 2, 1422331840),
('Rebuilt all boards and threads', 'admin', 2, 1422332019),
('Logged in', 'admin', 1, 1422333269),
('Logged in', 'admin', 1, 1422510051),
('Logged in', 'admin', 1, 1422587287),
('Logged in', 'admin', 1, 1422591836),
('Added a news entry', 'admin', 9, 1422591878),
('Logged in', 'admin', 1, 1422598389),
('Added a FAQ entry', 'admin', 9, 1422598419),
('Logged in', 'admin', 1, 1422803182),
('Rebuilt all boards and threads', 'admin', 2, 1422803188),
('Rebuilt all boards and threads', 'admin', 2, 1422843564),
('Rebuilt all boards and threads', 'admin', 2, 1422843567),
('Rebuilt all boards and threads', 'admin', 2, 1422843659),
('Rebuilt all boards and threads', 'admin', 2, 1422844251),
('Rebuilt all boards and threads', 'admin', 2, 1422844403),
('Rebuilt all boards and threads', 'admin', 2, 1422844428),
('Rebuilt all boards and threads', 'admin', 2, 1422844437),
('Rebuilt all boards and threads', 'admin', 2, 1422844454),
('Rebuilt all boards and threads', 'admin', 2, 1422844547),
('Rebuilt all boards and threads', 'admin', 2, 1422844603),
('Rebuilt all boards and threads', 'admin', 2, 1422844640),
('Rebuilt all boards and threads', 'admin', 2, 1422845053),
('Rebuilt all boards and threads', 'admin', 2, 1422845399),
('Rebuilt all boards and threads', 'admin', 2, 1422845687),
('Rebuilt all boards and threads', 'admin', 2, 1422845755),
('Rebuilt all boards and threads', 'admin', 2, 1422845818),
('Rebuilt all boards and threads', 'admin', 2, 1422845988),
('Rebuilt all boards and threads', 'admin', 2, 1422847343),
('Rebuilt all boards and threads', 'admin', 2, 1422847376),
('Rebuilt all boards and threads', 'admin', 2, 1422847400),
('Rebuilt all boards and threads', 'admin', 2, 1422847405),
('Rebuilt all boards and threads', 'admin', 2, 1422847416),
('Rebuilt all boards and threads', 'admin', 2, 1422847447),
('Rebuilt all boards and threads', 'admin', 2, 1422847586),
('Rebuilt all boards and threads', 'admin', 2, 1422847713),
('Rebuilt all boards and threads', 'admin', 2, 1422848029),
('Rebuilt all boards and threads', 'admin', 2, 1422848058),
('Rebuilt all boards and threads', 'admin', 2, 1422848099),
('Updated board configuration - /test/', 'admin', 4, 1422848155),
('Updated board configuration - /test/', 'admin', 4, 1422848172),
('Updated board configuration - /test/', 'admin', 4, 1422848265),
('Rebuilt all boards and threads', 'admin', 2, 1422848455),
('Rebuilt all boards and threads', 'admin', 2, 1422849433),
('Rebuilt all boards and threads', 'admin', 2, 1422849512),
('Updated board configuration - /test/', 'admin', 4, 1422849895),
('Rebuilt all boards and threads', 'admin', 2, 1422861743),
('Rebuilt all boards and threads', 'admin', 2, 1422861773),
('Rebuilt all boards and threads', 'admin', 2, 1422861940),
('Rebuilt all boards and threads', 'admin', 2, 1422862003),
('Rebuilt all boards and threads', 'admin', 2, 1422862333),
('Rebuilt all boards and threads', 'admin', 2, 1422862520),
('Rebuilt all boards and threads', 'admin', 2, 1422862940),
('Rebuilt all boards and threads', 'admin', 2, 1422863063),
('Rebuilt all boards and threads', 'admin', 2, 1422863074),
('Rebuilt all boards and threads', 'admin', 2, 1422863154),
('Rebuilt all boards and threads', 'admin', 2, 1422863170),
('Rebuilt all boards and threads', 'admin', 2, 1422863819),
('Rebuilt all boards and threads', 'admin', 2, 1422863856),
('Rebuilt all boards and threads', 'admin', 2, 1422863920),
('Rebuilt all boards and threads', 'admin', 2, 1422864018),
('Rebuilt all boards and threads', 'admin', 2, 1422864089),
('Rebuilt all boards and threads', 'admin', 2, 1422864105),
('Rebuilt all boards and threads', 'admin', 2, 1422864210),
('Rebuilt all boards and threads', 'admin', 2, 1422864347),
('Rebuilt all boards and threads', 'admin', 2, 1422864433),
('Rebuilt all boards and threads', 'admin', 2, 1422864470),
('Rebuilt all boards and threads', 'admin', 2, 1422864515),
('Logged in', 'admin', 1, 1422865042),
('Rebuilt all boards and threads', 'admin', 2, 1422865048),
('Rebuilt all boards and threads', 'admin', 2, 1422865115),
('Rebuilt all boards and threads', 'admin', 2, 1422866538),
('Rebuilt all boards and threads', 'admin', 2, 1422866675),
('Rebuilt all boards and threads', 'admin', 2, 1422866770),
('Rebuilt all boards and threads', 'admin', 2, 1422866987),
('Updated board configuration - /test/', 'admin', 4, 1422868025),
('Rebuilt all boards and threads', 'admin', 2, 1422868673),
('Rebuilt all boards and threads', 'admin', 2, 1422868829),
('Rebuilt all boards and threads', 'admin', 2, 1423016225),
('Rebuilt all boards and threads', 'admin', 2, 1423017027),
('Rebuilt all boards and threads', 'admin', 2, 1423017116),
('Rebuilt all boards and threads', 'admin', 2, 1423017179),
('Rebuilt all boards and threads', 'admin', 2, 1423017256),
('Rebuilt all boards and threads', 'admin', 2, 1423017490),
('Rebuilt all boards and threads', 'admin', 2, 1423017970),
('Rebuilt all boards and threads', 'admin', 2, 1423019106),
('Rebuilt all boards and threads', 'admin', 2, 1423019449),
('Rebuilt all boards and threads', 'admin', 2, 1423019667),
('Rebuilt all boards and threads', 'admin', 2, 1423019738),
('Rebuilt all boards and threads', 'admin', 2, 1423019808),
('Rebuilt all boards and threads', 'admin', 2, 1423020391),
('Rebuilt all boards and threads', 'admin', 2, 1423020802),
('Rebuilt all boards and threads', 'admin', 2, 1423020817),
('Rebuilt all boards and threads', 'admin', 2, 1423020846),
('Rebuilt all boards and threads', 'admin', 2, 1423020884),
('Rebuilt all boards and threads', 'admin', 2, 1423021296),
('Rebuilt all boards and threads', 'admin', 2, 1423021846),
('Rebuilt all boards and threads', 'admin', 2, 1423021899),
('Rebuilt all boards and threads', 'admin', 2, 1423022099),
('Rebuilt all boards and threads', 'admin', 2, 1423022205),
('Rebuilt all boards and threads', 'admin', 2, 1423022339),
('Rebuilt all boards and threads', 'admin', 2, 1423022385),
('Rebuilt all boards and threads', 'admin', 2, 1423022557),
('Rebuilt all boards and threads', 'admin', 2, 1423022599),
('Rebuilt all boards and threads', 'admin', 2, 1423022960),
('Rebuilt all boards and threads', 'admin', 2, 1423025631),
('Rebuilt all boards and threads', 'admin', 2, 1423026124),
('Rebuilt all boards and threads', 'admin', 2, 1423026143),
('Rebuilt all boards and threads', 'admin', 2, 1423026541),
('Rebuilt all boards and threads', 'admin', 2, 1423026560),
('Rebuilt all boards and threads', 'admin', 2, 1423026670),
('Rebuilt all boards and threads', 'admin', 2, 1423026702),
('Rebuilt all boards and threads', 'admin', 2, 1423026761),
('Rebuilt all boards and threads', 'admin', 2, 1423026870),
('Rebuilt all boards and threads', 'admin', 2, 1423027002),
('Rebuilt all boards and threads', 'admin', 2, 1423027861),
('Rebuilt all boards and threads', 'admin', 2, 1423028171),
('Rebuilt all boards and threads', 'admin', 2, 1423028198),
('Rebuilt all boards and threads', 'admin', 2, 1423029011),
('Rebuilt all boards and threads', 'admin', 2, 1423029531),
('Rebuilt all boards and threads', 'admin', 2, 1423029559),
('Rebuilt all boards and threads', 'admin', 2, 1423029644),
('Rebuilt all boards and threads', 'admin', 2, 1423029864),
('Rebuilt all boards and threads', 'admin', 2, 1423030090),
('Rebuilt all boards and threads', 'admin', 2, 1423030185),
('Rebuilt all boards and threads', 'admin', 2, 1423030376),
('Rebuilt all boards and threads', 'admin', 2, 1423030483),
('Rebuilt all boards and threads', 'admin', 2, 1423031157),
('Rebuilt all boards and threads', 'admin', 2, 1423032250),
('Rebuilt all boards and threads', 'admin', 2, 1423032352),
('Rebuilt all boards and threads', 'admin', 2, 1423033028),
('Rebuilt all boards and threads', 'admin', 2, 1423033180),
('Rebuilt all boards and threads', 'admin', 2, 1423033312),
('Rebuilt all boards and threads', 'admin', 2, 1423033342),
('Rebuilt all boards and threads', 'admin', 2, 1423033371),
('Rebuilt all boards and threads', 'admin', 2, 1423033434),
('Rebuilt all boards and threads', 'admin', 2, 1423033455),
('Rebuilt all boards and threads', 'admin', 2, 1423033665),
('Rebuilt all boards and threads', 'admin', 2, 1423033813),
('Rebuilt all boards and threads', 'admin', 2, 1423033995),
('Rebuilt all boards and threads', 'admin', 2, 1423034014),
('Rebuilt all boards and threads', 'admin', 2, 1423034420),
('Rebuilt all boards and threads', 'admin', 2, 1423034450),
('Rebuilt all boards and threads', 'admin', 2, 1423034600),
('Rebuilt all boards and threads', 'admin', 2, 1423035312),
('Rebuilt all boards and threads', 'admin', 2, 1423035353),
('Rebuilt all boards and threads', 'admin', 2, 1423035630),
('Rebuilt all boards and threads', 'admin', 2, 1423035793),
('Rebuilt all boards and threads', 'admin', 2, 1423035809),
('Rebuilt all boards and threads', 'admin', 2, 1423036337),
('Rebuilt all boards and threads', 'admin', 2, 1423036476),
('Rebuilt all boards and threads', 'admin', 2, 1423036557),
('Rebuilt all boards and threads', 'admin', 2, 1423037333),
('Rebuilt all boards and threads', 'admin', 2, 1423037597),
('Rebuilt all boards and threads', 'admin', 2, 1423037609),
('Rebuilt all boards and threads', 'admin', 2, 1423037666),
('Rebuilt all boards and threads', 'admin', 2, 1423037761),
('Rebuilt all boards and threads', 'admin', 2, 1423038585),
('Rebuilt all boards and threads', 'admin', 2, 1423038628),
('Rebuilt all boards and threads', 'admin', 2, 1423038687),
('Rebuilt all boards and threads', 'admin', 2, 1423038845),
('Rebuilt all boards and threads', 'admin', 2, 1423039148),
('Rebuilt all boards and threads', 'admin', 2, 1423039450),
('Rebuilt all boards and threads', 'admin', 2, 1423039454),
('Rebuilt all boards and threads', 'admin', 2, 1423039775),
('Rebuilt all boards and threads', 'admin', 2, 1423039787),
('Rebuilt all boards and threads', 'admin', 2, 1423040540),
('Rebuilt all boards and threads', 'admin', 2, 1423041291),
('Rebuilt all boards and threads', 'admin', 2, 1423041378),
('Rebuilt all boards and threads', 'admin', 2, 1423121821),
('Rebuilt all boards and threads', 'admin', 2, 1423121981),
('Rebuilt all boards and threads', 'admin', 2, 1423122005),
('Rebuilt all boards and threads', 'admin', 2, 1423122121),
('Rebuilt all boards and threads', 'admin', 2, 1423122141),
('Rebuilt all boards and threads', 'admin', 2, 1423122257),
('Rebuilt all boards and threads', 'admin', 2, 1423122372),
('Rebuilt all boards and threads', 'admin', 2, 1423122435),
('Rebuilt all boards and threads', 'admin', 2, 1423122438),
('Rebuilt all boards and threads', 'admin', 2, 1423122450),
('Rebuilt all boards and threads', 'admin', 2, 1423123127),
('Rebuilt all boards and threads', 'admin', 2, 1423123131),
('Rebuilt all boards and threads', 'admin', 2, 1423123157),
('Rebuilt all boards and threads', 'admin', 2, 1423123248),
('Rebuilt all boards and threads', 'admin', 2, 1423123317),
('Rebuilt all boards and threads', 'admin', 2, 1423123624),
('Rebuilt all boards and threads', 'admin', 2, 1423123933),
('Rebuilt all boards and threads', 'admin', 2, 1423123990),
('Rebuilt all boards and threads', 'admin', 2, 1423124591),
('Rebuilt all boards and threads', 'admin', 2, 1423125009),
('Rebuilt all boards and threads', 'admin', 2, 1423125200),
('Rebuilt all boards and threads', 'admin', 2, 1423125492),
('Rebuilt all boards and threads', 'admin', 2, 1423125509),
('Rebuilt all boards and threads', 'admin', 2, 1423125919),
('Rebuilt all boards and threads', 'admin', 2, 1423126265),
('Rebuilt all boards and threads', 'admin', 2, 1423126570),
('Rebuilt all boards and threads', 'admin', 2, 1423126602),
('Rebuilt all boards and threads', 'admin', 2, 1423128055),
('Rebuilt all boards and threads', 'admin', 2, 1423191902),
('Rebuilt all boards and threads', 'admin', 2, 1423192037),
('Rebuilt all boards and threads', 'admin', 2, 1423192159),
('Rebuilt all boards and threads', 'admin', 2, 1423193141),
('Rebuilt all boards and threads', 'admin', 2, 1423194459),
('Rebuilt all boards and threads', 'admin', 2, 1423194985),
('Rebuilt all boards and threads', 'admin', 2, 1423195169),
('Rebuilt all boards and threads', 'admin', 2, 1423195230),
('Rebuilt all boards and threads', 'admin', 2, 1423195842),
('Rebuilt all boards and threads', 'admin', 2, 1423196036),
('Rebuilt all boards and threads', 'admin', 2, 1423196266),
('Rebuilt all boards and threads', 'admin', 2, 1423196311),
('Rebuilt all boards and threads', 'admin', 2, 1423196355),
('Rebuilt all boards and threads', 'admin', 2, 1423196409),
('Rebuilt all boards and threads', 'admin', 2, 1423196569),
('Rebuilt all boards and threads', 'admin', 2, 1423196782),
('Rebuilt all boards and threads', 'admin', 2, 1423196862),
('Rebuilt all boards and threads', 'admin', 2, 1423196877),
('Rebuilt all boards and threads', 'admin', 2, 1423197064),
('Rebuilt all boards and threads', 'admin', 2, 1423197077),
('Rebuilt all boards and threads', 'admin', 2, 1423197726),
('Rebuilt all boards and threads', 'admin', 2, 1423206709),
('Rebuilt all boards and threads', 'admin', 2, 1423206722),
('Rebuilt all boards and threads', 'admin', 2, 1423206780),
('Rebuilt all boards and threads', 'admin', 2, 1423207454),
('Rebuilt all boards and threads', 'admin', 2, 1423474380),
('Rebuilt all boards and threads', 'admin', 2, 1423627795),
('Rebuilt all boards and threads', 'admin', 2, 1423627828),
('Rebuilt all boards and threads', 'admin', 2, 1423628021),
('Rebuilt all boards and threads', 'admin', 2, 1423628125),
('Rebuilt all boards and threads', 'admin', 2, 1423628289),
('Rebuilt all boards and threads', 'admin', 2, 1423628353),
('Rebuilt all boards and threads', 'admin', 2, 1423628406),
('Rebuilt all boards and threads', 'admin', 2, 1423628442),
('Rebuilt all boards and threads', 'admin', 2, 1423628507),
('Rebuilt all boards and threads', 'admin', 2, 1423628553),
('Rebuilt all boards and threads', 'admin', 2, 1423628565),
('Rebuilt all boards and threads', 'admin', 2, 1423628622),
('Rebuilt all boards and threads', 'admin', 2, 1423628686),
('Rebuilt all boards and threads', 'admin', 2, 1423628703),
('Rebuilt all boards and threads', 'admin', 2, 1423629289),
('Rebuilt all boards and threads', 'admin', 2, 1423629521),
('Rebuilt all boards and threads', 'admin', 2, 1423630027),
('Rebuilt all boards and threads', 'admin', 2, 1423630109),
('Rebuilt all boards and threads', 'admin', 2, 1423633164),
('Rebuilt all boards and threads', 'admin', 2, 1423633238),
('Rebuilt all boards and threads', 'admin', 2, 1423633249),
('Rebuilt all boards and threads', 'admin', 2, 1423634022),
('Rebuilt all boards and threads', 'admin', 2, 1423634115),
('Rebuilt all boards and threads', 'admin', 2, 1423634154),
('Rebuilt all boards and threads', 'admin', 2, 1423634205),
('Rebuilt all boards and threads', 'admin', 2, 1423634232),
('Rebuilt all boards and threads', 'admin', 2, 1423634699),
('Rebuilt all boards and threads', 'admin', 2, 1423634813),
('Rebuilt all boards and threads', 'admin', 2, 1423634830),
('Rebuilt all boards and threads', 'admin', 2, 1423635199),
('Rebuilt all boards and threads', 'admin', 2, 1423635289),
('Rebuilt all boards and threads', 'admin', 2, 1423635391),
('Rebuilt all boards and threads', 'admin', 2, 1423635441),
('Rebuilt all boards and threads', 'admin', 2, 1423635515),
('Rebuilt all boards and threads', 'admin', 2, 1423635774),
('Rebuilt all boards and threads', 'admin', 2, 1423635886),
('Rebuilt all boards and threads', 'admin', 2, 1423636130),
('Rebuilt all boards and threads', 'admin', 2, 1423636706),
('Rebuilt all boards and threads', 'admin', 2, 1423636795),
('Rebuilt all boards and threads', 'admin', 2, 1423636859),
('Rebuilt all boards and threads', 'admin', 2, 1423637136),
('Rebuilt all boards and threads', 'admin', 2, 1423637152),
('Rebuilt all boards and threads', 'admin', 2, 1423637193),
('Rebuilt all boards and threads', 'admin', 2, 1423639436),
('Rebuilt all boards and threads', 'admin', 2, 1423639628),
('Rebuilt all boards and threads', 'admin', 2, 1423639745),
('Rebuilt all boards and threads', 'admin', 2, 1423639822),
('Rebuilt all boards and threads', 'admin', 2, 1423639855),
('Rebuilt all boards and threads', 'admin', 2, 1423639856),
('Rebuilt all boards and threads', 'admin', 2, 1423640332),
('Rebuilt all boards and threads', 'admin', 2, 1423641020),
('Rebuilt all boards and threads', 'admin', 2, 1423641626),
('Rebuilt all boards and threads', 'admin', 2, 1423642094),
('Rebuilt all boards and threads', 'admin', 2, 1423642096),
('Rebuilt all boards and threads', 'admin', 2, 1423642607),
('Rebuilt all boards and threads', 'admin', 2, 1423646290),
('Rebuilt all boards and threads', 'admin', 2, 1423646354),
('Rebuilt all boards and threads', 'admin', 2, 1423646731),
('Rebuilt all boards and threads', 'admin', 2, 1423646753),
('Rebuilt all boards and threads', 'admin', 2, 1423646955),
('Rebuilt all boards and threads', 'admin', 2, 1423647714),
('Rebuilt all boards and threads', 'admin', 2, 1423648063),
('Rebuilt all boards and threads', 'admin', 2, 1423648176),
('Rebuilt all boards and threads', 'admin', 2, 1423648303),
('Rebuilt all boards and threads', 'admin', 2, 1423702378),
('Rebuilt all boards and threads', 'admin', 2, 1423702944),
('Rebuilt all boards and threads', 'admin', 2, 1423703244),
('Rebuilt all boards and threads', 'admin', 2, 1423703484),
('Rebuilt all boards and threads', 'admin', 2, 1423704089),
('Rebuilt all boards and threads', 'admin', 2, 1423704463),
('Rebuilt all boards and threads', 'admin', 2, 1423708136),
('Rebuilt all boards and threads', 'admin', 2, 1423708294),
('Rebuilt all boards and threads', 'admin', 2, 1423708906),
('Rebuilt all boards and threads', 'admin', 2, 1423709171),
('Rebuilt all boards and threads', 'admin', 2, 1423709235),
('Rebuilt all boards and threads', 'admin', 2, 1423709252),
('Rebuilt all boards and threads', 'admin', 2, 1423712674),
('Rebuilt all boards and threads', 'admin', 2, 1423712745),
('Rebuilt all boards and threads', 'admin', 2, 1423713082),
('Logged in', 'admin', 1, 1423717305),
('Rebuilt all boards and threads', 'admin', 2, 1423723438),
('Rebuilt all boards and threads', 'admin', 2, 1423726539),
('Rebuilt all boards and threads', 'admin', 2, 1423726589),
('Rebuilt all boards and threads', 'admin', 2, 1423726679),
('Rebuilt all boards and threads', 'admin', 2, 1423726694),
('Rebuilt all boards and threads', 'admin', 2, 1423791877),
('Rebuilt all boards and threads', 'admin', 2, 1423792116),
('Rebuilt all boards and threads', 'admin', 2, 1423792934),
('Rebuilt all boards and threads', 'admin', 2, 1423797531),
('Rebuilt all boards and threads', 'admin', 2, 1423800596),
('Rebuilt all boards and threads', 'admin', 2, 1423801246),
('Rebuilt all boards and threads', 'admin', 2, 1423801399),
('Rebuilt all boards and threads', 'admin', 2, 1423801923),
('Rebuilt all boards and threads', 'admin', 2, 1423817360),
('Rebuilt all boards and threads', 'admin', 2, 1423818995),
('Rebuilt all boards and threads', 'admin', 2, 1423819034),
('Rebuilt all boards and threads', 'admin', 2, 1423819219),
('Rebuilt all boards and threads', 'admin', 2, 1423820179),
('Rebuilt all boards and threads', 'admin', 2, 1423820220),
('Rebuilt all boards and threads', 'admin', 2, 1424048297),
('Rebuilt all boards and threads', 'admin', 2, 1424048361),
('Rebuilt all boards and threads', 'admin', 2, 1424048505),
('Rebuilt all boards and threads', 'admin', 2, 1424049026),
('Rebuilt all boards and threads', 'admin', 2, 1424049662),
('Rebuilt all boards and threads', 'admin', 2, 1424050216),
('Rebuilt all boards and threads', 'admin', 2, 1424052096),
('Rebuilt all boards and threads', 'admin', 2, 1424052371),
('Rebuilt all boards and threads', 'admin', 2, 1424052513),
('Rebuilt all boards and threads', 'admin', 2, 1424140938),
('Rebuilt all boards and threads', 'admin', 2, 1424141252),
('Rebuilt all boards and threads', 'admin', 2, 1424141434),
('Rebuilt all boards and threads', 'admin', 2, 1424141994),
('Rebuilt all boards and threads', 'admin', 2, 1424142268),
('Rebuilt all boards and threads', 'admin', 2, 1424142422),
('Rebuilt all boards and threads', 'admin', 2, 1424143141),
('Rebuilt all boards and threads', 'admin', 2, 1424143160),
('Rebuilt all boards and threads', 'admin', 2, 1424154532),
('Rebuilt all boards and threads', 'admin', 2, 1424155568),
('Rebuilt all boards and threads', 'admin', 2, 1424155661),
('Rebuilt all boards and threads', 'admin', 2, 1424159079),
('Rebuilt all boards and threads', 'admin', 2, 1424160629),
('Rebuilt all boards and threads', 'admin', 2, 1424161028),
('Rebuilt all boards and threads', 'admin', 2, 1424161318),
('Rebuilt all boards and threads', 'admin', 2, 1424161375),
('Rebuilt all boards and threads', 'admin', 2, 1424162778),
('Rebuilt all boards and threads', 'admin', 2, 1424165814),
('Rebuilt all boards and threads', 'admin', 2, 1424166167),
('Rebuilt all boards and threads', 'admin', 2, 1424166201),
('Rebuilt all boards and threads', 'admin', 2, 1424166462),
('Rebuilt all boards and threads', 'admin', 2, 1424167857),
('Rebuilt all boards and threads', 'admin', 2, 1424167874);

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE IF NOT EXISTS `module_settings` (
  `module` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'string'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `module_settings`
--

TRUNCATE TABLE `module_settings`;
-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `boardid` smallint(5) unsigned NOT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tripcode` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `file` varchar(50) NOT NULL,
  `file_md5` char(32) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `file_original` varchar(255) NOT NULL,
  `file_size` int(20) NOT NULL DEFAULT '0',
  `file_size_formatted` varchar(75) NOT NULL,
  `image_w` smallint(5) NOT NULL DEFAULT '0',
  `image_h` smallint(5) NOT NULL DEFAULT '0',
  `thumb_w` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb_h` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(75) NOT NULL,
  `ipmd5` char(32) NOT NULL,
  `tag` varchar(5) NOT NULL,
  `timestamp` int(20) unsigned NOT NULL,
  `stickied` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `posterauthority` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted_timestamp` int(20) NOT NULL DEFAULT '0',
  `IS_DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `bumped` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`boardid`,`id`),
  KEY `parentid` (`parentid`),
  KEY `bumped` (`bumped`),
  KEY `file_md5` (`file_md5`),
  KEY `stickied` (`stickied`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `posts`
--

TRUNCATE TABLE `posts`;
--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `boardid`, `parentid`, `name`, `tripcode`, `email`, `subject`, `message`, `password`, `file`, `file_md5`, `file_type`, `file_original`, `file_size`, `file_size_formatted`, `image_w`, `image_h`, `thumb_w`, `thumb_h`, `ip`, `ipmd5`, `tag`, `timestamp`, `stickied`, `locked`, `posterauthority`, `reviewed`, `deleted_timestamp`, `IS_DELETED`, `bumped`) VALUES
(1, 1, 0, '', '', '', 'The Red Brown Fox Jumps', 'Over the Lazy Dog<br />', '8bfaa7b596a8b896ca96293f38570796', '142051708446', '19352f1f76cb61616d8889edb4314bf8', 'jpg', 'capture', 171879, '167.85KB', 1024, 1280, 160, 200, 'nis9JGT6+GcpPULcx/cUN0iZVm4xICEV9W2tr9S0Aks=', 'f528764d624db129b32c21fbca0cb8d6', '', 1420517084, 0, 0, 0, 0, 0, 0, 1423816727),
(2, 1, 1, '', '', '', '', 'adasdasdsad<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'XwhvabDWaRkYdPmChjYmTjRQKj+OXvdnPGb7Wmq6tKo=', 'f528764d624db129b32c21fbca0cb8d6', '', 1422870388, 0, 0, 0, 0, 0, 0, 1422870388),
(3, 1, 1, '', '', '', '', '<a class="ref|test|1|1" onclick="return highlight(''1'', true);" href="http://kusaba.localhost/test/res/1.html#1">&gt;&gt;1</a>\n<br />Testing reply!<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'xGu+xNUD9ZwlG8vDESf/kW+UP97S3+WzebUnrJBJB2M=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423038818, 0, 0, 0, 0, 0, 0, 1423038818),
(4, 1, 1, '', '', '', '', 'asdasasd<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'i73zHcdlspWrGXn4nYygPGG2D78y0+K9TOE5mi9XGAA=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423040015, 0, 0, 0, 0, 0, 0, 1423040015),
(5, 1, 1, '', '', '', '', 'aaaaaaaaaaaaaaaaaaaa<br />', '994e595c500b9ddf4acc4feae529e94a', '142304002591', '553108cf7fa85314d88d677e0078a5cd', 'jpg', 'capture', 106060, '103.57 KB', 618, 677, 114, 125, 'glDgZFI2KcrXaH0xMc3l0PnNXpjib8+gg59VS+5rvyI=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423040025, 0, 0, 0, 0, 0, 0, 1423040025),
(6, 1, 0, 'Ribbons Almark', '', 'appledeapp@apple.com', 'Steve Jobs is dead', 'EMA IS THE BEST GIRL &lt;b&gt;Test&lt;/b&gt;<br />', '994e595c500b9ddf4acc4feae529e94a', '142312818210', '0e748a1377eb8526f06e228bdaf7541f', 'png', 'capture', 31027, '30.30 KB', 1103, 461, 200, 84, 'KB/QMAqlB8ae7UeUU37kKyfzlOGEGakecAg20ne3oG8=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423128182, 0, 0, 0, 0, 0, 0, 1423128182),
(7, 1, 0, '', '', '', '', '', '994e595c500b9ddf4acc4feae529e94a', 'Se1y2R5QRKU', '', 'you', '', 0, '0 B', 0, 0, 0, 0, 'Nb4z5LuU/6x7Y1J5naJ36abeygonmJ5Nin0uEtPn3Mk=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423636217, 0, 0, 0, 0, 0, 0, 1424154410),
(8, 1, 1, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/1.html#5\\" onclick=\\"return highlight(\\''5\\'', true);\\" class=\\"ref|test|1|5\\">&gt;&gt;5</a>\n<br />What a game!<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, '2q1nBUgUPD1WR2AaIrdwdL19zz0S4P3hL4NrB6kxLbQ=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423816727, 0, 0, 0, 0, 0, 0, 1423816727),
(9, 1, 7, '', '', '', '', 'testing reply<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'w1LD++vgXWOe8qWX+vDNhzJSnGsN1JfXJK0a/2uMvCI=', 'f528764d624db129b32c21fbca0cb8d6', '', 1424136558, 0, 0, 0, 0, 0, 0, 1424136558),
(10, 1, 7, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/7.html#7\\" onclick=\\"return highlight(\\''7\\'', true);\\" class=\\"ref|test|7|7\\">&gt;&gt;7</a> daburu testo<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, '3ow3SzViYNhTjzPghR5iK4trJcMyTbOVGa0CewLfZTk=', 'f528764d624db129b32c21fbca0cb8d6', '', 1424136604, 0, 0, 0, 0, 0, 0, 1424136604),
(11, 1, 7, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/7.html#7\\" onclick=\\"return highlight(\\''7\\'', true);\\" class=\\"ref|test|7|7\\">&gt;&gt;7</a><br />', '994e595c500b9ddf4acc4feae529e94a', '62qWI7CpIds', '', 'you', '', 0, '0 B', 0, 0, 0, 0, 'Gn2QDU3CTfHzlFGdH1KQXT4ggZKJIQ6NLaIB+u2Bw/A=', 'f528764d624db129b32c21fbca0cb8d6', '', 1424154410, 0, 0, 0, 0, 0, 0, 1424154410);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cleared` tinyint(1) NOT NULL DEFAULT '0',
  `board` varchar(255) NOT NULL,
  `postid` int(20) NOT NULL,
  `when` int(20) NOT NULL,
  `ip` varchar(75) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `reports`
--

TRUNCATE TABLE `reports`;
-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `order` tinyint(3) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `abbreviation` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `sections`
--

TRUNCATE TABLE `sections`;
--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `order`, `hidden`, `name`, `abbreviation`) VALUES
(1, 0, 0, 'Main', 'main');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(3) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `boards` text,
  `addedon` int(20) NOT NULL,
  `lastactive` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `staff`
--

TRUNCATE TABLE `staff`;
--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `password`, `salt`, `type`, `boards`, `addedon`, `lastactive`) VALUES
(1, 'admin', 'b55f5d48f4912613d606358235dfef14', 'sLc', 1, NULL, 1420511506, 1424167874);

-- --------------------------------------------------------

--
-- Table structure for table `watchedthreads`
--

CREATE TABLE IF NOT EXISTS `watchedthreads` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `threadid` int(20) NOT NULL,
  `board` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `lastsawreplyid` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `watchedthreads`
--

TRUNCATE TABLE `watchedthreads`;
-- --------------------------------------------------------

--
-- Table structure for table `wordfilter`
--

CREATE TABLE IF NOT EXISTS `wordfilter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(75) NOT NULL,
  `replacedby` varchar(75) NOT NULL,
  `boards` text NOT NULL,
  `time` int(20) NOT NULL,
  `regex` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `wordfilter`
--

TRUNCATE TABLE `wordfilter`;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
