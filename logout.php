<?php
session_start();
session_destroy();
shell_exec("rm /var/www/html/packetfiles/*;");
shell_exec('mysql -e "
DROP database if exists PACKETS"');
header("Location: home.php");
?>
