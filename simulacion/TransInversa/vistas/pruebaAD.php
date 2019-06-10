<?php
$dist=$_POST["dist"];
switch ($dist) {
	case '0':
		require_once("../controlador/pruebaNormal.php");
		break;
	case '1':
		require_once("../controlador/pruebaExponencial.php");
		break;
	case '2':
		require_once("../controlador/pruebaWeibull.php");
		break;
	case '3':
		require_once("../controlador/pruebaLogistica.php");
		break;
	default:
		echo "No se encontro dicha prueba";
		break;
}

?>