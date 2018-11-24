<?php

class Bill extends Controller{
	
	public function index(){
        session_start();
        $ccn = $_SESSION['ccn'];
        $accounts = $this->model("Account")->getUserAccounts($ccn);
        $liabilities = $this->model('Liability')->getUserLiabilities($ccn);


        $this->view('bill', ['accounts' => $accounts, 'liabilities' => $liabilities]);  
	}
    

}

?>