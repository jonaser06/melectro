<?php
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

        public static function addProductmdl($data){
            try{
                $db         =   getDB();
                $sql = "INSERT INTO productos 
                        (idproducto, codigo, nombre, descripcion, imagen, um, presentacion, precio, moneda, igv) 
                        VALUES
                        (NULL, '".$data['codigo']."','".$data['nombre']."','".$data['descripcion']."','".$data['imagen']."','".$data['um']."','".$data['prest']."','".$data['precio']."','MN','NO')";
                $stmt = $db->prepare($sql);
                $stmt->execute();
                $db = null;
                
            }catch (PDOException $e){
                echo $e;
            }
        }

    }
?>