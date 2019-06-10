<?php
require_once "../vistas/exponencial.html";
$lambda=$_POST['lambda'];
$cantidad=$_POST['cantidad'];
?>
<h3>Numeros Generados</h3><br><br>
<?php
//echo "Lambda es: $lambda y la cantidad es $cantidad";
for($i=0; $i<$cantidad; $i++){
$rnd = rand(10,99)/100;
$num=-(1/$lambda)*log(1-$rnd);
$num=number_format($num,2,".",",");
?>
<html>
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

