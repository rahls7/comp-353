<?php
// ------------------------------------------------------------------------------
// Assignment 3
// Written by: Gheith Abi-Nader #25703387
// For SOEN 287 Section CC – Summer 2018
// -----------------------------------------------------------------------------
function processOrder(){
    if(!empty($_POST['elements'])){
        $_SESSION[$_POST['elements']]=[
            'font'=>$_POST['font'],
            'color'=>$_POST['color'],
            'show'=> empty($_POST['visible'])?'none':'block'
        ];
    }
}

if(empty($_POST['submit'])){
    session_id(md5(time() . rand() . $_SERVER['REMOTE_ADDR']));
    session_start();
    require("canvas.html");
    echo '<p>';
    echo '</p>';
}
elseif($_POST['submit']=="add specs"){
    session_start();
    processOrder();
    require("canvas.html");
    echo '<p>';
    var_dump($_SESSION);
    echo '</p>';
}
elseif ($_POST['submit'] == "render page"){
    session_start();
    processOrder();
    require ("canvasOut.php");
    echo '<p>';
    var_dump($_SESSION);
    echo '</p>';
    session_destroy();
}
?>
</body></html>
