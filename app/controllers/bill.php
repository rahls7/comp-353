<?php

class Bill extends Controller{
	
	public function index(){
        session_start();
        $ccn = $_SESSION['ccn'];
        $accounts = $this->model("Account")->getUserAccounts($ccn);
        $liabilities = $this->model('Liability')->getUserLiabilities($ccn);


        $this->view('bill', ['accounts' => $accounts, 'liabilities' => $liabilities]);  
    }
    
    public function send() {

        session_start();
        global $errorMessage;
        $ccn = $_SESSION['ccn'];
        $amount = $_POST['amount'];
        $from = $_POST['from'];
        $bill = $_POST['bill'];

        $accounts = $this->model("Account")->getUserAccounts($ccn);

        if($from == 'savings') {
            foreach ($accounts as $account) {
                if ($account->account_type == 'savings') {
                    if($amount > $account->balance) {
                        $errorMessage = 'Insufficient funds';
                    }
                } 
            }
            $client = $this->model('Client')->getUser('card_number', $ccn);


            $this->model('Account')->updateBalance($amount, $ccn, '','',$from);
            $this->model('Transaction')->addTransaction($client->client_id, $amount, 'bill_payment');

  
        } else if ($from == 'chequing') {
            foreach ($accounts as $account) {
                if ($account->account_type == 'chequing') {
                    if($amount > $account->balance) {
                        $errorMessage = 'Insufficient funds';
                    }
                } 
            }
            $client = $this->model('Client')->getUser('card_number', $ccn);

            $this->model('Account')->updateBalance($amount, $ccn, '','',$from);
            $this->model('Transaction')->addTransaction($client->client_id, $amount, 'bill_payment');

        } else {
            return $errorMessage;
        }
        return header("Location: /public/dashboard");  
    }
    

}

?>