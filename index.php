<?php
/* dependences */
require_once "vendor/autoload.php";
/* Controllers */
require_once 'controller/home.controller.php';
require_once 'controller/login.controller.php';
/* Models */
require_once 'model/home.model.php';
require_once 'model/login.model.php';
/* route */
require_once 'controller/routes.php';

$home = new HomeController();
$home->inicio();

?>