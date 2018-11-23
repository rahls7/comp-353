<?php

class Transfer extends Controller{
	
	public function index(){
        session_start();
        $ccn = $_SESSION['ccn'];
        $accounts = $this->model("Account")->getUserAccounts($ccn);

        $this->view('transfer', ['accounts' => $accounts]);  

	}
    
    public function send() {
        session_start();

        global $errorMessage;
        $ccn = $_SESSION['ccn'];

        $accounts = $this->model("Account")->getUserAccounts($ccn);

        if($_POST['payment-type'] == 'savings') {
            foreach ($accounts as $account) {
                if ($account->account_type == 'chequing') {
                    if($amount > $account->balance) {
                        $errorMessage = 'Insufficient funds';
                    }
                } 
            }
        }
                
		var_dump($_POST);

    }
}

?>