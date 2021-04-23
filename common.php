<?php
session_start();
if(isset($_SESSION['id'])){
  echo '<p><font color = "green" size ="6">logged in!!!</p><header>
    <nav>
      <ul>
        <li><a href="home.php">Home</a></li>
        <li><a href="Packets.php">Packet Details</a></li>
        <li><a href="Packetcapture.php">Refresh Database</a></li>
        <li><a href="logout.php">Logout</a></li>
      </ul>
    </nav>
  </header>';
}
else {
  header("Location: home.php");
}
