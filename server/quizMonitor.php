<?php
    require_once "mysqlConfig.php";
    error_reporting(E_ALL ^ E_WARNING);

    $quizname = "QuizName";
    if(!isset($_GET["eid"])){
        header("location: dashboard.php?q=6");
    }
    
    
    $rs = mysqli_query($sql_api , 'SELECT title FROM quiz WHERE eid="'. $_GET['eid'] . '"' );
    if(mysqli_num_rows($rs) > 0){
        $ro = mysqli_fetch_array($rs);
        $quizname = $ro[0];
        
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Monitoring | Oculus</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script type = "text/JavaScript">
         <!--
            function callAjax() {
               //setTimeout("location.reload(true);", t);
                var xhttp;
                <?php echo "var eid = \"".$_GET['eid']."\";"; ?>
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("tabody").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "getViolationTable.php?eid="+eid+"&uniq="+Math.random(), true);
                console.log("req sent");
                xhttp.send();
                setTimeout(callAjax,2000);
            }
            
         //-->
      </script>
</head>

<body onload = "callAjax();">
    <nav class="navbar navbar-dark bg-dark">
        
        <a class="navbar-brand" href="">Oculus-VIT</a>
    </nav>
    <a class="badge badge-secondary" style="font-size: 14pt; margin:10px" href="dashboard.php?q=6">Dashboard</a>
    <br><br>
    
    <div class="p-3">

        <h2>Monitoring Quiz : <?php echo $quizname;?></h2>    
        <hr>
        <br>

        <table class="table table-dark table-striped table-bordered" style="width: 85%;">
            
            <thead class = "thead-dark">
                <tr>
                    <th>Violation Number</th>
                    <th>Username of Student</th>
                    <th>Time of Violation (YYYY-MM-DD HR:MIN:SEC)</th>
                </tr>
            </thead>

            <tbody id="tabody">

            <!-- <tr class="bg-danger">
                    <td>2</td>
                    <td>[2] aadars </td>
                    <td>11:04:13 10-22-2020</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>aadars</td>
                    <td>11:04:13 10-22-2020</td>
                </tr> -->

            </tbody>
        </table>

    </div>
</body>
</html>