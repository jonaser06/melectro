<?php
$distribucion=$_POST["distribucion"];
switch($distribucion){
    case 'Exponencial':
    header('location: ../vistas/exponencial.html');
    break;

    case 'Uniforme':
    header('location: ../vistas/uniforme.html');
    break;

    case 'Triangular':
    header('location: ../vistas/triangular.html');
    break;
}
?>