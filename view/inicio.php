<?php

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->get('/','inicio');
$app->get('/admin/','admin');
$app->get('/app/','app');
$app->get('/notification/','notification');
$app->get('/productos/','productos');
$app->get('/users/','users');
$app->get('/support/','support');
$app->get('/login/','login');
$app->get('/logout/','logout');

$app->post('/validasesion/','validasesion');
$app->post('/updateuser/','updateuser');


function inicio(){
    include 'modules/head.php';
    include 'modules/inicio.php';
}

function app(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/productos.php';
    include 'modules/footer.php';
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

function notification(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/productos.php';
    include 'modules/footer.php';
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

function productos(){
    session_start();
    if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
      include 'modules/head.php';
      include 'modules/productos.php';
      include 'modules/footer.php';
    }else{
      echo '<script type="text/javascript">
                  window.location = "login";
              </script>';
    }
}

function users(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/users.php';
    include 'modules/footer.php';
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

function support(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/users.php';
    include 'modules/footer.php';
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

function admin(){
    $url = routes::routebase();
    session_start();
    if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
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
function logout(){
  $url = routes::routebase();
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    session_destroy();
    echo 'Cerrando Cuenta ....';
    echo '<script type="text/javascript">
            setTimeout(function(){
                window.location = "'.$url.'/login";
            }, 1000);
            </script>';
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

/* POST */

function validasesion(){
    $url2 = routes::routebase();
    $status = loginpage::signin();
    $decode = json_decode($status,true);

    if($decode['status'] =='true'){
        session_start();
        $_SESSION['LoginStatus']    =   'true';
        $_SESSION['nombres']       =   $decode['data']['nombres'];
        $_SESSION['apellidos']       =   $decode['data']['apellidos'];
        $_SESSION['tipo']       =   $decode['data']['tipo'];
        $_SESSION['correo']       =   $decode['data']['correo'];
        $_SESSION['documento']       =   $decode['data']['documento'];
        $_SESSION['telefono']       =   $decode['data']['telefono'];
        $_SESSION['premium']       =   $decode['data']['premium'];
        $_SESSION['token']       =   $decode['data']['token'];
        echo 'Validando Cuenta ....';
        echo '<script type="text/javascript">
                setTimeout(function(){
                  window.location = "'.$url2.'/admin";
                }, 1000);
              </script>';
    }else{
        echo 'incorrecto';
        /* echo '<script type="text/javascript">
                setTimeout(function(){
                  window.location = "'.$url.'";
                }, 1000);
              </script>'; */
    }
}

function updateuser(){
  $request    =    \Slim\Slim::getInstance()->request();
  $data       =    json_decode($request->getBody());
  $data       =    array(
                        "id" => $data->id,
                        "nombre"=> $data->nombre,
                        "apellido"=> $data->apellido,
                        "tipo"=> $data->tipo,
                        "correo"=> $data->correo,
                        "documento"=> $data->documento,
                        "telefono"=> $data->telefono,
                        "premium"=> $data->premium
                      );
  $updateUser =   usersController::updateUsers($data);

  echo $updateUser;

}


$app->run();

?>