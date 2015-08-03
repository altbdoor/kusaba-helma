<?php

/*
	gotta get a router up in this house to prevent the fire from burning it
	down. variables in here start with "router" to prevent mixup when we
	require the action files. root is accessible to all actions!
*/

// kusaba necessary
$preconfig_db_unnecessary = true;
require 'config.php';
require KU_ROOTDIR.'/lib/dwoo/Dwoo.compiled.php';

// get the autoloader
require KU_ROOTDIR.'/custom/php/autoload.php';

// check if we have action
if (!empty($_GET['action'])) {
	// prep path
	$routerAction = $_GET['action'];
	$routerPath = KU_ROOTDIR.'/custom/php/actions/'.$routerAction.'.php';
	
	// require if available
	if (file_exists($routerPath)) {
		require $routerPath;
	}
	else {
		header('HTTP/1.1 303 See Other');
		header('Location: /404.html');
	}
}
else {
	header('HTTP/1.1 303 See Other');
	header('Location: /404.html');
}

// die
exit();
