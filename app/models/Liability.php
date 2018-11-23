<?php

class Liability
{
	public $liability_id;
	public $type;
    public $credit_limit;
	public $client_id;
	public $interest_rate_id;

    public function getUserLiabilities($client_id) {
        $DBConn = new DBConnection();
        $query = "SELECT * FROM Liability WHERE client_id = $client_id";
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
}

?>
