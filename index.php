<?php
/* dependences */
require_once "vendor/autoload.php";
require_once "r/upload/upload.php";
/* Controllers */
require_once 'controller/home.controller.php';
require_once 'controller/login.controller.php';
require_once 'controller/productos.controller.php';
require_once 'controller/users.controller.php';
require_once 'controller/pedidos.controller.php';
/* Models */
require_once 'model/home.model.php';
require_once 'model/login.model.php';
require_once 'model/productos.model.php';
require_once 'model/users.model.php';
require_once 'model/pedidos.model.php';
/* route */
require_once 'controller/routes.php';

$home = new HomeController();
$home->inicio();

?>