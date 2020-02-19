<?php 

$connection = mysql_connect("localhost","root","");

mysql_select_db("blog1")or die(mysql_error());

$safe_value = mysql_real_escape_string($_POST['search']);

$result = mysql_query("SELECT username FROM member WHERE `username` LIKE %$safe_value%");
while ($row = mysql_fetch_assoc($result)) {
    echo "<div id='link' onClick='addText(\"".$row['username']."\");'>" . $row['username'] . "</div>";  
}
?>