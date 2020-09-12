<?php

// !!!!!!!!!!!!!
# DO NOT MODIFY
// !!!!!!!!!!!!!

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'oculusvit');
 
//use $sql_api as link throughout project
$sql_api = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// Check connection
if($sql_api === false){
    die("ERROR: Could not connect. " . mysqli_connect_error() );
}


?>