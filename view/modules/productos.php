<?php
$base = basename($url2);
if(!$_GET){
    echo '<script type="text/javascript">
                window.location = "productos?pagina=1";
            </script>';
}
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
                <div class="busqueda">
                    <?php
                        echo '<form action="'.$url.'/busqueda" methor="POST" style="height:100%;">';
                    ?>
                        Busqueda :
                        <input type="text" name="q" id="txt_busca" placeholder="Ingrese el termino de busqueda">
                        <button type="submit" class="btn_busca">Buscar</button>
                    </form>
                </div>
                <div class="bodybar">
                    <div class="row">   
                        <?php
                            $key = ($_GET['pagina']-1)*20;
                            $productos = products::productsController($key);
                            $json = json_decode($productos,true);
                            foreach ($json as $key => $value) {
                                echo '<div class="col-md-3 col-12 col-sm-6">
                                        <div class="item-products">
                                            <div class="img-prod">
                                                <img src="'.$url.'/'.$value['imagen'].'">
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
                <div class="footbar" style="text-align:center;">
                    <nav aria-label="Page navigation example" style="display:inline-block;">
                        <ul class="pagination">
                            <?php
                                if(($_GET['pagina']-1)==0){
                                    echo '<li class="page-item disabled"><a class="page-link" href="'.$url.'/productos?pagina='.($_GET['pagina']-1).'">Anterior</a></li>';
                                }else{
                                    echo '<li class="page-item"><a class="page-link" href="'.$url.'/productos?pagina='.($_GET['pagina']-1).'">Anterior</a></li>';
                                }
                                $productos = products::pagination();
                                echo '<script>console.log('.$productos.')</script>';
                                for ($i=0; $i < 10; $i++) {
                                    
                                    if($_GET['pagina']==($i+1)){
                                        echo '<li class="page-item active"><a class="page-link" href="'.$url.'/productos?pagina='.($i+1).'">'.($i+1).'</a></li>';
                                    }else{
                                        echo '<li class="page-item"><a class="page-link" href="'.$url.'/productos?pagina='.($i+1).'">'.($i+1).'</a></li>';
                                    }
                                }
                                echo '<li class="page-item"><a class="page-link" href="'.$url.'/productos?pagina='.($_GET['pagina']+1).'">Next</a></li>';
                            ?>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>        
