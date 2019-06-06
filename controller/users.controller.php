<?php
class usersController{
    public static function listUsers(){
        $data = usersModel::listUsersmdl();
        return $data;
    }
}

?>