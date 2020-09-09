<?php
session_start();

$isError = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$isError = "Received: " . $_POST["username"] . " & " . $_POST["passwd"];

	if($_POST["username"] == "w" && $_POST["passwd"] == "w")
	{
		//lets go auth
		$_SESSION['authID'] = $_POST["username"];
		header("location: landing.php");
		exit;
	}
	else{
		//error message
		$isError = "Auth feil";
	}
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Oculus-VIT</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!--we need a new favicon-->
	<link rel="icon" type="image/png" href="login_res/images/icons/favicon.ico" />

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

				<form class="login100-form validate-form" autocomplete="off" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
					<span class="login100-form-title p-b-59">
						Login
					</span>

					<div class="wrap-input100 validate-input" data-validate="Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="passwd" placeholder="*************">
						<span class="focus-input100"></span>
					</div>

					<div>

						<?php if (isset($isError)){ ?>
						<div class="alert alert-danger" role="alert">
							<?php
							echo $isError;
							?>
						</div>
						<?php }; ?>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>

					<hr>
					<br>
					<div>

						<a href="./SignUp.php" class="dis-block txt3 hov1 p-r-30 p-t-30 p-b-10 p-l-10">
							New?&nbsp; Sign Up Now
							<i class="fa fa-long-arrow-right m-l-5"></i>
						</a>

					</div>

				</form>
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