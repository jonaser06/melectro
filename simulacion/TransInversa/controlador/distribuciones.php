<?php 
$id = $_POST['distribucion'];
switch ($id) {
	case '0':
		header('location: ../vistas/distNormal.php');
		break;
	case '1':
		header('location: ../vistas/distExponencial.php');
		break;
	case '2':
		header('location: ../vistas/distTriangular.php');
		break;
	case '3':
		header('location: ../vistas/pAndersonDarling.php');
		break;
	
	default:
		echo "Error, no se envio na";
		break;
}
?>