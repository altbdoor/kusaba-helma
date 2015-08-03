<?php
	// already installed, thanks
	/*if (file_exists("install.php")) {
		die('You are seeing this message because either you haven\'t ran the install file yet, and can do so <a href="install.php">here</a>, or already have, and <strong>must delete it</strong>.');
	}*/
	
	// check if user is requesting info
	$isInfo = isset($_GET['info']);
	
	// if it is not info page, we don't need db
	if (!$isInfo) {
		$preconfig_db_unnecessary = true;
	}
	
	// take in config
	require 'config.php';
	
	// menu is always dynamic... hence
	//$menufile = (KU_STATICMENU) ? 'menu.html' : 'menu.php';
	
	// they expire naturally
	//header("Expires: Mon, 1 Jan 2030 05:00:00 GMT");
	
	// headers template path
	$headMetaPath = KU_ROOTDIR.'/dwoo/templates/includes/headMeta.html';
?>
<!doctype html>
<html>
<head>
	<?php readfile($headMetaPath); ?>
	
	<title><?php echo KU_NAME; ?></title>
	
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="stylesheet" href="/custom/css/frame.css">
</head>
<body class="<?php echo $isInfo ? 'info' : 'frame-body' ?>">
	<?php if ($isInfo): ?>
		<?php
			// module count is always zero
			//require KU_ROOTDIR . 'inc/functions.php';
			
			// get the count
			$bans = $tc_db->GetOne('SELECT COUNT(`id`) FROM `banlist`');
			$wordfilters = $tc_db->GetOne('SELECT COUNT(`id`) FROM `wordfilter`');
			
			/*$modules = modules_list();
			$moduleslist = 'None';
			if (count($modules) > 0) {
				$moduleslist = implode(', ', $modules);
			}*/
		?>
		
		<h1>General Info</h1>
		
		<table>
			<tr>
				<td><b>Version</b></td>
				<td>kusaba x <?php echo KU_VERSION; ?></td>
			</tr>
			<tr>
				<td><b>Active Bans</b></td>
				<td><?php echo $bans; ?></td>
			</tr>
			<tr>
				<td><b>Wordfilters</b></td>
				<td><?php echo $wordfilters; ?></td>
			</tr>
			<tr>
				<td><b>Modules Loaded</b></td>
				<td>None</td>
			</tr>
		</table>
	<?php else: ?>
		<div class="frame-wrapper">
			<div class="frame-left">
				<iframe src="menu.php" frameborder="0" name="menu"></iframe>
			</div>
			<div class="frame-right">
				<iframe src="news.php" frameborder="0" name="main"></iframe>
			</div>
		</div>
		
		<?php
			// preload to cache bust
			$preload = array(
				'/custom/css/common.css',
				'/custom/css/board.css',
				'/custom/js/board.js'
			);
			
			$preloadHtml = '<script type="text/plain" src="'.
				implode('"></script><script type="text/plain" src="', $preload).
				'"></script>';
			
			echo $preloadHtml;
		?>
	<?php endif; ?>
</body>
</html>
