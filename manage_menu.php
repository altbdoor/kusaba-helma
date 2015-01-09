<?php
/*
 * This file is part of kusaba.
 *
 * kusaba is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * kusaba is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * kusaba; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */
/**
 * Manage menu
 *
 * Loaded when a user visits manage.php
 *
 * @package kusaba
 */

session_start();

require 'config.php';
require KU_ROOTDIR . 'lib/dwoo.php';
require KU_ROOTDIR . 'inc/functions.php';
require KU_ROOTDIR . 'inc/classes/manage.class.php';

// no need for styles
//$dwoo_data->assign('styles', explode(':', KU_MENUSTYLES));

$manage_class = new Manage();
$tpl_links = '';

if (!$manage_class->ValidateSession(true)) {
	$tpl_links .= '
		<ul class="list">
			<li><a href="' . KU_WEBFOLDER . '" target="_top">' . _gettext('Home') . '</a></li>
			<li><a href="manage_page.php">' . ucfirst(_gettext('Log In')) . '</a></li>
		</ul>
	';
} else {
	// get post password
	$manage_postpassword = md5_encrypt($_SESSION['manageusername'], KU_RANDOMSEED);
	
	// ignore admin error, i'm smart enough
	/*if ($_SESSION['manageusername'] == 'admin') {
		$salt = $tc_db->GetOne("SELECT `salt` FROM " . KU_DBPREFIX . "staff WHERE `username` = " . $tc_db->qstr($_SESSION['manageusername']));
		if($_SESSION['managepassword'] == md5('admin'.$salt))
			$tpl_links .= '<br><strong>' . _gettext('NOTICE: You are using the default administrator account. Anyone can log in to this account, so a second administrator account needs to be created. Create another, log in to it, and delete this one.') . '</strong>';
	}*/
	
	// get management class
	$manage_class_str = 'Janitor';
	if ($manage_class->CurrentUserIsAdministrator()) {
		$manage_class_str = _gettext('Administrator');
	} elseif ($manage_class->CurrentUserIsModerator()) {
		$manage_class_str = _gettext('Moderator');
	}
	
	// build string
	$tpl_links .= '
		<ul class="list">
			<li>' . _gettext('Welcome') . ', <b>' . $_SESSION['manageusername'] . '</b></li>
			<li>' . _gettext('Staff rights') . ': <b>' . $manage_class_str . '</b></li>
			<li><a href="' . KU_WEBFOLDER . '" target="_top">' . _gettext('Home') . '</a></li>
			<li><a href="manage_page.php?action=logout">' . _gettext('Log out') . '</a></li>
			<li>
				<a id="menu-posting-password-trigger" class="toggle" data-target="#menu-posting-password-container" href="javascript:void(0)">' . _gettext('Show Posting Password') . '</a>
				<div id="menu-posting-password-container" hidden>
					<input type="text" id="menu-posting-password-input" class="input input-block" value="' . $manage_postpassword . '">
				</div>
			</li>
		</ul>
	';
	
	// build home
	$tpl_links .= '
		<h2 class="toggle toggle-icon" data-target="#section-home">' . _gettext('Home') . '</h2>
		<ul id="section-home" class="list">
			<li><a href="manage_page.php?">' . _gettext('View Announcements') . '</a></li>
			<li><a href="manage_page.php?action=posting_rates">' . _gettext('Posting rates (past hour)') . '</a></li>
			<li><a href="manage_page.php?action=statistics">' . _gettext('Statistics') . '</a></li>
			' . ($manage_class_str != 'Janitor' ? '<li><a href="manage_page.php?action=changepwd">' . _gettext('Change account password') . '</a></li>' : '') . '
		</ul>
	';
	
	// build administration
	if ($manage_class->CurrentUserIsAdministrator()) {
		$tpl_links .= '
			<h2 class="toggle toggle-icon" data-target="#section-siteadministration">' . _gettext('Site Administration') . '</h2>
			<ul id="section-siteadministration" class="list">
				<li><a href="manage_page.php?action=addannouncement">' . _gettext('Announcements') . '</a></li>
				<li><a href="manage_page.php?action=news">' . _gettext('News') . '</a></li>
				<li><a href="manage_page.php?action=faq">' . _gettext('FAQ') . '</a></li>
				<li><a href="manage_page.php?action=rules">' . _gettext('Rules') . '</a></li>
				' . (KU_BLOTTER ? '<li><a href="manage_page.php?action=blotter">' . _gettext('Blotter') . '</a></li>' : '') . '
				<li><a href="manage_page.php?action=spaceused">' . _gettext('Disk space used') . '</a></li>
				<li><a href="manage_page.php?action=staff">' . _gettext('Staff') . '</a></li>
				<li><a href="manage_page.php?action=modlog">' . _gettext('ModLog') . '</a></li>
				<li><a href="manage_page.php?action=proxyban">' . _gettext('Ban proxy list') . '</a></li>
				<li><a href="manage_page.php?action=sql">' . _gettext('SQL query') . '</a></li>
				<li><a href="manage_page.php?action=cleanup">' . _gettext('Cleanup') . '</a></li>
				' . (KU_APC ? '<li><a href="manage_page.php?action=apc">APC</a></li>' : '') . '
			</ul>
			
			<h2 class="toggle toggle-icon" data-target="#section-boardsadministration">' . _gettext('Boards Administration') . '</h2>
			<ul id="section-boardsadministration" class="list">
				<li><a href="manage_page.php?action=adddelboard">' . _gettext('Add/Delete boards') . '</a></li>
				<li><a href="manage_page.php?action=wordfilter">' . _gettext('Wordfilter') . '</a></li>
				<li><a href="manage_page.php?action=spam">' . _gettext('Spamfilter') . '</a></li>
				<li><a href="manage_page.php?action=ads">' . _gettext('Manage Ads') . '</a></li>
				<li><a href="manage_page.php?action=embeds">' . _gettext('Manage embeds') . '</a></li>
				<li><a href="manage_page.php?action=movethread">' . _gettext('Move thread') . '</a></li>
				<li><a href="manage_page.php?action=ipsearch">' . _gettext('IP Search') . '</a></li>
				<li><a href="manage_page.php?action=search">' . _gettext('Search posts') . '</a></li>
				<li><a href="manage_page.php?action=viewthread">'._gettext('View thread (including deleted)').'</a></li>
				<li><a href="manage_page.php?action=editfiletypes">' . _gettext('Edit filetypes') . '</a></li>
				<li><a href="manage_page.php?action=editsections">' . _gettext('Edit sections') . '</a></li>
				<li><a href="manage_page.php?action=rebuildall">' . _gettext('Rebuild all html files') . '</a></li>
			</ul>
		';
	}
	
	// build boards
	$tpl_links .= '
		<h2 class="toggle toggle-icon" data-target="#section-boards">' . _gettext('Boards') . '</h2>
		<ul id="section-boards" class="list">
			<li><a href="manage_page.php?action=boardopts">' . _gettext('Board options') . '</a></li>
			<li><a href="manage_page.php?action=stickypost">' . _gettext('Manage stickies') . '</a></li>
			<li><a href="manage_page.php?action=lockpost">' . _gettext('Manage locked threads') . '</a></li>
			<li><a href="manage_page.php?action=delposts">' . _gettext('Delete thread/post') . '</a></li>
		</ul>
	';
	
	// build moderation
	if ($manage_class_str != 'Janitor') {
		$open_reports = $tc_db->GetAll("SELECT HIGH_PRIORITY COUNT(*) FROM `" . KU_DBPREFIX . "reports` WHERE `cleared` = '0'");
		
		$tpl_links .= '
			<h2 class="toggle toggle-icon" data-target="#section-moderation">' . _gettext('Moderation') . '</h2>
			<ul id="section-moderation" class="list">
				<li><a href="manage_page.php?action=reports">' . _gettext('View Reports') . ' [' . $open_reports[0][0] . ']</a></li>
				<li><a href="manage_page.php?action=bans">' . _gettext('View/Add/Remove bans') . '</a></li>
				' . (KU_APPEAL ? '<li><a href="manage_page.php?action=appeals">' . _gettext('View Appeals') . '</a></li>' : '') . '
				<li><a href="manage_page.php?action=deletepostsbyip">' . _gettext('Delete all posts by IP') . '</a></li>
				<li><a href="manage_page.php?action=recentimages">' . _gettext('Recently uploaded images') . '</a></li>
				<li><a href="manage_page.php?action=recentposts">' . _gettext('Recent posts') . '</a></li>
			</ul>
		';
		
		$resultsboard = $tc_db->GetAll("SELECT HIGH_PRIORITY * FROM `" . KU_DBPREFIX . "boards` ORDER BY `name`");
		$i = 0;
		
		if ($manage_class->CurrentUserIsAdministrator()) {
			$tpl_links .= '
				<h2 class="toggle toggle-icon" data-target="#section-mboards">' . _gettext('All Boards') . '</h2>
				<ul id="section-mboards" class="list" hidden>
			';
			
			foreach ($resultsboard as $lineboard) {
				$board = $lineboard['name'];
				
				$i++;
				$tpl_links .= '<li><a class="text-bold" href="' . $board . '">/' . $board . '/</a></li>';
			}
		}
		else {
			$tpl_links .= '
				<h2 class="toggle toggle-icon" data-target="#section-mboards">' . _gettext('Moderating Boards') . '</h2>
				<ul id="section-mboards" class="list" hidden>
			';
			
			foreach ($resultsboard as $lineboard) {
				$board = $lineboard['name'];
				
				if ($manage_class->CurrentUserIsModeratorOfBoard($board, $_SESSION['manageusername'])) {
					$i++;
					$tpl_links .= '<li><a class="text-bold" href="' . $board . '">/' . $board . '/</a></li>';
				}
			}
		}
		
		$tpl_links .= '<li>' . $i . ' Board(s)</li></ul>';
	}
}

$dwoo_data->assign('links', $tpl_links);
$dwoo->output(KU_TEMPLATEDIR . '/manage_menu.tpl', $dwoo_data);
?>
