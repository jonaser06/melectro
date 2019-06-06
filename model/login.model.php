<?php
require_once 'conexion.php';
class loginpagemdl{
    public static function signinmdl($data){
        $data = json_decode($data,true);
        try {
            $db         =   getDB();
            $userData   =   '';
            $sql        =   "SELECT idusuarios, nombres, apellidos, tipo, correo, documento, telefono, premium FROM usuarios WHERE correo=:correo and password=:password";
            $stmt       =   $db->prepare($sql);
            $stmt->bindParam("correo", $data['correo'], PDO::PARAM_STR);
            $password   =   hash('sha256',$data['password']);
            $stmt->bindParam("password", $password, PDO::PARAM_STR);
            $stmt->execute();
            $mainCount  =   $stmt->rowCount();
            $userData   =   $stmt->fetch(PDO::FETCH_OBJ);
            
            if(!empty($userData))
            {
                $user_id            =   $userData->user_id;
                $userData->token    =   apiToken($user_id);
            }
            
            $db = null;
             if($userData){
                   $userData        =   json_encode($userData);
                   $result = '{"status":"true","data": ' .$userData . '}';
                } else {
                    $result = '{"status":"false","data":"usuario y/o contraseña incorrecta, vuelva a intentarlo"}';
                }
               
        }
        catch(PDOException $e) {
            echo '{"status":"false","data":'. $e->getMessage() .'}';
        }
        return $result;
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