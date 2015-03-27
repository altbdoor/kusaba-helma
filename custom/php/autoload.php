<?php

// load config if not loaded
if (!defined('KU_DEBUG')) {
	require __DIR__.'/../../config.php';
}

// custom app autoloader
spl_autoload_register(function ($class) {
	$class = str_replace('Custom\\', '', $class);
	$path = __DIR__.'/'.$class.'.php';
		
	if (file_exists($path)) {
		require $path;
	}
});
