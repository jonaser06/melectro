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
                        <table class="table table-dark" style="text-align:left;">
                            <thead>
                                <tr>
                                    <th scope="col">Estado</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Metodo de pago</th>
                                    <th scope="col">Envio</th>
                                    <th scope="col">Monto</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $data = pedidosController::ListarPedidosctrl();
                                    $json = json_decode($data,true);
                                    foreach ($json as $key => $value) {
                                        echo '<tr>
                                                <th scope="row">'.$value['nombre_estado'].'</th>
                                                <td>
                                                    <b>Pedido #'.$value['iddetalles'].'</b> Hecho por '.$value['nombres'].'<br>
                                                    <span>Email: </span><b>'.$value['correo'].'</b><br>
                                                    <span>Telf: </span><b>'.$value['telefono'].'</b>
                                                </td>
                                                <td>
                                                    '.$value['metodoPago'].'
                                                </td>
                                                <td>
                                                    '.$value['envio'].'
                                                </td>
                                                <td>
                                                    S/. '.$value['precio'].'
                                                </td>
                                                <td>'.$value['fecha'].'</td>
                                                <td>
                                                    <a href="'.$url.'/detallePedido/'.$value['iddetalles'].'"><button type="button" class="btn btn-light">Detalles</button></a>
                                                </td>
                                            </tr>';
                                    }
                                ?>
                            </tbody>
                        </table>                   
                    </div>
                </div> 
                <div class="footbar"></div>
            </div>
        </div>
    </div>        
