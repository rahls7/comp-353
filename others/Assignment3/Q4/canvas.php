<?php
// ------------------------------------------------------------------------------
// Assignment 3
// Written by: Gheith Abi-Nader #25703387
// For SOEN 287 Section CC – Summer 2018
// -----------------------------------------------------------------------------

if(isset($_COOKIE['counter'])){
    $count = $_COOKIE['counter']+1;
    setcookie('counter',$count,time()+60);
    echo $count;
}
else{
    setcookie('counter',0,time()+60);
    echo '0';
}
?>