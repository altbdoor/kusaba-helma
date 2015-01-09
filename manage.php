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
 * Manage panel frameset
 *
 * Tells the browser to load the menu and main page
 *
 * @package kusaba
 */
$preconfig_db_unnecessary = true;
require 'config.php';
header("Expires: Mon, 1 Jan 2030 05:00:00 GMT");
?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Manage Boards</title>
	
	<link rel="shortcut icon" href="<?php echo KU_WEBPATH; ?>/favicon.ico">
	<link rel="stylesheet" href="<?php echo KU_WEBPATH; ?>/custom/css/manage_parent.css">
</head>
<body>
	<div id="manage_wrap">
		<div id="manage_left">
			<iframe src="manage_menu.php" name="manage_menu"></iframe>
		</div>
		<div id="manage_right">
			<iframe src="manage_page.php" name="manage_page"></iframe>
		</div>
	</div>
</body>
</html>