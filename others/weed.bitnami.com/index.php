<?php
/**
 * Created by PhpStorm.
 * User: assembling
 * Date: 2018-08-25
 * Time: 10:10 PM
 */
//testing mysql connection
$servername = "";
$username = "root";
$password = "NBd5sjFb7t0I";
$dbname = "weed";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Weed Table</title>
</head>
<body>
<?php
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
else{ //if live; 1-start querying and 2-output html table
    //1- starting to query the tables to output
    $strainIdInterval = $conn->query("SELECT MIN(id), MAX(id) FROM strains;")->fetch_assoc();
    $minId=$strainIdInterval['MIN(id)']; $maxId=$strainIdInterval['MAX(id)'];
    $randStrain = rand($minId,$maxId);
    #no need to check for invalid strain ID -- just prototype --
    $strainDatSql = "SELECT `name`, `type`, `type_percent`, `description`, `recommended_time_of_use`, ".
        "`ucpc` FROM `strains` WHERE id=$randStrain ";
    $strainDat = $conn->query($strainDatSql)->fetch_assoc(); //strain id unique key
    print_r($strainDat);
?> <!--2-writing html table if connection is live -->
<h2>Showing Data For Strain #<?php echo $randStrain; ?></h2>
<table>
    <tr>
        <th></th>
    </tr>
</table>
<?php }//closing the top else
$conn->close();
?>
</body>
</html>