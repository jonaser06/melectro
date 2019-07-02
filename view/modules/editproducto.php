<?php
$base = basename($url2);
?>
<style>
.note-popover{
    display:none;
  }
</style>
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
                <div class="bodybar" style="margin-top:50px;">
                    <div class="row">   
                       <div class="col-md-12" style="text-align:left;">
                            <?php
                            /* producto */
                            $data = json_decode($product,true);
                            ?>
                            <?php echo '<form action="'.$url.'/updateProduct" method="POST" enctype="multipart/form-data">'; ?>
                                <div class="row">
                                    <div class="col-md-7" style="padding:0px;">
                                        <div class="row">
                                            <div class="col-md-6" style="padding:0px;">
                                                <p>Nombre de producto:</p>
                                                <?php
                                                    echo '<input name="prodId" type="hidden" value="'.$data['idproducto'].'">';
                                                    echo '<input autocomplete="off" value="'.$data['nombre'].'" type="text" id="addname" class="form-control" name="nameProd">';
                                                ?>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Codigo:</p>
                                                <?php
                                                    echo '<input autocomplete="off" value="'.$data['codigo'].'" type="text" id="addcode" class="form-control" name="codeProd"><br>';
                                                ?>
                                            </div>
                                            <div class="col-md-4" style="padding:0px;">
                                                <p>Precio:</p>
                                                <?php
                                                    echo '<input autocomplete="off" value="'.$data['precio'].'" type="text" id="addnombre" class="form-control" name="precioProd" style="margin-bottom:10px;">';
                                                ?>
                                            </div>
                                            <div class="col-md-4">
                                                <p>Descuento:</p>
                                                <?php
                                                    echo '<input autocomplete="off" value="'.$data['descuento'].'" type="text" id="addnombre" class="form-control" name="descuento" style="margin-bottom:10px;">';
                                                ?>
                                            </div>
                                            <div class="col-md-4">
                                                <p>UM:</p>
                                                <select name="umProd" id="" class="form-control">
                                                    <?php
                                                        if($data['um']=='BL'){
                                                            echo '<option value="BL" selected>BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='CJA'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA" selected>CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='CM'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM" selected>CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='CTO'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO" selected>CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='GL'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL" selected>GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='JGO'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO" selected>JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='KG'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG" selected>KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='LB'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB" selected>LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='LT'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT" selected>LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='MIL'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL" selected>MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='MT'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT" selected>METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='PAQ'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ" selected>PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='PLI'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI" selected>PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='PR'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR" selected>PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='RL'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL" selected>ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='UND'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND" selected>UNIDAD (UND)</option>
                                                                <option value="UNI">UNIDAD (UNI)</option>';
                                                        }
                                                        if($data['um']=='UNI'){
                                                            echo '<option value="BL">BALDE (BL)</option>
                                                                <option value="CJA">CAJA (CJA)</option>
                                                                <option value="CM">CENTIMETROS (CM)</option>
                                                                <option value="CTO">CIENTO (CTO)</option>
                                                                <option value="GL">GALONES (GL)</option>
                                                                <option value="JGO">JUEGO (JGO)</option>
                                                                <option value="KG">KILOGRAMOS (KG)</option>
                                                                <option value="LB">LIBRA (LB)</option>
                                                                <option value="LT">LITROS (LT)</option>
                                                                <option value="MIL">MILLAR (MIL)</option>
                                                                <option value="MT">METROS (MT)</option>
                                                                <option value="PAQ">PAQUETE (PAQ)</option>
                                                                <option value="PLI">PLIEGO (PLI)</option>
                                                                <option value="PR">PAR (PR)</option>
                                                                <option value="RL">ROLLO (RL)</option>
                                                                <option value="UND">UNIDAD (UND)</option>
                                                                <option value="UNI" selected>UNIDAD (UNI)</option>';
                                                        }
                                                    ?>
                                                </select>
                                            </div>
                                            <div class="col-md-12" style="padding-left:0px;">
                                                <p>Descripcion:</p>
                                                <!-- 0 Editor -->
                                                <?php echo '<textarea rows="4" cols="80" class="form-control editor-txt" name="descripcionProd" require>'.$data['descripcion'].'</textarea>'; ?>
                                                <!-- End Froala Editor -->
                                                <script>
                                                    $('.editor-txt').summernote();
                                                    $(document).ready(function(){
                                                        $('.fr-wrapper').removeClass('show-placeholder');
                                                        $('.fr-element').html('<p>Hola prro</p>');
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5" style="padding:0px;">
                                        <div class="row">
                                            <div class="col-md-10 ml-auto" style="padding:0px;">
                                                <p>Imagen:</p>
                                                <div id="renderon" style="border: 1px solid #ccc; width: 100%; height:auto; margin-bottom:10px;">
                                                    <?php
                                                        if($data['imagen']!=""){ echo 'tiene imagen'; }else{ echo 'no tiene imagen'; }
                                                        echo '<img src="'.$url.'/'.$data['imagen'].'" alt="" style="width: 100%;" >';
                                                    ?>
                                                </div>
                                                <div id="render" class="imgpreview" style="display:none;border: 1px solid #ccc; width: 100%; height:10px; margin-bottom:10px;">
                                                </div>
                                                <input id="file" type="file" class="form-control-file edit-img" name="image">
                                                <script>
                                                    document.getElementById("file").onchange = function(e) {
                                                        // Creamos el objeto de la clase FileReader
                                                        let reader = new FileReader();

                                                        // Leemos el archivo subido y se lo pasamos a nuestro fileReader
                                                        reader.readAsDataURL(e.target.files[0]);

                                                        // Le decimos que cuando este listo ejecute el código interno
                                                        reader.onload = function(){
                                                            let preview = document.getElementById('render'),
                                                                    image = document.createElement('img');

                                                            image.src = reader.result;

                                                            preview.innerHTML = '';
                                                            preview.append(image);
                                                        };
                                                        $('#renderon').css('display','none');
                                                        $('.imgpreview').css('display','block');
                                                        $('.imgpreview').css('height','auto');
                                                    }
                                                    
                                                </script>
                                                <style>
                                                    #render img{
                                                        width:100%;
                                                    }
                                                    .note-editable{
                                                        min-height: 150px;
                                                    }
                                                </style>
                                                <p>Presentación:</p>
                                                <?php
                                                    echo '<input autocomplete="off" value="'.$data['presentacion'].'" type="text" id="addnombre" class="form-control" style="margin-bottom:10px;" name="presProd">';
                                                ?>
                                            </div>
                                        </div>
                                        <div class="option-product">
                                            <input type="submit" id="publicar" class="boton-add" value="Guardar" name="btn-save">
                                            <input type="button" id="cancelar" class="boton-add" value="Cancelar">
                                        </div>
                                    </div>
                                </div>
                            </form>
                       </div>
                    </div>
                </div> 
                <div class="footbar"></div>
            </div>
        </div>
    </div>        
