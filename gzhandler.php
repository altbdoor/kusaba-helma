<?php

// get variables ready
$request = $_SERVER['REQUEST_URI'];
$root = $_SERVER['DOCUMENT_ROOT'];

$path = parse_url($request, PHP_URL_PATH);

// show 404 if anything goes wrong
function show404 () {
	global $root;
	
	if (!ob_start('ob_gzhandler')) {
		ob_start();
	}
	
	header('HTTP/1.0 404 Not Found');
	setContentType('html');
	
	readfile($root.'/404.html');
	ob_end_flush();
	
	exit();
}

// set header type
function setContentType ($type = 'html') {
	$contentTypeStr = 'Content-Type: ';
	
	switch ($type) {
		case 'css':
			$contentTypeStr .= 'text/css';
			break;
		case 'js':
			$contentTypeStr .= 'text/javascript';
			break;
		default:
			$contentTypeStr .= 'text/html';
	}
	
	header($contentTypeStr);
	
	
}

// if invalid path
if (!$path) {
	show404();
}

// strip dots and add root to path
$path = $root.str_replace('..', '', $path);

// change to board index if first page
if (substr($path, -1) == '/') {
	$path .= 'board.html';
}

// if file doesn't exists or not the right file type
if (!file_exists($path) || !preg_match('/\.(html|css|js)$/', $path, $match)) {
	show404();
}

// not modifed
if (
	isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) && 
    strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) >= filemtime($localFileName)
) {
	header('HTTP/1.0 304 Not Modified');
	exit();
}

// start gzhandler
if (!ob_start('ob_gzhandler')) {
	ob_start();
}

// set content type
setContentType($match[1]);

// additional headers
if ($match[1] == 'html') {
	header_remove('ETag');
	header('Cache-Control: max-age=0, no-cache, no-store, must-revalidate');
	header('Pragma: no-cache');
	header('Expires: Wed, 11 Jan 1984 05:00:00 GMT');
}
else {
	
}

// read and exit
readfile($path);
ob_end_flush();
