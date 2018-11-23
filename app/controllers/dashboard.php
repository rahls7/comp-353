<?php

class Dashboard extends Controller{

	public function index(){
		session_start();
        $client_id = $_SESSION['client_id'];
        $accounts = $this->model("Account")->getUserAccounts($client_id);
        $liabilities = $this->model("Liability")->getUserLiabilities($client_id);
				$user = $this->model('Client')->getData('first_name', $client_id);

				$name = $user->first_name;


        $this->view('dashboard', ['accounts' => $accounts, 'liabilities' => $liabilities, 'name' => $name ]);
	}
}

?>
