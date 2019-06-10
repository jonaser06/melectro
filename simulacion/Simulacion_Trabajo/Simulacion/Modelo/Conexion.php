<?php
/**
 * Created by PhpStorm.
 * User: Jorge Rejas
 * Date: 28/02/2018
 * Time: 23:58
 */

Class Conexion
{

    public static function conexio()
    {
        try {
            $conecta = new PDO("mysql:host=localhost;dbname=algoritmo", "root", "");
            $conecta->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $conecta->exec("SET CHARACTER set utf8");

        } catch (Exception $e) {
            echo $e->getMessage();
            die($e->getLine());

        }
        return $conecta;
    }
}

?>