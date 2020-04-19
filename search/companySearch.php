<?php
  require_once '../database/connect.php';

  if (!isset($_POST['/search/companySearch']))
    header("Location: /search/companySearch");

  // create the connection object
  $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
  $_POST['/search/companySearch'] = mysqli_real_escape_string($conn, $_POST['/search/companySearch']);
  $search_sql = "SELECT * FROM `Company` WHERE `id_number` LIKE '%" . $_POST['/search/companySearch'] . "%' OR `description` LIKE '%".$_POST['/search/companySearch']."%'";
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
