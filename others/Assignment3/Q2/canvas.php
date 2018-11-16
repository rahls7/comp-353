<?php
// -----------------------------------------------------------------------------
// Assignment 3
// Written by: Gheith Abi-Nader #25703387
// For SOEN 287 Section CC – Summer 2018
// -----------------------------------------------------------------------------
$postDataCaptureMistake = false;
isset($_POST['user_name']) ? $usn = $_POST['user_name'] :
    ($usn = 'user name capture failed' AND $postDataCaptureMistake = true);
isset($_POST['password']) ? $pwd = $_POST['password'] :
    ($pwd='password capture failed' AND $postDataCaptureMistake = true);
$filePath = 'keys.txt';
$hasFile = file_exists($filePath);
$isUser = false;
if($hasFile){
    $usersRaw = file($filePath);
    foreach ($usersRaw as $id => $userLineDat){
        $userDatArrayed = explode(' ', $userLineDat);
        if($userDatArrayed[0] === $usn AND $userDatArrayed[1] === $pwd){
            $isUser = true;
        }
    }

    if($isUser){
        session_start();
        $_SESSION["user"]=explode('@',$usn)[0];
        $_SESSION["accessTime"] = date('c');
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Member's Area !</title>
    <script type="text/javascript">
        function displayWrongUser(){
            document.getElementById('falseUser').innerHTML = '<h1>INVALID USERNAME PASSWORD COMBO</h1>';
        }
    <?php
    if($postDataCaptureMistake){
        echo("alert('USERNAME AND PASSWORD CAPTURE ERROR:\\nusername : '+'".$usn."\\npassword : ".$pwd."');\n");
        echo('document.location.href = "LoginPage.html";');
    }
    ?>
    </script>

    <?php
    if(!$hasFile){
        echo('<style>');
        echo('#noFile{display:block;}');
        echo('#falseUser{display:none;}');
        echo('#goodUser{display:none;}');
        echo('</style>');
        if($usn != 'user name capture failed'){$usn='***hidden***';}
        if($pwd != 'user name capture failed'){$pwd='***hidden***';}
    }
    else
    {

        if(!$isUser){
            echo('<style>');
            echo('#noFile{display:none;}');
            echo('#falseUser{display:block;}');
            echo('#goodUser{display:none;}');
            echo('</style>');
            if($usn != 'user name capture failed'){$usn='***hidden***';}
            if($pwd != 'user name capture failed'){$pwd='***hidden***';}
        }
        else
        {
            echo('<style>');
            echo('#noFile{display:none;}');
            echo('#falseUser{display:none;}');
            echo('#goodUser{display:block;}');
            echo('</style>');
        }
    }
    ?>
</head>
<body>
<div id = "noFile">
    <h1>ERROR: KEYS.TXT NOT AVAILABLE</h1>
</div>
<div id="falseUser">
    <form action="LoginPage.html">
        <input type="submit" value="Return To Previous Page" />
        <input type="button" onclick="displayWrongUser()" value="SHOW CANVAS.PHP" />
    </form>
</div>
<div id="goodUser">
    <h1>HELLO <?=$_SESSION["user"]?>,</h1>
    <p>
        Welcome to the User Area.
        You have logged in at <?=$_SESSION["accessTime"]?>
    </p>
</div>

</body>
</html>
