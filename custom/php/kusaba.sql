-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2015 at 10:54 AM
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

DROP TABLE IF EXISTS `ads`;
CREATE TABLE IF NOT EXISTS `ads` (
  `id` smallint(1) unsigned NOT NULL,
  `position` varchar(3) NOT NULL,
  `disp` tinyint(1) NOT NULL,
  `boards` varchar(255) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `announcements`;
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
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `parentid`, `subject`, `postedat`, `postedby`, `message`) VALUES
(1, 0, 'Testing 123', 1420782046, 'admin', 'apolcalypse now!'),
(2, 0, 'apple of my eye', 1420782065, 'admin', 'We go here again!');

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

DROP TABLE IF EXISTS `banlist`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `bannedhashes`
--

DROP TABLE IF EXISTS `bannedhashes`;
CREATE TABLE IF NOT EXISTS `bannedhashes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `md5` varchar(255) NOT NULL,
  `bantime` int(10) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blotter`
--

DROP TABLE IF EXISTS `blotter`;
CREATE TABLE IF NOT EXISTS `blotter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `important` tinyint(1) NOT NULL,
  `at` int(20) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `blotter`
--

INSERT INTO `blotter` (`id`, `important`, `at`, `message`) VALUES
(1, 0, 1426142184, 'we''re too slow in our work! get your ass working!');

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
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
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `order`, `name`, `type`, `start`, `uploadtype`, `desc`, `image`, `section`, `maximagesize`, `maxpages`, `maxage`, `markpage`, `maxreplies`, `messagelength`, `createdon`, `locked`, `includeheader`, `redirecttothread`, `anonymous`, `forcedanon`, `embeds_allowed`, `trial`, `popular`, `defaultstyle`, `locale`, `showid`, `compactlist`, `enablereporting`, `enablecaptcha`, `enablenofile`, `enablearchiving`, `enablecatalog`, `loadbalanceurl`, `loadbalancepassword`) VALUES
(1, 0, 'test', 0, 1, 1, 'Testing', '', 1, 1024000, 11, 0, 9, 200, 8192, 1420515735, 0, '', 1, 'Anonymous', 0, 'you,goo', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', ''),
(2, 0, 'apple', 2, 1, 0, 'apple of my eye', '', 1, 1024000, 11, 0, 9, 200, 8192, 1421396880, 0, '', 0, 'Anonymous', 0, '', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', ''),
(3, 0, 'nexttets', 0, 1, 0, 'asdasd', '', 0, 1024000, 11, 0, 9, 200, 8192, 1421397269, 0, '', 0, 'Anonymous', 0, '', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `board_filetypes`
--

DROP TABLE IF EXISTS `board_filetypes`;
CREATE TABLE IF NOT EXISTS `board_filetypes` (
  `boardid` tinyint(5) NOT NULL DEFAULT '0',
  `typeid` mediumint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `board_filetypes`
--

INSERT INTO `board_filetypes` (`boardid`, `typeid`) VALUES
(1, 3),
(1, 1),
(1, 2),
(2, 3),
(2, 1),
(2, 2),
(3, 3),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `embeds`
--

DROP TABLE IF EXISTS `embeds`;
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
-- Dumping data for table `embeds`
--

INSERT INTO `embeds` (`id`, `filetype`, `name`, `videourl`, `width`, `height`, `code`) VALUES
(1, 'you', 'Youtube', 'http://www.youtube.com/watch?v=', 200, 164, '<object type="application/x-shockwave-flash" width="SET_WIDTH" height="SET_HEIGHT" data="http://www.youtube.com/v/EMBED_ID"> <param name="movie" value="http://www.youtube.com/v/EMBED_ID" /> </object>'),
(2, 'goo', 'Google', 'http://video.google.com/videoplay?docid=', 200, 164, '<embed width="SET_WIDTH" height="SET_HEIGHT" id="VideoPlayback" type="application/x-shockwave-flash" src="http://video.google.com/googleplayer.swf?docId=EMBED_ID"></embed>');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `name` varchar(255) NOT NULL,
  `at` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`name`, `at`) VALUES
('pingback', 0),
('sitemap', 1428072613);

-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

DROP TABLE IF EXISTS `filetypes`;
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

DROP TABLE IF EXISTS `front`;
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
-- Dumping data for table `front`
--

INSERT INTO `front` (`id`, `page`, `order`, `subject`, `message`, `timestamp`, `poster`, `email`) VALUES
(1, 0, 0, 'YOU ALL', 'are good people\r\nand my job is pretty tiring\r\nbut i am here ayy <b>lmao</b>\r\n<a>gahnoo plus linux</a>', 1422591878, 'admin', ''),
(2, 1, 0, 'dijanoie', 'asdasdasd', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `loginattempts`
--

DROP TABLE IF EXISTS `loginattempts`;
CREATE TABLE IF NOT EXISTS `loginattempts` (
  `username` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modlog`
--

DROP TABLE IF EXISTS `modlog`;
CREATE TABLE IF NOT EXISTS `modlog` (
  `entry` text NOT NULL,
  `user` varchar(255) NOT NULL,
  `category` tinyint(2) NOT NULL DEFAULT '0',
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
('Rebuilt all boards and threads', 'admin', 2, 1424167874),
('Rebuilt all boards and threads', 'admin', 2, 1425096796),
('Rebuilt all boards and threads', 'admin', 2, 1425024751),
('Rebuilt all boards and threads', 'admin', 2, 1425024809),
('Rebuilt all boards and threads', 'admin', 2, 1425025557),
('Rebuilt all boards and threads', 'admin', 2, 1425025846),
('Rebuilt all boards and threads', 'admin', 2, 1425025882),
('Rebuilt all boards and threads', 'admin', 2, 1425025913),
('Rebuilt all boards and threads', 'admin', 2, 1425025967),
('Rebuilt all boards and threads', 'admin', 2, 1425026084),
('Rebuilt all boards and threads', 'admin', 2, 1425026129),
('Rebuilt all boards and threads', 'admin', 2, 1425026589),
('Rebuilt all boards and threads', 'admin', 2, 1426124092),
('Rebuilt all boards and threads', 'admin', 2, 1426124115),
('Rebuilt all boards and threads', 'admin', 2, 1426124138),
('Rebuilt all boards and threads', 'admin', 2, 1426124163),
('Rebuilt all boards and threads', 'admin', 2, 1426124670),
('Rebuilt all boards and threads', 'admin', 2, 1426124690),
('Rebuilt all boards and threads', 'admin', 2, 1426124759),
('Rebuilt all boards and threads', 'admin', 2, 1426124944),
('Rebuilt all boards and threads', 'admin', 2, 1426125009),
('Rebuilt all boards and threads', 'admin', 2, 1426125164),
('Rebuilt all boards and threads', 'admin', 2, 1426125326),
('Rebuilt all boards and threads', 'admin', 2, 1426125556),
('Rebuilt all boards and threads', 'admin', 2, 1426127537),
('Rebuilt all boards and threads', 'admin', 2, 1426127562),
('Rebuilt all boards and threads', 'admin', 2, 1426127593),
('Rebuilt all boards and threads', 'admin', 2, 1426127605),
('Rebuilt all boards and threads', 'admin', 2, 1426127684),
('Rebuilt all boards and threads', 'admin', 2, 1426141866),
('Rebuilt all boards and threads', 'admin', 2, 1426141883),
('Rebuilt all boards and threads', 'admin', 2, 1426142751),
('Rebuilt all boards and threads', 'admin', 2, 1426142800),
('Rebuilt all boards and threads', 'admin', 2, 1426143026),
('Rebuilt all boards and threads', 'admin', 2, 1426143060),
('Updated board configuration - /apple/', 'admin', 4, 1426144185),
('Rebuilt all boards and threads', 'admin', 2, 1426144567),
('Rebuilt all boards and threads', 'admin', 2, 1426144672),
('Rebuilt all boards and threads', 'admin', 2, 1426144844),
('Rebuilt all boards and threads', 'admin', 2, 1426144921),
('Rebuilt all boards and threads', 'admin', 2, 1426145043),
('Rebuilt all boards and threads', 'admin', 2, 1426145531),
('Rebuilt all boards and threads', 'admin', 2, 1426145601),
('Rebuilt all boards and threads', 'admin', 2, 1426145776),
('Rebuilt all boards and threads', 'admin', 2, 1426145853),
('Rebuilt all boards and threads', 'admin', 2, 1426145955),
('Rebuilt all boards and threads', 'admin', 2, 1426146000),
('Rebuilt all boards and threads', 'admin', 2, 1426146068),
('Rebuilt all boards and threads', 'admin', 2, 1426146083),
('Rebuilt all boards and threads', 'admin', 2, 1426146164),
('Rebuilt all boards and threads', 'admin', 2, 1426146278),
('Rebuilt all boards and threads', 'admin', 2, 1426146437),
('Rebuilt all boards and threads', 'admin', 2, 1426146454),
('Rebuilt all boards and threads', 'admin', 2, 1426146735),
('Rebuilt all boards and threads', 'admin', 2, 1426146785),
('Updated board configuration - /test/', 'admin', 4, 1426146819),
('Rebuilt all boards and threads', 'admin', 2, 1426147177),
('Rebuilt all boards and threads', 'admin', 2, 1426147479),
('Rebuilt all boards and threads', 'admin', 2, 1426147539),
('Rebuilt all boards and threads', 'admin', 2, 1426148975),
('Rebuilt all boards and threads', 'admin', 2, 1426149105),
('Rebuilt all boards and threads', 'admin', 2, 1426150337),
('Rebuilt all boards and threads', 'admin', 2, 1426150725),
('Rebuilt all boards and threads', 'admin', 2, 1426150836),
('Updated board configuration - /test/', 'admin', 4, 1426151135),
('Rebuilt all boards and threads', 'admin', 2, 1426151245),
('Rebuilt all boards and threads', 'admin', 2, 1426211273),
('Rebuilt all boards and threads', 'admin', 2, 1426211450),
('Rebuilt all boards and threads', 'admin', 2, 1426213204),
('Rebuilt all boards and threads', 'admin', 2, 1426216001),
('Rebuilt all boards and threads', 'admin', 2, 1426216113),
('Rebuilt all boards and threads', 'admin', 2, 1426216191),
('Rebuilt all boards and threads', 'admin', 2, 1426216334),
('Rebuilt all boards and threads', 'admin', 2, 1426216655),
('Rebuilt all boards and threads', 'admin', 2, 1426216709),
('Rebuilt all boards and threads', 'admin', 2, 1426216732),
('Rebuilt all boards and threads', 'admin', 2, 1426216840),
('Rebuilt all boards and threads', 'admin', 2, 1426217050),
('Rebuilt all boards and threads', 'admin', 2, 1426217089),
('Rebuilt all boards and threads', 'admin', 2, 1426217135),
('Rebuilt all boards and threads', 'admin', 2, 1426217388),
('Rebuilt all boards and threads', 'admin', 2, 1426217420),
('Rebuilt all boards and threads', 'admin', 2, 1426217522),
('Rebuilt all boards and threads', 'admin', 2, 1426217578),
('Rebuilt all boards and threads', 'admin', 2, 1426227158),
('Rebuilt all boards and threads', 'admin', 2, 1426227351),
('Rebuilt all boards and threads', 'admin', 2, 1426227772),
('Rebuilt all boards and threads', 'admin', 2, 1426227818),
('Rebuilt all boards and threads', 'admin', 2, 1426470735),
('Rebuilt all boards and threads', 'admin', 2, 1426470782),
('Logged in', 'admin', 1, 1427775585),
('Unbanned 127.0.0.1', 'admin', 8, 1427775597),
('Unbanned 127.0.0.1', 'admin', 8, 1427776175),
('Unbanned 127.0.0.1', 'admin', 8, 1427962437),
('Rebuilt all boards and threads', 'admin', 2, 1427965696),
('Rebuilt all boards and threads', 'admin', 2, 1427966563),
('Rebuilt all boards and threads', 'admin', 2, 1427966663),
('Rebuilt all boards and threads', 'admin', 2, 1427967873),
('Rebuilt all boards and threads', 'admin', 2, 1427968002),
('Rebuilt all boards and threads', 'admin', 2, 1428032316),
('Rebuilt all boards and threads', 'admin', 2, 1428033126),
('Rebuilt all boards and threads', 'admin', 2, 1428033287),
('Rebuilt all boards and threads', 'admin', 2, 1428033295),
('Rebuilt all boards and threads', 'admin', 2, 1428034059),
('Rebuilt all boards and threads', 'admin', 2, 1428040226),
('Rebuilt all boards and threads', 'admin', 2, 1428040543),
('Rebuilt all boards and threads', 'admin', 2, 1428044874),
('Rebuilt all boards and threads', 'admin', 2, 1428046392),
('Logged in', 'admin', 1, 1428046596),
('Logged in', 'admin', 1, 1428047114),
('Modposted #<a href="http://kusaba.localhost/test/res/20.html#25">25</a> in /test/ with flags: D.', 'admin', 1, 1428047169),
('Logged in', 'admin', 1, 1428047338),
('Rebuilt all boards and threads', 'admin', 2, 1428048274);

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

DROP TABLE IF EXISTS `module_settings`;
CREATE TABLE IF NOT EXISTS `module_settings` (
  `module` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'string'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
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
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `boardid`, `parentid`, `name`, `tripcode`, `email`, `subject`, `message`, `password`, `file`, `file_md5`, `file_type`, `file_original`, `file_size`, `file_size_formatted`, `image_w`, `image_h`, `thumb_w`, `thumb_h`, `ip`, `ipmd5`, `tag`, `timestamp`, `stickied`, `locked`, `posterauthority`, `reviewed`, `deleted_timestamp`, `IS_DELETED`, `bumped`) VALUES
(1, 1, 0, '', '', '', 'The Red Brown Fox Jumps', 'Over the Lazy Dog<br />', '8bfaa7b596a8b896ca96293f38570796', '142051708446', '19352f1f76cb61616d8889edb4314bf8', 'jpg', 'capture', 171879, '167.85KB', 1024, 1280, 160, 200, 'nis9JGT6+GcpPULcx/cUN0iZVm4xICEV9W2tr9S0Aks=', 'f528764d624db129b32c21fbca0cb8d6', '', 1420517084, 0, 0, 0, 0, 0, 0, 1428038645),
(2, 1, 1, '', '', '', '', 'adasdasdsad<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'XwhvabDWaRkYdPmChjYmTjRQKj+OXvdnPGb7Wmq6tKo=', 'f528764d624db129b32c21fbca0cb8d6', '', 1422870388, 0, 0, 0, 0, 0, 0, 1422870388),
(3, 1, 1, '', '', '', '', '<a class="ref|test|1|1" onclick="return highlight(''1'', true);" href="http://kusaba.localhost/test/res/1.html#1">&gt;&gt;1</a>\n<br />Testing reply!<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'xGu+xNUD9ZwlG8vDESf/kW+UP97S3+WzebUnrJBJB2M=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423038818, 0, 0, 0, 0, 0, 0, 1423038818),
(4, 1, 1, '', '', '', '', 'asdasasd<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'i73zHcdlspWrGXn4nYygPGG2D78y0+K9TOE5mi9XGAA=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423040015, 0, 0, 0, 0, 0, 0, 1423040015),
(5, 1, 1, '', '', '', '', 'aaaaaaaaaaaaaaaaaaaa<br />', '994e595c500b9ddf4acc4feae529e94a', '142304002591', '553108cf7fa85314d88d677e0078a5cd', 'jpg', 'capture', 106060, '103.57 KB', 618, 677, 114, 125, 'glDgZFI2KcrXaH0xMc3l0PnNXpjib8+gg59VS+5rvyI=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423040025, 0, 0, 0, 0, 0, 0, 1423040025),
(6, 1, 0, 'Ribbons Almark', '', 'appledeapp@apple.com', 'Steve Jobs is dead', 'EMA IS THE BEST GIRL &lt;b&gt;Test&lt;/b&gt;<br />', '994e595c500b9ddf4acc4feae529e94a', '142312818210', '0e748a1377eb8526f06e228bdaf7541f', 'png', 'capture', 31027, '30.30 KB', 1103, 461, 200, 84, 'KB/QMAqlB8ae7UeUU37kKyfzlOGEGakecAg20ne3oG8=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423128182, 0, 0, 0, 0, 0, 0, 1423128182),
(7, 1, 0, '', '', '', '', '', '994e595c500b9ddf4acc4feae529e94a', 'Se1y2R5QRKU', '', 'you', '', 0, '0 B', 0, 0, 0, 0, 'Nb4z5LuU/6x7Y1J5naJ36abeygonmJ5Nin0uEtPn3Mk=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423636217, 0, 0, 0, 0, 0, 0, 1426738602),
(8, 1, 1, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/1.html#5\\" onclick=\\"return highlight(\\''5\\'', true);\\" class=\\"ref|test|1|5\\">&gt;&gt;5</a>\n<br />What a game!<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, '2q1nBUgUPD1WR2AaIrdwdL19zz0S4P3hL4NrB6kxLbQ=', 'f528764d624db129b32c21fbca0cb8d6', '', 1423816727, 0, 0, 0, 0, 0, 0, 1423816727),
(9, 1, 7, '', '', '', '', 'testing reply<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'w1LD++vgXWOe8qWX+vDNhzJSnGsN1JfXJK0a/2uMvCI=', 'f528764d624db129b32c21fbca0cb8d6', '', 1424136558, 0, 0, 0, 0, 0, 0, 1424136558),
(10, 1, 7, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/7.html#7\\" onclick=\\"return highlight(\\''7\\'', true);\\" class=\\"ref|test|7|7\\">&gt;&gt;7</a> daburu testo<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, '3ow3SzViYNhTjzPghR5iK4trJcMyTbOVGa0CewLfZTk=', 'f528764d624db129b32c21fbca0cb8d6', '', 1424136604, 0, 0, 0, 0, 0, 0, 1424136604),
(11, 1, 7, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/7.html#7\\" onclick=\\"return highlight(\\''7\\'', true);\\" class=\\"ref|test|7|7\\">&gt;&gt;7</a><br />', '994e595c500b9ddf4acc4feae529e94a', '62qWI7CpIds', '', 'you', '', 0, '0 B', 0, 0, 0, 0, 'Gn2QDU3CTfHzlFGdH1KQXT4ggZKJIQ6NLaIB+u2Bw/A=', 'f528764d624db129b32c21fbca0cb8d6', '', 1424154410, 0, 0, 0, 0, 0, 0, 1424154410),
(12, 1, 7, '', '', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis lorem a mauris cursus maximus. Aliquam efficitur magna vel pulvinar sodales. Suspendisse a ultricies quam. Vivamus non elit vitae neque porttitor luctus a quis massa. Suspendisse tincidunt dictum ex, non molestie est. Donec tincidunt sapien eget lacinia interdum. Cras tincidunt, erat ut molestie tincidunt, orci mi mollis justo, et ultricies ipsum neque vitae erat. Ut tempor imperdiet diam vitae efficitur. Quisque luctus lorem at consectetur elementum. Ut hendrerit vestibulum justo, vitae ornare diam malesuada dictum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis feugiat felis id consequat auctor. Nulla sit amet orci eget neque cursus ornare sed id mi. Quisque molestie odio eu faucibus ultricies.\r<br />\r<br />Nullam consequat sem at enim iaculis egestas. Nulla lacinia commodo ex, quis mattis enim gravida eget. Aenean malesuada libero ac ex lacinia consectetur. Vivamus venenatis sollicitudin ligula et tempus. Phasellus hendrerit, ligula in aliquam luctus, dolor mauris commodo libero, eu consectetur ligula velit quis nulla. Maecenas quis malesuada nulla. Phasellus at vestibulum quam.<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'onlSybKvjB3afUBzK6dcGFDFzgBy/7LiEjKOtsk/R28=', 'f528764d624db129b32c21fbca0cb8d6', '', 1425026241, 0, 0, 0, 0, 0, 0, 1425026241),
(13, 1, 7, '', '', '', '', 'Ut congue nisi eget imperdiet efficitur. Aliquam pellentesque ligula nec nulla convallis, sit amet placerat nunc eleifend. Ut maximus elementum metus at placerat. Praesent justo neque, molestie sed luctus ut, lobortis vel velit. Vivamus consectetur eros quis efficitur sagittis. Suspendisse potenti. Integer diam odio, suscipit eu enim id, accumsan maximus nunc. Proin vel aliquet dolor.\r<br />\r<br />Quisque dictum magna odio, id rhoncus ipsum imperdiet non. Morbi fermentum elit vel nisi mollis scelerisque. Fusce quis dignissim justo. Integer mi nisi, maximus at hendrerit non, porttitor sed sapien. Fusce mollis ante quis nunc bibendum, vitae maximus lectus efficitur. Proin viverra imperdiet dui ut egestas. Nullam tempor lectus et libero rhoncus, nec varius leo condimentum. Cras facilisis metus in accumsan dictum. Fusce id vulputate tellus, eget fermentum odio. Etiam vulputate metus ante, nec dictum dui posuere ut. Nulla mi dui, porta ut diam quis, commodo sollicitudin dui. Vestibulum tristique quam et eros pellentesque, in eleifend nibh suscipit. Morbi interdum libero eget eros gravida, eget dictum dolor interdum. Fusce gravida mollis gravida.\r<br />\r<br />Proin ullamcorper purus non justo blandit sollicitudin. Quisque nec urna posuere, venenatis massa non, pulvinar massa. Donec posuere nulla et lorem rhoncus varius. Nunc euismod ornare sapien et ullamcorper. Integer lacus est, rutrum ac nulla a, posuere mattis orci. Sed dolor metus, porttitor a nunc elementum, interdum faucibus dolor. Nullam fringilla, ante sed rhoncus tincidunt, purus sapien vulputate ante, non convallis nisi lacus in mauris. Vestibulum eget nunc libero. Suspendisse malesuada lacus eu sapien consequat congue.<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'SFgvyLlWkHxu840rUdVOfU7c/mU4MUYg4vJy+sePeBM=', 'f528764d624db129b32c21fbca0cb8d6', '', 1425026265, 0, 0, 0, 0, 0, 0, 1425026265),
(1, 2, 0, '', '', '', '', '<br /><small><a href=\\"http://kusaba.localhost/animation.php?board=apple&amp;id=142615052789\\">View animation</a></small>', '', '142615052789', '7bb2ff563fdd746874ae4e41512a0735', 'png', '142615052789', 3190, '3.12 KB', 300, 300, 200, 200, 'tWRsTwcKnY4BVbyoQIttF5Di8fSvv9IMJMm4d99pB90=', 'f528764d624db129b32c21fbca0cb8d6', '', 1426150527, 0, 0, 0, 0, 0, 0, 1426150527),
(14, 1, 7, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/7.html#13\\" onclick=\\"return highlight(\\''13\\'', true);\\" class=\\"ref|test|7|13\\">&gt;&gt;13</a>\r<br />ãŠèª•ç”Ÿæ—¥ãŠã‚ã§ã¨ã†ã‚¨ã‚¤ãƒ©ï¼<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, '98hyQ5zbOpkpbcY7OClw7CJPAxTQWrrQDAd+vwakiQU=', 'f528764d624db129b32c21fbca0cb8d6', '', 1426208121, 0, 0, 0, 0, 0, 0, 1426208121),
(15, 1, 1, 'sage', '', 'apple@pie.com', '', '<span class=\\"spoiler\\" onmouseover=\\"this.style.color=\\''white\\'';\\" onmouseout=\\"this.style.color=\\''black\\''\\">test</span><br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'B+0zPDPhuJ39hnKrGEWvAwtlUqfznO6S56HngNEgtJA=', 'f528764d624db129b32c21fbca0cb8d6', '', 1426227938, 0, 0, 0, 0, 0, 0, 1426227938),
(16, 1, 7, '', '', '', '', '', '994e595c500b9ddf4acc4feae529e94a', '142673860258', '51a431cb90c5ffcbb644b5a77a3ea19e', 'jpg', 'capture', 27463, '26.82 KB', 460, 298, 125, 81, 'K1Hd7CXnmOT8Vz+KweCsddWYZNyj6ypV9GqPwkfUU3k=', 'f528764d624db129b32c21fbca0cb8d6', '', 1426738602, 0, 0, 0, 0, 0, 0, 1426738602),
(17, 1, 1, '', '', '', '', 'asdasdasd<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'P9MYCujs96RAu/n/pG8kbJar7STy/wEqGvoZxAfmNXE=', 'f528764d624db129b32c21fbca0cb8d6', '', 1427962451, 0, 0, 0, 0, 0, 0, 1427962451),
(18, 1, 1, '', '', '', '', 'test<br />', '994e595c500b9ddf4acc4feae529e94a', '142796428423', 'f57b1501285bc4267eef381be446dbde', 'jpg', 'Spoiler Picture', 15802, '15.43 KB', 480, 360, 100, 100, '0T54HlAY5X0xVbDkGiYLKdXadS9+R4bBFzWcJj38zYc=', 'f528764d624db129b32c21fbca0cb8d6', '', 1427964284, 0, 0, 0, 0, 0, 0, 1427964284),
(19, 1, 1, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/1.html#18\\" onclick=\\"return highlight(\\''18\\'', true);\\" class=\\"ref|test|1|18\\">&gt;&gt;18</a>\r<br /><a href=\\"http://kusaba.localhost/test/res/1.html#18\\" onclick=\\"return highlight(\\''18\\'', true);\\" class=\\"ref|test|1|18\\">&gt;&gt;18</a>\r<br />All I&#039;ve got is insane<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'KfPyRpXBw/HcqnNmqR72kvPOX4ZnuJSwZogNtcHPvLs=', 'f528764d624db129b32c21fbca0cb8d6', '', 1428038645, 0, 0, 0, 0, 0, 0, 1428038645),
(20, 1, 0, '', '', '', 'making of a new thread', 'desu!<br />', '994e595c500b9ddf4acc4feae529e94a', '142803935374', 'b480efde5819c15ffbc74313d411d5b9', 'png', 'capture', 2279, '2.23 KB', 213, 41, 200, 38, '+foK+VDTfkE0B1VnUaqPxbg6N9lezfHT37bQ+qdUiWg=', 'f528764d624db129b32c21fbca0cb8d6', '', 1428039353, 0, 0, 0, 0, 0, 0, 1428047170),
(21, 1, 20, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/20.html#20\\" onclick=\\"return highlight(\\''20\\'', true);\\" class=\\"ref|test|20|20\\">&gt;&gt;20</a>\r<br />Pls quality post<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'uecBG3Z7jOGkB12mhs2OlOpjXdFm+fjruEVMmGR/Bsg=', 'f528764d624db129b32c21fbca0cb8d6', '', 1428039465, 0, 0, 0, 0, 0, 0, 1428039465),
(22, 1, 20, '', '', '', '', 'STAHP<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'XaTpiaquZQZwB1qgXQ7pxXG+OaYJxbG1RFK32aN83wM=', 'f528764d624db129b32c21fbca0cb8d6', '', 1428046434, 0, 0, 0, 0, 0, 0, 1428046434),
(23, 1, 20, '', '', '', '', '&lt;b&gt;KOI&lt;/b&gt;<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'ckMta+PMO77XYbzmp7V3h1PnLvb5/R0JZXEeiWjDb4E=', 'f528764d624db129b32c21fbca0cb8d6', '', 1428046614, 0, 0, 0, 0, 0, 0, 1428046614),
(24, 1, 20, 'admin', '', '', '', 'GIMME HUG<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, '3i835Vc2sjLVqmGPvu3wCZqqRRLxtOLYLiM9BuDXINw=', 'f528764d624db129b32c21fbca0cb8d6', '', 1428046644, 0, 0, 0, 0, 0, 0, 1428046644),
(25, 1, 20, '', '', '', '', 'hello world<br />', '994e595c500b9ddf4acc4feae529e94a', '', '', '', '', 0, '0 B', 0, 0, 0, 0, 'V5aLq1D2qoO4Na2F2SpeZbGQiUUx8KgPpOP1KyMA+UQ=', 'f528764d624db129b32c21fbca0cb8d6', '', 1428047169, 0, 0, 1, 0, 0, 0, 1428047169);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
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

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `order` tinyint(3) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `abbreviation` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `order`, `hidden`, `name`, `abbreviation`) VALUES
(1, 0, 0, 'Main', 'main');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
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
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `password`, `salt`, `type`, `boards`, `addedon`, `lastactive`) VALUES
(1, 'admin', 'b55f5d48f4912613d606358235dfef14', 'sLc', 1, NULL, 1420511506, 1428051042);

-- --------------------------------------------------------

--
-- Table structure for table `watchedthreads`
--

DROP TABLE IF EXISTS `watchedthreads`;
CREATE TABLE IF NOT EXISTS `watchedthreads` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `threadid` int(20) NOT NULL,
  `board` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `lastsawreplyid` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wordfilter`
--

DROP TABLE IF EXISTS `wordfilter`;
CREATE TABLE IF NOT EXISTS `wordfilter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(75) NOT NULL,
  `replacedby` varchar(75) NOT NULL,
  `boards` text NOT NULL,
  `time` int(20) NOT NULL,
  `regex` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
