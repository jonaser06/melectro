<?php
class usersModel{
    public static function listUsersmdl(){
        try {
            $db         =   getDB();
            $sql        =   "SELECT usuarios.idusuarios, usuarios.nombres, usuarios.apellidos, privilegios.tipo, usuarios.correo, usuarios.documento, usuarios.telefono, usuarios.premium, usuarios.estado
                            FROM usuarios INNER JOIN privilegios ON usuarios.tipo = privilegios.idprivilegios";
            $stmt       =   $db->prepare($sql);
            $stmt->execute();
            $resultado  =   $stmt->fetchAll(PDO::FETCH_OBJ);
            $data = json_encode($resultado, JSON_UNESCAPED_UNICODE);
        } catch (PDOException $e) {
            $data = '[ { "error":"'.$e.'"}]';
        }
        return $data;
    }
    public static function UpdateUsermdl($data){
        
        if($data['premium']=='0'){
            $premium = 'no';
        }
        if($data['premium']=='1'){
            $premium = 'si';
        }

        try {
            $db         =   getDB();
            $sql        =  "UPDATE usuarios
                            SET
                            nombres = '".$data['nombre']."',
                            apellidos = '".$data['apellido']."',
                            tipo = '".$data['tipo']."',
                            correo = '".$data['correo']."',
                            documento = '".$data['documento']."',
                            telefono = '".$data['telefono']."',
                            premium = '".$premium."'                             
                            WHERE idusuarios='".$data['id']."' ";
            $stmt       =   $db->prepare($sql);
            $stmt->execute();
        } catch (PDOException $e) {

            $data = '[ { "error":"'.$e.'"}]';
        }
        return var_dump($data);
    }
}

?>