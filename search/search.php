<?php
  require_once '../database/connect.php';

  if (!isset($_POST['search']))
    header("Location: ads.index.php");

  // create the connection object
  $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
  // Don't forget to sanitize your user queries.
  // Here $conn is the connection object I assume. Replace it with yours.
  $_POST['search'] = mysqli_real_escape_string($conn, $_POST['search']);
  $search_sql = "SELECT * FROM `Company` WHERE `id_number` LIKE '%" . $_POST['search'] . "%' OR `description` LIKE '%".$_POST['search']."%'";
  // change the result here.
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
    // Kindly note, how false and assignment is used here.
    } while (false != ($search_rs = mysqli_fetch_assoc($result)));
  }
  else
    echo "No results found";
?>