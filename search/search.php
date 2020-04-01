<?php
$search_value=$_POST["search"];
require_once '/database/connect.php';
if($con->connect_error){
    echo 'Connection Failed: '.$con->connect_error;
    }else{
        $sql="select * from information where First_Name like '%$search_value%'";

        $res=$con->query($sql);

        while($row=$res->fetch_assoc()){
            echo 'First_name:  '.$row["First_Name"];
            }       
        }
?>
