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
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/font-awesome.min.css">';
        $array = explode("/",$url2);
        if($array[5] == 'add' || $array[5] == 'edit'){
            echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/bootstrap.3.3.5.min.css">';
            echo '<script src="'.$url.'/r/desktop/js/bootstrap.3.3.5.js"></script>';
        }else{
            echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/bootstrap.css">';
            echo '<script src="'.$url.'/r/desktop/js/bootstrap.min.js"></script>';
        }
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/style.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/products.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/users.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/toast.min.css">';
        echo '<script src="'.$url.'/r/desktop/js/toast.js"></script>';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/summernote.css">';
        echo '<script src="'.$url.'/r/desktop/js/summernote.js"></script>';

    ?>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

</head>
