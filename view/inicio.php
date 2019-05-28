<?php

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->get('/','inicio');
$app->get('/admin/','admin');
$app->get('/productos/','productos');
$app->get('/dashboard/','dashboard');
$app->get('/login/','login');

$app->post('/validasesion/','validasesion');

function inicio(){
    include 'modules/head.php';
    include 'modules/inicio.php';
}

function productos(){
    include 'modules/head.php';
    include 'modules/productos.php';
}

function dashboard(){
    include 'modules/head.php';
    include 'modules/dashboard.php';
}

function admin(){
    $url = routes::routebase();
    session_start();
    if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
        $active = array(
            "account"   =>"",
            "history"   =>"not",
            "cart"      =>"not"
        );
      include 'modules/head.php';
      include 'modules/dashboard.php';
      include 'modules/footer.php';
    }else{
      echo '<script type="text/javascript">
                  window.location = "login";
              </script>';
    }
}

function login(){
    /* login no tiene footer modularizado por el diseño */
    include 'modules/head.php';
    include 'modules/login.php';
}

function validasesion(){
    $url = Routesurl::CtrlRoutes();
    $status = loginpage::signin();
    $decode = json_decode($status,true);
    if($decode['status'] =='true'){
        echo 'contraseña correcta';
/*         session_start();
        $_SESSION['LoginStatus']    =   'true';
        $_SESSION['username']       =   $decode['data']['username'];
        $_SESSION['name']           =   $decode['data']['name'];
        $_SESSION['lastname']       =   $decode['data']['lastname'];
        $_SESSION['email']          =   $decode['data']['email'];
        $_SESSION['pais']           =   $decode['data']['pais'];
        $_SESSION['departamento']   =   $decode['data']['departamento'];
        $_SESSION['direccion']      =   $decode['data']['direccion'];
        $_SESSION['telefono']       =   $decode['data']['telefono'];
        $_SESSION['estado']         =   $decode['data']['estado'];
        $_SESSION['rol']            =   $decode['data']['rol'];
        $_SESSION['token']          =   $decode['data']['token'];
        echo 'Validando Cuenta ....';
        echo '<script type="text/javascript">
                setTimeout(function(){
                  window.location = "'.$url.'";
                }, 1000);
              </script>'; */
    }else{
        echo 'contraseña incorrecta';
        /* echo '<script type="text/javascript">
                setTimeout(function(){
                  window.location = "'.$url.'";
                }, 1000);
              </script>'; */
    }
}

$app->run();

?>