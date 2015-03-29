<?php

	// we're all clear
	/*if (file_exists("install.php")) {
		die('You are seeing this message because either you haven\'t ran the install file yet, and can do so <a href="install.php">here</a>, or already have, and <strong>must delete it</strong>.');
	}
	
	if (!$hasInfo) {
		$preconfig_db_unnecessary = true;
	}
	
	require 'config.php';
	$menufile = (KU_STATICMENU) ? 'menu.html' : 'menu.php';

	header("Expires: Mon, 1 Jan 2030 05:00:00 GMT");*/
	
	require __DIR__.'/custom/php/autoload.php';
	
	$database = new \Custom\Database($tc_db, KU_DBPREFIX);
	$gzhandler = new \Custom\GzHandler(KU_CUSTOMENABLEGZIP);
	
	$hasInfo = isset($_GET['info']);
	
	$gzhandler->start();

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
	<?php if ($hasInfo): ?>
		<?php
			$banCount = $database->execute('SELECT COUNT(`id`) AS count FROM '.$database->prepareTableName('banlist'));
			$banCount = $banCount[0]['count'];
			
			$filterCount = $database->execute('SELECT COUNT(`id`) AS count FROM '.$database->prepareTableName('wordfilter'));
			$filterCount = $filterCount[0]['count'];
		?>
		
		<div class="text-center">
			<h1>General Info</h1>
			<ul class="list">
				<li>Version: kusaba x <?php echo KU_VERSION; ?></li>
				<li>Active bans: <?php echo $banCount; ?></li>
				<li>Wordfilters: <?php echo $filterCount; ?></li>
				<li>Modules loaded: 0</li>
			</ul>
			<br>
			- <a href="http://kusabax.cultnet.net/">kusaba x <?php echo KU_VERSION; ?></a> -
		</div>
	<?php else: ?>
		<div class="frame-wrapper">
			<div class="frame-left">
				<iframe frameborder="0" name="board_menu" src="menu.php"></iframe>
			</div>
			<div class="frame-right">
				<iframe frameborder="0" name="board_page" src="news.php"></iframe>
			</div>
		</div>	
	<?php endif; ?>
</body>
</html>

<?php $gzhandler->stop(); ?>
