<?php

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    //idk
}

$_SESSION = array();

session_destroy();

header("location: Login.php");
exit;
?>
