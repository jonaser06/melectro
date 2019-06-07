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
                <form action="updateuser" method="POST">
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
                                <th style="width:120px;">Nombres</th>
                                <th style="width:120px;">Apellidos</th>
                                <th style="width:120px;">Tipo</th>
                                <th style="width:120px;">Correo</th>
                                <th style="width:120px;">Documento</th>
                                <th style="width:120px;">Telefono</th>
                                <th style="width:120px;">Premium</th>
                                <th style="width:120px;">Estado</th>
                                <th style="width:120px;">Accion</th>
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
                                            <td style="width:120px;">
                                                <div class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                    '.$value['nombres'].'
                                                </div>
                                                <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                    <input type="text" class="form-control" value="'.$value['nombres'].'" name="nombrePost">
                                                </div>
                                            </td>
                                            <td style="width:120px;">
                                                <div class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                    '.$value['apellidos'].'
                                                </div>
                                                <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                    <input type="text" class="form-control" value="'.$value['apellidos'].'" name="apellidoPost">
                                                </div>
                                            </td>
                                            <td style="width:120px;">
                                                <div class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                    '.$value['tipo'].'
                                                </div>
                                                <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                    <select class="form-control form-control-sm" name="tipoClientePost" style="padding:6px 12px; height:38px;">
                                                        <option value="0">Cliente</option>
                                                        <option value="1">Administrador</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                    '.$value['correo'].'
                                                </div>
                                                <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                    <input type="text" class="form-control" value="'.$value['correo'].'" name="correoPost">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                    '.$value['documento'].'
                                                </div>
                                                <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                    <input type="text" class="form-control" value="'.$value['documento'].'" name="documentoPost">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                    '.$value['telefono'].'
                                                </div>
                                                <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                    <input type="text" class="form-control" value="'.$value['telefono'].'" name="TelefonoPost">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                    '.$value['premium'].'
                                                </div>
                                                <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                    <select class="form-control form-control-sm" name="premiumPost" style="padding:6px 12px; height:38px;">
                                                        <option value="0">No</option>
                                                        <option value="1">Si</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td class="'.$color.'">'.$estado.'</td>
                                            <td>
                                                <ul class="user-option">
                                                    <li><span id="edit'.$value['idusuarios'].'" class="editT'.$value['idusuarios'].' text-primary fa fa-pencil"></span></li>
                                                    <li><span id="save'.$value['idusuarios'].'" class="editT'.$value['idusuarios'].' text-success fa fa-check" style="display:none"></span></li>
                                                    <li><span id="del'.$value['idusuarios'].'" class="text-danger fa fa-times"></span></li>
                                                </ul>
                                            </td>

                                            <script>
                                                $("#del'.$value['idusuarios'].'").click(function(){
                                                    if (confirm("Esta seguro que desea eliminar a este Usuario '.$value['idusuarios'].'")) {
                                                        
                                                    }
                                                });

                                                $("#save'.$value['idusuarios'].'").click(function(){
                                                    console.log("guardando usuario '.$value['idusuarios'].'");
                                                });

                                                var contador = 1;
                                                $(".editT'.$value['idusuarios'].'").click(function(){
                                                    if(contador == 1){
                                                        $("#edit'.$value['idusuarios'].'").css("display","none");
                                                        $("#save'.$value['idusuarios'].'").css("display","inline");

                                                        $(".ViewC'.$value['idusuarios'].'").css("display","none");
                                                        $(".EditC'.$value['idusuarios'].'").css("display","block");
                                                        contador = 0;
                                                    }else{
                                                        $("#edit'.$value['idusuarios'].'").css("display","inline");
                                                        $("#save'.$value['idusuarios'].'").css("display","none");

                                                        $(".ViewC'.$value['idusuarios'].'").css("display","block");
                                                        $(".EditC'.$value['idusuarios'].'").css("display","none");
                                                        contador = 1;   
                                                    }
                                                });
                                            </script>
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
                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>    
        </div>
    </div>
</div>        
