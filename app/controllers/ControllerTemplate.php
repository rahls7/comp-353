<?php

class ControllerTemplate extends Controller{
	
	public function index(){
        // The initial function called when the page loads.
        // i.e. when the URL is /public/ControllerTemplate
        
        // This will set the view from the 'view' folder
        $this->view('ViewTemplate');
	}
    
    public function getAll() {
        $songs = $this->model->getAllSongs();

    }
}

?>