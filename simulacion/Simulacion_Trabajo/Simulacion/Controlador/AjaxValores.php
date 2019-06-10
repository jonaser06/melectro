<?php
/**
 * Created by PhpStorm.
 * User: Deli Peralta
 * Date: 8/06/2019
 * Time: 01:20
 */
require_once("../Modelo/Alg.php");
$objalg = new Alg();
//
//$r = $objalg->listandovaribles($_POST['tipo']);
//


    //$r = $objalg->listandovaribles($_POST['tipo']);

$r = $objalg->listandovaribles(3);
//    foreach ($r as $item){
//        $ar = $item['nombre'];
//    }

echo json_encode($r);

//------------------------------------------------------------------------------------------------------------------