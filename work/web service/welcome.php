
<?php
$host = "localhost";
$username ="root";
$password = "";
$objCon=mysqli_connect($host,$username,$password,"dms_login");
$sql = "SELECT * FROM `patient` WHERE `E-mail` = '".$_GET["name"]."' AND `Password` = '".$_GET["age"]."';";
$objData = mysqli_query($objCon,$sql);
//echo $sql;
$response = array();

while($Data=mysqli_fetch_assoc($objData)){
	
	$response[] = $Data;
	//echo $response["ID"];
	echo json_encode($response);
}

?>


