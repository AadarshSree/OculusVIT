<?php
    require_once "mysqlConfig.php";

    if(isset($_GET['eid'])){

        $qry = 'SELECT * from violations WHERE eid = "'.$_GET['eid'].'" ORDER by time DESC';
        $rs = mysqli_query($sql_api,$qry);

        if(mysqli_num_rows($rs) == 1){

            $row = mysqli_fetch_array($rs);

            echo "<tr>
                <td>1</td>
                <td>".$row['username']."</td>
                <td>".$row['time']."</td>
                </tr>";

        }
        else if (mysqli_num_rows($rs) > 1){

            $row = mysqli_fetch_array($rs);
            $cc = mysqli_num_rows($rs);

            echo "<tr class='bg-danger'>
                <td>$cc</td>
                <td>".$row['username']."</td>
                <td>".$row['time']."</td>
                </tr>";
                $cc--;
            while($row = mysqli_fetch_array($rs)){

                echo "<tr>
                <td>".$cc--."</td>
                <td>".$row['username']."</td>
                <td>".$row['time']."</td>
                </tr>";

            }

        }

    }
?>