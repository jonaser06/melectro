<?php
    class Mproducts{

        public static function productsModel(){
            try {
                $db         =   getDB();
                $sql        =   "SELECT * FROM productos LIMIT 20";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
                $data = json_encode($resultado, JSON_UNESCAPED_UNICODE);
            } catch (PDOException $e) {
                $data = '[ { "error":"'.$e.'"}]';
            }
            return $data;
        }
        public static function ProductByIDmdl($id){
            try {
                $db         =   getDB();
                $sql        =   "SELECT * FROM productos WHERE idproducto = '".$id."'";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $resultado  =   $stmt->fetch(PDO::FETCH_OBJ);
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
                        (NULL, '".$data['codigo']."','".$data['nombre']."','".$data['descripcion']."','r/upload/".$data['imagen']."','".$data['um']."','".$data['prest']."','".$data['precio']."','MN','NO')";
                $stmt = $db->prepare($sql);
                $stmt->execute();
                $db = null;
                
            }catch (PDOException $e){
                echo $e;
            }
        }

        public static function updateProductmdl($data){
            try{
                $db         =   getDB();
                $sql        =  "UPDATE productos
                                SET
                                codigo = '".$data['codigo']."',
                                nombre = '".$data['nombre']."',
                                descripcion = '".$data['descripcion']."',
                                imagen = 'r/upload/".$data['imagen']."',
                                um = '".$data['um']."',
                                presentacion = '".$data['prest']."',
                                precio = '".$data['precio']."'                             
                                WHERE idproducto='".$data['id']."' ";
                $stmt = $db->prepare($sql);
                $stmt->execute();
                $db = null;
                
            }catch (PDOException $e){
                echo $e;
            }
            return $data;
        }

        public static function deleteProductmdl($id){
            try {
                $db         =   getDB();
                $sql        =  "DELETE FROM productos WHERE idproducto='".$id."' ";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $db = null;
            } catch (PDOException $e) {
                $data = '[ { "error":"'.$e.'"}]';
            }
            return $id;
        }

    }
?>