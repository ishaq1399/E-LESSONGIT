<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include "configurasi/koneksi.php";
if (!empty($_POST['nis']) AND !empty($_POST['email'])){
    $tgl_lahir = $_POST[thn_lahir].'-'.$_POST[bln_lahir].'-'.$_POST[tgl_lahir];
    mysqli_query($db,"INSERT INTO registrasi_siswa(nis,nama_lengkap,username_login,password_login,id_kelas,alamat,tempat_lahir,tgl_lahir,jenis_kelamin,agama,nama_ayah,
                                              nama_ibu,th_masuk,email)
                             VALUES ('$_POST[nis]','$_POST[nama]','$_POST[nis]','$_POST[nis]','$_POST[kelas]','$_POST[alamat]',
                                     '$_POST[tempat_lahir]','$tgl_lahir','$_POST[jk]','$_POST[agama]','$_POST[nama_ayah]',
                                     '$_POST[nama_ibu]','$_POST[thn_masuk]','$_POST[email]')");
    echo "<script>window.alert('Terimakasih telah mendaftarkan diri anda, Login Gunakan Username dan Password sesuai NIS');
            window.location=(href='index.php')</script>";
}else{
    header('location:index.php');
}
?>
