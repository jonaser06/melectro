<?php

if(isset($_GET["tipo"])){
    $tipo=$_GET["tipo"];
    if($tipo==1){
        $numero=$_GET['numero'];
        $semilla =$_GET['semilla'];
        $digitos =$_GET['digitos'];
        for($i=1;$i<=$numero;$i++) {
            $x = pow($semilla, 2);
            $len_x1= strlen($x);

            if($len_x1%2!=0){
                $x= '0'.$x;
                $len_x1=$len_x1+1;
            }

            $inicio=($len_x1-$digitos)/2;

            $y= substr($x, $inicio, $digitos);

            $r=$y/pow(10,$digitos);

            echo "<center>X[$i]=$x - Y[$i]=$y - R[$i]=$r<br></center>";

            $semilla=$y;
        }

        echo '<center><br><a href="Procesos.php">Volver</a></center>';

    }

    if($tipo==2){
        $cantidad=$_GET['numero'];
        $x0 =$_GET['x0'];
        $x1 =$_GET['x1'];
        $digitos =$_GET['digitos'];
        for($i=1;$i<=$cantidad;$i++) {
            $x = $x0*$x1;
            $len_x1= strlen($x);

            if($len_x1%2!=0){
                $x= '0'.$x;
                $len_x1=$len_x1+1;
            }

            $inicio=($len_x1-$digitos)/2;

            $y= substr($x, $inicio, $digitos);

            $r=$y/pow(10,$digitos);

            echo "<center>Y[$i]=$x0 * $x1 = $x  -> x[$i]=$y - R[$i]=$r<br></center>";

            $x0=$x1;
            $x1=$y;
        }

        echo '<center><br><a href="Procesos.php">Volver</a></center>';
    }
    if($tipo==3){
        $cantidad=$_GET['numero'];
        $semilla =$_GET['semilla'];
        $constante =$_GET['constante'];
        $digitos =$_GET['digitos'];
        for($i=1;$i<=$cantidad;$i++) {
            $x = $semilla*$constante;
            $len_x1= strlen($x);

            if($len_x1%2!=0){
                $x= '0'.$x;
                $len_x1=$len_x1+1;
            }

            $inicio=($len_x1-$digitos)/2;

            $y= substr($x, $inicio, $digitos);

            $r=$y/pow(10,$digitos);

            echo "<center>X[$i]= $semilla * $constante = $x -> Y[$i]=$y -> R[$i]=$r<br></center>";

            $semilla=$y;
        }

        echo '<center><br><a href="Procesos.php">Volver</a></center>';
    }
    if($tipo==4){
        $semilla =$_GET['semilla'];
        $a=$_GET['var_a'];
        $c=$_GET['var_c'];
        $m=$_GET['var_m'];
        $cantidad=$_GET['numero'];
        for($i=0;$i<$cantidad;$i++){
            $x=($a*$semilla+$c)%$m;
            $r=$x/($m-1);
            echo '<center>X['.$i.'] = '.$x.' R['.$i.'] = '.$r.'<br></center>';
            $semilla=$x;
        }
        echo '<center><br><a href="Procesos.php">Volver</a></center>';
    }
    if($tipo==5){
        $semilla =$_GET['semilla'];
        $k=$_GET['var_k'];
        $g=$_GET['var_g'];
        $cantidad=$_GET['numero'];

        $a=5+8*$k;
        $m=pow(2, $g);
        $f=$m-1;
        for($i=0;$i<$cantidad;$i++){
            $x=($a*$semilla)%$m;
            $r=$x/($m-1);
            echo "<center>X[$i]=( $a * $semilla ) mod $m= $x -> r[$i]= $x / $f -> R[$i]=$r<br></center>";
            $semilla=$x;
        }
        echo '<center><br><a href="Procesos.php">Volver</a></center>';
    }
    if($tipo==6){

    }
}