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

// get autoloader and helpers
require __DIR__.'/custom/php/autoload.php';

$database = new \Custom\Database($tc_db, KU_DBPREFIX);

// start session
session_start();

// load kusaba files
require KU_ROOTDIR . 'lib/dwoo.php';
require KU_ROOTDIR . 'inc/functions.php';
require KU_ROOTDIR . 'inc/classes/manage.class.php';

$manageClass = new Manage();

// check if user is validated and assign to dwoo
$isUserValidated = $manageClass->ValidateSession(true);
$dwoo_data->assign('validated', $isUserValidated);

if ($isUserValidated) {
	// instantiate a mock user object
	$currentUser = array(
		'username' => $_SESSION['manageusername']
	);
	
	// get post password
	$currentUser['password'] = md5_encrypt($_SESSION['manageusername'], KU_RANDOMSEED);
	
	// get management class
	$currentUser['rights'] = 'Janitor';
	
	if ($manageClass->CurrentUserIsAdministrator()) {
		$currentUser['rights'] = 'Administrator';
	}
	else if ($manageClass->CurrentUserIsModerator()) {
		$currentUser['rights'] = 'Moderator';
	}
	
	// get report count
	if ($currentUser['rights'] != 'Janitor') {
		$reportCount = $database->execute(
			'SELECT HIGH_PRIORITY COUNT(*) AS count FROM '.$database->prepareTableName('reports').' WHERE `cleared`=0'
		);
		
		$currentUser['reportCount'] = $reportCount[0]['count'];
	}
	
	// get boards
	/*
		it is suppose to work for mods as well, but since the sql query is very
		inefficient, i pulled the plug for mods
	*/
	if ($currentUser['rights'] == 'Administrator') {
		$currentUser['moderatingBoards'] = $database->execute(
			'SELECT HIGH_PRIORITY `name` FROM '.$database->prepareTableName('boards').' ORDER BY `name`'
		);
		
		$currentUser['moderatingBoardsCount'] = count($currentUser['moderatingBoards']);
	}
	
	// set current user data
	$dwoo_data->assign('currentUser', $currentUser);
	
	/*$resultsboard = $tc_db->GetAll("SELECT HIGH_PRIORITY * FROM `" . KU_DBPREFIX . "boards` ORDER BY `name`");
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
	
	$tpl_links .= '<li><span>'.$i.' Board(s)</span></li></ul>';*/
}

$dwoo->output(KU_TEMPLATEDIR.'/manage_menu.tpl', $dwoo_data);
