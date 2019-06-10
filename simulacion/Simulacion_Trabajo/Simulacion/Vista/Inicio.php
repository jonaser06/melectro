<?php
/**
 * Created by PhpStorm.
 * User: Deli Peralta
 * Date: 20/04/2019
 * Time: 12:25
 */

class Inicio
{
    public function Mostrar(){
        ?>
        <!doctype html>
        <html lang="es">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="../JS/bootstrap.min.js">
            <link rel="stylesheet" href="../CSS/bootstrap.js">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script src="../JS/jquery-3.3.1.min.js"></script>

        </head>
        <style>
            #contenedor1{
                border: 1px solid #FFF;
            }
        </style>
        <body>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div id="contenedor1">
			<br><center><h5>EL PRESENTE TRABAJO PERTENECE A: HUANCA NAVARRO, MARIA YOLANDA Y PERALTA GONZALES, DELI VICTORIA</h5></center>
                        <br><center><h3>DISTRIBUCIONES</h3></center>
                        <br>
                        <span><h5>Seleccione el método</h5></span><br>
                        <form id="combo" name="combo" action="../Controlador/Procesos.php" method="post" target="_blank">
                            <center>
                                <select name="cbx_distribucion" id="cbx_distribucion" class="custom-select">
                                    <option>Seleccione</option>
                                    <option value="1">Método de Transformada inversa</option>
                                    <option value="2">Método de convolución</option>
                                </select>
                            </center>
                            <br>
                            <span><h5>Seleccione el tipo de distribución a analizar</h5></span><div id="formulario"><br></div>
                        </form>
                        <center>
                            <div id="formulario">
                                <select name="cbx_estado" id="cbx_estado" class="custom-select">
                                    <option >Seleccione</option>
                                </select>
                            </div>
                        </center>
                        <center><div>
                                <form id="formulario2" method="POST" action="../Controlador/Resolviendo.php">

                                </form>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
        <script>
            $(document).ready(function(){
                $('#cbx_distribucion').on('change',function(){
                    var tipo = $(this).val();
                    if(tipo=='1'){
                        $('#cbx_estado').empty();
                        $('#cbx_estado').append(
                            '<option >Seleccione</option>\n' +
                            '<option value="1">Distribución Uniforme</option>\n' +
                            '<option value="2">Distribución Exponencial</option>\n' +
                            '<option value="3">Distribución Bernoulli</option>\n' +
                            '<option value="4">Distribución Triangular</option>'
                        )
                    }
                    else{
                        $('#cbx_estado').empty();
                        $('#cbx_estado').append(
                            '<option >Seleccione</option>\n' +
                            '<option value="6">Distribución Normal</option>\n' +
                            '<option value="7">Distribución Binomial</option>\n' +
                            '<option value="8">Distribución Erlang</option>\n' +
                            '<option value="9">Distribución Gamma</option>'
                        )
                    }

                });
            });
            $(document).ready(function(){
                $('#cbx_estado').on('change',function(){
                    var valor = $(this).val();
                    if(valor=='1'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '           <br>Ingrese los valores:<br>\n' +
                            '            <br>   a = <input type="text" name="a"><br>\n' +
                            '            <br>   b = <input type="text" name="b"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri) = <input type="number" name="ri"><br>\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                    if(valor=='2'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '           <br>Ingrese la media ( 1 / λ ) = <input type="text" name="landa"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri) = <input type="number" name="ri"><br>\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                    if(valor=='3'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '           <br>Ingrese la p = <input type="text" name="p"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri) = <input type="text" name="ri"><br>\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                    if(valor=='4'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '            <br>a = <input type="text" name="a"><br>\n' +
                            '            <br>b = <input type="text" name="b"><br>\n' +
                            '            <br>c = <input type="text" name="c"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri) = <input type="number" name="ri"><br>\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                    if(valor=='6'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '            <br>Media µ = <input type="text" name="media"><br>\n' +
                            '            <br>Desviación θ = <input type="text" name="desviacion"><br>\n' +
                            '            <br>Ingrese la cantidad de variable aleatorias que desea generar = <input type="number" name="aleatorio"><br>\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <input type="hidden" name="ri" value="12">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                    if(valor=='7'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '            <br>Ingrese la p = <input type="text" name="p"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri) = <input type="number" name="ri"><br>\n' +
                            '            <br>Ingrese la cantidad de variable aleatorias que desea generar = <input type="number" name="aleatorio"><br>\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                    if(valor=='8'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '           <br>Ingrese la media ( 1 / λ ) = <input type="text" name="landa"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri)  = <input type="number" name="k"><br>\n' +
                            '            <br>Ingrese la cantidad de variable aleatorias que desea generar = <input type="number" name="aleatorio"><br>\n' +
                            '            <input type="hidden" name="ri" value="'+ valor +'">\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                    if(valor=='9'){
                        $('#formulario2').empty();
                        $('#formulario2').append(
                            '           <br>Ingrese la media ( 1 / λ ) = <input type="text" name="landa"><br>\n' +
                            '            <br>b = <input type="text" name="b"><br>\n' +
                            '            <br>c = <input type="text" name="c"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri)  = <input type="number" name="ri"><br>\n' +
                            '            <br>Ingrese la cantidad de números aleatorios(ri) = <input type="number" name="ri"><br>\n' +
                            '            <input type="hidden" name="valor" value="'+ valor +'">\n' +
                            '            <br><input type="submit" name="enviar" value="ENVIAR">\n'
                        )
                    }
                });
            });

        </script>
        <?php
    }
}