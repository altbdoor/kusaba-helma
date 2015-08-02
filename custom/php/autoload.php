<?php

// custom app autoloader
spl_autoload_register(function ($class) {
	$class = str_replace('Custom\\', '', $class);
	
	$path = dirname(__FILE__).'/classes/'.$class.'.php';
	
	if (file_exists($path)) {
		require $path;
	}
});
