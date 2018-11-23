<?php

class Interac extends Controller{
    public $errorMessage = "";

	
	public function index(){
		session_start();
        $ccn = $_SESSION['ccn'];
        $accounts = $this->model("Account")->getUserAccounts($ccn);

        $this->view('interac', ['accounts' => $accounts]);  
    }
    
    public function send() {
        session_start();

        global $errorMessage;
                
		if(($_POST['email'] != "")) {
            $email = $_POST['email'];
            $recieverField = 'email_address';
            $recieverValue= $email;
            $amount = $_POST['amount'];
            $ccn = $_SESSION['ccn'];
            $accountType = $_POST['payment-type'];
            $accounts = $this->model('Account')->getUserAccounts($ccn);
            // This check doesnt work. Figure out a way to display errorMessage
            foreach ($accounts as $account) {
                if ($account->account_type == $accountType) {
                    if($amount > $account->balance) {
                        $errorMessage = 'Insufficient funds';
                    }
                } 
            }
            $reciever = $this->model('Client')->getUser('email_address', $email);
            $sender = $this->model('Client')->getUser('card_number', $ccn);
            if ($reciever) {
                $this->model('Account')->updateBalance($amount, $ccn, $recieverField, $recieverValue, $accountType);
                
                $this->model('Transaction')->addTransaction($sender->client_id, $amount, 'withdraw');
                $this->model('Transaction')->addTransaction($reciever->client_id, $amount, 'depostit');
            } else {
                $this->model('Account')->updateBalance($amount, $ccn, '', '',$accountType);
                $this->model('Transaction')->addTransaction($sender->client_id, $amount, 'withdraw');

            }

		}
		else
            $errorMessage = "Please fill both fields";
        return header("Location: /public/dashboard");
    }
}

?>
