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
                    <tbody>
                    <?php
                        $data = usersController::listUsers();
                        $json = json_decode($data,true);
                        foreach ($json as $key => $value) {
                            echo '<tr>
                                    <td>'.$value['nombres'].'</td>
                                    <td>'.$value['apellidos'].'</td>
                                    <td>'.$value['tipo'].'</td>
                                    <td>'.$value['correo'].'</td>
                                    <td>'.$value['documento'].'</td>
                                    <td>'.$value['telefono'].'</td>
                                    <td>'.$value['premium'].'</td>
                                    <td>'.$value['estado'].'</td>
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
