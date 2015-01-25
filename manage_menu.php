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
			<li><a href="'.KU_WEBFOLDER.'" target="_top">Home</a></li>
			<li><a href="manage_page.php">Log In</a></li>
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
		<p class="text-center">
			Welcome, <b>'.$_SESSION['manageusername'].'</b><br>
			Staff rights: <b>'.$manage_class_str.'</b>
		</p>
		
		<ul class="list">
			<li><a href="' . KU_WEBFOLDER . '" target="_blank">Home</a></li>
			<li><a href="manage_page.php?action=logout">Log Out</a></li>
			<li>
				<a id="menu-posting-password-trigger" class="toggle" data-target="#menu-posting-password-container" href="javascript:void(0)">
					Posting Password
				</a>
				<div id="menu-posting-password-container" hidden>
					<input type="text" id="menu-posting-password-input" class="input input-block" value="' . $manage_postpassword . '" readonly>
				</div>
			</li>
		</ul>
	';
	
	// build home
	$tpl_links .= '
		<h2 class="toggle toggle-icon" data-target="#section-home">
			<i class="icon icon-home"></i> Home
		</h2>
		<ul id="section-home" class="list">
			<li><a href="manage_page.php?">View Announcements</a></li>
			<li><a href="manage_page.php?action=posting_rates">Posting Rates (Past Hour)</a></li>
			<li><a href="manage_page.php?action=statistics">Statistics</a></li>
			' . ($manage_class_str != 'Janitor' ? '<li><a href="manage_page.php?action=changepwd">Change Password</a></li>' : '') . '
		</ul>
	';
	
	// build administration
	if ($manage_class->CurrentUserIsAdministrator()) {
		$tpl_links .= '
			<h2 class="toggle toggle-icon" data-target="#section-siteadministration">
				<i class="icon icon-picture"></i> Site Administration
			</h2>
			<ul id="section-siteadministration" class="list">
				<li><a href="manage_page.php?action=addannouncement">Announcements</a></li>
				<li><a href="manage_page.php?action=news">News</a></li>
				<li><a href="manage_page.php?action=faq">FAQ</a></li>
				<li><a href="manage_page.php?action=rules">Rules</a></li>
				'.(KU_BLOTTER ? '<li><a href="manage_page.php?action=blotter">Blotter</a></li>' : '').'
				<li><a href="manage_page.php?action=templates">Edit Templates</a></li>
				<li><a href="manage_page.php?action=spaceused">Disk Space Used</a></li>
				<li><a href="manage_page.php?action=staff">Staff</a></li>
				<li><a href="manage_page.php?action=modlog">ModLog</a></li>
				<li><a href="manage_page.php?action=proxyban">Ban Proxy List</a></li>
				<li><a href="manage_page.php?action=sql">SQL Query</a></li>
				<li><a href="manage_page.php?action=cleanup">Cleanup</a></li>
				'.(KU_APC ? '<li><a href="manage_page.php?action=apc">APC</a></li>' : '').'
			</ul>
			
			<h2 class="toggle toggle-icon" data-target="#section-boardsadministration">
				<i class="icon icon-cog"></i> Board Administration
			</h2>
			<ul id="section-boardsadministration" class="list">
				<li><a href="manage_page.php?action=adddelboard">Add/Delete Boards</a></li>
				<li><a href="manage_page.php?action=wordfilter">Wordfilter</a></li>
				<li><a href="manage_page.php?action=spam">Spamfilter</a></li>
				<li><a href="manage_page.php?action=ads"><i class="icon icon-warning-sign text-red"></i> Manage Ads</a></li>
				<li><a href="manage_page.php?action=embeds"><i class="icon icon-warning-sign text-red"></i> Manage Embeds</a></li>
				<li><a href="manage_page.php?action=movethread">Move Thread</a></li>
				<li><a href="manage_page.php?action=ipsearch"><i class="icon icon-warning-sign text-red"></i> IP Search</a></li>
				<li><a href="manage_page.php?action=search"><i class="icon icon-warning-sign text-red"></i> Search Posts</a></li>
				<li><a href="manage_page.php?action=viewthread"><i class="icon icon-warning-sign text-red"></i> View Thread (Including Deleted)</a></li>
				<li><a href="manage_page.php?action=editfiletypes&do=addfiletype">Edit Filetypes</a></li>
				<li><a href="manage_page.php?action=editsections&do=addsection">Edit Sections</a></li>
				<li><a href="manage_page.php?action=rebuildall" onclick="return confirm(\'Are you sure?\')">Rebuild All HTML Files</a></li>
			</ul>
		';
	}
	
	// build boards
	$tpl_links .= '
		<h2 class="toggle toggle-icon" data-target="#section-boards">
			<i class="icon icon-folder-close"></i> Boards
		</h2>
		<ul id="section-boards" class="list">
			<li><a href="manage_page.php?action=boardopts">Board Options</a></li>
			<li><a href="manage_page.php?action=stickypost">Manage Stickies</a></li>
			<li><a href="manage_page.php?action=lockpost">Manage Locked Threads</a></li>
			<li><a href="manage_page.php?action=delposts">Delete Thread/Post</a></li>
		</ul>
	';
	
	// build moderation
	if ($manage_class_str != 'Janitor') {
		/*$open_reports = $tc_db->GetAll("SELECT HIGH_PRIORITY COUNT(*) FROM `" . KU_DBPREFIX . "reports` WHERE `cleared` = '0'");
		
		$tpl_links .= '
			<h2 class="toggle toggle-icon" data-target="#section-moderation">
				<i class="icon icon-tower"></i> Moderation
			</h2>
			<ul id="section-moderation" class="list">
				<li><a href="manage_page.php?action=reports">View Reports ['.$open_reports[0][0].']</a></li>
				<li><a href="manage_page.php?action=bans">View/Add/Remove Bans</a></li>
				'.(KU_APPEAL ? '<li><a href="manage_page.php?action=appeals">View Appeals</a></li>' : '') . '
				<li><a href="manage_page.php?action=deletepostsbyip">Delete All Posts By IP</a></li>
				<li><a href="manage_page.php?action=recentimages">Recently Uploaded Images</a></li>
				<li><a href="manage_page.php?action=recentposts">Recent Posts</a></li>
			</ul>
		';*/
		
		$resultsboard = $tc_db->GetAll("SELECT HIGH_PRIORITY * FROM `" . KU_DBPREFIX . "boards` ORDER BY `name`");
		$i = 0;
		
		if ($manage_class->CurrentUserIsAdministrator()) {
			$tpl_links .= '
				<h2 class="toggle toggle-icon" data-target="#section-mboards">All Boards</h2>
				<ul id="section-mboards" class="list" hidden>
			';
			
			foreach ($resultsboard as $lineboard) {
				$board = $lineboard['name'];
				
				$i++;
				$tpl_links .= '<li><a class="text-bold" href="'.$board.'">/'.$board.'/</a></li>';
			}
		}
		else {
			$tpl_links .= '
				<h2 class="toggle toggle-icon" data-target="#section-mboards">Moderating Boards</h2>
				<ul id="section-mboards" class="list" hidden>
			';
			
			foreach ($resultsboard as $lineboard) {
				$board = $lineboard['name'];
				
				if ($manage_class->CurrentUserIsModeratorOfBoard($board, $_SESSION['manageusername'])) {
					$i++;
					$tpl_links .= '<li><a class="text-bold" href="'.$board.'">/'.$board.'/</a></li>';
				}
			}
		}
		
		$tpl_links .= '<li><span>'.$i.' Board(s)</span></li></ul>';
	}
}

$dwoo_data->assign('links', $tpl_links);
$dwoo->output(KU_TEMPLATEDIR . '/manage_menu.tpl', $dwoo_data);
?>
