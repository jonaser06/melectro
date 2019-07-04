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
                            <p style="display:inline;"><span class="fa fa-shopping-cart"></span>| Pedidos</p>
                        </div>
                    </div>
                </div>
                <div class="bodybar">
                    <div class="row">   
                        <div class="col-md-8" style="text-align:left;">
                            <div class="content_detail" style="background:#fff; padding:20px; border-radius:15px;">
                                <?php 
                                    $data = pedidosController::PedidosIdctrl($id);
                                    $json = json_decode($data,true);
                                    foreach ($json as $key => $value) {

                                        if($value['nombre_estado']=='pedido recibido'){
                                            $select = '<option value="1" selected>pedido recibido</option>
                                                        <option value="2">pedido confirmado</option>
                                                        <option value="3">pedido listo</option>
                                                        <option value="4">pedido entregado</option>
                                                        <option value="5">pedido cancelado</option>';
                                        }
                                        if($value['nombre_estado']=='pedido confirmado'){
                                            $select = '<option value="1">pedido recibido</option>
                                                        <option value="2" selected>pedido confirmado</option>
                                                        <option value="3">pedido listo</option>
                                                        <option value="4">pedido entregado</option>
                                                        <option value="5">pedido cancelado</option>';
                                        }
                                        if($value['nombre_estado']=='pedido listo'){
                                            $select = '<option value="1">pedido recibido</option>
                                                        <option value="2">pedido confirmado</option>
                                                        <option value="3" selected>pedido listo</option>
                                                        <option value="4">pedido entregado</option>
                                                        <option value="5">pedido cancelado</option>';
                                        }
                                        if($value['nombre_estado']=='pedido entregado'){
                                            $select = '<option value="1">pedido recibido</option>
                                                        <option value="2">pedido confirmado</option>
                                                        <option value="3">pedido listo</option>
                                                        <option value="4" selected>pedido entregado</option>
                                                        <option value="5">pedido cancelado</option>';
                                        }
                                        if($value['nombre_estado']=='pedido cancelado'){
                                            $select = '<option value="1">pedido recibido</option>
                                                        <option value="2">pedido confirmado</option>
                                                        <option value="3">pedido listo</option>
                                                        <option value="4">pedido entregado</option>
                                                        <option value="5" selected>pedido cancelado</option>';
                                        }

                                        echo '<h3>Pedido #'.$value['iddetalles'].' detalle</h3>
                                                <hr>
                                                <p><b>Detalles Generales</b></p>
                                                <p>Fecha de pedido</p>
                                                <input type="text" class="form-control" aria-describedby="basic-addon3" value="'.$value['fecha'].'"><br>
                                                <p>Estado de pedido</p>
                                                <select class="custom-select" id="inputGroupSelect01">
                                                    '.$select.'
                                                </select>
                                                <p>Metodo de pago </p>
                                                <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3" value="'.$value['metodoPago'].'"><br>
                                                <p>Envio</p>
                                                <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3" value="'.$value['envio'].'"><br>';
                                    }
                                ?>
                                <table class="table" style="text-align:left;">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Apellidos</th>
                                            <th scope="col">Correo</th>
                                            <th scope="col">Documento</th>
                                            <th scope="col">Telefono</th>
                                            <th scope="col">Premium</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <?php
                                                foreach ($json as $key => $value) {
                                                    echo '<td>'.$value['nombres'].'</td>
                                                            <td>'.$value['apellidos'].'</td>
                                                            <td>'.$value['correo'].'</td>
                                                            <td>'.$value['documento'].'</td>
                                                            <td>'.$value['telefono'].'</td>
                                                            <td>'.$value['premium'].'</td>';
                                                }
                                            ?>
                                        </tr>
                                    </tbody>
                                </table>  
                            </div>
                        </div>
                        <div class="col-md-4" style="text-align:left;">
                            <div class="action_pedido" style="background:#fff; padding:20px; border-radius:15px;">
                                <p><b>Pedido Acciones</b></p>
                                <hr>
                                <div class="botor_accion" style="text-align:center;width:100%;">
                                    <button class="btn btn-danger" style="width:40%;margin-right:5%">Cancelar</button>
                                    <button class="btn btn-success" style="width:40%;margin-left:5%">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="footbar"></div>
            </div>
        </div>
    </div>        
