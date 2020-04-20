<?php
  require_once '../database/connect.php';

  if (!isset($_POST['/search/applicantSearch']))
    header("Location: ../search/applicantSearch?error=IncorrectPass");

  // create the connection object
  $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
  $_POST['/search/applicantSearch'] = mysqli_real_escape_string($conn, $_POST['/search/applicantSearch']);
  $search_sql = "SELECT * FROM `Job Opening` WHERE `applicants_id` LIKE '%" . $_POST['/search/applicantSearch'] . "%' OR `description` LIKE '%".$_POST['/search/applicantSearch']."%'";
  $result = mysqli_query($conn, $search_sql);
  if(mysqli_num_rows($result) > 0) {    
    $search_rs = mysqli_fetch_assoc($result);
  }

  ?>
  <p>Search Results</p>
  <?php
  if (mysqli_num_rows($result) > 0) {
    do { ?>
      <p><?php echo $search_rs['name']; ?></p>
  <?php
    } while (false != ($search_rs = mysqli_fetch_assoc($result)));
  }
  else
    echo "No results found";
?>
