<?php

    require_once "mysqlConfig.php";
    error_reporting(E_ALL ^ E_WARNING); 

    if(!isset($_POST["otp"])){
        header("location: reset_student.php");
    }
    else{

        
        
        if($_POST["sf"] == "s"){
            
            $qq = "SELECT * from otp_student WHERE id=".$_POST["rid"];
            $rs = mysqli_query($sql_api, $qq);
            if(mysqli_num_rows($rs) >0){

                $row = mysqli_fetch_array($rs);

                if( (time() - strtotime($row["timestamp"])) > 121){

                    //die( "OTP Expired" );

                }
                if($_POST["otp"] == $row["otp"]){

                    
                    
                    $auth = true;
                }
                else{
                    header("location: reset_student.php?rid=".$_POST["rid"]."&err=1");

                }

            }
            else{
                header("location: reset_student.php?rid=".$_POST["rid"]."&err=1");
            }

        }
        else{

        }
    }

    if(isset($_POST["resetID"])){

        if($_POST["sf"] == "s"){

            $qq = "UPDATE `students` SET `password` = '".$_POST["passwd"]."' WHERE `students`.`sid` = ".$_POST["resetID"].";";
            if(mysqli_query($sql_api,$qq)){

                header("location: Login.php?gm=2");

            }
            else{
                die("SQL Error");
            }

        }else{

        }
    }


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password | Oculus</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <nav class="navbar navbar-dark bg-dark">
        <span class="navbar-brand mb-0 h1">Oculus-VIT</span>
    </nav>
    <br><br>
    <div class="w-50 p-5" style="margin-left: 25%;">
        <h2 style="text-align: center;">Change Password</h2>
        <br>
        <form action="" method="post">

            
            <input  name="passwd" class="form-control form-control-lg" type="password" placeholder="Enter New Password: " required autocomplete="off">
            <br>
            <input type="hidden" name="sf" value="<?php echo $_POST["sf"];?>">
            <input type="hidden" name="resetID" value="<?php if($auth) echo $_POST["rid"];?>">
            <button type="submit" class="btn btn-primary btn-lg btn-block">Reset</button>
        </form>
    </div>
    
</body>
</html>