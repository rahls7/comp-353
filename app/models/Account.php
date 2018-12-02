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

    public function updateBalance($amount, $ccn, $recieverField ,$recieverValue, $accountType) {
        if ($recieverValue != '') {
            $DBConn = new DBConnection();
            $query = "UPDATE Account SET balance = (balance + $amount) WHERE client_id = (SELECT client_id FROM Client WHERE $recieverField = '$recieverValue') AND account_type ='chequing';";

            $query .= "UPDATE Account SET balance = (balance - $amount) WHERE client_id =(SELECT client_id FROM Client WHERE card_number = '$ccn') AND account_type = '$accountType';";
            $stmt = $DBConn->connection->prepare($query);
            $stmt->execute();

        } else {
            $DBConn = new DBConnection();

            $query = "UPDATE Account SET balance = (balance - $amount) WHERE client_id = (SELECT client_id FROM Client WHERE card_number = '$ccn') AND account_type = '$accountType'";
            $stmt = $DBConn->connection->prepare($query);
            $stmt->execute();
        }
    }

    public function transfer($from, $to, $amount, $ccn) {
        $DBConn = new DBConnection();

            $query = "UPDATE Account SET balance = (balance - $amount) WHERE client_id = (SELECT client_id FROM Client WHERE card_number = '$ccn') AND account_type = '$from';";
            $query .= "UPDATE Account SET balance = (balance + $amount) WHERE client_id = (SELECT client_id FROM Client WHERE card_number = '$ccn') AND account_type = '$to';";
            $stmt = $DBConn->connection->prepare($query);
            $stmt->execute();

    }
}

?>
