<?php

    require_once "mysqlConfig.php";
    require_once "email.php";

    error_reporting(E_ALL ^ E_WARNING); 

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        if(isset($_POST["uname"])){
            
            $qry1 = "SELECT * from students WHERE username = '".$_POST["uname"]."'";

            if($rs = mysqli_query($sql_api, $qry1)){

                if(mysqli_num_rows($rs) > 0){
                    
                    $ro = mysqli_fetch_array($rs);
                    header("location: reset_student.php?rid=".$ro['sid']);
                }
                else{
                    die("Username Not Found!");
                }
            }else{
                die("sql error". mysqli_error($sql_api));
            }
        }
    }
    if(isset($_GET['rid']) & !empty($_GET['rid'])){
        $bool = false;
    }else{
        $bool = true;
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Password Reset | Oculus</title>
    
    
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    
</head>
<body>
    
    <nav class="navbar navbar-dark bg-dark">
        <span class="navbar-brand mb-0 h1">Oculus-VIT</span>
    </nav>
    <br><br>

    <?php
        if($bool){
    ?>
    <div class="w-50 p-5" style="margin-left: 25%;">
        <h2 style="text-align: center;">Student Password Reset</h2>
        <br>
        <form action="" method="POST">

            
            <input  name="uname" class="form-control form-control-lg" type="text" placeholder="Enter Username: " required autocomplete="off">
            <br>
            <button type="submit" class="btn btn-primary btn-lg btn-block">Reset</button>
        </form>
    </div>

    <?php
        }
        else{
            $email_id = "";
            $otp = "";
            $rid = $_GET["rid"];
            $qry = "SELECT email from students WHERE sid LIKE ".$rid;
            if($rs = mysqli_query($sql_api, $qry)){
                if(mysqli_num_rows($rs) == 0){
                    die("Student username not found!");
                }
                else{
                    $row = mysqli_fetch_array($rs);
                    $email_id = $row['email'];
                    $otp = rand(100000,999999);
                    //write this otp to db
                    $qq = "DELETE FROM otp_student where id=".$rid;
                    
                    mysqli_query($sql_api, $qq);
                    $qry = "INSERT INTO `otp_student`(`id`, `otp`, `timestamp`) VALUES ($rid,$otp,current_timestamp())";
                    if(mysqli_query($sql_api,$qry)){

                        //send mail:

                        send_otp($email_id,$otp);


                    }else{
                        die("SQL ERR");
                    }


                }
            }
            else{
                die("sql error".mysqli_error($sql_api));
            }


    ?>
    

    <div class="w-50 p-5" style="margin-left: 25%;">
        <h2 style="text-align: center;">Enter OTP</h2>
        <h5 style="text-align: center;">A 6 Digit OTP has been sent to <?php echo $email_id?> </h5>
        <br>
        <form action="change_password.php" method="POST">

            
            <input  name="otp" class="form-control form-control-lg" type="text" placeholder="OTP: " required autocomplete="off">
            <input type="hidden" name="rid" value="<?php echo $rid;?>">
            <input type="hidden" name="sf" value="s">
            <br>
            <button type="submit" class="btn btn-primary btn-lg btn-block">Check OTP & Change Password</button>
        </form>
    </div>
    <?php
        };
    ?>

    <?php

        if(isset($_GET["err"])){
            echo "<div class='alert alert-danger w-25' style='margin-left: 75vh;' role='alert'>
                    <b>OTP is Wrong</b>, A new OTP has been sent to your email find it & enter the <b>Correct OTP</b> !
                </div>";
        }
    ?>
</body>
</html>