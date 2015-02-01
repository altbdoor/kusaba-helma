<?php
if (file_exists("install.php")) {
	die('You are seeing this message because either you haven\'t ran the install file yet, and can do so <a href="install.php">here</a>, or already have, and <strong>must delete it</strong>.');
}

$hasInfo = isset($_GET['info']);

if (!$hasInfo) {
	$preconfig_db_unnecessary = true;
}
require 'config.php';
$menufile = (KU_STATICMENU) ? 'menu.html' : 'menu.php';

// change expiry to one week
//header("Expires: Mon, 1 Jan 2030 05:00:00 GMT");
header('Expires: '.gmdate('D, d M Y H:i:s \G\M\T', time() + 604800));
?>
<!doctype html>
<html <?php echo ($hasInfo ? 'class="simple-burichan"' : ''); ?>>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title><?php echo KU_NAME; ?></title>
	
	<link rel="shortcut icon" href="<?php echo KU_WEBPATH; ?>/favicon.ico">
	
	<link rel="stylesheet" href="<?php echo KU_WEBPATH; ?>/custom/css/<?php echo ($hasInfo ? 'common' : 'frame'); ?>.css">
</head>
<body>
<?php
	if ($hasInfo) {
		require KU_ROOTDIR . 'inc/functions.php';
		
		$bans = $tc_db->GetOne("SELECT COUNT(*) FROM `".KU_DBPREFIX."banlist`");
		$wordfilters = $tc_db->GetOne("SELECT COUNT(*) FROM `".KU_DBPREFIX."wordfilter`");
		
		$modules = modules_list();
		$moduleslist = 'None';
		if (count($modules) > 0) {
			$moduleslist = implode(', ', $modules);
		}
?>
	<div class="text-center">
		<h1>General Info</h1>
		<ul class="list">
			<li>Version: kusaba x <?php echo KU_VERSION; ?></li>
			<li>Active bans: <?php echo $bans; ?></li>
			<li>Wordfilters: <?php echo $wordfilters; ?></li>
			<li>Modules loaded: <?php echo $moduleslist; ?></li>
		</ul>
		<br>
		- <a href="http://kusabax.cultnet.net/">kusaba x <?php echo KU_VERSION; ?></a> -
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
