<?php

// get config
require __DIR__.'/custom/php/autoload.php';

// get variables ready
$request = new \Custom\Request();
$gzhandler = new \Custom\GzHandler(KU_CUSTOMENABLEGZIP);

$path = parse_url($request->getRequestUri(), PHP_URL_PATH);

// if invalid path
if ($path === false) {
	$request->set404(true);
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
	$request->set404(true);
	die();
}

// reassign type and file mod time
$type = $match[1];
$filetime = filemtime($path);

// not modifed
if (
	($request->getModifiedSince() !== null) && 
    strtotime($request->getModifiedSince()) >= $filetime
) {
	header('HTTP/1.0 304 Not Modified');
	die();
}

// start gzhandler
$gzhandler->start();

// set content type
if ($type == 'js') {
	header('Content-Type: text/javascript; charset=utf-8');
}
else {
	header('Content-Type: text/'.$type.'; charset=utf-8');
}

// additional headers
header_remove('ETag');

if ($type != 'html') {
	header('Cache-Control: public, max-age=604800');
	header('Expires: '.gmdate('D, d M Y H:i:s', time() + 604800).' GMT');
}

header('Last-Modified: '.gmdate('D, d M Y H:i:s', $filetime).' GMT');

// read and die
readfile($path);

$gzhandler->stop();
die();
