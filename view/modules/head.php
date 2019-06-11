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
    ?>
    
    <link href="https://cdn.jsdelivr.net/npm/froala-editor@3.0.0-rc.2/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@3.0.0-rc.2/js/froala_editor.pkgd.min.js"></script>

</head>
