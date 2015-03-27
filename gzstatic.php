<?php

// show 404 if anything goes wrong
function show404 ($request, $gzhandler) {
	$gzhandler->start();
	
	$request->set404();
	header('Content-Type: text/html');
	readfile(KU_ROOTDIR.'/404.html');
	$gzhandler->stop();
	
	die();
}

/*// set header type
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
	
	HelmaHelper::setHeader($contentTypeStr);
}

// ========================================*/

// get config
require __DIR__.'/custom/php/autoload.php';

// get variables ready
$request = new \Custom\Request();
$gzhandler = new \Custom\GzHandler(KU_CUSTOMENABLEGZIP);

$path = $request->getPath();

// if invalid path
if ($path === false) {
	$gzhandler->start();
	$request->set404(true, KU_ROOTDIR);
	$gzhandler->stop();
	die();
}

// strip reverse dots and add root to path
$path = KU_ROOTDIR.str_replace('..', '', $path);

// change to board index if first page
if (substr($path, -1) == '/') {
	$path .= 'board.html';
}

// if file doesn't exists or not the right file type
if (!file_exists($path) || !preg_match('/\.(html|css|js)$/', $path, $match)) {
	show404(true, KU_ROOTDIR);
}

// reassign type and file mod time
$type = $match[1];
$filetime = filemtime($path);

// not modifed
if (
	$type != 'html' &&
	isset($request->getIfModifiedSince()) && 
    strtotime($request->getIfModifiedSince()) >= $filetime
) {
	HelmaHelper::setHeader('HTTP/1.0 304 Not Modified');
	die();
}

// start gzhandler
HelmaHelper::startGzip(true/*KU_CUSTOMENABLEGZIP*/);

// set content type
setContentType($type);

// additional headers
if ($type == 'html') {
	header_remove('ETag');
	HelmaHelper::setHeader(array(
		'Cache-Control: max-age=0, no-cache, no-store, must-revalidate',
		'Pragma: no-cache',
		'Expires: Wed, 11 Jan 1984 05:00:00 GMT'
	));
}
else {
	HelmaHelper::setHeader(array(
		'Last-Modified: '.gmdate('D, d M Y H:i:s', $filetime).' GMT',
		'Expires: '.gmdate('D, d M Y H:i:s', time() + 604800).' GMT'
	));
}

// read and die
readfile($path);

HelmaHelper::stopGzip();
die();
