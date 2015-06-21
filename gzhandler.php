<?php

// get config
require 'config.php';

// get variables ready
$request = $_SERVER['REQUEST_URI'];

$path = parse_url($request, PHP_URL_PATH);

// show 404 if anything goes wrong
function show404 () {
	startBuffer();
	
	header('HTTP/1.0 404 Not Found');
	setContentType('html');
	
	readfile(KU_ROOTDIR.'/404.html');
	
	endBuffer();
}

// set header type
function setContentType ($type = 'html') {
	$contentTypeStr = 'Content-Type: text/';
	
	switch ($type) {
		case 'css':
			$contentTypeStr .= 'css';
			break;
		case 'js':
			$contentTypeStr .= 'javascript';
			break;
		default:
			$contentTypeStr .= 'html';
	}
	
	header($contentTypeStr);
}

// start buffer
function startBuffer () {
	if (/*KU_CUSTOMENABLEGZIP && */!ob_start('ob_gzhandler')) {
		ob_start();
	}
}

// end buffer
function endBuffer () {
	ob_end_flush();
	exit();
}

// if invalid path
if ($path === false) {
	show404();
}

// strip reverse dots and add root to path
$path = KU_ROOTDIR.str_replace('..', '', $path);

// change to board index if first page
if (substr($path, -1) == '/') {
	$path .= 'board.html';
}

// if file doesn't exists or not the right file type
if (!file_exists($path) || !preg_match('/\.(html|css|js)$/', $path, $match)) {
	show404();
}

// reassign type and file mod time
$type = $match[1];
$filetime = filemtime($path);

// not modifed
if (
	$type != 'html' &&
	isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) && 
    strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) >= $filetime
) {
	header('HTTP/1.0 304 Not Modified');
	exit();
}

// start gzhandler
startBuffer();

// set content type
setContentType($type);

// additional headers
if ($type == 'html') {
	header_remove('ETag');
	header('Cache-Control: max-age=0, no-cache, no-store, must-revalidate');
	header('Pragma: no-cache');
	header('Expires: Wed, 11 Jan 1984 05:00:00 GMT');
}
else {
	header('Last-Modified: '.gmdate('D, d M Y H:i:s', $filetime).' GMT');
	header('Expires: '.gmdate('D, d M Y H:i:s', time() + 604800).' GMT');
}

// read and exit
readfile($path);
endBuffer();