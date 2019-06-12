<body>
    <div class="wallpaper">
        <div class="row card-container">
            <div class="col-md-6 ml-auto mr-auto">
                <div class="row">
                    <div class="col-md-6 data-login">
                        <form method="post" action="<?php echo $url; ?>/validasesion">
                            <div class="display-log">
                                <h5>Inicie Sesion</h5>
                                <span class="icon-login fa fa-user"></span><input class="input-login" type="text" placeholder="Correo" name="correo"></br>
                                <span class="icon-login fa fa-lock"></span><input class="input-login" type="password" placeholder="Contraseña" name="password"></br>
                                <input class="submit-boton" type="submit" value="Iniciar Sesión">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6 logo-login" style="position:relative;">
                        <div class="img-container">
                            <?php
                                echo '<img src="'.$url.'/r/desktop/img/logo-mega.png" alt="">';
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>        
</body>
</html>