<body>
    <div class="wall-products">
        <div class="tolbar">
            <ul class="option-bar">
                <li><a href="#"><i class="fa fa-globe" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-rocket" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-paper-plane" aria-hidden="true"></i>   </a></li>
                <li class="active"><a href="productos"><i class="fa fa-shopping-cart" aria-hidden="true"></i> </a></li>
                <li><a href="#"><i class="fa fa-users" aria-hidden="true"></i> </a></li>
                <li><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>   </a></li>
                <li><a href="#"><i class="fa fa-cog" aria-hidden="true"></i>   </a></li>
                <li><a href="#"><i class="fa fa-sign-out" aria-hidden="true"></i>  </a></li>
            </ul>
        </div>
        <div class="contenido">
            <div class="prodcontent">
                <div class="headbar">
                    <div class="row roundstyle">
                        <div class="col-md-12 t-align">
                            <p style="display:inline;"><span class="fa fa-shopping-cart"></span>| Productos</p>
                            <button class="boton-add">Agregar (+)</button>
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
                                            <h4>'.$value['descripcion'].'</h4>
                                            <div class="produc-cont">
                                                <p>
                                                <button class="btn btn-primary">Editar</button>
                                                <button class="btn btn-danger">Borrar</button><br>
                                                    Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                                </p>
                                            </div>
                                            <h4>S/. '.$value['precio'].'</h4>
                                        </div> 
                                    </div>';
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
