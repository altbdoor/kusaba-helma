<?php

namespace Custom;

class GzHandler {
	private $isGzipEnabled = false;
	private $isBufferStarted = false;
	
	public function __construct ($gzipEnabled = false) {
		$this->isGzipEnabled = $gzipEnabled;
		header('Vary: Accept-Encoding');
	}
	
	public function start () {
		if ($this->isGzipEnabled) {
			$this->isBufferStarted = true;
			
			if (!ob_start('ob_gzhandler')) {
				ob_start();
			}
		}
	}
	
	public function stop () {
		if ($this->isBufferStarted) {
			ob_end_flush();
		}
	}
	
}
