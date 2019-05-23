<?php
/* Controllers */
require_once 'controller/home.controller.php';
/* Models */
require_once 'model/home.model.php';

$home = new HomeController();
$home->inicio();

?>