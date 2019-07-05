<?php
    class pedidosModel{

        public static function ListarPedidosmdl(){
            try {
                $db         =   getDB();
                $sql        =   "SELECT detalles.iddetalles, estado_pedido.nombre_estado, productos.nombre ,usuarios.nombres, usuarios.apellidos, usuarios.telefono, usuarios.correo, detalles.metodoPago, detalles.envio, detalles.precio, ventas.fecha
                                FROM detalles
                                INNER JOIN productos
                                ON detalles.idproducto = productos.idproducto 
                                INNER JOIN ventas
                                ON detalles.idventas = ventas.idventas
                                INNER JOIN usuarios
                                ON ventas.idusuarios = usuarios.idusuarios
                                INNER JOIN estado_pedido
                                ON detalles.idestado_pedido = estado_pedido.idestado_pedido";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
                $data = json_encode($resultado, JSON_UNESCAPED_UNICODE);
                $db = null;
            } catch (PDOException $e) {
                $data = '[ { "error":"'.$e.'"}]';
            }
            return $data;
            
        }

        public static function PedidoIdmdl($id){
            try {
                $db         =   getDB();
                $sql        =   "SELECT 
                                detalles.iddetalles, 
                                estado_pedido.nombre_estado, 
                                productos.nombre, 
                                usuarios.nombres, 
                                usuarios.apellidos, 
                                usuarios.telefono, 
                                usuarios.correo, 
                                usuarios.documento, 
                                usuarios.premium, 
                                detalles.metodoPago, 
                                detalles.envio, 
                                detalles.precio, 
                                ventas.fecha
                                FROM detalles
                                INNER JOIN productos
                                ON detalles.idproducto = productos.idproducto 
                                INNER JOIN ventas
                                ON detalles.idventas = ventas.idventas
                                INNER JOIN usuarios
                                ON ventas.idusuarios = usuarios.idusuarios
                                INNER JOIN estado_pedido
                                ON detalles.idestado_pedido = estado_pedido.idestado_pedido
                                WHERE detalles.iddetalles='".$id."' ";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
                $data = json_encode($resultado, JSON_UNESCAPED_UNICODE);
                $db = null;
            } catch (PDOException $e) {
                $data = '[ { "error":"'.$e.'"}]';
            }
            return $data;
            
        }

        public static function EstadoUpdatePedidomdl($input){
            try {
                $db         =   getDB();
                /* primera consulta */
                $sql        =   "UPDATE ventas SET fecha='".$input['fecha']."' ";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                /* segunda consulta */
                $sql        =   "UPDATE detalles SET idestado_pedido='".$input['estado']."', metodoPago='".$input['metodo']."', envio='".$input['envio']."' WHERE iddetalles= '".$input['iddetalles']."'  ";
                $stmt       =   $db->prepare($sql);
                $stmt->execute();
                $db = null;
                $data = '{"status":"true","message":"Pedido actualizado"}';
            } catch (PDOException $e) {
                $data = '{"status":"true","message":"'.$e.'"}';
            }
            return $data;

        }

    }

?>