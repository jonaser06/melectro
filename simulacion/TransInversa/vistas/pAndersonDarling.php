<?php
$operation=false;
if (isset($_POST["submit"])) {
	$operation=true;
	$cantidad=$_POST["cant"];
	$aceptacion=["90%","95%","97.5%","99%"];
	$dist=["Normal","Exponencial","Weibull","Log-Logística"];
	$n = count($aceptacion);
	$d=count($dist);
}
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
		<label for="cant">Ingrese la cantidad de valores</label>
		<input type="numer" name="cant" id="cant" minlength="1" placeholder="cantidad" required>
		<input type="submit" name="submit" value="Aceptar">
	</form>
	<form action="../vistas/pruebaAD.php" method="post">
		<?php 
		if ($operation==true) {
			for ($i=0; $i < $cantidad; $i++) { 
				?>
				<input type="number"  name="valores[]" step="0.00000001" required><br>
				<?php
			}
			?>
			<select name="dist" method="post">
			<?php
			for ($i=0; $i < $d; $i++) { 
			?>
				<option value="<?php echo $i;?>"><?php echo $dist[$i]; ?></option>
				<?php
			}
			?>
			</select>
			<select name="aceptacion" method="post">
			<?php
			for ($i=0; $i < $n; $i++) { 
			?>
				<option value="<?php echo $i;?>"><?php echo $aceptacion[$i]; ?></option>
				<?php
			}
			?>
			</select>
				<br>
		<input type="submit" value="Realizar la prueba"></form>
		<?php
		}
		?>
	</form>
</body>
</html>