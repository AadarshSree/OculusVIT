# OculusVIT 😄


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

OculusVIT is an innovative malpractice free quiz examination platform which uses real time face tracking to monitor the examinee. 💯
***
[![OculusVIT Demo Video](https://i.insider.com/59a59a8d79bbfd1d008b601a?width=200&format=png)](https://www.youtube.com/watch?v=RKykzOK43ZI)
# Installation Instructions

- Install [XAMPP](https://www.apachefriends.org/index.html)

 - Clone this repository into your htdocs folder under your XAMPP installation 
  ```sh
  $ git clone https://github.com/AadarshSree/OculusVIT.git
  ```
 - Or download the zip file of this project from https://github.com/AadarshSree/OculusVIT/archive/master.zip and copy paste the extracted content into your htdocs folder
 
 - Open XAMPP control panel, start apache and mysql services. Then, click the admin button next to mysql to open the phpmyadmin page for configuring the database.
 
 - In phpmyadmin, make a database called **oculusvit** and import the tables and data from the sql dump file present in ./server/db_files/oculusvit.sql
 
 - To configure the mail service for password reset OTP's, make a text file called **emailAuth.txt** in ./server/ . Now go to Manage Your Google Account -> Security -> ENABLE Less secure app access. Now open the ./server/emailAuth.txt file and enter your gmail email and password as follows : email,password. Example as follows:
    `myemail@gmail.com , mypassword`
    *To use any other email client, change the SMTP server settings in .server/email.php*
 - The application is ready for use now. To view the existing login information, view the tables *students* & *faculties* in phpmyadmin.
 - Now go to : <http://localhost/oculusVIT/server/Login.php> to begin using the application.
 
## Usage Guide

##### Setting up a New Account, Signing In and Password Reset:

1.	Click on “New?  Sign Up Now” and enter the required details and click submit
2.	Click on “Login” for Student Login with the new credentials and on “Faculty Login” for Faculty Login
3.	If you are a returning user and forgot your password, click on “Forgot Password?  Reset Password Now!” and enter your credentials. Proceed to enter the OTP sent to your email and then set a new password. Then Login again.

##### Webcam Compatibility:
You can use the compatibility page to test whether your environment is suitable for an Online Test and accurate face detection.
##### Student Portal:
1.	At the “Home” page you can find the enabled quizzes. Click on them to attend.
    a)	Enable webcam access.
    b)	Click on Lock to finalize your answer and reset to clear the answer.
    c)	Click on Submit and type “Yes” to confirm.
2.	You can view your test history at “My History” page
3.	“Leaderboard” displays the sorted order of test takers by their score.

##### Faculty Portal:
1.	In the “Home” page, you can enable or disable existing quizzes.
2.	In the “Users” page, you can view the students who are registered to the portal and is permitted to attempt the quiz.
3.	“Leaderboard” displays the sorted order of test takers by their score.
4.	“Add Quiz” page enables the faculties to set up the quiz.
a)	Under the “Enter Quiz Details”, specify the quiz title, the number of questions, marks awarded upon each right and wrong answer and the time limit. “Click Submit”.
b)	Then proceed to enter the Questions and their correct answer and Click Submit
c)	Go back to “Home” and enable the Quiz.
5.	In the “Remove Quiz” page, you can delete quizzes after their completion.

In the “Monitor Quiz” page, each violation can be monitored by faculty after selecting the Quiz that is being attempted and the student can be identified by their unique registration number and username. Each violation is marked by their number along with their time stamp.  


***




License
----

MIT


**Free Software for use and redistribution**
