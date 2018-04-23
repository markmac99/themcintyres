<?
# Wake on LAN - (c) HotKey@spr.at, upgraded by Murzik
# Modified by Allan Barizo http://www.hackernotcracker.com
flush();
function WakeOnLan($addr, $mac,$socket_number) {
  $addr_byte = explode(':', $mac);
  $hw_addr = '';
  for ($a=0; $a <6; $a++) $hw_addr .= chr(hexdec($addr_byte[$a]));
  $msg = chr(255).chr(255).chr(255).chr(255).chr(255).chr(255);
  for ($a = 1; $a <= 16; $a++) $msg .= $hw_addr;
  // send it to the broadcast address using UDP
  // SQL_BROADCAST option isn't help!!
  $s = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
  if ($s == false) {
	echo "Error creating socket!\n";
	echo "Error code is '".socket_last_error($s)."' - " . socket_strerror(socket_last_error($s));
	return FALSE;
	}
  else {
	// setting a broadcast option to socket:
	$opt_ret = socket_set_option($s, 1, 6, TRUE);
	if($opt_ret <0) {
	  echo "setsockopt() failed, error: " . strerror($opt_ret) . "\n";
	  return FALSE;
	  }
	if(socket_sendto($s, $msg, strlen($msg), 0, $addr, $socket_number)) {
	  echo "Magic Packet sent successfully to Mark's PC.";
	  socket_close($s);
	  return TRUE;
	  }
	else {
	  echo "Magic packet failed!";
	  return FALSE;
	  }
	}
  }
// Port number where the computer is listening. Usually, any number between 1-50000 will do. Normally people choose 7 or 9.
$socket_number = "7";
// MAC Address of the listening computer's network device
$mac_addy = "00:11:09:94:54:8A";
// IP address of the listening computer. Input the domain name if you are using a hostname (like when under Dynamic DNS/IP)
//$ip_addy = gethostbyname("thegamer");
$ip_addy = "192.168.123.255";
//exec("ifconfig | grep Bcast | cut -d\":\" -f 3 | cut -d \" \" -f 1", $ip_addy);

WakeOnLan($ip_addy, $mac_addy,$socket_number)
?>
