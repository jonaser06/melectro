<?php

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->get('/','inicio');
$app->get('/productos/','productos');
$app->get('/dashboard/','dashboard');

function inicio(){
    include 'modules/head.php';
    include 'modules/login.php';
}

function productos(){
    include 'modules/head.php';
    include 'modules/productos.php';
}

function dashboard(){
    include 'modules/head.php';
    include 'modules/dashboard.php';
}

$app->run();

?>