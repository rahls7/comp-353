<?php

class Client
{
	public $client_id;
    public $first_name;
	public $last_name;
    public $date_of_birth;
	public $join_date;
	public $address;
	public $email;
	public $phone_number;
    public $category;
    public $branch_id;
    public $card_number;
	public $password;
    
    public function getData($field, $ccn) {
        $DBConn = new DBConnection();
        
        $query = "SELECT $field FROM Client WHERE card_number = '$ccn'";        
        
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
        
        $stmt->setFetchMode (PDO::FETCH_CLASS , 'Client');
        $data = $stmt->fetch();

        if(empty($data))
            return "";
        else
             return $data;
    }

    public function getUser($field, $value) {
        $DBConn = new DBConnection();
        $query = "SELECT * from Client WHERE $field = '$value'";
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
        
        $stmt->setFetchMode (PDO::FETCH_CLASS , 'Client');
        $data = $stmt->fetch();

        if(empty($data))
            return "";
        else
             return $data;

    }
    
    public function addClient($first_name, $last_name, $email, $password, $date_of_birth, $address, $phone_number, $branch_id) {
        $DBConn = new DBConnection();
        
        $query = "INSERT INTO Client (first_name, last_name, card_number, email, password, date_of_birth, join_date, address, phone_number, branch_id) VALUES ($first_name, $last_name, $email, $password, $date_of_birth, " . NOW() . " $address, $phone_number, $branch_id)";        
        
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
    }
    
    public function deleteClient($ccn) {
        $DBConn = new DBConnection();
        
        $query = "DELETE FROM Client WHERE card_number = $ccn";        
        
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
    }
}

?>