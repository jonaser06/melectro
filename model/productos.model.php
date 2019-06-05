<?php
    require_once 'conexion.php';
    class Mproducts{

        public static function productsModel(){
            try {
                $db         =   getDB();
                $sql        =   "SELECT * FROM productos ORDER BY RAND() LIMIT 20";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
                $data = json_encode($resultado, JSON_UNESCAPED_UNICODE);
            } catch (PDOException $e) {
                $data = '[ { "error":"'.$e.'"}]';
            }
            return $data;
        }

    }
?>