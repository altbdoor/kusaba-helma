<?php

namespace Custom;

class Request {
	private $isAjax = false;
	private $requestUri = null;
	private $ifModifiedSince = null;
	
	public function __construct () {
		
		$this->requestUri = $_SERVER['REQUEST_URI'];
		$this->ifModifiedSince = $_SERVER['HTTP_IF_MODIFIED_SINCE'];
		
		if (
			isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
			!empty($_SERVER['HTTP_X_REQUESTED_WITH']) &&
			strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'
		) {
			$this->isAjax = true;
		}
	}
	
	public function setHeaders ($headers) {
		if (is_array($headers)) {
			foreach ($headers as $header) {
				header($header);
			}
		}
		else {
			header($headers);
		}
	}
	
	public function set404 ($read404 = false, $root) {
		header('HTTP/1.0 404 Not Found');
		
		if ($read404) {
			header('Content-Type: text/html');
			readfile($root.'/404.html');
		}
	}
	
	public function renderJSON ($data) {
		header('Content-Type: application/json');
		echo json_encode($data);
	}
	
	public function isAjax () {
		return $this->isAjax;
	}
	
	public function getPath () {
		return parse_url($this->requestUri, PHP_URL_PATH);
	}
	
	public function getIfModifiedSince () {
		return $this->ifModifiedSince;
	}
	
}
