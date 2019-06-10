<?php
/**
 * Created by PhpStorm.
 * User: Deli Peralta
 * Date: 20/04/2019
 * Time: 13:19
 */

class Alg
{
    public function __construct()
    {
        require_once("Conexion.php");
    }
    public function listar()
    {
        $this->db = Conexion::conexio();
        $consulta = $this->db->prepare("SELECT * FROM tipos");
        $arr = array();
        $consulta->execute(array());
        while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $arr[] = $fila;
        }
        $consulta->closeCursor();
        $this->db = null;
        return $arr;
    }
    public function listardistribucion()
    {
        $this->db = Conexion::conexio();
        $consulta = $this->db->prepare("SELECT * FROM distribucion");
        $arr = array();
        $consulta->execute(array());
        while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $arr[] = $fila;
        }
        $consulta->closeCursor();
        $this->db = null;
        return $arr;
    }
    public function listandovaribles($id){
        $this->db = Conexion::conexio();
        $consulta = $this->db->prepare("SELECT nombre FROM variable WHERE Cod_Var IN (SELECT Cod_Var FROM tipo_variables where Cod_Tip=?)");
        $consulta->execute(array($id));
        /*$arr = array();
        while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
            $arr[] = $fila;
        }*/
        $arr=$consulta->fetchAll();
        $consulta->closeCursor();
        $this->db = null;
        return $arr;
    }

}