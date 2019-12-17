<?php
error_reporting("~EAL^Deprecated");
$db = mysqli_connect("localhost","root","","elesson");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}
?>