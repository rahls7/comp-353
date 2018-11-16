<!--
// ------------------------------------------------------------------------------
// Assignment 3
// Written by: Gheith Abi-Nader #25703387
// For SOEN 287 Section CC – Summer 2018
// -----------------------------------------------------------------------------
-->
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <!-- responsive web page design -->
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Login Page For Q1</title>
    <style>
        form {
            margin: auto;
            padding: 4%;
            background-color: black;
            min-width: 300px;
            width: 75%;
            color: yellow;
            text-align: center;
        }
        form strong {color: white;}
        fieldset{
            color: black;
            text-align: left;
            background-color: burlywood;
        }
        fieldset, div input{
            padding-bottom: 1%;
            margin: 1% auto;
            width: 99%;
        }
        input[type="submit"] {margin: auto; border: none;}
        <?php
        foreach ($_SESSION as $a=>$specs){
               $selector;
               switch ($a){
                   case('general'):
                       $selector='form,.form';break;
                   case('title'):
                       $selector='.formTitle';break;
                   case('username'):
                       $selector='#userN';break;
                   case('password'):
                     $selector='#pass';break;
                   case('submit'):
                       $selector='input[type="submit"]';break;
               }
               echo ($selector.' {');
               echo ('font-size: '.$specs['font'].'px;');
               echo ('background-color: '.$specs['color'].';');
               echo('display: '.$specs['show'].';');
               echo '}';
        }
         ?>
    </style>
</head>
<body>
<form action="canvas.php" method="post">
    <div class="formTitle">
    <h1 class="formTitle">Welcome</h1>
    <p class="formTitle form">This Is A Very Plain User Experience</p>
    </div>
    <fieldset>
        <div><strong id="login" class="form">Login:<br /></strong></div>
        <div>
            <input id="userN" name="user_name" type="email" placeholder="Email" class="form" required /> <br />
            <input id="pass" name="password" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%\^&]).{8,}"
                   title="The password must contain at least:\n1 uppercase character, \n1 lowercase character, \n1 digit,
                   \n1 special character and \na minimum length of 8 characters" placeholder="Password" class="form" required />
        </div>
    </fieldset>
    <input type="submit" value="LOGIN" />
</form>
</body>
</html>