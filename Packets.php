<?php
  include 'dbPackets.php';
  include 'common.php';
  session_start();
?>
<html>
  <head>
    <title>Network Analyzer</title>
  </head>
  <body bgcolor="black">
     <font color ="cyan" size ="18"><h1><center><B>Packet Details</b></center></h1></font>

    </p>
    <br>
    <center>

    <form>
      <fieldset style="width: 5%; ">
        <h3><font color ="cyan" size="6" ><center><B>Packet Type</b></center></h3></font>
      <input type="text" name="packettype" placeholder="protocol Type IP/UDP/ARP" style='width: 290px; font-size:24px;'><br>
      <select name ="Field" style='width: 200px; font-size:24px;'>
        <option>All</option>
        <option>SourceMac</option>
        <option>DestMac</option>
        <option>SourceIP</option>
        <option>DestIP</option>
        <option>SourcePort</option>
        <option>DestPort</option>
        <option>TimeStamp</option>
        <option>PacketLength</option>
      </select>
      </fieldset>
      <button type="submit" value="submit" name="submit" style='width: 200px; font-size:24px;'>submit</button>

    </form>
    <font color = "blue" size ="6">

  <?php
    if(isset($_GET['submit']))
    {
      $protocol=$_GET['packettype'];
      $field=$_GET['Field'];
      $sql="SELECT * FROM PACKETS.".$protocol;
      $result=$conn->query($sql);
      echo '<font color ="cyan" size ="18"><h3><center><B>'.$protocol.'</b></center></h3></font>';
      echo "<center><table border='4'font-size: 24px; style='color: blue;'>";
      switch ($field) {
        case "All":
          $i = 0;
          while($row=$result->fetch_assoc()){
            if ($i == 0) {
            $i++;
            echo "<tr style='font-size: 34px;'>";
            foreach ($row as $key => $value) {
              echo "<th>" . $key . "</th>";
            }
          }
            echo "</tr>";
            echo "<tr style='font-size: 34px;'>";
            foreach ($row as $value) {
              echo "<td>" . $value . "</td>";
            }
            echo "</tr>";
          }
          break;
        default:
        echo "<center>";
          echo "<tr style='font-size: 34px;'><th>".$field."</th></tr>";
          while($row=$result->fetch_assoc()){
            echo "<tr style='font-size: 34px;'><td>".$row[$field]."</td></tr>";
          }
          break;
      echo "</table>";
      echo "</center>";
      }

    }
?>
  </body>
</html>
