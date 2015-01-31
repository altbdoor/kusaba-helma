<?php
if (file_exists("install.php")) {
	die('You are seeing this message because either you haven\'t ran the install file yet, and can do so <a href="install.php">here</a>, or already have, and <strong>must delete it</strong>.');
}
if (!isset($_GET['info'])) {
	$preconfig_db_unnecessary = true;
}
require 'config.php';
$menufile = (KU_STATICMENU) ? 'menu.html' : 'menu.php';

header("Expires: Mon, 1 Jan 2030 05:00:00 GMT");
?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title><?php echo KU_NAME; ?></title>
	
	<link rel="shortcut icon" href="<?php echo KU_WEBPATH; ?>/favicon.ico">
	<link rel="stylesheet" href="<?php echo KU_WEBPATH; ?>/custom/css/frame.css">
</head>
<body>
<?php
	if (isset($_GET['info'])) {
		require KU_ROOTDIR . 'inc/functions.php';
		
		$bans = $tc_db->GetOne("SELECT COUNT(*) FROM `".KU_DBPREFIX."banlist`");
		$wordfilters = $tc_db->GetOne("SELECT COUNT(*) FROM `".KU_DBPREFIX."wordfilter`");
		
		$modules = modules_list();
		$moduleslist = 'None';
		if (count($modules) > 0) {
			$moduleslist = implode(', ', $modules);
		}
?>
	<div id="info">
		<h1>General Info</h1>
		<ul>
			<li>Version: kusaba x <?php echo KU_VERSION; ?></li>
			<li>Active bans: <?php echo $bans; ?></li>
			<li>Wordfilters: <?php echo $wordfilters; ?></li>
			<li>Modules loaded: <?php echo $moduleslist; ?></li>
		</ul>
	</div>
<?php } else { ?>
	<div class="frame-wrapper">
		<div class="frame-left">
			<iframe frameborder="0" name="board_menu" src="<?php echo $menufile; ?>"></iframe>
		</div>
		<div class="frame-right">
			<iframe frameborder="0" name="board_page" src="news.php"></iframe>
		</div>
	</div>
<?php } ?>
</body>
</html>
