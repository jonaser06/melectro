<?php
    $url = routes::routebase();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <?php
        $url2 = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $title = ucwords(basename($url2));
        echo '<title>'.$title.' | Mega electro</title>';
    ?>
    <!-- rutas de estilos -->
    <?php
        echo '<script src="'.$url.'/r/desktop/js/jquery.js"></script>';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/bootstrap.css">';
        echo '<script src="'.$url.'/r/desktop/js/bootstrap.min.js"></script>';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/font-awesome.min.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/style.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/products.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/users.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/toast.min.css">';
        echo '<script src="'.$url.'/r/desktop/js/toast.js"></script>';
        echo '<script src="'.$url.'/r/desktop/js/ckeditor.js"></script>';
    ?>
    

</head>
