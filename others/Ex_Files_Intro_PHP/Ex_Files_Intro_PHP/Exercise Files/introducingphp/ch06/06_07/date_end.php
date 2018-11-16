<?php

function dateCpw($dateCreated){
    $timeU = strftime("%Y",strtotime($dateCreated));
    echo "$timeU - ".date('Y').'&copy';
}

dateCpw('2010-02-02');