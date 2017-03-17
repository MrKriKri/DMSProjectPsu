<?php
$host = "localhost";
$username ="root";
$password = "";
$objCon=mysqli_connect($host,$username,$password,"dms_login");
date_default_timezone_set("Asia/Bangkok");
$sqlRecord ="SELECT `SugarBloodRate`,`DateRec`,`TimeRec` FROM `recorder` WHERE `DateRec` BETWEEN '".$_GET["Begin"]."' AND '".$_GET["End"]."'";
$objResult=mysqli_query($objCon,$sqlRecord);

$response = array();
while($Data=mysqli_fetch_assoc($objResult)){
	
	$response[] = $Data;
	//echo $response["ID"];
	//echo json_encode($response);
}

echo json_encode($response);
?>