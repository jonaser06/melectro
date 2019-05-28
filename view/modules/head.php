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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- rutas de estilos -->
    <?php
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/font-awesome.min.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/style.css">';
        echo '<link rel="stylesheet" href="'.$url.'/r/desktop/css/products.css">';
    ?>
    
</head>
