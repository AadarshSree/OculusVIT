<?php
    include_once("mysqlConfig.php");
    
    //$username = $_SESSION['username'];

    $result = mysqli_query($sql_api, "SELECT title FROM quiz WHERE eid = $_GET['eid'] ");
    if(mysqli_num_rows($result)==1){
        $examNames = mysqli_fetch_array($result, MYSQLI_ASSOC);
        $examName = $examNames['title']; 
    }

    $date = date("d-m-Y", strtotime($date));

    $array[] = array("username"=>"master", "examname"=>"Idk some exam" ,"date"=>$date);

    //INSERT INTO violations(username, examname, date) VALUES ('$username','$examName','$date');

    echo json_encode($array);
?>

