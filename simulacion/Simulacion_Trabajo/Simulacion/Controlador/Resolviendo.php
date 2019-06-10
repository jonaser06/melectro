<?php
/**
 * Created by PhpStorm.
 * User: Deli Peralta
 * Date: 9/06/2019
 * Time: 16:34
 */

$numero=$_POST['ri'];

function numeros_aleatorio($numero){
    $semilla = rand(2000,6000);
    $ar=array($numero);
    for($i=0;$i<$numero;$i++) {
        $x_inicial = pow($semilla, 2);
        $len_x1= strlen($x_inicial);
        if($len_x1%2!=0){
            $x_inicial= '0'.$x_inicial;
            $len_x1=$len_x1+1;
        }
        $inicio=($len_x1-4)/2;
        $y_inicial= substr($x_inicial, $inicio, 4);
        $r=$y_inicial/pow(10,4);
        $ar[$i]=($r);
        $semilla=$y_inicial;
    }
    return $ar;
}

if(isset($_POST["enviar"])) {
    $tipo = $_POST['valor'];
    if ($tipo == 1 ){
        $a = $_POST['a'];
        $b = $_POST['b'];
        $n = $_POST['ri'];
        $ar=numeros_aleatorio($numero);
        echo "<center><h1>Metodo Tranformación Inversa - Distribución Uniforme</h1><br><table border='1'><tr><th>i</th><th>ri</th><th>Xi</th></tr>";
        for($i=0;$i<count($ar);$i++){

            $xi = $a + ( $b - $a ) * $ar[$i];
            echo "<tr><td>$i</td><td>$ar[$i]</td><td>$xi</td>";
        }
        echo '</tr></table><br><a href="../Controlador/Procesos.php">NUEVO</a></center><br>';
    }
    if ($tipo == 2) {
        $landa = $_POST['landa'];
        $ar=numeros_aleatorio($numero);
        echo "<center><h1>Metodo Tranformación Inversa - Distribución Exponencial</h1><br><table border='1'><tr><th>i</th><th>ri</th><th>Xi</th></tr>";
        for($i=0;$i<count($ar);$i++){
            $xi = ( -1 * log (  1 - $ar[$i])  ) / (1 / $landa );
            echo "<tr><td>$i</td><td>$ar[$i]</td><td>$xi</td></tr>";
        }
        echo '</tr></table><br><a href="../Controlador/Procesos.php">NUEVO</a></center><br>';
    }
    if ($tipo == 3){
        //        p, donde x = 0 ;
        // 1-p, donde x = 1;
        $p = $_POST['p'];
        $ar=numeros_aleatorio($numero);
        $p2=1-$p;
        $res=array();
        echo "<center><h1>Metodo Tranformación Inversa - Distribución Bernoulli</h1><br><table border='1'><tr><th>i</th><th>ri</th><th>Xi</th></tr>";
        for($i=0;$i<count($ar);$i++){
            if($ar[$i] < $p2){
                $resultado = 0;
            }
            else{
                $resultado = 1;
            }
            $res[]=$resultado;
            echo "<tr><td>$i</td><td>$ar[$i]</td><td>$res[$i]</td></tr>";
        }
        echo '</tr></table><br><a href="../Controlador/Procesos.php">NUEVO</a></center><br>';
    }

    if ($tipo == 4) {
        $a = $_POST['a'];
        $b = $_POST['b'];
        $c = $_POST['c'];
        $ar=numeros_aleatorio($numero);
        $r2=numeros_aleatorio($numero);
        $resul1= ( $c - $a ) / ( $b - $a);
        echo "<center><h1>Metodo Tranformación Inversa - Distribución Triangular</h1><br><table border='1'><tr><th>i</th><th>R1</th><th>R2</th><th>Xi</th></tr>";
        for($i=0;$i<count($ar);$i++){
            if( $ar[$i] < $resul1){
                $x = $a + ( $c - $a ) * sqrt( $r2[$i] );
            }
            else{
                $x = $b + ( $b - $c ) * sqrt( 1 - $r2[$i] );
            }
            echo "<tr><td>$i</td><td>$ar[$i]</td><td>$r2[$i]</td><td>$x</td></tr>";
        }
        echo '</tr></table><br><a href="../Controlador/Procesos.php">NUEVO</a></center><br>';
    }
//    -----------------------------------------------------------------------------------------------------------------------------
    if ($tipo == 6) {
        $media = $_POST['media'];
        $n = $_POST['aleatorio'];
        $desviacion = $_POST['desviacion'];
        $suma=array($n);
        $x=array($n);
        $resul=0;
        echo "<center><h1>Metodo Convolución - Distribución Normal</h1><br><table border='1'><tr><th>i</th><th>Σ ri</th><th>Xi</th></tr>";
        for($j=0;$j<$n;$j++){
            //12 numeros aleatorios
            $ar=numeros_aleatorio(12);
            $total=0;
            for($i=0;$i<12;$i++){
                $total += $ar[$i];
            }
            $suma[]=$total;
            $resultado = ( ( $suma[$j] - 6 ) * $desviacion ) + $media ;
            echo "<tr><td>$j</td><td>$suma[$j]</td><td>$resultado</td></tr>";
        }
        echo '</tr></table><br><a href="../Controlador/Procesos.php">NUEVO</a></center><br>';
    }

    if ($tipo == 7) {
        $p = $_POST['p'];
        $n = $_POST['aleatorio'];

        $p2=1-$p;
        $suma=array($n);
        $res=array();
        echo "<center><h1>Metodo Convolución - Distribución Binomial</h1><br>";
        for($j=0;$j<$n;$j++) {
            $total=0;
            $ar=numeros_aleatorio($numero);
            for ($i = 0; $i < $numero; $i++) {
                if ($ar[$i] < $p2) {
                    $resultado = 0;
                } else {
                    $resultado = 1;
                }
                echo $resultado.' ';
                $total+=$resultado;
                $suma[]=$total;
            }

            echo ' = '.$total.'<br>';
        }
        echo "<br><a href=\"../Controlador/Procesos.php\">NUEVO</a></center><br></center>";
    }
    if ($tipo == 8) {
        $k = $_POST['k'];
        $n = $_POST['aleatorio'];
        $landa = $_POST['landa'];
        $resta=array();
        echo "<center><h1>Metodo Tranformación Inversa - Distribución Erlang</h1>";
        for($j=0;$j<$n;$j++) {
            $ar=numeros_aleatorio($k);
            for ($i = 0; $i < count($ar); $i++) {
                $resta[]=1-$ar[$i];
                $xi = (-1 * log(1 - $ar[$i])) / (1 / $landa);
                echo $resta[$i]." ";
            }
            echo ' = '.$xi.'<br>';
        }
        echo '<br><a href="../Controlador/Procesos.php">NUEVO</a></center><br>';
    }
}
