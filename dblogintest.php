<?php
$conn = mysqli_connect("localhost", "devansh", "some_pass", "logintest");
if(!$conn){
  die("connection_aborted:".mysqli_connect_error());
}
