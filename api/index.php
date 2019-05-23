<?php
/**
 * Proyecto : Api para melectro
 * Autor    : Jonathan Sergio Narvaez Cuenca
 * Licencia : MIT License
 */

/**archivos externos de conexion y el composer */
require_once 'config.php';
require_once '../vendor/autoload.php';

/**instanciamiento */
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

/**encabezados de funciones */
/**POST */
$app->post('/login','login');

/**GET */
$app->get('/paypal/mode/','paypal');





function paypal(){
    try {
        $db         =   getDB();
        $sql        =   "SELECT * FROM paypal";
        $stmt       =   $db->prepare($sql);
        $stmt->execute();
        $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
        echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
    } catch (PDOException $e) {
        echo '[ { "error":"'.$e.'"}]';
    }
}


function login() {
    
    $request    =    \Slim\Slim::getInstance()->request();
    $data       =    json_decode($request->getBody());
    
    try {
        
        $db         =   getDB();
        $userData   =   '';
        $sql        =   "SELECT user_id, username, name, lastname, email, pais, departamento, direccion, telefono, estado, rol FROM users WHERE (username=:username or email=:username) and password=:password ";
        $stmt       =   $db->prepare($sql);
        $stmt->bindParam("username", $data->username, PDO::PARAM_STR);
        $password   =   hash('sha256',$data->password);
        $stmt->bindParam("password", $password, PDO::PARAM_STR);
        $stmt->execute();
        $mainCount  =   $stmt->rowCount();
        $userData   =   $stmt->fetch(PDO::FETCH_OBJ);
        
        if(!empty($userData))
        {
            $user_id            =   $userData->user_id;
            $userData->token    =   apiToken($user_id);
        }
        
        $db = null;
         if($userData){
               $userData        =   json_encode($userData);
                echo '{"status":"true","data": ' .$userData . '}';
            } else {
               echo '{"status":"false","data":"usuario y/o contraseña incorrecta, vuelva a intentarlo"}';
            }

           
    }
    catch(PDOException $e) {
        echo '{"status":"false","data":'. $e->getMessage() .'}';
    }
}

/**test de prueba para SlimFramework */
$app->get("/saludo/:name",function ($name){
    echo "Hola ".$name;
});

/**Ejecucion de la api */
$app->run();
?>