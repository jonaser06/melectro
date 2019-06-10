<?php
$nivel= $_POST["aceptacion"];
$valores = $_POST["valores"];
$cantidad = count($valores);
$m = ceil(sqrt($cantidad));
$max = max($valores);
$min = min($valores);
$rango = ($max-$min)/$m;
echo $m.'<br>';
echo ($max-$min).'<br>';
echo $rango;


?>