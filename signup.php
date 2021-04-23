<?php
include 'dblogintest.php';
$Firstname=$_POST['first'];
$Lastname=$_POST['last'];
$username=$_POST['uid'];
$password=$_POST['pwd'];


$sql="INSERT INTO user (first, last, uid, pwd) VALUES ('$Firstname','$Lastname','$username','$password')";
$result=$conn->query($sql);
header("Location: home.php");
?>
