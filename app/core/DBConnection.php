<?php
class DBConnection{
	public $connection;

	private $_DBUser = 'kec353_2';
	private $_DBPass = 'data2497';
	private $_DBName = 'kec353_2';
    
	public function __construct(){
        $this->connection = new PDO('mysql:host=localhost;dbname=' . $this->_DBName, $this->_DBUser, $this->_DBPass);
        $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
}

?>