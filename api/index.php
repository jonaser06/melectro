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
$app->post('/signup','signup');
$app->post('/comprar','comprar');

/**GET */
$app->get('/productos/all/','productos');
$app->get('/productos/:id','productosid');
$app->get('/historial/:id','historial');


function historial($id){
    try {
        $db         =   getDB();
        $userData   =   '';
        $sql        =   "SELECT
                        productos.nombre, productos.precio, detalles.cantidad, productos.imagen
                        FROM detalles
                        INNER JOIN ventas
                        ON detalles.idventas = ventas.idventas
                        INNER JOIN productos
                        ON detalles.idproducto = productos.idproducto
                        INNER JOIN usuarios
                        ON ventas.idusuarios = usuarios.idusuarios
                        WHERE usuarios.idusuarios = '".$id."' ";
        $stmt       =   $db->prepare($sql);
        $stmt->execute();
        $mainCount  =   $stmt->rowCount();
        $userData   =   $stmt->fetchAll(PDO::FETCH_OBJ);

        echo json_encode($userData);

    } catch (PDOException $e) {
        echo '{"status":"false","data":'. $e->getMessage() .'}';
    }
    
}
/* nueva compra */
function comprar(){
    $request    =   \Slim\Slim::getInstance()->request();
    $data       =    json_decode($request->getBody());
    
    try {
        /* 1ra consulta */
        /* Insertando el id de usuario */
        $db      =  getDB();
        $sql     =  "INSERT INTO ventas
                    (idventas, idusuarios, fecha)
                    VALUES 
                    (NULL,'".$data->idusuario."', NOW())";
        $stmt    = $db->prepare($sql);
        $stmt->execute();

        /* 2da consulta */
        /* devolviendo el ultimo id insertado en la tabla */
        $sql2 = "SELECT idventas FROM ventas ORDER BY idventas DESC LIMIT 1";
        $stmt = $db->prepare($sql2);
        $stmt->execute();
        $resultado  =   $stmt->fetch(PDO::FETCH_OBJ);
        $id   = $resultado->idventas;

        foreach ($data->detalle as $key => $value) {
            /* 3ra consulta */
            /* insertando a detalle */

            $db      =  getDB();
            $sql3     =  "INSERT INTO detalles
                        (iddetalles, idventas, idproducto, cantidad)
                        VALUES 
                        (NULL,'".$id."', '".$value->idproducto."', '".$value->cantidad."')";
            $stmt    = $db->prepare($sql3);
            $stmt->execute();
        }
        /* envio de email */
        $sql4 = "SELECT * FROM usuarios WHERE idusuarios ='".$data->idusuario."' ";
        $stmt = $db->prepare($sql4);
        $stmt->execute();
        $resultado  =   $stmt->fetch(PDO::FETCH_OBJ);

        $nombre   = $resultado->nombres;
        $apellido = $resultado->apellidos;

        $para   = $resultado->correo;
        $titulo = 'Confirmacion de Pedido';
        ob_start();
        include "template-email.php";
        $mensaje = ob_get_contents();
        ob_end_clean();

        $cabeceras  = 'MIME-Version: 1.0' . "\r\n";
        $cabeceras .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";   
        $cabeceras .= 'From: Recordatorio <mail@servidormail.com>' . "\r\n";    
        $bolEnviar=mail($para, $titulo, $mensaje, $cabeceras);


        echo '{"status":"success","message":"Compra exitosa!","data":"Mensaje enviado"}';

    } catch (PDOException $e) {
        echo '{"status":"false","data":'. $e->getMessage() .'}';
    }

}


/* Funciones definidas */
function signup() {
    $request    =   \Slim\Slim::getInstance()->request();
    $data       =    json_decode($request->getBody());

    $nombres     =   $data->nombres;
    $apellidos   =   $data->apellidos;
    $tipo        =   $data->tipo;
    $correo      =   $data->correo;
    $password    =   $data->password;
    $documento   =   $data->documento;
    $telefono    =   $data->telefono;
    $premium     =   $data->premium;
    $estado      =   $data->estado;
    
    try {
        
        $email_check        =   preg_match('~^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.([a-zA-Z]{2,4})$~i', $correo);
        $password_check     =   preg_match('~^[A-Za-z0-9!@#$%^&*()_]{6,20}$~i', $password);
        if (strlen(trim($password))>0 && strlen(trim($correo))>0 && $email_check>0 && $password_check>0)
        {
            $db         =   getDB();
            $userData   =   '';
            $sql        =   "SELECT idusuarios FROM usuarios WHERE correo=:correo";
            $stmt       =   $db->prepare($sql);
            $stmt->bindParam("correo", $correo,PDO::PARAM_STR);
            $stmt->execute();
            $mainCount=$stmt->rowCount();
            $created=time();
            /**si el usuario no existe, se crea uno */
            if($mainCount==0)
            {
                /**se inserta el nuevo usuario */
                $sql1       =   "INSERT INTO usuarios(nombres, apellidos, tipo, correo, password, documento, telefono, premium, estado) 
                                              VALUES (:nombres, :apellidos, :tipo, :correo, :password, :documento, :telefono, :premium, :estado)";
                $stmt1      =   $db->prepare($sql1);
                $stmt1->bindParam("nombres", $nombres,PDO::PARAM_STR);
                $stmt1->bindParam("apellidos", $apellidos,PDO::PARAM_STR);
                $stmt1->bindParam("tipo", $tipo,PDO::PARAM_STR);
                $stmt1->bindParam("correo", $correo,PDO::PARAM_STR);
                $password   =   hash('sha256',$data->password);
                $stmt1->bindParam("password", $password,PDO::PARAM_STR);
                $stmt1->bindParam("documento", $documento,PDO::PARAM_STR);
                $stmt1->bindParam("telefono", $telefono,PDO::PARAM_STR);
                $stmt1->bindParam("premium", $premium,PDO::PARAM_STR);
                $stmt1->bindParam("estado", $estado,PDO::PARAM_STR);
                $stmt1->execute();                
                $userData   =   internalUserDetails($correo);
            }
            /**se cierra la conexion */
            $db = null;
            if($userData){
               $userData = json_encode($userData);
                echo '{"status":"true","data": ' .$userData. '}';
            } else {
                echo '{"status":"false","data":"Ingresar datos validos"}';
            }  
        }
        else{
            echo '{"status":"false","data":"Hey! Llena correctamente todos los espacios datos ;)"}';
        }
    }
    catch(PDOException $e) {
        echo '{"status":"false","data":'. $e->getMessage() .'}';
    }
}

function login() {
    
    $request    =    \Slim\Slim::getInstance()->request();
    $data       =    json_decode($request->getBody());
    
    try {
        
        $db         =   getDB();
        $userData   =   '';
        $sql        =   "SELECT idusuarios, nombres, apellidos, tipo, correo, documento, telefono, premium FROM usuarios WHERE correo=:correo and password=:password";
        $stmt       =   $db->prepare($sql);
        $stmt->bindParam("correo", $data->correo, PDO::PARAM_STR);
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

function productos(){
    try {
        $db         =   getDB();
        $sql        =   "SELECT * FROM productos WHERE imagen != '' ORDER BY RAND() LIMIT 20";
        $stmt       =   $db->prepare($sql);
        $stmt->execute();
        $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
        
        echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
    } catch (PDOException $e) {
        echo '[ { "error":"'.$e.'"}]';
    }
}

function productosid($id){
    try {
        $db         =   getDB();
        $sql        =   "SELECT * FROM productos WHERE idproducto = '".$id."'";
        $stmt       =   $db->prepare($sql);
        $stmt->execute();
        $resultado  =   $stmt->fetch(PDO::FETCH_OBJ);
        header('Content-Type: application/json');
        print_r(json_encode($resultado,JSON_UNESCAPED_UNICODE));
    } catch (PDOException $e) {
        echo '[ { "error":"'.$e.'"}]';
    }
}

function internalUserDetails($input) {
    
    try {
        $db = getDB();
        $sql = "SELECT idusuarios, nombres, apellidos, tipo, correo, documento, telefono, premium FROM usuarios WHERE correo=:input";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("input", $input,PDO::PARAM_STR);
        $stmt->execute();
        $usernameDetails = $stmt->fetch(PDO::FETCH_OBJ);
        $usernameDetails->token = apiToken($usernameDetails->user_id);
        $db = null;
        return $usernameDetails;
        
    } catch(PDOException $e) {
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