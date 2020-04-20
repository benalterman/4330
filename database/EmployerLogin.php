<?php
/*Sets up database connection*/
require_once "connect.php";

if(isset($_POST['admnlogin'])) {
    /*Creates connection obect*/
    
    /*Creates variables for the values input in the formin EmployerLogin.html*/
    $username = $_POST['user_id'];
    $password = $_POST['user_pass'];
    
    /*Checks if either field is empty*/
    if(empty($username) || empty($password)) {
        header("Location: ../EmployerLogin.html?error=EmptyFields&user_id=".$username);
        exit();
    }
    else{
        
        /*Checks if $username exists either as an ID Number or Email*/
        $sql = "SELECT * FROM Employee WHERE employee_id=$username OR emp_email=$username";
        $stmt = mysqli_stmt_init($link);
        if(!mysqli_stmt_prepare($stmt, $sql)) {
            header("Location: ../EmployerLogin.html?error=NoSuchUser");
            exit();
        }
        else{
            
            /*Checks if password matches stored password for username*/
            mysqli_stmt_bind_param($stmt, "ss", $username, $username);
            mysqli_execute($stmt);
            $result = mysqli_fetch_assoc($result);
            if($row = mysqli_fetch_assoc($result)) {
                $passcheck = password_verify($password, $row['password']);
                if($passcheck == false) {
                    header("Location: ../EmployerLogin.html?error=IncorrectPass");
                    exit();
                }
                else {
                    
                    /*Starts session and creates session variables for the user to use while logged into the website*/
                    session_start();
                    $_SESSION['ID_Number']=$row['applicants_id'];
                    $_SESSION['User_Email']=$row['email'];
                    header("Location: /employerIndex.php");
                }
            }
        }
    }
}

else{
    header("Location: /EmployerLogin.html");
    exit();
}
?>