<?php
require_once "../vistas/uniforme.html";
$a=$_POST['a'];
$b=$_POST['b'];
$cantidad=$_POST['cantidad'];
?>
<h3>Numeros Generados</h3><br><br>
<?php
for($i=0; $i<$cantidad; $i++){
$rnd = rand(10,99)/100;    
$num= $a+$rnd*($b-$a);
$num=number_format($num,2,".",",");
?>
<html>
<head>
<link rel="stylesheet" href="../css/estilo.css">
</head>
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