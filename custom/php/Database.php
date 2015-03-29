<?php

namespace Custom;

class Database {
	private $instance = null;
	private $prefix = '';
	
	public function __construct ($instance, $prefix = '') {
		$this->instance = $instance;
		$this->prefix = $prefix;
		
		$this->instance->SetFetchMode(ADODB_FETCH_ASSOC);
	}
	
	public function execute ($statement, $parameters = null) {
		$resultSet = $this->instance->Execute($statement, $parameters);
		
		return $resultSet->getRows();
	}
	
	public function prepareTableName ($tableName) {
		return '`'.$this->prefix.$tableName.'`';
	}
	
}
