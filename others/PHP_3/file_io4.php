<!DOCTYPE html>
<html lang="en">
  <head> 
    <meta charset="utf-8"/>
  </head>
  <body>
	<h1> File I/O - Writing and reading to/from file</h1>
<?php
$myfile = fopen("file_io4.txt", "w") or die("Unable to open file!");
$txt = "Mickey Mouse\n";
fwrite($myfile, $txt);
$txt = "Minnie Mouse\n";
fwrite($myfile, $txt);
echo "Just finished writing to file<br />Content of file:";
fclose($myfile);
//------------------------------------------------
echo "<br /><br />Read one line at a time using fgets & feof <br />";
$myfile = fopen("file_io4.txt", "r") or die("Unable to open file!");
while(!feof($myfile)){
	echo fgets($myfile),'<br/>';
}
rewind($myfile);
//------------------------------------------------------
echo "Read using fread <br />";
print(fread($myfile, filesize("file_io4.txt")));
//------------------------------------------------------
echo "<br /><br />Read using readfile<br />";
echo readfile("file_io4.txt");
fclose($myfile);
//------------------------------------------------------
//Read using readfile (Display what was read with print_r
echo "<br /><br />Reading from file using file() <br />";
print_r(file("file_io4.txt"));
//---------------------------------------------------------
// Get content of file using file_get_content
echo "<br /><br />Reading from file using file_get_contents() <br />";
echo file_get_contents("file_io4.txt");
?>
  </body>
</html>
