<?php

class Account
{
	public $account_number;
	public $balance;
    public $interest_rate_id;
	public $account_type;
    public $client_id;

    public function getUserAccounts($client_id) {
			echo $client_id;
        $DBConn = new DBConnection();
        $query = "SELECT * FROM Account WHERE client_id = '$client_id';";
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode (PDO::FETCH_CLASS , 'Account');
        $accounts = [];
		while($record = $stmt->fetch()){
			$accounts[] = $record;
		}
        if(empty($accounts))
            return "";
        else
            return $accounts;
    }
}

?>
