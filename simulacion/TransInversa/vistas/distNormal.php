<?php
$operacion = false;
if(isset($_POST['submit'])){
	$operacion = true;
	$numMenor=$_POST["numMenor"];
	$numMayor=$_POST["numMayor"];
	$cant=$_POST["cant"];
	$i=0;
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
	<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method=post>
		<h1>"Distribucion Normal"</h1>
		<label for="numMenor">Ingrese un numero menor</label><br>
		<input type="number" name="numMenor" minlength="1" id="numMenor" placeholder="numero menor" required><br>
		<label for=numMayor>Ingrese un numero mayor</label><br>
		<input type="number" name="numMayor" minlength="1" id="numMayor" placeholder="numeromayor" required><br>
		<label for=cant>Ingrese una cantidad de valores</label><br>
		<input type="numer" name="cant" minlength="1" id="cant" placeholder="cantidad de valores" required><br>
		<input type="submit" name="submit" value="Generar valores">
	</form>
	<?php
	if($operacion==true){
		?>
		<br>
		<h4>Valores aleatorios continuos</h4>
		<table>
			<tr>
				<td>#</td>
				<td>Numeros aleatorios</td>
			</tr>
			<?php
			$semilla = 13;
			$g = 3;
			$a = 26;
			$b = 27;
			$c = 27;
				for ($i=1; $i <= $cant ; $i++) {
			$res =($a * pow($semilla,2) + $b * $semilla + $c)%pow(2, $g);
			$x = $res/(pow(2,$g)-1);
			$valor = $numMenor + ($numMayor-$numMenor)*$x;
			$semilla=$res;
				?>
			<tr>
				<td><?php echo "$i"; ?></td>
				<td><?php echo "$valor" ?></td>
			</tr>
		<?php }}?>
		</table>
</body>
</html>