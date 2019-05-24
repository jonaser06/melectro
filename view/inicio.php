<?php
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

$app->get('/','inicio');

function inicio(){
    include 'modules/login.php';
}

$app->run();

?>