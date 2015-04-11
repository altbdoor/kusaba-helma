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
 * News display, which is the first page shown when a user visits a chan's index
 *
 * Any news added by an administrator in the manage panel will show here, with
 * the newest entry on the top.
 *
 * @package kusaba
 */

// my autoload
require __DIR__.'/custom/php/autoload.php';

// Require the configuration file
//require 'config.php';
require KU_ROOTDIR . 'inc/functions.php';
require_once KU_ROOTDIR . 'lib/dwoo.php';

$dwoo_tpl = new Dwoo_Template_File(KU_TEMPLATEDIR . '/news.tpl');

// we don't need no ads where we going
//$topads = $tc_db->GetOne("SELECT code FROM `" . KU_DBPREFIX . "ads` WHERE `position` = 'top' AND `disp` = '1'");
//$botads = $tc_db->GetOne("SELECT code FROM `" . KU_DBPREFIX . "ads` WHERE `position` = 'bot' AND `disp` = '1'");
//$dwoo_data->assign('topads', $topads);
//$dwoo_data->assign('botads', $botads);

$gzhandler = new \Custom\GzHandler(KU_CUSTOMENABLEGZIP);
$gzhandler->start();

$p = '';

if (isset($_GET['p'])) {
	$p = $_GET['p'];
}

if ($p == 'links') {
	$entries = $tc_db->GetAll('SELECT * FROM `' . KU_DBPREFIX . 'front` WHERE `page` = 1 ORDER BY `order` ASC');
}
else if ($p == 'rules') {
	$entries = $tc_db->GetAll('SELECT * FROM `' . KU_DBPREFIX . 'front` WHERE `page` = 2 ORDER BY `order` ASC');
}
else {
	$entries = $tc_db->GetAll('SELECT * FROM `' . KU_DBPREFIX . 'front` WHERE `page` = 0 ORDER BY `timestamp` DESC');
}

$dwoo_data->assign('entries', $entries);
$dwoo_data->assign('styles', explode(':', KU_MENUSTYLES));

$dwoo->output($dwoo_tpl, $dwoo_data);
$gzhandler->stop();
die();
