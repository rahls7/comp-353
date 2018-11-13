<?php
class App
{
	protected $controller = 'home';
	
	protected $method = 'index';
	
	protected $params = [];
	
	public function __construct()
	{
		$url = $this->parseURL();
        
		if(isset($url[2]) && file_exists('../app/controllers/' . $url[2] . '.php'))
		{
			$this->controller = $url[2];
			unset($url[2]);
		}
		require_once '../app/controllers/' . $this->controller . '.php';
		
		$this->controller = new $this->controller;
		
		if(isset($url[3]))
		{
			if(method_exists($this->controller, $url[3]))
			{
				$this->method = $url[3];
				unset($url[3]);
			}
		}
		$this->params = $url ? array_values($url) : [];
		
		call_user_func_array([$this->controller, $this->method], $this->params);
	}
	
	public function parseURL()
	{
		if(isset($_SERVER['REQUEST_URI'])) {
			return $url = explode('/', filter_var(rtrim($_SERVER['REQUEST_URI'], '/'), FILTER_SANITIZE_URL));
		}
	}
}
?>