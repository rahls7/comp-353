<!DOCTYPE html>
<html>
<head>
    <title> PHP-printf </title>
    <meta charset = "utf-8" />
</head>
<body>

<h1>printf PHP page</h1>

<?php
	$price = 100;
	$item = "desk";
	printf("The price of %2s is %2d\n", $item, $price);

?>
</body>
</html>