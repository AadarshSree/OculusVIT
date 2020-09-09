<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
</head>

<body>
    <h2>Landing Page hello</h2>

    <?php

    if (isset($_SESSION['authID'])) {
        echo 'ok session is set @'. $_SESSION['authID'] ;
    } else {
        echo 'no sesssion set';
    }
    ?>
    <br><br>
    <a href="./logout.php">Logout</a>
</body>

</html>