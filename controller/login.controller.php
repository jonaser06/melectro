<?php

class loginpage {
    public static function signin(){
        if(isset($_POST['correo']) && isset($_POST['password'])){
            $login = '{"correo":"'.$_POST['username'].'","password":"'.$_POST['password'].'"}';
            $status = loginpagemdl::signinmdl($login);
            return $status;
        }
    }
}

?>