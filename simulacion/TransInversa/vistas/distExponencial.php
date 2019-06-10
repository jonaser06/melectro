<?php
$operacion = false;
if(isset($_POST['submit'])){
	$operacion = true;
	$cant=$_POST["cant"];
	$mol=$_POST["mol"];
	$val=$_POST["val"];
	//var_dump($mol);
	//var_dump($val);
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
		<h1>"Distribucion Exponencial"</h1>
		<label for="media">Ingrese un valor</label><br>
		<select name="mol">
			<option value="0">Media</option>
			<option value="1">Lamda</option>
		</select>
		<input type="number" name="val" step="0.00001" id="val" required>
		<br>
		<label for=cant>Ingrese una cantidad de valores</label><br>
		<input type="numer" name="cant" minlength="1" id="cant" placeholder="cantidad de valores" required><br>
		<input type="submit" name="submit" value="Generar valores">
	</form>
	<?php
	if($operacion==true){
		?>
		<br>
		<h4>Valores aleatorios exponenciales</h4>
		<table>
			<tr>
				<td>#</td>
				<td>Numeros aleatorios</td>
			</tr>
			<?php
			$semilla = 13;
			$g = $cant;
			$a = 26;
			$b = 27;
			$c = 27;
				for ($i=1; $i <= $cant ; $i++) {
			$res =($a * pow($semilla,2) + $b * $semilla + $c)%pow(2, $g);
			$x = $res/(pow(2,$g)-1);
			if ($mol==1) {
				$val=1/$val;
			}
			$valor = -$val*log(1-$x);
			$semilla=$res;
				?>
			<tr>
				<td><?php echo "$i"; ?></td>
				<td><?php echo "$valor" ?></td>
			</tr>
		<?php 
		}
	}
	?>
		</table>
</body>
</html>