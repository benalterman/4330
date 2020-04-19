<?php
require_once '../database/connect.php';
if(isset($_POST['signupbtn'])) {
    $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $email = $_POST['email'];
    $username = $_POST['username'];
    $name = $_POST['name'];
    $password = $_POST['userPass'];
    $confirm_password = $_POST['cnfrmPass'];
    
    if(empty($username) || empty($email) || empty($name) || empty($password) || empty($confirm_password)) {
        header("Location: ../signup.html?error=EmptyFields&username=".$username."&name=".$name."&email=".$email);
        exit();
    }
    else if(!filter_val($username, FILTER_VALIDATE_EMAIL)) {
        header("Location: ../signup.html?error=InvalidEmail");
        exit();
    }
    else if(!preg_match("/^[a-zA-Z0-9]*$/", $username)) {
        header("Location: ../signup.html?error=InvalidEmail&fName=".$first_name."&lName=".$last_name);
        exit();
    }
    else if($password !== $confirm_password) {
        header("Location: ../signup.html?error=EmptyFields&email=".$username."&fName=".$first_name."&lName=".$last_name);
        exit();
    }
    else {
        $sql = "SELECT username FROM Employee WHERE username=? AND password=?";
        $stmt = mysqli_stmt_init($conn);
        if(!mysqli_stmt_prepare($stmt, $sql)) {
            header("Location: ../signup.html?error=sqlerr");
            exit();
        }
        else {
            mysqli_stmt_bind_param($stmt, "ss", $username, $password);
            mysqli_stmt_execute($stmt);
        }
        
    }
}
?>