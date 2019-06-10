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
    public static function deleteUsermdl($id){
        try {
            $db         =   getDB();
            $sql        =  "DELETE FROM usuarios WHERE idusuarios='".$id."' ";
            $stmt       =   $db->prepare($sql);
            $stmt->execute();
        } catch (PDOException $e) {
            $data = '[ { "error":"'.$e.'"}]';
        }
        return $id;
    }

    public static function newUsermdl($data){
        
        $nombres     =   $data['nombre'];
        $apellidos   =   $data['apellido'];
        $tipo        =   $data['tipo'];
        $correo      =   $data['correo'];
        $password    =   $data['password'];
        $documento   =   $data['documento'];
        $telefono    =   $data['telefono'];
        $premium     =   $data['premium'];
        $estado      =   '1';
        try {
            $email_check        =   preg_match('~^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.([a-zA-Z]{2,4})$~i', $correo);
            $password_check     =   preg_match('~^[A-Za-z0-9!@#$%^&*()_]{6,20}$~i', $password);
            if (strlen(trim($password))>0 && strlen(trim($correo))>0 && $email_check>0 && $password_check>0)
            {
                $db         =   getDB();
                $userData   =   '';
                $sql        =   "SELECT idusuarios FROM usuarios WHERE correo=:correo";
                $stmt       =   $db->prepare($sql);
                $stmt->bindParam("correo", $correo,PDO::PARAM_STR);
                $stmt->execute();
                $mainCount=$stmt->rowCount();
                $created=time();
                /**si el usuario no existe, se crea uno */
                if($mainCount==0)
                {
                    /**se inserta el nuevo usuario */
                    $sql1       =   "INSERT INTO usuarios(nombres, apellidos, tipo, correo, password, documento, telefono, premium, estado) 
                                                  VALUES (:nombres, :apellidos, :tipo, :correo, :password, :documento, :telefono, :premium, :estado)";
                    $stmt1      =   $db->prepare($sql1);
                    $stmt1->bindParam("nombres", $nombres,PDO::PARAM_STR);
                    $stmt1->bindParam("apellidos", $apellidos,PDO::PARAM_STR);
                    $stmt1->bindParam("tipo", $tipo,PDO::PARAM_STR);
                    $stmt1->bindParam("correo", $correo,PDO::PARAM_STR);
                    $password   =   hash('sha256',$password);
                    $stmt1->bindParam("password", $password,PDO::PARAM_STR);
                    $stmt1->bindParam("documento", $documento,PDO::PARAM_STR);
                    $stmt1->bindParam("telefono", $telefono,PDO::PARAM_STR);
                    $stmt1->bindParam("premium", $premium,PDO::PARAM_STR);
                    $stmt1->bindParam("estado", $estado,PDO::PARAM_STR);
                    $stmt1->execute();                
                    $userData   =   internalUserDetails($correo);
                }
                /**se cierra la conexion */
                $db = null;
                if($userData){
                   $userData = json_encode($userData);
                    echo '{"status":"true","data": ' .$userData. '}';
                } else {
                    echo '{"status":"false","data":"Ingresar datos validos"}';
                }  
            }
            else{
                echo '{"status":"false","data":"Hey! Llena correctamente todos los espacios datos ;)"}';
            }
        }
        catch(PDOException $e) {
            echo '{"status":"false","data":'. $e->getMessage() .'}';
        }
    }

    function internalUserDetails($input) {
    
        try {
            $db = getDB();
            $sql = "SELECT idusuarios, nombres, apellidos, tipo, correo, documento, telefono, premium FROM usuarios WHERE correo=:input";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("input", $input,PDO::PARAM_STR);
            $stmt->execute();
            $usernameDetails = $stmt->fetch(PDO::FETCH_OBJ);
            $usernameDetails->token = apiToken($usernameDetails->user_id);
            $db = null;
            return $usernameDetails;
            
        } catch(PDOException $e) {
            echo '{"status":"false","data":'. $e->getMessage() .'}';
        }
        
    }
}

?>