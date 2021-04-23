<?php
  $conn=mysqli_connect("localhost","devansh","some_pass","PACKETS");
  if(!$conn)
  {
    die("connection_aborted".mysqli_connect_error());
  }
 ?>
