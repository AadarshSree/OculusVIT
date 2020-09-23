<?php
session_start();

// #################

// NEED TO INCLUDE FEATURE:
// [*] Redirect user to landing on pre existing session being detected
// [*] Implement Session from Reg page so as to redirect to landing

// #################

require_once "mysqlConfig.php";

$isError = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {

	
	//faculty
	if(isset($_POST["fac_id"]) && isset($_POST["fac_pass"])){

		if (!(empty($_POST["fac_id"]) || empty($_POST["fac_pass"]))) {

            $username = trim($_POST["fac_id"]);
            $passwd = trim($_POST["fac_pass"]);

            $query = "SELECT `fid` FROM `faculties` WHERE username like ? AND password LIKE ?";

            if ($stmt = mysqli_prepare($sql_api, $query)) {

                mysqli_stmt_bind_param($stmt, "ss", $username, $passwd);

                if (mysqli_stmt_execute($stmt)) {

                    mysqli_stmt_store_result($stmt);

                    if (mysqli_stmt_num_rows($stmt) >= 1) {

                        $fid = -1;
                        mysqli_stmt_bind_result($stmt, $fid);
                        if (mysqli_stmt_fetch($stmt)) {
                            if ($fid > 0) {
                                //Authenticated
								$_SESSION['authID'] = $fid;
								$_SESSION['role'] = "faculty";

                                header("location: landing.php");
                                exit;

							}
							else {
								$isError = "Authentication failed ! :(";
							}
						}
						else {
							$isError = "Authentication failed ! :(";
						}

                    } else {
                        $isError = "Wrong Username OR Password ! :(";
                    }

                }
            }

        } else {
            $isError = "Enter Username and Password !";
        }
	}

	//student
    if (isset($_POST["username"]) && isset($_POST["passwd"])) {
		

        if (!(empty($_POST["username"]) || empty($_POST["passwd"]))) {

            $username = trim($_POST["username"]);
            $passwd = trim($_POST["passwd"]);

            $query = "SELECT `sid` FROM `students` WHERE username like ? AND password LIKE ?";

            if ($stmt = mysqli_prepare($sql_api, $query)) {

                mysqli_stmt_bind_param($stmt, "ss", $username, $passwd);

                if (mysqli_stmt_execute($stmt)) {

                    mysqli_stmt_store_result($stmt);

                    if (mysqli_stmt_num_rows($stmt) >= 1) {

                        $fid = -1;
                        mysqli_stmt_bind_result($stmt, $fid);
                        if (mysqli_stmt_fetch($stmt)) {
                            if ($fid > 0) {
                                //Authenticated
								$_SESSION['authID'] = $fid;
								$_SESSION['role'] = "student";
                                header("location: landing.php");
                                exit;

							}
							else {
								$isError = "Authentication failed ! :(";
							}
						}
						else {
							$isError = "Authentication failed ! :(";
						}

                    } else {
                        $isError = "Wrong Username OR Password ! :(";
                    }

                }
            }

        } else {
            $isError = "Enter Username and Password !";
        }

    } // end of form validation

    
} // end of post req handle
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Login | Oculus-VIT</title>
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

	<script>
		function subStud(){

			document.getElementById("studentLogin").submit();
		}
		function subFac(){
			document.getElementById("loginFac").submit();
		}
	</script>

</head>

<body style="background-color: #999999;">

	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('login_res/images/bg-03git .jpg');">
			</div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">

				<form id="studentLogin" name="studentForm" class="login100-form validate-form" autocomplete="off" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
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
					<input type="hidden" name="action" value="login">

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit" onclick="subStud()">
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

							<br><br><br><br><br>

						<a href="#" class="dis-block txt3 hov1 p-r-30 p-t-30 p-b-10 p-l-10" data-toggle="modal" data-target="#facultyModal">
							Faculty Login
							<i class="fa fa-long-arrow-right m-l-5"></i>
						</a>

					</div>

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
				<form id="loginFac" name="facLogin" class="login100-form validate-form" method="POST" autocomplete="off" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
					<div class="modal-body">
						<div class="container">
							
								<div class="wrap-input100 validate-input" data-validate="Username is required">
									Username:<br> 
									<input name="fac_id" type="text" class="input100" placeholder="Username">
									<span class="focus-input100"></span>
								</div>
								<input type="hidden" name="action" value="facultea">
								<div class="wrap-input100 validate-input" data-validate="Password is required">
									Password:<br> 
									<input name="fac_pass" type="password" class="input100" placeholder="********">
									<span class="focus-input100"></span>
								</div>
							
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
							<button class="login100-form-btn" type="submit" onclick="subFac()">
								Login
							</button>
						</div>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
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