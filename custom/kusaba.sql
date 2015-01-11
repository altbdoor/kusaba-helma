-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 11, 2015 at 01:36 PM
-- Server version: 5.5.38
-- PHP Version: 5.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kusaba`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` smallint(1) unsigned NOT NULL,
  `position` varchar(3) NOT NULL,
  `disp` tinyint(1) NOT NULL,
  `boards` varchar(255) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `announcements` (
`id` int(10) unsigned NOT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `postedat` int(20) NOT NULL,
  `postedby` varchar(75) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `announcements`
--

INSERT IGNORE INTO `announcements` (`id`, `parentid`, `subject`, `postedat`, `postedby`, `message`) VALUES
(1, 0, 'Testing 123', 1420782046, 'admin', '<b>apolcalypse now!</b>');

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE `banlist` (
`id` mediumint(8) unsigned NOT NULL,
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
  `appealat` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bannedhashes`
--

CREATE TABLE `bannedhashes` (
`id` int(10) NOT NULL,
  `md5` varchar(255) NOT NULL,
  `bantime` int(10) NOT NULL DEFAULT '0',
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blotter`
--

CREATE TABLE `blotter` (
`id` smallint(5) unsigned NOT NULL,
  `important` tinyint(1) NOT NULL,
  `at` int(20) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `blotter`
--

INSERT IGNORE INTO `blotter` (`id`, `important`, `at`, `message`) VALUES
(1, 1, 1420966596, 'asdasasd');

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
`id` smallint(5) unsigned NOT NULL,
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
  `loadbalancepassword` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `boards`
--

INSERT IGNORE INTO `boards` (`id`, `order`, `name`, `type`, `start`, `uploadtype`, `desc`, `image`, `section`, `maximagesize`, `maxpages`, `maxage`, `markpage`, `maxreplies`, `messagelength`, `createdon`, `locked`, `includeheader`, `redirecttothread`, `anonymous`, `forcedanon`, `embeds_allowed`, `trial`, `popular`, `defaultstyle`, `locale`, `showid`, `compactlist`, `enablereporting`, `enablecaptcha`, `enablenofile`, `enablearchiving`, `enablecatalog`, `loadbalanceurl`, `loadbalancepassword`) VALUES
(1, 0, 'test', 0, 1, 0, 'Testing', '', 1, 1024000, 11, 0, 9, 200, 8192, 1420515735, 0, '', 1, 'Anonymous', 0, '', 0, 0, '', '', 0, 0, 1, 0, 0, 0, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `board_filetypes`
--

CREATE TABLE `board_filetypes` (
  `boardid` tinyint(5) NOT NULL DEFAULT '0',
  `typeid` mediumint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `board_filetypes`
--

INSERT IGNORE INTO `board_filetypes` (`boardid`, `typeid`) VALUES
(1, 3),
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `embeds`
--

CREATE TABLE `embeds` (
`id` tinyint(5) unsigned NOT NULL,
  `filetype` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `videourl` varchar(510) NOT NULL,
  `width` tinyint(3) unsigned NOT NULL,
  `height` tinyint(3) unsigned NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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

CREATE TABLE `events` (
  `name` varchar(255) NOT NULL,
  `at` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT IGNORE INTO `events` (`name`, `at`) VALUES
('pingback', 0),
('sitemap', 1420986727);

-- --------------------------------------------------------

--
-- Table structure for table `filetypes`
--

CREATE TABLE `filetypes` (
`id` smallint(5) unsigned NOT NULL,
  `filetype` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_w` int(7) NOT NULL DEFAULT '0',
  `image_h` int(7) NOT NULL DEFAULT '0',
  `force_thumb` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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

CREATE TABLE `front` (
`id` smallint(5) unsigned NOT NULL,
  `page` smallint(1) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `poster` varchar(75) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `front`
--

INSERT IGNORE INTO `front` (`id`, `page`, `order`, `subject`, `message`, `timestamp`, `poster`, `email`) VALUES
(1, 0, 0, 'asdad', 'asdasad', 1420859708, 'admin', 'asdads@asd.com'),
(2, 0, 0, 'next up', 'on fox news, smokin barbeque on fire', 1420880417, 'admin', ''),
(3, 1, 0, 'asdads', 'asdadasdasd', 0, '', ''),
(4, 1, 0, 'asd', 'asdadadsasd', 0, '', ''),
(5, 1, 0, 'testing', 'apple of my eye', 0, '', ''),
(6, 1, 20, 'like a', 'shiet', 0, '', ''),
(7, 2, 0, '1. Don''t spit', 'Spitting is bad', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `loginattempts`
--

CREATE TABLE `loginattempts` (
  `username` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modlog`
--

CREATE TABLE `modlog` (
  `entry` text NOT NULL,
  `user` varchar(255) NOT NULL,
  `category` tinyint(2) NOT NULL DEFAULT '0',
  `timestamp` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modlog`
--

INSERT IGNORE INTO `modlog` (`entry`, `user`, `category`, `timestamp`) VALUES
('Logged in', 'admin', 1, 1420511532),
('Viewed disk space used', 'admin', 0, 1420514198),
('Rebuilt all boards and threads', 'admin', 2, 1420514243),
('Added board: /test/', 'admin', 3, 1420515737),
('Updated board configuration - /test/', 'admin', 4, 1420515809),
('Logged in', 'admin', 1, 1420517471),
('Updated board configuration - /test/', 'admin', 4, 1420517482),
('Rebuilt all boards and threads', 'admin', 2, 1420517486),
('Rebuilt all boards and threads', 'admin', 2, 1420517992),
('Viewed disk space used', 'admin', 0, 1420518014),
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
('Logged in', 'admin', 1, 1420807087),
('Logged in', 'admin', 1, 1420808189),
('Logged in', 'admin', 1, 1420809496),
('Deleted an announcement', 'admin', 9, 1420809557),
('Edited an announcement', 'admin', 0, 1420810692),
('Edited an announcement', 'admin', 0, 1420820349),
('Logged in', 'admin', 1, 1420822029),
('Added a news entry', 'admin', 9, 1420859708),
('Logged in', 'admin', 1, 1420860399),
('Logged in', 'admin', 1, 1420860490),
('Rebuilt all boards and threads', 'admin', 2, 1420860535),
('Logged in', 'admin', 1, 1420861353),
('Logged in', 'admin', 1, 1420876480),
('Logged in', 'admin', 1, 1420877191),
('Edited an announcement', 'admin', 0, 1420878813),
('Added a news entry', 'admin', 9, 1420880417),
('Logged in', 'admin', 1, 1420884667),
('Logged in', 'admin', 1, 1420884902),
('Logged in', 'admin', 1, 1420885639),
('Logged in', 'admin', 1, 1420887735),
('Edited an announcement', 'admin', 0, 1420888048),
('Added an announcement', 'admin', 9, 1420888058),
('Deleted an announcement', 'admin', 9, 1420888063),
('Logged in', 'admin', 1, 1420893708),
('Deleted post #<a href="?action=viewthread&thread=1&board=test#2">2</a> - /test/', 'admin', 7, 1420896963),
('Added a FAQ entry', 'admin', 9, 1420900489),
('Edited a FAQ entry', 'admin', 9, 1420900728),
('Added a FAQ entry', 'admin', 9, 1420901212),
('Edited a FAQ entry', 'admin', 9, 1420901279),
('Added a FAQ entry', 'admin', 9, 1420901294),
('Added a FAQ entry', 'admin', 9, 1420901443),
('Added a FAQ entry', 'admin', 9, 1420901492),
('Added a FAQ entry', 'admin', 9, 1420901534),
('Edited a FAQ entry', 'admin', 9, 1420902188),
('Edited a FAQ entry', 'admin', 9, 1420902327),
('Edited a FAQ entry', 'admin', 9, 1420902335),
('Added a Rule entry', 'admin', 9, 1420902852),
('Viewed disk space used', 'admin', 0, 1420903065),
('Viewed disk space used', 'admin', 0, 1420905907),
('Viewed disk space used', 'admin', 0, 1420905960),
('Viewed disk space used', 'admin', 0, 1420905985),
('Viewed disk space used', 'admin', 0, 1420905999),
('Viewed disk space used', 'admin', 0, 1420906015),
('Viewed disk space used', 'admin', 0, 1420906024),
('Viewed disk space used', 'admin', 0, 1420906424),
('Inserted SQL', 'admin', 0, 1420906480),
('Inserted SQL', 'admin', 0, 1420906541),
('Logged in', 'admin', 1, 1420965154),
('Logged in', 'admin', 1, 1420965173),
('Viewed disk space used', 'admin', 0, 1420965255),
('Viewed disk space used', 'admin', 0, 1420965372),
('Viewed disk space used', 'admin', 0, 1420965422),
('Viewed disk space used', 'admin', 0, 1420965454),
('Logged in', 'admin', 1, 1420966521),
('Logged in', 'admin', 1, 1420966581),
('Viewed disk space used', 'admin', 0, 1420966700),
('Viewed disk space used', 'admin', 0, 1420966717),
('Updated staff member - Administrator: admin', 'admin', 6, 1420969163),
('Updated staff member - Administrator: admin', 'admin', 6, 1420969174),
('Viewed disk space used', 'admin', 0, 1420970102),
('Updated staff member - Administrator: admin', 'admin', 6, 1420970252),
('Added Moderator testing', 'admin', 6, 1420970272),
('Updated staff member - Administrator: testing', 'admin', 6, 1420970279),
('Updated staff member - Administrator: testing', 'admin', 6, 1420970289),
('Updated staff member - Administrator: testing', 'admin', 6, 1420970514),
('Updated staff member - Moderator: testing - Moderates: /test/', 'admin', 6, 1420970549),
('Updated staff member - Moderator: testing - Moderates: //', 'admin', 6, 1420970823),
('Logged in', 'admin', 1, 1420971436),
('Logged in', 'admin', 1, 1420979897),
('Viewed disk space used', 'admin', 0, 1420980261),
('Edited an announcement', 'admin', 0, 1420980290),
('Logged in', 'admin', 1, 1420980637),
('Edited a FAQ entry', 'admin', 9, 1420980825),
('Banned 0 IP addresses using an IP address list.', 'admin', 8, 1420982204),
('Inserted SQL', 'admin', 0, 1420982563),
('Ran cleanup', 'admin', 2, 1420983184),
('Ran cleanup', 'admin', 2, 1420983250);

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `module` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'string'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
`id` int(10) unsigned NOT NULL,
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
  `bumped` int(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `posts`
--

INSERT IGNORE INTO `posts` (`id`, `boardid`, `parentid`, `name`, `tripcode`, `email`, `subject`, `message`, `password`, `file`, `file_md5`, `file_type`, `file_original`, `file_size`, `file_size_formatted`, `image_w`, `image_h`, `thumb_w`, `thumb_h`, `ip`, `ipmd5`, `tag`, `timestamp`, `stickied`, `locked`, `posterauthority`, `reviewed`, `deleted_timestamp`, `IS_DELETED`, `bumped`) VALUES
(1, 1, 0, '', '', '', 'The Red Brown Fox Jumps', 'Over the Lazy Dog<br />', '8bfaa7b596a8b896ca96293f38570796', '142051708446', '19352f1f76cb61616d8889edb4314bf8', 'jpg', 'capture', 171879, '167.85KB', 1024, 1280, 160, 200, 'nis9JGT6+GcpPULcx/cUN0iZVm4xICEV9W2tr9S0Aks=', 'f528764d624db129b32c21fbca0cb8d6', '', 1420517084, 0, 0, 0, 0, 0, 0, 1420896783),
(2, 1, 1, '', '', '', '', '<a href=\\"http://kusaba.localhost/test/res/1.html#1\\" onclick=\\"return highlight(\\''1\\'', true);\\" class=\\"ref|test|1|1\\">&gt;&gt;1</a>\r<br />apocalypse now<br />', '38d0b80f59beb3406bf3323208fafb36', '', '', '', '', 0, '0B', 0, 0, 0, 0, 'zfAF0L6KkfqBl9OaHw9iFUJbRzKh7FG5NHI9EYre3XI=', 'f528764d624db129b32c21fbca0cb8d6', '', 1420896783, 0, 0, 0, 0, 0, 0, 1420896783);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
`id` smallint(5) unsigned NOT NULL,
  `cleared` tinyint(1) NOT NULL DEFAULT '0',
  `board` varchar(255) NOT NULL,
  `postid` int(20) NOT NULL,
  `when` int(20) NOT NULL,
  `ip` varchar(75) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
`id` smallint(5) unsigned NOT NULL,
  `order` tinyint(3) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `abbreviation` varchar(10) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sections`
--

INSERT IGNORE INTO `sections` (`id`, `order`, `hidden`, `name`, `abbreviation`) VALUES
(1, 0, 0, 'Main', 'main');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
`id` smallint(5) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(3) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `boards` text,
  `addedon` int(20) NOT NULL,
  `lastactive` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `staff`
--

INSERT IGNORE INTO `staff` (`id`, `username`, `password`, `salt`, `type`, `boards`, `addedon`, `lastactive`) VALUES
(1, 'admin', 'b55f5d48f4912613d606358235dfef14', 'sLc', 1, '', 1420511506, 1420983258),
(2, 'testing', 'f946a3f2c097b0cd279861695b3a2efc', 'pqE', 2, '', 1420970272, 0);

-- --------------------------------------------------------

--
-- Table structure for table `watchedthreads`
--

CREATE TABLE `watchedthreads` (
`id` mediumint(8) unsigned NOT NULL,
  `threadid` int(20) NOT NULL,
  `board` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `lastsawreplyid` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wordfilter`
--

CREATE TABLE `wordfilter` (
`id` smallint(5) unsigned NOT NULL,
  `word` varchar(75) NOT NULL,
  `replacedby` varchar(75) NOT NULL,
  `boards` text NOT NULL,
  `time` int(20) NOT NULL,
  `regex` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banlist`
--
ALTER TABLE `banlist`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bannedhashes`
--
ALTER TABLE `bannedhashes`
 ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `blotter`
--
ALTER TABLE `blotter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `embeds`
--
ALTER TABLE `embeds`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filetypes`
--
ALTER TABLE `filetypes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front`
--
ALTER TABLE `front`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`boardid`,`id`), ADD KEY `parentid` (`parentid`), ADD KEY `bumped` (`bumped`), ADD KEY `file_md5` (`file_md5`), ADD KEY `stickied` (`stickied`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watchedthreads`
--
ALTER TABLE `watchedthreads`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wordfilter`
--
ALTER TABLE `wordfilter`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `banlist`
--
ALTER TABLE `banlist`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bannedhashes`
--
ALTER TABLE `bannedhashes`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blotter`
--
ALTER TABLE `blotter`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `embeds`
--
ALTER TABLE `embeds`
MODIFY `id` tinyint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `filetypes`
--
ALTER TABLE `filetypes`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `front`
--
ALTER TABLE `front`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `watchedthreads`
--
ALTER TABLE `watchedthreads`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wordfilter`
--
ALTER TABLE `wordfilter`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
