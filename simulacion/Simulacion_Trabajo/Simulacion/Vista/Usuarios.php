<?php
/**
 * Created by PhpStorm.
 * User: Deli Peralta
 * Date: 20/04/2019
 * Time: 12:25
 */

class Usuarios
{
    public function Mostrar($arrAlg){
        ?>
        <!doctype html>
        <html lang="es">
        <head>

        </head>
        <body>
        <center><h3>ALGORITMOS</h3></center>
        <br>

        <form id="combo" name="combo" action="../Controlador/Procesos.php" method="post" target="_blank">
            <center>Ingrese un numero: <input type="number" name="txt_numero" id="txt_numero" ></center><br>
            <center>
                <select name="cbx_estado" id="cbx_estado" class="custom-select">
                    <option>Seleccione el algoritmo</option>
                    <?php
                    foreach ($arrAlg as $x) {
                        echo '<option value="' . $x['Cod_Tip'] . '">' . $x['nombre'] . '</option>';
                    }
                    ?>
                </select>
            </center>
        </form><br>
        <center><div id="formulario"><table id="mitabla"></table></div></center>
</body>
</html>
        <script src="../JS/jquery-3.3.1.min.js"></script>

        <script>
            // $(document).ready(function(){
            //     $('#cbx_estado').on('change',function(){
            //         var tipo = $(this).val();
            //         var url = "../Controlador/AjaxValores.php";
            //         //https://mimentevuela.wordpress.com/2016/08/29/devolver-json-en-php-y-obtener-datos-con-ajax/
            //         $.ajax({
            //             type:'POST',
            //             url:url,
            //             dataType: 'json',
            //             data:{tipo:tipo},
            //         }).done(function (respuesta) {
            //             console.log(respuesta);
            //             respuesta.forEach(function (element) {
            //                 // for ( var i in element)
            //                 $('#formulario').append(element +':<input type="number"><br><br>');
            //             });
            //             // for ( var i in respuesta)
            //             // $('#formulario').append(respuesta[i] +':<input type="number"><br><br>');
            //                     // $('#mitabla').append('<tr><td>' + respuesta + '</td></tr>');
            //
            //         });
            //     });
            // });
            //-----------------------------------------------------------------------------------------------------------------
            $(document).ready(function(){
                $('#cbx_aleatorio').on('change',function(){
                    var numero=$('#txt_numero').val();
                    var tipo = $(this).val();
                    if(tipo=='1'){
                        $('#formulario').append(
                            '<form method="GET" action="../Controlador/Procesando.php">\n' +
                            '            <input type="hidden" name="numero" value="'+ numero +'">\n' +
                            '            <input type="hidden" name="tipo" value="'+ tipo +'">\n' +
                            '            Ingrese la semilla: <input type="text" name="semilla" ><br><br>\n' +
                            '            Ingrese el número de digitos: <input type="text" name="digitos" ><br><br>\n' +
                            '            <input type="submit" name="btnejecutar" ><br><br>\n' +
                            '        </form>'
                        )
                    }
                    if(tipo=='2'){
                        $('#formulario').append(
                            '<form method="GET" action="../Controlador/Procesando.php">\n' +
                            '            <input type="hidden" name="numero" value="'+ numero +'">\n' +
                            '            <input type="hidden" name="tipo" value="'+ tipo +'">\n' +
                            '            Ingrese la X0: <input type="text" name="x0" ><br><br>\n' +
                            '            Ingrese la X1: <input type="text" name="x1" ><br><br>\n' +
                            '            Ingrese el número de dígitos: <input type="text" name="digitos" ><br><br>\n' +
                            '            <input type="submit" name="btnejecutar" ><br><br>\n' +
                            '        </form>'
                        )
                    }
                    if(tipo=='3'){
                        $('#formulario').append(
                            '<form method="GET" action="../Controlador/Procesando.php">\n' +
                            '            <input type="hidden" name="numero" value="'+ numero +'">\n' +
                            '            <input type="hidden" name="tipo" value="'+ tipo +'">\n' +
                            '            Ingrese la semilla: <input type="text" name="semilla" ><br><br>\n' +
                            '            Ingrese la constante: <input type="text" name="constante" ><br><br>\n' +
                            '            Ingrese el número de dígitos: <input type="text" name="digitos" ><br><br>\n' +
                            '            <input type="submit" name="btnejecutar" ><br><br>\n' +
                            '        </form>'
                        )
                    }
                    if(tipo == '4'){
                        $('#formulario').append(
                            '<form method="GET" action="../Controlador/Procesando.php">\n' +
                            '            <input type="hidden" name="numero" value="'+ numero +'">\n' +
                            '            <input type="hidden" name="tipo" value="'+ tipo +'">\n' +
                            '            Ingrese la semilla: <input type="text" name="semilla" ><br><br>\n' +
                            '            Ingrese la a: <input type="text" name="var_a" ><br><br>\n' +
                            '            Ingrese la c: <input type="text" name="var_c" ><br><br>\n' +
                            '            Ingrese la m: <input type="text" name="var_m" ><br><br>\n' +
                            '            <input type="submit" name="btnejecutar" ><br><br>\n' +
                            '        </form>'
                        )

                    }
                    if(tipo == '5'){
                        $('#formulario').append(
                            '<form method="GET" action="../Controlador/Procesando.php">\n' +
                            '            <input type="hidden" name="numero" value="'+ numero +'">\n' +
                            '            <input type="hidden" name="tipo" value="'+ tipo +'">\n' +
                            '            Ingrese la semilla: <input type="text" name="semilla" ><br><br>\n' +
                            '            Ingrese la k: <input type="text" name="var_k" ><br><br>\n' +
                            '            Ingrese la g: <input type="text" name="var_g" ><br><br>\n' +
                            '            <input type="submit" name="btnejecutar" ><br><br>\n' +
                            '        </form>'
                        )

                    }
                    if(tipo == '6'){
                        $('#formulario').append(
                            '<form method="GET" action="../Controlador/Procesando.php">\n' +
                            '            <input type="hidden" name="numero" value="'+ numero +'">\n' +
                            '            <input type="hidden" name="tipo" value="'+ tipo +'">\n' +
                            '            Ingrese la semilla: <input type="text" name="semilla" ><br><br>\n' +
                            '            Ingrese la a: <input type="text" name="var_a" ><br><br>\n' +
                            '            Ingrese la c: <input type="text" name="var_c" ><br><br>\n' +
                            '            Ingrese la m: <input type="text" name="var_m" ><br><br>\n' +
                            '            <input type="submit" name="btnejecutar" ><br><br>\n' +
                            '        </form>'
                        )

                    }
                });
            });
        </script>
        <?php
    }
}