<?php
    require_once 'connect.php';
    
    $name = $_REQUEST['name'];
    $description = $_REQUEST['description'];
    $address = $_REQUEST['address'];
    $association = $_REQUEST['association'];
    
    $sql = "INSERT INTO `Company` (`company_id`, `name`, `description`, `address`, `association`) VALUES ";
    $sql .= "(NULL, '" . $name . "', ";
    $sql .= "'" . $description . "', ";
    $sql .= "'" . $address . "', ";
    $sql .= "'" . $association . "')"
    
    //print $sql
    if(mysqli_query($link, $sql)){
        print("Stored");
        print($sql);
    }
    else{
        print("Failed");
        print($sql);
    }
    
    echo "<script>location.href='companyManagement.php'</script>";
?>