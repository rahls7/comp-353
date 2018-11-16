<!doctype html>
<html>
<body>
<?php
	function exs($arrayNums, &$gtz, &$ltz){
		foreach($arrayNums as $key => $value){
			if($value >0):
				$gtz[$key]=$value;
			elseif($value<0):
				$ltz[$key]=$value;
			endif;
		}
		echo "Here are the values greater than ZERO:<br/>";
		echo implode(' | ',$gtz),'<br/>';
		echo "Here are the values lesser than ZERO:<br/>";
		echo implode(' | ',$ltz);
	}
	$gtz = array();
	$ltz = array();
	exs([0,1,2,3,4,5,-1,-2,-3,-4,-5,-0],$gtz,$ltz);
?>
</body>
</html>