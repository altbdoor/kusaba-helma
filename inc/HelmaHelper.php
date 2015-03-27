<?php

class HelmaHelper {
	private static $isBufferStarted = false;
	private static $isRequestAjax = null;
	
	public static function setHeader ($headers) {
		if (is_array($headers)) {
			foreach ($headers as $header) {
				header($header);
			}
		}
		else {
			header($headers);
		}
	}
	
	public static function set404 () {
		self::setHeader('HTTP/1.0 404 Not Found');
	}
	
	public static function renderJSON ($data) {
		self::setHeader('Content-Type: application/json');
		
		echo json_encode($data);
	}
	
	public static function startGzip ($gzipEnabled = false) {
		self::setHeader('Vary: Accept-Encoding');
		
		if ($gzipEnabled && !ob_start('ob_gzhandler')) {
			self::$isBufferStarted = true;
			ob_start();
		}
	}
	
	public static function stopGzip () {
		if (self::$isBufferStarted) {
			ob_end_flush();
		}
	}
	
	public static function isAjax () {
		if ($isRequestAjax === null) {
			$isRequestAjax = false;
			
			if (
				isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
				!empty($_SERVER['HTTP_X_REQUESTED_WITH']) &&
				strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'
			) {
				$isRequestAjax = true;
			}
		}
		
		return $isRequestAjax;
	}
	
	
}
