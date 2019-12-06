<?php
include "configurasi/koneksi.php";

$sql = mysqli_query($db,"SELECT * FROM siswa
                   WHERE email = '$_POST[email]'");
$ketemu = mysqli_num_rows($sql);

echo $ketemu;
?>
