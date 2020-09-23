<?php

###############

// FEATURES TO IMPLEMENT:
// [*] Activate Session for successfull registration and redirect to login

###############
	require_once "mysqlConfig.php";

	$name = $email = $username = $pass = $verifypass = "";
	$err = null;

	if($_SERVER["REQUEST_METHOD"] == "POST"){

		if(empty(trim($_POST["name"])) || empty(trim($_POST["email"])) || empty(trim($_POST["username"])) 
		|| empty(trim($_POST["pass"])) || empty(trim($_POST["verifypass"])) ){
			$err = "Please enter all details.";
		}
		else if( trim($_POST["pass"]) === trim($_POST["verifypass"]) ){

			

			$sql = "INSERT INTO `faculties`( `username`, `password`, `email` , `name`) VALUES (?,?,?,?)";

			if($stmt = mysqli_prepare($sql_api,$sql))
			{

				$username =  trim($_POST["username"]);
				$email = trim($_POST["email"]);
				$name = trim($_POST["name"]);
				$pass = trim($_POST["pass"]);

				mysqli_stmt_bind_param($stmt , "ssss", $username , $pass , $email, $name);
				
				if(mysqli_stmt_execute($stmt)){
					echo "done zo";
				}
				else{
					die("Fatal error (INSERTION) : ". mysqli_error($sql_api));
				}
			}
			else{
				die("Fatal Error (STMT) : ".mysqli_error($sql_api));
			}


		}
		else{
			$err = "Password and Verify Password don't match :(";
		}

	}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign Up | Oculus-VIT</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="login_res/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login_res/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="login_res/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="login_res/css/util.css">
	<link rel="stylesheet" type="text/css" href="login_res/css/main.css">
<!--===============================================================================================-->



</head>

<body style="background-color: #999999;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('login_res/images/bg-02.jpg');">
</div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">

				<form class="login100-form validate-form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST" autocomplete="off">
					<span class="login100-form-title p-b-59">
						Faculty Sign Up
					</span>

					<div class="wrap-input100 validate-input" data-validate="Name is required">
						<span class="label-input100">Full Name</span>
						<input class="input100" type="text" name="name" placeholder="Name...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" name="email" placeholder="Email address...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Username...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Repeat Password is required">
						<span class="label-input100">Repeat Password</span>
						<input class="input100" type="password" name="verifypass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>


					<!-- Custom error using bootstrap -->
					<?php if (isset($err)){ ?>
						<div class="alert alert-danger" role="alert">
							<?php
								echo $err;
							?>
						</div>
					<?php }; ?>
						<!-- END -->
					

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit">
								Sign Up
							</button>
						</div>

						<br>

						
					</div>
					<a href="#" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30" data-toggle="modal" data-target="#facultyModal">
						Log in
						<i class="fa fa-long-arrow-right m-l-5"></i>
					</a>

					<br>

					<a href="./SignUp.php" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
						Not a Faculty? Student Registration
						<i class="fa fa-long-arrow-right m-l-5"></i>
					</a>

				</form>
			</div>
		</div>
	</div>

	<!--Modal Popup division-->
	<div class="modal fade" id="facultyModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<p>Login Details</p>
				</div>
				<form name="facLogin" class="login100-form validate-form" method="POST" action="">
					<div class="modal-body">
						<div class="container">
							<p>
								<div class="wrap-input100 validate-input" data-validate="Username is required">
									Username:<br> 
									<input name="fac_id" type="text" class="input100" placeholder="Username">
									<span class="focus-input100"></span>
								</div>
								<div class="wrap-input100 validate-input" data-validate="Password is required">
									Password:<br> 
									<input name="fac_pass" type="password" class="input100" placeholder="********">
									<span class="focus-input100"></span>
								</div>
							</p>
						</div>
					</div>
				</form>

				<div class="modal-footer">
				<div>
									<!-- Custom error using bootstrap -->
									<?php if (isset($isError)) {?>
									<div class="alert alert-danger" role="alert">
										<?php
											echo $isError;
										?>
									</div>
									<?php };?>
									<!-- END -->
				</div>

				<div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn">
							Login
						</button>
					</div>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="login_res/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="login_res/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="login_res/vendor/bootstrap/js/popper.js"></script>
	<script src="login_res/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="login_res/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="login_res/vendor/daterangepicker/moment.min.js"></script>
	<script src="login_res/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="login_res/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="login_res/js/main.js"></script>

</body>
</html>