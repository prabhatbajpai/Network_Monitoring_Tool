<?php
	session_start();
	?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body bgcolor ="black">
<?php
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
		echo '<font color ="cyan" size ="18"><h1><center><B>Packet Analyzer</b></center></h1></font>
		<p><font color = "blue" size ="6">A packet analyzer (also known as a network analyzer, protocol analyzer or packet sniffer—or, for particular types of networks, an Ethernet sniffer or wireless sniffer) is a computer program or piece
		of computer hardware that can intercept and log traffic that passes over a digital network or part of a network.[1] As data streams flow across the network, the sniffer captures each packet and, if
		needed, decodes the raw data of packet , showing the values of various fields in the packet, and analyzes its content according to the appropriate RFC or other specifications.
		Packet capture is the process of intercepting and logging traffic.<br>
		</p>';
	}
	else {
		echo '<p><font color = "red" size ="6">You are not logged in!!!</p>';
		echo '<font color ="cyan" size ="18"><h1><center><B>Packet Analyzer</b></center></h1></font>
		<p><font color = "blue" size ="6">A packet analyzer (also known as a network analyzer, protocol analyzer or packet sniffer—or, for particular types of networks, an Ethernet sniffer or wireless sniffer) is a computer program or piece
		of computer hardware that can intercept and log traffic that passes over a digital network or part of a network.[1] As data streams flow across the network, the sniffer captures each packet and, if
		needed, decodes the raw data of packet , showing the values of various fields in the packet, and analyzes its content according to the appropriate RFC or other specifications.
		Packet capture is the process of intercepting and logging traffic.<br>
		</p>
		<center></font>
		<br>
		<br>
		<form action="login.php" method="POST">
		<fieldset style ="width:5%;">
			<h3><font color ="cyan" size="6" ><center><B>LOG IN</b></center></h3></font>
			  <input type="text" name="uid" placeholder="Username"><br>
		        <input type="password" name="pwd" placeholder="password"><br>
		        <button type="Submit">Submit</button>
		</fieldset>
		</form>

		<br>
		<br>

		<form action="signup.php" method="POST" >
		<fieldset style ="width:5%;">
			<h3><font color ="cyan" size="6" ><center><B>SIGN UP</b></center></h3></font>
			<input type="text" name="first" placeholder="Firstname"><br>
			<input type="text" name="last" placeholder="Lastname"><br>
			<input type="text" name="uid" placeholder="Username"><br>
			<input type="password" name="pwd" placeholder="password"><br>
			<button type="Submit">Submit</button>
		</fieldset>
		</form>
		</center>';
	}
 ?>


</body>
</html>
