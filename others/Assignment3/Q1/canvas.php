<?php
// -----------------------------------------------------------------------------
// Assignment 3
// Written by: Gheith Abi-Nader #25703387
// For SOEN 287 Section CC – Summer 2018
// -----------------------------------------------------------------------------
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Member's Area !</title>
</head>
<body>
<?php
isset($_POST['user_name']) ? $usn = $_POST['user_name'] : $usn = 'user name capture failed';
isset($_POST['password']) ? $pwd = $_POST['password'] : $pwd='password capture failed';
?>
<h1>Username = "<?= $usn?>"</h1>
<h1>Password = "<?= $pwd?>"</h1>
</body>
</html>
