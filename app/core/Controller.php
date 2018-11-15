<?php
class Controller
{
	public function model($model)
	{
		require_once $_SERVER['DOCUMENT_ROOT'] . '/app/models/' . $model . '.php';
		return new $model();	
	}
	
	public function view($view, $data = [])
	{
		require_once $_SERVER['DOCUMENT_ROOT'] . '/app/views/' . $view . '/index.php';
	}
}

?>
