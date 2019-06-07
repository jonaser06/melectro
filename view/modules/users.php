<?php
$base = basename($url2);
?>
<body>
    <div class="wall-products">
        <?php
        include 'tolbar.php';
        ?>
        <div class="contenido">
            <div class="prodcontent">
                <form action="save">
                    <div class="headbar">
                        <div class="row roundstyle">
                            <div class="col-md-12 t-align">
                                <p style="display:inline;"><span class="fa fa-users"></span>| Usuarios</p>
                                <button class="boton-add">Agregar (+)</button>
                            </div>
                        </div>
                    </div>
                    <div class="bodybar">
                        <div class="title-users">
                            <h2>Basic Table</h2>
                            <p>The .table class adds basic styling (light padding and horizontal dividers) to a table:</p>            
                        </div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Tipo</th>
                                <th>Correo</th>
                                <th>Documento</th>
                                <th>Telefono</th>
                                <th>Premium</th>
                                <th>Estado</th>
                            </tr>
                            </thead>
                            <?php
                                $data = usersController::listUsers();
                                $json = json_decode($data,true);
                                echo '<tbody class="vista_nn" style="display:contents">';
                                foreach ($json as $key => $value) {
                                    if($value['estado']==1){
                                        $estado = 'Activo';
                                        $color = 'text-success';
                                    }else{
                                        $estado = 'Inactivo';
                                        $color = 'text-danger';
                                    }
                                    
                                    
                                    
                                    /* listando */
                                    echo '<tr>
                                            <td>'.$value['nombres'].'</td>
                                            <td>'.$value['apellidos'].'</td>
                                            <td>'.$value['tipo'].'</td>
                                            <td>'.$value['correo'].'</td>
                                            <td>'.$value['documento'].'</td>
                                            <td>'.$value['telefono'].'</td>
                                            <td>'.$value['premium'].'</td>
                                            <td class="'.$color.'">'.$estado.'</td>
                                        </tr>';

                                }
                                echo '</tbody>';

                                echo '<tbody class="vista_t" style="display:none">';
                                foreach ($json as $key => $value) {
                                    if($value['estado']==1){
                                        $estado = 'Activo';
                                        $color = 'text-success';
                                    }else{
                                        $estado = 'Inactivo';
                                        $color = 'text-danger';
                                    }
                                    echo '<tr>
                                        <td>
                                            <input type="text" class="form-control" value="'.$value['nombres'].'" name="nombrePost">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" value="'.$value['apellidos'].'" name="apellidoPost">
                                        </td>
                                        <td>
                                            <select class="form-control form-control-sm" name="tipoClientePost" style="padding:6px 12px; height:38px;">
                                                <option value="0">Cliente</option>
                                                <option value="1">Administrador</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" value="'.$value['correo'].'" name="correoPost">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" value="'.$value['documento'].'" name="documentoPost">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" value="'.$value['telefono'].'" name="TelefonoPost">
                                        </td>
                                        <td>
                                            <select class="form-control form-control-sm" name="premiumPost" style="padding:6px 12px; height:38px;">
                                                <option value="0">No</option>
                                                <option value="1">Si</option>
                                            </select>
                                        </td>
                                        <td class="'.$color.'">'.$estado.'</td>
                                    </tr>';

                                }
                                echo '</tbody>';
                            ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="footbar">
                        <div class="row">
                            <div class="col-md-12"> 
                                <input type="button" class="boton-add" id="btn_editar" style="margin: 10px 10px;padding: 10px 10px;" value="Editar">
                                <button class="boton-add" style="margin: 10px 10px; padding: 10px 10px;">Guardar</button>
                                <script>
                                    $(document).ready(function(){
                                        var contador = 1;
                                        $('#btn_editar').click(function(){
                                            if(contador == 1){
                                                $('.vista_nn').css('display','none');
                                                $('.vista_t').css('display','contents');
                                                contador = 0;
                                            }else{
                                                $('.vista_nn').css('display','contents');
                                                $('.vista_t').css('display','none');
                                                contador = 1;   
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </form>
            </div>    
        </div>
    </div>
</div>        
