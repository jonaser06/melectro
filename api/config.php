<?php

//ob_start("ob_gzhandler");
error_reporting(0);
session_start();

/* DATABASE CONFIGURACIÓN */
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'admin');
//define('DB_USERNAME', 'global72_root');
define('DB_PASSWORD', '2019cloud$');
//define('DB_PASSWORD', 'O.ZHl^JD]lE.');
define('DB_DATABASE', 'melectro');
//define('DB_DATABASE', 'global72_gt');

function getDB(){
	$dbhost=DB_SERVER;
	$dbuser=DB_USERNAME;
	$dbpass=DB_PASSWORD;
	$dbname=DB_DATABASE;
	$dbConnection = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbConnection->exec("set names utf8");
	$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $dbConnection;
}
/* DATABASE CONFIGURACIÓN END */

/* API key encryption */
function apiToken($session_uid) {
    $key=md5(SITE_KEY.$session_uid);
    return hash('sha256', $key);
}



?>