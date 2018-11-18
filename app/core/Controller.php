<?php
class Controller
{
	public function model($model)
	{
		require_once $_SERVER['DOCUMENT_ROOT'] . '/comp-353/app/models/' . $model . '.php';
		return new $model();	
	}
	
	public function view($view, $data = [])
	{
		require_once $_SERVER['DOCUMENT_ROOT'] . '/comp-353/app/views/' . $view . '/index.php';
	}
}

?>
