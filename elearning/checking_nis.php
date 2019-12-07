<?php
include "configurasi/koneksi.php";

$sql = mysqli_query($db,"SELECT * FROM siswa
                   WHERE nis = '$_POST[nis]'");
$ketemu = mysqli_num_rows($sql);

echo $ketemu;
?>
