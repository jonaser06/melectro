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
                            <p style="display:inline;"><span class="fa fa-shopping-cart"></span>| Productos</p>
                            <button class="boton-add">Agregar (+)</button>
                            <?php
                                echo '<script>
                                        $(".boton-add").click(function(){
                                            window.location = "'.$url.'/productos/add";
                                        });
                                    </script>';
                            ?>
                        </div>
                    </div>
                </div>
                <div class="bodybar">
                    <div class="row">   
                        <?php
                            $productos = products::productsController();
                            $json = json_decode($productos,true);
                            foreach ($json as $key => $value) {
                                echo '<div class="col-md-3 col-12 col-sm-6">
                                        <div class="item-products">
                                            <div class="img-prod">
                                                <img src="'.$url.'/r/desktop/img/products.png">
                                            </div>
                                            <h4>'.$value['nombre'].'</h4>
                                            <div class="produc-cont">
                                                <p>
                                                <a href="'.$url.'/productos/edit/'.$value['idproducto'].'" class="btn btn-primary">Editar</a>
                                                <button class="btn btn-danger" data-toggle="modal" data-target="#delModal'.$value['idproducto'].'">Borrar</button><br>
                                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                                </p>
                                            </div>
                                            <h4>S/. '.$value['precio'].'</h4>
                                        </div> 
                                    </div>
                                    <!-- Modal de eliminacion de usuarios-->
                                    <div class="modal fade" id="delModal'.$value['idproducto'].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Confirmar Acción</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Esta seguro que desea eliminar el producto <br><b>'.$value['nombre'].'</b>?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button type="button" class="btn btn-danger" data-dismiss="modal" id="del'.$value['idproducto'].'">Eliminar</button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        $("#del'.$value['idproducto'].'").click(function(){
                                            var idproducto = '.$value['idproducto'].';
                                            var jsonid = {id: idproducto};
                                            $.ajax({
                                                url: "'.$url.'/deleteProducto",
                                                data : JSON.stringify(jsonid),
                                                method: "POST",
                                                success : function(response){
                                                    toastr.success("Se ha eliminado con exito", "Eliminado!");
                                                    setInterval(function(){
                                                        location.reload();
                                                    }, 1000);
                                                }
                                            });
                                        });
                                    </script>';
                            }
                        ?>
                        <!-- <div class="col-md-3">
                            <div class="item-products">
                                <div class="img-prod">
                                    <img src="img/products.png">
                                </div>
                                <h4>Titulo de producto</h4>
                                <div class="produc-cont">
                                    <p>
                                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                        Provident cupiditate nemo tempora placeat natus.
                                    </p>
                                </div>
                                <h4>S/. 100.00</h4>
                            </div> 
                        </div> -->

                        
                    </div>
                </div> 
                <div class="footbar"></div>
            </div>
        </div>
    </div>        
