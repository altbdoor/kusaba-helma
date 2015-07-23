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
 * Links to all boards for navigation
 *
 * Boards will be listed, divided up by sections set in the manage panel. IRC info
 * will also be displayed, if it is set.
 *
 * @package kusaba
 */
// ========================================

// old and busted
/*require 'config.php';
require KU_ROOTDIR . 'inc/functions.php';
require KU_ROOTDIR . 'inc/classes/menu.class.php';

if (KU_STATICMENU) {
	die('This file is disabled because KU_STATICMENU is set to true.');
}

$menu_class = new Menu;
if (isset($_COOKIE['tcshowdirs'])) {
	if ($_COOKIE['tcshowdirs'] == 'yes') {
		die($menu_class->PrintMenu('dirs'));
	}
}

die($menu_class->PrintMenu('nodirs'));*/

// get config
require 'config.php';

// get dwoo
require_once KU_ROOTDIR.'lib/dwoo.php';
$dwoo_tpl = new Dwoo_Template_File(KU_TEMPLATEDIR.'/menu.tpl');

// result
$result = array();

// prepare sections
$sections = $tc_db->GetAll('SELECT `id`, `name` FROM `sections` ORDER BY `order` ASC');
foreach ($sections as $section) {
	// so we have a section
	$sectionName = $section['name'];
	$result[$sectionName] = array();
	
	// then we get the boards
	$boards = $tc_db->GetAll('SELECT `name`, `desc`, `locked` FROM `boards` WHERE `section`="'.$section['id'].'" ORDER BY `order` ASC, `name` ASC');
	
	// go through the boards
	foreach ($boards as $board) {
		$result[$sectionName][] = array(
			'name' => $board['name'],
			'desc' => $board['desc'],
			'locked' => $board['locked']
		);
	}
}

// you go dwoo!
$dwoo_data->assign('result', $result);
$dwoo->output($dwoo_tpl, $dwoo_data);
