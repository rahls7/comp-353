<?php

class Home extends Controller
{
	public $errorMessage = "";
	
	public function index($name = '')
	{
		$user = $this->model('Client');
		$user->name = $name;
		
		$this->view('Home', ['name' => $user->name]);
	}
    
    public function logout() {
        session_start();
        session_unset();
        session_destroy();
        return header("Location: /public/Home");
    }
	
	public function validate() {
        global $errorMessage;
		session_start();
                
		if(($_POST['ccn'] != "") && ($_POST['password'] != "")) {
            $u = $this->model("Client");
			$ccn = $_POST['ccn'];
			$data = $u->getData('password', $ccn);
			            
			if(!empty($data) && $_POST['password'] == $data->password) {
				$_SESSION['ccn'] = $ccn;
				return header("Location: /public/dashboard");
            }		
			else
                $errorMessage = "Email and password do not match";
		}
		else
			$errorMessage = "Please fill both fields";
		return header("Location: /public/Home");
				
	}
}

?>