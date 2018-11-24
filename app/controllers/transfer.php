<?php

class Transfer extends Controller{
	
	public function index(){
        session_start();
        $ccn = $_SESSION['ccn'];
        $accounts = $this->model("Account")->getUserAccounts($ccn);
        $to = $this->model('Liability')->getUserLiabilities($ccn);

        $this->view('transfer', ['accounts' => $accounts, 'to' => $to]);  

	}
    
    public function send() {
        session_start();
        global $errorMessage;
        $ccn = $_SESSION['ccn'];
        $amount = $_POST['amount'];
        $from = $_POST['from'];
        $to = $_POST['payment-type'];

        $accounts = $this->model("Account")->getUserAccounts($ccn);

        if($from == 'savings') {
            foreach ($accounts as $account) {
                if ($account->account_type == 'savings') {
                    if($amount > $account->balance) {
                        $errorMessage = 'Insufficient funds';
                    }
                } 
            }
            if($to == 'chequing') {
                $this->model('Account')->transfer($from, $to, $amount, $ccn);
            } else if($to == 'savings') {
                return header("Location: /public/dashboard");
            } else {
                $this->model('Liability')->updateLiability($ccn,$to, $amount);
                $this->model('Account')->updateBalance($amount, $ccn, '','',$from);
            }
        } else if ($from == 'chequing') {
            foreach ($accounts as $account) {
                if ($account->account_type == 'chequing') {
                    if($amount > $account->balance) {
                        $errorMessage = 'Insufficient funds';
                    }
                } 
            }
            if($to == 'savings') {
                $this->model('Account')->transfer($from, $to, $amount, $ccn);
            } else if($to == 'chequing') {
                return header("Location: /public/dashboard");
            } else {
                $this->model('Liability')->updateLiability($ccn,$to, $amount);
                $this->model('Account')->updateBalance($amount, $ccn, '','',$from);
            }
        } else {
            return $errorMessage;
        }
        return header("Location: /public/dashboard");    

    }
}

?>