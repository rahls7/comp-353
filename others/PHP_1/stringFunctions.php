<!DOCTYPE html>
<html>
<head>
    <title> PHP-String functions </title>
    <meta charset = "utf-8" />
</head>
<body>

<h1>String Trim PHP page</h1>
<?php   
  $first = 'nancy...';   $last = "ACEMIAN";
	echo  (trim($first,".")."<br />");
	echo  (strlen($first)."<br />");
	echo  (strstr("Nancy Acemian","ncy").'<br />');
	echo  (ucwords("nancy ACEMIAN").'<br />');
	echo  (strcmp("hello", "Hello"));
?>
</body>
</html>




