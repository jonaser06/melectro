<?php
$menu=['Distribucion Normal','Distribucion Exponencial','Distribucion triangular','Prueba de Anderson-Darling'];
$n = count($menu);
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Simulacion</title>
</head>
<body>
	<form action="../controlador/distribuciones.php" method="post" id="distribucion" name="distribucion">
		<select name="distribucion" form="distribucion">
			<h3>"Selecciona una disribucion"</h3>
			<br>
			<?php for($i=0;$i<$n;$i++) { ?>
				<option value="<?php echo $i; ?>"><?php echo $menu[$i]; ?></option>
			<?php } ?>
		</select>
		<br>
		<button type="submit">Seleccionar</button>
	</form>
</body>
</html>