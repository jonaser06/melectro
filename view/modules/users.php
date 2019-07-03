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
                <div class="headbar">
                    <div class="row roundstyle">
                        <div class="col-md-12 t-align">
                            <p style="display:inline;"><span class="fa fa-users"></span>| Usuarios</p>
                            <input type="button" class="boton-add" data-toggle="modal" data-target="#AgregarUser" value="Agregar (+)">
                            <!-- Modal -->
                            <div class="modal fade" id="AgregarUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Agregar Nuevo Usuario</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Nombres</p>
                                            <input type="text" id="addnombre" class="form-control">
                                            <p>Apellidos</p>
                                            <input type="text" id="addapellidos" class="form-control">
                                            <p>Correo</p>
                                            <input type="email" id="addcorreo" class="form-control">
                                            <p>Password</p>
                                            <input type="password" id="addpass" class="form-control">
                                            <p>Documento DNI/RUC</p>
                                            <input type="text" id="adddoc" class="form-control">
                                            <p>Telefono</p>
                                            <input type="text" id="addtel" class="form-control">
                                            <p>Rol</p>
                                            <select id="addrol" class="form-control">
                                                <option value="1">cliente</option>
                                                <option value="2">administrador</option>
                                            </select>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" id="addNewUser" class="btn btn-primary" data-dismiss="modal">Save changes</button>
                                        </div>
                                        <script>
                                            $('#addNewUser').click(function(){
                                                var nombre = $('#addnombre').val();
                                                var apellido = $('#addapellidos').val();
                                                var correo = $('#addcorreo').val();
                                                var password = $('#addpass').val();
                                                var doc = $('#adddoc').val();
                                                var telefono = $('#addtel').val();
                                                var rol = $('#addrol').val();
                                                var json = {'nombre': nombre, 'apellido': apellido, 'correo': correo, 'password':password, 'documento':doc, 'telefono': telefono, 'rol': rol};
                                                $.ajax({
                                                    <?php
                                                        echo 'url: "'.$url.'/newUser", ';
                                                    ?>
                                                    data : JSON.stringify(json),
                                                    method: "POST",
                                                    success : function(response){
                                                        toastr.success("Se ha agregado al usuario con exito", "Agregado!");
                                                        setInterval(function(){
                                                            location.reload();
                                                        }, 1000);
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="busqueda">
                    <?php
                        echo '<form action="'.$url.'/search_user" methor="POST" style="height:100%;">';
                    ?>
                        Busqueda :
                        <input type="text" name="q" id="txt_busca" placeholder="Ingrese el termino de busqueda">
                        <button type="submit" class="btn_busca">Buscar</button>
                    </form>
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
                                                    <li><span class="text-danger fa fa-times" data-toggle="modal" data-target="#delModal'.$value['idusuarios'].'"></span></li>
                                                </ul>
                                            </td>

                                            <!-- Modal de eliminacion de usuarios-->
                                            <div class="modal fade" id="delModal'.$value['idusuarios'].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Confirmar Acción</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Esta seguro que desea eliminar al usuario '.$value['nombres'].'
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal" id="del'.$value['idusuarios'].'">Eliminar</button>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <script>
                                                $("#del'.$value['idusuarios'].'").click(function(){
                                                    var idusuarios = '.$value['idusuarios'].';
                                                    var jsonid = {id: idusuarios};
                                                    $.ajax({
                                                        url: "'.$url.'/deleteUser",
                                                        data : JSON.stringify(jsonid),
                                                        method: "POST",
                                                        success : function(response){
                                                            toastr.success("Se ha actualizado con exito", "Update!");
                                                            setInterval(function(){
                                                                location.reload();
                                                            }, 1000);
                                                        }
                                                    });
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
            </div>    
        </div>
    </div>
</div>        
