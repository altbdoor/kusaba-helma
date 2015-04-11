<?php

namespace Custom;

class Request {
	private $isAjax = false;
	
	private $requestUri = null;
	private $modifiedSince = null;
	private $requestedWith = null;
	
	public function __construct () {
		$serverInfo = array(
			'requestUri' => 'REQUEST_URI',
			'modifiedSince' => 'HTTP_IF_MODIFIED_SINCE',
			'requestedWith' => 'HTTP_X_REQUESTED_WITH'
		);
		
		foreach ($serverInfo as $key => $value) {
			if (isset($_SERVER[$value]) && !empty($_SERVER[$value])) {
				$this->$key = $_SERVER[$value];
			}
		}
		
		if (
			$requestedWith !== null &&
			strtolower($requestedWith) == 'xmlhttprequest'
		) {
			$this->isAjax = true;
		}
	}
	
	public function set404 ($redirect = false) {
		if ($redirect) {
			header('HTTP/1.1 303 See Other');
			header('Location: /404.html');
		}
		else {
			header('HTTP/1.0 404 Not Found');
		}
	}
	
	public function redirect ($path) {
		header('HTTP/1.1 303 See Other');
		header('Location: '.$path);
	}
	
	public function renderJSON ($data) {
		header('Content-Type: application/json; charset=utf-8');
		echo json_encode($data);
	}
	
	public function isAjax () {
		return $this->isAjax;
	}
	
	public function getRequestUri () {
		return $this->requestUri;
	}
	
	public function getModifiedSince () {
		return $this->modifiedSince;
	}
	
}
