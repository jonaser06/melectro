<?php
header("Access-Control-Allow-Origin: *");
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


/**GET */
$app->get('/productos/all/','productos');

function productos(){
    try {
        $db         =   getDB();
        $sql        =   "SELECT * FROM productos LIMIT 20";
        $stmt       =   $db->prepare($sql);
        $stmt->execute();
        $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
        echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
    } catch (PDOException $e) {
        echo '[ { "error":"'.$e.'"}]';
    }
}


/**test de prueba para SlimFramework */
$app->get("/saludo/:name",function ($name){
    echo "Hola ".$name;
});

/**Ejecucion de la api */
$app->run();
?>