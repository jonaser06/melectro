<?php
    class Mproducts{

        public static function productsModel($key){
            try {
                $artxpag = 20;
                $db         =   getDB();
                $sql        =   "SELECT * FROM productos LIMIT $key,$artxpag ";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);

                $data = json_encode($resultado, JSON_UNESCAPED_UNICODE);
            } catch (PDOException $e) {
                $data = '[ { "error":"'.$e.'"}]';
            }
            return $data;
        }

        public static function paginationmdl(){
            try {
                $db         =   getDB();
                $sql        =   "SELECT * FROM productos";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
                $total = $stmt->rowCount();
                $artxpag = 20;
                $paginas = ceil($total/$artxpag);

                $data = $paginas;
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
                        (idproducto, codigo, nombre, descripcion, imagen, um, presentacion, precio, descuento, moneda, igv) 
                        VALUES
                        (NULL, '".$data['codigo']."','".$data['nombre']."','".$data['descripcion']."','r/upload/".$data['imagen']."','".$data['um']."','".$data['prest']."','".$data['precio']."','".$data['descuento']."','MN','NO')";
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
                if($data['imagen']!=""){
                    $sql        =  "UPDATE productos
                                    SET
                                    codigo = '".$data['codigo']."',
                                    nombre = '".$data['nombre']."',
                                    descripcion = '".$data['descripcion']."',
                                    imagen = 'r/upload/".$data['imagen']."',
                                    um = '".$data['um']."',
                                    presentacion = '".$data['prest']."',
                                    precio = '".$data['precio']."',                             
                                    descuento = '".$data['descuento']."'
                                    WHERE idproducto='".$data['id']."' ";
                }else{
                    $sql        =  "UPDATE productos
                                    SET
                                    codigo = '".$data['codigo']."',
                                    nombre = '".$data['nombre']."',
                                    descripcion = '".$data['descripcion']."',
                                    um = '".$data['um']."',
                                    presentacion = '".$data['prest']."',
                                    precio = '".$data['precio']."',
                                    descuento = '".$data['descuento']."'                             
                                    WHERE idproducto='".$data['id']."' ";
                }
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

        public static function busquedaproductmdl($data){
            try {
                $db         =   getDB();
                $sql        =   "SELECT * FROM productos WHERE nombre LIKE '%".$data."%' ";
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