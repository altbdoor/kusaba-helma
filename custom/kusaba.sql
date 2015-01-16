-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2015 at 10:16 AM
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

INSERT IGNORE INTO `ads` (`id`, `position`, `disp`, `boards`, `code`) VALUES
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

INSERT IGNORE INTO `announcements` (`id`, `parentid`, `subject`, `postedat`, `postedby`, `message`) VALUES
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

INSERT IGNORE INTO `boards` (`id`, `order`, `name`, `type`, `start`, `uploadtype`, `desc`, `image`, `section`, `maximagesize`, `maxpages`, `maxage`, `markpage`, `maxreplies`, `messagelength`, `createdon`, `locked`, `includeheader`, `redirecttothread`, `anonymous`, `forcedanon`, `embeds_allowed`, `trial`, `popular`, `defaultstyle`, `locale`, `showid`, `compactlist`, `enablereporting`, `enablecaptcha`, `enablenofile`, `enablearchiving`, `enablecatalog`, `loadbalanceurl`, `loadbalancepassword`) VALUES
(1, 0, 'test', 0, 1, 0, 'Testing', '', 1, 1024000, 11, 0, 9, 200, 8192, 1420515735, 0, '', 1, 'Anonymous', 0, '', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', ''),
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

INSERT IGNORE INTO `board_filetypes` (`boardid`, `typeid`) VALUES
(1, 3),
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

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

INSERT IGNORE INTO `embeds` (`id`, `filetype`, `name`, `videourl`, `width`, `height`, `code`) VALUES
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

INSERT IGNORE INTO `events` (`name`, `at`) VALUES
('pingback', 0),
('sitemap', 1421417105);

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

INSERT IGNORE INTO `filetypes` (`id`, `filetype`, `mime`, `image`, `image_w`, `image_h`, `force_thumb`) VALUES
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `front`
--

TRUNCATE TABLE `front`;
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

INSERT IGNORE INTO `modlog` (`entry`, `user`, `category`, `timestamp`) VALUES
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
('Deleted board: /asdasd/', 'admin', 3, 1421397638);

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

INSERT IGNORE INTO `posts` (`id`, `boardid`, `parentid`, `name`, `tripcode`, `email`, `subject`, `message`, `password`, `file`, `file_md5`, `file_type`, `file_original`, `file_size`, `file_size_formatted`, `image_w`, `image_h`, `thumb_w`, `thumb_h`, `ip`, `ipmd5`, `tag`, `timestamp`, `stickied`, `locked`, `posterauthority`, `reviewed`, `deleted_timestamp`, `IS_DELETED`, `bumped`) VALUES
(1, 1, 0, '', '', '', 'The Red Brown Fox Jumps', 'Over the Lazy Dog<br />', '8bfaa7b596a8b896ca96293f38570796', '142051708446', '19352f1f76cb61616d8889edb4314bf8', 'jpg', 'capture', 171879, '167.85KB', 1024, 1280, 160, 200, 'nis9JGT6+GcpPULcx/cUN0iZVm4xICEV9W2tr9S0Aks=', 'f528764d624db129b32c21fbca0cb8d6', '', 1420517084, 0, 0, 0, 0, 0, 0, 1420517084);

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

INSERT IGNORE INTO `sections` (`id`, `order`, `hidden`, `name`, `abbreviation`) VALUES
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

INSERT IGNORE INTO `staff` (`id`, `username`, `password`, `salt`, `type`, `boards`, `addedon`, `lastactive`) VALUES
(1, 'admin', 'b55f5d48f4912613d606358235dfef14', 'sLc', 1, NULL, 1420511506, 1421399584);

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
