
<?php
	session_start();
include 'dblogintest.php';
?>
<html>
<head>
	<title>Wrong password</title>
</head>
<body bgcolor="black">
<?php
$uid = $_POST['uid'];
$pwd = $_POST['pwd'];

$sql = "SELECT * FROM user WHERE uid = '$uid' AND pwd = '$pwd'";
$result = $conn->query($sql);
if(!$row = $result->fetch_assoc()){
	echo "<font color= 'red' size = 8>your username or id is incorrect</font>";

}
else{
	echo "You are logged in!";
	$_SESSION['id']=$row['id'];
	echo shell_exec("sh /var/www/html/networkanalyzer.sh");
	header("Location: home.php");
}
