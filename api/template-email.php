<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Compra realizada</title>
    </head>
    <style>
        body{
            width: 100%;
        }
        .bodymail{
            width: 50%;        
            margin: auto;
            height: 60px;
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
            line-height: 60px;
        }
        .headermail{
            width: 80%;
            background: #ccc;
            margin: auto;
        }
        .logo{
            position: absolute;
            z-index: 9;
            left: 50%;
            transform: translate(-50%, -15%);
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: rgb(238, 238, 238);
        }
        .fondomail{
            position: relative;
            width: 100%;
            height: 100px;
            background: rgb(0, 110, 212);
            margin-top: 50px;
        }
        .contentmail{
            position: relative;
            width: 100%;
            
        }
        .titledecompra{
            position: absolute;
            width: 80%;
            height: 50px;
            bottom: 0px;
            background: #fff;
            left: 50%;
            transform: translate(-50%, 0);
            border-radius: 20px 20px 0px 0px;
            line-height: 50px;
            border: 1px solid #666;
            border-bottom: 0px;
        }
        .detailcompra{
            position: relative;
            width: 80%;
            
            background: #fff;
            border-left: 1px solid #666;
            border-right: 1px solid #666;
            left: 50%;
            transform: translate(-50%, 0);
        }
        .product, .price{
            width: 50%;
            height: 50px;
        }
        .product{
            float: left;
        }
        .price{
            float: right;
        }
        hr{
            width: 85%;
            border-color: rgb(221, 221, 221);
            margin: 0px;
            margin: auto;
        }
    </style>
    <body>
        <div class="bodymail">
            <div class="headermail">
                <div class="titlemail">
                    Hola <?php echo $nombre.' '.$apellido; ?>
                </div>
                <div class="logo">
        
                </div>
            </div>
            <div class="fondomail">
                <div class="titledecompra">
                    <h3 style="margin:0px;margin-top:8px;">Gracias por su pago a Mega Electro Industrial</h3>
                </div>
            </div>
            <div class="contentmail">
                <div class="detailcompra">
                    <hr>
                    Podra ver el estado de su pedido en la aplicacion en la seccion de historial de compras
                    <!-- <div class="product">
                        aa
                    </div>
                    <div class="price">
                        aaa
                    </div> -->
                </div>
            </div>
        </div>    
    </body>
</html>