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
                            <h2>Gestion de usuarios</h2>
                            <p>Lista de usuario registrados en la plataforma.</p>            
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
                                    /**estado */
                                    if($value['estado']==1){
                                        $estado = 'Activo';
                                        $color = 'text-success';
                                    }else{
                                        $estado = 'Inactivo';
                                        $color = 'text-danger';
                                    }
                                    /**premium */
                                    if($value['premium'] == 'no'){
                                        $premium = '<option value="0" selected>no</option>
                                                <option value="1">si</option>';
                                    }else{
                                        $premium = '<option value="0" selected>no</option>
                                                <option value="1">si</option>';
                                    }
                                    if($value['premium'] == 'si'){
                                        $premium = '<option value="0">no</option>
                                                <option value="1" selected>si</option>';
                                    }
                                    /**tipo de usuario */
                                    if($value['tipo'] == 'cliente'){
                                        $tipo = '<option value="1" selected>cliente</option>
                                                <option value="2">administrador</option>';
                                    }
                                    if($value['tipo'] == 'administrador'){
                                        $tipo = '<option value="1">cliente</option>
                                                <option value="2" selected>administrador</option>';
                                    }
                                    
                                    
                                    if($value['tipo'] == 'superusuario'){

                                    }else{
                                        echo '<tr>
                                                <td style="width:120px;">
                                                    <div id="jqn'.$value['idusuarios'].'" class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                        '.$value['nombres'].'
                                                    </div>
                                                    <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                        <input type="text" class="name'.$value['idusuarios'].' form-control" value="'.$value['nombres'].'">
                                                    </div>
                                                </td>
                                                <td style="width:120px;">
                                                    <div id="jqa'.$value['idusuarios'].'" class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                        '.$value['apellidos'].'
                                                    </div>
                                                    <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                        <input type="text" class="apellido'.$value['idusuarios'].' form-control" value="'.$value['apellidos'].'">
                                                    </div>
                                                </td>
                                                <td style="width:120px;">
                                                    <div id="jqt'.$value['idusuarios'].'" class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                        '.$value['tipo'].'
                                                    </div>
                                                    <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                        <select class="select'.$value['idusuarios'].' form-control form-control-sm" style="padding:6px 12px; height:38px;">
                                                            '.$tipo.'
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="jqc'.$value['idusuarios'].'" class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                        '.$value['correo'].'
                                                    </div>
                                                    <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                        <input type="text" class="correo'.$value['idusuarios'].' form-control" value="'.$value['correo'].'">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="jqd'.$value['idusuarios'].'" class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                        '.$value['documento'].'
                                                    </div>
                                                    <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                        <input type="text" class="documento'.$value['idusuarios'].' form-control" value="'.$value['documento'].'">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="jqte'.$value['idusuarios'].'" class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                        '.$value['telefono'].'
                                                    </div>
                                                    <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                        <input type="text" class="noscroll telefono'.$value['idusuarios'].' form-control" value="'.$value['telefono'].'">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="jqp'.$value['idusuarios'].'" class="ViewC'.$value['idusuarios'].'" style="display:block;">
                                                        '.$value['premium'].'
                                                    </div>
                                                    <div class="EditC'.$value['idusuarios'].'" style="display:none;">
                                                        <select class="selectb'.$value['idusuarios'].' form-control form-control-sm" style="padding:6px 12px; height:38px;">
                                                            '.$premium.'
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
                                                        var Vnombre = $(".name'.$value['idusuarios'].'").val();
                                                        var Vapellido = $(".apellido'.$value['idusuarios'].'").val();
                                                        var Vselect = $(".select'.$value['idusuarios'].'").val();
                                                        if(Vselect==1){
                                                            var jqt = "cliente";
                                                        }
                                                        if(Vselect==2){
                                                            var jqt = "administrador";
                                                        }
                                                        var Vcorreo = $(".correo'.$value['idusuarios'].'").val();
                                                        var Vdocumento = $(".documento'.$value['idusuarios'].'").val();
                                                        var Vtelefono = $(".telefono'.$value['idusuarios'].'").val();
                                                        var Vselectb = $(".selectb'.$value['idusuarios'].'").val();
                                                        if(Vselectb==0){
                                                            var jqp = "no";
                                                        }
                                                        if(Vselectb==1){
                                                            var jqp = "si";
                                                        }
                                                        var json = {id:'.$value['idusuarios'].', nombre:Vnombre, apellido:Vapellido, tipo:Vselect, correo:Vcorreo, documento:Vdocumento, telefono:Vtelefono, premium:Vselectb};
                                                        $.ajax({
                                                            url: "'.$url.'/updateuser",
                                                            data : JSON.stringify(json),
                                                            method: "POST",
                                                            success : function(response){
                                                                $("#jqn'.$value['idusuarios'].'").html(Vnombre);
                                                                $("#jqa'.$value['idusuarios'].'").html(Vapellido);
                                                                $("#jqt'.$value['idusuarios'].'").html(jqt);
                                                                $("#jqc'.$value['idusuarios'].'").html(Vcorreo);
                                                                $("#jqd'.$value['idusuarios'].'").html(Vdocumento);
                                                                $("#jqte'.$value['idusuarios'].'").html(Vtelefono);
                                                                $("#jqp'.$value['idusuarios'].'").html(jqp);
                                                                toastr.success("Se ha actualizado con exito", "Update!");
                                                            }
                                                        });
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
                                    }
                                    /* listando */
                                    
                                echo '</tbody>';

                            ?>
                            </tbody>
                        </table>
                        <script>
                            $("form input").on("keypress", function(e) {
                                return e.which !== 13;
                            });
                            document.addEventListener("mousewheel", function(event){
                                if(document.activeElement.type === "number" &&
                                document.activeElement.classList.contains("noscroll"))
                                {
                                    document.activeElement.blur();
                                }
                            });
                        </script>
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
