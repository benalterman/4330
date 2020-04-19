<?php
/*Set up a database connection*/
require_once '../database/connect.php';

if(isset($_POST['login'])) {
    /*Create connection object*/
    $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);

    /*Creates variables for the values input in the form in Login.html*/
    $username = $_POST['user_id'];
    $password = $_POST['user_num'];

    /*Checks if either field is empty*/
    if(empty($username) || empty($password)){
        header("Location: ../Login.html?error=EmptyFields&user_id=".$username);
        exit();
    }
    else{
        
        /*Checks if $username exists either as an ID Number or Email*/
        $sql = "SELECT * FROM Applicants WHERE applicants_id=? OR email=?;";
        $stmt = mysqli_stmt_init($conn);
        if(!mysql_stmt_prepare($stmt, $sql)){
            header("Location: ../Login.html?error=NoSuchUser");
            exit();
        }
        else{
            
            /*Checks if password matches stored password for username*/
            mysqli_stmt_bind_param($stmt, "ss", $username, $username);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            if($row = mysqli_fetch_assoc($result)) {
                $passcheck = password_verify($password, $row['password']);
                if($passcheck == false) {
                    header("Location: ../Login.html?error=IncorrectPass");
                    exit();
                }
                else {
                    
                    /*Starts session and creates session variables for the user to use while logged into the website*/
                    session_start();
                    $_SESSION['ID_Number']=$row['applicants_id'];
                    $_SESSION['User_Email']=$row['email'];
                    header("Location: ../homepage/homepage.html")
                }
            }
        }
    }
}

else{
    header("Location: ../Login.html");
    exit();
}
?>