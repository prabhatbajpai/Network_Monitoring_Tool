<?php
session_start();
include 'common.php';
echo shell_exec("sh /var/www/html/networkanalyzer/networkanalyzer.sh");
header("Location: home.php");
 ?>
