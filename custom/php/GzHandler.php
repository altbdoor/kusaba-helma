<?php

namespace Custom;

class GzHandler {
	private $isGzipEnabled = false;
	private $isBufferStarted = false;
	
	public function __construct ($gzipEnabled = false) {
		$this->isGzipEnabled = $gzipEnabled;
	}
	
	public function start () {
		if ($this->isGzipEnabled) {
			$this->isBufferStarted = true;
			
			if (!ob_start('ob_gzhandler')) {
				ob_start();
			}
		}
		
		header('Vary: Accept-Encoding');
	}
	
	public function cancel () {
		if ($this->isBufferStarted) {
			header_remove('Vary: Accept-Encoding');
			ob_end_clean();
		}
	}
	
	public function stop () {
		if ($this->isBufferStarted) {
			ob_end_flush();
		}
	}
	
}
