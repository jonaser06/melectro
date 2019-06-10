<?php
//require_once("../vistas/pAndersonDarling.php");
$alfa=["1.070","1.326","1.587","1.943"];
$aceptacion=$_POST["aceptacion"];
//$dist=$_POST["dist"];
//var_dump($aceptacion);
//var_dump($dist);
$valores=$_POST["valores"];
$n=count($valores);
$promedio=array_sum($valores)/$n;
//echo $promedio."<br>";
$desEstand=0;
$lamda = 1/$promedio;
/*
for ($i=0; $i < $n; $i++) { 
	$desEstand=pow($valores[$i]-$promedio,2)+$desEstand;
	//echo $desEstand."<br>";
}
$desEstand=sqrt($desEstand/($n-1));
//echo $desEstand."<br>";
*/
for ($i=0; $i < $n; $i++) { 
	sort($valores);
	$var=($lamda*exp(-$lamda*$valores[$i]));
	$PEA[$i]=$var;
}
/*
for ($a=0; $a < $n; $a++) {
	$x=0;
	for ($b=0; $b <= $a; $b++) { 
		$x+=$PEA[$b];
	}
	$PEA1[$a]=$x;
}*/
for ($i=0; $i < $n; $i++) { 
	rsort($valores);
	$var=($lamda*exp(-$lamda*$valores[$i]));
	$PEAY[$i]=$var;
}
/*
for ($a=0; $a < $n; $a++) {
	$x=0;
	for ($b=0; $b <= $a; $b++) { 
		$x+=$PEAY[$b];
	}
	$PEA2[$a]=$x;
}*/
for ($i=0; $i < $n; $i++) {
	$var=((2*($i+1)-1)*(log($PEA[$i])+log(1-$PEAY[$i])));
	$Total[$i]=$var;
}
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style>
		table,td,th{
			border: 1px solid black;
		}
		table{
			border-collapse: collapse;
			width: 350px;
		}
		th {
			height: 100px;
		}
	</style>
</head>
<body>
	<table border="1">
		<tr>
			<td>#</td>
			<td>(2n-1)</td>
			<td>Yi</td>
			<td>PEA(Yi)</td>
			<td>ln(PEA(Yi))</td>
			<td>Yn+1-i</td>
			<td>PEA(Yn+1-i)</td>
			<td>ln(1-PEA(Yn+1-i))</td>
			<td>Total</td>
		</tr>
		<?php for ($i=0; $i < $n; $i++) { ?>
		<tr>
			<td><?php $col1=($i+1) ;echo $col1; ?></td>
			<td><?php $col2=(2*$col1-1) ;echo $col2; ?></td>
			<td><?php sort($valores) ;echo $valores[$i]; ?></td>
			<td><?php echo $PEA[$i];?></td>
			<td><?php echo log($PEA[$i]); ?></td>
			<td><?php rsort($valores) ;echo $valores[$i]; ?></td>
			<td><?php echo $PEAY[$i];?></td>
			<td><?php echo log(1-$PEAY[$i]);?></td>
			<td><?php echo $Total[$i];?></td>
		</tr>
	<?php } ; ?>
	</table>
	<br>
	<?php 
	$sum=-((array_sum($Total)/$n)+$n);
	if($n>=30){
		$sum=$sum*(1+3/(5*$n));
	}
	$resul = " se rechaza la hipotesis, los datos no tienden a una distribucion exponencial";
	if($sum<=$alfa[$aceptacion]){
		$resul = " se acepta la hipotesis, los datos tienden a una distribucion exponencial";
	}
	echo "El estadistico es ".$sum. ", en conclusion:".$resul." ".$alfa[$aceptacion];
	?>
</body>
</html>