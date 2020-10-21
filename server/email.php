<?php

use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

// Load Composer's autoloader
require 'mailer/vendor/autoload.php';

function send_otp($toemail,$otp)
{
// Instantiation and passing `true` enables exceptions
    $mail = new PHPMailer(true);

//Read Auth:

    $arr = explode(",", file_get_contents("./emailAuth.txt"));

    $email = trim($arr[0]);
    $passwd = trim($arr[1]);

    if (empty($email) || empty($passwd)) {
        die("Setup ./emailAuth.txt properly with email,password as data!");
    }

    try {
        //Server settings
        $mail->SMTPDebug = 0; // Enable verbose debug output
        $mail->isSMTP(); // Send using SMTP

        $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through

        $mail->SMTPAuth = true; // Enable SMTP authentication

        $mail->Username = $email; // SMTP username
        $mail->Password = $passwd; // SMTP password

        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
        $mail->Port = 587; // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above

        //Recipients
        $mail->setFrom($email, 'Admin - OculusVIT');
        $mail->addAddress("".$toemail); // Add a recipient

        // Content
        $mail->isHTML(true); // Set email format to HTML
        $mail->Subject = 'Password Reset OTP';
        $mail->Body = ' <h3> Your password reset OTP:</h3> <h1>'.$otp.'</h1><br>Validity is for 2 Minutes<br><br>Admin - OculusVIT';

        $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

        $mail->send();
        //echo 'Message has been sent';
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP MAILER</title>
</head>
<body>

</body>
</html>
