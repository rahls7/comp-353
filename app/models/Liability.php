<?php

class Liability
{
	public $liability_id;
	public $type;
    public $credit_limit;
	public $client_id;
	public $interest_rate_id;
    
    public function getUserLiabilities($ccn) {
        $DBConn = new DBConnection();
        $query = "SELECT * FROM Liability WHERE client_id = (SELECT client_id FROM Client where card_number = '$ccn')";
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode (PDO::FETCH_CLASS , 'Liability');        
        $liabilities = [];
		while($record = $stmt->fetch()){
			$liabilities[] = $record;
        }

        if(empty($liabilities))
            return "";
        else
            return $liabilities;
    }

    public function updateLiability($ccn,$to, $amount) {
        $DBConn = new DBConnection();
        $query = "UPDATE Liability SET credit_limit = (credit_limit + $amount) WHERE client_id = (SELECT client_id FROM Client where card_number = '$ccn') AND type = '$to';";
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
    }
}

?>