<?php
require_once "../vistas/triangular.html";
$a=$_POST['a'];
$b=$_POST['b'];
$c=$_POST['c'];
$x=($c-$a)/($b-$a);
$cantidad=$_POST['cantidad'];
?>
<h3>Numeros Generados</h3><br><br>
<?php
for($i=0; $i<$cantidad; $i++){
    $rnd1 = rand(10,99)/100;
    $rnd2 = rand(10,99)/100;
    if($rnd1<$x){
        $num=$a+($c-$a)*sqrt($rnd2);
    }
    else{
        $num=$b+($b-$c)*sqrt(1-$rnd2);
    }
    $num=number_format($num,2,".",",");?>
<html>
<link rel="stylesheet" href="../css/estilo.css">
<table style="margin:auto; text-align:centre;">
<tr>
<td><?php echo "$num";?></td>
</tr>
</table>
</html>
<?php
$valores[$i]=$num;
}
?>


foreach($valores as $e){
    echo "$e..";}