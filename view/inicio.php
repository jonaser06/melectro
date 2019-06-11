<?php

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->get('/','inicio');
$app->get('/admin/','admin');
$app->get('/app/','app');
$app->get('/notification/','notification');
$app->get('/productos/','productos');
$app->get('/productos/add/','addproductos');
$app->get('/productos/edit/:id','editproductos');
$app->get('/users/','users');
$app->get('/support/','support');
$app->get('/login/','login');
$app->get('/logout/','logout');

$app->post('/validasesion/','validasesion');
$app->post('/updateuser/','updateuser');
$app->post('/deleteUser/','deleteUser');
$app->post('/newUser/','newUser');
$app->post('/newUpload/','newUpload');


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

function addproductos(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/addproducto.php';
    include 'modules/footer.php';
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

function editproductos($id){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/editproducto.php';
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

    if($decode['status'] =='true' && ( $decode['data']['tipo']=='3' || $decode['data']['tipo']=='2')){
        session_start();
        $_SESSION['LoginStatus']    =   'true';
        $_SESSION['id']       =   $decode['data']['idusuarios'];
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

function deleteUser(){
  $request    =    \Slim\Slim::getInstance()->request();
  $data       =    json_decode($request->getBody());
  $id = $data->id;
  $updateUser =   usersController::deleteUsers($id);
  echo $updateUser;
}

function newUser(){
  $request    =    \Slim\Slim::getInstance()->request();
  $data       =    json_decode($request->getBody());
  $data       =    array(
                        "nombre"=> $data->nombre,
                        "apellido"=> $data->apellido,
                        "tipo"=> $data->rol,
                        "correo"=> $data->correo,
                        "password"=> $data->password,
                        "documento"=> $data->documento,
                        "telefono"=> $data->telefono,
                        "premium"=> 'no'
                      );

  $newUser =   usersController::newUser($data);
  echo $newUser;
}

function newUpload(){
  $request    =    \Slim\Slim::getInstance()->request();
  $data       =    json_decode($request->getBody());
  echo 'Hola Mundo';
}

$app->run();

?>