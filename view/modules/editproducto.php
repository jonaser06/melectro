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
                            <p style="display:inline;"><span class="fa fa-shopping-cart"></span>| Productos > <span style="font-size:15px;margin:0px;">Editar producto</span></p>
                        </div>
                    </div>
                </div>
                <div class="bodybar">
                    <div class="row">   
                       <div class="col-md-12" style="text-align:left;">
                            <div class="row">
                                    <div class="col-md-7" style="padding:0px;">
                                        <div class="row">
                                            <div class="col-md-6" style="padding:0px;">
                                                <p>Nombre de producto:</p>
                                                <input type="text" id="addnombre" class="form-control">
                                            </div>
                                            <div class="col-md-6">
                                                <p>Codigo:</p>
                                                <input type="text" id="addnombre" class="form-control"><br>
                                            </div>
                                            <div class="col-md-12" style="padding-left:0px;">
                                                <p>Codigo:</p>
                                                <!-- Froala Editor -->
                                                <div id="example">
                                                
                                                </div>
                                                <!-- End Froala Editor -->
                                                <script>
                                                    (function () {
                                                    new FroalaEditor("#example")
                                                    })()
                                                </script>
                                                <style>
                                                    #logo{
                                                        display:none;
                                                    }
                                                </style>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5" style="padding:0px;">
                                        <div class="row">
                                            <div class="col-md-10 ml-auto" style="padding:0px;">
                                                <p>Moneda:</p>
                                                <input type="text" id="addnombre" class="form-control">
                                                <p>UM:</p>
                                                <input type="text" id="addnombre" class="form-control">
                                                <p>Presentación:</p>
                                                <input type="text" id="addnombre" class="form-control">
                                            </div>
                                        </div>
                                        <div class="option-product">
                                            <input type="button" id="publicar" class="boton-add" value="Publicar">
                                            <input type="button" id="cancelar" class="boton-add" value="Cancelar">
                                        </div>
                                    </div>
                            </div>
                       </div>
                    </div>
                </div> 
                <div class="footbar"></div>
            </div>
        </div>
    </div>        
