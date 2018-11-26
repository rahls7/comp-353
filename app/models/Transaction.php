<?php

class Transaction
{
	public $transaction_id;
	public $client_id;
    public $type;
    public $amount;

    
public function addTransaction($client_id, $amount, $type) {
    $DBConn = new DBConnection();
    
    $query = 
    "INSERT INTO Transaction (client_id, amount,type) VALUES ($client_id, $amount, '$type')";        
    
    $stmt = $DBConn->connection->prepare($query);
    $stmt->execute();
    

}
}

?>