<?php

function uploadImage($image, $name){
    $target = "r/upload/".basename($name);
    if (move_uploaded_file($image, $target)) {
        $msg = "Producto subido correctamente";
        return $msg;
    }else{
        $msg = "Ocurrio un error intentando subir la imagen!";
        return $msg;
    }
}

?>