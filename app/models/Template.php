<?php

class ModelTemplate
{
    // Add all attributes here
	public $template_id;
	
    //Functions that use query statements go here
    
    // Function example
    // Gets a field data on the current client in session
    public function getData($field) {
        $DBConn = new DBConnection();
        
        // Your query goes here
        $ccn = $_SESSION['ccn'];
        $query = "SELECT '$field' FROM Client WHERE client_card_number = '$ccn'";
        
        $stmt = $DBConn->connection->prepare($query);
        $stmt->execute();
        
        // The PHP class in 'models'
        $stmt->setFetchMode (PDO::FETCH_CLASS , 'Template');
        $data = $stmt->fetch();
        if(empty($data))
            // Do something
            return "";
        else
             return $data;
    }
}

?>

