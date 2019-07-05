<?php

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->get('/','inicio');
$app->get('/admin/','admin');
$app->get('/truck/','truck');
$app->get('/detallePedido/:id','detallePedido');
$app->get('/chart/','chart');
$app->get('/productos/','productos');
$app->get('/productos/add/','addproductos');
$app->get('/productos/edit/:id','editproductos');
$app->get('/users/','users');
$app->get('/busqueda','busqueda');
$app->get('/search_user','searchuser');
$app->get('/support/','support');
$app->get('/login/','login');
$app->get('/logout/','logout');

$app->post('/validasesion/','validasesion');
$app->post('/updateuser/','updateuser');
$app->post('/deleteUser/','deleteUser');
$app->post('/deleteProducto/','deleteProducto');
$app->post('/newUser/','newUser');
$app->post('/newUpload/','newUpload');
$app->post('/updateProduct/','updateProduct');
$app->post('/pedidoUpdate/','pedidoUpdate');


function pedidoUpdate(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){

    $data = array(
              "iddetalles"=>$_POST['iddetalles'],
              "fecha"=>$_POST['fecha'],
              "estado"=>$_POST['estado'],
              "metodo"=>$_POST['metodoPago'],
              "envio"=>$_POST['envio']
            );
    $update = pedidosController::EstadoUpdatePedido($data);
    $json = json_decode($update,true);
    if($json["status"]=='true'){
      echo '<script type="text/javascript">
            window.location = "truck?status=true&message='.$json["message"].'";
          </script>';
    }else{
      echo '<script type="text/javascript">
            window.location = "truck?status=true&message=ocurrio un error, verifique los campos";
          </script>';
    }
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }

}

function busqueda(){
  include 'modules/head.php';
  include 'modules/resultado.php';
  include 'modules/footer.php';
}

function searchuser(){
  include 'modules/head.php';
  include 'modules/s_search.php';
  include 'modules/footer.php';
}


function inicio(){
    include 'modules/head.php';
    include 'modules/inicio.php';
}

function truck(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/truck.php';
    include 'modules/footer.php';
    if($_GET['status']=='true'){
      echo '<script>
              toastr.success("'.$_GET['message'].'", "Estado");
            </script>';
    }
    if($_GET['status']=='false'){
      echo '<script>
              toastr.error("'.$_GET['message'].'", "Estado");
            </script>';
    }
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

function detallePedido($id){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/d_pedido.php';
    include 'modules/footer.php';
  }else{
    echo '<script type="text/javascript">
                window.location = "login";
            </script>';
  }
}

function chart(){
  session_start();
  if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
    include 'modules/head.php';
    include 'modules/chart.php';
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
      if($_GET['status']=='true'){
        echo '<script>
                toastr.success("'.$_GET['message'].'", "Estado");
              </script>';
      }
      if($_GET['status']=='false'){
        echo '<script>
                toastr.error("'.$_GET['message'].'", "Estado");
              </script>';
      }
      
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
    $product = products::getProductByID($id);
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
    if(isset($_SESSION['LoginStatus']) && $_SESSION['LoginStatus'] == 'true'){
      echo '<script type="text/javascript">
                window.location = "admin";
            </script>';
    }else{
      include 'modules/head.php';
      include 'modules/login.php';
    }
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

function deleteProducto(){
  $request    =    \Slim\Slim::getInstance()->request();
  $data       =    json_decode($request->getBody());
  $id = $data->id;
  $updateUser =   products::deleteProduct($id);
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

  if(isset($_POST['btn-save'])){

    if($_POST['codeProd'] && $_POST['nameProd'] && $_POST['descripcionProd'] && $_POST['umProd'] && $_POST['precioProd']){
      $codigo = $_POST['codeProd'];
      $nombre = $_POST['nameProd'];
      $descripcion = $_POST['descripcionProd'];
      $um = $_POST['umProd'];
      $precio = $_POST['precioProd'];
      $descuento = $_POST['descuento'];
      $prest = $_POST['presProd'];
      
      $nameImg = $_FILES['image']['name'];

      $data = array(
        "codigo"=>$codigo,
        "nombre"=>$nombre,
        "descripcion"=>$descripcion,
        "imagen"=>$nameImg,
        "um"=>$um,
        "precio"=>$precio,
        "descuento"=>$descuento,
        "prest"=>$prest
      );

      $upload = uploadImage($_FILES['image']['tmp_name'], $nameImg);
      /* mandamos la data para la insersion en la bd */
      $addbd = products::addProduct($data);
      echo '<script type="text/javascript">
            window.location = "productos?pagina=1&status=true&message='.$upload.'";
          </script>';
    }else{
      echo '<script type="text/javascript">
            window.location = "productos?pagina=1&status=false&message=Revice que ha llenado todos los campos";
          </script>';
    }

  }else{
    
  }
}

function updateProduct(){
  
  if(isset($_POST['btn-save'])){

    if($_POST['codeProd'] && $_POST['nameProd'] && $_POST['descripcionProd'] && $_POST['umProd'] && $_POST['precioProd']){
      $id = $_POST['prodId'];
      $codigo = $_POST['codeProd'];
      $nombre = $_POST['nameProd'];
      $descripcion = $_POST['descripcionProd'];
      $um = $_POST['umProd'];
      $precio = $_POST['precioProd'];
      $descuento = $_POST['descuento'];
      $prest = $_POST['presProd'];

      if($_FILES['image']['name']){
        
        $nameImg = $_FILES['image']['name'];

        $data = array(
          "id" => $id,
          "codigo"=>$codigo,
          "nombre"=>$nombre,
          "descripcion"=>$descripcion,
          "imagen"=>$nameImg,
          "um"=>$um,
          "precio"=>$precio,
          "descuento"=>$descuento,
          "prest"=>$prest
        );
  
        $upload = uploadImage($_FILES['image']['tmp_name'], $nameImg);
        /* mandamos la data para la insersion en la bd */
        $addbd = products::updateProductctrl($data);
        echo '<script type="text/javascript">
              window.location = "productos?pagina=1&status=true&message='.$upload.'";
            </script>';
      }else{

        $data = array(
          "id" => $id,
          "codigo"=>$codigo,
          "nombre"=>$nombre,
          "descripcion"=>$descripcion,
          "um"=>$um,
          "precio"=>$precio,
          "descuento"=>$descuento,
          "prest"=>$prest
        );
        /* mandamos la data para la insersion en la bd */
        $addbd = products::updateProductctrl($data);
        echo '<script type="text/javascript">
              window.location = "productos?pagina=1&status=true&message=Actualizado";
            </script>';
      }

      
    }else{
      echo '<script type="text/javascript">
            window.location = "productos?pagina=1&status=false&message=a '.var_dump($data).'";
          </script>';
    }

  }else{
    
  }
}

$app->run();

?>